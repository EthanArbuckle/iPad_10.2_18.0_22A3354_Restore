@implementation DDScanServerDispatcher

void __60__DDScanServerDispatcher_recycleScanner_fromList_sameQueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _BYTE *v23;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40)
    || (v2 = *(_QWORD *)(a1 + 40)) != 0 && objc_msgSend(*(id *)(v2 + 64), "count") == 1)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      objc_msgSend(*(id *)(v3 + 48), "lastObject");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
        objc_msgSend(*(id *)(v3 + 48), "removeLastObject");
    }
    else
    {
      v4 = 0;
    }
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 48);
      if (v8)
        *(_QWORD *)(v8 + 24) = *(_QWORD *)(v7 + 16);
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      *(_QWORD *)(v9 + 24) = 0;
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(id *)(a1 + 48);
      v12 = v11;
      if (v10 && v11)
      {
        v23 = v11;
        v13 = objc_msgSend(*(id *)(v10 + 56), "count");
        if (!v13)
          goto LABEL_22;
        if (v23[20])
        {
          v14 = v13;
          objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "activeProcessorCount");

          objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (unint64_t)objc_msgSend(v17, "physicalMemory") >> 30;

          v19 = v16 >= v18 ? v18 : v16;
          if (v19 <= 1)
            v19 = 1;
          if (v14 < v19)
          {
LABEL_22:
            v20 = *(void **)(v10 + 56);
            if (v20)
            {
              objc_msgSend(v20, "addObject:", v23);
            }
            else
            {
              v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v23, 0);
              v22 = *(void **)(v10 + 56);
              *(_QWORD *)(v10 + 56) = v21;

            }
          }
        }
        objc_msgSend(*(id *)(v10 + 64), "removeObject:", v23);
        v12 = v23;
      }
    }
    else
    {
      v12 = 0;
    }

  }
}

void __58__DDScanServerDispatcher_scannerConf_sync_string_runTask___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  DDScannerList *v11;
  unsigned int *v12;
  uint64_t v13;
  NSString *hash;
  uint64_t v15;
  NSString *language;
  uint64_t v17;
  NSString *country;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  qos_class_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  DDScannerObject *v42;
  unsigned int v43;
  int v44;
  int v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFLocale *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  int64_t v61;
  _QWORD *v62;
  DDScanStepBlockContainer *v63;
  _QWORD *v64;
  void *v65;
  id block;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  int v73;
  int v74;
  _QWORD v75[4];
  id v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  objc_super v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), CFSTR("DDScannerServer.m"), 881, CFSTR("Scan operation requested after tear down"));

    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = *(_QWORD *)(v2 + 64) + 1;
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (unsigned int *)*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v6 = v5;
  if (v4)
  {
    -[DDScannerServiceConfiguration recyclingIdentifier](v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(v4 + 48);
    if (!v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = *(void **)(v4 + 48);
      *(_QWORD *)(v4 + 48) = v9;

      v8 = *(void **)(v4 + 48);
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v11 = (DDScannerList *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = [DDScannerList alloc];
      v12 = v6;
      if (v11)
      {
        v82.receiver = v11;
        v82.super_class = (Class)DDScannerList;
        v11 = (DDScannerList *)objc_msgSendSuper2(&v82, sel_init);
        if (v11)
        {
          -[DDScannerServiceConfiguration recyclingIdentifier](v12);
          v13 = objc_claimAutoreleasedReturnValue();
          hash = v11->_hash;
          v11->_hash = (NSString *)v13;

          v11->_type = objc_msgSend(v12, "scannerType");
          v11->_spotlightSuggestionsEnabled = objc_msgSend(v12, "spotlightSuggestionsEnabled");
          objc_msgSend(v12, "language");
          v15 = objc_claimAutoreleasedReturnValue();
          language = v11->_language;
          v11->_language = (NSString *)v15;

          objc_msgSend(v12, "country");
          v17 = objc_claimAutoreleasedReturnValue();
          country = v11->_country;
          v11->_country = (NSString *)v17;

          v11->_languageHighConfidence = objc_msgSend(v12, "languageHighConfidence");
        }
      }

      objc_msgSend(*(id *)(v4 + 48), "setObject:forKeyedSubscript:", v11, v7);
    }

  }
  else
  {
    v11 = 0;
  }

  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v11;

  if (*(_BYTE *)(a1 + 96))
    goto LABEL_13;
  v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v23 || !objc_msgSend(*(id *)(v23 + 64), "count"))
    goto LABEL_13;
  v24 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v24 + 40))
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "activeProcessorCount");

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    objc_msgSend(*(id *)(v24 + 48), "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v78, &v82, 16);
    if (v29)
    {
      v30 = v29;
      v31 = 0;
      v32 = *(_QWORD *)v79;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v79 != v32)
            objc_enumerationMutation(v28);
          v34 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v33);
          if (v34)
            v35 = objc_msgSend(*(id *)(v34 + 64), "count");
          else
            v35 = 0;
          v31 += v35;
          if (v31 >= v27)
          {

            goto LABEL_48;
          }
          ++v33;
        }
        while (v30 != v33);
        v36 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v78, &v82, 16);
        v30 = v36;
      }
      while (v36);
    }

LABEL_13:
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v21 && objc_msgSend(*(id *)(v21 + 56), "count"))
    {
      objc_msgSend(*(id *)(v21 + 56), "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[DDScannerList activateScanner:](v21, v22);
        objc_msgSend(*(id *)(v21 + 56), "removeLastObject");
      }
    }
    else
    {
      v22 = 0;
    }
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v38 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v22;

    v39 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v40 = *(_QWORD *)(v39 + 40);
    if (v40)
    {
LABEL_67:
      *(_QWORD *)(v40 + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      return;
    }
    v41 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v41)
    {
      v71 = 0;
      v42 = 0;
LABEL_66:
      *(_QWORD *)(v39 + 40) = v42;

      v40 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      if (!v40)
        return;
      goto LABEL_67;
    }
    v42 = [DDScannerObject alloc];
    v43 = *(_DWORD *)(v41 + 12);
    v44 = *(unsigned __int8 *)(v41 + 8);
    v45 = *(unsigned __int8 *)(v41 + 40);
    v46 = *(void **)(v41 + 32);
    v47 = *(id *)(v41 + 24);
    v48 = v46;
    if (!v42
      || (v82.receiver = v42,
          v82.super_class = (Class)DDScannerObject,
          (v42 = (DDScannerObject *)objc_msgSendSuper2(&v82, sel_init)) == 0))
    {
LABEL_65:

      -[DDScannerList activateScanner:](v41, v42);
      v39 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v71 = *(void **)(v39 + 40);
      goto LABEL_66;
    }
    if (v47)
    {
      v73 = v45;
      v74 = v44;
      v49 = (void *)MEMORY[0x1E0C99DC8];
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localeIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsFromLocaleIdentifier:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)objc_msgSend(v52, "mutableCopy");

      objc_msgSend(v53, "setObject:forKeyedSubscript:", v47, *MEMORY[0x1E0C997E8]);
      if (v48)
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v48, *MEMORY[0x1E0C997B0]);
      v54 = (void *)MEMORY[0x1E0C99DC8];
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "localeWithLocaleIdentifier:", v55);
      v56 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();

      if (v56)
      {
        v44 = v74;
        if (!v73)
        {
          v57 = DDScannerCreateWithLocaleHint(v43, 0, v56, 0);
LABEL_59:
          v42->_scanner = (__DDScanner *)v57;
          if (v57)
          {
            v42->_type = v43;
            v42->_hasBasicType = v43 < 2;
            if (v44)
            {
              v42->_hasBasicType = 0;
              v70 = *(_QWORD *)(v57 + 200);
              if ((v70 | 2) != v70)
              {
                *(_QWORD *)(v57 + 200) = v70 | 2;
                *(_QWORD *)(v57 + 136) = 0;
              }
            }
          }
          else
          {

            v56 = (const __CFLocale *)v42;
            v42 = 0;
          }

          goto LABEL_65;
        }
      }
      else
      {
        v44 = v74;
      }
    }
    else
    {
      v56 = 0;
    }
    v57 = DDScannerCreateWithLocale(v43, 0, v56, 0);
    goto LABEL_59;
  }
  v25 = qos_class_self();
  if (v25 == qos_class_main())
  {
    v24 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v24 + 40))
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_48:
  v58 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __58__DDScanServerDispatcher_scannerConf_sync_string_runTask___block_invoke_2;
  v75[3] = &unk_1E3C94B08;
  v59 = *(id *)(a1 + 40);
  v60 = *(_QWORD *)(a1 + 64);
  v76 = v59;
  v77 = v60;
  if (v58)
  {
    v61 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v62 = v75;
    v63 = [DDScanStepBlockContainer alloc];
    v64 = v62;
    if (v63)
    {
      v82.receiver = v63;
      v82.super_class = (Class)DDScanStepBlockContainer;
      v63 = (DDScanStepBlockContainer *)objc_msgSendSuper2(&v82, sel_init);
      if (v63)
      {
        v65 = _Block_copy(v64);
        block = v63->_block;
        v63->_block = v65;

        v63->_identifier = v61;
      }
    }

    v67 = *(void **)(v58 + 48);
    if (v67)
    {
      objc_msgSend(v67, "insertObject:atIndex:", v63, 0);
    }
    else
    {
      v68 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v63, 0);
      v69 = *(void **)(v58 + 48);
      *(_QWORD *)(v58 + 48) = v68;

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

}

- (uint64_t)scannerConf:(int)a3 sync:(void *)a4 string:(void *)a5 runTask:
{
  _QWORD *v9;
  __CFString *v10;
  DDScannerServiceConfiguration *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  _QWORD *v23;
  NSObject *v24;
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  _QWORD block[5];
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  char *v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;

  v9 = a2;
  v10 = a4;
  v26 = a5;
  if (a1)
  {
    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy_;
    v65 = __Block_byref_object_dispose_;
    v66 = 0;
    if (v9)
      v11 = (DDScannerServiceConfiguration *)objc_msgSend(v9, "copy", v26);
    else
      v11 = -[DDScannerServiceConfiguration initWithScannerType:passiveIntent:]([DDScannerServiceConfiguration alloc], "initWithScannerType:passiveIntent:", 0, a3 ^ 1u, v26);
    v12 = (void *)v62[5];
    v62[5] = (uint64_t)v11;

    objc_msgSend((id)v62[5], "language");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || !-[__CFString length](v10, "length"))
    {
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("inconclusive")))
      {
        objc_msgSend((id)v62[5], "setLanguage:", 0);
      }
      else if (objc_msgSend(v13, "length"))
      {
        objc_msgSend((id)v62[5], "setLanguageHighConfidence:", 1);
        v14 = v13;
        if (_scriptForEmbeddingFromLanguage__onceToken != -1)
          dispatch_once(&_scriptForEmbeddingFromLanguage__onceToken, &__block_literal_global);
        v15 = objc_msgSend((id)_scriptForEmbeddingFromLanguage__latinLanguages, "containsObject:", v14);

        if (v15)
          v16 = 30;
        else
          v16 = 31;
        objc_msgSend((id)v62[5], "setScript:", v16);
      }
    }
    else if ((objc_msgSend(0, "isEqualToString:", CFSTR("inconclusive")) & 1) == 0)
    {
      v17 = DDComputeDominantScriptOrLanguage(v10);
      objc_msgSend((id)v62[5], "setScript:", v17);
      v18 = 0;
      v19 = 0;
      switch((int)v17)
      {
        case 1:
          v18 = CFSTR("ar");
          goto LABEL_28;
        case 2:
          v18 = CFSTR("he");
          goto LABEL_28;
        case 3:
          v18 = CFSTR("el");
          goto LABEL_28;
        case 4:
          v18 = CFSTR("th");
          goto LABEL_28;
        case 5:
          v18 = CFSTR("ko");
          goto LABEL_28;
        case 6:
          v18 = CFSTR("ja");
LABEL_28:
          v19 = 1;
          break;
        case 7:
          v19 = 0;
          v18 = CFSTR("tr");
          break;
        case 8:
        case 14:
          v19 = 0;
          v18 = CFSTR("ru");
          break;
        case 9:
        case 10:
          v19 = 0;
          v18 = CFSTR("en");
          break;
        case 11:
        case 13:
          v19 = 0;
          v18 = CFSTR("zh-Hans");
          break;
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 26:
        case 29:
          v19 = 0;
          v18 = CFSTR("hi");
          break;
        case 25:
          v19 = 0;
          v18 = CFSTR("th");
          break;
        case 28:
          v19 = 0;
          v18 = CFSTR("my");
          break;
        default:
          break;
      }
      objc_msgSend((id)v62[5], "setLanguage:", v18);
      objc_msgSend((id)v62[5], "setLanguageHighConfidence:", v19);
    }
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy_;
    v59 = __Block_byref_object_dispose_;
    v60 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy_;
    v53 = __Block_byref_object_dispose_;
    v54 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v20 = MEMORY[0x1E0C809B0];
    v21 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__DDScanServerDispatcher_scannerConf_sync_string_runTask___block_invoke;
    block[3] = &unk_1E3C94B30;
    v39 = sel_scannerConf_sync_string_runTask_;
    block[4] = a1;
    v34 = &v45;
    v35 = &v49;
    v36 = &v61;
    v40 = a3;
    v22 = v26;
    v33 = v22;
    v37 = &v41;
    v38 = &v55;
    dispatch_sync(v21, block);
    if (*((_BYTE *)v42 + 24))
      goto LABEL_39;
    if ((a3 & 1) != 0)
    {
      if (v9)
      {
        v23 = (_QWORD *)v9[3];
        if (v23)
        {
          *v23 = v46[3];
          v9[3] = 0;
        }
      }
    }
    else if (!v10 || (unint64_t)-[__CFString length](v10, "length") >= 0xA0)
    {
      v24 = *(NSObject **)(a1 + 16);
      v27[0] = v20;
      v27[1] = 3221225472;
      v27[2] = __58__DDScanServerDispatcher_scannerConf_sync_string_runTask___block_invoke_3;
      v27[3] = &unk_1E3C94B58;
      v29 = &v55;
      v30 = &v61;
      v27[4] = a1;
      v28 = v22;
      v31 = &v49;
      dispatch_async(v24, v27);

      goto LABEL_39;
    }
    (*((void (**)(id, uint64_t, uint64_t))v22 + 2))(v22, v56[5], v62[5]);
    -[DDScanServerDispatcher recycleScanner:fromList:sameQueue:](a1, (void *)v56[5], (void *)v50[5], 0);
LABEL_39:
    a1 = v46[3];

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v61, 8);

  }
  return a1;
}

- (void)recycleScanner:(void *)a3 fromList:(int)a4 sameQueue:
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void (**v13)(id, id);
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  uint64_t *v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v7 = a2;
  v8 = a3;
  if (a1 && v7)
  {
    while (1)
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x3032000000;
      v27 = __Block_byref_object_copy_;
      v28 = __Block_byref_object_dispose_;
      v29 = 0;
      v9 = *(NSObject **)(a1 + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__DDScanServerDispatcher_recycleScanner_fromList_sameQueue___block_invoke;
      block[3] = &unk_1E3C94BA8;
      block[4] = a1;
      v10 = v8;
      v21 = v10;
      v23 = &v24;
      v11 = v7;
      v22 = v11;
      dispatch_sync(v9, block);
      v12 = v25[5];
      if (!v12)
        break;
      if (!a4)
      {
        v14 = *(NSObject **)(a1 + 16);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __60__DDScanServerDispatcher_recycleScanner_fromList_sameQueue___block_invoke_2;
        v15[3] = &unk_1E3C94BA8;
        v19 = &v24;
        v16 = v11;
        v17 = a1;
        v18 = v10;
        dispatch_async(v14, v15);

        break;
      }
      v13 = (void (**)(id, id))*(id *)(v12 + 8);
      v13[2](v13, v11);

      _Block_object_dispose(&v24, 8);
    }

    _Block_object_dispose(&v24, 8);
  }

}

- (DDScanServerDispatcher)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  dispatch_source_t v13;
  void *v14;
  NSObject *v15;
  _QWORD handler[4];
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)DDScanServerDispatcher;
  v2 = -[DDScanServerDispatcher init](&v19, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.datadetectors.scanner.server", v3);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    v6 = MEMORY[0x1E0C80D50];
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_DEFAULT, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.datadetectors.scanner.work", v7);
    v9 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v8;

    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_DEFAULT, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.datadetectors.scanner.server", v10);
    v12 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v11;

    v13 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 3uLL, *((dispatch_queue_t *)v2 + 1));
    v14 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v13;

    v15 = *((_QWORD *)v2 + 4);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __30__DDScanServerDispatcher_init__block_invoke;
    handler[3] = &unk_1E3C95AC0;
    v18 = v2;
    dispatch_source_set_event_handler(v15, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 4));

  }
  return (DDScanServerDispatcher *)v2;
}

- (void)dealloc
{
  NSObject *scannerQueue;
  objc_super v4;
  _QWORD block[5];

  scannerQueue = self->_scannerQueue;
  if (scannerQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__DDScanServerDispatcher_dealloc__block_invoke;
    block[3] = &unk_1E3C95AC0;
    block[4] = self;
    dispatch_sync(scannerQueue, block);
  }
  v4.receiver = self;
  v4.super_class = (Class)DDScanServerDispatcher;
  -[DDScanServerDispatcher dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanners, 0);
  objc_storeStrong((id *)&self->_memoryWarningSource, 0);
  objc_storeStrong((id *)&self->_reportQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_scannerQueue, 0);
}

void __33__DDScanServerDispatcher_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  *(_QWORD *)(v1 + 48) = 0;

}

uintptr_t __30__DDScanServerDispatcher_init__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uintptr_t result;
  int v3;

  v1 = *(_QWORD *)(a1 + 32);
  result = dispatch_source_get_data(*(dispatch_source_t *)(v1 + 32));
  v3 = result != 1;
  if (*(unsigned __int8 *)(v1 + 40) != v3)
    *(_BYTE *)(v1 + 40) = v3;
  return result;
}

void __36__DDScanServerDispatcher_cancelJob___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    v23 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (v7)
        {
          v8 = *(_QWORD *)(a1 + 40);
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v9 = *(id *)(v7 + 64);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v29;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v29 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13);
                if (v14)
                {
                  if (*(_QWORD *)(v14 + 24) == v8)
                  {
                    *(_BYTE *)(*(_QWORD *)(v14 + 8) + 232) |= 1u;
LABEL_31:

                    goto LABEL_32;
                  }
                }
                else if (!v8)
                {
                  goto LABEL_31;
                }
                ++v13;
              }
              while (v11 != v13);
              v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
              v11 = v15;
            }
            while (v15);
          }

          v16 = objc_msgSend(*(id *)(v7 + 48), "count");
          if (v16)
          {
            v17 = v16;
            v18 = 0;
            while (1)
            {
              objc_msgSend(*(id *)(v7 + 48), "objectAtIndexedSubscript:", v18);
              v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
              v20 = v19 ? v19[2] : 0;

              if (v20 == v8)
                break;
              if (v17 == ++v18)
                goto LABEL_27;
            }
            objc_msgSend(*(id *)(v7 + 48), "objectAtIndexedSubscript:", v18);
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v21;
            if (v21)
              v21 = *(_QWORD *)(v21 + 8);
            (*(void (**)(uint64_t, _QWORD))(v21 + 16))(v21, 0);

            objc_msgSend(*(id *)(v7 + 48), "removeObjectAtIndex:", v18);
            goto LABEL_32;
          }
        }
LABEL_27:
        v5 = v23;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_32:

}

- (id)reportQueue
{
  if (a1)
    a1 = (id *)a1[3];
  return a1;
}

void __58__DDScanServerDispatcher_scannerConf_sync_string_runTask___block_invoke_3(uint64_t *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  -[DDScanServerDispatcher recycleScanner:fromList:sameQueue:](a1[4], *(void **)(*(_QWORD *)(a1[6] + 8) + 40), *(void **)(*(_QWORD *)(a1[8] + 8) + 40), 1);
}

uint64_t __60__DDScanServerDispatcher_recycleScanner_fromList_sameQueue___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v2)
    v3 = *(_QWORD *)(v2 + 8);
  else
    v3 = 0;
  (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, a1[4]);
  return -[DDScanServerDispatcher recycleScanner:fromList:sameQueue:](a1[5], a1[4], a1[6], 1);
}

uint64_t __58__DDScanServerDispatcher_scannerConf_sync_string_runTask___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __58__DDScanServerDispatcher__scriptForEmbeddingFromLanguage___block_invoke()
{
  void *v0;

  v0 = (void *)_scriptForEmbeddingFromLanguage__latinLanguages;
  _scriptForEmbeddingFromLanguage__latinLanguages = (uint64_t)&unk_1E3C9FDA8;

}

uint64_t __41__DDScanServerDispatcher_emptyIdentifier__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 64) + 1;
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

@end
