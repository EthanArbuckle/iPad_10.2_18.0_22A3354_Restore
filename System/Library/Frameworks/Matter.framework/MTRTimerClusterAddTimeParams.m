@implementation MTRTimerClusterAddTimeParams

- (MTRTimerClusterAddTimeParams)init
{
  MTRTimerClusterAddTimeParams *v2;
  MTRTimerClusterAddTimeParams *v3;
  NSNumber *additionalTime;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRTimerClusterAddTimeParams;
  v2 = -[MTRTimerClusterAddTimeParams init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    additionalTime = v2->_additionalTime;
    v2->_additionalTime = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRTimerClusterAddTimeParams *v4;
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

  v4 = objc_alloc_init(MTRTimerClusterAddTimeParams);
  objc_msgSend_additionalTime(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdditionalTime_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: additionalTime:%@; >"), v5, self->_additionalTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)additionalTime
{
  return self->_additionalTime;
}

- (void)setAdditionalTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_additionalTime, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  char v10[64];
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD v17[2];
  unsigned int v18;
  _BYTE v19[24];

  v18 = 0;
  v17[0] = 0;
  v17[1] = 0;
  v16 = v17;
  objc_msgSend_additionalTime(self, a3, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_unsignedIntValue(v6, v7, v8);

  sub_234118674(0x62FuLL, 0, &v15);
  if (v15)
  {
    sub_234106C48((uint64_t)v10);
    v12 = 0;
    v13 = 0;
    v11 = &unk_250504030;
    v14 = 0;
    sub_233CAF098((uint64_t)&v11, &v15, 0);
    sub_234106CA8((uint64_t)v10, (uint64_t)&v11, 0xFFFFFFFF, (uint64_t)v19);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D11E4C(&v18, v10, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v10, &v15, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v15);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v11 = &unk_250504030;
    sub_233CAF128(&v13);
    sub_233CAF128(&v12);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 10141;
  }
  sub_233CAF128(&v15);
  return (ChipError *)sub_233CAF15C((uint64_t)&v16);
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
    v11 = 10170;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
