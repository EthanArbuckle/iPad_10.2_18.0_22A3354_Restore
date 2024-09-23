@implementation MTRDoorLockClusterGetCredentialStatusParams

- (MTRDoorLockClusterGetCredentialStatusParams)init
{
  MTRDoorLockClusterGetCredentialStatusParams *v2;
  uint64_t v3;
  MTRDoorLockClusterCredentialStruct *credential;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRDoorLockClusterGetCredentialStatusParams;
  v2 = -[MTRDoorLockClusterGetCredentialStatusParams init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    credential = v2->_credential;
    v2->_credential = (MTRDoorLockClusterCredentialStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterGetCredentialStatusParams *v4;
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

  v4 = objc_alloc_init(MTRDoorLockClusterGetCredentialStatusParams);
  objc_msgSend_credential(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCredential_(v4, v8, (uint64_t)v7);

  objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  objc_msgSend_serverSideProcessingTimeout(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: credential:%@; >"), v5, self->_credential);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRDoorLockClusterCredentialStruct)credential
{
  return self->_credential;
}

- (void)setCredential:(MTRDoorLockClusterCredentialStruct *)credential
{
  objc_setProperty_nonatomic_copy(self, a2, credential, 8);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 16);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  char v22[64];
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD v29[2];
  _BYTE v30[2];
  __int16 v31;
  _BYTE v32[24];

  v30[0] = 0;
  v31 = 0;
  v29[0] = 0;
  v29[1] = 0;
  v28 = v29;
  objc_msgSend_credential(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_credentialType(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = objc_msgSend_unsignedCharValue(v10, v11, v12);

  objc_msgSend_credential(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_credentialIndex(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_unsignedShortValue(v18, v19, v20);

  sub_234118674(0x62FuLL, 0, &v27);
  if (v27)
  {
    sub_234106C48((uint64_t)v22);
    v24 = 0;
    v25 = 0;
    v23 = &unk_250504030;
    v26 = 0;
    sub_233CAF098((uint64_t)&v23, &v27, 0);
    sub_234106CA8((uint64_t)v22, (uint64_t)&v23, 0xFFFFFFFF, (uint64_t)v32);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D26DB4((uint64_t)v30, v22, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v22, &v27, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v27);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v23 = &unk_250504030;
    sub_233CAF128(&v25);
    sub_233CAF128(&v24);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 20152;
  }
  sub_233CAF128(&v27);
  return (ChipError *)sub_233CAF15C((uint64_t)&v28);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  int v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[72];
  uint64_t v15;

  v5 = sub_234104468((uint64_t)v14);
  v15 = 0;
  v12 = 0uLL;
  v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  sub_233CE3234((uint64_t)v14, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((_QWORD *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    v11 = 20181;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
