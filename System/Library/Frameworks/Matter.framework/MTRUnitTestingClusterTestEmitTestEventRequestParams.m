@implementation MTRUnitTestingClusterTestEmitTestEventRequestParams

- (MTRUnitTestingClusterTestEmitTestEventRequestParams)init
{
  MTRUnitTestingClusterTestEmitTestEventRequestParams *v2;
  MTRUnitTestingClusterTestEmitTestEventRequestParams *v3;
  NSNumber *arg1;
  NSNumber *arg2;
  NSNumber *arg3;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRUnitTestingClusterTestEmitTestEventRequestParams;
  v2 = -[MTRUnitTestingClusterTestEmitTestEventRequestParams init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    arg1 = v2->_arg1;
    v2->_arg1 = (NSNumber *)&unk_250591A40;

    arg2 = v3->_arg2;
    v3->_arg2 = (NSNumber *)&unk_250591A40;

    arg3 = v3->_arg3;
    v3->_arg3 = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterTestEmitTestEventRequestParams *v4;
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

  v4 = objc_alloc_init(MTRUnitTestingClusterTestEmitTestEventRequestParams);
  objc_msgSend_arg1(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

  objc_msgSend_arg2(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg2_(v4, v12, (uint64_t)v11);

  objc_msgSend_arg3(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg3_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: arg1:%@; arg2:%@; arg3:%@; >"),
    v5,
    self->_arg1,
    self->_arg2,
    self->_arg3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)arg1
{
  return self->_arg1;
}

- (void)setArg1:(NSNumber *)arg1
{
  objc_setProperty_nonatomic_copy(self, a2, arg1, 8);
}

- (NSNumber)arg2
{
  return self->_arg2;
}

- (void)setArg2:(NSNumber *)arg2
{
  objc_setProperty_nonatomic_copy(self, a2, arg2, 16);
}

- (NSNumber)arg3
{
  return self->_arg3;
}

- (void)setArg3:(NSNumber *)arg3
{
  objc_setProperty_nonatomic_copy(self, a2, arg3, 24);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 32);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_arg3, 0);
  objc_storeStrong((id *)&self->_arg2, 0);
  objc_storeStrong((id *)&self->_arg1, 0);
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
  char v21[64];
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD v28[2];
  __int16 v29;
  char v30;
  _BYTE v31[24];

  v29 = 0;
  v30 = 0;
  v28[0] = 0;
  v28[1] = 0;
  v27 = v28;
  objc_msgSend_arg1(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = objc_msgSend_unsignedCharValue(v7, v8, v9);

  objc_msgSend_arg2(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HIBYTE(v29) = objc_msgSend_unsignedCharValue(v12, v13, v14);

  objc_msgSend_arg3(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_BOOLValue(v17, v18, v19);

  sub_234118674(0x62FuLL, 0, &v26);
  if (v26)
  {
    sub_234106C48((uint64_t)v21);
    v23 = 0;
    v24 = 0;
    v22 = &unk_250504030;
    v25 = 0;
    sub_233CAF098((uint64_t)&v22, &v26, 0);
    sub_234106CA8((uint64_t)v21, (uint64_t)&v22, 0xFFFFFFFF, (uint64_t)v31);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D42B6C((unsigned __int8 *)&v29, v21, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v21, &v26, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v26);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v22 = &unk_250504030;
    sub_233CAF128(&v24);
    sub_233CAF128(&v23);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 36231;
  }
  sub_233CAF128(&v26);
  return (ChipError *)sub_233CAF15C((uint64_t)&v27);
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
    v11 = 36260;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
