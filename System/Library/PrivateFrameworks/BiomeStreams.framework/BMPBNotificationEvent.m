@implementation BMPBNotificationEvent

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)usageType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_usageType;
  else
    return 0;
}

- (void)setUsageType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_usageType = a3;
}

- (void)setHasUsageType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUsageType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)usageTypeAsString:(int)a3
{
  if (a3 < 0x15)
    return off_1E26492A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUsageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Receive")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DefaultAction")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SuppAction")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Clear")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ClearAll")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IndirectClear")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Hidden")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Orb")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Dismiss")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLaunch")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Expired")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TapCoalesce")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Deduped")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DevActivated")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DevUnlocked")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Pulldown")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReceivedAndDeliveredActively")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReceivedAndDeliveredPassively")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Modified")) & 1) != 0)
  {
    v4 = 19;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TapExpand")))
  {
    v4 = 20;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasNotificationID
{
  return self->_notificationID != 0;
}

- (BOOL)hasDeviceID
{
  return self->_deviceID != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (void)setBadge:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_badge = a3;
}

- (void)setHasBadge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBadge
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasThreadID
{
  return self->_threadID != 0;
}

- (BOOL)hasCategoryID
{
  return self->_categoryID != 0;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (void)clearContactIDs
{
  -[NSMutableArray removeAllObjects](self->_contactIDs, "removeAllObjects");
}

- (void)addContactIDs:(id)a3
{
  id v4;
  NSMutableArray *contactIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contactIDs = self->_contactIDs;
  v8 = v4;
  if (!contactIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contactIDs;
    self->_contactIDs = v6;

    v4 = v8;
    contactIDs = self->_contactIDs;
  }
  -[NSMutableArray addObject:](contactIDs, "addObject:", v4);

}

- (unint64_t)contactIDsCount
{
  return -[NSMutableArray count](self->_contactIDs, "count");
}

- (id)contactIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contactIDs, "objectAtIndex:", a3);
}

+ (Class)contactIDsType
{
  return (Class)objc_opt_class();
}

- (void)setIsGroupMessage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isGroupMessage = a3;
}

- (void)setHasIsGroupMessage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsGroupMessage
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)BMPBNotificationEvent;
  -[BMPBNotificationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBNotificationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueID;
  char has;
  void *v7;
  uint64_t usageType;
  __CFString *v9;
  NSString *bundleID;
  NSString *notificationID;
  NSString *deviceID;
  NSString *title;
  NSString *subtitle;
  NSString *body;
  void *v16;
  NSString *threadID;
  NSString *categoryID;
  NSString *sectionID;
  NSMutableArray *contactIDs;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(v3, "setObject:forKey:", uniqueID, CFSTR("uniqueID"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("absoluteTimestamp"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    usageType = self->_usageType;
    if (usageType >= 0x15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_usageType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E26492A0[usageType];
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("usageType"));

  }
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v4, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  notificationID = self->_notificationID;
  if (notificationID)
    objc_msgSend(v4, "setObject:forKey:", notificationID, CFSTR("notificationID"));
  deviceID = self->_deviceID;
  if (deviceID)
    objc_msgSend(v4, "setObject:forKey:", deviceID, CFSTR("deviceID"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v4, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  body = self->_body;
  if (body)
    objc_msgSend(v4, "setObject:forKey:", body, CFSTR("body"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_badge);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("badge"));

  }
  threadID = self->_threadID;
  if (threadID)
    objc_msgSend(v4, "setObject:forKey:", threadID, CFSTR("threadID"));
  categoryID = self->_categoryID;
  if (categoryID)
    objc_msgSend(v4, "setObject:forKey:", categoryID, CFSTR("categoryID"));
  sectionID = self->_sectionID;
  if (sectionID)
    objc_msgSend(v4, "setObject:forKey:", sectionID, CFSTR("sectionID"));
  contactIDs = self->_contactIDs;
  if (contactIDs)
    objc_msgSend(v4, "setObject:forKey:", contactIDs, CFSTR("contactIDs"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isGroupMessage);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("isGroupMessage"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBNotificationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if (self->_notificationID)
    PBDataWriterWriteStringField();
  if (self->_deviceID)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_body)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_threadID)
    PBDataWriterWriteStringField();
  if (self->_categoryID)
    PBDataWriterWriteStringField();
  if (self->_sectionID)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_contactIDs;
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
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _BYTE *v10;

  v4 = a3;
  v10 = v4;
  if (self->_uniqueID)
  {
    objc_msgSend(v4, "setUniqueID:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_absoluteTimestamp;
    v4[120] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 28) = self->_usageType;
    v4[120] |= 4u;
  }
  if (self->_bundleID)
  {
    objc_msgSend(v10, "setBundleID:");
    v4 = v10;
  }
  if (self->_notificationID)
  {
    objc_msgSend(v10, "setNotificationID:");
    v4 = v10;
  }
  if (self->_deviceID)
  {
    objc_msgSend(v10, "setDeviceID:");
    v4 = v10;
  }
  if (self->_title)
  {
    objc_msgSend(v10, "setTitle:");
    v4 = v10;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v10, "setSubtitle:");
    v4 = v10;
  }
  if (self->_body)
  {
    objc_msgSend(v10, "setBody:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_badge;
    v4[120] |= 2u;
  }
  if (self->_threadID)
    objc_msgSend(v10, "setThreadID:");
  if (self->_categoryID)
    objc_msgSend(v10, "setCategoryID:");
  if (self->_sectionID)
    objc_msgSend(v10, "setSectionID:");
  if (-[BMPBNotificationEvent contactIDsCount](self, "contactIDsCount"))
  {
    objc_msgSend(v10, "clearContactIDs");
    v6 = -[BMPBNotificationEvent contactIDsCount](self, "contactIDsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[BMPBNotificationEvent contactIDsAtIndex:](self, "contactIDsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addContactIDs:", v9);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v10[116] = self->_isGroupMessage;
    v10[120] |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 120) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_usageType;
    *(_BYTE *)(v5 + 120) |= 4u;
  }
  v9 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_notificationID, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  v13 = -[NSString copyWithZone:](self->_deviceID, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  v15 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v15;

  v17 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v17;

  v19 = -[NSString copyWithZone:](self->_body, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v19;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_badge;
    *(_BYTE *)(v5 + 120) |= 2u;
  }
  v21 = -[NSString copyWithZone:](self->_threadID, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v21;

  v23 = -[NSString copyWithZone:](self->_categoryID, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v23;

  v25 = -[NSString copyWithZone:](self->_sectionID, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v25;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = self->_contactIDs;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v34);
        objc_msgSend((id)v5, "addContactIDs:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v29);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 116) = self->_isGroupMessage;
    *(_BYTE *)(v5 + 120) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueID;
  NSString *bundleID;
  NSString *notificationID;
  NSString *deviceID;
  NSString *title;
  NSString *subtitle;
  NSString *body;
  NSString *threadID;
  NSString *categoryID;
  NSString *sectionID;
  NSMutableArray *contactIDs;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:"))
      goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 4) == 0 || self->_usageType != *((_DWORD *)v4 + 28))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 120) & 4) != 0)
  {
    goto LABEL_41;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](bundleID, "isEqual:"))
    goto LABEL_41;
  notificationID = self->_notificationID;
  if ((unint64_t)notificationID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](notificationID, "isEqual:"))
      goto LABEL_41;
  }
  deviceID = self->_deviceID;
  if ((unint64_t)deviceID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](deviceID, "isEqual:"))
      goto LABEL_41;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_41;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:"))
      goto LABEL_41;
  }
  body = self->_body;
  if ((unint64_t)body | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](body, "isEqual:"))
      goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 2) == 0 || self->_badge != *((_QWORD *)v4 + 2))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 120) & 2) != 0)
  {
    goto LABEL_41;
  }
  threadID = self->_threadID;
  if ((unint64_t)threadID | *((_QWORD *)v4 + 11) && !-[NSString isEqual:](threadID, "isEqual:"))
    goto LABEL_41;
  categoryID = self->_categoryID;
  if ((unint64_t)categoryID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](categoryID, "isEqual:"))
      goto LABEL_41;
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](sectionID, "isEqual:"))
      goto LABEL_41;
  }
  contactIDs = self->_contactIDs;
  if ((unint64_t)contactIDs | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](contactIDs, "isEqual:"))
      goto LABEL_41;
  }
  v16 = (*((_BYTE *)v4 + 120) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 8) == 0)
    {
LABEL_41:
      v16 = 0;
      goto LABEL_42;
    }
    if (self->_isGroupMessage)
    {
      if (!*((_BYTE *)v4 + 116))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 116))
    {
      goto LABEL_41;
    }
    v16 = 1;
  }
LABEL_42:

  return v16;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double absoluteTimestamp;
  double v6;
  long double v7;
  double v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  unint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  unint64_t v23;
  NSUInteger v24;

  v24 = -[NSString hash](self->_uniqueID, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v6 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v6 = self->_absoluteTimestamp;
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
  v23 = v4;
  if ((has & 4) != 0)
    v22 = 2654435761 * self->_usageType;
  else
    v22 = 0;
  v21 = -[NSString hash](self->_bundleID, "hash");
  v20 = -[NSString hash](self->_notificationID, "hash");
  v19 = -[NSString hash](self->_deviceID, "hash");
  v9 = -[NSString hash](self->_title, "hash");
  v10 = -[NSString hash](self->_subtitle, "hash");
  v11 = -[NSString hash](self->_body, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v12 = 2654435761u * self->_badge;
  else
    v12 = 0;
  v13 = -[NSString hash](self->_threadID, "hash");
  v14 = -[NSString hash](self->_categoryID, "hash");
  v15 = -[NSString hash](self->_sectionID, "hash");
  v16 = -[NSMutableArray hash](self->_contactIDs, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v17 = 2654435761 * self->_isGroupMessage;
  else
    v17 = 0;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
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
  if (*((_QWORD *)v4 + 13))
    -[BMPBNotificationEvent setUniqueID:](self, "setUniqueID:");
  v5 = *((_BYTE *)v4 + 120);
  if ((v5 & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 120);
  }
  if ((v5 & 4) != 0)
  {
    self->_usageType = *((_DWORD *)v4 + 28);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 4))
    -[BMPBNotificationEvent setBundleID:](self, "setBundleID:");
  if (*((_QWORD *)v4 + 8))
    -[BMPBNotificationEvent setNotificationID:](self, "setNotificationID:");
  if (*((_QWORD *)v4 + 7))
    -[BMPBNotificationEvent setDeviceID:](self, "setDeviceID:");
  if (*((_QWORD *)v4 + 12))
    -[BMPBNotificationEvent setTitle:](self, "setTitle:");
  if (*((_QWORD *)v4 + 10))
    -[BMPBNotificationEvent setSubtitle:](self, "setSubtitle:");
  if (*((_QWORD *)v4 + 3))
    -[BMPBNotificationEvent setBody:](self, "setBody:");
  if ((*((_BYTE *)v4 + 120) & 2) != 0)
  {
    self->_badge = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 11))
    -[BMPBNotificationEvent setThreadID:](self, "setThreadID:");
  if (*((_QWORD *)v4 + 5))
    -[BMPBNotificationEvent setCategoryID:](self, "setCategoryID:");
  if (*((_QWORD *)v4 + 9))
    -[BMPBNotificationEvent setSectionID:](self, "setSectionID:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        -[BMPBNotificationEvent addContactIDs:](self, "addContactIDs:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*((_BYTE *)v4 + 120) & 8) != 0)
  {
    self->_isGroupMessage = *((_BYTE *)v4 + 116);
    *(_BYTE *)&self->_has |= 8u;
  }

}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
  objc_storeStrong((id *)&self->_notificationID, a3);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (unint64_t)badge
{
  return self->_badge;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
  objc_storeStrong((id *)&self->_threadID, a3);
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
  objc_storeStrong((id *)&self->_categoryID, a3);
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_sectionID, a3);
}

- (NSMutableArray)contactIDs
{
  return self->_contactIDs;
}

- (void)setContactIDs:(id)a3
{
  objc_storeStrong((id *)&self->_contactIDs, a3);
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end
