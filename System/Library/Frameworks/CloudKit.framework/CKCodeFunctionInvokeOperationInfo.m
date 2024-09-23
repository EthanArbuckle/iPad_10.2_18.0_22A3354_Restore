@implementation CKCodeFunctionInvokeOperationInfo

+ (void)applyDefaultParametersToServiceURLComponents:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  objc_msgSend_scheme(v21, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend_setScheme_(v21, v7, (uint64_t)CFSTR("http"), v9);
  objc_msgSend_port(v21, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend_setPort_(v21, v11, (uint64_t)&unk_1E1FC4C28, v13);
  objc_msgSend_path(v21, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_length(v14, v15, v16, v17);

  if (!v18)
    objc_msgSend_setPath_(v21, v19, (uint64_t)CFSTR("/route"), v20);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t shouldSendRecordPCSKeys;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t IsLocalBit;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t AssetContentInMemory;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  objc_super v71;

  v4 = a3;
  objc_msgSend_serviceName(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("ServiceName"));

  objc_msgSend_functionName(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, (uint64_t)CFSTR("FunctionName"));

  objc_msgSend_requestLocalSerializations(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, (uint64_t)CFSTR("RequestLocalSerializations"));

  objc_msgSend_requestLocalEnvelopes(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("RequestLocalEnvelopes"));

  v28 = objc_msgSend_dataProtectionType(self, v25, v26, v27);
  objc_msgSend_encodeInteger_forKey_(v4, v29, v28, (uint64_t)CFSTR("DataProtectionType"));
  objc_msgSend_permittedRemoteMeasurement(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("PermittedRemoteMeasurement"));

  objc_msgSend_trustedTargetDomain(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, (uint64_t)CFSTR("TrustedTargetDomain"));

  objc_msgSend_trustedTargetOID(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v43, (uint64_t)CFSTR("TrustedTargetOID"));

  shouldSendRecordPCSKeys = objc_msgSend_shouldSendRecordPCSKeys(self, v45, v46, v47);
  objc_msgSend_encodeBool_forKey_(v4, v49, shouldSendRecordPCSKeys, (uint64_t)CFSTR("SendRecordPCSKeys"));
  IsLocalBit = objc_msgSend_legacyIsLocalBit(self, v50, v51, v52);
  objc_msgSend_encodeBool_forKey_(v4, v54, IsLocalBit, (uint64_t)CFSTR("LegacyLocal"));
  objc_msgSend_clientRuntimeProvidedServiceURL(self, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v59, (uint64_t)v58, (uint64_t)CFSTR("ClientRuntimeProvidedServiceURL"));

  AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(self, v60, v61, v62);
  objc_msgSend_encodeBool_forKey_(v4, v64, AssetContentInMemory, (uint64_t)CFSTR("ShouldFetchAssetContentInMemory"));
  v68 = objc_msgSend_enqueuedOnContainerService(self, v65, v66, v67);
  NSStringFromSelector(sel_enqueuedOnContainerService);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v4, v70, v68, (uint64_t)v69);

  v71.receiver = self;
  v71.super_class = (Class)CKCodeFunctionInvokeOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v71, sel_encodeWithCoder_, v4);

}

- (CKCodeFunctionInvokeOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKCodeFunctionInvokeOperationInfo *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *serviceName;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *functionName;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  NSArray *requestLocalSerializations;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSArray *requestLocalEnvelopes;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  NSData *permittedRemoteMeasurement;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSString *trustedTargetDomain;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  NSString *trustedTargetOID;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  NSURL *clientRuntimeProvidedServiceURL;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  objc_super v60;
  _QWORD v61[2];
  _QWORD v62[3];

  v62[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)CKCodeFunctionInvokeOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v60, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("ServiceName"));
    v8 = objc_claimAutoreleasedReturnValue();
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("FunctionName"));
    v12 = objc_claimAutoreleasedReturnValue();
    functionName = v5->_functionName;
    v5->_functionName = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v62[0] = objc_opt_class();
    v62[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v62, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v14, v17, (uint64_t)v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v20, (uint64_t)v19, (uint64_t)CFSTR("RequestLocalSerializations"));
    v21 = objc_claimAutoreleasedReturnValue();
    requestLocalSerializations = v5->_requestLocalSerializations;
    v5->_requestLocalSerializations = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v61[0] = objc_opt_class();
    v61[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v24, (uint64_t)v61, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v23, v26, (uint64_t)v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, (uint64_t)CFSTR("RequestLocalEnvelopes"));
    v30 = objc_claimAutoreleasedReturnValue();
    requestLocalEnvelopes = v5->_requestLocalEnvelopes;
    v5->_requestLocalEnvelopes = (NSArray *)v30;

    v5->_dataProtectionType = objc_msgSend_decodeIntegerForKey_(v4, v32, (uint64_t)CFSTR("DataProtectionType"), v33);
    v34 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, (uint64_t)CFSTR("PermittedRemoteMeasurement"));
    v36 = objc_claimAutoreleasedReturnValue();
    permittedRemoteMeasurement = v5->_permittedRemoteMeasurement;
    v5->_permittedRemoteMeasurement = (NSData *)v36;

    v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, (uint64_t)CFSTR("TrustedTargetDomain"));
    v40 = objc_claimAutoreleasedReturnValue();
    trustedTargetDomain = v5->_trustedTargetDomain;
    v5->_trustedTargetDomain = (NSString *)v40;

    v42 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, (uint64_t)CFSTR("TrustedTargetOID"));
    v44 = objc_claimAutoreleasedReturnValue();
    trustedTargetOID = v5->_trustedTargetOID;
    v5->_trustedTargetOID = (NSString *)v44;

    v5->_shouldSendRecordPCSKeys = objc_msgSend_decodeBoolForKey_(v4, v46, (uint64_t)CFSTR("SendRecordPCSKeys"), v47);
    v5->_legacyIsLocalBit = objc_msgSend_decodeBoolForKey_(v4, v48, (uint64_t)CFSTR("LegacyLocal"), v49);
    v50 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, (uint64_t)CFSTR("ClientRuntimeProvidedServiceURL"));
    v52 = objc_claimAutoreleasedReturnValue();
    clientRuntimeProvidedServiceURL = v5->_clientRuntimeProvidedServiceURL;
    v5->_clientRuntimeProvidedServiceURL = (NSURL *)v52;

    v5->_shouldFetchAssetContentInMemory = objc_msgSend_decodeBoolForKey_(v4, v54, (uint64_t)CFSTR("ShouldFetchAssetContentInMemory"), v55);
    NSStringFromSelector(sel_enqueuedOnContainerService);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_enqueuedOnContainerService = objc_msgSend_decodeBoolForKey_(v4, v57, (uint64_t)v56, v58);

  }
  return v5;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)requestLocalSerializations
{
  return self->_requestLocalSerializations;
}

- (void)setRequestLocalSerializations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)requestLocalEnvelopes
{
  return self->_requestLocalEnvelopes;
}

- (void)setRequestLocalEnvelopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (unint64_t)dataProtectionType
{
  return self->_dataProtectionType;
}

- (void)setDataProtectionType:(unint64_t)a3
{
  self->_dataProtectionType = a3;
}

- (NSData)permittedRemoteMeasurement
{
  return self->_permittedRemoteMeasurement;
}

- (void)setPermittedRemoteMeasurement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)trustedTargetDomain
{
  return self->_trustedTargetDomain;
}

- (void)setTrustedTargetDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)trustedTargetOID
{
  return self->_trustedTargetOID;
}

- (void)setTrustedTargetOID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)shouldSendRecordPCSKeys
{
  return self->_shouldSendRecordPCSKeys;
}

- (void)setShouldSendRecordPCSKeys:(BOOL)a3
{
  self->_shouldSendRecordPCSKeys = a3;
}

- (BOOL)enqueuedOnContainerService
{
  return self->_enqueuedOnContainerService;
}

- (void)setEnqueuedOnContainerService:(BOOL)a3
{
  self->_enqueuedOnContainerService = a3;
}

- (NSURL)clientRuntimeProvidedServiceURL
{
  return self->_clientRuntimeProvidedServiceURL;
}

- (void)setClientRuntimeProvidedServiceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (BOOL)legacyIsLocalBit
{
  return self->_legacyIsLocalBit;
}

- (void)setLegacyIsLocalBit:(BOOL)a3
{
  self->_legacyIsLocalBit = a3;
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchAssetContentInMemory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientRuntimeProvidedServiceURL, 0);
  objc_storeStrong((id *)&self->_trustedTargetOID, 0);
  objc_storeStrong((id *)&self->_trustedTargetDomain, 0);
  objc_storeStrong((id *)&self->_permittedRemoteMeasurement, 0);
  objc_storeStrong((id *)&self->_requestLocalEnvelopes, 0);
  objc_storeStrong((id *)&self->_requestLocalSerializations, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
