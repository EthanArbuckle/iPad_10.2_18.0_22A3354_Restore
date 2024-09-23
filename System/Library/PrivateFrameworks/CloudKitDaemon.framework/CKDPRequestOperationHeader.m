@implementation CKDPRequestOperationHeader

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  NSMutableArray *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const char *v12;
  NSMutableArray *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  const char *v19;
  __int16 v20;
  NSMutableArray *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  const char *v27;
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
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_userToken)
    PBDataWriterWriteStringField();
  if (self->_applicationContainer)
    PBDataWriterWriteStringField();
  if (self->_applicationBundle)
    PBDataWriterWriteStringField();
  if (self->_applicationVersion)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_deviceIdentifier)
    PBDataWriterWriteSubmessage();
  if (self->_deviceSoftwareVersion)
    PBDataWriterWriteStringField();
  if (self->_deviceHardwareVersion)
    PBDataWriterWriteStringField();
  if (self->_deviceLibraryName)
    PBDataWriterWriteStringField();
  if (self->_deviceLibraryVersion)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_locale)
    PBDataWriterWriteSubmessage();
  if (self->_mmcsProtocolVersion)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_clientChangeToken)
    PBDataWriterWriteDataField();
  if (self->_deviceAssignedName)
    PBDataWriterWriteStringField();
  if (self->_deviceHardwareID)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_userIDContainerID)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_operationGroupName)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 8) != 0)
    PBDataWriterWriteUint64Field();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = self->_serviceIdentityKeyIDs;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v36, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v6);
        PBDataWriterWriteDataField();
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v36, v42, 16);
    }
    while (v9);
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_assetAuthorizeGetRequestOptions)
    PBDataWriterWriteSubmessage();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = self->_activeThrottlingLabels;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v32, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v13);
        PBDataWriterWriteStringField();
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v19, (uint64_t)&v32, v41, 16);
    }
    while (v16);
  }

  if (self->_deviceUDID)
    PBDataWriterWriteStringField();
  if (self->_deviceSerialNumber)
    PBDataWriterWriteStringField();
  v20 = (__int16)self->_has;
  if ((v20 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v20 = (__int16)self->_has;
  }
  if ((v20 & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = self->_supplementalZoneInfos;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v28, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v27, (uint64_t)&v28, v40, 16);
    }
    while (v24);
  }

  if (self->_zoneAndShareUsageInfo)
    PBDataWriterWriteSubmessage();

}

- (CKDPRequestOperationHeaderAssetAuthorizeGetRequestOptions)assetAuthorizeGetRequestOptions
{
  return self->_assetAuthorizeGetRequestOptions;
}

- (CKDPLocale)locale
{
  return self->_locale;
}

- (void)setTargetDatabase:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_targetDatabase = a3;
}

- (void)setRequestOriginator:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_requestOriginator = a3;
}

- (void)setOperationGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_operationGroupName, a3);
}

- (void)setMmcsProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_mmcsProtocolVersion, a3);
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void)setIsolationLevel:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isolationLevel = a3;
}

- (void)setEntitlementsValidated:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_entitlementsValidated = a3;
}

- (void)setDeviceUDID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUDID, a3);
}

- (void)setDeviceSoftwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSoftwareVersion, a3);
}

- (void)setDeviceSoftwareIsAppleInternal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_deviceSoftwareIsAppleInternal = a3;
}

- (void)setDeviceSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSerialNumber, a3);
}

- (void)setDeviceLibraryVersion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLibraryVersion, a3);
}

- (void)setDeviceLibraryName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLibraryName, a3);
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (void)setDeviceHardwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceHardwareVersion, a3);
}

- (void)setDeviceHardwareID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceHardwareID, a3);
}

- (void)setDeviceAssignedName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAssignedName, a3);
}

- (void)setAssetAuthorizeGetRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_assetAuthorizeGetRequestOptions, a3);
}

- (void)setApplicationVersion:(id)a3
{
  objc_storeStrong((id *)&self->_applicationVersion, a3);
}

- (void)setApplicationContainerEnvironment:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_applicationContainerEnvironment = a3;
}

- (void)setApplicationContainer:(id)a3
{
  objc_storeStrong((id *)&self->_applicationContainer, a3);
}

- (void)setApplicationBundle:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneAndShareUsageInfo, 0);
  objc_storeStrong((id *)&self->_userToken, 0);
  objc_storeStrong((id *)&self->_userIDContainerID, 0);
  objc_storeStrong((id *)&self->_supplementalZoneInfos, 0);
  objc_storeStrong((id *)&self->_serviceIdentityKeyIDs, 0);
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_mmcsProtocolVersion, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_deviceSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceLibraryVersion, 0);
  objc_storeStrong((id *)&self->_deviceLibraryName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceHardwareVersion, 0);
  objc_storeStrong((id *)&self->_deviceHardwareID, 0);
  objc_storeStrong((id *)&self->_deviceAssignedName, 0);
  objc_storeStrong((id *)&self->_clientChangeToken, 0);
  objc_storeStrong((id *)&self->_assetAuthorizeGetRequestOptions, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_applicationContainer, 0);
  objc_storeStrong((id *)&self->_applicationBundle, 0);
  objc_storeStrong((id *)&self->_activeThrottlingLabels, 0);
}

- (BOOL)hasUserToken
{
  return self->_userToken != 0;
}

- (BOOL)hasApplicationContainer
{
  return self->_applicationContainer != 0;
}

- (BOOL)hasApplicationBundle
{
  return self->_applicationBundle != 0;
}

- (BOOL)hasApplicationVersion
{
  return self->_applicationVersion != 0;
}

- (void)setApplicationConfigVersion:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_applicationConfigVersion = a3;
}

- (void)setHasApplicationConfigVersion:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasApplicationConfigVersion
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setGlobalConfigVersion:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_globalConfigVersion = a3;
}

- (void)setHasGlobalConfigVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGlobalConfigVersion
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasDeviceSoftwareVersion
{
  return self->_deviceSoftwareVersion != 0;
}

- (BOOL)hasDeviceHardwareVersion
{
  return self->_deviceHardwareVersion != 0;
}

- (BOOL)hasDeviceLibraryName
{
  return self->_deviceLibraryName != 0;
}

- (BOOL)hasDeviceLibraryVersion
{
  return self->_deviceLibraryVersion != 0;
}

- (void)setDeviceProtocolVersion:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_deviceProtocolVersion = a3;
}

- (void)setHasDeviceProtocolVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDeviceProtocolVersion
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasMmcsProtocolVersion
{
  return self->_mmcsProtocolVersion != 0;
}

- (int)applicationContainerEnvironment
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_applicationContainerEnvironment;
  else
    return 2;
}

- (void)setHasApplicationContainerEnvironment:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasApplicationContainerEnvironment
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)applicationContainerEnvironmentAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("production");
  if (a3 == 2)
  {
    v3 = CFSTR("sandbox");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsApplicationContainerEnvironment:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("production")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("sandbox")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (BOOL)hasClientChangeToken
{
  return self->_clientChangeToken != 0;
}

- (BOOL)hasDeviceAssignedName
{
  return self->_deviceAssignedName != 0;
}

- (BOOL)hasDeviceHardwareID
{
  return self->_deviceHardwareID != 0;
}

- (int)targetDatabase
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_targetDatabase;
  else
    return 1;
}

- (void)setHasTargetDatabase:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTargetDatabase
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)targetDatabaseAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E78330D0[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTargetDatabase:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("privateDB")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("publicDB")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("sharedDB")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("orgDB")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasUserIDContainerID
{
  return self->_userIDContainerID != 0;
}

- (int)isolationLevel
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_isolationLevel;
  else
    return 1;
}

- (void)setHasIsolationLevel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsolationLevel
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)isolationLevelAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("zone");
  if (a3 == 2)
  {
    v3 = CFSTR("operation");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsIsolationLevel:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("zone")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("operation")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (BOOL)hasOperationGroupName
{
  return self->_operationGroupName != 0;
}

- (void)setOperationGroupQuantity:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_operationGroupQuantity = a3;
}

- (void)setHasOperationGroupQuantity:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasOperationGroupQuantity
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)clearServiceIdentityKeyIDs
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_serviceIdentityKeyIDs, a2, v2);
}

- (void)addServiceIdentityKeyIDs:(id)a3
{
  const char *v4;
  NSMutableArray *serviceIdentityKeyIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  serviceIdentityKeyIDs = self->_serviceIdentityKeyIDs;
  v8 = (char *)v4;
  if (!serviceIdentityKeyIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_serviceIdentityKeyIDs;
    self->_serviceIdentityKeyIDs = v6;

    v4 = v8;
    serviceIdentityKeyIDs = self->_serviceIdentityKeyIDs;
  }
  objc_msgSend_addObject_(serviceIdentityKeyIDs, v4, (uint64_t)v4);

}

- (unint64_t)serviceIdentityKeyIDsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_serviceIdentityKeyIDs, a2, v2);
}

- (id)serviceIdentityKeyIDsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_serviceIdentityKeyIDs, a2, a3);
}

+ (Class)serviceIdentityKeyIDsType
{
  return (Class)objc_opt_class();
}

- (void)setHasDeviceSoftwareIsAppleInternal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasDeviceSoftwareIsAppleInternal
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasAssetAuthorizeGetRequestOptions
{
  return self->_assetAuthorizeGetRequestOptions != 0;
}

- (void)clearActiveThrottlingLabels
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_activeThrottlingLabels, a2, v2);
}

- (void)addActiveThrottlingLabel:(id)a3
{
  const char *v4;
  NSMutableArray *activeThrottlingLabels;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  activeThrottlingLabels = self->_activeThrottlingLabels;
  v8 = (char *)v4;
  if (!activeThrottlingLabels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_activeThrottlingLabels;
    self->_activeThrottlingLabels = v6;

    v4 = v8;
    activeThrottlingLabels = self->_activeThrottlingLabels;
  }
  objc_msgSend_addObject_(activeThrottlingLabels, v4, (uint64_t)v4);

}

- (unint64_t)activeThrottlingLabelsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_activeThrottlingLabels, a2, v2);
}

- (id)activeThrottlingLabelAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_activeThrottlingLabels, a2, a3);
}

+ (Class)activeThrottlingLabelType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDeviceUDID
{
  return self->_deviceUDID != 0;
}

- (BOOL)hasDeviceSerialNumber
{
  return self->_deviceSerialNumber != 0;
}

- (void)setHasEntitlementsValidated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasEntitlementsValidated
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)requestOriginator
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_requestOriginator;
  else
    return 1;
}

- (void)setHasRequestOriginator:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRequestOriginator
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)requestOriginatorAsString:(int)a3
{
  if ((a3 - 1) < 6)
    return off_1E78330F0[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestOriginator:(id)a3
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
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("unknown")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("cloudd")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("iCloudApp")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("syncEngine")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("adopter")) & 1) != 0)
  {
    v6 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("ckctl")))
  {
    v6 = 6;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)clearSupplementalZoneInfos
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_supplementalZoneInfos, a2, v2);
}

- (void)addSupplementalZoneInfos:(id)a3
{
  const char *v4;
  NSMutableArray *supplementalZoneInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  supplementalZoneInfos = self->_supplementalZoneInfos;
  v8 = (char *)v4;
  if (!supplementalZoneInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_supplementalZoneInfos;
    self->_supplementalZoneInfos = v6;

    v4 = v8;
    supplementalZoneInfos = self->_supplementalZoneInfos;
  }
  objc_msgSend_addObject_(supplementalZoneInfos, v4, (uint64_t)v4);

}

- (unint64_t)supplementalZoneInfosCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_supplementalZoneInfos, a2, v2);
}

- (id)supplementalZoneInfosAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_supplementalZoneInfos, a2, a3);
}

+ (Class)supplementalZoneInfosType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasZoneAndShareUsageInfo
{
  return self->_zoneAndShareUsageInfo != 0;
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
  v11.super_class = (Class)CKDPRequestOperationHeader;
  -[CKDPRequestOperationHeader description](&v11, sel_description);
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
  NSString *userToken;
  NSString *applicationContainer;
  NSString *applicationBundle;
  NSString *applicationVersion;
  __int16 has;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  CKDPIdentifier *deviceIdentifier;
  void *v17;
  const char *v18;
  NSString *deviceSoftwareVersion;
  NSString *deviceHardwareVersion;
  NSString *deviceLibraryName;
  NSString *deviceLibraryVersion;
  void *v23;
  const char *v24;
  CKDPLocale *locale;
  void *v26;
  const char *v27;
  NSString *mmcsProtocolVersion;
  int applicationContainerEnvironment;
  __CFString *v30;
  const char *v31;
  NSData *clientChangeToken;
  NSString *deviceAssignedName;
  NSString *deviceHardwareID;
  unsigned int v35;
  __CFString *v36;
  NSString *userIDContainerID;
  int isolationLevel;
  __CFString *v39;
  const char *v40;
  NSString *operationGroupName;
  void *v42;
  const char *v43;
  NSMutableArray *serviceIdentityKeyIDs;
  void *v45;
  const char *v46;
  CKDPRequestOperationHeaderAssetAuthorizeGetRequestOptions *assetAuthorizeGetRequestOptions;
  void *v48;
  const char *v49;
  NSMutableArray *activeThrottlingLabels;
  NSString *deviceUDID;
  NSString *deviceSerialNumber;
  __int16 v53;
  void *v54;
  const char *v55;
  unsigned int v56;
  __CFString *v57;
  const char *v58;
  uint64_t v59;
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  void *v65;
  NSMutableArray *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  const char *v75;
  const char *v76;
  CKDPRequestOperationHeaderZoneAndShareUsageInfo *zoneAndShareUsageInfo;
  void *v78;
  const char *v79;
  id v80;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  userToken = self->_userToken;
  if (userToken)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)userToken, CFSTR("userToken"));
  applicationContainer = self->_applicationContainer;
  if (applicationContainer)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)applicationContainer, CFSTR("applicationContainer"));
  applicationBundle = self->_applicationBundle;
  if (applicationBundle)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)applicationBundle, CFSTR("applicationBundle"));
  applicationVersion = self->_applicationVersion;
  if (applicationVersion)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)applicationVersion, CFSTR("applicationVersion"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v5, self->_applicationConfigVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("applicationConfigVersion"));

    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v5, self->_globalConfigVersion);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("globalConfigVersion"));

  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(deviceIdentifier, v5, (uint64_t)applicationVersion);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, CFSTR("deviceIdentifier"));

  }
  deviceSoftwareVersion = self->_deviceSoftwareVersion;
  if (deviceSoftwareVersion)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceSoftwareVersion, CFSTR("deviceSoftwareVersion"));
  deviceHardwareVersion = self->_deviceHardwareVersion;
  if (deviceHardwareVersion)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceHardwareVersion, CFSTR("deviceHardwareVersion"));
  deviceLibraryName = self->_deviceLibraryName;
  if (deviceLibraryName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceLibraryName, CFSTR("deviceLibraryName"));
  deviceLibraryVersion = self->_deviceLibraryVersion;
  if (deviceLibraryVersion)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceLibraryVersion, CFSTR("deviceLibraryVersion"));
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v5, self->_deviceProtocolVersion);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v24, (uint64_t)v23, CFSTR("deviceProtocolVersion"));

  }
  locale = self->_locale;
  if (locale)
  {
    objc_msgSend_dictionaryRepresentation(locale, v5, (uint64_t)deviceLibraryVersion);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, CFSTR("locale"));

  }
  mmcsProtocolVersion = self->_mmcsProtocolVersion;
  if (mmcsProtocolVersion)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)mmcsProtocolVersion, CFSTR("mmcsProtocolVersion"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    applicationContainerEnvironment = self->_applicationContainerEnvironment;
    if (applicationContainerEnvironment == 1)
    {
      v30 = CFSTR("production");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("production"), CFSTR("applicationContainerEnvironment"));
    }
    else if (applicationContainerEnvironment == 2)
    {
      v30 = CFSTR("sandbox");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("sandbox"), CFSTR("applicationContainerEnvironment"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_applicationContainerEnvironment);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v31, (uint64_t)v30, CFSTR("applicationContainerEnvironment"));
    }

  }
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)clientChangeToken, CFSTR("clientChangeToken"));
  deviceAssignedName = self->_deviceAssignedName;
  if (deviceAssignedName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceAssignedName, CFSTR("deviceAssignedName"));
  deviceHardwareID = self->_deviceHardwareID;
  if (deviceHardwareID)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceHardwareID, CFSTR("deviceHardwareID"));
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v35 = self->_targetDatabase - 1;
    if (v35 >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_targetDatabase);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_1E78330D0[v35];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v36, CFSTR("targetDatabase"));

  }
  userIDContainerID = self->_userIDContainerID;
  if (userIDContainerID)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)userIDContainerID, CFSTR("userIDContainerID"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    isolationLevel = self->_isolationLevel;
    if (isolationLevel == 1)
    {
      v39 = CFSTR("zone");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("zone"), CFSTR("isolationLevel"));
    }
    else if (isolationLevel == 2)
    {
      v39 = CFSTR("operation");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("operation"), CFSTR("isolationLevel"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_isolationLevel);
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v40, (uint64_t)v39, CFSTR("isolationLevel"));
    }

  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)operationGroupName, CFSTR("operationGroupName"));
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v5, self->_operationGroupQuantity);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v43, (uint64_t)v42, CFSTR("operationGroupQuantity"));

  }
  serviceIdentityKeyIDs = self->_serviceIdentityKeyIDs;
  if (serviceIdentityKeyIDs)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)serviceIdentityKeyIDs, CFSTR("serviceIdentityKeyIDs"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_deviceSoftwareIsAppleInternal);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v46, (uint64_t)v45, CFSTR("deviceSoftwareIsAppleInternal"));

  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  if (assetAuthorizeGetRequestOptions)
  {
    objc_msgSend_dictionaryRepresentation(assetAuthorizeGetRequestOptions, v5, (uint64_t)serviceIdentityKeyIDs);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v49, (uint64_t)v48, CFSTR("assetAuthorizeGetRequestOptions"));

  }
  activeThrottlingLabels = self->_activeThrottlingLabels;
  if (activeThrottlingLabels)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)activeThrottlingLabels, CFSTR("activeThrottlingLabel"));
  deviceUDID = self->_deviceUDID;
  if (deviceUDID)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceUDID, CFSTR("deviceUDID"));
  deviceSerialNumber = self->_deviceSerialNumber;
  if (deviceSerialNumber)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)deviceSerialNumber, CFSTR("deviceSerialNumber"));
  v53 = (__int16)self->_has;
  if ((v53 & 0x200) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_entitlementsValidated);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)v54, CFSTR("entitlementsValidated"));

    v53 = (__int16)self->_has;
  }
  if ((v53 & 0x40) != 0)
  {
    v56 = self->_requestOriginator - 1;
    if (v56 >= 6)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_requestOriginator);
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = off_1E78330F0[v56];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v57, CFSTR("requestOriginator"));

  }
  if (objc_msgSend_count(self->_supplementalZoneInfos, v5, (uint64_t)deviceSerialNumber))
  {
    v60 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v63 = objc_msgSend_count(self->_supplementalZoneInfos, v61, v62);
    v65 = (void *)objc_msgSend_initWithCapacity_(v60, v64, v63);
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v66 = self->_supplementalZoneInfos;
    v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v82, v86, 16);
    if (v68)
    {
      v71 = v68;
      v72 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v71; ++i)
        {
          if (*(_QWORD *)v83 != v72)
            objc_enumerationMutation(v66);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v82 + 1) + 8 * i), v69, v70);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v65, v75, (uint64_t)v74);

        }
        v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v69, (uint64_t)&v82, v86, 16);
      }
      while (v71);
    }

    objc_msgSend_setObject_forKey_(v6, v76, (uint64_t)v65, CFSTR("supplementalZoneInfos"));
  }
  zoneAndShareUsageInfo = self->_zoneAndShareUsageInfo;
  if (zoneAndShareUsageInfo)
  {
    objc_msgSend_dictionaryRepresentation(zoneAndShareUsageInfo, v58, v59);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v79, (uint64_t)v78, CFSTR("zoneAndShareUsageInfo"));

  }
  v80 = v6;

  return v80;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRequestOperationHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *userToken;
  NSString *applicationContainer;
  NSString *applicationBundle;
  NSString *applicationVersion;
  __int16 has;
  CKDPIdentifier *deviceIdentifier;
  NSString *deviceSoftwareVersion;
  NSString *deviceHardwareVersion;
  NSString *deviceLibraryName;
  NSString *deviceLibraryVersion;
  CKDPLocale *locale;
  NSString *mmcsProtocolVersion;
  NSData *clientChangeToken;
  NSString *deviceAssignedName;
  NSString *deviceHardwareID;
  NSString *userIDContainerID;
  NSString *operationGroupName;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  const char *v31;
  CKDPRequestOperationHeaderAssetAuthorizeGetRequestOptions *assetAuthorizeGetRequestOptions;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t active;
  uint64_t v38;
  uint64_t j;
  void *v40;
  const char *v41;
  NSString *deviceUDID;
  NSString *deviceSerialNumber;
  _BYTE *v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  const char *v54;
  CKDPRequestOperationHeaderZoneAndShareUsageInfo *zoneAndShareUsageInfo;
  id v56;

  v4 = a3;
  userToken = self->_userToken;
  v56 = v4;
  if (userToken)
  {
    objc_msgSend_setUserToken_(v4, v5, (uint64_t)userToken);
    v4 = v56;
  }
  applicationContainer = self->_applicationContainer;
  if (applicationContainer)
  {
    objc_msgSend_setApplicationContainer_(v56, v5, (uint64_t)applicationContainer);
    v4 = v56;
  }
  applicationBundle = self->_applicationBundle;
  if (applicationBundle)
  {
    objc_msgSend_setApplicationBundle_(v56, v5, (uint64_t)applicationBundle);
    v4 = v56;
  }
  applicationVersion = self->_applicationVersion;
  if (applicationVersion)
  {
    objc_msgSend_setApplicationVersion_(v56, v5, (uint64_t)applicationVersion);
    v4 = v56;
  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_applicationConfigVersion;
    *((_WORD *)v4 + 130) |= 1u;
    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_globalConfigVersion;
    *((_WORD *)v4 + 130) |= 4u;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    objc_msgSend_setDeviceIdentifier_(v56, v5, (uint64_t)deviceIdentifier);
    v4 = v56;
  }
  deviceSoftwareVersion = self->_deviceSoftwareVersion;
  if (deviceSoftwareVersion)
  {
    objc_msgSend_setDeviceSoftwareVersion_(v56, v5, (uint64_t)deviceSoftwareVersion);
    v4 = v56;
  }
  deviceHardwareVersion = self->_deviceHardwareVersion;
  if (deviceHardwareVersion)
  {
    objc_msgSend_setDeviceHardwareVersion_(v56, v5, (uint64_t)deviceHardwareVersion);
    v4 = v56;
  }
  deviceLibraryName = self->_deviceLibraryName;
  if (deviceLibraryName)
  {
    objc_msgSend_setDeviceLibraryName_(v56, v5, (uint64_t)deviceLibraryName);
    v4 = v56;
  }
  deviceLibraryVersion = self->_deviceLibraryVersion;
  if (deviceLibraryVersion)
  {
    objc_msgSend_setDeviceLibraryVersion_(v56, v5, (uint64_t)deviceLibraryVersion);
    v4 = v56;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_deviceProtocolVersion;
    *((_WORD *)v4 + 130) |= 2u;
  }
  locale = self->_locale;
  if (locale)
  {
    objc_msgSend_setLocale_(v56, v5, (uint64_t)locale);
    v4 = v56;
  }
  mmcsProtocolVersion = self->_mmcsProtocolVersion;
  if (mmcsProtocolVersion)
  {
    objc_msgSend_setMmcsProtocolVersion_(v56, v5, (uint64_t)mmcsProtocolVersion);
    v4 = v56;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_applicationContainerEnvironment;
    *((_WORD *)v4 + 130) |= 0x10u;
  }
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken)
  {
    objc_msgSend_setClientChangeToken_(v56, v5, (uint64_t)clientChangeToken);
    v4 = v56;
  }
  deviceAssignedName = self->_deviceAssignedName;
  if (deviceAssignedName)
  {
    objc_msgSend_setDeviceAssignedName_(v56, v5, (uint64_t)deviceAssignedName);
    v4 = v56;
  }
  deviceHardwareID = self->_deviceHardwareID;
  if (deviceHardwareID)
  {
    objc_msgSend_setDeviceHardwareID_(v56, v5, (uint64_t)deviceHardwareID);
    v4 = v56;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v4 + 56) = self->_targetDatabase;
    *((_WORD *)v4 + 130) |= 0x80u;
  }
  userIDContainerID = self->_userIDContainerID;
  if (userIDContainerID)
  {
    objc_msgSend_setUserIDContainerID_(v56, v5, (uint64_t)userIDContainerID);
    v4 = v56;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_isolationLevel;
    *((_WORD *)v4 + 130) |= 0x20u;
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
  {
    objc_msgSend_setOperationGroupName_(v56, v5, (uint64_t)operationGroupName);
    v4 = v56;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_operationGroupQuantity;
    *((_WORD *)v4 + 130) |= 8u;
  }
  if (objc_msgSend_serviceIdentityKeyIDsCount(self, v5, (uint64_t)operationGroupName))
  {
    objc_msgSend_clearServiceIdentityKeyIDs(v56, v23, v24);
    v27 = objc_msgSend_serviceIdentityKeyIDsCount(self, v25, v26);
    if (v27)
    {
      v28 = v27;
      for (i = 0; i != v28; ++i)
      {
        objc_msgSend_serviceIdentityKeyIDsAtIndex_(self, v23, i);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addServiceIdentityKeyIDs_(v56, v31, (uint64_t)v30);

      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_BYTE *)v56 + 256) = self->_deviceSoftwareIsAppleInternal;
    *((_WORD *)v56 + 130) |= 0x100u;
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  if (assetAuthorizeGetRequestOptions)
    objc_msgSend_setAssetAuthorizeGetRequestOptions_(v56, v23, (uint64_t)assetAuthorizeGetRequestOptions);
  if (objc_msgSend_activeThrottlingLabelsCount(self, v23, (uint64_t)assetAuthorizeGetRequestOptions))
  {
    objc_msgSend_clearActiveThrottlingLabels(v56, v33, v34);
    active = objc_msgSend_activeThrottlingLabelsCount(self, v35, v36);
    if (active)
    {
      v38 = active;
      for (j = 0; j != v38; ++j)
      {
        objc_msgSend_activeThrottlingLabelAtIndex_(self, v33, j);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addActiveThrottlingLabel_(v56, v41, (uint64_t)v40);

      }
    }
  }
  deviceUDID = self->_deviceUDID;
  if (deviceUDID)
    objc_msgSend_setDeviceUDID_(v56, v33, (uint64_t)deviceUDID);
  deviceSerialNumber = self->_deviceSerialNumber;
  v44 = v56;
  if (deviceSerialNumber)
  {
    objc_msgSend_setDeviceSerialNumber_(v56, v33, (uint64_t)deviceSerialNumber);
    v44 = v56;
  }
  v45 = (__int16)self->_has;
  if ((v45 & 0x200) != 0)
  {
    v44[257] = self->_entitlementsValidated;
    *((_WORD *)v44 + 130) |= 0x200u;
    v45 = (__int16)self->_has;
  }
  if ((v45 & 0x40) != 0)
  {
    *((_DWORD *)v44 + 50) = self->_requestOriginator;
    *((_WORD *)v44 + 130) |= 0x40u;
  }
  if (objc_msgSend_supplementalZoneInfosCount(self, v33, (uint64_t)deviceSerialNumber))
  {
    objc_msgSend_clearSupplementalZoneInfos(v56, v46, v47);
    v50 = objc_msgSend_supplementalZoneInfosCount(self, v48, v49);
    if (v50)
    {
      v51 = v50;
      for (k = 0; k != v51; ++k)
      {
        objc_msgSend_supplementalZoneInfosAtIndex_(self, v46, k);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSupplementalZoneInfos_(v56, v54, (uint64_t)v53);

      }
    }
  }
  zoneAndShareUsageInfo = self->_zoneAndShareUsageInfo;
  if (zoneAndShareUsageInfo)
    objc_msgSend_setZoneAndShareUsageInfo_(v56, v46, (uint64_t)zoneAndShareUsageInfo);

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
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  __int16 has;
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
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  NSMutableArray *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  NSMutableArray *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t j;
  void *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  __int16 v87;
  NSMutableArray *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t k;
  void *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_userToken, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 240);
  *(_QWORD *)(v10 + 240) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_applicationContainer, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_applicationBundle, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v18;

  v21 = objc_msgSend_copyWithZone_(self->_applicationVersion, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 72);
  *(_QWORD *)(v10 + 72) = v21;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_applicationConfigVersion;
    *(_WORD *)(v10 + 260) |= 1u;
    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v10 + 24) = self->_globalConfigVersion;
    *(_WORD *)(v10 + 260) |= 4u;
  }
  v25 = objc_msgSend_copyWithZone_(self->_deviceIdentifier, v23, (uint64_t)a3);
  v26 = *(void **)(v10 + 120);
  *(_QWORD *)(v10 + 120) = v25;

  v28 = objc_msgSend_copyWithZone_(self->_deviceSoftwareVersion, v27, (uint64_t)a3);
  v29 = *(void **)(v10 + 152);
  *(_QWORD *)(v10 + 152) = v28;

  v31 = objc_msgSend_copyWithZone_(self->_deviceHardwareVersion, v30, (uint64_t)a3);
  v32 = *(void **)(v10 + 112);
  *(_QWORD *)(v10 + 112) = v31;

  v34 = objc_msgSend_copyWithZone_(self->_deviceLibraryName, v33, (uint64_t)a3);
  v35 = *(void **)(v10 + 128);
  *(_QWORD *)(v10 + 128) = v34;

  v37 = objc_msgSend_copyWithZone_(self->_deviceLibraryVersion, v36, (uint64_t)a3);
  v38 = *(void **)(v10 + 136);
  *(_QWORD *)(v10 + 136) = v37;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v10 + 16) = self->_deviceProtocolVersion;
    *(_WORD *)(v10 + 260) |= 2u;
  }
  v40 = objc_msgSend_copyWithZone_(self->_locale, v39, (uint64_t)a3);
  v41 = *(void **)(v10 + 176);
  *(_QWORD *)(v10 + 176) = v40;

  v43 = objc_msgSend_copyWithZone_(self->_mmcsProtocolVersion, v42, (uint64_t)a3);
  v44 = *(void **)(v10 + 184);
  *(_QWORD *)(v10 + 184) = v43;

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v10 + 64) = self->_applicationContainerEnvironment;
    *(_WORD *)(v10 + 260) |= 0x10u;
  }
  v46 = objc_msgSend_copyWithZone_(self->_clientChangeToken, v45, (uint64_t)a3);
  v47 = *(void **)(v10 + 88);
  *(_QWORD *)(v10 + 88) = v46;

  v49 = objc_msgSend_copyWithZone_(self->_deviceAssignedName, v48, (uint64_t)a3);
  v50 = *(void **)(v10 + 96);
  *(_QWORD *)(v10 + 96) = v49;

  v52 = objc_msgSend_copyWithZone_(self->_deviceHardwareID, v51, (uint64_t)a3);
  v53 = *(void **)(v10 + 104);
  *(_QWORD *)(v10 + 104) = v52;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v10 + 224) = self->_targetDatabase;
    *(_WORD *)(v10 + 260) |= 0x80u;
  }
  v55 = objc_msgSend_copyWithZone_(self->_userIDContainerID, v54, (uint64_t)a3);
  v56 = *(void **)(v10 + 232);
  *(_QWORD *)(v10 + 232) = v55;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v10 + 168) = self->_isolationLevel;
    *(_WORD *)(v10 + 260) |= 0x20u;
  }
  v58 = objc_msgSend_copyWithZone_(self->_operationGroupName, v57, (uint64_t)a3);
  v59 = *(void **)(v10 + 192);
  *(_QWORD *)(v10 + 192) = v58;

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *(_QWORD *)(v10 + 32) = self->_operationGroupQuantity;
    *(_WORD *)(v10 + 260) |= 8u;
  }
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v60 = self->_serviceIdentityKeyIDs;
  v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v109, v115, 16);
  if (v62)
  {
    v64 = v62;
    v65 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(_QWORD *)v110 != v65)
          objc_enumerationMutation(v60);
        v67 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v109 + 1) + 8 * i), v63, (uint64_t)a3);
        objc_msgSend_addServiceIdentityKeyIDs_((void *)v10, v68, (uint64_t)v67);

      }
      v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v63, (uint64_t)&v109, v115, 16);
    }
    while (v64);
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_BYTE *)(v10 + 256) = self->_deviceSoftwareIsAppleInternal;
    *(_WORD *)(v10 + 260) |= 0x100u;
  }
  v70 = objc_msgSend_copyWithZone_(self->_assetAuthorizeGetRequestOptions, v69, (uint64_t)a3);
  v71 = *(void **)(v10 + 80);
  *(_QWORD *)(v10 + 80) = v70;

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v72 = self->_activeThrottlingLabels;
  v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v105, v114, 16);
  if (v74)
  {
    v76 = v74;
    v77 = *(_QWORD *)v106;
    do
    {
      for (j = 0; j != v76; ++j)
      {
        if (*(_QWORD *)v106 != v77)
          objc_enumerationMutation(v72);
        v79 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v105 + 1) + 8 * j), v75, (uint64_t)a3);
        objc_msgSend_addActiveThrottlingLabel_((void *)v10, v80, (uint64_t)v79);

      }
      v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v105, v114, 16);
    }
    while (v76);
  }

  v82 = objc_msgSend_copyWithZone_(self->_deviceUDID, v81, (uint64_t)a3);
  v83 = *(void **)(v10 + 160);
  *(_QWORD *)(v10 + 160) = v82;

  v85 = objc_msgSend_copyWithZone_(self->_deviceSerialNumber, v84, (uint64_t)a3);
  v86 = *(void **)(v10 + 144);
  *(_QWORD *)(v10 + 144) = v85;

  v87 = (__int16)self->_has;
  if ((v87 & 0x200) != 0)
  {
    *(_BYTE *)(v10 + 257) = self->_entitlementsValidated;
    *(_WORD *)(v10 + 260) |= 0x200u;
    v87 = (__int16)self->_has;
  }
  if ((v87 & 0x40) != 0)
  {
    *(_DWORD *)(v10 + 200) = self->_requestOriginator;
    *(_WORD *)(v10 + 260) |= 0x40u;
  }
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v88 = self->_supplementalZoneInfos;
  v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v101, v113, 16);
  if (v90)
  {
    v92 = v90;
    v93 = *(_QWORD *)v102;
    do
    {
      for (k = 0; k != v92; ++k)
      {
        if (*(_QWORD *)v102 != v93)
          objc_enumerationMutation(v88);
        v95 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v101 + 1) + 8 * k), v91, (uint64_t)a3, (_QWORD)v101);
        objc_msgSend_addSupplementalZoneInfos_((void *)v10, v96, (uint64_t)v95);

      }
      v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v91, (uint64_t)&v101, v113, 16);
    }
    while (v92);
  }

  v98 = objc_msgSend_copyWithZone_(self->_zoneAndShareUsageInfo, v97, (uint64_t)a3);
  v99 = *(void **)(v10 + 248);
  *(_QWORD *)(v10 + 248) = v98;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *userToken;
  uint64_t v9;
  NSString *applicationContainer;
  uint64_t v11;
  NSString *applicationBundle;
  uint64_t v13;
  NSString *applicationVersion;
  uint64_t v15;
  __int16 has;
  __int16 v17;
  CKDPIdentifier *deviceIdentifier;
  uint64_t v19;
  NSString *deviceSoftwareVersion;
  uint64_t v21;
  NSString *deviceHardwareVersion;
  uint64_t v23;
  NSString *deviceLibraryName;
  uint64_t v25;
  NSString *deviceLibraryVersion;
  uint64_t v27;
  __int16 v28;
  CKDPLocale *locale;
  uint64_t v30;
  NSString *mmcsProtocolVersion;
  uint64_t v32;
  __int16 v33;
  NSData *clientChangeToken;
  uint64_t v35;
  NSString *deviceAssignedName;
  uint64_t v37;
  NSString *deviceHardwareID;
  uint64_t v39;
  __int16 v40;
  __int16 v41;
  NSString *userIDContainerID;
  uint64_t v43;
  NSString *operationGroupName;
  uint64_t v45;
  NSMutableArray *serviceIdentityKeyIDs;
  uint64_t v47;
  CKDPRequestOperationHeaderAssetAuthorizeGetRequestOptions *assetAuthorizeGetRequestOptions;
  uint64_t v49;
  NSMutableArray *activeThrottlingLabels;
  uint64_t v51;
  NSString *deviceUDID;
  uint64_t v53;
  NSString *deviceSerialNumber;
  uint64_t v55;
  __int16 v56;
  __int16 v57;
  NSMutableArray *supplementalZoneInfos;
  uint64_t v59;
  CKDPRequestOperationHeaderZoneAndShareUsageInfo *zoneAndShareUsageInfo;
  uint64_t v61;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_107;
  userToken = self->_userToken;
  v9 = v4[30];
  if ((unint64_t)userToken | v9)
  {
    if (!objc_msgSend_isEqual_(userToken, v7, v9))
      goto LABEL_107;
  }
  applicationContainer = self->_applicationContainer;
  v11 = v4[7];
  if ((unint64_t)applicationContainer | v11)
  {
    if (!objc_msgSend_isEqual_(applicationContainer, v7, v11))
      goto LABEL_107;
  }
  applicationBundle = self->_applicationBundle;
  v13 = v4[6];
  if ((unint64_t)applicationBundle | v13)
  {
    if (!objc_msgSend_isEqual_(applicationBundle, v7, v13))
      goto LABEL_107;
  }
  applicationVersion = self->_applicationVersion;
  v15 = v4[9];
  if ((unint64_t)applicationVersion | v15)
  {
    if (!objc_msgSend_isEqual_(applicationVersion, v7, v15))
      goto LABEL_107;
  }
  has = (__int16)self->_has;
  v17 = *((_WORD *)v4 + 130);
  if ((has & 1) != 0)
  {
    if ((v17 & 1) == 0 || self->_applicationConfigVersion != v4[1])
      goto LABEL_107;
  }
  else if ((v17 & 1) != 0)
  {
    goto LABEL_107;
  }
  if ((has & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_globalConfigVersion != v4[3])
      goto LABEL_107;
  }
  else if ((v17 & 4) != 0)
  {
    goto LABEL_107;
  }
  deviceIdentifier = self->_deviceIdentifier;
  v19 = v4[15];
  if ((unint64_t)deviceIdentifier | v19 && !objc_msgSend_isEqual_(deviceIdentifier, v7, v19))
    goto LABEL_107;
  deviceSoftwareVersion = self->_deviceSoftwareVersion;
  v21 = v4[19];
  if ((unint64_t)deviceSoftwareVersion | v21)
  {
    if (!objc_msgSend_isEqual_(deviceSoftwareVersion, v7, v21))
      goto LABEL_107;
  }
  deviceHardwareVersion = self->_deviceHardwareVersion;
  v23 = v4[14];
  if ((unint64_t)deviceHardwareVersion | v23)
  {
    if (!objc_msgSend_isEqual_(deviceHardwareVersion, v7, v23))
      goto LABEL_107;
  }
  deviceLibraryName = self->_deviceLibraryName;
  v25 = v4[16];
  if ((unint64_t)deviceLibraryName | v25)
  {
    if (!objc_msgSend_isEqual_(deviceLibraryName, v7, v25))
      goto LABEL_107;
  }
  deviceLibraryVersion = self->_deviceLibraryVersion;
  v27 = v4[17];
  if ((unint64_t)deviceLibraryVersion | v27)
  {
    if (!objc_msgSend_isEqual_(deviceLibraryVersion, v7, v27))
      goto LABEL_107;
  }
  v28 = *((_WORD *)v4 + 130);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    if ((v28 & 2) == 0 || self->_deviceProtocolVersion != v4[2])
      goto LABEL_107;
  }
  else if ((v28 & 2) != 0)
  {
    goto LABEL_107;
  }
  locale = self->_locale;
  v30 = v4[22];
  if ((unint64_t)locale | v30 && !objc_msgSend_isEqual_(locale, v7, v30))
    goto LABEL_107;
  mmcsProtocolVersion = self->_mmcsProtocolVersion;
  v32 = v4[23];
  if ((unint64_t)mmcsProtocolVersion | v32)
  {
    if (!objc_msgSend_isEqual_(mmcsProtocolVersion, v7, v32))
      goto LABEL_107;
  }
  v33 = *((_WORD *)v4 + 130);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v33 & 0x10) == 0 || self->_applicationContainerEnvironment != *((_DWORD *)v4 + 16))
      goto LABEL_107;
  }
  else if ((v33 & 0x10) != 0)
  {
    goto LABEL_107;
  }
  clientChangeToken = self->_clientChangeToken;
  v35 = v4[11];
  if ((unint64_t)clientChangeToken | v35 && !objc_msgSend_isEqual_(clientChangeToken, v7, v35))
    goto LABEL_107;
  deviceAssignedName = self->_deviceAssignedName;
  v37 = v4[12];
  if ((unint64_t)deviceAssignedName | v37)
  {
    if (!objc_msgSend_isEqual_(deviceAssignedName, v7, v37))
      goto LABEL_107;
  }
  deviceHardwareID = self->_deviceHardwareID;
  v39 = v4[13];
  if ((unint64_t)deviceHardwareID | v39)
  {
    if (!objc_msgSend_isEqual_(deviceHardwareID, v7, v39))
      goto LABEL_107;
  }
  v40 = (__int16)self->_has;
  v41 = *((_WORD *)v4 + 130);
  if ((v40 & 0x80) != 0)
  {
    if ((v41 & 0x80) == 0 || self->_targetDatabase != *((_DWORD *)v4 + 56))
      goto LABEL_107;
  }
  else if ((v41 & 0x80) != 0)
  {
    goto LABEL_107;
  }
  userIDContainerID = self->_userIDContainerID;
  v43 = v4[29];
  if ((unint64_t)userIDContainerID | v43)
  {
    if (!objc_msgSend_isEqual_(userIDContainerID, v7, v43))
      goto LABEL_107;
    v40 = (__int16)self->_has;
    v41 = *((_WORD *)v4 + 130);
  }
  if ((v40 & 0x20) != 0)
  {
    if ((v41 & 0x20) == 0 || self->_isolationLevel != *((_DWORD *)v4 + 42))
      goto LABEL_107;
  }
  else if ((v41 & 0x20) != 0)
  {
    goto LABEL_107;
  }
  operationGroupName = self->_operationGroupName;
  v45 = v4[24];
  if ((unint64_t)operationGroupName | v45)
  {
    if (!objc_msgSend_isEqual_(operationGroupName, v7, v45))
      goto LABEL_107;
    v40 = (__int16)self->_has;
    v41 = *((_WORD *)v4 + 130);
  }
  if ((v40 & 8) != 0)
  {
    if ((v41 & 8) == 0 || self->_operationGroupQuantity != v4[4])
      goto LABEL_107;
  }
  else if ((v41 & 8) != 0)
  {
    goto LABEL_107;
  }
  serviceIdentityKeyIDs = self->_serviceIdentityKeyIDs;
  v47 = v4[26];
  if ((unint64_t)serviceIdentityKeyIDs | v47)
  {
    if (!objc_msgSend_isEqual_(serviceIdentityKeyIDs, v7, v47))
      goto LABEL_107;
    v40 = (__int16)self->_has;
    v41 = *((_WORD *)v4 + 130);
  }
  if ((v40 & 0x100) != 0)
  {
    if ((v41 & 0x100) == 0)
      goto LABEL_107;
    if (self->_deviceSoftwareIsAppleInternal)
    {
      if (!*((_BYTE *)v4 + 256))
        goto LABEL_107;
    }
    else if (*((_BYTE *)v4 + 256))
    {
      goto LABEL_107;
    }
  }
  else if ((v41 & 0x100) != 0)
  {
    goto LABEL_107;
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  v49 = v4[10];
  if ((unint64_t)assetAuthorizeGetRequestOptions | v49
    && !objc_msgSend_isEqual_(assetAuthorizeGetRequestOptions, v7, v49))
  {
    goto LABEL_107;
  }
  activeThrottlingLabels = self->_activeThrottlingLabels;
  v51 = v4[5];
  if ((unint64_t)activeThrottlingLabels | v51)
  {
    if (!objc_msgSend_isEqual_(activeThrottlingLabels, v7, v51))
      goto LABEL_107;
  }
  deviceUDID = self->_deviceUDID;
  v53 = v4[20];
  if ((unint64_t)deviceUDID | v53)
  {
    if (!objc_msgSend_isEqual_(deviceUDID, v7, v53))
      goto LABEL_107;
  }
  deviceSerialNumber = self->_deviceSerialNumber;
  v55 = v4[18];
  if ((unint64_t)deviceSerialNumber | v55)
  {
    if (!objc_msgSend_isEqual_(deviceSerialNumber, v7, v55))
      goto LABEL_107;
  }
  v56 = (__int16)self->_has;
  v57 = *((_WORD *)v4 + 130);
  if ((v56 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 130) & 0x200) != 0)
    {
      if (self->_entitlementsValidated)
      {
        if (!*((_BYTE *)v4 + 257))
          goto LABEL_107;
        goto LABEL_98;
      }
      if (!*((_BYTE *)v4 + 257))
        goto LABEL_98;
    }
LABEL_107:
    isEqual = 0;
    goto LABEL_108;
  }
  if ((*((_WORD *)v4 + 130) & 0x200) != 0)
    goto LABEL_107;
LABEL_98:
  if ((v56 & 0x40) != 0)
  {
    if ((v57 & 0x40) == 0 || self->_requestOriginator != *((_DWORD *)v4 + 50))
      goto LABEL_107;
  }
  else if ((v57 & 0x40) != 0)
  {
    goto LABEL_107;
  }
  supplementalZoneInfos = self->_supplementalZoneInfos;
  v59 = v4[27];
  if ((unint64_t)supplementalZoneInfos | v59
    && !objc_msgSend_isEqual_(supplementalZoneInfos, v7, v59))
  {
    goto LABEL_107;
  }
  zoneAndShareUsageInfo = self->_zoneAndShareUsageInfo;
  v61 = v4[31];
  if ((unint64_t)zoneAndShareUsageInfo | v61)
    isEqual = objc_msgSend_isEqual_(zoneAndShareUsageInfo, v7, v61);
  else
    isEqual = 1;
LABEL_108:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  __int16 has;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v84 = objc_msgSend_hash(self->_userToken, a2, v2);
  v83 = objc_msgSend_hash(self->_applicationContainer, v4, v5);
  v82 = objc_msgSend_hash(self->_applicationBundle, v6, v7);
  v81 = objc_msgSend_hash(self->_applicationVersion, v8, v9);
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v80 = 2654435761u * self->_applicationConfigVersion;
    if ((has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v80 = 0;
    if ((has & 4) != 0)
    {
LABEL_3:
      v79 = 2654435761u * self->_globalConfigVersion;
      goto LABEL_6;
    }
  }
  v79 = 0;
LABEL_6:
  v78 = objc_msgSend_hash(self->_deviceIdentifier, v10, v11);
  v77 = objc_msgSend_hash(self->_deviceSoftwareVersion, v13, v14);
  v76 = objc_msgSend_hash(self->_deviceHardwareVersion, v15, v16);
  v75 = objc_msgSend_hash(self->_deviceLibraryName, v17, v18);
  v74 = objc_msgSend_hash(self->_deviceLibraryVersion, v19, v20);
  if ((*(_WORD *)&self->_has & 2) != 0)
    v73 = 2654435761u * self->_deviceProtocolVersion;
  else
    v73 = 0;
  v72 = objc_msgSend_hash(self->_locale, v21, v22);
  v71 = objc_msgSend_hash(self->_mmcsProtocolVersion, v23, v24);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    v70 = 2654435761 * self->_applicationContainerEnvironment;
  else
    v70 = 0;
  v69 = objc_msgSend_hash(self->_clientChangeToken, v25, v26);
  v68 = objc_msgSend_hash(self->_deviceAssignedName, v27, v28);
  v67 = objc_msgSend_hash(self->_deviceHardwareID, v29, v30);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v66 = 2654435761 * self->_targetDatabase;
  else
    v66 = 0;
  v65 = objc_msgSend_hash(self->_userIDContainerID, v31, v32);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v35 = objc_msgSend_hash(self->_operationGroupName, v33, v34, 2654435761 * self->_isolationLevel);
  else
    v35 = objc_msgSend_hash(self->_operationGroupName, v33, v34, 0);
  v38 = v35;
  if ((*(_WORD *)&self->_has & 8) != 0)
    v39 = 2654435761u * self->_operationGroupQuantity;
  else
    v39 = 0;
  v42 = objc_msgSend_hash(self->_serviceIdentityKeyIDs, v36, v37);
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v43 = 2654435761 * self->_deviceSoftwareIsAppleInternal;
  else
    v43 = 0;
  v44 = objc_msgSend_hash(self->_assetAuthorizeGetRequestOptions, v40, v41);
  v47 = objc_msgSend_hash(self->_activeThrottlingLabels, v45, v46);
  v50 = objc_msgSend_hash(self->_deviceUDID, v48, v49);
  v53 = objc_msgSend_hash(self->_deviceSerialNumber, v51, v52);
  v56 = (__int16)self->_has;
  if ((v56 & 0x200) != 0)
  {
    v57 = 2654435761 * self->_entitlementsValidated;
    if ((v56 & 0x40) != 0)
      goto LABEL_26;
LABEL_28:
    v58 = 0;
    goto LABEL_29;
  }
  v57 = 0;
  if ((v56 & 0x40) == 0)
    goto LABEL_28;
LABEL_26:
  v58 = 2654435761 * self->_requestOriginator;
LABEL_29:
  v59 = v83 ^ v84 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v38 ^ v39 ^ v42 ^ v43 ^ v44 ^ v47 ^ v50 ^ v53 ^ v57;
  v60 = v58 ^ objc_msgSend_hash(self->_supplementalZoneInfos, v54, v55);
  return v59 ^ v60 ^ objc_msgSend_hash(self->_zoneAndShareUsageInfo, v61, v62);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  CKDPIdentifier *deviceIdentifier;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CKDPLocale *locale;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  const char *v32;
  CKDPRequestOperationHeaderAssetAuthorizeGetRequestOptions *assetAuthorizeGetRequestOptions;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  const char *v53;
  CKDPRequestOperationHeaderZoneAndShareUsageInfo *zoneAndShareUsageInfo;
  uint64_t v55;
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
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 30);
  if (v6)
    objc_msgSend_setUserToken_(self, v4, v6);
  v7 = *((_QWORD *)v5 + 7);
  if (v7)
    objc_msgSend_setApplicationContainer_(self, v4, v7);
  v8 = *((_QWORD *)v5 + 6);
  if (v8)
    objc_msgSend_setApplicationBundle_(self, v4, v8);
  v9 = *((_QWORD *)v5 + 9);
  if (v9)
    objc_msgSend_setApplicationVersion_(self, v4, v9);
  v10 = *((_WORD *)v5 + 130);
  if ((v10 & 1) != 0)
  {
    self->_applicationConfigVersion = *((_QWORD *)v5 + 1);
    *(_WORD *)&self->_has |= 1u;
    v10 = *((_WORD *)v5 + 130);
  }
  if ((v10 & 4) != 0)
  {
    self->_globalConfigVersion = *((_QWORD *)v5 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
  deviceIdentifier = self->_deviceIdentifier;
  v12 = *((_QWORD *)v5 + 15);
  if (deviceIdentifier)
  {
    if (v12)
      objc_msgSend_mergeFrom_(deviceIdentifier, v4, v12);
  }
  else if (v12)
  {
    objc_msgSend_setDeviceIdentifier_(self, v4, v12);
  }
  v13 = *((_QWORD *)v5 + 19);
  if (v13)
    objc_msgSend_setDeviceSoftwareVersion_(self, v4, v13);
  v14 = *((_QWORD *)v5 + 14);
  if (v14)
    objc_msgSend_setDeviceHardwareVersion_(self, v4, v14);
  v15 = *((_QWORD *)v5 + 16);
  if (v15)
    objc_msgSend_setDeviceLibraryName_(self, v4, v15);
  v16 = *((_QWORD *)v5 + 17);
  if (v16)
    objc_msgSend_setDeviceLibraryVersion_(self, v4, v16);
  if ((*((_WORD *)v5 + 130) & 2) != 0)
  {
    self->_deviceProtocolVersion = *((_QWORD *)v5 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
  locale = self->_locale;
  v18 = *((_QWORD *)v5 + 22);
  if (locale)
  {
    if (v18)
      objc_msgSend_mergeFrom_(locale, v4, v18);
  }
  else if (v18)
  {
    objc_msgSend_setLocale_(self, v4, v18);
  }
  v19 = *((_QWORD *)v5 + 23);
  if (v19)
    objc_msgSend_setMmcsProtocolVersion_(self, v4, v19);
  if ((*((_WORD *)v5 + 130) & 0x10) != 0)
  {
    self->_applicationContainerEnvironment = *((_DWORD *)v5 + 16);
    *(_WORD *)&self->_has |= 0x10u;
  }
  v20 = *((_QWORD *)v5 + 11);
  if (v20)
    objc_msgSend_setClientChangeToken_(self, v4, v20);
  v21 = *((_QWORD *)v5 + 12);
  if (v21)
    objc_msgSend_setDeviceAssignedName_(self, v4, v21);
  v22 = *((_QWORD *)v5 + 13);
  if (v22)
    objc_msgSend_setDeviceHardwareID_(self, v4, v22);
  if ((*((_WORD *)v5 + 130) & 0x80) != 0)
  {
    self->_targetDatabase = *((_DWORD *)v5 + 56);
    *(_WORD *)&self->_has |= 0x80u;
  }
  v23 = *((_QWORD *)v5 + 29);
  if (v23)
    objc_msgSend_setUserIDContainerID_(self, v4, v23);
  if ((*((_WORD *)v5 + 130) & 0x20) != 0)
  {
    self->_isolationLevel = *((_DWORD *)v5 + 42);
    *(_WORD *)&self->_has |= 0x20u;
  }
  v24 = *((_QWORD *)v5 + 24);
  if (v24)
    objc_msgSend_setOperationGroupName_(self, v4, v24);
  if ((*((_WORD *)v5 + 130) & 8) != 0)
  {
    self->_operationGroupQuantity = *((_QWORD *)v5 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v25 = *((id *)v5 + 26);
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v64, v70, 16);
  if (v27)
  {
    v29 = v27;
    v30 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v65 != v30)
          objc_enumerationMutation(v25);
        objc_msgSend_addServiceIdentityKeyIDs_(self, v28, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i));
      }
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v64, v70, 16);
    }
    while (v29);
  }

  if ((*((_WORD *)v5 + 130) & 0x100) != 0)
  {
    self->_deviceSoftwareIsAppleInternal = *((_BYTE *)v5 + 256);
    *(_WORD *)&self->_has |= 0x100u;
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  v34 = *((_QWORD *)v5 + 10);
  if (assetAuthorizeGetRequestOptions)
  {
    if (v34)
      objc_msgSend_mergeFrom_(assetAuthorizeGetRequestOptions, v32, v34);
  }
  else if (v34)
  {
    objc_msgSend_setAssetAuthorizeGetRequestOptions_(self, v32, v34);
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v35 = *((id *)v5 + 5);
  v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v60, v69, 16);
  if (v37)
  {
    v39 = v37;
    v40 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v61 != v40)
          objc_enumerationMutation(v35);
        objc_msgSend_addActiveThrottlingLabel_(self, v38, *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j));
      }
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v60, v69, 16);
    }
    while (v39);
  }

  v43 = *((_QWORD *)v5 + 20);
  if (v43)
    objc_msgSend_setDeviceUDID_(self, v42, v43);
  v44 = *((_QWORD *)v5 + 18);
  if (v44)
    objc_msgSend_setDeviceSerialNumber_(self, v42, v44);
  v45 = *((_WORD *)v5 + 130);
  if ((v45 & 0x200) != 0)
  {
    self->_entitlementsValidated = *((_BYTE *)v5 + 257);
    *(_WORD *)&self->_has |= 0x200u;
    v45 = *((_WORD *)v5 + 130);
  }
  if ((v45 & 0x40) != 0)
  {
    self->_requestOriginator = *((_DWORD *)v5 + 50);
    *(_WORD *)&self->_has |= 0x40u;
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v46 = *((id *)v5 + 27);
  v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v56, v68, 16);
  if (v48)
  {
    v50 = v48;
    v51 = *(_QWORD *)v57;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v57 != v51)
          objc_enumerationMutation(v46);
        objc_msgSend_addSupplementalZoneInfos_(self, v49, *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k), (_QWORD)v56);
      }
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v56, v68, 16);
    }
    while (v50);
  }

  zoneAndShareUsageInfo = self->_zoneAndShareUsageInfo;
  v55 = *((_QWORD *)v5 + 31);
  if (zoneAndShareUsageInfo)
  {
    if (v55)
      objc_msgSend_mergeFrom_(zoneAndShareUsageInfo, v53, v55);
  }
  else if (v55)
  {
    objc_msgSend_setZoneAndShareUsageInfo_(self, v53, v55);
  }

}

- (NSString)userToken
{
  return self->_userToken;
}

- (void)setUserToken:(id)a3
{
  objc_storeStrong((id *)&self->_userToken, a3);
}

- (NSString)applicationContainer
{
  return self->_applicationContainer;
}

- (NSString)applicationBundle
{
  return self->_applicationBundle;
}

- (NSString)applicationVersion
{
  return self->_applicationVersion;
}

- (unint64_t)applicationConfigVersion
{
  return self->_applicationConfigVersion;
}

- (unint64_t)globalConfigVersion
{
  return self->_globalConfigVersion;
}

- (CKDPIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)deviceSoftwareVersion
{
  return self->_deviceSoftwareVersion;
}

- (NSString)deviceHardwareVersion
{
  return self->_deviceHardwareVersion;
}

- (NSString)deviceLibraryName
{
  return self->_deviceLibraryName;
}

- (NSString)deviceLibraryVersion
{
  return self->_deviceLibraryVersion;
}

- (unint64_t)deviceProtocolVersion
{
  return self->_deviceProtocolVersion;
}

- (NSString)mmcsProtocolVersion
{
  return self->_mmcsProtocolVersion;
}

- (NSData)clientChangeToken
{
  return self->_clientChangeToken;
}

- (void)setClientChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_clientChangeToken, a3);
}

- (NSString)deviceAssignedName
{
  return self->_deviceAssignedName;
}

- (NSString)deviceHardwareID
{
  return self->_deviceHardwareID;
}

- (NSString)userIDContainerID
{
  return self->_userIDContainerID;
}

- (void)setUserIDContainerID:(id)a3
{
  objc_storeStrong((id *)&self->_userIDContainerID, a3);
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (unint64_t)operationGroupQuantity
{
  return self->_operationGroupQuantity;
}

- (NSMutableArray)serviceIdentityKeyIDs
{
  return self->_serviceIdentityKeyIDs;
}

- (void)setServiceIdentityKeyIDs:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentityKeyIDs, a3);
}

- (BOOL)deviceSoftwareIsAppleInternal
{
  return self->_deviceSoftwareIsAppleInternal;
}

- (NSMutableArray)activeThrottlingLabels
{
  return self->_activeThrottlingLabels;
}

- (void)setActiveThrottlingLabels:(id)a3
{
  objc_storeStrong((id *)&self->_activeThrottlingLabels, a3);
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (NSString)deviceSerialNumber
{
  return self->_deviceSerialNumber;
}

- (BOOL)entitlementsValidated
{
  return self->_entitlementsValidated;
}

- (NSMutableArray)supplementalZoneInfos
{
  return self->_supplementalZoneInfos;
}

- (void)setSupplementalZoneInfos:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalZoneInfos, a3);
}

- (CKDPRequestOperationHeaderZoneAndShareUsageInfo)zoneAndShareUsageInfo
{
  return self->_zoneAndShareUsageInfo;
}

- (void)setZoneAndShareUsageInfo:(id)a3
{
  objc_storeStrong((id *)&self->_zoneAndShareUsageInfo, a3);
}

- (id)_applicationContainerEnvironmentCKLogValue
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;

  v3 = objc_msgSend_applicationContainerEnvironment(self, a2, v2);
  if ((_DWORD)v3 == 1)
    return CFSTR("production");
  if ((_DWORD)v3 == 2)
    return CFSTR("sandbox");
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_isolationLevelCKLogValue
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;

  v3 = objc_msgSend_isolationLevel(self, a2, v2);
  if ((_DWORD)v3 == 1)
    return CFSTR("zone");
  if ((_DWORD)v3 == 2)
    return CFSTR("operation");
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_targetDatabaseCKLogValue
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;

  v3 = objc_msgSend_targetDatabase(self, a2, v2);
  if ((v3 - 1) < 4)
    return off_1E78343C0[(int)v3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
