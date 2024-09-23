@implementation MTRFanControlClusterStepParams

- (MTRFanControlClusterStepParams)init
{
  MTRFanControlClusterStepParams *v2;
  MTRFanControlClusterStepParams *v3;
  NSNumber *direction;
  NSNumber *wrap;
  NSNumber *lowestOff;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRFanControlClusterStepParams;
  v2 = -[MTRFanControlClusterStepParams init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    direction = v2->_direction;
    v2->_direction = (NSNumber *)&unk_250591A40;

    wrap = v3->_wrap;
    v3->_wrap = 0;

    lowestOff = v3->_lowestOff;
    v3->_lowestOff = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRFanControlClusterStepParams *v4;
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

  v4 = objc_alloc_init(MTRFanControlClusterStepParams);
  objc_msgSend_direction(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDirection_(v4, v8, (uint64_t)v7);

  objc_msgSend_wrap(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWrap_(v4, v12, (uint64_t)v11);

  objc_msgSend_lowestOff(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLowestOff_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: direction:%@; wrap:%@; lowestOff:%@; >"),
    v5,
    self->_direction,
    self->_wrap,
    self->_lowestOff);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)direction
{
  return self->_direction;
}

- (void)setDirection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)wrap
{
  return self->_wrap;
}

- (void)setWrap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)lowestOff
{
  return self->_lowestOff;
}

- (void)setLowestOff:(id)a3
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
  objc_storeStrong((id *)&self->_lowestOff, 0);
  objc_storeStrong((id *)&self->_wrap, 0);
  objc_storeStrong((id *)&self->_direction, 0);
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
  void *v21;
  const char *v22;
  uint64_t v23;
  char v25[64];
  void *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD v32[2];
  _BYTE v33[3];
  __int16 v34;
  _BYTE v35[24];

  *(_WORD *)v33 = 0;
  LOBYTE(v34) = 0;
  v32[0] = 0;
  v32[1] = 0;
  v31 = v32;
  objc_msgSend_direction(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = objc_msgSend_unsignedCharValue(v7, v8, v9);

  objc_msgSend_wrap(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    *(_WORD *)&v33[1] = 1;
    objc_msgSend_wrap(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = objc_msgSend_BOOLValue(v15, v16, v17);

  }
  objc_msgSend_lowestOff(self, v13, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v34 = 1;
    objc_msgSend_lowestOff(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v34) = objc_msgSend_BOOLValue(v21, v22, v23);

  }
  sub_234118674(0x62FuLL, 0, &v30);
  if (v30)
  {
    sub_234106C48((uint64_t)v25);
    v27 = 0;
    v28 = 0;
    v26 = &unk_250504030;
    v29 = 0;
    sub_233CAF098((uint64_t)&v26, &v30, 0);
    sub_234106CA8((uint64_t)v25, (uint64_t)&v26, 0xFFFFFFFF, (uint64_t)v35);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D2D1A4(v33, v25, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v25, &v30, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v30);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v26 = &unk_250504030;
    sub_233CAF128(&v28);
    sub_233CAF128(&v27);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 22802;
  }
  sub_233CAF128(&v30);
  return (ChipError *)sub_233CAF15C((uint64_t)&v31);
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
    v11 = 22831;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
