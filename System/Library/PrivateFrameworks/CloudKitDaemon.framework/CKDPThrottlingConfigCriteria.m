@implementation CKDPThrottlingConfigCriteria

- (BOOL)hasContainerName
{
  return self->_containerName != 0;
}

- (int)containerEnvironment
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_containerEnvironment;
  else
    return 1;
}

- (void)setContainerEnvironment:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_containerEnvironment = a3;
}

- (void)setHasContainerEnvironment:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainerEnvironment
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)containerEnvironmentAsString:(int)a3
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

- (int)StringAsContainerEnvironment:(id)a3
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

- (int)operationType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_operationType;
  else
    return 0;
}

- (void)setOperationType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_operationType = a3;
}

- (void)setHasOperationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOperationType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)operationTypeAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 299)
  {
    if (a3 <= 502)
    {
      switch(a3)
      {
        case 300:
          v3 = CFSTR("subscriptionCreateType");
          return v3;
        case 301:
          result = CFSTR("subscriptionRetrieveType");
          break;
        case 302:
          result = CFSTR("subscriptionDeleteType");
          break;
        case 303:
        case 304:
        case 305:
        case 306:
        case 307:
        case 308:
        case 309:
        case 310:
        case 315:
        case 316:
        case 317:
        case 318:
        case 319:
          goto LABEL_31;
        case 311:
          result = CFSTR("mergeableDeltaSaveType");
          break;
        case 312:
          result = CFSTR("mergeableDeltaMetadataRetrieveType");
          break;
        case 313:
          result = CFSTR("mergeableDeltaReplaceType");
          break;
        case 314:
          result = CFSTR("mergeableDeltaRetrieveType");
          break;
        case 320:
          result = CFSTR("privateSearchSetType");
          break;
        case 321:
          result = CFSTR("privateSearchGetType");
          break;
        case 322:
          result = CFSTR("privateSearchDeleteType");
          break;
        default:
          switch(a3)
          {
            case 400:
              result = CFSTR("userRetrieveType");
              break;
            case 401:
              result = CFSTR("userQueryType");
              break;
            case 402:
              result = CFSTR("userPrivacySettingsRetrieveType");
              break;
            case 403:
              result = CFSTR("userPrivacySettingsUpdateType");
              break;
            case 404:
              result = CFSTR("userPrivacySettingsResetType");
              break;
            case 405:
              result = CFSTR("userPrivacySettingsBatchLookup");
              break;
            case 406:
              result = CFSTR("sharePermissionSettingsUpdateType");
              break;
            default:
              goto LABEL_31;
          }
          break;
      }
      return result;
    }
    if (a3 <= 899)
    {
      switch(a3)
      {
        case 800:
          result = CFSTR("pushRegisterType");
          break;
        case 801:
          result = CFSTR("pushUnregisterType");
          break;
        case 802:
          result = CFSTR("pushBadgeType");
          break;
        case 803:
          result = CFSTR("pushSyncType");
          break;
        case 804:
          result = CFSTR("pushReadType");
          break;
        default:
          if (a3 == 503)
          {
            result = CFSTR("shareAcceptType");
          }
          else
          {
            if (a3 != 513)
              goto LABEL_31;
            result = CFSTR("shareVettingInitiateType");
          }
          break;
      }
      return result;
    }
    switch(a3)
    {
      case 900:
        return CFSTR("archiveRecordsType");
      case 901:
        return CFSTR("datarepairMarkAssetBrokenType");
      case 1101:
        return CFSTR("functionInvokeType");
    }
LABEL_31:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (a3 > 249)
  {
    if (a3 > 269)
    {
      if (a3 == 270)
        return CFSTR("addAnonymousShareType");
      if (a3 == 271)
        return CFSTR("removeAnonymousShareType");
    }
    else
    {
      if (a3 == 250)
        return CFSTR("webAuthTokenRetrieveType");
      if (a3 == 260)
        return CFSTR("dataRepairUpdateMissingAssetStatusType");
    }
    goto LABEL_31;
  }
  switch(a3)
  {
    case 200:
      result = CFSTR("zoneSaveType");
      break;
    case 201:
      result = CFSTR("zoneRetrieveType");
      break;
    case 202:
      result = CFSTR("zoneDeleteType");
      break;
    case 203:
      result = CFSTR("zoneRetrieveChangesType");
      break;
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 215:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 227:
    case 228:
    case 229:
    case 231:
    case 232:
    case 233:
    case 234:
    case 235:
    case 236:
    case 237:
    case 238:
    case 239:
    case 241:
    case 242:
      goto LABEL_31;
    case 210:
      result = CFSTR("recordSaveType");
      break;
    case 211:
      result = CFSTR("recordRetrieveType");
      break;
    case 212:
      result = CFSTR("recordRetrieveVersionsType");
      break;
    case 213:
      result = CFSTR("recordRetrieveChangesType");
      break;
    case 214:
      result = CFSTR("recordDeleteType");
      break;
    case 216:
      result = CFSTR("recordResolveTokenType");
      break;
    case 217:
      result = CFSTR("fetchArchivedRecordsType");
      break;
    case 218:
      result = CFSTR("recordMoveType");
      break;
    case 219:
      result = CFSTR("shareAccessType");
      break;
    case 220:
      result = CFSTR("queryRetrieveType");
      break;
    case 221:
      result = CFSTR("shareDeclineType");
      break;
    case 230:
      result = CFSTR("assetUploadTokenRetrieveType");
      break;
    case 240:
      result = CFSTR("containerDeleteType");
      break;
    case 243:
      result = CFSTR("userAvailableQuotaType");
      break;
    case 244:
      result = CFSTR("containerGetBundlesType");
      break;
    default:
      if (a3)
        goto LABEL_31;
      result = CFSTR("noneType");
      break;
  }
  return result;
}

- (int)StringAsOperationType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("noneType")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("zoneSaveType")) & 1) != 0)
  {
    v6 = 200;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("zoneRetrieveType")) & 1) != 0)
  {
    v6 = 201;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("zoneDeleteType")) & 1) != 0)
  {
    v6 = 202;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("zoneRetrieveChangesType")) & 1) != 0)
  {
    v6 = 203;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("recordSaveType")) & 1) != 0)
  {
    v6 = 210;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("recordRetrieveType")) & 1) != 0)
  {
    v6 = 211;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v12, (uint64_t)CFSTR("recordRetrieveVersionsType")) & 1) != 0)
  {
    v6 = 212;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("recordRetrieveChangesType")) & 1) != 0)
  {
    v6 = 213;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v14, (uint64_t)CFSTR("recordDeleteType")) & 1) != 0)
  {
    v6 = 214;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v15, (uint64_t)CFSTR("recordResolveTokenType")) & 1) != 0)
  {
    v6 = 216;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v16, (uint64_t)CFSTR("fetchArchivedRecordsType")) & 1) != 0)
  {
    v6 = 217;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v17, (uint64_t)CFSTR("recordMoveType")) & 1) != 0)
  {
    v6 = 218;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v18, (uint64_t)CFSTR("shareAccessType")) & 1) != 0)
  {
    v6 = 219;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v19, (uint64_t)CFSTR("queryRetrieveType")) & 1) != 0)
  {
    v6 = 220;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v20, (uint64_t)CFSTR("shareDeclineType")) & 1) != 0)
  {
    v6 = 221;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v21, (uint64_t)CFSTR("assetUploadTokenRetrieveType")) & 1) != 0)
  {
    v6 = 230;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v22, (uint64_t)CFSTR("containerDeleteType")) & 1) != 0)
  {
    v6 = 240;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v23, (uint64_t)CFSTR("userAvailableQuotaType")) & 1) != 0)
  {
    v6 = 243;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v24, (uint64_t)CFSTR("containerGetBundlesType")) & 1) != 0)
  {
    v6 = 244;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v25, (uint64_t)CFSTR("webAuthTokenRetrieveType")) & 1) != 0)
  {
    v6 = 250;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v26, (uint64_t)CFSTR("dataRepairUpdateMissingAssetStatusType")) & 1) != 0)
  {
    v6 = 260;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v27, (uint64_t)CFSTR("addAnonymousShareType")) & 1) != 0)
  {
    v6 = 270;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v28, (uint64_t)CFSTR("removeAnonymousShareType")) & 1) != 0)
  {
    v6 = 271;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v29, (uint64_t)CFSTR("subscriptionCreateType")) & 1) != 0)
  {
    v6 = 300;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v30, (uint64_t)CFSTR("subscriptionRetrieveType")) & 1) != 0)
  {
    v6 = 301;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v31, (uint64_t)CFSTR("subscriptionDeleteType")) & 1) != 0)
  {
    v6 = 302;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v32, (uint64_t)CFSTR("mergeableDeltaSaveType")) & 1) != 0)
  {
    v6 = 311;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v33, (uint64_t)CFSTR("mergeableDeltaMetadataRetrieveType")) & 1) != 0)
  {
    v6 = 312;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v34, (uint64_t)CFSTR("mergeableDeltaReplaceType")) & 1) != 0)
  {
    v6 = 313;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v35, (uint64_t)CFSTR("mergeableDeltaRetrieveType")) & 1) != 0)
  {
    v6 = 314;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v36, (uint64_t)CFSTR("privateSearchSetType")) & 1) != 0)
  {
    v6 = 320;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v37, (uint64_t)CFSTR("privateSearchGetType")) & 1) != 0)
  {
    v6 = 321;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v38, (uint64_t)CFSTR("privateSearchDeleteType")) & 1) != 0)
  {
    v6 = 322;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v39, (uint64_t)CFSTR("userRetrieveType")) & 1) != 0)
  {
    v6 = 400;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v40, (uint64_t)CFSTR("userQueryType")) & 1) != 0)
  {
    v6 = 401;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v41, (uint64_t)CFSTR("userPrivacySettingsRetrieveType")) & 1) != 0)
  {
    v6 = 402;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v42, (uint64_t)CFSTR("userPrivacySettingsUpdateType")) & 1) != 0)
  {
    v6 = 403;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v43, (uint64_t)CFSTR("userPrivacySettingsResetType")) & 1) != 0)
  {
    v6 = 404;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v44, (uint64_t)CFSTR("userPrivacySettingsBatchLookup")) & 1) != 0)
  {
    v6 = 405;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v45, (uint64_t)CFSTR("sharePermissionSettingsUpdateType")) & 1) != 0)
  {
    v6 = 406;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v46, (uint64_t)CFSTR("shareAcceptType")) & 1) != 0)
  {
    v6 = 503;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v47, (uint64_t)CFSTR("shareVettingInitiateType")) & 1) != 0)
  {
    v6 = 513;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v48, (uint64_t)CFSTR("pushRegisterType")) & 1) != 0)
  {
    v6 = 800;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v49, (uint64_t)CFSTR("pushUnregisterType")) & 1) != 0)
  {
    v6 = 801;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v50, (uint64_t)CFSTR("pushBadgeType")) & 1) != 0)
  {
    v6 = 802;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v51, (uint64_t)CFSTR("pushSyncType")) & 1) != 0)
  {
    v6 = 803;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v52, (uint64_t)CFSTR("pushReadType")) & 1) != 0)
  {
    v6 = 804;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v53, (uint64_t)CFSTR("archiveRecordsType")) & 1) != 0)
  {
    v6 = 900;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v54, (uint64_t)CFSTR("datarepairMarkAssetBrokenType")) & 1) != 0)
  {
    v6 = 901;
  }
  else if (objc_msgSend_isEqualToString_(v3, v55, (uint64_t)CFSTR("functionInvokeType")))
  {
    v6 = 1101;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)databaseType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_databaseType;
  else
    return 1;
}

- (void)setDatabaseType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_databaseType = a3;
}

- (void)setHasDatabaseType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDatabaseType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)databaseTypeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E78386E8[a3 - 1];
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

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (BOOL)hasOperationGroupName
{
  return self->_operationGroupName != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasInvernessServiceName
{
  return self->_invernessServiceName != 0;
}

- (BOOL)hasInvernessFunctionName
{
  return self->_invernessFunctionName != 0;
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
  v11.super_class = (Class)CKDPThrottlingConfigCriteria;
  -[CKDPThrottlingConfigCriteria description](&v11, sel_description);
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
  NSString *containerName;
  char has;
  int containerEnvironment;
  __CFString *v10;
  const char *v11;
  int operationType;
  __CFString *v13;
  const char *v14;
  unsigned int v15;
  __CFString *v16;
  NSString *zoneName;
  NSString *operationGroupName;
  NSString *bundleID;
  NSString *invernessServiceName;
  NSString *invernessFunctionName;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  containerName = self->_containerName;
  if (containerName)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)containerName, CFSTR("containerName"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    containerEnvironment = self->_containerEnvironment;
    if (containerEnvironment == 1)
    {
      v10 = CFSTR("production");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("production"), CFSTR("containerEnvironment"));
    }
    else if (containerEnvironment == 2)
    {
      v10 = CFSTR("sandbox");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("sandbox"), CFSTR("containerEnvironment"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_containerEnvironment);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("containerEnvironment"));
    }

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_89;
      goto LABEL_85;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  operationType = self->_operationType;
  if (operationType > 299)
  {
    if (operationType <= 502)
    {
      switch(operationType)
      {
        case 300:
          v13 = CFSTR("subscriptionCreateType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("subscriptionCreateType"), CFSTR("operationType"));
          break;
        case 301:
          v13 = CFSTR("subscriptionRetrieveType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("subscriptionRetrieveType"), CFSTR("operationType"));
          break;
        case 302:
          v13 = CFSTR("subscriptionDeleteType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("subscriptionDeleteType"), CFSTR("operationType"));
          break;
        case 303:
        case 304:
        case 305:
        case 306:
        case 307:
        case 308:
        case 309:
        case 310:
        case 315:
        case 316:
        case 317:
        case 318:
        case 319:
          goto LABEL_41;
        case 311:
          v13 = CFSTR("mergeableDeltaSaveType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("mergeableDeltaSaveType"), CFSTR("operationType"));
          break;
        case 312:
          v13 = CFSTR("mergeableDeltaMetadataRetrieveType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("mergeableDeltaMetadataRetrieveType"), CFSTR("operationType"));
          break;
        case 313:
          v13 = CFSTR("mergeableDeltaReplaceType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("mergeableDeltaReplaceType"), CFSTR("operationType"));
          break;
        case 314:
          v13 = CFSTR("mergeableDeltaRetrieveType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("mergeableDeltaRetrieveType"), CFSTR("operationType"));
          break;
        case 320:
          v13 = CFSTR("privateSearchSetType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("privateSearchSetType"), CFSTR("operationType"));
          break;
        case 321:
          v13 = CFSTR("privateSearchGetType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("privateSearchGetType"), CFSTR("operationType"));
          break;
        case 322:
          v13 = CFSTR("privateSearchDeleteType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("privateSearchDeleteType"), CFSTR("operationType"));
          break;
        default:
          switch(operationType)
          {
            case 400:
              v13 = CFSTR("userRetrieveType");
              objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userRetrieveType"), CFSTR("operationType"));
              break;
            case 401:
              v13 = CFSTR("userQueryType");
              objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userQueryType"), CFSTR("operationType"));
              break;
            case 402:
              v13 = CFSTR("userPrivacySettingsRetrieveType");
              objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userPrivacySettingsRetrieveType"), CFSTR("operationType"));
              break;
            case 403:
              v13 = CFSTR("userPrivacySettingsUpdateType");
              objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userPrivacySettingsUpdateType"), CFSTR("operationType"));
              break;
            case 404:
              v13 = CFSTR("userPrivacySettingsResetType");
              objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userPrivacySettingsResetType"), CFSTR("operationType"));
              break;
            case 405:
              v13 = CFSTR("userPrivacySettingsBatchLookup");
              objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userPrivacySettingsBatchLookup"), CFSTR("operationType"));
              break;
            case 406:
              v13 = CFSTR("sharePermissionSettingsUpdateType");
              objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("sharePermissionSettingsUpdateType"), CFSTR("operationType"));
              break;
            default:
              goto LABEL_41;
          }
          break;
      }
      goto LABEL_84;
    }
    if (operationType <= 899)
    {
      switch(operationType)
      {
        case 800:
          v13 = CFSTR("pushRegisterType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("pushRegisterType"), CFSTR("operationType"));
          break;
        case 801:
          v13 = CFSTR("pushUnregisterType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("pushUnregisterType"), CFSTR("operationType"));
          break;
        case 802:
          v13 = CFSTR("pushBadgeType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("pushBadgeType"), CFSTR("operationType"));
          break;
        case 803:
          v13 = CFSTR("pushSyncType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("pushSyncType"), CFSTR("operationType"));
          break;
        case 804:
          v13 = CFSTR("pushReadType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("pushReadType"), CFSTR("operationType"));
          break;
        default:
          if (operationType == 503)
          {
            v13 = CFSTR("shareAcceptType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("shareAcceptType"), CFSTR("operationType"));
          }
          else
          {
            if (operationType != 513)
              goto LABEL_41;
            v13 = CFSTR("shareVettingInitiateType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("shareVettingInitiateType"), CFSTR("operationType"));
          }
          break;
      }
      goto LABEL_84;
    }
    switch(operationType)
    {
      case 900:
        v13 = CFSTR("archiveRecordsType");
        objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("archiveRecordsType"), CFSTR("operationType"));
        goto LABEL_84;
      case 901:
        v13 = CFSTR("datarepairMarkAssetBrokenType");
        objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("datarepairMarkAssetBrokenType"), CFSTR("operationType"));
        goto LABEL_84;
      case 1101:
        v13 = CFSTR("functionInvokeType");
        objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("functionInvokeType"), CFSTR("operationType"));
        goto LABEL_84;
    }
LABEL_41:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_operationType);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("operationType"));
    goto LABEL_84;
  }
  if (operationType > 249)
  {
    if (operationType > 269)
    {
      if (operationType == 270)
      {
        v13 = CFSTR("addAnonymousShareType");
        objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("addAnonymousShareType"), CFSTR("operationType"));
        goto LABEL_84;
      }
      if (operationType == 271)
      {
        v13 = CFSTR("removeAnonymousShareType");
        objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("removeAnonymousShareType"), CFSTR("operationType"));
        goto LABEL_84;
      }
    }
    else
    {
      if (operationType == 250)
      {
        v13 = CFSTR("webAuthTokenRetrieveType");
        objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("webAuthTokenRetrieveType"), CFSTR("operationType"));
        goto LABEL_84;
      }
      if (operationType == 260)
      {
        v13 = CFSTR("dataRepairUpdateMissingAssetStatusType");
        objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("dataRepairUpdateMissingAssetStatusType"), CFSTR("operationType"));
        goto LABEL_84;
      }
    }
    goto LABEL_41;
  }
  switch(operationType)
  {
    case 200:
      v13 = CFSTR("zoneSaveType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("zoneSaveType"), CFSTR("operationType"));
      break;
    case 201:
      v13 = CFSTR("zoneRetrieveType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("zoneRetrieveType"), CFSTR("operationType"));
      break;
    case 202:
      v13 = CFSTR("zoneDeleteType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("zoneDeleteType"), CFSTR("operationType"));
      break;
    case 203:
      v13 = CFSTR("zoneRetrieveChangesType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("zoneRetrieveChangesType"), CFSTR("operationType"));
      break;
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 215:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 227:
    case 228:
    case 229:
    case 231:
    case 232:
    case 233:
    case 234:
    case 235:
    case 236:
    case 237:
    case 238:
    case 239:
    case 241:
    case 242:
      goto LABEL_41;
    case 210:
      v13 = CFSTR("recordSaveType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordSaveType"), CFSTR("operationType"));
      break;
    case 211:
      v13 = CFSTR("recordRetrieveType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordRetrieveType"), CFSTR("operationType"));
      break;
    case 212:
      v13 = CFSTR("recordRetrieveVersionsType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordRetrieveVersionsType"), CFSTR("operationType"));
      break;
    case 213:
      v13 = CFSTR("recordRetrieveChangesType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordRetrieveChangesType"), CFSTR("operationType"));
      break;
    case 214:
      v13 = CFSTR("recordDeleteType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordDeleteType"), CFSTR("operationType"));
      break;
    case 216:
      v13 = CFSTR("recordResolveTokenType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordResolveTokenType"), CFSTR("operationType"));
      break;
    case 217:
      v13 = CFSTR("fetchArchivedRecordsType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("fetchArchivedRecordsType"), CFSTR("operationType"));
      break;
    case 218:
      v13 = CFSTR("recordMoveType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordMoveType"), CFSTR("operationType"));
      break;
    case 219:
      v13 = CFSTR("shareAccessType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("shareAccessType"), CFSTR("operationType"));
      break;
    case 220:
      v13 = CFSTR("queryRetrieveType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("queryRetrieveType"), CFSTR("operationType"));
      break;
    case 221:
      v13 = CFSTR("shareDeclineType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("shareDeclineType"), CFSTR("operationType"));
      break;
    case 230:
      v13 = CFSTR("assetUploadTokenRetrieveType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("assetUploadTokenRetrieveType"), CFSTR("operationType"));
      break;
    case 240:
      v13 = CFSTR("containerDeleteType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("containerDeleteType"), CFSTR("operationType"));
      break;
    case 243:
      v13 = CFSTR("userAvailableQuotaType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userAvailableQuotaType"), CFSTR("operationType"));
      break;
    case 244:
      v13 = CFSTR("containerGetBundlesType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("containerGetBundlesType"), CFSTR("operationType"));
      break;
    default:
      if (operationType)
        goto LABEL_41;
      v13 = CFSTR("noneType");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("noneType"), CFSTR("operationType"));
      break;
  }
LABEL_84:

  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_89;
LABEL_85:
  v15 = self->_databaseType - 1;
  if (v15 >= 4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_databaseType);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E78386E8[v15];
  }
  objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v16, CFSTR("databaseType"));

LABEL_89:
  zoneName = self->_zoneName;
  if (zoneName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)zoneName, CFSTR("zoneName"));
  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)operationGroupName, CFSTR("operationGroupName"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)bundleID, CFSTR("bundleID"));
  invernessServiceName = self->_invernessServiceName;
  if (invernessServiceName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)invernessServiceName, CFSTR("invernessServiceName"));
  invernessFunctionName = self->_invernessFunctionName;
  if (invernessFunctionName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)invernessFunctionName, CFSTR("invernessFunctionName"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC69AA4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_containerName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_7:
  if (self->_zoneName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_operationGroupName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_invernessServiceName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_invernessFunctionName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *containerName;
  char has;
  NSString *zoneName;
  NSString *operationGroupName;
  NSString *invernessServiceName;
  NSString *invernessFunctionName;
  NSString *bundleID;
  id v13;

  v4 = a3;
  containerName = self->_containerName;
  v13 = v4;
  if (containerName)
  {
    objc_msgSend_setContainerName_(v4, v5, (uint64_t)containerName);
    v4 = v13;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_containerEnvironment;
    *((_BYTE *)v4 + 80) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 16) = self->_operationType;
  *((_BYTE *)v4 + 80) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 8) = self->_databaseType;
    *((_BYTE *)v4 + 80) |= 2u;
  }
LABEL_7:
  zoneName = self->_zoneName;
  if (zoneName)
  {
    objc_msgSend_setZoneName_(v13, v5, (uint64_t)zoneName);
    v4 = v13;
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
  {
    objc_msgSend_setOperationGroupName_(v13, v5, (uint64_t)operationGroupName);
    v4 = v13;
  }
  invernessServiceName = self->_invernessServiceName;
  if (invernessServiceName)
  {
    objc_msgSend_setInvernessServiceName_(v13, v5, (uint64_t)invernessServiceName);
    v4 = v13;
  }
  invernessFunctionName = self->_invernessFunctionName;
  if (invernessFunctionName)
  {
    objc_msgSend_setInvernessFunctionName_(v13, v5, (uint64_t)invernessFunctionName);
    v4 = v13;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    objc_msgSend_setBundleID_(v13, v5, (uint64_t)bundleID);
    v4 = v13;
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
  char has;
  uint64_t v16;
  void *v17;
  const char *v18;
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_containerName, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v12;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v10 + 64) = self->_operationType;
    *(_BYTE *)(v10 + 80) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v10 + 16) = self->_containerEnvironment;
  *(_BYTE *)(v10 + 80) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v10 + 32) = self->_databaseType;
    *(_BYTE *)(v10 + 80) |= 2u;
  }
LABEL_5:
  v16 = objc_msgSend_copyWithZone_(self->_zoneName, v14, (uint64_t)a3);
  v17 = *(void **)(v10 + 72);
  *(_QWORD *)(v10 + 72) = v16;

  v19 = objc_msgSend_copyWithZone_(self->_operationGroupName, v18, (uint64_t)a3);
  v20 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v19;

  v22 = objc_msgSend_copyWithZone_(self->_invernessServiceName, v21, (uint64_t)a3);
  v23 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v22;

  v25 = objc_msgSend_copyWithZone_(self->_invernessFunctionName, v24, (uint64_t)a3);
  v26 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v25;

  v28 = objc_msgSend_copyWithZone_(self->_bundleID, v27, (uint64_t)a3);
  v29 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v28;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *containerName;
  uint64_t v9;
  NSString *zoneName;
  uint64_t v11;
  NSString *operationGroupName;
  uint64_t v13;
  NSString *invernessServiceName;
  uint64_t v15;
  NSString *invernessFunctionName;
  uint64_t v17;
  NSString *bundleID;
  uint64_t v19;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_29;
  containerName = self->_containerName;
  v9 = v4[3];
  if ((unint64_t)containerName | v9)
  {
    if (!objc_msgSend_isEqual_(containerName, v7, v9))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[10] & 1) == 0 || self->_containerEnvironment != *((_DWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((v4[10] & 1) != 0)
  {
LABEL_29:
    isEqual = 0;
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[10] & 4) == 0 || self->_operationType != *((_DWORD *)v4 + 16))
      goto LABEL_29;
  }
  else if ((v4[10] & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[10] & 2) == 0 || self->_databaseType != *((_DWORD *)v4 + 8))
      goto LABEL_29;
  }
  else if ((v4[10] & 2) != 0)
  {
    goto LABEL_29;
  }
  zoneName = self->_zoneName;
  v11 = v4[9];
  if ((unint64_t)zoneName | v11 && !objc_msgSend_isEqual_(zoneName, v7, v11))
    goto LABEL_29;
  operationGroupName = self->_operationGroupName;
  v13 = v4[7];
  if ((unint64_t)operationGroupName | v13)
  {
    if (!objc_msgSend_isEqual_(operationGroupName, v7, v13))
      goto LABEL_29;
  }
  invernessServiceName = self->_invernessServiceName;
  v15 = v4[6];
  if ((unint64_t)invernessServiceName | v15)
  {
    if (!objc_msgSend_isEqual_(invernessServiceName, v7, v15))
      goto LABEL_29;
  }
  invernessFunctionName = self->_invernessFunctionName;
  v17 = v4[5];
  if ((unint64_t)invernessFunctionName | v17)
  {
    if (!objc_msgSend_isEqual_(invernessFunctionName, v7, v17))
      goto LABEL_29;
  }
  bundleID = self->_bundleID;
  v19 = v4[1];
  if ((unint64_t)bundleID | v19)
    isEqual = objc_msgSend_isEqual_(bundleID, v7, v19);
  else
    isEqual = 1;
LABEL_30:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;

  v4 = objc_msgSend_hash(self->_containerName, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v7 = 2654435761 * self->_containerEnvironment;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v8 = 2654435761 * self->_operationType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v9 = 2654435761 * self->_databaseType;
LABEL_8:
  v10 = v7 ^ v4 ^ v8 ^ v9 ^ objc_msgSend_hash(self->_zoneName, v5, v6);
  v13 = objc_msgSend_hash(self->_operationGroupName, v11, v12);
  v16 = v13 ^ objc_msgSend_hash(self->_invernessServiceName, v14, v15);
  v19 = v10 ^ v16 ^ objc_msgSend_hash(self->_invernessFunctionName, v17, v18);
  return v19 ^ objc_msgSend_hash(self->_bundleID, v20, v21);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  v6 = *((_QWORD *)v4 + 3);
  v13 = v4;
  if (v6)
  {
    objc_msgSend_setContainerName_(self, v5, v6);
    v4 = v13;
  }
  v7 = *((_BYTE *)v4 + 80);
  if ((v7 & 1) != 0)
  {
    self->_containerEnvironment = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 80);
    if ((v7 & 4) == 0)
    {
LABEL_5:
      if ((v7 & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_operationType = *((_DWORD *)v4 + 16);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
LABEL_6:
    self->_databaseType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:
  v8 = *((_QWORD *)v4 + 9);
  if (v8)
  {
    objc_msgSend_setZoneName_(self, v5, v8);
    v4 = v13;
  }
  v9 = *((_QWORD *)v4 + 7);
  if (v9)
  {
    objc_msgSend_setOperationGroupName_(self, v5, v9);
    v4 = v13;
  }
  v10 = *((_QWORD *)v4 + 6);
  if (v10)
  {
    objc_msgSend_setInvernessServiceName_(self, v5, v10);
    v4 = v13;
  }
  v11 = *((_QWORD *)v4 + 5);
  if (v11)
  {
    objc_msgSend_setInvernessFunctionName_(self, v5, v11);
    v4 = v13;
  }
  v12 = *((_QWORD *)v4 + 1);
  if (v12)
  {
    objc_msgSend_setBundleID_(self, v5, v12);
    v4 = v13;
  }

}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
  objc_storeStrong((id *)&self->_containerName, a3);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_zoneName, a3);
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void)setOperationGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_operationGroupName, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)invernessServiceName
{
  return self->_invernessServiceName;
}

- (void)setInvernessServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_invernessServiceName, a3);
}

- (NSString)invernessFunctionName
{
  return self->_invernessFunctionName;
}

- (void)setInvernessFunctionName:(id)a3
{
  objc_storeStrong((id *)&self->_invernessFunctionName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_invernessServiceName, 0);
  objc_storeStrong((id *)&self->_invernessFunctionName, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
