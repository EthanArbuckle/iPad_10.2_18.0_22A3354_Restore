@implementation BDSBookWidgetInfoMO

- (id)initIntoManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  BDSBookWidgetInfoMO *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x24BDBB658];
  v5 = a3;
  objc_msgSend_entityForName_inManagedObjectContext_(v4, v6, (uint64_t)CFSTR("BDSBookWidgetInfoMO"), (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)BDSBookWidgetInfoMO;
  v9 = -[BDSBookWidgetInfoMO initWithEntity:insertIntoManagedObjectContext:](&v11, sel_initWithEntity_insertIntoManagedObjectContext_, v8, v5);

  return v9;
}

+ (id)fetchRequest
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], a2, (uint64_t)CFSTR("BDSBookWidgetInfoMO"), v2, v3);
}

- (id)getBookWidgetInfoObject
{
  BDSBookWidgetInfo *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t isExplicit;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  char isTrackedAsRecent;

  v3 = [BDSBookWidgetInfo alloc];
  objc_msgSend_assetID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_title(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_coverURL(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pageProgressionDirection(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cloudAssetType(self, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_libraryContentAssetType(self, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastEngagedDate(self, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(self, v39, v40, v41, v42);
  v44 = (void *)objc_msgSend_initWithAssetID_title_coverURL_pageProgressionDirection_cloudAssetType_libraryContentAssetType_lastEngagedDate_isTrackedAsRecent_(v3, v43, (uint64_t)v8, (uint64_t)v13, (uint64_t)v18, v23, v28, v33, v38, isTrackedAsRecent);

  isExplicit = objc_msgSend_isExplicit(self, v45, v46, v47, v48);
  objc_msgSend_setIsExplicit_(v44, v50, isExplicit, v51, v52);
  return v44;
}

@end
