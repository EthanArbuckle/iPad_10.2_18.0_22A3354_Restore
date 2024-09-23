@implementation BDSBookWidgetInfo

- (BDSBookWidgetInfo)initWithAssetID:(id)a3
{
  id v5;
  BDSBookWidgetInfo *v6;
  BDSBookWidgetInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BDSBookWidgetInfo;
  v6 = -[BDSBookWidgetInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetID, a3);

  return v7;
}

- (BDSBookWidgetInfo)initWithAssetID:(id)a3 title:(id)a4 coverURL:(id)a5 pageProgressionDirection:(id)a6 cloudAssetType:(id)a7 libraryContentAssetType:(id)a8
{
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BDSBookWidgetInfo *v22;
  id v24;
  id v25;

  v25 = a4;
  v24 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v21 = objc_msgSend_initWithAssetID_(self, v18, (uint64_t)a3, v19, v20);
  v22 = (BDSBookWidgetInfo *)v21;
  if (v21)
  {
    objc_storeStrong((id *)(v21 + 48), a4);
    objc_storeStrong((id *)&v22->_coverURL, a5);
    objc_storeStrong((id *)&v22->_pageProgressionDirection, a6);
    objc_storeStrong((id *)&v22->_cloudAssetType, a7);
    objc_storeStrong((id *)&v22->_libraryContentAssetType, a8);
  }

  return v22;
}

- (BDSBookWidgetInfo)initWithAssetID:(id)a3 title:(id)a4 coverURL:(id)a5 pageProgressionDirection:(id)a6 cloudAssetType:(id)a7 libraryContentAssetType:(id)a8 lastEngagedDate:(id)a9 isTrackedAsRecent:(BOOL)a10
{
  id v17;
  const char *v18;
  uint64_t v19;
  BDSBookWidgetInfo *v20;

  v17 = a9;
  v19 = objc_msgSend_initWithAssetID_title_coverURL_pageProgressionDirection_cloudAssetType_libraryContentAssetType_(self, v18, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  v20 = (BDSBookWidgetInfo *)v19;
  if (v19)
  {
    objc_storeStrong((id *)(v19 + 72), a9);
    v20->_isTrackedAsRecent = a10;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t isTrackedAsRecent;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t isExplicit;
  const char *v72;
  uint64_t v73;
  id v74;

  v74 = a3;
  objc_msgSend_assetID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v74, v9, (uint64_t)v8, (uint64_t)CFSTR("assetID"), v10);

  objc_msgSend_title(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v74, v16, (uint64_t)v15, (uint64_t)CFSTR("title"), v17);

  objc_msgSend_coverURL(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v74, v23, (uint64_t)v22, (uint64_t)CFSTR("coverURL"), v24);

  objc_msgSend_pageProgressionDirection(self, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v74, v30, (uint64_t)v29, (uint64_t)CFSTR("pageProgressionDirection"), v31);

  objc_msgSend_libraryContentAssetType(self, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v74, v37, (uint64_t)v36, (uint64_t)CFSTR("libraryContentAssetType"), v38);

  objc_msgSend_cloudAssetType(self, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v74, v44, (uint64_t)v43, (uint64_t)CFSTR("cloudAssetType"), v45);

  objc_msgSend_totalDuration(self, v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v74, v51, (uint64_t)v50, (uint64_t)CFSTR("totalDuration"), v52);

  objc_msgSend_lastEngagedDate(self, v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v74, v58, (uint64_t)v57, (uint64_t)CFSTR("lastEngagedDate"), v59);

  isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(self, v60, v61, v62, v63);
  objc_msgSend_encodeBool_forKey_(v74, v65, isTrackedAsRecent, (uint64_t)CFSTR("isTrackedAsRecent"), v66);
  isExplicit = objc_msgSend_isExplicit(self, v67, v68, v69, v70);
  objc_msgSend_encodeBool_forKey_(v74, v72, isExplicit, (uint64_t)CFSTR("isExplicit"), v73);

}

- (BDSBookWidgetInfo)initWithCoder:(id)a3
{
  id v4;
  BDSBookWidgetInfo *v5;
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
  NSString *coverURL;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *pageProgressionDirection;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSString *libraryContentAssetType;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSString *cloudAssetType;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSNumber *totalDuration;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSDate *lastEngagedDate;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)BDSBookWidgetInfo;
  v5 = -[BDSBookWidgetInfo init](&v53, sel_init);
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
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("coverURL"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    coverURL = v5->_coverURL;
    v5->_coverURL = (NSString *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("pageProgressionDirection"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    pageProgressionDirection = v5->_pageProgressionDirection;
    v5->_pageProgressionDirection = (NSString *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("libraryContentAssetType"), v28);
    v29 = objc_claimAutoreleasedReturnValue();
    libraryContentAssetType = v5->_libraryContentAssetType;
    v5->_libraryContentAssetType = (NSString *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("cloudAssetType"), v33);
    v34 = objc_claimAutoreleasedReturnValue();
    cloudAssetType = v5->_cloudAssetType;
    v5->_cloudAssetType = (NSString *)v34;

    v36 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, (uint64_t)CFSTR("totalDuration"), v38);
    v39 = objc_claimAutoreleasedReturnValue();
    totalDuration = v5->_totalDuration;
    v5->_totalDuration = (NSNumber *)v39;

    v41 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, (uint64_t)CFSTR("lastEngagedDate"), v43);
    v44 = objc_claimAutoreleasedReturnValue();
    lastEngagedDate = v5->_lastEngagedDate;
    v5->_lastEngagedDate = (NSDate *)v44;

    v5->_isTrackedAsRecent = objc_msgSend_decodeBoolForKey_(v4, v46, (uint64_t)CFSTR("isTrackedAsRecent"), v47, v48);
    v5->_isExplicit = objc_msgSend_decodeBoolForKey_(v4, v49, (uint64_t)CFSTR("isExplicit"), v50, v51);
  }

  return v5;
}

- (id)description
{
  objc_class *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int isTrackedAsRecent;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t isExplicit;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
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
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;

  v65 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetID(self, v4, v5, v6, v7);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_title(self, v8, v9, v10, v11);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cloudAssetType(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastEngagedDate(self, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(self, v22, v23, v24, v25);
  objc_msgSend_coverURL(self, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x24BDD16E0];
  isExplicit = objc_msgSend_isExplicit(self, v33, v34, v35, v36);
  objc_msgSend_numberWithBool_(v32, v38, isExplicit, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pageProgressionDirection(self, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_libraryContentAssetType(self, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_totalDuration(self, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v65, v57, (uint64_t)CFSTR("<%@:%p assetID=%@ title=%@ cloudAssetType=%@ lastEngagedDate=%@ isTrackedAsRecent=%d coverURL=%@ isExplicit=%@ pageProgressionDirection=%@ libraryContentAssetType=%@ duration=%@>"), v58, v59, v64, self, v63, v62, v16, v21, isTrackedAsRecent, v31, v41, v46, v51, v56);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  return v60;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)cloudAssetType
{
  return self->_cloudAssetType;
}

- (void)setCloudAssetType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)libraryContentAssetType
{
  return self->_libraryContentAssetType;
}

- (void)setLibraryContentAssetType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)coverURL
{
  return self->_coverURL;
}

- (void)setCoverURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)pageProgressionDirection
{
  return self->_pageProgressionDirection;
}

- (void)setPageProgressionDirection:(id)a3
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

- (NSDate)lastEngagedDate
{
  return self->_lastEngagedDate;
}

- (BOOL)isTrackedAsRecent
{
  return self->_isTrackedAsRecent;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEngagedDate, 0);
  objc_storeStrong((id *)&self->_totalDuration, 0);
  objc_storeStrong((id *)&self->_pageProgressionDirection, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_coverURL, 0);
  objc_storeStrong((id *)&self->_libraryContentAssetType, 0);
  objc_storeStrong((id *)&self->_cloudAssetType, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

- (id)insertMatchingManagedObjectIntoContext:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_227D9BCFC;
  v18 = sub_227D9BD0C;
  v19 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_227D9BD14;
  v11[3] = &unk_24F089E50;
  v11[4] = self;
  v5 = v4;
  v12 = v5;
  v13 = &v14;
  objc_msgSend_performBlockAndWait_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

@end
