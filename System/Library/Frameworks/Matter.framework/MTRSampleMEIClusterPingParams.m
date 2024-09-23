@implementation MTRSampleMEIClusterPingParams

- (MTRSampleMEIClusterPingParams)init
{
  MTRSampleMEIClusterPingParams *v2;
  MTRSampleMEIClusterPingParams *v3;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRSampleMEIClusterPingParams;
  v2 = -[MTRSampleMEIClusterPingParams init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRSampleMEIClusterPingParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRSampleMEIClusterPingParams);
  objc_msgSend_timedInvokeTimeoutMs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v8, (uint64_t)v7);

  objc_msgSend_serverSideProcessingTimeout(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v2;
  objc_class *v3;
  void *v4;
  const char *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v2, v5, (uint64_t)CFSTR("<%@: >"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  char v7[64];
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD v14[2];
  _BYTE v15[24];

  v14[0] = 0;
  v14[1] = 0;
  v13 = v14;
  sub_234118674(0x62FuLL, 0, &v12);
  if (v12)
  {
    sub_234106C48((uint64_t)v7);
    v9 = 0;
    v10 = 0;
    v8 = &unk_250504030;
    v11 = 0;
    sub_233CAF098((uint64_t)&v8, &v12, 0);
    sub_234106CA8((uint64_t)v7, (uint64_t)&v8, 0xFFFFFFFF, (uint64_t)v15);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233CFA4BC(v7, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v7, &v12, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v12);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v8 = &unk_250504030;
    sub_233CAF128(&v10);
    sub_233CAF128(&v9);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 36822;
  }
  sub_233CAF128(&v12);
  return (ChipError *)sub_233CAF15C((uint64_t)&v13);
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
    v11 = 36851;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
