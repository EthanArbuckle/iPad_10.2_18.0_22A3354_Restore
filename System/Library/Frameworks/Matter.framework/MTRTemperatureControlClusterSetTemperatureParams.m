@implementation MTRTemperatureControlClusterSetTemperatureParams

- (MTRTemperatureControlClusterSetTemperatureParams)init
{
  MTRTemperatureControlClusterSetTemperatureParams *v2;
  MTRTemperatureControlClusterSetTemperatureParams *v3;
  NSNumber *targetTemperature;
  NSNumber *targetTemperatureLevel;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRTemperatureControlClusterSetTemperatureParams;
  v2 = -[MTRTemperatureControlClusterSetTemperatureParams init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    targetTemperature = v2->_targetTemperature;
    v2->_targetTemperature = 0;

    targetTemperatureLevel = v3->_targetTemperatureLevel;
    v3->_targetTemperatureLevel = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRTemperatureControlClusterSetTemperatureParams *v4;
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

  v4 = objc_alloc_init(MTRTemperatureControlClusterSetTemperatureParams);
  objc_msgSend_targetTemperature(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTargetTemperature_(v4, v8, (uint64_t)v7);

  objc_msgSend_targetTemperatureLevel(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTargetTemperatureLevel_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: targetTemperature:%@; targetTemperatureLevel:%@; >"),
    v5,
    self->_targetTemperature,
    self->_targetTemperatureLevel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)targetTemperature
{
  return self->_targetTemperature;
}

- (void)setTargetTemperature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)targetTemperatureLevel
{
  return self->_targetTemperatureLevel;
}

- (void)setTargetTemperatureLevel:(id)a3
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
  objc_storeStrong((id *)&self->_targetTemperatureLevel, 0);
  objc_storeStrong((id *)&self->_targetTemperature, 0);
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
  void *v16;
  const char *v17;
  uint64_t v18;
  char v20[64];
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD v27[2];
  char v28[2];
  __int16 v29;
  __int16 v30;
  _BYTE v31[24];

  v28[0] = 0;
  LOBYTE(v30) = 0;
  v27[0] = 0;
  v27[1] = 0;
  v26 = v27;
  objc_msgSend_targetTemperature(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v28[0] = 1;
    v29 = 0;
    objc_msgSend_targetTemperature(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_shortValue(v10, v11, v12);

  }
  objc_msgSend_targetTemperatureLevel(self, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v30 = 1;
    objc_msgSend_targetTemperatureLevel(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v30) = objc_msgSend_unsignedCharValue(v16, v17, v18);

  }
  sub_234118674(0x62FuLL, 0, &v25);
  if (v25)
  {
    sub_234106C48((uint64_t)v20);
    v22 = 0;
    v23 = 0;
    v21 = &unk_250504030;
    v24 = 0;
    sub_233CAF098((uint64_t)&v21, &v25, 0);
    sub_234106CA8((uint64_t)v20, (uint64_t)&v21, 0xFFFFFFFF, (uint64_t)v31);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D1449C(v28, v20, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v20, &v25, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v25);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v21 = &unk_250504030;
    sub_233CAF128(&v23);
    sub_233CAF128(&v22);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 11640;
  }
  sub_233CAF128(&v25);
  return (ChipError *)sub_233CAF15C((uint64_t)&v26);
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
    v11 = 11669;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
