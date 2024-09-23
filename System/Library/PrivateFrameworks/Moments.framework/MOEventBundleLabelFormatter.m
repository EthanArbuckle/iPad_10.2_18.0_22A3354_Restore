@implementation MOEventBundleLabelFormatter

- (MOEventBundleLabelFormatter)init
{
  MOEventBundleLabelFormatter *v2;
  MOEventBundleLabelFormatter *v3;
  NSString *templatePath;
  NSDictionary *templates;
  NSDictionary *context;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MOEventBundleLabelFormatter;
  v2 = -[MOEventBundleLabelFormatter init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    templatePath = v2->_templatePath;
    v2->_templatePath = 0;

    templates = v3->_templates;
    v3->_templates = 0;

    context = v3->_context;
    v3->_context = 0;

  }
  return v3;
}

- (MOEventBundleLabelFormatter)initWithTemplatePath:(id)a3
{
  id v5;
  MOEventBundleLabelFormatter *v6;
  MOEventBundleLabelFormatter *v7;
  NSDictionary *templates;
  NSDictionary *context;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOEventBundleLabelFormatter;
  v6 = -[MOEventBundleLabelFormatter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templatePath, a3);
    templates = v7->_templates;
    v7->_templates = 0;

    context = v7->_context;
    v7->_context = 0;

  }
  return v7;
}

- (void)loadLabelTemplates
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_1(&dword_1CAE42000, v0, v1, "loadLabelTemplates from dir, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (MOEventBundleLabelFormatter)initWithUniverse:(id)a3
{
  return -[MOEventBundleLabelFormatter initWithTemplatePath:](self, "initWithTemplatePath:", CFSTR("/System/Library/PrivateFrameworks/Moments.framework/LabelTemplates"));
}

- (id)getTemplateDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  +[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("LabelTemplates"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelFormatter getTemplateDirectoryURL].cold.1();

    v5 = 0;
  }

  return v5;
}

- (NSDictionary)templates
{
  NSDictionary *templates;
  NSString *templatePath;
  void *v5;
  NSString *v6;
  NSString *v7;

  templates = self->_templates;
  if (!templates)
  {
    templatePath = self->_templatePath;
    if (!templatePath)
    {
      -[MOEventBundleLabelFormatter getTemplateDirectoryURL](self, "getTemplateDirectoryURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_templatePath;
      self->_templatePath = v6;

      templatePath = self->_templatePath;
    }
    -[MOEventBundleLabelFormatter loadLabelTemplatesFromDirectory:](self, "loadLabelTemplatesFromDirectory:", templatePath);
    templates = self->_templates;
  }
  return templates;
}

- (NSDictionary)context
{
  NSDictionary *context;
  NSString *templatePath;
  void *v5;
  NSString *v6;
  NSString *v7;

  context = self->_context;
  if (!context)
  {
    templatePath = self->_templatePath;
    if (!templatePath)
    {
      -[MOEventBundleLabelFormatter getTemplateDirectoryURL](self, "getTemplateDirectoryURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_templatePath;
      self->_templatePath = v6;

      templatePath = self->_templatePath;
    }
    -[MOEventBundleLabelFormatter loadLabelTemplatesFromDirectory:](self, "loadLabelTemplatesFromDirectory:", templatePath);
    context = self->_context;
  }
  return context;
}

- (void)loadLabelTemplatesFromDirectory:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  MOEventBundleLabelTemplate *v46;
  NSObject *v47;
  MOEventBundleLabelTemplate *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  NSDictionary *templates;
  NSObject *v64;
  NSDictionary *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id obj;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  id v77;
  NSDictionary *v78;
  uint64_t v79;
  uint64_t v81;
  NSDictionary *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  char *v92;
  char *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *context;
  void *v103;
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
  id v120;
  uint8_t v121[128];
  uint8_t buf[4];
  uint64_t v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  uint64_t v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[MOEventBundleLabelFormatter loadLabelTemplatesFromDirectory:].cold.2();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v120 = 0;
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "contentsOfDirectoryAtPath:error:", v3, &v120);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v120;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self ENDSWITH '.json'"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v5;
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v66 = v6;
    v78 = (NSDictionary *)objc_opt_new();
    v82 = (NSDictionary *)objc_opt_new();
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    obj = v8;
    v70 = v3;
    v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
    if (v73)
    {
      v72 = *(_QWORD *)v117;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v117 != v72)
            objc_enumerationMutation(obj);
          v75 = v9;
          v10 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v9);
          v74 = (void *)MEMORY[0x1D1798EEC]();
          objc_msgSend(v3, "stringByAppendingPathComponent:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v123 = v11;
            _os_log_debug_impl(&dword_1CAE42000, v12, OS_LOG_TYPE_DEBUG, "Template file, %@", buf, 0xCu);
          }

          -[MOEventBundleLabelFormatter loadDictionaryFromPath:](self, "loadDictionaryFromPath:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = (void *)v11;
          v76 = v13;
          if (v13 && objc_msgSend(v13, "count"))
          {
            _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v123 = v11;
              v124 = 2112;
              v125 = v76;
              _os_log_debug_impl(&dword_1CAE42000, v14, OS_LOG_TYPE_DEBUG, "Template file, %@, dict, %@", buf, 0x16u);
            }

            objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("cases"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = 0u;
            v113 = 0u;
            v114 = 0u;
            v115 = 0u;
            v77 = v15;
            v81 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v112, v129, 16);
            if (v81)
            {
              v92 = 0;
              v93 = 0;
              v79 = *(_QWORD *)v113;
              do
              {
                v16 = 0;
                do
                {
                  if (*(_QWORD *)v113 != v79)
                    objc_enumerationMutation(v77);
                  v85 = v16;
                  v17 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v16);
                  v84 = (void *)MEMORY[0x1D1798EEC]();
                  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                  v18 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v123 = (uint64_t)v87;
                    v124 = 2112;
                    v125 = v17;
                    _os_log_debug_impl(&dword_1CAE42000, v18, OS_LOG_TYPE_DEBUG, "Template file, %@, subdict, %@", buf, 0x16u);
                  }

                  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("bundleType"));
                  v19 = objc_claimAutoreleasedReturnValue();
                  -[MOEventBundleLabelFormatter keywordForTemplateType:bundleType:](self, "keywordForTemplateType:bundleType:", CFSTR("labels"), v19);
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MOEventBundleLabelFormatter keywordForTemplateType:bundleType:](self, "keywordForTemplateType:bundleType:", CFSTR("prompts"), v19);
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  v90 = (void *)objc_opt_new();
                  v89 = (void *)objc_opt_new();
                  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("context"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v20)
                  {
                    -[NSDictionary objectForKey:](v82, "objectForKey:", v19);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v21)
                    {
                      v22 = (void *)objc_msgSend(v20, "mutableCopy");
                      objc_msgSend(v22, "addEntriesFromDictionary:", v21);

                      v20 = v22;
                    }
                    -[NSDictionary setObject:forKey:](v82, "setObject:forKey:", v20, v19, v66, v67);

                  }
                  v94 = v20;
                  v83 = (void *)v19;
                  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("templates"), v66);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v108 = 0u;
                  v109 = 0u;
                  v110 = 0u;
                  v111 = 0u;
                  v91 = v23;
                  v96 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v108, v128, 16);
                  if (v96)
                  {
                    v95 = *(_QWORD *)v109;
                    do
                    {
                      for (i = 0; i != v96; ++i)
                      {
                        if (*(_QWORD *)v109 != v95)
                          objc_enumerationMutation(v91);
                        v25 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
                        v26 = MEMORY[0x1D1798EEC]();
                        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("conditions"));
                        v27 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("extends"));
                        v28 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("capitalizations"));
                        v29 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("labels"));
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("prompts"));
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        v32 = v31;
                        context = (void *)v26;
                        if (v30)
                        {
                          objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v31);
                          v33 = (id)objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          v33 = v31;
                        }
                        v99 = v33;
                        +[MOEventBundleLabelTemplate conditionsFromLabels:](MOEventBundleLabelTemplate, "conditionsFromLabels:", v33);
                        v34 = objc_claimAutoreleasedReturnValue();
                        +[MOEventBundleLabelTemplate conditionsFromConditionStrings:](MOEventBundleLabelTemplate, "conditionsFromConditionStrings:", v27);
                        v35 = objc_claimAutoreleasedReturnValue();
                        v101 = (void *)v28;
                        +[MOEventBundleLabelTemplate conditionsFromExtendStrings:](MOEventBundleLabelTemplate, "conditionsFromExtendStrings:", v28);
                        v36 = objc_claimAutoreleasedReturnValue();
                        v100 = (void *)v29;
                        +[MOEventBundleLabelTemplate conditionsFromCapitalizations:](MOEventBundleLabelTemplate, "conditionsFromCapitalizations:", v29);
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        v97 = (void *)v35;
                        v98 = (void *)v34;
                        v38 = (void *)v35;
                        v39 = (void *)v36;
                        objc_msgSend(v38, "setByAddingObjectsFromSet:", v34);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v39, "count"))
                        {
                          objc_msgSend(v40, "setByAddingObjectsFromSet:", v39);
                          v41 = objc_claimAutoreleasedReturnValue();

                          v40 = (void *)v41;
                        }
                        v103 = (void *)v27;
                        if (objc_msgSend(v37, "count"))
                        {
                          objc_msgSend(v40, "setByAddingObjectsFromSet:", v37);
                          v42 = objc_claimAutoreleasedReturnValue();

                          v40 = (void *)v42;
                        }
                        +[MOEventBundleLabelTemplate formatsFromLabels:](MOEventBundleLabelTemplate, "formatsFromLabels:", v30);
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        +[MOEventBundleLabelTemplate formatsFromLabels:](MOEventBundleLabelTemplate, "formatsFromLabels:", v32);
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v30 && objc_msgSend(v30, "count"))
                        {
                          _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                          v45 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412802;
                            v123 = (uint64_t)v30;
                            v124 = 2112;
                            v125 = v103;
                            v126 = 2112;
                            v127 = (uint64_t)v40;
                            _os_log_debug_impl(&dword_1CAE42000, v45, OS_LOG_TYPE_DEBUG, "template parsing, labels, %@, conditionStrings, %@, conditions, %@", buf, 0x20u);
                          }

                          v46 = -[MOEventBundleLabelTemplate initWithConditions:formats:context:]([MOEventBundleLabelTemplate alloc], "initWithConditions:formats:context:", v40, v43, v94);
                          objc_msgSend(v90, "addObject:", v46);
                          ++v92;

                        }
                        if (v32 && objc_msgSend(v32, "count"))
                        {
                          _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                          v47 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412802;
                            v123 = (uint64_t)v30;
                            v124 = 2112;
                            v125 = v103;
                            v126 = 2112;
                            v127 = (uint64_t)v40;
                            _os_log_debug_impl(&dword_1CAE42000, v47, OS_LOG_TYPE_DEBUG, "template parsing, prompts, %@, conditionStrings, %@, conditions, %@", buf, 0x20u);
                          }

                          v48 = -[MOEventBundleLabelTemplate initWithConditions:formats:context:]([MOEventBundleLabelTemplate alloc], "initWithConditions:formats:context:", v40, v44, v94);
                          objc_msgSend(v89, "addObject:", v48);
                          ++v93;

                        }
                        objc_autoreleasePoolPop(context);
                      }
                      v96 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v108, v128, 16);
                    }
                    while (v96);
                  }

                  -[NSDictionary objectForKey:](v78, "objectForKey:", v86);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "addObjectsFromArray:", v49);
                  -[NSDictionary setObject:forKey:](v78, "setObject:forKey:", v90, v86);
                  -[NSDictionary objectForKey:](v78, "objectForKey:", v88);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v89, "addObjectsFromArray:", v50);
                  -[NSDictionary setObject:forKey:](v78, "setObject:forKey:", v89, v88);
                  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                  v51 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                  {
                    v60 = objc_msgSend(v90, "count");
                    *(_DWORD *)buf = 138412802;
                    v123 = (uint64_t)v87;
                    v124 = 2112;
                    v125 = v86;
                    v126 = 2048;
                    v127 = v60;
                    _os_log_debug_impl(&dword_1CAE42000, v51, OS_LOG_TYPE_DEBUG, "Template file, %@, key, %@, templates.count, %lu", buf, 0x20u);
                  }

                  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                  {
                    v61 = objc_msgSend(v89, "count");
                    *(_DWORD *)buf = 138412802;
                    v123 = (uint64_t)v87;
                    v124 = 2112;
                    v125 = v88;
                    v126 = 2048;
                    v127 = v61;
                    _os_log_debug_impl(&dword_1CAE42000, v52, OS_LOG_TYPE_DEBUG, "Template file, %@, key, %@, templates.count, %lu", buf, 0x20u);
                  }

                  v106 = 0u;
                  v107 = 0u;
                  v104 = 0u;
                  v105 = 0u;
                  v53 = v89;
                  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v104, v121, 16);
                  if (v54)
                  {
                    v55 = v54;
                    v56 = *(_QWORD *)v105;
                    do
                    {
                      for (j = 0; j != v55; ++j)
                      {
                        if (*(_QWORD *)v105 != v56)
                          objc_enumerationMutation(v53);
                        v58 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j);
                        _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                        v59 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412802;
                          v123 = (uint64_t)v87;
                          v124 = 2112;
                          v125 = v88;
                          v126 = 2112;
                          v127 = v58;
                          _os_log_debug_impl(&dword_1CAE42000, v59, OS_LOG_TYPE_DEBUG, "Template file, %@, key, %@, flattened template, %@", buf, 0x20u);
                        }

                      }
                      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v104, v121, 16);
                    }
                    while (v55);
                  }

                  objc_autoreleasePoolPop(v84);
                  v16 = v85 + 1;
                }
                while (v85 + 1 != v81);
                v81 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v112, v129, 16);
              }
              while (v81);
            }
            else
            {
              v92 = 0;
              v93 = 0;
            }

            v3 = v70;
          }
          else
          {
            v92 = 0;
            v93 = 0;
          }
          _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v123 = (uint64_t)v87;
            v124 = 2048;
            v125 = v92;
            v126 = 2048;
            v127 = (uint64_t)v93;
            _os_log_debug_impl(&dword_1CAE42000, v62, OS_LOG_TYPE_DEBUG, "Template file, %@, label.count, %lu, prompts.count, %lu", buf, 0x20u);
          }

          objc_autoreleasePoolPop(v74);
          v9 = v75 + 1;
        }
        while (v75 + 1 != v73);
        v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
      }
      while (v73);
    }

    templates = self->_templates;
    self->_templates = v78;
    v64 = v78;

    v3 = v70;
    v65 = self->_context;
    self->_context = v82;

    v6 = v66;
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelFormatter loadLabelTemplatesFromDirectory:].cold.1();
  }

}

- (id)loadDictionaryFromPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v12[16];
  id v13;
  id v14;

  v3 = a3;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v3, 0, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (v5)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    v9 = v5;
    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelFormatter loadDictionaryFromPath:].cold.1();
    goto LABEL_13;
  }
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  v10 = objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (!v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelFormatter loadDictionaryFromPath:].cold.2();
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_INFO, "The json file was successfully read.", v12, 2u);
  }
LABEL_14:

  return v8;
}

- (id)getContextForBundleType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MOEventBundleLabelFormatter context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v4 && v5)
  {
    -[MOEventBundleLabelFormatter context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)formattedStringsForMetaData:(id)a3 templates:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  MOEventBundleLabelFormatter *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v8)
  {
    v9 = v8;
    v20 = self;
    v10 = *(_QWORD *)v22;
    v11 = (void *)MEMORY[0x1E0C9AA60];
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1D1798EEC]();
        _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v13;
          _os_log_debug_impl(&dword_1CAE42000, v15, OS_LOG_TYPE_DEBUG, "template, %@", buf, 0xCu);
        }

        if (objc_msgSend(v13, "checkConditionForMetaData:", v6))
        {
          objc_msgSend(v13, "formattedStringsForMetaData:", v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "count"))
          {
            objc_msgSend(v6, "objectForKey:", CFSTR("shuffle_mode"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (int)objc_msgSend(v17, "intValue");

            -[MOEventBundleLabelFormatter shuffleStrings:shuffleMode:](v20, "shuffleStrings:shuffleMode:", v16, v18);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_autoreleasePoolPop(v14);
            goto LABEL_16;
          }

        }
        objc_autoreleasePoolPop(v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_16:

  return v11;
}

- (id)shuffleStrings:(id)a3 shuffleMode:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    if (a4 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v9 = (unint64_t)(v8 / 86400.0);
      v10 = v9 % objc_msgSend(v6, "count");
      _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v16 = 134218754;
        v17 = objc_msgSend(v6, "count");
        v18 = 2048;
        v19 = v9;
        v20 = 2048;
        v21 = v10;
        v22 = 2112;
        v23 = v7;
        _os_log_debug_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEBUG, "Shuffle Labels: count, %lu, seed, %lu, start_index, %lu, nowDate, %@", (uint8_t *)&v16, 0x2Au);
      }

      if (v10)
      {
        v12 = (id)objc_opt_new();
        objc_msgSend(v6, "subarrayWithRange:", v10, objc_msgSend(v6, "count") - v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v13);

        objc_msgSend(v6, "subarrayWithRange:", 0, v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v14);

      }
      else
      {
        v12 = v6;
      }

    }
    else
    {
      v12 = v6;
    }
  }
  else
  {
    v12 = (id)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)formattedBundleLabelsForMetaData:(id)a3 bundleType:(id)a4
{
  return -[MOEventBundleLabelFormatter formattedStringsForMetaData:templateType:bundleType:](self, "formattedStringsForMetaData:templateType:bundleType:", a3, CFSTR("labels"), a4);
}

- (id)formattedBundlePromptsForMetaData:(id)a3 bundleType:(id)a4
{
  return -[MOEventBundleLabelFormatter formattedStringsForMetaData:templateType:bundleType:](self, "formattedStringsForMetaData:templateType:bundleType:", a3, CFSTR("prompts"), a4);
}

- (id)formattedStringsForMetaData:(id)a3 templateType:(id)a4 bundleType:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MOEventBundleLabelFormatter keywordForTemplateType:bundleType:](self, "keywordForTemplateType:bundleType:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[MOEventBundleLabelFormatter formattedStringsForMetaData:templateType:bundleType:].cold.1();

  -[MOEventBundleLabelFormatter templates](self, "templates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && objc_msgSend(v13, "count"))
  {
    -[MOEventBundleLabelFormatter formattedStringsForMetaData:templates:](self, "formattedStringsForMetaData:templates:", v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("prompts")))
      v15 = CFSTR("default_prompt");
    else
      v15 = CFSTR("default_label");
    objc_msgSend(v8, "objectForKey:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
    {
      v29[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "allKeys");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOEventBundleLabelFormatter templates](self, "templates");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "allKeys");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412802;
        v24 = v10;
        v25 = 2112;
        v26 = v20;
        v27 = 2112;
        v28 = v22;
        _os_log_error_impl(&dword_1CAE42000, v18, OS_LOG_TYPE_ERROR, "The label template is not found for the keyword, %@, meta, %@, all keywords, %@", (uint8_t *)&v23, 0x20u);

      }
      v14 = 0;
    }

  }
  return v14;
}

- (id)keywordForTemplateType:(id)a3 bundleType:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)logDiagnoticsInformation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint8_t v11[14];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredLocalizations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  v12 = v5;
  v13 = v9;
  v14 = v10;
  _os_log_debug_impl(&dword_1CAE42000, a1, OS_LOG_TYPE_DEBUG, "preferredLanguage, %@, locale, %@, mainBundlePreferredLocalization, %@", v11, 0x20u);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_templates, 0);
  objc_storeStrong((id *)&self->_templatePath, 0);
}

- (void)getTemplateDirectoryURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "failed to get cache directory to store collection date plist file, nil cache directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)loadLabelTemplatesFromDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "The template directory is empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)loadLabelTemplatesFromDirectory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_5_4(&dword_1CAE42000, v0, v1, "load templates from %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)loadDictionaryFromPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_1(&dword_1CAE42000, v0, v1, "Could not read to the JSON file, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)loadDictionaryFromPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = v0;
  _os_log_error_impl(&dword_1CAE42000, v1, OS_LOG_TYPE_ERROR, "Couldn't parse JSON to dictionary. %@, error, %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)formattedStringsForMetaData:templateType:bundleType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_5_4(&dword_1CAE42000, v0, v1, "keyword, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
