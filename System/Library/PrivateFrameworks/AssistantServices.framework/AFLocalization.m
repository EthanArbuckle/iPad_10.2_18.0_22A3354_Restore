@implementation AFLocalization

void __73__AFLocalization_localizedStringForKey_gender_table_bundle_languageCode___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFArray *v13;
  CFArrayRef v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const __CFArray *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  _QWORD *v62;
  _QWORD *v63;
  char v64;
  void *v65;
  uint64_t v66;
  const __CFArray *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  id v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _QWORD v90[4];

  v1 = a1;
  v90[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "setObject:forKey:", v2, *(_QWORD *)(v1 + 40));
  }
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(v1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(v1 + 48));
  }
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(v1 + 56));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  if (!*(_QWORD *)(v1 + 64))
    goto LABEL_65;
  objc_msgSend(v4, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(v1 + 88) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 40))
  {
LABEL_65:
    if (!*(_QWORD *)(v1 + 72))
      goto LABEL_11;
    objc_msgSend(v4, "objectForKey:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    v11 = *(_QWORD *)(*(_QWORD *)(v1 + 88) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 40))
    {
LABEL_11:
      v13 = (const __CFArray *)objc_msgSend(*(id *)(v1 + 80), "localizations");
      v90[0] = *(_QWORD *)(v1 + 56);
      v14 = CFBundleCopyLocalizationsForPreferences(v13, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 1));
      objc_msgSend(*(id *)(v1 + 32), "_relevantTablesForTableName:tableExtension:bundle:", *(_QWORD *)(v1 + 48), CFSTR("loctable"), *(_QWORD *)(v1 + 80));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(v1 + 64);
      v63 = (_QWORD *)(v1 + 64);
      v17 = v4;
      if (v16)
      {
        objc_msgSend(*(id *)(v1 + 32), "_localizedStringForKey:tables:localizations:bundle:", v16, v15, v14, *(_QWORD *)(v1 + 80));
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          v20 = v15;
          v21 = (id *)(v1 + 64);
          goto LABEL_17;
        }
      }
      v22 = *(_QWORD *)(v1 + 72);
      v62 = (_QWORD *)(v1 + 72);
      if (v22)
      {
        objc_msgSend(*(id *)(v1 + 32), "_localizedStringForKey:tables:localizations:bundle:", v22, v15, v14, *(_QWORD *)(v1 + 80));
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v19 = (void *)v23;
          v20 = v15;
          v21 = (id *)(v1 + 72);
LABEL_17:
          v24 = *v21;
          if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
          }
          else
          {
            v26 = AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v81 = "-[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:]_block_invoke";
              v82 = 2112;
              v83 = v4;
              _os_log_debug_impl(&dword_19AF50000, v26, OS_LOG_TYPE_DEBUG, "%s stringsMap: %@", buf, 0x16u);
            }
            v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          }
          v27 = v25;
          objc_msgSend(v25, "setObject:forKey:", v19, v24);
          v4 = v27;

          objc_msgSend(v3, "setObject:forKey:", v4, *(_QWORD *)(v1 + 56));
          v28 = objc_msgSend(v19, "copy");
          v29 = *(_QWORD *)(*(_QWORD *)(v1 + 88) + 8);
          v30 = *(void **)(v29 + 40);
          *(_QWORD *)(v29 + 40) = v28;

          v15 = v20;
LABEL_61:

          goto LABEL_62;
        }
      }
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v31 = v14;
      v69 = -[__CFArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
      if (v69)
      {
        v60 = v15;
        v61 = v2;
        v64 = 0;
        v65 = v3;
        v66 = *(_QWORD *)v77;
        v67 = v31;
        v68 = v1;
LABEL_26:
        v32 = 0;
        while (1)
        {
          v71 = v4;
          if (*(_QWORD *)v77 != v66)
            objc_enumerationMutation(v31);
          v33 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v32);
          v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(*(id *)(v1 + 80), "URLsForResourcesWithExtension:subdirectory:localization:", CFSTR("strings"), 0, v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^%@-*\\w*\\.%@$"), *(_QWORD *)(v1 + 48), CFSTR("strings"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v37 = v35;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v73;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v73 != v40)
                  objc_enumerationMutation(v37);
                v42 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
                objc_msgSend(v42, "lastPathComponent");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v36, "numberOfMatchesInString:options:range:", v43, 0, 0, objc_msgSend(v43, "length")))
                {
                  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v42);
                  objc_msgSend(v34, "addEntriesFromDictionary:", v44);

                }
              }
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
            }
            while (v39);
          }

          v45 = objc_msgSend(v34, "count");
          if (v45)
          {
            v1 = v68;
            if (v71 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(v34, "addEntriesFromDictionary:", v71);
            }
            else
            {
              v46 = AFSiriLogContextConnection;
              if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v81 = "-[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:]_block_invoke";
                v82 = 2112;
                v83 = v71;
                _os_log_debug_impl(&dword_19AF50000, v46, OS_LOG_TYPE_DEBUG, "%s stringsMap: %@", buf, 0x16u);
              }
            }
            v4 = v34;

            objc_msgSend(v65, "setObject:forKey:", v4, *(_QWORD *)(v68 + 56));
            v64 = 1;
          }
          else
          {
            v1 = v68;
            v4 = v71;
          }

          v31 = v67;
          if (v45)
            break;
          if (++v32 == v69)
          {
            v69 = -[__CFArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
            if (v69)
              goto LABEL_26;
            break;
          }
        }

        v2 = v61;
        v3 = v65;
        v15 = v60;
        if ((v64 & 1) != 0)
          goto LABEL_53;
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v47, *(_QWORD *)(v1 + 56));

LABEL_53:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_66;
      if (!*v63)
        goto LABEL_67;
      objc_msgSend(v4, "objectForKey:");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "copy");
      v50 = *(_QWORD *)(*(_QWORD *)(v1 + 88) + 8);
      v51 = *(void **)(v50 + 40);
      *(_QWORD *)(v50 + 40) = v49;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 40))
      {
LABEL_67:
        if (!*v62)
          goto LABEL_66;
        objc_msgSend(v4, "objectForKey:");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "copy");
        v54 = *(_QWORD *)(*(_QWORD *)(v1 + 88) + 8);
        v55 = *(void **)(v54 + 40);
        *(_QWORD *)(v54 + 40) = v53;

        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 40))
        {
LABEL_66:
          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 40))
          {
            v56 = AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              v57 = *(void **)(v1 + 72);
              v58 = *(_QWORD *)(v1 + 48);
              v59 = *(_QWORD *)(v1 + 56);
              *(_DWORD *)buf = 136315906;
              v81 = "-[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:]_block_invoke";
              v82 = 2112;
              v83 = v57;
              v84 = 2112;
              v85 = v58;
              v86 = 2112;
              v87 = v59;
              _os_log_error_impl(&dword_19AF50000, v56, OS_LOG_TYPE_ERROR, "%s Missing localization strings for key: %@, table: %@, languageCode: %@", buf, 0x2Au);
            }
          }
        }
      }
      goto LABEL_61;
    }
  }
LABEL_62:

}

- (id)_relevantTablesForTableName:(id)a3 tableExtension:(id)a4 bundle:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (!v7)
    goto LABEL_21;
  if (!v9)
    goto LABEL_21;
  v12 = objc_msgSend(v7, "length");
  v11 = 0;
  if (!v8 || !v12)
    goto LABEL_21;
  if (!objc_msgSend(v8, "length"))
  {
LABEL_20:
    v11 = 0;
    goto LABEL_21;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("loctable")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("strings")) & 1) == 0)
  {
    v21 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[AFLocalization _relevantTablesForTableName:tableExtension:bundle:]";
      _os_log_error_impl(&dword_19AF50000, v21, OS_LOG_TYPE_ERROR, "%s tableExtension must be loctable or strings", buf, 0xCu);
    }
    goto LABEL_20;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^%@-*\\w*\\.%@$"), v7, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v10;
  objc_msgSend(v10, "URLsForResourcesWithExtension:subdirectory:", v8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18), "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length")))
        {
          objc_msgSend(v19, "stringByDeletingPathExtension");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);

        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  v10 = v24;
LABEL_21:

  return v11;
}

- (id)_localizedStringForKey:(id)a3 tables:(id)a4 localizations:(id)a5 bundle:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v9 && objc_msgSend(v10, "count") && (v13 = objc_msgSend(v11, "count"), v12) && v13)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v35 = v11;
    v14 = v11;
    v31 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v31)
    {
      v15 = *(_QWORD *)v41;
      v33 = v14;
      v34 = v10;
      v30 = *(_QWORD *)v41;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v41 != v15)
            objc_enumerationMutation(v14);
          v32 = v16;
          v17 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v16);
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v18 = v10;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v37;
            while (2)
            {
              v22 = 0;
              do
              {
                if (*(_QWORD *)v37 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v22);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NOT_FOUND:(%@)"), v9);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "localizedStringForKey:value:table:localization:", v9, v24, v23, v17);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v25;
                if (v25 && !objc_msgSend(v25, "isEqualToString:", v24))
                {

                  v10 = v34;
                  goto LABEL_29;
                }

                ++v22;
              }
              while (v20 != v22);
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              if (v20)
                continue;
              break;
            }
          }

          v16 = v32 + 1;
          v14 = v33;
          v10 = v34;
          v15 = v30;
        }
        while (v32 + 1 != v31);
        v31 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v31);
    }

    v27 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v47 = "-[AFLocalization _localizedStringForKey:tables:localizations:bundle:]";
      v48 = 2112;
      v49 = v9;
      v50 = 2112;
      v51 = v10;
      v52 = 2112;
      v53 = v14;
      v54 = 2112;
      v55 = v12;
      _os_log_error_impl(&dword_19AF50000, v27, OS_LOG_TYPE_ERROR, "%s Could not find localization for key: %@, tables: %@, localizations: %@, bundle: %@", buf, 0x34u);
    }
    v26 = 0;
LABEL_29:
    v11 = v35;
  }
  else
  {
    v28 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v47 = "-[AFLocalization _localizedStringForKey:tables:localizations:bundle:]";
      v48 = 2112;
      v49 = v9;
      v50 = 2112;
      v51 = v10;
      v52 = 2112;
      v53 = v11;
      v54 = 2112;
      v55 = v12;
      _os_log_error_impl(&dword_19AF50000, v28, OS_LOG_TYPE_ERROR, "%s Missing parameter(s). key: %@, tables: %@, localizations: %@, bundle: %@", buf, 0x34u);
    }
    v26 = 0;
  }

  return v26;
}

- (id)localizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5 languageCode:(id)a6
{
  return -[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:](self, "localizedStringForKey:gender:table:bundle:languageCode:", a3, 0, a4, a5, a6);
}

- (id)localizedStringForKey:(id)a3 gender:(int64_t)a4 table:(id)a5 bundle:(id)a6 languageCode:(id)a7
{
  unint64_t v12;
  __CFString *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *queue;
  _QWORD v26[5];
  id v27;
  __CFString *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = (unint64_t)a3;
  v13 = (__CFString *)a5;
  v14 = a6;
  v15 = a7;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__15014;
  v38 = __Block_byref_object_dispose__15015;
  v39 = 0;
  objc_msgSend(v14, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v13, "length"))
  {

    v13 = CFSTR("Localizable");
  }
  if (!objc_msgSend(v15, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0C997E0]);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v18;
  }
  v19 = 0;
  if (v15 && v16)
  {
    v20 = CFSTR("_MALE");
    if (a4 != 1)
      v20 = 0;
    if (a4 == 2)
      v20 = CFSTR("_FEMALE");
    v21 = v20;
    if (v21)
    {
      objc_msgSend((id)v12, "stringByAppendingString:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    if (v12 | v22)
    {
      queue = self->_queue;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __73__AFLocalization_localizedStringForKey_gender_table_bundle_languageCode___block_invoke;
      v26[3] = &unk_1E3A306E0;
      v26[4] = self;
      v27 = v16;
      v28 = v13;
      v29 = v15;
      v30 = (id)v22;
      v33 = &v34;
      v31 = (id)v12;
      v32 = v14;
      dispatch_sync(queue, v26);
      v19 = (id)v35[5];

    }
    else
    {
      v23 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "-[AFLocalization localizedStringForKey:gender:table:bundle:languageCode:]";
        _os_log_error_impl(&dword_19AF50000, v23, OS_LOG_TYPE_ERROR, "%s Missing key and genderKey, unable to perform localized string lookup", buf, 0xCu);
      }
      v19 = 0;
    }

  }
  _Block_object_dispose(&v34, 8);

  return v19;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_15047 != -1)
    dispatch_once(&sharedInstance_onceToken_15047, &__block_literal_global_15048);
  return (id)sharedInstance_sLocalization;
}

void __32__AFLocalization_sharedInstance__block_invoke()
{
  AFLocalization *v0;
  void *v1;

  v0 = objc_alloc_init(AFLocalization);
  v1 = (void *)sharedInstance_sLocalization;
  sharedInstance_sLocalization = (uint64_t)v0;

}

- (AFLocalization)init
{
  AFLocalization *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *tables;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AFLocalization;
  v2 = -[AFLocalization init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("AFLocalization", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tables = v2->_tables;
    v2->_tables = v6;

  }
  return v2;
}

- (id)localizedUIUtteranceForKey:(id)a3 languageCode:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFLocalization localizedStringForKey:table:bundle:languageCode:](self, "localizedStringForKey:table:bundle:languageCode:", v8, CFSTR("UIUtterances-JS"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)longDisplayNameInLanguage:(id)a3 forSiriLanguage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(CFSTR("LONG_"), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFLocalization localizedStringForKey:table:bundle:languageCode:](self, "localizedStringForKey:table:bundle:languageCode:", v8, CFSTR("SiriLanguages"), v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)compactDisplayNameInLanguage:(id)a3 forSiriLanguage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(CFSTR("COMPACT_"), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFLocalization localizedStringForKey:table:bundle:languageCode:](self, "localizedStringForKey:table:bundle:languageCode:", v8, CFSTR("SiriLanguages"), v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)localizedCompactNameForSiriLanguage:(id)a3 inDisplayLanguage:(id)a4
{
  return -[AFLocalization compactDisplayNameInLanguage:forSiriLanguage:](self, "compactDisplayNameInLanguage:forSiriLanguage:", a4, a3);
}

- (id)localizedNameForSiriLanguage:(id)a3 inDisplayLanguage:(id)a4
{
  return -[AFLocalization longDisplayNameInLanguage:forSiriLanguage:](self, "longDisplayNameInLanguage:forSiriLanguage:", a4, a3);
}

- (id)localizedNameOfOutputVoiceWithIdentifier:(id)a3 inDisplayLanguage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(CFSTR("VOICE_"), "stringByAppendingString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFLocalization localizedStringForKey:table:bundle:languageCode:](self, "localizedStringForKey:table:bundle:languageCode:", v8, CFSTR("SiriLanguages"), v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)localizedNameOfOutputVoice:(id)a3 inDisplayLanguage:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFLocalization localizedNameOfOutputVoiceWithIdentifier:inDisplayLanguage:](self, "localizedNameOfOutputVoiceWithIdentifier:inDisplayLanguage:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedGenderOfOutputVoice:(id)a3 inDisplayLanguage:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  if (a3)
    v7 = objc_msgSend(a3, "gender");
  else
    v7 = 0;
  -[AFLocalization localizedNameOfVoiceGender:inDisplayLanguage:](self, "localizedNameOfVoiceGender:inDisplayLanguage:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedNameOfVoiceGender:(int64_t)a3 inDisplayLanguage:(id)a4
{
  const __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  if ((unint64_t)(a3 - 1) > 2)
    v5 = CFSTR("VOICE_GENDER_UNSPECIFIED");
  else
    v5 = off_1E3A30780[a3 - 1];
  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFLocalization localizedStringForKey:table:bundle:languageCode:](self, "localizedStringForKey:table:bundle:languageCode:", v5, CFSTR("SiriLanguages"), v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)outputVoiceColorDescriptorForOutputLanguageCode:(id)a3 voiceName:(id)a4
{
  void *v4;
  AFOutputVoiceColorDescriptor *v5;
  void *v6;
  void *v7;
  double v8;
  AFOutputVoiceColorDescriptor *v9;

  -[AFLocalization outputVoiceDescriptorForOutputLanguageCode:voiceName:](self, "outputVoiceDescriptorForOutputLanguageCode:voiceName:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [AFOutputVoiceColorDescriptor alloc];
    objc_msgSend(v4, "localizedDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedDisplayWithRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1.0;
    v9 = -[AFOutputVoiceColorDescriptor initWithHexColor:colorName:alpha:localizedOutputVoiceColor:localizedOutputVoice:](v5, "initWithHexColor:colorName:alpha:localizedOutputVoiceColor:localizedOutputVoice:", CFSTR("#1190E4"), &stru_1E3A37708, v6, v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)outputVoiceDescriptorForOutputLanguageCode:(id)a3 voiceName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  AFOutputVoiceDescriptor *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *, uint64_t, _BYTE *);
  void *v35;
  id v36;
  _BYTE *v37;
  uint8_t v38[4];
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  _BYTE buf[24];
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[AFLocalization outputVoiceDescriptorForOutputLanguageCode:voiceName:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v45 = (uint64_t)v7;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s languageCode: %@, voiceName: %@", buf, 0x20u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v45 = 0x7FFFFFFFFFFFFFFFLL;
  -[AFLocalization _voicesFromVoiceMapWithLanguage:](self, "_voicesFromVoiceMapWithLanguage:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFLocalization outputVoiceComparator](self, "outputVoiceComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __71__AFLocalization_outputVoiceDescriptorForOutputLanguageCode_voiceName___block_invoke;
  v35 = &unk_1E3A30708;
  v12 = v7;
  v36 = v12;
  v37 = buf;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v32);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v38 = 136315650;
      v39 = "-[AFLocalization outputVoiceDescriptorForOutputLanguageCode:voiceName:]";
      v40 = 2112;
      v41 = v6;
      v42 = 2112;
      v43 = v12;
      _os_log_error_impl(&dword_19AF50000, v13, OS_LOG_TYPE_ERROR, "%s No descriptor found for language code %@, voice name %@", v38, 0x20u);
    }
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFLocalization localizedStringForKey:table:bundle:languageCode:](self, "localizedStringForKey:table:bundle:languageCode:", CFSTR("VOICE"), CFSTR("SiriLanguages"), v15, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = CFSTR("Voice");
    if (v16)
      v18 = (__CFString *)v16;
    v19 = v18;

    -[AFLocalization localizedStringForKey:table:bundle:languageCode:](self, "localizedStringForKey:table:bundle:languageCode:", CFSTR("VOICE_AND_NUMBER"), CFSTR("SiriLanguages"), v15, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = CFSTR("%1$@ %2$lu");
    if (v20)
      v22 = (__CFString *)v20;
    v23 = v22;

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v23, v19, *(_QWORD *)(*(_QWORD *)&buf[8] + 24) + 1, v32, v33, v34, v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[AFLocalization localizedNameOfOutputVoiceWithIdentifier:inDisplayLanguage:](self, "localizedNameOfOutputVoiceWithIdentifier:inDisplayLanguage:", v6, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFLocalization localizedStringForKey:table:bundle:languageCode:](self, "localizedStringForKey:table:bundle:languageCode:", CFSTR("REGION_AND_VOICE"), CFSTR("SiriLanguages"), v15, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    v28 = CFSTR("%1$@ (%2$@)");
    if (v26)
      v28 = (__CFString *)v26;
    v29 = v28;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v29, v25, v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[AFOutputVoiceDescriptor initWithLocalizedDisplay:localizedDisplayWithRegion:]([AFOutputVoiceDescriptor alloc], "initWithLocalizedDisplay:localizedDisplayWithRegion:", v24, v30);
  }

  _Block_object_dispose(buf, 8);
  return v14;
}

- (id)dialectsMap
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("AssistantVoiceDialects"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)baseLocaleToDialectMapForLanguage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  AFLocalization *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __52__AFLocalization_baseLocaleToDialectMapForLanguage___block_invoke;
    v13 = &unk_1E3A36F30;
    v14 = self;
    if (baseLocaleToDialectMapForLanguage__onceToken != -1)
      dispatch_once(&baseLocaleToDialectMapForLanguage__onceToken, &v10);
    -[AFLocalization getBaseLocale:](self, "getBaseLocale:", v4, v10, v11, v12, v13, v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)baseLocaleToDialectMapForLanguage__rootLocaleMap, "objectForKey:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v15 = v5;
      v16[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

- (id)allOutputVoiceIdentifiersForSiriLanguage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[AFLocalization dialectsMap](self, "dialectsMap", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          -[AFLocalization getBaseLocale:](self, "getBaseLocale:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
            objc_msgSend(v5, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v9);
    }

    if (v5)
    {
      v13 = v5;
    }
    else
    {
      v20 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (id)getBaseLocale:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("[^-]+-[^-]+-"), 1024, 0, objc_msgSend(v3, "length"));
  if (v4)
  {
    objc_msgSend(v3, "substringToIndex:", v4 - 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  return v6;
}

- (id)dialectForBaseLanguageCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AFLocalization baseLocaleToDialectMapForLanguage:](self, "baseLocaleToDialectMapForLanguage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFLocalization getBaseLocale:](self, "getBaseLocale:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)defaultOutputVoiceForSiriSessionLanguage:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    AFOutputVoiceLanguageForRecognitionLanguage(v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("en-US");
    v5 = CFSTR("en-US");
  }

  return v4;
}

- (id)loadInfoForVoicesWithLanguageCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AFLocalization _voicesFromVoiceMapWithLanguage:](self, "_voicesFromVoiceMapWithLanguage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[AFLocalization loadInfoForVoicesWithLanguageCode:]";
      v12 = 2112;
      v13 = v4;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s Missing voice map for language %@", (uint8_t *)&v10, 0x16u);
    }
    v7 = (id)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)_voicesFromVoiceMapWithLanguage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[AFLocalization dialectForBaseLanguageCode:](self, "dialectForBaseLanguageCode:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      -[AFLocalization _voiceMaps](self, "_voiceMaps");
      objc_msgSend(v20, "objectForKey:", v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      __destructor_8_s0_s8_s16_s24(&v20);
    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v8);
            v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            -[AFLocalization _voiceMaps](self, "_voiceMaps");
            objc_msgSend(v15, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObjectsFromArray:", v13);

            __destructor_8_s0_s8_s16_s24(&v15);
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v9);
      }

    }
  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[AFLocalization _voicesFromVoiceMapWithLanguage:]";
      _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s nil language code provided", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (id)_getVoiceOrdering
{
  id v2;
  id v4[4];

  -[AFLocalization _voiceMaps](self, "_voiceMaps");
  v2 = v4[2];
  __destructor_8_s0_s8_s16_s24(v4);
  return v2;
}

- ($6A2B22629575B71C8C7D7AB7AB1FFF1A)_voiceMaps
{
  $6A2B22629575B71C8C7D7AB7AB1FFF1A *result;

  if (_voiceMaps_onceToken != -1)
    dispatch_once(&_voiceMaps_onceToken, &__block_literal_global_85);
  retstr->var0 = (id)_voiceMaps_voiceMaps_0;
  retstr->var1 = (id)_voiceMaps_voiceMaps_1;
  retstr->var2 = (id)_voiceMaps_voiceMaps_2;
  result = ($6A2B22629575B71C8C7D7AB7AB1FFF1A *)(id)_voiceMaps_voiceMaps_3;
  retstr->var3 = result;
  return result;
}

- (id)voiceNamesForOutputLanguageCode:(id)a3 gender:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AFLocalization _voicesFromVoiceMapWithLanguage:](self, "_voicesFromVoiceMapWithLanguage:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "gender") == a4)
        {
          objc_msgSend(v13, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)outputVoiceComparator
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__AFLocalization_outputVoiceComparator__block_invoke;
  v3[3] = &unk_1E3A30760;
  v3[4] = self;
  return (id)MEMORY[0x1A1AC0C3C](v3, a2);
}

- (id)voiceSimilarToVoice:(id)a3 inSiriSessionLanguage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id obj;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49[4];
  uint8_t v50[128];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AFLocalization defaultOutputVoiceForSiriSessionLanguage:](self, "defaultOutputVoiceForSiriSessionLanguage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v52 = "-[AFLocalization voiceSimilarToVoice:inSiriSessionLanguage:]";
    v53 = 2112;
    v54 = v7;
    v55 = 2112;
    v56 = v8;
    v57 = 2112;
    v58 = v6;
    _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s language code: %@ output language code: %@, output voice: %@", buf, 0x2Au);
  }
  objc_msgSend(v6, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v35 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[AFLocalization voiceSimilarToVoice:inSiriSessionLanguage:]";
      v53 = 2112;
      v54 = v6;
      _os_log_error_impl(&dword_19AF50000, v35, OS_LOG_TYPE_ERROR, "%s %@ missing languageCode", buf, 0x16u);
    }
    goto LABEL_24;
  }
  objc_msgSend(v6, "name");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v6, "languageCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFLocalization voiceNamesForOutputLanguageCode:gender:](self, "voiceNamesForOutputLanguageCode:gender:", v12, objc_msgSend(v6, "gender"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v11 = v14;
      v15 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v52 = "-[AFLocalization voiceSimilarToVoice:inSiriSessionLanguage:]";
        v53 = 2112;
        v54 = v6;
        v55 = 2112;
        v56 = v11;
        _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s Voice name not specified for %@, using %@", buf, 0x20u);
      }

      goto LABEL_9;
    }
    v37 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[AFLocalization voiceSimilarToVoice:inSiriSessionLanguage:]";
      v53 = 2112;
      v54 = v6;
      _os_log_impl(&dword_19AF50000, v37, OS_LOG_TYPE_INFO, "%s Voice name not specified for %@, can't determine default name", buf, 0x16u);
    }
LABEL_24:
    v22 = 0;
    goto LABEL_27;
  }
LABEL_9:
  v41 = v7;
  -[AFLocalization _voiceMaps](self, "_voiceMaps");
  v16 = v49[1];
  __destructor_8_s0_s8_s16_s24(v49);
  v42 = v6;
  objc_msgSend(v6, "languageCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v11;
  objc_msgSend(v17, "stringByAppendingString:", v11);
  v18 = objc_claimAutoreleasedReturnValue();

  v44 = v16;
  v38 = (void *)v18;
  objc_msgSend(v16, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v8;
  -[AFLocalization _voicesFromVoiceMapWithLanguage:](self, "_voicesFromVoiceMapWithLanguage:", v8);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v46;
    v24 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v46 != v23)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v26, "languageCode");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByAppendingString:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "objectForKey:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "integerValue");
        v32 = objc_msgSend(v19, "integerValue");
        if (v31 - v32 >= 0)
          v33 = v31 - v32;
        else
          v33 = v32 - v31;
        if (v33 < v24)
        {
          v34 = v26;

          v24 = v33;
          v22 = v34;
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }

  v7 = v41;
  v6 = v42;
  v8 = v40;
LABEL_27:

  return v22;
}

- (id)getValidOutputVoiceWithDialects:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  AFVoiceInfo *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  AFVoiceInfo *v27;
  AFVoiceInfo *v28;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "gender");
  +[AFLocalization sharedInstance](AFLocalization, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allOutputVoiceIdentifiersForSiriLanguage:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = v8;
  v34 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
  if (!v34)
  {

    v21 = v10;
    if (v5)
      objc_msgSend(v9, "containsObject:", v5);
    v11 = 0;
    goto LABEL_29;
  }
  obj = v10;
  v30 = v5;
  v31 = v4;
  v11 = 0;
  v33 = *(_QWORD *)v41;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v41 != v33)
        objc_enumerationMutation(obj);
      v35 = v12;
      v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v12);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      +[AFLocalization sharedInstance](AFLocalization, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "voiceNamesForOutputLanguageCode:gender:", v13, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v54, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v37 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            if (!v11)
              v11 = -[AFVoiceInfo initWithLanguageCode:gender:name:footprint:isCustom:]([AFVoiceInfo alloc], "initWithLanguageCode:gender:name:footprint:isCustom:", v13, v6, v20, 2, 1);
            objc_msgSend(v9, "addObject:", v20);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v54, 16);
        }
        while (v17);
      }

      v12 = v35 + 1;
    }
    while (v35 + 1 != v34);
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
  }
  while (v34);
  v21 = obj;

  v5 = v30;
  if (v30)
  {
    v4 = v31;
    if ((objc_msgSend(v9, "containsObject:", v30) & 1) != 0 || !v11)
      goto LABEL_29;
  }
  else
  {
    v4 = v31;
    if (!v11)
    {
LABEL_29:
      v27 = (AFVoiceInfo *)v3;
      goto LABEL_30;
    }
  }
  -[AFVoiceInfo name](v11, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22 == v30)
    goto LABEL_29;
  v23 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    -[AFVoiceInfo name](v11, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFVoiceInfo languageCode](v11, "languageCode");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v45 = "-[AFLocalization getValidOutputVoiceWithDialects:]";
    v46 = 2112;
    v47 = v30;
    v48 = 2112;
    v49 = v4;
    v50 = 2112;
    v51 = v25;
    v52 = 2112;
    v53 = v26;
    _os_log_impl(&dword_19AF50000, v24, OS_LOG_TYPE_INFO, "%s Invalid output voice '%@:%@' found. Updated to '%@:%@'", buf, 0x34u);

    v21 = obj;
  }
  v27 = v11;
  v11 = v27;
LABEL_30:
  v28 = v27;

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tables, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __39__AFLocalization_outputVoiceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v20 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v19 = 0;
      goto LABEL_20;
    }
    v24 = 136315394;
    v25 = "-[AFLocalization outputVoiceComparator]_block_invoke";
    v26 = 2112;
    v27 = v5;
LABEL_22:
    _os_log_error_impl(&dword_19AF50000, v20, OS_LOG_TYPE_ERROR, "%s %@ missing name cannot compare voices", (uint8_t *)&v24, 0x16u);
    goto LABEL_11;
  }
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v20 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v24 = 136315394;
    v25 = "-[AFLocalization outputVoiceComparator]_block_invoke";
    v26 = 2112;
    v27 = v6;
    goto LABEL_22;
  }
  objc_msgSend(v5, "languageCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "languageCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "_getVoiceOrdering");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_getVoiceOrdering");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && v18)
    {
      v19 = objc_msgSend(v16, "compare:", v18);
    }
    else
    {
      v22 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v24 = 136315650;
        v25 = "-[AFLocalization outputVoiceComparator]_block_invoke";
        v26 = 2112;
        v27 = v5;
        v28 = 2112;
        v29 = v6;
        _os_log_error_impl(&dword_19AF50000, v22, OS_LOG_TYPE_ERROR, "%s Cannot resolve ordering for voice one: %@, voice two: %@ ", (uint8_t *)&v24, 0x20u);
      }
      v19 = 0;
    }

  }
  else
  {
    v21 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v24 = 136315650;
      v25 = "-[AFLocalization outputVoiceComparator]_block_invoke";
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v11;
      _os_log_error_impl(&dword_19AF50000, v21, OS_LOG_TYPE_ERROR, "%s Cannot compare voices with keys (%@, %@)", (uint8_t *)&v24, 0x20u);
    }
    v19 = 0;
  }

LABEL_20:
  return v19;
}

void __28__AFLocalization__voiceMaps__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend(MEMORY[0x1E0DA7910], "assistantVoiceMaps");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "voicesForLanguageMap");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "relativeOrderForVoicesMap");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "relativePitchOrderForVoicesMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifiersForVoicesMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v0, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __28__AFLocalization__voiceMaps__block_invoke_2;
  v15[3] = &unk_1E3A30738;
  v5 = v4;
  v16 = v5;
  objc_msgSend(v0, "enumerateKeysAndObjectsUsingBlock:", v15);
  v6 = (void *)_voiceMaps_voiceMaps_0;
  _voiceMaps_voiceMaps_0 = (uint64_t)v5;
  v7 = v5;

  v8 = (void *)_voiceMaps_voiceMaps_2;
  _voiceMaps_voiceMaps_2 = (uint64_t)v1;
  v9 = v1;

  v10 = (void *)_voiceMaps_voiceMaps_1;
  _voiceMaps_voiceMaps_1 = (uint64_t)v2;
  v11 = v2;

  v12 = (void *)_voiceMaps_voiceMaps_3;
  _voiceMaps_voiceMaps_3 = (uint64_t)v3;
  v13 = v3;

}

void __28__AFLocalization__voiceMaps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  AFVoiceInfo *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  AFVoiceInfo *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v12 = [AFVoiceInfo alloc];
        v13 = objc_msgSend(v11, "assistantGender");
        v14 = objc_msgSend(v11, "isCustom");
        objc_msgSend(v11, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[AFVoiceInfo initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:](v12, "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", v4, v13, v14, v15, 2, 0, 0);

        objc_msgSend(v6, "addObject:", v16);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v4);
}

void __52__AFLocalization_baseLocaleToDialectMapForLanguage___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dialectsMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)baseLocaleToDialectMapForLanguage__rootLocaleMap;
  baseLocaleToDialectMapForLanguage__rootLocaleMap = (uint64_t)v3;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "getBaseLocale:", v10, (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)baseLocaleToDialectMapForLanguage__rootLocaleMap, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v13 = (void *)baseLocaleToDialectMapForLanguage__rootLocaleMap;
          v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v13, "setValue:forKey:", v14, v11);

        }
        objc_msgSend((id)baseLocaleToDialectMapForLanguage__rootLocaleMap, "objectForKeyedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v10);

        if ((v16 & 1) == 0)
        {
          objc_msgSend((id)baseLocaleToDialectMapForLanguage__rootLocaleMap, "objectForKeyedSubscript:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

void __71__AFLocalization_outputVoiceDescriptorForOutputLanguageCode_voiceName___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;

  objc_msgSend(a2, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

@end
