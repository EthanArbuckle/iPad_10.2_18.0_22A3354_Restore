@implementation IDSEndpoint

- (IDSEndpoint)initWithURI:(id)a3 clientData:(id)a4 pushToken:(id)a5 sessionToken:(id)a6 expireDate:(id)a7 refreshDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  IDSEndpointURIProperties *v20;
  const char *v21;
  IDSEndpoint *refreshed;
  char v24;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(IDSEndpointURIProperties);
  v24 = 1;
  refreshed = (IDSEndpoint *)objc_msgSend_initWithURI_clientData_KTLoggableData_KTDeviceSignature_mismatchedAccountFlag_ktCapableFlag_pushToken_sessionToken_expireDate_refreshDate_anonymizedSenderID_verifiedBusiness_serializedPublicMessageProtectionIdentity_queryTimeInterval_serializedNGMDeviceIdentity_serializedNGMDevicePrekey_serializedApplicationPublicKey_endpointURIProperties_familyEndpointData_gameCenterData_(self, v21, (uint64_t)v19, 0.0, v18, 0, 0, 0, 0, v17, v16, v15, v14, 0, v24, 0, 0, 0, 0,
                               v20,
                               0,
                               0);

  return refreshed;
}

- (IDSEndpoint)initWithURI:(id)a3 clientData:(id)a4 KTLoggableData:(id)a5 KTDeviceSignature:(id)a6 mismatchedAccountFlag:(BOOL)a7 ktCapableFlag:(BOOL)a8 pushToken:(id)a9 sessionToken:(id)a10 expireDate:(id)a11 refreshDate:(id)a12 anonymizedSenderID:(id)a13 verifiedBusiness:(BOOL)a14 serializedPublicMessageProtectionIdentity:(id)a15 queryTimeInterval:(double)a16 serializedNGMDeviceIdentity:(id)a17 serializedNGMDevicePrekey:(id)a18 serializedApplicationPublicKey:(id)a19 endpointURIProperties:(id)a20 familyEndpointData:(id)a21 gameCenterData:(id)a22
{
  return (IDSEndpoint *)objc_msgSend_initWithURI_serviceIdentifier_clientData_KTLoggableData_KTDeviceSignature_mismatchedAccountFlag_ktCapableFlag_pushToken_sessionToken_expireDate_refreshDate_anonymizedSenderID_verifiedBusiness_serializedPublicMessageProtectionIdentity_queryTimeInterval_serializedNGMDeviceIdentity_serializedNGMDevicePrekey_serializedApplicationPublicKey_endpointURIProperties_familyEndpointData_gameCenterData_(self, a2, (uint64_t)a3, a16, 0, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a17, a18,
                          a19,
                          a20,
                          a21,
                          a22);
}

- (IDSEndpoint)initWithURI:(id)a3 serviceIdentifier:(id)a4 clientData:(id)a5 KTLoggableData:(id)a6 KTDeviceSignature:(id)a7 mismatchedAccountFlag:(BOOL)a8 ktCapableFlag:(BOOL)a9 pushToken:(id)a10 sessionToken:(id)a11 expireDate:(id)a12 refreshDate:(id)a13 anonymizedSenderID:(id)a14 verifiedBusiness:(BOOL)a15 serializedPublicMessageProtectionIdentity:(id)a16 queryTimeInterval:(double)a17 serializedNGMDeviceIdentity:(id)a18 serializedNGMDevicePrekey:(id)a19 serializedApplicationPublicKey:(id)a20 endpointURIProperties:(id)a21 familyEndpointData:(id)a22 gameCenterData:(id)a23
{
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  IDSEndpointURIProperties *v36;
  id v37;
  IDSEndpoint *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  IDSEndpointCapabilities *v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  void *v50;
  const char *v51;
  double v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  double v56;
  id v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  const char *v62;
  __int16 v64;
  id v65;
  id v66;
  __int16 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v87;

  v84 = a3;
  v83 = a4;
  v28 = a5;
  v73 = a6;
  v82 = a7;
  v29 = a10;
  v87 = a11;
  v85 = a12;
  v30 = v28;
  v31 = a13;
  v32 = a14;
  v33 = a16;
  v34 = a18;
  v35 = a19;
  v81 = a20;
  v36 = (IDSEndpointURIProperties *)a21;
  v79 = a22;
  v37 = a23;
  v38 = 0;
  v77 = v32;
  v74 = v34;
  v75 = v31;
  if (!v30)
  {
    v39 = v82;
    v43 = v85;
    goto LABEL_12;
  }
  v80 = v35;
  v78 = v33;
  v39 = v82;
  if (!v29)
    goto LABEL_10;
  v40 = v34;
  if (!v87)
    goto LABEL_10;
  v41 = v32;
  v42 = v31;
  v43 = v85;
  if (!v85)
  {
LABEL_11:
    v33 = v78;
    v35 = v80;
LABEL_12:
    v58 = v79;
    v59 = v73;
    goto LABEL_18;
  }
  if (!v42)
  {
LABEL_10:
    v43 = v85;
    goto LABEL_11;
  }
  v44 = v42;
  v76 = v37;
  if (!v36)
    v36 = objc_alloc_init(IDSEndpointURIProperties);
  v45 = [IDSEndpointCapabilities alloc];
  v70 = (void *)objc_msgSend_initWithCapabilitiesMap_(v45, v46, (uint64_t)v30, v47);
  objc_msgSend_objectForKeyedSubscript_(v30, v48, (uint64_t)CFSTR("public-message-identity-ngm-version"), v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v30;
  objc_msgSend_objectForKeyedSubscript_(v30, v51, (uint64_t)CFSTR("public-message-identity-version"), v52);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v41;
  if (v50)
    v67 = objc_msgSend_shortValue(v50, v53, v54, v56);
  else
    v67 = -1;
  v58 = v79;
  v68 = v55;
  v69 = v50;
  if (v55)
    v60 = objc_msgSend_shortValue(v55, v53, v54, v56);
  else
    v60 = -1;
  objc_msgSend_pushTokenWithData_withServiceLoggingHint_(IDSPushToken, v53, (uint64_t)v29, v56, v83);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v78;
  v65 = v44;
  v66 = v57;
  v43 = v85;
  HIBYTE(v64) = a9;
  LOBYTE(v64) = a8;
  v39 = v82;
  v38 = (IDSEndpoint *)objc_retain((id)objc_msgSend_initWithURI_capabilities_ngmVersion_legacyVersion_KTLoggableData_KTDeviceSignature_mismatchedAccountFlag_ktCapableFlag_pushTokenObject_sessionToken_expireDate_refreshDate_anonymizedSenderID_verifiedBusiness_serializedPublicMessageProtectionIdentity_queryTimeInterval_serializedNGMDeviceIdentity_serializedNGMDevicePrekey_serializedApplicationPublicKey_endpointURIProperties_familyEndpointData_gameCenterData_(self, v62, (uint64_t)v84, a17, v70, v67, v60, v73, v82, v64, v61, v87, v85, v65, v66, a15, v78, v40, v80,
                                         v81,
                                         v36,
                                         v79,
                                         v76));

  v35 = v80;
  v37 = v76;
  v59 = v73;
  self = v38;
  v30 = v71;
LABEL_18:

  return v38;
}

- (IDSEndpoint)initWithURI:(id)a3 capabilities:(id)a4 ngmVersion:(signed __int16)a5 legacyVersion:(char)a6 KTLoggableData:(id)a7 KTDeviceSignature:(id)a8 mismatchedAccountFlag:(BOOL)a9 ktCapableFlag:(BOOL)a10 pushTokenObject:(id)a11 sessionToken:(id)a12 expireDate:(id)a13 refreshDate:(id)a14 anonymizedSenderID:(id)a15 verifiedBusiness:(BOOL)a16 serializedPublicMessageProtectionIdentity:(id)a17 queryTimeInterval:(double)a18 serializedNGMDeviceIdentity:(id)a19 serializedNGMDevicePrekey:(id)a20 serializedApplicationPublicKey:(id)a21 endpointURIProperties:(id)a22 familyEndpointData:(id)a23 gameCenterData:(id)a24
{
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  IDSEndpointURIProperties *v34;
  id v35;
  id v36;
  IDSEndpoint *v37;
  void *v38;
  IDSEndpoint *v39;
  IDSEndpoint *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  NSData *KTLoggableData;
  const char *v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  NSData *KTDeviceSignature;
  const char *v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  NSData *sessionToken;
  const char *v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  NSString *senderCorrelationIdentifier;
  const char *v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  NSString *shortHandle;
  IDSEndpoint *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v72;
  id v74;
  id v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  objc_super v89;

  v81 = a3;
  v74 = a4;
  v28 = a4;
  v86 = a7;
  v85 = a8;
  v29 = a11;
  v30 = v28;
  v31 = a12;
  v88 = a13;
  v87 = a14;
  v80 = a15;
  v79 = a17;
  v78 = a19;
  v32 = a20;
  v33 = a21;
  v34 = (IDSEndpointURIProperties *)a22;
  v35 = a23;
  v36 = a24;
  v37 = 0;
  v82 = v30;
  v84 = v31;
  v83 = v35;
  if (v30 && v29 && v31 && v88 && v87)
  {
    v72 = v36;
    if (!v34)
      v34 = objc_alloc_init(IDSEndpointURIProperties);
    v38 = v32;
    v89.receiver = self;
    v89.super_class = (Class)IDSEndpoint;
    v39 = -[IDSEndpoint init](&v89, sel_init);
    v40 = v39;
    if (v39)
    {
      v39->_queryTimeInterval = a18;
      objc_storeStrong((id *)&v39->_URI, a3);
      v44 = objc_msgSend_copy(v86, v41, v42, v43);
      KTLoggableData = v40->_KTLoggableData;
      v40->_KTLoggableData = (NSData *)v44;

      v49 = objc_msgSend_copy(v85, v46, v47, v48);
      KTDeviceSignature = v40->_KTDeviceSignature;
      v40->_KTDeviceSignature = (NSData *)v49;

      v40->_mismatchedAccountFlag = a9;
      v40->_ktCapableFlag = a10;
      objc_storeStrong((id *)&v40->_pushTokenObject, a11);
      v54 = objc_msgSend_copy(v31, v51, v52, v53);
      sessionToken = v40->_sessionToken;
      v40->_sessionToken = (NSData *)v54;

      objc_storeStrong((id *)&v40->_expireDate, a13);
      objc_storeStrong((id *)&v40->_refreshDate, a14);
      objc_storeStrong((id *)&v40->_anonymizedSenderID, a15);
      v40->_verifiedBusiness = a16;
      objc_msgSend_senderCorrelationIdentifier(v34, v56, v57, v58);
      v59 = objc_claimAutoreleasedReturnValue();
      senderCorrelationIdentifier = v40->_senderCorrelationIdentifier;
      v40->_senderCorrelationIdentifier = (NSString *)v59;

      objc_msgSend_shortHandle(v34, v61, v62, v63);
      v64 = objc_claimAutoreleasedReturnValue();
      shortHandle = v40->_shortHandle;
      v40->_shortHandle = (NSString *)v64;

      objc_storeStrong((id *)&v40->_capabilities, v74);
      objc_storeStrong((id *)&v40->_serializedLegacyPublicIdentity, a17);
      objc_storeStrong((id *)&v40->_serializedNGMDevicePrekey, a20);
      objc_storeStrong((id *)&v40->_serializedApplicationPublicKey, a21);
      objc_storeStrong((id *)&v40->_serializedNGMDeviceIdentity, a19);
      v40->_ngmVersion = a5;
      v40->_legacyVersion = a6;
      objc_storeStrong((id *)&v40->_familyEndpointData, a23);
      objc_storeStrong((id *)&v40->_gameCenterData, a24);
    }
    v66 = v40;
    v37 = v66;
    v68 = v80;
    v67 = v81;
    v70 = v78;
    v69 = v79;
    v36 = v72;
  }
  else
  {
    v38 = v32;
    v68 = v80;
    v67 = v81;
    v70 = v78;
    v69 = v79;
    v66 = self;
  }

  return v37;
}

- (void)dealloc
{
  __SecKey *applicationPublicDeviceIdentity;
  objc_super v4;

  applicationPublicDeviceIdentity = self->_applicationPublicDeviceIdentity;
  if (applicationPublicDeviceIdentity)
  {
    CFRelease(applicationPublicDeviceIdentity);
    self->_applicationPublicDeviceIdentity = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSEndpoint;
  -[IDSEndpoint dealloc](&v4, sel_dealloc);
}

- (__SecKey)applicationPublicDeviceIdentity
{
  __SecKey *result;
  void *v4;
  void *v5;
  const __CFDictionary *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  IDSURI *URI;
  IDSPushToken *pushTokenObject;
  NSData *serializedApplicationPublicKey;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v16;
  __int16 v17;
  IDSURI *v18;
  __int16 v19;
  IDSPushToken *v20;
  __int16 v21;
  NSData *v22;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x1E0C80C00];
  result = self->_applicationPublicDeviceIdentity;
  if (!result)
  {
    if (self->_serializedApplicationPublicKey)
    {
      error = 0;
      v4 = (void *)*MEMORY[0x1E0CD69F8];
      keys[0] = *(void **)MEMORY[0x1E0CD6A38];
      keys[1] = v4;
      v5 = (void *)*MEMORY[0x1E0CD6A10];
      values[0] = *(void **)MEMORY[0x1E0CD6A50];
      values[1] = v5;
      v6 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
      self->_applicationPublicDeviceIdentity = SecKeyCreateWithData((CFDataRef)self->_serializedApplicationPublicKey, v6, &error);
      if (error)
      {
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8, v9);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          URI = self->_URI;
          pushTokenObject = self->_pushTokenObject;
          serializedApplicationPublicKey = self->_serializedApplicationPublicKey;
          *(_DWORD *)buf = 138544131;
          v16 = error;
          v17 = 2113;
          v18 = URI;
          v19 = 2113;
          v20 = pushTokenObject;
          v21 = 2113;
          v22 = serializedApplicationPublicKey;
          _os_log_error_impl(&dword_19B949000, v10, OS_LOG_TYPE_ERROR, "Endpoint failed creating public identity {error : %{public}@, URI: %{private}@, pushToken: %{private}@, serializedApplicationPublicKey: %{private}@}", buf, 0x2Au);
        }

      }
      if (v6)
        CFRelease(v6);
      if (error)
        CFRelease(error);
      return self->_applicationPublicDeviceIdentity;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (IDSMPPublicDeviceIdentityContainer)publicDeviceIdentityContainer
{
  double v2;
  IDSMPPublicDeviceIdentityContainer *publicDeviceIdentityContainer;
  NSData *serializedLegacyPublicIdentity;
  void *v6;
  const char *v7;
  uint64_t v8;
  IDSURI *v9;
  double v10;
  NSData *serializedNGMDeviceIdentity;
  NSData *serializedNGMDevicePrekey;
  NSError *v13;
  IDSURI *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  double v19;
  void *v20;
  void *v21;
  NSError *identityContainerDeserializationError;
  NSObject *v23;
  IDSURI *v24;
  IDSPushToken *v25;
  const char *v26;
  double v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  const char *v34;
  double v35;
  uint64_t v36;
  const char *v37;
  double v38;
  NSObject *v39;
  const char *v40;
  double v41;
  uint64_t v42;
  const char *v43;
  double v44;
  uint64_t v45;
  NSError *v46;
  NSError *v47;
  NSObject *v48;
  const char *v49;
  double v50;
  const char *v51;
  double v52;
  NSObject *v53;
  const char *v54;
  double v55;
  NSError *v56;
  NSError *v57;
  NSError *v58;
  NSError *v59;
  const char *v60;
  double v61;
  IDSMPPublicDeviceIdentityContainer *v62;
  IDSMPPublicDeviceIdentityContainer *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  NSObject *v67;
  const char *v68;
  double v69;
  NSError *v70;
  NSError *v71;
  IDSURI *URI;
  IDSPushToken *pushTokenObject;
  NSData *v75;
  NSData *v76;
  IDSURI *v77;
  IDSPushToken *v78;
  IDSURI *v79;
  IDSURI *v80;
  id v81;
  uint64_t v82;
  IDSURI *v83;
  uint64_t v84;
  IDSURI *v85;
  uint8_t buf[4];
  IDSURI *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  publicDeviceIdentityContainer = self->_publicDeviceIdentityContainer;
  if (!publicDeviceIdentityContainer)
  {
    serializedLegacyPublicIdentity = self->_serializedLegacyPublicIdentity;
    v81 = 0;
    objc_msgSend_identityWithData_error_(IDSMPPublicLegacyIdentity, a2, (uint64_t)serializedLegacyPublicIdentity, v2, &v81);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (IDSURI *)v81;
    if (!v6)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8, v10);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        URI = self->_URI;
        pushTokenObject = self->_pushTokenObject;
        v75 = self->_serializedLegacyPublicIdentity;
        *(_DWORD *)buf = 138544131;
        v87 = v9;
        v88 = 2113;
        v89 = URI;
        v90 = 2113;
        v91 = pushTokenObject;
        v92 = 2113;
        v93 = v75;
        _os_log_fault_impl(&dword_19B949000, v39, OS_LOG_TYPE_FAULT, "Endpoint failed creating public identity {error : %{public}@, URI: %{private}@, pushToken: %{private}@, serializedPublicMessageProtectionIdentity: %{private}@}", buf, 0x2Au);
      }

      if (self->_serializedLegacyPublicIdentity)
        v42 = 6;
      else
        v42 = 5;
      if (v9)
      {
        v82 = *MEMORY[0x1E0CB3388];
        v83 = v9;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v40, (uint64_t)&v83, v41, &v82, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v43, IDSEndpointErrorDomain, v44, v42, v21);
      }
      else
      {
        v21 = 0;
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v40, IDSEndpointErrorDomain, v41, v42, 0);
      }
      v47 = (NSError *)objc_claimAutoreleasedReturnValue();
      identityContainerDeserializationError = self->_identityContainerDeserializationError;
      self->_identityContainerDeserializationError = v47;
      goto LABEL_44;
    }
    serializedNGMDeviceIdentity = self->_serializedNGMDeviceIdentity;
    if (!serializedNGMDeviceIdentity || (serializedNGMDevicePrekey = self->_serializedNGMDevicePrekey) == 0)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, (uint64_t)serializedNGMDeviceIdentity, v10);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = self->_URI;
        v25 = self->_pushTokenObject;
        *(_DWORD *)buf = 138478083;
        v87 = v24;
        v88 = 2113;
        v89 = v25;
        _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "Endpoint missing serializedNGMDeviceIdentity -- creating legacy endpoint {URI: %{private}@, pushToken: %{private}@}", buf, 0x16u);
      }

      v28 = objc_msgSend_valueForCapability_(self->_capabilities, v26, (uint64_t)CFSTR("ec-version"), v27);
      _IDSECVersion();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_integerValue(v29, v30, v31, v32);

      v36 = objc_msgSend_valueForCapability_(self->_capabilities, v34, (uint64_t)CFSTR("supports-certified-delivery-v1"), v35);
      if (self->_serializedNGMDeviceIdentity)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v37, IDSEndpointErrorDomain, v38, 1, 0);
      }
      else
      {
        v45 = 3;
        if (v28 < v33)
          v45 = 10;
        if (!v36)
          v45 = 9;
        if (self->_serializedNGMDevicePrekey)
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v37, IDSEndpointErrorDomain, v38, 2, 0);
        else
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v37, IDSEndpointErrorDomain, v38, v45, 0);
      }
      v46 = (NSError *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      identityContainerDeserializationError = 0;
      v20 = 0;
      v13 = self->_identityContainerDeserializationError;
      self->_identityContainerDeserializationError = v46;
      v14 = v9;
      goto LABEL_39;
    }
    v80 = v9;
    objc_msgSend_identityWithIdentityData_prekeyData_error_(IDSNGMPublicDeviceIdentity, v7, (uint64_t)serializedNGMDeviceIdentity, v10, serializedNGMDevicePrekey, &v80);
    v13 = (NSError *)objc_claimAutoreleasedReturnValue();
    v14 = v80;

    if (v13)
    {
      if (self->_ngmVersion != -1)
      {
        v13 = v13;
        objc_msgSend_numberWithShort_(MEMORY[0x1E0CB37E8], v18, self->_ngmVersion, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        identityContainerDeserializationError = v13;
LABEL_39:

        v79 = v14;
        objc_msgSend_identityWithLegacyPublicIdentity_ngmPublicDeviceIdentity_ngmVersion_error_(IDSMPPublicDeviceIdentityContainer, v60, (uint64_t)v6, v61, identityContainerDeserializationError, v20, &v79);
        v62 = (IDSMPPublicDeviceIdentityContainer *)objc_claimAutoreleasedReturnValue();
        v9 = v79;

        v63 = self->_publicDeviceIdentityContainer;
        self->_publicDeviceIdentityContainer = v62;

        if (!self->_publicDeviceIdentityContainer)
        {
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v64, v65, v66);
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
            sub_19BAF6C94((uint64_t)v9, (uint64_t)self, v67);

          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v68, IDSEndpointErrorDomain, v69, 8, v21);
          v70 = (NSError *)objc_claimAutoreleasedReturnValue();
          v71 = self->_identityContainerDeserializationError;
          self->_identityContainerDeserializationError = v70;

        }
LABEL_44:

        publicDeviceIdentityContainer = self->_publicDeviceIdentityContainer;
        return publicDeviceIdentityContainer;
      }
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v15, v16, v17);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
        sub_19BAF6D28((uint64_t)self, v53);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v54, IDSEndpointErrorDomain, v55, 4, 0);
      v56 = (NSError *)objc_claimAutoreleasedReturnValue();
      v57 = self->_identityContainerDeserializationError;
      self->_identityContainerDeserializationError = v56;

      v21 = 0;
    }
    else
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v15, v16, v17);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
      {
        v76 = self->_serializedNGMDeviceIdentity;
        v77 = self->_URI;
        v78 = self->_pushTokenObject;
        *(_DWORD *)buf = 138544131;
        v87 = v14;
        v88 = 2113;
        v89 = v76;
        v90 = 2113;
        v91 = v77;
        v92 = 2113;
        v93 = v78;
        _os_log_fault_impl(&dword_19B949000, v48, OS_LOG_TYPE_FAULT, "Failed to deserialize IDSNGMPublicDeviceIdentity -- creating legacy endpoint {error: %{public}@, serializedNGMDeviceIdentity: %{private}@, URI: %{private}@, pushToken: %{private}@}", buf, 0x2Au);
      }

      if (v14)
      {
        v84 = *MEMORY[0x1E0CB3388];
        v85 = v14;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v49, (uint64_t)&v85, v50, &v84, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v51, IDSEndpointErrorDomain, v52, 7, v21);
      }
      else
      {
        v21 = 0;
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v49, IDSEndpointErrorDomain, v50, 7, 0);
      }
      v58 = (NSError *)objc_claimAutoreleasedReturnValue();
      v59 = self->_identityContainerDeserializationError;
      self->_identityContainerDeserializationError = v58;

    }
    identityContainerDeserializationError = 0;
    v20 = 0;
    goto LABEL_39;
  }
  return publicDeviceIdentityContainer;
}

- (NSData)serializedPublicLegacyIdentity
{
  return self->_serializedLegacyPublicIdentity;
}

- (NSData)pushToken
{
  uint64_t v2;
  double v3;

  return (NSData *)objc_msgSend_rawToken(self->_pushTokenObject, a2, v2, v3);
}

- (NSString)description
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  IDSMPPublicDeviceIdentityContainer *publicDeviceIdentityContainer;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  __SecKey *applicationPublicDeviceIdentity;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  void *v34;

  v34 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend_URI(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pushTokenObject(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_senderCorrelationIdentifier(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  publicDeviceIdentityContainer = self->_publicDeviceIdentityContainer;
  objc_msgSend_serializedNGMDeviceIdentity(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  applicationPublicDeviceIdentity = self->_applicationPublicDeviceIdentity;
  objc_msgSend_serializedApplicationPublicKey(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_capabilities(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v34, v30, (uint64_t)CFSTR("<%@: %p URI: %@, pushToken: %@, mergeID: %@, publicDeviceIdentityContainer: %@, devicePublicIdentity: %@,  applicationPublicDeviceIdentity: %@, applicationDevicePublicIdentity: %@, capabilities: %@>"), v31, v3, self, v7, v11, v15, publicDeviceIdentityContainer, v20, applicationPublicDeviceIdentity, v25, v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v32;
}

- (NSString)debugDescription
{
  const char *v3;
  uint64_t v4;
  double v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  IDSMPPublicDeviceIdentityContainer *publicDeviceIdentityContainer;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  __SecKey *applicationPublicDeviceIdentity;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  void *v35;
  uint64_t v37;
  void *v38;

  v38 = (void *)MEMORY[0x1E0CB3940];
  v37 = objc_opt_class();
  objc_msgSend_URI(self, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pushTokenObject(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_senderCorrelationIdentifier(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  publicDeviceIdentityContainer = self->_publicDeviceIdentityContainer;
  objc_msgSend_serializedNGMDeviceIdentity(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  applicationPublicDeviceIdentity = self->_applicationPublicDeviceIdentity;
  objc_msgSend_serializedApplicationPublicKey(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_capabilities(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_debugDescription(v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v38, v33, (uint64_t)CFSTR("<%@: %p URI: %@, pushToken: %@, mergeID: %@, publicDeviceIdentityContainer: %@, devicePublicIdentity: %@, applicationPublicDeviceIdentity: %@, applicationDevicePublicIdentity: %@, capabilities: %@>"), v34, v37, self, v6, v10, v14, publicDeviceIdentityContainer, v19, applicationPublicDeviceIdentity, v24, v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v35;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToEndpoint;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToEndpoint = objc_msgSend_isEqualToEndpoint_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToEndpoint = 0;

  return isEqualToEndpoint;
}

- (BOOL)isEqualToEndpoint:(id)a3
{
  void *v3;
  IDSEndpoint *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  IDSEndpoint *v9;
  double queryTimeInterval;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  IDSURI *URI;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  NSString *shortHandle;
  const char *v23;
  uint64_t v24;
  NSString *v25;
  double v26;
  NSString *v27;
  void *v28;
  const char *v29;
  double v30;
  BOOL v31;
  NSData *KTLoggableData;
  const char *v33;
  uint64_t v34;
  NSData *v35;
  double v36;
  NSData *v37;
  const char *v38;
  double v39;
  NSData *KTDeviceSignature;
  const char *v41;
  uint64_t v42;
  NSData *v43;
  double v44;
  NSData *v45;
  uint64_t v46;
  NSData *v47;
  void *v48;
  const char *v49;
  double v50;
  IDSPushToken *pushTokenObject;
  void *v52;
  const char *v53;
  double v54;
  const char *v55;
  uint64_t v56;
  double v57;
  NSData *sessionToken;
  uint64_t v59;
  NSData *v60;
  void *v61;
  const char *v62;
  double v63;
  const char *v64;
  uint64_t v65;
  double v66;
  NSDate *expireDate;
  uint64_t v68;
  NSDate *v69;
  void *v70;
  const char *v71;
  double v72;
  const char *v73;
  uint64_t v74;
  double v75;
  NSDate *refreshDate;
  uint64_t v77;
  NSDate *v78;
  void *v79;
  const char *v80;
  double v81;
  const char *v82;
  uint64_t v83;
  double v84;
  NSString *anonymizedSenderID;
  const char *v86;
  uint64_t v87;
  double v88;
  NSString *v89;
  const char *v90;
  double v91;
  void *v92;
  int verifiedBusiness;
  const char *v95;
  uint64_t v96;
  double v97;
  NSString *senderCorrelationIdentifier;
  const char *v99;
  uint64_t v100;
  double v101;
  NSString *v102;
  const char *v103;
  double v104;
  IDSEndpointCapabilities *capabilities;
  uint64_t v106;
  IDSEndpointCapabilities *v107;
  void *v108;
  const char *v109;
  double v110;
  const char *v111;
  uint64_t v112;
  double v113;
  const char *v114;
  uint64_t v115;
  double v116;
  NSData *v117;
  const char *v118;
  double v119;
  NSString *v120;
  NSData *serializedNGMDevicePrekey;
  const char *v122;
  uint64_t v123;
  double v124;
  NSData *v125;
  const char *v126;
  double v127;
  NSData *serializedNGMDeviceIdentity;
  const char *v129;
  uint64_t v130;
  double v131;
  NSData *v132;
  const char *v133;
  double v134;
  NSData *serializedApplicationPublicKey;
  const char *v136;
  uint64_t v137;
  double v138;
  NSData *v139;
  const char *v140;
  double v141;
  const char *v142;
  uint64_t v143;
  double v144;
  int v145;
  const char *v146;
  uint64_t v147;
  double v148;
  int v149;
  int ngmVersion;
  const char *v151;
  uint64_t v152;
  double v153;
  int legacyVersion;
  void *v155;
  NSData *v156;
  void *v157;
  NSData *v158;
  void *v159;
  NSData *v160;
  NSData *v161;
  void *v162;
  NSData *v163;
  void *v164;
  NSData *v165;
  NSData *serializedLegacyPublicIdentity;
  void *v167;
  NSString *v168;
  NSString *v169;
  void *v170;
  NSString *v171;
  void *v172;
  NSString *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  NSData *v178;
  void *v179;

  v5 = (IDSEndpoint *)a3;
  v9 = v5;
  if (self == v5)
  {
    v31 = 1;
  }
  else
  {
    queryTimeInterval = self->_queryTimeInterval;
    objc_msgSend_queryTimeInterval(v5, v6, v7, v8);
    v14 = queryTimeInterval - v13;
    if (v14 < 0.0)
      v14 = -v14;
    if (v14 < 2.22044605e-16)
    {
      URI = self->_URI;
      objc_msgSend_URI(v9, v11, v12, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqual_(URI, v17, (uint64_t)v16, v18))
      {
        v31 = 0;
LABEL_41:

        goto LABEL_42;
      }
      shortHandle = self->_shortHandle;
      objc_msgSend_shortHandle(v9, v19, v20, v21);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (shortHandle != v25)
      {
        v27 = self->_shortHandle;
        objc_msgSend_shortHandle(v9, v23, v24, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v27, v29, (uint64_t)v28, v30))
        {
          v31 = 0;
          goto LABEL_39;
        }
        v179 = v28;
      }
      KTLoggableData = self->_KTLoggableData;
      objc_msgSend_KTLoggableData(v9, v23, v24, v26);
      v35 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (KTLoggableData != v35)
      {
        v37 = self->_KTLoggableData;
        objc_msgSend_KTLoggableData(v9, v33, v34, v36);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v37, v38, (uint64_t)v3, v39) & 1) == 0)
        {
LABEL_35:

LABEL_36:
LABEL_37:
          v31 = 0;
          goto LABEL_38;
        }
      }
      KTDeviceSignature = self->_KTDeviceSignature;
      objc_msgSend_KTDeviceSignature(v9, v33, v34, v36);
      v43 = (NSData *)objc_claimAutoreleasedReturnValue();
      v178 = KTDeviceSignature;
      if (KTDeviceSignature == v43)
      {
        v177 = v3;
      }
      else
      {
        v45 = self->_KTDeviceSignature;
        objc_msgSend_KTDeviceSignature(v9, v41, v42, v44);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v45;
        v48 = (void *)v46;
        if ((objc_msgSend_isEqual_(v47, v49, v46, v50) & 1) == 0)
        {

          if (KTLoggableData == v35)
          {

            goto LABEL_37;
          }
          goto LABEL_35;
        }
        v176 = v48;
        v177 = v3;
      }
      pushTokenObject = self->_pushTokenObject;
      objc_msgSend_pushTokenObject(v9, v41, v42, v44);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqual_(pushTokenObject, v53, (uint64_t)v52, v54))
      {
        v31 = 0;
        v92 = v177;
        goto LABEL_28;
      }
      sessionToken = self->_sessionToken;
      objc_msgSend_sessionToken(v9, v55, v56, v57);
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = sessionToken;
      v61 = (void *)v59;
      if ((objc_msgSend_isEqual_(v60, v62, v59, v63) & 1) != 0)
      {
        v175 = v61;
        expireDate = self->_expireDate;
        objc_msgSend_expireDate(v9, v64, v65, v66);
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = expireDate;
        v70 = (void *)v68;
        if ((objc_msgSend_isEqual_(v69, v71, v68, v72) & 1) != 0)
        {
          v174 = v70;
          refreshDate = self->_refreshDate;
          objc_msgSend_refreshDate(v9, v73, v74, v75);
          v77 = objc_claimAutoreleasedReturnValue();
          v78 = refreshDate;
          v79 = (void *)v77;
          if ((objc_msgSend_isEqual_(v78, v80, v77, v81) & 1) == 0)
          {

            v3 = v177;
            if (v178 == v43)
            {

            }
            else
            {

            }
            if (KTLoggableData == v35)
              goto LABEL_36;
            goto LABEL_35;
          }
          v172 = v79;
          anonymizedSenderID = self->_anonymizedSenderID;
          objc_msgSend_anonymizedSenderID(v9, v82, v83, v84);
          v173 = (NSString *)objc_claimAutoreleasedReturnValue();
          v171 = anonymizedSenderID;
          if (anonymizedSenderID != v173)
          {
            v89 = self->_anonymizedSenderID;
            objc_msgSend_anonymizedSenderID(v9, v86, v87, v88);
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend_isEqual_(v89, v90, (uint64_t)v170, v91))
            {
              v31 = 0;
              v92 = v177;
              goto LABEL_61;
            }
          }
          verifiedBusiness = self->_verifiedBusiness;
          if (verifiedBusiness != objc_msgSend_verifiedBusiness(v9, v86, v87, v88))
          {
            v31 = 0;
            v92 = v177;
            if (v171 == v173)
              goto LABEL_62;
            goto LABEL_61;
          }
          senderCorrelationIdentifier = self->_senderCorrelationIdentifier;
          objc_msgSend_senderCorrelationIdentifier(v9, v95, v96, v97);
          v168 = senderCorrelationIdentifier;
          v169 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (senderCorrelationIdentifier != v169)
          {
            v102 = self->_senderCorrelationIdentifier;
            objc_msgSend_senderCorrelationIdentifier(v9, v99, v100, v101);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend_isEqual_(v102, v103, (uint64_t)v167, v104))
            {
              v31 = 0;
              v92 = v177;
              goto LABEL_96;
            }
          }
          capabilities = self->_capabilities;
          objc_msgSend_capabilities(v9, v99, v100, v101);
          v106 = objc_claimAutoreleasedReturnValue();
          v107 = capabilities;
          v108 = (void *)v106;
          if (!objc_msgSend_isEqual_(v107, v109, v106, v110))
          {

            v31 = 0;
            v120 = v169;
            v92 = v177;
            if (v168 != v169)
              goto LABEL_96;
LABEL_69:

            if (v171 != v173)
LABEL_28:

            if (v178 == v43)
            {
LABEL_30:

LABEL_31:
              if (KTLoggableData != v35)

LABEL_38:
              v28 = v179;
              if (shortHandle == v25)
              {
LABEL_40:

                goto LABEL_41;
              }
LABEL_39:

              goto LABEL_40;
            }
LABEL_29:

            goto LABEL_30;
          }
          serializedLegacyPublicIdentity = self->_serializedLegacyPublicIdentity;
          objc_msgSend_serializedLegacyPublicIdentity(v9, v111, v112, v113);
          v164 = v108;
          v165 = (NSData *)objc_claimAutoreleasedReturnValue();
          if (serializedLegacyPublicIdentity != v165)
          {
            v117 = self->_serializedLegacyPublicIdentity;
            objc_msgSend_serializedLegacyPublicIdentity(v9, v114, v115, v116);
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend_isEqual_(v117, v118, (uint64_t)v162, v119))
            {
              v31 = 0;
              v92 = v177;
              goto LABEL_93;
            }
          }
          serializedNGMDevicePrekey = self->_serializedNGMDevicePrekey;
          objc_msgSend_serializedNGMDevicePrekey(v9, v114, v115, v116);
          v163 = (NSData *)objc_claimAutoreleasedReturnValue();
          v160 = serializedNGMDevicePrekey;
          if (serializedNGMDevicePrekey != v163)
          {
            v125 = self->_serializedNGMDevicePrekey;
            objc_msgSend_serializedNGMDevicePrekey(v9, v122, v123, v124);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend_isEqual_(v125, v126, (uint64_t)v159, v127))
            {
              v31 = 0;
              v92 = v177;
              goto LABEL_90;
            }
          }
          serializedNGMDeviceIdentity = self->_serializedNGMDeviceIdentity;
          objc_msgSend_serializedNGMDeviceIdentity(v9, v122, v123, v124);
          v161 = (NSData *)objc_claimAutoreleasedReturnValue();
          v158 = serializedNGMDeviceIdentity;
          if (serializedNGMDeviceIdentity == v161
            || (v132 = self->_serializedNGMDeviceIdentity,
                objc_msgSend_serializedNGMDeviceIdentity(v9, v129, v130, v131),
                v157 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend_isEqual_(v132, v133, (uint64_t)v157, v134)))
          {
            serializedApplicationPublicKey = self->_serializedApplicationPublicKey;
            objc_msgSend_serializedApplicationPublicKey(v9, v129, v130, v131);
            v156 = (NSData *)objc_claimAutoreleasedReturnValue();
            if (serializedApplicationPublicKey == v156)
            {
              ngmVersion = (unsigned __int16)self->_ngmVersion;
              if (ngmVersion == (unsigned __int16)objc_msgSend_ngmVersion(v9, v136, v137, v138))
              {
                legacyVersion = self->_legacyVersion;
                v31 = legacyVersion == objc_msgSend_legacyVersion(v9, v151, v152, v153);
              }
              else
              {
                v31 = 0;
              }
            }
            else
            {
              v139 = self->_serializedApplicationPublicKey;
              objc_msgSend_serializedApplicationPublicKey(v9, v136, v137, v138);
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend_isEqual_(v139, v140, (uint64_t)v155, v141) & 1) != 0
                && (v145 = (unsigned __int16)self->_ngmVersion,
                    v145 == (unsigned __int16)objc_msgSend_ngmVersion(v9, v142, v143, v144)))
              {
                v149 = self->_legacyVersion;
                v31 = v149 == objc_msgSend_legacyVersion(v9, v146, v147, v148);
              }
              else
              {
                v31 = 0;
              }

            }
            v92 = v177;
            if (v158 == v161)
            {
LABEL_89:

              if (v160 == v163)
              {

LABEL_92:
                if (serializedLegacyPublicIdentity == v165)
                {

LABEL_95:
                  v120 = v169;
                  if (v168 != v169)
                  {
LABEL_96:

                    if (v171 == v173)
                    {
LABEL_62:

                      if (v178 == v43)
                      {

                        goto LABEL_31;
                      }
                      goto LABEL_29;
                    }
LABEL_61:

                    goto LABEL_62;
                  }
                  goto LABEL_69;
                }
LABEL_93:

                goto LABEL_95;
              }
LABEL_90:

              goto LABEL_92;
            }
          }
          else
          {
            v31 = 0;
            v92 = v177;
          }

          goto LABEL_89;
        }

      }
      else
      {

      }
      if (v178 == v43)
      {

      }
      else
      {

      }
      if (KTLoggableData != v35)

      goto LABEL_36;
    }
    v31 = 0;
  }
LABEL_42:

  return v31;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  unint64_t v17;

  objc_msgSend_pushToken(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_sessionToken(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqualToEndpoint:(id)a3 withDateTolerance:(double)a4
{
  void *v4;
  IDSEndpoint *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  IDSEndpoint *v11;
  double queryTimeInterval;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  IDSURI *URI;
  void *v18;
  const char *v19;
  double v20;
  const char *v21;
  uint64_t v22;
  double v23;
  NSData *KTLoggableData;
  const char *v25;
  uint64_t v26;
  NSData *v27;
  double v28;
  NSData *v29;
  const char *v30;
  double v31;
  BOOL v32;
  NSData *KTDeviceSignature;
  const char *v34;
  uint64_t v35;
  NSData *v36;
  double v37;
  NSData *v38;
  void *v39;
  const char *v40;
  double v41;
  IDSPushToken *pushTokenObject;
  void *v43;
  const char *v44;
  double v45;
  const char *v46;
  uint64_t v47;
  double v48;
  NSData *sessionToken;
  void *v50;
  const char *v51;
  double v52;
  const char *v53;
  uint64_t v54;
  double v55;
  NSDate *expireDate;
  uint64_t v57;
  NSDate *v58;
  void *v59;
  const char *v60;
  double v61;
  const char *v62;
  uint64_t v63;
  double v64;
  double v65;
  NSDate *refreshDate;
  uint64_t v67;
  NSDate *v68;
  void *v69;
  const char *v70;
  double v71;
  const char *v72;
  uint64_t v73;
  double v74;
  double v75;
  NSString *anonymizedSenderID;
  const char *v77;
  uint64_t v78;
  double v79;
  NSString *v80;
  const char *v81;
  double v82;
  void *v83;
  int verifiedBusiness;
  const char *v86;
  uint64_t v87;
  double v88;
  NSString *senderCorrelationIdentifier;
  const char *v90;
  uint64_t v91;
  double v92;
  NSString *v93;
  const char *v94;
  double v95;
  IDSEndpointCapabilities *capabilities;
  uint64_t v97;
  IDSEndpointCapabilities *v98;
  void *v99;
  const char *v100;
  double v101;
  const char *v102;
  uint64_t v103;
  double v104;
  const char *v105;
  uint64_t v106;
  double v107;
  NSData *v108;
  const char *v109;
  double v110;
  NSString *v111;
  const char *v112;
  uint64_t v113;
  double v114;
  NSData *v115;
  const char *v116;
  double v117;
  NSData *serializedNGMDeviceIdentity;
  const char *v119;
  uint64_t v120;
  double v121;
  NSData *v122;
  const char *v123;
  double v124;
  NSData *serializedApplicationPublicKey;
  const char *v126;
  uint64_t v127;
  double v128;
  NSData *v129;
  const char *v130;
  double v131;
  const char *v132;
  uint64_t v133;
  double v134;
  int v135;
  const char *v136;
  uint64_t v137;
  double v138;
  int v139;
  int ngmVersion;
  const char *v141;
  uint64_t v142;
  double v143;
  int legacyVersion;
  void *v145;
  NSData *v146;
  void *v147;
  NSData *v148;
  void *v149;
  NSData *v150;
  void *v151;
  NSData *v152;
  NSData *serializedNGMDevicePrekey;
  void *v154;
  NSData *v155;
  NSData *serializedLegacyPublicIdentity;
  void *v157;
  NSString *v158;
  NSString *v159;
  void *v160;
  NSString *v161;
  void *v162;
  NSString *v163;
  void *v164;
  void *v165;
  void *v166;

  v7 = (IDSEndpoint *)a3;
  v11 = v7;
  if (self == v7)
  {
    v32 = 1;
  }
  else
  {
    queryTimeInterval = self->_queryTimeInterval;
    objc_msgSend_queryTimeInterval(v7, v8, v9, v10);
    v16 = queryTimeInterval - v15;
    if (v16 < 0.0)
      v16 = -v16;
    if (v16 < a4)
    {
      URI = self->_URI;
      objc_msgSend_URI(v11, v13, v14, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqual_(URI, v19, (uint64_t)v18, v20))
      {
        v32 = 0;
LABEL_32:

        goto LABEL_33;
      }
      KTLoggableData = self->_KTLoggableData;
      objc_msgSend_KTLoggableData(v11, v21, v22, v23);
      v27 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (KTLoggableData != v27)
      {
        v29 = self->_KTLoggableData;
        objc_msgSend_KTLoggableData(v11, v25, v26, v28);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v29, v30, (uint64_t)v4, v31))
        {
          v32 = 0;
          goto LABEL_30;
        }
      }
      KTDeviceSignature = self->_KTDeviceSignature;
      objc_msgSend_KTDeviceSignature(v11, v25, v26, v28);
      v36 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (KTDeviceSignature != v36)
      {
        v38 = self->_KTDeviceSignature;
        objc_msgSend_KTDeviceSignature(v11, v34, v35, v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v38, v40, (uint64_t)v39, v41) & 1) == 0)
        {

          goto LABEL_27;
        }
        v166 = v39;
      }
      pushTokenObject = self->_pushTokenObject;
      objc_msgSend_pushTokenObject(v11, v34, v35, v37);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqual_(pushTokenObject, v44, (uint64_t)v43, v45))
      {
        v32 = 0;
        goto LABEL_23;
      }
      v165 = v4;
      sessionToken = self->_sessionToken;
      objc_msgSend_sessionToken(v11, v46, v47, v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqual_(sessionToken, v51, (uint64_t)v50, v52) & 1) != 0)
      {
        expireDate = self->_expireDate;
        objc_msgSend_expireDate(v11, v53, v54, v55);
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = expireDate;
        v59 = (void *)v57;
        objc_msgSend_timeIntervalSinceDate_(v58, v60, v57, v61);
        v65 = fabs(v64);
        if (v65 < a4)
        {
          v164 = v59;
          refreshDate = self->_refreshDate;
          objc_msgSend_refreshDate(v11, v62, v63, v65);
          v67 = objc_claimAutoreleasedReturnValue();
          v68 = refreshDate;
          v69 = (void *)v67;
          objc_msgSend_timeIntervalSinceDate_(v68, v70, v67, v71);
          v75 = fabs(v74);
          if (v75 < a4)
          {
            v162 = v69;
            anonymizedSenderID = self->_anonymizedSenderID;
            objc_msgSend_anonymizedSenderID(v11, v72, v73, v75);
            v163 = (NSString *)objc_claimAutoreleasedReturnValue();
            v161 = anonymizedSenderID;
            if (anonymizedSenderID != v163)
            {
              v80 = self->_anonymizedSenderID;
              objc_msgSend_anonymizedSenderID(v11, v77, v78, v79);
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend_isEqual_(v80, v81, (uint64_t)v160, v82))
              {
                v32 = 0;
                v4 = v165;
                goto LABEL_48;
              }
            }
            verifiedBusiness = self->_verifiedBusiness;
            if (verifiedBusiness != objc_msgSend_verifiedBusiness(v11, v77, v78, v79))
            {
              v32 = 0;
              v4 = v165;
              if (v161 == v163)
              {
LABEL_49:

                if (KTDeviceSignature != v36)
                {
                  v83 = v166;
                  goto LABEL_24;
                }

LABEL_29:
                if (KTLoggableData == v27)
                {
LABEL_31:

                  goto LABEL_32;
                }
LABEL_30:

                goto LABEL_31;
              }
LABEL_48:

              goto LABEL_49;
            }
            senderCorrelationIdentifier = self->_senderCorrelationIdentifier;
            objc_msgSend_senderCorrelationIdentifier(v11, v86, v87, v88);
            v158 = senderCorrelationIdentifier;
            v159 = (NSString *)objc_claimAutoreleasedReturnValue();
            if (senderCorrelationIdentifier != v159)
            {
              v93 = self->_senderCorrelationIdentifier;
              objc_msgSend_senderCorrelationIdentifier(v11, v90, v91, v92);
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend_isEqual_(v93, v94, (uint64_t)v157, v95))
              {
                v32 = 0;
                v4 = v165;
                goto LABEL_85;
              }
            }
            capabilities = self->_capabilities;
            objc_msgSend_capabilities(v11, v90, v91, v92);
            v97 = objc_claimAutoreleasedReturnValue();
            v98 = capabilities;
            v99 = (void *)v97;
            if (!objc_msgSend_isEqual_(v98, v100, v97, v101))
            {

              v32 = 0;
              v111 = v159;
              v4 = v165;
              if (v158 != v159)
                goto LABEL_85;
LABEL_57:

              if (v161 != v163)
LABEL_23:

              v83 = v166;
              if (KTDeviceSignature == v36)
              {
LABEL_25:

                goto LABEL_29;
              }
LABEL_24:

              goto LABEL_25;
            }
            serializedLegacyPublicIdentity = self->_serializedLegacyPublicIdentity;
            objc_msgSend_serializedLegacyPublicIdentity(v11, v102, v103, v104);
            v154 = v99;
            v155 = (NSData *)objc_claimAutoreleasedReturnValue();
            if (serializedLegacyPublicIdentity != v155)
            {
              v108 = self->_serializedLegacyPublicIdentity;
              objc_msgSend_serializedLegacyPublicIdentity(v11, v105, v106, v107);
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend_isEqual_(v108, v109, (uint64_t)v151, v110))
              {
                v32 = 0;
                v4 = v165;
                goto LABEL_82;
              }
            }
            serializedNGMDevicePrekey = self->_serializedNGMDevicePrekey;
            objc_msgSend_serializedNGMDevicePrekey(v11, v105, v106, v107);
            v152 = (NSData *)objc_claimAutoreleasedReturnValue();
            if (serializedNGMDevicePrekey != v152)
            {
              v115 = self->_serializedNGMDevicePrekey;
              objc_msgSend_serializedNGMDevicePrekey(v11, v112, v113, v114);
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend_isEqual_(v115, v116, (uint64_t)v149, v117))
              {
                v32 = 0;
                v4 = v165;
                goto LABEL_79;
              }
            }
            serializedNGMDeviceIdentity = self->_serializedNGMDeviceIdentity;
            objc_msgSend_serializedNGMDeviceIdentity(v11, v112, v113, v114);
            v150 = (NSData *)objc_claimAutoreleasedReturnValue();
            v148 = serializedNGMDeviceIdentity;
            if (serializedNGMDeviceIdentity == v150
              || (v122 = self->_serializedNGMDeviceIdentity,
                  objc_msgSend_serializedNGMDeviceIdentity(v11, v119, v120, v121),
                  v147 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend_isEqual_(v122, v123, (uint64_t)v147, v124)))
            {
              serializedApplicationPublicKey = self->_serializedApplicationPublicKey;
              objc_msgSend_serializedApplicationPublicKey(v11, v119, v120, v121);
              v146 = (NSData *)objc_claimAutoreleasedReturnValue();
              if (serializedApplicationPublicKey == v146)
              {
                ngmVersion = (unsigned __int16)self->_ngmVersion;
                if (ngmVersion == (unsigned __int16)objc_msgSend_ngmVersion(v11, v126, v127, v128))
                {
                  legacyVersion = self->_legacyVersion;
                  v32 = legacyVersion == objc_msgSend_legacyVersion(v11, v141, v142, v143);
                }
                else
                {
                  v32 = 0;
                }
              }
              else
              {
                v129 = self->_serializedApplicationPublicKey;
                objc_msgSend_serializedApplicationPublicKey(v11, v126, v127, v128);
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend_isEqual_(v129, v130, (uint64_t)v145, v131) & 1) != 0
                  && (v135 = (unsigned __int16)self->_ngmVersion,
                      v135 == (unsigned __int16)objc_msgSend_ngmVersion(v11, v132, v133, v134)))
                {
                  v139 = self->_legacyVersion;
                  v32 = v139 == objc_msgSend_legacyVersion(v11, v136, v137, v138);
                }
                else
                {
                  v32 = 0;
                }

              }
              v4 = v165;
              if (v148 == v150)
              {

LABEL_78:
                if (serializedNGMDevicePrekey == v152)
                {

LABEL_81:
                  if (serializedLegacyPublicIdentity == v155)
                  {

LABEL_84:
                    v111 = v159;
                    if (v158 != v159)
                    {
LABEL_85:

                      if (v161 == v163)
                        goto LABEL_49;
                      goto LABEL_48;
                    }
                    goto LABEL_57;
                  }
LABEL_82:

                  goto LABEL_84;
                }
LABEL_79:

                goto LABEL_81;
              }
            }
            else
            {
              v32 = 0;
              v4 = v165;
            }

            goto LABEL_78;
          }

          v4 = v165;
          if (KTDeviceSignature == v36)
          {

            goto LABEL_28;
          }

LABEL_27:
LABEL_28:
          v32 = 0;
          goto LABEL_29;
        }

      }
      if (KTDeviceSignature == v36)
      {

      }
      else
      {

      }
      v32 = 0;
      v4 = v165;
      if (KTLoggableData == v27)
        goto LABEL_31;
      goto LABEL_30;
    }
    v32 = 0;
  }
LABEL_33:

  return v32;
}

- (id)destinationURIs
{
  double v2;
  IDSPushToken *pushTokenObject;
  IDSURI *URI;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  pushTokenObject = self->_pushTokenObject;
  if (pushTokenObject && (URI = self->_URI) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend_URIByAddingPushToken_(URI, a2, (uint64_t)pushTokenObject, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_prefixedURI(v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithObject_(v5, v11, (uint64_t)v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSEndpoint)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  double v17;
  uint64_t v18;
  const char *v19;
  double v20;
  uint64_t v21;
  const char *v22;
  double v23;
  uint64_t v24;
  const char *v25;
  double v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  double v30;
  uint64_t v31;
  const char *v32;
  double v33;
  uint64_t v34;
  const char *v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  const char *v40;
  double v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  double v45;
  uint64_t v46;
  const char *v47;
  double v48;
  uint64_t v49;
  const char *v50;
  double v51;
  IDSEndpointURIProperties *v52;
  uint64_t v53;
  const char *v54;
  double v55;
  void *v56;
  const char *v57;
  double v58;
  uint64_t v59;
  const char *v60;
  double v61;
  void *v62;
  const char *v63;
  double v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  double v70;
  void *v71;
  const char *v72;
  double v73;
  void *v74;
  const char *v75;
  double v76;
  uint64_t v77;
  const char *v78;
  double v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  double v83;
  char v84;
  const char *v85;
  double v86;
  const char *v87;
  double v88;
  const char *v89;
  double v90;
  void *v91;
  const char *v92;
  double v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  double v97;
  void *v98;
  void *v99;
  IDSEndpoint *v100;
  NSObject *v101;
  const char *v102;
  double v103;
  void *v104;
  const char *v105;
  double v106;
  void *v107;
  void *v108;
  IDSEndpointURIProperties *v109;
  void *v110;
  const char *v111;
  double v112;
  const char *v113;
  double v114;
  uint64_t v115;
  const char *v116;
  double v117;
  uint64_t v118;
  const char *v119;
  double v120;
  uint64_t v121;
  const char *v122;
  double v123;
  __int16 v124;
  const char *v125;
  double v126;
  char v127;
  uint64_t v128;
  const char *v129;
  double v130;
  const char *v131;
  void *v132;
  double v133;
  uint64_t v134;
  void *v135;
  void *v136;
  IDSEndpoint *v137;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  char v144;
  char v145;
  char v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  IDSEndpointURIProperties *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;

  v3 = a3;
  v4 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v5, v4, v6, CFSTR("uri"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v8, v7, v9, CFSTR("KTLoggableData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v12, v11, v13, CFSTR("KTDeviceSignature"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v16, v15, v17, CFSTR("pushToken"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v19, v18, v20, CFSTR("pushTokenObj"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v22, v21, v23, CFSTR("sessionToken"));
  v156 = objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v25, v24, v26, CFSTR("expireDate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v29, v28, v30, CFSTR("refreshDate"));
  v154 = objc_claimAutoreleasedReturnValue();
  v31 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v32, v31, v33, CFSTR("anonymizedSenderID"));
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v3, v35, (uint64_t)CFSTR("queryTimeInterval"), v36);
  v38 = v37;
  v39 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v40, v39, v41, CFSTR("serializedNGMDeviceIdentity"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v44, v43, v45, CFSTR("serializedApplicationPublicKey"));
  v152 = objc_claimAutoreleasedReturnValue();
  v46 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v47, v46, v48, CFSTR("familyEndpointData"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v50, v49, v51, CFSTR("gameCenterData"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_alloc_init(IDSEndpointURIProperties);
  v53 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v54, v53, v55, CFSTR("senderCorrelationIdentifier"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSenderCorrelationIdentifier_(v52, v57, (uint64_t)v56, v58);

  v59 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v60, v59, v61, CFSTR("shortHandle"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v52;
  objc_msgSend_setShortHandle_(v52, v63, (uint64_t)v62, v64);

  v65 = (void *)MEMORY[0x1E0C99E60];
  v66 = objc_opt_class();
  v67 = objc_opt_class();
  v68 = objc_opt_class();
  objc_msgSend_setWithObjects_(v65, v69, v66, v70, v67, v68, 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v72, (uint64_t)v71, v73, CFSTR("clientData"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v149 = v10;
  v159 = (void *)v14;
  v155 = v27;
  v153 = v42;
  v150 = v74;
  if (v74)
  {
    v77 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v3, v78, v77, v79, CFSTR("verifiedBusiness"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend_BOOLValue(v80, v81, v82, v83);

    objc_msgSend_decodeBoolForKey_(v3, v85, (uint64_t)CFSTR("KTMismatchedAccountFlag"), v86);
    objc_msgSend_decodeBoolForKey_(v3, v87, (uint64_t)CFSTR("KTCapableFlag"), v88);
    objc_msgSend_objectForKey_(v74, v89, (uint64_t)CFSTR("public-message-ngm-device-prekey-data-key"), v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v74, v92, (uint64_t)CFSTR("public-message-identity-key"), v93);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (v96 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v98 = v74;
      v99 = (void *)v34;
      v100 = (IDSEndpoint *)(id)objc_msgSend_initWithURI_clientData_KTLoggableData_KTDeviceSignature_mismatchedAccountFlag_ktCapableFlag_pushToken_sessionToken_expireDate_refreshDate_anonymizedSenderID_verifiedBusiness_serializedPublicMessageProtectionIdentity_queryTimeInterval_serializedNGMDeviceIdentity_serializedNGMDevicePrekey_serializedApplicationPublicKey_endpointURIProperties_familyEndpointData_gameCenterData_(self, v94, (uint64_t)v160, v38, v98, v161, v156, v27, v154, v34, v84, v96, v153, v91, v152, v151, v158, v157);
      self = v100;
    }
    else
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v94, v95, v97);
      v101 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_FAULT))
        sub_19BAF6DB0((uint64_t)v96, v101);
      v99 = (void *)v34;

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v102, IDSEndpointErrorDomain, v103, 5, 0);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v3, v105, (uint64_t)v104, v106);

      v100 = 0;
    }

    v107 = (void *)v154;
    v108 = (void *)v152;
    v42 = v153;
    v109 = v151;
    v110 = (void *)v156;
  }
  else
  {
    v147 = (void *)v34;
    v145 = objc_msgSend_decodeBoolForKey_(v3, v75, (uint64_t)CFSTR("verifiedBusinessb"), v76);
    v146 = objc_msgSend_decodeBoolForKey_(v3, v111, (uint64_t)CFSTR("KTMismatchedAccountFlag"), v112);
    v144 = objc_msgSend_decodeBoolForKey_(v3, v113, (uint64_t)CFSTR("KTCapableFlag"), v114);
    v115 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v3, v116, v115, v117, CFSTR("serializedLegacyPublicIdentity"));
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v3, v119, v118, v120, CFSTR("serializedNGMDevicePrekey"));
    v121 = objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend_decodeIntForKey_(v3, v122, (uint64_t)CFSTR("NGMVersion"), v123);
    v127 = objc_msgSend_decodeIntForKey_(v3, v125, (uint64_t)CFSTR("legacyVersion"), v126);
    v128 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v3, v129, v128, v130, CFSTR("capabilities"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = (uint64_t)v162;
    if (v162)
    {
      v107 = (void *)v154;
      v136 = v157;
      v135 = v158;
    }
    else
    {
      v107 = (void *)v154;
      v136 = v157;
      v135 = v158;
      if (v161)
      {
        objc_msgSend_pushTokenWithData_(IDSPushToken, v131, (uint64_t)v161, v133);
        v134 = objc_claimAutoreleasedReturnValue();
      }
    }
    v162 = (void *)v134;
    v141 = v135;
    v142 = v136;
    v109 = v151;
    v108 = (void *)v152;
    v143 = (void *)v121;
    v140 = v121;
    v99 = v147;
    BYTE1(v139) = v144;
    LOBYTE(v139) = v146;
    v10 = v149;
    v137 = (IDSEndpoint *)objc_retain((id)objc_msgSend_initWithURI_capabilities_ngmVersion_legacyVersion_KTLoggableData_KTDeviceSignature_mismatchedAccountFlag_ktCapableFlag_pushTokenObject_sessionToken_expireDate_refreshDate_anonymizedSenderID_verifiedBusiness_serializedPublicMessageProtectionIdentity_queryTimeInterval_serializedNGMDeviceIdentity_serializedNGMDevicePrekey_serializedApplicationPublicKey_endpointURIProperties_familyEndpointData_gameCenterData_(self, v131, (uint64_t)v160, v38, v132, v124, v127, v149, v159, v139, v134, v156, v155, v107, v147, v145, v148, v42, v140,
                                            v152,
                                            v151,
                                            v141,
                                            v142));

    v27 = v155;
    v100 = v137;
    v110 = (void *)v156;

    self = v100;
  }

  return v100;
}

- (void)encodeWithCoder:(id)a3
{
  double queryTimeInterval;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
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
  uint64_t v58;
  const char *v59;
  double v60;
  const char *v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  const char *v65;
  double v66;
  const char *v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  const char *v71;
  double v72;
  const char *v73;
  uint64_t v74;
  double v75;
  void *v76;
  const char *v77;
  double v78;
  const char *v79;
  uint64_t v80;
  double v81;
  void *v82;
  const char *v83;
  double v84;
  const char *v85;
  uint64_t v86;
  double v87;
  void *v88;
  const char *v89;
  double v90;
  const char *v91;
  uint64_t v92;
  double v93;
  void *v94;
  const char *v95;
  double v96;
  const char *v97;
  uint64_t v98;
  double v99;
  void *v100;
  const char *v101;
  double v102;
  const char *v103;
  uint64_t v104;
  double v105;
  void *v106;
  const char *v107;
  double v108;
  const char *v109;
  uint64_t v110;
  double v111;
  uint64_t v112;
  const char *v113;
  double v114;
  const char *v115;
  uint64_t v116;
  double v117;
  uint64_t v118;
  const char *v119;
  double v120;
  const char *v121;
  uint64_t v122;
  double v123;
  void *v124;
  const char *v125;
  double v126;
  const char *v127;
  uint64_t v128;
  double v129;
  void *v130;
  const char *v131;
  double v132;
  const char *v133;
  uint64_t v134;
  double v135;
  const char *v136;
  double v137;
  id v138;

  queryTimeInterval = self->_queryTimeInterval;
  v5 = a3;
  objc_msgSend_encodeDouble_forKey_(v5, v6, (uint64_t)CFSTR("queryTimeInterval"), queryTimeInterval);
  objc_msgSend_URI(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)v10, v12, CFSTR("uri"));

  objc_msgSend_KTLoggableData(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v17, (uint64_t)v16, v18, CFSTR("KTLoggableData"));

  objc_msgSend_KTDeviceSignature(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v23, (uint64_t)v22, v24, CFSTR("KTDeviceSignature"));

  objc_msgSend_pushTokenObject(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v29, (uint64_t)v28, v30, CFSTR("pushTokenObj"));

  objc_msgSend_sessionToken(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v35, (uint64_t)v34, v36, CFSTR("sessionToken"));

  objc_msgSend_expireDate(self, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v41, (uint64_t)v40, v42, CFSTR("expireDate"));

  objc_msgSend_refreshDate(self, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v47, (uint64_t)v46, v48, CFSTR("refreshDate"));

  objc_msgSend_anonymizedSenderID(self, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v53, (uint64_t)v52, v54, CFSTR("anonymizedSenderID"));

  v58 = objc_msgSend_verifiedBusiness(self, v55, v56, v57);
  objc_msgSend_encodeBool_forKey_(v5, v59, v58, v60, CFSTR("verifiedBusinessb"));
  v64 = objc_msgSend_mismatchedAccountFlag(self, v61, v62, v63);
  objc_msgSend_encodeBool_forKey_(v5, v65, v64, v66, CFSTR("KTMismatchedAccountFlag"));
  v70 = objc_msgSend_ktCapableFlag(self, v67, v68, v69);
  objc_msgSend_encodeBool_forKey_(v5, v71, v70, v72, CFSTR("KTCapableFlag"));
  objc_msgSend_senderCorrelationIdentifier(self, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v77, (uint64_t)v76, v78, CFSTR("senderCorrelationIdentifier"));

  objc_msgSend_shortHandle(self, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v83, (uint64_t)v82, v84, CFSTR("shortHandle"));

  objc_msgSend_serializedNGMDeviceIdentity(self, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v89, (uint64_t)v88, v90, CFSTR("serializedNGMDeviceIdentity"));

  objc_msgSend_serializedLegacyPublicIdentity(self, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v95, (uint64_t)v94, v96, CFSTR("serializedLegacyPublicIdentity"));

  objc_msgSend_serializedNGMDevicePrekey(self, v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v101, (uint64_t)v100, v102, CFSTR("serializedNGMDevicePrekey"));

  objc_msgSend_serializedApplicationPublicKey(self, v103, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v107, (uint64_t)v106, v108, CFSTR("serializedApplicationPublicKey"));

  v112 = objc_msgSend_ngmVersion(self, v109, v110, v111);
  objc_msgSend_encodeInt_forKey_(v5, v113, v112, v114, CFSTR("NGMVersion"));
  v118 = objc_msgSend_legacyVersion(self, v115, v116, v117);
  objc_msgSend_encodeInt_forKey_(v5, v119, v118, v120, CFSTR("legacyVersion"));
  objc_msgSend_capabilities(self, v121, v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v125, (uint64_t)v124, v126, CFSTR("capabilities"));

  objc_msgSend_familyEndpointData(self, v127, v128, v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v131, (uint64_t)v130, v132, CFSTR("familyEndpointData"));

  objc_msgSend_gameCenterData(self, v133, v134, v135);
  v138 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v136, (uint64_t)v138, v137, CFSTR("gameCenterData"));

}

- (IDSURI)URI
{
  return self->_URI;
}

- (void)setURI:(id)a3
{
  objc_storeStrong((id *)&self->_URI, a3);
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (IDSPushToken)pushTokenObject
{
  return self->_pushTokenObject;
}

- (void)setPublicDeviceIdentityContainer:(id)a3
{
  objc_storeStrong((id *)&self->_publicDeviceIdentityContainer, a3);
}

- (void)setApplicationPublicDeviceIdentity:(__SecKey *)a3
{
  self->_applicationPublicDeviceIdentity = a3;
}

- (IDSEndpointCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (NSData)serializedNGMDeviceIdentity
{
  return self->_serializedNGMDeviceIdentity;
}

- (NSData)serializedLegacyPublicIdentity
{
  return self->_serializedLegacyPublicIdentity;
}

- (NSData)serializedNGMDevicePrekey
{
  return self->_serializedNGMDevicePrekey;
}

- (NSData)serializedApplicationPublicKey
{
  return self->_serializedApplicationPublicKey;
}

- (signed)ngmVersion
{
  return self->_ngmVersion;
}

- (char)legacyVersion
{
  return self->_legacyVersion;
}

- (NSError)identityContainerDeserializationError
{
  return self->_identityContainerDeserializationError;
}

- (NSData)KTLoggableData
{
  return self->_KTLoggableData;
}

- (NSData)KTDeviceSignature
{
  return self->_KTDeviceSignature;
}

- (BOOL)mismatchedAccountFlag
{
  return self->_mismatchedAccountFlag;
}

- (BOOL)ktCapableFlag
{
  return self->_ktCapableFlag;
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (NSDate)expireDate
{
  return self->_expireDate;
}

- (NSDate)refreshDate
{
  return self->_refreshDate;
}

- (NSString)anonymizedSenderID
{
  return self->_anonymizedSenderID;
}

- (BOOL)verifiedBusiness
{
  return self->_verifiedBusiness;
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (NSString)shortHandle
{
  return self->_shortHandle;
}

- (double)queryTimeInterval
{
  return self->_queryTimeInterval;
}

- (IDSFamilyEndpointData)familyEndpointData
{
  return self->_familyEndpointData;
}

- (IDSGameCenterData)gameCenterData
{
  return self->_gameCenterData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameCenterData, 0);
  objc_storeStrong((id *)&self->_familyEndpointData, 0);
  objc_storeStrong((id *)&self->_shortHandle, 0);
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_anonymizedSenderID, 0);
  objc_storeStrong((id *)&self->_refreshDate, 0);
  objc_storeStrong((id *)&self->_expireDate, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_KTDeviceSignature, 0);
  objc_storeStrong((id *)&self->_KTLoggableData, 0);
  objc_storeStrong((id *)&self->_identityContainerDeserializationError, 0);
  objc_storeStrong((id *)&self->_serializedApplicationPublicKey, 0);
  objc_storeStrong((id *)&self->_serializedNGMDevicePrekey, 0);
  objc_storeStrong((id *)&self->_serializedLegacyPublicIdentity, 0);
  objc_storeStrong((id *)&self->_serializedNGMDeviceIdentity, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_publicDeviceIdentityContainer, 0);
  objc_storeStrong((id *)&self->_pushTokenObject, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_URI, 0);
}

@end
