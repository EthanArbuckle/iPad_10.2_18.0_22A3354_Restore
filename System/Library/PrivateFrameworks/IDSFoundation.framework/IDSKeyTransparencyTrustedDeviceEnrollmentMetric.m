@implementation IDSKeyTransparencyTrustedDeviceEnrollmentMetric

- (IDSKeyTransparencyTrustedDeviceEnrollmentMetric)initWithKeyTransparencyVersion:(unint64_t)a3 cloudKitSuccess:(BOOL)a4 cloudKitErrorDomain:(id)a5 cloudKitErrorCode:(int64_t)a6 cloudKitUnderlyingErrorDomain:(id)a7 cloudKitUnderlyingErrorCode:(int64_t)a8 cloudKitOperationTimeInterval:(double)a9 accountKeySuccess:(BOOL)a10 accountKeyErrorDomain:(id)a11 accountKeyErrorCode:(int64_t)a12 accountKeyUnderlyingErrorDomain:(id)a13 accountKeyUnderlyingErrorCode:(int64_t)a14 accountKeyOperationTimeInterval:(double)a15
{
  id v23;
  id v24;
  id v25;
  id v26;
  IDSKeyTransparencyTrustedDeviceEnrollmentMetric *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  IDSKeyTransparencyTrustedDeviceEnrollmentMetric *v31;
  uint64_t v32;
  NSString *cloudKitErrorDomain;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  NSString *cloudKitUnderlyingErrorDomain;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSString *accountKeyErrorDomain;
  const char *v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  NSString *accountKeyUnderlyingErrorDomain;
  objc_super v50;

  v23 = a5;
  v24 = a7;
  v25 = a11;
  v26 = a13;
  v50.receiver = self;
  v50.super_class = (Class)IDSKeyTransparencyTrustedDeviceEnrollmentMetric;
  v27 = -[IDSKeyTransparencyTrustedDeviceEnrollmentMetric init](&v50, sel_init);
  v31 = v27;
  if (v27)
  {
    v27->_isKVSMetric = 0;
    v27->_keyTransparencyVersion = a3;
    v27->_cloudKitSuccess = a4;
    v32 = objc_msgSend_copy(v23, v28, v29, v30);
    cloudKitErrorDomain = v31->_cloudKitErrorDomain;
    v31->_cloudKitErrorDomain = (NSString *)v32;

    v31->_cloudKitErrorCode = a6;
    v37 = objc_msgSend_copy(v24, v34, v35, v36);
    cloudKitUnderlyingErrorDomain = v31->_cloudKitUnderlyingErrorDomain;
    v31->_cloudKitUnderlyingErrorDomain = (NSString *)v37;

    v31->_cloudKitUnderlyingErrorCode = a8;
    v39 = ceil(a9);
    v31->_cloudKitOperationTimeInterval = v39;
    v31->_accountKeySuccess = a10;
    v42 = objc_msgSend_copy(v25, v40, v41, v39);
    accountKeyErrorDomain = v31->_accountKeyErrorDomain;
    v31->_accountKeyErrorDomain = (NSString *)v42;

    v31->_accountKeyErrorCode = a12;
    v47 = objc_msgSend_copy(v26, v44, v45, v46);
    accountKeyUnderlyingErrorDomain = v31->_accountKeyUnderlyingErrorDomain;
    v31->_accountKeyUnderlyingErrorDomain = (NSString *)v47;

    v31->_accountKeyUnderlyingErrorCode = a14;
    v31->_accountKeyOperationTimeInterval = ceil(a15);
  }

  return v31;
}

- (IDSKeyTransparencyTrustedDeviceEnrollmentMetric)initWithKeyTransparencyVersion:(unint64_t)a3 kvsSuccess:(BOOL)a4 kvsErrorDomain:(id)a5 kvsErrorCode:(int64_t)a6 kvsSyncTimeInterval:(double)a7 kvsUnderlyingErrorDomain:(id)a8 kvsUnderlyingErrorCode:(int64_t)a9
{
  id v16;
  id v17;
  IDSKeyTransparencyTrustedDeviceEnrollmentMetric *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  IDSKeyTransparencyTrustedDeviceEnrollmentMetric *v22;
  uint64_t v23;
  NSString *kvsErrorDomain;
  objc_super v26;

  v16 = a5;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)IDSKeyTransparencyTrustedDeviceEnrollmentMetric;
  v18 = -[IDSKeyTransparencyTrustedDeviceEnrollmentMetric init](&v26, sel_init);
  v22 = v18;
  if (v18)
  {
    v18->_isKVSMetric = 1;
    v18->_keyTransparencyVersion = a3;
    v18->_kvsSuccess = a4;
    v23 = objc_msgSend_copy(v16, v19, v20, v21);
    kvsErrorDomain = v22->_kvsErrorDomain;
    v22->_kvsErrorDomain = (NSString *)v23;

    v22->_kvsErrorCode = a6;
    v22->_kvsSyncTimeInterval = ceil(a7);
    objc_storeStrong((id *)&v22->_kvsUnderlyingErrorDomain, a8);
    v22->_kvsUnderlyingErrorCode = a9;
  }

  return v22;
}

- (NSString)description
{
  uint64_t v2;
  double v3;
  _BOOL4 isKVSMetric;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  double v47;
  const char *v48;
  uint64_t v49;
  double v50;
  const char *v51;
  uint64_t v52;
  double v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  double v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  double v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  double v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  double v76;
  const char *v77;
  double v78;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  isKVSMetric = self->_isKVSMetric;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(self, a2, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_keyTransparencyVersion(self, v8, v9, v10);
  if (isKVSMetric)
  {
    v15 = objc_msgSend_kvsSuccess(self, v11, v12, v14);
    objc_msgSend_kvsErrorDomain(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_kvsErrorCode(self, v20, v21, v22);
    objc_msgSend_kvsSyncTimeInterval(self, v24, v25, v26);
    v28 = (int)v27;
    objc_msgSend_kvsUnderlyingErrorDomain(self, v29, v30, v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_kvsUnderlyingErrorCode(self, v32, v33, v34);
    objc_msgSend_stringWithFormat_(v6, v36, (uint64_t)CFSTR("%@, <vers: %ld, kvs-success: %ld, kvs-error-d: %@, kvs-error-c: %ld, kvs-time: %d, kvs-uerror-d: %@, kvs-uerror-c: %ld>"), v37, v7, v13, v15, v19, v23, v28, v31, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v84 = objc_msgSend_cloudKitSuccess(self, v11, v12, v14);
    objc_msgSend_cloudKitErrorDomain(self, v39, v40, v41);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend_cloudKitErrorCode(self, v42, v43, v44);
    objc_msgSend_cloudKitUnderlyingErrorDomain(self, v45, v46, v47);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend_cloudKitUnderlyingErrorCode(self, v48, v49, v50);
    objc_msgSend_cloudKitOperationTimeInterval(self, v51, v52, v53);
    v80 = (int)v54;
    v81 = v6;
    v57 = objc_msgSend_accountKeySuccess(self, v55, v56, v54);
    objc_msgSend_accountKeyErrorDomain(self, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend_accountKeyErrorCode(self, v62, v63, v64);
    objc_msgSend_accountKeyUnderlyingErrorDomain(self, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend_accountKeyUnderlyingErrorCode(self, v70, v71, v72);
    objc_msgSend_accountKeyOperationTimeInterval(self, v74, v75, v76);
    objc_msgSend_stringWithFormat_(v81, v77, (uint64_t)CFSTR("%@: <vers: %ld, ck-success: %ld, ck-error-d: %@, ck-error-c: %ld, ck-uerror-d: %@, ck-uerror-c: %ld, ck-time: %d, ak-success: %ld, ak-error-d: %@, ak-error-c: %ld, ak-uerror-d: %@, ak-uerror-c: %ld, ak-time: %d>"), v78, v7, v13, v84, v19, v83, v31, v82, v80, v57, v61, v65, v69, v73, (int)v78);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v38;
}

- (NSString)name
{
  return (NSString *)CFSTR("KeyTransparencyTrustedDeviceEnrollment");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  const char *v32;
  double v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  const char *v51;
  double v52;
  void *v53;
  const __CFString *v54;
  uint64_t v55;
  const char *v56;
  double v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  void *v63;
  __CFString *v64;
  __CFString *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  const char *v71;
  double v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  double v76;
  uint64_t v77;
  void *v78;
  __CFString *v79;
  __CFString *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  double v84;
  uint64_t v85;
  const char *v86;
  double v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  double v92;
  double v93;
  const char *v94;
  void *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  double v99;
  uint64_t v100;
  const char *v101;
  double v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  double v106;
  uint64_t v107;
  void *v108;
  __CFString *v109;
  __CFString *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  double v114;
  uint64_t v115;
  const char *v116;
  double v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  double v121;
  uint64_t v122;
  void *v123;
  __CFString *v124;
  __CFString *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  double v129;
  uint64_t v130;
  const char *v131;
  double v132;
  void *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  double v137;
  double v138;
  const char *v139;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_keyTransparencyVersion(self, v5, v6, v7);
  objc_msgSend_numberWithUnsignedInteger_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("KTVersion"), v11);

  v15 = (void *)MEMORY[0x1E0CB37E8];
  if (self->_isKVSMetric)
  {
    v16 = objc_msgSend_kvsSuccess(self, v12, v13, v14);
    objc_msgSend_numberWithBool_(v15, v17, v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      CFDictionarySetValue(v3, CFSTR("KVSSuccess"), v19);

    objc_msgSend_kvsErrorDomain(self, v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v25 = &stru_1E3C2E4E8;
    if (v23)
      v25 = (__CFString *)v23;
    v26 = v25;

    CFDictionarySetValue(v3, CFSTR("KVSErrorDomain"), v26);
    v27 = (void *)MEMORY[0x1E0CB37E8];
    v31 = objc_msgSend_kvsErrorCode(self, v28, v29, v30);
    objc_msgSend_numberWithInteger_(v27, v32, v31, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
      CFDictionarySetValue(v3, CFSTR("KVSErrorCode"), v34);

    v35 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_kvsSyncTimeInterval(self, v36, v37, v38);
    objc_msgSend_numberWithInt_(v35, v40, (int)v39, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      CFDictionarySetValue(v3, CFSTR("KVSSyncTimeInterval"), v41);

    objc_msgSend_kvsUnderlyingErrorDomain(self, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
      CFDictionarySetValue(v3, CFSTR("KVSUnderlyingErrDomain"), v45);

    v46 = (void *)MEMORY[0x1E0CB37E8];
    v50 = objc_msgSend_kvsUnderlyingErrorCode(self, v47, v48, v49);
    objc_msgSend_numberWithInteger_(v46, v51, v50, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v54 = CFSTR("KVSUnderlyingErrCode");
LABEL_44:
      CFDictionarySetValue(v3, v54, v53);
    }
  }
  else
  {
    v55 = objc_msgSend_cloudKitSuccess(self, v12, v13, v14);
    objc_msgSend_numberWithBool_(v15, v56, v55, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
      CFDictionarySetValue(v3, CFSTR("CKSuccess"), v58);

    objc_msgSend_cloudKitErrorDomain(self, v59, v60, v61);
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)v62;
    if (v62)
      v64 = (__CFString *)v62;
    else
      v64 = &stru_1E3C2E4E8;
    v65 = v64;

    CFDictionarySetValue(v3, CFSTR("CKErrorDomain"), v65);
    v66 = (void *)MEMORY[0x1E0CB37E8];
    v70 = objc_msgSend_cloudKitErrorCode(self, v67, v68, v69);
    objc_msgSend_numberWithInteger_(v66, v71, v70, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
      CFDictionarySetValue(v3, CFSTR("CKErrorCode"), v73);

    objc_msgSend_cloudKitUnderlyingErrorDomain(self, v74, v75, v76);
    v77 = objc_claimAutoreleasedReturnValue();
    v78 = (void *)v77;
    if (v77)
      v79 = (__CFString *)v77;
    else
      v79 = &stru_1E3C2E4E8;
    v80 = v79;

    CFDictionarySetValue(v3, CFSTR("CKUnderlyingErrorDomain"), v80);
    v81 = (void *)MEMORY[0x1E0CB37E8];
    v85 = objc_msgSend_cloudKitUnderlyingErrorCode(self, v82, v83, v84);
    objc_msgSend_numberWithInteger_(v81, v86, v85, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (v88)
      CFDictionarySetValue(v3, CFSTR("CKUnderlyingErrorCode"), v88);

    v89 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_cloudKitOperationTimeInterval(self, v90, v91, v92);
    objc_msgSend_numberWithInt_(v89, v94, (int)v93, v93);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
      CFDictionarySetValue(v3, CFSTR("CKTimeInterval"), v95);

    v96 = (void *)MEMORY[0x1E0CB37E8];
    v100 = objc_msgSend_accountKeySuccess(self, v97, v98, v99);
    objc_msgSend_numberWithBool_(v96, v101, v100, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (v103)
      CFDictionarySetValue(v3, CFSTR("AKSuccess"), v103);

    objc_msgSend_accountKeyErrorDomain(self, v104, v105, v106);
    v107 = objc_claimAutoreleasedReturnValue();
    v108 = (void *)v107;
    if (v107)
      v109 = (__CFString *)v107;
    else
      v109 = &stru_1E3C2E4E8;
    v110 = v109;

    CFDictionarySetValue(v3, CFSTR("AKErrorDomain"), v110);
    v111 = (void *)MEMORY[0x1E0CB37E8];
    v115 = objc_msgSend_accountKeyErrorCode(self, v112, v113, v114);
    objc_msgSend_numberWithInteger_(v111, v116, v115, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (v118)
      CFDictionarySetValue(v3, CFSTR("AKErrorCode"), v118);

    objc_msgSend_accountKeyUnderlyingErrorDomain(self, v119, v120, v121);
    v122 = objc_claimAutoreleasedReturnValue();
    v123 = (void *)v122;
    if (v122)
      v124 = (__CFString *)v122;
    else
      v124 = &stru_1E3C2E4E8;
    v125 = v124;

    CFDictionarySetValue(v3, CFSTR("AKUnderlyingErrorDomain"), v125);
    v126 = (void *)MEMORY[0x1E0CB37E8];
    v130 = objc_msgSend_accountKeyUnderlyingErrorCode(self, v127, v128, v129);
    objc_msgSend_numberWithInteger_(v126, v131, v130, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    if (v133)
      CFDictionarySetValue(v3, CFSTR("AKUnderlyingErrorCode"), v133);

    v134 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_accountKeyOperationTimeInterval(self, v135, v136, v137);
    objc_msgSend_numberWithInt_(v134, v139, (int)v138, v138);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v54 = CFSTR("AKTimeInterval");
      goto LABEL_44;
    }
  }

  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeKeyTransparencyTrustedDeviceEnrollment;
}

- (unint64_t)keyTransparencyVersion
{
  return self->_keyTransparencyVersion;
}

- (BOOL)cloudKitSuccess
{
  return self->_cloudKitSuccess;
}

- (NSString)cloudKitErrorDomain
{
  return self->_cloudKitErrorDomain;
}

- (int64_t)cloudKitErrorCode
{
  return self->_cloudKitErrorCode;
}

- (NSString)cloudKitUnderlyingErrorDomain
{
  return self->_cloudKitUnderlyingErrorDomain;
}

- (int64_t)cloudKitUnderlyingErrorCode
{
  return self->_cloudKitUnderlyingErrorCode;
}

- (double)cloudKitOperationTimeInterval
{
  return self->_cloudKitOperationTimeInterval;
}

- (BOOL)accountKeySuccess
{
  return self->_accountKeySuccess;
}

- (NSString)accountKeyErrorDomain
{
  return self->_accountKeyErrorDomain;
}

- (int64_t)accountKeyErrorCode
{
  return self->_accountKeyErrorCode;
}

- (NSString)accountKeyUnderlyingErrorDomain
{
  return self->_accountKeyUnderlyingErrorDomain;
}

- (int64_t)accountKeyUnderlyingErrorCode
{
  return self->_accountKeyUnderlyingErrorCode;
}

- (double)accountKeyOperationTimeInterval
{
  return self->_accountKeyOperationTimeInterval;
}

- (BOOL)isKVSMetric
{
  return self->_isKVSMetric;
}

- (BOOL)kvsSuccess
{
  return self->_kvsSuccess;
}

- (NSString)kvsErrorDomain
{
  return self->_kvsErrorDomain;
}

- (int64_t)kvsErrorCode
{
  return self->_kvsErrorCode;
}

- (double)kvsSyncTimeInterval
{
  return self->_kvsSyncTimeInterval;
}

- (NSString)kvsUnderlyingErrorDomain
{
  return self->_kvsUnderlyingErrorDomain;
}

- (int64_t)kvsUnderlyingErrorCode
{
  return self->_kvsUnderlyingErrorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvsUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_kvsErrorDomain, 0);
  objc_storeStrong((id *)&self->_accountKeyUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_accountKeyErrorDomain, 0);
  objc_storeStrong((id *)&self->_cloudKitUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_cloudKitErrorDomain, 0);
}

@end
