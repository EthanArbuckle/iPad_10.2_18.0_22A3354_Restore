@implementation CKAsset

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKAsset)init
{
  objc_class *v2;
  uint64_t v3;
  CKException *v4;
  const char *v5;
  id v6;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = [CKException alloc];
  v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("You must call -[%@ initWithFileURL:] or -[%@ initWithData:]"), v3, v3);
  objc_exception_throw(v6);
}

- (id)initInternal
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAsset;
  result = -[CKAsset init](&v3, sel_init);
  if (result)
  {
    *((_QWORD *)result + 44) = -1;
    *((_QWORD *)result + 47) = -1;
    *((_QWORD *)result + 13) = 2;
  }
  return result;
}

- (CKAsset)initWithFileURL:(id)a3 signature:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CKAsset *inited;
  uint64_t v18;
  NSURL *fileURL;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSData *signature;
  uint64_t v25;
  NSString *UUID;

  v6 = a3;
  v10 = a4;
  if (!v6)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v7, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Null fileURL"));
  if ((objc_msgSend_isFileURL(v6, v7, v8, v9) & 1) == 0)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v11, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Non-file URL"));
  if (!v10)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v11, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Null signature"));
  inited = (CKAsset *)objc_msgSend_initInternal(self, v11, v12, v13);
  if (inited)
  {
    v18 = objc_msgSend_copy(v6, v14, v15, v16);
    fileURL = inited->_fileURL;
    inited->_fileURL = (NSURL *)v18;

    v23 = objc_msgSend_copy(v10, v20, v21, v22);
    signature = inited->_signature;
    inited->_signature = (NSData *)v23;

    CKCreateGUID();
    v25 = objc_claimAutoreleasedReturnValue();
    UUID = inited->_UUID;
    inited->_UUID = (NSString *)v25;

  }
  return inited;
}

- (CKAsset)initWithFileURL:(id)a3 signature:(id)a4 assetHandleUUID:(id)a5
{
  id v8;
  const char *v9;
  id v10;
  CKAsset *v11;

  v8 = a3;
  v10 = a4;
  if (!a5)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v9, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Null assetHandleUUID"));
  v11 = (CKAsset *)objc_msgSend_initWithFileURL_signature_(self, v9, (uint64_t)v8, (uint64_t)v10);

  return v11;
}

- (CKAsset)initWithFileURL:(NSURL *)fileURL
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSURL *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKAsset *inited;
  uint64_t v15;
  NSURL *v16;
  uint64_t v17;
  NSString *UUID;

  v7 = fileURL;
  if (!v7)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Null fileURL"));
  if ((objc_msgSend_isFileURL(v7, v4, v5, v6) & 1) == 0)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v8, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Non-file URL"));
  inited = (CKAsset *)objc_msgSend_initInternal(self, v8, v9, v10);
  if (inited)
  {
    v15 = objc_msgSend_copy(v7, v11, v12, v13);
    v16 = inited->_fileURL;
    inited->_fileURL = (NSURL *)v15;

    CKCreateGUID();
    v17 = objc_claimAutoreleasedReturnValue();
    UUID = inited->_UUID;
    inited->_UUID = (NSString *)v17;

  }
  return inited;
}

- (CKAsset)initWithAssetReference:(id)a3
{
  id v4;
  char v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKAsset *inited;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSData *signature;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CKAssetReference *assetReference;
  uint64_t v25;
  NSString *UUID;
  void *v28;
  CKException *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  id v39;
  id v40;

  v4 = a3;
  v40 = 0;
  v5 = _CKCheckArgument((uint64_t)"assetReference", v4, 0, 0, 0, &v40);
  v6 = v40;
  if ((v5 & 1) == 0)
  {
    v28 = v6;
    v29 = [CKException alloc];
    v33 = objc_msgSend_code(v28, v30, v31, v32);
    objc_msgSend_localizedDescription(v28, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (id)objc_msgSend_initWithCode_format_(v29, v38, v33, (uint64_t)CFSTR("%@"), v37);

    objc_exception_throw(v39);
  }

  inited = (CKAsset *)objc_msgSend_initInternal(self, v7, v8, v9);
  if (inited)
  {
    objc_msgSend_fileSignature(v4, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_copy(v14, v15, v16, v17);
    signature = inited->_signature;
    inited->_signature = (NSData *)v18;

    v23 = objc_msgSend_copy(v4, v20, v21, v22);
    assetReference = inited->_assetReference;
    inited->_assetReference = (CKAssetReference *)v23;

    CKCreateGUID();
    v25 = objc_claimAutoreleasedReturnValue();
    UUID = inited->_UUID;
    inited->_UUID = (NSString *)v25;

  }
  return inited;
}

+ (CKAsset)assetWithFileURL:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v7 = (void *)objc_msgSend_initWithFileURL_(v4, v5, (uint64_t)v3, v6);

  return (CKAsset *)v7;
}

- (CKAsset)initWithDeviceID:(id)a3 fileID:(id)a4 generationID:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  CKAsset *v29;
  uint64_t v30;
  NSNumber *deviceID;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSNumber *fileID;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSNumber *generationCountToSave;

  v8 = a3;
  v9 = a4;
  v13 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v10, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Null deviceID"));
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v10, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Null fileID"));
LABEL_3:
  v14 = objc_msgSend_intValue(v8, v10, v11, v12);
  v18 = objc_msgSend_unsignedLongLongValue(v9, v15, v16, v17);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("/.vol/%u/%llu"), v20, v14, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], v22, (uint64_t)v21, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (CKAsset *)objc_msgSend_initWithFileURL_(self, v24, (uint64_t)v23, v25);
  if (v29)
  {
    v30 = objc_msgSend_copy(v8, v26, v27, v28);
    deviceID = v29->_deviceID;
    v29->_deviceID = (NSNumber *)v30;

    v35 = objc_msgSend_copy(v9, v32, v33, v34);
    fileID = v29->_fileID;
    v29->_fileID = (NSNumber *)v35;

    v40 = objc_msgSend_copy(v13, v37, v38, v39);
    generationCountToSave = v29->_generationCountToSave;
    v29->_generationCountToSave = (NSNumber *)v40;

  }
  return v29;
}

- (CKAsset)initWithFileDescriptor:(int)a3
{
  uint64_t v3;
  CKAsset *inited;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSFileHandle *fileHandle;
  uint64_t v12;
  NSString *UUID;

  if (a3 <= 0)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Invalid fileDescriptor"));
  inited = (CKAsset *)objc_msgSend_initInternal(self, a2, *(uint64_t *)&a3, v3);
  if (inited)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3608]);
    v8 = dup(a3);
    v10 = objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v7, v9, v8, 1);
    fileHandle = inited->_fileHandle;
    inited->_fileHandle = (NSFileHandle *)v10;

    CKCreateGUID();
    v12 = objc_claimAutoreleasedReturnValue();
    UUID = inited->_UUID;
    inited->_UUID = (NSString *)v12;

  }
  return inited;
}

- (CKAsset)initWithAssetContent:(id)a3 itemTypeHint:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t inited;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKAsset *v19;
  uint64_t v20;
  NSData *assetContent;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *itemTypeHint;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString *UUID;

  v6 = a3;
  v7 = a4;
  v11 = v7;
  v12 = (uint64_t *)MEMORY[0x1E0C99778];
  if (v6)
  {
    if (!v7)
      goto LABEL_6;
LABEL_5:
    if (objc_msgSend_length(v11, v8, v9, v10))
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v8, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Null assetContent"));
  if (v11)
    goto LABEL_5;
LABEL_6:
  objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v8, *v12, (uint64_t)CFSTR("Null itemTypeHint"));
LABEL_7:
  inited = objc_msgSend_initInternal(self, v8, v13, v14);
  v19 = (CKAsset *)inited;
  if (inited)
  {
    *(_BYTE *)(inited + 9) = 1;
    v20 = objc_msgSend_copy(v6, v16, v17, v18);
    assetContent = v19->_assetContent;
    v19->_assetContent = (NSData *)v20;

    v25 = objc_msgSend_copy(v11, v22, v23, v24);
    itemTypeHint = v19->_itemTypeHint;
    v19->_itemTypeHint = (NSString *)v25;

    v19->_hasSize = 1;
    v19->_size = objc_msgSend_length(v6, v27, v28, v29);
    CKCreateGUID();
    v30 = objc_claimAutoreleasedReturnValue();
    UUID = v19->_UUID;
    v19->_UUID = (NSString *)v30;

  }
  return v19;
}

- (unint64_t)size
{
  CKAsset *v2;
  unint64_t size;

  v2 = self;
  objc_sync_enter(v2);
  size = v2->_size;
  objc_sync_exit(v2);

  return size;
}

- (void)setSize:(unint64_t)a3
{
  const char *v4;
  uint64_t v5;
  CKAsset *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_setHasSize_(obj, v4, 1, v5);
  obj->_size = a3;
  objc_sync_exit(obj);

}

- (BOOL)isReference
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;

  objc_msgSend_assetReference(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isConstructedAsset
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;

  objc_msgSend_constructedAssetDownloadURLTemplate(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  int isConstructedAsset;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  void *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  void *v157;
  const char *v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  void *v196;
  const char *v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  void *v210;
  void *v211;
  const char *v212;
  id v213;
  _BOOL4 v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;

  v5 = a5;
  v6 = a4;
  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], a2, 19, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v215 = v5;
    objc_msgSend_UUID(self, v8, v9, v10);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v12, (uint64_t)CFSTR("UUID"), v15);
    v16 = objc_msgSend_arrayIndex(self, v12, v13, v14);
    if ((v16 & 0x8000000000000000) == 0)
    {
      objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v17, v16, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v21, (uint64_t)CFSTR("arrayIndex"), (uint64_t)v20);

    }
    v226 = (void *)v15;
    if (objc_msgSend_hasSize(self, v17, v18, v19))
    {
      v25 = (void *)MEMORY[0x1E0CB37E8];
      v26 = objc_msgSend_size(self, v22, v23, v24);
      objc_msgSend_numberWithUnsignedLongLong_(v25, v27, v26, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v30, (uint64_t)CFSTR("size"), (uint64_t)v29);

    }
    objc_msgSend_assetContent(self, v22, v23, v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v31;
    if (v31)
    {
      v36 = (void *)MEMORY[0x1E0CB3940];
      v37 = objc_msgSend_length(v31, v32, v33, v34);
      objc_msgSend_stringWithFormat_(v36, v38, (uint64_t)CFSTR("<%lu bytes>"), v39, v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v41, (uint64_t)CFSTR("assetContent"), (uint64_t)v40);

    }
    isConstructedAsset = objc_msgSend_isConstructedAsset(self, v32, v33, v34);
    if (isConstructedAsset)
    {
      objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v42, 1, v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v47, (uint64_t)CFSTR("constructedAssetEstimatedSize"), (uint64_t)v46);

    }
    objc_msgSend_fileURL(self, v42, v43, v44);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v48;
    if (v48)
    {
      objc_msgSend_CKSanitizedPath(v48, v49, v50, v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v54, (uint64_t)CFSTR("path"), (uint64_t)v53);

    }
    objc_msgSend_recordKey(self, v49, v50, v51);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v55;
    if (v55)
    {
      objc_msgSend_description(v55, v56, v57, v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v61, (uint64_t)CFSTR("recordKey"), (uint64_t)v60);

    }
    v218 = v59;
    objc_msgSend_signature(self, v56, v57, v58);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v62;
    if (v62)
    {
      objc_msgSend_description(v62, v63, v64, v65);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (isConstructedAsset)
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v67, (uint64_t)CFSTR("sourceSignature"), (uint64_t)v68);
      else
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v67, (uint64_t)CFSTR("signature"), (uint64_t)v68);

    }
    v225 = v35;
    objc_msgSend_deviceID(self, v63, v64, v65);
    v72 = objc_claimAutoreleasedReturnValue();
    if (v72)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v69, (uint64_t)CFSTR("deviceID"), v72);
    objc_msgSend_fileID(self, v69, v70, v71);
    v76 = objc_claimAutoreleasedReturnValue();
    if (v76)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v73, (uint64_t)CFSTR("fileID"), v76);
    v222 = (void *)v76;
    objc_msgSend_fileHandle(self, v73, v74, v75);
    v80 = objc_claimAutoreleasedReturnValue();
    if (v80)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v77, (uint64_t)CFSTR("fileHandle"), v80);
    v217 = v66;
    v227 = (void *)v80;
    objc_msgSend_generationCountToSave(self, v77, v78, v79);
    v84 = objc_claimAutoreleasedReturnValue();
    if (v84)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v81, (uint64_t)CFSTR("generationID"), v84);
    objc_msgSend_owner(self, v81, v82, v83);
    v88 = objc_claimAutoreleasedReturnValue();
    if (v88)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v85, (uint64_t)CFSTR("owner"), v88);
    v228 = (void *)v88;
    objc_msgSend_requestor(self, v85, v86, v87);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v89;
    if (v89 && (objc_msgSend_isEqual_(v89, v90, (uint64_t)v228, v92) & 1) == 0)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v90, (uint64_t)CFSTR("requestor"), (uint64_t)v93);
    v223 = (void *)v72;
    objc_msgSend_authToken(self, v90, v91, v92);
    v97 = objc_claimAutoreleasedReturnValue();
    if (v97)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v94, (uint64_t)CFSTR("authToken"), v97);
    v220 = (void *)v97;
    v98 = objc_msgSend_downloadTokenExpiration(self, v94, v95, v96);
    if (v98)
    {
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v99, v98, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v103, (uint64_t)CFSTR("downloadTokenExpiration"), (uint64_t)v102);

    }
    v104 = objc_msgSend_uploadRank(self, v99, v100, v101);
    if ((v104 & 0x8000000000000000) == 0)
    {
      objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v105, v104, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v109, (uint64_t)CFSTR("uploadRank"), (uint64_t)v108);

    }
    objc_msgSend_uploadReceipt(self, v105, v106, v107);
    v113 = objc_claimAutoreleasedReturnValue();
    if (v113)
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v110, (uint64_t)CFSTR("uploadReceipt"), v113);
      v114 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_uploadReceiptExpiration(self, v115, v116, v117);
      objc_msgSend_numberWithDouble_(v114, v118, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v122, (uint64_t)CFSTR("uploadReceiptExpiration"), (uint64_t)v121);

    }
    v219 = (void *)v113;
    objc_msgSend_wrappedAssetKey(self, v110, v111, v112);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v123;
    if (v123)
    {
      v128 = (void *)MEMORY[0x1E0CB3940];
      v129 = objc_msgSend_length(v123, v124, v125, v126);
      objc_msgSend_stringWithFormat_(v128, v130, (uint64_t)CFSTR("<%lu bytes>"), v131, v129);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v133, (uint64_t)CFSTR("wrappedAssetKey"), (uint64_t)v132);

    }
    objc_msgSend_clearAssetKey(self, v124, v125, v126);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v134;
    if (v134)
    {
      v139 = (void *)MEMORY[0x1E0CB3940];
      v140 = objc_msgSend_length(v134, v135, v136, v137);
      objc_msgSend_stringWithFormat_(v139, v141, (uint64_t)CFSTR("<%lu bytes>"), v142, v140);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v144, (uint64_t)CFSTR("clearAssetKey"), (uint64_t)v143);

    }
    objc_msgSend_referenceSignature(self, v135, v136, v137);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = v145;
    v221 = (void *)v84;
    if (v145)
    {
      objc_msgSend_description(v145, v146, v147, v148);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      if (isConstructedAsset)
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v150, (uint64_t)CFSTR("sourceReferenceSignature"), (uint64_t)v151);
      else
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v150, (uint64_t)CFSTR("referenceSignature"), (uint64_t)v151);

    }
    v224 = v52;
    objc_msgSend_downloadPreauthorization(self, v146, v147, v148);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v152;
    if (v152)
    {
      objc_msgSend_responseUUID(v152, v153, v154, v155);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v158, (uint64_t)CFSTR("downloadPreauthorizationUUID"), (uint64_t)v157);

    }
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v153, 7, v155);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_uploaded(self, v160, v161, v162))
      objc_msgSend_addObject_(v159, v163, (uint64_t)CFSTR("uploaded"), v165);
    v216 = v127;
    if (objc_msgSend_downloaded(self, v163, v164, v165))
      objc_msgSend_addObject_(v159, v166, (uint64_t)CFSTR("downloaded"), v168);
    objc_msgSend_downloadURLExpiration(self, v166, v167, v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_downloadURLTemplate(self, v170, v171, v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();

    if (v173)
    {
      objc_msgSend_addObject_(v159, v174, (uint64_t)CFSTR("has-download-url"), v176);
      objc_msgSend_description(v169, v177, v178, v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v181, (uint64_t)CFSTR("downloadURLExpiration"), (uint64_t)v180);

    }
    objc_msgSend_constructedAssetDownloadURLTemplate(self, v174, v175, v176);
    v182 = (void *)objc_claimAutoreleasedReturnValue();

    if (v182)
    {
      objc_msgSend_addObject_(v159, v183, (uint64_t)CFSTR("has-constructed-download-url"), v185);
      objc_msgSend_description(v169, v186, v187, v188);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v190, (uint64_t)CFSTR("downloadURLExpiration"), (uint64_t)v189);

    }
    objc_msgSend_constructedAssetDownloadParameters(self, v183, v184, v185);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = v191;
    if (v191)
    {
      objc_msgSend_description(v191, v192, v193, v194);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v197, (uint64_t)CFSTR("constructedAssetDownloadParameters"), (uint64_t)v196);

    }
    objc_msgSend_downloadPreauthorization(self, v192, v193, v194);
    v198 = (void *)objc_claimAutoreleasedReturnValue();

    if (v198)
      objc_msgSend_addObject_(v159, v199, (uint64_t)CFSTR("has-download-preauth"), v201);
    if (objc_msgSend_shouldReadRawEncryptedData(self, v199, v200, v201))
      objc_msgSend_addObject_(v159, v202, (uint64_t)CFSTR("read-encrypted"), v204);
    if (objc_msgSend_storageGroupingPolicy(self, v202, v203, v204) == 1)
      objc_msgSend_addObject_(v159, v205, (uint64_t)CFSTR("group-by-key"), v207);
    v210 = v227;
    if (objc_msgSend_count(v159, v205, v206, v207))
    {
      if (v215)
      {
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v208, (uint64_t)CFSTR("flags"), (uint64_t)v159);
      }
      else
      {
        objc_msgSend_componentsJoinedByString_(v159, v208, (uint64_t)CFSTR("|"), v209);
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v212, (uint64_t)CFSTR("flags"), (uint64_t)v211);

        v210 = v227;
      }
    }

  }
  v213 = v11;

  return v213;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKAsset *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

+ (id)openToReadRawEncryptedDataWithOpenInfo:(id)a3 error:(id *)a4
{
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  NSObject *v17;
  void *v18;
  CKFileOpenResult *v19;
  const char *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend_path(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    *__error() = 0;
    objc_msgSend_fileSystemRepresentation(v6, v7, v8, v9);
    v10 = MKBBackupOpen();
    v11 = __error();
    if ((_DWORD)v10)
    {
      v14 = *v11;
      if (a4)
      {
        v15 = objc_msgSend_errorCodeFromPOSIXCode_(CKAsset, v12, v14, v13);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v16, (uint64_t)CFSTR("CKInternalErrorDomain"), v15, CFSTR("MKBBackupOpen failed with rc:%d errno:%d"), v10, v14);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v17 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v25 = v6;
        v26 = 1024;
        v27 = v10;
        v28 = 1024;
        v29 = v14;
        _os_log_error_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_ERROR, "MKBBackupOpen failed at \"%{public}@\" with rc:%d errno:%d", buf, 0x18u);
      }
      goto LABEL_11;
    }
    v19 = [CKFileOpenResult alloc];
    v21 = (void *)objc_msgSend_initWithMobileKeyBagHandle_path_error_(v19, v20, 0, (uint64_t)v6, a4);
    v18 = v21;
    if (v21)
      v22 = v21;
    else
      MKBBackupClose();

  }
  else
  {
    if (!a4)
    {
LABEL_11:
      v18 = 0;
      goto LABEL_16;
    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v5, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("nil path"));
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_16:

  return v18;
}

+ (int)errorCodeFromPOSIXCode:(int)a3
{
  int result;

  result = 3001;
  if (a3 > 12)
  {
    if (a3 == 45)
      return 3009;
    if (a3 != 35)
    {
      if (a3 != 13)
        return result;
      return 3010;
    }
    return 3002;
  }
  if (a3 == 1)
    return 3010;
  if (a3 == 2)
    return 3002;
  return result;
}

+ (id)_openUnencryptedWithOpenInfo:(id)a3 genCountCheck:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int RawEncryptedData;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char v44;
  id v45;
  int v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  int *v54;
  uint64_t v55;
  char *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  const char *v66;
  uint64_t v67;
  CKFileOpenResult *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  int v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  BOOL v88;
  void *v89;
  const char *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  char *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  id v104;
  _BOOL8 v105;
  const char *v106;
  uint64_t v107;
  id v108;
  const char *v109;
  uint64_t v110;
  id v111;
  const char *v112;
  uint64_t v113;
  id v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  char *v118;
  const char *v119;
  char *v120;
  const char *v121;
  uint64_t v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  id *v129;
  void *v130;
  void *v131;
  uint64_t v132[3];
  __int128 v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  unsigned __int8 v137;
  int v138;
  stat buf;
  uint64_t v140;

  v6 = a4;
  v140 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  RawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(v8, v9, v10, v11);
  if (!v6)
  {
    if ((RawEncryptedData & 1) != 0)
      goto LABEL_3;
LABEL_14:
    __assert_rtn("+[CKAsset _openUnencryptedWithOpenInfo:genCountCheck:error:]", "CKAsset.m", 455, "(!genCountCheck && openInfo.shouldReadRawEncryptedData) || (genCountCheck && !openInfo.shouldReadRawEncryptedData)");
  }
  if (RawEncryptedData)
    goto LABEL_14;
LABEL_3:
  v138 = -1;
  objc_msgSend_path(v8, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(v8, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileID(v8, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_generationID(v8, v25, v26, v27);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileHandle(v8, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetDownloadStagingInfo(v8, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetDownloadStagingManager(v8, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v39;
  v137 = 1;
  v131 = v24;
  if (!v20 && !v24 && !v16 && !v31 && (!v35 || !v39))
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v40, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Invalid arguments: %@, %@, %@"), 0, 0, 0);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v47 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 138412802;
      *(_QWORD *)&buf.st_mode = 0;
      WORD2(buf.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = 0;
      HIWORD(buf.st_gid) = 2114;
      *(_QWORD *)&buf.st_rdev = 0;
      _os_log_error_impl(&dword_18A5C5000, v47, OS_LOG_TYPE_ERROR, "Invalid arguments, deviceID:%@, fileID:%{public}@, path:%{public}@", (uint8_t *)&buf, 0x20u);
    }
    v31 = 0;
    goto LABEL_71;
  }
  v129 = a5;
  if (!v35 || !v39)
  {
    if (v31)
    {
      v46 = objc_msgSend_fileDescriptor(v31, v40, v41, v42);
      v45 = 0;
      v138 = v46;
      v137 = 0;
      if ((v46 & 0x80000000) == 0)
      {
LABEL_30:
        v133 = xmmword_18A83D1F0;
        v134 = 512;
        memset(v132, 0, 20);
        if (fgetattrlist(v46, &v133, v132, 0x14uLL, 0x20u))
        {
          v54 = __error();
          v55 = *v54;
          v56 = strerror(*v54);
          objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v57, (uint64_t)CFSTR("CKInternalErrorDomain"), 3001, v16, CFSTR("fgetattrlist error: %d (%s)"), v55, v56);
        }
        else if ((WORD2(v132[0]) & 0xF000) == 0x8000)
        {
          if (!v6
            || !objc_msgSend_unsignedIntegerValue(v130, v51, v52, v53)
            || (v61 = LODWORD(v132[1]), objc_msgSend_unsignedIntegerValue(v130, v58, v59, v60) == v61))
          {
            v65 = objc_alloc(MEMORY[0x1E0CB3608]);
            v67 = objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v65, v66, v138, v137);

            v138 = -1;
            v68 = [CKFileOpenResult alloc];
            objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v69, *(uint64_t *)((char *)&v132[1] + 4), v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = (void *)objc_msgSend_initWithFileHandle_fileSize_(v68, v72, v67, (uint64_t)v71);

            v31 = (void *)v67;
            a5 = v129;
            if (v73)
              goto LABEL_77;
            goto LABEL_71;
          }
          v76 = LODWORD(v132[1]);
          v77 = objc_msgSend_unsignedIntegerValue(v130, v62, v63, v64);
          objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v78, (uint64_t)CFSTR("CKInternalErrorDomain"), 3003, v16, CFSTR("generation counter mismatch (%lu != %lu)"), v76, v77);
        }
        else
        {
          objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v51, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, v16, CFSTR("Not a regular file"));
        }
        v74 = objc_claimAutoreleasedReturnValue();

        v45 = (id)v74;
        goto LABEL_40;
      }
LABEL_49:
      v80 = *__error();
      v83 = objc_msgSend_errorCodeFromPOSIXCode_(a1, v81, v80, v82);
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      a5 = v129;
      v128 = v83;
      v84 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        buf.st_dev = 138413570;
        *(_QWORD *)&buf.st_mode = v20;
        WORD2(buf.st_ino) = 2114;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v131;
        HIWORD(buf.st_gid) = 2114;
        *(_QWORD *)&buf.st_rdev = v130;
        LOWORD(buf.st_atimespec.tv_sec) = 2114;
        *(__darwin_time_t *)((char *)&buf.st_atimespec.tv_sec + 2) = (__darwin_time_t)v16;
        WORD1(buf.st_atimespec.tv_nsec) = 2112;
        *(uint64_t *)((char *)&buf.st_atimespec.tv_nsec + 4) = (uint64_t)v31;
        WORD2(buf.st_mtimespec.tv_sec) = 1024;
        *(_DWORD *)((char *)&buf.st_mtimespec.tv_sec + 6) = v80;
        _os_log_debug_impl(&dword_18A5C5000, v84, OS_LOG_TYPE_DEBUG, "open failed for deviceID:%@, fileID:%{public}@, generationID:%{public}@, path:%{public}@, fileHandle:%@: %{errno}d", (uint8_t *)&buf, 0x3Au);
      }
      if ((_DWORD)v80 != 1 || v31)
      {
        if ((_DWORD)v80 == 13)
        {
          memset(&buf, 0, sizeof(buf));
          v103 = (const char *)objc_msgSend_fileSystemRepresentation(v16, v85, v86, v87);
          if (!stat(v103, &buf))
          {
            v104 = objc_alloc(MEMORY[0x1E0CB37E8]);
            v105 = getuid() == buf.st_uid;
            v125 = (void *)objc_msgSend_initWithBool_(v104, v106, v105, v107);
            v108 = objc_alloc(MEMORY[0x1E0CB37E8]);
            v127 = (void *)objc_msgSend_initWithBool_(v108, v109, HIBYTE(buf.st_mode) & 1, v110);
            v111 = objc_alloc(MEMORY[0x1E0CB37E8]);
            v124 = (void *)objc_msgSend_initWithBool_(v111, v112, (buf.st_mode >> 5) & 1, v113);
            v114 = objc_alloc(MEMORY[0x1E0CB37E8]);
            v117 = (void *)objc_msgSend_initWithBool_(v114, v115, (buf.st_mode >> 2) & 1, v116);
            v118 = strerror(13);
            objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v119, (uint64_t)CFSTR("CKInternalErrorDomain"), v128, v16, CFSTR("open error: %d (%s). isOwner:%@ canOwnerRead:%@ canGroupRead:%@ canOtherRead:%@"), 13, v118, v125, v127, v124, v117);
            v123 = objc_claimAutoreleasedReturnValue();

            a5 = v129;
            v45 = (id)v123;
          }
        }
      }
      else
      {
        if (v131)
          v88 = v20 == 0;
        else
          v88 = 1;
        if (v88 && v16)
        {
          v126 = v80;
          objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v85, v86, v87);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_attributesOfItemAtPath_error_(v89, v90, (uint64_t)v16, 0);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v91, v92, *MEMORY[0x1E0CB2AD8], v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          v95 = v94;
          if (v94
            && (objc_msgSend_isEqual_(v94, v96, *MEMORY[0x1E0CB2AC0], v97) & 1) == 0
            && (objc_msgSend_isEqual_(v94, v98, *MEMORY[0x1E0C99940], v99) & 1) == 0)
          {
            v100 = strerror(1);
            objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v101, (uint64_t)CFSTR("CKInternalErrorDomain"), v128, v16, CFSTR("open error: %d (%s). protection class %@ likely unavailable."), 1, v100, v94);
            v102 = objc_claimAutoreleasedReturnValue();

            v45 = (id)v102;
            v95 = v94;
          }
          a5 = v129;
          v80 = v126;

        }
      }
      if (!v45)
      {
        v120 = strerror(v80);
        a5 = v129;
        objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v121, (uint64_t)CFSTR("CKInternalErrorDomain"), v128, v16, CFSTR("open error: %d (%s)"), v80, v120);
        v45 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_71;
    }
    if (qword_1ECD96C58 == -1)
    {
      if (!v20)
        goto LABEL_48;
    }
    else
    {
      dispatch_once(&qword_1ECD96C58, &unk_1E1F58638);
      if (!v20)
        goto LABEL_48;
    }
    if (v24 && byte_1ECD96C50)
    {
      *(_DWORD *)&buf.st_mode = 0;
      buf.st_dev = objc_msgSend_intValue(v20, v40, v41, v42);
      v135 = objc_msgSend_unsignedLongLongValue(v24, v48, v49, v50);
      v138 = openbyid_np();
      if (v138 < 0)
      {
        v75 = 30000;
        do
        {
          if (*__error() != 35)
            break;
          if (!--v75)
            break;
          usleep(0x3E8u);
          v138 = openbyid_np();
        }
        while (v138 < 0);
      }
      v45 = 0;
LABEL_29:
      v46 = v138;
      if ((v138 & 0x80000000) == 0)
        goto LABEL_30;
      goto LABEL_49;
    }
LABEL_48:
    v79 = (const char *)objc_msgSend_fileSystemRepresentation(v16, v40, v41, v42);
    v46 = open(v79, 260);
    v45 = 0;
    v138 = v46;
    if ((v46 & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_49;
  }
  v136 = 0;
  v44 = objc_msgSend_openWithAssetDownloadStagingInfo_fileDescriptor_closeOnDealloc_error_(v39, v40, (uint64_t)v35, (uint64_t)&v138, &v137, &v136);
  v45 = v136;
  if ((v44 & 1) != 0)
    goto LABEL_29;
LABEL_40:
  a5 = v129;
LABEL_71:
  if ((v138 & 0x80000000) == 0 && v137)
    close(v138);
  if (a5)
  {
    v45 = objc_retainAutorelease(v45);
    v73 = 0;
    *a5 = v45;
  }
  else
  {
    v73 = 0;
  }
LABEL_77:

  return v73;
}

+ (id)openWithOpenInfo:(id)a3 error:(id *)a4
{
  id v6;
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
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_path(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(v6, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileID(v6, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileHandle(v6, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetDownloadStagingInfo(v6, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetDownloadStagingManager(v6, v27, v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v30;
  if (!v14 && !v18 && !v10 && !v22 && (!v26 || !v30))
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v31, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Invalid arguments: %@, %@, %@"), 0, 0, 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v39 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v43 = 0;
      v44 = 2114;
      v45 = 0;
      v46 = 2114;
      v47 = 0;
      _os_log_error_impl(&dword_18A5C5000, v39, OS_LOG_TYPE_ERROR, "Invalid arguments, deviceID:%@, fileID:%{public}@, path:%{public}@", buf, 0x20u);
    }
    v37 = 0;
    if (!a4)
      goto LABEL_18;
    goto LABEL_16;
  }
  if (!objc_msgSend_shouldReadRawEncryptedData(v6, v31, v32, v33))
  {
    v41 = 0;
    objc_msgSend__openUnencryptedWithOpenInfo_genCountCheck_error_(a1, v35, (uint64_t)v6, 1, &v41);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v41;
    if (!a4)
    {
LABEL_18:
      v36 = v37;

      goto LABEL_19;
    }
LABEL_16:
    if (!v37)
      *a4 = objc_retainAutorelease(v38);
    goto LABEL_18;
  }
  objc_msgSend_openToReadRawEncryptedDataWithOpenInfo_error_(a1, v35, (uint64_t)v6, (uint64_t)a4);
  v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v36;
}

- (id)openWithError:(id *)a3
{
  CKFileOpenInfo *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t RawEncryptedData;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *RawEncryptedData_fileHandle_assetDownloadStagingInfo;
  void *v39;
  const char *v40;
  void *v41;

  v4 = [CKFileOpenInfo alloc];
  objc_msgSend_UUID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURL(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileID(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_generationCountToSave(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  RawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(self, v29, v30, v31);
  objc_msgSend_fileHandle(self, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  RawEncryptedData_fileHandle_assetDownloadStagingInfo = (void *)objc_msgSend_initWithUUID_path_deviceID_fileID_generationID_shouldReadRawEncryptedData_fileHandle_assetDownloadStagingInfo_(v4, v37, (uint64_t)v8, (uint64_t)v16, v20, v24, v28, RawEncryptedData, v36, 0);

  v39 = (void *)objc_opt_class();
  objc_msgSend_openWithOpenInfo_error_(v39, v40, (uint64_t)RawEncryptedData_fileHandle_assetDownloadStagingInfo, (uint64_t)a3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

+ (id)getFileSizeWithOpenInfo:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v13;

  v13 = 0;
  objc_msgSend_openWithOpenInfo_error_(CKAsset, a2, (uint64_t)a3, (uint64_t)&v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  v10 = v6;
  if (v5)
  {
    objc_msgSend_fileSize(v5, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }

  return v11;
}

+ (id)getFileMetadataWithFileHandle:(id)a3 openInfo:(id)a4 error:(id *)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  const char *v21;
  id v22;
  NSObject *v23;
  void *v24;
  CKFileMetadata *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  void *v43;
  const char *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v13 = a4;
  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11, v12);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, (uint64_t)a1, CFSTR("CKAsset.m"), 674, CFSTR("Expected non-nil fileHandle"));

  }
  v49 = 512;
  v47 = 0u;
  v48 = xmmword_18A83D208;
  v45 = 0u;
  v46 = 0u;
  v14 = objc_msgSend_fileDescriptor(v9, v10, v11, v12);
  if (fgetattrlist(v14, &v48, &v45, 0x30uLL, 0x20u))
  {
    v15 = *__error();
    objc_msgSend_path(v13, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = strerror(v15);
    objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v21, (uint64_t)CFSTR("CKInternalErrorDomain"), 3001, v19, CFSTR("fgetattrlist(%d) failed: %d (%s)"), v14, v15, v20);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v23 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v51 = v13;
      v52 = 2112;
      v53 = v22;
      _os_log_error_impl(&dword_18A5C5000, v23, OS_LOG_TYPE_ERROR, "Failed to get the attr list for %@: %@\n", buf, 0x16u);
      if (a5)
        goto LABEL_8;
    }
    else if (a5)
    {
LABEL_8:
      v22 = objc_retainAutorelease(v22);
      v24 = 0;
      *a5 = v22;
      goto LABEL_15;
    }
    v24 = 0;
    goto LABEL_15;
  }
  v25 = [CKFileMetadata alloc];
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v26, DWORD1(v45), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v29, v47, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v32, HIDWORD(v46), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v35, *((uint64_t *)&v45 + 1), v36);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((WORD4(v46) & 0xF000) == 0x8000)
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v37, *((uint64_t *)&v47 + 1), v38);
  else
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v37, 0, v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend_initWithDeviceID_fileID_generationID_modTimeInSeconds_fileSize_(v25, v41, (uint64_t)v28, (uint64_t)v31, v34, v39, v40);

  v22 = 0;
LABEL_15:

  return v24;
}

+ (id)getFileMetadataAtPath:(id)a3 error:(id *)a4
{
  id v6;
  CKFileOpenInfo *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v22;

  v6 = a3;
  v7 = [CKFileOpenInfo alloc];
  v10 = (void *)objc_msgSend_initWithPath_(v7, v8, (uint64_t)v6, v9);

  v22 = 0;
  objc_msgSend_openWithOpenInfo_error_(CKAsset, v11, (uint64_t)v10, (uint64_t)&v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;
  v17 = v13;
  if (v12)
  {
    objc_msgSend_fileHandle(v12, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getFileMetadataWithFileHandle_openInfo_error_(a1, v19, (uint64_t)v18, (uint64_t)v10, a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v13);
  }

  return v20;
}

+ (id)_expandTemplateURL:(id)a3 fieldValues:(id)a4
{
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  void *v57;
  const char *v58;
  id obj;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v62 = a4;
  objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E0CB38E8], v8, (uint64_t)CFSTR("\\$\\{([^\\}]*?)\\}"), 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v57, v58, (uint64_t)a2, (uint64_t)a1, CFSTR("CKAsset.m"), 730, CFSTR("Couldn't create regex?"));

  }
  v63 = (id)objc_msgSend_mutableCopy(v7, v9, v10, v11);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v16 = objc_msgSend_length(v7, v13, v14, v15);
  objc_msgSend_matchesInString_options_range_(v12, v17, (uint64_t)v7, 0, 0, v16);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v64, (uint64_t)v68, 16);
  if (v61)
  {
    v22 = 0;
    v60 = *(_QWORD *)v65;
LABEL_5:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v65 != v60)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v23);
      if (objc_msgSend_numberOfRanges(v24, v19, v20, v21) != 2)
        break;
      v27 = objc_msgSend_rangeAtIndex_(v24, v25, 1, v26);
      objc_msgSend_substringWithRange_(v7, v28, v27, (uint64_t)v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_range(v24, v30, v31, v32);
      v35 = (uint64_t)v34;
      objc_msgSend_replacementStringForResult_inString_offset_template_(v12, v34, (uint64_t)v24, (uint64_t)v63, v22, CFSTR("$0"));
      v36 = objc_claimAutoreleasedReturnValue();
      if (!v36)
      {

        break;
      }
      v40 = (void *)v36;
      v41 = v12;
      v42 = v7;
      objc_msgSend_lowercaseString(v29, v37, v38, v39);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v62, v44, (uint64_t)v43, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        v50 = v33 + v22;
        objc_msgSend_CKSafeStringForURLPathComponent(v46, v47, v48, v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v22 - v35 + objc_msgSend_length(v51, v52, v53, v54);
        objc_msgSend_replaceCharactersInRange_withString_(v63, v55, v50, v35, v51);

      }
      ++v23;
      v7 = v42;
      v12 = v41;
      if (v61 == v23)
      {
        v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v64, (uint64_t)v68, 16);
        if (v61)
          goto LABEL_5;
        break;
      }
    }
  }

  return v63;
}

+ (id)_canonicalizeTemplateURL:(id)a3
{
  void *v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  const char *v21;

  v5 = (void *)MEMORY[0x1E0CB38E8];
  v6 = a3;
  objc_msgSend_regularExpressionWithPattern_options_error_(v5, v7, (uint64_t)CFSTR("\\$\\{([^\\}]*?)\\}"), 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, (uint64_t)a1, CFSTR("CKAsset.m"), 760, CFSTR("Couldn't create regex?"));

  }
  v12 = objc_msgSend_length(v6, v8, v9, v10);
  objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(v11, v13, (uint64_t)v6, 0, 0, v12, &stru_1E1F66ED0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0C99E98]);
  v18 = (void *)objc_msgSend_initWithString_(v15, v16, (uint64_t)v14, v17);

  return v18;
}

+ (BOOL)_templateURLRequiresAssetKey:(id)a3
{
  return ((uint64_t (*)(id, char *, const __CFString *))MEMORY[0x1E0DE7D20])(a3, sel_containsString_, CFSTR("${uk}"));
}

+ (id)_downloadURLWithTemplate:(id)a3 fileName:(id)a4
{
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const __CFString *v16;
  _QWORD v17[2];

  v4 = a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
      v5 = (const __CFString *)a4;
    else
      v5 = CFSTR("UNKNOWN_ASSET.dat");
    v16 = CFSTR("f");
    v17[0] = v5;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a4;
    v8 = v4;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v6, v9, (uint64_t)v17, (uint64_t)&v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__expandTemplateURL_fieldValues_(CKAsset, v11, (uint64_t)v8, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v13, (uint64_t)v12, v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)downloadURLWithFileName:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend_downloadURLTemplate(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__downloadURLWithTemplate_fileName_(v5, v10, (uint64_t)v9, (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)downloadURL
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;

  objc_msgSend_downloadURLTemplate(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend__downloadURLWithTemplate_fileName_(v5, v6, (uint64_t)v4, (uint64_t)CFSTR("UNKNOWN_ASSET.dat"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSURL)fileURL
{
  CKAsset *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSURL *v10;
  NSURL *v11;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_realPathURL(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_realPathURL(v2, v7, v8, v9);
    v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v2->_fileURL;
  }
  v11 = v10;
  objc_sync_exit(v2);

  return v11;
}

- (void)setFileURL:(id)a3
{
  CKAsset *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *fileURL;
  NSURL *v10;

  v10 = (NSURL *)a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_fileURL != v10)
  {
    v8 = objc_msgSend_copy(v10, v5, v6, v7);
    fileURL = v4->_fileURL;
    v4->_fileURL = (NSURL *)v8;

  }
  objc_sync_exit(v4);

}

- (NSDictionary)assetChunkerOptions
{
  CKAsset *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_assetChunkerOptions;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAssetChunkerOptions:(id)a3
{
  CKAsset *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *assetChunkerOptions;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  assetChunkerOptions = v4->_assetChunkerOptions;
  v4->_assetChunkerOptions = (NSDictionary *)v8;

  objc_sync_exit(v4);
}

- (void)setDeviceID_modelMutation:(id)a3
{
  uint64_t v3;
  NSNumber *v5;
  NSNumber *deviceID;

  v5 = (NSNumber *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  deviceID = self->_deviceID;
  self->_deviceID = v5;

}

- (void)setFileID_modelMutation:(id)a3
{
  uint64_t v3;
  NSNumber *v5;
  NSNumber *fileID;

  v5 = (NSNumber *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  fileID = self->_fileID;
  self->_fileID = v5;

}

- (void)setAssetContent_modelMutation:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  objc_msgSend_setAssetContent_(self, v5, (uint64_t)v7, v6);

}

- (CKAssetTransferOptions)assetTransferOptions
{
  return self->_assetTransferOptions;
}

- (void)setAssetTransferOptions:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CKAssetTransferOptions *v7;
  CKAssetTransferOptions *assetTransferOptions;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int isReference;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  id v26;

  v26 = a3;
  v7 = (CKAssetTransferOptions *)objc_msgSend_copy(v26, v4, v5, v6);
  assetTransferOptions = self->_assetTransferOptions;
  self->_assetTransferOptions = v7;

  isReference = objc_msgSend_isReference(self, v9, v10, v11);
  v15 = v26;
  if (isReference)
  {
    objc_msgSend_useMMCSEncryptionV2(v26, (const char *)v26, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    if (v16)
    {
      v21 = objc_msgSend_BOOLValue(v16, v17, v18, v19);
      if (v21 != objc_msgSend_useMMCSEncryptionV2(self, v22, v23, v24))
        objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v25, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Value specified for CKAssetTransferOptions.useMMCSEncryptionV2 is inconsistent with referenced asset encryption."));
    }

    v15 = v26;
  }

}

- (BOOL)useMMCSEncryptionV2
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  char isValidV2Signature;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;

  if (objc_msgSend_isReference(self, a2, v2, v3))
  {
    objc_msgSend_assetReference(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileSignature(v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isValidV2Signature = objc_msgSend_isValidV2Signature_(CKSignatureGenerator, v13, (uint64_t)v12, v14);
  }
  else
  {
    objc_msgSend_assetTransferOptions(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_useMMCSEncryptionV2(v8, v16, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isValidV2Signature = objc_msgSend_BOOLValue(v12, v19, v20, v21);
  }
  v22 = isValidV2Signature;

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  CKAsset *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t hasSize;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  void *v141;
  const char *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t RawEncryptedData;
  const char *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t AssetContentUsingClientProxy;
  const char *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  void *v183;
  const char *v184;
  id v185;

  v185 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  v8 = objc_msgSend_arrayIndex(self, v5, v6, v7);
  if ((v8 & 0x8000000000000000) == 0)
    objc_msgSend_encodeInt64_forKey_(v185, v9, v8, (uint64_t)CFSTR("AssetArrayIndex"));
  objc_msgSend_UUID(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v13, (uint64_t)v12, (uint64_t)CFSTR("AssetUUID"));

  v14 = self;
  objc_sync_enter(v14);
  objc_msgSend_encodeObject_forKey_(v185, v15, (uint64_t)v14->_fileURL, (uint64_t)CFSTR("AssetFileURL"));
  objc_sync_exit(v14);

  objc_msgSend_signature(v14, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v20, (uint64_t)v19, (uint64_t)CFSTR("AssetSignature"));

  objc_msgSend_itemTypeHint(v14, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v25, (uint64_t)v24, (uint64_t)CFSTR("AssetTypeHint"));

  objc_msgSend_assetReference(v14, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v30, (uint64_t)v29, (uint64_t)CFSTR("AssetReference"));

  v34 = objc_msgSend_paddedFileSize(v14, v31, v32, v33);
  objc_msgSend_encodeInt64_forKey_(v185, v35, v34, (uint64_t)CFSTR("AssetPaddedSize"));
  objc_msgSend_verificationKey(v14, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v40, (uint64_t)v39, (uint64_t)CFSTR("AssetVerificationKey"));

  v44 = objc_msgSend_size(v14, v41, v42, v43);
  objc_msgSend_encodeInt64_forKey_(v185, v45, v44, (uint64_t)CFSTR("AssetSize"));
  hasSize = objc_msgSend_hasSize(v14, v46, v47, v48);
  objc_msgSend_encodeBool_forKey_(v185, v50, hasSize, (uint64_t)CFSTR("AssetHasSize"));
  objc_msgSend_uploadReceipt(v14, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v55, (uint64_t)v54, (uint64_t)CFSTR("AssetUploadReceipt"));

  objc_msgSend_uploadReceiptExpiration(v14, v56, v57, v58);
  objc_msgSend_encodeDouble_forKey_(v185, v59, (uint64_t)CFSTR("AssetUploadReceiptExpiration"), v60);
  objc_msgSend_deviceID(v14, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v65, (uint64_t)v64, (uint64_t)CFSTR("AssetDeviceID"));

  objc_msgSend_fileID(v14, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v70, (uint64_t)v69, (uint64_t)CFSTR("AssetFileID"));

  objc_msgSend_fileHandle(v14, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v75, (uint64_t)v74, (uint64_t)CFSTR("KeptAliveFileHandle"));

  objc_msgSend_generationCountToSave(v14, v76, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v80, (uint64_t)v79, (uint64_t)CFSTR("AssetGenerationID"));

  objc_msgSend_downloadURLTemplate(v14, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v85, (uint64_t)v84, (uint64_t)CFSTR("AssetDownloadURLTemplate"));

  objc_msgSend_downloadURLExpiration(v14, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v90, (uint64_t)v89, (uint64_t)CFSTR("AssetDownloadURLExpiration"));

  objc_msgSend_downloadBaseURL(v14, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v95, (uint64_t)v94, (uint64_t)CFSTR("AssetDownloadBaseUrl"));

  objc_msgSend_contentBaseURL(v14, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v100, (uint64_t)v99, (uint64_t)CFSTR("AssetContentBaseURL"));

  objc_msgSend_owner(v14, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v105, (uint64_t)v104, (uint64_t)CFSTR("AssetOwner"));

  objc_msgSend_authToken(v14, v106, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v110, (uint64_t)v109, (uint64_t)CFSTR("AssetAuthToken"));

  objc_msgSend_requestor(v14, v111, v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v115, (uint64_t)v114, (uint64_t)CFSTR("AssetRequestor"));

  v119 = objc_msgSend_wasCached(v14, v116, v117, v118);
  objc_msgSend_encodeBool_forKey_(v185, v120, v119, (uint64_t)CFSTR("WasCached"));
  objc_msgSend_wrappedAssetKey(v14, v121, v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v125, (uint64_t)v124, (uint64_t)CFSTR("WrappedAssetKey"));

  objc_msgSend_clearAssetKey(v14, v126, v127, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v130, (uint64_t)v129, (uint64_t)CFSTR("ClearAssetKey"));

  v134 = objc_msgSend_exposeAssetKey(v14, v131, v132, v133);
  objc_msgSend_encodeBool_forKey_(v185, v135, v134, (uint64_t)CFSTR("ExposeAssetKey"));
  if ((_DWORD)v134)
  {
    objc_msgSend_assetKey(v14, v136, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v185, v140, (uint64_t)v139, (uint64_t)CFSTR("AssetKey"));

  }
  objc_msgSend_referenceSignature(v14, v136, v137, v138);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v142, (uint64_t)v141, (uint64_t)CFSTR("ReferenceSignature"));

  v146 = objc_msgSend_uploaded(v14, v143, v144, v145);
  objc_msgSend_encodeBool_forKey_(v185, v147, v146, (uint64_t)CFSTR("AssetUploaded"));
  objc_msgSend_recordID(v14, v148, v149, v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v152, (uint64_t)v151, (uint64_t)CFSTR("RecordID"));

  RawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(v14, v153, v154, v155);
  objc_msgSend_encodeBool_forKey_(v185, v157, RawEncryptedData, (uint64_t)CFSTR("ShouldReadRawEncryptedData"));
  objc_msgSend_assetTransferOptions(v14, v158, v159, v160);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v162, (uint64_t)v161, (uint64_t)CFSTR("AssetTransferOptions"));

  v166 = objc_msgSend_storageGroupingPolicy(v14, v163, v164, v165);
  objc_msgSend_encodeInteger_forKey_(v185, v167, v166, (uint64_t)CFSTR("StorageGroupingPolicy"));
  objc_msgSend_assetChunkerOptions(v14, v168, v169, v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v172, (uint64_t)v171, (uint64_t)CFSTR("AssetChunkerOptions"));

  AssetContentUsingClientProxy = objc_msgSend_shouldReadAssetContentUsingClientProxy(v14, v173, v174, v175);
  objc_msgSend_encodeBool_forKey_(v185, v177, AssetContentUsingClientProxy, (uint64_t)CFSTR("ShouldReadAssetContentUsingClientProxy"));
  if ((AssetContentUsingClientProxy & 1) == 0)
  {
    objc_msgSend_assetContent(v14, v178, v179, v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v185, v182, (uint64_t)v181, (uint64_t)CFSTR("InMemoryContent"));

  }
  objc_msgSend_boundaryKey(v14, v178, v179, v180);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v185, v184, (uint64_t)v183, (uint64_t)CFSTR("BoundaryKey"));

  objc_autoreleasePoolPop(v4);
}

- (CKAsset)initWithCoder:(id)a3
{
  id v4;
  CKAsset *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *UUID;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSURL *fileURL;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSData *signature;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSString *itemTypeHint;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  CKAssetReference *assetReference;
  const char *v35;
  uint64_t v36;
  CKAssetRereferenceInfo *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  CKAssetRereferenceInfo *assetRereferenceInfo;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t size;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  NSData *verificationKey;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  NSString *uploadReceipt;
  const char *v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  NSNumber *deviceID;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  NSNumber *fileID;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  NSFileHandle *fileHandle;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  NSNumber *generationCountToSave;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  NSString *downloadURLTemplate;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  NSDate *downloadURLExpiration;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  NSString *downloadBaseURL;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  NSURL *contentBaseURL;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  NSString *owner;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  NSString *requestor;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  NSString *authToken;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  NSData *wrappedAssetKey;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  NSData *clearAssetKey;
  const char *v122;
  uint64_t v123;
  int v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  NSData *assetKey;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  NSData *referenceSignature;
  const char *v133;
  uint64_t v134;
  BOOL v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  CKRecordID *recordID;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  CKAssetTransferOptions *assetTransferOptions;
  const char *v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  NSDictionary *assetChunkerOptions;
  const char *v158;
  uint64_t v159;
  char v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  NSData *assetContent;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  NSData *boundaryKey;
  objc_super v170;

  v4 = a3;
  v170.receiver = self;
  v170.super_class = (Class)CKAsset;
  v5 = -[CKAsset init](&v170, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    if (objc_msgSend_containsValueForKey_(v4, v7, (uint64_t)CFSTR("AssetArrayIndex"), v8))
    {
      v11 = objc_msgSend_decodeInt64ForKey_(v4, v9, (uint64_t)CFSTR("AssetArrayIndex"), v10);
      if (v11 >> 31)
        v12 = -1;
      else
        v12 = v11;
    }
    else
    {
      v12 = -1;
    }
    v5->_arrayIndex = v12;
    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("AssetUUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      CKCreateGUID();
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    UUID = v5->_UUID;
    v5->_UUID = v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("AssetFileURL"));
    v21 = objc_claimAutoreleasedReturnValue();
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v21;

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("AssetSignature"));
    v25 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSData *)v25;

    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, (uint64_t)CFSTR("AssetTypeHint"));
    v29 = objc_claimAutoreleasedReturnValue();
    itemTypeHint = v5->_itemTypeHint;
    v5->_itemTypeHint = (NSString *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("AssetReference"));
    v33 = objc_claimAutoreleasedReturnValue();
    assetReference = v5->_assetReference;
    v5->_assetReference = (CKAssetReference *)v33;

    if (v5->_assetReference)
    {
      v37 = [CKAssetRereferenceInfo alloc];
      objc_msgSend_recordID(v5->_assetReference, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_initWithSourceZoneID_(v37, v46, (uint64_t)v45, v47);
      assetRereferenceInfo = v5->_assetRereferenceInfo;
      v5->_assetRereferenceInfo = (CKAssetRereferenceInfo *)v48;

    }
    v5->_size = objc_msgSend_decodeInt64ForKey_(v4, v35, (uint64_t)CFSTR("AssetSize"), v36);
    v5->_hasSize = objc_msgSend_decodeBoolForKey_(v4, v50, (uint64_t)CFSTR("AssetHasSize"), v51);
    if (objc_msgSend_containsValueForKey_(v4, v52, (uint64_t)CFSTR("AssetPaddedSize"), v53))
    {
      size = objc_msgSend_decodeInt64ForKey_(v4, v54, (uint64_t)CFSTR("AssetPaddedSize"), v55);
    }
    else if (v5->_hasSize)
    {
      size = v5->_size;
    }
    else
    {
      size = 0;
    }
    v5->_paddedFileSize = size;
    v57 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v58, v57, (uint64_t)CFSTR("AssetVerificationKey"));
    v59 = objc_claimAutoreleasedReturnValue();
    verificationKey = v5->_verificationKey;
    v5->_verificationKey = (NSData *)v59;

    v61 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v62, v61, (uint64_t)CFSTR("AssetUploadReceipt"));
    v63 = objc_claimAutoreleasedReturnValue();
    uploadReceipt = v5->_uploadReceipt;
    v5->_uploadReceipt = (NSString *)v63;

    objc_msgSend_decodeDoubleForKey_(v4, v65, (uint64_t)CFSTR("AssetUploadReceiptExpiration"), v66);
    v5->_uploadReceiptExpiration = v67;
    v68 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v68, (uint64_t)CFSTR("AssetDeviceID"));
    v70 = objc_claimAutoreleasedReturnValue();
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSNumber *)v70;

    v72 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v73, v72, (uint64_t)CFSTR("AssetFileID"));
    v74 = objc_claimAutoreleasedReturnValue();
    fileID = v5->_fileID;
    v5->_fileID = (NSNumber *)v74;

    v76 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v77, v76, (uint64_t)CFSTR("KeptAliveFileHandle"));
    v78 = objc_claimAutoreleasedReturnValue();
    fileHandle = v5->_fileHandle;
    v5->_fileHandle = (NSFileHandle *)v78;

    v80 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, (uint64_t)CFSTR("AssetGenerationID"));
    v82 = objc_claimAutoreleasedReturnValue();
    generationCountToSave = v5->_generationCountToSave;
    v5->_generationCountToSave = (NSNumber *)v82;

    v84 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v85, v84, (uint64_t)CFSTR("AssetDownloadURLTemplate"));
    v86 = objc_claimAutoreleasedReturnValue();
    downloadURLTemplate = v5->_downloadURLTemplate;
    v5->_downloadURLTemplate = (NSString *)v86;

    v88 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v89, v88, (uint64_t)CFSTR("AssetDownloadURLExpiration"));
    v90 = objc_claimAutoreleasedReturnValue();
    downloadURLExpiration = v5->_downloadURLExpiration;
    v5->_downloadURLExpiration = (NSDate *)v90;

    v92 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v93, v92, (uint64_t)CFSTR("AssetDownloadBaseUrl"));
    v94 = objc_claimAutoreleasedReturnValue();
    downloadBaseURL = v5->_downloadBaseURL;
    v5->_downloadBaseURL = (NSString *)v94;

    v96 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v97, v96, (uint64_t)CFSTR("AssetContentBaseURL"));
    v98 = objc_claimAutoreleasedReturnValue();
    contentBaseURL = v5->_contentBaseURL;
    v5->_contentBaseURL = (NSURL *)v98;

    v100 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v101, v100, (uint64_t)CFSTR("AssetOwner"));
    v102 = objc_claimAutoreleasedReturnValue();
    owner = v5->_owner;
    v5->_owner = (NSString *)v102;

    v104 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v105, v104, (uint64_t)CFSTR("AssetRequestor"));
    v106 = objc_claimAutoreleasedReturnValue();
    requestor = v5->_requestor;
    v5->_requestor = (NSString *)v106;

    v108 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v109, v108, (uint64_t)CFSTR("AssetAuthToken"));
    v110 = objc_claimAutoreleasedReturnValue();
    authToken = v5->_authToken;
    v5->_authToken = (NSString *)v110;

    v5->_wasCached = objc_msgSend_decodeBoolForKey_(v4, v112, (uint64_t)CFSTR("WasCached"), v113);
    v114 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v115, v114, (uint64_t)CFSTR("WrappedAssetKey"));
    v116 = objc_claimAutoreleasedReturnValue();
    wrappedAssetKey = v5->_wrappedAssetKey;
    v5->_wrappedAssetKey = (NSData *)v116;

    v118 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v119, v118, (uint64_t)CFSTR("ClearAssetKey"));
    v120 = objc_claimAutoreleasedReturnValue();
    clearAssetKey = v5->_clearAssetKey;
    v5->_clearAssetKey = (NSData *)v120;

    v124 = objc_msgSend_decodeBoolForKey_(v4, v122, (uint64_t)CFSTR("ExposeAssetKey"), v123);
    v5->_exposeAssetKey = v124;
    if (v124)
    {
      v125 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v126, v125, (uint64_t)CFSTR("AssetKey"));
      v127 = objc_claimAutoreleasedReturnValue();
      assetKey = v5->_assetKey;
      v5->_assetKey = (NSData *)v127;

    }
    v129 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v130, v129, (uint64_t)CFSTR("ReferenceSignature"));
    v131 = objc_claimAutoreleasedReturnValue();
    referenceSignature = v5->_referenceSignature;
    v5->_referenceSignature = (NSData *)v131;

    v135 = (objc_msgSend_decodeBoolForKey_(v4, v133, (uint64_t)CFSTR("AssetUploaded"), v134) & 1) != 0
        || v5->_uploadReceipt != 0;
    v5->_uploaded = v135;
    v136 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v137, v136, (uint64_t)CFSTR("RecordID"));
    v138 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v138;

    v5->_shouldReadRawEncryptedData = objc_msgSend_decodeBoolForKey_(v4, v140, (uint64_t)CFSTR("ShouldReadRawEncryptedData"), v141);
    v142 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v143, v142, (uint64_t)CFSTR("AssetTransferOptions"));
    v144 = objc_claimAutoreleasedReturnValue();
    assetTransferOptions = v5->_assetTransferOptions;
    v5->_assetTransferOptions = (CKAssetTransferOptions *)v144;

    v5->_storageGroupingPolicy = objc_msgSend_decodeIntegerForKey_(v4, v146, (uint64_t)CFSTR("StorageGroupingPolicy"), v147);
    v148 = objc_alloc(MEMORY[0x1E0C99E60]);
    v149 = objc_opt_class();
    v150 = objc_opt_class();
    v151 = objc_opt_class();
    v154 = (void *)objc_msgSend_initWithObjects_(v148, v152, v149, v153, v150, v151, 0);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v155, (uint64_t)v154, (uint64_t)CFSTR("AssetChunkerOptions"));
    v156 = objc_claimAutoreleasedReturnValue();
    assetChunkerOptions = v5->_assetChunkerOptions;
    v5->_assetChunkerOptions = (NSDictionary *)v156;

    v160 = objc_msgSend_decodeBoolForKey_(v4, v158, (uint64_t)CFSTR("ShouldReadAssetContentUsingClientProxy"), v159);
    v5->_shouldReadAssetContentUsingClientProxy = v160;
    if ((v160 & 1) == 0)
    {
      v161 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v162, v161, (uint64_t)CFSTR("InMemoryContent"));
      v163 = objc_claimAutoreleasedReturnValue();
      assetContent = v5->_assetContent;
      v5->_assetContent = (NSData *)v163;

    }
    v165 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v166, v165, (uint64_t)CFSTR("BoundaryKey"));
    v167 = objc_claimAutoreleasedReturnValue();
    boundaryKey = v5->_boundaryKey;
    v5->_boundaryKey = (NSData *)v167;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (NSData)assetContent
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAssetContent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)itemTypeHint
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setItemTypeHint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSDate)downloadURLExpiration
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDownloadURLExpiration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)uploadReceipt
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUploadReceipt:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (double)uploadReceiptExpiration
{
  return self->_uploadReceiptExpiration;
}

- (void)setUploadReceiptExpiration:(double)a3
{
  self->_uploadReceiptExpiration = a3;
}

- (int64_t)storageGroupingPolicy
{
  return self->_storageGroupingPolicy;
}

- (void)setStorageGroupingPolicy:(int64_t)a3
{
  self->_storageGroupingPolicy = a3;
}

- (BOOL)shouldReadRawEncryptedData
{
  return self->_shouldReadRawEncryptedData;
}

- (void)setShouldReadRawEncryptedData:(BOOL)a3
{
  self->_shouldReadRawEncryptedData = a3;
}

- (CKAssetReference)assetReference
{
  return (CKAssetReference *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAssetReference:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSData)boundaryKey
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBoundaryKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSString)downloadURLTemplate
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDownloadURLTemplate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (CKRecord)record
{
  return (CKRecord *)objc_loadWeakRetained((id *)&self->_record);
}

- (void)setRecord:(id)a3
{
  objc_storeWeak((id *)&self->_record, a3);
}

- (NSString)recordKey
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRecordKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSURL)contentBaseURL
{
  return (NSURL *)objc_getProperty(self, a2, 152, 1);
}

- (void)setContentBaseURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSString)owner
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOwner:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (NSString)requestor
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRequestor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSString)authToken
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAuthToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (CKAssetDownloadPreauthorization)downloadPreauthorization
{
  return (CKAssetDownloadPreauthorization *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDownloadPreauthorization:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)downloadBaseURL
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDownloadBaseURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (unint64_t)downloadTokenExpiration
{
  return self->_downloadTokenExpiration;
}

- (void)setDownloadTokenExpiration:(unint64_t)a3
{
  self->_downloadTokenExpiration = a3;
}

- (NSFileHandle)fileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 208, 1);
}

- (void)setFileHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSURL)constructedAssetDownloadURL
{
  return (NSURL *)objc_getProperty(self, a2, 216, 1);
}

- (void)setConstructedAssetDownloadURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (NSString)constructedAssetDownloadURLTemplate
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setConstructedAssetDownloadURLTemplate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (CKMediaItemMaker)mediaItemMaker
{
  return (CKMediaItemMaker *)objc_getProperty(self, a2, 232, 1);
}

- (void)setMediaItemMaker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (unint64_t)constructedAssetEstimatedSize
{
  return self->_constructedAssetEstimatedSize;
}

- (void)setConstructedAssetEstimatedSize:(unint64_t)a3
{
  self->_constructedAssetEstimatedSize = a3;
}

- (NSData)constructedAssetDownloadParameters
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (void)setConstructedAssetDownloadParameters:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (NSURL)realPathURL
{
  return (NSURL *)objc_getProperty(self, a2, 256, 1);
}

- (void)setRealPathURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (CKAssetRereferenceInfo)assetRereferenceInfo
{
  return (CKAssetRereferenceInfo *)objc_getProperty(self, a2, 264, 1);
}

- (void)setAssetRereferenceInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (unint64_t)reReferenceItemID
{
  return self->_reReferenceItemID;
}

- (void)setReReferenceItemID:(unint64_t)a3
{
  self->_reReferenceItemID = a3;
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 280);
}

- (unint64_t)paddedFileSize
{
  return self->_paddedFileSize;
}

- (void)setPaddedFileSize:(unint64_t)a3
{
  self->_paddedFileSize = a3;
}

- (NSData)verificationKey
{
  return (NSData *)objc_getProperty(self, a2, 296, 1);
}

- (void)setVerificationKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSString)UUID
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (void)setUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (NSNumber)generationCountToSave
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setGenerationCountToSave:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (BOOL)shouldReadAssetContentUsingClientProxy
{
  return self->_shouldReadAssetContentUsingClientProxy;
}

- (BOOL)exposeAssetKey
{
  return self->_exposeAssetKey;
}

- (void)setExposeAssetKey:(BOOL)a3
{
  self->_exposeAssetKey = a3;
}

- (NSData)assetKey
{
  return (NSData *)objc_getProperty(self, a2, 320, 1);
}

- (void)setAssetKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (NSData)wrappedAssetKey
{
  return (NSData *)objc_getProperty(self, a2, 328, 1);
}

- (void)setWrappedAssetKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 328);
}

- (NSData)clearAssetKey
{
  return (NSData *)objc_getProperty(self, a2, 336, 1);
}

- (void)setClearAssetKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (NSData)referenceSignature
{
  return (NSData *)objc_getProperty(self, a2, 344, 1);
}

- (void)setReferenceSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (BOOL)wasCached
{
  return self->_wasCached;
}

- (void)setWasCached:(BOOL)a3
{
  self->_wasCached = a3;
}

- (BOOL)hasSize
{
  return self->_hasSize;
}

- (void)setHasSize:(BOOL)a3
{
  self->_hasSize = a3;
}

- (BOOL)uploaded
{
  return self->_uploaded;
}

- (void)setUploaded:(BOOL)a3
{
  self->_uploaded = a3;
}

- (BOOL)downloaded
{
  return self->_downloaded;
}

- (void)setDownloaded:(BOOL)a3
{
  self->_downloaded = a3;
}

- (int64_t)arrayIndex
{
  return self->_arrayIndex;
}

- (void)setArrayIndex:(int64_t)a3
{
  self->_arrayIndex = a3;
}

- (CKRecordID)recordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 360, 1);
}

- (void)setRecordID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (CKMergeableDeltaID)mergeableDeltaID
{
  return (CKMergeableDeltaID *)objc_getProperty(self, a2, 368, 1);
}

- (void)setMergeableDeltaID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (int64_t)uploadRank
{
  return self->_uploadRank;
}

- (void)setUploadRank:(int64_t)a3
{
  self->_uploadRank = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableDeltaID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_clearAssetKey, 0);
  objc_storeStrong((id *)&self->_wrappedAssetKey, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_generationCountToSave, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_verificationKey, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_assetRereferenceInfo, 0);
  objc_storeStrong((id *)&self->_realPathURL, 0);
  objc_storeStrong((id *)&self->_constructedAssetDownloadParameters, 0);
  objc_storeStrong((id *)&self->_mediaItemMaker, 0);
  objc_storeStrong((id *)&self->_constructedAssetDownloadURLTemplate, 0);
  objc_storeStrong((id *)&self->_constructedAssetDownloadURL, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_downloadBaseURL, 0);
  objc_storeStrong((id *)&self->_downloadPreauthorization, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_requestor, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_contentBaseURL, 0);
  objc_storeStrong((id *)&self->_recordKey, 0);
  objc_destroyWeak((id *)&self->_record);
  objc_storeStrong((id *)&self->_downloadURLTemplate, 0);
  objc_storeStrong((id *)&self->_boundaryKey, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_uploadReceipt, 0);
  objc_storeStrong((id *)&self->_downloadURLExpiration, 0);
  objc_storeStrong((id *)&self->_itemTypeHint, 0);
  objc_storeStrong((id *)&self->_assetContent, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_assetTransferOptions, 0);
  objc_storeStrong((id *)&self->_assetChunkerOptions, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
