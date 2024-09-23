@implementation HDCodableRacingCluster

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasWorkoutClusterUUID
{
  return self->_workoutClusterUUID != 0;
}

- (void)setRelevance:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_relevance = a3;
}

- (void)setHasRelevance:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRelevance
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setClusterSize:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_clusterSize = a3;
}

- (void)setHasClusterSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasClusterSize
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setActivityType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_activityType = a3;
}

- (void)setHasActivityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasActivityType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasRouteSnapshot
{
  return self->_routeSnapshot != 0;
}

- (BOOL)hasRouteLabel
{
  return self->_routeLabel != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasLastWorkoutMetrics
{
  return self->_lastWorkoutMetrics != 0;
}

- (BOOL)hasBestWorkoutMetrics
{
  return self->_bestWorkoutMetrics != 0;
}

- (void)setFinal:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_final = a3;
}

- (void)setHasFinal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFinal
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearEligibleClusterUUIDs
{
  -[NSMutableArray removeAllObjects](self->_eligibleClusterUUIDs, "removeAllObjects");
}

- (void)addEligibleClusterUUIDs:(id)a3
{
  id v4;
  NSMutableArray *eligibleClusterUUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  eligibleClusterUUIDs = self->_eligibleClusterUUIDs;
  v8 = v4;
  if (!eligibleClusterUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_eligibleClusterUUIDs;
    self->_eligibleClusterUUIDs = v6;

    v4 = v8;
    eligibleClusterUUIDs = self->_eligibleClusterUUIDs;
  }
  -[NSMutableArray addObject:](eligibleClusterUUIDs, "addObject:", v4);

}

- (unint64_t)eligibleClusterUUIDsCount
{
  return -[NSMutableArray count](self->_eligibleClusterUUIDs, "count");
}

- (id)eligibleClusterUUIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_eligibleClusterUUIDs, "objectAtIndex:", a3);
}

+ (Class)eligibleClusterUUIDsType
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
  v8.super_class = (Class)HDCodableRacingCluster;
  -[HDCodableRacingCluster description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableRacingCluster dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *workoutClusterUUID;
  char has;
  void *v8;
  NSData *routeSnapshot;
  NSString *routeLabel;
  HDCodableSyncIdentity *syncIdentity;
  void *v12;
  HDCodableRacingMetrics *lastWorkoutMetrics;
  void *v14;
  HDCodableRacingMetrics *bestWorkoutMetrics;
  void *v16;
  void *v17;
  NSMutableArray *eligibleClusterUUIDs;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  workoutClusterUUID = self->_workoutClusterUUID;
  if (workoutClusterUUID)
    objc_msgSend(v4, "setObject:forKey:", workoutClusterUUID, CFSTR("workoutClusterUUID"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_relevance);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("relevance"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_clusterSize);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("clusterSize"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_activityType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("activityType"));

  }
LABEL_9:
  routeSnapshot = self->_routeSnapshot;
  if (routeSnapshot)
    objc_msgSend(v4, "setObject:forKey:", routeSnapshot, CFSTR("routeSnapshot"));
  routeLabel = self->_routeLabel;
  if (routeLabel)
    objc_msgSend(v4, "setObject:forKey:", routeLabel, CFSTR("routeLabel"));
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("syncIdentity"));

  }
  lastWorkoutMetrics = self->_lastWorkoutMetrics;
  if (lastWorkoutMetrics)
  {
    -[HDCodableRacingMetrics dictionaryRepresentation](lastWorkoutMetrics, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("lastWorkoutMetrics"));

  }
  bestWorkoutMetrics = self->_bestWorkoutMetrics;
  if (bestWorkoutMetrics)
  {
    -[HDCodableRacingMetrics dictionaryRepresentation](bestWorkoutMetrics, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("bestWorkoutMetrics"));

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_final);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("final"));

  }
  eligibleClusterUUIDs = self->_eligibleClusterUUIDs;
  if (eligibleClusterUUIDs)
    objc_msgSend(v4, "setObject:forKey:", eligibleClusterUUIDs, CFSTR("eligibleClusterUUIDs"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRacingClusterReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteDataField();
  if (self->_workoutClusterUUID)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_8:
    PBDataWriterWriteInt32Field();
LABEL_9:
  if (self->_routeSnapshot)
    PBDataWriterWriteDataField();
  if (self->_routeLabel)
    PBDataWriterWriteStringField();
  if (self->_syncIdentity)
    PBDataWriterWriteSubmessage();
  if (self->_lastWorkoutMetrics)
    PBDataWriterWriteSubmessage();
  if (self->_bestWorkoutMetrics)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_eligibleClusterUUIDs;
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
        PBDataWriterWriteDataField();
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
  if (self->_workoutClusterUUID)
  {
    objc_msgSend(v10, "setWorkoutClusterUUID:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_relevance;
    *((_BYTE *)v4 + 100) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 8) = self->_clusterSize;
  *((_BYTE *)v4 + 100) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 4) = self->_activityType;
    *((_BYTE *)v4 + 100) |= 2u;
  }
LABEL_9:
  if (self->_routeSnapshot)
  {
    objc_msgSend(v10, "setRouteSnapshot:");
    v4 = v10;
  }
  if (self->_routeLabel)
  {
    objc_msgSend(v10, "setRouteLabel:");
    v4 = v10;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v10, "setSyncIdentity:");
    v4 = v10;
  }
  if (self->_lastWorkoutMetrics)
  {
    objc_msgSend(v10, "setLastWorkoutMetrics:");
    v4 = v10;
  }
  if (self->_bestWorkoutMetrics)
  {
    objc_msgSend(v10, "setBestWorkoutMetrics:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 96) = self->_final;
    *((_BYTE *)v4 + 100) |= 8u;
  }
  if (-[HDCodableRacingCluster eligibleClusterUUIDsCount](self, "eligibleClusterUUIDsCount"))
  {
    objc_msgSend(v10, "clearEligibleClusterUUIDs");
    v6 = -[HDCodableRacingCluster eligibleClusterUUIDsCount](self, "eligibleClusterUUIDsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[HDCodableRacingCluster eligibleClusterUUIDsAtIndex:](self, "eligibleClusterUUIDsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addEligibleClusterUUIDs:", v9);

      }
    }
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
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  v8 = -[NSData copyWithZone:](self->_workoutClusterUUID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_relevance;
    *(_BYTE *)(v5 + 100) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_clusterSize;
  *(_BYTE *)(v5 + 100) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_activityType;
    *(_BYTE *)(v5 + 100) |= 2u;
  }
LABEL_5:
  v11 = -[NSData copyWithZone:](self->_routeSnapshot, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  v13 = -[NSString copyWithZone:](self->_routeLabel, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  v15 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v15;

  v17 = -[HDCodableRacingMetrics copyWithZone:](self->_lastWorkoutMetrics, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  v19 = -[HDCodableRacingMetrics copyWithZone:](self->_bestWorkoutMetrics, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v19;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 96) = self->_final;
    *(_BYTE *)(v5 + 100) |= 8u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = self->_eligibleClusterUUIDs;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend((id)v5, "addEligibleClusterUUIDs:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v23);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *uuid;
  NSData *workoutClusterUUID;
  NSData *routeSnapshot;
  NSString *routeLabel;
  HDCodableSyncIdentity *syncIdentity;
  HDCodableRacingMetrics *lastWorkoutMetrics;
  HDCodableRacingMetrics *bestWorkoutMetrics;
  char v12;
  NSMutableArray *eligibleClusterUUIDs;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_35;
  }
  workoutClusterUUID = self->_workoutClusterUUID;
  if ((unint64_t)workoutClusterUUID | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](workoutClusterUUID, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 1) == 0 || self->_relevance != *((double *)v4 + 1))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 4) == 0 || self->_clusterSize != *((_DWORD *)v4 + 8))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 2) == 0 || self->_activityType != *((_DWORD *)v4 + 4))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
    goto LABEL_35;
  }
  routeSnapshot = self->_routeSnapshot;
  if ((unint64_t)routeSnapshot | *((_QWORD *)v4 + 8)
    && !-[NSData isEqual:](routeSnapshot, "isEqual:"))
  {
    goto LABEL_35;
  }
  routeLabel = self->_routeLabel;
  if ((unint64_t)routeLabel | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](routeLabel, "isEqual:"))
      goto LABEL_35;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 9))
  {
    if (!-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
      goto LABEL_35;
  }
  lastWorkoutMetrics = self->_lastWorkoutMetrics;
  if ((unint64_t)lastWorkoutMetrics | *((_QWORD *)v4 + 6))
  {
    if (!-[HDCodableRacingMetrics isEqual:](lastWorkoutMetrics, "isEqual:"))
      goto LABEL_35;
  }
  bestWorkoutMetrics = self->_bestWorkoutMetrics;
  if ((unint64_t)bestWorkoutMetrics | *((_QWORD *)v4 + 3))
  {
    if (!-[HDCodableRacingMetrics isEqual:](bestWorkoutMetrics, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 100) & 8) == 0)
      goto LABEL_41;
LABEL_35:
    v12 = 0;
    goto LABEL_36;
  }
  if ((*((_BYTE *)v4 + 100) & 8) == 0)
    goto LABEL_35;
  if (!self->_final)
  {
    if (!*((_BYTE *)v4 + 96))
      goto LABEL_41;
    goto LABEL_35;
  }
  if (!*((_BYTE *)v4 + 96))
    goto LABEL_35;
LABEL_41:
  eligibleClusterUUIDs = self->_eligibleClusterUUIDs;
  if ((unint64_t)eligibleClusterUUIDs | *((_QWORD *)v4 + 5))
    v12 = -[NSMutableArray isEqual:](eligibleClusterUUIDs, "isEqual:");
  else
    v12 = 1;
LABEL_36:

  return v12;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double relevance;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = -[NSData hash](self->_uuid, "hash");
  v18 = -[NSData hash](self->_workoutClusterUUID, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    relevance = self->_relevance;
    v6 = -relevance;
    if (relevance >= 0.0)
      v6 = self->_relevance;
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
  if ((has & 4) != 0)
  {
    v9 = 2654435761 * self->_clusterSize;
    if ((has & 2) != 0)
      goto LABEL_11;
  }
  else
  {
    v9 = 0;
    if ((has & 2) != 0)
    {
LABEL_11:
      v10 = 2654435761 * self->_activityType;
      goto LABEL_14;
    }
  }
  v10 = 0;
LABEL_14:
  v11 = -[NSData hash](self->_routeSnapshot, "hash", v18);
  v12 = -[NSString hash](self->_routeLabel, "hash");
  v13 = -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  v14 = -[HDCodableRacingMetrics hash](self->_lastWorkoutMetrics, "hash");
  v15 = -[HDCodableRacingMetrics hash](self->_bestWorkoutMetrics, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v16 = 2654435761 * self->_final;
  else
    v16 = 0;
  return v19 ^ v20 ^ v4 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NSMutableArray hash](self->_eligibleClusterUUIDs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v7;
  HDCodableRacingMetrics *lastWorkoutMetrics;
  uint64_t v9;
  HDCodableRacingMetrics *bestWorkoutMetrics;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 10))
    -[HDCodableRacingCluster setUuid:](self, "setUuid:");
  if (*((_QWORD *)v4 + 11))
    -[HDCodableRacingCluster setWorkoutClusterUUID:](self, "setWorkoutClusterUUID:");
  v5 = *((_BYTE *)v4 + 100);
  if ((v5 & 1) != 0)
  {
    self->_relevance = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 100);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)v4 + 100) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_clusterSize = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
LABEL_8:
    self->_activityType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 8))
    -[HDCodableRacingCluster setRouteSnapshot:](self, "setRouteSnapshot:");
  if (*((_QWORD *)v4 + 7))
    -[HDCodableRacingCluster setRouteLabel:](self, "setRouteLabel:");
  syncIdentity = self->_syncIdentity;
  v7 = *((_QWORD *)v4 + 9);
  if (syncIdentity)
  {
    if (v7)
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else if (v7)
  {
    -[HDCodableRacingCluster setSyncIdentity:](self, "setSyncIdentity:");
  }
  lastWorkoutMetrics = self->_lastWorkoutMetrics;
  v9 = *((_QWORD *)v4 + 6);
  if (lastWorkoutMetrics)
  {
    if (v9)
      -[HDCodableRacingMetrics mergeFrom:](lastWorkoutMetrics, "mergeFrom:");
  }
  else if (v9)
  {
    -[HDCodableRacingCluster setLastWorkoutMetrics:](self, "setLastWorkoutMetrics:");
  }
  bestWorkoutMetrics = self->_bestWorkoutMetrics;
  v11 = *((_QWORD *)v4 + 3);
  if (bestWorkoutMetrics)
  {
    if (v11)
      -[HDCodableRacingMetrics mergeFrom:](bestWorkoutMetrics, "mergeFrom:");
  }
  else if (v11)
  {
    -[HDCodableRacingCluster setBestWorkoutMetrics:](self, "setBestWorkoutMetrics:");
  }
  if ((*((_BYTE *)v4 + 100) & 8) != 0)
  {
    self->_final = *((_BYTE *)v4 + 96);
    *(_BYTE *)&self->_has |= 8u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v4 + 5);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[HDCodableRacingCluster addEligibleClusterUUIDs:](self, "addEligibleClusterUUIDs:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
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

- (NSData)workoutClusterUUID
{
  return self->_workoutClusterUUID;
}

- (void)setWorkoutClusterUUID:(id)a3
{
  objc_storeStrong((id *)&self->_workoutClusterUUID, a3);
}

- (double)relevance
{
  return self->_relevance;
}

- (int)clusterSize
{
  return self->_clusterSize;
}

- (int)activityType
{
  return self->_activityType;
}

- (NSData)routeSnapshot
{
  return self->_routeSnapshot;
}

- (void)setRouteSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_routeSnapshot, a3);
}

- (NSString)routeLabel
{
  return self->_routeLabel;
}

- (void)setRouteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_routeLabel, a3);
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (HDCodableRacingMetrics)lastWorkoutMetrics
{
  return self->_lastWorkoutMetrics;
}

- (void)setLastWorkoutMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_lastWorkoutMetrics, a3);
}

- (HDCodableRacingMetrics)bestWorkoutMetrics
{
  return self->_bestWorkoutMetrics;
}

- (void)setBestWorkoutMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_bestWorkoutMetrics, a3);
}

- (BOOL)final
{
  return self->_final;
}

- (NSMutableArray)eligibleClusterUUIDs
{
  return self->_eligibleClusterUUIDs;
}

- (void)setEligibleClusterUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_eligibleClusterUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutClusterUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_routeSnapshot, 0);
  objc_storeStrong((id *)&self->_routeLabel, 0);
  objc_storeStrong((id *)&self->_lastWorkoutMetrics, 0);
  objc_storeStrong((id *)&self->_eligibleClusterUUIDs, 0);
  objc_storeStrong((id *)&self->_bestWorkoutMetrics, 0);
}

@end
