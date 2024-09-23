@implementation INSchema

- (id)_initWithContentsOfURLs:(id)a3 bundleIdentifier:(id)a4 mainBundleIdentifier:(id)a5 contentOptions:(unint64_t)a6
{
  id v9;
  id v10;
  INSchema *v11;
  uint64_t v12;
  NSArray *definitionFileURLs;
  uint64_t v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  INCodableEnum *v35;
  INCodableLocalizationTable *v36;
  void *v37;
  INCodableLocalizationTable *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSDictionary *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  NSDictionary *typeForClassDictionary;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  INSchema *v67;
  id obj;
  void *v69;
  NSMutableDictionary *enums;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *context;
  void *v77;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint8_t v95[128];
  uint8_t buf[4];
  const char *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  id v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v64 = a5;
  v11 = -[INSchema init](self, "init");
  if (v11)
  {
    v11->_system = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Intents"));
    objc_storeStrong((id *)&v11->_mainBundleIdentifier, a5);
    v12 = objc_msgSend(v9, "copy");
    definitionFileURLs = v11->_definitionFileURLs;
    v11->_definitionFileURLs = (NSArray *)v12;

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v63 = v9;
    obj = v9;
    v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
    if (v74)
    {
      v14 = *(_QWORD *)v87;
      v15 = 0x1E0C99000uLL;
      v66 = v10;
      v67 = v11;
      v65 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v74; ++i)
        {
          if (*(_QWORD *)v87 != v14)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x18D7810F0]();
          v19 = (void *)MEMORY[0x18D7810F0]();
          v20 = *(void **)(v15 + 3456);
          v85 = 0;
          objc_msgSend(v20, "dictionaryWithContentsOfURL:error:", v17, &v85);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v85;
          if (v21)
          {
            context = v19;
            v77 = v18;
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("INIntentDefinitionNamespace"));
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = a6;
            if ((a6 & 2) != 0)
            {
              v72 = v17;
              v73 = i;
              enums = v11->_enums;
              objc_msgSend(v17, "lastPathComponent");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = v21;
              v24 = v21;
              v25 = v10;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INEnum%@"), CFSTR("s"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKeyedSubscript:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v69 = v24;
              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("INIntentDefinitionNamespace"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = 0u;
              v91 = 0u;
              v92 = 0u;
              v93 = 0u;
              v80 = v27;
              v30 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v90, buf, 16);
              if (v30)
              {
                v31 = v30;
                v32 = *(_QWORD *)v91;
                do
                {
                  for (j = 0; j != v31; ++j)
                  {
                    if (*(_QWORD *)v91 != v32)
                      objc_enumerationMutation(v80);
                    v34 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * j);
                    v35 = objc_alloc_init(INCodableEnum);
                    -[INCodableEnum updateWithDictionary:](v35, "updateWithDictionary:", v34);
                    v36 = [INCodableLocalizationTable alloc];
                    objc_msgSend(v23, "stringByDeletingPathExtension");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v38 = -[INCodableLocalizationTable initWithBundleIdentifier:tableName:](v36, "initWithBundleIdentifier:tableName:", v25, v37);
                    -[INCodableEnum _setLocalizationTable:](v35, "_setLocalizationTable:", v38);

                    -[INCodableEnum _setEnumNamespace:](v35, "_setEnumNamespace:", v28);
                    -[INCodableEnum name](v35, "name");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    INIntentDefinitionNamespacedName((uint64_t)v28, v39);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setObject:forKey:", v35, v40);

                  }
                  v31 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v90, buf, 16);
                }
                while (v31);
              }

              v41 = (void *)objc_msgSend(v29, "copy");
              -[NSMutableDictionary addEntriesFromDictionary:](enums, "addEntriesFromDictionary:", v41);

              v10 = v66;
              v11 = v67;
              v22 = a6;
              v14 = v65;
              v17 = v72;
              i = v73;
              v21 = v71;
            }
            v42 = i;
            if ((v22 & 4) != 0)
            {
              objc_msgSend(v17, "lastPathComponent");
              v44 = v17;
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[INSchema _typesWithDictionary:filename:bundleIdentifier:](v11, "_typesWithDictionary:filename:bundleIdentifier:", v21, v46, v10);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSMutableDictionary addEntriesFromDictionary:](v11->_types, "addEntriesFromDictionary:", v43);
            }
            else
            {
              v43 = 0;
              v44 = v17;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("s"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            objc_autoreleasePoolPop(context);
            v49 = (void *)MEMORY[0x18D7810F0]();
            objc_msgSend(v44, "lastPathComponent");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[INSchema _loadIntentsFromArrayOfDictionaries:intentDefinitionNamespace:fromFile:bundleIdentifier:referencedCodableDescriptions:contentOptions:](v11, "_loadIntentsFromArrayOfDictionaries:intentDefinitionNamespace:fromFile:bundleIdentifier:referencedCodableDescriptions:contentOptions:", v48, v75, v50, v10, v43, a6);

            objc_autoreleasePoolPop(v49);
            i = v42;
            v18 = v77;
            v15 = 0x1E0C99000;
          }
          else
          {
            v45 = (void *)INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
            {
              v51 = v45;
              objc_msgSend(v17, "path");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v97 = "-[INSchema _initWithContentsOfURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:]";
              v98 = 2114;
              v99 = v52;
              v100 = 2114;
              v101 = v79;
              _os_log_error_impl(&dword_18BEBC000, v51, OS_LOG_TYPE_ERROR, "%s Invalid intent definition plist found at %{public}@, error: %{public}@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v19);
          }
          objc_autoreleasePoolPop(v18);
        }
        v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
      }
      while (v74);
    }

    v53 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](v11->_types, "count"));
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    -[NSMutableDictionary allValues](v11->_types, "allValues");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v82;
      do
      {
        for (k = 0; k != v56; ++k)
        {
          if (*(_QWORD *)v82 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * k);
          objc_msgSend(v59, "className");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v53, "setObject:forKey:", v59, v60);

        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
      }
      while (v56);
    }

    typeForClassDictionary = v11->_typeForClassDictionary;
    v11->_typeForClassDictionary = v53;

    v9 = v63;
  }

  return v11;
}

- (id)_codableDescriptionWithDictionary:(id)a3 intentDefinitionNamespace:(id)a4 filename:(id)a5 bundleIdentifier:(id)a6 codableDescriptionClass:(Class)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  INCodableLocalizationTable *v17;
  void *v18;
  INCodableLocalizationTable *v19;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(a7);
  objc_msgSend(v16, "setSchema:", self);
  objc_msgSend(v16, "updateWithDictionary:", v15);

  objc_msgSend(v16, "setIntentDefinitionNamespace:", v14);
  v17 = [INCodableLocalizationTable alloc];
  objc_msgSend(v13, "stringByDeletingPathExtension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[INCodableLocalizationTable initWithBundleIdentifier:tableName:](v17, "initWithBundleIdentifier:tableName:", v12, v18);
  objc_msgSend(v16, "_setLocalizationTable:", v19);

  return v16;
}

- (void)_loadIntentsFromArrayOfDictionaries:(id)a3 intentDefinitionNamespace:(id)a4 fromFile:(id)a5 bundleIdentifier:(id)a6 referencedCodableDescriptions:(id)a7 contentOptions:(unint64_t)a8
{
  id v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  id v43;
  id v44;
  id obj;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v52 = a8;
  v58 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v44 = a4;
  v50 = a5;
  v49 = a6;
  v43 = a7;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v13;
  v48 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v48)
  {
    v14 = 0x1E0CB3000uLL;
    v47 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v54 != v47)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("UnsupportedPlatforms"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v52 & 8) != 0)
        {
          objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("ParameterCombinations"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v20);
          v21 = v18;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          _INParameterCombinationsWithDictionary(v22, v50, v49);
          v23 = objc_claimAutoreleasedReturnValue();

          v18 = v21;
          v19 = (void *)v23;

        }
        else
        {
          v19 = 0;
        }
        if ((v52 & 0x10) != 0)
        {
          objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("ManagedParameterCombinations"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          _INParameterCombinationsWithDictionary(v25, v50, v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v51 = 0;
        }
        if ((v52 & 1) != 0)
        {
          v46 = v18;
          v26 = v14;
          -[INSchema _intentWithDictionary:intentDefinitionNamespace:filename:bundleIdentifier:](self, "_intentWithDictionary:intentDefinitionNamespace:filename:bundleIdentifier:", v16, v44, v50, v49);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "className");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringByAppendingString:", CFSTR("Response"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          -[INSchema _intentResponseWithDictionary:intentDefinitionNamespace:className:filename:bundleIdentifier:referencedCodableDescriptions:](self, "_intentResponseWithDictionary:intentDefinitionNamespace:className:filename:bundleIdentifier:referencedCodableDescriptions:", v16, v44, v29, v50, v49, v43);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "_establishReferencedCodableDescriptionsUsingTypes:intentResponseCodableDescription:", v43, v30);
          v31 = objc_opt_class();
          objc_msgSend(v27, "className");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[INSchema _setObjectDescription:forClass:identifier:](self, "_setObjectDescription:forClass:identifier:", v27, v31, v32);

          v14 = v26;
          v18 = v46;
          -[INSchema _setObjectDescription:forClass:identifier:](self, "_setObjectDescription:forClass:identifier:", v30, objc_opt_class(), v29);

        }
        objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("Name"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("ClassName"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v36, "length"))
        {
          v37 = *(void **)(v14 + 2368);
          objc_msgSend(v37, "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("ClassPrefix"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v38);
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = (void *)v39;
          v41 = &stru_1E2295770;
          if (v39)
            v41 = (const __CFString *)v39;
          objc_msgSend(v37, "stringWithFormat:", CFSTR("%@%@Intent"), v41, v34);
          v42 = objc_claimAutoreleasedReturnValue();

          v36 = (void *)v42;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parameterCombinationDictionary, "setObject:forKeyedSubscript:", v19, v36);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_configurableParameterCombinationDictionary, "setObject:forKeyedSubscript:", v51, v36);

      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v48);
  }

}

- (void)_setObjectDescription:(id)a3 forClass:(Class)a4 identifier:(id)a5
{
  NSMutableDictionary *schemaDictionary;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;

  schemaDictionary = self->_schemaDictionary;
  v9 = a5;
  v10 = a3;
  NSStringFromClass(a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](schemaDictionary, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v16 = v12;
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = self->_schemaDictionary;
    NSStringFromClass(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v16, v15);

  }
  objc_msgSend(v16, "setObject:forKey:", v10, v9);

}

- (id)_intentResponseWithDictionary:(id)a3 intentDefinitionNamespace:(id)a4 className:(id)a5 filename:(id)a6 bundleIdentifier:(id)a7 referencedCodableDescriptions:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v14, "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("Response"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[INSchema _codableDescriptionWithDictionary:intentDefinitionNamespace:filename:bundleIdentifier:codableDescriptionClass:](self, "_codableDescriptionWithDictionary:intentDefinitionNamespace:filename:bundleIdentifier:codableDescriptionClass:", v22, v19, v17, v16, objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "_establishReferencedCodableDescriptionsUsingTypes:", v15);
  objc_msgSend(v23, "setClassName:", v18);

  return v23;
}

- (id)_intentWithDictionary:(id)a3 intentDefinitionNamespace:(id)a4 filename:(id)a5 bundleIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[INSchema _codableDescriptionWithDictionary:intentDefinitionNamespace:filename:bundleIdentifier:codableDescriptionClass:](self, "_codableDescriptionWithDictionary:intentDefinitionNamespace:filename:bundleIdentifier:codableDescriptionClass:", v13, v12, v11, v10, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_typesWithDictionary:(id)a3 filename:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id v31;
  void *v32;
  id *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id WeakRetained;
  void *v39;
  id v40;
  void *v42;
  id v43;
  id obj;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v47 = a4;
  v46 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INType%@"), CFSTR("s"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("INIntentDefinitionNamespace"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v60 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        -[INSchema _codableDescriptionWithDictionary:intentDefinitionNamespace:filename:bundleIdentifier:codableDescriptionClass:](self, "_codableDescriptionWithDictionary:intentDefinitionNamespace:filename:bundleIdentifier:codableDescriptionClass:", v16, v50, v47, v46, objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[INSchema _mainBundleIdentifier](self, "_mainBundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setMainBundleIdentifier:", v18);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INType%@"), CFSTR("SemanticRoot"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          objc_msgSend(v17, "setSemanticRoot:", v20);
        objc_msgSend(v17, "typeName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        INIntentDefinitionNamespacedName((uint64_t)v50, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v22);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    }
    while (v13);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v11, "allValues");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v48)
  {
    v45 = *(_QWORD *)v56;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v56 != v45)
          objc_enumerationMutation(v43);
        v49 = v23;
        v24 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v23);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(v24, "attributes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "allValues");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v52 != v29)
                objc_enumerationMutation(v26);
              v31 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * j);
              if (v31)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v32 = v31;
                else
                  v32 = 0;
              }
              else
              {
                v32 = 0;
              }
              v33 = v32;

              objc_msgSend(v33, "objectTypeNamespace");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "objectTypeName");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              INIntentDefinitionNamespacedName((uint64_t)v34, v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKeyedSubscript:", v36);
              v37 = (id)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                WeakRetained = objc_loadWeakRetained(v33 + 21);
                if (!WeakRetained
                  || (v39 = WeakRetained,
                      v40 = objc_loadWeakRetained(v33 + 21),
                      v40,
                      v39,
                      v40 != v37))
                {
                  objc_msgSend(v33, "setCodableDescription:", v37);
                }
              }

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
          }
          while (v28);
        }

        v23 = v49 + 1;
      }
      while (v49 + 1 != v48);
      v48 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v48);
  }

  return v11;
}

- (NSString)_mainBundleIdentifier
{
  return self->_mainBundleIdentifier;
}

- (INSchema)init
{
  INSchema *v2;
  uint64_t v3;
  NSMutableDictionary *schemaDictionary;
  uint64_t v5;
  NSMutableDictionary *parameterCombinationDictionary;
  uint64_t v7;
  NSMutableDictionary *configurableParameterCombinationDictionary;
  NSMutableDictionary *v9;
  NSMutableDictionary *types;
  NSMutableDictionary *v11;
  NSMutableDictionary *enums;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)INSchema;
  v2 = -[INSchema init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    schemaDictionary = v2->_schemaDictionary;
    v2->_schemaDictionary = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    parameterCombinationDictionary = v2->_parameterCombinationDictionary;
    v2->_parameterCombinationDictionary = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    configurableParameterCombinationDictionary = v2->_configurableParameterCombinationDictionary;
    v2->_configurableParameterCombinationDictionary = (NSMutableDictionary *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    types = v2->_types;
    v2->_types = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    enums = v2->_enums;
    v2->_enums = v11;

  }
  return v2;
}

- (BOOL)isSystem
{
  return self->_system;
}

- (NSMutableDictionary)_types
{
  return self->_types;
}

- (NSMutableDictionary)_enums
{
  return self->_enums;
}

void __37__INSchema__supportedTypesDictionary__block_invoke()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = &unk_1E23FAED8;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(&unk_1E23FAED8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(&unk_1E23FAED8);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Name"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(v0, "if_setObjectIfNonNil:forKey:", v6, v7);

      }
      v3 = objc_msgSend(&unk_1E23FAED8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }
  v8 = objc_msgSend(v0, "copy");
  v9 = (void *)_supportedTypesDictionary_supportedTypesDictionary;
  _supportedTypesDictionary_supportedTypesDictionary = v8;

}

- (id)_configurableParameterCombinationsForClassName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_configurableParameterCombinationDictionary, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)defaultSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__INSchema_defaultSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSchema_onceToken != -1)
    dispatch_once(&defaultSchema_onceToken, block);
  return (id)defaultSchema_schema;
}

- (id)intentWithName:(id)a3
{
  NSString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (NSString *)a3;
  v5 = objc_alloc(NSClassFromString(v4));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "_initWithIdentifier:schema:name:data:", v7, self, v4, 0);

  return v8;
}

+ (BOOL)_defaultSchemaCanSupportIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  INContainingAppProxyForCurrentProcess();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "siriActionDefinitionURLs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (id)_loadSystemSchema
{
  void *v2;
  INSchema *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [INSchema alloc];
  INSchemaURLsWithBundle(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[INSchema _initWithContentsOfURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:](v3, "_initWithContentsOfURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:", v4, v5, 0, 31);

  return v6;
}

void __25__INSchema_defaultSchema__block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  INContainingBundleURLForCurrentProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)a1[4];
  v11 = (id)v3;
  if (v3
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        a1 = (_QWORD *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "path"),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "isReadableFileAtPath:", v1)))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v6 = 1;
  }
  objc_msgSend(v4, "_defaultSchemaForBundle:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)defaultSchema_schema;
  defaultSchema_schema = v8;

  if (v6)
  if (v7)

  v10 = v11;
  if (v11)
  {

    v10 = v11;
  }

}

- (id)_parameterCombinationsForClassName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_parameterCombinationDictionary, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)intentCodableDescriptionWithIntentClassName:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v4 = (NSString *)a3;
  -[INSchema _objectDescriptionForClass:identifier:](self, "_objectDescriptionForClass:identifier:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (-[INSchema isSystem](self, "isSystem")
    || (v8 = NSClassFromString(v4),
        INIntentSchemaGetIntentDescriptionWithFacadeClass(v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    v13 = v7;
  }
  else
  {
    +[INSchema systemSchema](INSchema, "systemSchema");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_objectDescriptionForClass:identifier:", objc_opt_class(), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v14 = v12;

    v13 = (id)objc_msgSend(v14, "copy");
    objc_msgSend(v13, "_updateWithIntentCodableDescription:", v7);
  }

  return v13;
}

- (id)_objectDescriptionForClass:(Class)a3 identifier:(id)a4
{
  void *v6;
  void *v7;
  NSMutableDictionary *schemaDictionary;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a4, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    schemaDictionary = self->_schemaDictionary;
    NSStringFromClass(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](schemaDictionary, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_defaultSchemaForBundle:(id)a3 contentOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.Intents"));

  if (v8)
  {
    objc_msgSend(a1, "systemSchema");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSchema _applicationBundleIdentifierFromBundleIdentifier:](INSchema, "_applicationBundleIdentifierFromBundleIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    INSchemaURLsWithBundle(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_schemaWithIntentDefinitionURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:", v13, v14, v12, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)systemSchema
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  dispatch_source_t v14;
  void *v15;
  dispatch_time_t v16;

  if ((systemSchema_isImmortal & 1) != 0)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isMainThread"))
  {

LABEL_5:
    os_unfair_lock_lock(&systemSchemaAccessorLock);
    systemSchema_isImmortal = 1;
    if (!systemSchema)
    {
      objc_msgSend(a1, "_loadSystemSchema");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)systemSchema;
      systemSchema = v6;

    }
    os_unfair_lock_unlock(&systemSchemaAccessorLock);
    v8 = (id)systemSchema;
    return v8;
  }
  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isApplication");

  if (v5)
    goto LABEL_5;
  os_unfair_lock_lock(&systemSchemaAccessorLock);
  v10 = (void *)systemSchema;
  if (!systemSchema)
  {
    objc_msgSend(a1, "_loadSystemSchema");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)systemSchema;
    systemSchema = v11;

    v10 = (void *)systemSchema;
  }
  v8 = v10;
  if (systemSchema_timerSource)
    dispatch_source_cancel((dispatch_source_t)systemSchema_timerSource);
  dispatch_get_global_queue(-2, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v13);
  v15 = (void *)systemSchema_timerSource;
  systemSchema_timerSource = (uint64_t)v14;

  dispatch_source_set_event_handler((dispatch_source_t)systemSchema_timerSource, &__block_literal_global_30);
  v16 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer((dispatch_source_t)systemSchema_timerSource, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume((dispatch_object_t)systemSchema_timerSource);
  os_unfair_lock_unlock(&systemSchemaAccessorLock);
  return v8;
}

+ (id)_defaultSchemaForBundle:(id)a3
{
  return (id)objc_msgSend(a1, "_defaultSchemaForBundle:contentOptions:", a3, 31);
}

+ (id)_applicationBundleIdentifierFromBundleIdentifier:(id)a3
{
  return INApplicationBundleIdentifierFromBundleIdentifier(a3);
}

+ (id)_schemaWithIntentDefinitionURLs:(id)a3 bundleIdentifier:(id)a4 mainBundleIdentifier:(id)a5 contentOptions:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  BOOL v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  id v39;
  void *v40;
  unint64_t v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _QWORD v56[2];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v48 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "_cache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKeyPath:", CFSTR("path"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compare_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR("-"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@-%@"), v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v14, &unk_1E23E99E8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v9, "count");
  v20 = 0;
  if (v17 && v19)
  {
    v46 = v11;
    v47 = v18;
    v42 = a6;
    v43 = v14;
    v44 = v10;
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v19);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v45 = v9;
    v21 = v9;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v52 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "path");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0;
          objc_msgSend(v27, "attributesOfItemAtPath:error:", v28, &v50);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v50;

          if (v29)
            v31 = v30 == 0;
          else
            v31 = 0;
          if (v31)
          {
            objc_msgSend(v29, "fileModificationDate");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
              objc_msgSend(v49, "addObject:", v35);

          }
          else
          {
            v32 = (void *)INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
            {
              v33 = v32;
              objc_msgSend(v26, "path");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v58 = "+[INSchema _schemaWithIntentDefinitionURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:]";
              v59 = 2112;
              v60 = v34;
              v61 = 2114;
              v62 = v30;
              _os_log_error_impl(&dword_18BEBC000, v33, OS_LOG_TYPE_ERROR, "%s Error reading file (%@) attributes: %{public}@", buf, 0x20u);

            }
          }

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      }
      while (v23);
    }

    v11 = v46;
    objc_msgSend(v46, "objectForKey:", v47);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v47, "isEqualToString:", v17) & 1) == 0)
    {
      if (v36)
      {
        objc_msgSend(v46, "removeObjectForKey:", v17);
      }
      else
      {
        objc_msgSend(v46, "objectForKey:", v17);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v10 = v44;
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("schema"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20
      && (objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("schemaModificationsDates")),
          v37 = (void *)objc_claimAutoreleasedReturnValue(),
          v38 = objc_msgSend(v37, "isEqualToSet:", v49),
          v37,
          (v38 & 1) != 0))
    {
      v9 = v45;
      v14 = v43;
    }
    else
    {
      v39 = -[INSchema _initWithContentsOfURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:]([INSchema alloc], "_initWithContentsOfURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:", v21, v48, v44, v42);

      if (v39)
      {
        v55[0] = CFSTR("schemaModificationsDates");
        v55[1] = CFSTR("schema");
        v56[0] = v49;
        v56[1] = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setObject:forKey:", v40, v17);

        v20 = v39;
      }
      else
      {
        v20 = 0;
      }
      v9 = v45;
      v14 = v43;
    }

    v18 = v47;
  }

  return v20;
}

+ (id)_cache
{
  if (_cache_onceToken != -1)
    dispatch_once(&_cache_onceToken, &__block_literal_global_63);
  return (id)_cache_schemaCache;
}

uint64_t __18__INSchema__cache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_cache_schemaCache;
  _cache_schemaCache = (uint64_t)v0;

  return objc_msgSend((id)_cache_schemaCache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
}

+ (id)_supportedTypesDictionary
{
  if (_supportedTypesDictionary_onceToken != -1)
    dispatch_once(&_supportedTypesDictionary_onceToken, &__block_literal_global_86);
  return (id)_supportedTypesDictionary_supportedTypesDictionary;
}

- (id)intentResponseCodableDescriptionWithIntentClassName:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringByAppendingString:", CFSTR("Response"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSchema intentResponseCodableDescriptionWithIntentResponseClassName:](self, "intentResponseCodableDescriptionWithIntentResponseClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)intentResponseCodableDescriptionWithIntentResponseClassName:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (NSString *)a3;
  -[INSchema _objectDescriptionForClass:identifier:](self, "_objectDescriptionForClass:identifier:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (-[INSchema isSystem](self, "isSystem")
    || (v8 = NSClassFromString(v4),
        INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    v13 = v7;
  }
  else
  {
    +[INSchema systemSchema](INSchema, "systemSchema");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_objectDescriptionForClass:identifier:", objc_opt_class(), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

  }
  return v13;
}

- (id)_initWithContentsOfURLs:(id)a3 bundleIdentifier:(id)a4
{
  return -[INSchema _initWithContentsOfURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:](self, "_initWithContentsOfURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:", a3, a4, 0, 31);
}

- (id)_initWithContentsOfURLs:(id)a3 bundleIdentifier:(id)a4 mainBundleIdentifier:(id)a5
{
  return -[INSchema _initWithContentsOfURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:](self, "_initWithContentsOfURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:", a3, a4, a5, 31);
}

- (id)_initWithContentsOfURLs:(id)a3
{
  return -[INSchema _initWithContentsOfURLs:bundleIdentifier:](self, "_initWithContentsOfURLs:bundleIdentifier:", a3, 0);
}

- (id)_parameterCombinationsForClass:(Class)a3
{
  void *v4;
  void *v5;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSchema _parameterCombinationsForClassName:](self, "_parameterCombinationsForClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_classNamesForClass:(Class)a3
{
  NSMutableDictionary *schemaDictionary;
  void *v4;
  void *v5;
  void *v6;

  schemaDictionary = self->_schemaDictionary;
  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](schemaDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_codableDescriptionsForClass:(Class)a3
{
  NSMutableDictionary *schemaDictionary;
  void *v4;
  void *v5;
  void *v6;

  schemaDictionary = self->_schemaDictionary;
  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](schemaDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_objectDescriptionForTypeOfClass:(Class)a3
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (a3)
  {
    -[INSchema _typeForClassDictionary](self, "_typeForClassDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v3 = (objc_class *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)dictionaryRepresentationForIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[INSchema dictionaryRepresentationForIntent:localizer:](self, "dictionaryRepresentationForIntent:localizer:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentationForIntent:(id)a3 localizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_className");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSchema intentCodableDescriptionWithIntentClassName:](self, "intentCodableDescriptionWithIntentClassName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSchema intentResponseCodableDescriptionWithIntentClassName:](self, "intentResponseCodableDescriptionWithIntentClassName:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = 0;
  if (v9 && v10)
  {
    +[INAppInfo appInfoWithIntent:](INAppInfo, "appInfoWithIntent:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__11003;
    v35 = __Block_byref_object_dispose__11004;
    v36 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __56__INSchema_dictionaryRepresentationForIntent_localizer___block_invoke;
    v25[3] = &unk_1E228A9F0;
    v30 = &v31;
    v25[4] = self;
    v14 = v9;
    v26 = v14;
    v27 = v11;
    v23 = v13;
    v28 = v23;
    v29 = v7;
    v15 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v25);
    objc_msgSend(v14, "_localizationTable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      +[INImageServiceConnection sharedConnection](INImageServiceConnection, "sharedConnection", v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v18, "accessBundleContentForBundleIdentifiers:withBlock:error:", v19, v15, &v24);
      v20 = v24;

      if (!v20)
      {
LABEL_10:
        v12 = (id)v32[5];

        _Block_object_dispose(&v31, 8);
        goto LABEL_11;
      }
    }
    else
    {
      v20 = 0;
    }
    v21 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v38 = "-[INSchema dictionaryRepresentationForIntent:localizer:]";
      v39 = 2112;
      v40 = v17;
      v41 = 2112;
      v42 = v20;
      _os_log_error_impl(&dword_18BEBC000, v21, OS_LOG_TYPE_ERROR, "%s Error accessing bundle (%@) content: %@", buf, 0x20u);
    }
    v15[2](v15);
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

- (id)_dictionaryRepresentationForIntentCodableDescription:(id)a3 intentResponseCodableDescription:(id)a4 appInfo:(id)a5 localizer:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void (**v29)(_QWORD);
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  id v94;
  void *v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v76 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "className");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = (void *)v13;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v75 = v10;
  objc_msgSend(v10, "dictionaryRepresentationWithLocalizer:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (v11)
  {
    objc_msgSend(v11, "actionsRestrictedWhileProtectedDataUnavailable");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsObject:", v15);

    if ((v20 & 1) != 0)
    {
      v21 = 2;
    }
    else
    {
      objc_msgSend(v11, "actionsRestrictedWhileLocked");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "containsObject:", v15);

      v21 = v23;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("Restrictions"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "if_setObjectIfNonNil:forKey:", v24, v25);

  }
  v74 = v11;
  objc_msgSend(v76, "dictionaryRepresentationWithLocalizer:", v12);
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("Response"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)v26;
  objc_msgSend(v18, "setObject:forKey:", v26, v27);

  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = __116__INSchema__dictionaryRepresentationForIntentCodableDescription_intentResponseCodableDescription_appInfo_localizer___block_invoke;
  v93[3] = &unk_1E228AA18;
  v28 = v12;
  v94 = v28;
  v29 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v93);
  -[INSchema _parameterCombinationsForClassName:](self, "_parameterCombinationsForClassName:", v15);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2](v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("ParameterCombinations"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v30, v31);

  v73 = v15;
  -[INSchema _configurableParameterCombinationsForClassName:](self, "_configurableParameterCombinationsForClassName:", v15);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2](v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("ManagedParameterCombinations"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v32, v33);

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  objc_msgSend(v75, "referencedCodableDescriptions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v90 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "dictionaryRepresentationWithLocalizer:", v28);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v39);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
    }
    while (v36);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend(v75, "referencedCodableEnums");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v86;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v86 != v43)
          objc_enumerationMutation(v40);
        objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * j), "dictionaryRepresentationWithLocalizer:", v28);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v45);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
    }
    while (v42);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend(v76, "referencedCodableDescriptions");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v82;
    do
    {
      for (k = 0; k != v48; ++k)
      {
        if (*(_QWORD *)v82 != v49)
          objc_enumerationMutation(v46);
        objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * k), "dictionaryRepresentationWithLocalizer:", v28);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v51);

      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
    }
    while (v48);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v76, "referencedCodableEnums");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v78;
    do
    {
      for (m = 0; m != v54; ++m)
      {
        if (*(_QWORD *)v78 != v55)
          objc_enumerationMutation(v52);
        objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * m), "dictionaryRepresentationWithLocalizer:", v28);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v57);

      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
    }
    while (v54);
  }

  v58 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v75, "intentDefinitionNamespace");
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v59;
  if (v59)
    v61 = (const __CFString *)v59;
  else
    v61 = &stru_1E2295770;
  objc_msgSend(v58, "setObject:forKeyedSubscript:", v61, CFSTR("INIntentDefinitionNamespace"));

  objc_msgSend(v14, "allObjects");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INEnum%@"), CFSTR("s"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setObject:forKeyedSubscript:", v62, v63);

  objc_msgSend(v16, "allObjects");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INType%@"), CFSTR("s"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setObject:forKeyedSubscript:", v64, v65);

  v95 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INIntent%@"), CFSTR("s"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setObject:forKeyedSubscript:", v66, v67);

  objc_msgSend(v74, "developmentRegion");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setObject:forKeyedSubscript:", v68, *MEMORY[0x1E0C9AE68]);

  return v58;
}

- (id)_objectDescriptionWithSemanticKeypath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSDictionary *typeForSemanticKeypathDictionary;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (!self->_typeForSemanticKeypathDictionary)
    {
      v5 = (void *)MEMORY[0x1E0C99E08];
      -[INSchema _types](self, "_types");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[INSchema _types](self, "_types", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v14, "semanticRoot");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", v14, v15);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v11);
      }

      typeForSemanticKeypathDictionary = self->_typeForSemanticKeypathDictionary;
      self->_typeForSemanticKeypathDictionary = v7;

    }
    -[INSchema _typeForSemanticKeypathDictionary](self, "_typeForSemanticKeypathDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *schemaDictionary;
  id v5;

  schemaDictionary = self->_schemaDictionary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", schemaDictionary, CFSTR("schemaDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mainBundleIdentifier, CFSTR("_mainBundleIdentifier"));

}

- (INSchema)initWithCoder:(id)a3
{
  id v4;
  INSchema *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *schemaDictionary;
  uint64_t v17;
  NSString *mainBundleIdentifier;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)INSchema;
  v5 = -[INSchema init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("schemaDictionary"));
    v15 = objc_claimAutoreleasedReturnValue();
    schemaDictionary = v5->_schemaDictionary;
    v5->_schemaDictionary = (NSMutableDictionary *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mainBundleIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    mainBundleIdentifier = v5->_mainBundleIdentifier;
    v5->_mainBundleIdentifier = (NSString *)v17;

  }
  return v5;
}

- (id)description
{
  return -[INSchema descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INSchema;
  -[INSchema description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSchema _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  return self->_schemaDictionary;
}

- (NSMutableDictionary)_schemaDictionary
{
  return self->_schemaDictionary;
}

- (NSMutableDictionary)_parameterCombinationDictionary
{
  return self->_parameterCombinationDictionary;
}

- (NSMutableDictionary)_configurableParameterCombinationDictionary
{
  return self->_configurableParameterCombinationDictionary;
}

- (NSDictionary)_typeForClassDictionary
{
  return self->_typeForClassDictionary;
}

- (NSDictionary)_typeForSemanticKeypathDictionary
{
  return self->_typeForSemanticKeypathDictionary;
}

- (NSArray)_definitionFileURLs
{
  return self->_definitionFileURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionFileURLs, 0);
  objc_storeStrong((id *)&self->_mainBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_enums, 0);
  objc_storeStrong((id *)&self->_typeForSemanticKeypathDictionary, 0);
  objc_storeStrong((id *)&self->_typeForClassDictionary, 0);
  objc_storeStrong((id *)&self->_configurableParameterCombinationDictionary, 0);
  objc_storeStrong((id *)&self->_parameterCombinationDictionary, 0);
  objc_storeStrong((id *)&self->_schemaDictionary, 0);
}

id __116__INSchema__dictionaryRepresentationForIntentCodableDescription_intentResponseCodableDescription_appInfo_localizer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "allObjects", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dictionaryRepresentationWithLocalizer:", *(_QWORD *)(a1 + 32));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v14, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

void __56__INSchema_dictionaryRepresentationForIntent_localizer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_dictionaryRepresentationForIntentCodableDescription:intentResponseCodableDescription:appInfo:localizer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)schemaWithBundleRecord:(id)a3 fallbackToSystemSchema:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  INSchema *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  _QWORD v28[2];

  v4 = a4;
  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v6, "intentDefinitionURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedSetWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_objectsPassingTest:", &__block_literal_global_32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    v13 = [INSchema alloc];
    objc_msgSend(v6, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[INSchema _initWithContentsOfURLs:bundleIdentifier:mainBundleIdentifier:](v13, "_initWithContentsOfURLs:bundleIdentifier:mainBundleIdentifier:", v12, v14, v15);

    if (v16)
      goto LABEL_14;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && INThisProcessCanMapLSDatabase(0))
    {
      v17 = (void *)objc_opt_new();
      objc_msgSend(v6, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "extensionBundleIdentifiersForSystemAppIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "count"))
      {
        v27 = v17;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("self"), 1, sel_compare_);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sortedArrayUsingDescriptors:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v23, 0, 0);
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          objc_msgSend(a1, "schemaWithBundleRecord:fallbackToSystemSchema:", v24, v4);
          v16 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_14;
        }

        v17 = v27;
      }

    }
    v16 = 0;
  }
  if (v4)
  {
    +[INSchema systemSchema](INSchema, "systemSchema");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  return v16;
}

+ (void)_resetCache
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  os_unfair_lock_lock(&systemSchemaAccessorLock);
  v3 = (void *)systemSchema;
  systemSchema = 0;

  os_unfair_lock_unlock(&systemSchemaAccessorLock);
}

+ (id)_supportedClasses
{
  if (_supportedClasses_onceToken != -1)
    dispatch_once(&_supportedClasses_onceToken, &__block_literal_global_87);
  return (id)_supportedClasses_supportedClasses;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __29__INSchema__supportedClasses__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[INSchema _supportedTypesDictionary](INSchema, "_supportedTypesDictionary");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v16 != v3)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("ObjCType"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v6 = v5;
          else
            v6 = 0;
        }
        else
        {
          v6 = 0;
        }
        v7 = v6;

        objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" <"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "firstObject");
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v0, "if_addObjectIfNonNil:", NSClassFromString(v10));
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v2);
  }

  v11 = objc_msgSend(v0, "copy");
  v12 = (void *)_supportedClasses_supportedClasses;
  _supportedClasses_supportedClasses = v11;

}

uint64_t __58__INSchema_schemaWithBundleRecord_fallbackToSystemSchema___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  INSchemaFileExtensions();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "containsObject:", v4);
  return v5;
}

void __24__INSchema_systemSchema__block_invoke()
{
  void *v0;

  os_unfair_lock_lock(&systemSchemaAccessorLock);
  if ((systemSchema_isImmortal & 1) == 0)
  {
    v0 = (void *)systemSchema;
    systemSchema = 0;

  }
  os_unfair_lock_unlock(&systemSchemaAccessorLock);
}

@end
