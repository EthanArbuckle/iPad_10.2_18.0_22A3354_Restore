@implementation SUUIProductPageItem

- (SUUIProductPageItem)initWithLookupDictionary:(id)a3
{
  id v4;
  SUUIProductPageItem *v5;
  void *v6;
  uint64_t v7;
  NSURL *artistPageURL;
  void *v9;
  uint64_t v10;
  NSString *copyrightString;
  void *v12;
  uint64_t v13;
  NSString *regularPriceString;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSString *lastUpdateDateString;
  void *v20;
  uint64_t v21;
  NSString *shortenedProductPageURLString;
  void *v23;
  uint64_t v24;
  NSArray *childItemIdentifiers;
  void *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *loadedChildItems;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  SUUIItem *v37;
  void *v38;
  uint64_t v39;
  NSArray *parentBundleItemIdentifiers;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  char v49;
  SUUIItemContentRating *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  SUUIItemContentRating *contentRating;
  SUUIItemContentRating *v56;
  uint64_t v57;
  NSArray *secondaryContentRatings;
  SUUIItemContentRating *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSString *itemDescription;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSString *licenseAgreementURLString;
  void *v69;
  uint64_t v70;
  NSString *privacyPolicyURLString;
  void *v72;
  uint64_t v73;
  NSString *installationRequirementsDescription;
  void *v75;
  uint64_t v76;
  NSString *supportURLString;
  void *v78;
  void *v79;
  SUUIDeveloperInfo *v80;
  SUUIDeveloperInfo *developerInfo;
  SUUIDeveloperInfo *v82;
  void *v83;
  uint64_t v84;
  NSString *sellerName;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  SUUIStoreNotes *v94;
  SUUIStoreNotes *storeNotes;
  void *v96;
  uint64_t v97;
  NSArray *screenshots;
  id v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t k;
  uint64_t v105;
  SUUIScreenshot *v106;
  uint64_t v107;
  NSArray *v108;
  SUUIProductPageItem *v109;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  SUUIItemContentRating *v118;
  SUUIProductPageItem *v119;
  void *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  objc_super v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v133.receiver = self;
  v133.super_class = (Class)SUUIProductPageItem;
  v5 = -[SUUIItem initWithLookupDictionary:](&v133, sel_initWithLookupDictionary_, v4);

  if (!v5)
    goto LABEL_111;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB27A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v6);
    artistPageURL = v5->_artistPageURL;
    v5->_artistPageURL = (NSURL *)v7;

  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB27C8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v9, "copy");
    copyrightString = v5->_copyrightString;
    v5->_copyrightString = (NSString *)v10;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("regularPriceFormatted"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v12, "copy");
    regularPriceString = v5->_regularPriceString;
    v5->_regularPriceString = (NSString *)v13;

  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2838]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v16, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    objc_msgSend(v16, "dateFromString:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v16, "setDateFormat:", 0);
      objc_msgSend(v16, "setDateStyle:", 2);
      objc_msgSend(v16, "setTimeStyle:", 0);
      objc_msgSend(v16, "stringFromDate:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = objc_msgSend(v15, "copy");
    }
    lastUpdateDateString = v5->_lastUpdateDateString;
    v5->_lastUpdateDateString = (NSString *)v18;

  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2878]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_msgSend(v20, "copy");
    shortenedProductPageURLString = v5->_shortenedProductPageURLString;
    v5->_shortenedProductPageURLString = (NSString *)v21;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("childrenIds"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v117 = v23;
  v115 = v4;
  v119 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = objc_msgSend(v23, "copy");
    childItemIdentifiers = v5->_childItemIdentifiers;
    v5->_childItemIdentifiers = (NSArray *)v24;

    objc_msgSend(v4, "objectForKey:", CFSTR("children"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v112 = v20;
      v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      loadedChildItems = v5->_loadedChildItems;
      v5->_loadedChildItems = v27;

      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      v29 = v5->_childItemIdentifiers;
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v129, v136, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v130;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v130 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
            objc_msgSend(v34, "stringValue");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKey:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v37 = -[SUUIItem initWithLookupDictionary:]([SUUIItem alloc], "initWithLookupDictionary:", v36);
              if (v37)
                -[NSMutableDictionary setObject:forKey:](v5->_loadedChildItems, "setObject:forKey:", v37, v34);

            }
          }
          v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v129, v136, 16);
        }
        while (v31);
      }

      v20 = v112;
      v4 = v115;
    }

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("appBundleAdamIds"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v116 = v38;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = objc_msgSend(v38, "copy");
    parentBundleItemIdentifiers = v5->_parentBundleItemIdentifiers;
    v5->_parentBundleItemIdentifiers = (NSArray *)v39;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("contentRatingsBySystem"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v120 = v41;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v113 = v20;
    objc_msgSend(v41, "keyEnumerator");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = (SUUIItemContentRating *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v43 = v42;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v126;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v126 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("appsApple"));
            v50 = [SUUIItemContentRating alloc];
            objc_msgSend(v120, "objectForKey:", v48);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = (void *)objc_msgSend(v48, "copy");
            v53 = -[SUUIItemContentRating initWithContentRatingDictionary:systemName:](v50, "initWithContentRatingDictionary:systemName:", v51, v52);
            v54 = (void *)v53;
            if ((v49 & 1) != 0)
            {
              contentRating = v119->_contentRating;
              v119->_contentRating = (SUUIItemContentRating *)v53;

              v54 = v51;
            }
            else
            {

              -[SUUIItemContentRating addObject:](v118, "addObject:", v54);
            }

          }
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
      }
      while (v45);
    }

    v56 = v118;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v118);
    v57 = objc_claimAutoreleasedReturnValue();
    v5 = v119;
    secondaryContentRatings = v119->_secondaryContentRatings;
    v119->_secondaryContentRatings = (NSArray *)v57;

    v20 = v113;
    v4 = v115;
    goto LABEL_48;
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB27B8]);
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = -[SUUIItemContentRating initWithContentRatingDictionary:systemName:]([SUUIItemContentRating alloc], "initWithContentRatingDictionary:systemName:", v43, CFSTR("appsApple"));
    v56 = v5->_contentRating;
    v5->_contentRating = v59;
LABEL_48:

  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB27D0]);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v60, "objectForKey:", *MEMORY[0x24BEB27D8]);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v62 = objc_msgSend(v61, "copy");
      itemDescription = v5->_itemDescription;
      v5->_itemDescription = (NSString *)v62;

    }
  }
  else
  {
    v61 = v20;
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2880]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v64, "objectForKey:", *MEMORY[0x24BEB27F8]);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v65, "BOOLValue"))
      v5->_supportedFeatures |= 1uLL;
    objc_msgSend(v64, "objectForKey:", *MEMORY[0x24BEB2810]);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = objc_msgSend(v66, "copy");
      licenseAgreementURLString = v5->_licenseAgreementURLString;
      v5->_licenseAgreementURLString = (NSString *)v67;

    }
    objc_msgSend(v64, "objectForKey:", *MEMORY[0x24BEB2828]);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v70 = objc_msgSend(v69, "copy");
      privacyPolicyURLString = v5->_privacyPolicyURLString;
      v5->_privacyPolicyURLString = (NSString *)v70;

    }
    objc_msgSend(v64, "objectForKey:", *MEMORY[0x24BEB2848]);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v73 = objc_msgSend(v72, "copy");
      installationRequirementsDescription = v5->_installationRequirementsDescription;
      v5->_installationRequirementsDescription = (NSString *)v73;

    }
    objc_msgSend(v64, "objectForKey:", *MEMORY[0x24BEB2898]);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v76 = objc_msgSend(v75, "copy");
      supportURLString = v5->_supportURLString;
      v5->_supportURLString = (NSString *)v76;

    }
    objc_msgSend(v64, "objectForKey:", *MEMORY[0x24BEB27F0]);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SUUIItem _setHasInAppPurchases:](v5, "_setHasInAppPurchases:", objc_msgSend(v78, "BOOLValue"));
    objc_msgSend(v64, "objectForKey:", CFSTR("developerInfo"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v80 = -[SUUIDeveloperInfo initWithDeveloperDictionary:]([SUUIDeveloperInfo alloc], "initWithDeveloperDictionary:", v79);
      developerInfo = v5->_developerInfo;
      v5->_developerInfo = v80;

      v82 = v5->_developerInfo;
      -[SUUIItem artistName](v5, "artistName");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIDeveloperInfo setTradeName:](v82, "setTradeName:", v83);

    }
    objc_msgSend(v64, "objectForKey:", CFSTR("seller"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v84 = objc_msgSend(v61, "copy");
      sellerName = v5->_sellerName;
      v5->_sellerName = (NSString *)v84;

    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("supportsPassbook"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v86, "BOOLValue"))
    v5->_supportedFeatures |= 4uLL;
  if (-[SUUIItem isNewsstandApp](v5, "isNewsstandApp"))
    v5->_supportedFeatures |= 8uLL;
  objc_msgSend(v4, "objectForKey:", CFSTR("gameCenterInfo"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v87, "objectForKey:", CFSTR("hasLiveAchievements"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v88, "BOOLValue"))
      v5->_supportedGameCenterFeatures |= 2uLL;
    v89 = v87;
    objc_msgSend(v87, "objectForKey:", CFSTR("hasLiveLeaderboards"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v90, "BOOLValue"))
      v5->_supportedGameCenterFeatures |= 4uLL;
    objc_msgSend(v89, "objectForKey:", CFSTR("usesGameControllerAPI"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v91, "BOOLValue"))
      v5->_supportedGameCenterFeatures |= 1uLL;
    objc_msgSend(v89, "objectForKey:", CFSTR("usesMultiplayerAPI"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v92, "BOOLValue"))
      v5->_supportedGameCenterFeatures |= 8uLL;
    objc_msgSend(v89, "objectForKey:", CFSTR("usesTurnBasedAPI"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v86, "BOOLValue"))
      v5->_supportedGameCenterFeatures |= 0x10uLL;
    v87 = v89;
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2890]);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v94 = objc_alloc_init(SUUIStoreNotes);
    storeNotes = v5->_storeNotes;
    v5->_storeNotes = v94;

    objc_msgSend(v93, "objectForKey:", *MEMORY[0x24BEB2888]);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUUIStoreNotes setStandardNotes:](v5->_storeNotes, "setStandardNotes:", v96);
  }
  else
  {
    v96 = v86;
  }
  SUUIItemScreenshotsForDictionary(v4);
  v97 = objc_claimAutoreleasedReturnValue();
  screenshots = v5->_screenshots;
  v5->_screenshots = (NSArray *)v97;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v111 = v87;
    v114 = v64;
    v99 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v100 = v96;
    v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
    if (v101)
    {
      v102 = v101;
      v103 = *(_QWORD *)v122;
      do
      {
        for (k = 0; k != v102; ++k)
        {
          if (*(_QWORD *)v122 != v103)
            objc_enumerationMutation(v100);
          v105 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v106 = -[SUUIScreenshot initWithScreenshotDictionary:]([SUUIScreenshot alloc], "initWithScreenshotDictionary:", v105);
            if (v106)
              objc_msgSend(v99, "addObject:", v106);

          }
        }
        v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
      }
      while (v102);
    }

    v107 = objc_msgSend(v99, "copy");
    v5 = v119;
    v108 = v119->_screenshots;
    v119->_screenshots = (NSArray *)v107;

    v64 = v114;
    v4 = v115;
    v87 = v111;
  }

LABEL_111:
  v109 = v5;

  return v109;
}

- (id)childItemForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_loadedChildItems, "objectForKey:", a3);
}

- (id)loadedChildItems
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_childItemIdentifiers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKey:](self->_loadedChildItems, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (int64_t)numberOfChildItems
{
  objc_super v3;

  if (self->_childItemIdentifiers)
    return -[NSArray count](self->_childItemIdentifiers, "count");
  v3.receiver = self;
  v3.super_class = (Class)SUUIProductPageItem;
  return -[SUUIItem numberOfChildItems](&v3, sel_numberOfChildItems);
}

- (void)_setVersionHistory:(id)a3
{
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *lastUpdateDateString;
  NSString *v10;
  NSString *updateDescription;
  NSArray *releaseNotes;
  id v13;

  v13 = a3;
  if (objc_msgSend(v13, "count"))
  {
    v5 = (NSString *)objc_alloc_init(MEMORY[0x24BDD1500]);
    -[NSString setDateStyle:](v5, "setDateStyle:", 2);
    -[NSString setTimeStyle:](v5, "setTimeStyle:", 0);
    objc_msgSend(v13, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringFromDate:](v5, "stringFromDate:", v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    lastUpdateDateString = self->_lastUpdateDateString;
    self->_lastUpdateDateString = v8;

    objc_storeStrong((id *)&self->_releaseNotes, a3);
    objc_msgSend(v6, "changeNotes");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    updateDescription = self->_updateDescription;
    self->_updateDescription = v10;

  }
  else
  {
    releaseNotes = self->_releaseNotes;
    self->_releaseNotes = 0;

    v5 = self->_updateDescription;
    self->_updateDescription = 0;
  }

}

- (void)_setInAppPurchases:(id)a3
{
  objc_storeStrong((id *)&self->_inAppPurchases, a3);
}

- (NSURL)artistPageURL
{
  return self->_artistPageURL;
}

- (id)childItemIdentifiers
{
  return self->_childItemIdentifiers;
}

- (SUUIItemContentRating)contentRating
{
  return self->_contentRating;
}

- (NSString)copyrightString
{
  return self->_copyrightString;
}

- (SUUIDeveloperInfo)developerInfo
{
  return self->_developerInfo;
}

- (NSArray)inAppPurchases
{
  return self->_inAppPurchases;
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (NSString)lastUpdateDateString
{
  return self->_lastUpdateDateString;
}

- (NSString)licenseAgreementURLString
{
  return self->_licenseAgreementURLString;
}

- (NSArray)parentBundleItemIdentifiers
{
  return self->_parentBundleItemIdentifiers;
}

- (NSString)privacyPolicyURLString
{
  return self->_privacyPolicyURLString;
}

- (NSString)regularPriceString
{
  return self->_regularPriceString;
}

- (NSArray)releaseNotes
{
  return self->_releaseNotes;
}

- (NSString)reviewsURLString
{
  return self->_reviewsURLString;
}

- (NSArray)screenshots
{
  return self->_screenshots;
}

- (NSArray)secondaryContentRatings
{
  return self->_secondaryContentRatings;
}

- (NSString)sellerName
{
  return self->_sellerName;
}

- (NSString)shortenedProductPageURLString
{
  return self->_shortenedProductPageURLString;
}

- (SUUIStoreNotes)storeNotes
{
  return self->_storeNotes;
}

- (int64_t)supportedFeatures
{
  return self->_supportedFeatures;
}

- (unint64_t)supportedGameCenterFeatures
{
  return self->_supportedGameCenterFeatures;
}

- (NSString)supportURLString
{
  return self->_supportURLString;
}

- (NSString)updateDescription
{
  return self->_updateDescription;
}

- (NSString)installationRequirementsDescription
{
  return self->_installationRequirementsDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDescription, 0);
  objc_storeStrong((id *)&self->_supportURLString, 0);
  objc_storeStrong((id *)&self->_storeNotes, 0);
  objc_storeStrong((id *)&self->_shortenedProductPageURLString, 0);
  objc_storeStrong((id *)&self->_sellerName, 0);
  objc_storeStrong((id *)&self->_secondaryContentRatings, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_reviewsURLString, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);
  objc_storeStrong((id *)&self->_regularPriceString, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURLString, 0);
  objc_storeStrong((id *)&self->_parentBundleItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_loadedChildItems, 0);
  objc_storeStrong((id *)&self->_licenseAgreementURLString, 0);
  objc_storeStrong((id *)&self->_lastUpdateDateString, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_installationRequirementsDescription, 0);
  objc_storeStrong((id *)&self->_inAppPurchases, 0);
  objc_storeStrong((id *)&self->_developerInfo, 0);
  objc_storeStrong((id *)&self->_copyrightString, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_childItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_artistPageURL, 0);
}

@end
