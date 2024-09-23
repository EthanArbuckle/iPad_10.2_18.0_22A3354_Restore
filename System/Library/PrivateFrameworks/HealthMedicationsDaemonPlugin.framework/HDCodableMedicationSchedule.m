@implementation HDCodableMedicationSchedule

- (id)decodedUUID
{
  void *v2;

  if (self->_uuid)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)decodedMedicationUUID
{
  void *v2;

  if (self->_medicationUUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasMedicationIdentifier
{
  return self->_medicationIdentifier != 0;
}

- (void)setStartDateTime:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_startDateTime = a3;
}

- (void)setHasStartDateTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStartDateTime
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setEndDateTime:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_endDateTime = a3;
}

- (void)setHasEndDateTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndDateTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasCreatedTimeZone
{
  return self->_createdTimeZone != 0;
}

- (void)setFrequencyType:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_frequencyType = a3;
}

- (void)setHasFrequencyType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFrequencyType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasCycleStartDateComponents
{
  return self->_cycleStartDateComponents != 0;
}

- (BOOL)hasNote
{
  return self->_note != 0;
}

- (BOOL)hasMedicationUUID
{
  return self->_medicationUUID != 0;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasDeleted
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasCompatibilityVersionRange
{
  return self->_compatibilityVersionRange != 0;
}

- (void)setScheduleType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_scheduleType = a3;
}

- (void)setHasScheduleType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasScheduleType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDisplayOptions:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_displayOptions = a3;
}

- (void)setHasDisplayOptions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDisplayOptions
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearIntervalDatas
{
  -[NSMutableArray removeAllObjects](self->_intervalDatas, "removeAllObjects");
}

- (void)addIntervalData:(id)a3
{
  id v4;
  NSMutableArray *intervalDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  intervalDatas = self->_intervalDatas;
  v8 = v4;
  if (!intervalDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_intervalDatas;
    self->_intervalDatas = v6;

    v4 = v8;
    intervalDatas = self->_intervalDatas;
  }
  -[NSMutableArray addObject:](intervalDatas, "addObject:", v4);

}

- (unint64_t)intervalDatasCount
{
  return -[NSMutableArray count](self->_intervalDatas, "count");
}

- (id)intervalDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_intervalDatas, "objectAtIndex:", a3);
}

+ (Class)intervalDataType
{
  return (Class)objc_opt_class();
}

- (void)setDuplicate:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_duplicate = a3;
}

- (void)setHasDuplicate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasDuplicate
{
  return *(_BYTE *)&self->_has >> 7;
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
  v8.super_class = (Class)HDCodableMedicationSchedule;
  -[HDCodableMedicationSchedule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationSchedule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *uuid;
  NSString *medicationIdentifier;
  char has;
  void *v8;
  void *v9;
  NSString *createdTimeZone;
  void *v11;
  HDCodableDateComponents *cycleStartDateComponents;
  void *v13;
  NSString *note;
  NSData *medicationUUID;
  char v16;
  void *v17;
  void *v18;
  HDCodableSyncIdentity *syncIdentity;
  void *v20;
  HDCodableMedicationScheduleCompatibilityVersionRange *compatibilityVersionRange;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  medicationIdentifier = self->_medicationIdentifier;
  if (medicationIdentifier)
    objc_msgSend(v4, "setObject:forKey:", medicationIdentifier, CFSTR("medicationIdentifier"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDateTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("startDateTime"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDateTime);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("endDateTime"));

  }
  createdTimeZone = self->_createdTimeZone;
  if (createdTimeZone)
    objc_msgSend(v4, "setObject:forKey:", createdTimeZone, CFSTR("createdTimeZone"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_frequencyType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("frequencyType"));

  }
  cycleStartDateComponents = self->_cycleStartDateComponents;
  if (cycleStartDateComponents)
  {
    -[HDCodableDateComponents dictionaryRepresentation](cycleStartDateComponents, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("cycleStartDateComponents"));

  }
  note = self->_note;
  if (note)
    objc_msgSend(v4, "setObject:forKey:", note, CFSTR("note"));
  medicationUUID = self->_medicationUUID;
  if (medicationUUID)
    objc_msgSend(v4, "setObject:forKey:", medicationUUID, CFSTR("medicationUUID"));
  v16 = (char)self->_has;
  if ((v16 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("creationDate"));

    v16 = (char)self->_has;
  }
  if ((v16 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("deleted"));

  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("syncIdentity"));

  }
  compatibilityVersionRange = self->_compatibilityVersionRange;
  if (compatibilityVersionRange)
  {
    -[HDCodableMedicationScheduleCompatibilityVersionRange dictionaryRepresentation](compatibilityVersionRange, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("compatibilityVersionRange"));

  }
  v23 = (char)self->_has;
  if ((v23 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_scheduleType);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("scheduleType"));

    v23 = (char)self->_has;
  }
  if ((v23 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_displayOptions);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("displayOptions"));

  }
  if (-[NSMutableArray count](self->_intervalDatas, "count"))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_intervalDatas, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v27 = self->_intervalDatas;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v36 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v35);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32);

        }
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v29);
    }

    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("intervalData"));
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_duplicate);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("duplicate"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationScheduleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  char v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uuid)
    PBDataWriterWriteDataField();
  if (self->_medicationIdentifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_createdTimeZone)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_cycleStartDateComponents)
    PBDataWriterWriteSubmessage();
  if (self->_note)
    PBDataWriterWriteStringField();
  if (self->_medicationUUID)
    PBDataWriterWriteDataField();
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = (char)self->_has;
  }
  if ((v6 & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_syncIdentity)
    PBDataWriterWriteSubmessage();
  if (self->_compatibilityVersionRange)
    PBDataWriterWriteSubmessage();
  v7 = (char)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteInt64Field();
    v7 = (char)self->_has;
  }
  if ((v7 & 2) != 0)
    PBDataWriterWriteInt64Field();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_intervalDatas;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  char v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  _BYTE *v12;

  v4 = a3;
  v12 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v12;
  }
  if (self->_medicationIdentifier)
  {
    objc_msgSend(v12, "setMedicationIdentifier:");
    v4 = v12;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_startDateTime;
    v4[132] |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_endDateTime;
    v4[132] |= 4u;
  }
  if (self->_createdTimeZone)
  {
    objc_msgSend(v12, "setCreatedTimeZone:");
    v4 = v12;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_frequencyType;
    v4[132] |= 8u;
  }
  if (self->_cycleStartDateComponents)
  {
    objc_msgSend(v12, "setCycleStartDateComponents:");
    v4 = v12;
  }
  if (self->_note)
  {
    objc_msgSend(v12, "setNote:");
    v4 = v12;
  }
  if (self->_medicationUUID)
  {
    objc_msgSend(v12, "setMedicationUUID:");
    v4 = v12;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_creationDate;
    v4[132] |= 1u;
    v6 = (char)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    v4[128] = self->_deleted;
    v4[132] |= 0x40u;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v12, "setSyncIdentity:");
    v4 = v12;
  }
  if (self->_compatibilityVersionRange)
  {
    objc_msgSend(v12, "setCompatibilityVersionRange:");
    v4 = v12;
  }
  v7 = (char)self->_has;
  if ((v7 & 0x10) != 0)
  {
    *((_QWORD *)v4 + 5) = self->_scheduleType;
    v4[132] |= 0x10u;
    v7 = (char)self->_has;
  }
  if ((v7 & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_displayOptions;
    v4[132] |= 2u;
  }
  if (-[HDCodableMedicationSchedule intervalDatasCount](self, "intervalDatasCount"))
  {
    objc_msgSend(v12, "clearIntervalDatas");
    v8 = -[HDCodableMedicationSchedule intervalDatasCount](self, "intervalDatasCount");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        -[HDCodableMedicationSchedule intervalDataAtIndex:](self, "intervalDataAtIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addIntervalData:", v11);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    v12[129] = self->_duplicate;
    v12[132] |= 0x80u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  char v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v6;

  v8 = -[NSString copyWithZone:](self->_medicationIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v8;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_startDateTime;
    *(_BYTE *)(v5 + 132) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_endDateTime;
    *(_BYTE *)(v5 + 132) |= 4u;
  }
  v11 = -[NSString copyWithZone:](self->_createdTimeZone, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_frequencyType;
    *(_BYTE *)(v5 + 132) |= 8u;
  }
  v13 = -[HDCodableDateComponents copyWithZone:](self->_cycleStartDateComponents, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v13;

  v15 = -[NSString copyWithZone:](self->_note, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v15;

  v17 = -[NSData copyWithZone:](self->_medicationUUID, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v17;

  v19 = (char)self->_has;
  if ((v19 & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(_BYTE *)(v5 + 132) |= 1u;
    v19 = (char)self->_has;
  }
  if ((v19 & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 128) = self->_deleted;
    *(_BYTE *)(v5 + 132) |= 0x40u;
  }
  v20 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v20;

  v22 = -[HDCodableMedicationScheduleCompatibilityVersionRange copyWithZone:](self->_compatibilityVersionRange, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v22;

  v24 = (char)self->_has;
  if ((v24 & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_scheduleType;
    *(_BYTE *)(v5 + 132) |= 0x10u;
    v24 = (char)self->_has;
  }
  if ((v24 & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_displayOptions;
    *(_BYTE *)(v5 + 132) |= 2u;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v25 = self->_intervalDatas;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v33 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend((id)v5, "addIntervalData:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v27);
  }

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *(_BYTE *)(v5 + 129) = self->_duplicate;
    *(_BYTE *)(v5 + 132) |= 0x80u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSData *uuid;
  NSString *medicationIdentifier;
  char has;
  NSString *createdTimeZone;
  HDCodableDateComponents *cycleStartDateComponents;
  NSString *note;
  NSData *medicationUUID;
  HDCodableSyncIdentity *syncIdentity;
  HDCodableMedicationScheduleCompatibilityVersionRange *compatibilityVersionRange;
  char v14;
  NSMutableArray *intervalDatas;
  int v16;
  BOOL v17;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_63;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 15))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_63;
  }
  medicationIdentifier = self->_medicationIdentifier;
  if ((unint64_t)medicationIdentifier | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](medicationIdentifier, "isEqual:"))
      goto LABEL_63;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((v4[132] & 0x20) == 0 || self->_startDateTime != *((double *)v4 + 6))
      goto LABEL_63;
  }
  else if ((v4[132] & 0x20) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[132] & 4) == 0 || self->_endDateTime != *((double *)v4 + 3))
      goto LABEL_63;
  }
  else if ((v4[132] & 4) != 0)
  {
    goto LABEL_63;
  }
  createdTimeZone = self->_createdTimeZone;
  if ((unint64_t)createdTimeZone | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](createdTimeZone, "isEqual:"))
      goto LABEL_63;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((v4[132] & 8) == 0 || self->_frequencyType != *((double *)v4 + 4))
      goto LABEL_63;
  }
  else if ((v4[132] & 8) != 0)
  {
    goto LABEL_63;
  }
  cycleStartDateComponents = self->_cycleStartDateComponents;
  if ((unint64_t)cycleStartDateComponents | *((_QWORD *)v4 + 9)
    && !-[HDCodableDateComponents isEqual:](cycleStartDateComponents, "isEqual:"))
  {
    goto LABEL_63;
  }
  note = self->_note;
  if ((unint64_t)note | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](note, "isEqual:"))
      goto LABEL_63;
  }
  medicationUUID = self->_medicationUUID;
  if ((unint64_t)medicationUUID | *((_QWORD *)v4 + 12))
  {
    if (!-[NSData isEqual:](medicationUUID, "isEqual:"))
      goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[132] & 1) == 0 || self->_creationDate != *((double *)v4 + 1))
      goto LABEL_63;
  }
  else if ((v4[132] & 1) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[132] & 0x40) == 0)
      goto LABEL_63;
    if (self->_deleted)
    {
      if (!v4[128])
        goto LABEL_63;
    }
    else if (v4[128])
    {
      goto LABEL_63;
    }
  }
  else if ((v4[132] & 0x40) != 0)
  {
    goto LABEL_63;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 14)
    && !-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
  {
    goto LABEL_63;
  }
  compatibilityVersionRange = self->_compatibilityVersionRange;
  if ((unint64_t)compatibilityVersionRange | *((_QWORD *)v4 + 7))
  {
    if (!-[HDCodableMedicationScheduleCompatibilityVersionRange isEqual:](compatibilityVersionRange, "isEqual:"))
      goto LABEL_63;
  }
  v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
  {
    if ((v4[132] & 0x10) == 0 || self->_scheduleType != *((_QWORD *)v4 + 5))
      goto LABEL_63;
  }
  else if ((v4[132] & 0x10) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[132] & 2) == 0 || self->_displayOptions != *((_QWORD *)v4 + 2))
      goto LABEL_63;
  }
  else if ((v4[132] & 2) != 0)
  {
    goto LABEL_63;
  }
  intervalDatas = self->_intervalDatas;
  if ((unint64_t)intervalDatas | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](intervalDatas, "isEqual:"))
      goto LABEL_63;
    v14 = (char)self->_has;
  }
  v16 = v4[132];
  if (v14 < 0)
  {
    if (v16 < 0)
    {
      if (self->_duplicate)
      {
        if (!v4[129])
          goto LABEL_63;
      }
      else if (v4[129])
      {
        goto LABEL_63;
      }
      v17 = 1;
      goto LABEL_64;
    }
LABEL_63:
    v17 = 0;
    goto LABEL_64;
  }
  v17 = v16 >= 0;
LABEL_64:

  return v17;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double startDateTime;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double endDateTime;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double frequencyType;
  double v16;
  long double v17;
  double v18;
  char v19;
  unint64_t v20;
  double creationDate;
  double v22;
  long double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  NSUInteger v35;
  uint64_t v36;
  NSUInteger v37;
  unint64_t v38;
  unint64_t v39;
  NSUInteger v40;
  uint64_t v41;

  v41 = -[NSData hash](self->_uuid, "hash");
  v40 = -[NSString hash](self->_medicationIdentifier, "hash");
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    startDateTime = self->_startDateTime;
    v6 = -startDateTime;
    if (startDateTime >= 0.0)
      v6 = self->_startDateTime;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v39 = v4;
  if ((has & 4) != 0)
  {
    endDateTime = self->_endDateTime;
    v11 = -endDateTime;
    if (endDateTime >= 0.0)
      v11 = self->_endDateTime;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v38 = v9;
  v37 = -[NSString hash](self->_createdTimeZone, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    frequencyType = self->_frequencyType;
    v16 = -frequencyType;
    if (frequencyType >= 0.0)
      v16 = self->_frequencyType;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  v36 = -[HDCodableDateComponents hash](self->_cycleStartDateComponents, "hash");
  v35 = -[NSString hash](self->_note, "hash");
  v33 = -[NSData hash](self->_medicationUUID, "hash");
  v19 = (char)self->_has;
  if ((v19 & 1) != 0)
  {
    creationDate = self->_creationDate;
    v22 = -creationDate;
    if (creationDate >= 0.0)
      v22 = self->_creationDate;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((v19 & 0x40) != 0)
    v25 = 2654435761 * self->_deleted;
  else
    v25 = 0;
  v26 = -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash", v33);
  v27 = -[HDCodableMedicationScheduleCompatibilityVersionRange hash](self->_compatibilityVersionRange, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v28 = 2654435761 * self->_scheduleType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_38;
  }
  else
  {
    v28 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_38:
      v29 = 2654435761 * self->_displayOptions;
      goto LABEL_41;
    }
  }
  v29 = 0;
LABEL_41:
  v30 = -[NSMutableArray hash](self->_intervalDatas, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v31 = 2654435761 * self->_duplicate;
  else
    v31 = 0;
  return v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v14 ^ v36 ^ v35 ^ v34 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char v5;
  HDCodableDateComponents *cycleStartDateComponents;
  uint64_t v7;
  char v8;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v10;
  HDCodableMedicationScheduleCompatibilityVersionRange *compatibilityVersionRange;
  uint64_t v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (*((_QWORD *)v4 + 15))
    -[HDCodableMedicationSchedule setUuid:](self, "setUuid:");
  if (*((_QWORD *)v4 + 11))
    -[HDCodableMedicationSchedule setMedicationIdentifier:](self, "setMedicationIdentifier:");
  v5 = v4[132];
  if ((v5 & 0x20) != 0)
  {
    self->_startDateTime = *((double *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = v4[132];
  }
  if ((v5 & 4) != 0)
  {
    self->_endDateTime = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 8))
    -[HDCodableMedicationSchedule setCreatedTimeZone:](self, "setCreatedTimeZone:");
  if ((v4[132] & 8) != 0)
  {
    self->_frequencyType = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  cycleStartDateComponents = self->_cycleStartDateComponents;
  v7 = *((_QWORD *)v4 + 9);
  if (cycleStartDateComponents)
  {
    if (v7)
      -[HDCodableDateComponents mergeFrom:](cycleStartDateComponents, "mergeFrom:");
  }
  else if (v7)
  {
    -[HDCodableMedicationSchedule setCycleStartDateComponents:](self, "setCycleStartDateComponents:");
  }
  if (*((_QWORD *)v4 + 13))
    -[HDCodableMedicationSchedule setNote:](self, "setNote:");
  if (*((_QWORD *)v4 + 12))
    -[HDCodableMedicationSchedule setMedicationUUID:](self, "setMedicationUUID:");
  v8 = v4[132];
  if ((v8 & 1) != 0)
  {
    self->_creationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v8 = v4[132];
  }
  if ((v8 & 0x40) != 0)
  {
    self->_deleted = v4[128];
    *(_BYTE *)&self->_has |= 0x40u;
  }
  syncIdentity = self->_syncIdentity;
  v10 = *((_QWORD *)v4 + 14);
  if (syncIdentity)
  {
    if (v10)
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else if (v10)
  {
    -[HDCodableMedicationSchedule setSyncIdentity:](self, "setSyncIdentity:");
  }
  compatibilityVersionRange = self->_compatibilityVersionRange;
  v12 = *((_QWORD *)v4 + 7);
  if (compatibilityVersionRange)
  {
    if (v12)
      -[HDCodableMedicationScheduleCompatibilityVersionRange mergeFrom:](compatibilityVersionRange, "mergeFrom:");
  }
  else if (v12)
  {
    -[HDCodableMedicationSchedule setCompatibilityVersionRange:](self, "setCompatibilityVersionRange:");
  }
  v13 = v4[132];
  if ((v13 & 0x10) != 0)
  {
    self->_scheduleType = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
    v13 = v4[132];
  }
  if ((v13 & 2) != 0)
  {
    self->_displayOptions = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = *((id *)v4 + 10);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[HDCodableMedicationSchedule addIntervalData:](self, "addIntervalData:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

  if (v4[132] < 0)
  {
    self->_duplicate = v4[129];
    *(_BYTE *)&self->_has |= 0x80u;
  }

}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (void)setMedicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_medicationIdentifier, a3);
}

- (double)startDateTime
{
  return self->_startDateTime;
}

- (double)endDateTime
{
  return self->_endDateTime;
}

- (NSString)createdTimeZone
{
  return self->_createdTimeZone;
}

- (void)setCreatedTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_createdTimeZone, a3);
}

- (double)frequencyType
{
  return self->_frequencyType;
}

- (HDCodableDateComponents)cycleStartDateComponents
{
  return self->_cycleStartDateComponents;
}

- (void)setCycleStartDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_cycleStartDateComponents, a3);
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (NSData)medicationUUID
{
  return self->_medicationUUID;
}

- (void)setMedicationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_medicationUUID, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (HDCodableMedicationScheduleCompatibilityVersionRange)compatibilityVersionRange
{
  return self->_compatibilityVersionRange;
}

- (void)setCompatibilityVersionRange:(id)a3
{
  objc_storeStrong((id *)&self->_compatibilityVersionRange, a3);
}

- (int64_t)scheduleType
{
  return self->_scheduleType;
}

- (int64_t)displayOptions
{
  return self->_displayOptions;
}

- (NSMutableArray)intervalDatas
{
  return self->_intervalDatas;
}

- (void)setIntervalDatas:(id)a3
{
  objc_storeStrong((id *)&self->_intervalDatas, a3);
}

- (BOOL)duplicate
{
  return self->_duplicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_medicationUUID, 0);
  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
  objc_storeStrong((id *)&self->_intervalDatas, 0);
  objc_storeStrong((id *)&self->_cycleStartDateComponents, 0);
  objc_storeStrong((id *)&self->_createdTimeZone, 0);
  objc_storeStrong((id *)&self->_compatibilityVersionRange, 0);
}

@end
