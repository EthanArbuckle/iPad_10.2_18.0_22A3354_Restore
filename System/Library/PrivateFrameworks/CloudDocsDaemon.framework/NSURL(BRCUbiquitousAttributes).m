@implementation NSURL(BRCUbiquitousAttributes)

- (id)brc_attributesValues:()BRCUbiquitousAttributes lookup:
{
  id v5;
  void *v6;
  NSObject *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void (*v13)(id);
  void *v14;
  void (*v15)(void *, void *);
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  __int128 v49;
  void *v50;
  uint64_t v51;
  id obj;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v56 = a4;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v65 = (uint64_t)v56;
    v66 = 2112;
    v67 = v5;
    v68 = 2112;
    v69 = v6;
    _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] lookup: %@ for attributes %@%@", buf, 0x20u);
  }

  v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v5;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v60;
    v51 = *MEMORY[0x1E0CB2FE0];
    *(_QWORD *)&v8 = 138412802;
    v49 = v8;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v60 != v54)
          objc_enumerationMutation(obj);
        v10 = ubiquitousGetterForAttribute_onceToken;
        v11 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * v9);
        if (v10 != -1)
          dispatch_once(&ubiquitousGetterForAttribute_onceToken, &__block_literal_global_6);
        objc_msgSend((id)ubiquitousGetterForAttribute_ubiquitousAttributeToFunction, "objectForKeyedSubscript:", v11, v49);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void (*)(id))objc_msgSend(v12, "pointerValue");
        if (v13)
        {
          v13(v56);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_30;
        }
        v15 = +[BRCUbiquitousAttributes brc_getterForAttribute:](BRCUbiquitousAttributes, "brc_getterForAttribute:", v11);
        if (!v15)
        {
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v65 = (uint64_t)v11;
            v66 = 2112;
            v67 = v18;
            _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] unsupported attribute: %@%@", buf, 0x16u);
          }

          goto LABEL_32;
        }
        objc_msgSend(v56, "session");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "personaIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("__defaultPersonaID__")))
        {

        }
        else
        {
          objc_msgSend(v56, "session");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "personaIdentifier");
          v21 = (id)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v22 = 0;
            goto LABEL_23;
          }
        }
        if (brc_attributesValues_lookup____personaOnceToken != -1)
          dispatch_once(&brc_attributesValues_lookup____personaOnceToken, &__block_literal_global_52);
        v21 = (id)brc_attributesValues_lookup____personalPersona;
        v22 = 1;
LABEL_23:
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "currentPersona");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = 0;
        objc_msgSend(v24, "userPersonaUniqueString");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25 == v21 || (objc_msgSend(v25, "isEqualToString:", v21) & 1) != 0)
        {
          v27 = 0;
        }
        else
        {
          if (voucher_process_can_use_arbitrary_personas())
          {
            v57 = 0;
            v34 = (void *)objc_msgSend(v24, "copyCurrentPersonaContextWithError:", &v57);
            v35 = v57;
            v36 = v58;
            v58 = v34;

            if (v35)
            {
              brc_bread_crumbs();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 138412546;
                v65 = (uint64_t)v35;
                v66 = 2112;
                v67 = v37;
                _os_log_error_impl(&dword_1CBD43000, v38, (os_log_type_t)0x90u, "[ERROR] won't restore persona: %@%@", buf, 0x16u);
              }

            }
            objc_msgSend(v24, "generateAndRestorePersonaContextWithPersonaUniqueString:", v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v27)
              goto LABEL_26;
            brc_bread_crumbs();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, (os_log_type_t)0x90u))
            {
              objc_msgSend(v56, "session");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "personaIdentifier");
              v42 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v49;
              v65 = v42;
              v66 = 2112;
              v67 = v27;
              v68 = 2112;
              v69 = v39;
              v50 = (void *)v42;
              _os_log_error_impl(&dword_1CBD43000, v40, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);

            }
          }
          else
          {
            if (!v22 || (objc_msgSend(v24, "isDataSeparatedPersona") & 1) != 0)
            {
              brc_bread_crumbs();
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v65 = (uint64_t)v43;
                _os_log_debug_impl(&dword_1CBD43000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v51, 22, 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_26;
            }
            brc_bread_crumbs();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v65 = (uint64_t)v39;
              _os_log_debug_impl(&dword_1CBD43000, v40, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", buf, 0xCu);
            }
            v27 = 0;
          }

        }
LABEL_26:
        objc_msgSend(v56, "byIDLocalItem");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          v30 = v28;
        }
        else
        {
          objc_msgSend(v56, "faultedLocalItem");
          v30 = (id)objc_claimAutoreleasedReturnValue();
        }
        v31 = v30;

        objc_msgSend(v56, "db");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v15(v31, v32);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        _BRRestorePersona();
LABEL_30:
        if (v14)
        {
          objc_msgSend(v53, "setObject:forKeyedSubscript:", v14, v11);
          goto LABEL_35;
        }
LABEL_32:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v65 = (uint64_t)v11;
          v66 = 2112;
          v67 = v14;
          _os_log_debug_impl(&dword_1CBD43000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] No value for attribute: %@%@", buf, 0x16u);
        }

LABEL_35:
        ++v9;
      }
      while (v55 != v9);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      v55 = v45;
    }
    while (v45);
  }

  brc_bread_crumbs();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    -[NSURL(BRCUbiquitousAttributes) brc_attributesValues:lookup:].cold.1();

  return v53;
}

- (void)brc_attributesValues:()BRCUbiquitousAttributes lookup:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] returning %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
