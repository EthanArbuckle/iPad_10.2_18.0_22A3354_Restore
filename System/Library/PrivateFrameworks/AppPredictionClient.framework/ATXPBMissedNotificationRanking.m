@implementation ATXPBMissedNotificationRanking

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBMissedNotificationRanking *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ATXPBSharedDigestEngagementTrackingMetrics *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  ATXPBDigestTimeline *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXPBMissedNotificationRanking init](self, "init");
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    -[ATXPBMissedNotificationRanking setTimestamp:](v5, "setTimestamp:");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBMissedNotificationRanking setUuid:](v5, "setUuid:", v9);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rankerId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBMissedNotificationRanking setRankerId:](v5, "setRankerId:", v11);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modeId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBMissedNotificationRanking setModeId:](v5, "setModeId:", v13);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sharedDigestEngagementTracker"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = [ATXPBSharedDigestEngagementTrackingMetrics alloc];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sharedDigestEngagementTracker"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[ATXPBSharedDigestEngagementTrackingMetrics initFromJSON:](v16, "initFromJSON:", v18);
      -[ATXPBMissedNotificationRanking setSharedEngagementTracker:](v5, "setSharedEngagementTracker:", v19);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("digestTimeline"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = [ATXPBDigestTimeline alloc];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("digestTimeline"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[ATXPBDigestTimeline initFromJSON:](v22, "initFromJSON:", v24);
      -[ATXPBMissedNotificationRanking setDigestTimeline:](v5, "setDigestTimeline:", v25);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rankedGroups"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v34;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(v26);
          v31 = -[ATXPBUserNotificationDigestNotificationGroup initFromJSON:]([ATXPBUserNotificationDigestNotificationGroup alloc], "initFromJSON:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v30));
          -[ATXPBMissedNotificationRanking addRankedGroups:](v5, "addRankedGroups:", v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v28);
    }

  }
  return v5;
}

- (id)jsonRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[7];
  _QWORD v19[9];

  v19[7] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  v18[1] = CFSTR("uuid");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_uuid);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v15;
  v18[2] = CFSTR("rankerId");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_rankerId);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  v18[3] = CFSTR("modeId");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_modeId);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v3;
  v18[4] = CFSTR("sharedDigestEngagementTracker");
  -[ATXPBMissedNotificationRanking sharedEngagementTracker](self, "sharedEngagementTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsonRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v6;
  v18[5] = CFSTR("digestTimeline");
  -[ATXPBMissedNotificationRanking digestTimeline](self, "digestTimeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v9;
  v18[6] = CFSTR("rankedGroups");
  -[NSMutableArray _pas_mappedArrayWithTransform:](self->_rankedGroups, "_pas_mappedArrayWithTransform:", &__block_literal_global_9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __58__ATXPBMissedNotificationRanking_JSON__jsonRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonRepresentation");
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasRankerId
{
  return self->_rankerId != 0;
}

- (BOOL)hasModeId
{
  return self->_modeId != 0;
}

- (void)clearRankedGroups
{
  -[NSMutableArray removeAllObjects](self->_rankedGroups, "removeAllObjects");
}

- (void)addRankedGroups:(id)a3
{
  id v4;
  NSMutableArray *rankedGroups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rankedGroups = self->_rankedGroups;
  v8 = v4;
  if (!rankedGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_rankedGroups;
    self->_rankedGroups = v6;

    v4 = v8;
    rankedGroups = self->_rankedGroups;
  }
  -[NSMutableArray addObject:](rankedGroups, "addObject:", v4);

}

- (unint64_t)rankedGroupsCount
{
  return -[NSMutableArray count](self->_rankedGroups, "count");
}

- (id)rankedGroupsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rankedGroups, "objectAtIndex:", a3);
}

+ (Class)rankedGroupsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSharedEngagementTracker
{
  return self->_sharedEngagementTracker != 0;
}

- (BOOL)hasDigestTimeline
{
  return self->_digestTimeline != 0;
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
  v8.super_class = (Class)ATXPBMissedNotificationRanking;
  -[ATXPBMissedNotificationRanking description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBMissedNotificationRanking dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *rankerId;
  NSString *modeId;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  ATXPBSharedDigestEngagementTrackingMetrics *sharedEngagementTracker;
  void *v16;
  ATXPBDigestTimeline *digestTimeline;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  rankerId = self->_rankerId;
  if (rankerId)
    objc_msgSend(v3, "setObject:forKey:", rankerId, CFSTR("rankerId"));
  modeId = self->_modeId;
  if (modeId)
    objc_msgSend(v3, "setObject:forKey:", modeId, CFSTR("modeId"));
  if (-[NSMutableArray count](self->_rankedGroups, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_rankedGroups, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = self->_rankedGroups;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("rankedGroups"));
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if (sharedEngagementTracker)
  {
    -[ATXPBSharedDigestEngagementTrackingMetrics dictionaryRepresentation](sharedEngagementTracker, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("sharedEngagementTracker"));

  }
  digestTimeline = self->_digestTimeline;
  if (digestTimeline)
  {
    -[ATXPBDigestTimeline dictionaryRepresentation](digestTimeline, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("digestTimeline"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBMissedNotificationRankingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_rankedGroups;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_uuid)
    PBDataWriterWriteStringField();
  if (self->_rankerId)
    PBDataWriterWriteStringField();
  if (self->_modeId)
    PBDataWriterWriteStringField();
  if (self->_sharedEngagementTracker)
    PBDataWriterWriteSubmessage();
  if (self->_digestTimeline)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  v10 = v4;
  if (-[ATXPBMissedNotificationRanking rankedGroupsCount](self, "rankedGroupsCount"))
  {
    objc_msgSend(v10, "clearRankedGroups");
    v5 = -[ATXPBMissedNotificationRanking rankedGroupsCount](self, "rankedGroupsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ATXPBMissedNotificationRanking rankedGroupsAtIndex:](self, "rankedGroupsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addRankedGroups:", v8);

      }
    }
  }
  if (self->_uuid)
    objc_msgSend(v10, "setUuid:");
  v9 = v10;
  if (self->_rankerId)
  {
    objc_msgSend(v10, "setRankerId:");
    v9 = v10;
  }
  if (self->_modeId)
  {
    objc_msgSend(v10, "setModeId:");
    v9 = v10;
  }
  if (self->_sharedEngagementTracker)
  {
    objc_msgSend(v10, "setSharedEngagementTracker:");
    v9 = v10;
  }
  if (self->_digestTimeline)
  {
    objc_msgSend(v10, "setDigestTimeline:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_rankedGroups;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend(v6, "addRankedGroups:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  v13 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v14 = (void *)v6[7];
  v6[7] = v13;

  v15 = -[NSString copyWithZone:](self->_rankerId, "copyWithZone:", a3);
  v16 = (void *)v6[5];
  v6[5] = v15;

  v17 = -[NSString copyWithZone:](self->_modeId, "copyWithZone:", a3);
  v18 = (void *)v6[3];
  v6[3] = v17;

  v19 = -[ATXPBSharedDigestEngagementTrackingMetrics copyWithZone:](self->_sharedEngagementTracker, "copyWithZone:", a3);
  v20 = (void *)v6[6];
  v6[6] = v19;

  v21 = -[ATXPBDigestTimeline copyWithZone:](self->_digestTimeline, "copyWithZone:", a3);
  v22 = (void *)v6[2];
  v6[2] = v21;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *rankedGroups;
  NSString *uuid;
  NSString *rankerId;
  NSString *modeId;
  ATXPBSharedDigestEngagementTrackingMetrics *sharedEngagementTracker;
  ATXPBDigestTimeline *digestTimeline;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  rankedGroups = self->_rankedGroups;
  if ((unint64_t)rankedGroups | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](rankedGroups, "isEqual:"))
  {
    goto LABEL_19;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_19;
  }
  rankerId = self->_rankerId;
  if ((unint64_t)rankerId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](rankerId, "isEqual:"))
      goto LABEL_19;
  }
  modeId = self->_modeId;
  if ((unint64_t)modeId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](modeId, "isEqual:"))
      goto LABEL_19;
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if ((unint64_t)sharedEngagementTracker | *((_QWORD *)v4 + 6))
  {
    if (!-[ATXPBSharedDigestEngagementTrackingMetrics isEqual:](sharedEngagementTracker, "isEqual:"))
      goto LABEL_19;
  }
  digestTimeline = self->_digestTimeline;
  if ((unint64_t)digestTimeline | *((_QWORD *)v4 + 2))
    v11 = -[ATXPBDigestTimeline isEqual:](digestTimeline, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  double timestamp;
  double v5;
  long double v6;
  double v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  unint64_t v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v5 = -timestamp;
    if (timestamp >= 0.0)
      v5 = self->_timestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSMutableArray hash](self->_rankedGroups, "hash") ^ v3;
  v9 = -[NSString hash](self->_uuid, "hash");
  v10 = v8 ^ v9 ^ -[NSString hash](self->_rankerId, "hash");
  v11 = -[NSString hash](self->_modeId, "hash");
  v12 = v11 ^ -[ATXPBSharedDigestEngagementTrackingMetrics hash](self->_sharedEngagementTracker, "hash");
  return v10 ^ v12 ^ -[ATXPBDigestTimeline hash](self->_digestTimeline, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  ATXPBSharedDigestEngagementTrackingMetrics *sharedEngagementTracker;
  uint64_t v12;
  ATXPBDigestTimeline *digestTimeline;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_timestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = *((id *)v4 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[ATXPBMissedNotificationRanking addRankedGroups:](self, "addRankedGroups:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (v5[7])
    -[ATXPBMissedNotificationRanking setUuid:](self, "setUuid:");
  if (v5[5])
    -[ATXPBMissedNotificationRanking setRankerId:](self, "setRankerId:");
  if (v5[3])
    -[ATXPBMissedNotificationRanking setModeId:](self, "setModeId:");
  sharedEngagementTracker = self->_sharedEngagementTracker;
  v12 = v5[6];
  if (sharedEngagementTracker)
  {
    if (v12)
      -[ATXPBSharedDigestEngagementTrackingMetrics mergeFrom:](sharedEngagementTracker, "mergeFrom:");
  }
  else if (v12)
  {
    -[ATXPBMissedNotificationRanking setSharedEngagementTracker:](self, "setSharedEngagementTracker:");
  }
  digestTimeline = self->_digestTimeline;
  v14 = v5[2];
  if (digestTimeline)
  {
    if (v14)
      -[ATXPBDigestTimeline mergeFrom:](digestTimeline, "mergeFrom:");
  }
  else if (v14)
  {
    -[ATXPBMissedNotificationRanking setDigestTimeline:](self, "setDigestTimeline:");
  }

}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)rankerId
{
  return self->_rankerId;
}

- (void)setRankerId:(id)a3
{
  objc_storeStrong((id *)&self->_rankerId, a3);
}

- (NSString)modeId
{
  return self->_modeId;
}

- (void)setModeId:(id)a3
{
  objc_storeStrong((id *)&self->_modeId, a3);
}

- (NSMutableArray)rankedGroups
{
  return self->_rankedGroups;
}

- (void)setRankedGroups:(id)a3
{
  objc_storeStrong((id *)&self->_rankedGroups, a3);
}

- (ATXPBSharedDigestEngagementTrackingMetrics)sharedEngagementTracker
{
  return self->_sharedEngagementTracker;
}

- (void)setSharedEngagementTracker:(id)a3
{
  objc_storeStrong((id *)&self->_sharedEngagementTracker, a3);
}

- (ATXPBDigestTimeline)digestTimeline
{
  return self->_digestTimeline;
}

- (void)setDigestTimeline:(id)a3
{
  objc_storeStrong((id *)&self->_digestTimeline, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sharedEngagementTracker, 0);
  objc_storeStrong((id *)&self->_rankerId, 0);
  objc_storeStrong((id *)&self->_rankedGroups, 0);
  objc_storeStrong((id *)&self->_modeId, 0);
  objc_storeStrong((id *)&self->_digestTimeline, 0);
}

@end
