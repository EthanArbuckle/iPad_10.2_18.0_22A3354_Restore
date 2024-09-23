@implementation MTRCommissionerControlClusterCommissionNodeParams

- (MTRCommissionerControlClusterCommissionNodeParams)init
{
  MTRCommissionerControlClusterCommissionNodeParams *v2;
  MTRCommissionerControlClusterCommissionNodeParams *v3;
  NSNumber *requestId;
  NSNumber *responseTimeoutSeconds;
  NSData *ipAddress;
  NSNumber *port;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRCommissionerControlClusterCommissionNodeParams;
  v2 = -[MTRCommissionerControlClusterCommissionNodeParams init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    requestId = v2->_requestId;
    v2->_requestId = (NSNumber *)&unk_250591A40;

    responseTimeoutSeconds = v3->_responseTimeoutSeconds;
    v3->_responseTimeoutSeconds = (NSNumber *)&unk_250591A40;

    ipAddress = v3->_ipAddress;
    v3->_ipAddress = 0;

    port = v3->_port;
    v3->_port = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRCommissionerControlClusterCommissionNodeParams *v4;
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
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;

  v4 = objc_alloc_init(MTRCommissionerControlClusterCommissionNodeParams);
  objc_msgSend_requestId(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestId_(v4, v8, (uint64_t)v7);

  objc_msgSend_responseTimeoutSeconds(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseTimeoutSeconds_(v4, v12, (uint64_t)v11);

  objc_msgSend_ipAddress(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIpAddress_(v4, v16, (uint64_t)v15);

  objc_msgSend_port(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPort_(v4, v20, (uint64_t)v19);

  objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  objc_msgSend_serverSideProcessingTimeout(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *requestId;
  NSNumber *responseTimeoutSeconds;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  requestId = self->_requestId;
  responseTimeoutSeconds = self->_responseTimeoutSeconds;
  objc_msgSend_base64EncodedStringWithOptions_(self->_ipAddress, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("<%@: requestId:%@; responseTimeoutSeconds:%@; ipAddress:%@; port:%@; >"),
    v5,
    requestId,
    responseTimeoutSeconds,
    v9,
    self->_port);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSNumber)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)responseTimeoutSeconds
{
  return self->_responseTimeoutSeconds;
}

- (void)setResponseTimeoutSeconds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)ipAddress
{
  return self->_ipAddress;
}

- (void)setIpAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
  objc_storeStrong((id *)&self->_responseTimeoutSeconds, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
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
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  char v34[64];
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD v41[2];
  uint64_t v42;
  __int16 v43;
  char v44;
  __int128 v45;
  char v46;
  __int16 v47;
  _BYTE v48[24];

  v41[1] = 0;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v46 = 0;
  v40 = v41;
  v41[0] = 0;
  objc_msgSend_requestId(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_unsignedLongLongValue(v7, v8, v9);

  objc_msgSend_responseTimeoutSeconds(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_unsignedShortValue(v12, v13, v14);

  objc_msgSend_ipAddress(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v44 = 1;
    v45 = 0uLL;
    objc_msgSend_ipAddress(self, v18, v19);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend_bytes(v20, v21, v22);
    v26 = objc_msgSend_length(v20, v24, v25);
    sub_233BF7114(v34, v23, v26);

    v45 = *(_OWORD *)v34;
  }
  objc_msgSend_port(self, v18, v19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v46 = 1;
    v47 = 0;
    objc_msgSend_port(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_unsignedShortValue(v30, v31, v32);

  }
  sub_234118674(0x62FuLL, 0, &v39);
  if (v39)
  {
    sub_234106C48((uint64_t)v34);
    v36 = 0;
    v37 = 0;
    v35 = &unk_250504030;
    v38 = 0;
    sub_233CAF098((uint64_t)&v35, &v39, 0);
    sub_234106CA8((uint64_t)v34, (uint64_t)&v35, 0xFFFFFFFF, (uint64_t)v48);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D3CA10((uint64_t)&v42, v34, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v34, &v39, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v39);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v35 = &unk_250504030;
    sub_233CAF128(&v37);
    sub_233CAF128(&v36);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 31375;
  }
  sub_233CAF128(&v39);
  return (ChipError *)sub_233CAF15C((uint64_t)&v40);
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
    v11 = 31404;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
