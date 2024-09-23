@implementation IDSKeyTransparencyTrustedDeviceVerificationMetric

- (IDSKeyTransparencyTrustedDeviceVerificationMetric)initWithKeyTransparencyVersion:(unint64_t)a3 cloudKitSuccess:(BOOL)a4 cloudKitErrorDomain:(id)a5 cloudKitErrorCode:(int64_t)a6 cloudKitUnderlyingErrorDomain:(id)a7 cloudKitUnderlyingErrorCode:(int64_t)a8 cloudKitOperationTimeInterval:(double)a9 accountKeySuccess:(BOOL)a10 accountKeyErrorDomain:(id)a11 accountKeyErrorCode:(int64_t)a12 accountKeyUnderlyingErrorDomain:(id)a13 accountKeyUnderlyingErrorCode:(int64_t)a14 accountKeyOperationTimeInterval:(double)a15 numberOfTotalDevices:(unint64_t)a16 numberOfCandidateDevices:(unint64_t)a17 numberOfMatchesFromCloudKit:(unint64_t)a18 numberOfMatchesFromAccountKey:(unint64_t)a19
{
  id v27;
  id v28;
  id v29;
  IDSKeyTransparencyTrustedDeviceVerificationMetric *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  IDSKeyTransparencyTrustedDeviceVerificationMetric *v34;
  uint64_t v35;
  NSString *cloudKitErrorDomain;
  const char *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  NSString *cloudKitUnderlyingErrorDomain;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSString *accountKeyErrorDomain;
  const char *v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  NSString *accountKeyUnderlyingErrorDomain;
  id v53;
  objc_super v54;

  v53 = a5;
  v27 = a7;
  v28 = a11;
  v29 = a13;
  v54.receiver = self;
  v54.super_class = (Class)IDSKeyTransparencyTrustedDeviceVerificationMetric;
  v30 = -[IDSKeyTransparencyTrustedDeviceVerificationMetric init](&v54, sel_init);
  v34 = v30;
  if (v30)
  {
    v30->_keyTransparencyVersion = a3;
    v30->_cloudKitSuccess = a4;
    v35 = objc_msgSend_copy(v53, v31, v32, v33);
    cloudKitErrorDomain = v34->_cloudKitErrorDomain;
    v34->_cloudKitErrorDomain = (NSString *)v35;

    v34->_cloudKitErrorCode = a6;
    v40 = objc_msgSend_copy(v27, v37, v38, v39);
    cloudKitUnderlyingErrorDomain = v34->_cloudKitUnderlyingErrorDomain;
    v34->_cloudKitUnderlyingErrorDomain = (NSString *)v40;

    v34->_cloudKitUnderlyingErrorCode = a8;
    v42 = ceil(a9);
    v34->_cloudKitOperationTimeInterval = v42;
    v34->_accountKeySuccess = a10;
    v45 = objc_msgSend_copy(v28, v43, v44, v42);
    accountKeyErrorDomain = v34->_accountKeyErrorDomain;
    v34->_accountKeyErrorDomain = (NSString *)v45;

    v34->_accountKeyErrorCode = a12;
    v50 = objc_msgSend_copy(v29, v47, v48, v49);
    accountKeyUnderlyingErrorDomain = v34->_accountKeyUnderlyingErrorDomain;
    v34->_accountKeyUnderlyingErrorDomain = (NSString *)v50;

    v34->_accountKeyUnderlyingErrorCode = a14;
    v34->_accountKeyOperationTimeInterval = ceil(a15);
    v34->_numberOfTotalDevices = a16;
    v34->_numberOfCandidateDevices = a17;
    v34->_numberOfMatchesFromCloudKit = a18;
    v34->_numberOfMatchesFromAccountKey = a19;
  }

  return v34;
}

- (NSString)description
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
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
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  double v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  double v48;
  double v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  const char *v66;
  double v67;
  void *v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;

  v78 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(self, a2, v2, v3);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend_keyTransparencyVersion(self, v5, v6, v7);
  v75 = objc_msgSend_cloudKitSuccess(self, v8, v9, v10);
  objc_msgSend_cloudKitErrorDomain(self, v11, v12, v13);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend_cloudKitErrorCode(self, v14, v15, v16);
  objc_msgSend_cloudKitUnderlyingErrorDomain(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend_cloudKitUnderlyingErrorCode(self, v21, v22, v23);
  objc_msgSend_cloudKitOperationTimeInterval(self, v24, v25, v26);
  v71 = (int)v27;
  v70 = objc_msgSend_accountKeySuccess(self, v28, v29, v27);
  objc_msgSend_accountKeyErrorDomain(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_accountKeyErrorCode(self, v34, v35, v36);
  objc_msgSend_accountKeyUnderlyingErrorDomain(self, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_accountKeyUnderlyingErrorCode(self, v42, v43, v44);
  objc_msgSend_accountKeyOperationTimeInterval(self, v46, v47, v48);
  v50 = (int)v49;
  v53 = objc_msgSend_numberOfTotalDevices(self, v51, v52, v49);
  v57 = objc_msgSend_numberOfCandidateDevices(self, v54, v55, v56);
  v61 = objc_msgSend_numberOfMatchesFromCloudKit(self, v58, v59, v60);
  v65 = objc_msgSend_numberOfMatchesFromAccountKey(self, v62, v63, v64);
  objc_msgSend_stringWithFormat_(v78, v66, (uint64_t)CFSTR("%@: <vers: %ld, ck-success: %ld, ck-error-d: %@, ck-error-c: %ld, ck-uerror-d: %@, ck-uerror-c: %ld, ck-time: %d, ak-success: %ld, ak-error-d: %@, ak-error-c: %ld, ak-uerror-d: %@, ak-uerror-c: %ld, ak-time: %d, devices: %ld, candidates: %ld, ck-matches: %ld, ak-matches: %ld>"), v67, v77, v76, v75, v74, v73, v20, v72, v71, v70, v33, v37, v41, v45, v50, v53,
    v57,
    v61,
    v65);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v68;
}

- (NSString)name
{
  return (NSString *)CFSTR("KeyTransparencyTrustedDeviceVerification");
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
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
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
  const char *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  const char *v47;
  double v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  double v54;
  const char *v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  const char *v62;
  double v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  void *v69;
  __CFString *v70;
  __CFString *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  double v75;
  uint64_t v76;
  const char *v77;
  double v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  double v82;
  uint64_t v83;
  void *v84;
  __CFString *v85;
  __CFString *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  const char *v92;
  double v93;
  void *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  double v98;
  double v99;
  const char *v100;
  void *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  double v105;
  uint64_t v106;
  const char *v107;
  double v108;
  void *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  double v113;
  uint64_t v114;
  const char *v115;
  double v116;
  void *v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  double v121;
  uint64_t v122;
  const char *v123;
  double v124;
  void *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  double v129;
  uint64_t v130;
  const char *v131;
  double v132;
  void *v133;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_keyTransparencyVersion(self, v5, v6, v7);
  objc_msgSend_numberWithUnsignedInteger_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("KTVersion"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_cloudKitSuccess(self, v13, v14, v15);
  objc_msgSend_numberWithBool_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("CKSuccess"), v19);

  objc_msgSend_cloudKitErrorDomain(self, v20, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (__CFString *)v23;
  else
    v25 = &stru_1E3C2E4E8;
  v26 = v25;

  CFDictionarySetValue(v3, CFSTR("CKErrorDomain"), v26);
  v27 = (void *)MEMORY[0x1E0CB37E8];
  v31 = objc_msgSend_cloudKitErrorCode(self, v28, v29, v30);
  objc_msgSend_numberWithInteger_(v27, v32, v31, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    CFDictionarySetValue(v3, CFSTR("CKErrorCode"), v34);

  objc_msgSend_cloudKitUnderlyingErrorDomain(self, v35, v36, v37);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  if (v38)
    v40 = (__CFString *)v38;
  else
    v40 = &stru_1E3C2E4E8;
  v41 = v40;

  CFDictionarySetValue(v3, CFSTR("CKUnderlyingErrorDomain"), v41);
  v42 = (void *)MEMORY[0x1E0CB37E8];
  v46 = objc_msgSend_cloudKitUnderlyingErrorCode(self, v43, v44, v45);
  objc_msgSend_numberWithInteger_(v42, v47, v46, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
    CFDictionarySetValue(v3, CFSTR("CKUnderlyingErrorCode"), v49);

  v50 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitOperationTimeInterval(self, v51, v52, v53);
  objc_msgSend_numberWithInt_(v50, v55, (int)v54, v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
    CFDictionarySetValue(v3, CFSTR("CKTimeInterval"), v56);

  v57 = (void *)MEMORY[0x1E0CB37E8];
  v61 = objc_msgSend_accountKeySuccess(self, v58, v59, v60);
  objc_msgSend_numberWithBool_(v57, v62, v61, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
    CFDictionarySetValue(v3, CFSTR("AKSuccess"), v64);

  objc_msgSend_accountKeyErrorDomain(self, v65, v66, v67);
  v68 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v68;
  if (v68)
    v70 = (__CFString *)v68;
  else
    v70 = &stru_1E3C2E4E8;
  v71 = v70;

  CFDictionarySetValue(v3, CFSTR("AKErrorDomain"), v71);
  v72 = (void *)MEMORY[0x1E0CB37E8];
  v76 = objc_msgSend_accountKeyErrorCode(self, v73, v74, v75);
  objc_msgSend_numberWithInteger_(v72, v77, v76, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
    CFDictionarySetValue(v3, CFSTR("AKErrorCode"), v79);

  objc_msgSend_accountKeyUnderlyingErrorDomain(self, v80, v81, v82);
  v83 = objc_claimAutoreleasedReturnValue();
  v84 = (void *)v83;
  if (v83)
    v85 = (__CFString *)v83;
  else
    v85 = &stru_1E3C2E4E8;
  v86 = v85;

  CFDictionarySetValue(v3, CFSTR("AKUnderlyingErrorDomain"), v86);
  v87 = (void *)MEMORY[0x1E0CB37E8];
  v91 = objc_msgSend_accountKeyUnderlyingErrorCode(self, v88, v89, v90);
  objc_msgSend_numberWithInteger_(v87, v92, v91, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (v94)
    CFDictionarySetValue(v3, CFSTR("AKUnderlyingErrorCode"), v94);

  v95 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_accountKeyOperationTimeInterval(self, v96, v97, v98);
  objc_msgSend_numberWithInt_(v95, v100, (int)v99, v99);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v101)
    CFDictionarySetValue(v3, CFSTR("AKTimeInterval"), v101);

  v102 = (void *)MEMORY[0x1E0CB37E8];
  v106 = objc_msgSend_numberOfTotalDevices(self, v103, v104, v105);
  objc_msgSend_numberWithUnsignedInteger_(v102, v107, v106, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109)
    CFDictionarySetValue(v3, CFSTR("Devices"), v109);

  v110 = (void *)MEMORY[0x1E0CB37E8];
  v114 = objc_msgSend_numberOfCandidateDevices(self, v111, v112, v113);
  objc_msgSend_numberWithUnsignedInteger_(v110, v115, v114, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  if (v117)
    CFDictionarySetValue(v3, CFSTR("Candidates"), v117);

  v118 = (void *)MEMORY[0x1E0CB37E8];
  v122 = objc_msgSend_numberOfMatchesFromCloudKit(self, v119, v120, v121);
  objc_msgSend_numberWithUnsignedInteger_(v118, v123, v122, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if (v125)
    CFDictionarySetValue(v3, CFSTR("CKMatches"), v125);

  v126 = (void *)MEMORY[0x1E0CB37E8];
  v130 = objc_msgSend_numberOfMatchesFromAccountKey(self, v127, v128, v129);
  objc_msgSend_numberWithUnsignedInteger_(v126, v131, v130, v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (v133)
    CFDictionarySetValue(v3, CFSTR("AKMatches"), v133);

  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeKeyTransparencyTrustedDeviceVerification;
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

- (unint64_t)numberOfTotalDevices
{
  return self->_numberOfTotalDevices;
}

- (unint64_t)numberOfCandidateDevices
{
  return self->_numberOfCandidateDevices;
}

- (unint64_t)numberOfMatchesFromCloudKit
{
  return self->_numberOfMatchesFromCloudKit;
}

- (unint64_t)numberOfMatchesFromAccountKey
{
  return self->_numberOfMatchesFromAccountKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountKeyUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_accountKeyErrorDomain, 0);
  objc_storeStrong((id *)&self->_cloudKitUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_cloudKitErrorDomain, 0);
}

@end
