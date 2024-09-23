@implementation IDSCertifiedDeliveryContext

- (IDSCertifiedDeliveryContext)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  const char *v5;
  IDSCertifiedDeliveryContext *v6;
  double v7;
  uint64_t v8;
  NSString *originalGUID;
  const char *v10;
  double v11;
  uint64_t v12;
  NSString *service;
  const char *v14;
  double v15;
  const char *v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  double v22;
  uint64_t v23;
  IDSCertifiedDeliveryReplayKey *replayKey;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  const char *v35;
  double v36;
  uint64_t v37;
  NSData *certifiedDeliveryRTS;
  const char *v39;
  double v40;
  uint64_t v41;
  NSData *senderToken;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  double v50;
  uint64_t v51;
  NSDictionary *deliveryStatusContext;
  const char *v53;
  double v54;
  uint64_t v55;
  NSString *localURI;
  const char *v57;
  double v58;
  uint64_t v59;
  NSString *remoteURI;
  const char *v61;
  double v62;
  uint64_t v63;
  NSData *queryHash;
  const char *v65;
  double v66;
  uint64_t v67;
  NSNumber *failureReason;
  const char *v69;
  double v70;
  uint64_t v71;
  NSString *failureReasonMessage;
  objc_super v74;

  v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)IDSCertifiedDeliveryContext;
  v6 = -[IDSCertifiedDeliveryContext init](&v74, sel_init);
  if (v6)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("IDSCertifiedDeliveryContextGUIDKey"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    originalGUID = v6->_originalGUID;
    v6->_originalGUID = (NSString *)v8;

    objc_msgSend_objectForKeyedSubscript_(v4, v10, (uint64_t)CFSTR("IDSCertifiedDeliveryContextServiceKey"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    service = v6->_service;
    v6->_service = (NSString *)v12;

    objc_msgSend_objectForKeyedSubscript_(v4, v14, (uint64_t)CFSTR("IDSCertifiedDeliveryContextReplayKeyKey"), v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v19 = (void *)MEMORY[0x1E0CB3710];
      v20 = objc_opt_class();
      objc_msgSend_unarchivedObjectOfClass_fromData_error_(v19, v21, v20, v22, v17, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      replayKey = v6->_replayKey;
      v6->_replayKey = (IDSCertifiedDeliveryReplayKey *)v23;

    }
    objc_msgSend_objectForKeyedSubscript_(v4, v16, (uint64_t)CFSTR("IDSCertifiedDeliveryContextOriginalEncryptionTypeKey"), v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_originalEncryptionType = objc_msgSend_integerValue(v25, v26, v27, v28);

    objc_msgSend_objectForKeyedSubscript_(v4, v29, (uint64_t)CFSTR("IDSCertifiedDeliveryContextVersionKey"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_certifiedDeliveryVersion = objc_msgSend_integerValue(v31, v32, v33, v34);

    objc_msgSend_objectForKeyedSubscript_(v4, v35, (uint64_t)CFSTR("IDSCertifiedDeliveryContextRTSKey"), v36);
    v37 = objc_claimAutoreleasedReturnValue();
    certifiedDeliveryRTS = v6->_certifiedDeliveryRTS;
    v6->_certifiedDeliveryRTS = (NSData *)v37;

    objc_msgSend_objectForKeyedSubscript_(v4, v39, (uint64_t)CFSTR("IDSCertifiedDeliveryContextSenderTokenKey"), v40);
    v41 = objc_claimAutoreleasedReturnValue();
    senderToken = v6->_senderToken;
    v6->_senderToken = (NSData *)v41;

    objc_msgSend_objectForKeyedSubscript_(v4, v43, (uint64_t)CFSTR("IDSCertifiedDeliveryContextGenerateDeliveryReceiptKey"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_generateDeliveryReceipt = objc_msgSend_BOOLValue(v45, v46, v47, v48);

    objc_msgSend_objectForKeyedSubscript_(v4, v49, (uint64_t)CFSTR("IDSCertifiedDeliveryContextDeliveryStatusContextKey"), v50);
    v51 = objc_claimAutoreleasedReturnValue();
    deliveryStatusContext = v6->_deliveryStatusContext;
    v6->_deliveryStatusContext = (NSDictionary *)v51;

    objc_msgSend_objectForKeyedSubscript_(v4, v53, (uint64_t)CFSTR("IDSCertifiedDeliveryContextLocalURIKey"), v54);
    v55 = objc_claimAutoreleasedReturnValue();
    localURI = v6->_localURI;
    v6->_localURI = (NSString *)v55;

    objc_msgSend_objectForKeyedSubscript_(v4, v57, (uint64_t)CFSTR("IDSCertifiedDeliveryContextRemoteURIKey"), v58);
    v59 = objc_claimAutoreleasedReturnValue();
    remoteURI = v6->_remoteURI;
    v6->_remoteURI = (NSString *)v59;

    objc_msgSend_objectForKeyedSubscript_(v4, v61, (uint64_t)CFSTR("IDSCertifiedDeliveryContextQueryHashKey"), v62);
    v63 = objc_claimAutoreleasedReturnValue();
    queryHash = v6->_queryHash;
    v6->_queryHash = (NSData *)v63;

    objc_msgSend_objectForKeyedSubscript_(v4, v65, (uint64_t)CFSTR("IDSCertifiedDeliveryContextFailureReasonKey"), v66);
    v67 = objc_claimAutoreleasedReturnValue();
    failureReason = v6->_failureReason;
    v6->_failureReason = (NSNumber *)v67;

    objc_msgSend_objectForKeyedSubscript_(v4, v69, (uint64_t)CFSTR("IDSCertifiedDeliveryContextFailureReasonMessageKey"), v70);
    v71 = objc_claimAutoreleasedReturnValue();
    failureReasonMessage = v6->_failureReasonMessage;
    v6->_failureReasonMessage = (NSString *)v71;

  }
  return v6;
}

- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 certifiedDeliveryVersion:(int64_t)a5 certifiedDeliveryRTS:(id)a6 senderToken:(id)a7
{
  char v8;

  v8 = 0;
  return (IDSCertifiedDeliveryContext *)objc_msgSend_initWithGUID_service_encryptionType_certifiedDeliveryVersion_certifiedDeliveryRTS_senderToken_failureReason_failureReasonMessage_replayKey_generateDeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash_(self, a2, (uint64_t)a3, 0.0, a4, 2, a5, a6, a7, 0, 0, 0, v8, 0, 0, 0, 0);
}

- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 encryptionType:(int64_t)a5 certifiedDeliveryVersion:(int64_t)a6 certifiedDeliveryRTS:(id)a7 senderToken:(id)a8 localURI:(id)a9 remoteURI:(id)a10
{
  double v10;
  char v12;

  v12 = 0;
  return (IDSCertifiedDeliveryContext *)objc_msgSend_initWithGUID_service_encryptionType_certifiedDeliveryVersion_certifiedDeliveryRTS_senderToken_failureReason_failureReasonMessage_replayKey_generateDeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash_(self, a2, (uint64_t)a3, v10, a4, a5, a6, a7, a8, 0, 0, 0, v12, 0, a9, a10, 0);
}

- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 encryptionType:(int64_t)a5 certifiedDeliveryVersion:(int64_t)a6 certifiedDeliveryRTS:(id)a7 senderToken:(id)a8 failureReason:(id)a9 failureReasonMessage:(id)a10
{
  char v11;

  v11 = 0;
  return (IDSCertifiedDeliveryContext *)objc_msgSend_initWithGUID_service_encryptionType_certifiedDeliveryVersion_certifiedDeliveryRTS_senderToken_failureReason_failureReasonMessage_replayKey_generateDeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash_(self, a2, (uint64_t)a3, 0.0, a4, a5, a6, a7, a8, a9, a10, 0, v11, 0, 0, 0, 0);
}

- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 encryptionType:(int64_t)a5 certifiedDeliveryVersion:(int64_t)a6 certifiedDeliveryRTS:(id)a7 senderToken:(id)a8 localURI:(id)a9 remoteURI:(id)a10 replayKey:(id)a11
{
  double v11;
  char v13;

  v13 = 0;
  return (IDSCertifiedDeliveryContext *)objc_msgSend_initWithGUID_service_encryptionType_certifiedDeliveryVersion_certifiedDeliveryRTS_senderToken_failureReason_failureReasonMessage_replayKey_generateDeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash_(self, a2, (uint64_t)a3, v11, a4, a5, a6, a7, a8, 0, 0, a11, v13, 0, a9, a10, 0);
}

- (IDSCertifiedDeliveryContext)initWithCertifiedDeliveryContext:(id)a3 queryHash:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  char DeliveryReceipt;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  void *v52;
  const char *v53;
  double v54;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  IDSCertifiedDeliveryContext *DeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash;
  void *v63;
  void *v64;

  v6 = a4;
  v7 = a3;
  objc_msgSend_originalGUID(v7, v8, v9, v10);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_service(v7, v11, v12, v13);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend_originalEncryptionType(v7, v14, v15, v16);
  v60 = objc_msgSend_certifiedDeliveryVersion(v7, v17, v18, v19);
  objc_msgSend_certifiedDeliveryRTS(v7, v20, v21, v22);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_senderToken(v7, v23, v24, v25);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_failureReason(v7, v26, v27, v28);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_failureReasonMessage(v7, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_replayKey(v7, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  DeliveryReceipt = objc_msgSend_generateDeliveryReceipt(v7, v37, v38, v39);
  objc_msgSend_deliveryStatusContext(v7, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localURI(v7, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteURI(v7, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = DeliveryReceipt;
  DeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash = (IDSCertifiedDeliveryContext *)objc_msgSend_initWithGUID_service_encryptionType_certifiedDeliveryVersion_certifiedDeliveryRTS_senderToken_failureReason_failureReasonMessage_replayKey_generateDeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash_(self, v53, (uint64_t)v64, v54, v63, v61, v60, v59, v58, v57, v32, v36, v56, v44, v48, v52, v6);

  return DeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash;
}

- (IDSCertifiedDeliveryContext)initWithGUID:(id)a3 service:(id)a4 encryptionType:(int64_t)a5 certifiedDeliveryVersion:(int64_t)a6 certifiedDeliveryRTS:(id)a7 senderToken:(id)a8 failureReason:(id)a9 failureReasonMessage:(id)a10 replayKey:(id)a11 generateDeliveryReceipt:(BOOL)a12 deliveryStatusContext:(id)a13 localURI:(id)a14 remoteURI:(id)a15 queryHash:(id)a16
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  IDSCertifiedDeliveryContext *v24;
  IDSCertifiedDeliveryContext *v25;
  id v30;
  id v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v34 = a3;
  v33 = a4;
  v30 = a7;
  v19 = a7;
  v31 = a8;
  v38 = a8;
  v37 = a9;
  v36 = a10;
  v35 = a11;
  v20 = a13;
  v21 = a14;
  v22 = a15;
  v23 = a16;
  v39.receiver = self;
  v39.super_class = (Class)IDSCertifiedDeliveryContext;
  v24 = -[IDSCertifiedDeliveryContext init](&v39, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_originalGUID, a3);
    objc_storeStrong((id *)&v25->_service, a4);
    v25->_originalEncryptionType = a5;
    v25->_certifiedDeliveryVersion = a6;
    objc_storeStrong((id *)&v25->_certifiedDeliveryRTS, v30);
    objc_storeStrong((id *)&v25->_senderToken, v31);
    objc_storeStrong((id *)&v25->_failureReason, a9);
    objc_storeStrong((id *)&v25->_failureReasonMessage, a10);
    objc_storeStrong((id *)&v25->_replayKey, a11);
    v25->_generateDeliveryReceipt = a12;
    objc_storeStrong((id *)&v25->_deliveryStatusContext, a13);
    objc_storeStrong((id *)&v25->_localURI, a14);
    objc_storeStrong((id *)&v25->_remoteURI, a15);
    objc_storeStrong((id *)&v25->_queryHash, a16);
  }

  return v25;
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  NSString *v4;
  NSString *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  NSData *v12;
  NSData *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  NSNumber *failureReason;
  NSString *failureReasonMessage;
  void *v21;
  NSDictionary *deliveryStatusContext;
  NSString *v23;
  NSString *v24;
  NSData *queryHash;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = self->_originalGUID;
  if (v4)
  {
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextGUIDKey"), v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF8A5C();
  }

  v5 = self->_service;
  if (v5)
  {
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextServiceKey"), v5);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF89DC();
  }

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v6, self->_originalEncryptionType, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextOriginalEncryptionTypeKey"), v8);

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v9, self->_certifiedDeliveryVersion, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextVersionKey"), v11);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF895C();
  }

  v12 = self->_certifiedDeliveryRTS;
  if (v12)
  {
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextRTSKey"), v12);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF88DC();
  }

  v13 = self->_senderToken;
  if (v13)
  {
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextSenderTokenKey"), v13);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF885C();
  }

  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v14, (uint64_t)self->_replayKey, v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextReplayKeyKey"), v16);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF87DC();
  }

  failureReason = self->_failureReason;
  if (failureReason)
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextFailureReasonKey"), failureReason);
  failureReasonMessage = self->_failureReasonMessage;
  if (failureReasonMessage)
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextFailureReasonMessageKey"), failureReasonMessage);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v17, self->_generateDeliveryReceipt, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextGenerateDeliveryReceiptKey"), v21);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF875C();
  }

  deliveryStatusContext = self->_deliveryStatusContext;
  if (deliveryStatusContext)
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextDeliveryStatusContextKey"), deliveryStatusContext);
  v23 = self->_localURI;
  if (v23)
  {
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextLocalURIKey"), v23);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF86DC();
  }

  v24 = self->_remoteURI;
  if (v24)
  {
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextRemoteURIKey"), v24);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAF865C();
  }

  queryHash = self->_queryHash;
  if (queryHash)
    CFDictionarySetValue(v3, CFSTR("IDSCertifiedDeliveryContextQueryHashKey"), queryHash);
  return (NSDictionary *)v3;
}

- (IDSCertifiedDeliveryContext)initWithDataRepresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  IDSCertifiedDeliveryContext *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  double v13;
  NSObject *v14;
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = objc_opt_class();
  v16 = 0;
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v5, v7, v6, v8, v4, &v16);
  v9 = (IDSCertifiedDeliveryContext *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  if (!v9)
  {
    objc_msgSend_delivery(IDSFoundationLog, v10, v11, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_19BAF8ADC((uint64_t)v4, (uint64_t)v12, v14);

  }
  return v9;
}

- (id)dataRepresentation
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  NSObject *v8;
  id v10;

  v10 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], a2, (uint64_t)self, v2, 1, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (!v3)
  {
    objc_msgSend_delivery(IDSFoundationLog, v4, v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_19BAF8B5C((uint64_t)v6, v8);

  }
  return v3;
}

- (IDSCertifiedDeliveryContext)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  uint64_t v18;
  const char *v19;
  double v20;
  uint64_t v21;
  const char *v22;
  double v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  double v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  char v35;
  uint64_t v36;
  const char *v37;
  double v38;
  uint64_t v39;
  const char *v40;
  double v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  double v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  double v49;
  void *v50;
  const char *v51;
  double v52;
  char v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  uint64_t v60;
  IDSCertifiedDeliveryContext *DeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash;
  void *v62;

  v3 = a3;
  v4 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v5, v4, v6, CFSTR("IDSCertifiedDeliveryContextGUIDKey"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v8, v7, v9, CFSTR("IDSCertifiedDeliveryContextServiceKey"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_decodeIntegerForKey_(v3, v10, (uint64_t)CFSTR("IDSCertifiedDeliveryContextOriginalEncryptionTypeKey"), v11);
  v60 = objc_msgSend_decodeIntegerForKey_(v3, v13, (uint64_t)CFSTR("IDSCertifiedDeliveryContextVersionKey"), v14);
  v15 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v16, v15, v17, CFSTR("IDSCertifiedDeliveryContextRTSKey"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v19, v18, v20, CFSTR("IDSCertifiedDeliveryContextSenderTokenKey"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v22, v21, v23, CFSTR("IDSCertifiedDeliveryContextFailureReasonKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v26, v25, v27, CFSTR("IDSCertifiedDeliveryContextFailureReasonMessageKey"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v30, v29, v31, CFSTR("IDSCertifiedDeliveryContextReplayKeyKey"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_decodeBoolForKey_(v3, v33, (uint64_t)CFSTR("IDSCertifiedDeliveryContextGenerateDeliveryReceiptKey"), v34);
  v36 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v37, v36, v38, CFSTR("IDSCertifiedDeliveryContextDeliveryStatusContextKey"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v40, v39, v41, CFSTR("IDSCertifiedDeliveryContextLocalURIKey"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v44, v43, v45, CFSTR("IDSCertifiedDeliveryContextRemoteURIKey"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v48, v47, v49, CFSTR("IDSCertifiedDeliveryContextQueryHashKey"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = v35;
  DeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash = (IDSCertifiedDeliveryContext *)objc_msgSend_initWithGUID_service_encryptionType_certifiedDeliveryVersion_certifiedDeliveryRTS_senderToken_failureReason_failureReasonMessage_replayKey_generateDeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash_(self, v51, (uint64_t)v56, v52, v62, v12, v60, v59, v58, v24, v28, v32, v54, v55, v42, v46, v50);

  return DeliveryReceipt_deliveryStatusContext_localURI_remoteURI_queryHash;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *originalGUID;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  id v33;

  originalGUID = self->_originalGUID;
  v33 = a3;
  objc_msgSend_encodeObject_forKey_(v33, v5, (uint64_t)originalGUID, v6, CFSTR("IDSCertifiedDeliveryContextGUIDKey"));
  objc_msgSend_encodeObject_forKey_(v33, v7, (uint64_t)self->_service, v8, CFSTR("IDSCertifiedDeliveryContextServiceKey"));
  objc_msgSend_encodeInteger_forKey_(v33, v9, self->_originalEncryptionType, v10, CFSTR("IDSCertifiedDeliveryContextOriginalEncryptionTypeKey"));
  objc_msgSend_encodeInteger_forKey_(v33, v11, self->_certifiedDeliveryVersion, v12, CFSTR("IDSCertifiedDeliveryContextVersionKey"));
  objc_msgSend_encodeObject_forKey_(v33, v13, (uint64_t)self->_certifiedDeliveryRTS, v14, CFSTR("IDSCertifiedDeliveryContextRTSKey"));
  objc_msgSend_encodeObject_forKey_(v33, v15, (uint64_t)self->_senderToken, v16, CFSTR("IDSCertifiedDeliveryContextSenderTokenKey"));
  objc_msgSend_encodeObject_forKey_(v33, v17, (uint64_t)self->_failureReason, v18, CFSTR("IDSCertifiedDeliveryContextFailureReasonKey"));
  objc_msgSend_encodeObject_forKey_(v33, v19, (uint64_t)self->_failureReasonMessage, v20, CFSTR("IDSCertifiedDeliveryContextFailureReasonMessageKey"));
  objc_msgSend_encodeObject_forKey_(v33, v21, (uint64_t)self->_replayKey, v22, CFSTR("IDSCertifiedDeliveryContextReplayKeyKey"));
  objc_msgSend_encodeBool_forKey_(v33, v23, self->_generateDeliveryReceipt, v24, CFSTR("IDSCertifiedDeliveryContextGenerateDeliveryReceiptKey"));
  objc_msgSend_encodeObject_forKey_(v33, v25, (uint64_t)self->_deliveryStatusContext, v26, CFSTR("IDSCertifiedDeliveryContextDeliveryStatusContextKey"));
  objc_msgSend_encodeObject_forKey_(v33, v27, (uint64_t)self->_localURI, v28, CFSTR("IDSCertifiedDeliveryContextLocalURIKey"));
  objc_msgSend_encodeObject_forKey_(v33, v29, (uint64_t)self->_remoteURI, v30, CFSTR("IDSCertifiedDeliveryContextRemoteURIKey"));
  objc_msgSend_encodeObject_forKey_(v33, v31, (uint64_t)self->_queryHash, v32, CFSTR("IDSCertifiedDeliveryContextQueryHashKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *originalGUID;
  NSString *service;
  int64_t certifiedDeliveryVersion;
  NSData *senderToken;
  const __CFString *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  originalGUID = self->_originalGUID;
  service = self->_service;
  certifiedDeliveryVersion = self->_certifiedDeliveryVersion;
  senderToken = self->_senderToken;
  if (self->_generateDeliveryReceipt)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  IDSLoggableDescriptionForHandleOnService(self->_localURI, self->_service);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IDSLoggableDescriptionForHandleOnService(self->_remoteURI, self->_service);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v12, (uint64_t)CFSTR("<%@: %p guid: %@, service: %@, version: %lu, senderToken: %@, generateDeliveryReceipt: %@, localURI: %@, remoteURI: %@, failureReason: %@, failureReasonMessage: %@, rts: %@, replayKey: %@, queryHash: %@, deliveryStatusContext: %@>"), *(double *)&self->_failureReason, v4, self, originalGUID, service, certifiedDeliveryVersion, senderToken, v9, v10, v11, self->_failureReason, self->_failureReasonMessage, self->_certifiedDeliveryRTS, self->_replayKey, self->_queryHash, self->_deliveryStatusContext);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)originalGUID
{
  return self->_originalGUID;
}

- (int64_t)originalEncryptionType
{
  return self->_originalEncryptionType;
}

- (NSString)service
{
  return self->_service;
}

- (int64_t)certifiedDeliveryVersion
{
  return self->_certifiedDeliveryVersion;
}

- (NSData)certifiedDeliveryRTS
{
  return self->_certifiedDeliveryRTS;
}

- (NSData)senderToken
{
  return self->_senderToken;
}

- (NSNumber)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(id)a3
{
  objc_storeStrong((id *)&self->_failureReason, a3);
}

- (NSString)failureReasonMessage
{
  return self->_failureReasonMessage;
}

- (void)setFailureReasonMessage:(id)a3
{
  objc_storeStrong((id *)&self->_failureReasonMessage, a3);
}

- (IDSCertifiedDeliveryReplayKey)replayKey
{
  return self->_replayKey;
}

- (BOOL)generateDeliveryReceipt
{
  return self->_generateDeliveryReceipt;
}

- (void)setGenerateDeliveryReceipt:(BOOL)a3
{
  self->_generateDeliveryReceipt = a3;
}

- (NSDictionary)deliveryStatusContext
{
  return self->_deliveryStatusContext;
}

- (void)setDeliveryStatusContext:(id)a3
{
  objc_storeStrong((id *)&self->_deliveryStatusContext, a3);
}

- (NSString)localURI
{
  return self->_localURI;
}

- (NSString)remoteURI
{
  return self->_remoteURI;
}

- (NSData)queryHash
{
  return self->_queryHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryHash, 0);
  objc_storeStrong((id *)&self->_remoteURI, 0);
  objc_storeStrong((id *)&self->_localURI, 0);
  objc_storeStrong((id *)&self->_deliveryStatusContext, 0);
  objc_storeStrong((id *)&self->_replayKey, 0);
  objc_storeStrong((id *)&self->_failureReasonMessage, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_senderToken, 0);
  objc_storeStrong((id *)&self->_certifiedDeliveryRTS, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_originalGUID, 0);
}

@end
