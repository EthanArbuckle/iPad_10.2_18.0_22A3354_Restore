@implementation MTRDoorLockClusterSetUserParams

- (MTRDoorLockClusterSetUserParams)init
{
  MTRDoorLockClusterSetUserParams *v2;
  MTRDoorLockClusterSetUserParams *v3;
  NSNumber *operationType;
  NSNumber *userIndex;
  NSString *userName;
  NSNumber *userUniqueID;
  NSNumber *userStatus;
  NSNumber *userType;
  NSNumber *credentialRule;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTRDoorLockClusterSetUserParams;
  v2 = -[MTRDoorLockClusterSetUserParams init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    operationType = v2->_operationType;
    v2->_operationType = (NSNumber *)&unk_250591A40;

    userIndex = v3->_userIndex;
    v3->_userIndex = (NSNumber *)&unk_250591A40;

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

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterSetUserParams *v4;
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

  v4 = objc_alloc_init(MTRDoorLockClusterSetUserParams);
  objc_msgSend_operationType(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationType_(v4, v8, (uint64_t)v7);

  objc_msgSend_userIndex(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIndex_(v4, v12, (uint64_t)v11);

  objc_msgSend_userName(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserName_(v4, v16, (uint64_t)v15);

  objc_msgSend_userUniqueID(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserUniqueID_(v4, v20, (uint64_t)v19);

  objc_msgSend_userStatus(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserStatus_(v4, v24, (uint64_t)v23);

  objc_msgSend_userType(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserType_(v4, v28, (uint64_t)v27);

  objc_msgSend_credentialRule(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCredentialRule_(v4, v32, (uint64_t)v31);

  objc_msgSend_timedInvokeTimeoutMs(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v36, (uint64_t)v35);

  objc_msgSend_serverSideProcessingTimeout(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v40, (uint64_t)v39);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: operationType:%@; userIndex:%@; userName:%@; userUniqueID:%@; userStatus:%@; userType:%@; credentialRule:%@; >"),
    v5,
    self->_operationType,
    self->_userIndex,
    self->_userName,
    self->_userUniqueID,
    self->_userStatus,
    self->_userType,
    self->_credentialRule);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(NSNumber *)operationType
{
  objc_setProperty_nonatomic_copy(self, a2, operationType, 8);
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(NSNumber *)userIndex
{
  objc_setProperty_nonatomic_copy(self, a2, userIndex, 16);
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(NSString *)userName
{
  objc_setProperty_nonatomic_copy(self, a2, userName, 24);
}

- (NSNumber)userUniqueID
{
  return self->_userUniqueID;
}

- (void)setUserUniqueID:(NSNumber *)userUniqueID
{
  objc_setProperty_nonatomic_copy(self, a2, userUniqueID, 32);
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

- (NSNumber)credentialRule
{
  return self->_credentialRule;
}

- (void)setCredentialRule:(NSNumber *)credentialRule
{
  objc_setProperty_nonatomic_copy(self, a2, credentialRule, 56);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 64);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_credentialRule, 0);
  objc_storeStrong((id *)&self->_userType, 0);
  objc_storeStrong((id *)&self->_userStatus, 0);
  objc_storeStrong((id *)&self->_userUniqueID, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
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
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
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
  char v51[64];
  void *v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD v58[2];
  _BYTE v59[2];
  __int16 v60;
  __int128 v61;
  char v62;
  int v63;
  char v64;
  int v65;
  __int16 v66;
  _BYTE v67[24];

  v59[0] = 0;
  v60 = 0;
  LOBYTE(v61) = 0;
  v62 = 0;
  LOBYTE(v63) = 0;
  v64 = 0;
  v65 = 0;
  v66 = 0;
  v58[0] = 0;
  v58[1] = 0;
  v57 = v58;
  objc_msgSend_operationType(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = objc_msgSend_unsignedCharValue(v7, v8, v9);

  objc_msgSend_userIndex(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_unsignedShortValue(v12, v13, v14);

  objc_msgSend_userName(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v61 = 0uLL;
    v62 = 1;
    objc_msgSend_userName(self, v18, v19);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend_UTF8String(v20, v21, v22);
    v25 = objc_msgSend_lengthOfBytesUsingEncoding_(v20, v24, 4);
    sub_233CAF22C(v51, v23, v25);

    v61 = *(_OWORD *)v51;
  }
  objc_msgSend_userUniqueID(self, v18, v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v63 = 0;
    v64 = 1;
    objc_msgSend_userUniqueID(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend_unsignedIntValue(v29, v30, v31);

  }
  objc_msgSend_userStatus(self, v27, v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    LOWORD(v65) = 256;
    objc_msgSend_userStatus(self, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v65) = objc_msgSend_unsignedCharValue(v35, v36, v37);

  }
  objc_msgSend_userType(self, v33, v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    HIWORD(v65) = 256;
    objc_msgSend_userType(self, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v65) = objc_msgSend_unsignedCharValue(v41, v42, v43);

  }
  objc_msgSend_credentialRule(self, v39, v40);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v66 = 256;
    objc_msgSend_credentialRule(self, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v66) = objc_msgSend_unsignedCharValue(v47, v48, v49);

  }
  sub_234118674(0x62FuLL, 0, &v56);
  if (v56)
  {
    sub_234106C48((uint64_t)v51);
    v53 = 0;
    v54 = 0;
    v52 = &unk_250504030;
    v55 = 0;
    sub_233CAF098((uint64_t)&v52, &v56, 0);
    sub_234106CA8((uint64_t)v51, (uint64_t)&v52, 0xFFFFFFFF, (uint64_t)v67);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D25DBC((uint64_t)v59, v51, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v51, &v56, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v56);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v52 = &unk_250504030;
    sub_233CAF128(&v54);
    sub_233CAF128(&v53);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 19473;
  }
  sub_233CAF128(&v56);
  return (ChipError *)sub_233CAF15C((uint64_t)&v57);
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
    v11 = 19502;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
