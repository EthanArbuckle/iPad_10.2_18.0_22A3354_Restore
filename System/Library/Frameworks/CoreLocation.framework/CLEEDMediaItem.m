@implementation CLEEDMediaItem

- (CLEEDMediaItem)initWithURL:(id)a3 sandboxExtension:(id)a4 mediaType:(int64_t)a5
{
  NSObject *v9;
  const char *v10;
  char *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v9 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v14 = "-[CLEEDMediaItem initWithURL:sandboxExtension:mediaType:]";
    v15 = 2114;
    v16 = a3;
    v17 = 2114;
    v18 = a4;
    v19 = 2050;
    v20 = a5;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[URL:%{public}@,Token:%{public}@,Type:%{public}lu]", buf, 0x2Au);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMediaItem initWithURL:sandboxExtension:mediaType:]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf)
      free(v12);
  }
  return (CLEEDMediaItem *)objc_msgSend_initWithURL_assetIdentifier_sandboxExtension_mediaType_(self, v10, (uint64_t)a3, 0, a4, a5);
}

- (CLEEDMediaItem)initWithURL:(id)a3 assetIdentifier:(id)a4 sandboxExtension:(id)a5 mediaType:(int64_t)a6
{
  NSObject *v11;
  char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  char *v19;
  objc_super v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  int64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v11 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136447234;
    v32 = "-[CLEEDMediaItem initWithURL:assetIdentifier:sandboxExtension:mediaType:]";
    v33 = 2114;
    v34 = a3;
    v35 = 2114;
    v36 = a4;
    v37 = 2114;
    v38 = a5;
    v39 = 2050;
    v40 = a6;
    _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[URL:%{public}@,assetIdentifier:%{public}@,Token:%{public}@,Type:%{public}lu]", buf, 0x34u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v21 = 136447234;
    v22 = "-[CLEEDMediaItem initWithURL:assetIdentifier:sandboxExtension:mediaType:]";
    v23 = 2114;
    v24 = a3;
    v25 = 2114;
    v26 = a4;
    v27 = 2114;
    v28 = a5;
    v29 = 2050;
    v30 = a6;
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMediaItem initWithURL:assetIdentifier:sandboxExtension:mediaType:]", "CoreLocation: %s\n", v19);
    if (v19 != (char *)buf)
      free(v19);
  }
  v20.receiver = self;
  v20.super_class = (Class)CLEEDMediaItem;
  v12 = -[CLEEDMediaItem init](&v20, sel_init);
  if (v12)
  {
    *((_QWORD *)v12 + 4) = a3;
    *((_QWORD *)v12 + 6) = a5;
    *((_QWORD *)v12 + 5) = a4;
    *((_QWORD *)v12 + 2) = a6;
    *((_QWORD *)v12 + 3) = 0;
    *(_OWORD *)(v12 + 56) = 0u;
    *(_OWORD *)(v12 + 72) = 0u;
    *((_QWORD *)v12 + 14) = -1;
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v16 = objc_msgSend_initWithUTF8String_(v13, v14, (uint64_t)"notset", v15);
    *((_QWORD *)v12 + 15) = 0;
    *((_QWORD *)v12 + 12) = 0;
    *((_QWORD *)v12 + 13) = 0;
    *((_QWORD *)v12 + 11) = v16;
    *(_QWORD *)&v17 = -1;
    *((_QWORD *)&v17 + 1) = -1;
    *((_OWORD *)v12 + 8) = v17;
    *((_OWORD *)v12 + 9) = v17;
    *((_WORD *)v12 + 4) = 0;
  }
  return (CLEEDMediaItem *)v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLEEDMediaItem;
  -[CLEEDMediaItem dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_URL(self, a2, v2, v3);
  v10 = objc_msgSend_stagingURL(self, v7, v8, v9);
  v14 = objc_msgSend_mediaItemID(self, v11, v12, v13);
  v18 = objc_msgSend_encryptedFileURL(self, v15, v16, v17);
  v22 = objc_msgSend_type(self, v19, v20, v21);
  v26 = objc_msgSend_uploadStatus(self, v23, v24, v25);
  return (id)objc_msgSend_stringWithFormat_(v5, v27, (uint64_t)CFSTR(" <CLEEDMediaItem: URL, %@, stagingURL, %@, mediaID, %@, encryptedURL, %@, mediaType, %lu, uploadStatus, %lu>"), v28, v6, v10, v14, v18, v22, v26);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_URL, (uint64_t)CFSTR("placeholderURL"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_stagingURL, (uint64_t)CFSTR("stagingURL"));
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_encryptedFileURL, (uint64_t)CFSTR("encryptedURL"));
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_authTag, (uint64_t)CFSTR("authTag"));
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_assetIdentifier, (uint64_t)CFSTR("assetIdentifier"));
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->_mediaItemID, (uint64_t)CFSTR("mediaUUID"));
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_sandboxExtension, (uint64_t)CFSTR("sandboxExtension"));
  objc_msgSend_encodeInteger_forKey_(a3, v11, self->_type, (uint64_t)CFSTR("mediaType"));
  objc_msgSend_encodeInteger_forKey_(a3, v12, self->_uploadStatus, (uint64_t)CFSTR("uploadStatus"));
  objc_msgSend_encodeObject_forKey_(a3, v13, (uint64_t)self->_mediaItemFormat, (uint64_t)CFSTR("mediaItemFormat"));
  objc_msgSend_encodeInteger_forKey_(a3, v14, self->_mediaItemSizeBytes, (uint64_t)CFSTR("mediaItemSizeBytes"));
  objc_msgSend_encodeInteger_forKey_(a3, v15, self->_originalSizeBytes, (uint64_t)CFSTR("originalSizeBytes"));
  objc_msgSend_encodeInteger_forKey_(a3, v16, self->_serverUploadStatus, (uint64_t)CFSTR("serverUploadStatus"));
  objc_msgSend_encodeInteger_forKey_(a3, v17, self->_uploadAttempts, (uint64_t)CFSTR("uploadAttempts"));
  objc_msgSend_encodeInteger_forKey_(a3, v18, self->_durationCopyMs, (uint64_t)CFSTR("durationCopyMs"));
  objc_msgSend_encodeInteger_forKey_(a3, v19, self->_durationTranscodeMs, (uint64_t)CFSTR("durationTranscodeMs"));
  objc_msgSend_encodeInteger_forKey_(a3, v20, self->_durationEncryptionMs, (uint64_t)CFSTR("durationEncryptionMs"));
  objc_msgSend_encodeInteger_forKey_(a3, v21, self->_durationUploadMs, (uint64_t)CFSTR("durationUploadMs"));
  objc_msgSend_encodeBool_forKey_(a3, v22, self->_metricProcessed, (uint64_t)CFSTR("metricProcessed"));
  objc_msgSend_encodeBool_forKey_(a3, v23, self->_didApplyDelayMitigation, (uint64_t)CFSTR("didApplyDelayMitigation"));
}

- (CLEEDMediaItem)initWithCoder:(id)a3
{
  CLEEDMediaItem *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)CLEEDMediaItem;
  v4 = -[CLEEDMediaItem init](&v46, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_URL = (NSURL *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("placeholderURL"));
    v7 = objc_opt_class();
    v4->_stagingURL = (NSURL *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, (uint64_t)CFSTR("stagingURL"));
    v9 = objc_opt_class();
    v4->_encryptedFileURL = (NSURL *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, (uint64_t)CFSTR("encryptedURL"));
    v11 = objc_opt_class();
    v4->_authTag = (NSData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("authTag"));
    v13 = objc_opt_class();
    v4->_assetIdentifier = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("assetIdentifier"));
    v15 = objc_opt_class();
    v4->_mediaItemID = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, (uint64_t)CFSTR("mediaUUID"));
    v17 = objc_opt_class();
    v4->_sandboxExtension = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("sandboxExtension"));
    v4->_type = objc_msgSend_decodeIntegerForKey_(a3, v19, (uint64_t)CFSTR("mediaType"), v20);
    v4->_uploadStatus = objc_msgSend_decodeIntegerForKey_(a3, v21, (uint64_t)CFSTR("uploadStatus"), v22);
    v4->_serverUploadStatus = objc_msgSend_decodeIntegerForKey_(a3, v23, (uint64_t)CFSTR("serverUploadStatus"), v24);
    v25 = objc_opt_class();
    v4->_mediaItemFormat = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v26, v25, (uint64_t)CFSTR("mediaItemFormat"));
    v4->_mediaItemSizeBytes = objc_msgSend_decodeIntegerForKey_(a3, v27, (uint64_t)CFSTR("mediaItemSizeBytes"), v28);
    v4->_originalSizeBytes = objc_msgSend_decodeIntegerForKey_(a3, v29, (uint64_t)CFSTR("originalSizeBytes"), v30);
    v4->_uploadAttempts = objc_msgSend_decodeIntegerForKey_(a3, v31, (uint64_t)CFSTR("uploadAttempts"), v32);
    v4->_durationCopyMs = objc_msgSend_decodeIntegerForKey_(a3, v33, (uint64_t)CFSTR("durationCopyMs"), v34);
    v4->_durationTranscodeMs = objc_msgSend_decodeIntegerForKey_(a3, v35, (uint64_t)CFSTR("durationTranscodeMs"), v36);
    v4->_durationEncryptionMs = objc_msgSend_decodeIntegerForKey_(a3, v37, (uint64_t)CFSTR("durationEncryptionMs"), v38);
    v4->_durationUploadMs = objc_msgSend_decodeIntegerForKey_(a3, v39, (uint64_t)CFSTR("durationUploadMs"), v40);
    v4->_metricProcessed = objc_msgSend_decodeBoolForKey_(a3, v41, (uint64_t)CFSTR("metricProcessed"), v42);
    v4->_didApplyDelayMitigation = objc_msgSend_decodeBoolForKey_(a3, v43, (uint64_t)CFSTR("didApplyDelayMitigation"), v44);
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL result;

  if (a3 == self)
    return 1;
  objc_opt_class();
  result = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend_assetIdentifier(self, v5, v6, v7))
    {
      if (objc_msgSend_assetIdentifier(a3, v8, v9, v10))
      {
        v14 = (void *)objc_msgSend_assetIdentifier(self, v11, v12, v13);
        v18 = objc_msgSend_assetIdentifier(a3, v15, v16, v17);
        if (objc_msgSend_isEqualToString_(v14, v19, v18, v20))
        {
          v24 = objc_msgSend_type(self, v21, v22, v23);
          if (v24 == objc_msgSend_type(a3, v25, v26, v27))
            return 1;
        }
      }
    }
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_assetIdentifier(self, a2, v2, v3);
  return objc_msgSend_hash(v4, v5, v6, v7);
}

- (id)createMediaItemDict
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  NSObject *v168;
  char *v170;
  uint8_t buf[4];
  const char *v172;
  uint64_t v173;

  v173 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = objc_msgSend_type(self, v3, v4, v5);
    v11 = objc_msgSend_numberWithInteger_(v7, v9, v8, v10);
    objc_msgSend_setValue_forKey_(v6, v12, v11, (uint64_t)CFSTR("mediaType"));
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v17 = objc_msgSend_uploadStatus(self, v14, v15, v16);
    v20 = objc_msgSend_numberWithInteger_(v13, v18, v17, v19);
    objc_msgSend_setValue_forKey_(v6, v21, v20, (uint64_t)CFSTR("uploadStatus"));
    v25 = (void *)objc_msgSend_URL(self, v22, v23, v24);
    v29 = objc_msgSend_absoluteString(v25, v26, v27, v28);
    objc_msgSend_setValue_forKey_(v6, v30, v29, (uint64_t)CFSTR("placeholderURL"));
    v34 = objc_msgSend_assetIdentifier(self, v31, v32, v33);
    objc_msgSend_setValue_forKey_(v6, v35, v34, (uint64_t)CFSTR("assetIdentifier"));
    v39 = objc_msgSend_sandboxExtension(self, v36, v37, v38);
    objc_msgSend_setValue_forKey_(v6, v40, v39, (uint64_t)CFSTR("sandboxExtension"));
    v44 = (void *)objc_msgSend_stagingURL(self, v41, v42, v43);
    v48 = objc_msgSend_absoluteString(v44, v45, v46, v47);
    objc_msgSend_setValue_forKey_(v6, v49, v48, (uint64_t)CFSTR("stagingURL"));
    v53 = (void *)objc_msgSend_encryptedFileURL(self, v50, v51, v52);
    v57 = objc_msgSend_absoluteString(v53, v54, v55, v56);
    objc_msgSend_setValue_forKey_(v6, v58, v57, (uint64_t)CFSTR("encryptedURL"));
    v62 = objc_msgSend_authTag(self, v59, v60, v61);
    objc_msgSend_setValue_forKey_(v6, v63, v62, (uint64_t)CFSTR("authTag"));
    v67 = (void *)objc_msgSend_mediaItemID(self, v64, v65, v66);
    v71 = objc_msgSend_UUIDString(v67, v68, v69, v70);
    objc_msgSend_setValue_forKey_(v6, v72, v71, (uint64_t)CFSTR("mediaUUID"));
    v76 = objc_msgSend_mediaItemFormat(self, v73, v74, v75);
    objc_msgSend_setValue_forKey_(v6, v77, v76, (uint64_t)CFSTR("mediaItemFormat"));
    v78 = (void *)MEMORY[0x1E0CB37E8];
    v82 = objc_msgSend_serverUploadStatus(self, v79, v80, v81);
    v85 = objc_msgSend_numberWithInteger_(v78, v83, v82, v84);
    objc_msgSend_setValue_forKey_(v6, v86, v85, (uint64_t)CFSTR("serverUploadStatus"));
    v87 = (void *)MEMORY[0x1E0CB37E8];
    v91 = objc_msgSend_mediaItemSizeBytes(self, v88, v89, v90);
    v94 = objc_msgSend_numberWithUnsignedInteger_(v87, v92, v91, v93);
    objc_msgSend_setValue_forKey_(v6, v95, v94, (uint64_t)CFSTR("mediaItemSizeBytes"));
    v96 = (void *)MEMORY[0x1E0CB37E8];
    v100 = objc_msgSend_originalSizeBytes(self, v97, v98, v99);
    v103 = objc_msgSend_numberWithUnsignedInteger_(v96, v101, v100, v102);
    objc_msgSend_setValue_forKey_(v6, v104, v103, (uint64_t)CFSTR("originalSizeBytes"));
    v105 = (void *)MEMORY[0x1E0CB37E8];
    v109 = objc_msgSend_uploadAttempts(self, v106, v107, v108);
    v112 = objc_msgSend_numberWithUnsignedInteger_(v105, v110, v109, v111);
    objc_msgSend_setValue_forKey_(v6, v113, v112, (uint64_t)CFSTR("uploadAttempts"));
    v114 = (void *)MEMORY[0x1E0CB37E8];
    v118 = objc_msgSend_durationCopyMs(self, v115, v116, v117);
    v121 = objc_msgSend_numberWithInteger_(v114, v119, v118, v120);
    objc_msgSend_setValue_forKey_(v6, v122, v121, (uint64_t)CFSTR("durationCopyMs"));
    v123 = (void *)MEMORY[0x1E0CB37E8];
    v127 = objc_msgSend_durationTranscodeMs(self, v124, v125, v126);
    v130 = objc_msgSend_numberWithInteger_(v123, v128, v127, v129);
    objc_msgSend_setValue_forKey_(v6, v131, v130, (uint64_t)CFSTR("durationTranscodeMs"));
    v132 = (void *)MEMORY[0x1E0CB37E8];
    v136 = objc_msgSend_durationUploadMs(self, v133, v134, v135);
    v139 = objc_msgSend_numberWithInteger_(v132, v137, v136, v138);
    objc_msgSend_setValue_forKey_(v6, v140, v139, (uint64_t)CFSTR("durationUploadMs"));
    v141 = (void *)MEMORY[0x1E0CB37E8];
    v145 = objc_msgSend_durationEncryptionMs(self, v142, v143, v144);
    v148 = objc_msgSend_numberWithInteger_(v141, v146, v145, v147);
    objc_msgSend_setValue_forKey_(v6, v149, v148, (uint64_t)CFSTR("durationEncryptionMs"));
    v150 = (void *)MEMORY[0x1E0CB37E8];
    v154 = objc_msgSend_metricProcessed(self, v151, v152, v153);
    v157 = objc_msgSend_numberWithBool_(v150, v155, v154, v156);
    objc_msgSend_setValue_forKey_(v6, v158, v157, (uint64_t)CFSTR("metricProcessed"));
    v159 = (void *)MEMORY[0x1E0CB37E8];
    v163 = objc_msgSend_didApplyDelayMitigation(self, v160, v161, v162);
    v166 = objc_msgSend_numberWithBool_(v159, v164, v163, v165);
    objc_msgSend_setValue_forKey_(v6, v167, v166, (uint64_t)CFSTR("didApplyDelayMitigation"));
  }
  else
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v168 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v172 = "-[CLEEDMediaItem createMediaItemDict]";
      _os_log_impl(&dword_18F5B3000, v168, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil mediaItemDict, early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v170 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDMediaItem createMediaItemDict]", "CoreLocation: %s\n", v170);
      if (v170 != (char *)buf)
        free(v170);
    }
  }
  return v6;
}

+ (id)createMediaItemFromDict:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  BOOL v25;
  NSObject *v26;
  uint64_t v27;
  CLEEDMediaItem *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  char *v177;
  uint8_t buf[4];
  const char *v179;
  __int16 v180;
  uint64_t v181;
  __int16 v182;
  uint64_t v183;
  uint64_t v184;

  v184 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("placeholderURL"), v3);
  v6 = objc_alloc(MEMORY[0x1E0C99E98]);
  if (v5)
    v9 = (void *)objc_msgSend_initWithString_(v6, v7, v5, v8);
  else
    v9 = (void *)objc_msgSend_initWithString_(v6, v7, (uint64_t)&stru_1E2993188, v8);
  v10 = (uint64_t)v9;
  v11 = v9;
  v14 = objc_msgSend_valueForKey_(a3, v12, (uint64_t)CFSTR("assetIdentifier"), v13);
  v17 = objc_msgSend_valueForKey_(a3, v15, (uint64_t)CFSTR("sandboxExtension"), v16);
  v20 = (void *)objc_msgSend_valueForKey_(a3, v18, (uint64_t)CFSTR("mediaType"), v19);
  v24 = objc_msgSend_intValue(v20, v21, v22, v23);
  if (v10)
    v25 = v17 == 0;
  else
    v25 = 1;
  if (v25)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v26 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446723;
      v179 = "+[CLEEDMediaItem createMediaItemFromDict:]";
      v180 = 2113;
      v181 = v10;
      v182 = 2113;
      v183 = v17;
      _os_log_impl(&dword_18F5B3000, v26, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,URL:%{private}@, sandboxExtension:%{private}@,mandatory item nil, early return", buf, 0x20u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v177 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDMediaItem createMediaItemFromDict:]", "CoreLocation: %s\n", v177);
      if (v177 != (char *)buf)
        free(v177);
    }
    return 0;
  }
  else
  {
    v27 = v24;
    v28 = [CLEEDMediaItem alloc];
    v30 = (void *)objc_msgSend_initWithURL_assetIdentifier_sandboxExtension_mediaType_(v28, v29, v10, v14, v17, v27);
    v33 = (void *)objc_msgSend_valueForKey_(a3, v31, (uint64_t)CFSTR("uploadStatus"), v32);
    v37 = objc_msgSend_intValue(v33, v34, v35, v36);
    objc_msgSend_setUploadStatus_(v30, v38, v37, v39);
    v42 = objc_msgSend_valueForKey_(a3, v40, (uint64_t)CFSTR("stagingURL"), v41);
    if (v42)
    {
      v45 = v42;
      v46 = objc_alloc(MEMORY[0x1E0C99E98]);
      v49 = objc_msgSend_initWithString_(v46, v47, v45, v48);
      objc_msgSend_setStagingURL_(v30, v50, v49, v51);
    }
    else
    {
      objc_msgSend_setStagingURL_(v30, v43, 0, v44);
    }
    v54 = objc_msgSend_valueForKey_(a3, v52, (uint64_t)CFSTR("encryptedURL"), v53);
    if (v54)
    {
      v57 = v54;
      v58 = objc_alloc(MEMORY[0x1E0C99E98]);
      v61 = objc_msgSend_initWithString_(v58, v59, v57, v60);
      objc_msgSend_setEncryptedFileURL_(v30, v62, v61, v63);
    }
    else
    {
      objc_msgSend_setEncryptedFileURL_(v30, v55, 0, v56);
    }
    v66 = objc_msgSend_valueForKey_(a3, v64, (uint64_t)CFSTR("authTag"), v65);
    objc_msgSend_setAuthTag_(v30, v67, v66, v68);
    v71 = objc_msgSend_valueForKey_(a3, v69, (uint64_t)CFSTR("mediaUUID"), v70);
    if (v71)
    {
      v74 = v71;
      v75 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v78 = objc_msgSend_initWithUUIDString_(v75, v76, v74, v77);
      objc_msgSend_setMediaItemID_(v30, v79, v78, v80);
    }
    else
    {
      objc_msgSend_setMediaItemID_(v30, v72, 0, v73);
    }
    v83 = objc_msgSend_valueForKey_(a3, v81, (uint64_t)CFSTR("mediaItemFormat"), v82);
    objc_msgSend_setMediaItemFormat_(v30, v84, v83, v85);
    v88 = (void *)objc_msgSend_valueForKey_(a3, v86, (uint64_t)CFSTR("serverUploadStatus"), v87);
    v92 = objc_msgSend_integerValue(v88, v89, v90, v91);
    objc_msgSend_setServerUploadStatus_(v30, v93, v92, v94);
    v97 = (void *)objc_msgSend_valueForKey_(a3, v95, (uint64_t)CFSTR("mediaItemSizeBytes"), v96);
    v101 = objc_msgSend_unsignedIntegerValue(v97, v98, v99, v100);
    objc_msgSend_setMediaItemSizeBytes_(v30, v102, v101, v103);
    v106 = (void *)objc_msgSend_valueForKey_(a3, v104, (uint64_t)CFSTR("originalSizeBytes"), v105);
    v110 = objc_msgSend_unsignedIntegerValue(v106, v107, v108, v109);
    objc_msgSend_setOriginalSizeBytes_(v30, v111, v110, v112);
    v115 = (void *)objc_msgSend_valueForKey_(a3, v113, (uint64_t)CFSTR("uploadAttempts"), v114);
    v119 = objc_msgSend_unsignedIntegerValue(v115, v116, v117, v118);
    objc_msgSend_setUploadAttempts_(v30, v120, v119, v121);
    v124 = (void *)objc_msgSend_valueForKey_(a3, v122, (uint64_t)CFSTR("durationCopyMs"), v123);
    v128 = objc_msgSend_integerValue(v124, v125, v126, v127);
    objc_msgSend_setDurationCopyMs_(v30, v129, v128, v130);
    v133 = (void *)objc_msgSend_valueForKey_(a3, v131, (uint64_t)CFSTR("durationTranscodeMs"), v132);
    v137 = objc_msgSend_integerValue(v133, v134, v135, v136);
    objc_msgSend_setDurationTranscodeMs_(v30, v138, v137, v139);
    v142 = (void *)objc_msgSend_valueForKey_(a3, v140, (uint64_t)CFSTR("durationUploadMs"), v141);
    v146 = objc_msgSend_integerValue(v142, v143, v144, v145);
    objc_msgSend_setDurationUploadMs_(v30, v147, v146, v148);
    v151 = (void *)objc_msgSend_valueForKey_(a3, v149, (uint64_t)CFSTR("durationEncryptionMs"), v150);
    v155 = objc_msgSend_integerValue(v151, v152, v153, v154);
    objc_msgSend_setDurationEncryptionMs_(v30, v156, v155, v157);
    v160 = (void *)objc_msgSend_valueForKey_(a3, v158, (uint64_t)CFSTR("metricProcessed"), v159);
    v164 = objc_msgSend_BOOLValue(v160, v161, v162, v163);
    objc_msgSend_setMetricProcessed_(v30, v165, v164, v166);
    v169 = (void *)objc_msgSend_valueForKey_(a3, v167, (uint64_t)CFSTR("didApplyDelayMitigation"), v168);
    v173 = objc_msgSend_BOOLValue(v169, v170, v171, v172);
    objc_msgSend_setDidApplyDelayMitigation_(v30, v174, v173, v175);
  }
  return v30;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)uploadStatus
{
  return self->_uploadStatus;
}

- (void)setUploadStatus:(int64_t)a3
{
  self->_uploadStatus = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (NSURL)stagingURL
{
  return self->_stagingURL;
}

- (void)setStagingURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSURL)encryptedFileURL
{
  return self->_encryptedFileURL;
}

- (void)setEncryptedFileURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSData)authTag
{
  return self->_authTag;
}

- (void)setAuthTag:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSUUID)mediaItemID
{
  return self->_mediaItemID;
}

- (void)setMediaItemID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)mediaItemFormat
{
  return self->_mediaItemFormat;
}

- (void)setMediaItemFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (unint64_t)mediaItemSizeBytes
{
  return self->_mediaItemSizeBytes;
}

- (void)setMediaItemSizeBytes:(unint64_t)a3
{
  self->_mediaItemSizeBytes = a3;
}

- (unint64_t)originalSizeBytes
{
  return self->_originalSizeBytes;
}

- (void)setOriginalSizeBytes:(unint64_t)a3
{
  self->_originalSizeBytes = a3;
}

- (int64_t)serverUploadStatus
{
  return self->_serverUploadStatus;
}

- (void)setServerUploadStatus:(int64_t)a3
{
  self->_serverUploadStatus = a3;
}

- (unint64_t)uploadAttempts
{
  return self->_uploadAttempts;
}

- (void)setUploadAttempts:(unint64_t)a3
{
  self->_uploadAttempts = a3;
}

- (int64_t)durationCopyMs
{
  return self->_durationCopyMs;
}

- (void)setDurationCopyMs:(int64_t)a3
{
  self->_durationCopyMs = a3;
}

- (int64_t)durationTranscodeMs
{
  return self->_durationTranscodeMs;
}

- (void)setDurationTranscodeMs:(int64_t)a3
{
  self->_durationTranscodeMs = a3;
}

- (int64_t)durationEncryptionMs
{
  return self->_durationEncryptionMs;
}

- (void)setDurationEncryptionMs:(int64_t)a3
{
  self->_durationEncryptionMs = a3;
}

- (int64_t)durationUploadMs
{
  return self->_durationUploadMs;
}

- (void)setDurationUploadMs:(int64_t)a3
{
  self->_durationUploadMs = a3;
}

- (BOOL)metricProcessed
{
  return self->_metricProcessed;
}

- (void)setMetricProcessed:(BOOL)a3
{
  self->_metricProcessed = a3;
}

- (BOOL)didApplyDelayMitigation
{
  return self->_didApplyDelayMitigation;
}

- (void)setDidApplyDelayMitigation:(BOOL)a3
{
  self->_didApplyDelayMitigation = a3;
}

@end
