@implementation NTPBNotificationEntity

- (int)notificationType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_notificationType;
  else
    return 0;
}

- (void)setNotificationType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_notificationType = a3;
}

- (void)setHasNotificationType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNotificationType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearTagIds
{
  -[NSMutableArray removeAllObjects](self->_tagIds, "removeAllObjects");
}

- (void)addTagId:(id)a3
{
  id v4;
  NSMutableArray *tagIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  tagIds = self->_tagIds;
  v8 = v4;
  if (!tagIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_tagIds;
    self->_tagIds = v6;

    v4 = v8;
    tagIds = self->_tagIds;
  }
  -[NSMutableArray addObject:](tagIds, "addObject:", v4);

}

- (unint64_t)tagIdsCount
{
  return -[NSMutableArray count](self->_tagIds, "count");
}

- (id)tagIdAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_tagIds, "objectAtIndex:", a3);
}

+ (Class)tagIdType
{
  return (Class)objc_opt_class();
}

- (int)subscriberType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_subscriberType;
  else
    return 0;
}

- (void)setSubscriberType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_subscriberType = a3;
}

- (void)setHasSubscriberType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubscriberType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)paidBundleSubscriptionStatus
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_paidBundleSubscriptionStatus;
  else
    return 0;
}

- (void)setPaidBundleSubscriptionStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_paidBundleSubscriptionStatus = a3;
}

- (void)setHasPaidBundleSubscriptionStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPaidBundleSubscriptionStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)NTPBNotificationEntity;
  -[NTPBNotificationEntity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBNotificationEntity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *tagIds;
  char has;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_notificationType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("notification_type"));

  }
  tagIds = self->_tagIds;
  if (tagIds)
    objc_msgSend(v3, "setObject:forKey:", tagIds, CFSTR("tag_id"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_subscriberType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("subscriber_type"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_paidBundleSubscriptionStatus);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("paid_bundle_subscription_status"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNotificationEntityReadFrom(self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_tagIds;
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

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();

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
  char has;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_notificationType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_tagIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v6, "addTagId:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_subscriberType;
    *(_BYTE *)(v6 + 32) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 12) = self->_paidBundleSubscriptionStatus;
    *(_BYTE *)(v6 + 32) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSMutableArray *tagIds;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_notificationType != *((_DWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_19;
  }
  tagIds = self->_tagIds;
  if ((unint64_t)tagIds | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](tagIds, "isEqual:"))
    {
LABEL_19:
      v7 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_subscriberType != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  v7 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_paidBundleSubscriptionStatus != *((_DWORD *)v4 + 3))
      goto LABEL_19;
    v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_notificationType;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_tagIds, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_subscriberType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_paidBundleSubscriptionStatus;
  return v4 ^ v3 ^ v5 ^ v6;
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
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_notificationType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
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
        -[NTPBNotificationEntity addTagId:](self, "addTagId:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = *((_BYTE *)v5 + 32);
  if ((v11 & 4) != 0)
  {
    self->_subscriberType = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 4u;
    v11 = *((_BYTE *)v5 + 32);
  }
  if ((v11 & 2) != 0)
  {
    self->_paidBundleSubscriptionStatus = *((_DWORD *)v5 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSMutableArray)tagIds
{
  return self->_tagIds;
}

- (void)setTagIds:(id)a3
{
  objc_storeStrong((id *)&self->_tagIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagIds, 0);
}

@end
