@implementation BDSBookWidgetData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSBookWidgetData)initWithAssetID:(id)a3 title:(id)a4 pageProgressionDirection:(id)a5 coverURL:(id)a6 readingProgress:(id)a7 totalDuration:(id)a8 cloudAssetType:(id)a9 libraryAssetType:(id)a10
{
  id v17;
  __CFString *v18;
  BDSBookWidgetData *v19;
  BDSBookWidgetData *v20;
  __CFString *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v24 = a7;
  v23 = a8;
  v17 = a9;
  v18 = (__CFString *)a10;
  v29.receiver = self;
  v29.super_class = (Class)BDSBookWidgetData;
  v19 = -[BDSBookWidgetData init](&v29, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_assetID, a3);
    objc_storeStrong((id *)&v20->_title, a4);
    objc_storeStrong((id *)&v20->_pageProgressionDirection, a5);
    objc_storeStrong((id *)&v20->_coverURL, a6);
    objc_storeStrong((id *)&v20->_readingProgress, a7);
    objc_storeStrong((id *)&v20->_totalDuration, a8);
    objc_storeStrong((id *)&v20->_cloudAssetType, a9);
    if (v18)
      v21 = v18;
    else
      v21 = CFSTR("LibraryContentAssetTypeUnknown");
    objc_storeStrong((id *)&v20->_libraryAssetType, v21);
  }

  return v20;
}

- (BDSBookWidgetData)initWithAssetID:(id)a3 title:(id)a4 pageProgressionDirection:(id)a5 coverURL:(id)a6 readingProgress:(id)a7 cloudAssetType:(id)a8 libraryAssetType:(id)a9
{
  return (BDSBookWidgetData *)objc_msgSend_initWithAssetID_title_pageProgressionDirection_coverURL_readingProgress_totalDuration_cloudAssetType_libraryAssetType_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, 0, a8, a9);
}

- (BDSBookWidgetData)initWithCoder:(id)a3
{
  id v4;
  BDSBookWidgetData *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *assetID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *pageProgressionDirection;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *coverURL;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSNumber *readingProgress;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSNumber *totalDuration;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSString *cloudAssetType;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSString *libraryAssetType;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BDSBookWidgetData;
  v5 = -[BDSBookWidgetData init](&v47, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("assetID"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("title"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("pageProgressionDirection"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    pageProgressionDirection = v5->_pageProgressionDirection;
    v5->_pageProgressionDirection = (NSString *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("coverURL"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    coverURL = v5->_coverURL;
    v5->_coverURL = (NSString *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("readingProgress"), v28);
    v29 = objc_claimAutoreleasedReturnValue();
    readingProgress = v5->_readingProgress;
    v5->_readingProgress = (NSNumber *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("totalDuration"), v33);
    v34 = objc_claimAutoreleasedReturnValue();
    totalDuration = v5->_totalDuration;
    v5->_totalDuration = (NSNumber *)v34;

    v36 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, (uint64_t)CFSTR("cloudAssetType"), v38);
    v39 = objc_claimAutoreleasedReturnValue();
    cloudAssetType = v5->_cloudAssetType;
    v5->_cloudAssetType = (NSString *)v39;

    v41 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, (uint64_t)CFSTR("libraryContentAssetType"), v43);
    v44 = objc_claimAutoreleasedReturnValue();
    libraryAssetType = v5->_libraryAssetType;
    v5->_libraryAssetType = (NSString *)v44;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  id v60;

  v4 = a3;
  objc_msgSend_assetID(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("assetID"), v11);

  objc_msgSend_title(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("title"), v18);

  objc_msgSend_pageProgressionDirection(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("pageProgressionDirection"), v25);

  objc_msgSend_coverURL(self, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)v30, (uint64_t)CFSTR("coverURL"), v32);

  objc_msgSend_readingProgress(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, (uint64_t)CFSTR("readingProgress"), v39);

  objc_msgSend_totalDuration(self, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("totalDuration"), v46);

  objc_msgSend_cloudAssetType(self, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v52, (uint64_t)v51, (uint64_t)CFSTR("cloudAssetType"), v53);

  objc_msgSend_libraryAssetType(self, v54, v55, v56, v57);
  v60 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v58, (uint64_t)v60, (uint64_t)CFSTR("libraryContentAssetType"), v59);

}

- (BOOL)hasSignificantDifferenceWith:(id)a3
{
  BDSBookWidgetData *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BDSBookWidgetData *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  int isEqualToString;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  int isEqualToNumber;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  int v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  id v99;
  id v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  void *v110;
  BOOL v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  id v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  int v123;
  int v125;
  char v126;
  id v127;
  void *v128;
  int v129;
  void *v130;
  void *v131;
  int v132;
  void *v133;
  void *v134;
  uint8_t buf[4];
  BDSBookWidgetData *v136;
  __int16 v137;
  BDSBookWidgetData *v138;
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  v4 = (BDSBookWidgetData *)a3;
  v9 = v4;
  if (v4)
  {
    if (v4 == self)
      goto LABEL_59;
    objc_msgSend_assetID(self, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetID(v9, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    v17 = v15;
    v21 = v17;
    if (v16 == v17)
    {

    }
    else
    {
      v22 = v16;
      if (!v17)
      {
LABEL_42:

LABEL_43:
        goto LABEL_44;
      }
      isEqualToString = objc_msgSend_isEqualToString_(v16, v18, (uint64_t)v17, v19, v20);

      if (!isEqualToString)
        goto LABEL_43;
    }
    objc_msgSend_readingProgress(self, v24, v25, v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readingProgress(v9, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v29;
    v35 = v34;
    v39 = v35;
    if (v22 == v35)
    {

    }
    else
    {
      v40 = v22;
      if (!v35)
      {
LABEL_40:

LABEL_41:
        goto LABEL_42;
      }
      isEqualToNumber = objc_msgSend_isEqualToNumber_(v22, v36, (uint64_t)v35, v37, v38);

      if (!isEqualToNumber)
        goto LABEL_41;
    }
    objc_msgSend_totalDuration(self, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_totalDuration(v9, v47, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v46;
    v52 = v51;
    v56 = v52;
    if (v40 == v52)
    {

    }
    else
    {
      v57 = v40;
      if (!v52)
      {
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }
      v58 = objc_msgSend_isEqualToNumber_(v40, v53, (uint64_t)v52, v54, v55);

      if (!v58)
        goto LABEL_39;
    }
    objc_msgSend_title(self, v59, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_title(v9, v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v63;
    v69 = v68;
    v134 = v69;
    if (v57 == v69)
    {

    }
    else
    {
      v73 = v57;
      if (!v69)
      {
LABEL_36:

LABEL_37:
        goto LABEL_38;
      }
      v132 = objc_msgSend_isEqualToString_(v57, v70, (uint64_t)v69, v71, v72);

      if (!v132)
        goto LABEL_37;
    }
    v133 = v56;
    objc_msgSend_coverURL(self, v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_coverURL(v9, v79, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v78;
    v84 = v83;
    v131 = v84;
    if (v73 == v84)
    {

    }
    else
    {
      v88 = v84;
      if (!v84)
      {

LABEL_35:
        v56 = v133;
        goto LABEL_36;
      }
      v129 = objc_msgSend_isEqualToString_(v73, v85, (uint64_t)v84, v86, v87);

      if (!v129)
        goto LABEL_35;
    }
    v127 = v73;
    objc_msgSend_cloudAssetType(self, v89, v90, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cloudAssetType(v9, v94, v95, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v93;
    v100 = v98;
    v128 = v100;
    v130 = v99;
    if (v99 == v100)
    {

    }
    else
    {
      v104 = v100;
      if (!v100)
      {
        v126 = 1;
LABEL_57:
        v110 = v127;

        v109 = v126;
LABEL_58:

        if ((v109 & 1) != 0)
        {
LABEL_44:
          BDSWidgetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v136 = v9;
            v137 = 2112;
            v138 = self;
            goto LABEL_46;
          }
          goto LABEL_47;
        }
LABEL_59:
        v111 = 0;
        goto LABEL_60;
      }
      v125 = objc_msgSend_isEqualToString_(v99, v101, (uint64_t)v100, v102, v103);

      if (!v125)
      {
        v109 = 1;
        v110 = v127;
        goto LABEL_58;
      }
    }
    objc_msgSend_libraryAssetType(self, v105, v106, v107, v108);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_libraryAssetType(v9, v113, v114, v115, v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v112;
    v118 = v117;
    v122 = v118;
    if (v99 == v118)
    {
      v126 = 0;
    }
    else
    {
      if (v118)
        v123 = objc_msgSend_isEqualToString_(v99, v119, (uint64_t)v118, v120, v121) ^ 1;
      else
        LOBYTE(v123) = 1;
      v126 = v123;
    }

    goto LABEL_57;
  }
  BDSWidgetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v136 = 0;
    v137 = 2112;
    v138 = self;
LABEL_46:
    _os_log_impl(&dword_227D4F000, v28, OS_LOG_TYPE_DEFAULT, "Found changes between %@ and %@:", buf, 0x16u);
  }
LABEL_47:

  v111 = 1;
LABEL_60:

  return v111;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  void *v53;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_assetID(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_title(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pageProgressionDirection(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cloudAssetType(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_libraryAssetType(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingProgress(self, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v32, v33, v34, v35, v36);
  v38 = v37 * 100.0;
  objc_msgSend_totalDuration(self, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_coverURL(self, v44, v45, v46, v47);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = &stru_24F091B90;
  if (!v51)
    v52 = CFSTR(" missing coverURL");
  objc_msgSend_stringWithFormat_(v6, v48, (uint64_t)CFSTR("[%@ '%@' %@ %@ %@ (%.0f%%) %@%@]"), v49, v50, v7, v12, v17, v22, v27, *(_QWORD *)&v38, v43, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)pageProgressionDirection
{
  return self->_pageProgressionDirection;
}

- (void)setPageProgressionDirection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)coverURL
{
  return self->_coverURL;
}

- (void)setCoverURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)readingProgress
{
  return self->_readingProgress;
}

- (void)setReadingProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)cloudAssetType
{
  return self->_cloudAssetType;
}

- (void)setCloudAssetType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)libraryAssetType
{
  return self->_libraryAssetType;
}

- (void)setLibraryAssetType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalDuration, 0);
  objc_storeStrong((id *)&self->_libraryAssetType, 0);
  objc_storeStrong((id *)&self->_cloudAssetType, 0);
  objc_storeStrong((id *)&self->_readingProgress, 0);
  objc_storeStrong((id *)&self->_coverURL, 0);
  objc_storeStrong((id *)&self->_pageProgressionDirection, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
