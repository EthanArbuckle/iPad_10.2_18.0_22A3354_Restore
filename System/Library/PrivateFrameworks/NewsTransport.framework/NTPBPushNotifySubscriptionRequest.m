@implementation NTPBPushNotifySubscriptionRequest

- (BOOL)hasNotificationUserId
{
  return self->_notificationUserId != 0;
}

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
}

- (void)clearNotificationEntitys
{
  -[NSMutableArray removeAllObjects](self->_notificationEntitys, "removeAllObjects");
}

- (void)addNotificationEntity:(id)a3
{
  id v4;
  NSMutableArray *notificationEntitys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  notificationEntitys = self->_notificationEntitys;
  v8 = v4;
  if (!notificationEntitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_notificationEntitys;
    self->_notificationEntitys = v6;

    v4 = v8;
    notificationEntitys = self->_notificationEntitys;
  }
  -[NSMutableArray addObject:](notificationEntitys, "addObject:", v4);

}

- (unint64_t)notificationEntitysCount
{
  return -[NSMutableArray count](self->_notificationEntitys, "count");
}

- (id)notificationEntityAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_notificationEntitys, "objectAtIndex:", a3);
}

+ (Class)notificationEntityType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUserStorefrontId
{
  return self->_userStorefrontId != 0;
}

- (void)clearTopicsFolloweds
{
  -[NSMutableArray removeAllObjects](self->_topicsFolloweds, "removeAllObjects");
}

- (void)addTopicsFollowed:(id)a3
{
  id v4;
  NSMutableArray *topicsFolloweds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicsFolloweds = self->_topicsFolloweds;
  v8 = v4;
  if (!topicsFolloweds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicsFolloweds;
    self->_topicsFolloweds = v6;

    v4 = v8;
    topicsFolloweds = self->_topicsFolloweds;
  }
  -[NSMutableArray addObject:](topicsFolloweds, "addObject:", v4);

}

- (unint64_t)topicsFollowedsCount
{
  return -[NSMutableArray count](self->_topicsFolloweds, "count");
}

- (id)topicsFollowedAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicsFolloweds, "objectAtIndex:", a3);
}

+ (Class)topicsFollowedType
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBPushNotifySubscriptionRequest;
  -[NTPBPushNotifySubscriptionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBPushNotifySubscriptionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *notificationUserId;
  NTPBDeviceInfo *deviceInfo;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSString *userStorefrontId;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  notificationUserId = self->_notificationUserId;
  if (notificationUserId)
    objc_msgSend(v3, "setObject:forKey:", notificationUserId, CFSTR("notification_user_id"));
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    -[NTPBDeviceInfo dictionaryRepresentation](deviceInfo, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("device_info"));

  }
  if (-[NSMutableArray count](self->_notificationEntitys, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_notificationEntitys, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = self->_notificationEntitys;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("notification_entity"));
  }
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId)
    objc_msgSend(v4, "setObject:forKey:", userStorefrontId, CFSTR("user_storefront_id"));
  if (-[NSMutableArray count](self->_topicsFolloweds, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_topicsFolloweds, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = self->_topicsFolloweds;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("topics_followed"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPushNotifySubscriptionRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_notificationUserId)
    PBDataWriterWriteStringField();
  if (self->_deviceInfo)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_notificationEntitys;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (self->_userStorefrontId)
    PBDataWriterWriteStringField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_topicsFolloweds;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_notificationUserId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NTPBDeviceInfo copyWithZone:](self->_deviceInfo, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = self->_notificationEntitys;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend(v5, "addNotificationEntity:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_userStorefrontId, "copyWithZone:", a3);
  v17 = (void *)v5[5];
  v5[5] = v16;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_topicsFolloweds;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addTopicsFollowed:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *notificationUserId;
  NTPBDeviceInfo *deviceInfo;
  NSMutableArray *notificationEntitys;
  NSString *userStorefrontId;
  NSMutableArray *topicsFolloweds;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((notificationUserId = self->_notificationUserId, !((unint64_t)notificationUserId | v4[3]))
     || -[NSString isEqual:](notificationUserId, "isEqual:"))
    && ((deviceInfo = self->_deviceInfo, !((unint64_t)deviceInfo | v4[1]))
     || -[NTPBDeviceInfo isEqual:](deviceInfo, "isEqual:"))
    && ((notificationEntitys = self->_notificationEntitys, !((unint64_t)notificationEntitys | v4[2]))
     || -[NSMutableArray isEqual:](notificationEntitys, "isEqual:"))
    && ((userStorefrontId = self->_userStorefrontId, !((unint64_t)userStorefrontId | v4[5]))
     || -[NSString isEqual:](userStorefrontId, "isEqual:")))
  {
    topicsFolloweds = self->_topicsFolloweds;
    if ((unint64_t)topicsFolloweds | v4[4])
      v10 = -[NSMutableArray isEqual:](topicsFolloweds, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_notificationUserId, "hash");
  v4 = -[NTPBDeviceInfo hash](self->_deviceInfo, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_notificationEntitys, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_userStorefrontId, "hash");
  return v6 ^ -[NSMutableArray hash](self->_topicsFolloweds, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NTPBDeviceInfo *deviceInfo;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[NTPBPushNotifySubscriptionRequest setNotificationUserId:](self, "setNotificationUserId:");
  deviceInfo = self->_deviceInfo;
  v6 = *((_QWORD *)v4 + 1);
  if (deviceInfo)
  {
    if (v6)
      -[NTPBDeviceInfo mergeFrom:](deviceInfo, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBPushNotifySubscriptionRequest setDeviceInfo:](self, "setDeviceInfo:");
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[NTPBPushNotifySubscriptionRequest addNotificationEntity:](self, "addNotificationEntity:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 5))
    -[NTPBPushNotifySubscriptionRequest setUserStorefrontId:](self, "setUserStorefrontId:");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v4 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[NTPBPushNotifySubscriptionRequest addTopicsFollowed:](self, "addTopicsFollowed:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (NSString)notificationUserId
{
  return self->_notificationUserId;
}

- (void)setNotificationUserId:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUserId, a3);
}

- (NTPBDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (NSMutableArray)notificationEntitys
{
  return self->_notificationEntitys;
}

- (void)setNotificationEntitys:(id)a3
{
  objc_storeStrong((id *)&self->_notificationEntitys, a3);
}

- (NSString)userStorefrontId
{
  return self->_userStorefrontId;
}

- (void)setUserStorefrontId:(id)a3
{
  objc_storeStrong((id *)&self->_userStorefrontId, a3);
}

- (NSMutableArray)topicsFolloweds
{
  return self->_topicsFolloweds;
}

- (void)setTopicsFolloweds:(id)a3
{
  objc_storeStrong((id *)&self->_topicsFolloweds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorefrontId, 0);
  objc_storeStrong((id *)&self->_topicsFolloweds, 0);
  objc_storeStrong((id *)&self->_notificationUserId, 0);
  objc_storeStrong((id *)&self->_notificationEntitys, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end
