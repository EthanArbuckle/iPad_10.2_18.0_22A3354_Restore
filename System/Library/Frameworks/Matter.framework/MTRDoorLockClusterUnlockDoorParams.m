@implementation MTRDoorLockClusterUnlockDoorParams

- (MTRDoorLockClusterUnlockDoorParams)init
{
  MTRDoorLockClusterUnlockDoorParams *v2;
  MTRDoorLockClusterUnlockDoorParams *v3;
  NSData *pinCode;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRDoorLockClusterUnlockDoorParams;
  v2 = -[MTRDoorLockClusterUnlockDoorParams init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    pinCode = v2->_pinCode;
    v2->_pinCode = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterUnlockDoorParams *v4;
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

  v4 = objc_alloc_init(MTRDoorLockClusterUnlockDoorParams);
  objc_msgSend_pinCode(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPinCode_(v4, v8, (uint64_t)v7);

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
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_pinCode, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: pinCode:%@; >"), v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)pinCode
{
  return self->_pinCode;
}

- (void)setPinCode:(NSData *)pinCode
{
  objc_setProperty_nonatomic_copy(self, a2, pinCode, 8);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 16);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
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
  uint64_t v16;
  char v18[64];
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD v25[2];
  char v26[8];
  __int128 v27;
  _BYTE v28[24];

  v26[0] = 0;
  v25[0] = 0;
  v25[1] = 0;
  v24 = v25;
  objc_msgSend_pinCode(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v26[0] = 1;
    v27 = 0uLL;
    objc_msgSend_pinCode(self, v8, v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend_bytes(v10, v11, v12);
    v16 = objc_msgSend_length(v10, v14, v15);
    sub_233BF7114(v18, v13, v16);

    v27 = *(_OWORD *)v18;
  }
  sub_234118674(0x62FuLL, 0, &v23);
  if (v23)
  {
    sub_234106C48((uint64_t)v18);
    v20 = 0;
    v21 = 0;
    v19 = &unk_250504030;
    v22 = 0;
    sub_233CAF098((uint64_t)&v19, &v23, 0);
    sub_234106CA8((uint64_t)v18, (uint64_t)&v19, 0xFFFFFFFF, (uint64_t)v28);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D24020(v26, v18, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v18, &v23, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v23);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v19 = &unk_250504030;
    sub_233CAF128(&v21);
    sub_233CAF128(&v20);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 18065;
  }
  sub_233CAF128(&v23);
  return (ChipError *)sub_233CAF15C((uint64_t)&v24);
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
    v11 = 18094;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
