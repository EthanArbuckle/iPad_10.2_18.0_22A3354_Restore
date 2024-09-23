@implementation IDSRegistrationProfileHandleOperationLinkHandlesMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSRegistrationProfileHandleOperationLinkHandles");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  const char *v37;
  double v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  const char *v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  double v58;
  void *v59;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_guid(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("guid"), v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend_success(self, v9, v10, v11);
  objc_msgSend_numberWithBool_(v8, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("success"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend_connectionType(self, v17, v18, v19);
  objc_msgSend_numberWithUnsignedInt_(v16, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("connectionType"), v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  v28 = objc_msgSend_resultCode(self, v25, v26, v27);
  objc_msgSend_numberWithUnsignedInt_(v24, v29, v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v3, CFSTR("resultCode"), v31);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  v36 = objc_msgSend_registrationError(self, v33, v34, v35);
  objc_msgSend_numberWithUnsignedInt_(v32, v37, v36, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("registrationError"), v39);

  v40 = (void *)MEMORY[0x1E0CB37E8];
  v44 = objc_msgSend_vettingStatus(self, v41, v42, v43);
  objc_msgSend_numberWithUnsignedInt_(v40, v45, v44, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
    CFDictionarySetValue(v3, CFSTR("vettingStatus"), v47);

  objc_msgSend_genericError(self, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
    CFDictionarySetValue(v3, CFSTR("genericError"), v51);

  objc_msgSend_URLError(self, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
    CFDictionarySetValue(v3, CFSTR("URLError"), v55);

  objc_msgSend_POSIXError(self, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
    CFDictionarySetValue(v3, CFSTR("POSIXError"), v59);

  return (NSDictionary *)v3;
}

- (IDSRegistrationProfileHandleOperationLinkHandlesMetric)initWithGuid:(id)a3 success:(BOOL)a4 connectionType:(unsigned int)a5 resultCode:(unsigned int)a6 registrationError:(unsigned int)a7 vettingStatus:(unsigned int)a8 genericError:(id)a9 URLError:(id)a10 POSIXError:(id)a11
{
  id v15;
  id v16;
  id v17;
  IDSRegistrationProfileHandleOperationLinkHandlesMetric *v18;
  IDSRegistrationProfileHandleOperationLinkHandlesMetric *v19;
  id v24;
  objc_super v25;

  v24 = a3;
  v15 = a9;
  v16 = a10;
  v17 = a11;
  v25.receiver = self;
  v25.super_class = (Class)IDSRegistrationProfileHandleOperationLinkHandlesMetric;
  v18 = -[IDSRegistrationProfileHandleOperationLinkHandlesMetric init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_guid, a3);
    v19->_success = a4;
    v19->_connectionType = a5;
    v19->_resultCode = a6;
    v19->_registrationError = a7;
    v19->_vettingStatus = a8;
    objc_storeStrong((id *)&v19->_genericError, a9);
    objc_storeStrong((id *)&v19->_URLError, a10);
    objc_storeStrong((id *)&v19->_POSIXError, a11);
  }

  return v19;
}

- (NSString)guid
{
  return self->_guid;
}

- (BOOL)success
{
  return self->_success;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)resultCode
{
  return self->_resultCode;
}

- (unsigned)registrationError
{
  return self->_registrationError;
}

- (unsigned)vettingStatus
{
  return self->_vettingStatus;
}

- (NSNumber)genericError
{
  return self->_genericError;
}

- (NSNumber)URLError
{
  return self->_URLError;
}

- (NSNumber)POSIXError
{
  return self->_POSIXError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_POSIXError, 0);
  objc_storeStrong((id *)&self->_URLError, 0);
  objc_storeStrong((id *)&self->_genericError, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
