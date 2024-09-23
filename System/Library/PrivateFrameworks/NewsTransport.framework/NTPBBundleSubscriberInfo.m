@implementation NTPBBundleSubscriberInfo

- (int)bundleSubscriptionStatus
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_bundleSubscriptionStatus;
  else
    return 0;
}

- (void)setBundleSubscriptionStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bundleSubscriptionStatus = a3;
}

- (void)setHasBundleSubscriptionStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBundleSubscriptionStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)bundleSubscriptionStatusAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD50798[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBundleSubscriptionStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_BUNDLE_SUBSCRIPTION_STATUS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNPAID_BUNDLE_SUBSCRIPTION_STATUS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAID_BUNDLE_SUBSCRIPTION_STATUS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NO_BUNDLE_SUBSCRIPTION_STATUS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearSubscribedChannelIds
{
  -[NSMutableArray removeAllObjects](self->_subscribedChannelIds, "removeAllObjects");
}

- (void)addSubscribedChannelIds:(id)a3
{
  id v4;
  NSMutableArray *subscribedChannelIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subscribedChannelIds = self->_subscribedChannelIds;
  v8 = v4;
  if (!subscribedChannelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_subscribedChannelIds;
    self->_subscribedChannelIds = v6;

    v4 = v8;
    subscribedChannelIds = self->_subscribedChannelIds;
  }
  -[NSMutableArray addObject:](subscribedChannelIds, "addObject:", v4);

}

- (unint64_t)subscribedChannelIdsCount
{
  return -[NSMutableArray count](self->_subscribedChannelIds, "count");
}

- (id)subscribedChannelIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_subscribedChannelIds, "objectAtIndex:", a3);
}

+ (Class)subscribedChannelIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasUserStorefrontId
{
  return self->_userStorefrontId != 0;
}

- (void)setStartTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startTimestamp = a3;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsStoreDemoModeEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isStoreDemoModeEnabled = a3;
}

- (void)setHasIsStoreDemoModeEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsStoreDemoModeEnabled
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsBundlePurchaser:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isBundlePurchaser = a3;
}

- (void)setHasIsBundlePurchaser:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsBundlePurchaser
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsAmplifyUser:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isAmplifyUser = a3;
}

- (void)setHasIsAmplifyUser:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsAmplifyUser
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)NTPBBundleSubscriberInfo;
  -[NTPBBundleSubscriberInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBBundleSubscriberInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t bundleSubscriptionStatus;
  __CFString *v5;
  NSMutableArray *subscribedChannelIds;
  NSString *userId;
  NSString *userStorefrontId;
  char has;
  void *v10;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    bundleSubscriptionStatus = self->_bundleSubscriptionStatus;
    if (bundleSubscriptionStatus >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_bundleSubscriptionStatus);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24CD50798[bundleSubscriptionStatus];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("bundle_subscription_status"));

  }
  subscribedChannelIds = self->_subscribedChannelIds;
  if (subscribedChannelIds)
    objc_msgSend(v3, "setObject:forKey:", subscribedChannelIds, CFSTR("subscribed_channel_ids"));
  userId = self->_userId;
  if (userId)
    objc_msgSend(v3, "setObject:forKey:", userId, CFSTR("user_id"));
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId)
    objc_msgSend(v3, "setObject:forKey:", userStorefrontId, CFSTR("user_storefront_id"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_startTimestamp);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("start_timestamp"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_14:
      if ((has & 8) == 0)
        goto LABEL_15;
LABEL_20:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBundlePurchaser);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("is_bundle_purchaser"));

      if ((*(_BYTE *)&self->_has & 4) == 0)
        return v3;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isStoreDemoModeEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("is_store_demo_mode_enabled"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_20;
LABEL_15:
  if ((has & 4) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAmplifyUser);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("is_amplify_user"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBundleSubscriberInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_subscribedChannelIds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_userId)
    PBDataWriterWriteStringField();
  if (self->_userStorefrontId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_16:
      if ((has & 8) == 0)
        goto LABEL_17;
LABEL_22:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_22;
LABEL_17:
  if ((has & 4) != 0)
LABEL_18:
    PBDataWriterWriteBOOLField();
LABEL_19:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char has;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_bundleSubscriptionStatus;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_subscribedChannelIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v6, "addSubscribedChannelIds:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v13 = -[NSString copyWithZone:](self->_userId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v13;

  v15 = -[NSString copyWithZone:](self->_userStorefrontId, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_startTimestamp;
    *(_BYTE *)(v6 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_12:
      if ((has & 8) == 0)
        goto LABEL_13;
LABEL_18:
      *(_BYTE *)(v6 + 49) = self->_isBundlePurchaser;
      *(_BYTE *)(v6 + 52) |= 8u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        return (id)v6;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_12;
  }
  *(_BYTE *)(v6 + 50) = self->_isStoreDemoModeEnabled;
  *(_BYTE *)(v6 + 52) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_18;
LABEL_13:
  if ((has & 4) != 0)
  {
LABEL_14:
    *(_BYTE *)(v6 + 48) = self->_isAmplifyUser;
    *(_BYTE *)(v6 + 52) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *subscribedChannelIds;
  NSString *userId;
  NSString *userStorefrontId;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_bundleSubscriptionStatus != *((_DWORD *)v4 + 4))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_36;
  }
  subscribedChannelIds = self->_subscribedChannelIds;
  if ((unint64_t)subscribedChannelIds | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](subscribedChannelIds, "isEqual:"))
  {
    goto LABEL_36;
  }
  userId = self->_userId;
  if ((unint64_t)userId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](userId, "isEqual:"))
      goto LABEL_36;
  }
  userStorefrontId = self->_userStorefrontId;
  if ((unint64_t)userStorefrontId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](userStorefrontId, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_startTimestamp != *((_QWORD *)v4 + 1))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) == 0)
      goto LABEL_36;
    if (self->_isStoreDemoModeEnabled)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_36;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_36;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0)
      goto LABEL_36;
    if (self->_isBundlePurchaser)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_36;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_36;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_36;
  }
  v8 = (*((_BYTE *)v4 + 52) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) != 0)
    {
      if (self->_isAmplifyUser)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_36;
      }
      else if (*((_BYTE *)v4 + 48))
      {
        goto LABEL_36;
      }
      v8 = 1;
      goto LABEL_37;
    }
LABEL_36:
    v8 = 0;
  }
LABEL_37:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_bundleSubscriptionStatus;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_subscribedChannelIds, "hash");
  v5 = -[NSString hash](self->_userId, "hash");
  v6 = -[NSString hash](self->_userStorefrontId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_startTimestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      v8 = 2654435761 * self->_isStoreDemoModeEnabled;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_7;
LABEL_11:
      v9 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_8;
LABEL_12:
      v10 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_7:
  v9 = 2654435761 * self->_isBundlePurchaser;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_8:
  v10 = 2654435761 * self->_isAmplifyUser;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    self->_bundleSubscriptionStatus = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v4 + 3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[NTPBBundleSubscriberInfo addSubscribedChannelIds:](self, "addSubscribedChannelIds:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v5 + 4))
    -[NTPBBundleSubscriberInfo setUserId:](self, "setUserId:");
  if (*((_QWORD *)v5 + 5))
    -[NTPBBundleSubscriberInfo setUserStorefrontId:](self, "setUserStorefrontId:");
  v11 = *((_BYTE *)v5 + 52);
  if ((v11 & 1) != 0)
  {
    self->_startTimestamp = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v11 = *((_BYTE *)v5 + 52);
    if ((v11 & 0x10) == 0)
    {
LABEL_16:
      if ((v11 & 8) == 0)
        goto LABEL_17;
LABEL_22:
      self->_isBundlePurchaser = *((_BYTE *)v5 + 49);
      *(_BYTE *)&self->_has |= 8u;
      if ((*((_BYTE *)v5 + 52) & 4) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v5 + 52) & 0x10) == 0)
  {
    goto LABEL_16;
  }
  self->_isStoreDemoModeEnabled = *((_BYTE *)v5 + 50);
  *(_BYTE *)&self->_has |= 0x10u;
  v11 = *((_BYTE *)v5 + 52);
  if ((v11 & 8) != 0)
    goto LABEL_22;
LABEL_17:
  if ((v11 & 4) != 0)
  {
LABEL_18:
    self->_isAmplifyUser = *((_BYTE *)v5 + 48);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_19:

}

- (NSMutableArray)subscribedChannelIds
{
  return self->_subscribedChannelIds;
}

- (void)setSubscribedChannelIds:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedChannelIds, a3);
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (NSString)userStorefrontId
{
  return self->_userStorefrontId;
}

- (void)setUserStorefrontId:(id)a3
{
  objc_storeStrong((id *)&self->_userStorefrontId, a3);
}

- (int64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (BOOL)isStoreDemoModeEnabled
{
  return self->_isStoreDemoModeEnabled;
}

- (BOOL)isBundlePurchaser
{
  return self->_isBundlePurchaser;
}

- (BOOL)isAmplifyUser
{
  return self->_isAmplifyUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorefrontId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_subscribedChannelIds, 0);
}

@end
