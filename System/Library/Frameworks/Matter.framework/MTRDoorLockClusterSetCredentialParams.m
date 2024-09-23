@implementation MTRDoorLockClusterSetCredentialParams

- (MTRDoorLockClusterSetCredentialParams)init
{
  MTRDoorLockClusterSetCredentialParams *v2;
  MTRDoorLockClusterSetCredentialParams *v3;
  NSNumber *operationType;
  uint64_t v5;
  MTRDoorLockClusterCredentialStruct *credential;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSData *credentialData;
  NSNumber *userIndex;
  NSNumber *userStatus;
  NSNumber *userType;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTRDoorLockClusterSetCredentialParams;
  v2 = -[MTRDoorLockClusterSetCredentialParams init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    operationType = v2->_operationType;
    v2->_operationType = (NSNumber *)&unk_250591A40;

    v5 = objc_opt_new();
    credential = v3->_credential;
    v3->_credential = (MTRDoorLockClusterCredentialStruct *)v5;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    credentialData = v3->_credentialData;
    v3->_credentialData = (NSData *)v9;

    userIndex = v3->_userIndex;
    v3->_userIndex = 0;

    userStatus = v3->_userStatus;
    v3->_userStatus = 0;

    userType = v3->_userType;
    v3->_userType = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterSetCredentialParams *v4;
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

  v4 = objc_alloc_init(MTRDoorLockClusterSetCredentialParams);
  objc_msgSend_operationType(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationType_(v4, v8, (uint64_t)v7);

  objc_msgSend_credential(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCredential_(v4, v12, (uint64_t)v11);

  objc_msgSend_credentialData(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCredentialData_(v4, v16, (uint64_t)v15);

  objc_msgSend_userIndex(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIndex_(v4, v20, (uint64_t)v19);

  objc_msgSend_userStatus(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserStatus_(v4, v24, (uint64_t)v23);

  objc_msgSend_userType(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserType_(v4, v28, (uint64_t)v27);

  objc_msgSend_timedInvokeTimeoutMs(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v32, (uint64_t)v31);

  objc_msgSend_serverSideProcessingTimeout(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *operationType;
  MTRDoorLockClusterCredentialStruct *credential;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  operationType = self->_operationType;
  credential = self->_credential;
  objc_msgSend_base64EncodedStringWithOptions_(self->_credentialData, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("<%@: operationType:%@; credential:%@; credentialData:%@; userIndex:%@; userStatus:%@; userType:%@; >"),
    v5,
    operationType,
    credential,
    v9,
    self->_userIndex,
    self->_userStatus,
    self->_userType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSNumber)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(NSNumber *)operationType
{
  objc_setProperty_nonatomic_copy(self, a2, operationType, 8);
}

- (MTRDoorLockClusterCredentialStruct)credential
{
  return self->_credential;
}

- (void)setCredential:(MTRDoorLockClusterCredentialStruct *)credential
{
  objc_setProperty_nonatomic_copy(self, a2, credential, 16);
}

- (NSData)credentialData
{
  return self->_credentialData;
}

- (void)setCredentialData:(NSData *)credentialData
{
  objc_setProperty_nonatomic_copy(self, a2, credentialData, 24);
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(NSNumber *)userIndex
{
  objc_setProperty_nonatomic_copy(self, a2, userIndex, 32);
}

- (NSNumber)userStatus
{
  return self->_userStatus;
}

- (void)setUserStatus:(NSNumber *)userStatus
{
  objc_setProperty_nonatomic_copy(self, a2, userStatus, 40);
}

- (NSNumber)userType
{
  return self->_userType;
}

- (void)setUserType:(NSNumber *)userType
{
  objc_setProperty_nonatomic_copy(self, a2, userType, 48);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 56);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_userType, 0);
  objc_storeStrong((id *)&self->_userStatus, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
  objc_storeStrong((id *)&self->_credentialData, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  char v56[64];
  void *v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD v63[2];
  _BYTE v64[2];
  char v65;
  __int16 v66;
  __int128 v67;
  __int16 v68;
  char v69;
  int v70;
  _BYTE v71[24];

  v64[0] = 0;
  v65 = 0;
  v66 = 0;
  v69 = 0;
  v67 = 0uLL;
  LOBYTE(v68) = 0;
  v70 = 0;
  v63[0] = 0;
  v63[1] = 0;
  v62 = v63;
  objc_msgSend_operationType(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = objc_msgSend_unsignedCharValue(v7, v8, v9);

  objc_msgSend_credential(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_credentialType(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend_unsignedCharValue(v15, v16, v17);

  objc_msgSend_credential(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_credentialIndex(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend_unsignedShortValue(v23, v24, v25);

  objc_msgSend_credentialData(self, v26, v27);
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = objc_msgSend_bytes(v28, v29, v30);
  v34 = objc_msgSend_length(v28, v32, v33);
  sub_233BF7114(v56, v31, v34);

  v67 = *(_OWORD *)v56;
  objc_msgSend_userIndex(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    v68 = 0;
    v69 = 1;
    objc_msgSend_userIndex(self, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend_unsignedShortValue(v40, v41, v42);

  }
  objc_msgSend_userStatus(self, v38, v39);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    LOWORD(v70) = 256;
    objc_msgSend_userStatus(self, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v70) = objc_msgSend_unsignedCharValue(v46, v47, v48);

  }
  objc_msgSend_userType(self, v44, v45);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    HIWORD(v70) = 256;
    objc_msgSend_userType(self, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v70) = objc_msgSend_unsignedCharValue(v52, v53, v54);

  }
  sub_234118674(0x62FuLL, 0, &v61);
  if (v61)
  {
    sub_234106C48((uint64_t)v56);
    v58 = 0;
    v59 = 0;
    v57 = &unk_250504030;
    v60 = 0;
    sub_233CAF098((uint64_t)&v57, &v61, 0);
    sub_234106CA8((uint64_t)v56, (uint64_t)&v57, 0xFFFFFFFF, (uint64_t)v71);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D26810((uint64_t)v64, v56, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v56, &v61, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v61);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v57 = &unk_250504030;
    sub_233CAF128(&v59);
    sub_233CAF128(&v58);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 19971;
  }
  sub_233CAF128(&v61);
  return (ChipError *)sub_233CAF15C((uint64_t)&v62);
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
    v11 = 20000;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
