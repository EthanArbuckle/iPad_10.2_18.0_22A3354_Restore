@implementation FCPuzzleType

+ (BOOL)isPuzzleTypeIdentifier:(id)a3
{
  return +[FCPuzzleTypeRecordSource recognizesRecordID:](FCPuzzleTypeRecordSource, "recognizesRecordID:", a3);
}

- (FCPuzzleType)initWithIdentifier:(id)a3 name:(id)a4 kind:(id)a5 engineResourceID:(id)a6 superfeedConfigResourceID:(id)a7 latestPuzzleIDs:(id)a8 promotedPuzzleIDs:(id)a9 nameImageAssetHandle:(id)a10 nameImageCompactAssetHandle:(id)a11 nameImageMaskAssetHandle:(id)a12 nameImageForDarkBackgroundAssetHandle:(id)a13 feedNavImageAssetHandle:(id)a14 coverImageAssetHandle:(id)a15 navigationChromeBackgroundImageHandle:(id)a16 navigationChromeBackgroundImageCompactHandle:(id)a17 navigationChromeBackgroundImageLargeHandle:(id)a18 navigationChromeBackgroundDarkModeImageHandle:(id)a19 navigationChromeBackgroundDarkModeImageCompactHandle:(id)a20 navigationChromeBackgroundDarkModeImageLargeHandle:(id)a21 language:(id)a22 allowedStorefrontIDs:(id)a23 blockedStorefrontIDs:(id)a24 minimumNewsVersion:(int64_t)a25 loadDate:(id)a26 fetchDate:(id)a27 lastModifiedDate:(id)a28 exploreTileImageAssetHandle:(id)a29 versionKey:(id)a30 titleDisplayPrefix:(id)a31 titleDisplaySuffix:(id)a32 themeColor:(id)a33 puzzlePrimaryColor:(id)a34 darkStyleThemeColor:(id)a35 darkStylePuzzlePrimaryColor:(id)a36 groupTitleColor:(id)a37 groupDarkStyleTitleColor:(id)a38 thumbnailDirectory:(id)a39
{
  id v44;
  id v45;
  id v46;
  FCPuzzleType *v47;
  FCPuzzleType *v48;
  id v51;
  id v52;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  objc_super v87;

  v86 = a3;
  v85 = a4;
  v51 = a5;
  v84 = a5;
  v83 = a6;
  v52 = a7;
  v82 = a7;
  v81 = a8;
  v80 = a9;
  v79 = a10;
  v78 = a11;
  v77 = a12;
  v76 = a13;
  v75 = a14;
  v74 = a15;
  v73 = a16;
  v72 = a17;
  v71 = a18;
  v70 = a19;
  v69 = a20;
  v68 = a21;
  v67 = a22;
  v66 = a23;
  v65 = a24;
  v64 = a26;
  v44 = a27;
  v45 = a28;
  v46 = a29;
  v63 = a30;
  v62 = a31;
  v61 = a32;
  v60 = a33;
  v59 = a34;
  v58 = a35;
  v57 = a36;
  v56 = a37;
  v55 = a38;
  v54 = a39;
  v87.receiver = self;
  v87.super_class = (Class)FCPuzzleType;
  v47 = -[FCPuzzleType init](&v87, sel_init);
  v48 = v47;
  if (v47)
  {
    objc_storeStrong((id *)&v47->_identifier, a3);
    objc_storeStrong((id *)&v48->_name, a4);
    objc_storeStrong((id *)&v48->_kind, v51);
    objc_storeStrong((id *)&v48->_engineResourceID, a6);
    objc_storeStrong((id *)&v48->_superfeedConfigResourceID, v52);
    objc_storeStrong((id *)&v48->_latestPuzzleIDs, a8);
    objc_storeStrong((id *)&v48->_promotedPuzzleIDs, a9);
    objc_storeStrong((id *)&v48->_nameImageAssetHandle, a10);
    objc_storeStrong((id *)&v48->_nameImageCompactAssetHandle, a11);
    objc_storeStrong((id *)&v48->_nameImageMaskAssetHandle, a12);
    objc_storeStrong((id *)&v48->_nameImageForDarkBackgroundAssetHandle, a13);
    objc_storeStrong((id *)&v48->_feedNavImageAssetHandle, a14);
    objc_storeStrong((id *)&v48->_coverImageAssetHandle, a15);
    objc_storeStrong((id *)&v48->_navigationChromeBackgroundImage, a16);
    objc_storeStrong((id *)&v48->_navigationChromeBackgroundImageCompact, a17);
    objc_storeStrong((id *)&v48->_navigationChromeBackgroundImageLarge, a18);
    objc_storeStrong((id *)&v48->_darkStyleNavigationChromeBackgroundImage, a19);
    objc_storeStrong((id *)&v48->_darkStyleNavigationChromeBackgroundImageCompact, a20);
    objc_storeStrong((id *)&v48->_darkStyleNavigationChromeBackgroundImageLarge, a21);
    objc_storeStrong((id *)&v48->_language, a22);
    objc_storeStrong((id *)&v48->_allowedStorefrontIDs, a23);
    objc_storeStrong((id *)&v48->_blockedStorefrontIDs, a24);
    v48->_minimumNewsVersion = a25;
    objc_storeStrong((id *)&v48->_loadDate, a26);
    objc_storeStrong((id *)&v48->_fetchDate, a27);
    objc_storeStrong((id *)&v48->_lastModifiedDate, a28);
    objc_storeStrong((id *)&v48->_exploreTileImageAssetHandle, a29);
    objc_storeStrong((id *)&v48->_themeColor, a33);
    objc_storeStrong((id *)&v48->_puzzlePrimaryColor, a34);
    objc_storeStrong((id *)&v48->_darkStyleThemeColor, a35);
    objc_storeStrong((id *)&v48->_darkStylePuzzlePrimaryColor, a36);
    objc_storeStrong((id *)&v48->_groupTitleColor, a37);
    objc_storeStrong((id *)&v48->_groupDarkStyleTitleColor, a38);
    objc_storeStrong((id *)&v48->_versionKey, a30);
    objc_storeStrong((id *)&v48->_titleDisplayPrefix, a31);
    objc_storeStrong((id *)&v48->_titleDisplaySuffix, a32);
    objc_storeStrong((id *)&v48->_thumbnailDirectory, a39);
  }

  return v48;
}

- (FCPuzzleType)initWithPuzzleTypeRecord:(id)a3 assetManager:(id)a4 context:(id)a5 interestToken:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  FCPuzzleType *v17;
  uint64_t v18;
  NSDate *loadDate;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDate *fetchDate;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDate *lastModifiedDate;
  uint64_t v30;
  NSString *identifier;
  uint64_t v32;
  NSString *name;
  uint64_t v34;
  NSString *kind;
  uint64_t v36;
  NSString *engineResourceID;
  uint64_t v38;
  NSString *superfeedConfigResourceID;
  uint64_t v40;
  NSArray *latestPuzzleIDs;
  uint64_t v42;
  NSArray *promotedPuzzleIDs;
  uint64_t v44;
  FCAssetHandle *nameImageAssetHandle;
  uint64_t v46;
  FCAssetHandle *nameImageCompactAssetHandle;
  uint64_t v48;
  FCAssetHandle *nameImageForDarkBackgroundAssetHandle;
  uint64_t v50;
  FCAssetHandle *nameImageMaskAssetHandle;
  uint64_t v52;
  FCAssetHandle *coverImageAssetHandle;
  uint64_t v54;
  FCAssetHandle *feedNavImageAssetHandle;
  uint64_t v56;
  FCAssetHandle *feedNavImageHQAssetHandle;
  uint64_t v58;
  FCAssetHandle *navigationChromeBackgroundImage;
  uint64_t v60;
  FCAssetHandle *navigationChromeBackgroundImageCompact;
  uint64_t v62;
  FCAssetHandle *navigationChromeBackgroundImageLarge;
  uint64_t v64;
  FCAssetHandle *darkStyleNavigationChromeBackgroundImage;
  uint64_t v66;
  FCAssetHandle *darkStyleNavigationChromeBackgroundImageCompact;
  uint64_t v68;
  FCAssetHandle *darkStyleNavigationChromeBackgroundImageLarge;
  uint64_t v70;
  FCAssetHandle *exploreTileImageAssetHandle;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  FCColor *themeColor;
  uint64_t v77;
  FCColor *darkStyleThemeColor;
  uint64_t v79;
  FCColor *puzzlePrimaryColor;
  uint64_t v81;
  FCColor *darkStylePuzzlePrimaryColor;
  uint64_t v83;
  FCColor *groupTitleColor;
  uint64_t v85;
  FCColor *groupDarkStyleTitleColor;
  void *v87;
  void *v88;
  NSDictionary *v89;
  NSArray *v90;
  void *v91;
  void *v92;
  id v93;
  NSDictionary *navigationBarThemeByRankID;
  NSDictionary *v95;
  NSArray *orderedNavigationBarThemes;
  NSArray *v97;
  uint64_t v98;
  NSString *imageResourceID;
  FCPuzzleTypeThumbnailDirectory *v100;
  void *v101;
  uint64_t v102;
  FCPuzzleTypeThumbnailDirectoryType *thumbnailDirectory;
  uint64_t v104;
  NSString *language;
  uint64_t v106;
  NSArray *blockedStorefrontIDs;
  uint64_t v108;
  NSArray *allowedStorefrontIDs;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *context;
  _QWORD v121[4];
  NSDictionary *v122;
  NSArray *v123;
  objc_super v124;
  uint8_t buf[4];
  const char *v126;
  __int16 v127;
  char *v128;
  __int16 v129;
  int v130;
  __int16 v131;
  void *v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "base");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier != 0");
    *(_DWORD *)buf = 136315906;
    v126 = "-[FCPuzzleType initWithPuzzleTypeRecord:assetManager:context:interestToken:]";
    v127 = 2080;
    v128 = "FCPuzzleType.m";
    v129 = 1024;
    v130 = 166;
    v131 = 2114;
    v132 = v111;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v124.receiver = self;
  v124.super_class = (Class)FCPuzzleType;
  v17 = -[FCPuzzleType init](&v124, sel_init);
  if (v17)
  {
    if (objc_msgSend(v16, "length"))
    {
      context = (void *)MEMORY[0x1A8580B64]();
      objc_storeStrong((id *)&v17->_puzzleTypeRecord, a3);
      objc_storeStrong((id *)&v17->_interestToken, a6);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = objc_claimAutoreleasedReturnValue();
      loadDate = v17->_loadDate;
      v17->_loadDate = (NSDate *)v18;

      v20 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v11, "base");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fetchDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateWithPBDate:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
      fetchDate = v17->_fetchDate;
      v17->_fetchDate = (NSDate *)v23;

      v25 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v11, "base");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "modificationDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "dateWithPBDate:", v27);
      v28 = objc_claimAutoreleasedReturnValue();
      lastModifiedDate = v17->_lastModifiedDate;
      v17->_lastModifiedDate = (NSDate *)v28;

      v30 = objc_msgSend(v16, "copy");
      identifier = v17->_identifier;
      v17->_identifier = (NSString *)v30;

      objc_msgSend(v11, "name");
      v32 = objc_claimAutoreleasedReturnValue();
      name = v17->_name;
      v17->_name = (NSString *)v32;

      objc_msgSend(v11, "kind");
      v34 = objc_claimAutoreleasedReturnValue();
      kind = v17->_kind;
      v17->_kind = (NSString *)v34;

      objc_msgSend(v11, "engineResourceID");
      v36 = objc_claimAutoreleasedReturnValue();
      engineResourceID = v17->_engineResourceID;
      v17->_engineResourceID = (NSString *)v36;

      objc_msgSend(v11, "superfeedConfigResourceID");
      v38 = objc_claimAutoreleasedReturnValue();
      superfeedConfigResourceID = v17->_superfeedConfigResourceID;
      v17->_superfeedConfigResourceID = (NSString *)v38;

      objc_msgSend(v11, "latestPuzzleIDs");
      v40 = objc_claimAutoreleasedReturnValue();
      latestPuzzleIDs = v17->_latestPuzzleIDs;
      v17->_latestPuzzleIDs = (NSArray *)v40;

      objc_msgSend(v11, "promotedPuzzleIDs");
      v42 = objc_claimAutoreleasedReturnValue();
      promotedPuzzleIDs = v17->_promotedPuzzleIDs;
      v17->_promotedPuzzleIDs = (NSArray *)v42;

      objc_msgSend(v11, "generateNameImageAssetHandleWithAssetManager:", v12);
      v44 = objc_claimAutoreleasedReturnValue();
      nameImageAssetHandle = v17->_nameImageAssetHandle;
      v17->_nameImageAssetHandle = (FCAssetHandle *)v44;

      objc_msgSend(v11, "generateNameImageCompactAssetHandleWithAssetManager:", v12);
      v46 = objc_claimAutoreleasedReturnValue();
      nameImageCompactAssetHandle = v17->_nameImageCompactAssetHandle;
      v17->_nameImageCompactAssetHandle = (FCAssetHandle *)v46;

      objc_msgSend(v11, "generateNameImageForDarkBackgroundAssetHandleWithAssetManager:", v12);
      v48 = objc_claimAutoreleasedReturnValue();
      nameImageForDarkBackgroundAssetHandle = v17->_nameImageForDarkBackgroundAssetHandle;
      v17->_nameImageForDarkBackgroundAssetHandle = (FCAssetHandle *)v48;

      objc_msgSend(v11, "generateNameImageMaskAssetHandleWithAssetManager:", v12);
      v50 = objc_claimAutoreleasedReturnValue();
      nameImageMaskAssetHandle = v17->_nameImageMaskAssetHandle;
      v17->_nameImageMaskAssetHandle = (FCAssetHandle *)v50;

      objc_msgSend(v11, "generateCoverImageAssetHandleWithAssetManager:", v12);
      v52 = objc_claimAutoreleasedReturnValue();
      coverImageAssetHandle = v17->_coverImageAssetHandle;
      v17->_coverImageAssetHandle = (FCAssetHandle *)v52;

      objc_msgSend(v11, "generateFeedNavImageAssetHandleWithAssetManager:", v12);
      v54 = objc_claimAutoreleasedReturnValue();
      feedNavImageAssetHandle = v17->_feedNavImageAssetHandle;
      v17->_feedNavImageAssetHandle = (FCAssetHandle *)v54;

      objc_msgSend(v11, "generateFeedNavImageAssetHandleWithAssetManager:", v12);
      v56 = objc_claimAutoreleasedReturnValue();
      feedNavImageHQAssetHandle = v17->_feedNavImageHQAssetHandle;
      v17->_feedNavImageHQAssetHandle = (FCAssetHandle *)v56;

      objc_msgSend(v11, "generateNavigationChromeBackgroundImageHandleWithAssetManager:", v12);
      v58 = objc_claimAutoreleasedReturnValue();
      navigationChromeBackgroundImage = v17->_navigationChromeBackgroundImage;
      v17->_navigationChromeBackgroundImage = (FCAssetHandle *)v58;

      objc_msgSend(v11, "generateNavigationChromeBackgroundImageCompactHandleWithAssetManager:", v12);
      v60 = objc_claimAutoreleasedReturnValue();
      navigationChromeBackgroundImageCompact = v17->_navigationChromeBackgroundImageCompact;
      v17->_navigationChromeBackgroundImageCompact = (FCAssetHandle *)v60;

      objc_msgSend(v11, "generateNavigationChromeBackgroundImageLargeHandleWithAssetManager:", v12);
      v62 = objc_claimAutoreleasedReturnValue();
      navigationChromeBackgroundImageLarge = v17->_navigationChromeBackgroundImageLarge;
      v17->_navigationChromeBackgroundImageLarge = (FCAssetHandle *)v62;

      objc_msgSend(v11, "generateNavigationChromeBackgroundDarkModeImageHandleWithAssetManager:", v12);
      v64 = objc_claimAutoreleasedReturnValue();
      darkStyleNavigationChromeBackgroundImage = v17->_darkStyleNavigationChromeBackgroundImage;
      v17->_darkStyleNavigationChromeBackgroundImage = (FCAssetHandle *)v64;

      objc_msgSend(v11, "generateNavigationChromeBackgroundDarkModeImageCompactHandleWithAssetManager:", v12);
      v66 = objc_claimAutoreleasedReturnValue();
      darkStyleNavigationChromeBackgroundImageCompact = v17->_darkStyleNavigationChromeBackgroundImageCompact;
      v17->_darkStyleNavigationChromeBackgroundImageCompact = (FCAssetHandle *)v66;

      objc_msgSend(v11, "generateNavigationChromeBackgroundDarkModeImageLargeHandleWithAssetManager:", v12);
      v68 = objc_claimAutoreleasedReturnValue();
      darkStyleNavigationChromeBackgroundImageLarge = v17->_darkStyleNavigationChromeBackgroundImageLarge;
      v17->_darkStyleNavigationChromeBackgroundImageLarge = (FCAssetHandle *)v68;

      objc_msgSend(v11, "generateExploreTileImageAssetHandleWithAssetManager:", v12);
      v70 = objc_claimAutoreleasedReturnValue();
      exploreTileImageAssetHandle = v17->_exploreTileImageAssetHandle;
      v17->_exploreTileImageAssetHandle = (FCAssetHandle *)v70;

      objc_msgSend(v11, "themeConfiguration");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "dataUsingEncoding:", 4);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      if (v73)
      {
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v73, 0, 0);
        v119 = v13;
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("exploreTileBackgroundColor"));
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v118);
        v75 = objc_claimAutoreleasedReturnValue();
        themeColor = v17->_themeColor;
        v17->_themeColor = (FCColor *)v75;

        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("darkStyleExploreTileBackgroundColor"));
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v117);
        v77 = objc_claimAutoreleasedReturnValue();
        darkStyleThemeColor = v17->_darkStyleThemeColor;
        v17->_darkStyleThemeColor = (FCColor *)v77;

        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("puzzlePrimaryColor"));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v116);
        v79 = objc_claimAutoreleasedReturnValue();
        puzzlePrimaryColor = v17->_puzzlePrimaryColor;
        v17->_puzzlePrimaryColor = (FCColor *)v79;

        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("darkStylePuzzlePrimaryColor"));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v115);
        v81 = objc_claimAutoreleasedReturnValue();
        darkStylePuzzlePrimaryColor = v17->_darkStylePuzzlePrimaryColor;
        v17->_darkStylePuzzlePrimaryColor = (FCColor *)v81;

        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("groupTitleColor"));
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v114);
        v83 = objc_claimAutoreleasedReturnValue();
        groupTitleColor = v17->_groupTitleColor;
        v17->_groupTitleColor = (FCColor *)v83;

        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("darkStyleGroupTitleColor"));
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v113);
        v85 = objc_claimAutoreleasedReturnValue();
        groupDarkStyleTitleColor = v17->_groupDarkStyleTitleColor;
        v17->_groupDarkStyleTitleColor = (FCColor *)v85;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("navigationBarTheme"));
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v121[0] = MEMORY[0x1E0C809B0];
        v121[1] = 3221225472;
        v121[2] = __76__FCPuzzleType_initWithPuzzleTypeRecord_assetManager_context_interestToken___block_invoke;
        v121[3] = &unk_1E4643D70;
        v89 = v87;
        v122 = v89;
        v90 = v88;
        v123 = v90;
        objc_msgSend(v112, "enumerateObjectsUsingBlock:", v121);
        v91 = v73;
        v92 = v16;
        v93 = v14;
        navigationBarThemeByRankID = v17->_navigationBarThemeByRankID;
        v17->_navigationBarThemeByRankID = v89;
        v95 = v89;

        orderedNavigationBarThemes = v17->_orderedNavigationBarThemes;
        v17->_orderedNavigationBarThemes = v90;
        v97 = v90;

        v14 = v93;
        v16 = v92;
        v73 = v91;

        v13 = v119;
      }
      objc_msgSend(v11, "imagesResourceID");
      v98 = objc_claimAutoreleasedReturnValue();
      imageResourceID = v17->_imageResourceID;
      v17->_imageResourceID = (NSString *)v98;

      v100 = [FCPuzzleTypeThumbnailDirectory alloc];
      objc_msgSend(v11, "imagesResourceID");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = -[FCPuzzleTypeThumbnailDirectory initWithResourceMapId:assetManager:context:](v100, "initWithResourceMapId:assetManager:context:", v101, v12, v13);
      thumbnailDirectory = v17->_thumbnailDirectory;
      v17->_thumbnailDirectory = (FCPuzzleTypeThumbnailDirectoryType *)v102;

      objc_msgSend(v11, "language");
      v104 = objc_claimAutoreleasedReturnValue();
      language = v17->_language;
      v17->_language = (NSString *)v104;

      objc_msgSend(v11, "blockedStorefrontIDs");
      v106 = objc_claimAutoreleasedReturnValue();
      blockedStorefrontIDs = v17->_blockedStorefrontIDs;
      v17->_blockedStorefrontIDs = (NSArray *)v106;

      objc_msgSend(v11, "allowedStorefrontIDs");
      v108 = objc_claimAutoreleasedReturnValue();
      allowedStorefrontIDs = v17->_allowedStorefrontIDs;
      v17->_allowedStorefrontIDs = (NSArray *)v108;

      v17->_minimumNewsVersion = objc_msgSend(v11, "minimumNewsVersion");
      objc_autoreleasePoolPop(context);
    }
    else
    {

      v17 = 0;
    }
  }

  return v17;
}

void __76__FCPuzzleType_initWithPuzzleTypeRecord_assetManager_context_interestToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  FCPuzzleNavigationBarTheme *v20;
  void *v21;
  FCPuzzleNavigationBarTheme *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a2;
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
  v2 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v2;
  if (v2)
  {
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("backgroundDarkModeColor"));
  v4 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v4;
  if (v4)
  {
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("barButtonItemTintColor"));
  v6 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v6;
  if (v6)
  {
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("barButtonItemTintDarkModeColor"));
  v7 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v7;
  if (v7)
  {
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("barButtonItemBackgroundColor"));
  v9 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v9;
  if (v9)
  {
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("barButtonItemBackgroundDarkModeColor"));
  v10 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v10;
  if (v10)
  {
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)v3;
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("shareTextForegroundColor"));
  v13 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v13;
  if (v13)
  {
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("rankForegroundColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("rankForegroundDarkModeColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("rankIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = -[FCPuzzleNavigationBarTheme initWithNavigationBarBackgroundColor:navigationBarBackgroundDarkModeColor:rankForegroundColor:rankForegroundDarkModeColor:barButtonItemTintColor:barButtonItemTintDarkModeColor:barButtonItemBackgroundColor:barButtonItemBackgroundDarkModeColor:shareTextForegroundColor:]([FCPuzzleNavigationBarTheme alloc], "initWithNavigationBarBackgroundColor:navigationBarBackgroundDarkModeColor:rankForegroundColor:rankForegroundDarkModeColor:barButtonItemTintColor:barButtonItemTintDarkModeColor:barButtonItemBackgroundColor:barButtonItemBackgroundDarkModeColor:shareTextForegroundColor:", v12, v5, v16, v18, v33, v8, v25, v11, v14);
    v23 = v18;
    v21 = v11;
    v22 = v20;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v20, v19);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);

    v11 = v21;
    v18 = v23;
  }

}

- (FCPuzzleType)initWithPuzzleType:(id)a3 overrides:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  FCPuzzleType *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "kind");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineResourceID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superfeedConfigResourceID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestPuzzleIDs");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "promotedPuzzleIDs");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameImageAssetHandle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameImageCompactAssetHandle");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameImageMaskAssetHandle");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameImageForDarkBackgroundAssetHandle");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedNavImageAssetHandle");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coverImageAssetHandle");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationChromeBackgroundImage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationChromeBackgroundImageCompact");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationChromeBackgroundImageLarge");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "darkStyleNavigationChromeBackgroundImage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "darkStyleNavigationChromeBackgroundImageCompact");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "darkStyleNavigationChromeBackgroundImageLarge");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "language");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allowedStorefrontIDs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockedStorefrontIDs");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v5, "minimumNewsVersion");
  objc_msgSend(v5, "loadDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastModifiedDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exploreTileImageAssetHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  if (!v7)
  {
    objc_msgSend(v5, "exploreTileImageAssetHandle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "versionKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleDisplayPrefix");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleDisplaySuffix");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "themeColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v8;
  if (!v8)
  {
    objc_msgSend(v5, "themeColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "puzzlePrimaryColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  objc_msgSend(v6, "darkStyleThemeColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(v5, "darkStyleThemeColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "darkStylePuzzlePrimaryColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupTitleColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupDarkStyleTitleColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thumbnailDirectory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[FCPuzzleType initWithIdentifier:name:kind:engineResourceID:superfeedConfigResourceID:latestPuzzleIDs:promotedPuzzleIDs:nameImageAssetHandle:nameImageCompactAssetHandle:nameImageMaskAssetHandle:nameImageForDarkBackgroundAssetHandle:feedNavImageAssetHandle:coverImageAssetHandle:navigationChromeBackgroundImageHandle:navigationChromeBackgroundImageCompactHandle:navigationChromeBackgroundImageLargeHandle:navigationChromeBackgroundDarkModeImageHandle:navigationChromeBackgroundDarkModeImageCompactHandle:navigationChromeBackgroundDarkModeImageLargeHandle:language:allowedStorefrontIDs:blockedStorefrontIDs:minimumNewsVersion:loadDate:fetchDate:lastModifiedDate:exploreTileImageAssetHandle:versionKey:titleDisplayPrefix:titleDisplaySuffix:themeColor:puzzlePrimaryColor:darkStyleThemeColor:darkStylePuzzlePrimaryColor:groupTitleColor:groupDarkStyleTitleColor:thumbnailDirectory:](self, "initWithIdentifier:name:kind:engineResourceID:superfeedConfigResourceID:latestPuzzleIDs:promotedPuzzleIDs:nameImageAssetHandle:nameImageCompactAssetHandle:nameImageMaskAssetHandle:nameImageForDarkBackgroundAssetHandle:feedNavImageAssetHandle:coverImageAssetHandle:navigationChromeBackgroundImageHandle:navigationChromeBackgroundImageCompactHandle:navigationChromeBackgroundImageLargeHandle:navigationChromeBackgroundDarkModeImageHandle:navigationChromeBackgroundDarkModeImageCompactHandle:navigationChromeBackgroundDarkModeImageLargeHandle:language:allowedStorefrontIDs:blockedStorefrontIDs:minimumNewsVersion:loadDate:fetchDate:lastModifiedDate:exploreTileImageAssetHandle:versionKey:titleDisplayPrefix:titleDisplaySuffix:themeColor:puzzlePrimaryColor:darkStyleThemeColor:darkStylePuzzlePrimaryColor:groupTitleColor:groupDarkStyleTitleColor:thumbnailDirectory:", v50, v49, v48, v47, v46, v45, v44, v43, v42, v41,
          v40,
          v39,
          v38,
          v37,
          v36,
          v35,
          v34,
          v33,
          v32,
          v31,
          v30,
          v29,
          v17,
          v28,
          v27,
          v26,
          v22,
          v25,
          v24,
          v23,
          v21,
          v9,
          v11,
          v12,
          v13,
          v14,
          v15);

  if (!v10)
  if (!v8)

  if (!v7)
  return v19;
}

- (FCContentArchive)contentArchive
{
  void *v2;
  void *v3;

  -[FCPuzzleType puzzleTypeRecord](self, "puzzleTypeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithRecord:](FCContentArchive, "archiveWithRecord:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentArchive *)v3;
}

- (FCContentManifest)contentManifest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[FCPuzzleType puzzleTypeRecord](self, "puzzleTypeRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FCPuzzleType puzzleTypeRecord](self, "puzzleTypeRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentManifest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[FCContentManifest empty](FCContentManifest, "empty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (FCContentManifest *)v6;
}

- (BOOL)isEqualToTag:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  NSString *identifier;
  void *v8;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  FCCheckedDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  identifier = self->_identifier;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v8);

  return (char)identifier;
}

- (id)asChannel
{
  return 0;
}

- (id)asSection
{
  return 0;
}

- (id)asTopic
{
  return 0;
}

- (id)asSports
{
  return 0;
}

- (id)asSportsEvent
{
  return 0;
}

- (BOOL)isSports
{
  return 0;
}

- (BOOL)isSportsEvent
{
  return 0;
}

- (BOOL)isPuzzleType
{
  return 1;
}

- (unint64_t)tagType
{
  return 2;
}

- (id)nameCompact
{
  return self->_name;
}

- (id)displayName
{
  return self->_name;
}

- (id)compactDisplayName
{
  return self->_name;
}

- (NSString)nameForSharing
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Apple News+ %@"), &stru_1E464BC40, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v4, self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)hideAccessoryText
{
  return 0;
}

- (id)groupName
{
  return self->_name;
}

- (int64_t)contentProvider
{
  return 0;
}

- (id)iAdCategories
{
  return 0;
}

- (id)iAdKeywords
{
  return 0;
}

- (BOOL)isDeprecated
{
  return 0;
}

- (BOOL)isExplicitContent
{
  return 0;
}

- (BOOL)isNotificationEnabled
{
  return 0;
}

- (BOOL)isPublic
{
  return 1;
}

- (BOOL)isSubscribable
{
  return 1;
}

- (id)magazineGenre
{
  return 0;
}

- (id)primaryAudience
{
  return 0;
}

- (id)publisherPaidAuthorizationURL
{
  return 0;
}

- (id)publisherPaidFeldsparablePurchaseIDs
{
  return 0;
}

- (id)publisherPaidBundlePurchaseIDs
{
  return 0;
}

- (id)publisherPaidOfferableConfigurations
{
  return 0;
}

- (BOOL)publisherPaidLeakyPaywallOptOut
{
  return 0;
}

- (id)publisherPaidVerificationURL
{
  return 0;
}

- (id)nameImageMaskWidgetLQAssetHandle
{
  return self->_nameImageMaskAssetHandle;
}

- (id)nameImageMaskWidgetHQAssetHandle
{
  return self->_nameImageMaskAssetHandle;
}

- (id)nameImageLargeMaskAssetHandle
{
  return self->_nameImageMaskAssetHandle;
}

- (id)nameImageLargeAssetHandle
{
  return self->_nameImageAssetHandle;
}

- (BOOL)isBlockedExplicitContent
{
  return 0;
}

- (id)publisherPaidDescriptionStrings
{
  return 0;
}

- (unint64_t)groupingEligibility
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isRealTimeTrackingEnabled
{
  return 0;
}

- (BOOL)isArticleReadCountReportingEnabled
{
  return 0;
}

- (BOOL)isAutoDarkModeEnabled
{
  return 0;
}

- (BOOL)isInternal
{
  return 0;
}

- (BOOL)isSandbox
{
  return 0;
}

- (BOOL)isLocal
{
  return 0;
}

- (BOOL)isSensitiveTopic
{
  return 0;
}

- (BOOL)isNewspaper
{
  return 0;
}

- (BOOL)isMagazine
{
  return 0;
}

- (id)articleRecirculationConfigJSON
{
  return 0;
}

- (BOOL)publisherPaidWebAccessOptIn
{
  return 0;
}

- (id)publisherPaidWebAccessURL
{
  return 0;
}

- (id)publisherSpecifiedArticleIDs
{
  return 0;
}

- (id)publisherSpecifiedArticles
{
  return 0;
}

- (id)paidBundlePaywallConfiguration
{
  return 0;
}

- (id)publisherSpecifiedArticleIDsModifiedDate
{
  return 0;
}

- (id)replacementID
{
  return 0;
}

- (int64_t)score
{
  return 0;
}

- (id)stocksFields
{
  return 0;
}

- (double)subscriptionRate
{
  return 0.0;
}

- (id)subtitle
{
  return 0;
}

- (id)theme
{
  return self;
}

- (unint64_t)userFacingTagType
{
  return 1;
}

- (id)authorizationURL
{
  return 0;
}

- (id)feedIDForBin:(int64_t)a3
{
  return 0;
}

- (id)freeFeedIDForBin:(int64_t)a3
{
  return 0;
}

- (BOOL)isAuthenticationSetup
{
  return 0;
}

- (BOOL)isNoLongerAvailable
{
  return 0;
}

- (BOOL)isPurchaseSetup
{
  return 0;
}

- (id)paidFeedIDForBin:(int64_t)a3
{
  return 0;
}

- (id)prefetchPurchaseOffer
{
  return 0;
}

- (BOOL)isMySports
{
  return 0;
}

- (BOOL)isPuzzleHub
{
  return 0;
}

- (BOOL)hasEvergreenArticleList
{
  return 0;
}

- (id)adTargetingKeywords
{
  return 0;
}

- (id)versionKey
{
  return 0;
}

- (id)sportsRecommendationMappings
{
  return 0;
}

- (id)sportsRecommendationMappingsJSON
{
  return 0;
}

- (id)highlightsArticleListID
{
  return 0;
}

- (id)supergroupConfigJson
{
  return 0;
}

- (id)supergroupKnobs
{
  return 0;
}

- (id)supergroupKnobsJson
{
  return 0;
}

- (BOOL)useCompactNameForPersonalizedPaywall
{
  return 0;
}

- (BOOL)sponsoredFeedEligible
{
  return 0;
}

- (id)personalizedPaywallName
{
  return self->_name;
}

- (double)bannerImageScale
{
  return 1.0;
}

- (BOOL)isDark
{
  return 0;
}

- (BOOL)isWhite
{
  return 0;
}

- (FCColor)backgroundColor
{
  return 0;
}

- (FCColor)foregroundColor
{
  return 0;
}

- (FCTagBanner)defaultBannerImage
{
  FCTagBanner *v3;

  v3 = [FCTagBanner alloc];
  return -[FCTagBanner initWithAssetHandle:size:insets:](v3, "initWithAssetHandle:size:insets:", self->_nameImageAssetHandle, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), 0.0, 0.0, 0.0, 0.0);
}

- (int64_t)feedType
{
  return 0;
}

- (double)bannerImageBaselineOffsetPercentage
{
  return 0.0;
}

- (FCContentColorMap)contentColorMap
{
  return 0;
}

- (FCHeadlineTemplate)defaultHeadlineTemplate
{
  return 0;
}

- (FCTextInfo)headlineTitleTextInfo
{
  return 0;
}

- (FCTextInfo)headlineBylineTextInfo
{
  return 0;
}

- (FCTextInfo)headlineExcerptTextInfo
{
  return 0;
}

- (FCColor)darkStyleBackgroundColor
{
  return 0;
}

- (FCColor)darkStyleForegroundColor
{
  return 0;
}

- (FCColor)navigationChromeBackgroundColor
{
  return 0;
}

- (FCColor)navigationChromeSeparatorColor
{
  return 0;
}

- (FCColorGradient)navigationChromeBackgroundGradient
{
  return 0;
}

- (unint64_t)navigationChromeBackgroundImageContentMode
{
  return 0;
}

- (unint64_t)navigationChromeBackgroundImageContentModeCompact
{
  return 0;
}

- (unint64_t)navigationChromeBackgroundImageContentModeLarge
{
  return 0;
}

- (FCColor)darkStyleNavigationChromeSeparatorColor
{
  return 0;
}

- (FCColor)darkStyleNavigationChromeBackgroundColor
{
  return 0;
}

- (FCColorGradient)darkStyleNavigationChromeBackgroundGradient
{
  return 0;
}

- (BOOL)allowCustomBottomStyle
{
  return 0;
}

- (CGSize)nameImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (FCEdgeInsets)nameImageInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  FCEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (FCEdgeInsets)nameImageForDarkBackgroundInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  FCEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (FCEdgeInsets)nameImageMaskInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  FCEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (FCAssetHandle)logoImageAssetHandle
{
  void *v2;
  void *v3;

  -[FCPuzzleType defaultBannerImage](self, "defaultBannerImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCAssetHandle *)v3;
}

- (CGSize)nameImageMaskSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)nameImageForDarkBackgroundSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSArray)loadableFonts
{
  return 0;
}

- (FCColor)feedBackgroundColor
{
  return 0;
}

- (FCColor)feedControlColor
{
  return 0;
}

- (FCColorGradient)adBackgroundGradient
{
  return 0;
}

- (FCColor)adBackgroundColor
{
  return 0;
}

- (FCColorGradient)feedBackgroundGradient
{
  return 0;
}

- (FCColor)darkStyleFeedBackgroundColor
{
  return 0;
}

- (FCColor)darkStyleAdBackgroundColor
{
  return 0;
}

- (FCColorGradient)darkStyleAdBackgroundGradient
{
  return 0;
}

- (FCColorGradient)darkStyleFeedBackgroundGradient
{
  return 0;
}

- (FCColor)darkStyleFeedControlColor
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)engineResourceID
{
  return self->_engineResourceID;
}

- (id)superfeedConfigResourceID
{
  return self->_superfeedConfigResourceID;
}

- (NSArray)promotedPuzzleIDs
{
  return self->_promotedPuzzleIDs;
}

- (NSArray)latestPuzzleIDs
{
  return self->_latestPuzzleIDs;
}

- (FCAssetHandle)nameImageAssetHandle
{
  return self->_nameImageAssetHandle;
}

- (FCAssetHandle)nameImageCompactAssetHandle
{
  return self->_nameImageCompactAssetHandle;
}

- (FCAssetHandle)nameImageForDarkBackgroundAssetHandle
{
  return self->_nameImageForDarkBackgroundAssetHandle;
}

- (FCAssetHandle)nameImageMaskAssetHandle
{
  return self->_nameImageMaskAssetHandle;
}

- (FCAssetHandle)feedNavImageAssetHandle
{
  return self->_feedNavImageAssetHandle;
}

- (id)feedNavImageHQAssetHandle
{
  return self->_feedNavImageHQAssetHandle;
}

- (FCAssetHandle)coverImageAssetHandle
{
  return self->_coverImageAssetHandle;
}

- (FCAssetHandle)navigationChromeBackgroundImage
{
  return self->_navigationChromeBackgroundImage;
}

- (FCAssetHandle)navigationChromeBackgroundImageCompact
{
  return self->_navigationChromeBackgroundImageCompact;
}

- (FCAssetHandle)navigationChromeBackgroundImageLarge
{
  return self->_navigationChromeBackgroundImageLarge;
}

- (FCAssetHandle)darkStyleNavigationChromeBackgroundImage
{
  return self->_darkStyleNavigationChromeBackgroundImage;
}

- (FCAssetHandle)darkStyleNavigationChromeBackgroundImageCompact
{
  return self->_darkStyleNavigationChromeBackgroundImageCompact;
}

- (FCAssetHandle)darkStyleNavigationChromeBackgroundImageLarge
{
  return self->_darkStyleNavigationChromeBackgroundImageLarge;
}

- (id)language
{
  return self->_language;
}

- (id)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (id)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (id)loadDate
{
  return self->_loadDate;
}

- (id)fetchDate
{
  return self->_fetchDate;
}

- (id)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (FCAssetHandle)exploreTileImageAssetHandle
{
  return self->_exploreTileImageAssetHandle;
}

- (FCColor)themeColor
{
  return self->_themeColor;
}

- (FCColor)puzzlePrimaryColor
{
  return self->_puzzlePrimaryColor;
}

- (FCColor)darkStyleThemeColor
{
  return self->_darkStyleThemeColor;
}

- (FCColor)darkStylePuzzlePrimaryColor
{
  return self->_darkStylePuzzlePrimaryColor;
}

- (id)groupTitleColor
{
  return self->_groupTitleColor;
}

- (id)groupDarkStyleTitleColor
{
  return self->_groupDarkStyleTitleColor;
}

- (id)titleDisplayPrefix
{
  return self->_titleDisplayPrefix;
}

- (void)setTitleDisplayPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (id)titleDisplaySuffix
{
  return self->_titleDisplaySuffix;
}

- (void)setTitleDisplaySuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (FCPuzzleTypeThumbnailDirectoryType)thumbnailDirectory
{
  return self->_thumbnailDirectory;
}

- (BOOL)disableBlock
{
  return self->_disableBlock;
}

- (BOOL)disableFollow
{
  return self->_disableFollow;
}

- (NSString)feedMastheadType
{
  return self->_feedMastheadType;
}

- (NSString)imageResourceID
{
  return self->_imageResourceID;
}

- (NSDictionary)navigationBarThemeByRankID
{
  return self->_navigationBarThemeByRankID;
}

- (NSArray)orderedNavigationBarThemes
{
  return self->_orderedNavigationBarThemes;
}

- (NTPBPuzzleTypeRecord)puzzleTypeRecord
{
  return self->_puzzleTypeRecord;
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_puzzleTypeRecord, 0);
  objc_storeStrong((id *)&self->_orderedNavigationBarThemes, 0);
  objc_storeStrong((id *)&self->_navigationBarThemeByRankID, 0);
  objc_storeStrong((id *)&self->_imageResourceID, 0);
  objc_storeStrong((id *)&self->_feedMastheadType, 0);
  objc_storeStrong((id *)&self->_thumbnailDirectory, 0);
  objc_storeStrong((id *)&self->_titleDisplaySuffix, 0);
  objc_storeStrong((id *)&self->_titleDisplayPrefix, 0);
  objc_storeStrong((id *)&self->_versionKey, 0);
  objc_storeStrong((id *)&self->_groupDarkStyleTitleColor, 0);
  objc_storeStrong((id *)&self->_groupTitleColor, 0);
  objc_storeStrong((id *)&self->_darkStylePuzzlePrimaryColor, 0);
  objc_storeStrong((id *)&self->_darkStyleThemeColor, 0);
  objc_storeStrong((id *)&self->_puzzlePrimaryColor, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_exploreTileImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_loadDate, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundImageLarge, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundImageCompact, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundImage, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundImageLarge, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundImageCompact, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundImage, 0);
  objc_storeStrong((id *)&self->_coverImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_feedNavImageHQAssetHandle, 0);
  objc_storeStrong((id *)&self->_feedNavImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageMaskAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageForDarkBackgroundAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageCompactAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_latestPuzzleIDs, 0);
  objc_storeStrong((id *)&self->_promotedPuzzleIDs, 0);
  objc_storeStrong((id *)&self->_superfeedConfigResourceID, 0);
  objc_storeStrong((id *)&self->_engineResourceID, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
