@implementation HKMedicalDownloadableAttachment

- (HKMedicalDownloadableAttachment)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKMedicalDownloadableAttachment)initWithIdentifier:(id)a3 medicalRecordIdentifier:(id)a4 clinicalRecordIdentifier:(id)a5 accountIdentifier:(id)a6 FHIRVersion:(id)a7 type:(int64_t)a8 status:(int64_t)a9 errorStatus:(int64_t)a10 title:(id)a11 webURL:(id)a12 sizeInBytes:(id)a13 contentType:(id)a14 locale:(id)a15 expectedHash:(id)a16 creationDate:(id)a17 retryCount:(int64_t)a18 nextRetryDate:(id)a19 lastUpdatedDate:(id)a20 lastError:(id)a21 fileURL:(id)a22 inlineData:(id)a23 inlineDataChecksum:(id)a24 attachmentIdentifier:(id)a25 metadata:(id)a26
{
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  HKMedicalDownloadableAttachment *v39;
  uint64_t v40;
  NSUUID *identifier;
  uint64_t v42;
  NSUUID *medicalRecordIdentifier;
  uint64_t v44;
  NSUUID *clinicalRecordIdentifier;
  uint64_t v46;
  NSUUID *accountIdentifier;
  uint64_t v48;
  HKFHIRVersion *FHIRVersion;
  uint64_t v50;
  NSString *title;
  uint64_t v52;
  NSURL *webURL;
  uint64_t v54;
  NSNumber *sizeInBytes;
  uint64_t v56;
  NSString *contentType;
  uint64_t v58;
  NSLocale *locale;
  uint64_t v60;
  NSData *expectedHash;
  uint64_t v62;
  NSDate *creationDate;
  uint64_t v64;
  NSDate *nextRetryDate;
  uint64_t v66;
  NSDate *lastUpdatedDate;
  uint64_t v68;
  NSError *lastError;
  uint64_t v70;
  NSURL *fileURL;
  uint64_t v72;
  NSData *inlineData;
  uint64_t v74;
  NSData *inlineDataChecksum;
  uint64_t v76;
  NSUUID *attachmentIdentifier;
  uint64_t v78;
  NSDictionary *metadata;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  objc_super v94;

  v93 = a3;
  v92 = a4;
  v91 = a5;
  v90 = a6;
  v89 = a7;
  v30 = a11;
  v31 = a12;
  v32 = a13;
  v33 = a14;
  v34 = a15;
  v35 = a16;
  v36 = a17;
  v37 = a19;
  v38 = a20;
  v88 = a21;
  v87 = a22;
  v86 = a23;
  v85 = a24;
  v84 = a25;
  v83 = a26;
  v94.receiver = self;
  v94.super_class = (Class)HKMedicalDownloadableAttachment;
  v39 = -[HKMedicalDownloadableAttachment init](&v94, sel_init);
  if (v39)
  {
    v40 = objc_msgSend(v93, "copy");
    identifier = v39->_identifier;
    v39->_identifier = (NSUUID *)v40;

    v42 = objc_msgSend(v92, "copy");
    medicalRecordIdentifier = v39->_medicalRecordIdentifier;
    v39->_medicalRecordIdentifier = (NSUUID *)v42;

    v44 = objc_msgSend(v91, "copy");
    clinicalRecordIdentifier = v39->_clinicalRecordIdentifier;
    v39->_clinicalRecordIdentifier = (NSUUID *)v44;

    v46 = objc_msgSend(v90, "copy");
    accountIdentifier = v39->_accountIdentifier;
    v39->_accountIdentifier = (NSUUID *)v46;

    v48 = objc_msgSend(v89, "copy");
    FHIRVersion = v39->_FHIRVersion;
    v39->_FHIRVersion = (HKFHIRVersion *)v48;

    v39->_type = a8;
    v39->_status = a9;
    v39->_errorStatus = a10;
    v50 = objc_msgSend(v30, "copy");
    title = v39->_title;
    v39->_title = (NSString *)v50;

    v52 = objc_msgSend(v31, "copy");
    webURL = v39->_webURL;
    v39->_webURL = (NSURL *)v52;

    v54 = objc_msgSend(v32, "copy");
    sizeInBytes = v39->_sizeInBytes;
    v39->_sizeInBytes = (NSNumber *)v54;

    v56 = objc_msgSend(v33, "copy");
    contentType = v39->_contentType;
    v39->_contentType = (NSString *)v56;

    v58 = objc_msgSend(v34, "copy");
    locale = v39->_locale;
    v39->_locale = (NSLocale *)v58;

    v60 = objc_msgSend(v35, "copy");
    expectedHash = v39->_expectedHash;
    v39->_expectedHash = (NSData *)v60;

    v62 = objc_msgSend(v36, "copy");
    creationDate = v39->_creationDate;
    v39->_creationDate = (NSDate *)v62;

    v39->_retryCount = a18;
    v64 = objc_msgSend(v37, "copy");
    nextRetryDate = v39->_nextRetryDate;
    v39->_nextRetryDate = (NSDate *)v64;

    v66 = objc_msgSend(v38, "copy");
    lastUpdatedDate = v39->_lastUpdatedDate;
    v39->_lastUpdatedDate = (NSDate *)v66;

    v68 = objc_msgSend(v88, "copy");
    lastError = v39->_lastError;
    v39->_lastError = (NSError *)v68;

    v70 = objc_msgSend(v87, "copy");
    fileURL = v39->_fileURL;
    v39->_fileURL = (NSURL *)v70;

    v72 = objc_msgSend(v86, "copy");
    inlineData = v39->_inlineData;
    v39->_inlineData = (NSData *)v72;

    v74 = objc_msgSend(v85, "copy");
    inlineDataChecksum = v39->_inlineDataChecksum;
    v39->_inlineDataChecksum = (NSData *)v74;

    v76 = objc_msgSend(v84, "copy");
    attachmentIdentifier = v39->_attachmentIdentifier;
    v39->_attachmentIdentifier = (NSUUID *)v76;

    v78 = objc_msgSend(v83, "copy");
    metadata = v39->_metadata;
    v39->_metadata = (NSDictionary *)v78;

  }
  return v39;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicalDownloadableAttachment *v4;
  HKMedicalDownloadableAttachment *v5;
  void *identifier;
  void *v7;
  uint64_t v8;
  NSUUID *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  char v16;
  NSUUID *medicalRecordIdentifier;
  _BOOL4 v18;
  uint64_t v19;
  NSUUID *v20;
  NSUUID *clinicalRecordIdentifier;
  uint64_t v22;
  uint64_t v23;
  NSUUID *v24;
  NSUUID *accountIdentifier;
  uint64_t v26;
  NSUUID *v27;
  HKFHIRVersion *FHIRVersion;
  uint64_t v29;
  HKFHIRVersion *v30;
  int v31;
  int64_t type;
  int64_t status;
  int64_t errorStatus;
  NSString *title;
  uint64_t v36;
  NSString *v37;
  int v38;
  void *v39;
  int v40;
  int v41;
  int v42;
  int v43;
  NSURL *webURL;
  uint64_t v46;
  NSURL *v47;
  NSNumber *sizeInBytes;
  uint64_t v49;
  NSNumber *v50;
  NSString *contentType;
  NSString *v52;
  NSLocale *locale;
  uint64_t v54;
  NSLocale *v55;
  NSData *expectedHash;
  uint64_t v57;
  NSData *v58;
  NSDate *creationDate;
  NSDate *v60;
  int v61;
  int64_t retryCount;
  NSDate *nextRetryDate;
  NSDate *v64;
  NSDate *lastUpdatedDate;
  NSDate *v66;
  NSError *lastError;
  NSError *v68;
  NSURL *fileURL;
  NSURL *v70;
  NSData *inlineData;
  NSData *v72;
  NSData *inlineDataChecksum;
  NSData *v74;
  NSUUID *attachmentIdentifier;
  NSUUID *v76;
  NSDictionary *metadata;
  NSDictionary *v78;
  void *v79;
  void *v80;
  void *v81;
  NSDictionary *v82;
  void *v83;
  NSUUID *v84;
  void *v85;
  void *v86;
  NSData *v87;
  void *v88;
  void *v89;
  NSData *v90;
  void *v91;
  void *v92;
  NSURL *v93;
  void *v94;
  void *v95;
  NSError *v96;
  void *v97;
  void *v98;
  NSDate *v99;
  void *v100;
  NSDate *v101;
  void *v102;
  void *v103;
  void *v104;
  NSDate *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  NSLocale *v111;
  void *v112;
  void *v113;
  NSString *v114;
  void *v115;
  void *v116;
  NSNumber *v117;
  void *v118;
  void *v119;
  NSURL *v120;
  void *v121;
  NSString *v122;
  void *v123;
  void *v124;
  void *v125;
  HKFHIRVersion *v126;
  void *v127;
  void *v128;
  NSUUID *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  NSUUID *v135;
  void *v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;
  unint64_t v152;
  int v153;
  unint64_t v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  int v160;
  _QWORD v161[4];
  void *v162;
  __int128 v163;
  _BOOL4 v164;
  _BOOL4 v165;
  _BOOL4 v166;
  _BOOL4 v167;
  int v168;
  _BOOL4 v169;
  _BOOL4 v170;
  _QWORD v171[4];

  v4 = (HKMedicalDownloadableAttachment *)a3;
  if (self == v4)
  {
    v16 = 1;
    goto LABEL_158;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
    goto LABEL_158;
  }
  v5 = v4;
  identifier = self->_identifier;
  -[HKMedicalDownloadableAttachment identifier](v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = identifier;
  if (identifier != v7)
  {
    -[HKMedicalDownloadableAttachment identifier](v5, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v136 = 0;
      v168 = 0;
      memset(v161, 0, sizeof(v161));
      v10 = 0;
      v152 = 0;
      v11 = 0;
      v159 = 0;
      v155 = 0;
      v157 = 0;
      v154 = 0;
      memset(v171, 0, 28);
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      goto LABEL_39;
    }
    v136 = (void *)v8;
    v9 = self->_identifier;
    -[HKMedicalDownloadableAttachment identifier](v5, "identifier");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSUUID isEqual:](v9, "isEqual:"))
    {
      v168 = 0;
      v10 = 0;
      v152 = 0;
      v11 = 0;
      v159 = 0;
      memset(v161, 0, 28);
      v155 = 0;
      v157 = 0;
      v154 = 0;
      memset(v171, 0, 28);
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      HIDWORD(v161[3]) = 1;
      goto LABEL_39;
    }
  }
  medicalRecordIdentifier = self->_medicalRecordIdentifier;
  -[HKMedicalDownloadableAttachment medicalRecordIdentifier](v5, "medicalRecordIdentifier");
  v135 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  v18 = medicalRecordIdentifier != v135;
  HIDWORD(v161[3]) = identifier != v7;
  if (medicalRecordIdentifier != v135)
  {
    -[HKMedicalDownloadableAttachment medicalRecordIdentifier](v5, "medicalRecordIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v133 = 0;
      v10 = 0;
      memset(v161, 0, 24);
      v152 = 0;
      v11 = 0;
      v159 = 0;
      v155 = 0;
      v157 = 0;
      v154 = 0;
      memset(v171, 0, 28);
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      LODWORD(v161[3]) = 1;
      v168 = 1;
      goto LABEL_39;
    }
    v133 = (void *)v19;
    v20 = self->_medicalRecordIdentifier;
    -[HKMedicalDownloadableAttachment medicalRecordIdentifier](v5, "medicalRecordIdentifier");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSUUID isEqual:](v20, "isEqual:"))
    {
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000000;
      v161[0] = 0;
      v161[1] = 0;
      v10 = 0;
      v152 = 0;
      v11 = 0;
      v159 = 0;
      v155 = 0;
      v157 = 0;
      v154 = 0;
      memset(v171, 0, 28);
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v168 = 1;
      LODWORD(v161[2]) = 1;
      goto LABEL_39;
    }
  }
  clinicalRecordIdentifier = self->_clinicalRecordIdentifier;
  -[HKMedicalDownloadableAttachment clinicalRecordIdentifier](v5, "clinicalRecordIdentifier");
  v22 = objc_claimAutoreleasedReturnValue();
  LODWORD(v171[3]) = clinicalRecordIdentifier != (NSUUID *)v22;
  v168 = v18;
  v132 = (void *)v22;
  if (clinicalRecordIdentifier != (NSUUID *)v22)
  {
    -[HKMedicalDownloadableAttachment clinicalRecordIdentifier](v5, "clinicalRecordIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v130 = 0;
      v161[0] = 0;
      v161[1] = 0;
      v10 = 0;
      v152 = 0;
      v11 = 0;
      v159 = 0;
      v155 = 0;
      v157 = 0;
      memset(v171, 0, 24);
      v154 = 0;
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      LODWORD(v171[3]) = 1;
      goto LABEL_39;
    }
    v130 = (void *)v23;
    v24 = self->_clinicalRecordIdentifier;
    -[HKMedicalDownloadableAttachment clinicalRecordIdentifier](v5, "clinicalRecordIdentifier");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSUUID isEqual:](v24, "isEqual:"))
    {
      v10 = 0;
      v161[0] = 0;
      v152 = 0;
      v11 = 0;
      v159 = 0;
      v155 = 0;
      v157 = 0;
      memset(v171, 0, 24);
      v154 = 0;
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      LODWORD(v171[3]) = 1;
      v161[1] = 1;
      goto LABEL_39;
    }
  }
  accountIdentifier = self->_accountIdentifier;
  -[HKMedicalDownloadableAttachment accountIdentifier](v5, "accountIdentifier");
  v129 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v171[2]) = accountIdentifier != v129;
  if (accountIdentifier != v129)
  {
    -[HKMedicalDownloadableAttachment accountIdentifier](v5, "accountIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      v127 = 0;
      v10 = 0;
      v161[0] = 0;
      v152 = 0;
      v11 = 0;
      v159 = 0;
      v155 = 0;
      v157 = 0;
      v154 = 0;
      memset(v171, 0, 20);
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v171[2]) = 1;
      goto LABEL_39;
    }
    v127 = (void *)v26;
    v27 = self->_accountIdentifier;
    -[HKMedicalDownloadableAttachment accountIdentifier](v5, "accountIdentifier");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSUUID isEqual:](v27, "isEqual:"))
    {
      v161[0] = 0;
      v152 = 0;
      v11 = 0;
      v159 = 0;
      v155 = 0;
      v157 = 0;
      v154 = 0;
      memset(v171, 0, 20);
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v171[2]) = 1;
      v10 = 1;
      goto LABEL_39;
    }
  }
  FHIRVersion = self->_FHIRVersion;
  -[HKMedicalDownloadableAttachment FHIRVersion](v5, "FHIRVersion");
  v126 = (HKFHIRVersion *)objc_claimAutoreleasedReturnValue();
  LODWORD(v171[2]) = FHIRVersion != v126;
  if (FHIRVersion != v126)
  {
    -[HKMedicalDownloadableAttachment FHIRVersion](v5, "FHIRVersion");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v124 = 0;
      v152 = 0;
      v11 = 0;
      v171[1] = 0;
      v159 = 0;
      v161[0] = 0x100000000;
      v155 = 0;
      v157 = 0;
      v171[0] = 0;
      v154 = 0;
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      LODWORD(v171[2]) = 1;
      goto LABEL_39;
    }
    v124 = (void *)v29;
    v30 = self->_FHIRVersion;
    -[HKMedicalDownloadableAttachment FHIRVersion](v5, "FHIRVersion");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[HKFHIRVersion isEqual:](v30, "isEqual:"))
    {
      v11 = 0;
      v171[1] = 0;
      v159 = 0;
      v161[0] = 0x100000000;
      v155 = 0;
      v157 = 0;
      v171[0] = 0;
      LODWORD(v152) = 0;
      v154 = 0;
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      LODWORD(v171[2]) = 1;
      v31 = 1;
LABEL_37:
      HIDWORD(v152) = v31;
      goto LABEL_39;
    }
  }
  type = self->_type;
  if (type != -[HKMedicalDownloadableAttachment type](v5, "type")
    || (status = self->_status, status != -[HKMedicalDownloadableAttachment status](v5, "status"))
    || (errorStatus = self->_errorStatus,
        errorStatus != -[HKMedicalDownloadableAttachment errorStatus](v5, "errorStatus")))
  {
    v11 = 0;
    v171[1] = 0;
    v159 = 0;
    v161[0] = 0x100000000;
    v155 = 0;
    v157 = 0;
    v171[0] = 0;
    LODWORD(v152) = 0;
    v154 = 0;
    v144 = 0;
    v150 = 0;
    v170 = 0;
    v139 = 0;
    v143 = 0;
    v169 = 0;
    v138 = 0;
    v141 = 0;
    v167 = 0;
    v137 = 0;
    v145 = 0;
    v166 = 0;
    v140 = 0;
    v147 = 0;
    v165 = 0;
    v142 = 0;
    v148 = 0;
    v164 = 0;
    v146 = 0;
    v151 = 0;
    v163 = 0uLL;
    v149 = 0;
    v153 = 0;
    v156 = 0;
    v158 = 0;
    v160 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
    LODWORD(v161[2]) = v18;
    v12 = 0;
    v10 = HIDWORD(v171[2]);
    v161[1] = LODWORD(v171[3]) | 0x100000000;
    v31 = v171[2];
    goto LABEL_37;
  }
  title = self->_title;
  -[HKMedicalDownloadableAttachment title](v5, "title");
  v122 = (NSString *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v171[1]) = title != v122;
  if (title != v122)
  {
    -[HKMedicalDownloadableAttachment title](v5, "title");
    v36 = objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      v121 = 0;
      v159 = 0;
      v161[0] = 0x100000000;
      *(_QWORD *)((char *)v171 + 4) = 0;
      v155 = 0;
      v157 = 0;
      LODWORD(v152) = 0;
      v154 = 0;
      LODWORD(v171[0]) = 0;
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v152) = v171[2];
      v11 = 1;
      HIDWORD(v171[1]) = 1;
      goto LABEL_39;
    }
    v121 = (void *)v36;
    v37 = self->_title;
    -[HKMedicalDownloadableAttachment title](v5, "title");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v37, "isEqualToString:"))
    {
      v161[0] = 0x100000000;
      *(_QWORD *)((char *)v171 + 4) = 0;
      v155 = 0;
      v157 = 0;
      LODWORD(v152) = 0;
      v154 = 0;
      LODWORD(v171[0]) = 0;
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v152) = v171[2];
      v11 = 1;
      HIDWORD(v171[1]) = 1;
      v159 = 1;
      goto LABEL_39;
    }
  }
  webURL = self->_webURL;
  -[HKMedicalDownloadableAttachment webURL](v5, "webURL");
  v120 = (NSURL *)objc_claimAutoreleasedReturnValue();
  LODWORD(v171[1]) = webURL != v120;
  if (webURL != v120)
  {
    -[HKMedicalDownloadableAttachment webURL](v5, "webURL");
    v46 = objc_claimAutoreleasedReturnValue();
    if (!v46)
    {
      v118 = 0;
      v155 = 0;
      v157 = 0;
      v171[0] = 0;
      LODWORD(v152) = 0;
      v154 = 0;
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v152) = v171[2];
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      LODWORD(v171[1]) = 1;
      goto LABEL_39;
    }
    v118 = (void *)v46;
    v47 = self->_webURL;
    -[HKMedicalDownloadableAttachment webURL](v5, "webURL");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSURL isEqual:](v47, "isEqual:"))
    {
      v157 = 0;
      v171[0] = 0;
      LODWORD(v152) = 0;
      v154 = 0;
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v152) = v171[2];
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      LODWORD(v171[1]) = 1;
      v155 = 1;
      goto LABEL_39;
    }
  }
  sizeInBytes = self->_sizeInBytes;
  -[HKMedicalDownloadableAttachment sizeInBytes](v5, "sizeInBytes");
  v117 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v171[0]) = sizeInBytes != v117;
  if (sizeInBytes != v117)
  {
    -[HKMedicalDownloadableAttachment sizeInBytes](v5, "sizeInBytes");
    v49 = objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      v115 = 0;
      LODWORD(v152) = 0;
      v154 = 0;
      v171[0] = 0x100000000;
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v152) = v171[2];
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      v155 = v171[1];
      v157 = 1;
      goto LABEL_39;
    }
    v115 = (void *)v49;
    v50 = self->_sizeInBytes;
    -[HKMedicalDownloadableAttachment sizeInBytes](v5, "sizeInBytes");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSNumber isEqual:](v50, "isEqual:"))
    {
      v154 = 0;
      v171[0] = 0x100000000;
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      HIDWORD(v152) = v171[2];
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      v155 = v171[1];
      v157 = 1;
      LODWORD(v152) = 1;
      goto LABEL_39;
    }
  }
  contentType = self->_contentType;
  -[HKMedicalDownloadableAttachment contentType](v5, "contentType");
  v114 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v171[0]) = contentType != v114;
  if (contentType != v114)
  {
    -[HKMedicalDownloadableAttachment contentType](v5, "contentType");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v113)
    {
      v113 = 0;
      v144 = 0;
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      v155 = v171[1];
      v157 = 1;
      v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      v154 = 1;
      LODWORD(v171[0]) = 1;
      goto LABEL_39;
    }
    v52 = self->_contentType;
    -[HKMedicalDownloadableAttachment contentType](v5, "contentType");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v52, "isEqualToString:"))
    {
      v150 = 0;
      v170 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      v155 = v171[1];
      v157 = 1;
      v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      v154 = 1;
      LODWORD(v171[0]) = 1;
      v144 = 1;
      goto LABEL_39;
    }
  }
  locale = self->_locale;
  -[HKMedicalDownloadableAttachment locale](v5, "locale");
  v111 = (NSLocale *)objc_claimAutoreleasedReturnValue();
  v170 = locale != v111;
  if (locale != v111)
  {
    -[HKMedicalDownloadableAttachment locale](v5, "locale");
    v54 = objc_claimAutoreleasedReturnValue();
    if (!v54)
    {
      v109 = 0;
      v139 = 0;
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      v155 = v171[1];
      v157 = 1;
      v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      v154 = 1;
      v144 = v171[0];
      v150 = 1;
      v170 = 1;
      goto LABEL_39;
    }
    v109 = (void *)v54;
    v55 = self->_locale;
    -[HKMedicalDownloadableAttachment locale](v5, "locale");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSLocale isEqual:](v55, "isEqual:"))
    {
      v143 = 0;
      v169 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      v155 = v171[1];
      v157 = 1;
      v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      v154 = 1;
      v144 = v171[0];
      v150 = 1;
      v170 = 1;
      v139 = 1;
      goto LABEL_39;
    }
  }
  expectedHash = self->_expectedHash;
  -[HKMedicalDownloadableAttachment expectedHash](v5, "expectedHash");
  v57 = objc_claimAutoreleasedReturnValue();
  v169 = expectedHash != (NSData *)v57;
  v108 = (void *)v57;
  if (expectedHash != (NSData *)v57)
  {
    -[HKMedicalDownloadableAttachment expectedHash](v5, "expectedHash");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v107)
    {
      v107 = 0;
      v138 = 0;
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      LODWORD(v161[2]) = v18;
      v12 = 0;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      v155 = v171[1];
      v157 = 1;
      v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      v154 = 1;
      v144 = v171[0];
      v150 = 1;
      v139 = v170;
      v143 = 1;
      v169 = 1;
      goto LABEL_39;
    }
    v58 = self->_expectedHash;
    -[HKMedicalDownloadableAttachment expectedHash](v5, "expectedHash");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSData isEqual:](v58, "isEqual:"))
    {
      v141 = 0;
      v167 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      LODWORD(v161[2]) = v168;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      v155 = v171[1];
      v157 = 1;
      v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      v154 = 1;
      v144 = v171[0];
      v150 = 1;
      v139 = v170;
      v143 = 1;
      v169 = 1;
      v138 = 1;
      goto LABEL_39;
    }
  }
  creationDate = self->_creationDate;
  -[HKMedicalDownloadableAttachment creationDate](v5, "creationDate");
  v105 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v167 = creationDate != v105;
  if (creationDate != v105)
  {
    -[HKMedicalDownloadableAttachment creationDate](v5, "creationDate");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v104)
    {
      v104 = 0;
      v137 = 0;
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      LODWORD(v161[2]) = v168;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      v155 = v171[1];
      v157 = 1;
      v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      v154 = 1;
      v144 = v171[0];
      v150 = 1;
      v139 = v170;
      v143 = 1;
      v138 = v169;
      v141 = 1;
      v167 = 1;
      goto LABEL_39;
    }
    v60 = self->_creationDate;
    -[HKMedicalDownloadableAttachment creationDate](v5, "creationDate");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSDate isEqualToDate:](v60, "isEqualToDate:"))
    {
      v145 = 0;
      v166 = 0;
      v140 = 0;
      v147 = 0;
      v165 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      LODWORD(v161[2]) = v168;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      v155 = v171[1];
      v157 = 1;
      v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      v154 = 1;
      v144 = v171[0];
      v150 = 1;
      v139 = v170;
      v143 = 1;
      v138 = v169;
      v141 = 1;
      v167 = 1;
      v61 = 1;
LABEL_195:
      v137 = v61;
      goto LABEL_39;
    }
  }
  retryCount = self->_retryCount;
  if (retryCount != -[HKMedicalDownloadableAttachment retryCount](v5, "retryCount"))
  {
    v145 = 0;
    v166 = 0;
    v140 = 0;
    v147 = 0;
    v165 = 0;
    v142 = 0;
    v148 = 0;
    v164 = 0;
    v146 = 0;
    v151 = 0;
    v163 = 0uLL;
    v149 = 0;
    v153 = 0;
    v156 = 0;
    v158 = 0;
    v160 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    LODWORD(v161[2]) = v168;
    *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
    v10 = HIDWORD(v171[2]);
    v161[1] = LODWORD(v171[3]) | 0x100000000;
    v11 = 1;
    v159 = HIDWORD(v171[1]);
    v161[0] = 0x100000001;
    v155 = v171[1];
    v157 = 1;
    v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
    v154 = 1;
    v144 = v171[0];
    v150 = 1;
    v139 = v170;
    v143 = 1;
    v138 = v169;
    v141 = 1;
    v61 = v167;
    goto LABEL_195;
  }
  nextRetryDate = self->_nextRetryDate;
  -[HKMedicalDownloadableAttachment nextRetryDate](v5, "nextRetryDate");
  v101 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v166 = nextRetryDate != v101;
  if (nextRetryDate == v101)
    goto LABEL_197;
  -[HKMedicalDownloadableAttachment nextRetryDate](v5, "nextRetryDate");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v100)
  {
    v100 = 0;
    v140 = 0;
    v147 = 0;
    v165 = 0;
    v142 = 0;
    v148 = 0;
    v164 = 0;
    v146 = 0;
    v151 = 0;
    v163 = 0uLL;
    v149 = 0;
    v153 = 0;
    v156 = 0;
    v158 = 0;
    v160 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    LODWORD(v161[2]) = v168;
    *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
    v10 = HIDWORD(v171[2]);
    v161[1] = LODWORD(v171[3]) | 0x100000000;
    v11 = 1;
    v159 = HIDWORD(v171[1]);
    v161[0] = 0x100000001;
    v155 = v171[1];
    v157 = 1;
    v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
    v154 = 1;
    v144 = v171[0];
    v150 = 1;
    v139 = v170;
    v143 = 1;
    v138 = v169;
    v141 = 1;
    v137 = v167;
    v145 = 1;
    v166 = 1;
    goto LABEL_39;
  }
  v64 = self->_nextRetryDate;
  -[HKMedicalDownloadableAttachment nextRetryDate](v5, "nextRetryDate");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSDate isEqualToDate:](v64, "isEqualToDate:"))
  {
LABEL_197:
    lastUpdatedDate = self->_lastUpdatedDate;
    -[HKMedicalDownloadableAttachment lastUpdatedDate](v5, "lastUpdatedDate");
    v99 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v165 = lastUpdatedDate != v99;
    if (lastUpdatedDate == v99)
      goto LABEL_202;
    -[HKMedicalDownloadableAttachment lastUpdatedDate](v5, "lastUpdatedDate");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v98)
    {
      v98 = 0;
      v142 = 0;
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      LODWORD(v161[2]) = v168;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      v155 = v171[1];
      v157 = 1;
      v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      v154 = 1;
      v144 = v171[0];
      v150 = 1;
      v139 = v170;
      v143 = 1;
      v138 = v169;
      v141 = 1;
      v137 = v167;
      v145 = 1;
      v140 = v166;
      v147 = 1;
      v165 = 1;
      goto LABEL_39;
    }
    v66 = self->_lastUpdatedDate;
    -[HKMedicalDownloadableAttachment lastUpdatedDate](v5, "lastUpdatedDate");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDate isEqualToDate:](v66, "isEqualToDate:"))
    {
LABEL_202:
      lastError = self->_lastError;
      -[HKMedicalDownloadableAttachment lastError](v5, "lastError");
      v96 = (NSError *)objc_claimAutoreleasedReturnValue();
      v164 = lastError != v96;
      if (lastError == v96)
        goto LABEL_207;
      -[HKMedicalDownloadableAttachment lastError](v5, "lastError");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v95)
      {
        v95 = 0;
        v146 = 0;
        v151 = 0;
        v163 = 0uLL;
        v149 = 0;
        v153 = 0;
        v156 = 0;
        v158 = 0;
        v160 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LODWORD(v161[2]) = v168;
        *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
        v10 = HIDWORD(v171[2]);
        v161[1] = LODWORD(v171[3]) | 0x100000000;
        v11 = 1;
        v159 = HIDWORD(v171[1]);
        v161[0] = 0x100000001;
        v155 = v171[1];
        v157 = 1;
        v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
        v154 = 1;
        v144 = v171[0];
        v150 = 1;
        v139 = v170;
        v143 = 1;
        v138 = v169;
        v141 = 1;
        v137 = v167;
        v145 = 1;
        v140 = v166;
        v147 = 1;
        v142 = v165;
        v148 = 1;
        v164 = 1;
        goto LABEL_39;
      }
      v68 = self->_lastError;
      -[HKMedicalDownloadableAttachment lastError](v5, "lastError");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSError isEqual:](v68, "isEqual:"))
      {
LABEL_207:
        fileURL = self->_fileURL;
        -[HKMedicalDownloadableAttachment fileURL](v5, "fileURL");
        v93 = (NSURL *)objc_claimAutoreleasedReturnValue();
        HIDWORD(v163) = fileURL != v93;
        if (fileURL == v93)
          goto LABEL_212;
        -[HKMedicalDownloadableAttachment fileURL](v5, "fileURL");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v92)
        {
          v92 = 0;
          v149 = 0;
          v153 = 0;
          *(_QWORD *)((char *)&v163 + 4) = 0;
          v156 = 0;
          v158 = 0;
          v160 = 0;
          LODWORD(v163) = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          LODWORD(v161[2]) = v168;
          *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
          v10 = HIDWORD(v171[2]);
          v161[1] = LODWORD(v171[3]) | 0x100000000;
          v11 = 1;
          v159 = HIDWORD(v171[1]);
          v161[0] = 0x100000001;
          v155 = v171[1];
          v157 = 1;
          v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
          v154 = 1;
          v144 = v171[0];
          v150 = 1;
          v139 = v170;
          v143 = 1;
          v138 = v169;
          v141 = 1;
          v137 = v167;
          v145 = 1;
          v140 = v166;
          v147 = 1;
          v142 = v165;
          v148 = 1;
          v146 = v164;
          v151 = 1;
          HIDWORD(v163) = 1;
          goto LABEL_39;
        }
        v70 = self->_fileURL;
        -[HKMedicalDownloadableAttachment fileURL](v5, "fileURL");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSURL isEqual:](v70, "isEqual:"))
        {
LABEL_212:
          inlineData = self->_inlineData;
          -[HKMedicalDownloadableAttachment inlineData](v5, "inlineData");
          v90 = (NSData *)objc_claimAutoreleasedReturnValue();
          DWORD2(v163) = inlineData != v90;
          if (inlineData == v90)
            goto LABEL_217;
          -[HKMedicalDownloadableAttachment inlineData](v5, "inlineData");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v89)
          {
            v89 = 0;
            v156 = 0;
            *(_QWORD *)&v163 = 0;
            v158 = 0;
            v160 = 0;
            v12 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v16 = 0;
            LODWORD(v161[2]) = v168;
            *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
            v10 = HIDWORD(v171[2]);
            v161[1] = LODWORD(v171[3]) | 0x100000000;
            v11 = 1;
            v159 = HIDWORD(v171[1]);
            v161[0] = 0x100000001;
            v155 = v171[1];
            v157 = 1;
            v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
            v154 = 1;
            v144 = v171[0];
            v150 = 1;
            v139 = v170;
            v143 = 1;
            v138 = v169;
            v141 = 1;
            v137 = v167;
            v145 = 1;
            v140 = v166;
            v147 = 1;
            v142 = v165;
            v148 = 1;
            v146 = v164;
            v151 = 1;
            v149 = HIDWORD(v163);
            v153 = 1;
            DWORD2(v163) = 1;
            goto LABEL_39;
          }
          v72 = self->_inlineData;
          -[HKMedicalDownloadableAttachment inlineData](v5, "inlineData");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSData isEqual:](v72, "isEqual:"))
          {
LABEL_217:
            inlineDataChecksum = self->_inlineDataChecksum;
            -[HKMedicalDownloadableAttachment inlineDataChecksum](v5, "inlineDataChecksum");
            v87 = (NSData *)objc_claimAutoreleasedReturnValue();
            DWORD1(v163) = inlineDataChecksum != v87;
            if (inlineDataChecksum == v87)
              goto LABEL_222;
            -[HKMedicalDownloadableAttachment inlineDataChecksum](v5, "inlineDataChecksum");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v86)
            {
              v86 = 0;
              v158 = 0;
              v160 = 0;
              *(_QWORD *)&v163 = 0x100000000;
              v12 = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              LODWORD(v161[2]) = v168;
              *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
              v10 = HIDWORD(v171[2]);
              v161[1] = LODWORD(v171[3]) | 0x100000000;
              v11 = 1;
              v159 = HIDWORD(v171[1]);
              v161[0] = 0x100000001;
              v155 = v171[1];
              v157 = 1;
              v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
              v154 = __PAIR64__(DWORD2(v163), 1);
              v144 = v171[0];
              v150 = 1;
              v139 = v170;
              v143 = 1;
              v138 = v169;
              v141 = 1;
              v137 = v167;
              v145 = 1;
              v140 = v166;
              v147 = 1;
              v142 = v165;
              v148 = 1;
              v146 = v164;
              v151 = 1;
              v149 = HIDWORD(v163);
              v153 = 1;
              v156 = 1;
              goto LABEL_39;
            }
            v74 = self->_inlineDataChecksum;
            -[HKMedicalDownloadableAttachment inlineDataChecksum](v5, "inlineDataChecksum");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSData isEqual:](v74, "isEqual:"))
            {
LABEL_222:
              attachmentIdentifier = self->_attachmentIdentifier;
              -[HKMedicalDownloadableAttachment attachmentIdentifier](v5, "attachmentIdentifier");
              v84 = (NSUUID *)objc_claimAutoreleasedReturnValue();
              LODWORD(v163) = attachmentIdentifier != v84;
              if (attachmentIdentifier == v84)
                goto LABEL_227;
              -[HKMedicalDownloadableAttachment attachmentIdentifier](v5, "attachmentIdentifier");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v83)
              {
                v83 = 0;
                v12 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                LODWORD(v161[2]) = v168;
                *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
                v10 = HIDWORD(v171[2]);
                v161[1] = LODWORD(v171[3]) | 0x100000000;
                v11 = 1;
                v159 = HIDWORD(v171[1]);
                v161[0] = 0x100000001;
                v155 = v171[1];
                v157 = 1;
                v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
                LODWORD(v154) = 1;
                v144 = v171[0];
                v150 = 1;
                v139 = v170;
                v143 = 1;
                v138 = v169;
                v141 = 1;
                v137 = v167;
                v145 = 1;
                v140 = v166;
                v147 = 1;
                v142 = v165;
                v148 = 1;
                v146 = v164;
                v151 = 1;
                v149 = HIDWORD(v163);
                v153 = 1;
                HIDWORD(v154) = DWORD2(v163);
                v156 = 1;
                v158 = DWORD1(v163);
                v160 = 1;
                LODWORD(v163) = 1;
                goto LABEL_39;
              }
              v76 = self->_attachmentIdentifier;
              -[HKMedicalDownloadableAttachment attachmentIdentifier](v5, "attachmentIdentifier");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[NSUUID isEqual:](v76, "isEqual:"))
              {
LABEL_227:
                metadata = self->_metadata;
                -[HKMedicalDownloadableAttachment metadata](v5, "metadata");
                v82 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                if (metadata == v82)
                {
                  v14 = 0;
                  v15 = 0;
                  LODWORD(v161[2]) = v18;
                  *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
                  v10 = HIDWORD(v171[2]);
                  v161[1] = LODWORD(v171[3]) | 0x100000000;
                  v11 = 1;
                  v159 = HIDWORD(v171[1]);
                  v161[0] = 0x100000001;
                  v155 = v171[1];
                  v157 = 1;
                  v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
                  LODWORD(v154) = 1;
                  v144 = v171[0];
                  v150 = 1;
                  v139 = v170;
                  v143 = 1;
                  v138 = v169;
                  v141 = 1;
                  v137 = v167;
                  v145 = 1;
                  v140 = v166;
                  v147 = 1;
                  v142 = v165;
                  v148 = 1;
                  v146 = v164;
                  v82 = metadata;
                  v151 = 1;
                  v149 = HIDWORD(v163);
                  v153 = 1;
                  HIDWORD(v154) = DWORD2(v163);
                  v156 = 1;
                  v12 = v163;
                  v158 = DWORD1(v163);
                  v160 = 1;
                  v13 = 1;
                  v16 = 1;
                }
                else
                {
                  -[HKMedicalDownloadableAttachment metadata](v5, "metadata");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v80)
                  {
                    v78 = self->_metadata;
                    -[HKMedicalDownloadableAttachment metadata](v5, "metadata");
                    identifier = (void *)objc_claimAutoreleasedReturnValue();
                    v16 = -[NSDictionary isEqual:](v78, "isEqual:", identifier);
                    *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
                    v10 = HIDWORD(v171[2]);
                    LODWORD(v161[2]) = v18;
                    v161[1] = LODWORD(v171[3]) | 0x100000000;
                    v11 = 1;
                    v159 = HIDWORD(v171[1]);
                    v161[0] = 0x100000001;
                    v155 = v171[1];
                    v157 = 1;
                    v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
                    LODWORD(v154) = 1;
                    v144 = v171[0];
                    v150 = 1;
                    v139 = v170;
                    v143 = 1;
                    v138 = v169;
                    v141 = 1;
                    v137 = v167;
                    v145 = 1;
                    v140 = v166;
                    v147 = 1;
                    v142 = v165;
                    v148 = 1;
                    v146 = v164;
                    v151 = 1;
                    v149 = HIDWORD(v163);
                    v153 = 1;
                    HIDWORD(v154) = DWORD2(v163);
                    v156 = 1;
                    v12 = v163;
                    v158 = DWORD1(v163);
                    v15 = 1;
                  }
                  else
                  {
                    v80 = 0;
                    v15 = 0;
                    v16 = 0;
                    *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
                    v10 = HIDWORD(v171[2]);
                    LODWORD(v161[2]) = v18;
                    v161[1] = LODWORD(v171[3]) | 0x100000000;
                    v11 = 1;
                    v159 = HIDWORD(v171[1]);
                    v161[0] = 0x100000001;
                    v155 = v171[1];
                    v157 = 1;
                    v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
                    LODWORD(v154) = 1;
                    v144 = v171[0];
                    v150 = 1;
                    v139 = v170;
                    v143 = 1;
                    v138 = v169;
                    v141 = 1;
                    v137 = v167;
                    v145 = 1;
                    v140 = v166;
                    v147 = 1;
                    v142 = v165;
                    v148 = 1;
                    v146 = v164;
                    v151 = 1;
                    v149 = HIDWORD(v163);
                    v153 = 1;
                    HIDWORD(v154) = DWORD2(v163);
                    v156 = 1;
                    v12 = v163;
                    v158 = DWORD1(v163);
                  }
                  v160 = 1;
                  v13 = 1;
                  v14 = 1;
                }
                goto LABEL_39;
              }
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              LODWORD(v161[2]) = v18;
              *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
              v10 = HIDWORD(v171[2]);
              v161[1] = LODWORD(v171[3]) | 0x100000000;
              v11 = 1;
              v159 = HIDWORD(v171[1]);
              v161[0] = 0x100000001;
              v155 = v171[1];
              v157 = 1;
              v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
              LODWORD(v154) = 1;
              v144 = v171[0];
              v150 = 1;
              v139 = v170;
              v143 = 1;
              v138 = v169;
              v141 = 1;
              v137 = v167;
              v145 = 1;
              v140 = v166;
              v147 = 1;
              v142 = v165;
              v148 = 1;
              v146 = v164;
              v151 = 1;
              v149 = HIDWORD(v163);
              v153 = 1;
              HIDWORD(v154) = DWORD2(v163);
              v156 = 1;
              v158 = DWORD1(v163);
              v160 = 1;
              LODWORD(v163) = 1;
              v12 = 1;
            }
            else
            {
              v160 = 0;
              *(_QWORD *)&v163 = 0x100000000;
              v12 = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              LODWORD(v161[2]) = v168;
              *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
              v10 = HIDWORD(v171[2]);
              v161[1] = LODWORD(v171[3]) | 0x100000000;
              v11 = 1;
              v159 = HIDWORD(v171[1]);
              v161[0] = 0x100000001;
              v155 = v171[1];
              v157 = 1;
              v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
              v154 = __PAIR64__(DWORD2(v163), 1);
              v144 = v171[0];
              v150 = 1;
              v139 = v170;
              v143 = 1;
              v138 = v169;
              v141 = 1;
              v137 = v167;
              v145 = 1;
              v140 = v166;
              v147 = 1;
              v142 = v165;
              v148 = 1;
              v146 = v164;
              v151 = 1;
              v149 = HIDWORD(v163);
              v153 = 1;
              v156 = 1;
              v158 = 1;
            }
          }
          else
          {
            v156 = 0;
            *(_QWORD *)&v163 = 0;
            v158 = 0;
            v160 = 0;
            v12 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v16 = 0;
            LODWORD(v161[2]) = v168;
            *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
            v10 = HIDWORD(v171[2]);
            v161[1] = LODWORD(v171[3]) | 0x100000000;
            v11 = 1;
            v159 = HIDWORD(v171[1]);
            v161[0] = 0x100000001;
            v155 = v171[1];
            v157 = 1;
            v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
            v154 = 0x100000001;
            v144 = v171[0];
            v150 = 1;
            v139 = v170;
            v143 = 1;
            v138 = v169;
            v141 = 1;
            v137 = v167;
            v145 = 1;
            v140 = v166;
            v147 = 1;
            v142 = v165;
            v148 = 1;
            v146 = v164;
            v151 = 1;
            v149 = HIDWORD(v163);
            v153 = 1;
            DWORD2(v163) = 1;
          }
        }
        else
        {
          v153 = 0;
          *(_QWORD *)((char *)&v163 + 4) = 0;
          v156 = 0;
          v158 = 0;
          v160 = 0;
          LODWORD(v163) = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          LODWORD(v161[2]) = v168;
          *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
          v10 = HIDWORD(v171[2]);
          v161[1] = LODWORD(v171[3]) | 0x100000000;
          v11 = 1;
          v159 = HIDWORD(v171[1]);
          v161[0] = 0x100000001;
          v155 = v171[1];
          v157 = 1;
          v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
          v154 = 1;
          v144 = v171[0];
          v150 = 1;
          v139 = v170;
          v143 = 1;
          v138 = v169;
          v141 = 1;
          v137 = v167;
          v145 = 1;
          v140 = v166;
          v147 = 1;
          v142 = v165;
          v148 = 1;
          v146 = v164;
          v151 = 1;
          HIDWORD(v163) = 1;
          v149 = 1;
        }
      }
      else
      {
        v151 = 0;
        v163 = 0uLL;
        v149 = 0;
        v153 = 0;
        v156 = 0;
        v158 = 0;
        v160 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LODWORD(v161[2]) = v168;
        *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
        v10 = HIDWORD(v171[2]);
        v161[1] = LODWORD(v171[3]) | 0x100000000;
        v11 = 1;
        v159 = HIDWORD(v171[1]);
        v161[0] = 0x100000001;
        v155 = v171[1];
        v157 = 1;
        v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
        v154 = 1;
        v144 = v171[0];
        v150 = 1;
        v139 = v170;
        v143 = 1;
        v138 = v169;
        v141 = 1;
        v137 = v167;
        v145 = 1;
        v140 = v166;
        v147 = 1;
        v142 = v165;
        v148 = 1;
        v164 = 1;
        v146 = 1;
      }
    }
    else
    {
      v148 = 0;
      v164 = 0;
      v146 = 0;
      v151 = 0;
      v163 = 0uLL;
      v149 = 0;
      v153 = 0;
      v156 = 0;
      v158 = 0;
      v160 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      LODWORD(v161[2]) = v168;
      *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
      v10 = HIDWORD(v171[2]);
      v161[1] = LODWORD(v171[3]) | 0x100000000;
      v11 = 1;
      v159 = HIDWORD(v171[1]);
      v161[0] = 0x100000001;
      v155 = v171[1];
      v157 = 1;
      v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
      v154 = 1;
      v144 = v171[0];
      v150 = 1;
      v139 = v170;
      v143 = 1;
      v138 = v169;
      v141 = 1;
      v137 = v167;
      v145 = 1;
      v140 = v166;
      v147 = 1;
      v165 = 1;
      v142 = 1;
    }
  }
  else
  {
    v147 = 0;
    v165 = 0;
    v142 = 0;
    v148 = 0;
    v164 = 0;
    v146 = 0;
    v151 = 0;
    v163 = 0uLL;
    v149 = 0;
    v153 = 0;
    v156 = 0;
    v158 = 0;
    v160 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    LODWORD(v161[2]) = v168;
    *(_QWORD *)((char *)&v161[2] + 4) = 0x100000001;
    v10 = HIDWORD(v171[2]);
    v161[1] = LODWORD(v171[3]) | 0x100000000;
    v11 = 1;
    v159 = HIDWORD(v171[1]);
    v161[0] = 0x100000001;
    v155 = v171[1];
    v157 = 1;
    v152 = __PAIR64__(v171[2], HIDWORD(v171[0]));
    v154 = 1;
    v144 = v171[0];
    v150 = 1;
    v139 = v170;
    v143 = 1;
    v138 = v169;
    v141 = 1;
    v137 = v167;
    v145 = 1;
    v166 = 1;
    v140 = 1;
  }
LABEL_39:
  if (v15)
  {
    v38 = v12;
    v39 = v7;
    v40 = v13;
    v41 = v11;
    v42 = v10;
    v43 = v14;

    v14 = v43;
    v10 = v42;
    v11 = v41;
    v13 = v40;
    v7 = v39;
    v12 = v38;
  }
  if (v14)

  if (v13)
  if (v12)

  if ((_DWORD)v163)
  if (v160)

  if (v158)
  if (DWORD1(v163))

  if (v156)
  if (HIDWORD(v154))

  if (DWORD2(v163))
  if (v153)

  if (v149)
  if (HIDWORD(v163))

  if (v151)
  if (v146)

  if (v164)
  if (v148)

  if (v142)
  if (v165)

  if (v147)
  if (v140)

  if (v166)
  if (v145)

  if (v137)
  if (v167)

  if (v141)
  if (v138)

  if (v169)
  if (v143)

  if (v139)
  if (v170)

  if (v150)
  if (v144)

  if (LODWORD(v171[0]))
  if ((_DWORD)v154)

  if ((_DWORD)v152)
  if (HIDWORD(v171[0]))

  if (v157)
  if (v155)

  if (LODWORD(v171[1]))
  if (LODWORD(v161[0]))

  if (v159)
  if (HIDWORD(v171[1]))

  if (v11)
  if (HIDWORD(v152))

  if (LODWORD(v171[2]))
  if (HIDWORD(v161[0]))

  if (v10)
  if (HIDWORD(v171[2]))

  if (HIDWORD(v161[1]))
  if (LODWORD(v161[1]))

  if (LODWORD(v171[3]))
  if (HIDWORD(v161[2]))

  if (LODWORD(v161[2]))
  if (v168)

  if (LODWORD(v161[3]))
  if (HIDWORD(v161[3]))

  if (v162 != v7)
LABEL_158:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t errorStatus;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = -[NSUUID hash](self->_identifier, "hash");
  v4 = -[NSUUID hash](self->_medicalRecordIdentifier, "hash") ^ v3;
  v5 = -[NSUUID hash](self->_clinicalRecordIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSUUID hash](self->_accountIdentifier, "hash");
  v7 = v6 ^ -[HKFHIRVersion hash](self->_FHIRVersion, "hash") ^ self->_type ^ self->_status;
  errorStatus = self->_errorStatus;
  v9 = errorStatus ^ -[NSString hash](self->_title, "hash");
  v10 = v9 ^ -[NSURL hash](self->_webURL, "hash");
  v11 = v7 ^ v10 ^ -[NSNumber hash](self->_sizeInBytes, "hash");
  v12 = -[NSString hash](self->_contentType, "hash");
  v13 = v12 ^ -[NSLocale hash](self->_locale, "hash");
  v14 = v13 ^ -[NSData hash](self->_expectedHash, "hash");
  v15 = v11 ^ v14 ^ -[NSDate hash](self->_creationDate, "hash") ^ self->_retryCount;
  v16 = -[NSDate hash](self->_nextRetryDate, "hash");
  v17 = v16 ^ -[NSDate hash](self->_lastUpdatedDate, "hash");
  v18 = v17 ^ -[NSError hash](self->_lastError, "hash");
  v19 = v18 ^ -[NSURL hash](self->_fileURL, "hash");
  v20 = v19 ^ -[NSData hash](self->_inlineData, "hash");
  v21 = v15 ^ v20 ^ -[NSData hash](self->_inlineDataChecksum, "hash");
  v22 = -[NSUUID hash](self->_attachmentIdentifier, "hash");
  return v21 ^ v22 ^ -[NSDictionary hash](self->_metadata, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_medicalRecordIdentifier, CFSTR("MedicalRecordIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clinicalRecordIdentifier, CFSTR("ClinicalRecordIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("AccountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_FHIRVersion, CFSTR("FHIRVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("Type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("Status"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_errorStatus, CFSTR("ErrorStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("Title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webURL, CFSTR("WebURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sizeInBytes, CFSTR("SizeInBytes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentType, CFSTR("ContentType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locale, CFSTR("Locale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expectedHash, CFSTR("ExpectedHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("CreationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_retryCount, CFSTR("RetryCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nextRetryDate, CFSTR("NextRetryDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdatedDate, CFSTR("LastUpdatedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastError, CFSTR("LastError"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileURL, CFSTR("FileURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inlineData, CFSTR("InlineData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inlineDataChecksum, CFSTR("InlineDataChecksum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachmentIdentifier, CFSTR("AttachmentIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));

}

- (HKMedicalDownloadableAttachment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  HKMedicalDownloadableAttachment *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicalRecordIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FHIRVersion"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  v10 = v9 || v7 == 0;
  if (!v10
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("Type"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("Status"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("ErrorStatus"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("RetryCount")) & 1) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClinicalRecordIdentifier"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccountIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
    v22 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Status"));
    v21 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ErrorStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Title"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebURL"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SizeInBytes"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContentType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Locale"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExpectedHash"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RetryCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NextRetryDate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastUpdatedDate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastError"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FileURL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InlineData"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InlineDataChecksum"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AttachmentIdentifierKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "hk_secureCodingClasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("Metadata"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self = objc_retain(-[HKMedicalDownloadableAttachment initWithIdentifier:medicalRecordIdentifier:clinicalRecordIdentifier:accountIdentifier:FHIRVersion:type:status:errorStatus:title:webURL:sizeInBytes:contentType:locale:expectedHash:creationDate:retryCount:nextRetryDate:lastUpdatedDate:lastError:fileURL:inlineData:inlineDataChecksum:attachmentIdentifier:metadata:](self, "initWithIdentifier:medicalRecordIdentifier:clinicalRecordIdentifier:accountIdentifier:FHIRVersion:type:status:errorStatus:title:webURL:sizeInBytes:contentType:locale:expectedHash:creationDate:retryCount:nextRetryDate:lastUpdatedDate:lastError:fileURL:inlineData:inlineDataChecksum:attachmentIdentifier:metadata:", v5, v6, v34, v31, v8, v23, v22, v21, v33, v32, v28, v30, v20, v29,
               v19,
               v18,
               v27,
               v26,
               v25,
               v24,
               v17,
               v16,
               v11,
               v13));

    v14 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v14 = 0;
  }

  return v14;
}

- (id)copyForAccountWithIdentifier:(id)a3 medicalRecordIdentifier:(id)a4 clinicalRecordIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicalDownloadableAttachment.m"), 255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accountIdentifier"));

  }
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:medicalRecordIdentifier:clinicalRecordIdentifier:accountIdentifier:FHIRVersion:type:status:errorStatus:title:webURL:sizeInBytes:contentType:locale:expectedHash:creationDate:retryCount:nextRetryDate:lastUpdatedDate:lastError:fileURL:inlineData:inlineDataChecksum:attachmentIdentifier:metadata:", self->_identifier, v10, v11, v9, self->_FHIRVersion, self->_type, self->_status, self->_errorStatus, self->_title, self->_webURL, self->_sizeInBytes, self->_contentType, self->_locale, self->_expectedHash, self->_creationDate,
                  self->_retryCount,
                  self->_nextRetryDate,
                  self->_lastUpdatedDate,
                  self->_lastError,
                  self->_fileURL,
                  self->_inlineData,
                  self->_inlineDataChecksum,
                  self->_attachmentIdentifier,
                  self->_metadata);

  return v12;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)medicalRecordIdentifier
{
  return self->_medicalRecordIdentifier;
}

- (NSUUID)clinicalRecordIdentifier
{
  return self->_clinicalRecordIdentifier;
}

- (NSUUID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)errorStatus
{
  return self->_errorStatus;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (NSNumber)sizeInBytes
{
  return self->_sizeInBytes;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSData)expectedHash
{
  return self->_expectedHash;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (NSDate)nextRetryDate
{
  return self->_nextRetryDate;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSData)inlineData
{
  return self->_inlineData;
}

- (NSData)inlineDataChecksum
{
  return self->_inlineDataChecksum;
}

- (NSUUID)attachmentIdentifier
{
  return self->_attachmentIdentifier;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_attachmentIdentifier, 0);
  objc_storeStrong((id *)&self->_inlineDataChecksum, 0);
  objc_storeStrong((id *)&self->_inlineData, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_nextRetryDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_expectedHash, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_sizeInBytes, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_FHIRVersion, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_clinicalRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_medicalRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
