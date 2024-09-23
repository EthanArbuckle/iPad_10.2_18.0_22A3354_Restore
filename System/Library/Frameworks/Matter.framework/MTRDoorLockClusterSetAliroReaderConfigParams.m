@implementation MTRDoorLockClusterSetAliroReaderConfigParams

- (MTRDoorLockClusterSetAliroReaderConfigParams)init
{
  const char *v2;
  uint64_t v3;
  MTRDoorLockClusterSetAliroReaderConfigParams *v4;
  uint64_t v5;
  NSData *signingKey;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSData *verificationKey;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSData *groupIdentifier;
  NSData *groupResolvingKey;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MTRDoorLockClusterSetAliroReaderConfigParams;
  v4 = -[MTRDoorLockClusterSetAliroReaderConfigParams init](&v19, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    signingKey = v4->_signingKey;
    v4->_signingKey = (NSData *)v5;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    verificationKey = v4->_verificationKey;
    v4->_verificationKey = (NSData *)v9;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v4->_groupIdentifier;
    v4->_groupIdentifier = (NSData *)v13;

    groupResolvingKey = v4->_groupResolvingKey;
    v4->_groupResolvingKey = 0;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDoorLockClusterSetAliroReaderConfigParams *v4;
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

  v4 = objc_alloc_init(MTRDoorLockClusterSetAliroReaderConfigParams);
  objc_msgSend_signingKey(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSigningKey_(v4, v8, (uint64_t)v7);

  objc_msgSend_verificationKey(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVerificationKey_(v4, v12, (uint64_t)v11);

  objc_msgSend_groupIdentifier(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupIdentifier_(v4, v16, (uint64_t)v15);

  objc_msgSend_groupResolvingKey(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupResolvingKey_(v4, v20, (uint64_t)v19);

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
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_signingKey, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_verificationKey, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_groupIdentifier, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_groupResolvingKey, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v14, (uint64_t)CFSTR("<%@: signingKey:%@; verificationKey:%@; groupIdentifier:%@; groupResolvingKey:%@; >"),
    v5,
    v7,
    v9,
    v11,
    v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSData)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)verificationKey
{
  return self->_verificationKey;
}

- (void)setVerificationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)groupResolvingKey
{
  return self->_groupResolvingKey;
}

- (void)setGroupResolvingKey:(id)a3
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
  objc_storeStrong((id *)&self->_groupResolvingKey, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_verificationKey, 0);
  objc_storeStrong((id *)&self->_signingKey, 0);
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
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  char v45[64];
  void *v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD v52[2];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char v56;
  __int128 v57;
  _BYTE v58[24];

  v56 = 0;
  v54 = 0u;
  v55 = 0u;
  v53 = 0u;
  v52[0] = 0;
  v52[1] = 0;
  v51 = v52;
  objc_msgSend_signingKey(self, a3, (uint64_t)a4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend_bytes(v7, v8, v9);
  v13 = objc_msgSend_length(v7, v11, v12);
  sub_233BF7114(v45, v10, v13);

  v53 = *(_OWORD *)v45;
  objc_msgSend_verificationKey(self, v14, v15);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = objc_msgSend_bytes(v16, v17, v18);
  v22 = objc_msgSend_length(v16, v20, v21);
  sub_233BF7114(v45, v19, v22);

  v54 = *(_OWORD *)v45;
  objc_msgSend_groupIdentifier(self, v23, v24);
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28 = objc_msgSend_bytes(v25, v26, v27);
  v31 = objc_msgSend_length(v25, v29, v30);
  sub_233BF7114(v45, v28, v31);

  v55 = *(_OWORD *)v45;
  objc_msgSend_groupResolvingKey(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v56 = 1;
    v57 = 0uLL;
    objc_msgSend_groupResolvingKey(self, v35, v36);
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40 = objc_msgSend_bytes(v37, v38, v39);
    v43 = objc_msgSend_length(v37, v41, v42);
    sub_233BF7114(v45, v40, v43);

    v57 = *(_OWORD *)v45;
  }
  sub_234118674(0x62FuLL, 0, &v50);
  if (v50)
  {
    sub_234106C48((uint64_t)v45);
    v47 = 0;
    v48 = 0;
    v46 = &unk_250504030;
    v49 = 0;
    sub_233CAF098((uint64_t)&v46, &v50, 0);
    sub_234106CA8((uint64_t)v45, (uint64_t)&v46, 0xFFFFFFFF, (uint64_t)v58);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D27580((uint64_t)&v53, v45, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v45, &v50, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v50);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v46 = &unk_250504030;
    sub_233CAF128(&v48);
    sub_233CAF128(&v47);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 20540;
  }
  sub_233CAF128(&v50);
  return (ChipError *)sub_233CAF15C((uint64_t)&v51);
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
    v11 = 20569;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
