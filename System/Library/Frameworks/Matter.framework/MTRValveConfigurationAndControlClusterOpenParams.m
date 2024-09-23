@implementation MTRValveConfigurationAndControlClusterOpenParams

- (MTRValveConfigurationAndControlClusterOpenParams)init
{
  MTRValveConfigurationAndControlClusterOpenParams *v2;
  MTRValveConfigurationAndControlClusterOpenParams *v3;
  NSNumber *openDuration;
  NSNumber *targetLevel;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRValveConfigurationAndControlClusterOpenParams;
  v2 = -[MTRValveConfigurationAndControlClusterOpenParams init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    openDuration = v2->_openDuration;
    v2->_openDuration = 0;

    targetLevel = v3->_targetLevel;
    v3->_targetLevel = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRValveConfigurationAndControlClusterOpenParams *v4;
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

  v4 = objc_alloc_init(MTRValveConfigurationAndControlClusterOpenParams);
  objc_msgSend_openDuration(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOpenDuration_(v4, v8, (uint64_t)v7);

  objc_msgSend_targetLevel(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTargetLevel_(v4, v12, (uint64_t)v11);

  objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  objc_msgSend_serverSideProcessingTimeout(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: openDuration:%@; targetLevel:%@; >"),
    v5,
    self->_openDuration,
    self->_targetLevel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)openDuration
{
  return self->_openDuration;
}

- (void)setOpenDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)targetLevel
{
  return self->_targetLevel;
}

- (void)setTargetLevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_targetLevel, 0);
  objc_storeStrong((id *)&self->_openDuration, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  char v21[64];
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD v28[2];
  char v29[4];
  uint64_t v30;
  __int16 v31;
  _BYTE v32[24];

  v29[0] = 0;
  LOBYTE(v31) = 0;
  v28[0] = 0;
  v28[1] = 0;
  v27 = v28;
  objc_msgSend_openDuration(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v29[0] = 1;
    v30 = 0;
    objc_msgSend_openDuration(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      LODWORD(v30) = 0;
      BYTE4(v30) = 1;
      objc_msgSend_openDuration(self, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = objc_msgSend_unsignedIntValue(v11, v12, v13);

    }
  }
  objc_msgSend_targetLevel(self, v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v31 = 1;
    objc_msgSend_targetLevel(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v31) = objc_msgSend_unsignedCharValue(v17, v18, v19);

  }
  sub_234118674(0x62FuLL, 0, &v26);
  if (v26)
  {
    sub_234106C48((uint64_t)v21);
    v23 = 0;
    v24 = 0;
    v22 = &unk_250504030;
    v25 = 0;
    sub_233CAF098((uint64_t)&v22, &v26, 0);
    sub_234106CA8((uint64_t)v21, (uint64_t)&v22, 0xFFFFFFFF, (uint64_t)v32);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D197E4(v29, v21, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v21, &v26, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v26);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v22 = &unk_250504030;
    sub_233CAF128(&v24);
    sub_233CAF128(&v23);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 14904;
  }
  sub_233CAF128(&v26);
  return (ChipError *)sub_233CAF15C((uint64_t)&v27);
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
    v11 = 14933;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
