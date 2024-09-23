@implementation MTRTimeSynchronizationClusterSetUTCTimeParams

- (MTRTimeSynchronizationClusterSetUTCTimeParams)init
{
  MTRTimeSynchronizationClusterSetUTCTimeParams *v2;
  MTRTimeSynchronizationClusterSetUTCTimeParams *v3;
  NSNumber *utcTime;
  NSNumber *granularity;
  NSNumber *timeSource;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRTimeSynchronizationClusterSetUTCTimeParams;
  v2 = -[MTRTimeSynchronizationClusterSetUTCTimeParams init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    utcTime = v2->_utcTime;
    v2->_utcTime = (NSNumber *)&unk_250591A40;

    granularity = v3->_granularity;
    v3->_granularity = (NSNumber *)&unk_250591A40;

    timeSource = v3->_timeSource;
    v3->_timeSource = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRTimeSynchronizationClusterSetUTCTimeParams *v4;
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

  v4 = objc_alloc_init(MTRTimeSynchronizationClusterSetUTCTimeParams);
  objc_msgSend_utcTime(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUtcTime_(v4, v8, (uint64_t)v7);

  objc_msgSend_granularity(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGranularity_(v4, v12, (uint64_t)v11);

  objc_msgSend_timeSource(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeSource_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: utcTime:%@; granularity:%@; timeSource:%@; >"),
    v5,
    self->_utcTime,
    self->_granularity,
    self->_timeSource);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)utcTime
{
  return self->_utcTime;
}

- (void)setUtcTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)timeSource
{
  return self->_timeSource;
}

- (void)setTimeSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_timeSource, 0);
  objc_storeStrong((id *)&self->_granularity, 0);
  objc_storeStrong((id *)&self->_utcTime, 0);
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
  void *v20;
  const char *v21;
  uint64_t v22;
  char v24[64];
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD v31[2];
  uint64_t v32;
  _BYTE v33[3];
  _BYTE v34[24];

  v32 = 0;
  *(_WORD *)v33 = 0;
  v31[0] = 0;
  v31[1] = 0;
  v30 = v31;
  objc_msgSend_utcTime(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_unsignedLongLongValue(v7, v8, v9);

  objc_msgSend_granularity(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = objc_msgSend_unsignedCharValue(v12, v13, v14);

  objc_msgSend_timeSource(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    *(_WORD *)&v33[1] = 1;
    objc_msgSend_timeSource(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = objc_msgSend_unsignedCharValue(v20, v21, v22);

  }
  sub_234118674(0x62FuLL, 0, &v29);
  if (v29)
  {
    sub_234106C48((uint64_t)v24);
    v26 = 0;
    v27 = 0;
    v25 = &unk_250504030;
    v28 = 0;
    sub_233CAF098((uint64_t)&v25, &v29, 0);
    sub_234106CA8((uint64_t)v24, (uint64_t)&v25, 0xFFFFFFFF, (uint64_t)v34);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D0C258((uint64_t)&v32, v24, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v24, &v29, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v29);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v25 = &unk_250504030;
    sub_233CAF128(&v27);
    sub_233CAF128(&v26);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 7055;
  }
  sub_233CAF128(&v29);
  return (ChipError *)sub_233CAF15C((uint64_t)&v30);
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
    v11 = 7084;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
