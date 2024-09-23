@implementation IDSKTRegistrationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSKTRegistrationData)init
{
  IDSKTRegistrationData *v2;
  IDSKTRegistrationData *v3;
  NSData *ktDataForRegistration;
  NSData *ktPublicAccountKey;
  NSData *ktDataSignature;
  NSDate *registeredTime;
  NSDate *ktAccountKeyTimestamp;
  NSDate *ktOptInTimestamp;
  NSNumber *ktOptInErrorCode;
  NSNumber *ktAccountKeyErrorCode;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IDSKTRegistrationData;
  v2 = -[IDSKTRegistrationData init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    ktDataForRegistration = v2->_ktDataForRegistration;
    v2->_ktDataForRegistration = 0;

    ktPublicAccountKey = v3->_ktPublicAccountKey;
    v3->_ktPublicAccountKey = 0;

    ktDataSignature = v3->_ktDataSignature;
    v3->_ktDataSignature = 0;

    v3->_uploadedToKVS = 0;
    registeredTime = v3->_registeredTime;
    v3->_registeredTime = 0;

    ktAccountKeyTimestamp = v3->_ktAccountKeyTimestamp;
    v3->_ktAccountKeyTimestamp = 0;

    ktOptInTimestamp = v3->_ktOptInTimestamp;
    v3->_ktOptInTimestamp = 0;

    v3->_ktOptInStatus = 0;
    ktOptInErrorCode = v3->_ktOptInErrorCode;
    v3->_ktOptInErrorCode = 0;

    ktAccountKeyErrorCode = v3->_ktAccountKeyErrorCode;
    v3->_ktAccountKeyErrorCode = 0;

  }
  return v3;
}

- (IDSKTRegistrationData)initWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  NSObject *v27;
  IDSKTRegistrationData *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  void *v49;
  IDSKTRegistrationData *v50;
  IDSKTRegistrationData *v51;
  uint64_t v53;
  char v54;
  void *v55;
  void *v56;
  id obj;
  objc_super v58;
  id v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v59 = 0;
  objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v7, (uint64_t)v6, v8, 0, 0, &v59);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v59;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend__dataForKey_(v9, v10, (uint64_t)CFSTR("kKTDataForReg"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__dataForKey_(v9, v15, (uint64_t)CFSTR("kKTDataPubKeyForReg"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend__dataForKey_(v9, v18, (uint64_t)CFSTR("kKTDataSigForReg"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__numberForKey_(v9, v21, (uint64_t)CFSTR("kKTDataKVSUploaded"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v23;
    if (v23)
      v54 = objc_msgSend_BOOLValue(v23, v24, v25, v26);
    else
      v54 = 0;
    v56 = (void *)v17;
    objc_msgSend__numberForKey_(v9, v24, (uint64_t)CFSTR("kKTDataRegTime"), v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v29;
    if (v29)
    {
      objc_msgSend_doubleValue(v29, v30, v31, v32);
      if (v32 > 0.0)
      {
        objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v30, v34, v32);

      }
    }
    objc_msgSend_objectForKey_(v9, v30, (uint64_t)CFSTR("kKTDataAccountKeyTimestamp"), v32);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v9, v35, (uint64_t)CFSTR("kKTDataOptInTimestamp"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__numberForKey_(v9, v38, (uint64_t)CFSTR("kKTDataOptInStatus"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend_unsignedIntegerValue(v40, v41, v42, v43);

    objc_msgSend__numberForKey_(v9, v44, (uint64_t)CFSTR("kKTDataOptInErrorCode"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__numberForKey_(v9, v47, (uint64_t)CFSTR("kKTDataAccountKeyErrorCode"), v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v58.receiver = self;
    v58.super_class = (Class)IDSKTRegistrationData;
    v50 = -[IDSKTRegistrationData init](&v58, sel_init);
    v51 = v50;
    if (v50)
    {
      objc_storeStrong((id *)&v50->_ktDataForRegistration, v14);
      objc_storeStrong((id *)&v51->_ktPublicAccountKey, v56);
      objc_storeStrong((id *)&v51->_ktDataSignature, v20);
      v51->_uploadedToKVS = v54;
      objc_storeStrong((id *)&v51->_ktAccountKeyTimestamp, obj);
      objc_storeStrong((id *)&v51->_ktOptInTimestamp, v37);
      v51->_ktOptInStatus = v53;
      objc_storeStrong((id *)&v51->_ktOptInErrorCode, v46);
      objc_storeStrong((id *)&v51->_ktAccountKeyErrorCode, v49);
    }
    self = v51;

    v28 = self;
  }
  else
  {
    objc_msgSend_KeyTransparency(IDSFoundationLog, v10, v11, v13);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v61 = v12;
      v62 = 2112;
      v63 = v6;
      v64 = 2112;
      v65 = v9;
      _os_log_error_impl(&dword_19B949000, v27, OS_LOG_TYPE_ERROR, "Failed to deserialize plist - failed to create IDSKTRegistrationData from data { error: %@, dataRepresentation: %@, dict: %@ }", buf, 0x20u);
    }

    v28 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v28;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  __int128 v6;
  NSData *ktDataSignature;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v6 = *(_OWORD *)&self->_ktDataForRegistration;
  ktDataSignature = self->_ktDataSignature;
  if (self->_uploadedToKVS)
    return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p; ktDataForRegistration: %@; ktPublicAccountKey: %@; ktDataSignature: %@; uploadedToKVS: %@; ktAccountKeyTimestamp: %@; ktOptInTimestamp: %@; ktOptInStatus: %lu; ktOptInAbsentReason: %@; ktAccountKeyAbsentReason: %@ >"),
                 *(double *)&v6,
                 v4,
                 self,
                 v6,
                 ktDataSignature,
                 CFSTR("YES"),
                 self->_ktAccountKeyTimestamp,
                 self->_ktOptInTimestamp,
                 self->_ktOptInStatus,
                 self->_ktOptInErrorCode,
                 self->_ktAccountKeyErrorCode);
  else
    return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p; ktDataForRegistration: %@; ktPublicAccountKey: %@; ktDataSignature: %@; uploadedToKVS: %@; ktAccountKeyTimestamp: %@; ktOptInTimestamp: %@; ktOptInStatus: %lu; ktOptInAbsentReason: %@; ktAccountKeyAbsentReason: %@ >"),
                 *(double *)&v6,
                 v4,
                 self,
                 v6,
                 ktDataSignature,
                 CFSTR("NO"),
                 self->_ktAccountKeyTimestamp,
                 self->_ktOptInTimestamp,
                 self->_ktOptInStatus,
                 self->_ktOptInErrorCode,
                 self->_ktAccountKeyErrorCode);
}

- (id)dataRepresentationWithError:(id *)a3
{
  id v5;
  const char *v6;
  double v7;
  void *v8;
  NSData *ktDataForRegistration;
  NSData *ktPublicAccountKey;
  NSData *ktDataSignature;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  NSDate *ktAccountKeyTimestamp;
  NSDate *ktOptInTimestamp;
  unint64_t ktOptInStatus;
  void *v29;
  const char *v30;
  double v31;
  NSNumber *ktOptInErrorCode;
  NSNumber *ktAccountKeyErrorCode;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v42;
  int v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  IDSKTRegistrationData *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v5;
  ktDataForRegistration = self->_ktDataForRegistration;
  if (ktDataForRegistration)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v6, (uint64_t)ktDataForRegistration, v7, CFSTR("kKTDataForReg"));
  ktPublicAccountKey = self->_ktPublicAccountKey;
  if (ktPublicAccountKey)
    objc_msgSend_setObject_forKeyedSubscript_(v8, v6, (uint64_t)ktPublicAccountKey, v7, CFSTR("kKTDataPubKeyForReg"));
  ktDataSignature = self->_ktDataSignature;
  if (ktDataSignature)
    objc_msgSend_setObject_forKeyedSubscript_(v8, v6, (uint64_t)ktDataSignature, v7, CFSTR("kKTDataSigForReg"));
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v6, self->_uploadedToKVS, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v8, v13, (uint64_t)v12, v14, CFSTR("kKTDataKVSUploaded"));

  objc_msgSend_timeIntervalSinceReferenceDate(self->_registeredTime, v15, v16, v17);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v8, v22, (uint64_t)v21, v23, CFSTR("kKTDataRegTime"));

  ktAccountKeyTimestamp = self->_ktAccountKeyTimestamp;
  if (ktAccountKeyTimestamp)
    objc_msgSend_setObject_forKeyedSubscript_(v8, v24, (uint64_t)ktAccountKeyTimestamp, v25, CFSTR("kKTDataAccountKeyTimestamp"));
  ktOptInTimestamp = self->_ktOptInTimestamp;
  if (ktOptInTimestamp)
    objc_msgSend_setObject_forKeyedSubscript_(v8, v24, (uint64_t)ktOptInTimestamp, v25, CFSTR("kKTDataOptInTimestamp"));
  ktOptInStatus = self->_ktOptInStatus;
  if (ktOptInStatus)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v24, ktOptInStatus, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v8, v30, (uint64_t)v29, v31, CFSTR("kKTDataOptInStatus"));

  }
  ktOptInErrorCode = self->_ktOptInErrorCode;
  if (ktOptInErrorCode)
    objc_msgSend_setObject_forKeyedSubscript_(v8, v24, (uint64_t)ktOptInErrorCode, v25, CFSTR("kKTDataOptInErrorCode"));
  ktAccountKeyErrorCode = self->_ktAccountKeyErrorCode;
  if (ktAccountKeyErrorCode)
    objc_msgSend_setObject_forKeyedSubscript_(v8, v24, (uint64_t)ktAccountKeyErrorCode, v25, CFSTR("kKTDataAccountKeyErrorCode"));
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v24, (uint64_t)v8, v25, 200, 0, a3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v34;
  if (v34)
  {
    v39 = v34;
  }
  else
  {
    objc_msgSend_KeyTransparency(IDSFoundationLog, v35, v36, v37);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v42 = *a3;
      else
        v42 = 0;
      v43 = 138412802;
      v44 = v42;
      v45 = 2112;
      v46 = v8;
      v47 = 2112;
      v48 = self;
      _os_log_error_impl(&dword_19B949000, v40, OS_LOG_TYPE_ERROR, "Failed to create plist - failed to serialize IDSKTRegistrationData { error: %@, dict: %@, ktRegistrationData: %@ }", (uint8_t *)&v43, 0x20u);
    }

  }
  return v38;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *ktDataForRegistration;
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
  id v25;

  ktDataForRegistration = self->_ktDataForRegistration;
  v25 = a3;
  objc_msgSend_encodeObject_forKey_(v25, v5, (uint64_t)ktDataForRegistration, v6, CFSTR("kKTDataForReg"));
  objc_msgSend_encodeObject_forKey_(v25, v7, (uint64_t)self->_ktPublicAccountKey, v8, CFSTR("kKTDataPubKeyForReg"));
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)self->_ktDataSignature, v10, CFSTR("kKTDataSigForReg"));
  objc_msgSend_encodeBool_forKey_(v25, v11, self->_uploadedToKVS, v12, CFSTR("kKTDataKVSUploaded"));
  objc_msgSend_encodeObject_forKey_(v25, v13, (uint64_t)self->_registeredTime, v14, CFSTR("kKTDataRegTime"));
  objc_msgSend_encodeObject_forKey_(v25, v15, (uint64_t)self->_ktAccountKeyTimestamp, v16, CFSTR("kKTDataAccountKeyTimestamp"));
  objc_msgSend_encodeObject_forKey_(v25, v17, (uint64_t)self->_ktOptInTimestamp, v18, CFSTR("kKTDataOptInTimestamp"));
  objc_msgSend_encodeInteger_forKey_(v25, v19, self->_ktOptInStatus, v20, CFSTR("kKTDataOptInStatus"));
  objc_msgSend_encodeObject_forKey_(v25, v21, (uint64_t)self->_ktOptInErrorCode, v22, CFSTR("kKTDataOptInErrorCode"));
  objc_msgSend_encodeObject_forKey_(v25, v23, (uint64_t)self->_ktAccountKeyErrorCode, v24, CFSTR("kKTDataAccountKeyErrorCode"));

}

- (IDSKTRegistrationData)initWithCoder:(id)a3
{
  id v4;
  IDSKTRegistrationData *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  uint64_t v9;
  NSData *ktDataForRegistration;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  NSData *ktPublicAccountKey;
  uint64_t v16;
  const char *v17;
  double v18;
  uint64_t v19;
  NSData *ktDataSignature;
  const char *v21;
  double v22;
  uint64_t v23;
  const char *v24;
  double v25;
  uint64_t v26;
  NSDate *registeredTime;
  uint64_t v28;
  const char *v29;
  double v30;
  uint64_t v31;
  NSDate *ktAccountKeyTimestamp;
  uint64_t v33;
  const char *v34;
  double v35;
  uint64_t v36;
  NSDate *ktOptInTimestamp;
  const char *v38;
  double v39;
  uint64_t v40;
  const char *v41;
  double v42;
  uint64_t v43;
  NSNumber *ktOptInErrorCode;
  uint64_t v45;
  const char *v46;
  double v47;
  uint64_t v48;
  NSNumber *ktAccountKeyErrorCode;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)IDSKTRegistrationData;
  v5 = -[IDSKTRegistrationData init](&v51, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, CFSTR("kKTDataForReg"));
    v9 = objc_claimAutoreleasedReturnValue();
    ktDataForRegistration = v5->_ktDataForRegistration;
    v5->_ktDataForRegistration = (NSData *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, v13, CFSTR("kKTDataPubKeyForReg"));
    v14 = objc_claimAutoreleasedReturnValue();
    ktPublicAccountKey = v5->_ktPublicAccountKey;
    v5->_ktPublicAccountKey = (NSData *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, v18, CFSTR("kKTDataSigForReg"));
    v19 = objc_claimAutoreleasedReturnValue();
    ktDataSignature = v5->_ktDataSignature;
    v5->_ktDataSignature = (NSData *)v19;

    v5->_uploadedToKVS = objc_msgSend_decodeBoolForKey_(v4, v21, (uint64_t)CFSTR("kKTDataKVSUploaded"), v22);
    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, v25, CFSTR("kKTDataRegTime"));
    v26 = objc_claimAutoreleasedReturnValue();
    registeredTime = v5->_registeredTime;
    v5->_registeredTime = (NSDate *)v26;

    v28 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, v30, CFSTR("kKTDataAccountKeyTimestamp"));
    v31 = objc_claimAutoreleasedReturnValue();
    ktAccountKeyTimestamp = v5->_ktAccountKeyTimestamp;
    v5->_ktAccountKeyTimestamp = (NSDate *)v31;

    v33 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, v35, CFSTR("kKTDataOptInTimestamp"));
    v36 = objc_claimAutoreleasedReturnValue();
    ktOptInTimestamp = v5->_ktOptInTimestamp;
    v5->_ktOptInTimestamp = (NSDate *)v36;

    v5->_ktOptInStatus = objc_msgSend_decodeIntegerForKey_(v4, v38, (uint64_t)CFSTR("kKTDataOptInStatus"), v39);
    v40 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, v42, CFSTR("kKTDataOptInErrorCode"));
    v43 = objc_claimAutoreleasedReturnValue();
    ktOptInErrorCode = v5->_ktOptInErrorCode;
    v5->_ktOptInErrorCode = (NSNumber *)v43;

    v45 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v45, v47, CFSTR("kKTDataAccountKeyErrorCode"));
    v48 = objc_claimAutoreleasedReturnValue();
    ktAccountKeyErrorCode = v5->_ktAccountKeyErrorCode;
    v5->_ktAccountKeyErrorCode = (NSNumber *)v48;

  }
  return v5;
}

- (BOOL)needsKVSUpload
{
  return !self->_uploadedToKVS && self->_ktDataSignature && self->_ktPublicAccountKey;
}

- (NSData)ktDataForRegistration
{
  return self->_ktDataForRegistration;
}

- (void)setKtDataForRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_ktDataForRegistration, a3);
}

- (NSData)ktPublicAccountKey
{
  return self->_ktPublicAccountKey;
}

- (void)setKtPublicAccountKey:(id)a3
{
  objc_storeStrong((id *)&self->_ktPublicAccountKey, a3);
}

- (NSData)ktDataSignature
{
  return self->_ktDataSignature;
}

- (void)setKtDataSignature:(id)a3
{
  objc_storeStrong((id *)&self->_ktDataSignature, a3);
}

- (NSDate)registeredTime
{
  return self->_registeredTime;
}

- (void)setRegisteredTime:(id)a3
{
  objc_storeStrong((id *)&self->_registeredTime, a3);
}

- (BOOL)uploadedToKVS
{
  return self->_uploadedToKVS;
}

- (void)setUploadedToKVS:(BOOL)a3
{
  self->_uploadedToKVS = a3;
}

- (NSDate)ktAccountKeyTimestamp
{
  return self->_ktAccountKeyTimestamp;
}

- (void)setKtAccountKeyTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_ktAccountKeyTimestamp, a3);
}

- (NSDate)ktOptInTimestamp
{
  return self->_ktOptInTimestamp;
}

- (void)setKtOptInTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_ktOptInTimestamp, a3);
}

- (unint64_t)ktOptInStatus
{
  return self->_ktOptInStatus;
}

- (void)setKtOptInStatus:(unint64_t)a3
{
  self->_ktOptInStatus = a3;
}

- (NSNumber)ktAccountKeyErrorCode
{
  return self->_ktAccountKeyErrorCode;
}

- (void)setKtAccountKeyErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_ktAccountKeyErrorCode, a3);
}

- (NSNumber)ktOptInErrorCode
{
  return self->_ktOptInErrorCode;
}

- (void)setKtOptInErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_ktOptInErrorCode, a3);
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_storeStrong((id *)&self->_dsid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_ktOptInErrorCode, 0);
  objc_storeStrong((id *)&self->_ktAccountKeyErrorCode, 0);
  objc_storeStrong((id *)&self->_ktOptInTimestamp, 0);
  objc_storeStrong((id *)&self->_ktAccountKeyTimestamp, 0);
  objc_storeStrong((id *)&self->_registeredTime, 0);
  objc_storeStrong((id *)&self->_ktDataSignature, 0);
  objc_storeStrong((id *)&self->_ktPublicAccountKey, 0);
  objc_storeStrong((id *)&self->_ktDataForRegistration, 0);
}

@end
