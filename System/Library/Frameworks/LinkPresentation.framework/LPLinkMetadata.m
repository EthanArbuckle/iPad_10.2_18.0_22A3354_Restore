@implementation LPLinkMetadata

- (LPLinkMetadata)init
{
  LPLinkMetadata *v2;
  LPLinkMetadata *v3;
  LPLinkMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPLinkMetadata;
  v2 = -[LPLinkMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v4 = v2;
  }

  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  id v4;
  LPLinkMetadata *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *summary;
  uint64_t v12;
  NSString *selectedText;
  uint64_t v14;
  NSString *siteName;
  uint64_t v16;
  NSString *itemType;
  uint64_t v18;
  NSURL *relatedURL;
  uint64_t v20;
  NSString *creator;
  uint64_t v22;
  NSString *creatorFacebookProfile;
  uint64_t v24;
  NSString *creatorTwitterUsername;
  uint64_t v26;
  NSString *twitterCard;
  void *v28;
  uint64_t v29;
  NSString *appleContentID;
  uint64_t v31;
  NSString *appleSummary;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  LPImageMetadata *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  LPAssociatedApplicationMetadata *v72;
  LPAssociatedApplicationMetadata *associatedApplication;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  LPProductMetadata *v79;
  LPProductMetadata *product;
  LPLinkMetadata *v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  LPLinkMetadata *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id obj;
  id v97;
  id v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  const __CFString *v134;
  uint64_t v135;
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v90 = v4;
  v5 = -[LPLinkMetadata init](self, "init");
  v91 = v5;
  if (!v5)
    goto LABEL_79;
  URLForKey(v4, (uint64_t)CFSTR("LPMetadataURL"));
  v6 = objc_claimAutoreleasedReturnValue();
  URL = v5->_URL;
  v5->_URL = (NSURL *)v6;

  stringForKey(v4, CFSTR("LPMetadataTitle"));
  v8 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v8;

  stringForKey(v4, CFSTR("LPMetadataDescription"));
  v10 = objc_claimAutoreleasedReturnValue();
  summary = v5->_summary;
  v5->_summary = (NSString *)v10;

  stringForKey(v4, CFSTR("LPMetadataSelectedText"));
  v12 = objc_claimAutoreleasedReturnValue();
  selectedText = v5->_selectedText;
  v5->_selectedText = (NSString *)v12;

  stringForKey(v4, CFSTR("LPMetadataSiteName"));
  v14 = objc_claimAutoreleasedReturnValue();
  siteName = v5->_siteName;
  v5->_siteName = (NSString *)v14;

  stringForKey(v4, CFSTR("LPMetadataItemType"));
  v16 = objc_claimAutoreleasedReturnValue();
  itemType = v5->_itemType;
  v5->_itemType = (NSString *)v16;

  URLForKey(v4, (uint64_t)CFSTR("LPMetadataRelatedURL"));
  v18 = objc_claimAutoreleasedReturnValue();
  relatedURL = v5->_relatedURL;
  v5->_relatedURL = (NSURL *)v18;

  stringForKey(v4, CFSTR("LPMetadataCreator"));
  v20 = objc_claimAutoreleasedReturnValue();
  creator = v5->_creator;
  v5->_creator = (NSString *)v20;

  stringForKey(v4, CFSTR("LPMetadataCreatorFacebookProfile"));
  v22 = objc_claimAutoreleasedReturnValue();
  creatorFacebookProfile = v5->_creatorFacebookProfile;
  v5->_creatorFacebookProfile = (NSString *)v22;

  stringForKey(v4, CFSTR("LPMetadataCreatorTwitterUsername"));
  v24 = objc_claimAutoreleasedReturnValue();
  creatorTwitterUsername = v5->_creatorTwitterUsername;
  v5->_creatorTwitterUsername = (NSString *)v24;

  stringForKey(v4, CFSTR("LPMetadataTwitterCard"));
  v26 = objc_claimAutoreleasedReturnValue();
  twitterCard = v5->_twitterCard;
  v5->_twitterCard = (NSString *)v26;

  numberForKey(v4, (uint64_t)CFSTR("LPMetadataUsesActivityPub"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_usesActivityPub = objc_msgSend(v28, "BOOLValue");

  stringForKey(v4, CFSTR("LPMetadataAppleContentID"));
  v29 = objc_claimAutoreleasedReturnValue();
  appleContentID = v5->_appleContentID;
  v5->_appleContentID = (NSString *)v29;

  stringForKey(v4, CFSTR("LPMetadataAppleDescription"));
  v31 = objc_claimAutoreleasedReturnValue();
  appleSummary = v5->_appleSummary;
  v5->_appleSummary = (NSString *)v31;

  arrayOfStringsForKey(v4, (uint64_t)CFSTR("LPMetadataIcons"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v89;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v137, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v126;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v126 != v34)
          objc_enumerationMutation(obj);
        URLFromStringIfHTTPFamily(*(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * v35));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v37 = -[LPIconMetadata _initWithURL:]([LPIconMetadata alloc], "_initWithURL:", v36);
          if (v37)
            objc_msgSend(v92, "addObject:", v37);

        }
        ++v35;
      }
      while (v33 != v35);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v137, 16);
    }
    while (v33);
  }

  objc_storeStrong((id *)&v91->_icons, v92);
  arrayOfStringsForKey(v90, (uint64_t)CFSTR("LPMetadataContentImages"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v100 = (id)objc_claimAutoreleasedReturnValue();
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v95 = v88;
  v38 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v121, v136, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v122;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v122 != v39)
          objc_enumerationMutation(v95);
        v41 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * v40);
        v42 = [LPImageMetadata alloc];
        v134 = CFSTR("LPMetadataImageURL");
        v135 = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[LPImageMetadata _initWithDictionary:](v42, "_initWithDictionary:", v43);

        if (v44)
          objc_msgSend(v100, "addObject:", v44);

        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v121, v136, 16);
    }
    while (v38);
  }

  objc_storeStrong((id *)&v91->_contentImagesMetadata, v100);
  arrayOfDictionariesForKey(v90, (uint64_t)CFSTR("LPMetadataImages"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v94 = v87;
  v45 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v118;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v118 != v46)
          objc_enumerationMutation(v94);
        v48 = -[LPImageMetadata _initWithDictionary:]([LPImageMetadata alloc], "_initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * v47));
        if (v48)
          objc_msgSend(v99, "addObject:", v48);

        ++v47;
      }
      while (v45 != v47);
      v45 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
    }
    while (v45);
  }

  objc_storeStrong((id *)&v91->_images, v99);
  arrayOfDictionariesForKey(v90, (uint64_t)CFSTR("LPMetadataVideos"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v93 = v86;
  v49 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v114;
    do
    {
      v51 = 0;
      do
      {
        if (*(_QWORD *)v114 != v50)
          objc_enumerationMutation(v93);
        v52 = -[LPVideoMetadata _initWithDictionary:]([LPVideoMetadata alloc], "_initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * v51));
        if (v52)
          objc_msgSend(v98, "addObject:", v52);

        ++v51;
      }
      while (v49 != v51);
      v49 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
    }
    while (v49);
  }

  objc_storeStrong((id *)&v91->_videos, v98);
  arrayOfDictionariesForKey(v90, (uint64_t)CFSTR("LPMetadataStreamingVideos"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v53 = v85;
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
  if (v54)
  {
    v55 = *(_QWORD *)v110;
    do
    {
      v56 = 0;
      do
      {
        if (*(_QWORD *)v110 != v55)
          objc_enumerationMutation(v53);
        v57 = -[LPVideoMetadata _initWithDictionary:]([LPVideoMetadata alloc], "_initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * v56));
        if (v57)
          objc_msgSend(v97, "addObject:", v57);

        ++v56;
      }
      while (v54 != v56);
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
    }
    while (v54);
  }

  objc_storeStrong((id *)&v91->_streamingVideos, v97);
  arrayOfDictionariesForKey(v90, (uint64_t)CFSTR("LPMetadataAudios"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v59 = v84;
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
  if (v60)
  {
    v61 = *(_QWORD *)v106;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v106 != v61)
          objc_enumerationMutation(v59);
        v63 = -[LPAudioMetadata _initWithDictionary:]([LPAudioMetadata alloc], "_initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * v62));
        if (v63)
          objc_msgSend(v58, "addObject:", v63);

        ++v62;
      }
      while (v60 != v62);
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
    }
    while (v60);
  }

  objc_storeStrong((id *)&v91->_audios, v58);
  arrayOfDictionariesForKey(v90, (uint64_t)CFSTR("LPMetadataARAssets"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v65 = v83;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v101, v129, 16, v83, v84, v85, v86, v87);
  if (v66)
  {
    v67 = *(_QWORD *)v102;
    do
    {
      v68 = 0;
      do
      {
        if (*(_QWORD *)v102 != v67)
          objc_enumerationMutation(v65);
        v69 = -[LPARAssetMetadata _initWithDictionary:]([LPARAssetMetadata alloc], "_initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v68));
        if (v69)
          objc_msgSend(v64, "addObject:", v69);

        ++v68;
      }
      while (v66 != v68);
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v101, v129, 16);
    }
    while (v66);
  }

  objc_storeStrong((id *)&v91->_arAssets, v64);
  v70 = v90;
  objc_msgSend(v90, "objectForKey:", CFSTR("LPMetadataAssociatedApplication"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v71, "count"))
  {
    v74 = v71;
    v71 = 0;
    goto LABEL_72;
  }
  if (v71)
  {
    v72 = objc_alloc_init(LPAssociatedApplicationMetadata);
    associatedApplication = v91->_associatedApplication;
    v91->_associatedApplication = v72;

    stringForKey(v71, CFSTR("app-clip-bundle-id"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAssociatedApplicationMetadata setBundleIdentifier:](v91->_associatedApplication, "setBundleIdentifier:", v74);
LABEL_72:

    v70 = v90;
  }
  stringForKey(v70, CFSTR("LPMetadataProduct"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  arrayOfDictionariesForKey(v70, (uint64_t)CFSTR("LPMetadataProductPrices"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v78 = v77;
  if (v75)
    objc_msgSend(v77, "setObject:forKeyedSubscript:", v75, CFSTR("LPMetadataProductPluralTitle"));
  if (v76 && objc_msgSend(v76, "count"))
    objc_msgSend(v78, "setObject:forKeyedSubscript:", v76, CFSTR("LPMetadataProductPrices"));
  v79 = -[LPProductMetadata _initWithDictionary:]([LPProductMetadata alloc], "_initWithDictionary:", v78);
  product = v91->_product;
  v91->_product = v79;

  v81 = v91;
  v4 = v90;
LABEL_79:

  return v91;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPLinkMetadata)initWithCoder:(id)a3
{
  id v4;
  LPLinkMetadata *v5;
  uint64_t v6;
  NSURL *originalURL;
  uint64_t v8;
  NSURL *URL;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *originalTitle;
  uint64_t v14;
  NSString *summary;
  uint64_t v16;
  NSString *selectedText;
  uint64_t v18;
  NSString *siteName;
  uint64_t v20;
  NSString *itemType;
  uint64_t v22;
  NSURL *relatedURL;
  uint64_t v24;
  NSString *creator;
  uint64_t v26;
  NSString *creatorFacebookProfile;
  uint64_t v28;
  NSString *creatorTwitterUsername;
  uint64_t v30;
  NSString *twitterCard;
  uint64_t v32;
  NSString *appleContentID;
  uint64_t v34;
  NSString *appleSummary;
  uint64_t v36;
  UIColor *themeColor;
  void *v38;
  uint64_t v39;
  LPIconMetadata *iconMetadata;
  void *v41;
  void *v42;
  uint64_t v43;
  LPImageMetadata *imageMetadata;
  uint64_t v45;
  NSArray *contentImages;
  uint64_t v47;
  NSArray *contentImagesMetadata;
  void *v49;
  uint64_t v50;
  LPVideoMetadata *videoMetadata;
  void *v52;
  uint64_t v53;
  LPAudioMetadata *audioMetadata;
  void *v55;
  uint64_t v56;
  LPARAssetMetadata *arAssetMetadata;
  uint64_t v58;
  NSArray *icons;
  uint64_t v60;
  NSArray *images;
  uint64_t v62;
  NSArray *videos;
  uint64_t v64;
  NSArray *streamingVideos;
  uint64_t v66;
  NSArray *audios;
  uint64_t v68;
  NSArray *arAssets;
  uint64_t v70;
  LPAssociatedApplicationMetadata *associatedApplication;
  uint64_t v72;
  LPSourceApplicationMetadata *sourceApplication;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  LPProductMetadata *product;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  TUConversationActivity *conversationActivity;
  void *v83;
  id v84;
  uint64_t v85;
  _SWCollaborationMetadata *collaborationMetadata;
  void *v87;
  uint64_t v88;
  id v89;
  LPSpecializationMetadata *specialization;
  NSObject *v91;
  void *v92;
  uint64_t v93;
  id v94;
  LPSpecializationMetadata *v95;
  NSObject *v96;
  LPLinkMetadata *v97;
  void *v98;
  void *v99;
  void *v100;
  id v102;
  id v103;
  objc_super v104;
  _QWORD v105[5];
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD v116[2];

  v116[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)LPLinkMetadata;
  v5 = -[LPLinkMetadata init](&v104, sel_init);
  if (!v5)
    goto LABEL_29;
  v5->_version = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version"));
  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEncodedForLocalUse"))
    && objc_msgSend(v4, "_lp_coderType") != 1)
  {
    v98 = (void *)MEMORY[0x1E0CB35C8];
    v115 = *MEMORY[0x1E0CB2938];
    v116[0] = CFSTR("Attemping to decode LPLinkMetadata intended for local only use.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, &v115, 1);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v100);

LABEL_29:
    v97 = 0;
    goto LABEL_30;
  }
  v5->_incomplete = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isIncomplete"));
  decodeURLForKey(v4, CFSTR("originalURL"));
  v6 = objc_claimAutoreleasedReturnValue();
  originalURL = v5->_originalURL;
  v5->_originalURL = (NSURL *)v6;

  decodeURLForKey(v4, CFSTR("URL"));
  v8 = objc_claimAutoreleasedReturnValue();
  URL = v5->_URL;
  v5->_URL = (NSURL *)v8;

  decodeStringForKey(v4, (uint64_t)CFSTR("title"));
  v10 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v10;

  decodeStringForKey(v4, (uint64_t)CFSTR("originalTitle"));
  v12 = objc_claimAutoreleasedReturnValue();
  originalTitle = v5->_originalTitle;
  v5->_originalTitle = (NSString *)v12;

  decodeStringForKey(v4, (uint64_t)CFSTR("summary"));
  v14 = objc_claimAutoreleasedReturnValue();
  summary = v5->_summary;
  v5->_summary = (NSString *)v14;

  decodeStringForKey(v4, (uint64_t)CFSTR("selection"));
  v16 = objc_claimAutoreleasedReturnValue();
  selectedText = v5->_selectedText;
  v5->_selectedText = (NSString *)v16;

  decodeStringForKey(v4, (uint64_t)CFSTR("siteName"));
  v18 = objc_claimAutoreleasedReturnValue();
  siteName = v5->_siteName;
  v5->_siteName = (NSString *)v18;

  decodeStringForKey(v4, (uint64_t)CFSTR("itemType"));
  v20 = objc_claimAutoreleasedReturnValue();
  itemType = v5->_itemType;
  v5->_itemType = (NSString *)v20;

  decodeURLForKey(v4, CFSTR("relatedURL"));
  v22 = objc_claimAutoreleasedReturnValue();
  relatedURL = v5->_relatedURL;
  v5->_relatedURL = (NSURL *)v22;

  decodeStringForKey(v4, (uint64_t)CFSTR("creator"));
  v24 = objc_claimAutoreleasedReturnValue();
  creator = v5->_creator;
  v5->_creator = (NSString *)v24;

  decodeStringForKey(v4, (uint64_t)CFSTR("creatorFacebookProfile"));
  v26 = objc_claimAutoreleasedReturnValue();
  creatorFacebookProfile = v5->_creatorFacebookProfile;
  v5->_creatorFacebookProfile = (NSString *)v26;

  decodeStringForKey(v4, (uint64_t)CFSTR("creatorTwitterUsername"));
  v28 = objc_claimAutoreleasedReturnValue();
  creatorTwitterUsername = v5->_creatorTwitterUsername;
  v5->_creatorTwitterUsername = (NSString *)v28;

  decodeStringForKey(v4, (uint64_t)CFSTR("twitterCard"));
  v30 = objc_claimAutoreleasedReturnValue();
  twitterCard = v5->_twitterCard;
  v5->_twitterCard = (NSString *)v30;

  v5->_usesActivityPub = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesActivityPub"));
  decodeStringForKey(v4, (uint64_t)CFSTR("appleContentID"));
  v32 = objc_claimAutoreleasedReturnValue();
  appleContentID = v5->_appleContentID;
  v5->_appleContentID = (NSString *)v32;

  decodeStringForKey(v4, (uint64_t)CFSTR("appleSummary"));
  v34 = objc_claimAutoreleasedReturnValue();
  appleSummary = v5->_appleSummary;
  v5->_appleSummary = (NSString *)v34;

  objc_msgSend(v4, "_lp_strictlyDecodeColorForKey:", CFSTR("themeColor"));
  v36 = objc_claimAutoreleasedReturnValue();
  themeColor = v5->_themeColor;
  v5->_themeColor = (UIColor *)v36;

  objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setIcon:](v5, "setIcon:", v38);

  objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconMetadata"));
  v39 = objc_claimAutoreleasedReturnValue();
  iconMetadata = v5->_iconMetadata;
  v5->_iconMetadata = (LPIconMetadata *)v39;

  objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("image"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setImage:](v5, "setImage:", v41);

  objc_msgSend(v4, "_lp_strictlyDecodeArrayOfLPImagesForKey:", CFSTR("alternateImages"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setAlternateImages:](v5, "setAlternateImages:", v42);

  objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageMetadata"));
  v43 = objc_claimAutoreleasedReturnValue();
  imageMetadata = v5->_imageMetadata;
  v5->_imageMetadata = (LPImageMetadata *)v43;

  objc_msgSend(v4, "_lp_strictlyDecodeArrayOfLPImagesForKey:", CFSTR("contentImages"));
  v45 = objc_claimAutoreleasedReturnValue();
  contentImages = v5->_contentImages;
  v5->_contentImages = (NSArray *)v45;

  objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("contentImagesMetadata"));
  v47 = objc_claimAutoreleasedReturnValue();
  contentImagesMetadata = v5->_contentImagesMetadata;
  v5->_contentImagesMetadata = (NSArray *)v47;

  objc_msgSend(v4, "_lp_strictlyDecodeLPVideoForKey:", CFSTR("video"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setVideo:](v5, "setVideo:", v49);

  objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoMetadata"));
  v50 = objc_claimAutoreleasedReturnValue();
  videoMetadata = v5->_videoMetadata;
  v5->_videoMetadata = (LPVideoMetadata *)v50;

  objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audio"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setAudio:](v5, "setAudio:", v52);

  objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioMetadata"));
  v53 = objc_claimAutoreleasedReturnValue();
  audioMetadata = v5->_audioMetadata;
  v5->_audioMetadata = (LPAudioMetadata *)v53;

  objc_msgSend(v4, "_lp_strictlyDecodeLPARAssetForKey:", CFSTR("arAsset"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setArAsset:](v5, "setArAsset:", v55);

  objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arAssetMetadata"));
  v56 = objc_claimAutoreleasedReturnValue();
  arAssetMetadata = v5->_arAssetMetadata;
  v5->_arAssetMetadata = (LPARAssetMetadata *)v56;

  objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("icons"));
  v58 = objc_claimAutoreleasedReturnValue();
  icons = v5->_icons;
  v5->_icons = (NSArray *)v58;

  objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("images"));
  v60 = objc_claimAutoreleasedReturnValue();
  images = v5->_images;
  v5->_images = (NSArray *)v60;

  objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("videos"));
  v62 = objc_claimAutoreleasedReturnValue();
  videos = v5->_videos;
  v5->_videos = (NSArray *)v62;

  objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("streamingVideos"));
  v64 = objc_claimAutoreleasedReturnValue();
  streamingVideos = v5->_streamingVideos;
  v5->_streamingVideos = (NSArray *)v64;

  objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("audios"));
  v66 = objc_claimAutoreleasedReturnValue();
  audios = v5->_audios;
  v5->_audios = (NSArray *)v66;

  objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("arAssets"));
  v68 = objc_claimAutoreleasedReturnValue();
  arAssets = v5->_arAssets;
  v5->_arAssets = (NSArray *)v68;

  objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedApplication"));
  v70 = objc_claimAutoreleasedReturnValue();
  associatedApplication = v5->_associatedApplication;
  v5->_associatedApplication = (LPAssociatedApplicationMetadata *)v70;

  objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceApplication"));
  v72 = objc_claimAutoreleasedReturnValue();
  sourceApplication = v5->_sourceApplication;
  v5->_sourceApplication = (LPSourceApplicationMetadata *)v72;

  v74 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("collaborationType"));
  if (v74 <= 2)
    v75 = v74;
  else
    v75 = 0;
  v5->_collaborationType = v75;
  objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("product"));
  v76 = objc_claimAutoreleasedReturnValue();
  product = v5->_product;
  v5->_product = (LPProductMetadata *)v76;

  objc_msgSend(v4, "error");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
    goto LABEL_29;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("conversationActivity")))
  {
    v106 = 0;
    v107 = (uint64_t)&v106;
    v108 = 0x2050000000;
    v79 = (void *)getTUConversationActivityClass_softClass;
    v109 = (void *)getTUConversationActivityClass_softClass;
    if (!getTUConversationActivityClass_softClass)
    {
      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __getTUConversationActivityClass_block_invoke;
      v105[3] = &unk_1E44A7DB0;
      v105[4] = &v106;
      __getTUConversationActivityClass_block_invoke((uint64_t)v105);
      v79 = *(void **)(v107 + 24);
    }
    v80 = objc_retainAutorelease(v79);
    _Block_object_dispose(&v106, 8);
    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", v80, CFSTR("conversationActivity"));
    v81 = objc_claimAutoreleasedReturnValue();
    conversationActivity = v5->_conversationActivity;
    v5->_conversationActivity = (TUConversationActivity *)v81;

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("collaborationMetadata")))
  {
    v111 = 0;
    v112 = &v111;
    v113 = 0x2050000000;
    v83 = (void *)get_SWCollaborationMetadataClass_softClass;
    v114 = get_SWCollaborationMetadataClass_softClass;
    if (!get_SWCollaborationMetadataClass_softClass)
    {
      v106 = MEMORY[0x1E0C809B0];
      v107 = 3221225472;
      v108 = (uint64_t)__get_SWCollaborationMetadataClass_block_invoke;
      v109 = &unk_1E44A7DB0;
      v110 = &v111;
      __get_SWCollaborationMetadataClass_block_invoke((uint64_t)&v106);
      v83 = (void *)v112[3];
    }
    v84 = objc_retainAutorelease(v83);
    _Block_object_dispose(&v111, 8);
    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", v84, CFSTR("collaborationMetadata"));
    v85 = objc_claimAutoreleasedReturnValue();
    collaborationMetadata = v5->_collaborationMetadata;
    v5->_collaborationMetadata = (_SWCollaborationMetadata *)v85;

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("specialization2")))
  {
    decodableSpecializationClasses(objc_msgSend(v4, "_lp_coderType"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0;
    objc_msgSend(v4, "_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v87, CFSTR("specialization2"), &v103);
    v88 = objc_claimAutoreleasedReturnValue();
    v89 = v103;
    specialization = v5->_specialization;
    v5->_specialization = (LPSpecializationMetadata *)v88;

    if (v89)
    {
      v91 = LPLogChannelSerialization();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        -[LPLinkMetadata initWithCoder:].cold.3();
    }

  }
  if (!v5->_specialization && objc_msgSend(v4, "containsValueForKey:", CFSTR("specialization")))
  {
    decodableSpecializationClasses(objc_msgSend(v4, "_lp_coderType"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = 0;
    objc_msgSend(v4, "_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v92, CFSTR("specialization"), &v102);
    v93 = objc_claimAutoreleasedReturnValue();
    v94 = v102;
    v95 = v5->_specialization;
    v5->_specialization = (LPSpecializationMetadata *)v93;

    if (v94)
    {
      v96 = LPLogChannelSerialization();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        -[LPLinkMetadata initWithCoder:].cold.1();
    }

  }
  v97 = v5;
LABEL_30:

  return v97;
}

- (id)copyWithZone:(_NSZone *)a3
{
  LPLinkMetadata *v4;
  LPLinkMetadata *v5;
  LPLinkMetadata *v6;

  v4 = +[LPLinkMetadata allocWithZone:](LPLinkMetadata, "allocWithZone:", a3);
  v5 = v4;
  if (v4)
  {
    -[LPLinkMetadata _copyPropertiesFrom:onlyUpgradeFields:](v4, "_copyPropertiesFrom:onlyUpgradeFields:", self, 0);
    v6 = v5;
  }

  return v5;
}

- (void)_copyPropertiesOnlyUpgradingFieldsFrom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;

  v156 = a3;
  self->_version = objc_msgSend(v156, "version");
  -[LPLinkMetadata originalURL](self, "originalURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(v156, "originalURL"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    objc_msgSend(v156, "originalURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setOriginalURL:](self, "setOriginalURL:", v6);

  }
  -[LPLinkMetadata URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(v156, "URL"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    objc_msgSend(v156, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setURL:](self, "setURL:", v9);

  }
  -[LPLinkMetadata title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10
    || (objc_msgSend(v156, "title"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    objc_msgSend(v156, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    -[LPLinkMetadata setTitle:](self, "setTitle:", v13);

  }
  -[LPLinkMetadata originalTitle](self, "originalTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14
    || (objc_msgSend(v156, "originalTitle"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15))
  {
    objc_msgSend(v156, "originalTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    -[LPLinkMetadata setOriginalTitle:](self, "setOriginalTitle:", v17);

  }
  -[LPLinkMetadata summary](self, "summary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18
    || (objc_msgSend(v156, "summary"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v19))
  {
    objc_msgSend(v156, "summary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    -[LPLinkMetadata setSummary:](self, "setSummary:", v21);

  }
  -[LPLinkMetadata selectedText](self, "selectedText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22
    || (objc_msgSend(v156, "selectedText"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v23,
        v22,
        v23))
  {
    objc_msgSend(v156, "selectedText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    -[LPLinkMetadata setSelectedText:](self, "setSelectedText:", v25);

  }
  -[LPLinkMetadata siteName](self, "siteName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26
    || (objc_msgSend(v156, "siteName"),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        v27,
        v26,
        v27))
  {
    objc_msgSend(v156, "siteName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    -[LPLinkMetadata setSiteName:](self, "setSiteName:", v29);

  }
  -[LPLinkMetadata itemType](self, "itemType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30
    || (objc_msgSend(v156, "itemType"),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v31,
        v30,
        v31))
  {
    objc_msgSend(v156, "itemType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    -[LPLinkMetadata setItemType:](self, "setItemType:", v33);

  }
  -[LPLinkMetadata relatedURL](self, "relatedURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v34
    || (objc_msgSend(v156, "relatedURL"),
        v35 = (void *)objc_claimAutoreleasedReturnValue(),
        v35,
        v34,
        v35))
  {
    objc_msgSend(v156, "relatedURL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setRelatedURL:](self, "setRelatedURL:", v36);

  }
  -[LPLinkMetadata creator](self, "creator");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37
    || (objc_msgSend(v156, "creator"),
        v38 = (void *)objc_claimAutoreleasedReturnValue(),
        v38,
        v37,
        v38))
  {
    objc_msgSend(v156, "creator");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v39, "copy");
    -[LPLinkMetadata setCreator:](self, "setCreator:", v40);

  }
  -[LPLinkMetadata creatorFacebookProfile](self, "creatorFacebookProfile");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41
    || (objc_msgSend(v156, "creatorFacebookProfile"),
        v42 = (void *)objc_claimAutoreleasedReturnValue(),
        v42,
        v41,
        v42))
  {
    objc_msgSend(v156, "creatorFacebookProfile");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v43, "copy");
    -[LPLinkMetadata setCreatorFacebookProfile:](self, "setCreatorFacebookProfile:", v44);

  }
  -[LPLinkMetadata creatorTwitterUsername](self, "creatorTwitterUsername");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v45
    || (objc_msgSend(v156, "creatorTwitterUsername"),
        v46 = (void *)objc_claimAutoreleasedReturnValue(),
        v46,
        v45,
        v46))
  {
    objc_msgSend(v156, "creatorTwitterUsername");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v47, "copy");
    -[LPLinkMetadata setCreatorTwitterUsername:](self, "setCreatorTwitterUsername:", v48);

  }
  -[LPLinkMetadata twitterCard](self, "twitterCard");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v49
    || (objc_msgSend(v156, "twitterCard"),
        v50 = (void *)objc_claimAutoreleasedReturnValue(),
        v50,
        v49,
        v50))
  {
    objc_msgSend(v156, "twitterCard");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v51, "copy");
    -[LPLinkMetadata setTwitterCard:](self, "setTwitterCard:", v52);

  }
  if (-[LPLinkMetadata usesActivityPub](self, "usesActivityPub"))
    v53 = 1;
  else
    v53 = objc_msgSend(v156, "usesActivityPub");
  -[LPLinkMetadata setUsesActivityPub:](self, "setUsesActivityPub:", v53);
  -[LPLinkMetadata appleContentID](self, "appleContentID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v54
    || (objc_msgSend(v156, "appleContentID"),
        v55 = (void *)objc_claimAutoreleasedReturnValue(),
        v55,
        v54,
        v55))
  {
    objc_msgSend(v156, "appleContentID");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v56, "copy");
    -[LPLinkMetadata setAppleContentID:](self, "setAppleContentID:", v57);

  }
  -[LPLinkMetadata appleSummary](self, "appleSummary");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v58
    || (objc_msgSend(v156, "appleSummary"),
        v59 = (void *)objc_claimAutoreleasedReturnValue(),
        v59,
        v58,
        v59))
  {
    objc_msgSend(v156, "appleSummary");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v60, "copy");
    -[LPLinkMetadata setAppleSummary:](self, "setAppleSummary:", v61);

  }
  -[LPLinkMetadata themeColor](self, "themeColor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v62
    || (objc_msgSend(v156, "themeColor"),
        v63 = (void *)objc_claimAutoreleasedReturnValue(),
        v63,
        v62,
        v63))
  {
    objc_msgSend(v156, "themeColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v64, "copy");
    -[LPLinkMetadata setThemeColor:](self, "setThemeColor:", v65);

  }
  -[LPLinkMetadata icon](self, "icon");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v66
    || (objc_msgSend(v156, "icon"),
        v67 = (void *)objc_claimAutoreleasedReturnValue(),
        v67,
        v66,
        v67))
  {
    objc_msgSend(v156, "icon");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setIcon:](self, "setIcon:", v68);

  }
  -[LPLinkMetadata iconMetadata](self, "iconMetadata");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v69
    || (objc_msgSend(v156, "iconMetadata"),
        v70 = (void *)objc_claimAutoreleasedReturnValue(),
        v70,
        v69,
        v70))
  {
    objc_msgSend(v156, "iconMetadata");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setIconMetadata:](self, "setIconMetadata:", v71);

  }
  -[LPLinkMetadata image](self, "image");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v72
    || (objc_msgSend(v156, "image"),
        v73 = (void *)objc_claimAutoreleasedReturnValue(),
        v73,
        v72,
        v73))
  {
    objc_msgSend(v156, "image");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setImage:](self, "setImage:", v74);

  }
  -[LPLinkMetadata imageMetadata](self, "imageMetadata");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v75
    || (objc_msgSend(v156, "imageMetadata"),
        v76 = (void *)objc_claimAutoreleasedReturnValue(),
        v76,
        v75,
        v76))
  {
    objc_msgSend(v156, "imageMetadata");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setImageMetadata:](self, "setImageMetadata:", v77);

  }
  -[LPLinkMetadata video](self, "video");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v78
    || (objc_msgSend(v156, "video"),
        v79 = (void *)objc_claimAutoreleasedReturnValue(),
        v79,
        v78,
        v79))
  {
    objc_msgSend(v156, "video");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setVideo:](self, "setVideo:", v80);

  }
  -[LPLinkMetadata videoMetadata](self, "videoMetadata");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v81
    || (objc_msgSend(v156, "videoMetadata"),
        v82 = (void *)objc_claimAutoreleasedReturnValue(),
        v82,
        v81,
        v82))
  {
    objc_msgSend(v156, "videoMetadata");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setVideoMetadata:](self, "setVideoMetadata:", v83);

  }
  -[LPLinkMetadata audio](self, "audio");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v84
    || (objc_msgSend(v156, "audio"),
        v85 = (void *)objc_claimAutoreleasedReturnValue(),
        v85,
        v84,
        v85))
  {
    objc_msgSend(v156, "audio");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setAudio:](self, "setAudio:", v86);

  }
  -[LPLinkMetadata audioMetadata](self, "audioMetadata");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v87
    || (objc_msgSend(v156, "audioMetadata"),
        v88 = (void *)objc_claimAutoreleasedReturnValue(),
        v88,
        v87,
        v88))
  {
    objc_msgSend(v156, "audioMetadata");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setAudioMetadata:](self, "setAudioMetadata:", v89);

  }
  -[LPLinkMetadata arAsset](self, "arAsset");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v90
    || (objc_msgSend(v156, "arAsset"),
        v91 = (void *)objc_claimAutoreleasedReturnValue(),
        v91,
        v90,
        v91))
  {
    objc_msgSend(v156, "arAsset");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setArAsset:](self, "setArAsset:", v92);

  }
  -[LPLinkMetadata arAssetMetadata](self, "arAssetMetadata");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v93
    || (objc_msgSend(v156, "arAssetMetadata"),
        v94 = (void *)objc_claimAutoreleasedReturnValue(),
        v94,
        v93,
        v94))
  {
    objc_msgSend(v156, "arAssetMetadata");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setArAssetMetadata:](self, "setArAssetMetadata:", v95);

  }
  -[LPLinkMetadata icons](self, "icons");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v96
    || (objc_msgSend(v156, "icons"),
        v97 = (void *)objc_claimAutoreleasedReturnValue(),
        v97,
        v96,
        v97))
  {
    objc_msgSend(v156, "icons");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = (void *)objc_msgSend(v98, "copy");
    -[LPLinkMetadata setIcons:](self, "setIcons:", v99);

  }
  -[LPLinkMetadata images](self, "images");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v100
    || (objc_msgSend(v156, "images"),
        v101 = (void *)objc_claimAutoreleasedReturnValue(),
        v101,
        v100,
        v101))
  {
    objc_msgSend(v156, "images");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = (void *)objc_msgSend(v102, "copy");
    -[LPLinkMetadata setImages:](self, "setImages:", v103);

  }
  -[LPLinkMetadata contentImages](self, "contentImages");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v104
    || (objc_msgSend(v156, "contentImages"),
        v105 = (void *)objc_claimAutoreleasedReturnValue(),
        v105,
        v104,
        v105))
  {
    objc_msgSend(v156, "contentImages");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)objc_msgSend(v106, "copy");
    -[LPLinkMetadata setContentImages:](self, "setContentImages:", v107);

  }
  -[LPLinkMetadata contentImagesMetadata](self, "contentImagesMetadata");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v108
    || (objc_msgSend(v156, "contentImagesMetadata"),
        v109 = (void *)objc_claimAutoreleasedReturnValue(),
        v109,
        v108,
        v109))
  {
    objc_msgSend(v156, "contentImagesMetadata");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = (void *)objc_msgSend(v110, "copy");
    -[LPLinkMetadata setContentImagesMetadata:](self, "setContentImagesMetadata:", v111);

  }
  -[LPLinkMetadata alternateImages](self, "alternateImages");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v112
    || (objc_msgSend(v156, "alternateImages"),
        v113 = (void *)objc_claimAutoreleasedReturnValue(),
        v113,
        v112,
        v113))
  {
    objc_msgSend(v156, "alternateImages");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = (void *)objc_msgSend(v114, "copy");
    -[LPLinkMetadata setAlternateImages:](self, "setAlternateImages:", v115);

  }
  -[LPLinkMetadata videos](self, "videos");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v116
    || (objc_msgSend(v156, "videos"),
        v117 = (void *)objc_claimAutoreleasedReturnValue(),
        v117,
        v116,
        v117))
  {
    objc_msgSend(v156, "videos");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = (void *)objc_msgSend(v118, "copy");
    -[LPLinkMetadata setVideos:](self, "setVideos:", v119);

  }
  -[LPLinkMetadata streamingVideos](self, "streamingVideos");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v120
    || (objc_msgSend(v156, "streamingVideos"),
        v121 = (void *)objc_claimAutoreleasedReturnValue(),
        v121,
        v120,
        v121))
  {
    objc_msgSend(v156, "streamingVideos");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = (void *)objc_msgSend(v122, "copy");
    -[LPLinkMetadata setStreamingVideos:](self, "setStreamingVideos:", v123);

  }
  -[LPLinkMetadata audios](self, "audios");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v124
    || (objc_msgSend(v156, "audios"),
        v125 = (void *)objc_claimAutoreleasedReturnValue(),
        v125,
        v124,
        v125))
  {
    objc_msgSend(v156, "audios");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = (void *)objc_msgSend(v126, "copy");
    -[LPLinkMetadata setAudios:](self, "setAudios:", v127);

  }
  -[LPLinkMetadata arAssets](self, "arAssets");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v128
    || (objc_msgSend(v156, "arAssets"),
        v129 = (void *)objc_claimAutoreleasedReturnValue(),
        v129,
        v128,
        v129))
  {
    objc_msgSend(v156, "arAssets");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = (void *)objc_msgSend(v130, "copy");
    -[LPLinkMetadata setArAssets:](self, "setArAssets:", v131);

  }
  -[LPLinkMetadata associatedApplication](self, "associatedApplication");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v132
    || (objc_msgSend(v156, "associatedApplication"),
        v133 = (void *)objc_claimAutoreleasedReturnValue(),
        v133,
        v132,
        v133))
  {
    objc_msgSend(v156, "associatedApplication");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = (void *)objc_msgSend(v134, "copy");
    -[LPLinkMetadata setAssociatedApplication:](self, "setAssociatedApplication:", v135);

  }
  -[LPLinkMetadata sourceApplication](self, "sourceApplication");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v136
    || (objc_msgSend(v156, "sourceApplication"),
        v137 = (void *)objc_claimAutoreleasedReturnValue(),
        v137,
        v136,
        v137))
  {
    objc_msgSend(v156, "sourceApplication");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = (void *)objc_msgSend(v138, "copy");
    -[LPLinkMetadata setSourceApplication:](self, "setSourceApplication:", v139);

  }
  -[LPLinkMetadata product](self, "product");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v140
    || (objc_msgSend(v156, "product"),
        v141 = (void *)objc_claimAutoreleasedReturnValue(),
        v141,
        v140,
        v141))
  {
    objc_msgSend(v156, "product");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = (void *)objc_msgSend(v142, "copy");
    -[LPLinkMetadata setProduct:](self, "setProduct:", v143);

  }
  -[LPLinkMetadata conversationActivity](self, "conversationActivity");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v144
    || (objc_msgSend(v156, "conversationActivity"),
        v145 = (void *)objc_claimAutoreleasedReturnValue(),
        v145,
        v144,
        v145))
  {
    objc_msgSend(v156, "conversationActivity");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = (void *)objc_msgSend(v146, "copy");
    -[LPLinkMetadata setConversationActivity:](self, "setConversationActivity:", v147);

  }
  -[LPLinkMetadata setCollaborationType:](self, "setCollaborationType:", objc_msgSend(v156, "collaborationType"));
  -[LPLinkMetadata collaborationMetadata](self, "collaborationMetadata");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v148
    || (objc_msgSend(v156, "collaborationMetadata"),
        v149 = (void *)objc_claimAutoreleasedReturnValue(),
        v149,
        v148,
        v149))
  {
    objc_msgSend(v156, "collaborationMetadata");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = (void *)objc_msgSend(v150, "copy");
    -[LPLinkMetadata setCollaborationMetadata:](self, "setCollaborationMetadata:", v151);

  }
  -[LPLinkMetadata specialization](self, "specialization");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v152
    || (objc_msgSend(v156, "specialization"),
        v153 = (void *)objc_claimAutoreleasedReturnValue(),
        v153,
        v152,
        v153))
  {
    objc_msgSend(v156, "specialization");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = (void *)objc_msgSend(v154, "copy");
    -[LPLinkMetadata setSpecialization:](self, "setSpecialization:", v155);

  }
}

- (void)_copyPropertiesFrom:(id)a3 onlyUpgradeFields:(BOOL)a4
{
  _BOOL4 v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;

  v4 = a4;
  v6 = a3;
  v78 = v6;
  if (v4)
  {
    -[LPLinkMetadata _copyPropertiesOnlyUpgradingFieldsFrom:](self, "_copyPropertiesOnlyUpgradingFieldsFrom:", v6);
  }
  else
  {
    self->_version = objc_msgSend(v6, "version");
    objc_msgSend(v78, "originalURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setOriginalURL:](self, "setOriginalURL:", v7);

    objc_msgSend(v78, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setURL:](self, "setURL:", v8);

    objc_msgSend(v78, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[LPLinkMetadata setTitle:](self, "setTitle:", v10);

    objc_msgSend(v78, "originalTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[LPLinkMetadata setOriginalTitle:](self, "setOriginalTitle:", v12);

    objc_msgSend(v78, "summary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[LPLinkMetadata setSummary:](self, "setSummary:", v14);

    objc_msgSend(v78, "selectedText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    -[LPLinkMetadata setSelectedText:](self, "setSelectedText:", v16);

    objc_msgSend(v78, "siteName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    -[LPLinkMetadata setSiteName:](self, "setSiteName:", v18);

    objc_msgSend(v78, "itemType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    -[LPLinkMetadata setItemType:](self, "setItemType:", v20);

    objc_msgSend(v78, "relatedURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setRelatedURL:](self, "setRelatedURL:", v21);

    objc_msgSend(v78, "creator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    -[LPLinkMetadata setCreator:](self, "setCreator:", v23);

    objc_msgSend(v78, "creatorFacebookProfile");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    -[LPLinkMetadata setCreatorFacebookProfile:](self, "setCreatorFacebookProfile:", v25);

    objc_msgSend(v78, "creatorTwitterUsername");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    -[LPLinkMetadata setCreatorTwitterUsername:](self, "setCreatorTwitterUsername:", v27);

    objc_msgSend(v78, "twitterCard");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    -[LPLinkMetadata setTwitterCard:](self, "setTwitterCard:", v29);

    -[LPLinkMetadata setUsesActivityPub:](self, "setUsesActivityPub:", objc_msgSend(v78, "usesActivityPub"));
    objc_msgSend(v78, "appleContentID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    -[LPLinkMetadata setAppleContentID:](self, "setAppleContentID:", v31);

    objc_msgSend(v78, "appleSummary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    -[LPLinkMetadata setAppleSummary:](self, "setAppleSummary:", v33);

    objc_msgSend(v78, "themeColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copy");
    -[LPLinkMetadata setThemeColor:](self, "setThemeColor:", v35);

    objc_msgSend(v78, "icon");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setIcon:](self, "setIcon:", v36);

    objc_msgSend(v78, "iconMetadata");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setIconMetadata:](self, "setIconMetadata:", v37);

    objc_msgSend(v78, "image");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setImage:](self, "setImage:", v38);

    objc_msgSend(v78, "imageMetadata");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setImageMetadata:](self, "setImageMetadata:", v39);

    objc_msgSend(v78, "contentImages");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v40, "copy");
    -[LPLinkMetadata setContentImages:](self, "setContentImages:", v41);

    objc_msgSend(v78, "contentImagesMetadata");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copy");
    -[LPLinkMetadata setContentImagesMetadata:](self, "setContentImagesMetadata:", v43);

    objc_msgSend(v78, "video");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setVideo:](self, "setVideo:", v44);

    objc_msgSend(v78, "videoMetadata");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setVideoMetadata:](self, "setVideoMetadata:", v45);

    objc_msgSend(v78, "audio");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setAudio:](self, "setAudio:", v46);

    objc_msgSend(v78, "audioMetadata");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setAudioMetadata:](self, "setAudioMetadata:", v47);

    objc_msgSend(v78, "arAsset");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setArAsset:](self, "setArAsset:", v48);

    objc_msgSend(v78, "arAssetMetadata");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setArAssetMetadata:](self, "setArAssetMetadata:", v49);

    objc_msgSend(v78, "icons");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v50, "copy");
    -[LPLinkMetadata setIcons:](self, "setIcons:", v51);

    objc_msgSend(v78, "images");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "copy");
    -[LPLinkMetadata setImages:](self, "setImages:", v53);

    objc_msgSend(v78, "alternateImages");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v54, "copy");
    -[LPLinkMetadata setAlternateImages:](self, "setAlternateImages:", v55);

    objc_msgSend(v78, "videos");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v56, "copy");
    -[LPLinkMetadata setVideos:](self, "setVideos:", v57);

    objc_msgSend(v78, "streamingVideos");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v58, "copy");
    -[LPLinkMetadata setStreamingVideos:](self, "setStreamingVideos:", v59);

    objc_msgSend(v78, "audios");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v60, "copy");
    -[LPLinkMetadata setAudios:](self, "setAudios:", v61);

    objc_msgSend(v78, "arAssets");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v62, "copy");
    -[LPLinkMetadata setArAssets:](self, "setArAssets:", v63);

    objc_msgSend(v78, "associatedApplication");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v64, "copy");
    -[LPLinkMetadata setAssociatedApplication:](self, "setAssociatedApplication:", v65);

    objc_msgSend(v78, "product");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v66, "copy");
    -[LPLinkMetadata setProduct:](self, "setProduct:", v67);

    objc_msgSend(v78, "sourceApplication");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v68, "copy");
    -[LPLinkMetadata setSourceApplication:](self, "setSourceApplication:", v69);

    objc_msgSend(v78, "conversationActivity");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(v70, "copy");
    -[LPLinkMetadata setConversationActivity:](self, "setConversationActivity:", v71);

    -[LPLinkMetadata setCollaborationType:](self, "setCollaborationType:", objc_msgSend(v78, "collaborationType"));
    objc_msgSend(v78, "collaborationMetadata");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)objc_msgSend(v72, "copy");
    -[LPLinkMetadata setCollaborationMetadata:](self, "setCollaborationMetadata:", v73);

    objc_msgSend(v78, "specialization");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)objc_msgSend(v74, "copy");
    -[LPLinkMetadata setSpecialization:](self, "setSpecialization:", v75);

    -[LPLinkMetadata _setIncomplete:](self, "_setIncomplete:", objc_msgSend(v78, "_isIncomplete"));
    self->_wasCopiedFromIncompleteMetadata = objc_msgSend(v78, "_isCurrentlyLoadingOrIncomplete");
    objc_msgSend(v78, "originatingSynapseContentItem");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (void *)objc_msgSend(v76, "copy");
    -[LPLinkMetadata setOriginatingSynapseContentItem:](self, "setOriginatingSynapseContentItem:", v77);

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v10;
  LPSpecializationMetadata *v11;
  LPSpecializationMetadata *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  LPSpecializationMetadata *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v4, "_lp_coderType") == 1, CFSTR("isEncodedForLocalUse"));
  v5 = -[LPLinkMetadata _isCurrentlyLoadingOrIncomplete](self, "_isCurrentlyLoadingOrIncomplete");
  objc_msgSend(v4, "encodeBool:forKey:", v5, CFSTR("isIncomplete"));
  if (v5)
  {
    v6 = (id)LPLogChannelSerialization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[LPLinkMetadata _isCurrentlyLoading](self, "_isCurrentlyLoading");
      v8 = -[LPLinkMetadata _isIncomplete](self, "_isIncomplete");
      v9 = -[LPLinkMetadata _wasCopiedFromIncompleteMetadata](self, "_wasCopiedFromIncompleteMetadata");
      objc_opt_class();
      *(_DWORD *)buf = 67109888;
      v28 = v7;
      v29 = 1024;
      v30 = v8;
      v31 = 1024;
      v32 = v9;
      v33 = 1024;
      LOBYTE(v34) = objc_opt_isKindOfClass() & 1;
      v34 = v34;
      _os_log_impl(&dword_1A0C41000, v6, OS_LOG_TYPE_DEFAULT, "LPLinkMetadata being encoded while incomplete (loading: %d, incomplete: %d, copiedFromIncomplete: %d, isPlaceholder: %d)!", buf, 0x1Au);
    }

  }
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_originalURL, CFSTR("originalURL"));
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, CFSTR("URL"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_originalTitle, CFSTR("originalTitle"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_summary, CFSTR("summary"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_selectedText, CFSTR("selection"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_siteName, CFSTR("siteName"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_itemType, CFSTR("itemType"));
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_relatedURL, CFSTR("relatedURL"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_creator, CFSTR("creator"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_creatorFacebookProfile, CFSTR("creatorFacebookProfile"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_creatorTwitterUsername, CFSTR("creatorTwitterUsername"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_twitterCard, CFSTR("twitterCard"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_usesActivityPub, CFSTR("usesActivityPub"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_appleContentID, CFSTR("appleContentID"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_appleSummary, CFSTR("appleSummary"));
  objc_msgSend(v4, "_lp_encodeColorIfNotNil:forKey:", self->_themeColor, CFSTR("themeColor"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_iconMetadata, CFSTR("iconMetadata"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_alternateImages, CFSTR("alternateImages"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_contentImages, CFSTR("contentImages"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_contentImagesMetadata, CFSTR("contentImagesMetadata"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_imageMetadata, CFSTR("imageMetadata"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_video, CFSTR("video"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_videoMetadata, CFSTR("videoMetadata"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_audio, CFSTR("audio"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_audioMetadata, CFSTR("audioMetadata"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_arAsset, CFSTR("arAsset"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_arAssetMetadata, CFSTR("arAssetMetadata"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_icons, CFSTR("icons"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_images, CFSTR("images"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_videos, CFSTR("videos"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_streamingVideos, CFSTR("streamingVideos"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_audios, CFSTR("audios"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_arAssets, CFSTR("arAssets"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_associatedApplication, CFSTR("associatedApplication"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_sourceApplication, CFSTR("sourceApplication"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_product, CFSTR("product"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_conversationActivity, CFSTR("conversationActivity"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_collaborationType, CFSTR("collaborationType"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_collaborationMetadata, CFSTR("collaborationMetadata"));
  v10 = objc_msgSend(v4, "_lp_coderType");
  v11 = self->_specialization;
  v12 = v11;
  if (v10 == 1)
  {

  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    specializationClassesForLocalUseOnly();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, buf, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v36;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v13);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

            goto LABEL_28;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, buf, 16);
        if (v14)
          continue;
        break;
      }
    }

  }
  v17 = self->_specialization;
  *(_QWORD *)&v35 = objc_opt_class();
  *((_QWORD *)&v35 + 1) = objc_opt_class();
  *(_QWORD *)&v36 = objc_opt_class();
  *((_QWORD *)&v36 + 1) = objc_opt_class();
  *(_QWORD *)&v37 = objc_opt_class();
  *((_QWORD *)&v37 + 1) = objc_opt_class();
  *(_QWORD *)&v38 = objc_opt_class();
  *((_QWORD *)&v38 + 1) = objc_opt_class();
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 11);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, buf, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v24;
    while (2)
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v18);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          v22 = CFSTR("specialization");
          goto LABEL_26;
        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, buf, 16);
      if (v19)
        continue;
      break;
    }
  }

  v22 = CFSTR("specialization2");
LABEL_26:
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_specialization, v22, v23);
LABEL_28:

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPLinkMetadata;
  if (-[LPLinkMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      v5 = (objectsAreEqual_0(v6[9], self->_originalURL) & 1) != 0
        && objectsAreEqual_0(v6[10], self->_URL)
        && -[LPLinkMetadata _isEqualIgnoringURLs:](self, "_isEqualIgnoringURLs:", v6);

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_isEqualIgnoringURLs:(id)a3
{
  void **v4;
  char v5;
  objc_super v7;

  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)LPLinkMetadata;
  if (-[LPLinkMetadata isEqual:](&v7, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else if (*((_DWORD *)v4 + 15) == self->_version
         && objectsAreEqual_0(v4[6], self->_title)
         && objectsAreEqual_0(v4[11], self->_summary)
         && objectsAreEqual_0(v4[12], self->_selectedText)
         && objectsAreEqual_0(v4[13], self->_siteName)
         && objectsAreEqual_0(v4[14], self->_itemType)
         && objectsAreEqual_0(v4[15], self->_relatedURL)
         && objectsAreEqual_0(v4[16], self->_creator)
         && objectsAreEqual_0(v4[17], self->_creatorFacebookProfile)
         && objectsAreEqual_0(v4[18], self->_creatorTwitterUsername)
         && objectsAreEqual_0(v4[19], self->_twitterCard)
         && *((unsigned __int8 *)v4 + 57) == self->_usesActivityPub
         && objectsAreEqual_0(v4[20], self->_appleContentID)
         && objectsAreEqual_0(v4[21], self->_appleSummary)
         && objectsAreEqual_0(v4[22], self->_themeColor)
         && objectsAreEqual_0(v4[25], self->_icon)
         && objectsAreEqual_0(v4[26], self->_iconMetadata)
         && objectsAreEqual_0(v4[27], self->_image)
         && objectsAreEqual_0(v4[31], self->_imageMetadata)
         && objectsAreEqual_0(v4[29], self->_contentImages)
         && objectsAreEqual_0(v4[30], self->_contentImagesMetadata)
         && objectsAreEqual_0(v4[32], self->_video)
         && objectsAreEqual_0(v4[33], self->_videoMetadata)
         && objectsAreEqual_0(v4[34], self->_audio)
         && objectsAreEqual_0(v4[35], self->_audioMetadata)
         && objectsAreEqual_0(v4[23], self->_arAsset)
         && objectsAreEqual_0(v4[24], self->_arAssetMetadata)
         && objectsAreEqual_0(v4[37], self->_icons)
         && objectsAreEqual_0(v4[38], self->_images)
         && objectsAreEqual_0(v4[28], self->_alternateImages)
         && objectsAreEqual_0(v4[39], self->_videos)
         && objectsAreEqual_0(v4[40], self->_streamingVideos)
         && objectsAreEqual_0(v4[41], self->_audios)
         && objectsAreEqual_0(v4[36], self->_arAssets)
         && objectsAreEqual_0(v4[42], self->_associatedApplication)
         && objectsAreEqual_0(v4[47], self->_sourceApplication)
         && objectsAreEqual_0(v4[44], self->_conversationActivity)
         && v4[45] == (void *)self->_collaborationType
         && objectsAreEqual_0(v4[46], self->_collaborationMetadata))
  {
    v5 = objectsAreEqual_0(v4[49], self->_specialization);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSURL hash](self->_originalURL, "hash");
  return -[NSURL hash](self->_URL, "hash") ^ v3;
}

+ (LPLinkMetadata)metadataWithDataRepresentation:(id)a3 decodingType:(unint64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4 == 1 || (unint64_t)objc_msgSend(v5, "length") <= 0xA00000)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v6, 0);
    objc_msgSend(v9, "_enableStrictSecureDecodingMode");
    objc_msgSend(v9, "setDecodingFailurePolicy:", 1);
    objc_msgSend(v9, "_lp_setCoderType:", a4);
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CB2CD0];
    v18 = 0;
    objc_msgSend(v9, "_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v12, v13, &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;

    objc_msgSend(v9, "finishDecoding");
    if (v15)
    {
      v16 = LPLogChannelSerialization();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[LPLinkMetadata metadataWithDataRepresentation:decodingType:].cold.1();
      v8 = 0;
    }
    else
    {
      v8 = v14;
    }

  }
  else
  {
    v7 = (id)LPLogChannelSerialization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[LPLinkMetadata metadataWithDataRepresentation:decodingType:].cold.3(buf, objc_msgSend(v6, "length"), v7);

    v8 = 0;
  }

  return (LPLinkMetadata *)v8;
}

- (id)dataRepresentationWithEncodingType:(unint64_t)a3 options:(unint64_t)a4
{
  void *v7;
  LPLocalMetadataArchiverDelegate *v8;
  void *v9;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v7, "_lp_setCoderType:", a3);
  objc_msgSend(v7, "_lp_setCoderOptions:", a4);
  if (a3 == 1)
  {
    v8 = objc_alloc_init(LPLocalMetadataArchiverDelegate);
    objc_msgSend(v7, "setDelegate:", v8);
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v7, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v7, "encodedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (LPLinkMetadata)metadataWithDataRepresentation:(id)a3
{
  objc_msgSend(a1, "metadataWithDataRepresentation:decodingType:", a3, 0);
  return (LPLinkMetadata *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)dataRepresentation
{
  return -[LPLinkMetadata dataRepresentationWithEncodingType:options:](self, "dataRepresentationWithEncodingType:options:", 0, 0);
}

+ (LPLinkMetadata)metadataWithDataRepresentationForLocalUseOnly:(id)a3
{
  objc_msgSend(a1, "metadataWithDataRepresentation:decodingType:", a3, 1);
  return (LPLinkMetadata *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)dataRepresentationForLocalUseOnly
{
  return -[LPLinkMetadata dataRepresentationWithEncodingType:options:](self, "dataRepresentationWithEncodingType:options:", 1, 0);
}

- (id)dataRepresentationForLocalLowFidelityUseOnly
{
  return -[LPLinkMetadata dataRepresentationWithEncodingType:options:](self, "dataRepresentationWithEncodingType:options:", 1, 1);
}

- (unint64_t)_encodedSize
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = self->_alternateImages;
  v4 = 0;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v4 += objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v7++), "_encodedSize");
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_contentImages;
  v9 = 0;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v9 += objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12++), "_encodedSize", (_QWORD)v17);
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

  v13 = -[LPImage _encodedSize](self->_icon, "_encodedSize");
  v14 = -[LPImage _encodedSize](self->_image, "_encodedSize");
  v15 = -[LPVisualMedia _encodedSize](self->_video, "_encodedSize");
  return v9 + v4 + v13 + v14 + v15 + -[LPAudio _encodedSize](self->_audio, "_encodedSize");
}

- (void)_reduceSizeByDroppingResourcesIfNeeded
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  LPLinkMetadata *v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  if (+[LPTestingOverrides forceUseSmallerMaximumMetadataSize](LPTestingOverrides, "forceUseSmallerMaximumMetadataSize"))
  {
    v3 = 0x100000;
  }
  else
  {
    v3 = 10485760;
  }
  v24 = 0uLL;
  v25 = 0uLL;
  v21 = objc_msgSend(&unk_1E44F01B0, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v21)
  {
    v4 = *(_QWORD *)v23;
    v18 = *(_QWORD *)v23;
    v19 = self;
LABEL_6:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v4)
        objc_enumerationMutation(&unk_1E44F01B0);
      v6 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v5);
      if (-[LPLinkMetadata _encodedSize](self, "_encodedSize", v18, v19) <= v3)
        break;
      -[LPLinkMetadata valueForKeyPath:](self, "valueForKeyPath:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = -[LPLinkMetadata _encodedSize](self, "_encodedSize");
          v20 = v7;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v20, "reverseObjectEnumerator");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 0;
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v27 != v12)
                  objc_enumerationMutation(v9);
                v14 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "_encodedSize");
                v15 = (v14 != 0) & (v8 > v3);
                if (v14 != 0 && v8 > v3)
                  v16 = v14;
                else
                  v16 = 0;
                v8 -= v16;
                v10 += v15;
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
            }
            while (v11);
          }

          v4 = v18;
          self = v19;
          objc_msgSend(v20, "subarrayWithRange:", 0, objc_msgSend(v20, "count") - v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[LPLinkMetadata setValue:forKeyPath:](v19, "setValue:forKeyPath:", v17, v6);
        }
        else if (objc_msgSend(v7, "_encodedSize"))
        {
          -[LPLinkMetadata setValue:forKeyPath:](self, "setValue:forKeyPath:", 0, v6);
        }
      }

      if (++v5 == v21)
      {
        v21 = objc_msgSend(&unk_1E44F01B0, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v21)
          goto LABEL_6;
        return;
      }
    }
  }
}

- (NSItemProvider)iconProvider
{
  return -[LPImage _itemProvider](self->_icon, "_itemProvider");
}

- (void)setIconProvider:(NSItemProvider *)iconProvider
{
  LPImage *v4;
  NSItemProvider *v5;

  v5 = iconProvider;
  if (v5)
    v4 = -[LPImage initWithItemProvider:properties:placeholderImage:]([LPImage alloc], "initWithItemProvider:properties:placeholderImage:", v5, 0, 0);
  else
    v4 = 0;
  -[LPLinkMetadata setIcon:](self, "setIcon:", v4);
  if (v5)

}

- (NSItemProvider)imageProvider
{
  return -[LPImage _itemProvider](self->_image, "_itemProvider");
}

- (void)setImageProvider:(NSItemProvider *)imageProvider
{
  LPImage *v4;
  NSItemProvider *v5;

  v5 = imageProvider;
  if (v5)
    v4 = -[LPImage initWithItemProvider:properties:placeholderImage:]([LPImage alloc], "initWithItemProvider:properties:placeholderImage:", v5, 0, 0);
  else
    v4 = 0;
  -[LPLinkMetadata setImage:](self, "setImage:", v4);
  if (v5)

}

- (NSString)title
{
  NSString *title;
  NSString *v3;
  void *v5;

  title = self->_title;
  if (title)
  {
    v3 = title;
  }
  else
  {
    -[NSURL _title](self->_URL, "_title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NSURL _title](self->_URL, "_title");
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)setTitle:(NSString *)title
{
  void *v5;
  NSString *v6;

  v6 = title;
  objc_storeStrong((id *)&self->_title, title);
  -[NSURL _title](self->_URL, "_title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[NSURL _setTitle:](self->_URL, "_setTitle:", self->_title);

}

- (NSItemProvider)videoProvider
{
  return -[LPVideo _itemProvider](self->_video, "_itemProvider");
}

- (void)setVideoProvider:(NSItemProvider *)videoProvider
{
  LPVideo *v4;
  NSItemProvider *v5;

  v5 = videoProvider;
  if (v5)
    v4 = -[LPVideo initWithItemProvider:properties:]([LPVideo alloc], "initWithItemProvider:properties:", v5, 0);
  else
    v4 = 0;
  -[LPLinkMetadata setVideo:](self, "setVideo:", v4);
  if (v5)

}

- (NSURL)remoteVideoURL
{
  void *v3;
  LPVideo *video;
  void *v5;
  void *v6;

  -[LPVideo streamingURL](self->_video, "streamingURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  video = self->_video;
  if (v3)
  {
    -[LPVideo streamingURL](video, "streamingURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LPVideo youTubeURL](video, "youTubeURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[LPVideo youTubeURL](self->_video, "youTubeURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  return (NSURL *)v5;
}

- (void)setRemoteVideoURL:(NSURL *)remoteVideoURL
{
  LPVideo *v4;
  NSURL *v5;

  v5 = remoteVideoURL;
  if (+[LPPresentationSpecializations isYouTubeEmbedURL:](LPPresentationSpecializations, "isYouTubeEmbedURL:"))
  {
    v4 = -[LPVideo initWithYouTubeURL:]([LPVideo alloc], "initWithYouTubeURL:", v5);
    -[LPLinkMetadata setVideo:](self, "setVideo:", v4);
  }
  else
  {
    if (!-[NSURL _lp_isHTTPFamilyURL](v5, "_lp_isHTTPFamilyURL"))
    {
      -[LPLinkMetadata setVideo:](self, "setVideo:", 0);
      goto LABEL_7;
    }
    v4 = -[LPVideo initWithStreamingURL:hasAudio:]([LPVideo alloc], "initWithStreamingURL:hasAudio:", v5, 1);
    -[LPLinkMetadata setVideo:](self, "setVideo:", v4);
  }

LABEL_7:
}

- (BOOL)isGroupCollaboration
{
  char v2;
  void *v3;
  void *v4;
  void *v5;

  if (self->_collaborationType == 2)
    return 1;
  -[TUConversationActivity metadata](self->_conversationActivity, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "isEqualToString:", CFSTR("CPGroupActivityCollaborationContext"));

  return v2;
}

- (BOOL)_isLoadingAsynchronousFields
{
  return -[NSMutableArray count](self->_pendingAsynchronousLoadHandlers, "count") != 0;
}

- (BOOL)_isDeferringAsynchronousLoads
{
  return self->_asynchronousLoadDeferralTokenCount != 0;
}

- (BOOL)_wasCopiedFromIncompleteMetadata
{
  return self->_wasCopiedFromIncompleteMetadata;
}

- (BOOL)_isCurrentlyLoading
{
  _BOOL4 v3;

  if (-[LPLinkMetadata _isDeferringAsynchronousLoads](self, "_isDeferringAsynchronousLoads"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[LPLinkMetadata _isLoadingAsynchronousFields](self, "_isLoadingAsynchronousFields");
    if (v3)
      LOBYTE(v3) = -[LPLinkMetadata _hasAnyAsynchronousFields](self, "_hasAnyAsynchronousFields");
  }
  return v3;
}

- (BOOL)_isCurrentlyLoadingOrIncomplete
{
  char isKindOfClass;

  if (-[LPLinkMetadata _isCurrentlyLoading](self, "_isCurrentlyLoading")
    || -[LPLinkMetadata _isIncomplete](self, "_isIncomplete")
    || -[LPLinkMetadata _wasCopiedFromIncompleteMetadata](self, "_wasCopiedFromIncompleteMetadata"))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)_resetIncompleteState
{
  self->_incomplete = 0;
  self->_wasCopiedFromIncompleteMetadata = 0;
}

- (BOOL)_hasAnyAsynchronousFields
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__LPLinkMetadata__hasAnyAsynchronousFields__block_invoke;
  v4[3] = &unk_1E44A8000;
  v4[4] = self;
  v4[5] = &v5;
  -[LPLinkMetadata _enumerateAsynchronousFields:](self, "_enumerateAsynchronousFields:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __43__LPLinkMetadata__hasAnyAsynchronousFields__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    v5 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE5E5EA8);
    v4 = v7;
    if (v5)
    {
      v6 = objc_msgSend(v7, "needsAsynchronousLoad");
      v4 = v7;
      if (v6)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

- (void)_addFinishedDeferringAsynchronousLoadHandler:(id)a3
{
  id v4;
  NSMutableArray *finishedDeferringAsynchronousLoadHandlers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  finishedDeferringAsynchronousLoadHandlers = self->_finishedDeferringAsynchronousLoadHandlers;
  aBlock = v4;
  if (!finishedDeferringAsynchronousLoadHandlers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_finishedDeferringAsynchronousLoadHandlers;
    self->_finishedDeferringAsynchronousLoadHandlers = v6;

    finishedDeferringAsynchronousLoadHandlers = self->_finishedDeferringAsynchronousLoadHandlers;
    v4 = aBlock;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](finishedDeferringAsynchronousLoadHandlers, "addObject:", v8);

}

- (void)_loadAsynchronousFieldsWithUpdateHandler:(id)a3
{
  id v4;
  OS_dispatch_group *asynchronousLoadGroup;
  OS_dispatch_group *v6;
  OS_dispatch_group *v7;
  OS_dispatch_group *v8;
  BOOL v9;
  char v10;
  NSMutableArray *pendingAsynchronousLoadHandlers;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  NSObject *v15;
  OS_dispatch_group *v16;
  _QWORD v17[5];
  OS_dispatch_group *v18;

  v4 = a3;
  asynchronousLoadGroup = self->_asynchronousLoadGroup;
  v6 = asynchronousLoadGroup;
  if (!asynchronousLoadGroup)
  {
    v7 = (OS_dispatch_group *)dispatch_group_create();
    v8 = self->_asynchronousLoadGroup;
    self->_asynchronousLoadGroup = v7;

    v6 = self->_asynchronousLoadGroup;
  }
  if (-[LPLinkMetadata _loadAsynchronousFieldsWithLoadGroup:](self, "_loadAsynchronousFieldsWithLoadGroup:", v6)
    || ((v9 = -[LPLinkMetadata _isDeferringAsynchronousLoads](self, "_isDeferringAsynchronousLoads"),
         asynchronousLoadGroup)
      ? (v10 = 1)
      : (v10 = v9),
        (v10 & 1) != 0))
  {
    pendingAsynchronousLoadHandlers = self->_pendingAsynchronousLoadHandlers;
    if (!pendingAsynchronousLoadHandlers)
    {
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = self->_pendingAsynchronousLoadHandlers;
      self->_pendingAsynchronousLoadHandlers = v12;

      pendingAsynchronousLoadHandlers = self->_pendingAsynchronousLoadHandlers;
    }
    v14 = _Block_copy(v4);
    -[NSMutableArray addObject:](pendingAsynchronousLoadHandlers, "addObject:", v14);

    v15 = self->_asynchronousLoadGroup;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__LPLinkMetadata__loadAsynchronousFieldsWithUpdateHandler___block_invoke;
    v17[3] = &unk_1E44A7E78;
    v17[4] = self;
    v18 = (OS_dispatch_group *)v4;
    dispatch_group_notify(v15, MEMORY[0x1E0C80D38], v17);
    v16 = v18;
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    v16 = self->_asynchronousLoadGroup;
    self->_asynchronousLoadGroup = 0;
  }

}

void __59__LPLinkMetadata__loadAsynchronousFieldsWithUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

- (id)_createAsynchronousLoadDeferralToken
{
  NSObject *asynchronousLoadGroup;
  OS_dispatch_group *v4;
  OS_dispatch_group *v5;
  uint64_t v6;
  _QWORD aBlock[5];

  asynchronousLoadGroup = self->_asynchronousLoadGroup;
  if (!asynchronousLoadGroup)
  {
    v4 = (OS_dispatch_group *)dispatch_group_create();
    v5 = self->_asynchronousLoadGroup;
    self->_asynchronousLoadGroup = v4;

    asynchronousLoadGroup = self->_asynchronousLoadGroup;
  }
  dispatch_group_enter(asynchronousLoadGroup);
  v6 = MEMORY[0x1E0C809B0];
  ++self->_asynchronousLoadDeferralTokenCount;
  aBlock[0] = v6;
  aBlock[1] = 3221225472;
  aBlock[2] = __54__LPLinkMetadata__createAsynchronousLoadDeferralToken__block_invoke;
  aBlock[3] = &unk_1E44A7CE8;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

void __54__LPLinkMetadata__createAsynchronousLoadDeferralToken__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDeferringAsynchronousLoads") & 1) == 0)
  {
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
    v7 = 0u;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_loadAsynchronousFieldsWithLoadGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (_QWORD)v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)_invokePendingAsynchronousLoadUpdateHandlers
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[NSMutableArray copy](self->_pendingAsynchronousLoadHandlers, "copy");
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)_loadAsynchronousFieldsWithLoadGroup:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke;
  v7[3] = &unk_1E44A80A0;
  v8 = v4;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  -[LPLinkMetadata _enumerateAsynchronousFields:](self, "_enumerateAsynchronousFields:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  unsigned int i;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE5E5EA8))
    {
      v6 = v5;
      if ((objc_msgSend(v6, "needsAsynchronousLoad") & 1) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke_2;
        v23[3] = &unk_1E44A8028;
        v23[4] = *(_QWORD *)(a1 + 32);
        v24 = v3;
        v25 = v6;
        v26 = *(id *)(a1 + 40);
        objc_msgSend(v25, "loadAsynchronouslyWithCompletionHandler:", v23);

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v5;
        objc_msgSend(MEMORY[0x1E0CB3868], "strongObjectsPointerArray");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; objc_msgSend(v7, "count") > (unint64_t)i; ++i)
          objc_msgSend(v8, "addPointer:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke_3;
        v16[3] = &unk_1E44A8078;
        v10 = v8;
        v12 = *(void **)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        v17 = v10;
        v22 = v11;
        v13 = v12;
        v14 = *(_QWORD *)(a1 + 32);
        v18 = v13;
        v19 = v14;
        v20 = v3;
        v15 = v7;
        v21 = v15;
        objc_msgSend(v15, "enumerateObjectsUsingBlock:", v16);

      }
    }
  }

}

void __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);

  if (v3 == v4)
    objc_msgSend(*(id *)(a1 + 32), "setValue:forKeyPath:", v5, *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  if ((objc_msgSend(v5, "needsAsynchronousLoad") & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke_4;
    v9[3] = &unk_1E44A8050;
    v6 = *(id *)(a1 + 32);
    v15 = a3;
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(void **)(a1 + 56);
    v10 = v6;
    v11 = v7;
    v12 = v8;
    v13 = *(id *)(a1 + 64);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v5, "loadAsynchronouslyWithCompletionHandler:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "replacePointerAtIndex:withPointer:", a3, v5);
  }

}

void __55__LPLinkMetadata__loadAsynchronousFieldsWithLoadGroup___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "replacePointerAtIndex:withPointer:", *(_QWORD *)(a1 + 72), a2);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v4)
  {

LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "valueForKeyPath:", *(_QWORD *)(a1 + 48), (_QWORD)v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == *(void **)(a1 + 56);

    if (v11)
    {
      v12 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forKeyPath:", v13, *(_QWORD *)(a1 + 48));

    }
    goto LABEL_13;
  }
  v5 = *(_QWORD *)v15;
  v6 = 1;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v15 != v5)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

      v6 &= v8 ^ 1;
    }
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v4);

  if (v6)
    goto LABEL_11;
LABEL_13:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (void)_enumerateSubstitutableFields:(id)a3
{
  void (**v4)(id, const __CFString *);

  v4 = (void (**)(id, const __CFString *))a3;
  v4[2](v4, CFSTR("arAsset"));
  -[LPLinkMetadata _enumerateAsynchronousFields:](self, "_enumerateAsynchronousFields:", v4);

}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (**v4)(id, const __CFString *);
  LPSpecializationMetadata *specialization;
  void (**v6)(id, const __CFString *);
  _QWORD v7[4];
  void (**v8)(id, const __CFString *);

  v4 = (void (**)(id, const __CFString *))a3;
  v4[2](v4, CFSTR("icon"));
  v4[2](v4, CFSTR("image"));
  v4[2](v4, CFSTR("video"));
  v4[2](v4, CFSTR("alternateImages"));
  specialization = self->_specialization;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__LPLinkMetadata__enumerateAsynchronousFields___block_invoke;
  v7[3] = &unk_1E44A80C8;
  v6 = v4;
  v8 = v6;
  -[LPSpecializationMetadata _enumerateAsynchronousFields:](specialization, "_enumerateAsynchronousFields:", v7);

}

void __47__LPLinkMetadata__enumerateAsynchronousFields___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(CFSTR("specialization."), "stringByAppendingString:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

- (void)_populateMetadataForBackwardCompatibility
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[LPLinkMetadata specialization](self, "specialization");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[LPLinkMetadata specialization](self, "specialization");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EE5E86C8) & 1) == 0)
    {

      goto LABEL_7;
    }
    -[LPLinkMetadata specialization](self, "specialization");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[LPLinkMetadata specialization](self, "specialization");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "populateMetadataForBackwardCompatibility:", self);
LABEL_7:

    }
  }
}

- (void)_decodeAllImagesWithMaximumSize:(CGSize)a3
{
  _QWORD v3[5];
  CGSize v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__LPLinkMetadata__decodeAllImagesWithMaximumSize___block_invoke;
  v3[3] = &unk_1E44A8110;
  v3[4] = self;
  v4 = a3;
  -[LPLinkMetadata _enumerateAsynchronousFields:](self, "_enumerateAsynchronousFields:", v3);
}

void __50__LPLinkMetadata__decodeAllImagesWithMaximumSize___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  _QWORD v7[4];
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "_synchronouslyDecodePlatformImageWithMaximumSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));

      return;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v6;
    if ((isKindOfClass & 1) != 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __50__LPLinkMetadata__decodeAllImagesWithMaximumSize___block_invoke_2;
      v7[3] = &__block_descriptor_48_e41_v32__0___LPAsynchronousResource__8Q16_B24l;
      v8 = *(_OWORD *)(a1 + 40);
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
      v4 = v6;
    }
  }

}

void __50__LPLinkMetadata__decodeAllImagesWithMaximumSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "_synchronouslyDecodePlatformImageWithMaximumSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));

}

- (id)_initWithSynapseContentItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  LPLinkMetadata *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "linkPreviewMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (objc_msgSend(v4, "linkPreviewMetadata"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        +[LPLinkMetadata metadataWithDataRepresentation:](LPLinkMetadata, "metadataWithDataRepresentation:", v6), v7 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    v8 = -[LPLinkMetadata init](self, "init");
    if (!v8)
    {
      v12 = 0;
      goto LABEL_7;
    }
    self = v8;
    objc_msgSend(v4, "itemURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setOriginalURL:](self, "setOriginalURL:", v9);

    objc_msgSend(v4, "itemURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setURL:](self, "setURL:", v10);

    objc_msgSend(v4, "displayTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setTitle:](self, "setTitle:", v11);

    v7 = self;
  }
  objc_msgSend(v7, "setOriginatingSynapseContentItem:", v4);
  v12 = v7;

LABEL_7:
  return v12;
}

- (id)_initWithConversationActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  LPLinkMetadata *v9;
  void *v10;
  void *v11;
  void *v12;
  LPImage *v13;
  id v14;
  void *v15;
  void *v16;
  LPImage *v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "linkMetadatablob");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_msgSend(v5, "linkMetadatablob"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        +[LPLinkMetadata metadataWithDataRepresentation:](LPLinkMetadata, "metadataWithDataRepresentation:", v7), v8 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v8))
  {
    v9 = -[LPLinkMetadata init](self, "init");
    if (!v9)
    {
      v18 = 0;
      goto LABEL_9;
    }
    self = v9;
    objc_msgSend(v5, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setTitle:](self, "setTitle:", v10);

    objc_msgSend(v5, "subTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setSummary:](self, "setSummary:", v11);

    objc_msgSend(v5, "imageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [LPImage alloc];
      v14 = objc_alloc(MEMORY[0x1E0DC3870]);
      objc_msgSend(v5, "imageData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithData:", v15);
      v17 = -[LPImage initWithPlatformImage:](v13, "initWithPlatformImage:", v16);
      -[LPLinkMetadata setImage:](self, "setImage:", v17);

    }
    v8 = self;
  }
  objc_msgSend(v8, "setConversationActivity:", v4);
  v18 = v8;

LABEL_9:
  return v18;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("originalURL"), CFSTR("URL"), CFSTR("title"), CFSTR("originalTitle"), CFSTR("summary"), CFSTR("selectedText"), CFSTR("siteName"), CFSTR("itemType"), CFSTR("relatedURL"), CFSTR("creator"), CFSTR("creatorFacebookProfile"), CFSTR("creatorTwitterUsername"), CFSTR("twitterCard"), CFSTR("usesActivityPub"), CFSTR("appleContentID"), CFSTR("appleSummary"), CFSTR("themeColor"),
               CFSTR("icon"),
               CFSTR("iconMetadata"),
               CFSTR("image"),
               CFSTR("alternateImages"),
               CFSTR("contentImages"),
               CFSTR("contentImagesMetadata"),
               CFSTR("imageMetadata"),
               CFSTR("video"),
               CFSTR("videoMetadata"),
               CFSTR("audio"),
               CFSTR("audioMetadata"),
               CFSTR("arAsset"),
               CFSTR("arAssetMetadata"),
               CFSTR("icons"),
               CFSTR("images"),
               CFSTR("videos"),
               CFSTR("streamingVideos"),
               CFSTR("audios"),
               CFSTR("arAssets"),
               CFSTR("associatedApplication"),
               CFSTR("sourceApplication"),
               CFSTR("originatingSynapseContentItem"),
               CFSTR("conversationActivity"),
               CFSTR("collaborationType"),
               CFSTR("collaborationMetadata"),
               CFSTR("product"),
               CFSTR("specialization"),
               CFSTR("specialization._dummyPropertyForObservation"),
               0);
}

- (NSString)originalTitle
{
  NSString *originalTitle;

  originalTitle = self->_originalTitle;
  if (!originalTitle)
    originalTitle = self->_title;
  return originalTitle;
}

- (void)setOriginalTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)_isIncomplete
{
  return self->_incomplete;
}

- (void)_setIncomplete:(BOOL)a3
{
  self->_incomplete = a3;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(NSURL *)originalURL
{
  objc_storeStrong((id *)&self->_originalURL, originalURL);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(NSURL *)URL
{
  objc_storeStrong((id *)&self->_URL, URL);
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)siteName
{
  return self->_siteName;
}

- (void)setSiteName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)itemType
{
  return self->_itemType;
}

- (void)setItemType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSURL)relatedURL
{
  return self->_relatedURL;
}

- (void)setRelatedURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)creator
{
  return self->_creator;
}

- (void)setCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)creatorFacebookProfile
{
  return self->_creatorFacebookProfile;
}

- (void)setCreatorFacebookProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)creatorTwitterUsername
{
  return self->_creatorTwitterUsername;
}

- (void)setCreatorTwitterUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)twitterCard
{
  return self->_twitterCard;
}

- (void)setTwitterCard:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)usesActivityPub
{
  return self->_usesActivityPub;
}

- (void)setUsesActivityPub:(BOOL)a3
{
  self->_usesActivityPub = a3;
}

- (NSString)appleContentID
{
  return self->_appleContentID;
}

- (void)setAppleContentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)appleSummary
{
  return self->_appleSummary;
}

- (void)setAppleSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (void)setThemeColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (LPARAsset)arAsset
{
  return self->_arAsset;
}

- (void)setArAsset:(id)a3
{
  objc_storeStrong((id *)&self->_arAsset, a3);
}

- (LPARAssetMetadata)arAssetMetadata
{
  return self->_arAssetMetadata;
}

- (void)setArAssetMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_arAssetMetadata, a3);
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (LPIconMetadata)iconMetadata
{
  return self->_iconMetadata;
}

- (void)setIconMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_iconMetadata, a3);
}

- (LPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSArray)alternateImages
{
  return self->_alternateImages;
}

- (void)setAlternateImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)contentImages
{
  return self->_contentImages;
}

- (void)setContentImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSArray)contentImagesMetadata
{
  return self->_contentImagesMetadata;
}

- (void)setContentImagesMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (LPImageMetadata)imageMetadata
{
  return self->_imageMetadata;
}

- (void)setImageMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_imageMetadata, a3);
}

- (LPVideo)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
  objc_storeStrong((id *)&self->_video, a3);
}

- (LPVideoMetadata)videoMetadata
{
  return self->_videoMetadata;
}

- (void)setVideoMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_videoMetadata, a3);
}

- (LPAudio)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
  objc_storeStrong((id *)&self->_audio, a3);
}

- (LPAudioMetadata)audioMetadata
{
  return self->_audioMetadata;
}

- (void)setAudioMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_audioMetadata, a3);
}

- (NSArray)arAssets
{
  return self->_arAssets;
}

- (void)setArAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSArray)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSArray)videos
{
  return self->_videos;
}

- (void)setVideos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSArray)streamingVideos
{
  return self->_streamingVideos;
}

- (void)setStreamingVideos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSArray)audios
{
  return self->_audios;
}

- (void)setAudios:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (LPAssociatedApplicationMetadata)associatedApplication
{
  return self->_associatedApplication;
}

- (void)setAssociatedApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (SYContentItem)originatingSynapseContentItem
{
  return self->_originatingSynapseContentItem;
}

- (void)setOriginatingSynapseContentItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (TUConversationActivity)conversationActivity
{
  return self->_conversationActivity;
}

- (void)setConversationActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (int64_t)collaborationType
{
  return self->_collaborationType;
}

- (void)setCollaborationType:(int64_t)a3
{
  self->_collaborationType = a3;
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void)setCollaborationMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (LPSourceApplicationMetadata)sourceApplication
{
  return self->_sourceApplication;
}

- (void)setSourceApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (LPProductMetadata)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (LPSpecializationMetadata)specialization
{
  return self->_specialization;
}

- (void)setSpecialization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialization, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_storeStrong((id *)&self->_conversationActivity, 0);
  objc_storeStrong((id *)&self->_originatingSynapseContentItem, 0);
  objc_storeStrong((id *)&self->_associatedApplication, 0);
  objc_storeStrong((id *)&self->_audios, 0);
  objc_storeStrong((id *)&self->_streamingVideos, 0);
  objc_storeStrong((id *)&self->_videos, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_arAssets, 0);
  objc_storeStrong((id *)&self->_audioMetadata, 0);
  objc_storeStrong((id *)&self->_audio, 0);
  objc_storeStrong((id *)&self->_videoMetadata, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_imageMetadata, 0);
  objc_storeStrong((id *)&self->_contentImagesMetadata, 0);
  objc_storeStrong((id *)&self->_contentImages, 0);
  objc_storeStrong((id *)&self->_alternateImages, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_iconMetadata, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_arAssetMetadata, 0);
  objc_storeStrong((id *)&self->_arAsset, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_appleSummary, 0);
  objc_storeStrong((id *)&self->_appleContentID, 0);
  objc_storeStrong((id *)&self->_twitterCard, 0);
  objc_storeStrong((id *)&self->_creatorTwitterUsername, 0);
  objc_storeStrong((id *)&self->_creatorFacebookProfile, 0);
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_relatedURL, 0);
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_siteName, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_originalTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_pendingAsynchronousLoadHandlers, 0);
  objc_storeStrong((id *)&self->_finishedDeferringAsynchronousLoadHandlers, 0);
  objc_storeStrong((id *)&self->_asynchronousLoadGroup, 0);
}

- (BOOL)_hasMedia
{
  LPLinkMetadata *v2;
  LPVideo *v3;
  LPARAsset *v4;
  LPImage *v6;
  LPImage *v7;
  unsigned __int8 v8;

  v2 = self;
  v3 = -[LPLinkMetadata video](v2, sel_video);

  if (v3 || (v4 = -[LPLinkMetadata arAsset](v2, sel_arAsset), v4, v4))
  {

    return 1;
  }
  else
  {
    v6 = -[LPLinkMetadata image](v2, sel_image);
    if (v6)
    {
      v7 = v6;
      v8 = -[LPImage _isLowResolutionAsImage](v6, sel__isLowResolutionAsImage);

      return v8 ^ 1;
    }
    else
    {

      return 0;
    }
  }
}

- (id)variants
{
  LPLinkMetadata *v2;
  void *v3;

  v2 = self;
  LPLinkMetadata.variants()();

  sub_1A0D12A2C(0, &qword_1ECEE8F80);
  v3 = (void *)sub_1A0D2BBF8();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, v0, v1, "Failed to decode LPLinkMetadata 'specialization' with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, v0, v1, "Failed to decode LPLinkMetadata 'specialization' with exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithCoder:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, v0, v1, "Failed to decode LPLinkMetadata 'specialization2' with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithCoder:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, v0, v1, "Failed to decode LPLinkMetadata 'specialization2' with exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithCoder:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, v0, v1, "Failed to decode LPLinkMetadata 'collaborationMetadata' with exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithCoder:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, v0, v1, "Failed to decode LPLinkMetadata 'conversationActivity' with exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)metadataWithDataRepresentation:decodingType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, v0, v1, "LPLinkMetadata: Failed to decode with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)metadataWithDataRepresentation:decodingType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, v0, v1, "LPLinkMetadata: Failed to decode with exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)metadataWithDataRepresentation:(os_log_t)log decodingType:.cold.3(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_error_impl(&dword_1A0C41000, log, OS_LOG_TYPE_ERROR, "LPLinkMetadata: Failed to decode: excessive size (%{iec-bytes}lu)", buf, 0xCu);
}

@end
