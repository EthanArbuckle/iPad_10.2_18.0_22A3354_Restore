@implementation _GEOMapItemTransitInfo

- (_GEOMapItemTransitInfo)initWithTransitInfo:(id)a3 schedule:(id)a4 timeZone:(id)a5 incidents:(id)a6 hasTransitIncidentComponent:(BOOL)a7 incidentExpirationDate:(id)a8 providerID:(int)a9 coordinate:(id)a10 transitStops:(id)a11 composedRoute:(id)a12 nearbySchedule:(id)a13
{
  double var1;
  double var0;
  _GEOMapItemTransitInfo *v22;
  _GEOMapItemTransitInfo *v23;
  uint64_t *p_transitInfo;
  uint64_t v25;
  NSArray *transitStops;
  GEOPDTransitInfo *transitInfo;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  _GEOTransitConnectionInfo *v37;
  NSArray *connections;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSString *displayName;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  uint64_t v58;

  var1 = a10.var1;
  var0 = a10.var0;
  v58 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v49 = a4;
  v48 = a5;
  v47 = a6;
  v46 = a8;
  v51 = a11;
  v45 = a12;
  v44 = a13;
  v56.receiver = self;
  v56.super_class = (Class)_GEOMapItemTransitInfo;
  v22 = -[_GEOMapItemTransitInfo init](&v56, sel_init);
  v23 = v22;
  if (v22)
  {
    p_transitInfo = (uint64_t *)&v22->_transitInfo;
    objc_storeStrong((id *)&v22->_transitInfo, a3);
    objc_storeStrong((id *)&v23->_transitSchedule, a4);
    objc_storeStrong((id *)&v23->_timeZone, a5);
    objc_storeStrong((id *)&v23->_incidents, a6);
    objc_storeStrong((id *)&v23->_incidentExpirationDate, a8);
    v23->_hasTransitIncidentComponent = a7;
    v23->_coordinate.latitude = var0;
    v23->_coordinate.longitude = var1;
    v25 = objc_msgSend(v51, "copy");
    transitStops = v23->_transitStops;
    v23->_transitStops = (NSArray *)v25;

    objc_storeStrong((id *)&v23->_composedRoute, a12);
    objc_storeStrong((id *)&v23->_unprocessedNearbySchedule, a13);
    transitInfo = v23->_transitInfo;
    if (transitInfo)
    {
      -[GEOPDTransitInfo _readTransitConnections]((uint64_t)v23->_transitInfo);
      if (-[NSMutableArray count](transitInfo->_transitConnections, "count"))
      {
        v28 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v29 = *p_transitInfo;
        if (*p_transitInfo)
        {
          -[GEOPDTransitInfo _readTransitConnections](*p_transitInfo);
          v30 = objc_msgSend(*(id *)(v29 + 80), "count");
        }
        else
        {
          v30 = 0;
        }
        v31 = (NSArray *)objc_msgSend(v28, "initWithCapacity:", v30);
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        -[GEOPDTransitInfo transitConnections]((id *)*p_transitInfo);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v53 != v35)
                objc_enumerationMutation(v32);
              v37 = -[_GEOTransitConnectionInfo initWithConnection:providerID:]([_GEOTransitConnectionInfo alloc], "initWithConnection:providerID:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i), a9);
              -[NSArray addObject:](v31, "addObject:", v37);

            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
          }
          while (v34);
        }

        connections = v23->_connections;
        v23->_connections = v31;

      }
      v39 = *p_transitInfo;
      if (*p_transitInfo)
      {
        -[GEOPDTransitInfo _readSearchDisplayName](*p_transitInfo);
        if (*(_QWORD *)(v39 + 40))
        {
          -[GEOPDTransitInfo searchDisplayName]((id *)&v23->_transitInfo->super.super.isa);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "copy");
          displayName = v23->_displayName;
          v23->_displayName = (NSString *)v41;

        }
      }
    }
  }

  return v23;
}

- (NSArray)labelItems
{
  return (NSArray *)-[GEOPDTransitInfo labels]((id *)&self->_transitInfo->super.super.isa);
}

- (NSArray)connections
{
  return self->_connections;
}

- (NSArray)systems
{
  NSArray *systems;
  id v4;
  GEOPDTransitInfo *transitInfo;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  NSArray *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  systems = self->_systems;
  if (!systems)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    transitInfo = self->_transitInfo;
    if (transitInfo)
    {
      -[GEOPDTransitInfo _readSystems]((uint64_t)self->_transitInfo);
      v6 = -[NSMutableArray count](transitInfo->_systems, "count");
    }
    else
    {
      v6 = 0;
    }
    v7 = (void *)objc_msgSend(v4, "initWithCapacity:", v6);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[GEOPDTransitInfo systems]((id *)&self->_transitInfo->super.super.isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "geoTransitSystem", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    v14 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v7);
    v15 = self->_systems;
    self->_systems = v14;

    systems = self->_systems;
  }
  return systems;
}

- (unint64_t)systemsCount
{
  void *v2;
  unint64_t v3;

  -[_GEOMapItemTransitInfo systems](self, "systems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSArray)lines
{
  NSArray *lines;
  id v4;
  GEOPDTransitInfo *transitInfo;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  lines = self->_lines;
  if (!lines)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    transitInfo = self->_transitInfo;
    if (transitInfo)
    {
      -[GEOPDTransitInfo _readLines]((uint64_t)self->_transitInfo);
      v6 = -[NSMutableArray count](transitInfo->_lines, "count");
    }
    else
    {
      v6 = 0;
    }
    v7 = (void *)objc_msgSend(v4, "initWithCapacity:", v6);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[GEOPDTransitInfo lines]((id *)&self->_transitInfo->super.super.isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "systemIndex", (_QWORD)v21);
          if (-[_GEOMapItemTransitInfo systemsCount](self, "systemsCount") <= v14)
          {
            v16 = 0;
          }
          else
          {
            -[_GEOMapItemTransitInfo systems](self, "systems");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndex:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v13, "geoTransitLineWithSystem:locationHint:", v16, self->_coordinate.latitude, self->_coordinate.longitude);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v17);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    v18 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v7);
    v19 = self->_lines;
    self->_lines = v18;

    lines = self->_lines;
  }
  return lines;
}

- (unint64_t)linesCount
{
  void *v2;
  unint64_t v3;

  -[_GEOMapItemTransitInfo lines](self, "lines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)linesForSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_GEOMapItemTransitInfo linesCount](self, "linesCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_GEOMapItemTransitInfo lines](self, "lines", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "system");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "muid");
        v14 = objc_msgSend(v4, "muid");

        if (v13 == v14)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSArray)incidents
{
  return self->_incidents;
}

- (BOOL)isTransitIncidentsTTLExpired
{
  NSDate *incidentExpirationDate;
  double v3;

  incidentExpirationDate = self->_incidentExpirationDate;
  if (incidentExpirationDate)
  {
    -[NSDate timeIntervalSinceNow](incidentExpirationDate, "timeIntervalSinceNow");
    LOBYTE(incidentExpirationDate) = v3 <= 0.0;
  }
  return (char)incidentExpirationDate;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)departureSequences
{
  NSArray *departureSequences;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;
  uint64_t *v24;
  GEOPDTransitSchedule *transitSchedule;
  int *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _GEOTransitDepartureSequence *v50;
  uint64_t v51;
  void *v52;
  void *v54;
  void *v55;
  unint64_t v56;
  id obj;
  char *obja;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  departureSequences = self->_departureSequences;
  if (!departureSequences)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    -[GEOPDTransitInfo stopInfos]((id *)&self->_transitInfo->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v68;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v68 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v9);
          if (v10)
            v11 = *(_QWORD *)(v10 + 16);
          else
            v11 = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v12);

          ++v9;
        }
        while (v7 != v9);
        v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
        v7 = v13;
      }
      while (v13);
    }
    v55 = v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    -[GEOPDTransitSchedule departureSequenceContainers]((id *)&self->_transitSchedule->super.super.isa);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v64 != v17)
            objc_enumerationMutation(obj);
          v19 = 0;
          v20 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
          if (v20)
          {
LABEL_19:
            -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs](v20);
            v21 = *(_QWORD *)(v20 + 32);
            goto LABEL_20;
          }
          while (1)
          {
            v21 = 0;
LABEL_20:
            if (v19 >= v21)
              break;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[GEOPDDepartureSequenceContainer departureSequenceIndexAtIndex:](v20, v19));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, v22);

            ++v19;
            if (v20)
              goto LABEL_19;
          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      }
      while (v16);
    }

    v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v24 = (uint64_t *)self;
    transitSchedule = self->_transitSchedule;
    v26 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
    if (transitSchedule)
    {
      -[GEOPDTransitSchedule _readDepartureSequences]((uint64_t)self->_transitSchedule);
      v27 = -[NSMutableArray count](transitSchedule->_departureSequences, "count");
    }
    else
    {
      v27 = 0;
    }
    v54 = (void *)objc_msgSend(v23, "initWithCapacity:", v27);
    v28 = 0;
    v29 = v4;
    while (1)
    {
      v30 = v24[2];
      if (v30)
      {
        -[GEOPDTransitSchedule _readDepartureSequences](v24[2]);
        v31 = objc_msgSend(*(id *)(v30 + v26[521]), "count");
      }
      else
      {
        v31 = 0;
      }
      if (v28 >= v31)
      {
        v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v54);
        v52 = (void *)v24[5];
        v24[5] = v51;

        departureSequences = (NSArray *)v24[5];
        return departureSequences;
      }
      -[GEOPDTransitSchedule departureSequenceAtIndex:]((id *)v24[2], v28);
      v32 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      objc_msgSend(v24, "lines");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      if (!v34)
        goto LABEL_48;
      v35 = v34;
      v56 = v28;
      v36 = 0;
      v37 = *(_QWORD *)v60;
LABEL_33:
      v38 = 0;
      obja = &v36[v35];
      while (1)
      {
        if (*(_QWORD *)v60 != v37)
          objc_enumerationMutation(v33);
        v39 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v38);
        v40 = objc_msgSend(v39, "muid");
        v41 = v32 ? v32[15] : 0;
        if (v40 == v41)
          break;
        if (v35 == ++v38)
        {
          v42 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
          v35 = v42;
          v36 = obja;
          if (!v42)
          {
            v24 = (uint64_t *)self;
            v28 = v56;
            goto LABEL_48;
          }
          goto LABEL_33;
        }
      }
      v43 = v39;

      v24 = (uint64_t *)self;
      v28 = v56;
      if (v43)
        break;
LABEL_49:

      ++v28;
      v29 = v55;
      v26 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
    }
    -[GEOPDTransitInfo lineAtIndex:]((id *)&self->_transitInfo->super.super.isa, (uint64_t)&v36[v38]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      v45 = v32[17];
    else
      v45 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectForKeyedSubscript:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v56);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = -[_GEOTransitDepartureSequence initWithSequence:line:pbLine:stopInfo:container:]([_GEOTransitDepartureSequence alloc], "initWithSequence:line:pbLine:stopInfo:container:", v32, v43, v44, v47, v49);
    objc_msgSend(v54, "addObject:", v50);

    v28 = v56;
    v33 = v43;
    v24 = (uint64_t *)self;
LABEL_48:

    goto LABEL_49;
  }
  return departureSequences;
}

- (double)timeToLive
{
  GEOPDTransitSchedule *transitSchedule;
  double result;

  transitSchedule = self->_transitSchedule;
  result = 0.0;
  if (transitSchedule)
  {
    if ((*(_BYTE *)&transitSchedule->_flags & 2) != 0)
      return (double)transitSchedule->_ttlSeconds;
  }
  return result;
}

- (NSDate)lastFullScheduleValidDate
{
  unint64_t v2;
  _QWORD *p_isa;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  GEOPDTransitSchedule *transitSchedule;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  GEOPDTransitSchedule *v16;
  GEOPDTimeRange *p_operatingHoursRange;
  void *v18;
  void *v19;
  uint64_t v20;

  p_isa = &self->_transitSchedule->super.super.isa;
  if (p_isa)
  {
    -[GEOPDTransitSchedule _readDeparturePredicateCountdown]((uint64_t)self->_transitSchedule);
    if (p_isa[3])
    {
      -[GEOPDTransitSchedule departurePredicateCountdown]((id *)&self->_transitSchedule->super.super.isa);
      v5 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v5;
      if (v5 && (*(_BYTE *)(v5 + 32) & 1) != 0 && (~*(_DWORD *)(v5 + 24) & 3) == 0)
      {
        LODWORD(v2) = *(_DWORD *)(v5 + 16);
        LODWORD(v6) = *(_DWORD *)(v5 + 20);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dateByAddingTimeInterval:", (double)v2);
        p_isa = (_QWORD *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        p_isa = 0;
      }

    }
    else
    {
      p_isa = 0;
    }
    transitSchedule = self->_transitSchedule;
    if (transitSchedule)
    {
      -[GEOPDTransitSchedule _readDeparturePredicateStamp]((uint64_t)self->_transitSchedule);
      if (transitSchedule->_departurePredicateStamp)
      {
        -[GEOPDTransitSchedule departurePredicateStamp]((id *)&self->_transitSchedule->super.super.isa);
        v10 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v10;
        if (v10 && (*(_BYTE *)(v10 + 32) & 1) != 0 && (~*(_DWORD *)(v10 + 24) & 3) == 0)
        {
          LODWORD(v2) = *(_DWORD *)(v10 + 16);
          LODWORD(v11) = *(_DWORD *)(v10 + 20);
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dateByAddingTimeInterval:", (double)v2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (p_isa)
          {
            objc_msgSend(p_isa, "earlierDate:", v14);
            v15 = objc_claimAutoreleasedReturnValue();

            p_isa = (_QWORD *)v15;
          }
          else
          {
            p_isa = v14;
          }

        }
      }
      v16 = self->_transitSchedule;
      if (v16)
      {
        if ((*(_BYTE *)&v16->_flags & 1) != 0)
        {
          p_operatingHoursRange = &v16->_operatingHoursRange;
          if ((~*(_DWORD *)&p_operatingHoursRange->_has & 3) == 0)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(p_operatingHoursRange->_startTime + p_operatingHoursRange->_duration));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (p_isa)
            {
              objc_msgSend(p_isa, "earlierDate:", v18);
              v20 = objc_claimAutoreleasedReturnValue();

              p_isa = (_QWORD *)v20;
            }
            else
            {
              p_isa = v18;
            }

          }
        }
      }
    }
  }
  return (NSDate *)p_isa;
}

- (unint64_t)numAdditionalDeparturesForSequence:(id)a3
{
  void *v4;
  int v5;
  GEOPDTransitSchedule *transitSchedule;
  uint64_t v7;
  unsigned int v8;

  objc_msgSend(a3, "line");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "departuresAreVehicleSpecific");

  transitSchedule = self->_transitSchedule;
  if (v5)
  {
    if (transitSchedule)
    {
      -[GEOPDTransitSchedule _readDeparturePredicateStamp]((uint64_t)self->_transitSchedule);
      if (transitSchedule->_departurePredicateStamp)
      {
        -[GEOPDTransitSchedule departurePredicateStamp]((id *)&self->_transitSchedule->super.super.isa);
        v7 = objc_claimAutoreleasedReturnValue();
        if (!v7)
          goto LABEL_10;
LABEL_9:
        if ((*(_BYTE *)(v7 + 32) & 2) != 0)
        {
          v8 = *(_DWORD *)(v7 + 28);
          goto LABEL_13;
        }
LABEL_10:
        v8 = 0;
LABEL_13:

        return v8;
      }
    }
  }
  else if (transitSchedule)
  {
    -[GEOPDTransitSchedule _readDeparturePredicateCountdown]((uint64_t)self->_transitSchedule);
    if (transitSchedule->_departurePredicateCountdown)
    {
      -[GEOPDTransitSchedule departurePredicateCountdown]((id *)&self->_transitSchedule->super.super.isa);
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  return 0;
}

- (id)_departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 ignoreDirectionFilter:(BOOL)a5 direction:(id)a6 validForDateFromBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;
  _GEOMapItemTransitInfo *v30;
  id v31;
  id v32;
  BOOL v33;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[_GEOMapItemTransitInfo departureSequences](self, "departureSequences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __135___GEOMapItemTransitInfo__departureSequencesForSystem_excludingIncidentEntities_ignoreDirectionFilter_direction_validForDateFromBlock___block_invoke;
  v27 = &unk_1E1C20808;
  v33 = a5;
  v28 = v12;
  v29 = v14;
  v31 = v13;
  v32 = v15;
  v30 = self;
  v17 = v13;
  v18 = v15;
  v19 = v14;
  v20 = v12;
  objc_msgSend(v16, "indexesOfObjectsPassingTest:", &v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectsAtIndexes:", v21, v24, v25, v26, v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)_departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 container:(id)a5 validForDateFromBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t i;
  GEOPDTransitSchedule *transitSchedule;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t j;
  unint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[_GEOMapItemTransitInfo departureSequences](self, "departureSequences");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v37 = (void *)v14;
    v38 = v11;
    v39 = v10;
    for (i = 0; ; ++i)
    {
      transitSchedule = self->_transitSchedule;
      if (transitSchedule)
      {
        -[GEOPDTransitSchedule _readDepartureSequenceContainers]((uint64_t)self->_transitSchedule);
        v17 = -[NSMutableArray count](transitSchedule->_departureSequenceContainers, "count");
      }
      else
      {
        v17 = 0;
      }
      if (i >= v17)
        break;
      -[GEOPDTransitSchedule departureSequenceContainerAtIndex:]((id *)&self->_transitSchedule->super.super.isa, i);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      -[GEOPDDepartureSequenceContainer displayName]((id *)v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@_%@"), v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v21) = objc_msgSend(v22, "isEqualToString:", v12);
      if ((v21 & 1) != 0)
        goto LABEL_11;

    }
    v18 = 0;
LABEL_11:
    -[_GEOMapItemTransitInfo departureSequences](self, "departureSequences");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
    if (v18)
    {
      -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs](v18);
      v26 = *(_QWORD *)(v18 + 32);
    }
    else
    {
      v26 = 0;
    }
    v23 = (void *)objc_msgSend(v25, "initWithCapacity:", v26);
    v27 = 0;
    if (!v18)
      goto LABEL_19;
LABEL_14:
    -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs](v18);
    for (j = *(_QWORD *)(v18 + 32); v27 < j; j = 0)
    {
      v29 = -[GEOPDDepartureSequenceContainer departureSequenceIndexAtIndex:](v18, v27);
      if (v29 < objc_msgSend(v24, "count"))
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v30);

      }
      ++v27;
      if (v18)
        goto LABEL_14;
LABEL_19:
      ;
    }

    v11 = v38;
    v10 = v39;
  }
  else
  {
    v23 = (void *)v14;
  }
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __113___GEOMapItemTransitInfo__departureSequencesForSystem_excludingIncidentEntities_container_validForDateFromBlock___block_invoke;
  v40[3] = &unk_1E1C20830;
  v40[4] = self;
  v41 = v10;
  v42 = v11;
  v43 = v13;
  v31 = v11;
  v32 = v10;
  v33 = v13;
  objc_msgSend(v23, "indexesOfObjectsPassingTest:", v40);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectsAtIndexes:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 direction:(id)a5 validForDateFromBlock:(id)a6
{
  return -[_GEOMapItemTransitInfo _departureSequencesForSystem:excludingIncidentEntities:ignoreDirectionFilter:direction:validForDateFromBlock:](self, "_departureSequencesForSystem:excludingIncidentEntities:ignoreDirectionFilter:direction:validForDateFromBlock:", a3, a4, 0, a5, a6);
}

- (id)directionsForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5 hasSequencesWithNoDirection:(BOOL *)a6
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[_GEOMapItemTransitInfo _departureSequencesForSystem:excludingIncidentEntities:ignoreDirectionFilter:direction:validForDateFromBlock:](self, "_departureSequencesForSystem:excludingIncidentEntities:ignoreDirectionFilter:direction:validForDateFromBlock:", a3, a4, 1, 0, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v7, "count"));
  if (a6)
    *a6 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        objc_msgSend(v14, "direction", (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "direction");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

        }
        else if (a6 && !*a6)
        {
          *a6 = 1;
        }
        ++v13;
      }
      while (v11 != v13);
      v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v11 = v17;
    }
    while (v17);
  }

  objc_msgSend(v8, "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)departureSequenceContainersForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _GEOMapItemTransitInfo *v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_GEOMapItemTransitInfo departureSequences](self, "departureSequences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[GEOPDTransitSchedule departureSequenceContainers]((id *)&self->_transitSchedule->super.super.isa);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __111___GEOMapItemTransitInfo_departureSequenceContainersForSystem_excludingIncidentEntities_validForDateFromBlock___block_invoke;
  v22[3] = &unk_1E1C20858;
  v28 = v10;
  v23 = v11;
  v24 = self;
  v25 = v9;
  v26 = v8;
  v14 = v12;
  v27 = v14;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v22);

  v19 = v27;
  v20 = v14;

  return v20;
}

- (id)allSequencesForSystem:(id)a3 direction:(id)a4
{
  return -[_GEOMapItemTransitInfo departureSequencesForSystem:excludingIncidentEntities:direction:validForDateFromBlock:](self, "departureSequencesForSystem:excludingIncidentEntities:direction:validForDateFromBlock:", a3, 0, a4, 0);
}

- (id)allSequencesForSystem:(id)a3 container:(id)a4
{
  return -[_GEOMapItemTransitInfo departureSequencesForSystem:excludingIncidentEntities:container:validForDateFromBlock:](self, "departureSequencesForSystem:excludingIncidentEntities:container:validForDateFromBlock:", a3, 0, a4, 0);
}

- (id)serviceResumesResultForLine:(id)a3 excludingIncidentEntities:(id)a4 afterDate:(id)a5 usingContainers:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _BOOL8 v18;
  GEOMapItemTransitLineResumeResult *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "system");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[_GEOMapItemTransitInfo _departureSequencesForSystem:excludingIncidentEntities:container:validForDateFromBlock:](self, "_departureSequencesForSystem:excludingIncidentEntities:container:validForDateFromBlock:", v13, v11, 0, 0);
  else
    -[_GEOMapItemTransitInfo _departureSequencesForSystem:excludingIncidentEntities:ignoreDirectionFilter:direction:validForDateFromBlock:](self, "_departureSequencesForSystem:excludingIncidentEntities:ignoreDirectionFilter:direction:validForDateFromBlock:", v13, v11, 1, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__96;
  v45 = __Block_byref_object_dispose__96;
  v46 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__96;
  v35 = __Block_byref_object_dispose__96;
  v36 = 0;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __106___GEOMapItemTransitInfo_serviceResumesResultForLine_excludingIncidentEntities_afterDate_usingContainers___block_invoke;
  v24 = &unk_1E1C20880;
  v15 = v10;
  v25 = v15;
  v16 = v12;
  v26 = v16;
  v17 = v11;
  v27 = v17;
  v28 = &v37;
  v29 = &v41;
  v30 = &v31;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v21);
  if (v42[5])
    v18 = 0;
  else
    v18 = *((_BYTE *)v38 + 24) != 0;
  v19 = objc_alloc_init(GEOMapItemTransitLineResumeResult);
  -[GEOMapItemTransitLineResumeResult setBlocked:](v19, "setBlocked:", v18, v21, v22, v23, v24);
  -[GEOMapItemTransitLineResumeResult setEarliestNextDepartureDate:](v19, "setEarliestNextDepartureDate:", v42[5]);
  -[GEOMapItemTransitLineResumeResult setDepartureSequence:](v19, "setDepartureSequence:", v32[5]);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v19;
}

- (id)inactiveLinesForSystem:(id)a3 relativeToDateFromBlock:(id)a4 excludingIncidentEntities:(id)a5 usingContainers:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1E0C99DE8];
  -[_GEOMapItemTransitInfo linesForSystem:](self, "linesForSystem:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[_GEOMapItemTransitInfo _departureSequencesForSystem:excludingIncidentEntities:container:validForDateFromBlock:](self, "_departureSequencesForSystem:excludingIncidentEntities:container:validForDateFromBlock:", v10, v12, 0, v11);
  else
    -[_GEOMapItemTransitInfo _departureSequencesForSystem:excludingIncidentEntities:ignoreDirectionFilter:direction:validForDateFromBlock:](self, "_departureSequencesForSystem:excludingIncidentEntities:ignoreDirectionFilter:direction:validForDateFromBlock:", v10, v12, 1, 0, v11);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v21, "line", (_QWORD)v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v21, "line");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeObject:", v23);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

  return v15;
}

- (id)headSignsForLine:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *v6;
  NSMapTable *cachedHeadSignsForLine;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _GEOMapItemTransitInfo *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMapTable objectForKey:](self->_cachedHeadSignsForLine, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (!self->_cachedHeadSignsForLine)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        cachedHeadSignsForLine = self->_cachedHeadSignsForLine;
        self->_cachedHeadSignsForLine = v6;

      }
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v22 = self;
      -[_GEOMapItemTransitInfo departureSequences](self, "departureSequences");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v14, "line");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "muid");
            v17 = objc_msgSend(v4, "muid");

            if (v16 == v17)
            {
              objc_msgSend(v14, "headsign");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "length");

              if (v19)
              {
                objc_msgSend(v14, "headsign");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObject:", v20);

              }
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v11);
      }

      v5 = (void *)objc_msgSend(v8, "copy");
      -[NSMapTable setObject:forKey:](v22->_cachedHeadSignsForLine, "setObject:forKey:", v5, v4);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)transitTripStops
{
  return self->_transitStops;
}

- (NSString)title
{
  return -[GEOPDTransitInfo title]((id *)&self->_transitInfo->super.super.isa);
}

- (NSString)subtitle
{
  return -[GEOPDTransitInfo subTitle]((id *)&self->_transitInfo->super.super.isa);
}

- (GEOComposedRoute)composedRoute
{
  return self->_composedRoute;
}

- (GEOTransitNearbySchedule)nearbySchedule
{
  GEOTransitNearbySchedule *nearbySchedule;
  _GEOTransitNearbySchedule *v4;
  GEOPDTransitNearbySchedule *unprocessedNearbySchedule;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOTransitNearbySchedule *v10;
  GEOTransitNearbySchedule *v11;

  nearbySchedule = self->_nearbySchedule;
  if (!nearbySchedule)
  {
    v4 = [_GEOTransitNearbySchedule alloc];
    unprocessedNearbySchedule = self->_unprocessedNearbySchedule;
    -[GEOPDTransitSchedule departureSequenceContainers]((id *)&self->_transitSchedule->super.super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GEOMapItemTransitInfo departureSequences](self, "departureSequences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GEOMapItemTransitInfo incidents](self, "incidents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDTransitInfo stopInfos]((id *)&self->_transitInfo->super.super.isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_GEOTransitNearbySchedule initWithNearbySchedule:departureSequenceContainers:scheduledDepartureSequences:incidents:stopInfo:](v4, "initWithNearbySchedule:departureSequenceContainers:scheduledDepartureSequences:incidents:stopInfo:", unprocessedNearbySchedule, v6, v7, v8, v9);
    v11 = self->_nearbySchedule;
    self->_nearbySchedule = v10;

    nearbySchedule = self->_nearbySchedule;
  }
  return nearbySchedule;
}

- (BOOL)hasTransitIncidentComponent
{
  return self->_hasTransitIncidentComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbySchedule, 0);
  objc_storeStrong((id *)&self->_unprocessedNearbySchedule, 0);
  objc_storeStrong((id *)&self->_composedRoute, 0);
  objc_storeStrong((id *)&self->_transitStops, 0);
  objc_storeStrong((id *)&self->_cachedHeadSignsForLine, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_incidentExpirationDate, 0);
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_departureSequences, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_systems, 0);
  objc_storeStrong((id *)&self->_transitSchedule, 0);
  objc_storeStrong((id *)&self->_transitInfo, 0);
}

@end
