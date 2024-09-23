@implementation MTROperationalCredentialsClusterAddNOCParams

- (MTROperationalCredentialsClusterAddNOCParams)init
{
  const char *v2;
  uint64_t v3;
  MTROperationalCredentialsClusterAddNOCParams *v4;
  uint64_t v5;
  NSData *nocValue;
  NSData *icacValue;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSData *ipkValue;
  NSNumber *caseAdminSubject;
  NSNumber *adminVendorId;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTROperationalCredentialsClusterAddNOCParams;
  v4 = -[MTROperationalCredentialsClusterAddNOCParams init](&v17, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    nocValue = v4->_nocValue;
    v4->_nocValue = (NSData *)v5;

    icacValue = v4->_icacValue;
    v4->_icacValue = 0;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    ipkValue = v4->_ipkValue;
    v4->_ipkValue = (NSData *)v10;

    caseAdminSubject = v4->_caseAdminSubject;
    v4->_caseAdminSubject = (NSNumber *)&unk_250591A40;

    adminVendorId = v4->_adminVendorId;
    v4->_adminVendorId = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROperationalCredentialsClusterAddNOCParams *v4;
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
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;

  v4 = objc_alloc_init(MTROperationalCredentialsClusterAddNOCParams);
  objc_msgSend_nocValue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNocValue_(v4, v8, (uint64_t)v7);

  objc_msgSend_icacValue(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIcacValue_(v4, v12, (uint64_t)v11);

  objc_msgSend_ipkValue(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIpkValue_(v4, v16, (uint64_t)v15);

  objc_msgSend_caseAdminSubject(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCaseAdminSubject_(v4, v20, (uint64_t)v19);

  objc_msgSend_adminVendorId(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdminVendorId_(v4, v24, (uint64_t)v23);

  objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  objc_msgSend_serverSideProcessingTimeout(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v32, (uint64_t)v31);

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
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_nocValue, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_icacValue, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_ipkValue, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v12, (uint64_t)CFSTR("<%@: nocValue:%@; icacValue:%@; ipkValue:%@; caseAdminSubject:%@; adminVendorId:%@; >"),
    v5,
    v7,
    v9,
    v11,
    self->_caseAdminSubject,
    self->_adminVendorId);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSData)nocValue
{
  return self->_nocValue;
}

- (void)setNocValue:(NSData *)nocValue
{
  objc_setProperty_nonatomic_copy(self, a2, nocValue, 8);
}

- (NSData)icacValue
{
  return self->_icacValue;
}

- (void)setIcacValue:(NSData *)icacValue
{
  objc_setProperty_nonatomic_copy(self, a2, icacValue, 16);
}

- (NSData)ipkValue
{
  return self->_ipkValue;
}

- (void)setIpkValue:(NSData *)ipkValue
{
  objc_setProperty_nonatomic_copy(self, a2, ipkValue, 24);
}

- (NSNumber)caseAdminSubject
{
  return self->_caseAdminSubject;
}

- (void)setCaseAdminSubject:(NSNumber *)caseAdminSubject
{
  objc_setProperty_nonatomic_copy(self, a2, caseAdminSubject, 32);
}

- (NSNumber)adminVendorId
{
  return self->_adminVendorId;
}

- (void)setAdminVendorId:(NSNumber *)adminVendorId
{
  objc_setProperty_nonatomic_copy(self, a2, adminVendorId, 40);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 48);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_adminVendorId, 0);
  objc_storeStrong((id *)&self->_caseAdminSubject, 0);
  objc_storeStrong((id *)&self->_ipkValue, 0);
  objc_storeStrong((id *)&self->_icacValue, 0);
  objc_storeStrong((id *)&self->_nocValue, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  char v44[64];
  void *v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD v51[2];
  __int128 v52;
  char v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  __int16 v57;
  _BYTE v58[24];

  v52 = 0uLL;
  v53 = 0;
  v56 = 0;
  v55 = 0uLL;
  v57 = 0;
  v51[0] = 0;
  v51[1] = 0;
  v50 = v51;
  objc_msgSend_nocValue(self, a3, (uint64_t)a4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend_bytes(v7, v8, v9);
  v13 = objc_msgSend_length(v7, v11, v12);
  sub_233BF7114(v44, v10, v13);

  v52 = *(_OWORD *)v44;
  objc_msgSend_icacValue(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v53 = 1;
    v54 = 0uLL;
    objc_msgSend_icacValue(self, v17, v18);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend_bytes(v19, v20, v21);
    v25 = objc_msgSend_length(v19, v23, v24);
    sub_233BF7114(v44, v22, v25);

    v54 = *(_OWORD *)v44;
  }
  objc_msgSend_ipkValue(self, v17, v18);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v29 = objc_msgSend_bytes(v26, v27, v28);
  v32 = objc_msgSend_length(v26, v30, v31);
  sub_233BF7114(v44, v29, v32);

  v55 = *(_OWORD *)v44;
  objc_msgSend_caseAdminSubject(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend_unsignedLongLongValue(v35, v36, v37);

  objc_msgSend_adminVendorId(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_unsignedShortValue(v40, v41, v42);

  sub_234118674(0x62FuLL, 0, &v49);
  if (v49)
  {
    sub_234106C48((uint64_t)v44);
    v46 = 0;
    v47 = 0;
    v45 = &unk_250504030;
    v48 = 0;
    sub_233CAF098((uint64_t)&v45, &v49, 0);
    sub_234106CA8((uint64_t)v44, (uint64_t)&v45, 0xFFFFFFFF, (uint64_t)v58);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D0F754((uint64_t)&v52, v44, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v44, &v49, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v49);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v45 = &unk_250504030;
    sub_233CAF128(&v47);
    sub_233CAF128(&v46);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 8482;
  }
  sub_233CAF128(&v49);
  return (ChipError *)sub_233CAF15C((uint64_t)&v50);
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
    v11 = 8511;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
