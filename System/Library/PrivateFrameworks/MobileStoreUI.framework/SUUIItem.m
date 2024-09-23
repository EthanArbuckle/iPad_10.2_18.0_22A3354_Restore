@implementation SUUIItem

- (id)initContainerItemWithItem:(id)a3
{
  id v4;
  SUUIItem *v5;
  uint64_t v6;
  NSString *artistName;
  uint64_t v8;
  SUUIArtworkProviding *artworksProvider;
  uint64_t v10;
  NSString *categoryName;
  uint64_t v12;
  NSString *productPageURLString;
  uint64_t v14;
  NSString *title;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SUUIItem;
  v5 = -[SUUIItem init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "artistName");
    v6 = objc_claimAutoreleasedReturnValue();
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v6;

    objc_msgSend(v4, "artworksProvider");
    v8 = objc_claimAutoreleasedReturnValue();
    artworksProvider = v5->_artworksProvider;
    v5->_artworksProvider = (SUUIArtworkProviding *)v8;

    objc_msgSend(v4, "categoryName");
    v10 = objc_claimAutoreleasedReturnValue();
    categoryName = v5->_categoryName;
    v5->_categoryName = (NSString *)v10;

    objc_msgSend(v4, "productPageURLString");
    v12 = objc_claimAutoreleasedReturnValue();
    productPageURLString = v5->_productPageURLString;
    v5->_productPageURLString = (NSString *)v12;

    objc_msgSend(v4, "collectionName");
    v14 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v14;

    if (v5->_productPageURLString)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5->_productPageURLString);
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = objc_msgSend(v17, "rangeOfString:", CFSTR("/id"));
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v18, "substringFromIndex:", v19 + v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v5->_itemIdentifier = objc_msgSend(v21, "longLongValue");

        }
      }

    }
    v22 = objc_msgSend(v4, "itemKind");
    if (v22 == 13)
    {
      v23 = 7;
      goto LABEL_11;
    }
    if (v22 == 14)
    {
      v23 = 15;
LABEL_11:
      v5->_itemKind = v23;
    }
  }

  return v5;
}

- (SUUIItem)initWithLookupDictionary:(id)a3
{
  id v4;
  SUUIItem *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *categoryName;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *collectionName;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *requiredCapabilities;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  NSArray *v31;
  void *v32;
  void *v33;
  SUUIItem *v34;
  uint64_t v35;
  NSString *itemKindString;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  SUUIArtworkProviding *artworksProvider;
  void *v41;
  uint64_t v42;
  SUUIArtworkProviding *newsstandArtworks;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  SUUIItemOffer *v58;
  SUUIItemOffer *itemOffer;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int64_t itemKind;
  void *v76;
  _QWORD *v77;
  uint64_t v78;
  float v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t k;
  uint64_t v93;
  SUUIVideo *v94;
  uint64_t v95;
  uint64_t v96;
  NSArray *videos;
  SUUIItem *v98;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  SUUIItem *v113;
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
  __int128 v129;
  objc_super v130;
  _BYTE v131[128];
  void *v132;
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v130.receiver = self;
  v130.super_class = (Class)SUUIItem;
  v5 = -[SUUIItem init](&v130, sel_init);

  if (!v5)
    goto LABEL_161;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2798]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v5->_artistName, v6);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB27B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v5->_bundleID, v7);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB27E8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    v8 = v9;
    categoryName = v5->_categoryName;
    v5->_categoryName = (NSString *)v8;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("genres"));
    categoryName = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(categoryName, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("name"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&v5->_categoryName, v12);

      }
    }
  }

  v9 = v8;
LABEL_17:
  objc_msgSend(v4, "objectForKey:", CFSTR("collectionName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v13, "copy");
    collectionName = v5->_collectionName;
    v5->_collectionName = (NSString *)v14;

  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2800]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5->_itemIdentifier = objc_msgSend(v16, "longLongValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("feedUrl"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v5->_feedUrlString, v17);
  objc_msgSend(v4, "objectForKey:", CFSTR("appCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5->_numberOfChildItems = objc_msgSend(v18, "integerValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("hasInAppPurchases"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5->_hasInAppPurchases = objc_msgSend(v19, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2830]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v5->_productPageURLString, v20);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2840]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v104 = v4;
  v113 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v21;
    requiredCapabilities = v5->_requiredCapabilities;
    v5->_requiredCapabilities = v22;
LABEL_42:

    goto LABEL_43;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    requiredCapabilities = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v21, "componentsSeparatedByString:", CFSTR(" "));
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v126, v135, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v127;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v127 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
          if (objc_msgSend(v29, "length"))
            -[NSArray addObject:](requiredCapabilities, "addObject:", v29);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v126, v135, 16);
      }
      while (v26);
    }

    v30 = -[NSArray copy](requiredCapabilities, "copy");
    v5 = v113;
    v31 = v113->_requiredCapabilities;
    v113->_requiredCapabilities = (NSArray *)v30;

    v4 = v104;
    goto LABEL_42;
  }
LABEL_43:
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB27E0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v5->_title, v32);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2808]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&v5->_itemKindString, v33);
    v34 = v5;
    v35 = 0;
    itemKindString = v34->_itemKindString;
    while (!objc_msgSend((id)qword_2511FC8A0[v35 + 1], "isEqualToString:", itemKindString))
    {
      v35 += 2;
      if (v35 == 50)
      {
        v37 = 0;
        goto LABEL_51;
      }
    }
    v37 = qword_2511FC8A0[v35];
LABEL_51:
    v113->_itemKind = v37;
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB27A8]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:](SUUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v38);
  v39 = objc_claimAutoreleasedReturnValue();
  artworksProvider = v113->_artworksProvider;
  v113->_artworksProvider = (SUUIArtworkProviding *)v39;

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2818]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v113;
  +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:](SUUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v41);
  v42 = objc_claimAutoreleasedReturnValue();
  newsstandArtworks = v113->_newsstandArtworks;
  v113->_newsstandArtworks = (SUUIArtworkProviding *)v42;

  if (v113->_newsstandArtworks)
    v113->_newsstandApp = 1;
  objc_msgSend(v4, "objectForKey:", CFSTR("hasMessagesExtension"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v113->_hasMessagesExtension = objc_msgSend(v44, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("isHiddenFromSpringBoard"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v113->_isHiddenFromSpringBoard = objc_msgSend(v45, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("isGameControllerSupported"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v113->_gameControllerSupported = objc_msgSend(v46, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("requiresGameController"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v113->_requiresGameController = objc_msgSend(v47, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("ageBand"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v48, "objectForKey:", CFSTR("maxAge"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKey:", CFSTR("minAge"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v103 = 0;
    v49 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v113->_ageBandRange.location = objc_msgSend(v103, "integerValue");
    v50 = objc_msgSend(v49, "integerValue") - v113->_ageBandRange.location;
  }
  else
  {
    v50 = 0;
    v113->_ageBandRange.location = 0x7FFFFFFFFFFFFFFFLL;
  }
  v113->_ageBandRange.length = v50;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB27B8]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v51, "objectForKey:", CFSTR("value"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v108 = v52;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v113->_parentalControlsRank = objc_msgSend(v52, "integerValue");
  }
  else
  {
    v108 = v47;
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2820]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v107 = v53;
  v101 = v51;
  v102 = v49;
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v53, "count"))
  {
    objc_msgSend(v53, "objectAtIndex:", 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v54, "objectForKey:", CFSTR("version"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v55, "objectForKey:", CFSTR("display"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&v113->_versionString, v56);
        objc_msgSend(v55, "objectForKey:", CFSTR("externalId"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        v108 = v57;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v113->_versionIdentifier = objc_msgSend(v57, "longLongValue");
      }
      v58 = -[SUUIItemOffer initWithLookupDictionary:]([SUUIItemOffer alloc], "initWithLookupDictionary:", v54);
      itemOffer = v113->_itemOffer;
      v113->_itemOffer = v58;

      objc_msgSend(v4, "objectForKey:", CFSTR("fileSizeByDevice"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SUUIItemOffer _setFileSizeWithDeviceSizes:](v113->_itemOffer, "_setFileSizeWithDeviceSizes:", v60);

      v51 = v101;
      v49 = v102;
    }

    v53 = v107;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("deviceFamilies"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v61)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2880]);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v62, "objectForKey:", CFSTR("deviceFamilies"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = 0;
    }

    v53 = v107;
  }
  objc_opt_class();
  v112 = v61;
  v100 = v48;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    v63 = v61;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v122, v134, 16);
    if (!v64)
      goto LABEL_108;
    v65 = v64;
    v66 = *(_QWORD *)v123;
    while (1)
    {
      for (j = 0; j != v65; ++j)
      {
        if (*(_QWORD *)v123 != v66)
          objc_enumerationMutation(v63);
        v68 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((objc_msgSend(v68, "isEqualToString:", CFSTR("ipad")) & 1) != 0)
          {
            v69 = 1;
          }
          else if ((objc_msgSend(v68, "isEqualToString:", CFSTR("iphone")) & 1) != 0)
          {
            v69 = 2;
          }
          else if ((objc_msgSend(v68, "isEqualToString:", CFSTR("ipod")) & 1) != 0)
          {
            v69 = 4;
          }
          else
          {
            if (!objc_msgSend(v68, "isEqualToString:", CFSTR("tvos")))
              continue;
            v69 = 8;
          }
          v113->_deviceFamilies |= v69;
        }
      }
      v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v122, v134, 16);
      if (!v65)
      {
LABEL_108:

        v4 = v104;
        v48 = v100;
        v51 = v101;
        v49 = v102;
        v53 = v107;
        v61 = v112;
        goto LABEL_110;
      }
    }
  }
  v113->_deviceFamilies = 15;
LABEL_110:
  objc_msgSend(v4, "objectForKey:", CFSTR("editorialBadgeInfo"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v105 = v70;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v70, "objectForKey:", CFSTR("nameForDisplay"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v113->_editorialBadge, v71);

    v53 = v107;
  }
  if (!v113->_versionIdentifier)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("version"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v113->_versionString, v72);
    objc_msgSend(v4, "objectForKey:", CFSTR("versionId"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v108 = v73;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v113->_versionIdentifier = objc_msgSend(v73, "longLongValue");
    v53 = v107;
    v61 = v112;
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB28B0]);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v106 = v74;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    itemKind = v113->_itemKind;
    if (itemKind == 17 || itemKind == 12)
    {
      objc_msgSend(v74, "objectForKey:", *MEMORY[0x24BEB28A8]);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v113->_numberOfUserRatings = objc_msgSend(v76, "integerValue");
      v77 = (_QWORD *)MEMORY[0x24BEB28C0];
    }
    else
    {
      objc_msgSend(v74, "objectForKey:", *MEMORY[0x24BEB28A0]);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v113->_numberOfUserRatings = objc_msgSend(v76, "integerValue");
      v77 = (_QWORD *)MEMORY[0x24BEB28B8];
    }
    objc_msgSend(v74, "objectForKey:", *v77);
    v78 = objc_claimAutoreleasedReturnValue();

    v108 = (void *)v78;
    v53 = v107;
    v61 = v112;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v108, "floatValue");
      v113->_userRating = v79;
    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("videoPreviewByType"));
  v80 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v111 = (void *)v80;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "userInterfaceIdiom");

    if (v82 == 1)
      v83 = &unk_2512EEA78;
    else
      v83 = &unk_2512EEA90;
    v84 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v110 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v118, v133, 16);
    if (v110)
    {
      v109 = *(_QWORD *)v119;
LABEL_137:
      v85 = 0;
      while (1)
      {
        if (*(_QWORD *)v119 != v109)
          objc_enumerationMutation(v83);
        objc_msgSend(v111, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * v85));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v87 = v86;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v132 = v86;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v132, 1);
            v87 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v87 = 0;
          }
        }
        v116 = 0u;
        v117 = 0u;
        v114 = 0u;
        v115 = 0u;
        v88 = v87;
        v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v114, v131, 16);
        if (v89)
        {
          v90 = v89;
          v91 = *(_QWORD *)v115;
          do
          {
            for (k = 0; k != v90; ++k)
            {
              if (*(_QWORD *)v115 != v91)
                objc_enumerationMutation(v88);
              v93 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v94 = -[SUUIVideo initWithVideoDictionary:]([SUUIVideo alloc], "initWithVideoDictionary:", v93);
                if (v94)
                  objc_msgSend(v84, "addObject:", v94);

              }
            }
            v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v114, v131, 16);
          }
          while (v90);
        }

        v95 = objc_msgSend(v84, "count");
        v61 = v112;
        v5 = v113;
        if (v95)
          break;
        if (++v85 == v110)
        {
          v110 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v118, v133, 16);
          if (v110)
            goto LABEL_137;
          break;
        }
      }
    }
    v96 = objc_msgSend(v84, "copy");
    videos = v5->_videos;
    v5->_videos = (NSArray *)v96;

    v4 = v104;
    v48 = v100;
    v51 = v101;
    v49 = v102;
    v53 = v107;
  }

LABEL_161:
  v98 = v5;

  return v98;
}

- (id)artworkURLForSize:(int64_t)a3
{
  return (id)-[SUUIArtworkProviding artworkURLForSize:](self->_artworksProvider, "artworkURLForSize:", a3);
}

- (UIImage)artworkImage
{
  return 0;
}

- (id)childItemForIdentifier:(id)a3
{
  return 0;
}

- (NSArray)childItemIdentifiers
{
  return 0;
}

- (NSURL)largestArtworkURL
{
  void *v2;
  void *v3;

  -[SUUIArtworkProviding largestArtwork](self->_artworksProvider, "largestArtwork");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSArray)loadedChildItems
{
  return 0;
}

- (SUUIStoreIdentifier)storeIdentifier
{
  SUUIStoreIdentifier *storeIdentifier;
  SUUIStoreIdentifier *v4;
  SUUIStoreIdentifier *v5;
  void *v6;

  storeIdentifier = self->_storeIdentifier;
  if (!storeIdentifier)
  {
    v4 = -[SUUIStoreIdentifier initWithLongLong:]([SUUIStoreIdentifier alloc], "initWithLongLong:", -[SUUIItem itemIdentifier](self, "itemIdentifier"));
    v5 = self->_storeIdentifier;
    self->_storeIdentifier = v4;

    -[SUUIItem bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStoreIdentifier setBundleIdentifier:](self->_storeIdentifier, "setBundleIdentifier:", v6);

    -[SUUIStoreIdentifier setPodcastFeedURLIdentifier:](self->_storeIdentifier, "setPodcastFeedURLIdentifier:", self->_feedUrlString);
    storeIdentifier = self->_storeIdentifier;
  }
  return storeIdentifier;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (void)setItemKind:(int64_t)a3
{
  self->_itemKind = a3;
}

- (void)addItemOfferParameterWithName:(id)a3 value:(id)a4
{
  -[SUUIItemOffer _addActionParameterWithName:value:](self->_itemOffer, "_addActionParameterWithName:value:", a3, a4);
}

- (id)lookupDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  void *v33;
  id v34;
  char v35;
  char v36;
  void *v37;
  id v38;
  int64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char isKindOfClass;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  const __CFString *v62;
  void *v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SUUIItem ageBandRange](self, "ageBandRange");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    v7 = v5;
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("minAge"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6 + v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("maxAge"));

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ageBand"));
  }
  -[SUUIItem artistName](self, "artistName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "setObject:forKey:", v11, *MEMORY[0x24BEB2798]);
  -[SUUIItem bundleIdentifier](self, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v3, "setObject:forKey:", v12, *MEMORY[0x24BEB27B0]);
  -[SUUIItem categoryName](self, "categoryName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v13, 0);
    objc_msgSend(v3, "setObject:forKey:", v14, *MEMORY[0x24BEB27E8]);

  }
  -[SUUIItem collectionName](self, "collectionName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("collectionName"));
  if (-[SUUIItem hasInAppPurchases](self, "hasInAppPurchases"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("hasInAppPurchases"));
  v16 = -[SUUIItem itemIdentifier](self, "itemIdentifier");
  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", v16);
    objc_msgSend(v3, "setObject:forKey:", v17, *MEMORY[0x24BEB2800]);

  }
  -[SUUIItem itemKindString](self, "itemKindString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v3, "setObject:forKey:", v18, *MEMORY[0x24BEB2808]);
  -[SUUIItem primaryItemOffer](self, "primaryItemOffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "lookupDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, *MEMORY[0x24BEB2820]);

  }
  v23 = -[SUUIItem numberOfChildItems](self, "numberOfChildItems");
  if (v23 >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("appCount"));

  }
  v25 = -[SUUIItem parentalControlsRank](self, "parentalControlsRank");
  if (v25)
  {
    v62 = CFSTR("value");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, *MEMORY[0x24BEB27B8]);

  }
  -[SUUIItem productPageURLString](self, "productPageURLString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    objc_msgSend(v3, "setObject:forKey:", v28, *MEMORY[0x24BEB2830]);
  -[SUUIItem requiredCapabilities](self, "requiredCapabilities");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    objc_msgSend(v3, "setObject:forKey:", v29, *MEMORY[0x24BEB2840]);
  -[SUUIItem title](self, "title");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    objc_msgSend(v3, "setObject:forKey:", v30, *MEMORY[0x24BEB27E0]);
  v31 = -[SUUIItem versionIdentifier](self, "versionIdentifier");
  if (v31)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("versionId"));

  }
  -[SUUIItem versionString](self, "versionString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("version"));
  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v35 = -[SUUIItem deviceFamilies](self, "deviceFamilies");
  v36 = v35;
  if ((v35 & 1) != 0)
  {
    objc_msgSend(v34, "addObject:", CFSTR("ipad"));
    if ((v36 & 2) == 0)
    {
LABEL_35:
      if ((v36 & 4) == 0)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
  else if ((v35 & 2) == 0)
  {
    goto LABEL_35;
  }
  objc_msgSend(v34, "addObject:", CFSTR("iphone"));
  if ((v36 & 4) != 0)
LABEL_36:
    objc_msgSend(v34, "addObject:", CFSTR("ipod"));
LABEL_37:
  if (objc_msgSend(v34, "count"))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v34, CFSTR("deviceFamilies"), 0);
    objc_msgSend(v3, "setObject:forKey:", v37, *MEMORY[0x24BEB2880]);

  }
  v38 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v39 = -[SUUIItem itemKind](self, "itemKind");
  v40 = (_QWORD *)MEMORY[0x24BEB28B8];
  v41 = (_QWORD *)MEMORY[0x24BEB28A0];
  if (v39 == 17)
  {
    v41 = (_QWORD *)MEMORY[0x24BEB28A8];
    v40 = (_QWORD *)MEMORY[0x24BEB28C0];
  }
  if (v39 == 12)
    v42 = (_QWORD *)MEMORY[0x24BEB28A8];
  else
    v42 = v41;
  if (v39 == 12)
    v43 = (_QWORD *)MEMORY[0x24BEB28C0];
  else
    v43 = v40;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SUUIItem numberOfUserRatings](self, "numberOfUserRatings"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKey:", v44, *v42);

  v45 = (void *)MEMORY[0x24BDD16E0];
  -[SUUIItem userRating](self, "userRating");
  objc_msgSend(v45, "numberWithFloat:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKey:", v46, *v43);

  objc_msgSend(v3, "setObject:forKey:", v38, *MEMORY[0x24BEB28B0]);
  -[SUUIItem artworksProvider](self, "artworksProvider");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[SUUIItem artworksProvider](self, "artworksProvider");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v53 = objc_opt_isKindOfClass();

    if ((v53 & 1) == 0)
      goto LABEL_58;
    -[SUUIItem artworksProvider](self, "artworksProvider");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "_lookupArray");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v52, "count"))
      goto LABEL_56;
    goto LABEL_55;
  }
  objc_msgSend(v49, "urlTemplateString");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(v50, "_lookupDictionary");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_55:
    objc_msgSend(v3, "setObject:forKey:", v52, *MEMORY[0x24BEB27A8]);
LABEL_56:

  }
LABEL_58:
  -[SUUIItem newsstandArtworks](self, "newsstandArtworks");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v55 = objc_opt_isKindOfClass();

  -[SUUIItem newsstandArtworks](self, "newsstandArtworks");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if ((v55 & 1) != 0)
  {
    objc_msgSend(v56, "urlTemplateString");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v58)
    {
LABEL_65:

      goto LABEL_66;
    }
    objc_msgSend(v57, "_lookupDictionary");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_63;
  }
  objc_opt_class();
  v60 = objc_opt_isKindOfClass();

  if ((v60 & 1) != 0)
  {
    -[SUUIItem newsstandArtworks](self, "newsstandArtworks");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "_lookupArray");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v59, "count"))
    {
LABEL_64:

      goto LABEL_65;
    }
LABEL_63:
    objc_msgSend(v3, "setObject:forKey:", v59, *MEMORY[0x24BEB2818]);
    goto LABEL_64;
  }
LABEL_66:

  return v3;
}

- (NSString)_downloadKind
{
  unint64_t v2;
  id v3;

  v2 = -[SUUIItem itemKind](self, "itemKind");
  if (v2 <= 0x12)
    v3 = **((id **)&unk_2511FCA30 + v2);
  return (NSString *)v3;
}

- (void)_setHasInAppPurchases:(BOOL)a3
{
  self->_hasInAppPurchases = a3;
}

- (unint64_t)hash
{
  return self->_itemIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = objc_msgSend(v4, "itemIdentifier");
    v6 = v7 == -[SUUIItem itemIdentifier](self, "itemIdentifier");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SUUIItem)initWithCacheRepresentation:(id)a3
{
  id v4;
  SUUIItem *v5;
  void *v6;
  uint64_t v7;
  NSString *artistName;
  void *v9;
  uint64_t v10;
  NSString *bundleID;
  void *v12;
  uint64_t v13;
  NSString *categoryName;
  void *v15;
  uint64_t v16;
  NSString *collectionName;
  void *v18;
  void *v19;
  void *v20;
  SUUIItemOffer *v21;
  SUUIItemOffer *itemOffer;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *productPageURLString;
  void *v29;
  uint64_t v30;
  NSArray *requiredCapabilities;
  void *v32;
  uint64_t v33;
  NSString *title;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSString *versionString;
  void *v41;
  uint64_t v42;
  NSString *itemKindString;
  uint64_t v44;
  NSString *v45;
  uint64_t v46;
  NSString *v47;
  void *v48;
  void *v49;
  __objc2_class *v50;
  uint64_t v51;
  SUUIArtworkProviding *artworksProvider;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  objc_super v58;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58.receiver = self;
    v58.super_class = (Class)SUUIItem;
    v5 = -[SUUIItem init](&v58, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("artistName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "copy");
        artistName = v5->_artistName;
        v5->_artistName = (NSString *)v7;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("bid"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "copy");
        bundleID = v5->_bundleID;
        v5->_bundleID = (NSString *)v10;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("genre"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "copy");
        categoryName = v5->_categoryName;
        v5->_categoryName = (NSString *)v13;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("col_name"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = objc_msgSend(v15, "copy");
        collectionName = v5->_collectionName;
        v5->_collectionName = (NSString *)v16;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("dev_fam"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_deviceFamilies = objc_msgSend(v18, "unsignedIntegerValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("id"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_itemIdentifier = objc_msgSend(v19, "longLongValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("offer"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = -[SUUIItemOffer initWithCacheRepresentation:]([SUUIItemOffer alloc], "initWithCacheRepresentation:", v20);
        itemOffer = v5->_itemOffer;
        v5->_itemOffer = v21;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("child_count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_numberOfChildItems = objc_msgSend(v23, "integerValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("user_rating_count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_numberOfUserRatings = objc_msgSend(v24, "integerValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("parental_rank"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_parentalControlsRank = objc_msgSend(v25, "integerValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("url"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = objc_msgSend(v26, "copy");
        productPageURLString = v5->_productPageURLString;
        v5->_productPageURLString = (NSString *)v27;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("req_caps"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = objc_msgSend(v29, "copy");
        requiredCapabilities = v5->_requiredCapabilities;
        v5->_requiredCapabilities = (NSArray *)v30;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("name"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = objc_msgSend(v32, "copy");
        title = v5->_title;
        v5->_title = (NSString *)v33;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("user_rating"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v35, "floatValue");
        v5->_userRating = v36;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("version_id"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_versionIdentifier = objc_msgSend(v37, "longLongValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("version"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = objc_msgSend(v38, "copy");
        versionString = v5->_versionString;
        v5->_versionString = (NSString *)v39;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("kind"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = objc_msgSend(v41, "copy");
        itemKindString = v5->_itemKindString;
        v5->_itemKindString = (NSString *)v42;

        v44 = 0;
        v45 = v5->_itemKindString;
        while (!objc_msgSend((id)qword_2511FC8A0[v44 + 1], "isEqualToString:", v45))
        {
          v44 += 2;
          if (v44 == 50)
          {
            v46 = 0;
            goto LABEL_43;
          }
        }
        v46 = qword_2511FC8A0[v44];
LABEL_43:
        v5->_itemKind = v46;
      }
      else
      {
        v47 = v5->_itemKindString;
        v5->_itemKind = 12;
        v5->_itemKindString = (NSString *)CFSTR("iosSoftware");

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("artwork"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("artworkProvider"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v49, "isEqualToString:", CFSTR("artworkTemplate")))
        {
          v50 = SUUIArtworkTemplate;
        }
        else
        {
          v50 = SUUIArtworkList;
        }
        v51 = objc_msgSend([v50 alloc], "initWithCacheRepresentation:", v48);
        artworksProvider = v5->_artworksProvider;
        v5->_artworksProvider = (SUUIArtworkProviding *)v51;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("ageblen"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("agebloc"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v55 = objc_msgSend(v54, "integerValue");
        v56 = objc_msgSend(v53, "integerValue");
        v5->_ageBandRange.location = v55;
      }
      else
      {
        v56 = 0;
        v5->_ageBandRange.location = 0x7FFFFFFFFFFFFFFFLL;
      }
      v5->_ageBandRange.length = v56;

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  NSString *artistName;
  NSString *bundleID;
  NSString *categoryName;
  NSString *collectionName;
  NSString *itemKindString;
  NSString *productPageURLString;
  NSArray *requiredCapabilities;
  NSString *title;
  NSString *versionString;
  void *v23;
  void *v24;
  const __CFString *v25;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_ageBandRange.length);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("ageblen"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_ageBandRange.location);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("agebloc"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_deviceFamilies);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("dev_fam"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("id"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_numberOfChildItems);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("child_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_numberOfUserRatings);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("user_rating_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_parentalControlsRank);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("parental_rank"));

  *(float *)&v11 = self->_userRating;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("user_rating"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_versionIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("version_id"));

  artistName = self->_artistName;
  if (artistName)
    objc_msgSend(v3, "setObject:forKey:", artistName, CFSTR("artistName"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bid"));
  categoryName = self->_categoryName;
  if (categoryName)
    objc_msgSend(v3, "setObject:forKey:", categoryName, CFSTR("genre"));
  collectionName = self->_collectionName;
  if (collectionName)
    objc_msgSend(v3, "setObject:forKey:", collectionName, CFSTR("col_name"));
  itemKindString = self->_itemKindString;
  if (itemKindString)
    objc_msgSend(v3, "setObject:forKey:", itemKindString, CFSTR("kind"));
  productPageURLString = self->_productPageURLString;
  if (productPageURLString)
    objc_msgSend(v3, "setObject:forKey:", productPageURLString, CFSTR("url"));
  requiredCapabilities = self->_requiredCapabilities;
  if (requiredCapabilities)
    objc_msgSend(v3, "setObject:forKey:", requiredCapabilities, CFSTR("req_caps"));
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("name"));
  versionString = self->_versionString;
  if (versionString)
    objc_msgSend(v3, "setObject:forKey:", versionString, CFSTR("version"));
  -[SUUIItemOffer cacheRepresentation](self->_itemOffer, "cacheRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("offer"));
  -[SUUIArtworkProviding cacheRepresentation](self->_artworksProvider, "cacheRepresentation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("artwork"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = CFSTR("artworkTemplate");
LABEL_27:
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("artworkProvider"));
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = CFSTR("artworkList");
    goto LABEL_27;
  }
LABEL_28:

  return (NSMutableDictionary *)v3;
}

- (id)valueForMetricsField:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2928]))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_itemIdentifier);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2940]) & 1) != 0
         || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2938]))
  {
    -[SUUIItem title](self, "title");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2948]))
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[SUUIItem itemKindString](self, "itemKindString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleID;
}

- (SUUIItemOffer)primaryItemOffer
{
  return self->_itemOffer;
}

- (_NSRange)ageBandRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_ageBandRange.length;
  location = self->_ageBandRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (SUUIArtworkProviding)artworksProvider
{
  return self->_artworksProvider;
}

- (int64_t)numberOfChildItems
{
  return self->_numberOfChildItems;
}

- (unint64_t)deviceFamilies
{
  return self->_deviceFamilies;
}

- (BOOL)hasPrerenderedArtwork
{
  return self->_prerenderedArtwork;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (NSString)editorialBadge
{
  return self->_editorialBadge;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (int64_t)itemKind
{
  return self->_itemKind;
}

- (NSString)itemKindString
{
  return self->_itemKindString;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (int64_t)parentalControlsRank
{
  return self->_parentalControlsRank;
}

- (NSString)productPageURLString
{
  return self->_productPageURLString;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (float)userRating
{
  return self->_userRating;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

- (NSString)versionString
{
  return self->_versionString;
}

- (NSArray)videos
{
  return self->_videos;
}

- (BOOL)hasInAppPurchases
{
  return self->_hasInAppPurchases;
}

- (BOOL)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (BOOL)isHiddenFromSpringBoard
{
  return self->_isHiddenFromSpringBoard;
}

- (BOOL)gameControllerSupported
{
  return self->_gameControllerSupported;
}

- (BOOL)requiresGameController
{
  return self->_requiresGameController;
}

- (BOOL)isNewsstandApp
{
  return self->_newsstandApp;
}

- (int64_t)newsstandBindingEdge
{
  return self->_newsstandBindingEdge;
}

- (int64_t)newsstandBindingType
{
  return self->_newsstandBindingType;
}

- (SUUIArtworkProviding)newsstandArtworks
{
  return self->_newsstandArtworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsstandArtworks, 0);
  objc_storeStrong((id *)&self->_editorialBadge, 0);
  objc_storeStrong((id *)&self->_artworksProvider, 0);
  objc_storeStrong((id *)&self->_videos, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_productPageURLString, 0);
  objc_storeStrong((id *)&self->_itemOffer, 0);
  objc_storeStrong((id *)&self->_itemKindString, 0);
  objc_storeStrong((id *)&self->_feedUrlString, 0);
  objc_storeStrong((id *)&self->_editorialBage, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
}

@end
