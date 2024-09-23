@implementation HDCloudSyncCodableStore

- (BOOL)hasOwnerIdentifier
{
  return self->_ownerIdentifier != 0;
}

- (BOOL)hasPendingOwnerIdentifier
{
  return self->_pendingOwnerIdentifier != 0;
}

- (void)setOrder:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_order = a3;
}

- (void)setHasOrder:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOrder
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasPendingSyncIdentity
{
  return self->_pendingSyncIdentity != 0;
}

- (void)setIsChild:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isChild = a3;
}

- (void)setHasIsChild:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsChild
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasStoreIdentifier
{
  return self->_storeIdentifier != 0;
}

- (void)setActive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_active = a3;
}

- (void)setHasActive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasActive
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)deviceMode
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_deviceMode;
  else
    return 1;
}

- (void)setDeviceMode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deviceMode = a3;
}

- (void)setHasDeviceMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeviceMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)deviceModeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("Basic");
  if (a3 == 2)
  {
    v3 = CFSTR("Satellite");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDeviceMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Basic")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Satellite")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (int)supportedProtocolVersion
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_supportedProtocolVersion;
  else
    return 0;
}

- (void)setSupportedProtocolVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_supportedProtocolVersion = a3;
}

- (void)setHasSupportedProtocolVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportedProtocolVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)supportedProtocolVersionAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Tigris");
  if (a3 == 1)
  {
    v3 = CFSTR("Yukon");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSupportedProtocolVersion:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Tigris")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Yukon"));

  return v4;
}

- (int)requiredProtocolVersion
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_requiredProtocolVersion;
  else
    return 0;
}

- (void)setRequiredProtocolVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_requiredProtocolVersion = a3;
}

- (void)setHasRequiredProtocolVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequiredProtocolVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)requiredProtocolVersionAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Tigris");
  if (a3 == 1)
  {
    v3 = CFSTR("Yukon");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRequiredProtocolVersion:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Tigris")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Yukon"));

  return v4;
}

- (BOOL)hasSystemBuildVersion
{
  return self->_systemBuildVersion != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasShardPredicate
{
  return self->_shardPredicate != 0;
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
  v8.super_class = (Class)HDCloudSyncCodableStore;
  -[HDCloudSyncCodableStore description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableStore dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *ownerIdentifier;
  NSString *pendingOwnerIdentifier;
  void *v7;
  HDCodableSyncIdentity *syncIdentity;
  void *v9;
  HDCodableSyncIdentity *pendingSyncIdentity;
  void *v11;
  void *v12;
  NSData *storeIdentifier;
  char has;
  void *v15;
  int deviceMode;
  __CFString *v17;
  int supportedProtocolVersion;
  __CFString *v19;
  int requiredProtocolVersion;
  __CFString *v21;
  NSString *systemBuildVersion;
  NSString *productType;
  NSString *deviceName;
  HDCloudSyncCodableShardPredicate *shardPredicate;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  ownerIdentifier = self->_ownerIdentifier;
  if (ownerIdentifier)
    objc_msgSend(v3, "setObject:forKey:", ownerIdentifier, CFSTR("ownerIdentifier"));
  pendingOwnerIdentifier = self->_pendingOwnerIdentifier;
  if (pendingOwnerIdentifier)
    objc_msgSend(v4, "setObject:forKey:", pendingOwnerIdentifier, CFSTR("pendingOwnerIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_order);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("order"));

  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("syncIdentity"));

  }
  pendingSyncIdentity = self->_pendingSyncIdentity;
  if (pendingSyncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](pendingSyncIdentity, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("pendingSyncIdentity"));

  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isChild);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("isChild"));

  }
  storeIdentifier = self->_storeIdentifier;
  if (storeIdentifier)
    objc_msgSend(v4, "setObject:forKey:", storeIdentifier, CFSTR("storeIdentifier"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_active);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("active"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_17:
      if ((has & 8) == 0)
        goto LABEL_18;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_17;
  }
  deviceMode = self->_deviceMode;
  if (deviceMode == 1)
  {
    v17 = CFSTR("Basic");
  }
  else if (deviceMode == 2)
  {
    v17 = CFSTR("Satellite");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deviceMode);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("deviceMode"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 4) == 0)
      goto LABEL_39;
    goto LABEL_33;
  }
LABEL_27:
  supportedProtocolVersion = self->_supportedProtocolVersion;
  if (supportedProtocolVersion)
  {
    if (supportedProtocolVersion == 1)
    {
      v19 = CFSTR("Yukon");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_supportedProtocolVersion);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v19 = CFSTR("Tigris");
  }
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("supportedProtocolVersion"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_33:
    requiredProtocolVersion = self->_requiredProtocolVersion;
    if (requiredProtocolVersion)
    {
      if (requiredProtocolVersion == 1)
      {
        v21 = CFSTR("Yukon");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requiredProtocolVersion);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v21 = CFSTR("Tigris");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("requiredProtocolVersion"));

  }
LABEL_39:
  systemBuildVersion = self->_systemBuildVersion;
  if (systemBuildVersion)
    objc_msgSend(v4, "setObject:forKey:", systemBuildVersion, CFSTR("systemBuildVersion"));
  productType = self->_productType;
  if (productType)
    objc_msgSend(v4, "setObject:forKey:", productType, CFSTR("productType"));
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v4, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  shardPredicate = self->_shardPredicate;
  if (shardPredicate)
  {
    -[HDCloudSyncCodableShardPredicate dictionaryRepresentation](shardPredicate, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("shardPredicate"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableStoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_ownerIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_pendingOwnerIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_pendingSyncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_storeIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_17:
      if ((has & 8) == 0)
        goto LABEL_18;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_19:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_20:
  if (self->_systemBuildVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_shardPredicate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_ownerIdentifier)
  {
    objc_msgSend(v4, "setOwnerIdentifier:");
    v4 = v6;
  }
  if (self->_pendingOwnerIdentifier)
  {
    objc_msgSend(v6, "setPendingOwnerIdentifier:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_order;
    *((_BYTE *)v4 + 116) |= 1u;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    v4 = v6;
  }
  if (self->_pendingSyncIdentity)
  {
    objc_msgSend(v6, "setPendingSyncIdentity:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_BYTE *)v4 + 113) = self->_isChild;
    *((_BYTE *)v4 + 116) |= 0x20u;
  }
  if (self->_storeIdentifier)
  {
    objc_msgSend(v6, "setStoreIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_BYTE *)v4 + 112) = self->_active;
    *((_BYTE *)v4 + 116) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_17:
      if ((has & 8) == 0)
        goto LABEL_18;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 4) = self->_deviceMode;
  *((_BYTE *)v4 + 116) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_31:
  *((_DWORD *)v4 + 22) = self->_supportedProtocolVersion;
  *((_BYTE *)v4 + 116) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_19:
    *((_DWORD *)v4 + 16) = self->_requiredProtocolVersion;
    *((_BYTE *)v4 + 116) |= 4u;
  }
LABEL_20:
  if (self->_systemBuildVersion)
  {
    objc_msgSend(v6, "setSystemBuildVersion:");
    v4 = v6;
  }
  if (self->_productType)
  {
    objc_msgSend(v6, "setProductType:");
    v4 = v6;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v6, "setDeviceName:");
    v4 = v6;
  }
  if (self->_shardPredicate)
  {
    objc_msgSend(v6, "setShardPredicate:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char has;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_ownerIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_pendingOwnerIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_order;
    *(_BYTE *)(v5 + 116) |= 1u;
  }
  v10 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v10;

  v12 = -[HDCodableSyncIdentity copyWithZone:](self->_pendingSyncIdentity, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 113) = self->_isChild;
    *(_BYTE *)(v5 + 116) |= 0x20u;
  }
  v14 = -[NSData copyWithZone:](self->_storeIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v14;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 112) = self->_active;
    *(_BYTE *)(v5 + 116) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
LABEL_13:
      *(_DWORD *)(v5 + 88) = self->_supportedProtocolVersion;
      *(_BYTE *)(v5 + 116) |= 8u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 16) = self->_deviceMode;
  *(_BYTE *)(v5 + 116) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 64) = self->_requiredProtocolVersion;
    *(_BYTE *)(v5 + 116) |= 4u;
  }
LABEL_10:
  v17 = -[NSString copyWithZone:](self->_systemBuildVersion, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v17;

  v19 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v19;

  v21 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v21;

  v23 = -[HDCloudSyncCodableShardPredicate copyWithZone:](self->_shardPredicate, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v23;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *ownerIdentifier;
  NSString *pendingOwnerIdentifier;
  HDCodableSyncIdentity *syncIdentity;
  HDCodableSyncIdentity *pendingSyncIdentity;
  char has;
  char v10;
  NSData *storeIdentifier;
  NSString *systemBuildVersion;
  NSString *productType;
  NSString *deviceName;
  HDCloudSyncCodableShardPredicate *shardPredicate;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_57;
  ownerIdentifier = self->_ownerIdentifier;
  if ((unint64_t)ownerIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](ownerIdentifier, "isEqual:"))
      goto LABEL_57;
  }
  pendingOwnerIdentifier = self->_pendingOwnerIdentifier;
  if ((unint64_t)pendingOwnerIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](pendingOwnerIdentifier, "isEqual:"))
      goto LABEL_57;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 1) == 0 || self->_order != *((_QWORD *)v4 + 1))
      goto LABEL_57;
  }
  else if ((*((_BYTE *)v4 + 116) & 1) != 0)
  {
    goto LABEL_57;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 12)
    && !-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
  {
    goto LABEL_57;
  }
  pendingSyncIdentity = self->_pendingSyncIdentity;
  if ((unint64_t)pendingSyncIdentity | *((_QWORD *)v4 + 6))
  {
    if (!-[HDCodableSyncIdentity isEqual:](pendingSyncIdentity, "isEqual:"))
      goto LABEL_57;
  }
  has = (char)self->_has;
  v10 = *((_BYTE *)v4 + 116);
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 0x20) == 0)
      goto LABEL_57;
    if (self->_isChild)
    {
      if (!*((_BYTE *)v4 + 113))
        goto LABEL_57;
    }
    else if (*((_BYTE *)v4 + 113))
    {
      goto LABEL_57;
    }
  }
  else if ((*((_BYTE *)v4 + 116) & 0x20) != 0)
  {
    goto LABEL_57;
  }
  storeIdentifier = self->_storeIdentifier;
  if ((unint64_t)storeIdentifier | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](storeIdentifier, "isEqual:"))
      goto LABEL_57;
    has = (char)self->_has;
    v10 = *((_BYTE *)v4 + 116);
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) != 0)
    {
      if (self->_active)
      {
        if (!*((_BYTE *)v4 + 112))
          goto LABEL_57;
        goto LABEL_34;
      }
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_34;
    }
LABEL_57:
    v16 = 0;
    goto LABEL_58;
  }
  if ((v10 & 0x10) != 0)
    goto LABEL_57;
LABEL_34:
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_deviceMode != *((_DWORD *)v4 + 4))
      goto LABEL_57;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_supportedProtocolVersion != *((_DWORD *)v4 + 22))
      goto LABEL_57;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_requiredProtocolVersion != *((_DWORD *)v4 + 16))
      goto LABEL_57;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_57;
  }
  systemBuildVersion = self->_systemBuildVersion;
  if ((unint64_t)systemBuildVersion | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](systemBuildVersion, "isEqual:"))
  {
    goto LABEL_57;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](productType, "isEqual:"))
      goto LABEL_57;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:"))
      goto LABEL_57;
  }
  shardPredicate = self->_shardPredicate;
  if ((unint64_t)shardPredicate | *((_QWORD *)v4 + 9))
    v16 = -[HDCloudSyncCodableShardPredicate isEqual:](shardPredicate, "isEqual:");
  else
    v16 = 1;
LABEL_58:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;

  v3 = -[NSString hash](self->_ownerIdentifier, "hash");
  v4 = -[NSString hash](self->_pendingOwnerIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_order;
  else
    v5 = 0;
  v6 = -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  v7 = -[HDCodableSyncIdentity hash](self->_pendingSyncIdentity, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v8 = 2654435761 * self->_isChild;
  else
    v8 = 0;
  v9 = -[NSData hash](self->_storeIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v10 = 2654435761 * self->_active;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_9:
      v11 = 2654435761 * self->_deviceMode;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_10;
LABEL_14:
      v12 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_11;
LABEL_15:
      v13 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_14;
LABEL_10:
  v12 = 2654435761 * self->_supportedProtocolVersion;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_15;
LABEL_11:
  v13 = 2654435761 * self->_requiredProtocolVersion;
LABEL_16:
  v14 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v15 = v10 ^ v11 ^ v12 ^ v13 ^ -[NSString hash](self->_systemBuildVersion, "hash");
  v16 = v15 ^ -[NSString hash](self->_productType, "hash");
  v17 = v14 ^ v16 ^ -[NSString hash](self->_deviceName, "hash");
  return v17 ^ -[HDCloudSyncCodableShardPredicate hash](self->_shardPredicate, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v6;
  HDCodableSyncIdentity *pendingSyncIdentity;
  uint64_t v8;
  char v9;
  HDCloudSyncCodableShardPredicate *shardPredicate;
  uint64_t v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCloudSyncCodableStore setOwnerIdentifier:](self, "setOwnerIdentifier:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCloudSyncCodableStore setPendingOwnerIdentifier:](self, "setPendingOwnerIdentifier:");
    v4 = v12;
  }
  if ((*((_BYTE *)v4 + 116) & 1) != 0)
  {
    self->_order = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  syncIdentity = self->_syncIdentity;
  v6 = *((_QWORD *)v4 + 12);
  if (syncIdentity)
  {
    if (!v6)
      goto LABEL_13;
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_13;
    -[HDCloudSyncCodableStore setSyncIdentity:](self, "setSyncIdentity:");
  }
  v4 = v12;
LABEL_13:
  pendingSyncIdentity = self->_pendingSyncIdentity;
  v8 = *((_QWORD *)v4 + 6);
  if (pendingSyncIdentity)
  {
    if (!v8)
      goto LABEL_19;
    -[HDCodableSyncIdentity mergeFrom:](pendingSyncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_19;
    -[HDCloudSyncCodableStore setPendingSyncIdentity:](self, "setPendingSyncIdentity:");
  }
  v4 = v12;
LABEL_19:
  if ((*((_BYTE *)v4 + 116) & 0x20) != 0)
  {
    self->_isChild = *((_BYTE *)v4 + 113);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[HDCloudSyncCodableStore setStoreIdentifier:](self, "setStoreIdentifier:");
    v4 = v12;
  }
  v9 = *((_BYTE *)v4 + 116);
  if ((v9 & 0x10) != 0)
  {
    self->_active = *((_BYTE *)v4 + 112);
    *(_BYTE *)&self->_has |= 0x10u;
    v9 = *((_BYTE *)v4 + 116);
    if ((v9 & 2) == 0)
    {
LABEL_25:
      if ((v9 & 8) == 0)
        goto LABEL_26;
      goto LABEL_39;
    }
  }
  else if ((*((_BYTE *)v4 + 116) & 2) == 0)
  {
    goto LABEL_25;
  }
  self->_deviceMode = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v9 = *((_BYTE *)v4 + 116);
  if ((v9 & 8) == 0)
  {
LABEL_26:
    if ((v9 & 4) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_39:
  self->_supportedProtocolVersion = *((_DWORD *)v4 + 22);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 116) & 4) != 0)
  {
LABEL_27:
    self->_requiredProtocolVersion = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_28:
  if (*((_QWORD *)v4 + 13))
  {
    -[HDCloudSyncCodableStore setSystemBuildVersion:](self, "setSystemBuildVersion:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[HDCloudSyncCodableStore setProductType:](self, "setProductType:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCloudSyncCodableStore setDeviceName:](self, "setDeviceName:");
    v4 = v12;
  }
  shardPredicate = self->_shardPredicate;
  v11 = *((_QWORD *)v4 + 9);
  if (shardPredicate)
  {
    if (v11)
    {
      -[HDCloudSyncCodableShardPredicate mergeFrom:](shardPredicate, "mergeFrom:");
LABEL_43:
      v4 = v12;
    }
  }
  else if (v11)
  {
    -[HDCloudSyncCodableStore setShardPredicate:](self, "setShardPredicate:");
    goto LABEL_43;
  }

}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (void)setOwnerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ownerIdentifier, a3);
}

- (NSString)pendingOwnerIdentifier
{
  return self->_pendingOwnerIdentifier;
}

- (void)setPendingOwnerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pendingOwnerIdentifier, a3);
}

- (int64_t)order
{
  return self->_order;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (HDCodableSyncIdentity)pendingSyncIdentity
{
  return self->_pendingSyncIdentity;
}

- (void)setPendingSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSyncIdentity, a3);
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (NSData)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_storeIdentifier, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (void)setSystemBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_systemBuildVersion, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (HDCloudSyncCodableShardPredicate)shardPredicate
{
  return self->_shardPredicate;
}

- (void)setShardPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_shardPredicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_shardPredicate, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_pendingSyncIdentity, 0);
  objc_storeStrong((id *)&self->_pendingOwnerIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
