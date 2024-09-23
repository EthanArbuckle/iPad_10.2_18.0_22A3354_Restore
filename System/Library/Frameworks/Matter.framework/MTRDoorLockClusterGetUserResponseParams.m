@implementation MTRDoorLockClusterGetUserResponseParams

- (MTRDoorLockClusterGetUserResponseParams)init
{
  MTRDoorLockClusterGetUserResponseParams *v2;
  MTRDoorLockClusterGetUserResponseParams *v3;
  NSNumber *userIndex;
  NSString *userName;
  NSNumber *userUniqueID;
  NSNumber *userStatus;
  NSNumber *userType;
  NSNumber *credentialRule;
  NSArray *credentials;
  NSNumber *creatorFabricIndex;
  NSNumber *lastModifiedFabricIndex;
  NSNumber *nextUserIndex;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MTRDoorLockClusterGetUserResponseParams;
  v2 = -[MTRDoorLockClusterGetUserResponseParams init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    userIndex = v2->_userIndex;
    v2->_userIndex = (NSNumber *)&unk_250591A40;

    userName = v3->_userName;
    v3->_userName = 0;

    userUniqueID = v3->_userUniqueID;
    v3->_userUniqueID = 0;

    userStatus = v3->_userStatus;
    v3->_userStatus = 0;

    userType = v3->_userType;
    v3->_userType = 0;

    credentialRule = v3->_credentialRule;
    v3->_credentialRule = 0;

    credentials = v3->_credentials;
    v3->_credentials = 0;

    creatorFabricIndex = v3->_creatorFabricIndex;
    v3->_creatorFabricIndex = 0;

    lastModifiedFabricIndex = v3->_lastModifiedFabricIndex;
    v3->_lastModifiedFabricIndex = 0;

    nextUserIndex = v3->_nextUserIndex;
    v3->_nextUserIndex = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterGetUserResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;

  v4 = objc_alloc_init(MTRDoorLockClusterGetUserResponseParams);
  objc_msgSend_userIndex(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIndex_(v4, v8, (uint64_t)v7);

  objc_msgSend_userName(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserName_(v4, v12, (uint64_t)v11);

  objc_msgSend_userUniqueID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserUniqueID_(v4, v16, (uint64_t)v15);

  objc_msgSend_userStatus(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserStatus_(v4, v20, (uint64_t)v19);

  objc_msgSend_userType(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserType_(v4, v24, (uint64_t)v23);

  objc_msgSend_credentialRule(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCredentialRule_(v4, v28, (uint64_t)v27);

  objc_msgSend_credentials(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCredentials_(v4, v32, (uint64_t)v31);

  objc_msgSend_creatorFabricIndex(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCreatorFabricIndex_(v4, v36, (uint64_t)v35);

  objc_msgSend_lastModifiedFabricIndex(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLastModifiedFabricIndex_(v4, v40, (uint64_t)v39);

  objc_msgSend_nextUserIndex(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNextUserIndex_(v4, v44, (uint64_t)v43);

  objc_msgSend_timedInvokeTimeoutMs(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v48, (uint64_t)v47);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: userIndex:%@; userName:%@; userUniqueID:%@; userStatus:%@; userType:%@; credentialRule:%@; credentials:%@; creatorFabricIndex:%@; lastModifiedFabricIndex:%@; nextUserIndex:%@; >"),
    v5,
    self->_userIndex,
    self->_userName,
    self->_userUniqueID,
    self->_userStatus,
    self->_userType,
    self->_credentialRule,
    self->_credentials,
    self->_creatorFabricIndex,
    self->_lastModifiedFabricIndex,
    self->_nextUserIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRDoorLockClusterGetUserResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRDoorLockClusterGetUserResponseParams *v8;
  const char *v9;
  void *v10;
  char *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  MTRDoorLockClusterGetUserResponseParams *v30;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  _BYTE v36[72];
  uint64_t v37;
  objc_super v38;
  uint64_t v39;
  void *v40;
  __int128 buf;
  uint64_t v42;
  char v43;
  char v44;
  char v45;
  int v46;
  __int16 v47;
  char v48;
  char v49;
  int v50;
  char v51;
  char v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRDoorLockClusterGetUserResponseParams;
  v8 = -[MTRDoorLockClusterGetUserResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 257, 28, error);
  if (v37)
  {
    sub_234104468((uint64_t)v36);
    sub_234104498((uint64_t)v36, *(_QWORD *)(v37 + 8), *(_QWORD *)(v37 + 24));
    v34 = 0uLL;
    v35 = 0;
    sub_234105EE4((uint64_t)v36, 256, &v34);
    if (!(_DWORD)v34)
    {
      LOWORD(buf) = 0;
      BYTE8(buf) = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v48 = 0;
      v49 = 0;
      v52 = 0;
      v46 = 0;
      v47 = 0;
      v50 = 0;
      v51 = 0;
      sub_233D26548((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      v34 = v32;
      v35 = v33;
      if (!(_DWORD)v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        v34 = v32;
        v35 = v33;
        if (!(_DWORD)v32)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    buf = v34;
    v42 = v35;
    v11 = sub_2341083CC((const char **)&buf, 1);
    objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("Command payload decoding failed: %s"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_retainAutorelease(v13);
      v18 = objc_msgSend_UTF8String(v15, v16, v17);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v21 = objc_retainAutorelease(v13);
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_2341147D0(0, 1);
    }
    if (error)
    {
      v39 = *MEMORY[0x24BDD0FD8];
      objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v19, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_2505249E8, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)&v40, &v39, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v29, (uint64_t)CFSTR("MTRErrorDomain"), 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
  }
  v30 = 0;
LABEL_14:
  sub_233CAF128(&v37);
LABEL_16:

  return v30;
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(NSNumber *)userIndex
{
  objc_setProperty_nonatomic_copy(self, a2, userIndex, 8);
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(NSString *)userName
{
  objc_setProperty_nonatomic_copy(self, a2, userName, 16);
}

- (NSNumber)userUniqueID
{
  return self->_userUniqueID;
}

- (void)setUserUniqueID:(NSNumber *)userUniqueID
{
  objc_setProperty_nonatomic_copy(self, a2, userUniqueID, 24);
}

- (NSNumber)userStatus
{
  return self->_userStatus;
}

- (void)setUserStatus:(NSNumber *)userStatus
{
  objc_setProperty_nonatomic_copy(self, a2, userStatus, 32);
}

- (NSNumber)userType
{
  return self->_userType;
}

- (void)setUserType:(NSNumber *)userType
{
  objc_setProperty_nonatomic_copy(self, a2, userType, 40);
}

- (NSNumber)credentialRule
{
  return self->_credentialRule;
}

- (void)setCredentialRule:(NSNumber *)credentialRule
{
  objc_setProperty_nonatomic_copy(self, a2, credentialRule, 48);
}

- (NSArray)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(NSArray *)credentials
{
  objc_setProperty_nonatomic_copy(self, a2, credentials, 56);
}

- (NSNumber)creatorFabricIndex
{
  return self->_creatorFabricIndex;
}

- (void)setCreatorFabricIndex:(NSNumber *)creatorFabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, creatorFabricIndex, 64);
}

- (NSNumber)lastModifiedFabricIndex
{
  return self->_lastModifiedFabricIndex;
}

- (void)setLastModifiedFabricIndex:(NSNumber *)lastModifiedFabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, lastModifiedFabricIndex, 72);
}

- (NSNumber)nextUserIndex
{
  return self->_nextUserIndex;
}

- (void)setNextUserIndex:(NSNumber *)nextUserIndex
{
  objc_setProperty_nonatomic_copy(self, a2, nextUserIndex, 80);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_nextUserIndex, 0);
  objc_storeStrong((id *)&self->_lastModifiedFabricIndex, 0);
  objc_storeStrong((id *)&self->_creatorFabricIndex, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_credentialRule, 0);
  objc_storeStrong((id *)&self->_userType, 0);
  objc_storeStrong((id *)&self->_userStatus, 0);
  objc_storeStrong((id *)&self->_userUniqueID, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  ChipError *result;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  void *v44;
  const char *v45;
  const char *v46;
  void *v47;
  const char *v48;
  const char *v49;
  void *v50;
  const char *v51;
  int v52;
  __int128 v53;
  uint64_t v54;
  unsigned __int8 v55[2];

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], a3, *(unsigned __int16 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIndex_(self, v8, (uint64_t)v7);

  if (*((_BYTE *)a4 + 24))
  {
    v10 = *((_QWORD *)a4 + 1);
    v11 = *((_QWORD *)a4 + 2);
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    v14 = (void *)objc_msgSend_initWithBytes_length_encoding_(v12, v13, v10, v11, 4);
    objc_msgSend_setUserName_(self, v15, (uint64_t)v14);

    objc_msgSend_userName(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      *(_OWORD *)&retstr->mError = xmmword_2504EEDA8;
      *(_QWORD *)&retstr->mLine = 19709;
      return result;
    }
  }
  else
  {
    objc_msgSend_setUserName_(self, v9, 0);
  }
  if (*((_BYTE *)a4 + 36))
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v20, *((unsigned int *)a4 + 8));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserUniqueID_(self, v22, (uint64_t)v21);

  }
  else
  {
    objc_msgSend_setUserUniqueID_(self, v20, 0);
  }
  if (*((_BYTE *)a4 + 41))
  {
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v23, *((unsigned __int8 *)a4 + 40));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserStatus_(self, v25, (uint64_t)v24);

  }
  else
  {
    objc_msgSend_setUserStatus_(self, v23, 0);
  }
  if (*((_BYTE *)a4 + 43))
  {
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v26, *((unsigned __int8 *)a4 + 42));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserType_(self, v28, (uint64_t)v27);

  }
  else
  {
    objc_msgSend_setUserType_(self, v26, 0);
  }
  if (*((_BYTE *)a4 + 45))
  {
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v29, *((unsigned __int8 *)a4 + 44));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCredentialRule_(self, v31, (uint64_t)v30);

  }
  else
  {
    objc_msgSend_setCredentialRule_(self, v29, 0);
  }
  if (*((_BYTE *)a4 + 128))
  {
    v33 = (void *)objc_opt_new();
    if (!*((_BYTE *)a4 + 128))
      sub_233CAF304();
    v55[0] = *((_BYTE *)a4 + 120);
    if (v55[0])
      v55[1] = *((_BYTE *)a4 + 121);
    sub_233CB0B2C((uint64_t)&v52, (uint64_t)a4 + 48, v55);
    while (sub_233CB0BA0(&v52))
    {
      v35 = (void *)objc_opt_new();
      objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v36, v52);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCredentialType_(v35, v38, (uint64_t)v37);

      objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v39, HIWORD(v52));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCredentialIndex_(v35, v41, (uint64_t)v40);

      objc_msgSend_addObject_(v33, v42, (uint64_t)v35);
    }
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    if ((_DWORD)v53 == 33)
    {
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      retstr->mLine = 147;
    }
    else
    {
      *(_OWORD *)&retstr->mError = v53;
      *(_QWORD *)&retstr->mLine = v54;
      if (retstr->mError)
      {

        return result;
      }
    }
    objc_msgSend_setCredentials_(self, v34, (uint64_t)v33);

  }
  else
  {
    objc_msgSend_setCredentials_(self, v32, 0);
  }
  if (*((_BYTE *)a4 + 137))
  {
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v43, *((unsigned __int8 *)a4 + 136));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreatorFabricIndex_(self, v45, (uint64_t)v44);

  }
  else
  {
    objc_msgSend_setCreatorFabricIndex_(self, v43, 0);
  }
  if (*((_BYTE *)a4 + 139))
  {
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v46, *((unsigned __int8 *)a4 + 138));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastModifiedFabricIndex_(self, v48, (uint64_t)v47);

  }
  else
  {
    objc_msgSend_setLastModifiedFabricIndex_(self, v46, 0);
  }
  if (*((_BYTE *)a4 + 142))
  {
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v49, *((unsigned __int16 *)a4 + 70));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNextUserIndex_(self, v51, (uint64_t)v50);

  }
  else
  {
    result = (ChipError *)objc_msgSend_setNextUserIndex_(self, v49, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 19786;
  return result;
}

@end
