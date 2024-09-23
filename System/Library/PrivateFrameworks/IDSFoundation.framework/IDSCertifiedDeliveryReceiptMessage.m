@implementation IDSCertifiedDeliveryReceiptMessage

- (IDSCertifiedDeliveryReceiptMessage)initWithCertifiedDeliveryContext:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  IDSCertifiedDeliveryReceiptMessage *v7;
  double v8;
  uint64_t v9;
  NSString *originalGUID;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  NSData *senderToken;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  void *certifiedDeliveryVersion;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  NSNumber *failureReason;
  const char *v34;
  uint64_t v35;
  double v36;
  const char *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  NSString *failureReasonMessage;
  const char *v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  NSDictionary *generatedDeliveryStatusContext;
  const char *v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  NSString *localURI;
  const char *v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  NSString *remoteURI;
  NSData *queryHash;
  NSData *encryptedData;
  objc_super v60;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)IDSCertifiedDeliveryReceiptMessage;
  v7 = -[IDSMessage init](&v60, sel_init);
  if (v7)
  {
    objc_msgSend_senderToken(v4, v5, v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    originalGUID = v7->_originalGUID;
    v7->_originalGUID = (NSString *)v9;

    objc_msgSend_certifiedDeliveryRTS(v4, v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    senderToken = v7->_senderToken;
    v7->_senderToken = (NSData *)v14;

    v7->_certifiedDeliveryRTS = (NSData *)objc_msgSend_certifiedDeliveryVersion(v4, v16, v17, v18);
    objc_msgSend_originalGUID(v4, v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(void **)&v7->_generateDeliveryReceipt;
    *(_QWORD *)&v7->_generateDeliveryReceipt = v22;

    objc_msgSend_failureReason(v4, v24, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    certifiedDeliveryVersion = (void *)v7->_certifiedDeliveryVersion;
    v7->_certifiedDeliveryVersion = v27;

    objc_msgSend_failureReasonMessage(v4, v29, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    failureReason = v7->_failureReason;
    v7->_failureReason = (NSNumber *)v32;

    *(&v7->super._wantsCertifiedDelivery + 1) = objc_msgSend_generateDeliveryReceipt(v4, v34, v35, v36);
    objc_msgSend_deliveryStatusContext(v4, v37, v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    failureReasonMessage = v7->_failureReasonMessage;
    v7->_failureReasonMessage = (NSString *)v40;

    objc_msgSend_localURI(v4, v42, v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    generatedDeliveryStatusContext = v7->_generatedDeliveryStatusContext;
    v7->_generatedDeliveryStatusContext = (NSDictionary *)v45;

    objc_msgSend_remoteURI(v4, v47, v48, v49);
    v50 = objc_claimAutoreleasedReturnValue();
    localURI = v7->_localURI;
    v7->_localURI = (NSString *)v50;

    objc_msgSend_queryHash(v4, v52, v53, v54);
    v55 = objc_claimAutoreleasedReturnValue();
    remoteURI = v7->_remoteURI;
    v7->_remoteURI = (NSString *)v55;

    queryHash = v7->_queryHash;
    v7->_queryHash = 0;

    encryptedData = v7->_encryptedData;
    v7->_encryptedData = 0;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  uint64_t v38;
  double v39;
  void *v40;
  const char *v41;
  double v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  const char *v49;
  uint64_t v50;
  double v51;
  void *v52;
  const char *v53;
  double v54;
  const char *v55;
  uint64_t v56;
  double v57;
  void *v58;
  const char *v59;
  double v60;
  const char *v61;
  uint64_t v62;
  double v63;
  void *v64;
  const char *v65;
  double v66;
  objc_super v68;

  v68.receiver = self;
  v68.super_class = (Class)IDSCertifiedDeliveryReceiptMessage;
  v4 = -[IDSMessage copyWithZone:](&v68, sel_copyWithZone_, a3);
  v8 = (void *)objc_msgSend_copy(self->_originalGUID, v5, v6, v7);
  objc_msgSend_setSenderToken_(v4, v9, (uint64_t)v8, v10);

  v14 = (void *)objc_msgSend_copy(self->_senderToken, v11, v12, v13);
  objc_msgSend_setCertifiedDeliveryRTS_(v4, v15, (uint64_t)v14, v16);

  objc_msgSend_setCertifiedDeliveryVersion_(v4, v17, (uint64_t)self->_certifiedDeliveryRTS, v18);
  v22 = (void *)objc_msgSend_copy(*(void **)&self->_generateDeliveryReceipt, v19, v20, v21);
  objc_msgSend_setOriginalGUID_(v4, v23, (uint64_t)v22, v24);

  objc_msgSend_setFailureReason_(v4, v25, self->_certifiedDeliveryVersion, v26);
  v30 = (void *)objc_msgSend_copy(self->_failureReason, v27, v28, v29);
  objc_msgSend_setFailureReasonMessage_(v4, v31, (uint64_t)v30, v32);

  objc_msgSend_setGenerateDeliveryReceipt_(v4, v33, *((unsigned __int8 *)&self->super._wantsCertifiedDelivery + 1), v34);
  objc_msgSend_setGeneratedDeliveryStatusContext_(v4, v35, (uint64_t)self->_failureReasonMessage, v36);
  v40 = (void *)objc_msgSend_copy(self->_generatedDeliveryStatusContext, v37, v38, v39);
  objc_msgSend_setLocalURI_(v4, v41, (uint64_t)v40, v42);

  v46 = (void *)objc_msgSend_copy(self->_localURI, v43, v44, v45);
  objc_msgSend_setRemoteURI_(v4, v47, (uint64_t)v46, v48);

  v52 = (void *)objc_msgSend_copy(self->_remoteURI, v49, v50, v51);
  objc_msgSend_setQueryHash_(v4, v53, (uint64_t)v52, v54);

  v58 = (void *)objc_msgSend_copy(self->_queryHash, v55, v56, v57);
  objc_msgSend_setEncryptedData_(v4, v59, (uint64_t)v58, v60);

  v64 = (void *)objc_msgSend_copy(self->_encryptedData, v61, v62, v63);
  objc_msgSend_setEncryptionType_(v4, v65, (uint64_t)v64, v66);

  return v4;
}

- (int64_t)command
{
  return 109;
}

- (BOOL)wantsResponse
{
  return 0;
}

- (int64_t)responseCommand
{
  return 109;
}

- (id)requiredKeys
{
  id v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_addObject_(v2, v3, (uint64_t)CFSTR("U"), v4);
  objc_msgSend_addObject_(v2, v5, (uint64_t)CFSTR("cdr"), v6);
  objc_msgSend_addObject_(v2, v7, (uint64_t)CFSTR("cdv"), v8);
  return v2;
}

- (id)messageBody
{
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  __CFDictionary *v7;
  id v8;
  NSData *v9;
  const char *v10;
  double v11;
  NSString *originalGUID;
  void *v13;
  const char *v14;
  double v15;
  const void *certifiedDeliveryVersion;
  NSNumber *failureReason;
  void *v18;
  NSString *failureReasonMessage;
  NSDictionary *v20;
  NSString *v21;
  NSString *remoteURI;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)IDSCertifiedDeliveryReceiptMessage;
  -[IDSMessage messageBody](&v32, sel_messageBody);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5, v6);

  IDSGetUUIDData(*(void **)&self->_generateDeliveryReceipt);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    CFDictionarySetValue(v7, CFSTR("U"), v8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF84C0();
  }

  v9 = self->_senderToken;
  if (v9)
  {
    CFDictionarySetValue(v7, CFSTR("cdr"), v9);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF8440();
  }

  originalGUID = self->_originalGUID;
  if (originalGUID)
    CFDictionarySetValue(v7, CFSTR("t"), originalGUID);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v10, (uint64_t)self->_certifiedDeliveryRTS, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    CFDictionarySetValue(v7, CFSTR("cdv"), v13);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF83C0();
  }

  certifiedDeliveryVersion = (const void *)self->_certifiedDeliveryVersion;
  if (certifiedDeliveryVersion)
    CFDictionarySetValue(v7, CFSTR("fR"), certifiedDeliveryVersion);
  failureReason = self->_failureReason;
  if (failureReason)
    CFDictionarySetValue(v7, CFSTR("fRM"), failureReason);
  if (*(&self->super._wantsCertifiedDelivery + 1))
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v14, 1, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      CFDictionarySetValue(v7, CFSTR("gd"), v18);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAF8340();
    }

    failureReasonMessage = self->_failureReasonMessage;
    if (failureReasonMessage)
      CFDictionarySetValue(v7, CFSTR("Dc"), failureReasonMessage);
    v20 = self->_generatedDeliveryStatusContext;
    if (v20)
    {
      CFDictionarySetValue(v7, CFSTR("sP"), v20);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAF82C0();
    }

    v21 = self->_localURI;
    if (v21)
    {
      CFDictionarySetValue(v7, CFSTR("tP"), v21);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAF8240();
    }

    remoteURI = self->_remoteURI;
    if (remoteURI)
      CFDictionarySetValue(v7, CFSTR("qH"), remoteURI);
    if (_os_feature_enabled_impl())
    {
      objc_msgSend_encryptedData(self, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        CFDictionarySetValue(v7, CFSTR("P"), v26);

      objc_msgSend_encryptionType(self, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
        CFDictionarySetValue(v7, CFSTR("E"), v30);

    }
  }

  return v7;
}

- (NSString)originalGUID
{
  return *(NSString **)&self->_generateDeliveryReceipt;
}

- (void)setOriginalGUID:(id)a3
{
  objc_storeStrong((id *)&self->_generateDeliveryReceipt, a3);
}

- (NSData)senderToken
{
  return (NSData *)self->_originalGUID;
}

- (void)setSenderToken:(id)a3
{
  objc_storeStrong((id *)&self->_originalGUID, a3);
}

- (NSData)certifiedDeliveryRTS
{
  return self->_senderToken;
}

- (void)setCertifiedDeliveryRTS:(id)a3
{
  objc_storeStrong((id *)&self->_senderToken, a3);
}

- (int64_t)certifiedDeliveryVersion
{
  return (int64_t)self->_certifiedDeliveryRTS;
}

- (void)setCertifiedDeliveryVersion:(int64_t)a3
{
  self->_certifiedDeliveryRTS = (NSData *)a3;
}

- (NSNumber)failureReason
{
  return (NSNumber *)self->_certifiedDeliveryVersion;
}

- (void)setFailureReason:(id)a3
{
  objc_storeStrong((id *)&self->_certifiedDeliveryVersion, a3);
}

- (NSString)failureReasonMessage
{
  return (NSString *)&self->_failureReason->super.super.isa;
}

- (void)setFailureReasonMessage:(id)a3
{
  objc_storeStrong((id *)&self->_failureReason, a3);
}

- (BOOL)generateDeliveryReceipt
{
  return *(&self->super._wantsCertifiedDelivery + 1);
}

- (void)setGenerateDeliveryReceipt:(BOOL)a3
{
  *(&self->super._wantsCertifiedDelivery + 1) = a3;
}

- (NSDictionary)generatedDeliveryStatusContext
{
  return (NSDictionary *)self->_failureReasonMessage;
}

- (void)setGeneratedDeliveryStatusContext:(id)a3
{
  objc_storeStrong((id *)&self->_failureReasonMessage, a3);
}

- (NSString)localURI
{
  return (NSString *)&self->_generatedDeliveryStatusContext->super.isa;
}

- (void)setLocalURI:(id)a3
{
  objc_storeStrong((id *)&self->_generatedDeliveryStatusContext, a3);
}

- (NSString)remoteURI
{
  return self->_localURI;
}

- (void)setRemoteURI:(id)a3
{
  objc_storeStrong((id *)&self->_localURI, a3);
}

- (NSData)queryHash
{
  return (NSData *)self->_remoteURI;
}

- (void)setQueryHash:(id)a3
{
  objc_storeStrong((id *)&self->_remoteURI, a3);
}

- (NSData)encryptedData
{
  return self->_queryHash;
}

- (void)setEncryptedData:(id)a3
{
  objc_storeStrong((id *)&self->_queryHash, a3);
}

- (NSString)encryptionType
{
  return (NSString *)&self->_encryptedData->super.isa;
}

- (void)setEncryptionType:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_queryHash, 0);
  objc_storeStrong((id *)&self->_remoteURI, 0);
  objc_storeStrong((id *)&self->_localURI, 0);
  objc_storeStrong((id *)&self->_generatedDeliveryStatusContext, 0);
  objc_storeStrong((id *)&self->_failureReasonMessage, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_certifiedDeliveryVersion, 0);
  objc_storeStrong((id *)&self->_senderToken, 0);
  objc_storeStrong((id *)&self->_originalGUID, 0);
  objc_storeStrong((id *)&self->_generateDeliveryReceipt, 0);
}

@end
