@implementation FCPuzzle

- (FCPuzzle)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 puzzleDescription:(id)a6 puzzleType:(id)a7 dataResourceID:(id)a8 authors:(id)a9 publishDate:(id)a10 isPaid:(BOOL)a11 difficulty:(int64_t)a12 difficultyDescription:(id)a13 thumbnailSmallImageAssetHandle:(id)a14 thumbnailLargeImageAssetHandle:(id)a15 loadDate:(id)a16 teaserClue:(id)a17 teaserAnswer:(id)a18 teaserInfo:(id)a19 teaserDirection:(id)a20 teaserNumber:(id)a21 language:(id)a22 blockedStorefrontIDs:(id)a23 allowedStorefrontIDs:(id)a24 minimumNewsVersion:(int64_t)a25 showInfoModalOnFirstPlay:(BOOL)a26 ignoreFromStatsAndStreaks:(BOOL)a27 isDeprecated:(BOOL)a28 isDraft:(BOOL)a29 lastModifiedDate:(id)a30
{
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  FCPuzzle *v44;
  FCPuzzle *v45;
  FCPuzzle *v46;
  FCPuzzle *v47;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  objc_super v70;

  v69 = a3;
  v50 = a4;
  v68 = a4;
  v51 = a5;
  v67 = a5;
  v52 = a6;
  v66 = a6;
  v53 = a7;
  v35 = a7;
  v54 = a8;
  v64 = a8;
  v63 = a9;
  v62 = a10;
  v61 = a13;
  v60 = a14;
  v59 = a15;
  v58 = a16;
  v57 = a17;
  v56 = a18;
  v36 = a19;
  v37 = a20;
  v38 = a21;
  v39 = a22;
  v40 = a23;
  v41 = a24;
  v42 = a30;
  v43 = objc_msgSend(v69, "length");
  v44 = 0;
  v65 = v35;
  if (v35 && v43)
  {
    v70.receiver = self;
    v70.super_class = (Class)FCPuzzle;
    v45 = -[FCPuzzle init](&v70, sel_init);
    v46 = v45;
    if (v45)
    {
      objc_storeStrong((id *)&v45->_identifier, a3);
      objc_storeStrong((id *)&v46->_title, v50);
      objc_storeStrong((id *)&v46->_subtitle, v51);
      objc_storeStrong((id *)&v46->_puzzleDescription, v52);
      objc_storeStrong((id *)&v46->_puzzleType, v53);
      objc_storeStrong((id *)&v46->_dataResourceID, v54);
      objc_storeStrong((id *)&v46->_authors, a9);
      objc_storeStrong((id *)&v46->_publishDate, a10);
      v46->_paid = a11;
      v46->_difficulty = a12;
      objc_storeStrong((id *)&v46->_difficultyDescription, a13);
      objc_storeStrong((id *)&v46->_thumbnailSmallImageAssetHandle, a14);
      objc_storeStrong((id *)&v46->_thumbnailLargeImageAssetHandle, a15);
      objc_storeStrong((id *)&v46->_loadDate, a16);
      objc_storeStrong((id *)&v46->_teaserClue, a17);
      objc_storeStrong((id *)&v46->_teaserAnswer, a18);
      objc_storeStrong((id *)&v46->_teaserInfo, a19);
      objc_storeStrong((id *)&v46->_teaserDirection, a20);
      objc_storeStrong((id *)&v46->_teaserNumber, a21);
      objc_storeStrong((id *)&v46->_language, a22);
      objc_storeStrong((id *)&v46->_blockedStorefrontIDs, a23);
      objc_storeStrong((id *)&v46->_allowedStorefrontIDs, a24);
      v46->_minimumNewsVersion = a25;
      v46->_showInfoModalOnFirstPlay = a26;
      v46->_ignoreFromStatsAndStreaks = a27;
      v46->_deprecated = a28;
      v46->_draft = a29;
      objc_storeStrong((id *)&v46->_lastModifiedDate, a30);
    }
    v47 = v46;
    v44 = v47;
  }
  else
  {
    v47 = self;
  }

  return v44;
}

- (FCPuzzle)initWithPuzzleRecord:(id)a3 puzzleType:(id)a4 assetManager:(id)a5 interestToken:(id)a6 difficultyDescriptions:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  FCPuzzle *v19;
  uint64_t v20;
  NSDate *loadDate;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSString *title;
  void *v26;
  uint64_t v27;
  NSString *subtitle;
  uint64_t v29;
  NSString *puzzleDescription;
  uint64_t v31;
  NSString *dataResourceID;
  uint64_t v33;
  NSArray *authors;
  void *v35;
  void *v36;
  uint64_t v37;
  NSDate *publishDate;
  void *v39;
  uint64_t v40;
  void *v41;
  __CFString *v42;
  void *v43;
  uint64_t v44;
  FCAssetHandle *thumbnailSmallImageAssetHandle;
  uint64_t v46;
  FCAssetHandle *thumbnailLargeImageAssetHandle;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSString *teaserClue;
  uint64_t v54;
  NSString *teaserAnswer;
  uint64_t v56;
  NSString *teaserInfo;
  uint64_t v58;
  NSString *teaserDirection;
  uint64_t v60;
  NSString *teaserNumber;
  uint64_t v62;
  NSString *language;
  uint64_t v64;
  NSArray *blockedStorefrontIDs;
  uint64_t v66;
  NSArray *allowedStorefrontIDs;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  NSDate *lastModifiedDate;
  void *v74;
  void *context;
  id v76;
  objc_super v77;
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v76 = a6;
  v16 = a7;
  objc_msgSend(v13, "base");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier != 0");
    *(_DWORD *)buf = 136315906;
    v79 = "-[FCPuzzle initWithPuzzleRecord:puzzleType:assetManager:interestToken:difficultyDescriptions:]";
    v80 = 2080;
    v81 = "FCPuzzle.m";
    v82 = 1024;
    v83 = 135;
    v84 = 2114;
    v85 = v74;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v77.receiver = self;
  v77.super_class = (Class)FCPuzzle;
  v19 = -[FCPuzzle init](&v77, sel_init);
  if (v19)
  {
    if (objc_msgSend(v18, "length"))
    {
      context = (void *)MEMORY[0x1A8580B64]();
      objc_storeStrong((id *)&v19->_puzzleRecord, a3);
      objc_storeStrong((id *)&v19->_interestToken, a6);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = objc_claimAutoreleasedReturnValue();
      loadDate = v19->_loadDate;
      v19->_loadDate = (NSDate *)v20;

      v22 = objc_msgSend(v18, "copy");
      identifier = v19->_identifier;
      v19->_identifier = (NSString *)v22;

      objc_msgSend(v13, "title");
      v24 = objc_claimAutoreleasedReturnValue();
      title = v19->_title;
      v19->_title = (NSString *)v24;

      objc_msgSend(v13, "subtitle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "length"))
      {
        objc_msgSend(v13, "subtitle");
        v27 = objc_claimAutoreleasedReturnValue();
        subtitle = v19->_subtitle;
        v19->_subtitle = (NSString *)v27;
      }
      else
      {
        subtitle = v19->_subtitle;
        v19->_subtitle = 0;
      }

      objc_msgSend(v13, "puzzleDescription");
      v29 = objc_claimAutoreleasedReturnValue();
      puzzleDescription = v19->_puzzleDescription;
      v19->_puzzleDescription = (NSString *)v29;

      objc_storeStrong((id *)&v19->_puzzleType, a4);
      objc_msgSend(v13, "dataResourceID");
      v31 = objc_claimAutoreleasedReturnValue();
      dataResourceID = v19->_dataResourceID;
      v19->_dataResourceID = (NSString *)v31;

      v19->_paid = objc_msgSend(v13, "isPaid");
      objc_msgSend(v13, "authors");
      v33 = objc_claimAutoreleasedReturnValue();
      authors = v19->_authors;
      v19->_authors = (NSArray *)v33;

      v35 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v13, "publishedDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dateWithPBDate:", v36);
      v37 = objc_claimAutoreleasedReturnValue();
      publishDate = v19->_publishDate;
      v19->_publishDate = (NSDate *)v37;

      v19->_difficulty = objc_msgSend(v13, "difficultyLevel");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "difficultyLevel"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fc_safeObjectForKey:", v39);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v40;
      if (v40)
        v42 = (__CFString *)v40;
      else
        v42 = &stru_1E464BC40;
      objc_storeStrong((id *)&v19->_difficultyDescription, v42);

      objc_msgSend(v14, "thumbnailDirectory");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "smallThumbnailForDate:", v19->_publishDate);
      v44 = objc_claimAutoreleasedReturnValue();
      thumbnailSmallImageAssetHandle = v19->_thumbnailSmallImageAssetHandle;
      v19->_thumbnailSmallImageAssetHandle = (FCAssetHandle *)v44;

      objc_msgSend(v13, "generateThumbnailLargeImageAssetHandleWithAssetManager:", v15);
      v46 = objc_claimAutoreleasedReturnValue();
      thumbnailLargeImageAssetHandle = v19->_thumbnailLargeImageAssetHandle;
      v19->_thumbnailLargeImageAssetHandle = (FCAssetHandle *)v46;

      objc_msgSend(v13, "teaserConfiguration");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "dataUsingEncoding:", 4);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v49, 0, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("interactiveClue"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("clue"));
        v52 = objc_claimAutoreleasedReturnValue();
        teaserClue = v19->_teaserClue;
        v19->_teaserClue = (NSString *)v52;

        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("answer"));
        v54 = objc_claimAutoreleasedReturnValue();
        teaserAnswer = v19->_teaserAnswer;
        v19->_teaserAnswer = (NSString *)v54;

        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("hint"));
        v56 = objc_claimAutoreleasedReturnValue();
        teaserInfo = v19->_teaserInfo;
        v19->_teaserInfo = (NSString *)v56;

        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("direction"));
        v58 = objc_claimAutoreleasedReturnValue();
        teaserDirection = v19->_teaserDirection;
        v19->_teaserDirection = (NSString *)v58;

        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("number"));
        v60 = objc_claimAutoreleasedReturnValue();
        teaserNumber = v19->_teaserNumber;
        v19->_teaserNumber = (NSString *)v60;

      }
      objc_msgSend(v13, "language");
      v62 = objc_claimAutoreleasedReturnValue();
      language = v19->_language;
      v19->_language = (NSString *)v62;

      objc_msgSend(v13, "blockedStorefrontIDs");
      v64 = objc_claimAutoreleasedReturnValue();
      blockedStorefrontIDs = v19->_blockedStorefrontIDs;
      v19->_blockedStorefrontIDs = (NSArray *)v64;

      objc_msgSend(v13, "allowedStorefrontIDs");
      v66 = objc_claimAutoreleasedReturnValue();
      allowedStorefrontIDs = v19->_allowedStorefrontIDs;
      v19->_allowedStorefrontIDs = (NSArray *)v66;

      v19->_minimumNewsVersion = objc_msgSend(v13, "minimumNewsVersion");
      v19->_showInfoModalOnFirstPlay = objc_msgSend(v13, "behaviorFlags") & 1;
      v19->_ignoreFromStatsAndStreaks = (objc_msgSend(v13, "behaviorFlags") & 2) != 0;
      v19->_behaviorFlags = objc_msgSend(v13, "behaviorFlags");
      v19->_deprecated = objc_msgSend(v13, "isDeprecated");
      v19->_draft = objc_msgSend(v13, "isDraft");
      v68 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v13, "base");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "modificationDate");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "dateWithPBDate:", v70);
      v71 = objc_claimAutoreleasedReturnValue();
      lastModifiedDate = v19->_lastModifiedDate;
      v19->_lastModifiedDate = (NSDate *)v71;

      objc_autoreleasePoolPop(context);
    }
    else
    {

      v19 = 0;
    }
  }

  return v19;
}

- (FCPuzzle)initWithPuzzle:(id)a3 overrides:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  char v34;
  FCPuzzle *v36;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(v5, "title");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "subtitle");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(v5, "subtitle");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "puzzleDescription");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(v5, "puzzleDescription");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "puzzleType");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataResourceID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "author");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_msgSend(v6, "author");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "authors");
    v14 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v14;
  }
  v50 = (void *)v14;
  objc_msgSend(v5, "publishDate");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v5, "isPaid");
  v33 = objc_msgSend(v5, "difficulty");
  objc_msgSend(v5, "difficultyDescription");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thumbnailSmallImageAssetHandle");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thumbnailLargeImageAssetHandle");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadDate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "teaserClue");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v54;
  if (!v54)
  {
    objc_msgSend(v5, "teaserClue");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "teaserAnswer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v53;
  if (!v53)
  {
    objc_msgSend(v5, "teaserAnswer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "teaserInfo");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v52;
  if (!v52)
  {
    objc_msgSend(v5, "teaserInfo");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v12;
  objc_msgSend(v6, "teaserDirection");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v51;
  if (!v51)
  {
    objc_msgSend(v5, "teaserDirection");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v13;
  v41 = (void *)v11;
  v42 = (void *)v10;
  v49 = (void *)v9;
  v43 = (void *)v8;
  v44 = (void *)v7;
  v45 = v6;
  objc_msgSend(v6, "teaserNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(v5, "teaserNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "language");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockedStorefrontIDs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allowedStorefrontIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v5, "minimumNewsVersion");
  v19 = objc_msgSend(v5, "showInfoModalOnFirstPlay");
  v20 = objc_msgSend(v5, "ignoreFromStatsAndStreaks");
  v21 = objc_msgSend(v5, "isDeprecated");
  v22 = objc_msgSend(v5, "isDraft");
  objc_msgSend(v5, "lastModifiedDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE3(v29) = v22;
  BYTE2(v29) = v21;
  BYTE1(v29) = v20;
  LOBYTE(v29) = v19;
  LOBYTE(v28) = v34;
  v36 = -[FCPuzzle initWithIdentifier:title:subtitle:puzzleDescription:puzzleType:dataResourceID:authors:publishDate:isPaid:difficulty:difficultyDescription:thumbnailSmallImageAssetHandle:thumbnailLargeImageAssetHandle:loadDate:teaserClue:teaserAnswer:teaserInfo:teaserDirection:teaserNumber:language:blockedStorefrontIDs:allowedStorefrontIDs:minimumNewsVersion:showInfoModalOnFirstPlay:ignoreFromStatsAndStreaks:isDeprecated:isDraft:lastModifiedDate:](self, "initWithIdentifier:title:subtitle:puzzleDescription:puzzleType:dataResourceID:authors:publishDate:isPaid:difficulty:difficultyDescription:thumbnailSmallImageAssetHandle:thumbnailLargeImageAssetHandle:loadDate:teaserClue:teaserAnswer:teaserInfo:teaserDirection:teaserNumber:language:blockedStorefrontIDs:allowedStorefrontIDs:minimumNewsVersion:showInfoModalOnFirstPlay:ignoreFromStatsAndStreaks:isDeprecated:isDraft:lastModifiedDate:", v44, v49, v41, v39, v61, v60, v50, v59, v28, v33, v58, v57, v56, v55,
          v54,
          v53,
          v52,
          v51,
          v16,
          v31,
          v30,
          v17,
          v18,
          v29,
          v23);

  if (!v15)
  if (!v32)

  v24 = v46;
  if (!v46)
  {

    v24 = 0;
  }

  v25 = v47;
  if (!v47)
  {

    v25 = 0;
  }

  v26 = v48;
  if (!v48)
  {

    v26 = 0;
  }

  if (v38)
  if (!v40)

  if (!v42)
  if (!v43)

  return v36;
}

- (NSString)publishDateString
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)publishDateString_dateFormatter;
  if (!publishDateString_dateFormatter)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = (void *)publishDateString_dateFormatter;
    publishDateString_dateFormatter = (uint64_t)v4;

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("EST"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)publishDateString_dateFormatter, "setTimeZone:", v6);

    objc_msgSend((id)publishDateString_dateFormatter, "setDateFormat:", CFSTR("EEEE, MMM d, yyyy"));
    v3 = (void *)publishDateString_dateFormatter;
  }
  -[FCPuzzle publishDate](self, "publishDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (FCContentArchive)contentArchive
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__FCPuzzle_contentArchive__block_invoke;
  v5[3] = &unk_1E463AA30;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentArchive *)v3;
}

void __26__FCPuzzle_contentArchive__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "puzzleRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithRecord:](FCContentArchive, "archiveWithRecord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "puzzleType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE666C30))
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v11 = v9;

  objc_msgSend(v11, "contentArchive");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v10);

}

- (FCContentManifest)contentManifest
{
  FCContentManifest *v3;
  void *v4;
  FCContentManifest *v5;
  _QWORD v7[5];

  v3 = [FCContentManifest alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__FCPuzzle_contentManifest__block_invoke;
  v7[3] = &unk_1E463AA30;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCContentManifest initWithManifests:](v3, "initWithManifests:", v4);

  return v5;
}

void __27__FCPuzzle_contentManifest__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "puzzleRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentManifest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "puzzleType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE666C30))
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v12 = v10;

  objc_msgSend(v12, "contentManifest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v11);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)puzzleDescription
{
  return self->_puzzleDescription;
}

- (FCPuzzleTypeProviding)puzzleType
{
  return self->_puzzleType;
}

- (NSArray)authors
{
  return self->_authors;
}

- (NSString)dataResourceID
{
  return self->_dataResourceID;
}

- (int64_t)difficulty
{
  return self->_difficulty;
}

- (NSString)difficultyDescription
{
  return self->_difficultyDescription;
}

- (BOOL)isPaid
{
  return self->_paid;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (FCAssetHandle)thumbnailSmallImageAssetHandle
{
  return self->_thumbnailSmallImageAssetHandle;
}

- (FCAssetHandle)thumbnailLargeImageAssetHandle
{
  return self->_thumbnailLargeImageAssetHandle;
}

- (NSArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (NSArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSString)language
{
  return self->_language;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSDate)loadDate
{
  return self->_loadDate;
}

- (BOOL)showInfoModalOnFirstPlay
{
  return self->_showInfoModalOnFirstPlay;
}

- (BOOL)ignoreFromStatsAndStreaks
{
  return self->_ignoreFromStatsAndStreaks;
}

- (BOOL)isDeprecated
{
  return self->_deprecated;
}

- (BOOL)isDraft
{
  return self->_draft;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (unint64_t)behaviorFlags
{
  return self->_behaviorFlags;
}

- (NSString)teaserClue
{
  return self->_teaserClue;
}

- (NSString)teaserAnswer
{
  return self->_teaserAnswer;
}

- (NSString)teaserInfo
{
  return self->_teaserInfo;
}

- (NSString)teaserNumber
{
  return self->_teaserNumber;
}

- (NSString)teaserDirection
{
  return self->_teaserDirection;
}

- (NTPBPuzzleRecord)puzzleRecord
{
  return self->_puzzleRecord;
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_puzzleRecord, 0);
  objc_storeStrong((id *)&self->_teaserDirection, 0);
  objc_storeStrong((id *)&self->_teaserNumber, 0);
  objc_storeStrong((id *)&self->_teaserInfo, 0);
  objc_storeStrong((id *)&self->_teaserAnswer, 0);
  objc_storeStrong((id *)&self->_teaserClue, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_loadDate, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_thumbnailLargeImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_thumbnailSmallImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_difficultyDescription, 0);
  objc_storeStrong((id *)&self->_dataResourceID, 0);
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_puzzleType, 0);
  objc_storeStrong((id *)&self->_puzzleDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
