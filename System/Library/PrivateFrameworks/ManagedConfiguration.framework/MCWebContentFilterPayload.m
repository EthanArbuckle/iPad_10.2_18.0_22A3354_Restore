@implementation MCWebContentFilterPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.webcontent-filter");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("WEB_FILTER_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("WEB_FILTER_"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)pluginFilterKeysAndClasses
{
  if (pluginFilterKeysAndClasses_onceToken != -1)
    dispatch_once(&pluginFilterKeysAndClasses_onceToken, &__block_literal_global_50);
  return (id)pluginFilterKeysAndClasses_dict;
}

void __55__MCWebContentFilterPayload_pluginFilterKeysAndClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UserDefinedName");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("PluginBundleID");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("ServerAddress");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("UserName");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("Password");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("PayloadCertificateUUID");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("Organization");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("VendorConfig");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("FilterBrowsers");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("FilterSockets");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("ApplicationCreated");
  v3[10] = objc_opt_class();
  v2[11] = CFSTR("Enabled");
  v3[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pluginFilterKeysAndClasses_dict;
  pluginFilterKeysAndClasses_dict = v0;

}

- (MCWebContentFilterPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCWebContentFilterPayload *v10;
  MCWebContentFilterPayload *v11;
  uint64_t v12;
  id v13;
  NSString *contentFilterUUID;
  void *v15;
  void *name;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  id *p_filterType;
  int v30;
  _BOOL4 v31;
  uint64_t v32;
  NSString *pluginBundleID;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSDictionary *pluginConfiguration;
  void *v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  NSArray *denyListURLStrings;
  NSArray *v54;
  const __CFString *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  NSArray *v60;
  uint64_t v61;
  NSArray *allowListBookmarks;
  NSArray *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  const __CFString *v74;
  uint64_t v75;
  NSArray *v76;
  NSArray *v77;
  uint64_t v78;
  NSArray *v79;
  uint64_t v80;
  NSArray *v81;
  uint64_t v82;
  NSArray *v83;
  NSArray *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  NSArray *obj;
  NSArray *obja;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  id v111;
  id v112;
  id v113;
  id v114;
  objc_super v115;
  uint8_t buf[4];
  void *v117;
  __int16 v118;
  id v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v115.receiver = self;
  v115.super_class = (Class)MCWebContentFilterPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v115, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  v11 = v10;
  if (!v10)
    goto LABEL_13;
  v114 = 0;
  -[MCWebContentFilterPayload _stringFromDict:key:outError:](v10, "_stringFromDict:key:outError:", v8, CFSTR("ContentFilterUUID"), &v114);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v114;
  contentFilterUUID = v11->_contentFilterUUID;
  v11->_contentFilterUUID = (NSString *)v12;

  if (v13)
    goto LABEL_3;
  -[MCWebContentFilterPayload _stringFromDict:key:outError:](v11, "_stringFromDict:key:outError:", v8, CFSTR("FilterType"), 0);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    v28 = (__CFString *)v26;
  else
    v28 = CFSTR("BuiltIn");
  p_filterType = (id *)&v11->_filterType;
  objc_storeStrong((id *)&v11->_filterType, v28);

  v11->_hideDenyListURLs = -[MCWebContentFilterPayload _BOOLFromDict:key:outError:](v11, "_BOOLFromDict:key:outError:", v8, CFSTR("HideDenyListURLs"), 0);
  v30 = objc_msgSend(v9, "isStub");
  v31 = -[NSString isEqualToString:](v11->_filterType, "isEqualToString:", CFSTR("Plugin"));
  if (v30)
  {
    if (v31)
    {
      -[MCWebContentFilterPayload _stringFromDict:key:outError:](v11, "_stringFromDict:key:outError:", v8, CFSTR("PluginBundleID"), 0);
      v32 = objc_claimAutoreleasedReturnValue();
      pluginBundleID = v11->_pluginBundleID;
      v11->_pluginBundleID = (NSString *)v32;

      -[MCWebContentFilterPayload _stringFromDict:key:outError:](v11, "_stringFromDict:key:outError:", v8, CFSTR("UserDefinedName"), 0);
      v34 = objc_claimAutoreleasedReturnValue();
      v13 = 0;
      name = v11->_name;
      v11->_name = (NSString *)v34;
LABEL_8:

      goto LABEL_9;
    }
    v39 = -[MCWebContentFilterPayload _BOOLFromDict:key:outError:](v11, "_BOOLFromDict:key:outError:", v8, CFSTR("AutoFilterEnabled"), 0);
    v11->_autoFilterEnabled = v39;
    if (v39)
    {
      -[MCWebContentFilterPayload _stringsFromDict:key:outError:](v11, "_stringsFromDict:key:outError:", v8, CFSTR("PermittedURLs"), 0);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v40;
      if (v40)
        v42 = (void *)v40;
      else
        v42 = (void *)MEMORY[0x1E0C9AA60];
      objc_storeStrong((id *)&v11->_permittedURLStrings, v42);

    }
    -[MCWebContentFilterPayload _dictsFromDict:key:outError:](v11, "_dictsFromDict:key:outError:", v8, CFSTR("AllowListBookmarks"), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (!v43)
    {
      -[MCWebContentFilterPayload _dictsFromDict:key:outError:](v11, "_dictsFromDict:key:outError:", v8, CFSTR("WhitelistedBookmarks"), 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v11->_allowListBookmarks, v44);
    if (!v43)

    -[MCWebContentFilterPayload _stringsFromDict:key:outError:](v11, "_stringsFromDict:key:outError:", v8, CFSTR("DenyListURLs"), 0);
    name = (void *)objc_claimAutoreleasedReturnValue();
    v38 = name;
    if (!name)
    {
      -[MCWebContentFilterPayload _stringsFromDict:key:outError:](v11, "_stringsFromDict:key:outError:", v8, CFSTR("BlacklistedURLs"), 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v11->_denyListURLStrings, v38);
    if (name)
    {
LABEL_45:
      v13 = 0;
      goto LABEL_8;
    }
LABEL_44:

    goto LABEL_45;
  }
  if (!v31 && (objc_msgSend(*p_filterType, "isEqualToString:", CFSTR("BuiltIn")) & 1) == 0)
  {
    +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("FilterType"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_111;
  }
  if (objc_msgSend(*p_filterType, "isEqualToString:", CFSTR("Plugin")))
  {
    +[MCWebContentFilterPayload pluginFilterKeysAndClasses](MCWebContentFilterPayload, "pluginFilterKeysAndClasses");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = 0;
    objc_msgSend(v8, "MCMutableDictionaryContainingValidatedKeysAndClasses:removeKeys:outError:", v35, 1, &v113);
    v36 = objc_claimAutoreleasedReturnValue();
    v13 = v113;
    pluginConfiguration = v11->_pluginConfiguration;
    v11->_pluginConfiguration = (NSDictionary *)v36;

    if (!v13)
    {
      -[NSDictionary objectForKeyedSubscript:](v11->_pluginConfiguration, "objectForKeyedSubscript:", CFSTR("PluginBundleID"));
      name = (void *)objc_claimAutoreleasedReturnValue();
      if (name)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(name, "length"))
            objc_storeStrong((id *)&v11->_pluginBundleID, name);
        }
      }
      -[NSDictionary objectForKeyedSubscript:](v11->_pluginConfiguration, "objectForKeyedSubscript:", CFSTR("UserDefinedName"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v38, "length"))
            objc_storeStrong((id *)&v11->_name, v38);
        }
      }
      goto LABEL_44;
    }
LABEL_3:
    -[MCPayload malformedPayloadErrorWithError:](v11, "malformedPayloadErrorWithError:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    name = v15;
    if (a5)
      *a5 = objc_retainAutorelease(v15);
    v17 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      v19 = (void *)objc_opt_class();
      v20 = v19;
      objc_msgSend(name, "MCVerboseDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v117 = v19;
      v118 = 2114;
      v119 = v21;
      _os_log_impl(&dword_19ECC4000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v11 = 0;
    goto LABEL_8;
  }
  v112 = 0;
  v45 = -[MCWebContentFilterPayload _BOOLFromDict:key:outError:](v11, "_BOOLFromDict:key:outError:", v8, CFSTR("AutoFilterEnabled"), &v112);
  v13 = v112;
  v11->_autoFilterEnabled = v45;
  if (v13)
    goto LABEL_3;
  if (v45)
  {
    v111 = 0;
    -[MCWebContentFilterPayload _stringsFromDict:key:outError:](v11, "_stringsFromDict:key:outError:", v8, CFSTR("PermittedURLs"), &v111);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v111;
    if (v46)
      v47 = v46;
    else
      v47 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v11->_permittedURLStrings, v47);

    if (v13)
      goto LABEL_3;
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    obj = v11->_permittedURLStrings;
    v48 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v108 != v50)
            objc_enumerationMutation(obj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("PermittedURLs"));
            v13 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_111;
          }
        }
        v49 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
      }
      while (v49);
    }

  }
  v106 = 0;
  -[MCWebContentFilterPayload _stringsFromDict:key:outError:](v11, "_stringsFromDict:key:outError:", v8, CFSTR("DenyListURLs"), &v106);
  v52 = objc_claimAutoreleasedReturnValue();
  v13 = v106;
  denyListURLStrings = v11->_denyListURLStrings;
  v11->_denyListURLStrings = (NSArray *)v52;

  if (v13)
    goto LABEL_111;
  v54 = v11->_denyListURLStrings;
  if (v54)
  {
    v55 = CFSTR("DenyListURLs");
  }
  else
  {
    v105 = 0;
    -[MCWebContentFilterPayload _stringsFromDict:key:outError:](v11, "_stringsFromDict:key:outError:", v8, CFSTR("BlacklistedURLs"), &v105);
    v78 = objc_claimAutoreleasedReturnValue();
    v13 = v105;
    v79 = v11->_denyListURLStrings;
    v11->_denyListURLStrings = (NSArray *)v78;

    if (v13)
      goto LABEL_111;
    v54 = v11->_denyListURLStrings;
    v55 = CFSTR("BlacklistedURLs");
  }
  v91 = v55;
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obja = v54;
  v56 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v102;
    do
    {
      for (j = 0; j != v57; ++j)
      {
        if (*(_QWORD *)v102 != v58)
          objc_enumerationMutation(obja);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", v91);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_115;
        }
      }
      v57 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
    }
    while (v57);
  }

  if (!-[NSArray count](v11->_denyListURLStrings, "count"))
  {
    v60 = v11->_denyListURLStrings;
    v11->_denyListURLStrings = 0;

  }
  v100 = 0;
  -[MCWebContentFilterPayload _dictsFromDict:key:outError:](v11, "_dictsFromDict:key:outError:", v8, CFSTR("AllowListBookmarks"), &v100);
  v61 = objc_claimAutoreleasedReturnValue();
  v13 = v100;
  allowListBookmarks = v11->_allowListBookmarks;
  v11->_allowListBookmarks = (NSArray *)v61;

  if (!v13)
  {
    v63 = v11->_allowListBookmarks;
    if (!v63)
    {
      v99 = 0;
      -[MCWebContentFilterPayload _dictsFromDict:key:outError:](v11, "_dictsFromDict:key:outError:", v8, CFSTR("WhitelistedBookmarks"), &v99);
      v80 = objc_claimAutoreleasedReturnValue();
      v13 = v99;
      v81 = v11->_allowListBookmarks;
      v11->_allowListBookmarks = (NSArray *)v80;

      if (v13)
        goto LABEL_111;
      v63 = v11->_allowListBookmarks;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v63, "count"));
    obja = (NSArray *)objc_claimAutoreleasedReturnValue();
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v83 = v11->_allowListBookmarks;
    v87 = -[NSArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v95, v120, 16);
    v13 = 0;
    if (!v87)
      goto LABEL_106;
    v88 = *(_QWORD *)v96;
LABEL_78:
    v64 = 0;
    while (1)
    {
      if (*(_QWORD *)v96 != v88)
        objc_enumerationMutation(v83);
      v65 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v64);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("WhitelistedBookmarks"));
        v82 = objc_claimAutoreleasedReturnValue();
LABEL_122:

        v13 = (id)v82;
LABEL_123:

        goto LABEL_115;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("URL"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (v66)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("address"));
          v82 = objc_claimAutoreleasedReturnValue();

          v13 = v92;
          goto LABEL_122;
        }
        objc_msgSend(v92, "setObject:forKeyedSubscript:", v66, CFSTR("address"));
      }
      v89 = v64;
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("BookmarkPath"));
      v67 = objc_claimAutoreleasedReturnValue();
      v90 = v66;
      if (v67)
      {
        v68 = (void *)v67;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("bookmarkPath"));
          v70 = 0;
          v71 = v13;
          v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_103;
        }
        if (objc_msgSend(v68, "rangeOfString:options:", CFSTR("/"), 8) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@"), v68);
          v85 = objc_claimAutoreleasedReturnValue();

          v69 = (void *)v85;
        }
        else
        {
          v69 = v68;
        }
        v68 = v69;
        objc_msgSend(v92, "setObject:forKeyedSubscript:");
      }
      else
      {
        objc_msgSend(v92, "setObject:forKeyedSubscript:", CFSTR("/"), CFSTR("bookmarkPath"));
        v68 = 0;
      }
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("Title"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (v71)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("pageTitle"));
          v86 = objc_claimAutoreleasedReturnValue();

          v70 = 0;
          v13 = (id)v86;
          goto LABEL_103;
        }
        objc_msgSend(v92, "setObject:forKeyedSubscript:", v71, CFSTR("pageTitle"));
      }
      objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("address"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v72)
      {
        v74 = CFSTR("address");
LABEL_102:
        +[MCPayload missingFieldErrorWithField:underlyingError:](MCPayload, "missingFieldErrorWithField:underlyingError:", v74, 0);
        v75 = objc_claimAutoreleasedReturnValue();

        v70 = 0;
        v13 = (id)v75;
        goto LABEL_103;
      }
      objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("pageTitle"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v73)
      {
        v74 = CFSTR("pageTitle");
        goto LABEL_102;
      }
      -[NSArray addObject:](obja, "addObject:", v92);
      v70 = 1;
LABEL_103:

      if (!v70)
        goto LABEL_123;
      v64 = v89 + 1;
      if (v87 == v89 + 1)
      {
        v87 = -[NSArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v95, v120, 16);
        if (v87)
          goto LABEL_78;
LABEL_106:

        if (-[NSArray count](obja, "count"))
          v76 = obja;
        else
          v76 = 0;
        v77 = v76;
        v84 = v11->_allowListBookmarks;
        v11->_allowListBookmarks = v77;

LABEL_115:
        break;
      }
    }
  }
LABEL_111:
  if (v13)
    goto LABEL_3;
LABEL_9:
  if (objc_msgSend(v8, "count"))
  {
    v22 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      -[MCPayload friendlyName](v11, "friendlyName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v117 = v24;
      v118 = 2114;
      v119 = v8;
      _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_13:
  return v11;
}

- (BOOL)_BOOLFromDict:(id)a3 key:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), v7, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v9, "BOOLValue");
  return (char)v8;
}

- (id)_stringFromDict:(id)a3 key:(id)a4 outError:(id *)a5
{
  return (id)objc_msgSend(a3, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", a4, 0, a5);
}

- (id)_stringsFromDict:(id)a3 key:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), v7, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictsFromDict:(id)a3 key:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), v7, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MCWebContentFilterPayload;
  -[MCPayload stubDictionary](&v23, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCWebContentFilterPayload contentFilterUUID](self, "contentFilterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCWebContentFilterPayload contentFilterUUID](self, "contentFilterUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ContentFilterUUID"));

  }
  -[MCWebContentFilterPayload filterType](self, "filterType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCWebContentFilterPayload filterType](self, "filterType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("FilterType"));

  }
  if (-[MCWebContentFilterPayload hideDenyListURLs](self, "hideDenyListURLs"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCWebContentFilterPayload hideDenyListURLs](self, "hideDenyListURLs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("HideDenyListURLs"));

  }
  -[MCWebContentFilterPayload filterType](self, "filterType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Plugin"));

  if (v10)
  {
    -[MCWebContentFilterPayload pluginBundleID](self, "pluginBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[MCWebContentFilterPayload pluginBundleID](self, "pluginBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("PluginBundleID"));

    }
    -[MCWebContentFilterPayload name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[MCWebContentFilterPayload name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("UserDefinedName");
LABEL_18:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v15);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCWebContentFilterPayload autoFilterEnabled](self, "autoFilterEnabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("AutoFilterEnabled"));

    -[MCWebContentFilterPayload permittedURLStrings](self, "permittedURLStrings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[MCWebContentFilterPayload permittedURLStrings](self, "permittedURLStrings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("PermittedURLs"));

    }
    -[MCWebContentFilterPayload allowListBookmarks](self, "allowListBookmarks");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[MCWebContentFilterPayload allowListBookmarks](self, "allowListBookmarks");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("AllowListBookmarks"));

    }
    -[MCWebContentFilterPayload denyListURLStrings](self, "denyListURLStrings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[MCWebContentFilterPayload denyListURLStrings](self, "denyListURLStrings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("DenyListURLs");
      goto LABEL_18;
    }
  }
  return v3;
}

- (id)restrictions
{
  void *v3;
  char v4;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  _BYTE v38[128];
  const __CFString *v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  -[MCWebContentFilterPayload filterType](self, "filterType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Plugin"));

  if ((v4 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("restrictedBool"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("intersection"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("union"));
  if (-[MCWebContentFilterPayload autoFilterEnabled](self, "autoFilterEnabled"))
  {
    v41[0] = CFSTR("value");
    v41[1] = CFSTR("preference");
    v42[0] = MEMORY[0x1E0C9AAB0];
    v42[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("forceWebContentFilterAuto"));

  }
  -[MCWebContentFilterPayload permittedURLStrings](self, "permittedURLStrings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v39 = CFSTR("values");
    -[MCWebContentFilterPayload permittedURLStrings](self, "permittedURLStrings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("webContentFilterAutoPermittedURLs"));

  }
  -[MCWebContentFilterPayload allowListBookmarks](self, "allowListBookmarks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v28 = v9;
    v29 = v7;
    v15 = (void *)MEMORY[0x1E0C99DE8];
    -[MCWebContentFilterPayload allowListBookmarks](self, "allowListBookmarks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[MCWebContentFilterPayload allowListBookmarks](self, "allowListBookmarks");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v31;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v22), "objectForKeyedSubscript:", CFSTR("address"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v20);
    }

    v36 = CFSTR("values");
    v37 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, CFSTR("webContentFilterWhitelistedURLs"));

    v9 = v28;
    v7 = v29;
  }
  -[MCWebContentFilterPayload denyListURLStrings](self, "denyListURLStrings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v34 = CFSTR("values");
    -[MCWebContentFilterPayload denyListURLStrings](self, "denyListURLStrings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("webContentFilterBlacklistedURLs"));

  }
  return v6;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MCWebContentFilterPayload;
  -[MCPayload verboseDescription](&v18, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCWebContentFilterPayload filterType](self, "filterType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Type : %@\n"), v5);

  -[MCWebContentFilterPayload filterType](self, "filterType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Plugin"));

  if ((v7 & 1) == 0)
  {
    v8 = -[MCWebContentFilterPayload autoFilterEnabled](self, "autoFilterEnabled");
    v9 = CFSTR("No");
    if (v8)
      v9 = CFSTR("Yes");
    objc_msgSend(v4, "appendFormat:", CFSTR("Auto Filter    : %@\n"), v9);
    -[MCWebContentFilterPayload permittedURLStrings](self, "permittedURLStrings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[MCWebContentFilterPayload permittedURLStrings](self, "permittedURLStrings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("Permitted URLs:\n%@\n"), v11);

    }
    -[MCWebContentFilterPayload allowListBookmarks](self, "allowListBookmarks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[MCWebContentFilterPayload allowListBookmarks](self, "allowListBookmarks");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("Allowed bookmarks:\n%@\n"), v13);

    }
    -[MCWebContentFilterPayload denyListURLStrings](self, "denyListURLStrings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[MCWebContentFilterPayload denyListURLStrings](self, "denyListURLStrings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("Denied URLs:\n%@\n"), v15);

    }
  }
  -[MCWebContentFilterPayload contentFilterUUID](self, "contentFilterUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("ContentFilterUUID     : %@\n"), v16);

  return v4;
}

- (id)title
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("WEB_FILTER_TITLE"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)subtitle1Label
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("WEB_FILTER_DESC_1_COLON"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)subtitle1Description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v45;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MCWebContentFilterPayload autoFilterEnabled](self, "autoFilterEnabled"))
  {
    MCLocalizedFormat(CFSTR("WEB_FILTER_DESC_AUTOFILTER"), v4, v5, v6, v7, v8, v9, v10, v45);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[MCWebContentFilterPayload allowListBookmarks](self, "allowListBookmarks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    MCLocalizedFormat(CFSTR("WEB_FILTER_DESC_ALLOW_LIST"), v14, v15, v16, v17, v18, v19, v20, v45);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  -[MCWebContentFilterPayload denyListURLStrings](self, "denyListURLStrings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    MCLocalizedFormat(CFSTR("WEB_FILTER_DESC_DENY_LIST"), v24, v25, v26, v27, v28, v29, v30, v45);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v31);

  }
  -[MCWebContentFilterPayload filterType](self, "filterType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("Plugin"));

  if (v33)
  {
    MCLocalizedString(CFSTR("WEB_FILTER_DESC_PLUGIN"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v34);

  }
  if (objc_msgSend(v3, "count"))
  {
    MCLocalizedFormat(CFSTR("WEB_FILTER_SEPARATOR"), v35, v36, v37, v38, v39, v40, v41, v45);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MCLocalizedFormat(CFSTR("WEB_FILTER_DESC_NONE"), v35, v36, v37, v38, v39, v40, v41, v45);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v43;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  MCKeyValue *v5;
  void *v6;
  void *v7;
  MCKeyValue *v8;
  void *v9;
  MCKeyValue *v10;
  void *v11;
  void *v12;
  MCKeyValue *v13;
  void *v14;
  MCKeyValue *v15;
  void *v16;
  void *v17;
  MCKeyValue *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = [MCKeyValue alloc];
  MCLocalizedStringForBool(-[MCWebContentFilterPayload autoFilterEnabled](self, "autoFilterEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedString(CFSTR("AUTO_FILTER_ENABLED"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MCKeyValue initWithLocalizedString:localizedKey:](v5, "initWithLocalizedString:localizedKey:", v6, v7);
  objc_msgSend(v4, "addObject:", v8);

  -[MCWebContentFilterPayload pluginBundleID](self, "pluginBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [MCKeyValue alloc];
    -[MCWebContentFilterPayload pluginBundleID](self, "pluginBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("PLUGIN_BUNDLE_ID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MCKeyValue initWithLocalizedString:localizedKey:](v10, "initWithLocalizedString:localizedKey:", v11, v12);

    objc_msgSend(v4, "addObject:", v13);
  }
  -[MCWebContentFilterPayload contentFilterUUID](self, "contentFilterUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = [MCKeyValue alloc];
    -[MCWebContentFilterPayload contentFilterUUID](self, "contentFilterUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WEB_FILTER_CONTENTFILTERUUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MCKeyValue initWithLocalizedString:localizedKey:](v15, "initWithLocalizedString:localizedKey:", v16, v17);

    objc_msgSend(v4, "addObject:", v18);
  }
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  -[MCWebContentFilterPayload permittedURLStrings](self, "permittedURLStrings", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    -[MCWebContentFilterPayload permittedURLStrings](self, "permittedURLStrings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("PERMITTED_URLS"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v22, v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v24);
  }
  v44 = v3;
  v25 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[MCWebContentFilterPayload allowListBookmarks](self, "allowListBookmarks");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v46 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("pageTitle"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("address"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v32)
            continue;
        }
        objc_msgSend(v25, "addObject:", v32);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v28);
  }

  v33 = v44;
  if (objc_msgSend(v25, "count"))
  {
    MCLocalizedString(CFSTR("ALLOWED_BOOKMARKS"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v25, v34, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "addObject:", v35);
  }
  -[MCWebContentFilterPayload denyListURLStrings](self, "denyListURLStrings");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");

  if (v37)
  {
    if (-[MCWebContentFilterPayload hideDenyListURLs](self, "hideDenyListURLs"))
      v38 = CFSTR("PROHIBITED_URLS_HIDDEN");
    else
      v38 = CFSTR("PROHIBITED_URLS");
    MCLocalizedString(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MCWebContentFilterPayload hideDenyListURLs](self, "hideDenyListURLs"))
    {
      v40 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      -[MCWebContentFilterPayload denyListURLStrings](self, "denyListURLStrings");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v40, v39, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v41);

  }
  if (!objc_msgSend(v44, "count"))
  {

    v33 = 0;
  }

  return v33;
}

- (id)installationWarnings
{
  void *v2;
  int v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MCWebContentFilterPayload filterType](self, "filterType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("BuiltIn"));

  if (v3)
  {
    MCLocalizedString(CFSTR("INSTALL_WARNING_WEB_CONTENT_FILTER_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("INSTALL_WARNING_WEB_CONTENT_FILTER");
  }
  else
  {
    MCLocalizedString(CFSTR("INSTALL_WARNING_PLUGIN_CONTENT_FILTER_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("INSTALL_WARNING_PLUGIN_CONTENT_FILTER");
  }
  MCLocalizedStringByDevice(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v4, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)filterType
{
  return self->_filterType;
}

- (void)setFilterType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)contentFilterUUID
{
  return self->_contentFilterUUID;
}

- (void)setContentFilterUUID:(id)a3
{
  objc_storeStrong((id *)&self->_contentFilterUUID, a3);
}

- (BOOL)hideDenyListURLs
{
  return self->_hideDenyListURLs;
}

- (void)setHideDenyListURLs:(BOOL)a3
{
  self->_hideDenyListURLs = a3;
}

- (BOOL)autoFilterEnabled
{
  return self->_autoFilterEnabled;
}

- (void)setAutoFilterEnabled:(BOOL)a3
{
  self->_autoFilterEnabled = a3;
}

- (NSArray)permittedURLStrings
{
  return self->_permittedURLStrings;
}

- (void)setPermittedURLStrings:(id)a3
{
  objc_storeStrong((id *)&self->_permittedURLStrings, a3);
}

- (NSArray)allowListBookmarks
{
  return self->_allowListBookmarks;
}

- (void)setAllowListBookmarks:(id)a3
{
  objc_storeStrong((id *)&self->_allowListBookmarks, a3);
}

- (NSArray)denyListURLStrings
{
  return self->_denyListURLStrings;
}

- (void)setDenyListURLStrings:(id)a3
{
  objc_storeStrong((id *)&self->_denyListURLStrings, a3);
}

- (NSDictionary)pluginConfiguration
{
  return self->_pluginConfiguration;
}

- (void)setPluginConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_pluginConfiguration, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)pluginBundleID
{
  return self->_pluginBundleID;
}

- (void)setPluginBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)filterBrowsers
{
  return self->_filterBrowsers;
}

- (void)setFilterBrowsers:(BOOL)a3
{
  self->_filterBrowsers = a3;
}

- (BOOL)filterSockets
{
  return self->_filterSockets;
}

- (void)setFilterSockets:(BOOL)a3
{
  self->_filterSockets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginBundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pluginConfiguration, 0);
  objc_storeStrong((id *)&self->_denyListURLStrings, 0);
  objc_storeStrong((id *)&self->_allowListBookmarks, 0);
  objc_storeStrong((id *)&self->_permittedURLStrings, 0);
  objc_storeStrong((id *)&self->_contentFilterUUID, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

@end
