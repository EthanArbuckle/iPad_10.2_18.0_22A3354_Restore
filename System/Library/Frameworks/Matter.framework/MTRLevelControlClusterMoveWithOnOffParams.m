@implementation MTRLevelControlClusterMoveWithOnOffParams

- (MTRLevelControlClusterMoveWithOnOffParams)init
{
  MTRLevelControlClusterMoveWithOnOffParams *v2;
  MTRLevelControlClusterMoveWithOnOffParams *v3;
  NSNumber *moveMode;
  NSNumber *rate;
  NSNumber *optionsMask;
  NSNumber *optionsOverride;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRLevelControlClusterMoveWithOnOffParams;
  v2 = -[MTRLevelControlClusterMoveWithOnOffParams init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    moveMode = v2->_moveMode;
    v2->_moveMode = (NSNumber *)&unk_250591A40;

    rate = v3->_rate;
    v3->_rate = 0;

    optionsMask = v3->_optionsMask;
    v3->_optionsMask = (NSNumber *)&unk_250591A40;

    optionsOverride = v3->_optionsOverride;
    v3->_optionsOverride = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRLevelControlClusterMoveWithOnOffParams *v4;
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

  v4 = objc_alloc_init(MTRLevelControlClusterMoveWithOnOffParams);
  objc_msgSend_moveMode(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMoveMode_(v4, v8, (uint64_t)v7);

  objc_msgSend_rate(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRate_(v4, v12, (uint64_t)v11);

  objc_msgSend_optionsMask(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptionsMask_(v4, v16, (uint64_t)v15);

  objc_msgSend_optionsOverride(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptionsOverride_(v4, v20, (uint64_t)v19);

  objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  objc_msgSend_serverSideProcessingTimeout(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v28, (uint64_t)v27);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: moveMode:%@; rate:%@; optionsMask:%@; optionsOverride:%@; >"),
    v5,
    self->_moveMode,
    self->_rate,
    self->_optionsMask,
    self->_optionsOverride);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)moveMode
{
  return self->_moveMode;
}

- (void)setMoveMode:(NSNumber *)moveMode
{
  objc_setProperty_nonatomic_copy(self, a2, moveMode, 8);
}

- (NSNumber)rate
{
  return self->_rate;
}

- (void)setRate:(NSNumber *)rate
{
  objc_setProperty_nonatomic_copy(self, a2, rate, 16);
}

- (NSNumber)optionsMask
{
  return self->_optionsMask;
}

- (void)setOptionsMask:(NSNumber *)optionsMask
{
  objc_setProperty_nonatomic_copy(self, a2, optionsMask, 24);
}

- (NSNumber)optionsOverride
{
  return self->_optionsOverride;
}

- (void)setOptionsOverride:(NSNumber *)optionsOverride
{
  objc_setProperty_nonatomic_copy(self, a2, optionsOverride, 32);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 40);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_optionsOverride, 0);
  objc_storeStrong((id *)&self->_optionsMask, 0);
  objc_storeStrong((id *)&self->_rate, 0);
  objc_storeStrong((id *)&self->_moveMode, 0);
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
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  char v27[64];
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD v34[2];
  int v35;
  char v36;
  _BYTE v37[24];

  v36 = 0;
  v35 = 0;
  v34[0] = 0;
  v34[1] = 0;
  v33 = v34;
  objc_msgSend_moveMode(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v35) = objc_msgSend_unsignedCharValue(v7, v8, v9);

  objc_msgSend_rate(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    *(_WORD *)((char *)&v35 + 1) = 256;
    objc_msgSend_rate(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v35) = objc_msgSend_unsignedCharValue(v15, v16, v17);

  }
  objc_msgSend_optionsMask(self, v13, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HIBYTE(v35) = objc_msgSend_unsignedCharValue(v18, v19, v20);

  objc_msgSend_optionsOverride(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_unsignedCharValue(v23, v24, v25);

  sub_234118674(0x62FuLL, 0, &v32);
  if (v32)
  {
    sub_234106C48((uint64_t)v27);
    v29 = 0;
    v30 = 0;
    v28 = &unk_250504030;
    v31 = 0;
    sub_233CAF098((uint64_t)&v28, &v32, 0);
    sub_234106CA8((uint64_t)v27, (uint64_t)&v28, 0xFFFFFFFF, (uint64_t)v37);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233CFB288((unsigned __int8 *)&v35, v27, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v27, &v32, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v32);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v28 = &unk_250504030;
    sub_233CAF128(&v30);
    sub_233CAF128(&v29);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 2206;
  }
  sub_233CAF128(&v32);
  return (ChipError *)sub_233CAF15C((uint64_t)&v33);
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
    v11 = 2235;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
