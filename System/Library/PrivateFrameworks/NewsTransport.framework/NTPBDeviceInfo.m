@implementation NTPBDeviceInfo

- (BOOL)hasDevicePushToken
{
  return self->_devicePushToken != 0;
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (BOOL)hasDeviceTimezone
{
  return self->_deviceTimezone != 0;
}

- (int)deviceTokenEnv
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_deviceTokenEnv;
  else
    return 0;
}

- (void)setDeviceTokenEnv:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_deviceTokenEnv = a3;
}

- (void)setHasDeviceTokenEnv:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeviceTokenEnv
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearDevicePreferredLanguages
{
  -[NSMutableArray removeAllObjects](self->_devicePreferredLanguages, "removeAllObjects");
}

- (void)addDevicePreferredLanguage:(id)a3
{
  id v4;
  NSMutableArray *devicePreferredLanguages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  devicePreferredLanguages = self->_devicePreferredLanguages;
  v8 = v4;
  if (!devicePreferredLanguages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_devicePreferredLanguages;
    self->_devicePreferredLanguages = v6;

    v4 = v8;
    devicePreferredLanguages = self->_devicePreferredLanguages;
  }
  -[NSMutableArray addObject:](devicePreferredLanguages, "addObject:", v4);

}

- (unint64_t)devicePreferredLanguagesCount
{
  return -[NSMutableArray count](self->_devicePreferredLanguages, "count");
}

- (id)devicePreferredLanguageAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_devicePreferredLanguages, "objectAtIndex:", a3);
}

+ (Class)devicePreferredLanguageType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDeviceOsVersion
{
  return self->_deviceOsVersion != 0;
}

- (void)setDeviceUtcOffset:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deviceUtcOffset = a3;
}

- (void)setHasDeviceUtcOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeviceUtcOffset
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDeviceDstOffset:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deviceDstOffset = a3;
}

- (void)setHasDeviceDstOffset:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceDstOffset
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDeviceAppVersion
{
  return self->_deviceAppVersion != 0;
}

- (BOOL)hasDeviceAppBundleId
{
  return self->_deviceAppBundleId != 0;
}

- (int)deviceDigestMode
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_deviceDigestMode;
  else
    return 0;
}

- (void)setDeviceDigestMode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deviceDigestMode = a3;
}

- (void)setHasDeviceDigestMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeviceDigestMode
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
  v8.super_class = (Class)NTPBDeviceInfo;
  -[NTPBDeviceInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBDeviceInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *devicePushToken;
  NSString *deviceType;
  NSString *deviceTimezone;
  void *v8;
  NSMutableArray *devicePreferredLanguages;
  NSString *deviceOsVersion;
  char has;
  void *v12;
  void *v13;
  NSString *deviceAppVersion;
  NSString *deviceAppBundleId;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  devicePushToken = self->_devicePushToken;
  if (devicePushToken)
    objc_msgSend(v3, "setObject:forKey:", devicePushToken, CFSTR("device_push_token"));
  deviceType = self->_deviceType;
  if (deviceType)
    objc_msgSend(v4, "setObject:forKey:", deviceType, CFSTR("device_type"));
  deviceTimezone = self->_deviceTimezone;
  if (deviceTimezone)
    objc_msgSend(v4, "setObject:forKey:", deviceTimezone, CFSTR("device_timezone"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_deviceTokenEnv);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("device_token_env"));

  }
  devicePreferredLanguages = self->_devicePreferredLanguages;
  if (devicePreferredLanguages)
    objc_msgSend(v4, "setObject:forKey:", devicePreferredLanguages, CFSTR("device_preferred_language"));
  deviceOsVersion = self->_deviceOsVersion;
  if (deviceOsVersion)
    objc_msgSend(v4, "setObject:forKey:", deviceOsVersion, CFSTR("device_os_version"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_deviceUtcOffset);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("device_utc_offset"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_deviceDstOffset);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("device_dst_offset"));

  }
  deviceAppVersion = self->_deviceAppVersion;
  if (deviceAppVersion)
    objc_msgSend(v4, "setObject:forKey:", deviceAppVersion, CFSTR("device_app_version"));
  deviceAppBundleId = self->_deviceAppBundleId;
  if (deviceAppBundleId)
    objc_msgSend(v4, "setObject:forKey:", deviceAppBundleId, CFSTR("device_app_bundle_id"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_deviceDigestMode);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("device_digest_mode"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBDeviceInfoReadFrom(self, (uint64_t)a3);
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
  if (self->_devicePushToken)
    PBDataWriterWriteStringField();
  if (self->_deviceType)
    PBDataWriterWriteStringField();
  if (self->_deviceTimezone)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_devicePreferredLanguages;
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

  if (self->_deviceOsVersion)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_deviceAppVersion)
    PBDataWriterWriteStringField();
  if (self->_deviceAppBundleId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();

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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  char has;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_devicePushToken, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[NSString copyWithZone:](self->_deviceType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v8;

  v10 = -[NSString copyWithZone:](self->_deviceTimezone, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_deviceTokenEnv;
    *(_BYTE *)(v5 + 96) |= 8u;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = self->_devicePreferredLanguages;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend((id)v5, "addDevicePreferredLanguage:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_deviceOsVersion, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v18;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_deviceUtcOffset;
    *(_BYTE *)(v5 + 96) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_deviceDstOffset;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  v21 = -[NSString copyWithZone:](self->_deviceAppVersion, "copyWithZone:", a3, (_QWORD)v26);
  v22 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v21;

  v23 = -[NSString copyWithZone:](self->_deviceAppBundleId, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v23;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_deviceDigestMode;
    *(_BYTE *)(v5 + 96) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *devicePushToken;
  NSString *deviceType;
  NSString *deviceTimezone;
  NSMutableArray *devicePreferredLanguages;
  NSString *deviceOsVersion;
  NSString *deviceAppVersion;
  NSString *deviceAppBundleId;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  devicePushToken = self->_devicePushToken;
  if ((unint64_t)devicePushToken | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](devicePushToken, "isEqual:"))
      goto LABEL_35;
  }
  deviceType = self->_deviceType;
  if ((unint64_t)deviceType | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](deviceType, "isEqual:"))
      goto LABEL_35;
  }
  deviceTimezone = self->_deviceTimezone;
  if ((unint64_t)deviceTimezone | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](deviceTimezone, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 8) == 0 || self->_deviceTokenEnv != *((_DWORD *)v4 + 20))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 96) & 8) != 0)
  {
LABEL_35:
    v12 = 0;
    goto LABEL_36;
  }
  devicePreferredLanguages = self->_devicePreferredLanguages;
  if ((unint64_t)devicePreferredLanguages | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](devicePreferredLanguages, "isEqual:"))
  {
    goto LABEL_35;
  }
  deviceOsVersion = self->_deviceOsVersion;
  if ((unint64_t)deviceOsVersion | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](deviceOsVersion, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_deviceUtcOffset != *((_QWORD *)v4 + 2))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_deviceDstOffset != *((_QWORD *)v4 + 1))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_35;
  }
  deviceAppVersion = self->_deviceAppVersion;
  if ((unint64_t)deviceAppVersion | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](deviceAppVersion, "isEqual:"))
  {
    goto LABEL_35;
  }
  deviceAppBundleId = self->_deviceAppBundleId;
  if ((unint64_t)deviceAppBundleId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceAppBundleId, "isEqual:"))
      goto LABEL_35;
  }
  v12 = (*((_BYTE *)v4 + 96) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 4) == 0 || self->_deviceDigestMode != *((_DWORD *)v4 + 10))
      goto LABEL_35;
    v12 = 1;
  }
LABEL_36:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v13;
  NSUInteger v14;

  v14 = -[NSString hash](self->_devicePushToken, "hash");
  v13 = -[NSString hash](self->_deviceType, "hash");
  v3 = -[NSString hash](self->_deviceTimezone, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v4 = 2654435761 * self->_deviceTokenEnv;
  else
    v4 = 0;
  v5 = -[NSMutableArray hash](self->_devicePreferredLanguages, "hash");
  v6 = -[NSString hash](self->_deviceOsVersion, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_deviceUtcOffset;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_6:
      v8 = 2654435761 * self->_deviceDstOffset;
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:
  v9 = -[NSString hash](self->_deviceAppVersion, "hash");
  v10 = -[NSString hash](self->_deviceAppBundleId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761 * self->_deviceDigestMode;
  else
    v11 = 0;
  return v13 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 8))
    -[NTPBDeviceInfo setDevicePushToken:](self, "setDevicePushToken:");
  if (*((_QWORD *)v4 + 11))
    -[NTPBDeviceInfo setDeviceType:](self, "setDeviceType:");
  if (*((_QWORD *)v4 + 9))
    -[NTPBDeviceInfo setDeviceTimezone:](self, "setDeviceTimezone:");
  if ((*((_BYTE *)v4 + 96) & 8) != 0)
  {
    self->_deviceTokenEnv = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 8u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 7);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        -[NTPBDeviceInfo addDevicePreferredLanguage:](self, "addDevicePreferredLanguage:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 6))
    -[NTPBDeviceInfo setDeviceOsVersion:](self, "setDeviceOsVersion:");
  v10 = *((_BYTE *)v4 + 96);
  if ((v10 & 2) != 0)
  {
    self->_deviceUtcOffset = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v10 = *((_BYTE *)v4 + 96);
  }
  if ((v10 & 1) != 0)
  {
    self->_deviceDstOffset = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
    -[NTPBDeviceInfo setDeviceAppVersion:](self, "setDeviceAppVersion:");
  if (*((_QWORD *)v4 + 3))
    -[NTPBDeviceInfo setDeviceAppBundleId:](self, "setDeviceAppBundleId:");
  if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    self->_deviceDigestMode = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)devicePushToken
{
  return self->_devicePushToken;
}

- (void)setDevicePushToken:(id)a3
{
  objc_storeStrong((id *)&self->_devicePushToken, a3);
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_deviceType, a3);
}

- (NSString)deviceTimezone
{
  return self->_deviceTimezone;
}

- (void)setDeviceTimezone:(id)a3
{
  objc_storeStrong((id *)&self->_deviceTimezone, a3);
}

- (NSMutableArray)devicePreferredLanguages
{
  return self->_devicePreferredLanguages;
}

- (void)setDevicePreferredLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_devicePreferredLanguages, a3);
}

- (NSString)deviceOsVersion
{
  return self->_deviceOsVersion;
}

- (void)setDeviceOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceOsVersion, a3);
}

- (int64_t)deviceUtcOffset
{
  return self->_deviceUtcOffset;
}

- (int64_t)deviceDstOffset
{
  return self->_deviceDstOffset;
}

- (NSString)deviceAppVersion
{
  return self->_deviceAppVersion;
}

- (void)setDeviceAppVersion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAppVersion, a3);
}

- (NSString)deviceAppBundleId
{
  return self->_deviceAppBundleId;
}

- (void)setDeviceAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAppBundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_deviceTimezone, 0);
  objc_storeStrong((id *)&self->_devicePushToken, 0);
  objc_storeStrong((id *)&self->_devicePreferredLanguages, 0);
  objc_storeStrong((id *)&self->_deviceOsVersion, 0);
  objc_storeStrong((id *)&self->_deviceAppVersion, 0);
  objc_storeStrong((id *)&self->_deviceAppBundleId, 0);
}

@end
