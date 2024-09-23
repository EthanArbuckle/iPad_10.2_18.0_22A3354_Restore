@implementation AWDSymptomsDiagnosticIncidentReport

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDSymptomsDiagnosticIncidentReport;
  -[AWDSymptomsDiagnosticIncidentReport dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)handledResult
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_handledResult;
  else
    return 1;
}

- (void)setHandledResult:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_handledResult = a3;
}

- (void)setHasHandledResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHandledResult
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)handledResultAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1EA3B4C98[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsHandledResult:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Allowed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotAllowed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PriorityAllowed")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TransientAllowed")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasSubtype
{
  return self->_subtype != 0;
}

- (BOOL)hasSubtypeContext
{
  return self->_subtypeContext != 0;
}

- (BOOL)hasDetectedName
{
  return self->_detectedName != 0;
}

- (BOOL)hasEffectiveName
{
  return self->_effectiveName != 0;
}

- (void)clearRelatedNames
{
  -[NSMutableArray removeAllObjects](self->_relatedNames, "removeAllObjects");
}

- (void)addRelatedNames:(id)a3
{
  id v4;
  NSMutableArray *relatedNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  relatedNames = self->_relatedNames;
  v8 = v4;
  if (!relatedNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_relatedNames;
    self->_relatedNames = v6;

    v4 = v8;
    relatedNames = self->_relatedNames;
  }
  -[NSMutableArray addObject:](relatedNames, "addObject:", v4);

}

- (unint64_t)relatedNamesCount
{
  return -[NSMutableArray count](self->_relatedNames, "count");
}

- (id)relatedNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_relatedNames, "objectAtIndex:", a3);
}

+ (Class)relatedNamesType
{
  return (Class)objc_opt_class();
}

- (unint64_t)timestampsIncidentEventsCount
{
  return self->_timestampsIncidentEvents.count;
}

- (unint64_t)timestampsIncidentEvents
{
  return self->_timestampsIncidentEvents.list;
}

- (void)clearTimestampsIncidentEvents
{
  PBRepeatedUInt64Clear();
}

- (void)addTimestampsIncidentEvents:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)timestampsIncidentEventsAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_timestampsIncidentEvents;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_timestampsIncidentEvents = &self->_timestampsIncidentEvents;
  count = self->_timestampsIncidentEvents.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_timestampsIncidentEvents->list[a3];
}

- (void)setTimestampsIncidentEvents:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (void)clearIncidentEvents
{
  -[NSMutableArray removeAllObjects](self->_incidentEvents, "removeAllObjects");
}

- (void)addIncidentEvents:(id)a3
{
  id v4;
  NSMutableArray *incidentEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  incidentEvents = self->_incidentEvents;
  v8 = v4;
  if (!incidentEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_incidentEvents;
    self->_incidentEvents = v6;

    v4 = v8;
    incidentEvents = self->_incidentEvents;
  }
  -[NSMutableArray addObject:](incidentEvents, "addObject:", v4);

}

- (unint64_t)incidentEventsCount
{
  return -[NSMutableArray count](self->_incidentEvents, "count");
}

- (id)incidentEventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_incidentEvents, "objectAtIndex:", a3);
}

+ (Class)incidentEventsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasGroupIdentifier
{
  return self->_groupIdentifier != 0;
}

- (void)setVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)dampeningType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_dampeningType;
  else
    return 1;
}

- (void)setDampeningType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_dampeningType = a3;
}

- (void)setHasDampeningType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDampeningType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)dampeningTypeAsString:(int)a3
{
  if ((a3 - 1) < 7)
    return off_1EA3B4CB8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDampeningType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TransientApproval")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HourlyQuotaExceeded")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DailyQuotaExceeded")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RandomizedSuppression")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnsatisfiedSystemPrerequisites")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UnsatisfiedCollectionRequirements")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AWDSymptomsDiagnosticIncidentReport;
  -[AWDSymptomsDiagnosticIncidentReport description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDSymptomsDiagnosticIncidentReport dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSString *identifier;
  NSString *domain;
  NSString *type;
  NSString *subtype;
  NSString *subtypeContext;
  NSString *detectedName;
  NSString *effectiveName;
  NSMutableArray *relatedNames;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSString *groupIdentifier;
  char v23;
  void *v24;
  unsigned int v25;
  __CFString *v26;
  void *v27;
  unsigned int v28;
  __CFString *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v28 = self->_handledResult - 1;
  if (v28 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_handledResult);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = off_1EA3B4C98[v28];
  }
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("handledResult"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_duration);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("duration"));

  }
LABEL_5:
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  type = self->_type;
  if (type)
    objc_msgSend(v3, "setObject:forKey:", type, CFSTR("type"));
  subtype = self->_subtype;
  if (subtype)
    objc_msgSend(v3, "setObject:forKey:", subtype, CFSTR("subtype"));
  subtypeContext = self->_subtypeContext;
  if (subtypeContext)
    objc_msgSend(v3, "setObject:forKey:", subtypeContext, CFSTR("subtypeContext"));
  detectedName = self->_detectedName;
  if (detectedName)
    objc_msgSend(v3, "setObject:forKey:", detectedName, CFSTR("detectedName"));
  effectiveName = self->_effectiveName;
  if (effectiveName)
    objc_msgSend(v3, "setObject:forKey:", effectiveName, CFSTR("effectiveName"));
  relatedNames = self->_relatedNames;
  if (relatedNames)
    objc_msgSend(v3, "setObject:forKey:", relatedNames, CFSTR("relatedNames"));
  PBRepeatedUInt64NSArray();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("timestampsIncidentEvents"));

  if (-[NSMutableArray count](self->_incidentEvents, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_incidentEvents, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v16 = self->_incidentEvents;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("incidentEvents"));
  }
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier)
    objc_msgSend(v3, "setObject:forKey:", groupIdentifier, CFSTR("groupIdentifier"));
  v23 = (char)self->_has;
  if ((v23 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_version);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("version"));

    v23 = (char)self->_has;
  }
  if ((v23 & 8) != 0)
  {
    v25 = self->_dampeningType - 1;
    if (v25 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dampeningType);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1EA3B4CB8[v25];
    }
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("dampeningType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSymptomsDiagnosticIncidentReportReadFrom(self, (uint64_t)a3);
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
  unint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_type)
    PBDataWriterWriteStringField();
  if (self->_subtype)
    PBDataWriterWriteStringField();
  if (self->_subtypeContext)
    PBDataWriterWriteStringField();
  if (self->_detectedName)
    PBDataWriterWriteStringField();
  if (self->_effectiveName)
    PBDataWriterWriteStringField();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_relatedNames;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  if (self->_timestampsIncidentEvents.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v11;
    }
    while (v11 < self->_timestampsIncidentEvents.count);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = self->_incidentEvents;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  if (self->_groupIdentifier)
    PBDataWriterWriteStringField();
  v17 = (char)self->_has;
  if ((v17 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v17 = (char)self->_has;
  }
  if ((v17 & 8) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  char v17;
  id v18;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_timestamp;
    *((_BYTE *)v4 + 152) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 24) = self->_handledResult;
  *((_BYTE *)v4 + 152) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4[4] = self->_duration;
    *((_BYTE *)v4 + 152) |= 1u;
  }
LABEL_5:
  v18 = v4;
  if (self->_identifier)
    objc_msgSend(v4, "setIdentifier:");
  if (self->_domain)
    objc_msgSend(v18, "setDomain:");
  if (self->_type)
    objc_msgSend(v18, "setType:");
  if (self->_subtype)
    objc_msgSend(v18, "setSubtype:");
  if (self->_subtypeContext)
    objc_msgSend(v18, "setSubtypeContext:");
  if (self->_detectedName)
    objc_msgSend(v18, "setDetectedName:");
  if (self->_effectiveName)
    objc_msgSend(v18, "setEffectiveName:");
  if (-[AWDSymptomsDiagnosticIncidentReport relatedNamesCount](self, "relatedNamesCount"))
  {
    objc_msgSend(v18, "clearRelatedNames");
    v6 = -[AWDSymptomsDiagnosticIncidentReport relatedNamesCount](self, "relatedNamesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[AWDSymptomsDiagnosticIncidentReport relatedNamesAtIndex:](self, "relatedNamesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addRelatedNames:", v9);

      }
    }
  }
  if (-[AWDSymptomsDiagnosticIncidentReport timestampsIncidentEventsCount](self, "timestampsIncidentEventsCount"))
  {
    objc_msgSend(v18, "clearTimestampsIncidentEvents");
    v10 = -[AWDSymptomsDiagnosticIncidentReport timestampsIncidentEventsCount](self, "timestampsIncidentEventsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(v18, "addTimestampsIncidentEvents:", -[AWDSymptomsDiagnosticIncidentReport timestampsIncidentEventsAtIndex:](self, "timestampsIncidentEventsAtIndex:", j));
    }
  }
  if (-[AWDSymptomsDiagnosticIncidentReport incidentEventsCount](self, "incidentEventsCount"))
  {
    objc_msgSend(v18, "clearIncidentEvents");
    v13 = -[AWDSymptomsDiagnosticIncidentReport incidentEventsCount](self, "incidentEventsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[AWDSymptomsDiagnosticIncidentReport incidentEventsAtIndex:](self, "incidentEventsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addIncidentEvents:", v16);

      }
    }
  }
  if (self->_groupIdentifier)
    objc_msgSend(v18, "setGroupIdentifier:");
  v17 = (char)self->_has;
  if ((v17 & 4) != 0)
  {
    *((_QWORD *)v18 + 6) = self->_version;
    *((_BYTE *)v18 + 152) |= 4u;
    v17 = (char)self->_has;
  }
  if ((v17 & 8) != 0)
  {
    *((_DWORD *)v18 + 14) = self->_dampeningType;
    *((_BYTE *)v18 + 152) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  void *v35;
  char v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_timestamp;
    *(_BYTE *)(v5 + 152) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 96) = self->_handledResult;
  *(_BYTE *)(v5 + 152) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 32) = self->_duration;
    *(_BYTE *)(v5 + 152) |= 1u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v8;

  v10 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v10;

  v12 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v12;

  v14 = -[NSString copyWithZone:](self->_subtype, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v14;

  v16 = -[NSString copyWithZone:](self->_subtypeContext, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v16;

  v18 = -[NSString copyWithZone:](self->_detectedName, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v18;

  v20 = -[NSString copyWithZone:](self->_effectiveName, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v20;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v22 = self->_relatedNames;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v43 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRelatedNames:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v24);
  }

  PBRepeatedUInt64Copy();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v28 = self->_incidentEvents;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v38);
        objc_msgSend((id)v6, "addIncidentEvents:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v30);
  }

  v34 = -[NSString copyWithZone:](self->_groupIdentifier, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v34;

  v36 = (char)self->_has;
  if ((v36 & 4) != 0)
  {
    *(_QWORD *)(v6 + 48) = self->_version;
    *(_BYTE *)(v6 + 152) |= 4u;
    v36 = (char)self->_has;
  }
  if ((v36 & 8) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_dampeningType;
    *(_BYTE *)(v6 + 152) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *domain;
  NSString *type;
  NSString *subtype;
  NSString *subtypeContext;
  NSString *detectedName;
  NSString *effectiveName;
  NSMutableArray *relatedNames;
  NSMutableArray *incidentEvents;
  NSString *groupIdentifier;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 5))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 152) & 2) != 0)
  {
LABEL_47:
    v15 = 0;
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 0x10) == 0 || self->_handledResult != *((_DWORD *)v4 + 24))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 152) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 1) == 0 || self->_duration != *((_QWORD *)v4 + 4))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 152) & 1) != 0)
  {
    goto LABEL_47;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](identifier, "isEqual:"))
  {
    goto LABEL_47;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](domain, "isEqual:"))
      goto LABEL_47;
  }
  type = self->_type;
  if ((unint64_t)type | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](type, "isEqual:"))
      goto LABEL_47;
  }
  subtype = self->_subtype;
  if ((unint64_t)subtype | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](subtype, "isEqual:"))
      goto LABEL_47;
  }
  subtypeContext = self->_subtypeContext;
  if ((unint64_t)subtypeContext | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](subtypeContext, "isEqual:"))
      goto LABEL_47;
  }
  detectedName = self->_detectedName;
  if ((unint64_t)detectedName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](detectedName, "isEqual:"))
      goto LABEL_47;
  }
  effectiveName = self->_effectiveName;
  if ((unint64_t)effectiveName | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](effectiveName, "isEqual:"))
      goto LABEL_47;
  }
  relatedNames = self->_relatedNames;
  if ((unint64_t)relatedNames | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](relatedNames, "isEqual:"))
      goto LABEL_47;
  }
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_47;
  incidentEvents = self->_incidentEvents;
  if ((unint64_t)incidentEvents | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](incidentEvents, "isEqual:"))
      goto LABEL_47;
  }
  groupIdentifier = self->_groupIdentifier;
  if ((unint64_t)groupIdentifier | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](groupIdentifier, "isEqual:"))
      goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 4) == 0 || self->_version != *((_QWORD *)v4 + 6))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 152) & 4) != 0)
  {
    goto LABEL_47;
  }
  v15 = (*((_BYTE *)v4 + 152) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 8) == 0 || self->_dampeningType != *((_DWORD *)v4 + 14))
      goto LABEL_47;
    v15 = 1;
  }
LABEL_48:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  uint64_t v13;
  NSUInteger v15;
  NSUInteger v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v19 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
LABEL_6:
    v18 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v19 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_6;
LABEL_3:
  v18 = 2654435761 * self->_handledResult;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v17 = 2654435761u * self->_duration;
    goto LABEL_8;
  }
LABEL_7:
  v17 = 0;
LABEL_8:
  v16 = -[NSString hash](self->_identifier, "hash");
  v15 = -[NSString hash](self->_domain, "hash");
  v3 = -[NSString hash](self->_type, "hash");
  v4 = -[NSString hash](self->_subtype, "hash");
  v5 = -[NSString hash](self->_subtypeContext, "hash");
  v6 = -[NSString hash](self->_detectedName, "hash");
  v7 = -[NSString hash](self->_effectiveName, "hash");
  v8 = -[NSMutableArray hash](self->_relatedNames, "hash");
  v9 = PBRepeatedUInt64Hash();
  v10 = -[NSMutableArray hash](self->_incidentEvents, "hash");
  v11 = -[NSString hash](self->_groupIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v12 = 2654435761u * self->_version;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_10;
LABEL_12:
    v13 = 0;
    return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  v12 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_10:
  v13 = 2654435761 * self->_dampeningType;
  return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 152);
  if ((v6 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 152);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 152) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_handledResult = *((_DWORD *)v4 + 24);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 152) & 1) != 0)
  {
LABEL_4:
    self->_duration = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 13))
    -[AWDSymptomsDiagnosticIncidentReport setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)v5 + 9))
    -[AWDSymptomsDiagnosticIncidentReport setDomain:](self, "setDomain:");
  if (*((_QWORD *)v5 + 18))
    -[AWDSymptomsDiagnosticIncidentReport setType:](self, "setType:");
  if (*((_QWORD *)v5 + 16))
    -[AWDSymptomsDiagnosticIncidentReport setSubtype:](self, "setSubtype:");
  if (*((_QWORD *)v5 + 17))
    -[AWDSymptomsDiagnosticIncidentReport setSubtypeContext:](self, "setSubtypeContext:");
  if (*((_QWORD *)v5 + 8))
    -[AWDSymptomsDiagnosticIncidentReport setDetectedName:](self, "setDetectedName:");
  if (*((_QWORD *)v5 + 10))
    -[AWDSymptomsDiagnosticIncidentReport setEffectiveName:](self, "setEffectiveName:");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = *((id *)v5 + 15);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        -[AWDSymptomsDiagnosticIncidentReport addRelatedNames:](self, "addRelatedNames:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  v12 = objc_msgSend(v5, "timestampsIncidentEventsCount");
  if (v12)
  {
    v13 = v12;
    for (j = 0; j != v13; ++j)
      -[AWDSymptomsDiagnosticIncidentReport addTimestampsIncidentEvents:](self, "addTimestampsIncidentEvents:", objc_msgSend(v5, "timestampsIncidentEventsAtIndex:", j));
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = *((id *)v5 + 14);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        -[AWDSymptomsDiagnosticIncidentReport addIncidentEvents:](self, "addIncidentEvents:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

  if (*((_QWORD *)v5 + 11))
    -[AWDSymptomsDiagnosticIncidentReport setGroupIdentifier:](self, "setGroupIdentifier:");
  v20 = *((_BYTE *)v5 + 152);
  if ((v20 & 4) != 0)
  {
    self->_version = *((_QWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 4u;
    v20 = *((_BYTE *)v5 + 152);
  }
  if ((v20 & 8) != 0)
  {
    self->_dampeningType = *((_DWORD *)v5 + 14);
    *(_BYTE *)&self->_has |= 8u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(id)a3
{
  objc_storeStrong((id *)&self->_subtype, a3);
}

- (NSString)subtypeContext
{
  return self->_subtypeContext;
}

- (void)setSubtypeContext:(id)a3
{
  objc_storeStrong((id *)&self->_subtypeContext, a3);
}

- (NSString)detectedName
{
  return self->_detectedName;
}

- (void)setDetectedName:(id)a3
{
  objc_storeStrong((id *)&self->_detectedName, a3);
}

- (NSString)effectiveName
{
  return self->_effectiveName;
}

- (void)setEffectiveName:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveName, a3);
}

- (NSMutableArray)relatedNames
{
  return self->_relatedNames;
}

- (void)setRelatedNames:(id)a3
{
  objc_storeStrong((id *)&self->_relatedNames, a3);
}

- (NSMutableArray)incidentEvents
{
  return self->_incidentEvents;
}

- (void)setIncidentEvents:(id)a3
{
  objc_storeStrong((id *)&self->_incidentEvents, a3);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_subtypeContext, 0);
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_relatedNames, 0);
  objc_storeStrong((id *)&self->_incidentEvents, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_effectiveName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_detectedName, 0);
}

@end
