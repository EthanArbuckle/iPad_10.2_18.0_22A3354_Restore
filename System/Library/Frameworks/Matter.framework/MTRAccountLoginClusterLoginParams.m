@implementation MTRAccountLoginClusterLoginParams

- (MTRAccountLoginClusterLoginParams)init
{
  MTRAccountLoginClusterLoginParams *v2;
  MTRAccountLoginClusterLoginParams *v3;
  NSString *tempAccountIdentifier;
  NSString *setupPIN;
  NSNumber *node;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRAccountLoginClusterLoginParams;
  v2 = -[MTRAccountLoginClusterLoginParams init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    tempAccountIdentifier = v2->_tempAccountIdentifier;
    v2->_tempAccountIdentifier = (NSString *)&stru_2505249E8;

    setupPIN = v3->_setupPIN;
    v3->_setupPIN = (NSString *)&stru_2505249E8;

    node = v3->_node;
    v3->_node = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRAccountLoginClusterLoginParams *v4;
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

  v4 = objc_alloc_init(MTRAccountLoginClusterLoginParams);
  objc_msgSend_tempAccountIdentifier(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTempAccountIdentifier_(v4, v8, (uint64_t)v7);

  objc_msgSend_setupPIN(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSetupPIN_(v4, v12, (uint64_t)v11);

  objc_msgSend_node(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNode_(v4, v16, (uint64_t)v15);

  objc_msgSend_timedInvokeTimeoutMs(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v20, (uint64_t)v19);

  objc_msgSend_serverSideProcessingTimeout(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: tempAccountIdentifier:%@; setupPIN:%@; node:%@; >"),
    v5,
    self->_tempAccountIdentifier,
    self->_setupPIN,
    self->_node);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)tempAccountIdentifier
{
  return self->_tempAccountIdentifier;
}

- (void)setTempAccountIdentifier:(NSString *)tempAccountIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, tempAccountIdentifier, 8);
}

- (NSString)setupPIN
{
  return self->_setupPIN;
}

- (void)setSetupPIN:(NSString *)setupPIN
{
  objc_setProperty_nonatomic_copy(self, a2, setupPIN, 16);
}

- (NSNumber)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 32);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_setupPIN, 0);
  objc_storeStrong((id *)&self->_tempAccountIdentifier, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  char v30[64];
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD v37[2];
  __int128 v38;
  __int128 v39;
  char v40;
  uint64_t v41;
  _BYTE v42[24];

  v40 = 0;
  v38 = 0u;
  v39 = 0u;
  v37[0] = 0;
  v37[1] = 0;
  v36 = v37;
  objc_msgSend_tempAccountIdentifier(self, a3, (uint64_t)a4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend_UTF8String(v7, v8, v9);
  v12 = objc_msgSend_lengthOfBytesUsingEncoding_(v7, v11, 4);
  sub_233CAF22C(v30, v10, v12);

  v38 = *(_OWORD *)v30;
  objc_msgSend_setupPIN(self, v13, v14);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend_UTF8String(v15, v16, v17);
  v20 = objc_msgSend_lengthOfBytesUsingEncoding_(v15, v19, 4);
  sub_233CAF22C(v30, v18, v20);

  v39 = *(_OWORD *)v30;
  objc_msgSend_node(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v40 = 1;
    v41 = 0;
    objc_msgSend_node(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend_unsignedLongLongValue(v26, v27, v28);

  }
  sub_234118674(0x62FuLL, 0, &v35);
  if (v35)
  {
    sub_234106C48((uint64_t)v30);
    v32 = 0;
    v33 = 0;
    v31 = &unk_250504030;
    v34 = 0;
    sub_233CAF098((uint64_t)&v31, &v35, 0);
    sub_234106CA8((uint64_t)v30, (uint64_t)&v31, 0xFFFFFFFF, (uint64_t)v42);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D3B294((uint64_t)&v38, v30, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v30, &v35, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v35);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v31 = &unk_250504030;
    sub_233CAF128(&v33);
    sub_233CAF128(&v32);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 30031;
  }
  sub_233CAF128(&v35);
  return (ChipError *)sub_233CAF15C((uint64_t)&v36);
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
    v11 = 30060;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
