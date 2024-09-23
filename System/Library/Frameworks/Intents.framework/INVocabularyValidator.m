@implementation INVocabularyValidator

id __85___INVocabularyValidator_validatedItemsFromVocabularyStrings_ofType_loggingWarnings___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = -[_INVocabularyItem _initWithUncheckedString:vocabularyIdentifier:requiresUserIdentification:]([_INVocabularyItem alloc], "_initWithUncheckedString:vocabularyIdentifier:requiresUserIdentification:", v2, 0, 0);

  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __93___INVocabularyValidator__determineIfBundleID_appPath_canProvideVocabularyOfType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v8 = &stru_1E2295770;
    if (v6)
      v8 = v6;
    *(_DWORD *)buf = 136315394;
    v20 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]_block_invoke";
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_INFO, "%s Finished matching on-device extensions %@", buf, 0x16u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93___INVocabularyValidator__determineIfBundleID_appPath_canProvideVocabularyOfType_completion___block_invoke_84;
  block[3] = &unk_1E2291F80;
  v14 = v5;
  v18 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  v15 = v9;
  v16 = v10;
  v17 = v11;
  v12 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __93___INVocabularyValidator__determineIfBundleID_appPath_canProvideVocabularyOfType_completion___block_invoke_84(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = objc_alloc(MEMORY[0x1E0CA5870]);
    v4 = *(_QWORD *)(a1 + 40);
    v32 = 0;
    v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v32);
    v6 = v32;
    if (v6)
    {
      v7 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]_block_invoke";
        v37 = 2112;
        v38 = v6;
        _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Unable to get app record %@", buf, 0x16u);
        v7 = INSiriLogContextIntents;
      }
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_34;
      *(_DWORD *)buf = 136315138;
      v36 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]_block_invoke";
    }
    else
    {
      objc_msgSend(v5, "supportedIntents");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      obj = *(id *)(a1 + 56);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v29;
        v22 = v9;
        while (1)
        {
          v13 = 0;
LABEL_13:
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v15 = v5;
          objc_msgSend(v5, "supportedIntents");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          if (!v17)
            break;
          v18 = v17;
          v19 = *(_QWORD *)v25;
LABEL_17:
          v20 = 0;
          while (1)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v16);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v20), "isEqualToString:", v14) & 1) != 0)
              break;
            if (v18 == ++v20)
            {
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
              if (v18)
                goto LABEL_17;
              goto LABEL_30;
            }
          }

          ++v13;
          v5 = v15;
          if (v13 != v11)
            goto LABEL_13;
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          v9 = v22;
          v6 = 0;
          if (!v11)
            goto LABEL_26;
        }
LABEL_30:

        v5 = v15;
        v6 = 0;
      }
      else
      {
LABEL_26:

        if (v9)
        {
          v21 = INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v36 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]_block_invoke";
            _os_log_impl(&dword_18BEBC000, v21, OS_LOG_TYPE_INFO, "%s Can provide vocabulary per on-device-app support because app supports this", buf, 0xCu);
          }
          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          goto LABEL_35;
        }
      }
      v7 = INSiriLogContextIntents;
      if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
LABEL_34:
        objc_msgSend(*(id *)(a1 + 48), "_confirmExistenceOfWatchAppForCompanionBundleID:handlingIntents:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
LABEL_35:

        return;
      }
      *(_DWORD *)buf = 136315138;
      v36 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]_block_invoke";
    }
    _os_log_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_INFO, "%s No on-device-app support found, searching for eligible watch apps", buf, 0xCu);
    goto LABEL_34;
  }
  v2 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]_block_invoke";
    _os_log_impl(&dword_18BEBC000, v2, OS_LOG_TYPE_INFO, "%s Can provide vocabulary per on-device-app support", buf, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __101___INVocabularyValidator__confirmExistenceOfWatchAppForCompanionBundleID_handlingIntents_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[_INVocabularyValidator _confirmExistenceOfWatchAppForCompanionBundleID:handlingIntents:completion:]_block_invoke";
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Error retrieving installed watch applications: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __101___INVocabularyValidator__confirmExistenceOfWatchAppForCompanionBundleID_handlingIntents_completion___block_invoke_75;
    v9[3] = &unk_1E228E7A8;
    v11 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "fetchApplicationOnPairedDevice:withBundleID:completion:", 0, v5, v9);

  }
}

void __101___INVocabularyValidator__confirmExistenceOfWatchAppForCompanionBundleID_handlingIntents_completion___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "intentsSupported");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", *(_QWORD *)(a1 + 32));
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v8);
      if (objc_msgSend(v9, "intersectsSet:", v10))
      {
        v11 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          v13 = 136315138;
          v14 = "-[_INVocabularyValidator _confirmExistenceOfWatchAppForCompanionBundleID:handlingIntents:completion:]_block_invoke";
          _os_log_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_INFO, "%s Watch app that handles the required intents found.", (uint8_t *)&v13, 0xCu);
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_14:
        goto LABEL_15;
      }

    }
    v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v13 = 136315138;
      v14 = "-[_INVocabularyValidator _confirmExistenceOfWatchAppForCompanionBundleID:handlingIntents:completion:]_block_invoke";
      _os_log_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_INFO, "%s No Watch app that handles the required intents was found.", (uint8_t *)&v13, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  v7 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v13 = 136315394;
    v14 = "-[_INVocabularyValidator _confirmExistenceOfWatchAppForCompanionBundleID:handlingIntents:completion:]_block_invoke";
    v15 = 2114;
    v16 = v6;
    _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Error retrieving installed watch applications: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_15:

}

id __88___INVocabularyValidator_validatedItemsFromVocabularySpeakables_ofType_loggingWarnings___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  _INVocabularyItem *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v2, "spokenPhrases", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v10 = [_INVocabularyItem alloc];
          objc_msgSend(v2, "vocabularyIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[_INVocabularyItem _initWithUncheckedString:vocabularyIdentifier:requiresUserIdentification:](v10, "_initWithUncheckedString:vocabularyIdentifier:requiresUserIdentification:", v9, v11, 0);
          objc_msgSend(v3, "addObject:", v12);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v6);
    }
  }
  else
  {
    v4 = -[_INVocabularyItem _initWithUncheckedSpeakable:]([_INVocabularyItem alloc], "_initWithUncheckedSpeakable:", v2);
    v18 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

void __54___INVocabularyValidator__intentsUsingVocabularyType___block_invoke()
{
  objc_class *v0;
  void *v1;
  objc_class *v2;
  void *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  objc_class *v52;
  void *v53;
  objc_class *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  objc_class *v58;
  void *v59;
  objc_class *v60;
  void *v61;
  objc_class *v62;
  void *v63;
  objc_class *v64;
  void *v65;
  void *v66;
  objc_class *v67;
  void *v68;
  objc_class *v69;
  void *v70;
  objc_class *v71;
  void *v72;
  objc_class *v73;
  void *v74;
  void *v75;
  objc_class *v76;
  void *v77;
  objc_class *v78;
  void *v79;
  objc_class *v80;
  void *v81;
  void *v82;
  objc_class *v83;
  void *v84;
  objc_class *v85;
  void *v86;
  void *v87;
  objc_class *v88;
  void *v89;
  objc_class *v90;
  void *v91;
  objc_class *v92;
  void *v93;
  objc_class *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  _QWORD v106[18];
  _QWORD v107[18];
  _QWORD v108[4];
  _QWORD v109[2];
  _QWORD v110[3];
  _QWORD v111[4];
  _QWORD v112[4];
  _QWORD v113[10];
  _QWORD v114[2];
  _QWORD v115[4];
  _QWORD v116[12];
  _QWORD v117[4];

  v117[2] = *MEMORY[0x1E0C80C00];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v102;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v100;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v116[2] = v7;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v116[3] = v9;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v116[4] = v11;
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v116[5] = v13;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v116[6] = v15;
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v116[7] = v17;
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v116[8] = v19;
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v116[9] = v21;
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v116[10] = v23;
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v116[11] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 12);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v27;
  v28 = (objc_class *)objc_opt_class();
  NSStringFromClass(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v29;
  v30 = (objc_class *)objc_opt_class();
  NSStringFromClass(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v115[2] = v31;
  v32 = (objc_class *)objc_opt_class();
  NSStringFromClass(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v115[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 4);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (objc_class *)objc_opt_class();
  NSStringFromClass(v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v35;
  v36 = (objc_class *)objc_opt_class();
  NSStringFromClass(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v114[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 2);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (objc_class *)objc_opt_class();
  NSStringFromClass(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v39;
  v40 = (objc_class *)objc_opt_class();
  NSStringFromClass(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = v41;
  v42 = (objc_class *)objc_opt_class();
  NSStringFromClass(v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v43;
  v44 = (objc_class *)objc_opt_class();
  NSStringFromClass(v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v113[3] = v45;
  v46 = (objc_class *)objc_opt_class();
  NSStringFromClass(v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v113[4] = v47;
  v48 = (objc_class *)objc_opt_class();
  NSStringFromClass(v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v113[5] = v49;
  v50 = (objc_class *)objc_opt_class();
  NSStringFromClass(v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v113[6] = v51;
  v52 = (objc_class *)objc_opt_class();
  NSStringFromClass(v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v113[7] = v53;
  v54 = (objc_class *)objc_opt_class();
  NSStringFromClass(v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v113[8] = v55;
  v56 = (objc_class *)objc_opt_class();
  NSStringFromClass(v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v113[9] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 10);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (objc_class *)objc_opt_class();
  NSStringFromClass(v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v59;
  v60 = (objc_class *)objc_opt_class();
  NSStringFromClass(v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v112[1] = v61;
  v62 = (objc_class *)objc_opt_class();
  NSStringFromClass(v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v112[2] = v63;
  v64 = (objc_class *)objc_opt_class();
  NSStringFromClass(v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v112[3] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 4);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = (objc_class *)objc_opt_class();
  NSStringFromClass(v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = v68;
  v69 = (objc_class *)objc_opt_class();
  NSStringFromClass(v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v111[1] = v70;
  v71 = (objc_class *)objc_opt_class();
  NSStringFromClass(v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v111[2] = v72;
  v73 = (objc_class *)objc_opt_class();
  NSStringFromClass(v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v111[3] = v74;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 4);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = (objc_class *)objc_opt_class();
  NSStringFromClass(v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v77;
  v78 = (objc_class *)objc_opt_class();
  NSStringFromClass(v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v79;
  v80 = (objc_class *)objc_opt_class();
  NSStringFromClass(v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v110[2] = v81;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 3);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = (objc_class *)objc_opt_class();
  NSStringFromClass(v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v84;
  v85 = (objc_class *)objc_opt_class();
  NSStringFromClass(v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v86;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = (objc_class *)objc_opt_class();
  NSStringFromClass(v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v89;
  v90 = (objc_class *)objc_opt_class();
  NSStringFromClass(v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v108[1] = v91;
  v92 = (objc_class *)objc_opt_class();
  NSStringFromClass(v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v108[2] = v93;
  v94 = (objc_class *)objc_opt_class();
  NSStringFromClass(v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v108[3] = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 4);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  v106[0] = &unk_1E23E9B08;
  v106[1] = &unk_1E23E9B20;
  v107[0] = v105;
  v107[1] = v105;
  v106[2] = &unk_1E23E9B38;
  v106[3] = &unk_1E23E9B50;
  v107[2] = v105;
  v107[3] = v104;
  v106[4] = &unk_1E23E9B68;
  v106[5] = &unk_1E23E9B80;
  v107[4] = v104;
  v107[5] = v103;
  v106[6] = &unk_1E23E9B98;
  v106[7] = &unk_1E23E9BB0;
  v107[6] = v101;
  v107[7] = v99;
  v106[8] = &unk_1E23E9BC8;
  v106[9] = &unk_1E23E9BE0;
  v107[8] = v66;
  v107[9] = v75;
  v106[10] = &unk_1E23E9BF8;
  v106[11] = &unk_1E23E9C10;
  v107[10] = v82;
  v107[11] = v87;
  v106[12] = &unk_1E23E9C28;
  v106[13] = &unk_1E23E9C40;
  v107[12] = v96;
  v107[13] = v96;
  v106[14] = &unk_1E23E9C58;
  v106[15] = &unk_1E23E9C70;
  v107[14] = v96;
  v107[15] = v96;
  v106[16] = &unk_1E23E9C88;
  v106[17] = &unk_1E23E9CA0;
  v107[16] = v96;
  v107[17] = v96;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 18);
  v97 = objc_claimAutoreleasedReturnValue();
  v98 = (void *)_intentsUsingVocabularyType__sIntentsUsingSyncSlot;
  _intentsUsingVocabularyType__sIntentsUsingSyncSlot = v97;

}

@end
