@implementation HDCodableWorkoutActivity

+ (id)codableForWorkoutActivity:(id)a3
{
  id v4;
  HDCodableWorkoutActivity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = objc_alloc_init(HDCodableWorkoutActivity);
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutActivity setUuid:](v5, "setUuid:", v7);

  objc_msgSend(v4, "workoutConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCodableWorkoutActivity setConfiguration:](v5, "setConfiguration:", v9);
  objc_msgSend(v4, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  -[HDCodableWorkoutActivity setStartDate:](v5, "setStartDate:");

  objc_msgSend(v4, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    -[HDCodableWorkoutActivity setEndDate:](v5, "setEndDate:");

  }
  objc_msgSend(v4, "duration");
  -[HDCodableWorkoutActivity setDuration:](v5, "setDuration:");
  objc_msgSend(v4, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_codableMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableWorkoutActivity setMetadata:](v5, "setMetadata:", v15);

  }
  objc_msgSend(a1, "codableStatisticsForActivity:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutActivity setStatistics:](v5, "setStatistics:", v16);

  return v5;
}

+ (id)codablesForWorkoutActivities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "codableForWorkoutActivity:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)codableStatisticsForActivity:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  HDCodableWorkoutStatistics *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "allStatistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v3, "allStatistics", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v3, "statisticsForType:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = objc_alloc_init(HDCodableWorkoutStatistics);
          objc_msgSend(v12, "quantityType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableWorkoutStatistics setQuantityType:](v13, "setQuantityType:", objc_msgSend(v14, "code"));

          objc_msgSend(v12, "quantityType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "canonicalUnit");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "sumQuantity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v12, "sumQuantity");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "doubleValueForUnit:", v16);
            -[HDCodableWorkoutStatistics setSumQuantity:](v13, "setSumQuantity:");

          }
          objc_msgSend(v12, "minimumQuantity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v12, "minimumQuantity");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "doubleValueForUnit:", v16);
            -[HDCodableWorkoutStatistics setMinQuantity:](v13, "setMinQuantity:");

          }
          objc_msgSend(v12, "maximumQuantity");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v12, "maximumQuantity");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "doubleValueForUnit:", v16);
            -[HDCodableWorkoutStatistics setMaxQuantity:](v13, "setMaxQuantity:");

          }
          objc_msgSend(v12, "averageQuantity");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v12, "averageQuantity");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "doubleValueForUnit:", v16);
            -[HDCodableWorkoutStatistics setAvgQuantity:](v13, "setAvgQuantity:");

          }
          objc_msgSend(v6, "addObject:", v13);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
}

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (void)setDuration:(double)a3
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

- (void)clearStatistics
{
  -[NSMutableArray removeAllObjects](self->_statistics, "removeAllObjects");
}

- (void)addStatistics:(id)a3
{
  id v4;
  NSMutableArray *statistics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  statistics = self->_statistics;
  v8 = v4;
  if (!statistics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_statistics;
    self->_statistics = v6;

    v4 = v8;
    statistics = self->_statistics;
  }
  -[NSMutableArray addObject:](statistics, "addObject:", v4);

}

- (unint64_t)statisticsCount
{
  return -[NSMutableArray count](self->_statistics, "count");
}

- (id)statisticsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_statistics, "objectAtIndex:", a3);
}

+ (Class)statisticsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)HDCodableWorkoutActivity;
  -[HDCodableWorkoutActivity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutActivity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuid;
  HDCodableWorkoutConfiguration *configuration;
  void *v7;
  char has;
  void *v9;
  void *v10;
  HDCodableMetadataDictionary *metadata;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  configuration = self->_configuration;
  if (configuration)
  {
    -[HDCodableWorkoutConfiguration dictionaryRepresentation](configuration, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("configuration"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("startDate"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("endDate"));

  }
  metadata = self->_metadata;
  if (metadata)
  {
    -[HDCodableMetadataDictionary dictionaryRepresentation](metadata, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("metadata"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("duration"));

  }
  if (-[NSMutableArray count](self->_statistics, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_statistics, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = self->_statistics;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("statistics"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutActivityReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_uuid)
    PBDataWriterWriteStringField();
  if (self->_configuration)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_metadata)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_statistics;
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

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v10;
  }
  if (self->_configuration)
  {
    objc_msgSend(v10, "setConfiguration:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_startDate;
    *((_BYTE *)v4 + 64) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_endDate;
    *((_BYTE *)v4 + 64) |= 2u;
  }
  if (self->_metadata)
  {
    objc_msgSend(v10, "setMetadata:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_duration;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (-[HDCodableWorkoutActivity statisticsCount](self, "statisticsCount"))
  {
    objc_msgSend(v10, "clearStatistics");
    v6 = -[HDCodableWorkoutActivity statisticsCount](self, "statisticsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[HDCodableWorkoutActivity statisticsAtIndex:](self, "statisticsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addStatistics:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char has;
  id v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[HDCodableWorkoutConfiguration copyWithZone:](self->_configuration, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_startDate;
    *(_BYTE *)(v5 + 64) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_endDate;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v11 = -[HDCodableMetadataDictionary copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_duration;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_statistics;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend((id)v5, "addStatistics:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuid;
  HDCodableWorkoutConfiguration *configuration;
  char has;
  char v8;
  HDCodableMetadataDictionary *metadata;
  NSMutableArray *statistics;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_26;
  }
  configuration = self->_configuration;
  if ((unint64_t)configuration | *((_QWORD *)v4 + 4))
  {
    if (!-[HDCodableWorkoutConfiguration isEqual:](configuration, "isEqual:"))
      goto LABEL_26;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 64);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_startDate != *((double *)v4 + 3))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_endDate != *((double *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_26;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 5))
  {
    if (!-[HDCodableMetadataDictionary isEqual:](metadata, "isEqual:"))
    {
LABEL_26:
      v11 = 0;
      goto LABEL_27;
    }
    has = (char)self->_has;
    v8 = *((_BYTE *)v4 + 64);
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_duration != *((double *)v4 + 1))
      goto LABEL_26;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_26;
  }
  statistics = self->_statistics;
  if ((unint64_t)statistics | *((_QWORD *)v4 + 6))
    v11 = -[NSMutableArray isEqual:](statistics, "isEqual:");
  else
    v11 = 1;
LABEL_27:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  char has;
  unint64_t v6;
  double startDate;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double endDate;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  double duration;
  double v19;
  long double v20;
  double v21;

  v3 = -[NSString hash](self->_uuid, "hash");
  v4 = -[HDCodableWorkoutConfiguration hash](self->_configuration, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    startDate = self->_startDate;
    v8 = -startDate;
    if (startDate >= 0.0)
      v8 = self->_startDate;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 2) != 0)
  {
    endDate = self->_endDate;
    v13 = -endDate;
    if (endDate >= 0.0)
      v13 = self->_endDate;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  v16 = -[HDCodableMetadataDictionary hash](self->_metadata, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    duration = self->_duration;
    v19 = -duration;
    if (duration >= 0.0)
      v19 = self->_duration;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17 ^ -[NSMutableArray hash](self->_statistics, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableWorkoutConfiguration *configuration;
  uint64_t v6;
  char v7;
  HDCodableMetadataDictionary *metadata;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 7))
    -[HDCodableWorkoutActivity setUuid:](self, "setUuid:");
  configuration = self->_configuration;
  v6 = *((_QWORD *)v4 + 4);
  if (configuration)
  {
    if (v6)
      -[HDCodableWorkoutConfiguration mergeFrom:](configuration, "mergeFrom:");
  }
  else if (v6)
  {
    -[HDCodableWorkoutActivity setConfiguration:](self, "setConfiguration:");
  }
  v7 = *((_BYTE *)v4 + 64);
  if ((v7 & 4) != 0)
  {
    self->_startDate = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v7 = *((_BYTE *)v4 + 64);
  }
  if ((v7 & 2) != 0)
  {
    self->_endDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  metadata = self->_metadata;
  v9 = *((_QWORD *)v4 + 5);
  if (metadata)
  {
    if (v9)
      -[HDCodableMetadataDictionary mergeFrom:](metadata, "mergeFrom:");
  }
  else if (v9)
  {
    -[HDCodableWorkoutActivity setMetadata:](self, "setMetadata:");
  }
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_duration = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 6);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[HDCodableWorkoutActivity addStatistics:](self, "addStatistics:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (HDCodableWorkoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HDCodableMetadataDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (double)duration
{
  return self->_duration;
}

- (NSMutableArray)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_statistics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
