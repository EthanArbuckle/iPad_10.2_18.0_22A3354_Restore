@implementation CKDPOperation

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSignature, 0);
  objc_storeStrong((id *)&self->_operationUUID, 0);
  objc_storeStrong((id *)&self->_anonymousCKUserID, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_operationUUID)
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
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_7:
  if (self->_requestSignature)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_anonymousCKUserID)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setOperationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_operationUUID, a3);
}

- (void)setLast:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_last = a3;
}

- (NSString)operationUUID
{
  return self->_operationUUID;
}

- (BOOL)hasOperationUUID
{
  return self->_operationUUID != 0;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
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

- (int)StringAsType:(id)a3
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

- (void)setSynchronousMode:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_synchronousMode = a3;
}

- (void)setHasSynchronousMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSynchronousMode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasLast:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLast
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasRequestSignature
{
  return self->_requestSignature != 0;
}

- (BOOL)hasAnonymousCKUserID
{
  return self->_anonymousCKUserID != 0;
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
  v11.super_class = (Class)CKDPOperation;
  -[CKDPOperation description](&v11, sel_description);
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
  NSString *operationUUID;
  char has;
  int type;
  __CFString *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  NSData *requestSignature;
  CKDPIdentifier *anonymousCKUserID;
  void *v18;
  const char *v19;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  operationUUID = self->_operationUUID;
  if (operationUUID)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)operationUUID, CFSTR("operationUUID"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    type = self->_type;
    if (type <= 299)
    {
      if (type <= 249)
      {
        switch(type)
        {
          case 200:
            v10 = CFSTR("zoneSaveType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("zoneSaveType"), CFSTR("type"));
            break;
          case 201:
            v10 = CFSTR("zoneRetrieveType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("zoneRetrieveType"), CFSTR("type"));
            break;
          case 202:
            v10 = CFSTR("zoneDeleteType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("zoneDeleteType"), CFSTR("type"));
            break;
          case 203:
            v10 = CFSTR("zoneRetrieveChangesType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("zoneRetrieveChangesType"), CFSTR("type"));
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
            goto LABEL_32;
          case 210:
            v10 = CFSTR("recordSaveType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordSaveType"), CFSTR("type"));
            break;
          case 211:
            v10 = CFSTR("recordRetrieveType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordRetrieveType"), CFSTR("type"));
            break;
          case 212:
            v10 = CFSTR("recordRetrieveVersionsType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordRetrieveVersionsType"), CFSTR("type"));
            break;
          case 213:
            v10 = CFSTR("recordRetrieveChangesType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordRetrieveChangesType"), CFSTR("type"));
            break;
          case 214:
            v10 = CFSTR("recordDeleteType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordDeleteType"), CFSTR("type"));
            break;
          case 216:
            v10 = CFSTR("recordResolveTokenType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordResolveTokenType"), CFSTR("type"));
            break;
          case 217:
            v10 = CFSTR("fetchArchivedRecordsType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("fetchArchivedRecordsType"), CFSTR("type"));
            break;
          case 218:
            v10 = CFSTR("recordMoveType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("recordMoveType"), CFSTR("type"));
            break;
          case 219:
            v10 = CFSTR("shareAccessType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("shareAccessType"), CFSTR("type"));
            break;
          case 220:
            v10 = CFSTR("queryRetrieveType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("queryRetrieveType"), CFSTR("type"));
            break;
          case 221:
            v10 = CFSTR("shareDeclineType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("shareDeclineType"), CFSTR("type"));
            break;
          case 230:
            v10 = CFSTR("assetUploadTokenRetrieveType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("assetUploadTokenRetrieveType"), CFSTR("type"));
            break;
          case 240:
            v10 = CFSTR("containerDeleteType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("containerDeleteType"), CFSTR("type"));
            break;
          case 243:
            v10 = CFSTR("userAvailableQuotaType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userAvailableQuotaType"), CFSTR("type"));
            break;
          case 244:
            v10 = CFSTR("containerGetBundlesType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("containerGetBundlesType"), CFSTR("type"));
            break;
          default:
            if (type)
              goto LABEL_32;
            v10 = CFSTR("noneType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("noneType"), CFSTR("type"));
            break;
        }
        goto LABEL_75;
      }
      if (type > 269)
      {
        if (type == 270)
        {
          v10 = CFSTR("addAnonymousShareType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("addAnonymousShareType"), CFSTR("type"));
          goto LABEL_75;
        }
        if (type == 271)
        {
          v10 = CFSTR("removeAnonymousShareType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("removeAnonymousShareType"), CFSTR("type"));
          goto LABEL_75;
        }
      }
      else
      {
        if (type == 250)
        {
          v10 = CFSTR("webAuthTokenRetrieveType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("webAuthTokenRetrieveType"), CFSTR("type"));
          goto LABEL_75;
        }
        if (type == 260)
        {
          v10 = CFSTR("dataRepairUpdateMissingAssetStatusType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("dataRepairUpdateMissingAssetStatusType"), CFSTR("type"));
LABEL_75:

          has = (char)self->_has;
          goto LABEL_76;
        }
      }
    }
    else
    {
      if (type <= 502)
      {
        switch(type)
        {
          case 300:
            v10 = CFSTR("subscriptionCreateType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("subscriptionCreateType"), CFSTR("type"));
            break;
          case 301:
            v10 = CFSTR("subscriptionRetrieveType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("subscriptionRetrieveType"), CFSTR("type"));
            break;
          case 302:
            v10 = CFSTR("subscriptionDeleteType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("subscriptionDeleteType"), CFSTR("type"));
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
            goto LABEL_32;
          case 311:
            v10 = CFSTR("mergeableDeltaSaveType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("mergeableDeltaSaveType"), CFSTR("type"));
            break;
          case 312:
            v10 = CFSTR("mergeableDeltaMetadataRetrieveType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("mergeableDeltaMetadataRetrieveType"), CFSTR("type"));
            break;
          case 313:
            v10 = CFSTR("mergeableDeltaReplaceType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("mergeableDeltaReplaceType"), CFSTR("type"));
            break;
          case 314:
            v10 = CFSTR("mergeableDeltaRetrieveType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("mergeableDeltaRetrieveType"), CFSTR("type"));
            break;
          case 320:
            v10 = CFSTR("privateSearchSetType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("privateSearchSetType"), CFSTR("type"));
            break;
          case 321:
            v10 = CFSTR("privateSearchGetType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("privateSearchGetType"), CFSTR("type"));
            break;
          case 322:
            v10 = CFSTR("privateSearchDeleteType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("privateSearchDeleteType"), CFSTR("type"));
            break;
          default:
            switch(type)
            {
              case 400:
                v10 = CFSTR("userRetrieveType");
                objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userRetrieveType"), CFSTR("type"));
                break;
              case 401:
                v10 = CFSTR("userQueryType");
                objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userQueryType"), CFSTR("type"));
                break;
              case 402:
                v10 = CFSTR("userPrivacySettingsRetrieveType");
                objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userPrivacySettingsRetrieveType"), CFSTR("type"));
                break;
              case 403:
                v10 = CFSTR("userPrivacySettingsUpdateType");
                objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userPrivacySettingsUpdateType"), CFSTR("type"));
                break;
              case 404:
                v10 = CFSTR("userPrivacySettingsResetType");
                objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userPrivacySettingsResetType"), CFSTR("type"));
                break;
              case 405:
                v10 = CFSTR("userPrivacySettingsBatchLookup");
                objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("userPrivacySettingsBatchLookup"), CFSTR("type"));
                break;
              case 406:
                v10 = CFSTR("sharePermissionSettingsUpdateType");
                objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("sharePermissionSettingsUpdateType"), CFSTR("type"));
                break;
              default:
                goto LABEL_32;
            }
            break;
        }
        goto LABEL_75;
      }
      if (type <= 899)
      {
        switch(type)
        {
          case 800:
            v10 = CFSTR("pushRegisterType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("pushRegisterType"), CFSTR("type"));
            break;
          case 801:
            v10 = CFSTR("pushUnregisterType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("pushUnregisterType"), CFSTR("type"));
            break;
          case 802:
            v10 = CFSTR("pushBadgeType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("pushBadgeType"), CFSTR("type"));
            break;
          case 803:
            v10 = CFSTR("pushSyncType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("pushSyncType"), CFSTR("type"));
            break;
          case 804:
            v10 = CFSTR("pushReadType");
            objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("pushReadType"), CFSTR("type"));
            break;
          default:
            if (type == 503)
            {
              v10 = CFSTR("shareAcceptType");
              objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("shareAcceptType"), CFSTR("type"));
            }
            else
            {
              if (type != 513)
                goto LABEL_32;
              v10 = CFSTR("shareVettingInitiateType");
              objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("shareVettingInitiateType"), CFSTR("type"));
            }
            break;
        }
        goto LABEL_75;
      }
      switch(type)
      {
        case 900:
          v10 = CFSTR("archiveRecordsType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("archiveRecordsType"), CFSTR("type"));
          goto LABEL_75;
        case 901:
          v10 = CFSTR("datarepairMarkAssetBrokenType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("datarepairMarkAssetBrokenType"), CFSTR("type"));
          goto LABEL_75;
        case 1101:
          v10 = CFSTR("functionInvokeType");
          objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("functionInvokeType"), CFSTR("type"));
          goto LABEL_75;
      }
    }
LABEL_32:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_type);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("type"));
    goto LABEL_75;
  }
LABEL_76:
  if ((has & 4) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_synchronousMode);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("synchronousMode"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_last);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("last"));

  }
  requestSignature = self->_requestSignature;
  if (requestSignature)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)requestSignature, CFSTR("requestSignature"));
  anonymousCKUserID = self->_anonymousCKUserID;
  if (anonymousCKUserID)
  {
    objc_msgSend_dictionaryRepresentation(anonymousCKUserID, v5, (uint64_t)requestSignature);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, CFSTR("anonymousCKUserID"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPOperationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *operationUUID;
  char has;
  NSData *requestSignature;
  CKDPIdentifier *anonymousCKUserID;
  id v10;

  v4 = a3;
  operationUUID = self->_operationUUID;
  v10 = v4;
  if (operationUUID)
  {
    objc_msgSend_setOperationUUID_(v4, v5, (uint64_t)operationUUID);
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_type;
    *((_BYTE *)v4 + 40) |= 1u;
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
  *((_BYTE *)v4 + 37) = self->_synchronousMode;
  *((_BYTE *)v4 + 40) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_BYTE *)v4 + 36) = self->_last;
    *((_BYTE *)v4 + 40) |= 2u;
  }
LABEL_7:
  requestSignature = self->_requestSignature;
  if (requestSignature)
  {
    objc_msgSend_setRequestSignature_(v10, v5, (uint64_t)requestSignature);
    v4 = v10;
  }
  anonymousCKUserID = self->_anonymousCKUserID;
  if (anonymousCKUserID)
  {
    objc_msgSend_setAnonymousCKUserID_(v10, v5, (uint64_t)anonymousCKUserID);
    v4 = v10;
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_operationUUID, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v10 + 37) = self->_synchronousMode;
    *(_BYTE *)(v10 + 40) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v10 + 32) = self->_type;
  *(_BYTE *)(v10 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_BYTE *)(v10 + 36) = self->_last;
    *(_BYTE *)(v10 + 40) |= 2u;
  }
LABEL_5:
  v16 = objc_msgSend_copyWithZone_(self->_requestSignature, v14, (uint64_t)a3);
  v17 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v16;

  v19 = objc_msgSend_copyWithZone_(self->_anonymousCKUserID, v18, (uint64_t)a3);
  v20 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v19;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *operationUUID;
  uint64_t v9;
  NSData *requestSignature;
  uint64_t v11;
  CKDPIdentifier *anonymousCKUserID;
  uint64_t v13;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_29;
  operationUUID = self->_operationUUID;
  v9 = v4[2];
  if ((unint64_t)operationUUID | v9)
  {
    if (!objc_msgSend_isEqual_(operationUUID, v7, v9))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[5] & 1) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_29;
  }
  else if ((v4[5] & 1) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[5] & 4) == 0)
      goto LABEL_29;
    if (self->_synchronousMode)
    {
      if (!*((_BYTE *)v4 + 37))
        goto LABEL_29;
    }
    else if (*((_BYTE *)v4 + 37))
    {
      goto LABEL_29;
    }
  }
  else if ((v4[5] & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[5] & 2) != 0)
    {
      if (self->_last)
      {
        if (!*((_BYTE *)v4 + 36))
          goto LABEL_29;
        goto LABEL_25;
      }
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_25;
    }
LABEL_29:
    isEqual = 0;
    goto LABEL_30;
  }
  if ((v4[5] & 2) != 0)
    goto LABEL_29;
LABEL_25:
  requestSignature = self->_requestSignature;
  v11 = v4[3];
  if ((unint64_t)requestSignature | v11 && !objc_msgSend_isEqual_(requestSignature, v7, v11))
    goto LABEL_29;
  anonymousCKUserID = self->_anonymousCKUserID;
  v13 = v4[1];
  if ((unint64_t)anonymousCKUserID | v13)
    isEqual = objc_msgSend_isEqual_(anonymousCKUserID, v7, v13);
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

  v4 = objc_msgSend_hash(self->_operationUUID, a2, v2);
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
  v7 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v8 = 2654435761 * self->_synchronousMode;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v9 = 2654435761 * self->_last;
LABEL_8:
  v10 = v7 ^ v4 ^ v8 ^ v9 ^ objc_msgSend_hash(self->_requestSignature, v5, v6);
  return v10 ^ objc_msgSend_hash(self->_anonymousCKUserID, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  CKDPIdentifier *anonymousCKUserID;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = *((_QWORD *)v4 + 2);
  v10 = v4;
  if (v5)
  {
    objc_msgSend_setOperationUUID_(self, (const char *)v4, v5);
    v4 = v10;
  }
  v6 = *((_BYTE *)v4 + 40);
  if ((v6 & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 40);
    if ((v6 & 4) == 0)
    {
LABEL_5:
      if ((v6 & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_synchronousMode = *((_BYTE *)v4 + 37);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_6:
    self->_last = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:
  v7 = *((_QWORD *)v4 + 3);
  if (v7)
  {
    objc_msgSend_setRequestSignature_(self, (const char *)v4, v7);
    v4 = v10;
  }
  anonymousCKUserID = self->_anonymousCKUserID;
  v9 = *((_QWORD *)v4 + 1);
  if (anonymousCKUserID)
  {
    if (v9)
    {
      objc_msgSend_mergeFrom_(anonymousCKUserID, (const char *)v4, v9);
LABEL_17:
      v4 = v10;
    }
  }
  else if (v9)
  {
    objc_msgSend_setAnonymousCKUserID_(self, (const char *)v4, v9);
    goto LABEL_17;
  }

}

- (BOOL)synchronousMode
{
  return self->_synchronousMode;
}

- (BOOL)last
{
  return self->_last;
}

- (NSData)requestSignature
{
  return self->_requestSignature;
}

- (void)setRequestSignature:(id)a3
{
  objc_storeStrong((id *)&self->_requestSignature, a3);
}

- (CKDPIdentifier)anonymousCKUserID
{
  return self->_anonymousCKUserID;
}

- (void)setAnonymousCKUserID:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousCKUserID, a3);
}

- (id)_typeCKLogValue
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v3 = objc_msgSend_type(self, a2, v2);
  if ((int)v3 > 299)
  {
    if ((int)v3 <= 502)
    {
      switch((int)v3)
      {
        case 300:
          v6 = CFSTR("subscriptionCreateType");
          v7 = objc_msgSend_length(CFSTR("subscriptionCreateType"), v4, v5);
          break;
        case 301:
          v6 = CFSTR("subscriptionRetrieveType");
          v7 = objc_msgSend_length(CFSTR("subscriptionRetrieveType"), v4, v5);
          break;
        case 302:
          v6 = CFSTR("subscriptionDeleteType");
          v7 = objc_msgSend_length(CFSTR("subscriptionDeleteType"), v4, v5);
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
          goto LABEL_29;
        case 311:
          v6 = CFSTR("mergeableDeltaSaveType");
          v7 = objc_msgSend_length(CFSTR("mergeableDeltaSaveType"), v4, v5);
          break;
        case 312:
          v6 = CFSTR("mergeableDeltaMetadataRetrieveType");
          v7 = objc_msgSend_length(CFSTR("mergeableDeltaMetadataRetrieveType"), v4, v5);
          break;
        case 313:
          v6 = CFSTR("mergeableDeltaReplaceType");
          v7 = objc_msgSend_length(CFSTR("mergeableDeltaReplaceType"), v4, v5);
          break;
        case 314:
          v6 = CFSTR("mergeableDeltaRetrieveType");
          v7 = objc_msgSend_length(CFSTR("mergeableDeltaRetrieveType"), v4, v5);
          break;
        case 320:
          v6 = CFSTR("privateSearchSetType");
          v7 = objc_msgSend_length(CFSTR("privateSearchSetType"), v4, v5);
          break;
        case 321:
          v6 = CFSTR("privateSearchGetType");
          v7 = objc_msgSend_length(CFSTR("privateSearchGetType"), v4, v5);
          break;
        case 322:
          v6 = CFSTR("privateSearchDeleteType");
          v7 = objc_msgSend_length(CFSTR("privateSearchDeleteType"), v4, v5);
          break;
        default:
          switch((int)v3)
          {
            case 400:
              v6 = CFSTR("userRetrieveType");
              v7 = objc_msgSend_length(CFSTR("userRetrieveType"), v4, v5);
              break;
            case 401:
              v6 = CFSTR("userQueryType");
              v7 = objc_msgSend_length(CFSTR("userQueryType"), v4, v5);
              break;
            case 402:
              v6 = CFSTR("userPrivacySettingsRetrieveType");
              v7 = objc_msgSend_length(CFSTR("userPrivacySettingsRetrieveType"), v4, v5);
              break;
            case 403:
              v6 = CFSTR("userPrivacySettingsUpdateType");
              v7 = objc_msgSend_length(CFSTR("userPrivacySettingsUpdateType"), v4, v5);
              break;
            case 404:
              v6 = CFSTR("userPrivacySettingsResetType");
              v7 = objc_msgSend_length(CFSTR("userPrivacySettingsResetType"), v4, v5);
              break;
            case 405:
              v6 = CFSTR("userPrivacySettingsBatchLookup");
              v7 = objc_msgSend_length(CFSTR("userPrivacySettingsBatchLookup"), v4, v5);
              break;
            case 406:
              v6 = CFSTR("sharePermissionSettingsUpdateType");
              v7 = objc_msgSend_length(CFSTR("sharePermissionSettingsUpdateType"), v4, v5);
              break;
            default:
              goto LABEL_29;
          }
          break;
      }
      goto LABEL_72;
    }
    if ((int)v3 <= 899)
    {
      switch((int)v3)
      {
        case 800:
          v6 = CFSTR("pushRegisterType");
          v7 = objc_msgSend_length(CFSTR("pushRegisterType"), v4, v5);
          break;
        case 801:
          v6 = CFSTR("pushUnregisterType");
          v7 = objc_msgSend_length(CFSTR("pushUnregisterType"), v4, v5);
          break;
        case 802:
          v6 = CFSTR("pushBadgeType");
          v7 = objc_msgSend_length(CFSTR("pushBadgeType"), v4, v5);
          break;
        case 803:
          v6 = CFSTR("pushSyncType");
          v7 = objc_msgSend_length(CFSTR("pushSyncType"), v4, v5);
          break;
        case 804:
          v6 = CFSTR("pushReadType");
          v7 = objc_msgSend_length(CFSTR("pushReadType"), v4, v5);
          break;
        default:
          if ((_DWORD)v3 == 503)
          {
            v6 = CFSTR("shareAcceptType");
            v7 = objc_msgSend_length(CFSTR("shareAcceptType"), v4, v5);
          }
          else
          {
            if ((_DWORD)v3 != 513)
              goto LABEL_29;
            v6 = CFSTR("shareVettingInitiateType");
            v7 = objc_msgSend_length(CFSTR("shareVettingInitiateType"), v4, v5);
          }
          break;
      }
      goto LABEL_72;
    }
    switch((_DWORD)v3)
    {
      case 0x384:
        v6 = CFSTR("archiveRecordsType");
        v7 = objc_msgSend_length(CFSTR("archiveRecordsType"), v4, v5);
        goto LABEL_72;
      case 0x385:
        v6 = CFSTR("datarepairMarkAssetBrokenType");
        v7 = objc_msgSend_length(CFSTR("datarepairMarkAssetBrokenType"), v4, v5);
        goto LABEL_72;
      case 0x44D:
        v6 = CFSTR("functionInvokeType");
        v7 = objc_msgSend_length(CFSTR("functionInvokeType"), v4, v5);
        goto LABEL_72;
    }
LABEL_29:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), v3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend_length(v6, v9, v10);
    goto LABEL_72;
  }
  if ((int)v3 > 249)
  {
    if ((int)v3 > 269)
    {
      if ((_DWORD)v3 == 270)
      {
        v6 = CFSTR("addAnonymousShareType");
        v7 = objc_msgSend_length(CFSTR("addAnonymousShareType"), v4, v5);
        goto LABEL_72;
      }
      if ((_DWORD)v3 == 271)
      {
        v6 = CFSTR("removeAnonymousShareType");
        v7 = objc_msgSend_length(CFSTR("removeAnonymousShareType"), v4, v5);
        goto LABEL_72;
      }
    }
    else
    {
      if ((_DWORD)v3 == 250)
      {
        v6 = CFSTR("webAuthTokenRetrieveType");
        v7 = objc_msgSend_length(CFSTR("webAuthTokenRetrieveType"), v4, v5);
        goto LABEL_72;
      }
      if ((_DWORD)v3 == 260)
      {
        v6 = CFSTR("dataRepairUpdateMissingAssetStatusType");
        v7 = objc_msgSend_length(CFSTR("dataRepairUpdateMissingAssetStatusType"), v4, v5);
        goto LABEL_72;
      }
    }
    goto LABEL_29;
  }
  switch((int)v3)
  {
    case 200:
      v6 = CFSTR("zoneSaveType");
      v7 = objc_msgSend_length(CFSTR("zoneSaveType"), v4, v5);
      break;
    case 201:
      v6 = CFSTR("zoneRetrieveType");
      v7 = objc_msgSend_length(CFSTR("zoneRetrieveType"), v4, v5);
      break;
    case 202:
      v6 = CFSTR("zoneDeleteType");
      v7 = objc_msgSend_length(CFSTR("zoneDeleteType"), v4, v5);
      break;
    case 203:
      v6 = CFSTR("zoneRetrieveChangesType");
      v7 = objc_msgSend_length(CFSTR("zoneRetrieveChangesType"), v4, v5);
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
      goto LABEL_29;
    case 210:
      v6 = CFSTR("recordSaveType");
      v7 = objc_msgSend_length(CFSTR("recordSaveType"), v4, v5);
      break;
    case 211:
      v6 = CFSTR("recordRetrieveType");
      v7 = objc_msgSend_length(CFSTR("recordRetrieveType"), v4, v5);
      break;
    case 212:
      v6 = CFSTR("recordRetrieveVersionsType");
      v7 = objc_msgSend_length(CFSTR("recordRetrieveVersionsType"), v4, v5);
      break;
    case 213:
      v6 = CFSTR("recordRetrieveChangesType");
      v7 = objc_msgSend_length(CFSTR("recordRetrieveChangesType"), v4, v5);
      break;
    case 214:
      v6 = CFSTR("recordDeleteType");
      v7 = objc_msgSend_length(CFSTR("recordDeleteType"), v4, v5);
      break;
    case 216:
      v6 = CFSTR("recordResolveTokenType");
      v7 = objc_msgSend_length(CFSTR("recordResolveTokenType"), v4, v5);
      break;
    case 217:
      v6 = CFSTR("fetchArchivedRecordsType");
      v7 = objc_msgSend_length(CFSTR("fetchArchivedRecordsType"), v4, v5);
      break;
    case 218:
      v6 = CFSTR("recordMoveType");
      v7 = objc_msgSend_length(CFSTR("recordMoveType"), v4, v5);
      break;
    case 219:
      v6 = CFSTR("shareAccessType");
      v7 = objc_msgSend_length(CFSTR("shareAccessType"), v4, v5);
      break;
    case 220:
      v6 = CFSTR("queryRetrieveType");
      v7 = objc_msgSend_length(CFSTR("queryRetrieveType"), v4, v5);
      break;
    case 221:
      v6 = CFSTR("shareDeclineType");
      v7 = objc_msgSend_length(CFSTR("shareDeclineType"), v4, v5);
      break;
    case 230:
      v6 = CFSTR("assetUploadTokenRetrieveType");
      v7 = objc_msgSend_length(CFSTR("assetUploadTokenRetrieveType"), v4, v5);
      break;
    case 240:
      v6 = CFSTR("containerDeleteType");
      v7 = objc_msgSend_length(CFSTR("containerDeleteType"), v4, v5);
      break;
    case 243:
      v6 = CFSTR("userAvailableQuotaType");
      v7 = objc_msgSend_length(CFSTR("userAvailableQuotaType"), v4, v5);
      break;
    case 244:
      v6 = CFSTR("containerGetBundlesType");
      v7 = objc_msgSend_length(CFSTR("containerGetBundlesType"), v4, v5);
      break;
    default:
      if ((_DWORD)v3)
        goto LABEL_29;
      v6 = CFSTR("noneType");
      v7 = objc_msgSend_length(CFSTR("noneType"), v4, v5);
      break;
  }
LABEL_72:
  objc_msgSend_substringToIndex_(v6, v8, v7 - 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
