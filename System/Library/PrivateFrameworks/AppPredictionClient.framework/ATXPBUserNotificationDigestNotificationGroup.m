@implementation ATXPBUserNotificationDigestNotificationGroup

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasGroupDescription
{
  return self->_groupDescription != 0;
}

- (void)setPriority:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPriority
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasRepresentativeNotificationUUID
{
  return self->_representativeNotificationUUID != 0;
}

- (void)clearRankedNotifications
{
  -[NSMutableArray removeAllObjects](self->_rankedNotifications, "removeAllObjects");
}

- (void)addRankedNotifications:(id)a3
{
  id v4;
  NSMutableArray *rankedNotifications;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rankedNotifications = self->_rankedNotifications;
  v8 = v4;
  if (!rankedNotifications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_rankedNotifications;
    self->_rankedNotifications = v6;

    v4 = v8;
    rankedNotifications = self->_rankedNotifications;
  }
  -[NSMutableArray addObject:](rankedNotifications, "addObject:", v4);

}

- (unint64_t)rankedNotificationsCount
{
  return -[NSMutableArray count](self->_rankedNotifications, "count");
}

- (id)rankedNotificationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rankedNotifications, "objectAtIndex:", a3);
}

+ (Class)rankedNotificationsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSharedEngagementTracker
{
  return self->_sharedEngagementTracker != 0;
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
  v8.super_class = (Class)ATXPBUserNotificationDigestNotificationGroup;
  -[ATXPBUserNotificationDigestNotificationGroup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUserNotificationDigestNotificationGroup dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *groupId;
  NSString *title;
  NSString *groupDescription;
  void *v8;
  NSString *representativeNotificationUUID;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  ATXPBSharedDigestEngagementTrackingMetrics *sharedEngagementTracker;
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
  v4 = v3;
  groupId = self->_groupId;
  if (groupId)
    objc_msgSend(v3, "setObject:forKey:", groupId, CFSTR("groupId"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  groupDescription = self->_groupDescription;
  if (groupDescription)
    objc_msgSend(v4, "setObject:forKey:", groupDescription, CFSTR("groupDescription"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_priority);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("priority"));

  }
  representativeNotificationUUID = self->_representativeNotificationUUID;
  if (representativeNotificationUUID)
    objc_msgSend(v4, "setObject:forKey:", representativeNotificationUUID, CFSTR("representativeNotificationUUID"));
  if (-[NSMutableArray count](self->_rankedNotifications, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_rankedNotifications, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = self->_rankedNotifications;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("rankedNotifications"));
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if (sharedEngagementTracker)
  {
    -[ATXPBSharedDigestEngagementTrackingMetrics dictionaryRepresentation](sharedEngagementTracker, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("sharedEngagementTracker"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationDigestNotificationGroupReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_groupId)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_groupDescription)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_representativeNotificationUUID)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_rankedNotifications;
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

  if (self->_sharedEngagementTracker)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_groupId)
  {
    objc_msgSend(v4, "setGroupId:");
    v4 = v9;
  }
  if (self->_title)
  {
    objc_msgSend(v9, "setTitle:");
    v4 = v9;
  }
  if (self->_groupDescription)
  {
    objc_msgSend(v9, "setGroupDescription:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_priority;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (self->_representativeNotificationUUID)
    objc_msgSend(v9, "setRepresentativeNotificationUUID:");
  if (-[ATXPBUserNotificationDigestNotificationGroup rankedNotificationsCount](self, "rankedNotificationsCount"))
  {
    objc_msgSend(v9, "clearRankedNotifications");
    v5 = -[ATXPBUserNotificationDigestNotificationGroup rankedNotificationsCount](self, "rankedNotificationsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ATXPBUserNotificationDigestNotificationGroup rankedNotificationsAtIndex:](self, "rankedNotificationsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addRankedNotifications:", v8);

      }
    }
  }
  if (self->_sharedEngagementTracker)
    objc_msgSend(v9, "setSharedEngagementTracker:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_groupId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_groupDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_priority;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_representativeNotificationUUID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = self->_rankedNotifications;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v5, "addRankedNotifications:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  v20 = -[ATXPBSharedDigestEngagementTrackingMetrics copyWithZone:](self->_sharedEngagementTracker, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *groupId;
  NSString *title;
  NSString *groupDescription;
  NSString *representativeNotificationUUID;
  NSMutableArray *rankedNotifications;
  ATXPBSharedDigestEngagementTrackingMetrics *sharedEngagementTracker;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](groupId, "isEqual:"))
      goto LABEL_19;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_19;
  }
  groupDescription = self->_groupDescription;
  if ((unint64_t)groupDescription | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](groupDescription, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_priority != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  representativeNotificationUUID = self->_representativeNotificationUUID;
  if ((unint64_t)representativeNotificationUUID | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](representativeNotificationUUID, "isEqual:"))
  {
    goto LABEL_19;
  }
  rankedNotifications = self->_rankedNotifications;
  if ((unint64_t)rankedNotifications | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](rankedNotifications, "isEqual:"))
      goto LABEL_19;
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if ((unint64_t)sharedEngagementTracker | *((_QWORD *)v4 + 6))
    v11 = -[ATXPBSharedDigestEngagementTrackingMetrics isEqual:](sharedEngagementTracker, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  double priority;
  double v8;
  long double v9;
  double v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;

  v3 = -[NSString hash](self->_groupId, "hash");
  v4 = -[NSString hash](self->_title, "hash");
  v5 = -[NSString hash](self->_groupDescription, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    priority = self->_priority;
    v8 = -priority;
    if (priority >= 0.0)
      v8 = self->_priority;
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
  v11 = v4 ^ v3 ^ v5 ^ v6;
  v12 = -[NSString hash](self->_representativeNotificationUUID, "hash");
  v13 = v12 ^ -[NSMutableArray hash](self->_rankedNotifications, "hash");
  return v11 ^ v13 ^ -[ATXPBSharedDigestEngagementTrackingMetrics hash](self->_sharedEngagementTracker, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  ATXPBSharedDigestEngagementTrackingMetrics *sharedEngagementTracker;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[ATXPBUserNotificationDigestNotificationGroup setGroupId:](self, "setGroupId:");
  if (*((_QWORD *)v4 + 7))
    -[ATXPBUserNotificationDigestNotificationGroup setTitle:](self, "setTitle:");
  if (*((_QWORD *)v4 + 2))
    -[ATXPBUserNotificationDigestNotificationGroup setGroupDescription:](self, "setGroupDescription:");
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_priority = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
    -[ATXPBUserNotificationDigestNotificationGroup setRepresentativeNotificationUUID:](self, "setRepresentativeNotificationUUID:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[ATXPBUserNotificationDigestNotificationGroup addRankedNotifications:](self, "addRankedNotifications:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  sharedEngagementTracker = self->_sharedEngagementTracker;
  v11 = *((_QWORD *)v4 + 6);
  if (sharedEngagementTracker)
  {
    if (v11)
      -[ATXPBSharedDigestEngagementTrackingMetrics mergeFrom:](sharedEngagementTracker, "mergeFrom:");
  }
  else if (v11)
  {
    -[ATXPBUserNotificationDigestNotificationGroup setSharedEngagementTracker:](self, "setSharedEngagementTracker:");
  }

}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_groupId, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)groupDescription
{
  return self->_groupDescription;
}

- (void)setGroupDescription:(id)a3
{
  objc_storeStrong((id *)&self->_groupDescription, a3);
}

- (double)priority
{
  return self->_priority;
}

- (NSString)representativeNotificationUUID
{
  return self->_representativeNotificationUUID;
}

- (void)setRepresentativeNotificationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_representativeNotificationUUID, a3);
}

- (NSMutableArray)rankedNotifications
{
  return self->_rankedNotifications;
}

- (void)setRankedNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_rankedNotifications, a3);
}

- (ATXPBSharedDigestEngagementTrackingMetrics)sharedEngagementTracker
{
  return self->_sharedEngagementTracker;
}

- (void)setSharedEngagementTracker:(id)a3
{
  objc_storeStrong((id *)&self->_sharedEngagementTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sharedEngagementTracker, 0);
  objc_storeStrong((id *)&self->_representativeNotificationUUID, 0);
  objc_storeStrong((id *)&self->_rankedNotifications, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_groupDescription, 0);
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBUserNotificationDigestNotificationGroup *v5;
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
  void *v16;
  void *v17;
  ATXPBSharedDigestEngagementTrackingMetrics *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXPBUserNotificationDigestNotificationGroup init](self, "init");
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("groupID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBUserNotificationDigestNotificationGroup setGroupId:](v5, "setGroupId:", v8);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBUserNotificationDigestNotificationGroup setTitle:](v5, "setTitle:", v10);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("groupDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBUserNotificationDigestNotificationGroup setGroupDescription:](v5, "setGroupDescription:", v12);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("representativeNotificationUUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBUserNotificationDigestNotificationGroup setRepresentativeNotificationUUID:](v5, "setRepresentativeNotificationUUID:", v14);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("priority"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    -[ATXPBUserNotificationDigestNotificationGroup setPriority:](v5, "setPriority:");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sharedDigestEngagementTracker"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = [ATXPBSharedDigestEngagementTrackingMetrics alloc];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sharedDigestEngagementTracker"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[ATXPBSharedDigestEngagementTrackingMetrics initFromJSON:](v18, "initFromJSON:", v20);
      -[ATXPBUserNotificationDigestNotificationGroup setSharedEngagementTracker:](v5, "setSharedEngagementTracker:", v21);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rankedNotifications"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v22);
          v27 = -[ATXPBUserNotification initFromJSON:]([ATXPBUserNotification alloc], "initFromJSON:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v26));
          -[ATXPBUserNotificationDigestNotificationGroup addRankedNotifications:](v5, "addRankedNotifications:", v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v24);
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
  _QWORD v16[7];
  _QWORD v17[8];

  v17[7] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("groupID");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_groupId);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  v16[1] = CFSTR("title");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_title);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v14;
  v16[2] = CFSTR("groupDescription");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_groupDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v3;
  v16[3] = CFSTR("priority");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_priority);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v5;
  v16[4] = CFSTR("representativeNotificationUUID");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_representativeNotificationUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v6;
  v16[5] = CFSTR("rankedNotifications");
  -[NSMutableArray _pas_mappedArrayWithTransform:](self->_rankedNotifications, "_pas_mappedArrayWithTransform:", &__block_literal_global_63);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v8;
  v16[6] = CFSTR("sharedDigestEngagementTracker");
  -[ATXPBUserNotificationDigestNotificationGroup sharedEngagementTracker](self, "sharedEngagementTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsonRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __72__ATXPBUserNotificationDigestNotificationGroup_JSON__jsonRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonRepresentation");
}

@end
