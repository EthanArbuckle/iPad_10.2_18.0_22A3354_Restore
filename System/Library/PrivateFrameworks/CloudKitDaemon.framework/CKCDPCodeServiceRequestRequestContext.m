@implementation CKCDPCodeServiceRequestRequestContext

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasContainerName
{
  return self->_containerName != 0;
}

- (int)databaseEnvironment
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_databaseEnvironment;
  else
    return 0;
}

- (void)setDatabaseEnvironment:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_databaseEnvironment = a3;
}

- (void)setHasDatabaseEnvironment:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDatabaseEnvironment
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)databaseEnvironmentAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("sandbox");
  if (a3 == 1)
  {
    v3 = CFSTR("production");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDatabaseEnvironment:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int isEqualToString;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("sandbox")) & 1) != 0)
    isEqualToString = 0;
  else
    isEqualToString = objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("production"));

  return isEqualToString;
}

- (int)databaseType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_databaseType;
  else
    return 0;
}

- (void)setDatabaseType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_databaseType = a3;
}

- (void)setHasDatabaseType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDatabaseType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)databaseTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E78389E0[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDatabaseType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("privateDatabase")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("publicDatabase")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("sharedDatabase")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("orgDatabase")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("teamDatabase")) & 1) != 0)
  {
    v6 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("gameDatabase")))
  {
    v6 = 5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasDeviceId
{
  return self->_deviceId != 0;
}

- (BOOL)hasApplicationBundleId
{
  return self->_applicationBundleId != 0;
}

- (BOOL)hasClientInfo
{
  return self->_clientInfo != 0;
}

- (void)setDsid:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dsid = a3;
}

- (void)setHasDsid:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDsid
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasUserAgent
{
  return self->_userAgent != 0;
}

- (BOOL)hasOperationGroup
{
  return self->_operationGroup != 0;
}

- (BOOL)hasDatabaseOwnerId
{
  return self->_databaseOwnerId != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceRequestRequestContext;
  -[CKCDPCodeServiceRequestRequestContext description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  NSString *userId;
  NSString *containerName;
  char has;
  int databaseEnvironment;
  __CFString *v11;
  const char *v12;
  uint64_t databaseType;
  __CFString *v14;
  NSString *deviceId;
  NSString *applicationBundleId;
  NSString *clientInfo;
  void *v18;
  const char *v19;
  NSString *userAgent;
  CKCDPCodeServiceRequestOperationGroup *operationGroup;
  void *v22;
  const char *v23;
  CKCDPCodeServiceRequestDatabaseOwner *databaseOwnerId;
  void *v25;
  const char *v26;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  userId = self->_userId;
  if (userId)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)userId, CFSTR("userId"));
  containerName = self->_containerName;
  if (containerName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)containerName, CFSTR("containerName"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    databaseEnvironment = self->_databaseEnvironment;
    if (databaseEnvironment)
    {
      if (databaseEnvironment == 1)
      {
        v11 = CFSTR("production");
        objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("production"), CFSTR("databaseEnvironment"));
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_databaseEnvironment);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("databaseEnvironment"));
      }
    }
    else
    {
      v11 = CFSTR("sandbox");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("sandbox"), CFSTR("databaseEnvironment"));
    }

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    databaseType = self->_databaseType;
    if (databaseType >= 6)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_databaseType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E78389E0[databaseType];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v14, CFSTR("databaseType"));

  }
  deviceId = self->_deviceId;
  if (deviceId)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceId, CFSTR("deviceId"));
  applicationBundleId = self->_applicationBundleId;
  if (applicationBundleId)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)applicationBundleId, CFSTR("applicationBundleId"));
  clientInfo = self->_clientInfo;
  if (clientInfo)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)clientInfo, CFSTR("clientInfo"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v5, self->_dsid);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, CFSTR("dsid"));

  }
  userAgent = self->_userAgent;
  if (userAgent)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)userAgent, CFSTR("userAgent"));
  operationGroup = self->_operationGroup;
  if (operationGroup)
  {
    objc_msgSend_dictionaryRepresentation(operationGroup, v5, (uint64_t)userAgent);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v23, (uint64_t)v22, CFSTR("operationGroup"));

  }
  databaseOwnerId = self->_databaseOwnerId;
  if (databaseOwnerId)
  {
    objc_msgSend_dictionaryRepresentation(databaseOwnerId, v5, (uint64_t)userAgent);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v26, (uint64_t)v25, CFSTR("databaseOwnerId"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC757D0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_userId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_containerName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_deviceId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_applicationBundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_clientInfo)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  if (self->_userAgent)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_operationGroup)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_databaseOwnerId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *userId;
  NSString *containerName;
  char has;
  NSString *deviceId;
  NSString *applicationBundleId;
  NSString *clientInfo;
  NSString *userAgent;
  CKCDPCodeServiceRequestOperationGroup *operationGroup;
  CKCDPCodeServiceRequestDatabaseOwner *databaseOwnerId;
  id v15;

  v4 = a3;
  userId = self->_userId;
  v15 = v4;
  if (userId)
  {
    objc_msgSend_setUserId_(v4, v5, (uint64_t)userId);
    v4 = v15;
  }
  containerName = self->_containerName;
  if (containerName)
  {
    objc_msgSend_setContainerName_(v15, v5, (uint64_t)containerName);
    v4 = v15;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_databaseEnvironment;
    *((_BYTE *)v4 + 96) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_databaseType;
    *((_BYTE *)v4 + 96) |= 4u;
  }
  deviceId = self->_deviceId;
  if (deviceId)
  {
    objc_msgSend_setDeviceId_(v15, v5, (uint64_t)deviceId);
    v4 = v15;
  }
  applicationBundleId = self->_applicationBundleId;
  if (applicationBundleId)
  {
    objc_msgSend_setApplicationBundleId_(v15, v5, (uint64_t)applicationBundleId);
    v4 = v15;
  }
  clientInfo = self->_clientInfo;
  if (clientInfo)
  {
    objc_msgSend_setClientInfo_(v15, v5, (uint64_t)clientInfo);
    v4 = v15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_dsid;
    *((_BYTE *)v4 + 96) |= 1u;
  }
  userAgent = self->_userAgent;
  if (userAgent)
  {
    objc_msgSend_setUserAgent_(v15, v5, (uint64_t)userAgent);
    v4 = v15;
  }
  operationGroup = self->_operationGroup;
  if (operationGroup)
  {
    objc_msgSend_setOperationGroup_(v15, v5, (uint64_t)operationGroup);
    v4 = v15;
  }
  databaseOwnerId = self->_databaseOwnerId;
  if (databaseOwnerId)
  {
    objc_msgSend_setDatabaseOwnerId_(v15, v5, (uint64_t)databaseOwnerId);
    v4 = v15;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  char has;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_userId, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 88);
  *(_QWORD *)(v10 + 88) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_containerName, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v15;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 40) = self->_databaseEnvironment;
    *(_BYTE *)(v10 + 96) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v10 + 56) = self->_databaseType;
    *(_BYTE *)(v10 + 96) |= 4u;
  }
  v19 = objc_msgSend_copyWithZone_(self->_deviceId, v17, (uint64_t)a3);
  v20 = *(void **)(v10 + 64);
  *(_QWORD *)(v10 + 64) = v19;

  v22 = objc_msgSend_copyWithZone_(self->_applicationBundleId, v21, (uint64_t)a3);
  v23 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v22;

  v25 = objc_msgSend_copyWithZone_(self->_clientInfo, v24, (uint64_t)a3);
  v26 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v25;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_dsid;
    *(_BYTE *)(v10 + 96) |= 1u;
  }
  v28 = objc_msgSend_copyWithZone_(self->_userAgent, v27, (uint64_t)a3);
  v29 = *(void **)(v10 + 80);
  *(_QWORD *)(v10 + 80) = v28;

  v31 = objc_msgSend_copyWithZone_(self->_operationGroup, v30, (uint64_t)a3);
  v32 = *(void **)(v10 + 72);
  *(_QWORD *)(v10 + 72) = v31;

  v34 = objc_msgSend_copyWithZone_(self->_databaseOwnerId, v33, (uint64_t)a3);
  v35 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v34;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *userId;
  uint64_t v9;
  NSString *containerName;
  uint64_t v11;
  NSString *deviceId;
  uint64_t v13;
  NSString *applicationBundleId;
  uint64_t v15;
  NSString *clientInfo;
  uint64_t v17;
  NSString *userAgent;
  uint64_t v19;
  CKCDPCodeServiceRequestOperationGroup *operationGroup;
  uint64_t v21;
  CKCDPCodeServiceRequestDatabaseOwner *databaseOwnerId;
  uint64_t v23;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_33;
  userId = self->_userId;
  v9 = v4[11];
  if ((unint64_t)userId | v9)
  {
    if (!objc_msgSend_isEqual_(userId, v7, v9))
      goto LABEL_33;
  }
  containerName = self->_containerName;
  v11 = v4[4];
  if ((unint64_t)containerName | v11)
  {
    if (!objc_msgSend_isEqual_(containerName, v7, v11))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) == 0 || self->_databaseEnvironment != *((_DWORD *)v4 + 10))
      goto LABEL_33;
  }
  else if ((v4[12] & 2) != 0)
  {
LABEL_33:
    isEqual = 0;
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[12] & 4) == 0 || self->_databaseType != *((_DWORD *)v4 + 14))
      goto LABEL_33;
  }
  else if ((v4[12] & 4) != 0)
  {
    goto LABEL_33;
  }
  deviceId = self->_deviceId;
  v13 = v4[8];
  if ((unint64_t)deviceId | v13 && !objc_msgSend_isEqual_(deviceId, v7, v13))
    goto LABEL_33;
  applicationBundleId = self->_applicationBundleId;
  v15 = v4[2];
  if ((unint64_t)applicationBundleId | v15)
  {
    if (!objc_msgSend_isEqual_(applicationBundleId, v7, v15))
      goto LABEL_33;
  }
  clientInfo = self->_clientInfo;
  v17 = v4[3];
  if ((unint64_t)clientInfo | v17)
  {
    if (!objc_msgSend_isEqual_(clientInfo, v7, v17))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) == 0 || self->_dsid != v4[1])
      goto LABEL_33;
  }
  else if ((v4[12] & 1) != 0)
  {
    goto LABEL_33;
  }
  userAgent = self->_userAgent;
  v19 = v4[10];
  if ((unint64_t)userAgent | v19 && !objc_msgSend_isEqual_(userAgent, v7, v19))
    goto LABEL_33;
  operationGroup = self->_operationGroup;
  v21 = v4[9];
  if ((unint64_t)operationGroup | v21)
  {
    if (!objc_msgSend_isEqual_(operationGroup, v7, v21))
      goto LABEL_33;
  }
  databaseOwnerId = self->_databaseOwnerId;
  v23 = v4[6];
  if ((unint64_t)databaseOwnerId | v23)
    isEqual = objc_msgSend_isEqual_(databaseOwnerId, v7, v23);
  else
    isEqual = 1;
LABEL_34:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;

  v4 = objc_msgSend_hash(self->_userId, a2, v2);
  v9 = objc_msgSend_hash(self->_containerName, v5, v6);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = 2654435761 * self->_databaseEnvironment;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v11 = 2654435761 * self->_databaseType;
      goto LABEL_6;
    }
  }
  v11 = 0;
LABEL_6:
  v12 = objc_msgSend_hash(self->_deviceId, v7, v8);
  v15 = objc_msgSend_hash(self->_applicationBundleId, v13, v14);
  v18 = objc_msgSend_hash(self->_clientInfo, v16, v17);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v21 = 2654435761u * self->_dsid;
  else
    v21 = 0;
  v22 = v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v15 ^ v18 ^ v21;
  v23 = objc_msgSend_hash(self->_userAgent, v19, v20);
  v26 = v23 ^ objc_msgSend_hash(self->_operationGroup, v24, v25);
  return v22 ^ v26 ^ objc_msgSend_hash(self->_databaseOwnerId, v27, v28);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CKCDPCodeServiceRequestOperationGroup *operationGroup;
  uint64_t v13;
  CKCDPCodeServiceRequestDatabaseOwner *databaseOwnerId;
  uint64_t v15;
  id v16;

  v4 = a3;
  v5 = *((_QWORD *)v4 + 11);
  v16 = v4;
  if (v5)
  {
    objc_msgSend_setUserId_(self, (const char *)v4, v5);
    v4 = v16;
  }
  v6 = *((_QWORD *)v4 + 4);
  if (v6)
  {
    objc_msgSend_setContainerName_(self, (const char *)v4, v6);
    v4 = v16;
  }
  v7 = *((_BYTE *)v4 + 96);
  if ((v7 & 2) != 0)
  {
    self->_databaseEnvironment = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 96);
  }
  if ((v7 & 4) != 0)
  {
    self->_databaseType = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 4u;
  }
  v8 = *((_QWORD *)v4 + 8);
  if (v8)
  {
    objc_msgSend_setDeviceId_(self, (const char *)v4, v8);
    v4 = v16;
  }
  v9 = *((_QWORD *)v4 + 2);
  if (v9)
  {
    objc_msgSend_setApplicationBundleId_(self, (const char *)v4, v9);
    v4 = v16;
  }
  v10 = *((_QWORD *)v4 + 3);
  if (v10)
  {
    objc_msgSend_setClientInfo_(self, (const char *)v4, v10);
    v4 = v16;
  }
  if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    self->_dsid = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v11 = *((_QWORD *)v4 + 10);
  if (v11)
  {
    objc_msgSend_setUserAgent_(self, (const char *)v4, v11);
    v4 = v16;
  }
  operationGroup = self->_operationGroup;
  v13 = *((_QWORD *)v4 + 9);
  if (operationGroup)
  {
    if (!v13)
      goto LABEL_25;
    objc_msgSend_mergeFrom_(operationGroup, (const char *)v4, v13);
  }
  else
  {
    if (!v13)
      goto LABEL_25;
    objc_msgSend_setOperationGroup_(self, (const char *)v4, v13);
  }
  v4 = v16;
LABEL_25:
  databaseOwnerId = self->_databaseOwnerId;
  v15 = *((_QWORD *)v4 + 6);
  if (databaseOwnerId)
  {
    if (v15)
    {
      objc_msgSend_mergeFrom_(databaseOwnerId, (const char *)v4, v15);
LABEL_30:
      v4 = v16;
    }
  }
  else if (v15)
  {
    objc_msgSend_setDatabaseOwnerId_(self, (const char *)v4, v15);
    goto LABEL_30;
  }

}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
  objc_storeStrong((id *)&self->_containerName, a3);
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceId, a3);
}

- (NSString)applicationBundleId
{
  return self->_applicationBundleId;
}

- (void)setApplicationBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundleId, a3);
}

- (NSString)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (unint64_t)dsid
{
  return self->_dsid;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (CKCDPCodeServiceRequestOperationGroup)operationGroup
{
  return self->_operationGroup;
}

- (void)setOperationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_operationGroup, a3);
}

- (CKCDPCodeServiceRequestDatabaseOwner)databaseOwnerId
{
  return self->_databaseOwnerId;
}

- (void)setDatabaseOwnerId:(id)a3
{
  objc_storeStrong((id *)&self->_databaseOwnerId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_databaseOwnerId, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_applicationBundleId, 0);
}

@end
