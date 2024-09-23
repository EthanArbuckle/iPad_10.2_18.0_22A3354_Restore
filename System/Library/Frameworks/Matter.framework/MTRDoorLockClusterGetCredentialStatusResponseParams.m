@implementation MTRDoorLockClusterGetCredentialStatusResponseParams

- (MTRDoorLockClusterGetCredentialStatusResponseParams)init
{
  MTRDoorLockClusterGetCredentialStatusResponseParams *v2;
  MTRDoorLockClusterGetCredentialStatusResponseParams *v3;
  NSNumber *credentialExists;
  NSNumber *userIndex;
  NSNumber *creatorFabricIndex;
  NSNumber *lastModifiedFabricIndex;
  NSNumber *nextCredentialIndex;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRDoorLockClusterGetCredentialStatusResponseParams;
  v2 = -[MTRDoorLockClusterGetCredentialStatusResponseParams init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    credentialExists = v2->_credentialExists;
    v2->_credentialExists = (NSNumber *)&unk_250591A40;

    userIndex = v3->_userIndex;
    v3->_userIndex = 0;

    creatorFabricIndex = v3->_creatorFabricIndex;
    v3->_creatorFabricIndex = 0;

    lastModifiedFabricIndex = v3->_lastModifiedFabricIndex;
    v3->_lastModifiedFabricIndex = 0;

    nextCredentialIndex = v3->_nextCredentialIndex;
    v3->_nextCredentialIndex = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterGetCredentialStatusResponseParams *v4;
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

  v4 = objc_alloc_init(MTRDoorLockClusterGetCredentialStatusResponseParams);
  objc_msgSend_credentialExists(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCredentialExists_(v4, v8, (uint64_t)v7);

  objc_msgSend_userIndex(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIndex_(v4, v12, (uint64_t)v11);

  objc_msgSend_creatorFabricIndex(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCreatorFabricIndex_(v4, v16, (uint64_t)v15);

  objc_msgSend_lastModifiedFabricIndex(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLastModifiedFabricIndex_(v4, v20, (uint64_t)v19);

  objc_msgSend_nextCredentialIndex(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNextCredentialIndex_(v4, v24, (uint64_t)v23);

  objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: credentialExists:%@; userIndex:%@; creatorFabricIndex:%@; lastModifiedFabricIndex:%@; nextCredentialIndex:%@; >"),
    v5,
    self->_credentialExists,
    self->_userIndex,
    self->_creatorFabricIndex,
    self->_lastModifiedFabricIndex,
    self->_nextCredentialIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRDoorLockClusterGetCredentialStatusResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRDoorLockClusterGetCredentialStatusResponseParams *v8;
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
  MTRDoorLockClusterGetCredentialStatusResponseParams *v30;
  char v32[6];
  int v33;
  char v34;
  char v35;
  __int128 v36;
  uint64_t v37;
  _BYTE v38[72];
  uint64_t v39;
  objc_super v40;
  uint64_t v41;
  void *v42;
  __int128 buf;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v40.receiver = self;
  v40.super_class = (Class)MTRDoorLockClusterGetCredentialStatusResponseParams;
  v8 = -[MTRDoorLockClusterGetCredentialStatusResponseParams init](&v40, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 257, 37, error);
  if (v39)
  {
    sub_234104468((uint64_t)v38);
    sub_234104498((uint64_t)v38, *(_QWORD *)(v39 + 8), *(_QWORD *)(v39 + 24));
    v36 = 0uLL;
    v37 = 0;
    sub_234105EE4((uint64_t)v38, 256, &v36);
    if (!(_DWORD)v36)
    {
      v32[0] = 0;
      v32[2] = 0;
      v32[4] = 0;
      v35 = 0;
      v33 = 0;
      v34 = 0;
      sub_233D270F8(v32, (uint64_t)v38, (uint64_t)&buf);
      v36 = buf;
      v37 = v44;
      if (!(_DWORD)buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)v32);
        v36 = buf;
        v37 = v44;
        if (!(_DWORD)buf)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    buf = v36;
    v44 = v37;
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
      v41 = *MEMORY[0x24BDD0FD8];
      objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v19, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_2505249E8, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)&v42, &v41, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v29, (uint64_t)CFSTR("MTRErrorDomain"), 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
  }
  v30 = 0;
LABEL_14:
  sub_233CAF128(&v39);
LABEL_16:

  return v30;
}

- (NSNumber)credentialExists
{
  return self->_credentialExists;
}

- (void)setCredentialExists:(NSNumber *)credentialExists
{
  objc_setProperty_nonatomic_copy(self, a2, credentialExists, 8);
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(NSNumber *)userIndex
{
  objc_setProperty_nonatomic_copy(self, a2, userIndex, 16);
}

- (NSNumber)creatorFabricIndex
{
  return self->_creatorFabricIndex;
}

- (void)setCreatorFabricIndex:(NSNumber *)creatorFabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, creatorFabricIndex, 24);
}

- (NSNumber)lastModifiedFabricIndex
{
  return self->_lastModifiedFabricIndex;
}

- (void)setLastModifiedFabricIndex:(NSNumber *)lastModifiedFabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, lastModifiedFabricIndex, 32);
}

- (NSNumber)nextCredentialIndex
{
  return self->_nextCredentialIndex;
}

- (void)setNextCredentialIndex:(NSNumber *)nextCredentialIndex
{
  objc_setProperty_nonatomic_copy(self, a2, nextCredentialIndex, 40);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_nextCredentialIndex, 0);
  objc_storeStrong((id *)&self->_lastModifiedFabricIndex, 0);
  objc_storeStrong((id *)&self->_creatorFabricIndex, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
  objc_storeStrong((id *)&self->_credentialExists, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  ChipError *result;

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCredentialExists_(self, v8, (uint64_t)v7);

  if (*((_BYTE *)a4 + 4))
  {
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v9, *((unsigned __int16 *)a4 + 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserIndex_(self, v11, (uint64_t)v10);

  }
  else
  {
    objc_msgSend_setUserIndex_(self, v9, 0);
  }
  if (*((_BYTE *)a4 + 7))
  {
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v12, *((unsigned __int8 *)a4 + 6));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreatorFabricIndex_(self, v14, (uint64_t)v13);

  }
  else
  {
    objc_msgSend_setCreatorFabricIndex_(self, v12, 0);
  }
  if (*((_BYTE *)a4 + 9))
  {
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v15, *((unsigned __int8 *)a4 + 8));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastModifiedFabricIndex_(self, v17, (uint64_t)v16);

  }
  else
  {
    objc_msgSend_setLastModifiedFabricIndex_(self, v15, 0);
  }
  if (*((_BYTE *)a4 + 12))
  {
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v18, *((unsigned __int16 *)a4 + 5));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNextCredentialIndex_(self, v20, (uint64_t)v19);

  }
  else
  {
    result = (ChipError *)objc_msgSend_setNextCredentialIndex_(self, v18, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 20304;
  return result;
}

@end
