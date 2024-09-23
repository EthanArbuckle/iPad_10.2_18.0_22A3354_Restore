@implementation _BlastDoorLPLinkMetadata

- (_BlastDoorLPLinkMetadata)init
{
  _BlastDoorLPLinkMetadata *v2;
  _BlastDoorLPLinkMetadata *v3;
  _BlastDoorLPLinkMetadata *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_BlastDoorLPLinkMetadata;
  v2 = -[_BlastDoorLPLinkMetadata init](&v6, sel_init);
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
  _BlastDoorLPLinkMetadata *v5;
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
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t i;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  id v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t n;
  id v72;
  void *v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t ii;
  id v80;
  void *v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t jj;
  id v88;
  id v89;
  void *v90;
  id v91;
  _BlastDoorLPAssociatedApplicationMetadata *v92;
  id v93;
  void *v94;
  id *v95;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  id *p_isa;
  id v103;
  id v104;
  id obj;
  id v106;
  _BYTE v107[128];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_BlastDoorLPLinkMetadata init](self, "init");
  if (v5)
  {
    URLForKey(v4, CFSTR("LPMetadataURL"));
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

    URLForKey(v4, CFSTR("LPMetadataRelatedURL"));
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

    numberForKey(v4, CFSTR("LPMetadataUsesActivityPub"));
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

    v33 = v4;
    objc_msgSend(v33, "objectForKey:", CFSTR("LPMetadataIcons"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        -[_BlastDoorLPLinkMetadata _initWithDictionary:].cold.3();
    }
    objc_opt_class();
    p_isa = (id *)&v5->super.isa;
    v100 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v34, "count"))
    {
      v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v138 = 0u;
      v139 = 0u;
      v140 = 0u;
      v141 = 0u;
      v36 = v34;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v138, v137, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v139;
        while (2)
        {
          v40 = v33;
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v139 != v39)
              objc_enumerationMutation(v36);
            v42 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              -[_BlastDoorLPLinkMetadata _initWithDictionary:].cold.2();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v44 = 0;
              v33 = v40;
              goto LABEL_18;
            }
            truncatedStringAtMaximumMetadataLength(v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v43);

          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v138, v137, 16);
          v33 = v40;
          if (v38)
            continue;
          break;
        }
      }

      v44 = v35;
LABEL_18:

    }
    else
    {
      v44 = 0;
    }

    v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    obj = v44;
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v132, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v134;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v134 != v48)
            objc_enumerationMutation(obj);
          URLFromStringIfHTTPFamily(*(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * j));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
          {
            v51 = -[_BlastDoorLPIconMetadata _initWithURL:]([_BlastDoorLPIconMetadata alloc], "_initWithURL:", v50);
            if (v51)
              objc_msgSend(v45, "addObject:", v51);

          }
        }
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v132, 16);
      }
      while (v47);
    }

    objc_storeStrong((id *)&v5->_icons, v45);
    arrayOfDictionariesForKey(v33, CFSTR("LPMetadataARAssets"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v104 = v52;
    v54 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v128, v127, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v129;
      do
      {
        for (k = 0; k != v55; ++k)
        {
          if (*(_QWORD *)v129 != v56)
            objc_enumerationMutation(v104);
          v58 = -[_BlastDoorLPARAssetMetadata _initWithDictionary:]([_BlastDoorLPARAssetMetadata alloc], "_initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * k));
          if (v58)
            objc_msgSend(v53, "addObject:", v58);

        }
        v55 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v128, v127, 16);
      }
      while (v55);
    }

    objc_storeStrong((id *)&v5->_arAssets, v53);
    arrayOfDictionariesForKey(v33, CFSTR("LPMetadataImages"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v103 = v59;
    v60 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v123, v122, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v124;
      do
      {
        for (m = 0; m != v61; ++m)
        {
          if (*(_QWORD *)v124 != v62)
            objc_enumerationMutation(v103);
          v64 = -[_BlastDoorLPImageMetadata _initWithDictionary:]([_BlastDoorLPImageMetadata alloc], "_initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * m));
          if (v64)
            objc_msgSend(v106, "addObject:", v64);

        }
        v61 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v123, v122, 16);
      }
      while (v61);
    }
    v98 = v53;
    v99 = v45;

    objc_storeStrong((id *)&v5->_images, v106);
    arrayOfDictionariesForKey(v33, CFSTR("LPMetadataVideos"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v67 = v65;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v118, v117, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v119;
      do
      {
        for (n = 0; n != v69; ++n)
        {
          if (*(_QWORD *)v119 != v70)
            objc_enumerationMutation(v67);
          v72 = -[_BlastDoorLPVideoMetadata _initWithDictionary:]([_BlastDoorLPVideoMetadata alloc], "_initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * n));
          if (v72)
            objc_msgSend(v66, "addObject:", v72);

        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v118, v117, 16);
      }
      while (v69);
    }

    objc_storeStrong((id *)&v5->_videos, v66);
    v101 = v33;
    arrayOfDictionariesForKey(v33, CFSTR("LPMetadataStreamingVideos"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v75 = v73;
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v113, v112, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v114;
      do
      {
        for (ii = 0; ii != v77; ++ii)
        {
          if (*(_QWORD *)v114 != v78)
            objc_enumerationMutation(v75);
          v80 = -[_BlastDoorLPVideoMetadata _initWithDictionary:]([_BlastDoorLPVideoMetadata alloc], "_initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * ii));
          if (v80)
            objc_msgSend(v74, "addObject:", v80);

        }
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v113, v112, 16);
      }
      while (v77);
    }
    v97 = v67;

    objc_storeStrong(p_isa + 39, v74);
    arrayOfDictionariesForKey(v101, CFSTR("LPMetadataAudios"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v83 = v81;
    v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v108, v107, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v109;
      do
      {
        for (jj = 0; jj != v85; ++jj)
        {
          if (*(_QWORD *)v109 != v86)
            objc_enumerationMutation(v83);
          v88 = -[_BlastDoorLPAudioMetadata _initWithDictionary:]([_BlastDoorLPAudioMetadata alloc], "_initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * jj), v97, v98, v99);
          if (v88)
            objc_msgSend(v82, "addObject:", v88);

        }
        v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v108, v107, 16);
      }
      while (v85);
    }

    v5 = (_BlastDoorLPLinkMetadata *)p_isa;
    objc_storeStrong(p_isa + 40, v82);
    v89 = v101;
    objc_msgSend(v89, "objectForKey:", CFSTR("LPMetadataAssociatedApplication"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (v90)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        -[_BlastDoorLPLinkMetadata _initWithDictionary:].cold.1();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v100;
      if (objc_msgSend(v90, "count"))
        v91 = v90;
      else
        v91 = 0;
    }
    else
    {
      v91 = 0;
      v4 = v100;
    }

    if (v91)
    {
      v92 = objc_alloc_init(_BlastDoorLPAssociatedApplicationMetadata);
      v93 = p_isa[41];
      p_isa[41] = v92;

      stringForKey(v91, CFSTR("app-clip-bundle-id"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[41], "setBundleIdentifier:", v94);

    }
    v95 = p_isa;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPLinkMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPLinkMetadata *v5;
  uint64_t v6;
  NSURL *originalURL;
  uint64_t v8;
  NSURL *URL;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *summary;
  uint64_t v14;
  NSString *selectedText;
  uint64_t v16;
  NSString *siteName;
  uint64_t v18;
  NSString *itemType;
  uint64_t v20;
  NSURL *relatedURL;
  uint64_t v22;
  NSString *creator;
  uint64_t v24;
  NSString *creatorFacebookProfile;
  uint64_t v26;
  NSString *creatorTwitterUsername;
  uint64_t v28;
  NSString *twitterCard;
  uint64_t v30;
  NSString *appleContentID;
  uint64_t v32;
  NSString *appleSummary;
  uint64_t v34;
  _BlastDoorLPPlatformColor *themeColor;
  void *v36;
  uint64_t v37;
  _BlastDoorLPIconMetadata *iconMetadata;
  void *v39;
  void *v40;
  uint64_t v41;
  _BlastDoorLPImageMetadata *imageMetadata;
  void *v43;
  uint64_t v44;
  NSArray *contentImagesMetadata;
  void *v46;
  uint64_t v47;
  _BlastDoorLPVideoMetadata *videoMetadata;
  void *v49;
  uint64_t v50;
  _BlastDoorLPAudioMetadata *audioMetadata;
  void *v52;
  uint64_t v53;
  _BlastDoorLPARAssetMetadata *arAssetMetadata;
  uint64_t v55;
  NSArray *icons;
  uint64_t v57;
  NSArray *images;
  uint64_t v59;
  NSArray *availableContentImages;
  uint64_t v61;
  NSArray *videos;
  uint64_t v63;
  NSArray *streamingVideos;
  uint64_t v65;
  NSArray *audios;
  uint64_t v67;
  NSArray *arAssets;
  uint64_t v69;
  _BlastDoorLPAssociatedApplicationMetadata *associatedApplication;
  void *v71;
  _BlastDoorLPLinkMetadata *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  uint64_t v79;
  _SWCollaborationMetadata *collaborationMetadata;
  void *v81;
  uint64_t v82;
  id v83;
  _BlastDoorLPSpecializationMetadata *specialization;
  void *v85;
  uint64_t v86;
  id v87;
  _BlastDoorLPSpecializationMetadata *v88;
  id v90;
  id v91;
  objc_super v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v92.receiver = self;
  v92.super_class = (Class)_BlastDoorLPLinkMetadata;
  v5 = -[_BlastDoorLPLinkMetadata init](&v92, sel_init);
  if (!v5)
    goto LABEL_3;
  v5->_version = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version"));
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

  decodeStringForKey(v4, (uint64_t)CFSTR("summary"));
  v12 = objc_claimAutoreleasedReturnValue();
  summary = v5->_summary;
  v5->_summary = (NSString *)v12;

  decodeStringForKey(v4, (uint64_t)CFSTR("selection"));
  v14 = objc_claimAutoreleasedReturnValue();
  selectedText = v5->_selectedText;
  v5->_selectedText = (NSString *)v14;

  decodeStringForKey(v4, (uint64_t)CFSTR("siteName"));
  v16 = objc_claimAutoreleasedReturnValue();
  siteName = v5->_siteName;
  v5->_siteName = (NSString *)v16;

  decodeStringForKey(v4, (uint64_t)CFSTR("itemType"));
  v18 = objc_claimAutoreleasedReturnValue();
  itemType = v5->_itemType;
  v5->_itemType = (NSString *)v18;

  decodeURLForKey(v4, CFSTR("relatedURL"));
  v20 = objc_claimAutoreleasedReturnValue();
  relatedURL = v5->_relatedURL;
  v5->_relatedURL = (NSURL *)v20;

  decodeStringForKey(v4, (uint64_t)CFSTR("creator"));
  v22 = objc_claimAutoreleasedReturnValue();
  creator = v5->_creator;
  v5->_creator = (NSString *)v22;

  decodeStringForKey(v4, (uint64_t)CFSTR("creatorFacebookProfile"));
  v24 = objc_claimAutoreleasedReturnValue();
  creatorFacebookProfile = v5->_creatorFacebookProfile;
  v5->_creatorFacebookProfile = (NSString *)v24;

  decodeStringForKey(v4, (uint64_t)CFSTR("creatorTwitterUsername"));
  v26 = objc_claimAutoreleasedReturnValue();
  creatorTwitterUsername = v5->_creatorTwitterUsername;
  v5->_creatorTwitterUsername = (NSString *)v26;

  decodeStringForKey(v4, (uint64_t)CFSTR("twitterCard"));
  v28 = objc_claimAutoreleasedReturnValue();
  twitterCard = v5->_twitterCard;
  v5->_twitterCard = (NSString *)v28;

  v5->_usesActivityPub = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesActivityPub"));
  decodeStringForKey(v4, (uint64_t)CFSTR("appleContentID"));
  v30 = objc_claimAutoreleasedReturnValue();
  appleContentID = v5->_appleContentID;
  v5->_appleContentID = (NSString *)v30;

  decodeStringForKey(v4, (uint64_t)CFSTR("appleSummary"));
  v32 = objc_claimAutoreleasedReturnValue();
  appleSummary = v5->_appleSummary;
  v5->_appleSummary = (NSString *)v32;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeColorForKey:", CFSTR("themeColor"));
  v34 = objc_claimAutoreleasedReturnValue();
  themeColor = v5->_themeColor;
  v5->_themeColor = (_BlastDoorLPPlatformColor *)v34;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BlastDoorLPLinkMetadata setIcon:](v5, "setIcon:", v36);

  objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconMetadata"));
  v37 = objc_claimAutoreleasedReturnValue();
  iconMetadata = v5->_iconMetadata;
  v5->_iconMetadata = (_BlastDoorLPIconMetadata *)v37;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("image"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BlastDoorLPLinkMetadata setImage:](v5, "setImage:", v39);

  objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfLPImagesForKey:", CFSTR("alternateImages"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BlastDoorLPLinkMetadata setAlternateImages:](v5, "setAlternateImages:", v40);

  objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageMetadata"));
  v41 = objc_claimAutoreleasedReturnValue();
  imageMetadata = v5->_imageMetadata;
  v5->_imageMetadata = (_BlastDoorLPImageMetadata *)v41;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfLPImagesForKey:", CFSTR("contentImages"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BlastDoorLPLinkMetadata setContentImages:](v5, "setContentImages:", v43);

  objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("contentImagesMetadata"));
  v44 = objc_claimAutoreleasedReturnValue();
  contentImagesMetadata = v5->_contentImagesMetadata;
  v5->_contentImagesMetadata = (NSArray *)v44;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeLPVideoForKey:", CFSTR("video"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BlastDoorLPLinkMetadata setVideo:](v5, "setVideo:", v46);

  objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoMetadata"));
  v47 = objc_claimAutoreleasedReturnValue();
  videoMetadata = v5->_videoMetadata;
  v5->_videoMetadata = (_BlastDoorLPVideoMetadata *)v47;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audio"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BlastDoorLPLinkMetadata setAudio:](v5, "setAudio:", v49);

  objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioMetadata"));
  v50 = objc_claimAutoreleasedReturnValue();
  audioMetadata = v5->_audioMetadata;
  v5->_audioMetadata = (_BlastDoorLPAudioMetadata *)v50;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeLPARAssetForKey:", CFSTR("arAsset"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BlastDoorLPLinkMetadata setArAsset:](v5, "setArAsset:", v52);

  objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arAssetMetadata"));
  v53 = objc_claimAutoreleasedReturnValue();
  arAssetMetadata = v5->_arAssetMetadata;
  v5->_arAssetMetadata = (_BlastDoorLPARAssetMetadata *)v53;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("icons"));
  v55 = objc_claimAutoreleasedReturnValue();
  icons = v5->_icons;
  v5->_icons = (NSArray *)v55;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("images"));
  v57 = objc_claimAutoreleasedReturnValue();
  images = v5->_images;
  v5->_images = (NSArray *)v57;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("availableContentImages"));
  v59 = objc_claimAutoreleasedReturnValue();
  availableContentImages = v5->_availableContentImages;
  v5->_availableContentImages = (NSArray *)v59;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("videos"));
  v61 = objc_claimAutoreleasedReturnValue();
  videos = v5->_videos;
  v5->_videos = (NSArray *)v61;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("streamingVideos"));
  v63 = objc_claimAutoreleasedReturnValue();
  streamingVideos = v5->_streamingVideos;
  v5->_streamingVideos = (NSArray *)v63;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("audios"));
  v65 = objc_claimAutoreleasedReturnValue();
  audios = v5->_audios;
  v5->_audios = (NSArray *)v65;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("arAssets"));
  v67 = objc_claimAutoreleasedReturnValue();
  arAssets = v5->_arAssets;
  v5->_arAssets = (NSArray *)v67;

  objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedApplication"));
  v69 = objc_claimAutoreleasedReturnValue();
  associatedApplication = v5->_associatedApplication;
  v5->_associatedApplication = (_BlastDoorLPAssociatedApplicationMetadata *)v69;

  objc_msgSend(v4, "error");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v71)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("collaborationMetadata")))
    {
      v73 = (void *)MEMORY[0x1E0C99E60];
      v98 = 0;
      v99 = &v98;
      v100 = 0x2050000000;
      v74 = (void *)get_SWCollaborationMetadataClass_softClass;
      v101 = get_SWCollaborationMetadataClass_softClass;
      if (!get_SWCollaborationMetadataClass_softClass)
      {
        v93 = MEMORY[0x1E0C809B0];
        v94 = 3221225472;
        v95 = __get_SWCollaborationMetadataClass_block_invoke;
        v96 = &unk_1E5CCC218;
        v97 = &v98;
        __get_SWCollaborationMetadataClass_block_invoke((uint64_t)&v93);
        v74 = (void *)v99[3];
      }
      v75 = objc_retainAutorelease(v74);
      _Block_object_dispose(&v98, 8);
      v98 = 0;
      v99 = &v98;
      v100 = 0x2050000000;
      v76 = (void *)get_SWMutableCollaborationMetadataClass_softClass;
      v101 = get_SWMutableCollaborationMetadataClass_softClass;
      if (!get_SWMutableCollaborationMetadataClass_softClass)
      {
        v93 = MEMORY[0x1E0C809B0];
        v94 = 3221225472;
        v95 = __get_SWMutableCollaborationMetadataClass_block_invoke;
        v96 = &unk_1E5CCC218;
        v97 = &v98;
        __get_SWMutableCollaborationMetadataClass_block_invoke((uint64_t)&v93);
        v76 = (void *)v99[3];
      }
      v77 = objc_retainAutorelease(v76);
      _Block_object_dispose(&v98, 8);
      objc_msgSend(v73, "setWithObjects:", v75, v77, 0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v78, CFSTR("collaborationMetadata"));
      v79 = objc_claimAutoreleasedReturnValue();
      collaborationMetadata = v5->_collaborationMetadata;
      v5->_collaborationMetadata = (_SWCollaborationMetadata *)v79;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("specialization2")))
    {
      allKnownSpecializationClasses();
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = 0;
      objc_msgSend(v4, "_bd_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v81, CFSTR("specialization2"), &v91);
      v82 = objc_claimAutoreleasedReturnValue();
      v83 = v91;
      specialization = v5->_specialization;
      v5->_specialization = (_BlastDoorLPSpecializationMetadata *)v82;

    }
    if (!v5->_specialization && objc_msgSend(v4, "containsValueForKey:", CFSTR("specialization")))
    {
      allKnownSpecializationClasses();
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = 0;
      objc_msgSend(v4, "_bd_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v85, CFSTR("specialization"), &v90);
      v86 = objc_claimAutoreleasedReturnValue();
      v87 = v90;
      v88 = v5->_specialization;
      v5->_specialization = (_BlastDoorLPSpecializationMetadata *)v86;

    }
    v72 = v5;
  }
  else
  {
LABEL_3:
    v72 = 0;
  }

  return v72;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPLinkMetadata *v4;
  _BlastDoorLPLinkMetadata *v5;
  _BlastDoorLPLinkMetadata *v6;

  v4 = +[_BlastDoorLPLinkMetadata allocWithZone:](_BlastDoorLPLinkMetadata, "allocWithZone:", a3);
  v5 = v4;
  if (v4)
  {
    -[_BlastDoorLPLinkMetadata _copyPropertiesFrom:onlyUpgradeFields:](v4, "_copyPropertiesFrom:onlyUpgradeFields:", self, 0);
    v6 = v5;
  }

  return v5;
}

- (void)_copyPropertiesOnlyUpgradingFieldsFrom:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  id v181;

  v181 = a3;
  self->_version = objc_msgSend(v181, "version");
  -[_BlastDoorLPLinkMetadata originalURL](self, "originalURL");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        objc_msgSend(v181, "originalURL"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    objc_msgSend(v181, "originalURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setOriginalURL:](self, "setOriginalURL:", v7);

  }
  -[_BlastDoorLPLinkMetadata URL](self, "URL");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        objc_msgSend(v181, "URL"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    objc_msgSend(v181, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setURL:](self, "setURL:", v11);

  }
  -[_BlastDoorLPLinkMetadata title](self, "title");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12
    || (v13 = (void *)v12,
        objc_msgSend(v181, "title"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    objc_msgSend(v181, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    -[_BlastDoorLPLinkMetadata setTitle:](self, "setTitle:", v16);

  }
  -[_BlastDoorLPLinkMetadata summary](self, "summary");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17
    || (v18 = (void *)v17,
        objc_msgSend(v181, "summary"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v19))
  {
    objc_msgSend(v181, "summary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    -[_BlastDoorLPLinkMetadata setSummary:](self, "setSummary:", v21);

  }
  -[_BlastDoorLPLinkMetadata selectedText](self, "selectedText");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22
    || (v23 = (void *)v22,
        objc_msgSend(v181, "selectedText"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v24,
        v23,
        v24))
  {
    objc_msgSend(v181, "selectedText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    -[_BlastDoorLPLinkMetadata setSelectedText:](self, "setSelectedText:", v26);

  }
  -[_BlastDoorLPLinkMetadata siteName](self, "siteName");
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27
    || (v28 = (void *)v27,
        objc_msgSend(v181, "siteName"),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        v29,
        v28,
        v29))
  {
    objc_msgSend(v181, "siteName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    -[_BlastDoorLPLinkMetadata setSiteName:](self, "setSiteName:", v31);

  }
  -[_BlastDoorLPLinkMetadata itemType](self, "itemType");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32
    || (v33 = (void *)v32,
        objc_msgSend(v181, "itemType"),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v34,
        v33,
        v34))
  {
    objc_msgSend(v181, "itemType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "copy");
    -[_BlastDoorLPLinkMetadata setItemType:](self, "setItemType:", v36);

  }
  -[_BlastDoorLPLinkMetadata relatedURL](self, "relatedURL");
  v37 = objc_claimAutoreleasedReturnValue();
  if (!v37
    || (v38 = (void *)v37,
        objc_msgSend(v181, "relatedURL"),
        v39 = (void *)objc_claimAutoreleasedReturnValue(),
        v39,
        v38,
        v39))
  {
    objc_msgSend(v181, "relatedURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setRelatedURL:](self, "setRelatedURL:", v40);

  }
  -[_BlastDoorLPLinkMetadata creator](self, "creator");
  v41 = objc_claimAutoreleasedReturnValue();
  if (!v41
    || (v42 = (void *)v41,
        objc_msgSend(v181, "creator"),
        v43 = (void *)objc_claimAutoreleasedReturnValue(),
        v43,
        v42,
        v43))
  {
    objc_msgSend(v181, "creator");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v44, "copy");
    -[_BlastDoorLPLinkMetadata setCreator:](self, "setCreator:", v45);

  }
  -[_BlastDoorLPLinkMetadata creatorFacebookProfile](self, "creatorFacebookProfile");
  v46 = objc_claimAutoreleasedReturnValue();
  if (!v46
    || (v47 = (void *)v46,
        objc_msgSend(v181, "creatorFacebookProfile"),
        v48 = (void *)objc_claimAutoreleasedReturnValue(),
        v48,
        v47,
        v48))
  {
    objc_msgSend(v181, "creatorFacebookProfile");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v49, "copy");
    -[_BlastDoorLPLinkMetadata setCreatorFacebookProfile:](self, "setCreatorFacebookProfile:", v50);

  }
  -[_BlastDoorLPLinkMetadata creatorTwitterUsername](self, "creatorTwitterUsername");
  v51 = objc_claimAutoreleasedReturnValue();
  if (!v51
    || (v52 = (void *)v51,
        objc_msgSend(v181, "creatorTwitterUsername"),
        v53 = (void *)objc_claimAutoreleasedReturnValue(),
        v53,
        v52,
        v53))
  {
    objc_msgSend(v181, "creatorTwitterUsername");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v54, "copy");
    -[_BlastDoorLPLinkMetadata setCreatorTwitterUsername:](self, "setCreatorTwitterUsername:", v55);

  }
  -[_BlastDoorLPLinkMetadata twitterCard](self, "twitterCard");
  v56 = objc_claimAutoreleasedReturnValue();
  if (!v56
    || (v57 = (void *)v56,
        objc_msgSend(v181, "twitterCard"),
        v58 = (void *)objc_claimAutoreleasedReturnValue(),
        v58,
        v57,
        v58))
  {
    objc_msgSend(v181, "twitterCard");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v59, "copy");
    -[_BlastDoorLPLinkMetadata setTwitterCard:](self, "setTwitterCard:", v60);

  }
  if (-[_BlastDoorLPLinkMetadata usesActivityPub](self, "usesActivityPub"))
    v61 = 1;
  else
    v61 = objc_msgSend(v181, "usesActivityPub");
  -[_BlastDoorLPLinkMetadata setUsesActivityPub:](self, "setUsesActivityPub:", v61);
  -[_BlastDoorLPLinkMetadata appleContentID](self, "appleContentID");
  v62 = objc_claimAutoreleasedReturnValue();
  if (!v62
    || (v63 = (void *)v62,
        objc_msgSend(v181, "appleContentID"),
        v64 = (void *)objc_claimAutoreleasedReturnValue(),
        v64,
        v63,
        v64))
  {
    objc_msgSend(v181, "appleContentID");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(v65, "copy");
    -[_BlastDoorLPLinkMetadata setAppleContentID:](self, "setAppleContentID:", v66);

  }
  -[_BlastDoorLPLinkMetadata appleSummary](self, "appleSummary");
  v67 = objc_claimAutoreleasedReturnValue();
  if (!v67
    || (v68 = (void *)v67,
        objc_msgSend(v181, "appleSummary"),
        v69 = (void *)objc_claimAutoreleasedReturnValue(),
        v69,
        v68,
        v69))
  {
    objc_msgSend(v181, "appleSummary");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(v70, "copy");
    -[_BlastDoorLPLinkMetadata setAppleSummary:](self, "setAppleSummary:", v71);

  }
  -[_BlastDoorLPLinkMetadata themeColor](self, "themeColor");
  v72 = objc_claimAutoreleasedReturnValue();
  if (!v72
    || (v73 = (void *)v72,
        objc_msgSend(v181, "themeColor"),
        v74 = (void *)objc_claimAutoreleasedReturnValue(),
        v74,
        v73,
        v74))
  {
    objc_msgSend(v181, "themeColor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (void *)objc_msgSend(v75, "copy");
    -[_BlastDoorLPLinkMetadata setThemeColor:](self, "setThemeColor:", v76);

  }
  -[_BlastDoorLPLinkMetadata icon](self, "icon");
  v77 = objc_claimAutoreleasedReturnValue();
  if (!v77
    || (v78 = (void *)v77,
        objc_msgSend(v181, "icon"),
        v79 = (void *)objc_claimAutoreleasedReturnValue(),
        v79,
        v78,
        v79))
  {
    objc_msgSend(v181, "icon");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setIcon:](self, "setIcon:", v80);

  }
  -[_BlastDoorLPLinkMetadata iconMetadata](self, "iconMetadata");
  v81 = objc_claimAutoreleasedReturnValue();
  if (!v81
    || (v82 = (void *)v81,
        objc_msgSend(v181, "iconMetadata"),
        v83 = (void *)objc_claimAutoreleasedReturnValue(),
        v83,
        v82,
        v83))
  {
    objc_msgSend(v181, "iconMetadata");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setIconMetadata:](self, "setIconMetadata:", v84);

  }
  -[_BlastDoorLPLinkMetadata arAsset](self, "arAsset");
  v85 = objc_claimAutoreleasedReturnValue();
  if (!v85
    || (v86 = (void *)v85,
        objc_msgSend(v181, "arAsset"),
        v87 = (void *)objc_claimAutoreleasedReturnValue(),
        v87,
        v86,
        v87))
  {
    objc_msgSend(v181, "arAsset");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setArAsset:](self, "setArAsset:", v88);

  }
  -[_BlastDoorLPLinkMetadata arAssetMetadata](self, "arAssetMetadata");
  v89 = objc_claimAutoreleasedReturnValue();
  if (!v89
    || (v90 = (void *)v89,
        objc_msgSend(v181, "arAssetMetadata"),
        v91 = (void *)objc_claimAutoreleasedReturnValue(),
        v91,
        v90,
        v91))
  {
    objc_msgSend(v181, "arAssetMetadata");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setArAssetMetadata:](self, "setArAssetMetadata:", v92);

  }
  -[_BlastDoorLPLinkMetadata arAsset](self, "arAsset");
  v93 = objc_claimAutoreleasedReturnValue();
  if (!v93
    || (v94 = (void *)v93,
        objc_msgSend(v181, "arAsset"),
        v95 = (void *)objc_claimAutoreleasedReturnValue(),
        v95,
        v94,
        v95))
  {
    objc_msgSend(v181, "image");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setImage:](self, "setImage:", v96);

  }
  -[_BlastDoorLPLinkMetadata imageMetadata](self, "imageMetadata");
  v97 = objc_claimAutoreleasedReturnValue();
  if (!v97
    || (v98 = (void *)v97,
        objc_msgSend(v181, "imageMetadata"),
        v99 = (void *)objc_claimAutoreleasedReturnValue(),
        v99,
        v98,
        v99))
  {
    objc_msgSend(v181, "imageMetadata");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setImageMetadata:](self, "setImageMetadata:", v100);

  }
  -[_BlastDoorLPLinkMetadata contentImages](self, "contentImages");
  v101 = objc_claimAutoreleasedReturnValue();
  if (!v101
    || (v102 = (void *)v101,
        objc_msgSend(v181, "contentImages"),
        v103 = (void *)objc_claimAutoreleasedReturnValue(),
        v103,
        v102,
        v103))
  {
    objc_msgSend(v181, "contentImages");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setContentImages:](self, "setContentImages:", v104);

  }
  -[_BlastDoorLPLinkMetadata contentImagesMetadata](self, "contentImagesMetadata");
  v105 = objc_claimAutoreleasedReturnValue();
  if (!v105
    || (v106 = (void *)v105,
        objc_msgSend(v181, "contentImagesMetadata"),
        v107 = (void *)objc_claimAutoreleasedReturnValue(),
        v107,
        v106,
        v107))
  {
    objc_msgSend(v181, "contentImagesMetadata");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setContentImagesMetadata:](self, "setContentImagesMetadata:", v108);

  }
  -[_BlastDoorLPLinkMetadata video](self, "video");
  v109 = objc_claimAutoreleasedReturnValue();
  if (!v109
    || (v110 = (void *)v109,
        objc_msgSend(v181, "video"),
        v111 = (void *)objc_claimAutoreleasedReturnValue(),
        v111,
        v110,
        v111))
  {
    objc_msgSend(v181, "video");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setVideo:](self, "setVideo:", v112);

  }
  -[_BlastDoorLPLinkMetadata videoMetadata](self, "videoMetadata");
  v113 = objc_claimAutoreleasedReturnValue();
  if (!v113
    || (v114 = (void *)v113,
        objc_msgSend(v181, "videoMetadata"),
        v115 = (void *)objc_claimAutoreleasedReturnValue(),
        v115,
        v114,
        v115))
  {
    objc_msgSend(v181, "videoMetadata");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setVideoMetadata:](self, "setVideoMetadata:", v116);

  }
  -[_BlastDoorLPLinkMetadata audio](self, "audio");
  v117 = objc_claimAutoreleasedReturnValue();
  if (!v117
    || (v118 = (void *)v117,
        objc_msgSend(v181, "audio"),
        v119 = (void *)objc_claimAutoreleasedReturnValue(),
        v119,
        v118,
        v119))
  {
    objc_msgSend(v181, "audio");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setAudio:](self, "setAudio:", v120);

  }
  -[_BlastDoorLPLinkMetadata audioMetadata](self, "audioMetadata");
  v121 = objc_claimAutoreleasedReturnValue();
  if (!v121
    || (v122 = (void *)v121,
        objc_msgSend(v181, "audioMetadata"),
        v123 = (void *)objc_claimAutoreleasedReturnValue(),
        v123,
        v122,
        v123))
  {
    objc_msgSend(v181, "audioMetadata");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setAudioMetadata:](self, "setAudioMetadata:", v124);

  }
  -[_BlastDoorLPLinkMetadata icons](self, "icons");
  v125 = objc_claimAutoreleasedReturnValue();
  if (!v125
    || (v126 = (void *)v125,
        objc_msgSend(v181, "icons"),
        v127 = (void *)objc_claimAutoreleasedReturnValue(),
        v127,
        v126,
        v127))
  {
    objc_msgSend(v181, "icons");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = (void *)objc_msgSend(v128, "copy");
    -[_BlastDoorLPLinkMetadata setIcons:](self, "setIcons:", v129);

  }
  -[_BlastDoorLPLinkMetadata arAssets](self, "arAssets");
  v130 = objc_claimAutoreleasedReturnValue();
  if (!v130
    || (v131 = (void *)v130,
        objc_msgSend(v181, "arAssets"),
        v132 = (void *)objc_claimAutoreleasedReturnValue(),
        v132,
        v131,
        v132))
  {
    objc_msgSend(v181, "arAssets");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = (void *)objc_msgSend(v133, "copy");
    -[_BlastDoorLPLinkMetadata setArAssets:](self, "setArAssets:", v134);

  }
  -[_BlastDoorLPLinkMetadata images](self, "images");
  v135 = objc_claimAutoreleasedReturnValue();
  if (!v135
    || (v136 = (void *)v135,
        objc_msgSend(v181, "images"),
        v137 = (void *)objc_claimAutoreleasedReturnValue(),
        v137,
        v136,
        v137))
  {
    objc_msgSend(v181, "images");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = (void *)objc_msgSend(v138, "copy");
    -[_BlastDoorLPLinkMetadata setImages:](self, "setImages:", v139);

  }
  -[_BlastDoorLPLinkMetadata alternateImages](self, "alternateImages");
  v140 = objc_claimAutoreleasedReturnValue();
  if (!v140
    || (v141 = (void *)v140,
        objc_msgSend(v181, "alternateImages"),
        v142 = (void *)objc_claimAutoreleasedReturnValue(),
        v142,
        v141,
        v142))
  {
    objc_msgSend(v181, "alternateImages");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = (void *)objc_msgSend(v143, "copy");
    -[_BlastDoorLPLinkMetadata setAlternateImages:](self, "setAlternateImages:", v144);

  }
  -[_BlastDoorLPLinkMetadata availableContentImages](self, "availableContentImages");
  v145 = objc_claimAutoreleasedReturnValue();
  if (!v145
    || (v146 = (void *)v145,
        objc_msgSend(v181, "availableContentImages"),
        v147 = (void *)objc_claimAutoreleasedReturnValue(),
        v147,
        v146,
        v147))
  {
    objc_msgSend(v181, "availableContentImages");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = (void *)objc_msgSend(v148, "copy");
    -[_BlastDoorLPLinkMetadata setAvailableContentImages:](self, "setAvailableContentImages:", v149);

  }
  -[_BlastDoorLPLinkMetadata videos](self, "videos");
  v150 = objc_claimAutoreleasedReturnValue();
  if (!v150
    || (v151 = (void *)v150,
        objc_msgSend(v181, "videos"),
        v152 = (void *)objc_claimAutoreleasedReturnValue(),
        v152,
        v151,
        v152))
  {
    objc_msgSend(v181, "videos");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = (void *)objc_msgSend(v153, "copy");
    -[_BlastDoorLPLinkMetadata setVideos:](self, "setVideos:", v154);

  }
  -[_BlastDoorLPLinkMetadata streamingVideos](self, "streamingVideos");
  v155 = objc_claimAutoreleasedReturnValue();
  if (!v155
    || (v156 = (void *)v155,
        objc_msgSend(v181, "streamingVideos"),
        v157 = (void *)objc_claimAutoreleasedReturnValue(),
        v157,
        v156,
        v157))
  {
    objc_msgSend(v181, "streamingVideos");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = (void *)objc_msgSend(v158, "copy");
    -[_BlastDoorLPLinkMetadata setStreamingVideos:](self, "setStreamingVideos:", v159);

  }
  -[_BlastDoorLPLinkMetadata audios](self, "audios");
  v160 = objc_claimAutoreleasedReturnValue();
  if (!v160
    || (v161 = (void *)v160,
        objc_msgSend(v181, "audios"),
        v162 = (void *)objc_claimAutoreleasedReturnValue(),
        v162,
        v161,
        v162))
  {
    objc_msgSend(v181, "audios");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = (void *)objc_msgSend(v163, "copy");
    -[_BlastDoorLPLinkMetadata setAudios:](self, "setAudios:", v164);

  }
  -[_BlastDoorLPLinkMetadata associatedApplication](self, "associatedApplication");
  v165 = objc_claimAutoreleasedReturnValue();
  if (!v165
    || (v166 = (void *)v165,
        objc_msgSend(v181, "associatedApplication"),
        v167 = (void *)objc_claimAutoreleasedReturnValue(),
        v167,
        v166,
        v167))
  {
    objc_msgSend(v181, "associatedApplication");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = (void *)objc_msgSend(v168, "copy");
    -[_BlastDoorLPLinkMetadata setAssociatedApplication:](self, "setAssociatedApplication:", v169);

  }
  -[_BlastDoorLPLinkMetadata collaborationMetadata](self, "collaborationMetadata");
  v170 = objc_claimAutoreleasedReturnValue();
  if (!v170
    || (v171 = (void *)v170,
        objc_msgSend(v181, "collaborationMetadata"),
        v172 = (void *)objc_claimAutoreleasedReturnValue(),
        v172,
        v171,
        v172))
  {
    objc_msgSend(v181, "collaborationMetadata");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = (void *)objc_msgSend(v173, "copy");
    -[_BlastDoorLPLinkMetadata setCollaborationMetadata:](self, "setCollaborationMetadata:", v174);

  }
  -[_BlastDoorLPLinkMetadata specialization](self, "specialization");
  v175 = objc_claimAutoreleasedReturnValue();
  if (!v175
    || (v176 = (void *)v175,
        objc_msgSend(v181, "specialization"),
        v177 = (void *)objc_claimAutoreleasedReturnValue(),
        v177,
        v176,
        v178 = v181,
        v177))
  {
    objc_msgSend(v181, "specialization");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = (void *)objc_msgSend(v179, "copy");
    -[_BlastDoorLPLinkMetadata setSpecialization:](self, "setSpecialization:", v180);

    v178 = v181;
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
  id v69;

  v4 = a4;
  v6 = a3;
  v69 = v6;
  if (v4)
  {
    -[_BlastDoorLPLinkMetadata _copyPropertiesOnlyUpgradingFieldsFrom:](self, "_copyPropertiesOnlyUpgradingFieldsFrom:", v6);
    v7 = v69;
  }
  else
  {
    self->_version = objc_msgSend(v6, "version");
    objc_msgSend(v69, "originalURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setOriginalURL:](self, "setOriginalURL:", v8);

    objc_msgSend(v69, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setURL:](self, "setURL:", v9);

    objc_msgSend(v69, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    -[_BlastDoorLPLinkMetadata setTitle:](self, "setTitle:", v11);

    objc_msgSend(v69, "summary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    -[_BlastDoorLPLinkMetadata setSummary:](self, "setSummary:", v13);

    objc_msgSend(v69, "selectedText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    -[_BlastDoorLPLinkMetadata setSelectedText:](self, "setSelectedText:", v15);

    objc_msgSend(v69, "siteName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    -[_BlastDoorLPLinkMetadata setSiteName:](self, "setSiteName:", v17);

    objc_msgSend(v69, "itemType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    -[_BlastDoorLPLinkMetadata setItemType:](self, "setItemType:", v19);

    objc_msgSend(v69, "relatedURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setRelatedURL:](self, "setRelatedURL:", v20);

    objc_msgSend(v69, "creator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    -[_BlastDoorLPLinkMetadata setCreator:](self, "setCreator:", v22);

    objc_msgSend(v69, "creatorFacebookProfile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    -[_BlastDoorLPLinkMetadata setCreatorFacebookProfile:](self, "setCreatorFacebookProfile:", v24);

    objc_msgSend(v69, "creatorTwitterUsername");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    -[_BlastDoorLPLinkMetadata setCreatorTwitterUsername:](self, "setCreatorTwitterUsername:", v26);

    objc_msgSend(v69, "twitterCard");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");
    -[_BlastDoorLPLinkMetadata setTwitterCard:](self, "setTwitterCard:", v28);

    -[_BlastDoorLPLinkMetadata setUsesActivityPub:](self, "setUsesActivityPub:", objc_msgSend(v69, "usesActivityPub"));
    objc_msgSend(v69, "appleContentID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    -[_BlastDoorLPLinkMetadata setAppleContentID:](self, "setAppleContentID:", v30);

    objc_msgSend(v69, "appleSummary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");
    -[_BlastDoorLPLinkMetadata setAppleSummary:](self, "setAppleSummary:", v32);

    objc_msgSend(v69, "themeColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copy");
    -[_BlastDoorLPLinkMetadata setThemeColor:](self, "setThemeColor:", v34);

    objc_msgSend(v69, "icon");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setIcon:](self, "setIcon:", v35);

    objc_msgSend(v69, "iconMetadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setIconMetadata:](self, "setIconMetadata:", v36);

    objc_msgSend(v69, "arAsset");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setArAsset:](self, "setArAsset:", v37);

    objc_msgSend(v69, "arAssetMetadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setArAssetMetadata:](self, "setArAssetMetadata:", v38);

    objc_msgSend(v69, "image");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setImage:](self, "setImage:", v39);

    objc_msgSend(v69, "imageMetadata");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setImageMetadata:](self, "setImageMetadata:", v40);

    objc_msgSend(v69, "contentImages");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setContentImages:](self, "setContentImages:", v41);

    objc_msgSend(v69, "contentImagesMetadata");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setContentImagesMetadata:](self, "setContentImagesMetadata:", v42);

    objc_msgSend(v69, "video");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setVideo:](self, "setVideo:", v43);

    objc_msgSend(v69, "videoMetadata");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setVideoMetadata:](self, "setVideoMetadata:", v44);

    objc_msgSend(v69, "audio");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setAudio:](self, "setAudio:", v45);

    objc_msgSend(v69, "audioMetadata");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPLinkMetadata setAudioMetadata:](self, "setAudioMetadata:", v46);

    objc_msgSend(v69, "icons");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v47, "copy");
    -[_BlastDoorLPLinkMetadata setIcons:](self, "setIcons:", v48);

    objc_msgSend(v69, "arAssets");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v49, "copy");
    -[_BlastDoorLPLinkMetadata setArAssets:](self, "setArAssets:", v50);

    objc_msgSend(v69, "images");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v51, "copy");
    -[_BlastDoorLPLinkMetadata setImages:](self, "setImages:", v52);

    objc_msgSend(v69, "alternateImages");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v53, "copy");
    -[_BlastDoorLPLinkMetadata setAlternateImages:](self, "setAlternateImages:", v54);

    objc_msgSend(v69, "availableContentImages");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v55, "copy");
    -[_BlastDoorLPLinkMetadata setAvailableContentImages:](self, "setAvailableContentImages:", v56);

    objc_msgSend(v69, "videos");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(v57, "copy");
    -[_BlastDoorLPLinkMetadata setVideos:](self, "setVideos:", v58);

    objc_msgSend(v69, "streamingVideos");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v59, "copy");
    -[_BlastDoorLPLinkMetadata setStreamingVideos:](self, "setStreamingVideos:", v60);

    objc_msgSend(v69, "audios");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend(v61, "copy");
    -[_BlastDoorLPLinkMetadata setAudios:](self, "setAudios:", v62);

    objc_msgSend(v69, "associatedApplication");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)objc_msgSend(v63, "copy");
    -[_BlastDoorLPLinkMetadata setAssociatedApplication:](self, "setAssociatedApplication:", v64);

    objc_msgSend(v69, "collaborationMetadata");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(v65, "copy");
    -[_BlastDoorLPLinkMetadata setCollaborationMetadata:](self, "setCollaborationMetadata:", v66);

    objc_msgSend(v69, "specialization");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = (void *)objc_msgSend(v67, "copy");
    -[_BlastDoorLPLinkMetadata setSpecialization:](self, "setSpecialization:", v68);

    v7 = v67;
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPSpecializationMetadata *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[12];

  v17[11] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v4, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_originalURL, CFSTR("originalURL"));
  objc_msgSend(v4, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, CFSTR("URL"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_summary, CFSTR("summary"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_selectedText, CFSTR("selection"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_siteName, CFSTR("siteName"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_itemType, CFSTR("itemType"));
  objc_msgSend(v4, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_relatedURL, CFSTR("relatedURL"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_creator, CFSTR("creator"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_creatorFacebookProfile, CFSTR("creatorFacebookProfile"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_creatorTwitterUsername, CFSTR("creatorTwitterUsername"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_twitterCard, CFSTR("twitterCard"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_usesActivityPub, CFSTR("usesActivityPub"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_appleContentID, CFSTR("appleContentID"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_appleSummary, CFSTR("appleSummary"));
  objc_msgSend(v4, "_bd_lp_encodeColorIfNotNil:forKey:", self->_themeColor, CFSTR("themeColor"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_iconMetadata, CFSTR("iconMetadata"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_arAsset, CFSTR("arAsset"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_arAssetMetadata, CFSTR("arAssetMetadata"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_alternateImages, CFSTR("alternateImages"));
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_contentImages, CFSTR("contentImages"));
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_contentImagesMetadata, CFSTR("contentImagesMetadata"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_imageMetadata, CFSTR("imageMetadata"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_video, CFSTR("video"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_videoMetadata, CFSTR("videoMetadata"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_audio, CFSTR("audio"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_audioMetadata, CFSTR("audioMetadata"));
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_icons, CFSTR("icons"));
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_images, CFSTR("images"));
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_availableContentImages, CFSTR("availableContentImages"));
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_videos, CFSTR("videos"));
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_streamingVideos, CFSTR("streamingVideos"));
  objc_msgSend(v4, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_audios, CFSTR("audios"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_associatedApplication, CFSTR("associatedApplication"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_collaborationMetadata, CFSTR("collaborationMetadata"));
  v5 = self->_specialization;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  v17[5] = objc_opt_class();
  v17[6] = objc_opt_class();
  v17[7] = objc_opt_class();
  v17[8] = objc_opt_class();
  v17[9] = objc_opt_class();
  v17[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 11);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          v11 = CFSTR("specialization");
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v8)
        continue;
      break;
    }
  }

  v11 = CFSTR("specialization2");
LABEL_11:
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_specialization, v11);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  unint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  objc_super v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)_BlastDoorLPLinkMetadata;
  if (-[_BlastDoorLPLinkMetadata isEqual:](&v47, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (unint64_t *)v4;
      v7 = v6;
      if (*((_DWORD *)v6 + 3) != self->_version)
        goto LABEL_83;
      v8 = v6[20];
      if (v8 | (unint64_t)self->_themeColor)
      {
        if (!objc_msgSend((id)v8, "isEqual:"))
          goto LABEL_83;
      }
      v9 = v7[2];
      if (v9 | (unint64_t)self->_originalURL && !objc_msgSend((id)v9, "isEqual:"))
        goto LABEL_83;
      v10 = v7[3];
      if (v10 | (unint64_t)self->_URL && !objc_msgSend((id)v10, "isEqual:"))
        goto LABEL_83;
      v11 = v7[4];
      if (v11 | (unint64_t)self->_title && !objc_msgSend((id)v11, "isEqual:"))
        goto LABEL_83;
      v12 = v7[9];
      if (v12 | (unint64_t)self->_summary && !objc_msgSend((id)v12, "isEqual:"))
        goto LABEL_83;
      v13 = v7[10];
      if (v13 | (unint64_t)self->_selectedText && !objc_msgSend((id)v13, "isEqual:"))
        goto LABEL_83;
      v14 = v7[11];
      if (v14 | (unint64_t)self->_siteName && !objc_msgSend((id)v14, "isEqual:"))
        goto LABEL_83;
      v15 = v7[12];
      if (v15 | (unint64_t)self->_itemType && !objc_msgSend((id)v15, "isEqual:"))
        goto LABEL_83;
      v16 = v7[13];
      if (v16 | (unint64_t)self->_relatedURL && !objc_msgSend((id)v16, "isEqual:"))
        goto LABEL_83;
      v17 = v7[14];
      if (v17 | (unint64_t)self->_creator && !objc_msgSend((id)v17, "isEqual:"))
        goto LABEL_83;
      v18 = v7[15];
      if (v18 | (unint64_t)self->_creatorFacebookProfile && !objc_msgSend((id)v18, "isEqual:"))
        goto LABEL_83;
      v19 = v7[16];
      if (v19 | (unint64_t)self->_creatorTwitterUsername && !objc_msgSend((id)v19, "isEqual:"))
        goto LABEL_83;
      v20 = v7[17];
      if (v20 | (unint64_t)self->_twitterCard && !objc_msgSend((id)v20, "isEqual:"))
        goto LABEL_83;
      if (*((unsigned __int8 *)v7 + 8) != self->_usesActivityPub)
        goto LABEL_83;
      v21 = v7[18];
      if (v21 | (unint64_t)self->_appleContentID)
      {
        if (!objc_msgSend((id)v21, "isEqual:"))
          goto LABEL_83;
      }
      v22 = v7[19];
      if (v22 | (unint64_t)self->_appleSummary && !objc_msgSend((id)v22, "isEqual:"))
        goto LABEL_83;
      v23 = v7[23];
      if (v23 | (unint64_t)self->_icon && !objc_msgSend((id)v23, "isEqual:"))
        goto LABEL_83;
      v24 = v7[24];
      if (v24 | (unint64_t)self->_iconMetadata && !objc_msgSend((id)v24, "isEqual:"))
        goto LABEL_83;
      v25 = v7[21];
      if (v25 | (unint64_t)self->_arAsset && !objc_msgSend((id)v25, "isEqual:"))
        goto LABEL_83;
      v26 = v7[22];
      if (v26 | (unint64_t)self->_arAssetMetadata && !objc_msgSend((id)v26, "isEqual:"))
        goto LABEL_83;
      v27 = v7[25];
      if (v27 | (unint64_t)self->_image && !objc_msgSend((id)v27, "isEqual:"))
        goto LABEL_83;
      v28 = v7[29];
      if (v28 | (unint64_t)self->_imageMetadata && !objc_msgSend((id)v28, "isEqual:"))
        goto LABEL_83;
      v29 = v7[27];
      if (v29 | (unint64_t)self->_contentImages && !objc_msgSend((id)v29, "isEqual:"))
        goto LABEL_83;
      v30 = v7[28];
      if (v30 | (unint64_t)self->_contentImagesMetadata && !objc_msgSend((id)v30, "isEqual:"))
        goto LABEL_83;
      v31 = v7[30];
      if (v31 | (unint64_t)self->_video && !objc_msgSend((id)v31, "isEqual:"))
        goto LABEL_83;
      v32 = v7[31];
      if (v32 | (unint64_t)self->_videoMetadata && !objc_msgSend((id)v32, "isEqual:"))
        goto LABEL_83;
      v33 = v7[32];
      if (v33 | (unint64_t)self->_audio && !objc_msgSend((id)v33, "isEqual:"))
        goto LABEL_83;
      v34 = v7[33];
      if (v34 | (unint64_t)self->_audioMetadata && !objc_msgSend((id)v34, "isEqual:"))
        goto LABEL_83;
      v35 = v7[35];
      if (v35 | (unint64_t)self->_icons && !objc_msgSend((id)v35, "isEqual:"))
        goto LABEL_83;
      v36 = v7[34];
      if (v36 | (unint64_t)self->_arAssets && !objc_msgSend((id)v36, "isEqual:"))
        goto LABEL_83;
      v37 = v7[36];
      if (v37 | (unint64_t)self->_images && !objc_msgSend((id)v37, "isEqual:"))
        goto LABEL_83;
      if (((v38 = v7[26], !(v38 | (unint64_t)self->_alternateImages))
         || objc_msgSend((id)v38, "isEqual:"))
        && ((v39 = v7[37], !(v39 | (unint64_t)self->_availableContentImages))
         || objc_msgSend((id)v39, "isEqual:"))
        && ((v40 = v7[38], !(v40 | (unint64_t)self->_videos)) || objc_msgSend((id)v40, "isEqual:"))
        && ((v41 = v7[39], !(v41 | (unint64_t)self->_streamingVideos))
         || objc_msgSend((id)v41, "isEqual:"))
        && ((v42 = v7[40], !(v42 | (unint64_t)self->_audios)) || objc_msgSend((id)v42, "isEqual:"))
        && ((v43 = v7[41], !(v43 | (unint64_t)self->_associatedApplication))
         || objc_msgSend((id)v43, "isEqual:"))
        && ((v44 = v7[42], !(v44 | (unint64_t)self->_collaborationMetadata))
         || objc_msgSend((id)v44, "isEqual:")))
      {
        v45 = v7[43];
        if (v45 | (unint64_t)self->_specialization)
          v5 = objc_msgSend((id)v45, "isEqual:");
        else
          v5 = 1;
      }
      else
      {
LABEL_83:
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSURL hash](self->_originalURL, "hash");
  return -[NSURL hash](self->_URL, "hash") ^ v3;
}

+ (_BlastDoorLPLinkMetadata)metadataWithDataRepresentation:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") <= 0xA00000)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, 0);
    objc_msgSend(v5, "_enableStrictSecureDecodingMode");
    objc_msgSend(v5, "setDecodingFailurePolicy:", 1);
    v6 = objc_opt_class();
    v7 = *MEMORY[0x1E0CB2CD0];
    v11[0] = 0;
    objc_msgSend(v5, "_bd_lp_strictlyDecodeTopLevelObjectOfClass:forKey:error:", v6, v7, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11[0];
    objc_msgSend(v5, "finishDecoding");
    if (v9)
      v4 = 0;
    else
      v4 = v8;

  }
  else
  {
    v4 = 0;
  }

  return (_BlastDoorLPLinkMetadata *)v4;
}

- (id)dataRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)_encodedSize
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_alternateImages;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "_encodedSize");
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v9 = -[_BlastDoorLPImage _encodedSize](self->_icon, "_encodedSize");
  v10 = -[_BlastDoorLPImage _encodedSize](self->_image, "_encodedSize");
  v11 = -[_BlastDoorLPVideo _encodedSize](self->_video, "_encodedSize");
  return v9 + v6 + v10 + v11 + -[_BlastDoorLPAudio _encodedSize](self->_audio, "_encodedSize");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("originalURL"), CFSTR("URL"), CFSTR("title"), CFSTR("summary"), CFSTR("selectedText"), 0x1E5CE3000, CFSTR("itemType"), CFSTR("relatedURL"), CFSTR("creator"), CFSTR("creatorFacebookProfile"), CFSTR("creatorTwitterUsername"), CFSTR("twitterCard"), CFSTR("usesActivityPub"), CFSTR("appleContentID"), CFSTR("appleSummary"), CFSTR("themeColor"), CFSTR("icon"),
               CFSTR("iconMetadata"),
               CFSTR("arAsset"),
               CFSTR("arAssetMetadata"),
               CFSTR("image"),
               CFSTR("alternateImages"),
               CFSTR("contentImages"),
               CFSTR("contentImagesMetadata"),
               CFSTR("imageMetadata"),
               CFSTR("video"),
               CFSTR("videoMetadata"),
               CFSTR("audio"),
               CFSTR("audioMetadata"),
               CFSTR("icons"),
               CFSTR("images"),
               CFSTR("availableContentImages"),
               CFSTR("videos"),
               CFSTR("streamingVideos"),
               CFSTR("audios"),
               CFSTR("associatedApplication"),
               CFSTR("collaborationMetadata"),
               CFSTR("specialization"),
               CFSTR("specialization._dummyPropertyForObservation"),
               0);
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(id)a3
{
  objc_storeStrong((id *)&self->_originalURL, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSItemProvider)iconProvider
{
  return self->_iconProvider;
}

- (void)setIconProvider:(id)a3
{
  objc_storeStrong((id *)&self->_iconProvider, a3);
}

- (NSItemProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_imageProvider, a3);
}

- (NSItemProvider)videoProvider
{
  return self->_videoProvider;
}

- (void)setVideoProvider:(id)a3
{
  objc_storeStrong((id *)&self->_videoProvider, a3);
}

- (NSURL)remoteVideoURL
{
  return self->_remoteVideoURL;
}

- (void)setRemoteVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_remoteVideoURL, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)siteName
{
  return self->_siteName;
}

- (void)setSiteName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)itemType
{
  return self->_itemType;
}

- (void)setItemType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)relatedURL
{
  return self->_relatedURL;
}

- (void)setRelatedURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)creator
{
  return self->_creator;
}

- (void)setCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)creatorFacebookProfile
{
  return self->_creatorFacebookProfile;
}

- (void)setCreatorFacebookProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)creatorTwitterUsername
{
  return self->_creatorTwitterUsername;
}

- (void)setCreatorTwitterUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)twitterCard
{
  return self->_twitterCard;
}

- (void)setTwitterCard:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)appleSummary
{
  return self->_appleSummary;
}

- (void)setAppleSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (_BlastDoorLPPlatformColor)themeColor
{
  return self->_themeColor;
}

- (void)setThemeColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (_BlastDoorLPARAsset)arAsset
{
  return self->_arAsset;
}

- (void)setArAsset:(id)a3
{
  objc_storeStrong((id *)&self->_arAsset, a3);
}

- (_BlastDoorLPARAssetMetadata)arAssetMetadata
{
  return self->_arAssetMetadata;
}

- (void)setArAssetMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_arAssetMetadata, a3);
}

- (_BlastDoorLPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (_BlastDoorLPIconMetadata)iconMetadata
{
  return self->_iconMetadata;
}

- (void)setIconMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_iconMetadata, a3);
}

- (_BlastDoorLPImage)image
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSArray)contentImages
{
  return self->_contentImages;
}

- (void)setContentImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)contentImagesMetadata
{
  return self->_contentImagesMetadata;
}

- (void)setContentImagesMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (_BlastDoorLPImageMetadata)imageMetadata
{
  return self->_imageMetadata;
}

- (void)setImageMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_imageMetadata, a3);
}

- (_BlastDoorLPVideo)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
  objc_storeStrong((id *)&self->_video, a3);
}

- (_BlastDoorLPVideoMetadata)videoMetadata
{
  return self->_videoMetadata;
}

- (void)setVideoMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_videoMetadata, a3);
}

- (_BlastDoorLPAudio)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
  objc_storeStrong((id *)&self->_audio, a3);
}

- (_BlastDoorLPAudioMetadata)audioMetadata
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSArray)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSArray)availableContentImages
{
  return self->_availableContentImages;
}

- (void)setAvailableContentImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSArray)videos
{
  return self->_videos;
}

- (void)setVideos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSArray)streamingVideos
{
  return self->_streamingVideos;
}

- (void)setStreamingVideos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSArray)audios
{
  return self->_audios;
}

- (void)setAudios:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (_BlastDoorLPAssociatedApplicationMetadata)associatedApplication
{
  return self->_associatedApplication;
}

- (void)setAssociatedApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void)setCollaborationMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (_BlastDoorLPSpecializationMetadata)specialization
{
  return self->_specialization;
}

- (void)setSpecialization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialization, 0);
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_storeStrong((id *)&self->_associatedApplication, 0);
  objc_storeStrong((id *)&self->_audios, 0);
  objc_storeStrong((id *)&self->_streamingVideos, 0);
  objc_storeStrong((id *)&self->_videos, 0);
  objc_storeStrong((id *)&self->_availableContentImages, 0);
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
  objc_storeStrong((id *)&self->_remoteVideoURL, 0);
  objc_storeStrong((id *)&self->_videoProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_iconProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
}

- (void)_initWithDictionary:.cold.1()
{
  __assert_rtn("dictionaryForKey", "LPMetadata.m", 172, "!result || [result isKindOfClass:[NSDictionary class]]");
}

- (void)_initWithDictionary:.cold.2()
{
  __assert_rtn("arrayOfStringsForKey", "LPMetadata.m", 144, "[str isKindOfClass:[NSString class]]");
}

- (void)_initWithDictionary:.cold.3()
{
  __assert_rtn("arrayOfStringsForKey", "LPMetadata.m", 137, "!array || [array isKindOfClass:[NSArray class]]");
}

@end
