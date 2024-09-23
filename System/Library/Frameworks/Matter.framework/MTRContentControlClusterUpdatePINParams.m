@implementation MTRContentControlClusterUpdatePINParams

- (MTRContentControlClusterUpdatePINParams)init
{
  MTRContentControlClusterUpdatePINParams *v2;
  MTRContentControlClusterUpdatePINParams *v3;
  NSString *oldPIN;
  NSString *newPIN;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRContentControlClusterUpdatePINParams;
  v2 = -[MTRContentControlClusterUpdatePINParams init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    oldPIN = v2->_oldPIN;
    v2->_oldPIN = 0;

    newPIN = v3->_newPIN;
    v3->_newPIN = (NSString *)&stru_2505249E8;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRContentControlClusterUpdatePINParams *v4;
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

  v4 = objc_alloc_init(MTRContentControlClusterUpdatePINParams);
  objc_msgSend_oldPIN(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOldPIN_(v4, v8, (uint64_t)v7);

  objc_msgSend_getNewPIN(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNewPIN_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: oldPIN:%@; newPIN:%@; >"),
    v5,
    self->_oldPIN,
    self->_newPIN);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)oldPIN
{
  return self->_oldPIN;
}

- (void)setOldPIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)getNewPIN
{
  return self->_newPIN;
}

- (void)setNewPIN:(id)a3
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
  objc_storeStrong((id *)&self->_newPIN, 0);
  objc_storeStrong((id *)&self->_oldPIN, 0);
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
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
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
  __int128 v33;
  _BYTE v34[24];

  v31[0] = 0;
  v33 = 0uLL;
  v30[0] = 0;
  v30[1] = 0;
  v29 = v30;
  objc_msgSend_oldPIN(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v31[0] = 1;
    v32 = 0uLL;
    objc_msgSend_oldPIN(self, v8, v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend_UTF8String(v10, v11, v12);
    v15 = objc_msgSend_lengthOfBytesUsingEncoding_(v10, v14, 4);
    sub_233CAF22C(v23, v13, v15);

    v32 = *(_OWORD *)v23;
  }
  objc_msgSend_getNewPIN(self, v8, v9);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = objc_msgSend_UTF8String(v16, v17, v18);
  v21 = objc_msgSend_lengthOfBytesUsingEncoding_(v16, v20, 4);
  sub_233CAF22C(v23, v19, v21);

  v33 = *(_OWORD *)v23;
  sub_234118674(0x62FuLL, 0, &v28);
  if (v28)
  {
    sub_234106C48((uint64_t)v23);
    v25 = 0;
    v26 = 0;
    v24 = &unk_250504030;
    v27 = 0;
    sub_233CAF098((uint64_t)&v24, &v28, 0);
    sub_234106CA8((uint64_t)v23, (uint64_t)&v24, 0xFFFFFFFF, (uint64_t)v34);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D3BA64((uint64_t)v31, v23, 0x100uLL, (uint64_t)retstr);
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
    retstr->mLine = 30201;
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
    v11 = 30230;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
