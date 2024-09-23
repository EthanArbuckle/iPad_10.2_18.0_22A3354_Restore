@implementation MTRDiagnosticLogsClusterRetrieveLogsRequestParams

- (MTRDiagnosticLogsClusterRetrieveLogsRequestParams)init
{
  MTRDiagnosticLogsClusterRetrieveLogsRequestParams *v2;
  MTRDiagnosticLogsClusterRetrieveLogsRequestParams *v3;
  NSNumber *intent;
  NSNumber *requestedProtocol;
  NSString *transferFileDesignator;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRDiagnosticLogsClusterRetrieveLogsRequestParams;
  v2 = -[MTRDiagnosticLogsClusterRetrieveLogsRequestParams init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    intent = v2->_intent;
    v2->_intent = (NSNumber *)&unk_250591A40;

    requestedProtocol = v3->_requestedProtocol;
    v3->_requestedProtocol = (NSNumber *)&unk_250591A40;

    transferFileDesignator = v3->_transferFileDesignator;
    v3->_transferFileDesignator = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDiagnosticLogsClusterRetrieveLogsRequestParams *v4;
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

  v4 = objc_alloc_init(MTRDiagnosticLogsClusterRetrieveLogsRequestParams);
  objc_msgSend_intent(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIntent_(v4, v8, (uint64_t)v7);

  objc_msgSend_requestedProtocol(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestedProtocol_(v4, v12, (uint64_t)v11);

  objc_msgSend_transferFileDesignator(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransferFileDesignator_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: intent:%@; requestedProtocol:%@; transferFileDesignator:%@; >"),
    v5,
    self->_intent,
    self->_requestedProtocol,
    self->_transferFileDesignator);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)intent
{
  return self->_intent;
}

- (void)setIntent:(NSNumber *)intent
{
  objc_setProperty_nonatomic_copy(self, a2, intent, 8);
}

- (NSNumber)requestedProtocol
{
  return self->_requestedProtocol;
}

- (void)setRequestedProtocol:(NSNumber *)requestedProtocol
{
  objc_setProperty_nonatomic_copy(self, a2, requestedProtocol, 16);
}

- (NSString)transferFileDesignator
{
  return self->_transferFileDesignator;
}

- (void)setTransferFileDesignator:(NSString *)transferFileDesignator
{
  objc_setProperty_nonatomic_copy(self, a2, transferFileDesignator, 24);
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
  objc_storeStrong((id *)&self->_transferFileDesignator, 0);
  objc_storeStrong((id *)&self->_requestedProtocol, 0);
  objc_storeStrong((id *)&self->_intent, 0);
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
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  char v27[64];
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD v34[2];
  unsigned __int8 v35[8];
  char v36;
  __int128 v37;
  _BYTE v38[24];

  *(_WORD *)v35 = 0;
  v36 = 0;
  v34[0] = 0;
  v34[1] = 0;
  v33 = v34;
  objc_msgSend_intent(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = objc_msgSend_unsignedCharValue(v7, v8, v9);

  objc_msgSend_requestedProtocol(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = objc_msgSend_unsignedCharValue(v12, v13, v14);

  objc_msgSend_transferFileDesignator(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v36 = 1;
    v37 = 0uLL;
    objc_msgSend_transferFileDesignator(self, v18, v19);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend_UTF8String(v20, v21, v22);
    v25 = objc_msgSend_lengthOfBytesUsingEncoding_(v20, v24, 4);
    sub_233CAF22C(v27, v23, v25);

    v37 = *(_OWORD *)v27;
  }
  sub_234118674(0x62FuLL, 0, &v32);
  if (v32)
  {
    sub_234106C48((uint64_t)v27);
    v29 = 0;
    v30 = 0;
    v28 = &unk_250504030;
    v31 = 0;
    sub_233CAF098((uint64_t)&v28, &v32, 0);
    sub_234106CA8((uint64_t)v27, (uint64_t)&v28, 0xFFFFFFFF, (uint64_t)v38);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D07478(v35, v27, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v27, &v32, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v32);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v28 = &unk_250504030;
    sub_233CAF128(&v30);
    sub_233CAF128(&v29);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 6123;
  }
  sub_233CAF128(&v32);
  return (ChipError *)sub_233CAF15C((uint64_t)&v33);
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
    v11 = 6152;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
