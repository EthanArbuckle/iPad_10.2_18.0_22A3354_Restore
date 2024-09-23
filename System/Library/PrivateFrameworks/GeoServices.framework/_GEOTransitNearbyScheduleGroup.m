@implementation _GEOTransitNearbyScheduleGroup

- (_GEOTransitNearbyScheduleGroup)initWithTransitScheduleGroup:(id)a3 departureSequenceContainers:(id)a4 scheduledDepartureSequences:(id)a5 incidentsMap:(id)a6
{
  _QWORD *v11;
  id v12;
  id v13;
  id v14;
  _GEOTransitNearbyScheduleGroup *v15;
  _GEOTransitNearbyScheduleGroup *v16;
  uint64_t v17;
  NSArray *lineCells;
  void *v19;
  uint64_t v20;
  unint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *incidents;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)_GEOTransitNearbyScheduleGroup;
  v15 = -[_GEOTransitNearbyScheduleGroup init](&v27, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_transitScheduleGroup, a3);
    +[_GEOTransitNearbyScheduleGroup lineSectionsForNearbyTransitGroup:departureSequenceContainers:departureSequences:](_GEOTransitNearbyScheduleGroup, "lineSectionsForNearbyTransitGroup:departureSequenceContainers:departureSequences:", v11, v12, v13);
    v17 = objc_claimAutoreleasedReturnValue();
    lineCells = v16->_lineCells;
    v16->_lineCells = (NSArray *)v17;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[GEOPDTransitScheduleGroup _readIncidentIds]((uint64_t)v11);
      v20 = v11[10];
      if (v20)
      {
        for (i = 0; i != v20; ++i)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[GEOPDTransitScheduleGroup incidentIdAtIndex:]((uint64_t)v11, i));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            objc_msgSend(v19, "addObject:", v23);

        }
      }
    }
    v24 = objc_msgSend(v19, "copy");
    incidents = v16->_incidents;
    v16->_incidents = (NSArray *)v24;

  }
  return v16;
}

+ (id)lineSectionsForNearbyTransitGroup:(id)a3 departureSequenceContainers:(id)a4 departureSequences:(id)a5
{
  char *v7;
  id v8;
  id v9;
  unint64_t v10;
  int *v11;
  unint64_t i;
  unsigned int v13;
  _QWORD *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  _GEOTransitNearbyScheduleLine *v20;
  void *v21;
  id v23;
  void *v24;

  v7 = (char *)a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = v8;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
  if (!v7)
    goto LABEL_14;
LABEL_2:
  -[GEOPDTransitScheduleGroup _readDepartureSequenceContainerIndexs]((uint64_t)v7);
  for (i = *(_QWORD *)&v7[v11[539] + 8]; v10 < i; i = 0)
  {
    v13 = -[GEOPDTransitScheduleGroup departureSequenceContainerIndexAtIndex:]((uint64_t)v7, v10);
    if (objc_msgSend(v8, "count") > (unint64_t)v13)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
      v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      if (v14)
      {
LABEL_6:
        -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs]((uint64_t)v14);
        v17 = v14[4];
        goto LABEL_7;
      }
      while (1)
      {
        v17 = 0;
LABEL_7:
        if (v16 >= v17)
          break;
        v18 = -[GEOPDDepartureSequenceContainer departureSequenceIndexAtIndex:]((uint64_t)v14, v16);
        if (v18 < objc_msgSend(v9, "count"))
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v19);

        }
        ++v16;
        if (v14)
          goto LABEL_6;
      }
      v20 = -[_GEOTransitNearbyScheduleLine initWithDepartureSequenceContainer:departureSequences:]([_GEOTransitNearbyScheduleLine alloc], "initWithDepartureSequenceContainer:departureSequences:", v14, v15);
      objc_msgSend(v24, "addObject:", v20);

      v8 = v23;
      v11 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
    }
    ++v10;
    if (v7)
      goto LABEL_2;
LABEL_14:
    ;
  }
  v21 = (void *)objc_msgSend(v24, "copy");

  return v21;
}

- (NSString)displayName
{
  return -[GEOPDTransitScheduleGroup displayName]((id *)&self->_transitScheduleGroup->super.super.isa);
}

- (unint64_t)minWalkingTime
{
  GEOPDTransitScheduleGroup *transitScheduleGroup;

  transitScheduleGroup = self->_transitScheduleGroup;
  if (transitScheduleGroup)
    return transitScheduleGroup->_minWalkingTime;
  else
    return 0;
}

- (unint64_t)maxWalkingTime
{
  GEOPDTransitScheduleGroup *transitScheduleGroup;

  transitScheduleGroup = self->_transitScheduleGroup;
  if (transitScheduleGroup)
    return transitScheduleGroup->_maxWalkingTime;
  else
    return 0;
}

- (unint64_t)minWalkingDistance
{
  GEOPDTransitScheduleGroup *transitScheduleGroup;

  transitScheduleGroup = self->_transitScheduleGroup;
  if (transitScheduleGroup)
    return transitScheduleGroup->_minWalkingDistance;
  else
    return 0;
}

- (unint64_t)maxWalkingDistance
{
  GEOPDTransitScheduleGroup *transitScheduleGroup;

  transitScheduleGroup = self->_transitScheduleGroup;
  if (transitScheduleGroup)
    return transitScheduleGroup->_maxWalkingDistance;
  else
    return 0;
}

- (BOOL)hasWalkingDetails
{
  GEOPDTransitScheduleGroup *transitScheduleGroup;
  $AD7F0884CB9BC500B55353D60B56FA2E flags;
  _BOOL4 v4;

  transitScheduleGroup = self->_transitScheduleGroup;
  if (transitScheduleGroup)
  {
    flags = transitScheduleGroup->_flags;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      LOBYTE(v4) = 1;
    else
      return (*(unsigned int *)&flags >> 3) & 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (NSString)pinnedDisplayName
{
  return -[GEOPDTransitScheduleGroup pinnedDisplayName]((id *)&self->_transitScheduleGroup->super.super.isa);
}

- (int64_t)groupType
{
  uint64_t v2;

  v2 = -[GEOPDTransitScheduleGroup groupType]((uint64_t)self->_transitScheduleGroup) - 1;
  if (v2 < 4)
    return v2 + 1;
  else
    return 0;
}

- (NSArray)lineCells
{
  return self->_lineCells;
}

- (NSArray)incidents
{
  return self->_incidents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_lineCells, 0);
  objc_storeStrong((id *)&self->_transitScheduleGroup, 0);
}

@end
