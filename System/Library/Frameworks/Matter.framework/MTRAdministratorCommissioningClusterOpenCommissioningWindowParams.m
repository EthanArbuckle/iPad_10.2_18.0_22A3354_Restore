@implementation MTRAdministratorCommissioningClusterOpenCommissioningWindowParams

- (MTRAdministratorCommissioningClusterOpenCommissioningWindowParams)init
{
  MTRAdministratorCommissioningClusterOpenCommissioningWindowParams *v2;
  MTRAdministratorCommissioningClusterOpenCommissioningWindowParams *v3;
  NSNumber *commissioningTimeout;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSData *pakePasscodeVerifier;
  NSNumber *discriminator;
  NSNumber *iterations;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSData *salt;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTRAdministratorCommissioningClusterOpenCommissioningWindowParams;
  v2 = -[MTRAdministratorCommissioningClusterOpenCommissioningWindowParams init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    commissioningTimeout = v2->_commissioningTimeout;
    v2->_commissioningTimeout = (NSNumber *)&unk_250591A40;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    pakePasscodeVerifier = v3->_pakePasscodeVerifier;
    v3->_pakePasscodeVerifier = (NSData *)v7;

    discriminator = v3->_discriminator;
    v3->_discriminator = (NSNumber *)&unk_250591A40;

    iterations = v3->_iterations;
    v3->_iterations = (NSNumber *)&unk_250591A40;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    salt = v3->_salt;
    v3->_salt = (NSData *)v13;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRAdministratorCommissioningClusterOpenCommissioningWindowParams *v4;
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

  v4 = objc_alloc_init(MTRAdministratorCommissioningClusterOpenCommissioningWindowParams);
  objc_msgSend_commissioningTimeout(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCommissioningTimeout_(v4, v8, (uint64_t)v7);

  objc_msgSend_pakePasscodeVerifier(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPakePasscodeVerifier_(v4, v12, (uint64_t)v11);

  objc_msgSend_discriminator(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDiscriminator_(v4, v16, (uint64_t)v15);

  objc_msgSend_iterations(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIterations_(v4, v20, (uint64_t)v19);

  objc_msgSend_salt(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSalt_(v4, v24, (uint64_t)v23);

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
  NSNumber *commissioningTimeout;
  const char *v7;
  void *v8;
  NSNumber *discriminator;
  NSNumber *iterations;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  commissioningTimeout = self->_commissioningTimeout;
  objc_msgSend_base64EncodedStringWithOptions_(self->_pakePasscodeVerifier, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  discriminator = self->_discriminator;
  iterations = self->_iterations;
  objc_msgSend_base64EncodedStringWithOptions_(self->_salt, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: commissioningTimeout:%@; pakePasscodeVerifier:%@; discriminator:%@; iterations:%@; salt:%@; >"),
    v5,
    commissioningTimeout,
    v8,
    discriminator,
    iterations,
    v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSNumber)commissioningTimeout
{
  return self->_commissioningTimeout;
}

- (void)setCommissioningTimeout:(NSNumber *)commissioningTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, commissioningTimeout, 8);
}

- (NSData)pakePasscodeVerifier
{
  return self->_pakePasscodeVerifier;
}

- (void)setPakePasscodeVerifier:(NSData *)pakePasscodeVerifier
{
  objc_setProperty_nonatomic_copy(self, a2, pakePasscodeVerifier, 16);
}

- (NSNumber)discriminator
{
  return self->_discriminator;
}

- (void)setDiscriminator:(NSNumber *)discriminator
{
  objc_setProperty_nonatomic_copy(self, a2, discriminator, 24);
}

- (NSNumber)iterations
{
  return self->_iterations;
}

- (void)setIterations:(NSNumber *)iterations
{
  objc_setProperty_nonatomic_copy(self, a2, iterations, 32);
}

- (NSData)salt
{
  return self->_salt;
}

- (void)setSalt:(NSData *)salt
{
  objc_setProperty_nonatomic_copy(self, a2, salt, 40);
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
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_iterations, 0);
  objc_storeStrong((id *)&self->_discriminator, 0);
  objc_storeStrong((id *)&self->_pakePasscodeVerifier, 0);
  objc_storeStrong((id *)&self->_commissioningTimeout, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  char v39[64];
  void *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD v46[2];
  unsigned __int16 v47;
  __int128 v48;
  __int16 v49;
  _DWORD v50[5];
  _BYTE v51[24];

  v47 = 0;
  v48 = 0uLL;
  v49 = 0;
  memset(v50, 0, sizeof(v50));
  v46[0] = 0;
  v46[1] = 0;
  v45 = v46;
  objc_msgSend_commissioningTimeout(self, a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend_unsignedShortValue(v7, v8, v9);

  objc_msgSend_pakePasscodeVerifier(self, v10, v11);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend_bytes(v12, v13, v14);
  v18 = objc_msgSend_length(v12, v16, v17);
  sub_233BF7114(v39, v15, v18);

  v48 = *(_OWORD *)v39;
  objc_msgSend_discriminator(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_unsignedShortValue(v21, v22, v23);

  objc_msgSend_iterations(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = objc_msgSend_unsignedIntValue(v26, v27, v28);

  objc_msgSend_salt(self, v29, v30);
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v34 = objc_msgSend_bytes(v31, v32, v33);
  v37 = objc_msgSend_length(v31, v35, v36);
  sub_233BF7114(v39, v34, v37);

  *(_OWORD *)&v50[1] = *(_OWORD *)v39;
  sub_234118674(0x62FuLL, 0, &v44);
  if (v44)
  {
    sub_234106C48((uint64_t)v39);
    v41 = 0;
    v42 = 0;
    v40 = &unk_250504030;
    v43 = 0;
    sub_233CAF098((uint64_t)&v40, &v44, 0);
    sub_234106CA8((uint64_t)v39, (uint64_t)&v40, 0xFFFFFFFF, (uint64_t)v51);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D0E074(&v47, v39, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v39, &v44, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v44);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v40 = &unk_250504030;
    sub_233CAF128(&v42);
    sub_233CAF128(&v41);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 7626;
  }
  sub_233CAF128(&v44);
  return (ChipError *)sub_233CAF15C((uint64_t)&v45);
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
    v11 = 7655;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
