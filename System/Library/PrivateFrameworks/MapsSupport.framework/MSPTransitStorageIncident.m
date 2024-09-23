@implementation MSPTransitStorageIncident

- (MSPTransitStorageIncident)initWithIncident:(id)a3
{
  id v4;
  MSPTransitStorageIncident *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  MSPTransitStorageIncidentEntity *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MSPTransitStorageIncident;
  v5 = -[MSPTransitStorageIncident init](&v35, sel_init);
  if (v5)
  {
    -[MSPTransitStorageIncident setMuid:](v5, "setMuid:", objc_msgSend(v4, "muid"));
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageIncident setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "summary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageIncident setSummary:](v5, "setSummary:", v7);

    objc_msgSend(v4, "fullDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageIncident setFullDescription:](v5, "setFullDescription:", v8);

    objc_msgSend(v4, "messageForRoutePlanning");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageIncident setMessageForRoutePlanning:](v5, "setMessageForRoutePlanning:", v9);

    objc_msgSend(v4, "messageForRouteStepping");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageIncident setMessageForRouteStepping:](v5, "setMessageForRouteStepping:", v10);

    objc_msgSend(v4, "messageForNonRoutable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageIncident setMessageForNonRoutable:](v5, "setMessageForNonRoutable:", v11);

    objc_msgSend(v4, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      -[MSPTransitStorageIncident setStartDatetime:](v5, "setStartDatetime:", v14);

    }
    objc_msgSend(v4, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceReferenceDate");
      -[MSPTransitStorageIncident setEndDatetime:](v5, "setEndDatetime:", v17);

    }
    -[MSPTransitStorageIncident setIconType:](v5, "setIconType:", objc_msgSend(v4, "iconType"));
    objc_msgSend(v4, "creationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "creationDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceReferenceDate");
      -[MSPTransitStorageIncident setCreationDatetime:](v5, "setCreationDatetime:", v20);

    }
    objc_msgSend(v4, "lastUpdated");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v4, "lastUpdated");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceReferenceDate");
      -[MSPTransitStorageIncident setLastUpdatedDatetime:](v5, "setLastUpdatedDatetime:", v23);

    }
    -[MSPTransitStorageIncident setBlockingIncident:](v5, "setBlockingIncident:", objc_msgSend(v4, "isBlockingIncident"));
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v4, "affectedEntities", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v32;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(v24);
          v29 = -[MSPTransitStorageIncidentEntity initWithIncidentEntity:]([MSPTransitStorageIncidentEntity alloc], "initWithIncidentEntity:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v28));
          -[MSPTransitStorageIncident addAffectedEntities:](v5, "addAffectedEntities:", v29);

          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v26);
    }

  }
  return v5;
}

- (GEOTransitIconDataSource)artworkDataSource
{
  return 0;
}

- (NSDate)creationDate
{
  void *v3;

  if (-[MSPTransitStorageIncident hasCreationDatetime](self, "hasCreationDatetime"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)-[MSPTransitStorageIncident creationDatetime](self, "creationDatetime"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSDate *)v3;
}

- (NSDate)lastUpdated
{
  void *v3;

  if (-[MSPTransitStorageIncident hasLastUpdatedDatetime](self, "hasLastUpdatedDatetime"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)-[MSPTransitStorageIncident lastUpdatedDatetime](self, "lastUpdatedDatetime"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSDate *)v3;
}

- (NSDate)startDate
{
  void *v3;

  if (-[MSPTransitStorageIncident hasStartDatetime](self, "hasStartDatetime"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)-[MSPTransitStorageIncident startDatetime](self, "startDatetime"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v3;

  if (-[MSPTransitStorageIncident hasEndDatetime](self, "hasEndDatetime"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)-[MSPTransitStorageIncident endDatetime](self, "endDatetime"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSDate *)v3;
}

- (void)setMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMuid
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSummary
{
  return self->_summary != 0;
}

- (BOOL)hasFullDescription
{
  return self->_fullDescription != 0;
}

- (BOOL)hasMessageForRoutePlanning
{
  return self->_messageForRoutePlanning != 0;
}

- (BOOL)hasMessageForRouteStepping
{
  return self->_messageForRouteStepping != 0;
}

- (BOOL)hasMessageForNonRoutable
{
  return self->_messageForNonRoutable != 0;
}

- (void)setStartDatetime:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_startDatetime = a3;
}

- (void)setHasStartDatetime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStartDatetime
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setEndDatetime:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_endDatetime = a3;
}

- (void)setHasEndDatetime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndDatetime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIconType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_iconType = a3;
}

- (void)setHasIconType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIconType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)iconTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E6652408[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsIconType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitIncidentIconTypeUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitIncidentIconTypeWarning")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitIncidentIconTypeConstruction")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCreationDatetime:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_creationDatetime = a3;
}

- (void)setHasCreationDatetime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCreationDatetime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLastUpdatedDatetime:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_lastUpdatedDatetime = a3;
}

- (void)setHasLastUpdatedDatetime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLastUpdatedDatetime
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBlockingIncident:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_blockingIncident = a3;
}

- (void)setHasBlockingIncident:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasBlockingIncident
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)clearAffectedEntities
{
  -[NSMutableArray removeAllObjects](self->_affectedEntities, "removeAllObjects");
}

- (void)addAffectedEntities:(id)a3
{
  id v4;
  NSMutableArray *affectedEntities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  affectedEntities = self->_affectedEntities;
  v8 = v4;
  if (!affectedEntities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_affectedEntities;
    self->_affectedEntities = v6;

    v4 = v8;
    affectedEntities = self->_affectedEntities;
  }
  -[NSMutableArray addObject:](affectedEntities, "addObject:", v4);

}

- (unint64_t)affectedEntitiesCount
{
  return -[NSMutableArray count](self->_affectedEntities, "count");
}

- (id)affectedEntitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_affectedEntities, "objectAtIndex:", a3);
}

+ (Class)affectedEntitiesType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageIncident;
  -[MSPTransitStorageIncident description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPTransitStorageIncident dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *summary;
  NSString *fullDescription;
  NSString *messageForRoutePlanning;
  NSString *messageForRouteStepping;
  NSString *messageForNonRoutable;
  char has;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  PBUnknownFields *unknownFields;
  void *v21;
  void *v23;
  void *v24;
  uint64_t iconType;
  __CFString *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_muid);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("muid"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  summary = self->_summary;
  if (summary)
    objc_msgSend(v3, "setObject:forKey:", summary, CFSTR("summary"));
  fullDescription = self->_fullDescription;
  if (fullDescription)
    objc_msgSend(v3, "setObject:forKey:", fullDescription, CFSTR("full_description"));
  messageForRoutePlanning = self->_messageForRoutePlanning;
  if (messageForRoutePlanning)
    objc_msgSend(v3, "setObject:forKey:", messageForRoutePlanning, CFSTR("message_for_route_planning"));
  messageForRouteStepping = self->_messageForRouteStepping;
  if (messageForRouteStepping)
    objc_msgSend(v3, "setObject:forKey:", messageForRouteStepping, CFSTR("message_for_route_stepping"));
  messageForNonRoutable = self->_messageForNonRoutable;
  if (messageForNonRoutable)
    objc_msgSend(v3, "setObject:forKey:", messageForNonRoutable, CFSTR("message_for_non_routable"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_startDatetime);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("start_datetime"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_17:
      if ((has & 8) == 0)
        goto LABEL_18;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_endDatetime);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("end_datetime"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 2) == 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_36:
  iconType = self->_iconType;
  if (iconType >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), self->_iconType);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = off_1E6652408[iconType];
  }
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("icon_type"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_creationDatetime);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("creation_datetime"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_20:
    if ((has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lastUpdatedDatetime);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("last_updated_datetime"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_blockingIncident);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("blocking_incident"));

  }
LABEL_22:
  if (-[NSMutableArray count](self->_affectedEntities, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_affectedEntities, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = self->_affectedEntities;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("affected_entities"));
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageIncidentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_summary)
    PBDataWriterWriteStringField();
  if (self->_fullDescription)
    PBDataWriterWriteStringField();
  if (self->_messageForRoutePlanning)
    PBDataWriterWriteStringField();
  if (self->_messageForRouteStepping)
    PBDataWriterWriteStringField();
  if (self->_messageForNonRoutable)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_17:
      if ((has & 8) == 0)
        goto LABEL_18;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 2) == 0)
      goto LABEL_19;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_20:
    if ((has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_21:
    PBDataWriterWriteBOOLField();
LABEL_22:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_affectedEntities;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD *v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_muid;
    *((_BYTE *)v4 + 108) |= 1u;
  }
  v10 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    v4 = v10;
  }
  if (self->_summary)
  {
    objc_msgSend(v10, "setSummary:");
    v4 = v10;
  }
  if (self->_fullDescription)
  {
    objc_msgSend(v10, "setFullDescription:");
    v4 = v10;
  }
  if (self->_messageForRoutePlanning)
  {
    objc_msgSend(v10, "setMessageForRoutePlanning:");
    v4 = v10;
  }
  if (self->_messageForRouteStepping)
  {
    objc_msgSend(v10, "setMessageForRouteStepping:");
    v4 = v10;
  }
  if (self->_messageForNonRoutable)
  {
    objc_msgSend(v10, "setMessageForNonRoutable:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_startDatetime;
    *((_BYTE *)v4 + 108) |= 0x20u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_17:
      if ((has & 8) == 0)
        goto LABEL_18;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 9) = self->_endDatetime;
  *((_BYTE *)v4 + 108) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 2) == 0)
      goto LABEL_19;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 12) = self->_iconType;
  *((_BYTE *)v4 + 108) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0)
      goto LABEL_20;
LABEL_31:
    *((_DWORD *)v4 + 13) = self->_lastUpdatedDatetime;
    *((_BYTE *)v4 + 108) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_30:
  *((_DWORD *)v4 + 8) = self->_creationDatetime;
  *((_BYTE *)v4 + 108) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_31;
LABEL_20:
  if ((has & 0x40) != 0)
  {
LABEL_21:
    *((_BYTE *)v4 + 104) = self->_blockingIncident;
    *((_BYTE *)v4 + 108) |= 0x40u;
  }
LABEL_22:
  if (-[MSPTransitStorageIncident affectedEntitiesCount](self, "affectedEntitiesCount"))
  {
    objc_msgSend(v10, "clearAffectedEntities");
    v6 = -[MSPTransitStorageIncident affectedEntitiesCount](self, "affectedEntitiesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[MSPTransitStorageIncident affectedEntitiesAtIndex:](self, "affectedEntitiesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAffectedEntities:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char has;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_muid;
    *(_BYTE *)(v5 + 108) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v7;

  v9 = -[NSString copyWithZone:](self->_summary, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v9;

  v11 = -[NSString copyWithZone:](self->_fullDescription, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v11;

  v13 = -[NSString copyWithZone:](self->_messageForRoutePlanning, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v13;

  v15 = -[NSString copyWithZone:](self->_messageForRouteStepping, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v15;

  v17 = -[NSString copyWithZone:](self->_messageForNonRoutable, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v17;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_startDatetime;
    *(_BYTE *)(v6 + 108) |= 0x20u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 36) = self->_endDatetime;
  *(_BYTE *)(v6 + 108) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v6 + 48) = self->_iconType;
  *(_BYTE *)(v6 + 108) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 32) = self->_creationDatetime;
  *(_BYTE *)(v6 + 108) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_22:
  *(_DWORD *)(v6 + 52) = self->_lastUpdatedDatetime;
  *(_BYTE *)(v6 + 108) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    *(_BYTE *)(v6 + 104) = self->_blockingIncident;
    *(_BYTE *)(v6 + 108) |= 0x40u;
  }
LABEL_10:
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self->_affectedEntities;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v6, "addAffectedEntities:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v22);
  }

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  NSString *summary;
  NSString *fullDescription;
  NSString *messageForRoutePlanning;
  NSString *messageForRouteStepping;
  NSString *messageForNonRoutable;
  char v11;
  NSMutableArray *affectedEntities;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 1) == 0 || self->_muid != *((_QWORD *)v4 + 2))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
    goto LABEL_48;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 12) && !-[NSString isEqual:](title, "isEqual:"))
    goto LABEL_48;
  summary = self->_summary;
  if ((unint64_t)summary | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](summary, "isEqual:"))
      goto LABEL_48;
  }
  fullDescription = self->_fullDescription;
  if ((unint64_t)fullDescription | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](fullDescription, "isEqual:"))
      goto LABEL_48;
  }
  messageForRoutePlanning = self->_messageForRoutePlanning;
  if ((unint64_t)messageForRoutePlanning | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](messageForRoutePlanning, "isEqual:"))
      goto LABEL_48;
  }
  messageForRouteStepping = self->_messageForRouteStepping;
  if ((unint64_t)messageForRouteStepping | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](messageForRouteStepping, "isEqual:"))
      goto LABEL_48;
  }
  messageForNonRoutable = self->_messageForNonRoutable;
  if ((unint64_t)messageForNonRoutable | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](messageForNonRoutable, "isEqual:"))
      goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x20) == 0 || self->_startDatetime != *((_DWORD *)v4 + 20))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 108) & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 4) == 0 || self->_endDatetime != *((_DWORD *)v4 + 9))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 108) & 4) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 8) == 0 || self->_iconType != *((_DWORD *)v4 + 12))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 108) & 8) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 2) == 0 || self->_creationDatetime != *((_DWORD *)v4 + 8))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x10) == 0 || self->_lastUpdatedDatetime != *((_DWORD *)v4 + 13))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 108) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x40) == 0)
      goto LABEL_54;
LABEL_48:
    v11 = 0;
    goto LABEL_49;
  }
  if ((*((_BYTE *)v4 + 108) & 0x40) == 0)
    goto LABEL_48;
  if (!self->_blockingIncident)
  {
    if (!*((_BYTE *)v4 + 104))
      goto LABEL_54;
    goto LABEL_48;
  }
  if (!*((_BYTE *)v4 + 104))
    goto LABEL_48;
LABEL_54:
  affectedEntities = self->_affectedEntities;
  if ((unint64_t)affectedEntities | *((_QWORD *)v4 + 3))
    v11 = -[NSMutableArray isEqual:](affectedEntities, "isEqual:");
  else
    v11 = 1;
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_muid;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_title, "hash");
  v5 = -[NSString hash](self->_summary, "hash");
  v6 = -[NSString hash](self->_fullDescription, "hash");
  v7 = -[NSString hash](self->_messageForRoutePlanning, "hash");
  v8 = -[NSString hash](self->_messageForRouteStepping, "hash");
  v9 = -[NSString hash](self->_messageForNonRoutable, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v10 = 2654435761 * self->_startDatetime;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v11 = 2654435761 * self->_endDatetime;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  else
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v12 = 2654435761 * self->_iconType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  v12 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_8:
    v13 = 2654435761 * self->_creationDatetime;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_9;
LABEL_15:
    v14 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_10;
LABEL_16:
    v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[NSMutableArray hash](self->_affectedEntities, "hash");
  }
LABEL_14:
  v13 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_15;
LABEL_9:
  v14 = 2654435761 * self->_lastUpdatedDatetime;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_16;
LABEL_10:
  v15 = 2654435761 * self->_blockingIncident;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[NSMutableArray hash](self->_affectedEntities, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
    self->_muid = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[12])
    -[MSPTransitStorageIncident setTitle:](self, "setTitle:");
  if (*((_QWORD *)v5 + 11))
    -[MSPTransitStorageIncident setSummary:](self, "setSummary:");
  if (*((_QWORD *)v5 + 5))
    -[MSPTransitStorageIncident setFullDescription:](self, "setFullDescription:");
  if (*((_QWORD *)v5 + 8))
    -[MSPTransitStorageIncident setMessageForRoutePlanning:](self, "setMessageForRoutePlanning:");
  if (*((_QWORD *)v5 + 9))
    -[MSPTransitStorageIncident setMessageForRouteStepping:](self, "setMessageForRouteStepping:");
  if (*((_QWORD *)v5 + 7))
    -[MSPTransitStorageIncident setMessageForNonRoutable:](self, "setMessageForNonRoutable:");
  v6 = *((_BYTE *)v5 + 108);
  if ((v6 & 0x20) != 0)
  {
    self->_startDatetime = *((_DWORD *)v5 + 20);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)v5 + 108);
    if ((v6 & 4) == 0)
    {
LABEL_17:
      if ((v6 & 8) == 0)
        goto LABEL_18;
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)v5 + 108) & 4) == 0)
  {
    goto LABEL_17;
  }
  self->_endDatetime = *((_DWORD *)v5 + 9);
  *(_BYTE *)&self->_has |= 4u;
  v6 = *((_BYTE *)v5 + 108);
  if ((v6 & 8) == 0)
  {
LABEL_18:
    if ((v6 & 2) == 0)
      goto LABEL_19;
    goto LABEL_33;
  }
LABEL_32:
  self->_iconType = *((_DWORD *)v5 + 12);
  *(_BYTE *)&self->_has |= 8u;
  v6 = *((_BYTE *)v5 + 108);
  if ((v6 & 2) == 0)
  {
LABEL_19:
    if ((v6 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_34;
  }
LABEL_33:
  self->_creationDatetime = *((_DWORD *)v5 + 8);
  *(_BYTE *)&self->_has |= 2u;
  v6 = *((_BYTE *)v5 + 108);
  if ((v6 & 0x10) == 0)
  {
LABEL_20:
    if ((v6 & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_34:
  self->_lastUpdatedDatetime = *((_DWORD *)v5 + 13);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v5 + 108) & 0x40) != 0)
  {
LABEL_21:
    self->_blockingIncident = *((_BYTE *)v5 + 104);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_22:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v5 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[MSPTransitStorageIncident addAffectedEntities:](self, "addAffectedEntities:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (NSString)fullDescription
{
  return self->_fullDescription;
}

- (void)setFullDescription:(id)a3
{
  objc_storeStrong((id *)&self->_fullDescription, a3);
}

- (NSString)messageForRoutePlanning
{
  return self->_messageForRoutePlanning;
}

- (void)setMessageForRoutePlanning:(id)a3
{
  objc_storeStrong((id *)&self->_messageForRoutePlanning, a3);
}

- (NSString)messageForRouteStepping
{
  return self->_messageForRouteStepping;
}

- (void)setMessageForRouteStepping:(id)a3
{
  objc_storeStrong((id *)&self->_messageForRouteStepping, a3);
}

- (NSString)messageForNonRoutable
{
  return self->_messageForNonRoutable;
}

- (void)setMessageForNonRoutable:(id)a3
{
  objc_storeStrong((id *)&self->_messageForNonRoutable, a3);
}

- (unsigned)startDatetime
{
  return self->_startDatetime;
}

- (unsigned)endDatetime
{
  return self->_endDatetime;
}

- (int)iconType
{
  return self->_iconType;
}

- (unsigned)creationDatetime
{
  return self->_creationDatetime;
}

- (unsigned)lastUpdatedDatetime
{
  return self->_lastUpdatedDatetime;
}

- (BOOL)blockingIncident
{
  return self->_blockingIncident;
}

- (NSArray)affectedEntities
{
  return &self->_affectedEntities->super;
}

- (void)setAffectedEntities:(id)a3
{
  objc_storeStrong((id *)&self->_affectedEntities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_messageForRouteStepping, 0);
  objc_storeStrong((id *)&self->_messageForRoutePlanning, 0);
  objc_storeStrong((id *)&self->_messageForNonRoutable, 0);
  objc_storeStrong((id *)&self->_fullDescription, 0);
  objc_storeStrong((id *)&self->_affectedEntities, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
