@implementation MTREnergyEVSEClusterEnableDischargingParams

- (MTREnergyEVSEClusterEnableDischargingParams)init
{
  MTREnergyEVSEClusterEnableDischargingParams *v2;
  MTREnergyEVSEClusterEnableDischargingParams *v3;
  NSNumber *dischargingEnabledUntil;
  NSNumber *maximumDischargeCurrent;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTREnergyEVSEClusterEnableDischargingParams;
  v2 = -[MTREnergyEVSEClusterEnableDischargingParams init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    dischargingEnabledUntil = v2->_dischargingEnabledUntil;
    v2->_dischargingEnabledUntil = 0;

    maximumDischargeCurrent = v3->_maximumDischargeCurrent;
    v3->_maximumDischargeCurrent = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTREnergyEVSEClusterEnableDischargingParams *v4;
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

  v4 = objc_alloc_init(MTREnergyEVSEClusterEnableDischargingParams);
  objc_msgSend_dischargingEnabledUntil(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDischargingEnabledUntil_(v4, v8, (uint64_t)v7);

  objc_msgSend_maximumDischargeCurrent(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaximumDischargeCurrent_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: dischargingEnabledUntil:%@; maximumDischargeCurrent:%@; >"),
    v5,
    self->_dischargingEnabledUntil,
    self->_maximumDischargeCurrent);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)dischargingEnabledUntil
{
  return self->_dischargingEnabledUntil;
}

- (void)setDischargingEnabledUntil:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)maximumDischargeCurrent
{
  return self->_maximumDischargeCurrent;
}

- (void)setMaximumDischargeCurrent:(id)a3
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
  objc_storeStrong((id *)&self->_maximumDischargeCurrent, 0);
  objc_storeStrong((id *)&self->_dischargingEnabledUntil, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  char v17[64];
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD v24[2];
  int v25;
  char v26;
  uint64_t v27;
  _BYTE v28[24];

  LOBYTE(v25) = 0;
  v26 = 0;
  v27 = 0;
  v24[0] = 0;
  v24[1] = 0;
  v23 = v24;
  objc_msgSend_dischargingEnabledUntil(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v25 = 0;
    v26 = 1;
    objc_msgSend_dischargingEnabledUntil(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_unsignedIntValue(v10, v11, v12);

  }
  objc_msgSend_maximumDischargeCurrent(self, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_longLongValue(v13, v14, v15);

  sub_234118674(0x62FuLL, 0, &v22);
  if (v22)
  {
    sub_234106C48((uint64_t)v17);
    v19 = 0;
    v20 = 0;
    v18 = &unk_250504030;
    v21 = 0;
    sub_233CAF098((uint64_t)&v18, &v22, 0);
    sub_234106CA8((uint64_t)v17, (uint64_t)&v18, 0xFFFFFFFF, (uint64_t)v28);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D22074((uint64_t)&v25, v17, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v17, &v22, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v22);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v18 = &unk_250504030;
    sub_233CAF128(&v20);
    sub_233CAF128(&v19);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 17036;
  }
  sub_233CAF128(&v22);
  return (ChipError *)sub_233CAF15C((uint64_t)&v23);
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
    v11 = 17065;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
