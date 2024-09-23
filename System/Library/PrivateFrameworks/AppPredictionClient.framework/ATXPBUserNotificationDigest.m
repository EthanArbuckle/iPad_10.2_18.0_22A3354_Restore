@implementation ATXPBUserNotificationDigest

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

- (void)clearMessageGroups
{
  -[NSMutableArray removeAllObjects](self->_messageGroups, "removeAllObjects");
}

- (void)addMessageGroups:(id)a3
{
  id v4;
  NSMutableArray *messageGroups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  messageGroups = self->_messageGroups;
  v8 = v4;
  if (!messageGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_messageGroups;
    self->_messageGroups = v6;

    v4 = v8;
    messageGroups = self->_messageGroups;
  }
  -[NSMutableArray addObject:](messageGroups, "addObject:", v4);

}

- (unint64_t)messageGroupsCount
{
  return -[NSMutableArray count](self->_messageGroups, "count");
}

- (id)messageGroupsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_messageGroups, "objectAtIndex:", a3);
}

+ (Class)messageGroupsType
{
  return (Class)objc_opt_class();
}

- (void)clearHighlightedGroups
{
  -[NSMutableArray removeAllObjects](self->_highlightedGroups, "removeAllObjects");
}

- (void)addHighlightedGroups:(id)a3
{
  id v4;
  NSMutableArray *highlightedGroups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  highlightedGroups = self->_highlightedGroups;
  v8 = v4;
  if (!highlightedGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_highlightedGroups;
    self->_highlightedGroups = v6;

    v4 = v8;
    highlightedGroups = self->_highlightedGroups;
  }
  -[NSMutableArray addObject:](highlightedGroups, "addObject:", v4);

}

- (unint64_t)highlightedGroupsCount
{
  return -[NSMutableArray count](self->_highlightedGroups, "count");
}

- (id)highlightedGroupsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_highlightedGroups, "objectAtIndex:", a3);
}

+ (Class)highlightedGroupsType
{
  return (Class)objc_opt_class();
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

- (void)clearAppDigests
{
  -[NSMutableArray removeAllObjects](self->_appDigests, "removeAllObjects");
}

- (void)addAppDigests:(id)a3
{
  id v4;
  NSMutableArray *appDigests;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  appDigests = self->_appDigests;
  v8 = v4;
  if (!appDigests)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_appDigests;
    self->_appDigests = v6;

    v4 = v8;
    appDigests = self->_appDigests;
  }
  -[NSMutableArray addObject:](appDigests, "addObject:", v4);

}

- (unint64_t)appDigestsCount
{
  return -[NSMutableArray count](self->_appDigests, "count");
}

- (id)appDigestsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_appDigests, "objectAtIndex:", a3);
}

+ (Class)appDigestsType
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
  v8.super_class = (Class)ATXPBUserNotificationDigest;
  -[ATXPBUserNotificationDigest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUserNotificationDigest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  ATXPBSharedDigestEngagementTrackingMetrics *sharedEngagementTracker;
  void *v37;
  ATXPBDigestTimeline *digestTimeline;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
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
  if (-[NSMutableArray count](self->_messageGroups, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_messageGroups, "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v9 = self->_messageGroups;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v54 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("messageGroups"));
  }
  if (-[NSMutableArray count](self->_highlightedGroups, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_highlightedGroups, "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v16 = self->_highlightedGroups;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v50 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("highlightedGroups"));
  }
  if (-[NSMutableArray count](self->_rankedGroups, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_rankedGroups, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v23 = self->_rankedGroups;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v46 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("rankedGroups"));
  }
  if (-[NSMutableArray count](self->_appDigests, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_appDigests, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v30 = self->_appDigests;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v42;
      do
      {
        for (m = 0; m != v32; ++m)
        {
          if (*(_QWORD *)v42 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v41);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
      }
      while (v32);
    }

    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("appDigests"));
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if (sharedEngagementTracker)
  {
    -[ATXPBSharedDigestEngagementTrackingMetrics dictionaryRepresentation](sharedEngagementTracker, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("sharedEngagementTracker"));

  }
  digestTimeline = self->_digestTimeline;
  if (digestTimeline)
  {
    -[ATXPBDigestTimeline dictionaryRepresentation](digestTimeline, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("digestTimeline"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationDigestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_messageGroups;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_highlightedGroups;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_rankedGroups;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
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
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_appDigests;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  id v21;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 88) |= 1u;
  }
  v21 = v4;
  if (-[ATXPBUserNotificationDigest messageGroupsCount](self, "messageGroupsCount"))
  {
    objc_msgSend(v21, "clearMessageGroups");
    v5 = -[ATXPBUserNotificationDigest messageGroupsCount](self, "messageGroupsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ATXPBUserNotificationDigest messageGroupsAtIndex:](self, "messageGroupsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addMessageGroups:", v8);

      }
    }
  }
  if (-[ATXPBUserNotificationDigest highlightedGroupsCount](self, "highlightedGroupsCount"))
  {
    objc_msgSend(v21, "clearHighlightedGroups");
    v9 = -[ATXPBUserNotificationDigest highlightedGroupsCount](self, "highlightedGroupsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[ATXPBUserNotificationDigest highlightedGroupsAtIndex:](self, "highlightedGroupsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addHighlightedGroups:", v12);

      }
    }
  }
  if (-[ATXPBUserNotificationDigest rankedGroupsCount](self, "rankedGroupsCount"))
  {
    objc_msgSend(v21, "clearRankedGroups");
    v13 = -[ATXPBUserNotificationDigest rankedGroupsCount](self, "rankedGroupsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[ATXPBUserNotificationDigest rankedGroupsAtIndex:](self, "rankedGroupsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addRankedGroups:", v16);

      }
    }
  }
  if (self->_uuid)
    objc_msgSend(v21, "setUuid:");
  if (self->_rankerId)
    objc_msgSend(v21, "setRankerId:");
  if (self->_modeId)
    objc_msgSend(v21, "setModeId:");
  if (self->_sharedEngagementTracker)
    objc_msgSend(v21, "setSharedEngagementTracker:");
  if (self->_digestTimeline)
    objc_msgSend(v21, "setDigestTimeline:");
  if (-[ATXPBUserNotificationDigest appDigestsCount](self, "appDigestsCount"))
  {
    objc_msgSend(v21, "clearAppDigests");
    v17 = -[ATXPBUserNotificationDigest appDigestsCount](self, "appDigestsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[ATXPBUserNotificationDigest appDigestsAtIndex:](self, "appDigestsAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addAppDigests:", v20);

      }
    }
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
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v7 = self->_messageGroups;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v55;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v55 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addMessageGroups:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    }
    while (v9);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v13 = self->_highlightedGroups;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v51;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v51 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v17), "copyWithZone:", a3);
        objc_msgSend(v6, "addHighlightedGroups:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v15);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v19 = self->_rankedGroups;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v47;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v47 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v23), "copyWithZone:", a3);
        objc_msgSend(v6, "addRankedGroups:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    }
    while (v21);
  }

  v25 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v26 = (void *)v6[10];
  v6[10] = v25;

  v27 = -[NSString copyWithZone:](self->_rankerId, "copyWithZone:", a3);
  v28 = (void *)v6[8];
  v6[8] = v27;

  v29 = -[NSString copyWithZone:](self->_modeId, "copyWithZone:", a3);
  v30 = (void *)v6[6];
  v6[6] = v29;

  v31 = -[ATXPBSharedDigestEngagementTrackingMetrics copyWithZone:](self->_sharedEngagementTracker, "copyWithZone:", a3);
  v32 = (void *)v6[9];
  v6[9] = v31;

  v33 = -[ATXPBDigestTimeline copyWithZone:](self->_digestTimeline, "copyWithZone:", a3);
  v34 = (void *)v6[3];
  v6[3] = v33;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v35 = self->_appDigests;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v43;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v43 != v38)
          objc_enumerationMutation(v35);
        v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v39), "copyWithZone:", a3, (_QWORD)v42);
        objc_msgSend(v6, "addAppDigests:", v40);

        ++v39;
      }
      while (v37 != v39);
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
    }
    while (v37);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *messageGroups;
  NSMutableArray *highlightedGroups;
  NSMutableArray *rankedGroups;
  NSString *uuid;
  NSString *rankerId;
  NSString *modeId;
  ATXPBSharedDigestEngagementTrackingMetrics *sharedEngagementTracker;
  ATXPBDigestTimeline *digestTimeline;
  NSMutableArray *appDigests;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_25:
    v14 = 0;
    goto LABEL_26;
  }
  messageGroups = self->_messageGroups;
  if ((unint64_t)messageGroups | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](messageGroups, "isEqual:"))
  {
    goto LABEL_25;
  }
  highlightedGroups = self->_highlightedGroups;
  if ((unint64_t)highlightedGroups | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](highlightedGroups, "isEqual:"))
      goto LABEL_25;
  }
  rankedGroups = self->_rankedGroups;
  if ((unint64_t)rankedGroups | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](rankedGroups, "isEqual:"))
      goto LABEL_25;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_25;
  }
  rankerId = self->_rankerId;
  if ((unint64_t)rankerId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](rankerId, "isEqual:"))
      goto LABEL_25;
  }
  modeId = self->_modeId;
  if ((unint64_t)modeId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](modeId, "isEqual:"))
      goto LABEL_25;
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if ((unint64_t)sharedEngagementTracker | *((_QWORD *)v4 + 9))
  {
    if (!-[ATXPBSharedDigestEngagementTrackingMetrics isEqual:](sharedEngagementTracker, "isEqual:"))
      goto LABEL_25;
  }
  digestTimeline = self->_digestTimeline;
  if ((unint64_t)digestTimeline | *((_QWORD *)v4 + 3))
  {
    if (!-[ATXPBDigestTimeline isEqual:](digestTimeline, "isEqual:"))
      goto LABEL_25;
  }
  appDigests = self->_appDigests;
  if ((unint64_t)appDigests | *((_QWORD *)v4 + 2))
    v14 = -[NSMutableArray isEqual:](appDigests, "isEqual:");
  else
    v14 = 1;
LABEL_26:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  double timestamp;
  double v5;
  long double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  unint64_t v14;
  unint64_t v15;

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
  v8 = -[NSMutableArray hash](self->_messageGroups, "hash") ^ v3;
  v9 = -[NSMutableArray hash](self->_highlightedGroups, "hash");
  v10 = v8 ^ v9 ^ -[NSMutableArray hash](self->_rankedGroups, "hash");
  v11 = -[NSString hash](self->_uuid, "hash");
  v12 = v11 ^ -[NSString hash](self->_rankerId, "hash");
  v13 = v10 ^ v12 ^ -[NSString hash](self->_modeId, "hash");
  v14 = -[ATXPBSharedDigestEngagementTrackingMetrics hash](self->_sharedEngagementTracker, "hash");
  v15 = v14 ^ -[ATXPBDigestTimeline hash](self->_digestTimeline, "hash");
  return v13 ^ v15 ^ -[NSMutableArray hash](self->_appDigests, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  ATXPBSharedDigestEngagementTrackingMetrics *sharedEngagementTracker;
  id v22;
  ATXPBDigestTimeline *digestTimeline;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
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
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    self->_timestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v6 = *((id *)v4 + 5);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v6);
        -[ATXPBUserNotificationDigest addMessageGroups:](self, "addMessageGroups:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v8);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = v5[4];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        -[ATXPBUserNotificationDigest addHighlightedGroups:](self, "addHighlightedGroups:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v13);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v16 = v5[7];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        -[ATXPBUserNotificationDigest addRankedGroups:](self, "addRankedGroups:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v18);
  }

  if (v5[10])
    -[ATXPBUserNotificationDigest setUuid:](self, "setUuid:");
  if (v5[8])
    -[ATXPBUserNotificationDigest setRankerId:](self, "setRankerId:");
  if (v5[6])
    -[ATXPBUserNotificationDigest setModeId:](self, "setModeId:");
  sharedEngagementTracker = self->_sharedEngagementTracker;
  v22 = v5[9];
  if (sharedEngagementTracker)
  {
    if (v22)
      -[ATXPBSharedDigestEngagementTrackingMetrics mergeFrom:](sharedEngagementTracker, "mergeFrom:");
  }
  else if (v22)
  {
    -[ATXPBUserNotificationDigest setSharedEngagementTracker:](self, "setSharedEngagementTracker:");
  }
  digestTimeline = self->_digestTimeline;
  v24 = v5[3];
  if (digestTimeline)
  {
    if (v24)
      -[ATXPBDigestTimeline mergeFrom:](digestTimeline, "mergeFrom:");
  }
  else if (v24)
  {
    -[ATXPBUserNotificationDigest setDigestTimeline:](self, "setDigestTimeline:");
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v5[2];
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        -[ATXPBUserNotificationDigest addAppDigests:](self, "addAppDigests:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * m), (_QWORD)v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    }
    while (v27);
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

- (NSMutableArray)messageGroups
{
  return self->_messageGroups;
}

- (void)setMessageGroups:(id)a3
{
  objc_storeStrong((id *)&self->_messageGroups, a3);
}

- (NSMutableArray)highlightedGroups
{
  return self->_highlightedGroups;
}

- (void)setHighlightedGroups:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedGroups, a3);
}

- (NSMutableArray)rankedGroups
{
  return self->_rankedGroups;
}

- (void)setRankedGroups:(id)a3
{
  objc_storeStrong((id *)&self->_rankedGroups, a3);
}

- (NSMutableArray)appDigests
{
  return self->_appDigests;
}

- (void)setAppDigests:(id)a3
{
  objc_storeStrong((id *)&self->_appDigests, a3);
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
  objc_storeStrong((id *)&self->_messageGroups, 0);
  objc_storeStrong((id *)&self->_highlightedGroups, 0);
  objc_storeStrong((id *)&self->_digestTimeline, 0);
  objc_storeStrong((id *)&self->_appDigests, 0);
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBUserNotificationDigest *v5;
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
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
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
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXPBUserNotificationDigest init](self, "init");
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    -[ATXPBUserNotificationDigest setTimestamp:](v5, "setTimestamp:");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBUserNotificationDigest setUuid:](v5, "setUuid:", v9);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rankerId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBUserNotificationDigest setRankerId:](v5, "setRankerId:", v11);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modeId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBUserNotificationDigest setModeId:](v5, "setModeId:", v13);

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
      -[ATXPBUserNotificationDigest setSharedEngagementTracker:](v5, "setSharedEngagementTracker:", v19);

    }
    v52 = v4;
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
      -[ATXPBUserNotificationDigest setDigestTimeline:](v5, "setDigestTimeline:", v25);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("messageGroups"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v66;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v66 != v29)
            objc_enumerationMutation(v26);
          v31 = -[ATXPBUserNotificationDigestNotificationGroup initFromJSON:]([ATXPBUserNotificationDigestNotificationGroup alloc], "initFromJSON:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v30));
          -[ATXPBUserNotificationDigest addMessageGroups:](v5, "addMessageGroups:", v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      }
      while (v28);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("highlightedGroups"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v62;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v62 != v35)
            objc_enumerationMutation(v32);
          v37 = -[ATXPBUserNotificationDigestNotificationGroup initFromJSON:]([ATXPBUserNotificationDigestNotificationGroup alloc], "initFromJSON:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v36));
          -[ATXPBUserNotificationDigest addHighlightedGroups:](v5, "addHighlightedGroups:", v37);

          ++v36;
        }
        while (v34 != v36);
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      }
      while (v34);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rankedGroups"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v58;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v58 != v41)
            objc_enumerationMutation(v38);
          v43 = -[ATXPBUserNotificationDigestNotificationGroup initFromJSON:]([ATXPBUserNotificationDigestNotificationGroup alloc], "initFromJSON:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v42));
          -[ATXPBUserNotificationDigest addRankedGroups:](v5, "addRankedGroups:", v43);

          ++v42;
        }
        while (v40 != v42);
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      }
      while (v40);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appDigests"), v6);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v54;
      do
      {
        v48 = 0;
        do
        {
          if (*(_QWORD *)v54 != v47)
            objc_enumerationMutation(v44);
          v49 = -[ATXPBUserNotificationAppDigest initFromJSON:]([ATXPBUserNotificationAppDigest alloc], "initFromJSON:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v48));
          -[ATXPBUserNotificationDigest addAppDigests:](v5, "addAppDigests:", v49);

          ++v48;
        }
        while (v46 != v48);
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
      }
      while (v46);
    }

    v4 = v52;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[10];
  _QWORD v25[12];

  v25[10] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  v24[1] = CFSTR("uuid");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_uuid);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v21;
  v24[2] = CFSTR("rankerId");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_rankerId);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v20;
  v24[3] = CFSTR("modeId");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_modeId);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v19;
  v24[4] = CFSTR("sharedDigestEngagementTracker");
  -[ATXPBUserNotificationDigest sharedEngagementTracker](self, "sharedEngagementTracker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "jsonRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v16;
  v24[5] = CFSTR("digestTimeline");
  -[ATXPBUserNotificationDigest digestTimeline](self, "digestTimeline");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "jsonRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v3;
  v24[6] = CFSTR("messageGroups");
  -[NSMutableArray _pas_mappedArrayWithTransform:](self->_messageGroups, "_pas_mappedArrayWithTransform:", &__block_literal_global_83);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v5;
  v24[7] = CFSTR("highlightedGroups");
  -[NSMutableArray _pas_mappedArrayWithTransform:](self->_highlightedGroups, "_pas_mappedArrayWithTransform:", &__block_literal_global_25_3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v7;
  v24[8] = CFSTR("rankedGroups");
  -[NSMutableArray _pas_mappedArrayWithTransform:](self->_rankedGroups, "_pas_mappedArrayWithTransform:", &__block_literal_global_26_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v9;
  v24[9] = CFSTR("appDigests");
  -[NSMutableArray _pas_mappedArrayWithTransform:](self->_appDigests, "_pas_mappedArrayWithTransform:", &__block_literal_global_28_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __55__ATXPBUserNotificationDigest_JSON__jsonRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonRepresentation");
}

uint64_t __55__ATXPBUserNotificationDigest_JSON__jsonRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonRepresentation");
}

uint64_t __55__ATXPBUserNotificationDigest_JSON__jsonRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonRepresentation");
}

uint64_t __55__ATXPBUserNotificationDigest_JSON__jsonRepresentation__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonRepresentation");
}

@end
