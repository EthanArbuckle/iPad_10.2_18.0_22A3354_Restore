@implementation MTRICDManagementClusterRegisterClientParams

- (MTRICDManagementClusterRegisterClientParams)init
{
  MTRICDManagementClusterRegisterClientParams *v2;
  MTRICDManagementClusterRegisterClientParams *v3;
  NSNumber *checkInNodeID;
  NSNumber *monitoredSubject;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSData *key;
  NSData *verificationKey;
  NSNumber *clientType;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTRICDManagementClusterRegisterClientParams;
  v2 = -[MTRICDManagementClusterRegisterClientParams init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    checkInNodeID = v2->_checkInNodeID;
    v2->_checkInNodeID = (NSNumber *)&unk_250591A40;

    monitoredSubject = v3->_monitoredSubject;
    v3->_monitoredSubject = (NSNumber *)&unk_250591A40;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    key = v3->_key;
    v3->_key = (NSData *)v8;

    verificationKey = v3->_verificationKey;
    v3->_verificationKey = 0;

    clientType = v3->_clientType;
    v3->_clientType = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRICDManagementClusterRegisterClientParams *v4;
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

  v4 = objc_alloc_init(MTRICDManagementClusterRegisterClientParams);
  objc_msgSend_checkInNodeID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCheckInNodeID_(v4, v8, (uint64_t)v7);

  objc_msgSend_monitoredSubject(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMonitoredSubject_(v4, v12, (uint64_t)v11);

  objc_msgSend_key(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKey_(v4, v16, (uint64_t)v15);

  objc_msgSend_verificationKey(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVerificationKey_(v4, v20, (uint64_t)v19);

  objc_msgSend_clientType(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientType_(v4, v24, (uint64_t)v23);

  objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  objc_msgSend_serverSideProcessingTimeout(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *checkInNodeID;
  NSNumber *monitoredSubject;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  checkInNodeID = self->_checkInNodeID;
  monitoredSubject = self->_monitoredSubject;
  objc_msgSend_base64EncodedStringWithOptions_(self->_key, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_verificationKey, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v12, (uint64_t)CFSTR("<%@: checkInNodeID:%@; monitoredSubject:%@; key:%@; verificationKey:%@; clientType:%@; >"),
    v5,
    checkInNodeID,
    monitoredSubject,
    v9,
    v11,
    self->_clientType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSNumber)checkInNodeID
{
  return self->_checkInNodeID;
}

- (void)setCheckInNodeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)monitoredSubject
{
  return self->_monitoredSubject;
}

- (void)setMonitoredSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)verificationKey
{
  return self->_verificationKey;
}

- (void)setVerificationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)clientType
{
  return self->_clientType;
}

- (void)setClientType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_clientType, 0);
  objc_storeStrong((id *)&self->_verificationKey, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_monitoredSubject, 0);
  objc_storeStrong((id *)&self->_checkInNodeID, 0);
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
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  char v40[64];
  void *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD v47[2];
  __int128 v48;
  __int128 v49;
  char v50;
  __int128 v51;
  char v52;
  _BYTE v53[24];

  v52 = 0;
  v48 = 0u;
  v49 = 0u;
  v50 = 0;
  v47[0] = 0;
  v47[1] = 0;
  v46 = v47;
  objc_msgSend_checkInNodeID(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v48 = objc_msgSend_unsignedLongLongValue(v7, v8, v9);

  objc_msgSend_monitoredSubject(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v48 + 1) = objc_msgSend_unsignedLongLongValue(v12, v13, v14);

  objc_msgSend_key(self, v15, v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = objc_msgSend_bytes(v17, v18, v19);
  v23 = objc_msgSend_length(v17, v21, v22);
  sub_233BF7114(v40, v20, v23);

  v49 = *(_OWORD *)v40;
  objc_msgSend_verificationKey(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v50 = 1;
    v51 = 0uLL;
    objc_msgSend_verificationKey(self, v27, v28);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = objc_msgSend_bytes(v29, v30, v31);
    v35 = objc_msgSend_length(v29, v33, v34);
    sub_233BF7114(v40, v32, v35);

    v51 = *(_OWORD *)v40;
  }
  objc_msgSend_clientType(self, v27, v28);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_unsignedCharValue(v36, v37, v38);

  sub_234118674(0x62FuLL, 0, &v45);
  if (v45)
  {
    sub_234106C48((uint64_t)v40);
    v42 = 0;
    v43 = 0;
    v41 = &unk_250504030;
    v44 = 0;
    sub_233CAF098((uint64_t)&v41, &v45, 0);
    sub_234106CA8((uint64_t)v40, (uint64_t)&v41, 0xFFFFFFFF, (uint64_t)v53);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D11B30((uint64_t)&v48, v40, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v40, &v45, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v45);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v41 = &unk_250504030;
    sub_233CAF128(&v43);
    sub_233CAF128(&v42);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 9585;
  }
  sub_233CAF128(&v45);
  return (ChipError *)sub_233CAF15C((uint64_t)&v46);
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
    v11 = 9614;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
