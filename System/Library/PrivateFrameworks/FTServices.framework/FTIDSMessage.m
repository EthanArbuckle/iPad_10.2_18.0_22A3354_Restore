@implementation FTIDSMessage

- (FTIDSMessage)init
{
  FTIDSMessage *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FTIDSMessage;
  v2 = -[IDSBaseMessage init](&v11, sel_init);
  if (v2)
  {
    IMGetConferenceSettings();
    v3 = 0;
    objc_msgSend_lastObject(v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTopic_(v2, v7, (uint64_t)v6);

    objc_msgSend_setWantsResponse_(v2, v8, 1);
    objc_msgSend_setRetryCount_(v2, v9, (uint64_t)&unk_1E4DE6598);

  }
  return v2;
}

- (void)dealloc
{
  const char *v3;
  const char *v4;
  const char *v5;
  objc_super v6;

  objc_msgSend_setPushPrivateKey_(self, a2, 0);
  objc_msgSend_setPushPublicKey_(self, v3, 0);
  objc_msgSend_setIdentityPrivateKey_(self, v4, 0);
  objc_msgSend_setIdentityPublicKey_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)FTIDSMessage;
  -[FTIDSMessage dealloc](&v6, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  objc_super v62;

  v62.receiver = self;
  v62.super_class = (Class)FTIDSMessage;
  v4 = -[IDSBaseMessage copyWithZone:](&v62, sel_copyWithZone_, a3);
  objc_msgSend_pushCertificate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPushCertificate_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_pushPrivateKey(self, v9, v10);
  objc_msgSend_setPushPrivateKey_(v4, v12, v11);
  v15 = objc_msgSend_pushPublicKey(self, v13, v14);
  objc_msgSend_setPushPublicKey_(v4, v16, v15);
  objc_msgSend_IDCertificate(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIDCertificate_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_identityPrivateKey(self, v21, v22);
  objc_msgSend_setIdentityPrivateKey_(v4, v24, v23);
  v27 = objc_msgSend_identityPublicKey(self, v25, v26);
  objc_msgSend_setIdentityPublicKey_(v4, v28, v27);
  objc_msgSend_pushToken(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPushToken_(v4, v32, (uint64_t)v31);

  objc_msgSend_selfURI(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSelfURI_(v4, v36, (uint64_t)v35);

  objc_msgSend_publicKeyArray(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPublicKeyArray_(v4, v40, (uint64_t)v39);

  objc_msgSend_privateKeyArray(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPrivateKeyArray_(v4, v44, (uint64_t)v43);

  objc_msgSend_userIDArray(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIDArray_(v4, v48, (uint64_t)v47);

  objc_msgSend_certDataArray(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCertDataArray_(v4, v52, (uint64_t)v51);

  objc_msgSend_serverTimestamp(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerTimestamp_(v4, v56, (uint64_t)v55);

  objc_msgSend_serverTimestampReceivedDate(self, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerTimestampReceivedDate_(v4, v60, (uint64_t)v59);

  return v4;
}

- (void)setPushPublicKey:(__SecKey *)a3
{
  __SecKey *pushPublicKey;

  pushPublicKey = self->_pushPublicKey;
  if (pushPublicKey != a3)
  {
    if (pushPublicKey)
    {
      CFRelease(pushPublicKey);
      self->_pushPublicKey = 0;
    }
    if (a3)
    {
      self->_pushPublicKey = a3;
      CFRetain(a3);
    }
  }
}

- (void)setIdentityPrivateKey:(__SecKey *)a3
{
  __SecKey *identityKey;

  identityKey = self->_identityKey;
  if (identityKey != a3)
  {
    if (identityKey)
    {
      CFRelease(identityKey);
      self->_identityKey = 0;
    }
    if (a3)
    {
      self->_identityKey = a3;
      CFRetain(a3);
    }
  }
}

- (void)setIdentityPublicKey:(__SecKey *)a3
{
  __SecKey *identityPublicKey;

  identityPublicKey = self->_identityPublicKey;
  if (identityPublicKey != a3)
  {
    if (identityPublicKey)
    {
      CFRelease(identityPublicKey);
      self->_identityPublicKey = 0;
    }
    if (a3)
    {
      self->_identityPublicKey = a3;
      CFRetain(a3);
    }
  }
}

- (void)setPushPrivateKey:(__SecKey *)a3
{
  __SecKey *pushKey;

  pushKey = self->_pushKey;
  if (pushKey != a3)
  {
    if (pushKey)
    {
      CFRelease(pushKey);
      self->_pushKey = 0;
    }
    if (a3)
    {
      self->_pushKey = a3;
      CFRetain(a3);
    }
  }
}

- (void)addAuthUserID:(id)a3 certificate:(id)a4 privateKey:(__SecKey *)a5 publicKey:(__SecKey *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  char v21;
  const char *v22;
  NSMutableArray *v23;
  NSMutableArray *certDataArray;
  NSMutableArray *v25;
  NSMutableArray *userIDArray;
  NSMutableArray *v27;
  NSMutableArray *publicKeyArray;
  NSMutableArray *v29;
  NSMutableArray *privateKeyArray;
  const char *v31;
  const char *v32;
  const char *v33;
  NSObject *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  __SecKey *v40;
  __int16 v41;
  __SecKey *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (objc_msgSend_length(v10, v12, v13) && (v16 = objc_msgSend_length(v11, v14, v15), a6) && a5 && v16)
  {
    objc_msgSend_userIDArray(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_containsObject_(v19, v20, (uint64_t)v10);

    if ((v21 & 1) == 0)
    {
      if (!self->_certDataArray)
      {
        v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        certDataArray = self->_certDataArray;
        self->_certDataArray = v23;

      }
      if (!self->_userIDArray)
      {
        v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        userIDArray = self->_userIDArray;
        self->_userIDArray = v25;

      }
      if (!self->_publicKeyArray)
      {
        v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        publicKeyArray = self->_publicKeyArray;
        self->_publicKeyArray = v27;

      }
      if (!self->_privateKeyArray)
      {
        v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        privateKeyArray = self->_privateKeyArray;
        self->_privateKeyArray = v29;

      }
      objc_msgSend_addObject_(self->_certDataArray, v22, (uint64_t)v11);
      objc_msgSend_addObject_(self->_userIDArray, v31, (uint64_t)v10);
      objc_msgSend_addObject_(self->_privateKeyArray, v32, (uint64_t)a5);
      objc_msgSend_addObject_(self->_publicKeyArray, v33, (uint64_t)a6);
    }
  }
  else
  {
    OSLogHandleForIDSCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v36 = v10;
      v37 = 2112;
      v38 = v11;
      v39 = 2112;
      v40 = a6;
      v41 = 2112;
      v42 = a5;
      _os_log_impl(&dword_1A4C7F000, v34, OS_LOG_TYPE_ERROR, "Passed in bogus info to FTIDSMessage (%@:%@:%@:%@)", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }

}

- (BOOL)wantsBagKey
{
  return 1;
}

- (BOOL)wantsHTTPHeaders
{
  return 1;
}

- (BOOL)wantsCompressedBody
{
  return 1;
}

- (BOOL)wantsSignature
{
  return 1;
}

- (BOOL)wantsBodySignature
{
  return 1;
}

- (BOOL)wantsBAASigning
{
  return 1;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (BOOL)wantsIDSServer
{
  return 1;
}

- (BOOL)wantsIDSProtocolVersion
{
  return 1;
}

- (int64_t)command
{
  return 96;
}

- (int64_t)responseCommand
{
  return 97;
}

- (id)retryCountKey
{
  return CFSTR("retry-count");
}

- (id)additionalMessageHeaders
{
  void *v3;
  const char *v4;
  uint64_t v5;
  __CFDictionary *Mutable;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FTIDSMessage;
  -[IDSBaseMessage additionalMessageHeaders](&v23, sel_additionalMessageHeaders);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5);

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if ((objc_msgSend__usingOutgoingPush(self, v7, v8) & 1) == 0)
  {
    objc_msgSend_pushToken(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__FTStringFromBaseData(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      CFDictionarySetValue(Mutable, CFSTR("x-push-token"), v14);

  }
  if (objc_msgSend_wantsIDSProtocolVersion(self, v9, v10))
  {
    _IDSIDProtocolVersionNumber();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringValue(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      CFDictionarySetValue(Mutable, CFSTR("x-protocol-version"), v20);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_1A4CBB580();
    }

  }
  objc_msgSend_selfURI(self, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    CFDictionarySetValue(Mutable, CFSTR("x-id-self-uri"), v21);

  return Mutable;
}

- (id)additionalMessageHeadersForOutgoingPush
{
  void *v3;
  const char *v4;
  uint64_t v5;
  __CFDictionary *Mutable;
  const char *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FTIDSMessage;
  -[IDSBaseMessage additionalMessageHeadersForOutgoingPush](&v11, sel_additionalMessageHeadersForOutgoingPush);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5);

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  objc_msgSend_selfURI(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(Mutable, CFSTR("x-id-self-uri"), v9);

  return Mutable;
}

- (NSData)pushCertificate
{
  return self->_pushCert;
}

- (void)setPushCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (__SecKey)identityPrivateKey
{
  return self->_identityKey;
}

- (NSData)IDCertificate
{
  return self->_identityCert;
}

- (void)setIDCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (__SecKey)identityPublicKey
{
  return self->_identityPublicKey;
}

- (__SecKey)pushPrivateKey
{
  return self->_pushKey;
}

- (__SecKey)pushPublicKey
{
  return self->_pushPublicKey;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSString)selfURI
{
  return self->_selfURI;
}

- (void)setSelfURI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSMutableArray)certDataArray
{
  return self->_certDataArray;
}

- (void)setCertDataArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSMutableArray)publicKeyArray
{
  return self->_publicKeyArray;
}

- (void)setPublicKeyArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSMutableArray)privateKeyArray
{
  return self->_privateKeyArray;
}

- (void)setPrivateKeyArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSMutableArray)userIDArray
{
  return self->_userIDArray;
}

- (void)setUserIDArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (id)serverTimestamp
{
  return self->_serverTimestamp;
}

- (void)setServerTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (id)serverTimestampReceivedDate
{
  return self->_serverTimestampReceivedDate;
}

- (void)setServerTimestampReceivedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (BOOL)wantsPushSignatures
{
  return self->_wantsPushSignatures;
}

- (void)setWantsPushSignatures:(BOOL)a3
{
  self->_wantsPushSignatures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverTimestampReceivedDate, 0);
  objc_storeStrong((id *)&self->_serverTimestamp, 0);
  objc_storeStrong((id *)&self->_userIDArray, 0);
  objc_storeStrong((id *)&self->_privateKeyArray, 0);
  objc_storeStrong((id *)&self->_publicKeyArray, 0);
  objc_storeStrong((id *)&self->_certDataArray, 0);
  objc_storeStrong((id *)&self->_selfURI, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_identityCert, 0);
  objc_storeStrong((id *)&self->_pushCert, 0);
}

@end
