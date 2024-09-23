@implementation MTRContentControlClusterAddBonusTimeParams

- (MTRContentControlClusterAddBonusTimeParams)init
{
  MTRContentControlClusterAddBonusTimeParams *v2;
  MTRContentControlClusterAddBonusTimeParams *v3;
  NSString *pinCode;
  NSNumber *bonusTime;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRContentControlClusterAddBonusTimeParams;
  v2 = -[MTRContentControlClusterAddBonusTimeParams init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    pinCode = v2->_pinCode;
    v2->_pinCode = 0;

    bonusTime = v3->_bonusTime;
    v3->_bonusTime = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRContentControlClusterAddBonusTimeParams *v4;
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

  v4 = objc_alloc_init(MTRContentControlClusterAddBonusTimeParams);
  objc_msgSend_pinCode(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPinCode_(v4, v8, (uint64_t)v7);

  objc_msgSend_bonusTime(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBonusTime_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: pinCode:%@; bonusTime:%@; >"),
    v5,
    self->_pinCode,
    self->_bonusTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)pinCode
{
  return self->_pinCode;
}

- (void)setPinCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)bonusTime
{
  return self->_bonusTime;
}

- (void)setBonusTime:(id)a3
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
  objc_storeStrong((id *)&self->_bonusTime, 0);
  objc_storeStrong((id *)&self->_pinCode, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  char v23[64];
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD v30[2];
  char v31[8];
  __int128 v32;
  char v33;
  int v34;
  _BYTE v35[24];

  v31[0] = 0;
  v33 = 0;
  v30[0] = 0;
  v30[1] = 0;
  v29 = v30;
  objc_msgSend_pinCode(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v31[0] = 1;
    v32 = 0uLL;
    objc_msgSend_pinCode(self, v8, v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend_UTF8String(v10, v11, v12);
    v15 = objc_msgSend_lengthOfBytesUsingEncoding_(v10, v14, 4);
    sub_233CAF22C(v23, v13, v15);

    v32 = *(_OWORD *)v23;
  }
  objc_msgSend_bonusTime(self, v8, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v33 = 1;
    v34 = 0;
    objc_msgSend_bonusTime(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_unsignedIntValue(v19, v20, v21);

  }
  sub_234118674(0x62FuLL, 0, &v28);
  if (v28)
  {
    sub_234106C48((uint64_t)v23);
    v25 = 0;
    v26 = 0;
    v24 = &unk_250504030;
    v27 = 0;
    sub_233CAF098((uint64_t)&v24, &v28, 0);
    sub_234106CA8((uint64_t)v23, (uint64_t)&v24, 0xFFFFFFFF, (uint64_t)v35);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D3BD68(v31, v23, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v23, &v28, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v28);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v24 = &unk_250504030;
    sub_233CAF128(&v26);
    sub_233CAF128(&v25);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 30594;
  }
  sub_233CAF128(&v28);
  return (ChipError *)sub_233CAF15C((uint64_t)&v29);
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
    v11 = 30623;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
