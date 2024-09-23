@implementation HLPHelpBookController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_hasSectionIcon)
  {
    +[HLPImageCacheController sharedInstance](HLPImageCacheController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeInMemoryCache");

  }
  v4.receiver = self;
  v4.super_class = (Class)HLPHelpBookController;
  -[HLPRemoteDataController dealloc](&v4, sel_dealloc);
}

- (BOOL)isSemanticHTML
{
  return self->_contentFormatVersion > 3;
}

- (void)fetchDataWithDataType:(int64_t)a3 identifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v8 = a5;
  v9 = a4;
  +[HLPCommonDefines contentRequestHeaderFields](HLPCommonDefines, "contentRequestHeaderFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPRemoteDataController setHeaderFields:](self, "setHeaderFields:", v10);

  v11.receiver = self;
  v11.super_class = (Class)HLPHelpBookController;
  -[HLPRemoteDataController fetchDataWithDataType:identifier:completionHandler:](&v11, sel_fetchDataWithDataType_identifier_completionHandler_, a3, v9, v8);

}

- (void)processFileURLWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[HLPRemoteDataController URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0);

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCE50];
    -[HLPRemoteDataController URL](self, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataWithContentsOfURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v9, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithDictionary:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HLPHelpBookController processData:formattedData:](self, "processData:formattedData:", 0, v12);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __61__HLPHelpBookController_processFileURLWithCompletionHandler___block_invoke;
      v13[3] = &unk_24D32E770;
      v13[4] = self;
      v14 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], v13);

    }
  }

}

uint64_t __61__HLPHelpBookController_processFileURLWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLoading:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasLoaded:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)processData:(id)a3 formattedData:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *helpItemMap;
  NSString *v9;
  NSString *bookId;
  NSString *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  HLPHelpLocale *v20;
  HLPHelpLocale *locale;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSString *remoteSearchPath;
  void *v32;
  char v33;
  NSString *v34;
  void *v35;
  char v36;
  NSString *remoteCSSearchIndex;
  uint64_t v38;
  NSString *iconBasePath;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  void *v49;
  HLPHelpTopicItem *v50;
  void *v51;
  HLPHelpTopicItem *v52;
  HLPHelpBookController *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSString *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
  NSString *contentVersion;
  uint64_t v68;
  NSString *copyrightText;
  uint64_t v70;
  NSString *welcomeTopicIdentifier;
  uint64_t v72;
  NSString *copyrightTopicIdentifier;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  __CFString *v80;
  __CFString *v81;
  __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  HLPHelpSectionItem *v93;
  HLPHelpSectionItem *rootSectionItem;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  HLPHelpBookController *v102;
  _QWORD v103[5];
  __CFString *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  void *v109;
  _BYTE v110[128];
  _QWORD v111[3];

  v111[1] = *MEMORY[0x24BDAC8D0];
  v100 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_51;
  v7 = (NSMutableDictionary *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  helpItemMap = self->_helpItemMap;
  self->_helpItemMap = v7;

  v102 = self;
  v99 = v6;
  if (self->_serverType != 1)
  {
    self->_hasSectionIcon = 0;
    v64 = v6;
    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("birdseed_version"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v102->_contentFormatVersion = objc_msgSend(v65, "integerValue");

    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("version"));
    v66 = objc_claimAutoreleasedReturnValue();
    contentVersion = v102->_contentVersion;
    v102->_contentVersion = (NSString *)v66;

    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("copyright_text"));
    v68 = objc_claimAutoreleasedReturnValue();
    copyrightText = v102->_copyrightText;
    v102->_copyrightText = (NSString *)v68;

    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("landing"));
    v70 = objc_claimAutoreleasedReturnValue();
    welcomeTopicIdentifier = v102->_welcomeTopicIdentifier;
    v102->_welcomeTopicIdentifier = (NSString *)v70;

    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("copyright"));
    v72 = objc_claimAutoreleasedReturnValue();
    copyrightTopicIdentifier = v102->_copyrightTopicIdentifier;
    v102->_copyrightTopicIdentifier = (NSString *)v72;

    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("sections"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("topics"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "dictionaryWithDictionary:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("urls"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addEntriesFromDictionary:", v78);

    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("toc"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    -[HLPHelpBookController sectionsForChildrenIdentifiers:level:parent:sectionsMap:topicsMap:](v102, "sectionsForChildrenIdentifiers:level:parent:sectionsMap:topicsMap:", v79, 0, 0, v74, v77);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v102->_contentFormatVersion <= 4)
      v80 = CFSTR("glossary");
    else
      v80 = CFSTR("aside");
    v81 = v80;
    v103[0] = MEMORY[0x24BDAC760];
    v103[1] = 3221225472;
    v103[2] = __51__HLPHelpBookController_processData_formattedData___block_invoke;
    v103[3] = &unk_24D32E838;
    v103[4] = v102;
    v104 = v81;
    v82 = v81;
    objc_msgSend(v77, "enumerateKeysAndObjectsUsingBlock:", v103);

    goto LABEL_45;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bookResponse"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("meta"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("bookId"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  bookId = self->_bookId;
  self->_bookId = v9;

  self->_contentFormatVersion = 5;
  objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("productVersion"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = self->_contentVersion;
  self->_contentVersion = v11;

  objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("copyrightId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uppercaseString");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = self->_copyrightTopicIdentifier;
  self->_copyrightTopicIdentifier = v14;

  objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("copyrightText"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  v17 = self->_copyrightText;
  self->_copyrightText = v16;

  objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("tocId"));
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  v19 = self->_welcomeTopicIdentifier;
  self->_welcomeTopicIdentifier = v18;

  objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("locale"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (v97)
  {
    v20 = objc_alloc_init(HLPHelpLocale);
    locale = self->_locale;
    self->_locale = v20;

    v22 = (void *)MEMORY[0x24BDD1488];
    -[HLPHelpBookController systemLanguages](self, "systemLanguages");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v111[0] = v97;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v111, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferredLocalizationsFromArray:forPreferences:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpLocale setIsoCodes:](v102->_locale, "setIsoCodes:", v25);

  }
  objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("miscAttributes"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    objc_msgSend(v96, "dataUsingEncoding:", 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v26, 0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryWithDictionary:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("remoteSearchTree"));
      v30 = objc_claimAutoreleasedReturnValue();
      remoteSearchPath = v102->_remoteSearchPath;
      v102->_remoteSearchPath = (NSString *)v30;

      -[NSString lastPathComponent](v102->_remoteSearchPath, "lastPathComponent");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("searchTree.json"));

      if ((v33 & 1) == 0)
      {
        v34 = v102->_remoteSearchPath;
        v102->_remoteSearchPath = 0;

      }
      -[NSString lastPathComponent](v102->_remoteCSSearchIndex, "lastPathComponent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("search.cshelpindex"));

      if ((v36 & 1) == 0)
      {
        remoteCSSearchIndex = v102->_remoteCSSearchIndex;
        v102->_remoteCSSearchIndex = 0;

      }
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("iconBaseUrl"));
      v38 = objc_claimAutoreleasedReturnValue();
      iconBasePath = v102->_iconBasePath;
      v102->_iconBasePath = (NSString *)v38;

    }
  }
  objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("toc"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v98, "count"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v102->_hasSectionIcon = 0;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v41 = v98;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v105, v110, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v106 != v43)
            objc_enumerationMutation(v41);
          v45 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("tocId"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v46, "length"))
          {
            objc_msgSend(v40, "setObject:forKeyedSubscript:", v45, v46);
            -[NSMutableDictionary objectForKeyedSubscript:](v102->_helpItemMap, "objectForKeyedSubscript:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v47 == 0;

            if (v48)
            {
              objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("target"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v49, "length"))
              {
                v50 = objc_alloc_init(HLPHelpTopicItem);
                -[HLPHelpItem setServerType:](v50, "setServerType:", 1);
                objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("title"));
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                -[HLPHelpItem setName:](v50, "setName:", v51);

                -[HLPHelpTopicItem setGlossaryIdentifierString:](v50, "setGlossaryIdentifierString:", CFSTR("aside"));
                -[HLPHelpItem setIdentifier:](v50, "setIdentifier:", v46);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v102->_helpItemMap, "setObject:forKeyedSubscript:", v50, v46);

              }
            }
          }

        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v105, v110, 16);
      }
      while (v42);
    }

    if (-[NSString length](v102->_copyrightTopicIdentifier, "length"))
    {
      if (!v102->_copyrightText)
        goto LABEL_32;
      -[HLPHelpBookController helpItemForID:](v102, "helpItemForID:", v102->_copyrightTopicIdentifier);
      v52 = (HLPHelpTopicItem *)objc_claimAutoreleasedReturnValue();
      if (!v52)
      {
        v52 = objc_alloc_init(HLPHelpTopicItem);
        -[HLPHelpItem setServerType:](v52, "setServerType:", 1);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v102->_helpItemMap, "setObject:forKeyedSubscript:", v52, v102->_copyrightTopicIdentifier);
      }
      -[HLPHelpItem setName:](v52, "setName:", v102->_copyrightText);
      -[HLPHelpItem setIdentifier:](v52, "setIdentifier:", v102->_copyrightTopicIdentifier);
      -[HLPHelpTopicItem setHrefID:](v52, "setHrefID:", v102->_copyrightTopicIdentifier);

    }
    v53 = v102;
    if (v102->_copyrightText)
    {
LABEL_35:
      objc_msgSend(v40, "objectForKeyedSubscript:", v53->_welcomeTopicIdentifier);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("children"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v62, "count"))
      {
        -[HLPHelpBookController dynamicServerSectionsForIdentifiers:level:parent:tocMap:](v102, "dynamicServerSectionsForIdentifiers:level:parent:tocMap:", v62, 0, 0, v40);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v63 = 0;
      }

      goto LABEL_44;
    }
LABEL_32:
    objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("Copyright © %ld Apple Inc. All rights reserved."), &stru_24D32F538, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "components:fromDate:", 4, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v58, "year") >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v55, objc_msgSend(v58, "year"));
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = v102->_copyrightText;
      v102->_copyrightText = (NSString *)v59;

    }
    v53 = v102;
    goto LABEL_35;
  }
  v63 = 0;
LABEL_44:

LABEL_45:
  if (v102->_hasSectionIcon)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "firstObject");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = (void *)MEMORY[0x24BDD1488];
    -[HLPHelpBookController systemLanguages](v102, "systemLanguages");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v84;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v109, 1);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "preferredLocalizationsFromArray:forPreferences:", v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v88, "firstObject");
    v89 = objc_claimAutoreleasedReturnValue();
    v90 = (void *)v89;
    if (v89)
      v91 = (void *)v89;
    else
      v91 = v84;
    +[HLPImageCacheController sharedInstance](HLPImageCacheController, "sharedInstance");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setLanguageCode:", v91);

  }
  v93 = objc_alloc_init(HLPHelpSectionItem);
  rootSectionItem = v102->_rootSectionItem;
  v102->_rootSectionItem = v93;

  -[HLPHelpSectionItem setOpen:](v102->_rootSectionItem, "setOpen:", 1);
  -[HLPHelpSectionItem setChildren:](v102->_rootSectionItem, "setChildren:", v63);

  v6 = v99;
LABEL_51:

}

void __51__HLPHelpBookController_processData_formattedData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  HLPHelpTopicItem *v8;
  void *v9;
  HLPHelpTopicItem *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "helpItemMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [HLPHelpTopicItem alloc];
    objc_msgSend(*(id *)(a1 + 32), "helpBookURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HLPHelpTopicItem initWithDictionary:helpBookURL:serverType:](v8, "initWithDictionary:helpBookURL:serverType:", v5, v9, objc_msgSend(*(id *)(a1 + 32), "serverType"));

    -[HLPHelpTopicItem setGlossaryIdentifierString:](v10, "setGlossaryIdentifierString:", *(_QWORD *)(a1 + 40));
    -[HLPHelpItem setIdentifier:](v10, "setIdentifier:", v12);
    objc_msgSend(*(id *)(a1 + 32), "helpItemMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  }
}

- (id)systemLanguages
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDBCEA0], "systemLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpBookController additionalSupportedLanguages](self, "additionalSupportedLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[HLPHelpBookController additionalSupportedLanguages](self, "additionalSupportedLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

- (id)dynamicServerSectionsForIdentifiers:(id)a3 level:(int64_t)a4 parent:(id)a5 tocMap:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  HLPHelpSectionItem *v24;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  HLPHelpBookController *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0x254DBF000uLL;
    v16 = *(_QWORD *)v41;
    v39 = self;
    v34 = v12;
    v37 = *(_QWORD *)v41;
    do
    {
      v17 = 0;
      v35 = v14;
      do
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v17);
        if ((objc_msgSend(v18, "isEqualToString:", *(Class *)((char *)&self->super.super.isa + *(int *)(v15 + 1456))) & 1) == 0)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("children"));
            v21 = (id)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");
            -[NSMutableDictionary objectForKeyedSubscript:](self->_helpItemMap, "objectForKeyedSubscript:", v18);
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (HLPHelpSectionItem *)v23;
            if (v21 != v12 && v22 != 0)
            {
              if (!v23)
              {
                v24 = -[HLPHelpItem initWithDictionary:helpBookURL:serverType:]([HLPHelpSectionItem alloc], "initWithDictionary:helpBookURL:serverType:", v20, v39->_helpBookURL, v39->_serverType);
                -[HLPHelpItem setIdentifier:](v24, "setIdentifier:", v18);
              }
              -[HLPHelpBookController dynamicServerSectionsForIdentifiers:level:parent:tocMap:](v39, "dynamicServerSectionsForIdentifiers:level:parent:tocMap:", v21, a4 + 1, v24, v11);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[HLPHelpSectionItem setChildren:](v24, "setChildren:", v26);

            }
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("icon"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "length") && -[NSString length](v39->_iconBasePath, "length"))
            {
              -[NSString stringByAppendingPathComponent:](v39->_iconBasePath, "stringByAppendingPathComponent:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v28);
              v29 = v11;
              v30 = v10;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[HLPHelpItem setIconURL:](v24, "setIconURL:", v31);

              v10 = v30;
              v11 = v29;
              v39->_hasSectionIcon = 1;
              v12 = v34;
              v14 = v35;

            }
            -[HLPHelpItem setParent:](v24, "setParent:", v10);
            -[HLPHelpItem setLevel:](v24, "setLevel:", a4);
            if (v24)
              objc_msgSend(v36, "addObject:", v24);

            self = v39;
            v15 = 0x254DBF000;
            v16 = v37;
          }

        }
        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v36, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v36);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)sectionsForChildrenIdentifiers:(id)a3 level:(int64_t)a4 parent:(id)a5 sectionsMap:(id)a6 topicsMap:(id)a7
{
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  __CFString *v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  HLPHelpBookController *v29;
  id v30;
  __CFString *v31;
  id v32;
  id v33;
  int64_t v34;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (self->_contentFormatVersion <= 4)
    v15 = CFSTR("glossary");
  else
    v15 = CFSTR("aside");
  v16 = v15;
  v17 = (void *)MEMORY[0x24BDBCEB8];
  v18 = a3;
  objc_msgSend(v17, "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __91__HLPHelpBookController_sectionsForChildrenIdentifiers_level_parent_sectionsMap_topicsMap___block_invoke;
  v27[3] = &unk_24D32E860;
  v20 = v13;
  v28 = v20;
  v29 = self;
  v34 = a4;
  v21 = v14;
  v30 = v21;
  v22 = v16;
  v31 = v22;
  v23 = v12;
  v32 = v23;
  v24 = v19;
  v33 = v24;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v27);

  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void __91__HLPHelpBookController_sectionsForChildrenIdentifiers_level_parent_sectionsMap_topicsMap___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  HLPHelpSectionItem *v5;
  HLPHelpSectionItem *v6;
  void *v7;
  HLPHelpSectionItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HLPHelpTopicItem *v14;
  HLPHelpTopicItem *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "helpItemMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v18);
    v5 = (HLPHelpSectionItem *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = [HLPHelpSectionItem alloc];
      objc_msgSend(*(id *)(a1 + 40), "helpBookURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[HLPHelpItem initWithDictionary:helpBookURL:serverType:](v6, "initWithDictionary:helpBookURL:serverType:", v3, v7, objc_msgSend(*(id *)(a1 + 40), "serverType"));

    }
    v8 = v5;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("children"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpSectionItem children](v8, "children");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "sectionsForChildrenIdentifiers:level:parent:sectionsMap:topicsMap:", v9, *(_QWORD *)(a1 + 80) + 1, v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpSectionItem setChildren:](v8, "setChildren:", v11);

    }
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "helpItemMap");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, v18);

    }
    -[HLPHelpItem iconURL](v8, "iconURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(*(id *)(a1 + 40), "setHasSectionIcon:", 1);
    v14 = (HLPHelpTopicItem *)v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v15 = [HLPHelpTopicItem alloc];
      objc_msgSend(*(id *)(a1 + 40), "helpBookURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HLPHelpTopicItem initWithDictionary:helpBookURL:serverType:](v15, "initWithDictionary:helpBookURL:serverType:", v9, v16, objc_msgSend(*(id *)(a1 + 40), "serverType"));

      -[HLPHelpTopicItem setGlossaryIdentifierString:](v14, "setGlossaryIdentifierString:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 40), "helpItemMap");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, v18);

      v8 = 0;
    }
    else
    {
      v8 = 0;
      v14 = 0;
    }
  }

  -[HLPHelpItem setIdentifier:](v14, "setIdentifier:", v18);
  -[HLPHelpItem setParent:](v14, "setParent:", *(_QWORD *)(a1 + 64));
  -[HLPHelpItem setLevel:](v14, "setLevel:", *(_QWORD *)(a1 + 80));
  if (v14)
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v14);

}

- (id)helpTopicItemForID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[HLPHelpBookController helpItemForID:](self, "helpItemForID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)helpTopicItemForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary allValues](self->_helpItemMap, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__HLPHelpBookController_helpTopicItemForName___block_invoke;
    v10[3] = &unk_24D32E620;
    v7 = v5;
    v11 = v7;
    v12 = &v13;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __46__HLPHelpBookController_helpTopicItemForName___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = v13;
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v12)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }

    v8 = v13;
  }

}

- (void)addAsideTopic:(id)a3
{
  uint64_t v4;
  void *v5;
  NSMutableDictionary *helpItemMap;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    helpItemMap = self->_helpItemMap;
    objc_msgSend(v11, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](helpItemMap, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = self->_helpItemMap;
      objc_msgSend(v11, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, v10);

    }
  }

}

- (id)helpItemForID:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *helpItemMap;
  void *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_helpItemMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (self->_serverType == 1)
    {
      helpItemMap = self->_helpItemMap;
      objc_msgSend(v4, "uppercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](helpItemMap, "objectForKeyedSubscript:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)copyrightTopicItem
{
  return -[HLPHelpBookController helpTopicItemForID:](self, "helpTopicItemForID:", self->_copyrightTopicIdentifier);
}

- (id)welcomeTopicItem
{
  return -[HLPHelpBookController helpTopicItemForID:](self, "helpTopicItemForID:", self->_welcomeTopicIdentifier);
}

- (int64_t)contentFormatVersion
{
  return self->_contentFormatVersion;
}

- (void)setContentFormatVersion:(int64_t)a3
{
  self->_contentFormatVersion = a3;
}

- (int64_t)serverType
{
  return self->_serverType;
}

- (void)setServerType:(int64_t)a3
{
  self->_serverType = a3;
}

- (BOOL)hasSectionIcon
{
  return self->_hasSectionIcon;
}

- (void)setHasSectionIcon:(BOOL)a3
{
  self->_hasSectionIcon = a3;
}

- (BOOL)fullBookView
{
  return self->_fullBookView;
}

- (void)setFullBookView:(BOOL)a3
{
  self->_fullBookView = a3;
}

- (BOOL)platformIndependent
{
  return self->_platformIndependent;
}

- (void)setPlatformIndependent:(BOOL)a3
{
  self->_platformIndependent = a3;
}

- (NSArray)additionalSupportedLanguages
{
  return self->_additionalSupportedLanguages;
}

- (void)setAdditionalSupportedLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSMutableDictionary)helpItemMap
{
  return self->_helpItemMap;
}

- (void)setHelpItemMap:(id)a3
{
  objc_storeStrong((id *)&self->_helpItemMap, a3);
}

- (NSString)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_contentVersion, a3);
}

- (NSString)copyrightText
{
  return self->_copyrightText;
}

- (void)setCopyrightText:(id)a3
{
  objc_storeStrong((id *)&self->_copyrightText, a3);
}

- (NSString)copyrightTopicIdentifier
{
  return self->_copyrightTopicIdentifier;
}

- (void)setCopyrightTopicIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_copyrightTopicIdentifier, a3);
}

- (NSString)bookId
{
  return self->_bookId;
}

- (void)setBookId:(id)a3
{
  objc_storeStrong((id *)&self->_bookId, a3);
}

- (NSString)topicPathFormat
{
  return self->_topicPathFormat;
}

- (void)setTopicPathFormat:(id)a3
{
  objc_storeStrong((id *)&self->_topicPathFormat, a3);
}

- (NSString)remoteSearchPath
{
  return self->_remoteSearchPath;
}

- (void)setRemoteSearchPath:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSearchPath, a3);
}

- (NSString)remoteCSSearchIndex
{
  return self->_remoteCSSearchIndex;
}

- (void)setRemoteCSSearchIndex:(id)a3
{
  objc_storeStrong((id *)&self->_remoteCSSearchIndex, a3);
}

- (NSString)iconBasePath
{
  return self->_iconBasePath;
}

- (void)setIconBasePath:(id)a3
{
  objc_storeStrong((id *)&self->_iconBasePath, a3);
}

- (HLPHelpLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSString)welcomeTopicIdentifier
{
  return self->_welcomeTopicIdentifier;
}

- (void)setWelcomeTopicIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeTopicIdentifier, a3);
}

- (NSURL)helpBookURL
{
  return self->_helpBookURL;
}

- (void)setHelpBookURL:(id)a3
{
  objc_storeStrong((id *)&self->_helpBookURL, a3);
}

- (HLPHelpSectionItem)rootSectionItem
{
  return self->_rootSectionItem;
}

- (void)setRootSectionItem:(id)a3
{
  objc_storeStrong((id *)&self->_rootSectionItem, a3);
}

- (HLPURLImageCacheController)imageCacheController
{
  return self->_imageCacheController;
}

- (void)setImageCacheController:(id)a3
{
  objc_storeStrong((id *)&self->_imageCacheController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCacheController, 0);
  objc_storeStrong((id *)&self->_rootSectionItem, 0);
  objc_storeStrong((id *)&self->_helpBookURL, 0);
  objc_storeStrong((id *)&self->_welcomeTopicIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_iconBasePath, 0);
  objc_storeStrong((id *)&self->_remoteCSSearchIndex, 0);
  objc_storeStrong((id *)&self->_remoteSearchPath, 0);
  objc_storeStrong((id *)&self->_topicPathFormat, 0);
  objc_storeStrong((id *)&self->_bookId, 0);
  objc_storeStrong((id *)&self->_copyrightTopicIdentifier, 0);
  objc_storeStrong((id *)&self->_copyrightText, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_helpItemMap, 0);
  objc_storeStrong((id *)&self->_additionalSupportedLanguages, 0);
}

@end
