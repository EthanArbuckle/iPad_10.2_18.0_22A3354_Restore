@implementation CLSAbstractAsset

- (id)_init
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLSAbstractAsset;
  v2 = -[CLSObject _init](&v13, sel__init);
  v3 = v2;
  if (v2)
  {
    atomic_store(0, v2 + 280);
    atomic_store(0, v2 + 281);
    atomic_store(0, v2 + 282);
    v4 = objc_opt_new();
    v5 = (void *)*((_QWORD *)v3 + 19);
    *((_QWORD *)v3 + 19) = v4;

    v6 = objc_opt_new();
    v7 = (void *)*((_QWORD *)v3 + 36);
    *((_QWORD *)v3 + 36) = v6;

    v8 = objc_opt_new();
    v9 = (void *)*((_QWORD *)v3 + 37);
    *((_QWORD *)v3 + 37) = v8;

    v10 = objc_opt_new();
    v11 = (void *)*((_QWORD *)v3 + 38);
    *((_QWORD *)v3 + 38) = v10;

  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  NSURL *URL;
  objc_super v5;

  URL = self->_URL;
  if (URL && self->_URLIsSecurityScoped)
    objc_msgSend_stopAccessingSecurityScopedResource(URL, a2, v2);
  v5.receiver = self;
  v5.super_class = (Class)CLSAbstractAsset;
  -[CLSAbstractAsset dealloc](&v5, sel_dealloc);
}

- (CLSAbstractAsset)initWithCoder:(id)a3
{
  id v4;
  CLSAbstractAsset *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSURL *URL;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSDate *urlExpirationDate;
  uint64_t v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  NSURL *thumbnailURL;
  uint64_t v25;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  UTType *fileUTType;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  NSString *originalFilename;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  NSString *title;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  NSString *ownerPersonID;
  const char *v50;
  double v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  NSString *brItemID;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  NSString *brOwnerName;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  NSString *brZoneName;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  NSString *brShareName;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  NSString *ubiquitousContainerName;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  NSString *relativePathWithinContainer;
  uint64_t v77;
  NSMutableArray *downloadObservers;
  uint64_t v79;
  NSMutableArray *pendingURLCompletions;
  uint64_t v81;
  NSMutableArray *pendingStreamingURLCompletions;
  uint64_t v83;
  NSMutableArray *pendingThumbnailURLCompletions;
  objc_super v86;

  v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)CLSAbstractAsset;
  v5 = -[CLSObject initWithCoder:](&v86, sel_initWithCoder_, v4);
  v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v6, (uint64_t)CFSTR("type"));
  v7 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("url"));
  v9 = objc_claimAutoreleasedReturnValue();
  URL = v5->_URL;
  v5->_URL = (NSURL *)v9;

  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("urlExpirationDate"));
  v13 = objc_claimAutoreleasedReturnValue();
  urlExpirationDate = v5->_urlExpirationDate;
  v5->_urlExpirationDate = (NSDate *)v13;

  v15 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("url_sb"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend_attachSandboxExtensionToken_(v5->_URL, v17, (uint64_t)v18);
    if ((CLSExecutableLinkedOnOrAfter_iOS15_1_macOS_12_0() & 1) == 0)
      v5->_URLIsSecurityScoped = objc_msgSend_startAccessingSecurityScopedResource(v5->_URL, v19, v20);
  }
  v21 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, CFSTR("thumbnailURL"));
  v23 = objc_claimAutoreleasedReturnValue();
  thumbnailURL = v5->_thumbnailURL;
  v5->_thumbnailURL = (NSURL *)v23;

  v25 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, CFSTR("thumbnailURL_sb"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend_attachSandboxExtensionToken_(v5->_thumbnailURL, v27, (uint64_t)v28);
  v5->_original = objc_msgSend_decodeBoolForKey_(v4, v27, (uint64_t)CFSTR("original"));
  v5->_schoolworkSyncStatus = objc_msgSend_decodeIntegerForKey_(v4, v29, (uint64_t)CFSTR("schoolworkSyncStatus"));
  v5->_fileSizeInBytes = objc_msgSend_decodeIntegerForKey_(v4, v30, (uint64_t)CFSTR("fileSizeInBytes"));
  v31 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, CFSTR("fileUTTypeIdentifier"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_msgSend_typeWithIdentifier_(MEMORY[0x1E0CEC3F8], v33, (uint64_t)v34);
    v35 = objc_claimAutoreleasedReturnValue();
    fileUTType = v5->_fileUTType;
    v5->_fileUTType = (UTType *)v35;

  }
  v37 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, CFSTR("originalFilename"));
  v39 = objc_claimAutoreleasedReturnValue();
  originalFilename = v5->_originalFilename;
  v5->_originalFilename = (NSString *)v39;

  v41 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, CFSTR("title"));
  v43 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v43;

  v5->_displayOrder = objc_msgSend_decodeIntegerForKey_(v4, v45, (uint64_t)CFSTR("displayOrder"));
  v46 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, CFSTR("ownerPersonID"));
  v48 = objc_claimAutoreleasedReturnValue();
  ownerPersonID = v5->_ownerPersonID;
  v5->_ownerPersonID = (NSString *)v48;

  objc_msgSend_decodeDoubleForKey_(v4, v50, (uint64_t)CFSTR("durationInSeconds"));
  v5->_durationInSeconds = v51;
  v5->_parentEntityType = objc_msgSend_decodeIntegerForKey_(v4, v52, (uint64_t)CFSTR("parentEntityType"));
  v53 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v54, v53, CFSTR("brItemID"));
  v55 = objc_claimAutoreleasedReturnValue();
  brItemID = v5->_brItemID;
  v5->_brItemID = (NSString *)v55;

  v57 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v58, v57, CFSTR("brOwnerName"));
  v59 = objc_claimAutoreleasedReturnValue();
  brOwnerName = v5->_brOwnerName;
  v5->_brOwnerName = (NSString *)v59;

  v61 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v62, v61, CFSTR("brZoneName"));
  v63 = objc_claimAutoreleasedReturnValue();
  brZoneName = v5->_brZoneName;
  v5->_brZoneName = (NSString *)v63;

  v65 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v66, v65, CFSTR("brShareName"));
  v67 = objc_claimAutoreleasedReturnValue();
  brShareName = v5->_brShareName;
  v5->_brShareName = (NSString *)v67;

  v69 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v70, v69, CFSTR("ubiquitousContainerName"));
  v71 = objc_claimAutoreleasedReturnValue();
  ubiquitousContainerName = v5->_ubiquitousContainerName;
  v5->_ubiquitousContainerName = (NSString *)v71;

  v73 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v74, v73, CFSTR("relativePathWithinContainer"));
  v75 = objc_claimAutoreleasedReturnValue();
  relativePathWithinContainer = v5->_relativePathWithinContainer;
  v5->_relativePathWithinContainer = (NSString *)v75;

  if (v5->_ubiquitousContainerName)
  {
    if (!v5->_type)
      v5->_type = 1;
    if (!v5->_parentEntityType)
      v5->_parentEntityType = 2;
  }
  atomic_store(0, (unsigned __int8 *)&v5->_thumbnailURLRequested);
  atomic_store(0, (unsigned __int8 *)&v5->_URLRequested);
  atomic_store(0, (unsigned __int8 *)&v5->_streamingURLRequested);
  v77 = objc_opt_new();
  downloadObservers = v5->_downloadObservers;
  v5->_downloadObservers = (NSMutableArray *)v77;

  v79 = objc_opt_new();
  pendingURLCompletions = v5->_pendingURLCompletions;
  v5->_pendingURLCompletions = (NSMutableArray *)v79;

  v81 = objc_opt_new();
  pendingStreamingURLCompletions = v5->_pendingStreamingURLCompletions;
  v5->_pendingStreamingURLCompletions = (NSMutableArray *)v81;

  v83 = objc_opt_new();
  pendingThumbnailURLCompletions = v5->_pendingThumbnailURLCompletions;
  v5->_pendingThumbnailURLCompletions = (NSMutableArray *)v83;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  NSURL *URL;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  NSURL *thumbnailURL;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CLSAbstractAsset;
  -[CLSObject encodeWithCoder:](&v39, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_type, CFSTR("type"));
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_urlExpirationDate, CFSTR("urlExpirationDate"));
  URL = self->_URL;
  if (URL)
  {
    objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)URL, CFSTR("url"));
    objc_msgSend_sandboxExtensionTokenForAnyProcess(self->_URL, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v12, CFSTR("url_sb"));

  }
  thumbnailURL = self->_thumbnailURL;
  if (thumbnailURL)
  {
    objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)thumbnailURL, CFSTR("thumbnailURL"));
    objc_msgSend_sandboxExtensionTokenForAnyProcess(self->_thumbnailURL, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v17, CFSTR("thumbnailURL_sb"));

  }
  objc_msgSend_encodeBool_forKey_(v4, v7, self->_original, CFSTR("original"));
  objc_msgSend_encodeInteger_forKey_(v4, v18, self->_schoolworkSyncStatus, CFSTR("schoolworkSyncStatus"));
  objc_msgSend_encodeInteger_forKey_(v4, v19, self->_fileSizeInBytes, CFSTR("fileSizeInBytes"));
  objc_msgSend_fileUTType(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v22;
  if (v22)
  {
    objc_msgSend_identifier(v22, v23, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      objc_msgSend_encodeObject_forKey_(v4, v26, (uint64_t)v27, CFSTR("fileUTTypeIdentifier"));

  }
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)self->_originalFilename, CFSTR("originalFilename"));
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)self->_title, CFSTR("title"));
  objc_msgSend_encodeInteger_forKey_(v4, v29, self->_displayOrder, CFSTR("displayOrder"));
  objc_msgSend_encodeDouble_forKey_(v4, v30, (uint64_t)CFSTR("durationInSeconds"), self->_durationInSeconds);
  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)self->_ownerPersonID, CFSTR("ownerPersonID"));
  objc_msgSend_encodeInteger_forKey_(v4, v32, self->_parentEntityType, CFSTR("parentEntityType"));
  objc_msgSend_encodeObject_forKey_(v4, v33, (uint64_t)self->_brItemID, CFSTR("brItemID"));
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)self->_brZoneName, CFSTR("brZoneName"));
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)self->_brOwnerName, CFSTR("brOwnerName"));
  objc_msgSend_encodeObject_forKey_(v4, v36, (uint64_t)self->_brShareName, CFSTR("brShareName"));
  objc_msgSend_encodeObject_forKey_(v4, v37, (uint64_t)self->_ubiquitousContainerName, CFSTR("ubiquitousContainerName"));
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)self->_relativePathWithinContainer, CFSTR("relativePathWithinContainer"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSURL *URL;
  NSURL *v14;
  NSURL *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t isOriginal;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  const char *v166;
  uint64_t v167;
  uint64_t isDownloaded;
  const char *v169;
  const char *v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  const char *v180;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (void *)objc_msgSend__init(v7, v8, v9);
  objc_msgSend_lock(self, v11, v12);
  URL = self->_URL;
  v14 = self->_thumbnailURL;
  v15 = URL;
  objc_msgSend_unlock(self, v16, v17);
  objc_msgSend_objectID(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_copy(v20, v21, v22);
  objc_msgSend_setObjectID_(v10, v24, (uint64_t)v23);

  objc_msgSend_dateCreated(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend_copy(v27, v28, v29);
  objc_msgSend_setDateCreated_(v10, v31, (uint64_t)v30);

  objc_msgSend_dateLastModified(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend_copy(v34, v35, v36);
  objc_msgSend_setDateLastModified_(v10, v38, (uint64_t)v37);

  objc_msgSend_parentObjectID(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend_copy(v41, v42, v43);
  objc_msgSend_setParentObjectID_(v10, v45, (uint64_t)v44);

  v48 = objc_msgSend_type(self, v46, v47);
  objc_msgSend_setType_(v10, v49, v48);
  v52 = (void *)objc_msgSend_copy(v15, v50, v51);
  objc_msgSend_setURL_(v10, v53, (uint64_t)v52);

  objc_msgSend_urlExpirationDate(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend_copy(v56, v57, v58);
  objc_msgSend_setUrlExpirationDate_(v10, v60, (uint64_t)v59);

  v63 = (void *)objc_msgSend_copy(v14, v61, v62);
  objc_msgSend_setThumbnailURL_(v10, v64, (uint64_t)v63);

  isOriginal = objc_msgSend_isOriginal(self, v65, v66);
  objc_msgSend_setOriginal_(v10, v68, isOriginal);
  objc_msgSend_originalFilename(self, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend_copy(v71, v72, v73);
  objc_msgSend_setOriginalFilename_(v10, v75, (uint64_t)v74);

  v78 = objc_msgSend_schoolworkSyncStatus(self, v76, v77);
  objc_msgSend_setSchoolworkSyncStatus_(v10, v79, v78);
  v82 = objc_msgSend_fileSizeInBytes(self, v80, v81);
  objc_msgSend_setFileSizeInBytes_(v10, v83, v82);
  objc_msgSend_filenameExtension(self, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = (void *)objc_msgSend_copy(v86, v87, v88);
  objc_msgSend_setFilenameExtension_(v10, v90, (uint64_t)v89);

  objc_msgSend_fileUTType(self, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)objc_msgSend_copy(v93, v94, v95);
  objc_msgSend_setFileUTType_(v10, v97, (uint64_t)v96);

  objc_msgSend_title(self, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = (void *)objc_msgSend_copy(v100, v101, v102);
  objc_msgSend_setTitle_(v10, v104, (uint64_t)v103);

  v107 = objc_msgSend_displayOrder(self, v105, v106);
  objc_msgSend_setDisplayOrder_(v10, v108, v107);
  objc_msgSend_durationInSeconds(self, v109, v110);
  objc_msgSend_setDurationInSeconds_(v10, v111, v112);
  objc_msgSend_ownerPersonID(self, v113, v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = (void *)objc_msgSend_copy(v115, v116, v117);
  objc_msgSend_setOwnerPersonID_(v10, v119, (uint64_t)v118);

  v122 = objc_msgSend_parentEntityType(self, v120, v121);
  objc_msgSend_setParentEntityType_(v10, v123, v122);
  objc_msgSend_brItemID(self, v124, v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = (void *)objc_msgSend_copy(v126, v127, v128);
  objc_msgSend_setBrItemID_(v10, v130, (uint64_t)v129);

  objc_msgSend_brOwnerName(self, v131, v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = (void *)objc_msgSend_copy(v133, v134, v135);
  objc_msgSend_setBrOwnerName_(v10, v137, (uint64_t)v136);

  objc_msgSend_brZoneName(self, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = (void *)objc_msgSend_copy(v140, v141, v142);
  objc_msgSend_setBrZoneName_(v10, v144, (uint64_t)v143);

  objc_msgSend_brShareName(self, v145, v146);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = (void *)objc_msgSend_copy(v147, v148, v149);
  objc_msgSend_setBrShareName_(v10, v151, (uint64_t)v150);

  objc_msgSend_ubiquitousContainerName(self, v152, v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = (void *)objc_msgSend_copy(v154, v155, v156);
  objc_msgSend_setUbiquitousContainerName_(v10, v158, (uint64_t)v157);

  objc_msgSend_relativePathWithinContainer(self, v159, v160);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = (void *)objc_msgSend_copy(v161, v162, v163);
  objc_msgSend_setRelativePathWithinContainer_(v10, v165, (uint64_t)v164);

  isDownloaded = objc_msgSend_isDownloaded(self, v166, v167);
  objc_msgSend_setDownloaded_(v10, v169, isDownloaded);
  objc_msgSend_fractionDownloaded(self, v170, v171);
  objc_msgSend_setFractionDownloaded_(v10, v172, v173);
  objc_msgSend_downloadError(self, v174, v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = (void *)objc_msgSend_copy(v176, v177, v178);
  objc_msgSend_setDownloadError_(v10, v180, (uint64_t)v179);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t isOriginal;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  int isEqualToString;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  char isEqual;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  int v62;
  char v63;
  int v64;
  int v65;
  int v66;
  int v67;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  void *v81;
  int v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  int v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  int v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  double v149;
  double v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  double v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  const char *v166;
  int v167;
  const char *v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  const char *v237;
  int v238;
  const char *v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  double v243;
  double v244;
  const char *v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  double v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  const char *v260;
  id v261;
  id *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  int v355;
  int v356;
  int v357;
  int v358;
  int v359;
  int v360;
  uint64_t v361;
  int v362;
  int v363;
  int v364;
  int v365;
  int v366;
  int v367;
  int v368;
  int v369;
  int v370;
  int v371;
  int v372;
  int v373;
  int v374;
  int v375;
  int v376;
  int v377;
  uint64_t v378;
  int v379;
  int v380;
  int v381;
  int v382;
  int v383;
  int v384;
  _BOOL4 v385;
  int v386;
  int v387;
  int v388;
  int v389;
  int v390;
  _BOOL4 v391;
  int v392;
  int v393;
  int v394;
  _BOOL4 v395;
  uint64_t v396;
  _BOOL4 v397;
  int v398;
  _BOOL4 v399;
  int v400;
  _BOOL4 v401;
  _BOOL4 v402;
  _BOOL4 v403;
  _BOOL4 v404;
  _BOOL4 v405;
  _BOOL4 v406;
  _BOOL4 v407;
  _BOOL4 v408;
  _BOOL4 v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  int v414;
  int v415;
  int v416;
  uint64_t v417;
  int v418;
  _BOOL4 v419;
  int v420;
  _BOOL4 v421;
  int v422;
  unsigned int v423;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    isEqual = 0;
    goto LABEL_182;
  }
  v5 = (id *)v4;
  objc_msgSend_lock(self, v6, v7);
  v8 = self->_URL;
  isOriginal = 120;
  v10 = self->_thumbnailURL;
  objc_msgSend_unlock(self, v11, v12);
  objc_msgSend_lock(v5, v13, v14);
  v15 = (unint64_t)v5[14];
  v16 = (unint64_t)v5[15];
  objc_msgSend_unlock(v5, v17, v18);
  objc_msgSend_objectID(self, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v412 = (void *)v10;
  v413 = (void *)v8;
  v410 = (void *)v16;
  v411 = (void *)v15;
  if (!v23)
  {
    objc_msgSend_objectID(v5, v21, v22);
    v351 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v351)
    {
      v351 = 0;
      isOriginal = 0;
      goto LABEL_12;
    }
  }
  objc_msgSend_objectID(self, v21, v22);
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    v354 = 0;
    v396 = 0;
    v417 = 0;
    v409 = 0;
    v422 = 0;
    v393 = 0;
    v389 = 0;
    v421 = 0;
    v392 = 0;
    v408 = 0;
    v420 = 0;
    v387 = 0;
    v383 = 0;
    v419 = 0;
    v386 = 0;
    v407 = 0;
    v418 = 0;
    v382 = 0;
    v380 = 0;
    v35 = 0;
    v406 = 0;
    v36 = 0;
    v379 = 0;
    v381 = 0;
    v405 = 0;
    v416 = 0;
    v375 = 0;
    v373 = 0;
    v376 = 0;
    v404 = 0;
    v415 = 0;
    v364 = 0;
    v355 = 0;
    v374 = 0;
    v403 = 0;
    v414 = 0;
    v363 = 0;
    v356 = 0;
    v371 = 0;
    v402 = 0;
    v400 = 0;
    v361 = 0;
    v368 = 0;
    v401 = 0;
    v398 = 0;
    v357 = 0;
    v359 = 0;
    v365 = 0;
    v399 = 0;
    v394 = 0;
    v358 = 0;
    v360 = 0;
    v367 = 0;
    v397 = 0;
    v390 = 0;
    v362 = 0;
    v366 = 0;
    v370 = 0;
    v395 = 0;
    v388 = 0;
    v369 = 0;
    v372 = 0;
    v378 = 0;
    v391 = 0;
    v384 = 0;
    v377 = 0;
    v37 = 0;
    v385 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    isEqual = 0;
    v423 = 1;
    goto LABEL_29;
  }
  v354 = (void *)v24;
  objc_msgSend_objectID(v5, v25, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    v353 = 0;
    v396 = 0x100000000;
    v417 = 0;
    v409 = 0;
    v422 = 0;
    v393 = 0;
    v389 = 0;
    v421 = 0;
    v392 = 0;
    v408 = 0;
    v420 = 0;
    v387 = 0;
    v383 = 0;
    v419 = 0;
    v386 = 0;
    v407 = 0;
    v418 = 0;
    v382 = 0;
    v380 = 0;
    v35 = 0;
    v406 = 0;
    v36 = 0;
    v379 = 0;
    v381 = 0;
    v405 = 0;
    v416 = 0;
    v375 = 0;
    v373 = 0;
    v376 = 0;
    v404 = 0;
    v415 = 0;
    v364 = 0;
    v355 = 0;
    v374 = 0;
    v403 = 0;
    v414 = 0;
    v363 = 0;
    v356 = 0;
    v371 = 0;
    v402 = 0;
    v400 = 0;
    v361 = 0;
    v368 = 0;
    v401 = 0;
    v398 = 0;
    v357 = 0;
    v359 = 0;
    v365 = 0;
    v399 = 0;
    v394 = 0;
    v358 = 0;
    v360 = 0;
    v367 = 0;
    v397 = 0;
    v390 = 0;
    v362 = 0;
    v366 = 0;
    v370 = 0;
    v395 = 0;
    v388 = 0;
    v369 = 0;
    v372 = 0;
    v378 = 0;
    v391 = 0;
    v384 = 0;
    v377 = 0;
    v37 = 0;
    v385 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    isEqual = 0;
    v423 = 1;
    goto LABEL_29;
  }
  v353 = (void *)v27;
  objc_msgSend_objectID(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(v5, v31, v32);
  v350 = v30;
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v30, v33, (uint64_t)v349);
  isOriginal = 1;
  if (isEqualToString)
  {
LABEL_12:
    objc_msgSend_parentObjectID(self, v21, v22);
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    v423 = isOriginal;
    v409 = v348 == 0;
    if (v348
      || (objc_msgSend_parentObjectID(v5, v42, v43), (v345 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_parentObjectID(self, v42, v43);
      v44 = objc_claimAutoreleasedReturnValue();
      if (!v44)
      {
        v347 = 0;
        v393 = 0;
        v389 = 0;
        v421 = 0;
        v392 = 0;
        v408 = 0;
        v420 = 0;
        v387 = 0;
        v383 = 0;
        v419 = 0;
        v386 = 0;
        v407 = 0;
        v418 = 0;
        v382 = 0;
        v380 = 0;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        isEqual = 0;
        v417 = 1;
        LODWORD(v396) = isOriginal;
        HIDWORD(v396) = isOriginal;
        v422 = 1;
        goto LABEL_29;
      }
      v347 = (void *)v44;
      objc_msgSend_parentObjectID(v5, v45, v46);
      v47 = objc_claimAutoreleasedReturnValue();
      if (!v47)
      {
        v346 = 0;
        v389 = 0;
        v421 = 0;
        v392 = 0;
        v408 = 0;
        v420 = 0;
        v387 = 0;
        v383 = 0;
        v419 = 0;
        v386 = 0;
        v407 = 0;
        v418 = 0;
        v382 = 0;
        v380 = 0;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        isEqual = 0;
        v417 = 1;
        LODWORD(v396) = isOriginal;
        HIDWORD(v396) = isOriginal;
        v422 = 1;
        v393 = 1;
        goto LABEL_29;
      }
      v261 = v4;
      v50 = v23;
      v346 = (void *)v47;
      objc_msgSend_parentObjectID(self, v48, v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parentObjectID(v5, v52, v53);
      v344 = v51;
      v343 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqualToString_(v51, v54, (uint64_t)v343))
      {
        v417 = 1;
        v421 = 0;
        v392 = 0;
        v408 = 0;
        v420 = 0;
        v387 = 0;
        v383 = 0;
        v419 = 0;
        v386 = 0;
        v407 = 0;
        v418 = 0;
        v382 = 0;
        v380 = 0;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        isEqual = 0;
        LODWORD(v396) = isOriginal;
        HIDWORD(v396) = isOriginal;
        v422 = 1;
        v393 = 1;
        v389 = 1;
        v23 = v50;
        v4 = v261;
        goto LABEL_29;
      }
      v422 = 1;
      v23 = v50;
      v4 = v261;
    }
    else
    {
      v345 = 0;
      v422 = 0;
    }
    isOriginal = objc_msgSend_type(self, v42, v43);
    if (isOriginal != objc_msgSend_type(v5, v55, v56))
    {
      v421 = 0;
      v392 = 0;
      v408 = 0;
      v420 = 0;
      v387 = 0;
      v383 = 0;
      v419 = 0;
      v386 = 0;
      v407 = 0;
      v418 = 0;
      v382 = 0;
      v380 = 0;
      v35 = 0;
      v406 = 0;
      v36 = 0;
      v379 = 0;
      v381 = 0;
      v405 = 0;
      v416 = 0;
      v375 = 0;
      v373 = 0;
      v376 = 0;
      v404 = 0;
      v415 = 0;
      v364 = 0;
      v355 = 0;
      v374 = 0;
      v403 = 0;
      v414 = 0;
      v363 = 0;
      v356 = 0;
      v371 = 0;
      v402 = 0;
      v400 = 0;
      v361 = 0;
      v368 = 0;
      v401 = 0;
      v398 = 0;
      v357 = 0;
      v359 = 0;
      v365 = 0;
      v399 = 0;
      v394 = 0;
      v358 = 0;
      v360 = 0;
      v367 = 0;
      v397 = 0;
      v390 = 0;
      v362 = 0;
      v366 = 0;
      v370 = 0;
      v395 = 0;
      v388 = 0;
      v369 = 0;
      v372 = 0;
      v378 = 0;
      v391 = 0;
      v384 = 0;
      v377 = 0;
      v37 = 0;
      v385 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      isEqual = 0;
      v417 = 1;
      LODWORD(v396) = v423;
      HIDWORD(v396) = v423;
      v393 = v422;
      v389 = v422;
      goto LABEL_29;
    }
    v421 = (v8 | v15) != 0;
    isOriginal = v423;
    if (v8 | v15)
    {
      if (!v8 || !v15)
      {
        v417 = 1;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        v393 = v422;
        v389 = v422;
        v420 = 0;
        v421 = 0;
        v408 = 0;
        v387 = 0;
        v383 = 0;
        v419 = 0;
        v386 = 0;
        v407 = 0;
        v418 = 0;
        v382 = 0;
        v380 = 0;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        v392 = 0;
        isEqual = 0;
        goto LABEL_29;
      }
      objc_msgSend_absoluteString((void *)v8, v57, v58);
      isOriginal = objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString((void *)v15, v59, v60);
      v339 = (void *)isOriginal;
      v338 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_caseInsensitiveCompare_((void *)isOriginal, v61, (uint64_t)v338))
      {
        v392 = 0;
        v408 = 0;
        v420 = 0;
        v387 = 0;
        v383 = 0;
        v419 = 0;
        v386 = 0;
        v407 = 0;
        v418 = 0;
        v382 = 0;
        v380 = 0;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        isEqual = 0;
        v417 = 1;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        v393 = v422;
        v389 = v422;
        v421 = 1;
        goto LABEL_29;
      }
      isOriginal = v423;
    }
    objc_msgSend_urlExpirationDate(self, v57, v58);
    v69 = objc_claimAutoreleasedReturnValue();
    v408 = v69 == 0;
    v342 = (void *)v69;
    if (v69
      || (objc_msgSend_urlExpirationDate(v5, v70, v71), (v352 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_urlExpirationDate(self, v70, v71);
      v72 = objc_claimAutoreleasedReturnValue();
      if (!v72)
      {
        v341 = 0;
        v387 = 0;
        v383 = 0;
        v419 = 0;
        v386 = 0;
        v407 = 0;
        v418 = 0;
        v382 = 0;
        v380 = 0;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        isEqual = 0;
        v417 = 1;
        LODWORD(v396) = isOriginal;
        HIDWORD(v396) = isOriginal;
        v393 = v422;
        v389 = v422;
        v392 = 1;
        v420 = 1;
        goto LABEL_29;
      }
      v341 = (void *)v72;
      objc_msgSend_urlExpirationDate(v5, v73, v74);
      v75 = objc_claimAutoreleasedReturnValue();
      if (!v75)
      {
        v340 = 0;
        v383 = 0;
        v419 = 0;
        v386 = 0;
        v407 = 0;
        v418 = 0;
        v382 = 0;
        v380 = 0;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        isEqual = 0;
        v417 = 1;
        LODWORD(v396) = isOriginal;
        HIDWORD(v396) = isOriginal;
        v393 = v422;
        v389 = v422;
        v392 = 1;
        v420 = 1;
        v387 = 1;
        goto LABEL_29;
      }
      v340 = (void *)v75;
      objc_msgSend_urlExpirationDate(self, v76, v77);
      isOriginal = objc_claimAutoreleasedReturnValue();
      objc_msgSend_urlExpirationDate(v5, v78, v79);
      v337 = (void *)isOriginal;
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqualToDate_((void *)isOriginal, v80, (uint64_t)v336))
      {
        v417 = 1;
        v419 = 0;
        v386 = 0;
        v407 = 0;
        v418 = 0;
        v382 = 0;
        v380 = 0;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        isEqual = 0;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        v393 = v422;
        v389 = v422;
        v392 = 1;
        v420 = 1;
        v387 = 1;
        v82 = 1;
LABEL_202:
        v383 = v82;
        goto LABEL_29;
      }
      v420 = 1;
      v81 = v352;
      isOriginal = v423;
    }
    else
    {
      v81 = 0;
      v420 = 0;
    }
    v419 = (v10 | v16) != 0;
    v352 = v81;
    if (v10 | v16)
    {
      if (!v10 || !v16)
      {
        v417 = 1;
        LODWORD(v396) = isOriginal;
        HIDWORD(v396) = isOriginal;
        v393 = v422;
        v389 = v422;
        v392 = 1;
        v387 = v420;
        v383 = v420;
        v418 = 0;
        v419 = 0;
        v407 = 0;
        v382 = 0;
        v380 = 0;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        isEqual = 0;
        v40 = 0;
        v386 = 0;
        goto LABEL_29;
      }
      objc_msgSend_absoluteString((void *)v10, v70, v71);
      isOriginal = objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString((void *)v16, v83, v84);
      v333 = (void *)isOriginal;
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_caseInsensitiveCompare_((void *)isOriginal, v85, (uint64_t)v332))
      {
        v386 = 0;
        v407 = 0;
        v418 = 0;
        v382 = 0;
        v380 = 0;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        isEqual = 0;
        v417 = 1;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        v393 = v422;
        v389 = v422;
        v392 = 1;
        v387 = v420;
        v383 = v420;
        v419 = 1;
        goto LABEL_29;
      }
    }
    isOriginal = objc_msgSend_isOriginal(self, v70, v71);
    if ((_DWORD)isOriginal != objc_msgSend_isOriginal(v5, v86, v87))
    {
      v386 = 0;
      v407 = 0;
      v418 = 0;
      v382 = 0;
      v380 = 0;
      v35 = 0;
      v406 = 0;
      v36 = 0;
      v379 = 0;
      v381 = 0;
      v405 = 0;
      v416 = 0;
      v375 = 0;
      v373 = 0;
      v376 = 0;
      v404 = 0;
      v415 = 0;
      v364 = 0;
      v355 = 0;
      v374 = 0;
      v403 = 0;
      v414 = 0;
      v363 = 0;
      v356 = 0;
      v371 = 0;
      v402 = 0;
      v400 = 0;
      v361 = 0;
      v368 = 0;
      v401 = 0;
      v398 = 0;
      v357 = 0;
      v359 = 0;
      v365 = 0;
      v399 = 0;
      v394 = 0;
      v358 = 0;
      v360 = 0;
      v367 = 0;
      v397 = 0;
      v390 = 0;
      v362 = 0;
      v366 = 0;
      v370 = 0;
      v395 = 0;
      v388 = 0;
      v369 = 0;
      v372 = 0;
      v378 = 0;
      v391 = 0;
      v384 = 0;
      v377 = 0;
      v37 = 0;
      v385 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      isEqual = 0;
      v417 = 1;
      LODWORD(v396) = v423;
      HIDWORD(v396) = v423;
      v393 = v422;
      v389 = v422;
      v392 = 1;
      v82 = v420;
      v387 = v420;
      goto LABEL_202;
    }
    objc_msgSend_originalFilename(self, v88, v89);
    v90 = objc_claimAutoreleasedReturnValue();
    v407 = v90 == 0;
    isOriginal = v423;
    v335 = (void *)v90;
    if (v90
      || (objc_msgSend_originalFilename(v5, v91, v92), (v330 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_originalFilename(self, v91, v92);
      v93 = objc_claimAutoreleasedReturnValue();
      if (!v93)
      {
        v334 = 0;
        v382 = 0;
        v380 = 0;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        isEqual = 0;
        v417 = 1;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        v393 = v422;
        v389 = v422;
        v392 = 1;
        v387 = v420;
        v383 = v420;
        v386 = 1;
        v418 = 1;
        goto LABEL_29;
      }
      v334 = (void *)v93;
      objc_msgSend_originalFilename(v5, v94, v95);
      v96 = objc_claimAutoreleasedReturnValue();
      if (!v96)
      {
        v331 = 0;
        v380 = 0;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        isEqual = 0;
        v417 = 1;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        v393 = v422;
        v389 = v422;
        v392 = 1;
        v387 = v420;
        v383 = v420;
        v386 = 1;
        v418 = 1;
        v382 = 1;
        goto LABEL_29;
      }
      v331 = (void *)v96;
      objc_msgSend_originalFilename(self, v97, v98);
      isOriginal = objc_claimAutoreleasedReturnValue();
      objc_msgSend_originalFilename(v5, v99, v100);
      v329 = (void *)isOriginal;
      v328 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqualToString_((void *)isOriginal, v101, (uint64_t)v328))
      {
        v417 = 1;
        v35 = 0;
        v406 = 0;
        v36 = 0;
        v379 = 0;
        v381 = 0;
        v405 = 0;
        v416 = 0;
        v375 = 0;
        v373 = 0;
        v376 = 0;
        v404 = 0;
        v415 = 0;
        v364 = 0;
        v355 = 0;
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        isEqual = 0;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        v393 = v422;
        v389 = v422;
        v392 = 1;
        v387 = v420;
        v383 = v420;
        v386 = 1;
        v418 = 1;
        v382 = 1;
        v102 = 1;
        goto LABEL_223;
      }
      v418 = 1;
    }
    else
    {
      v330 = 0;
      v418 = 0;
    }
    isOriginal = objc_msgSend_schoolworkSyncStatus(self, v91, v92);
    if (isOriginal == objc_msgSend_schoolworkSyncStatus(v5, v103, v104))
    {
      isOriginal = objc_msgSend_fileSizeInBytes(self, v105, v106);
      if (isOriginal == objc_msgSend_fileSizeInBytes(v5, v107, v108))
      {
        objc_msgSend_filenameExtension(self, v109, v110);
        v111 = objc_claimAutoreleasedReturnValue();
        v406 = v111 == 0;
        v326 = (void *)v111;
        if (v111
          || (objc_msgSend_filenameExtension(v5, v112, v113), (v324 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend_filenameExtension(self, v112, v113);
          v327 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v327)
          {
            v327 = 0;
            v36 = 0;
            v379 = 0;
            v381 = 0;
            v405 = 0;
            v416 = 0;
            v375 = 0;
            v373 = 0;
            v376 = 0;
            v404 = 0;
            v415 = 0;
            v364 = 0;
            v355 = 0;
            v374 = 0;
            v403 = 0;
            v414 = 0;
            v363 = 0;
            v356 = 0;
            v371 = 0;
            v402 = 0;
            v400 = 0;
            v361 = 0;
            v368 = 0;
            v401 = 0;
            v398 = 0;
            v357 = 0;
            v359 = 0;
            v365 = 0;
            v399 = 0;
            v394 = 0;
            v358 = 0;
            v360 = 0;
            v367 = 0;
            v397 = 0;
            v390 = 0;
            v362 = 0;
            v366 = 0;
            v370 = 0;
            v395 = 0;
            v388 = 0;
            v369 = 0;
            v372 = 0;
            v378 = 0;
            v391 = 0;
            v384 = 0;
            v377 = 0;
            v37 = 0;
            v385 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            isEqual = 0;
            v417 = 0x100000001;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            v393 = v422;
            v389 = v422;
            v392 = 1;
            v387 = v420;
            v383 = v420;
            v386 = 1;
            v382 = v418;
            v380 = v418;
            v35 = 1;
            goto LABEL_29;
          }
          v262 = v5;
          objc_msgSend_filenameExtension(v5, v114, v115);
          v325 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v325)
          {
            v325 = 0;
            v379 = 0;
            v381 = 0;
            v405 = 0;
            v416 = 0;
            v375 = 0;
            v373 = 0;
            v376 = 0;
            v404 = 0;
            v415 = 0;
            v364 = 0;
            v355 = 0;
            v374 = 0;
            v403 = 0;
            v414 = 0;
            v363 = 0;
            v356 = 0;
            v371 = 0;
            v402 = 0;
            v400 = 0;
            v361 = 0;
            v368 = 0;
            v401 = 0;
            v398 = 0;
            v357 = 0;
            v359 = 0;
            v365 = 0;
            v399 = 0;
            v394 = 0;
            v358 = 0;
            v360 = 0;
            v367 = 0;
            v397 = 0;
            v390 = 0;
            v362 = 0;
            v366 = 0;
            v370 = 0;
            v395 = 0;
            v388 = 0;
            v369 = 0;
            v372 = 0;
            v378 = 0;
            v391 = 0;
            v384 = 0;
            v377 = 0;
            v37 = 0;
            v385 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            isEqual = 0;
            v417 = 0x100000001;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            v393 = v422;
            v389 = v422;
            v392 = 1;
            v387 = v420;
            v383 = v420;
            v386 = 1;
            v382 = v418;
            v380 = v418;
            v35 = 1;
            v36 = 1;
            goto LABEL_258;
          }
          objc_msgSend_filenameExtension(self, v116, v117);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_filenameExtension(v262, v119, v120);
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          v322 = v118;
          LODWORD(v417) = 1;
          if (!objc_msgSend_isEqualToString_(v118, v121, (uint64_t)v321))
          {
            v381 = 0;
            v405 = 0;
            v416 = 0;
            v375 = 0;
            v373 = 0;
            v376 = 0;
            v404 = 0;
            v415 = 0;
            v364 = 0;
            v355 = 0;
            v374 = 0;
            v403 = 0;
            v414 = 0;
            v363 = 0;
            v356 = 0;
            v371 = 0;
            v402 = 0;
            v400 = 0;
            v361 = 0;
            v368 = 0;
            v401 = 0;
            v398 = 0;
            v357 = 0;
            v359 = 0;
            v365 = 0;
            v399 = 0;
            v394 = 0;
            v358 = 0;
            v360 = 0;
            v367 = 0;
            v397 = 0;
            v390 = 0;
            v362 = 0;
            v366 = 0;
            v370 = 0;
            v395 = 0;
            v388 = 0;
            v369 = 0;
            v372 = 0;
            v378 = 0;
            v391 = 0;
            v384 = 0;
            v377 = 0;
            v37 = 0;
            v385 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            isEqual = 0;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            v393 = v422;
            v389 = v422;
            v392 = 1;
            v387 = v420;
            v383 = v420;
            v386 = 1;
            v382 = v418;
            v380 = v418;
            v35 = 1;
            HIDWORD(v417) = 1;
            v36 = 1;
            v379 = 1;
            goto LABEL_258;
          }
          HIDWORD(v417) = 1;
        }
        else
        {
          v262 = v5;
          v324 = 0;
          HIDWORD(v417) = 0;
        }
        objc_msgSend_fileUTType(self, v112, v113);
        v122 = objc_claimAutoreleasedReturnValue();
        v405 = v122 == 0;
        v320 = (void *)v122;
        if (v122
          || (objc_msgSend_fileUTType(v262, v123, v124), (v318 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend_fileUTType(self, v123, v124);
          v323 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v323)
          {
            v323 = 0;
            v375 = 0;
            v373 = 0;
            v376 = 0;
            v404 = 0;
            v415 = 0;
            v364 = 0;
            v355 = 0;
            v374 = 0;
            v403 = 0;
            v414 = 0;
            v363 = 0;
            v356 = 0;
            v371 = 0;
            v402 = 0;
            v400 = 0;
            v361 = 0;
            v368 = 0;
            v401 = 0;
            v398 = 0;
            v357 = 0;
            v359 = 0;
            v365 = 0;
            v399 = 0;
            v394 = 0;
            v358 = 0;
            v360 = 0;
            v367 = 0;
            v397 = 0;
            v390 = 0;
            v362 = 0;
            v366 = 0;
            v370 = 0;
            v395 = 0;
            v388 = 0;
            v369 = 0;
            v372 = 0;
            v378 = 0;
            v391 = 0;
            v384 = 0;
            v377 = 0;
            v37 = 0;
            v385 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            isEqual = 0;
            LODWORD(v417) = 1;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            v393 = v422;
            v389 = v422;
            v392 = 1;
            v387 = v420;
            v383 = v420;
            v386 = 1;
            v382 = v418;
            v380 = v418;
            v35 = 1;
            v36 = HIDWORD(v417);
            v379 = HIDWORD(v417);
            v381 = 1;
            v416 = 1;
            goto LABEL_258;
          }
          objc_msgSend_fileUTType(self, v125, v126);
          v319 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v319)
          {
            v319 = 0;
            v373 = 0;
            v376 = 0;
            v404 = 0;
            v415 = 0;
            v364 = 0;
            v355 = 0;
            v374 = 0;
            v403 = 0;
            v414 = 0;
            v363 = 0;
            v356 = 0;
            v371 = 0;
            v402 = 0;
            v400 = 0;
            v361 = 0;
            v368 = 0;
            v401 = 0;
            v398 = 0;
            v357 = 0;
            v359 = 0;
            v365 = 0;
            v399 = 0;
            v394 = 0;
            v358 = 0;
            v360 = 0;
            v367 = 0;
            v397 = 0;
            v390 = 0;
            v362 = 0;
            v366 = 0;
            v370 = 0;
            v395 = 0;
            v388 = 0;
            v369 = 0;
            v372 = 0;
            v378 = 0;
            v391 = 0;
            v384 = 0;
            v377 = 0;
            v37 = 0;
            v385 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            isEqual = 0;
            LODWORD(v417) = 1;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            v393 = v422;
            v389 = v422;
            v392 = 1;
            v387 = v420;
            v383 = v420;
            v386 = 1;
            v382 = v418;
            v380 = v418;
            v35 = 1;
            v36 = HIDWORD(v417);
            v379 = HIDWORD(v417);
            v381 = 1;
            v416 = 1;
            v375 = 1;
            goto LABEL_258;
          }
          objc_msgSend_fileUTType(self, v127, v128);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_fileUTType(v262, v130, v131);
          v315 = (void *)objc_claimAutoreleasedReturnValue();
          v316 = v129;
          LODWORD(v417) = 1;
          if (!objc_msgSend_isEqual_(v129, v132, (uint64_t)v315))
          {
            v376 = 0;
            v404 = 0;
            v415 = 0;
            v364 = 0;
            v355 = 0;
            v374 = 0;
            v403 = 0;
            v414 = 0;
            v363 = 0;
            v356 = 0;
            v371 = 0;
            v402 = 0;
            v400 = 0;
            v361 = 0;
            v368 = 0;
            v401 = 0;
            v398 = 0;
            v357 = 0;
            v359 = 0;
            v365 = 0;
            v399 = 0;
            v394 = 0;
            v358 = 0;
            v360 = 0;
            v367 = 0;
            v397 = 0;
            v390 = 0;
            v362 = 0;
            v366 = 0;
            v370 = 0;
            v395 = 0;
            v388 = 0;
            v369 = 0;
            v372 = 0;
            v378 = 0;
            v391 = 0;
            v384 = 0;
            v377 = 0;
            v37 = 0;
            v385 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            isEqual = 0;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            v393 = v422;
            v389 = v422;
            v392 = 1;
            v387 = v420;
            v383 = v420;
            v386 = 1;
            v382 = v418;
            v380 = v418;
            v35 = 1;
            v36 = HIDWORD(v417);
            v379 = HIDWORD(v417);
            v381 = 1;
            v416 = 1;
            v375 = 1;
            v373 = 1;
            goto LABEL_258;
          }
          v416 = 1;
        }
        else
        {
          v318 = 0;
          v416 = 0;
        }
        objc_msgSend_title(self, v123, v124);
        v133 = objc_claimAutoreleasedReturnValue();
        v404 = v133 == 0;
        v314 = (void *)v133;
        if (v133 || (objc_msgSend_title(v262, v134, v135), (v312 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend_title(self, v134, v135);
          v317 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v317)
          {
            v317 = 0;
            v364 = 0;
            v355 = 0;
            v374 = 0;
            v403 = 0;
            v414 = 0;
            v363 = 0;
            v356 = 0;
            v371 = 0;
            v402 = 0;
            v400 = 0;
            v361 = 0;
            v368 = 0;
            v401 = 0;
            v398 = 0;
            v357 = 0;
            v359 = 0;
            v365 = 0;
            v399 = 0;
            v394 = 0;
            v358 = 0;
            v360 = 0;
            v367 = 0;
            v397 = 0;
            v390 = 0;
            v362 = 0;
            v366 = 0;
            v370 = 0;
            v395 = 0;
            v388 = 0;
            v369 = 0;
            v372 = 0;
            v378 = 0;
            v391 = 0;
            v384 = 0;
            v377 = 0;
            v37 = 0;
            v385 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            isEqual = 0;
            LODWORD(v417) = 1;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            v393 = v422;
            v389 = v422;
            v392 = 1;
            v387 = v420;
            v383 = v420;
            v386 = 1;
            v382 = v418;
            v380 = v418;
            v35 = 1;
            v36 = HIDWORD(v417);
            v379 = HIDWORD(v417);
            v381 = 1;
            v375 = v416;
            v373 = v416;
            v376 = 1;
            v415 = 1;
            goto LABEL_258;
          }
          objc_msgSend_title(v262, v136, v137);
          v313 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v313)
          {
            v313 = 0;
            v355 = 0;
            v374 = 0;
            v403 = 0;
            v414 = 0;
            v363 = 0;
            v356 = 0;
            v371 = 0;
            v402 = 0;
            v400 = 0;
            v361 = 0;
            v368 = 0;
            v401 = 0;
            v398 = 0;
            v357 = 0;
            v359 = 0;
            v365 = 0;
            v399 = 0;
            v394 = 0;
            v358 = 0;
            v360 = 0;
            v367 = 0;
            v397 = 0;
            v390 = 0;
            v362 = 0;
            v366 = 0;
            v370 = 0;
            v395 = 0;
            v388 = 0;
            v369 = 0;
            v372 = 0;
            v378 = 0;
            v391 = 0;
            v384 = 0;
            v377 = 0;
            v37 = 0;
            v385 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            isEqual = 0;
            LODWORD(v417) = 1;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            v393 = v422;
            v389 = v422;
            v392 = 1;
            v387 = v420;
            v383 = v420;
            v386 = 1;
            v382 = v418;
            v380 = v418;
            v35 = 1;
            v36 = HIDWORD(v417);
            v379 = HIDWORD(v417);
            v381 = 1;
            v375 = v416;
            v373 = v416;
            v376 = 1;
            v415 = 1;
            v364 = 1;
            goto LABEL_258;
          }
          objc_msgSend_title(self, v138, v139);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_title(v262, v141, v142);
          v310 = (void *)objc_claimAutoreleasedReturnValue();
          v311 = v140;
          LODWORD(v417) = 1;
          if (!objc_msgSend_isEqualToString_(v140, v143, (uint64_t)v310))
          {
            v374 = 0;
            v403 = 0;
            v414 = 0;
            v363 = 0;
            v356 = 0;
            v371 = 0;
            v402 = 0;
            v400 = 0;
            v361 = 0;
            v368 = 0;
            v401 = 0;
            v398 = 0;
            v357 = 0;
            v359 = 0;
            v365 = 0;
            v399 = 0;
            v394 = 0;
            v358 = 0;
            v360 = 0;
            v367 = 0;
            v397 = 0;
            v390 = 0;
            v362 = 0;
            v366 = 0;
            v370 = 0;
            v395 = 0;
            v388 = 0;
            v369 = 0;
            v372 = 0;
            v378 = 0;
            v391 = 0;
            v384 = 0;
            v377 = 0;
            v37 = 0;
            v385 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            isEqual = 0;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            v393 = v422;
            v389 = v422;
            v392 = 1;
            v387 = v420;
            v383 = v420;
            v386 = 1;
            v382 = v418;
            v380 = v418;
            v35 = 1;
            v36 = HIDWORD(v417);
            v379 = HIDWORD(v417);
            v381 = 1;
            v375 = v416;
            v373 = v416;
            v376 = 1;
            v415 = 1;
            v364 = 1;
            v144 = 1;
            goto LABEL_257;
          }
          v415 = 1;
        }
        else
        {
          v312 = 0;
          v415 = 0;
        }
        isOriginal = objc_msgSend_displayOrder(self, v134, v135);
        if (isOriginal == objc_msgSend_displayOrder(v262, v145, v146))
        {
          objc_msgSend_durationInSeconds(self, v147, v148);
          v150 = v149;
          objc_msgSend_durationInSeconds(v262, v151, v152);
          if (v150 == v155)
          {
            objc_msgSend_ownerPersonID(self, v153, v154);
            v156 = objc_claimAutoreleasedReturnValue();
            v403 = v156 == 0;
            v308 = (void *)v156;
            if (v156
              || (objc_msgSend_ownerPersonID(v262, v157, v158),
                  (v306 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              objc_msgSend_ownerPersonID(self, v157, v158);
              v309 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v309)
              {
                v309 = 0;
                v363 = 0;
                v356 = 0;
                v371 = 0;
                v402 = 0;
                v400 = 0;
                v361 = 0;
                v368 = 0;
                v401 = 0;
                v398 = 0;
                v357 = 0;
                v359 = 0;
                v365 = 0;
                v399 = 0;
                v394 = 0;
                v358 = 0;
                v360 = 0;
                v367 = 0;
                v397 = 0;
                v390 = 0;
                v362 = 0;
                v366 = 0;
                v370 = 0;
                v395 = 0;
                v388 = 0;
                v369 = 0;
                v372 = 0;
                v378 = 0;
                v391 = 0;
                v384 = 0;
                v377 = 0;
                v37 = 0;
                v385 = 0;
                v38 = 0;
                v39 = 0;
                v40 = 0;
                isEqual = 0;
                LODWORD(v417) = 1;
                LODWORD(v396) = v423;
                HIDWORD(v396) = v423;
                v393 = v422;
                v389 = v422;
                v392 = 1;
                v387 = v420;
                v383 = v420;
                v386 = 1;
                v382 = v418;
                v380 = v418;
                v35 = 1;
                v36 = HIDWORD(v417);
                v379 = HIDWORD(v417);
                v381 = 1;
                v375 = v416;
                v373 = v416;
                v376 = 1;
                v364 = v415;
                v355 = v415;
                v374 = 1;
                v414 = 1;
                goto LABEL_258;
              }
              objc_msgSend_ownerPersonID(v262, v159, v160);
              v307 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v307)
              {
                v307 = 0;
                v356 = 0;
                v371 = 0;
                v402 = 0;
                v400 = 0;
                v361 = 0;
                v368 = 0;
                v401 = 0;
                v398 = 0;
                v357 = 0;
                v359 = 0;
                v365 = 0;
                v399 = 0;
                v394 = 0;
                v358 = 0;
                v360 = 0;
                v367 = 0;
                v397 = 0;
                v390 = 0;
                v362 = 0;
                v366 = 0;
                v370 = 0;
                v395 = 0;
                v388 = 0;
                v369 = 0;
                v372 = 0;
                v378 = 0;
                v391 = 0;
                v384 = 0;
                v377 = 0;
                v37 = 0;
                v385 = 0;
                v38 = 0;
                v39 = 0;
                v40 = 0;
                isEqual = 0;
                LODWORD(v417) = 1;
                LODWORD(v396) = v423;
                HIDWORD(v396) = v423;
                v393 = v422;
                v389 = v422;
                v392 = 1;
                v387 = v420;
                v383 = v420;
                v386 = 1;
                v382 = v418;
                v380 = v418;
                v35 = 1;
                v36 = HIDWORD(v417);
                v379 = HIDWORD(v417);
                v381 = 1;
                v375 = v416;
                v373 = v416;
                v376 = 1;
                v364 = v415;
                v355 = v415;
                v374 = 1;
                v414 = 1;
                v363 = 1;
                goto LABEL_258;
              }
              objc_msgSend_ownerPersonID(self, v161, v162);
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_ownerPersonID(v262, v164, v165);
              v304 = (void *)objc_claimAutoreleasedReturnValue();
              v305 = v163;
              LODWORD(v417) = 1;
              if (!objc_msgSend_isEqualToString_(v163, v166, (uint64_t)v304))
              {
                v371 = 0;
                v402 = 0;
                v400 = 0;
                v361 = 0;
                v368 = 0;
                v401 = 0;
                v398 = 0;
                v357 = 0;
                v359 = 0;
                v365 = 0;
                v399 = 0;
                v394 = 0;
                v358 = 0;
                v360 = 0;
                v367 = 0;
                v397 = 0;
                v390 = 0;
                v362 = 0;
                v366 = 0;
                v370 = 0;
                v395 = 0;
                v388 = 0;
                v369 = 0;
                v372 = 0;
                v378 = 0;
                v391 = 0;
                v384 = 0;
                v377 = 0;
                v37 = 0;
                v385 = 0;
                v38 = 0;
                v39 = 0;
                v40 = 0;
                isEqual = 0;
                LODWORD(v396) = v423;
                HIDWORD(v396) = v423;
                v393 = v422;
                v389 = v422;
                v392 = 1;
                v387 = v420;
                v383 = v420;
                v386 = 1;
                v382 = v418;
                v380 = v418;
                v35 = 1;
                v36 = HIDWORD(v417);
                v379 = HIDWORD(v417);
                v381 = 1;
                v375 = v416;
                v373 = v416;
                v376 = 1;
                v364 = v415;
                v355 = v415;
                v374 = 1;
                v414 = 1;
                v363 = 1;
                v167 = 1;
                goto LABEL_271;
              }
              v414 = 1;
            }
            else
            {
              v306 = 0;
              v414 = 0;
            }
            isOriginal = objc_msgSend_parentEntityType(self, v157, v158);
            if (isOriginal == objc_msgSend_parentEntityType(v262, v168, v169))
            {
              objc_msgSend_brItemID(self, v170, v171);
              v172 = objc_claimAutoreleasedReturnValue();
              v402 = v172 == 0;
              v302 = (void *)v172;
              if (v172
                || (objc_msgSend_brItemID(v262, v173, v174), (v300 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                objc_msgSend_brItemID(self, v173, v174);
                v303 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v303)
                {
                  v303 = 0;
                  v361 = 0;
                  v368 = 0;
                  v401 = 0;
                  v398 = 0;
                  v357 = 0;
                  v359 = 0;
                  v365 = 0;
                  v399 = 0;
                  v394 = 0;
                  v358 = 0;
                  v360 = 0;
                  v367 = 0;
                  v397 = 0;
                  v390 = 0;
                  v362 = 0;
                  v366 = 0;
                  v370 = 0;
                  v395 = 0;
                  v388 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  v400 = 1;
                  goto LABEL_258;
                }
                objc_msgSend_brItemID(v262, v175, v176);
                v301 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v301)
                {
                  v301 = 0;
                  v368 = 0;
                  v401 = 0;
                  v398 = 0;
                  v357 = 0;
                  v359 = 0;
                  v365 = 0;
                  v399 = 0;
                  v394 = 0;
                  v358 = 0;
                  v360 = 0;
                  v367 = 0;
                  v397 = 0;
                  v390 = 0;
                  v362 = 0;
                  v366 = 0;
                  v370 = 0;
                  v395 = 0;
                  v388 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  v400 = 1;
                  v361 = 1;
                  goto LABEL_258;
                }
                objc_msgSend_brItemID(self, v177, v178);
                v179 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_brItemID(v262, v180, v181);
                v298 = (void *)objc_claimAutoreleasedReturnValue();
                v299 = v179;
                LODWORD(v417) = 1;
                if (!objc_msgSend_isEqualToString_(v179, v182, (uint64_t)v298))
                {
                  v368 = 0;
                  v401 = 0;
                  v398 = 0;
                  v357 = 0;
                  v359 = 0;
                  v365 = 0;
                  v399 = 0;
                  v394 = 0;
                  v358 = 0;
                  v360 = 0;
                  v367 = 0;
                  v397 = 0;
                  v390 = 0;
                  v362 = 0;
                  v366 = 0;
                  v370 = 0;
                  v395 = 0;
                  v388 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  v400 = 1;
                  v361 = 0x100000001;
                  goto LABEL_258;
                }
                v400 = 1;
              }
              else
              {
                v300 = 0;
                v400 = 0;
              }
              objc_msgSend_brOwnerName(self, v173, v174);
              v183 = objc_claimAutoreleasedReturnValue();
              v401 = v183 == 0;
              v296 = (void *)v183;
              if (v183
                || (objc_msgSend_brOwnerName(v262, v184, v185),
                    (v295 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                objc_msgSend_brOwnerName(self, v184, v185);
                v297 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v297)
                {
                  v297 = 0;
                  v357 = 0;
                  v359 = 0;
                  v365 = 0;
                  v399 = 0;
                  v394 = 0;
                  v358 = 0;
                  v360 = 0;
                  v367 = 0;
                  v397 = 0;
                  v390 = 0;
                  v362 = 0;
                  v366 = 0;
                  v370 = 0;
                  v395 = 0;
                  v388 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v398 = 1;
                  goto LABEL_258;
                }
                objc_msgSend_brOwnerName(v262, v186, v187);
                v294 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v294)
                {
                  v294 = 0;
                  v359 = 0;
                  v365 = 0;
                  v399 = 0;
                  v394 = 0;
                  v358 = 0;
                  v360 = 0;
                  v367 = 0;
                  v397 = 0;
                  v390 = 0;
                  v362 = 0;
                  v366 = 0;
                  v370 = 0;
                  v395 = 0;
                  v388 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v398 = 1;
                  v357 = 1;
                  goto LABEL_258;
                }
                objc_msgSend_brOwnerName(self, v188, v189);
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_brOwnerName(v262, v191, v192);
                v291 = (void *)objc_claimAutoreleasedReturnValue();
                v292 = v190;
                LODWORD(v417) = 1;
                if (!objc_msgSend_isEqualToString_(v190, v193, (uint64_t)v291))
                {
                  v365 = 0;
                  v399 = 0;
                  v394 = 0;
                  v358 = 0;
                  v360 = 0;
                  v367 = 0;
                  v397 = 0;
                  v390 = 0;
                  v362 = 0;
                  v366 = 0;
                  v370 = 0;
                  v395 = 0;
                  v388 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v398 = 1;
                  v357 = 1;
                  v359 = 1;
                  goto LABEL_258;
                }
                v398 = 1;
              }
              else
              {
                v295 = 0;
                v398 = 0;
              }
              objc_msgSend_brZoneName(self, v184, v185);
              v194 = objc_claimAutoreleasedReturnValue();
              v399 = v194 == 0;
              v290 = (void *)v194;
              if (v194
                || (objc_msgSend_brZoneName(v262, v195, v196),
                    (v289 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                objc_msgSend_brZoneName(self, v195, v196);
                v293 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v293)
                {
                  v293 = 0;
                  v358 = 0;
                  v360 = 0;
                  v367 = 0;
                  v397 = 0;
                  v390 = 0;
                  v362 = 0;
                  v366 = 0;
                  v370 = 0;
                  v395 = 0;
                  v388 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v357 = v398;
                  v359 = v398;
                  v365 = 1;
                  v394 = 1;
                  goto LABEL_258;
                }
                objc_msgSend_brZoneName(v262, v197, v198);
                v288 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v288)
                {
                  v288 = 0;
                  v360 = 0;
                  v367 = 0;
                  v397 = 0;
                  v390 = 0;
                  v362 = 0;
                  v366 = 0;
                  v370 = 0;
                  v395 = 0;
                  v388 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v357 = v398;
                  v359 = v398;
                  v365 = 1;
                  v394 = 1;
                  v358 = 1;
                  goto LABEL_258;
                }
                objc_msgSend_brZoneName(self, v199, v200);
                v201 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_brZoneName(v262, v202, v203);
                v286 = (void *)objc_claimAutoreleasedReturnValue();
                v287 = v201;
                LODWORD(v417) = 1;
                if (!objc_msgSend_isEqualToString_(v201, v204, (uint64_t)v286))
                {
                  v367 = 0;
                  v397 = 0;
                  v390 = 0;
                  v362 = 0;
                  v366 = 0;
                  v370 = 0;
                  v395 = 0;
                  v388 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v357 = v398;
                  v359 = v398;
                  v365 = 1;
                  v394 = 1;
                  v358 = 1;
                  v360 = 1;
                  goto LABEL_258;
                }
                v394 = 1;
              }
              else
              {
                v289 = 0;
                v394 = 0;
              }
              objc_msgSend_brShareName(self, v195, v196);
              v205 = objc_claimAutoreleasedReturnValue();
              v397 = v205 == 0;
              v285 = (void *)v205;
              if (v205
                || (objc_msgSend_brShareName(v262, v206, v207),
                    (v284 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                objc_msgSend_brShareName(self, v206, v207);
                v283 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v283)
                {
                  v283 = 0;
                  v362 = 0;
                  v366 = 0;
                  v370 = 0;
                  v395 = 0;
                  v388 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v357 = v398;
                  v359 = v398;
                  v365 = 1;
                  v358 = v394;
                  v360 = v394;
                  v367 = 1;
                  v390 = 1;
                  goto LABEL_258;
                }
                objc_msgSend_brShareName(v262, v208, v209);
                v282 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v282)
                {
                  v282 = 0;
                  v366 = 0;
                  v370 = 0;
                  v395 = 0;
                  v388 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v357 = v398;
                  v359 = v398;
                  v365 = 1;
                  v358 = v394;
                  v360 = v394;
                  v367 = 1;
                  v390 = 1;
                  v362 = 1;
                  goto LABEL_258;
                }
                objc_msgSend_brShareName(self, v210, v211);
                v212 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_brShareName(v262, v213, v214);
                v280 = (void *)objc_claimAutoreleasedReturnValue();
                v281 = v212;
                LODWORD(v417) = 1;
                if (!objc_msgSend_isEqualToString_(v212, v215, (uint64_t)v280))
                {
                  v370 = 0;
                  v395 = 0;
                  v388 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v357 = v398;
                  v359 = v398;
                  v365 = 1;
                  v358 = v394;
                  v360 = v394;
                  v367 = 1;
                  v390 = 1;
                  v362 = 1;
                  v366 = 1;
                  goto LABEL_258;
                }
                v390 = 1;
              }
              else
              {
                v284 = 0;
                v390 = 0;
              }
              objc_msgSend_ubiquitousContainerName(self, v206, v207);
              v216 = objc_claimAutoreleasedReturnValue();
              v395 = v216 == 0;
              v279 = (void *)v216;
              if (v216
                || (objc_msgSend_ubiquitousContainerName(v262, v217, v218),
                    (v278 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                objc_msgSend_ubiquitousContainerName(self, v217, v218);
                v277 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v277)
                {
                  v277 = 0;
                  v369 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v357 = v398;
                  v359 = v398;
                  v365 = 1;
                  v358 = v394;
                  v360 = v394;
                  v367 = 1;
                  v362 = v390;
                  v366 = v390;
                  v370 = 1;
                  v388 = 1;
                  goto LABEL_258;
                }
                objc_msgSend_ubiquitousContainerName(v262, v219, v220);
                v276 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v276)
                {
                  v276 = 0;
                  v372 = 0;
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v357 = v398;
                  v359 = v398;
                  v365 = 1;
                  v358 = v394;
                  v360 = v394;
                  v367 = 1;
                  v362 = v390;
                  v366 = v390;
                  v370 = 1;
                  v388 = 1;
                  v369 = 1;
                  goto LABEL_258;
                }
                objc_msgSend_ubiquitousContainerName(self, v221, v222);
                v223 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_ubiquitousContainerName(v262, v224, v225);
                v274 = (void *)objc_claimAutoreleasedReturnValue();
                v275 = v223;
                LODWORD(v417) = 1;
                if (!objc_msgSend_isEqualToString_(v223, v226, (uint64_t)v274))
                {
                  v378 = 0;
                  v391 = 0;
                  v384 = 0;
                  v377 = 0;
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v357 = v398;
                  v359 = v398;
                  v365 = 1;
                  v358 = v394;
                  v360 = v394;
                  v367 = 1;
                  v362 = v390;
                  v366 = v390;
                  v370 = 1;
                  v388 = 1;
                  v369 = 1;
                  v372 = 1;
                  goto LABEL_258;
                }
                v388 = 1;
              }
              else
              {
                v278 = 0;
                v388 = 0;
              }
              objc_msgSend_relativePathWithinContainer(self, v217, v218);
              v227 = objc_claimAutoreleasedReturnValue();
              v391 = v227 == 0;
              v273 = (void *)v227;
              if (!v227)
              {
                objc_msgSend_relativePathWithinContainer(v262, v228, v229);
                v272 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v272)
                {
                  v272 = 0;
                  v384 = 0;
                  goto LABEL_326;
                }
              }
              objc_msgSend_relativePathWithinContainer(self, v228, v229);
              v271 = (void *)objc_claimAutoreleasedReturnValue();
              if (v271)
              {
                objc_msgSend_relativePathWithinContainer(v262, v230, v231);
                v270 = (void *)objc_claimAutoreleasedReturnValue();
                if (v270)
                {
                  objc_msgSend_relativePathWithinContainer(self, v232, v233);
                  v234 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_relativePathWithinContainer(v262, v235, v236);
                  v268 = (void *)objc_claimAutoreleasedReturnValue();
                  v269 = v234;
                  LODWORD(v417) = 1;
                  if (!objc_msgSend_isEqualToString_(v234, v237, (uint64_t)v268))
                  {
                    v37 = 0;
                    v385 = 0;
                    v38 = 0;
                    v39 = 0;
                    v40 = 0;
                    isEqual = 0;
                    LODWORD(v396) = v423;
                    HIDWORD(v396) = v423;
                    v393 = v422;
                    v389 = v422;
                    v392 = 1;
                    v387 = v420;
                    v383 = v420;
                    v386 = 1;
                    v382 = v418;
                    v380 = v418;
                    v35 = 1;
                    v36 = HIDWORD(v417);
                    v379 = HIDWORD(v417);
                    v381 = 1;
                    v375 = v416;
                    v373 = v416;
                    v376 = 1;
                    v364 = v415;
                    v355 = v415;
                    v374 = 1;
                    v363 = v414;
                    v356 = v414;
                    v371 = 1;
                    LODWORD(v361) = v400;
                    HIDWORD(v361) = v400;
                    v368 = 1;
                    v357 = v398;
                    v359 = v398;
                    v365 = 1;
                    v358 = v394;
                    v360 = v394;
                    v367 = 1;
                    v362 = v390;
                    v366 = v390;
                    v370 = 1;
                    v369 = v388;
                    v372 = v388;
                    LODWORD(v378) = 1;
                    v384 = 1;
                    v377 = 1;
                    v238 = 1;
LABEL_334:
                    HIDWORD(v378) = v238;
                    goto LABEL_258;
                  }
                  v384 = 1;
LABEL_326:
                  isOriginal = objc_msgSend_isDownloaded(self, v228, v229);
                  if ((_DWORD)isOriginal == objc_msgSend_isDownloaded(v262, v239, v240))
                  {
                    objc_msgSend_fractionDownloaded(self, v241, v242);
                    v244 = v243;
                    objc_msgSend_fractionDownloaded(v262, v245, v246);
                    if (v244 == v249)
                    {
                      objc_msgSend_downloadError(self, v247, v248);
                      v250 = objc_claimAutoreleasedReturnValue();
                      v385 = v250 == 0;
                      v267 = (void *)v250;
                      if (v250
                        || (objc_msgSend_downloadError(v262, v251, v252),
                            (v266 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                      {
                        objc_msgSend_downloadError(self, v251, v252);
                        v265 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v265)
                        {
                          objc_msgSend_downloadError(self, v253, v254);
                          v264 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v264)
                          {
                            objc_msgSend_downloadError(self, v255, v256);
                            v257 = (void *)objc_claimAutoreleasedReturnValue();
                            v5 = v262;
                            objc_msgSend_downloadError(v262, v258, v259);
                            isOriginal = objc_claimAutoreleasedReturnValue();
                            v263 = v257;
                            isEqual = objc_msgSend_isEqual_(v257, v260, isOriginal);
                            LODWORD(v417) = 1;
                            LODWORD(v396) = v423;
                            HIDWORD(v396) = v423;
                            v393 = v422;
                            v389 = v422;
                            v392 = 1;
                            v387 = v420;
                            v383 = v420;
                            v386 = 1;
                            v382 = v418;
                            v380 = v418;
                            v35 = 1;
                            v36 = HIDWORD(v417);
                            v379 = HIDWORD(v417);
                            v381 = 1;
                            v375 = v416;
                            v373 = v416;
                            v376 = 1;
                            v364 = v415;
                            v355 = v415;
                            v374 = 1;
                            v363 = v414;
                            v356 = v414;
                            v371 = 1;
                            LODWORD(v361) = v400;
                            HIDWORD(v361) = v400;
                            v368 = 1;
                            v357 = v398;
                            v359 = v398;
                            v365 = 1;
                            v358 = v394;
                            v360 = v394;
                            v367 = 1;
                            v362 = v390;
                            v366 = v390;
                            v370 = 1;
                            v369 = v388;
                            v372 = v388;
                            LODWORD(v378) = 1;
                            v377 = v384;
                            HIDWORD(v378) = v384;
                            v37 = 1;
                            v38 = 1;
                            v39 = 1;
                            v40 = 1;
                            goto LABEL_29;
                          }
                          v264 = 0;
                          v40 = 0;
                          isEqual = 0;
                          LODWORD(v417) = 1;
                          LODWORD(v396) = v423;
                          HIDWORD(v396) = v423;
                          v393 = v422;
                          v389 = v422;
                          v392 = 1;
                          v387 = v420;
                          v383 = v420;
                          v386 = 1;
                          v382 = v418;
                          v380 = v418;
                          v35 = 1;
                          v36 = HIDWORD(v417);
                          v379 = HIDWORD(v417);
                          v381 = 1;
                          v375 = v416;
                          v373 = v416;
                          v376 = 1;
                          v364 = v415;
                          v355 = v415;
                          v374 = 1;
                          v363 = v414;
                          v356 = v414;
                          v371 = 1;
                          LODWORD(v361) = v400;
                          HIDWORD(v361) = v400;
                          v368 = 1;
                          v357 = v398;
                          v359 = v398;
                          v365 = 1;
                          v358 = v394;
                          v360 = v394;
                          v367 = 1;
                          v362 = v390;
                          v366 = v390;
                          v370 = 1;
                          v369 = v388;
                          v372 = v388;
                          LODWORD(v378) = 1;
                          v377 = v384;
                          HIDWORD(v378) = v384;
                          v37 = 1;
                          v38 = 1;
                          v39 = 1;
                        }
                        else
                        {
                          v265 = 0;
                          v39 = 0;
                          v40 = 0;
                          isEqual = 0;
                          LODWORD(v417) = 1;
                          LODWORD(v396) = v423;
                          HIDWORD(v396) = v423;
                          v393 = v422;
                          v389 = v422;
                          v392 = 1;
                          v387 = v420;
                          v383 = v420;
                          v386 = 1;
                          v382 = v418;
                          v380 = v418;
                          v35 = 1;
                          v36 = HIDWORD(v417);
                          v379 = HIDWORD(v417);
                          v381 = 1;
                          v375 = v416;
                          v373 = v416;
                          v376 = 1;
                          v364 = v415;
                          v355 = v415;
                          v374 = 1;
                          v363 = v414;
                          v356 = v414;
                          v371 = 1;
                          LODWORD(v361) = v400;
                          HIDWORD(v361) = v400;
                          v368 = 1;
                          v357 = v398;
                          v359 = v398;
                          v365 = 1;
                          v358 = v394;
                          v360 = v394;
                          v367 = 1;
                          v362 = v390;
                          v366 = v390;
                          v370 = 1;
                          v369 = v388;
                          v372 = v388;
                          LODWORD(v378) = 1;
                          v377 = v384;
                          HIDWORD(v378) = v384;
                          v37 = 1;
                          v38 = 1;
                        }
                      }
                      else
                      {
                        v266 = 0;
                        v267 = 0;
                        v38 = 0;
                        v39 = 0;
                        v40 = 0;
                        LODWORD(v417) = 1;
                        LODWORD(v396) = v423;
                        HIDWORD(v396) = v423;
                        v393 = v422;
                        v389 = v422;
                        v392 = 1;
                        v387 = v420;
                        v383 = v420;
                        v386 = 1;
                        v382 = v418;
                        v380 = v418;
                        v35 = 1;
                        v36 = HIDWORD(v417);
                        v379 = HIDWORD(v417);
                        v381 = 1;
                        v375 = v416;
                        v373 = v416;
                        v376 = 1;
                        v364 = v415;
                        v355 = v415;
                        v374 = 1;
                        v363 = v414;
                        v356 = v414;
                        v371 = 1;
                        LODWORD(v361) = v400;
                        HIDWORD(v361) = v400;
                        v368 = 1;
                        v357 = v398;
                        v359 = v398;
                        v365 = 1;
                        v358 = v394;
                        v360 = v394;
                        v367 = 1;
                        v362 = v390;
                        v366 = v390;
                        v370 = 1;
                        v369 = v388;
                        v372 = v388;
                        LODWORD(v378) = 1;
                        v377 = v384;
                        HIDWORD(v378) = v384;
                        v37 = 1;
                        v385 = 1;
                        isEqual = 1;
                      }
                      goto LABEL_258;
                    }
                  }
                  v37 = 0;
                  v385 = 0;
                  v38 = 0;
                  v39 = 0;
                  v40 = 0;
                  isEqual = 0;
                  LODWORD(v417) = 1;
                  LODWORD(v396) = v423;
                  HIDWORD(v396) = v423;
                  v393 = v422;
                  v389 = v422;
                  v392 = 1;
                  v387 = v420;
                  v383 = v420;
                  v386 = 1;
                  v382 = v418;
                  v380 = v418;
                  v35 = 1;
                  v36 = HIDWORD(v417);
                  v379 = HIDWORD(v417);
                  v381 = 1;
                  v375 = v416;
                  v373 = v416;
                  v376 = 1;
                  v364 = v415;
                  v355 = v415;
                  v374 = 1;
                  v363 = v414;
                  v356 = v414;
                  v371 = 1;
                  LODWORD(v361) = v400;
                  HIDWORD(v361) = v400;
                  v368 = 1;
                  v357 = v398;
                  v359 = v398;
                  v365 = 1;
                  v358 = v394;
                  v360 = v394;
                  v367 = 1;
                  v362 = v390;
                  v366 = v390;
                  v370 = 1;
                  v369 = v388;
                  v372 = v388;
                  LODWORD(v378) = 1;
                  v238 = v384;
                  v377 = v384;
                  goto LABEL_334;
                }
                v270 = 0;
                v37 = 0;
                v385 = 0;
                v38 = 0;
                v39 = 0;
                v40 = 0;
                isEqual = 0;
                LODWORD(v417) = 1;
                LODWORD(v396) = v423;
                HIDWORD(v396) = v423;
                v393 = v422;
                v389 = v422;
                v392 = 1;
                v387 = v420;
                v383 = v420;
                v386 = 1;
                v382 = v418;
                v380 = v418;
                v35 = 1;
                v36 = HIDWORD(v417);
                v379 = HIDWORD(v417);
                v381 = 1;
                v375 = v416;
                v373 = v416;
                v376 = 1;
                v364 = v415;
                v355 = v415;
                v374 = 1;
                v363 = v414;
                v356 = v414;
                v371 = 1;
                LODWORD(v361) = v400;
                HIDWORD(v361) = v400;
                v368 = 1;
                v357 = v398;
                v359 = v398;
                v365 = 1;
                v358 = v394;
                v360 = v394;
                v367 = 1;
                v362 = v390;
                v366 = v390;
                v370 = 1;
                v369 = v388;
                v372 = v388;
                v378 = 1;
                v384 = 1;
                v377 = 1;
              }
              else
              {
                v271 = 0;
                v377 = 0;
                v37 = 0;
                v385 = 0;
                v38 = 0;
                v39 = 0;
                v40 = 0;
                isEqual = 0;
                LODWORD(v417) = 1;
                LODWORD(v396) = v423;
                HIDWORD(v396) = v423;
                v393 = v422;
                v389 = v422;
                v392 = 1;
                v387 = v420;
                v383 = v420;
                v386 = 1;
                v382 = v418;
                v380 = v418;
                v35 = 1;
                v36 = HIDWORD(v417);
                v379 = HIDWORD(v417);
                v381 = 1;
                v375 = v416;
                v373 = v416;
                v376 = 1;
                v364 = v415;
                v355 = v415;
                v374 = 1;
                v363 = v414;
                v356 = v414;
                v371 = 1;
                LODWORD(v361) = v400;
                HIDWORD(v361) = v400;
                v368 = 1;
                v357 = v398;
                v359 = v398;
                v365 = 1;
                v358 = v394;
                v360 = v394;
                v367 = 1;
                v362 = v390;
                v366 = v390;
                v370 = 1;
                v369 = v388;
                v372 = v388;
                v378 = 1;
                v384 = 1;
              }
LABEL_258:
              v5 = v262;
              goto LABEL_29;
            }
            v371 = 0;
            v402 = 0;
            v400 = 0;
            v361 = 0;
            v368 = 0;
            v401 = 0;
            v398 = 0;
            v357 = 0;
            v359 = 0;
            v365 = 0;
            v399 = 0;
            v394 = 0;
            v358 = 0;
            v360 = 0;
            v367 = 0;
            v397 = 0;
            v390 = 0;
            v362 = 0;
            v366 = 0;
            v370 = 0;
            v395 = 0;
            v388 = 0;
            v369 = 0;
            v372 = 0;
            v378 = 0;
            v391 = 0;
            v384 = 0;
            v377 = 0;
            v37 = 0;
            v385 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            isEqual = 0;
            LODWORD(v417) = 1;
            LODWORD(v396) = v423;
            HIDWORD(v396) = v423;
            v393 = v422;
            v389 = v422;
            v392 = 1;
            v387 = v420;
            v383 = v420;
            v386 = 1;
            v382 = v418;
            v380 = v418;
            v35 = 1;
            v36 = HIDWORD(v417);
            v379 = HIDWORD(v417);
            v381 = 1;
            v375 = v416;
            v373 = v416;
            v376 = 1;
            v364 = v415;
            v355 = v415;
            v374 = 1;
            v167 = v414;
            v363 = v414;
LABEL_271:
            v356 = v167;
            goto LABEL_258;
          }
        }
        v374 = 0;
        v403 = 0;
        v414 = 0;
        v363 = 0;
        v356 = 0;
        v371 = 0;
        v402 = 0;
        v400 = 0;
        v361 = 0;
        v368 = 0;
        v401 = 0;
        v398 = 0;
        v357 = 0;
        v359 = 0;
        v365 = 0;
        v399 = 0;
        v394 = 0;
        v358 = 0;
        v360 = 0;
        v367 = 0;
        v397 = 0;
        v390 = 0;
        v362 = 0;
        v366 = 0;
        v370 = 0;
        v395 = 0;
        v388 = 0;
        v369 = 0;
        v372 = 0;
        v378 = 0;
        v391 = 0;
        v384 = 0;
        v377 = 0;
        v37 = 0;
        v385 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        isEqual = 0;
        LODWORD(v417) = 1;
        LODWORD(v396) = v423;
        HIDWORD(v396) = v423;
        v393 = v422;
        v389 = v422;
        v392 = 1;
        v387 = v420;
        v383 = v420;
        v386 = 1;
        v382 = v418;
        v380 = v418;
        v35 = 1;
        v36 = HIDWORD(v417);
        v379 = HIDWORD(v417);
        v381 = 1;
        v375 = v416;
        v373 = v416;
        v376 = 1;
        v144 = v415;
        v364 = v415;
LABEL_257:
        v355 = v144;
        goto LABEL_258;
      }
    }
    v35 = 0;
    v406 = 0;
    v36 = 0;
    v379 = 0;
    v381 = 0;
    v405 = 0;
    v416 = 0;
    v375 = 0;
    v373 = 0;
    v376 = 0;
    v404 = 0;
    v415 = 0;
    v364 = 0;
    v355 = 0;
    v374 = 0;
    v403 = 0;
    v414 = 0;
    v363 = 0;
    v356 = 0;
    v371 = 0;
    v402 = 0;
    v400 = 0;
    v361 = 0;
    v368 = 0;
    v401 = 0;
    v398 = 0;
    v357 = 0;
    v359 = 0;
    v365 = 0;
    v399 = 0;
    v394 = 0;
    v358 = 0;
    v360 = 0;
    v367 = 0;
    v397 = 0;
    v390 = 0;
    v362 = 0;
    v366 = 0;
    v370 = 0;
    v395 = 0;
    v388 = 0;
    v369 = 0;
    v372 = 0;
    v378 = 0;
    v391 = 0;
    v384 = 0;
    v377 = 0;
    v37 = 0;
    v385 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    isEqual = 0;
    v417 = 1;
    LODWORD(v396) = v423;
    HIDWORD(v396) = v423;
    v393 = v422;
    v389 = v422;
    v392 = 1;
    v387 = v420;
    v383 = v420;
    v386 = 1;
    v102 = v418;
    v382 = v418;
LABEL_223:
    v380 = v102;
    goto LABEL_29;
  }
  v422 = 0;
  v423 = 1;
  v417 = 0;
  v409 = 0;
  v393 = 0;
  v389 = 0;
  v421 = 0;
  v392 = 0;
  v408 = 0;
  v420 = 0;
  v387 = 0;
  v383 = 0;
  v419 = 0;
  v386 = 0;
  v407 = 0;
  v418 = 0;
  v382 = 0;
  v380 = 0;
  v35 = 0;
  v406 = 0;
  v36 = 0;
  v379 = 0;
  v381 = 0;
  v405 = 0;
  v416 = 0;
  v375 = 0;
  v373 = 0;
  v376 = 0;
  v404 = 0;
  v415 = 0;
  v364 = 0;
  v355 = 0;
  v374 = 0;
  v403 = 0;
  v414 = 0;
  v363 = 0;
  v356 = 0;
  v371 = 0;
  v402 = 0;
  v400 = 0;
  v361 = 0;
  v368 = 0;
  v401 = 0;
  v398 = 0;
  v357 = 0;
  v359 = 0;
  v365 = 0;
  v399 = 0;
  v394 = 0;
  v358 = 0;
  v360 = 0;
  v367 = 0;
  v397 = 0;
  v390 = 0;
  v362 = 0;
  v366 = 0;
  v370 = 0;
  v395 = 0;
  v388 = 0;
  v369 = 0;
  v372 = 0;
  v378 = 0;
  v391 = 0;
  v384 = 0;
  v377 = 0;
  v37 = 0;
  v385 = 0;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  isEqual = 0;
  v396 = 0x100000001;
LABEL_29:
  if (v40)
  {
    v62 = v36;
    v63 = isEqual;
    v64 = v37;
    v65 = v38;
    v66 = v35;
    v67 = v39;

    v39 = v67;
    v35 = v66;
    v38 = v65;
    v37 = v64;
    isEqual = v63;
    v36 = v62;
  }
  if (v39)

  if (v38)
  if (v385)

  if (v37)
  if (HIDWORD(v378))
  {

  }
  if (v377)

  if (v384)
  if (v391)

  if ((_DWORD)v378)
  if (v372)
  {

  }
  if (v369)

  if (v388)
  if (v395)

  if (v370)
  if (v366)
  {

  }
  if (v362)

  if (v390)
  if (v397)

  if (v367)
  if (v360)
  {

  }
  if (v358)

  if (v394)
  if (v399)

  if (v365)
  if (v359)
  {

  }
  if (v357)

  if (v398)
  if (v401)

  if (v368)
  if (HIDWORD(v361))
  {

  }
  if ((_DWORD)v361)

  if (v400)
  if (v402)

  if (v371)
  if (v356)
  {

  }
  if (v363)

  if (v414)
  if (v403)

  if (v374)
  if (v355)
  {

  }
  if (v364)

  if (v415)
  if (v404)

  if (v376)
  if (v373)
  {

  }
  if (v375)

  if (v416)
  if (v405)

  if (v381)
  if (v379)
  {

  }
  if (v36)

  if (HIDWORD(v417))
  if (v406)

  if (v35)
  if (v380)
  {

  }
  if (v382)

  if (v418)
  if (v407)

  if (v386)
  if (v419)
  {

  }
  if (v383)
  {

  }
  if (v387)

  if (v420)
  if (v408)

  if (v392)
  if (v421)
  {

  }
  if (v389)
  {

  }
  if (v393)

  if (v422)
  if (v409)

  if ((_DWORD)v417)
  if ((_DWORD)v396)
  {

  }
  if (HIDWORD(v396))

  if (v423)
  if (!v23)

LABEL_182:
  return isEqual;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)devModeOn
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend_currentUser(CLSDataStore, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_devMode(v3, v4, v5) != 0;

  return v6;
}

- (void)setFileSizeInBytesFromURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  int ResourceValue_forKey_error;
  id v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7 = v4;
  if (v4
    && objc_msgSend_isFileURL(v4, v5, v6)
    && (objc_msgSend_type(self, v8, v9) & 0xFFFFFFFFFFFFFFFDLL) == 1
    && objc_msgSend_cls_fileExists(v7, v10, v11))
  {
    v25 = 0;
    v13 = *MEMORY[0x1E0C99998];
    v24 = 0;
    ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v7, v12, (uint64_t)&v25, v13, &v24);
    v15 = v25;
    v18 = v24;
    if (ResourceValue_forKey_error)
    {
      objc_msgSend_lock(self, v16, v17);
      self->_fileSizeInBytes = objc_msgSend_integerValue(v15, v19, v20);
      objc_msgSend_unlock(self, v21, v22);
    }
    else
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v23 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v27 = v7;
        v28 = 2114;
        v29 = v18;
        _os_log_error_impl(&dword_1D4054000, v23, OS_LOG_TYPE_ERROR, "Failed to get fileSize resource from URL: '%{public}@', error:  '%{public}@'.", buf, 0x16u);
      }
    }

  }
}

- (void)setFileUTTypeFromURL:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char ResourceValue_forKey_error;
  UTType *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  UTType *fileUTType;
  const char *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6 && (objc_msgSend_type(self, v4, v5) & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    if (objc_msgSend_cls_fileExists(v6, v7, v8))
    {
      v26 = 0;
      v11 = *MEMORY[0x1E0C998E0];
      v25 = 0;
      ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v6, v9, (uint64_t)&v26, v11, &v25);
      v13 = (UTType *)v26;
      v16 = v25;
      if ((ResourceValue_forKey_error & 1) != 0)
      {
LABEL_16:
        objc_msgSend_lock(self, v14, v15);
        fileUTType = self->_fileUTType;
        self->_fileUTType = v13;

        objc_msgSend_unlock(self, v23, v24);
        goto LABEL_17;
      }
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v17 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v28 = v6;
        v29 = 2114;
        v30 = v16;
        _os_log_error_impl(&dword_1D4054000, v17, OS_LOG_TYPE_ERROR, "Failed to get UTTYpe resource from URL: '%{public}@', error:  '%{public}@'. Trying to use the file extension to get UTType.", buf, 0x16u);
      }
    }
    else
    {
      v13 = 0;
      v16 = 0;
    }
    objc_msgSend_pathExtension(v6, v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_typeWithFilenameExtension_(MEMORY[0x1E0CEC3F8], v19, (uint64_t)v18);
    v20 = objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v21 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v18;
        _os_log_error_impl(&dword_1D4054000, v21, OS_LOG_TYPE_ERROR, "Failed to get UTTYpe from file extension: '%@'.", buf, 0xCu);
      }
    }

    v13 = (UTType *)v20;
    goto LABEL_16;
  }
LABEL_17:

}

- (NSURL)URL
{
  uint64_t v2;
  NSURL *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int64_t type;
  void *v10;
  const char *v11;
  int v12;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_URL;
  objc_msgSend_unlock(self, v5, v6);
  if (CurrentProcessBundleIdentiferMatches(CFSTR("com.apple.schoolwork.ClassKitApp")))
  {
    type = self->_type;
    if ((type | 2) == 3 && self->_schoolworkSyncStatus == 2)
    {
      if (type == 3)
      {
        objc_msgSend_fileUTType(self, v7, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend_conformsToType_(v10, v11, *MEMORY[0x1E0CEC458]);

        if (v12)
        {
          if ((objc_msgSend_isValidStreamingURL_(self, v7, (uint64_t)v4) & 1) != 0)
            return v4;
          goto LABEL_11;
        }
      }
      else if (type != 1)
      {
        return v4;
      }
      if ((objc_msgSend_isValidFileURL_isThumbnail_(self, v7, (uint64_t)v4, 0) & 1) == 0)
      {
LABEL_11:

        v4 = 0;
      }
    }
  }
  return v4;
}

- (void)setURL:(id)a3
{
  void *v3;
  const char *v6;
  uint64_t v7;
  void **p_URL;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  char isEqualToString;
  const char *v28;
  uint64_t v29;
  const char *v30;
  char v31;
  void *v32;
  const char *v33;
  const char *v34;
  id v35;

  v35 = a3;
  objc_msgSend_lock(self, v6, v7);
  p_URL = (void **)&self->_URL;
  objc_msgSend_path(self->_URL, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 || (objc_msgSend_path(v35, v11, v12), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_path(*p_URL, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v17 = (void *)v14;
      objc_msgSend_path(v35, v15, v16);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v21 = (void *)v18;
        objc_msgSend_path(*p_URL, v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_path(v35, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v22, v26, (uint64_t)v25);

        if (v13)
        {

          if ((isEqualToString & 1) != 0)
            goto LABEL_22;
        }
        else
        {

          if ((isEqualToString & 1) != 0)
            goto LABEL_22;
        }
LABEL_12:
        if (*p_URL && self->_URLIsSecurityScoped && (CLSExecutableLinkedOnOrAfter_iOS15_1_macOS_12_0() & 1) == 0)
        {
          objc_msgSend_stopAccessingSecurityScopedResource(*p_URL, v28, v29);
          self->_URLIsSecurityScoped = 0;
        }
        objc_storeStrong((id *)&self->_URL, a3);
        if (*p_URL)
        {
          v31 = CLSExecutableLinkedOnOrAfter_iOS15_1_macOS_12_0();
          v32 = *p_URL;
          if ((v31 & 1) == 0)
          {
            self->_URLIsSecurityScoped = objc_msgSend_startAccessingSecurityScopedResource(*p_URL, v30, (uint64_t)v32);
            objc_msgSend_setFileSizeInBytesFromURL_(self, v33, (uint64_t)*p_URL);
LABEL_21:
            objc_msgSend_setFileUTTypeFromURL_(self, v34, (uint64_t)*p_URL);
            goto LABEL_22;
          }
        }
        else
        {
          v32 = 0;
        }
        objc_msgSend_setFileSizeInBytesFromURL_(self, v30, (uint64_t)v32);
        goto LABEL_21;
      }

    }
    if (!v13)

    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend_unlock(self, v11, v12);

}

- (NSURL)thumbnailURL
{
  uint64_t v2;
  NSURL *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_thumbnailURL;
  objc_msgSend_unlock(self, v5, v6);
  if (CurrentProcessBundleIdentiferMatches(CFSTR("com.apple.schoolwork.ClassKitApp"))
    && (objc_msgSend_isValidFileURL_isThumbnail_(self, v7, (uint64_t)v4, 1) & 1) == 0)
  {

    v4 = 0;
  }
  return v4;
}

- (void)setThumbnailURL:(id)a3
{
  void *v3;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void **p_thumbnailURL;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  char isEqualToString;
  NSObject *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v9 = v6;
  if (!v6)
    goto LABEL_11;
  if (objc_msgSend_isFileURL(v6, v7, v8))
  {
    objc_msgSend_pathExtension(v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend_typeWithFilenameExtension_(MEMORY[0x1E0CEC3F8], v12, (uint64_t)v13);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend_conformsToType_(v3, v14, *MEMORY[0x1E0CEC530]);

    }
    else
    {
      v15 = 0;
    }
    objc_msgSend_sizeOfImageAtURL_(CLSImageUtils, v12, (uint64_t)v9);
    v17 = v16;
    v19 = v18;

    if (v15)
    {
      if (v17 <= 1024.0 && v19 <= 1024.0)
      {
LABEL_11:
        objc_msgSend_lock(self, v7, v8);
        p_thumbnailURL = (void **)&self->_thumbnailURL;
        objc_msgSend_path(self->_thumbnailURL, v22, v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          objc_msgSend_path(v9, v24, v25);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
            goto LABEL_27;
        }
        objc_msgSend_path(*p_thumbnailURL, v24, v25);
        v27 = objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v30 = (void *)v27;
          objc_msgSend_path(v9, v28, v29);
          v31 = objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v34 = (void *)v31;
            v42 = v3;
            objc_msgSend_path(*p_thumbnailURL, v32, v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_path(v9, v36, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v35, v39, (uint64_t)v38);

            if (v26)
            {

              if ((isEqualToString & 1) != 0)
                goto LABEL_27;
            }
            else
            {

              if ((isEqualToString & 1) != 0)
                goto LABEL_27;
            }
LABEL_26:
            objc_storeStrong((id *)&self->_thumbnailURL, a3);
LABEL_27:
            objc_msgSend_unlock(self, v24, v25);
            goto LABEL_28;
          }

        }
        if (!v26)

        goto LABEL_26;
      }
    }
  }
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v41 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v9;
    _os_log_error_impl(&dword_1D4054000, v41, OS_LOG_TYPE_ERROR, "Failed to set thumbnailURL since the supplied thumbnail is either not a JPEG or at least one of its dimensions is > 1024. thumbnailURL: %@", buf, 0xCu);
  }
LABEL_28:

}

- (void)mergeWithObject:(id)a3
{
  id *v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  NSURL *v22;
  NSURL *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  NSDate *urlExpirationDate;
  const char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  _QWORD v35[13];

  v35[12] = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v33.receiver = self;
  v33.super_class = (Class)CLSAbstractAsset;
  -[CLSObject mergeWithObject:](&v33, sel_mergeWithObject_, v4);
  v35[0] = CFSTR("ownerPersonID");
  v35[1] = CFSTR("brItemID");
  v35[2] = CFSTR("brZoneName");
  v35[3] = CFSTR("brOwnerName");
  v35[4] = CFSTR("brShareName");
  v35[5] = CFSTR("ubiquitousContainerName");
  v35[6] = CFSTR("relativePathWithinContainer");
  v35[7] = CFSTR("parentObjectID");
  v35[8] = CFSTR("schoolworkSyncStatus");
  v35[9] = CFSTR("downloaded");
  v35[10] = CFSTR("fractionDownloaded");
  v35[11] = CFSTR("displayOrder");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v35, 12);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v29, v34, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v9, v13, (_QWORD)v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v29, v34, 16);
    }
    while (v10);
  }

  v16 = v4[15];
  v17 = v4[14];
  objc_msgSend_valueForKey_(v4, v18, (uint64_t)CFSTR("urlExpirationDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(self, v20, v21);
  v22 = self->_thumbnailURL;
  v23 = self->_URL;
  objc_msgSend_unlock(self, v24, v25);
  if (v19)
  {
    urlExpirationDate = self->_urlExpirationDate;
    if (!urlExpirationDate || objc_msgSend_compare_(v19, v26, (uint64_t)urlExpirationDate) == 1)
    {
      objc_storeStrong((id *)&self->_urlExpirationDate, v19);
      objc_msgSend_setURL_(self, v28, (uint64_t)v17);
    }
  }
  if (!v23 && v17)
    objc_msgSend_setURL_(self, v26, (uint64_t)v17);
  if (!v22 && v16)
    objc_msgSend_setThumbnailURL_(self, v26, (uint64_t)v16);

}

- (NSString)filenameExtension
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_fileUTType(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredFilenameExtension(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (UTType)fileUTType
{
  uint64_t v2;
  UTType *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_fileUTType;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setFileUTType:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v12 = v5;
  if ((objc_msgSend_isEqual_(self->_fileUTType, v8, (uint64_t)v12) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fileUTType, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, v9, v10);

}

- (int64_t)schoolworkSyncStatus
{
  uint64_t v2;
  int64_t schoolworkSyncStatus;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  schoolworkSyncStatus = self->_schoolworkSyncStatus;
  objc_msgSend_unlock(self, v5, v6);
  if (schoolworkSyncStatus == 4)
  {
    if (CLSExecutableLinkedOnOrAfter_iOS15_1_macOS_12_0())
      return 4;
    else
      return 3;
  }
  return schoolworkSyncStatus;
}

- (void)setSchoolworkSyncStatus:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_schoolworkSyncStatus != a3)
  {
    self->_schoolworkSyncStatus = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (BOOL)isDownloaded
{
  uint64_t v2;
  BOOL downloaded;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  downloaded = self->_downloaded;
  objc_msgSend_unlock(self, v5, v6);
  return downloaded;
}

- (void)setDownloaded:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend_lock(self, a2, a3);
  if (self->_downloaded != v3)
  {
    self->_downloaded = v3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (NSString)title
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_title;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTitle:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *title;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  title = self->_title;
  v12 = (id)v8;
  if (v8 | (unint64_t)title
    && (!v8 || !title || (objc_msgSend_isEqualToString_(title, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_title, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (int64_t)displayOrder
{
  uint64_t v2;
  int64_t displayOrder;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  displayOrder = self->_displayOrder;
  objc_msgSend_unlock(self, v5, v6);
  return displayOrder;
}

- (void)setDisplayOrder:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_displayOrder != a3)
  {
    self->_displayOrder = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (BOOL)validateObject:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLSAbstractAsset;
  return -[CLSObject validateObject:](&v4, sel_validateObject_, a3);
}

- (void)willSaveObject
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLSAbstractAsset;
  -[CLSObject willSaveObject](&v2, sel_willSaveObject);
}

- (void)addDownloadObserver:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "adding download observer: %@", (uint8_t *)&v16, 0xCu);
  }
  objc_msgSend_addObject_(self->_downloadObservers, v8, (uint64_t)v4);
  objc_msgSend_unlock(self, v9, v10);
  if (objc_msgSend_devModeOn(self, v11, v12))
  {
    objc_msgSend_setDownloaded_(self, v13, 1);
    objc_msgSend_queued_notifyDownloadCompletion(self, v14, v15);
  }

}

- (void)removeDownloadObserver:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "removing download observer: %@", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend_removeObject_(self->_downloadObservers, v8, (uint64_t)v4);
  objc_msgSend_unlock(self, v9, v10);

}

- (id)downloadObservers
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_lock(self, a2, v2);
  v6 = (void *)objc_msgSend_copy(self->_downloadObservers, v4, v5);
  objc_msgSend_unlock(self, v7, v8);
  return v6;
}

- (void)queued_notifyDownloadProgressFraction:(double)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  objc_msgSend_downloadObservers(self, a2, v3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v5, v6, v7))
  {
    objc_initWeak(&location, self);
    sub_1D406111C();
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D406115C;
    block[3] = &unk_1E9749DC0;
    objc_copyWeak(&v11, &location);
    v10 = v5;
    dispatch_async(v8, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)queued_notifyDownloadCompletion
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  objc_msgSend_downloadObservers(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
  {
    objc_initWeak(&location, self);
    sub_1D406111C();
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D40613D4;
    block[3] = &unk_1E9749DC0;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    dispatch_async(v7, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)becomeChildOf:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  char isEqualToString;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  int v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  NSObject *v68;
  int v69;
  CLSAbstractAsset *v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_class();
  v7 = objc_opt_class();
  if ((objc_msgSend_isSubclassOfClass_(v6, v8, v7) & 1) != 0
    || (v11 = objc_opt_class(), (objc_msgSend_isSubclassOfClass_(v6, v12, v11) & 1) != 0))
  {
    v13 = 1;
  }
  else
  {
    v33 = objc_opt_class();
    if ((objc_msgSend_isSubclassOfClass_(v6, v34, v33) & 1) != 0
      || (v35 = objc_opt_class(), (objc_msgSend_isSubclassOfClass_(v6, v36, v35) & 1) != 0))
    {
      v13 = 2;
    }
    else
    {
      v56 = objc_opt_class();
      if ((objc_msgSend_isSubclassOfClass_(v6, v57, v56) & 1) != 0
        || (v58 = objc_opt_class(), (objc_msgSend_isSubclassOfClass_(v6, v59, v58) & 1) != 0))
      {
        v13 = 3;
      }
      else
      {
        v60 = objc_opt_class();
        if ((objc_msgSend_isSubclassOfClass_(v6, v61, v60) & 1) != 0)
        {
          v13 = 4;
        }
        else
        {
          v62 = objc_opt_class();
          if ((objc_msgSend_isSubclassOfClass_(v6, v63, v62) & 1) != 0
            || (v64 = objc_opt_class(), (objc_msgSend_isSubclassOfClass_(v6, v65, v64) & 1) != 0))
          {
            v13 = 5;
          }
          else
          {
            v66 = objc_opt_class();
            if ((objc_msgSend_isSubclassOfClass_(v6, v67, v66) & 1) != 0)
            {
              v13 = 6;
            }
            else
            {
              if (qword_1ED0FB9A0 != -1)
                dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
              v68 = CLSLogMultimedia;
              if (os_log_type_enabled((os_log_t)CLSLogMultimedia, OS_LOG_TYPE_ERROR))
              {
                v69 = 138543618;
                v70 = self;
                v71 = 2114;
                v72 = v5;
                _os_log_error_impl(&dword_1D4054000, v68, OS_LOG_TYPE_ERROR, "Asset '%{public}@' cannot be added to %{public}@", (uint8_t *)&v69, 0x16u);
              }
              v13 = 0;
            }
          }
        }
      }
    }
  }
  if (objc_msgSend_type(self, v9, v10) == 3)
  {
    objc_msgSend_parentObjectID(self, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 || (objc_msgSend_objectID(v5, v14, v16), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_parentObjectID(self, v14, v16);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v21 = (void *)v18;
        objc_msgSend_objectID(v5, v19, v20);
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v25 = (void *)v22;
          objc_msgSend_parentObjectID(self, v23, v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectID(v5, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v26, v30, (uint64_t)v29);

          if (v17)
          {

            if ((isEqualToString & 1) != 0)
              goto LABEL_20;
          }
          else
          {

            if ((isEqualToString & 1) != 0)
              goto LABEL_20;
          }
          goto LABEL_19;
        }

      }
      if (!v17)

LABEL_19:
      objc_msgSend_removeFromParentWithoutDeleting(self, v14, v32);
    }
  }
LABEL_20:
  objc_msgSend_addChild_changedPropertyName_(v5, v14, (uint64_t)self, CFSTR("assets"));
  objc_msgSend_parentObjectID(self, v37, v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    objc_msgSend_objectID(v5, v39, v40);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_33;
  }
  objc_msgSend_parentObjectID(self, v39, v40);
  v42 = objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    if (v41)
    {
LABEL_29:

      goto LABEL_34;
    }
LABEL_28:

    goto LABEL_29;
  }
  v45 = (void *)v42;
  objc_msgSend_objectID(v5, v43, v44);
  v46 = objc_claimAutoreleasedReturnValue();
  if (!v46)
  {

    if (v41)
      goto LABEL_29;
    goto LABEL_28;
  }
  v49 = (void *)v46;
  objc_msgSend_parentObjectID(self, v47, v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(v5, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend_isEqualToString_(v50, v54, (uint64_t)v53);

  if (v41)
  {

    if (!v55)
      goto LABEL_34;
    goto LABEL_33;
  }

  if ((v55 & 1) != 0)
LABEL_33:
    objc_msgSend_setParentEntityType_(self, v39, v13);
LABEL_34:

}

- (Class)parentEntityClass
{
  uint64_t v2;
  void *v3;

  if ((unint64_t)(objc_msgSend_parentEntityType(self, a2, v2) - 1) > 5)
    v3 = 0;
  else
    v3 = (void *)objc_opt_class();
  return (Class)v3;
}

- (id)filenameForCKContentStoreCache
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;

  objc_msgSend_originalFilename(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathExtension(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend_fileUTType(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_preferredFilenameExtension(v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_objectID(self, v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v13, v15, (uint64_t)CFSTR("file_%@.%@"), v14, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)thumbnailFilenameForCKContentStoreCache
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  objc_msgSend_preferredFilenameExtension((void *)*MEMORY[0x1E0CEC530], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_objectID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v9, (uint64_t)CFSTR("thumb_%@.%@"), v8, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)hasNotBeenRereferencedByServer
{
  uint64_t v2;
  void *v3;
  const char *v4;
  char hasSuffix;

  objc_msgSend_brZoneName(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  hasSuffix = objc_msgSend_hasSuffix_(v3, v4, (uint64_t)CFSTR("_Asset"));

  return hasSuffix;
}

- (void)urlSuitableForOpeningWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  qos_class_t v11;
  NSObject *v12;
  _QWORD block[4];
  void (**v14)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  v7 = objc_msgSend_type(self, v5, v6);
  switch(v7)
  {
    case 3:
      objc_msgSend_cloudKitAssetUrlSuitableForOpeningWithCompletion_(self, v8, (uint64_t)v4);
      break;
    case 2:
      objc_msgSend_URL(self, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v10, 0);

      break;
    case 1:
      objc_msgSend_driveAssetUrlSuitableForOpeningWithCompletion_(self, v8, (uint64_t)v4);
      break;
    default:
      v11 = qos_class_self();
      dispatch_get_global_queue(v11, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D4061C38;
      block[3] = &unk_1E9749DE8;
      v14 = v4;
      dispatch_async(v12, block);

      break;
  }

}

- (void)driveAssetUrlSuitableForOpeningWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  const char *v8;
  uint64_t v9;
  void *v10;
  NSURL *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  atomic_flag *p_URLRequested;
  unsigned __int8 v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[5];
  void (**v48)(_QWORD, _QWORD, _QWORD);
  id v49;
  _QWORD v50[5];
  _QWORD v51[5];
  id v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = sub_1D40620D8;
  v51[3] = &unk_1E9749E38;
  v51[4] = self;
  v6 = v4;
  v52 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D82575D0](v51);
  v50[0] = v5;
  v50[1] = 3221225472;
  v50[2] = sub_1D40622BC;
  v50[3] = &unk_1E9749E60;
  v50[4] = self;
  v10 = (void *)MEMORY[0x1D82575D0](v50);
  if (self->_type == 1)
  {
    objc_msgSend_lock(self, v8, v9);
    v11 = self->_URL;
    objc_msgSend_unlock(self, v12, v13);
    if (objc_msgSend_isValidFileURL_isThumbnail_(self, v14, (uint64_t)v11, 0))
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v15 = (void *)CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v15;
        objc_msgSend_objectID(self, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v54 = v20;
        _os_log_impl(&dword_1D4054000, v17, OS_LOG_TYPE_DEFAULT, "driveAssetUrlSuitableForOpeningWithCompletion, file exists on device, returning cached url for iCloudDrive asset: %@", buf, 0xCu);

      }
      objc_msgSend_setDownloaded_(self, v16, 1);
      objc_msgSend_clientRemote_downloadCompleted_error_(self, v21, 1, 0);
      ((void (**)(_QWORD, NSURL *, _QWORD))v7)[2](v7, v11, 0);
    }
    else
    {
      p_URLRequested = &self->_URLRequested;
      do
        v23 = __ldaxr((unsigned __int8 *)p_URLRequested);
      while (__stlxr(1u, (unsigned __int8 *)p_URLRequested));
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v24 = (void *)CLSLogAsset;
      if ((v23 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_INFO))
        {
          v43 = v24;
          objc_msgSend_objectID(self, v44, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v54 = v46;
          _os_log_impl(&dword_1D4054000, v43, OS_LOG_TYPE_INFO, "There is a pending request to look up url for iCloudDrive asset '%@'. Will complete the request when the pending request completes.", buf, 0xCu);

        }
        objc_msgSend_addToPendingURLCompletions_(self, v42, (uint64_t)v6);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v24;
          objc_msgSend_objectID(self, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v54 = v30;
          _os_log_impl(&dword_1D4054000, v27, OS_LOG_TYPE_DEFAULT, "looking up url for iCloudDrive asset: %@", buf, 0xCu);

        }
        objc_msgSend_brItemID(self, v25, v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dataStore(self, v32, v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36)
        {
          objc_msgSend_shared(CLSDataStore, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_brOwnerName(self, v34, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_brZoneName(self, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = v5;
        v47[1] = 3221225472;
        v47[2] = sub_1D4062538;
        v47[3] = &unk_1E9749E88;
        v47[4] = self;
        v48 = v7;
        v49 = v10;
        objc_msgSend_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_(v36, v41, (uint64_t)v11, v31, v37, v40, v47);

      }
    }
  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_format_(MEMORY[0x1E0CB35C8], v8, 2, CFSTR("driveAssetUrlSuitableForOpeningWithCompletion called for an asset type != CLSAssetTypeiCloudDrive"));
    v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, NSURL *))v7)[2](v7, 0, v11);
  }

}

- (BOOL)isValidFileURL:(id)a3 isThumbnail:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int started;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  int v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  NSString *brItemID;

  v6 = a3;
  v9 = v6;
  if (!v6 || !objc_msgSend_isFileURL(v6, v7, v8))
  {
    LOBYTE(v20) = 0;
    goto LABEL_14;
  }
  started = objc_msgSend_startAccessingSecurityScopedResource(v9, v10, v11);
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v9, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_fileExistsAtPath_(v15, v19, (uint64_t)v18);

  if (started)
    objc_msgSend_stopAccessingSecurityScopedResource(v9, v21, v22);
  if (v20 && !a4 && self->_type == 1)
  {
    objc_msgSend_br_itemID(v9, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    brItemID = self->_brItemID;
    if (v23)
    {
      if (brItemID && (objc_msgSend_isEqualToString_(v23, v24, (uint64_t)brItemID) & 1) != 0)
        goto LABEL_12;
    }
    else if (!brItemID)
    {
      goto LABEL_12;
    }
    LOBYTE(v20) = 0;
LABEL_12:

  }
LABEL_14:

  return v20;
}

- (BOOL)isValidStreamingURL:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  BOOL v12;

  v6 = a3;
  if (v6 && self->_type == 3)
  {
    objc_msgSend_urlExpirationDate(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_date(MEMORY[0x1E0C99D68], v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_compare_(v7, v11, (uint64_t)v10) == 1;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)pendingURLCompletions
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  objc_msgSend_lock(self, a2, v2);
  v6 = (void *)objc_msgSend_copy(self->_pendingURLCompletions, v4, v5);
  objc_msgSend_removeAllObjects(self->_pendingURLCompletions, v7, v8);
  objc_msgSend_unlock(self, v9, v10);
  return v6;
}

- (void)addToPendingURLCompletions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSMutableArray *pendingURLCompletions;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  pendingURLCompletions = self->_pendingURLCompletions;
  v8 = (void *)MEMORY[0x1D82575D0](v4);

  objc_msgSend_addObject_(pendingURLCompletions, v9, (uint64_t)v8);
  objc_msgSend_unlock(self, v10, v11);
}

- (id)pendingStreamingURLCompletions
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  objc_msgSend_lock(self, a2, v2);
  v6 = (void *)objc_msgSend_copy(self->_pendingStreamingURLCompletions, v4, v5);
  objc_msgSend_removeAllObjects(self->_pendingStreamingURLCompletions, v7, v8);
  objc_msgSend_unlock(self, v9, v10);
  return v6;
}

- (void)addToPendingStreamingURLCompletions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSMutableArray *pendingStreamingURLCompletions;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  pendingStreamingURLCompletions = self->_pendingStreamingURLCompletions;
  v8 = (void *)MEMORY[0x1D82575D0](v4);

  objc_msgSend_addObject_(pendingStreamingURLCompletions, v9, (uint64_t)v8);
  objc_msgSend_unlock(self, v10, v11);
}

- (id)pendingThumbnailURLCompletions
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  objc_msgSend_lock(self, a2, v2);
  v6 = (void *)objc_msgSend_copy(self->_pendingThumbnailURLCompletions, v4, v5);
  objc_msgSend_removeAllObjects(self->_pendingThumbnailURLCompletions, v7, v8);
  objc_msgSend_unlock(self, v9, v10);
  return v6;
}

- (void)addToPendingThumbnailURLCompletions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSMutableArray *pendingThumbnailURLCompletions;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  pendingThumbnailURLCompletions = self->_pendingThumbnailURLCompletions;
  v8 = (void *)MEMORY[0x1D82575D0](v4);

  objc_msgSend_addObject_(pendingThumbnailURLCompletions, v9, (uint64_t)v8);
  objc_msgSend_unlock(self, v10, v11);
}

- (void)cloudKitAssetUrlSuitableForOpeningWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  CLSAbstractAsset *v16;
  NSURL *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  NSObject *v23;
  atomic_flag *p_URLRequested;
  unsigned __int8 v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  CLSAbstractAsset *v38;
  unsigned __int8 v39;
  _QWORD v40[5];
  void (**v41)(_QWORD, _QWORD, _QWORD);
  id v42;
  _QWORD v43[5];
  _QWORD v44[5];
  id v45;
  uint8_t buf[4];
  CLSAbstractAsset *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = sub_1D4062F3C;
  v44[3] = &unk_1E9749E38;
  v44[4] = self;
  v6 = v4;
  v45 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D82575D0](v44);
  v43[0] = v5;
  v43[1] = 3221225472;
  v43[2] = sub_1D40630F8;
  v43[3] = &unk_1E9749E60;
  v43[4] = self;
  v9 = (void *)MEMORY[0x1D82575D0](v43);
  if (self->_type == 3)
  {
    if (objc_msgSend_conformsToType_(self->_fileUTType, v8, *MEMORY[0x1E0CEC458]))
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v12 = (void *)CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        v14 = v12;
        v16 = (CLSAbstractAsset *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v16;
        _os_log_impl(&dword_1D4054000, v14, OS_LOG_TYPE_DEFAULT, "WARNING: %@", buf, 0xCu);

      }
    }
    objc_msgSend_lock(self, v10, v11);
    v17 = self->_URL;
    objc_msgSend_unlock(self, v18, v19);
    if (objc_msgSend_isValidFileURL_isThumbnail_(self, v20, (uint64_t)v17, 0))
    {
      objc_msgSend_setDownloaded_(self, v21, 1);
      objc_msgSend_clientRemote_downloadCompleted_error_(self, v22, 1, 0);
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v23 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = self;
        _os_log_impl(&dword_1D4054000, v23, OS_LOG_TYPE_DEFAULT, "cloudKitAssetUrlSuitableForOpeningWithCompletion, file exists on device, returning cached url for cloudkit asset: %@", buf, 0xCu);
      }
      ((void (**)(_QWORD, NSURL *, _QWORD))v7)[2](v7, v17, 0);
    }
    else if (self->_brItemID)
    {
      p_URLRequested = &self->_URLRequested;
      do
        v25 = __ldaxr((unsigned __int8 *)p_URLRequested);
      while (__stlxr(1u, (unsigned __int8 *)p_URLRequested));
      if (qword_1ED0FB9A0 != -1)
      {
        v39 = v25;
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v25 = v39;
      }
      v26 = CLSLogAsset;
      if ((v25 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_INFO))
        {
          v35 = v26;
          objc_msgSend_objectID(self, v36, v37);
          v38 = (CLSAbstractAsset *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v47 = v38;
          _os_log_impl(&dword_1D4054000, v35, OS_LOG_TYPE_INFO, "There is a pending request to look up url for CloudKit asset: '%@'. Will complete the request when the pending request completes", buf, 0xCu);

        }
        objc_msgSend_addToPendingURLCompletions_(self, v34, (uint64_t)v6);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v47 = self;
          _os_log_impl(&dword_1D4054000, v26, OS_LOG_TYPE_DEFAULT, "looking up url for CloudKit asset: %@", buf, 0xCu);
        }
        objc_msgSend_dataStore(self, v27, v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v31)
        {
          objc_msgSend_shared(CLSDataStore, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v40[0] = v5;
        v40[1] = 3221225472;
        v40[2] = sub_1D4063354;
        v40[3] = &unk_1E9749E88;
        v40[4] = self;
        v41 = v7;
        v42 = v9;
        objc_msgSend_cloudKitUrlSuitableForOpeningForAsset_completion_(v31, v32, (uint64_t)self, v40);

      }
    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v21, 344, CFSTR("CKAsset is not available for this asset."));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v33);

    }
  }
  else
  {
    v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, NSURL *))v7)[2](v7, 0, v17);
  }

}

- (void)thumbnailURLSuitableForOpeningWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  qos_class_t v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  if (objc_msgSend_type(self, v5, v6) == 3
    && (objc_msgSend_conformsToType_(self->_fileUTType, v7, *MEMORY[0x1E0CEC450]) & 1) == 0)
  {
    objc_msgSend_cloudKitThumbnailUrlSuitableForOpeningWithCompletion_(self, v8, (uint64_t)v4);
  }
  else
  {
    v9 = qos_class_self();
    dispatch_get_global_queue(v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D40634EC;
    block[3] = &unk_1E9749DE8;
    v12 = v4;
    dispatch_async(v10, block);

  }
}

- (void)cloudKitThumbnailUrlSuitableForOpeningWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  const char *v8;
  uint64_t v9;
  void *v10;
  NSURL *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  atomic_flag *p_thumbnailURLRequested;
  unsigned __int8 v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  unsigned __int8 v30;
  _QWORD v31[5];
  void (**v32)(_QWORD, _QWORD, _QWORD);
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  CLSAbstractAsset *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_1D4063938;
  v35[3] = &unk_1E9749E38;
  v35[4] = self;
  v6 = v4;
  v36 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D82575D0](v35);
  v34[0] = v5;
  v34[1] = 3221225472;
  v34[2] = sub_1D4063AF4;
  v34[3] = &unk_1E9749E60;
  v34[4] = self;
  v10 = (void *)MEMORY[0x1D82575D0](v34);
  if (self->_type == 3)
  {
    objc_msgSend_lock(self, v8, v9);
    v11 = self->_thumbnailURL;
    objc_msgSend_unlock(self, v12, v13);
    if (objc_msgSend_isValidFileURL_isThumbnail_(self, v14, (uint64_t)v11, 1))
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v16 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = self;
        _os_log_impl(&dword_1D4054000, v16, OS_LOG_TYPE_DEFAULT, "cloudKitThumbnailUrlSuitableForOpeningWithCompletion, file exists on device, returning cached thumbnailURL for cloudkit asset: %@", buf, 0xCu);
      }
      objc_msgSend_setDownloaded_(self, v17, 1);
      objc_msgSend_clientRemote_downloadCompleted_error_(self, v18, 1, 0);
      ((void (**)(_QWORD, NSURL *, _QWORD))v7)[2](v7, v11, 0);
    }
    else if (self->_brItemID)
    {
      p_thumbnailURLRequested = &self->_thumbnailURLRequested;
      do
        v20 = __ldaxr((unsigned __int8 *)p_thumbnailURLRequested);
      while (__stlxr(1u, (unsigned __int8 *)p_thumbnailURLRequested));
      if (qword_1ED0FB9A0 != -1)
      {
        v30 = v20;
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v20 = v30;
      }
      v21 = CLSLogAsset;
      if ((v20 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v38 = self;
          _os_log_impl(&dword_1D4054000, v21, OS_LOG_TYPE_INFO, "there is a pending request to look up thumbnailURL for CloudKit asset: '%@'. will complete this request when the pending request completes", buf, 0xCu);
        }
        objc_msgSend_addToPendingThumbnailURLCompletions_(self, v29, (uint64_t)v6);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38 = self;
          _os_log_impl(&dword_1D4054000, v21, OS_LOG_TYPE_DEFAULT, "looking up thumbnailURL for CloudKit asset: %@", buf, 0xCu);
        }
        objc_msgSend_dataStore(self, v22, v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          objc_msgSend_shared(CLSDataStore, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v31[0] = v5;
        v31[1] = 3221225472;
        v31[2] = sub_1D4063D50;
        v31[3] = &unk_1E9749E88;
        v31[4] = self;
        v32 = v7;
        v33 = v10;
        objc_msgSend_cloudKitThumbnailUrlSuitableForOpeningForAsset_completion_(v26, v27, (uint64_t)self, v31);

      }
    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v15, 344, CFSTR("Thumbnail is not available for this asset."));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v28);

    }
  }
  else
  {
    v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, NSURL *))v7)[2](v7, 0, v11);
  }

}

- (void)urlSuitableForStreamingWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  const char *v8;
  uint64_t v9;
  void *v10;
  NSURL *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  atomic_flag *p_streamingURLRequested;
  unsigned __int8 v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  unsigned __int8 v28;
  _QWORD v29[5];
  void (**v30)(_QWORD, _QWORD, _QWORD);
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  CLSAbstractAsset *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1D40641D4;
  v33[3] = &unk_1E9749E38;
  v33[4] = self;
  v6 = v4;
  v34 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D82575D0](v33);
  v32[0] = v5;
  v32[1] = 3221225472;
  v32[2] = sub_1D4064390;
  v32[3] = &unk_1E9749E60;
  v32[4] = self;
  v10 = (void *)MEMORY[0x1D82575D0](v32);
  if (self->_type == 3)
  {
    objc_msgSend_lock(self, v8, v9);
    v11 = self->_URL;
    objc_msgSend_unlock(self, v12, v13);
    if (objc_msgSend_isValidStreamingURL_(self, v14, (uint64_t)v11))
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v16 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = (CLSAbstractAsset *)v11;
        _os_log_impl(&dword_1D4054000, v16, OS_LOG_TYPE_DEFAULT, "done getting streaming url for CloudKit asset, returning cached url: %@", buf, 0xCu);
      }
      ((void (**)(_QWORD, NSURL *, _QWORD))v7)[2](v7, v11, 0);
    }
    else if (self->_brItemID)
    {
      p_streamingURLRequested = &self->_streamingURLRequested;
      do
        v18 = __ldaxr((unsigned __int8 *)p_streamingURLRequested);
      while (__stlxr(1u, (unsigned __int8 *)p_streamingURLRequested));
      if (qword_1ED0FB9A0 != -1)
      {
        v28 = v18;
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v18 = v28;
      }
      v19 = CLSLogAsset;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v36 = self;
          _os_log_impl(&dword_1D4054000, v19, OS_LOG_TYPE_INFO, "there is a pending request to look up streaming url for CloudKit asset: '%@'. will complete the request when the pending request completes", buf, 0xCu);
        }
        objc_msgSend_addToPendingStreamingURLCompletions_(self, v27, (uint64_t)v6);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v36 = self;
          _os_log_impl(&dword_1D4054000, v19, OS_LOG_TYPE_DEFAULT, "looking up streaming url for CloudKit asset: %@", buf, 0xCu);
        }
        objc_msgSend_dataStore(self, v20, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          objc_msgSend_shared(CLSDataStore, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v29[0] = v5;
        v29[1] = 3221225472;
        v29[2] = sub_1D40645EC;
        v29[3] = &unk_1E9749EB0;
        v29[4] = self;
        v30 = v7;
        v31 = v10;
        objc_msgSend_cloudKitUrlSuitableForStreamingAsset_completion_(v24, v25, (uint64_t)self, v29);

      }
    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v15, 344, CFSTR("Streaming URL is not available for this asset."));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v26);

    }
  }
  else
  {
    v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, NSURL *))v7)[2](v7, 0, v11);
  }

}

- (void)clientRemote_invalidate
{
  NSObject *v2;
  uint8_t v3[16];

  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v2 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl(&dword_1D4054000, v2, OS_LOG_TYPE_DEBUG, "CLSAssetDownloadProgressNotifiable clientRemote_invalidate called", v3, 2u);
  }
}

- (void)clientRemote_downloadProgressFraction:(double)a3 error:(id)a4
{
  NSError *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSError *downloadError;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  int v15;
  double v16;
  __int16 v17;
  NSError *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (NSError *)a4;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEBUG))
  {
    v15 = 134218242;
    v16 = a3;
    v17 = 2112;
    v18 = v6;
    _os_log_debug_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEBUG, "clientRemote_downloadProgressFraction called: progressFraction = %4.2f, error = %@", (uint8_t *)&v15, 0x16u);
  }
  objc_msgSend_lock(self, v8, v9);
  downloadError = self->_downloadError;
  self->_downloadError = v6;

  self->_fractionDownloaded = a3;
  objc_msgSend_unlock(self, v11, v12);
  objc_msgSend_queued_notifyDownloadProgressFraction_(self, v13, v14, a3);
}

- (void)clientRemote_downloadCompleted:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  NSError *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSError *downloadError;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  _DWORD v15[2];
  __int16 v16;
  NSError *v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = (NSError *)a4;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEBUG))
  {
    v15[0] = 67109378;
    v15[1] = v4;
    v16 = 2112;
    v17 = v6;
    _os_log_debug_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEBUG, "clientRemote_downloadCompleted called: completed = %d, error = %@", (uint8_t *)v15, 0x12u);
  }
  objc_msgSend_lock(self, v8, v9);
  downloadError = self->_downloadError;
  self->_downloadError = v6;

  self->_downloaded = v4;
  objc_msgSend_unlock(self, v11, v12);
  objc_msgSend_queued_notifyDownloadCompletion(self, v13, v14);
}

- (double)fractionDownloaded
{
  return self->_fractionDownloaded;
}

- (void)setFractionDownloaded:(double)a3
{
  self->_fractionDownloaded = a3;
}

- (NSError)downloadError
{
  return self->_downloadError;
}

- (void)setDownloadError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)urlExpirationDate
{
  return self->_urlExpirationDate;
}

- (void)setUrlExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_urlExpirationDate, a3);
}

- (BOOL)isOriginal
{
  return self->_original;
}

- (void)setOriginal:(BOOL)a3
{
  self->_original = a3;
}

- (int64_t)fileSizeInBytes
{
  return self->_fileSizeInBytes;
}

- (void)setFileSizeInBytes:(int64_t)a3
{
  self->_fileSizeInBytes = a3;
}

- (void)setFilenameExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)ownerPersonID
{
  return self->_ownerPersonID;
}

- (void)setOwnerPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void)setDurationInSeconds:(double)a3
{
  self->_durationInSeconds = a3;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (int64_t)parentEntityType
{
  return self->_parentEntityType;
}

- (void)setParentEntityType:(int64_t)a3
{
  self->_parentEntityType = a3;
}

- (NSString)brItemID
{
  return self->_brItemID;
}

- (void)setBrItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)brOwnerName
{
  return self->_brOwnerName;
}

- (void)setBrOwnerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)brZoneName
{
  return self->_brZoneName;
}

- (void)setBrZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)brShareName
{
  return self->_brShareName;
}

- (void)setBrShareName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)ubiquitousContainerName
{
  return self->_ubiquitousContainerName;
}

- (void)setUbiquitousContainerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)relativePathWithinContainer
{
  return self->_relativePathWithinContainer;
}

- (void)setRelativePathWithinContainer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenameExtension, 0);
  objc_storeStrong((id *)&self->_urlExpirationDate, 0);
  objc_storeStrong((id *)&self->_pendingThumbnailURLCompletions, 0);
  objc_storeStrong((id *)&self->_pendingStreamingURLCompletions, 0);
  objc_storeStrong((id *)&self->_pendingURLCompletions, 0);
  objc_storeStrong((id *)&self->_relativePathWithinContainer, 0);
  objc_storeStrong((id *)&self->_ubiquitousContainerName, 0);
  objc_storeStrong((id *)&self->_brShareName, 0);
  objc_storeStrong((id *)&self->_brZoneName, 0);
  objc_storeStrong((id *)&self->_brOwnerName, 0);
  objc_storeStrong((id *)&self->_brItemID, 0);
  objc_storeStrong((id *)&self->_ownerPersonID, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_fileUTType, 0);
  objc_storeStrong((id *)&self->_downloadObservers, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
