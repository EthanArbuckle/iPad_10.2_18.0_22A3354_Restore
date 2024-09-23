@implementation KSUserWordsSynchroniser

void __42___KSUserWordsSynchroniser_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_synchroniser;
  sharedInstance_synchroniser = (uint64_t)v1;

}

void __68___KSUserWordsSynchroniser_initForTestingWithManager_enablePushing___block_invoke(uint64_t a1)
{
  _KSSystemTask *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v2 = [_KSSystemTask alloc];
  _KSGetSetting(ksDefaultPushTime, &unk_24E20FCD8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68___KSUserWordsSynchroniser_initForTestingWithManager_enablePushing___block_invoke_42;
  v9[3] = &unk_24E205C10;
  v10 = *(id *)(a1 + 32);
  v5 = -[_KSSystemTask initWithName:isPeriodic:period:handler:](v2, "initWithName:isPeriodic:period:handler:", CFSTR("com.apple.keyboardServices.userWords.pusher"), 1, v4, v9);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
  {
    +[_KSTaskScheduler sharedInstance](_KSTaskScheduler, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerTask:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

  }
}

void __68___KSUserWordsSynchroniser_initForTestingWithManager_enablePushing___block_invoke_42(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(void);

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "checkForDownload:uploads:allLanguages:", 0, 0, 0);
  v3[2]();

}

void __45___KSUserWordsSynchroniser_accountDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  if (*(_BYTE *)(a1 + 48))
  {
    KSCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_4(a1, v2);

    objc_msgSend(*(id *)(a1 + 32), "disable");
  }
  if (*(_QWORD *)(a1 + 40) == 1)
  {
    if (*(_BYTE *)(a1 + 49))
    {
      if (*(_BYTE *)(a1 + 50))
      {
        objc_msgSend(*(id *)(a1 + 32), "checkConfiguration");
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
        {
          if (*(_BYTE *)(a1 + 48))
          {
            +[_KSTaskScheduler sharedInstance](_KSTaskScheduler, "sharedInstance");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "registerTask:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

          }
        }
        return;
      }
      KSCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_2(v4, v19, v20, v21, v22, v23, v24, v25);
    }
    else
    {
      KSCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_1(v4, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  else
  {
    KSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_3(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "checkIfExists"))
    objc_msgSend(*(id *)(a1 + 32), "disable");
}

void __48___KSUserWordsSynchroniser_identitiesDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48___KSUserWordsSynchroniser_identitiesDidChange___block_invoke_2;
  v7[3] = &unk_24E204BB8;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __48___KSUserWordsSynchroniser_identitiesDidChange___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __48___KSUserWordsSynchroniser_identitiesDidChange___block_invoke_2_cold_1(a1, v2, v3);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 58) = 1;
  objc_msgSend(*(id *)(a1 + 32), "checkConfiguration");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_3;
  v6[3] = &unk_24E205E50;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "modifyInformationWithOperations:", v6);

}

uint64_t __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("Languages"));
  return 1;
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_4(id *a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;

  v2 = a1[4];
  v3 = a1[5];
  if ((objc_msgSend(*((id *)a1[6] + 3), "checkIfExists") & 1) != 0)
  {
    if (!v3)
    {
      objc_msgSend(a1[6], "information");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("Languages"));
      v3 = (id)objc_claimAutoreleasedReturnValue();

      if (!v2)
      {
        v3 = v3;
        v2 = v3;
      }
    }
    objc_msgSend(a1[6], "checkProgress:withInfo:", 0, MEMORY[0x24BDBD1C8]);
    if (objc_msgSend(a1[7], "count"))
    {
      v5 = 0;
    }
    else
    {
      (*((void (**)(void))a1[8] + 2))();
      v5 = 1;
    }
    v6 = objc_msgSend((id)objc_opt_class(), "infoClass");
    v7 = a1[6];
    v8 = a1[7];
    v9 = v2;
    v10 = v8;
    v11 = v10;
    v12 = v10;
    if (v9 && (v12 = v9, v10))
    {
      objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v12;
    }
    v14 = v13;

    objc_msgSend(v7, "generateRecordListForLanguages:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = a1[6];
    objc_msgSend(v15, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_KSUserWordsInfo keyNamesExcludingData](_KSUserWordsInfo, "keyNamesExcludingData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_5;
    v22[3] = &unk_24E205F40;
    v19 = a1[6];
    v20 = a1[7];
    v23 = v15;
    v24 = v19;
    v22[1] = 3221225472;
    v29 = v6;
    v25 = v20;
    v2 = v9;
    v26 = v2;
    v30 = v5;
    v28 = a1[8];
    v3 = v3;
    v27 = v3;
    v21 = v15;
    objc_msgSend(v16, "readFilesWithRecordIDs:forColumns:priority:withCompletionHandler:", v17, v18, v5, v22);

  }
  else
  {
    objc_msgSend(a1[6], "checkProgress:withInfo:", 0, MEMORY[0x24BDBD1C0]);
  }

}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  const __CFString **v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD block[4];
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[2];
  _QWORD v98[2];
  _BYTE v99[128];
  const __CFString *v100;
  void *v101;
  _QWORD v102[2];
  _QWORD v103[2];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    KSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_5_cold_1();

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v92 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
    }
    while (v11);
  }

  v15 = *(void **)(a1 + 40);
  v67 = v8;
  v68 = v6;
  if (v6)
  {
    v102[0] = CFSTR("Error");
    v102[1] = CFSTR("Languages");
    v103[0] = v6;
    v103[1] = v8;
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = (void **)v103;
    v18 = (const __CFString **)v102;
    v19 = 2;
  }
  else
  {
    v100 = CFSTR("Languages");
    v101 = v8;
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = &v101;
    v18 = &v100;
    v19 = 1;
  }
  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "checkProgress:withInfo:", 1, v20);

  v21 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v23;
  objc_msgSend(v23, "removeObjectsInArray:", v24);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v25 = v9;
  v75 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
  if (v75)
  {
    v73 = v25;
    v74 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v75; ++j)
      {
        if (*(_QWORD *)v88 != v74)
          objc_enumerationMutation(v25);
        v27 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
        v28 = *(void **)(a1 + 80);
        objc_msgSend(v25, "objectForKeyedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "infoWithRecord:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = *(void **)(a1 + 80);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "filesForLanguage:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 80), "infoWithFiles:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v33)
          v36 = v34 == 0;
        else
          v36 = 1;
        if (!v36)
        {
          if (objc_msgSend(v34, "isBetterThan:", v30))
          {
            v44 = *(void **)(a1 + 56);
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v27);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v44) = objc_msgSend(v44, "containsObject:", v45);

            if ((_DWORD)v44)
            {
              objc_msgSend(v70, "addObject:", v27);
              objc_msgSend(v71, "setObject:forKey:", v35, v70);
              objc_msgSend(v69, "setObject:forKey:", v33, v70);
              v46 = CFSTR("Ours is better");
LABEL_38:
              -[__CFString stringByAppendingFormat:](v46, "stringByAppendingFormat:", CFSTR(" (ours = %@; theirs = %@)"),
                v35,
                v30);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              v52 = *(void **)(a1 + 40);
              v95[0] = CFSTR("RecordID");
              objc_msgSend(v27, "recordName");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v96[0] = v53;
              v95[1] = CFSTR("Language");
              objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v27);
              v54 = objc_claimAutoreleasedReturnValue();
              v55 = (void *)v54;
              v56 = CFSTR("LANGUAGE MISSING");
              if (v54)
                v56 = (const __CFString *)v54;
              v95[2] = CFSTR("Disposition");
              v96[1] = v56;
              v96[2] = v51;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v96, v95, 3);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "checkProgress:withInfo:", 2, v57);

              v25 = v73;
              goto LABEL_41;
            }
            v49 = CFSTR("Ours is better");
            v50 = CFSTR(" [upload disabled]");
          }
          else
          {
            v46 = CFSTR("Equal!");
            if (!objc_msgSend(v30, "isBetterThan:", v35))
              goto LABEL_38;
            v47 = *(void **)(a1 + 48);
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v27);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v47) = objc_msgSend(v47, "containsObject:", v48);

            if ((_DWORD)v47)
            {
              objc_msgSend(v72, "addObject:", v27);
              objc_msgSend(v71, "setObject:forKey:", v35, v72);
              v46 = CFSTR("Server is better");
              goto LABEL_38;
            }
            v49 = CFSTR("Server is better");
            v50 = CFSTR(" [download disabled]");
          }
          -[__CFString stringByAppendingString:](v49, "stringByAppendingString:", v50);
          v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_38;
        }
        v97[0] = CFSTR("Language");
        v37 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v27);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v38;
        v40 = CFSTR("LANGUAGE MISSING");
        if (v38)
          v40 = (const __CFString *)v38;
        v97[1] = CFSTR("Disposition");
        v98[0] = v40;
        v98[1] = CFSTR("No local copy");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "checkProgress:withInfo:", 2, v41);

        v42 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v27);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v42) = objc_msgSend(v42, "containsObject:", v43);

        if ((_DWORD)v42)
          objc_msgSend(v72, "addObject:", v27);
LABEL_41:

      }
      v75 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
    }
    while (v75);
  }

  v58 = *(void **)(a1 + 32);
  v59 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_101;
  block[3] = &unk_24E205F18;
  v85 = *(_QWORD *)(a1 + 80);
  block[1] = 3221225472;
  v77 = v70;
  v78 = v71;
  v79 = v69;
  v60 = v58;
  v61 = *(_QWORD *)(a1 + 40);
  v80 = v60;
  v81 = v61;
  v62 = *(_QWORD *)(a1 + 88);
  v82 = v72;
  v86 = v62;
  v84 = *(id *)(a1 + 72);
  v83 = *(id *)(a1 + 64);
  v63 = v72;
  v64 = v69;
  v65 = v71;
  v66 = v70;
  dispatch_async(v59, block);

}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_101(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  NSObject *group;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  _QWORD block[5];
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  _QWORD v61[4];
  id v62;
  NSObject *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  void *v68;
  _QWORD v69[2];
  _QWORD v70[2];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  group = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = *(id *)(a1 + 32);
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
  if (!v48)
    goto LABEL_22;
  v2 = 0x24BDB9000uLL;
  v47 = *(_QWORD *)v65;
  do
  {
    v3 = 0;
    do
    {
      if (*(_QWORD *)v65 != v47)
        objc_enumerationMutation(obj);
      v4 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v3);
      v5 = objc_msgSend(objc_alloc(*(Class *)(v2 + 472)), "initWithRecordType:recordID:", CFSTR("UserWordFile"), v4);
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        if (v6)
          goto LABEL_8;
      }
      else
      {
        v20 = *(void **)(a1 + 96);
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v4);
        v21 = v5;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "filesForLanguage:", v22);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v21;
        if (v6)
          goto LABEL_8;
      }
      objc_msgSend(*(id *)(a1 + 96), "infoWithFiles:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      if (v7)
        v8 = v6 == 0;
      else
        v8 = 1;
      if (v8)
      {
        v69[0] = CFSTR("Language");
        v9 = (void *)v5;
        v10 = *(void **)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v4);
        v11 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v11;
        if (v11)
          v12 = (const __CFString *)v11;
        else
          v12 = CFSTR("LANGUAGE MISSING");
        v69[1] = CFSTR("Disposition");
        v70[0] = v12;
        v70[1] = CFSTR("No local copy for initial push");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v10;
        v18 = v9;
        objc_msgSend(v13, "checkProgress:withInfo:", 2, v19);
      }
      else
      {
        objc_msgSend(v7, "serialiseToTemporaryFile");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "saveToRecord:", v5);
        v15 = (void *)v5;
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9010]), "initWithFileURL:", v14);
        objc_msgSend(*(id *)(a1 + 96), "keyForData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v17);

        v2 = 0x24BDB9000;
        v18 = v15;
        objc_msgSend(v45, "addObject:", v15);
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v19);
      }

      ++v3;
    }
    while (v48 != v3);
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    v48 = v23;
  }
  while (v23);
LABEL_22:

  v24 = objc_msgSend(v45, "count");
  v25 = MEMORY[0x24BDAC760];
  if (v24)
  {
    v26 = group;
    dispatch_group_enter(group);
    objc_msgSend(*(id *)(a1 + 64), "checkProgress:withInfo:", 3, v44);
    v27 = *(void **)(a1 + 64);
    v61[0] = v25;
    v61[1] = 3221225472;
    v61[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2_106;
    v61[3] = &unk_24E205EA0;
    v28 = v43;
    v62 = v43;
    v63 = group;
    objc_msgSend(v27, "overwriteFilesWithRecords:withCompletionHandler:", v45, v61);

  }
  else
  {
    v28 = v43;
    objc_msgSend(v43, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("push"));
    v26 = group;
  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    dispatch_group_enter(v26);
    v29 = *(void **)(a1 + 64);
    v30 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 96), "keyForData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(a1 + 104);
    v51[0] = v25;
    v51[1] = 3221225472;
    v51[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_110;
    v51[3] = &unk_24E205EF0;
    v34 = *(id *)(a1 + 56);
    v35 = *(_QWORD *)(a1 + 96);
    v52 = v34;
    v60 = v35;
    v53 = *(id *)(a1 + 40);
    v36 = *(id *)(a1 + 48);
    v37 = *(_QWORD *)(a1 + 64);
    v54 = v36;
    v55 = v37;
    v56 = v43;
    v59 = *(id *)(a1 + 88);
    v57 = *(id *)(a1 + 80);
    v58 = v26;
    v38 = v29;
    v28 = v43;
    objc_msgSend(v38, "readFilesWithRecordIDs:forColumns:priority:withCompletionHandler:", v30, v32, v33, v51);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("pull"));
  }
  v39 = *(_QWORD *)(a1 + 64);
  v40 = *(NSObject **)(v39 + 8);
  block[0] = v25;
  block[1] = 3221225472;
  block[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_3_118;
  block[3] = &unk_24E205838;
  block[4] = v39;
  v50 = v28;
  v41 = v28;
  dispatch_group_notify(v26, v40, block);

}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2_106(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("push"));
  if (v4)
  {
    KSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2_106_cold_1();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_110(id *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  __int128 v31;
  id v32;
  void *v33;
  id obj;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _QWORD block[5];
  id v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[4];
  uint64_t v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v32 = a3;
  if (v32)
  {
    KSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_110_cold_2();

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v44 = 0u;
  v43 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v44;
    *(_QWORD *)&v8 = 136316162;
    v31 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(a1[4], "objectForKeyedSubscript:", v11, v31);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (!v13)
        {
          objc_msgSend(obj, "objectForKeyedSubscript:", v11);
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(a1[12], "keyForData");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
            v16 = objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              -[NSObject fileURL](v16, "fileURL");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              +[_KSFileEntry entryWithSerialisedDataAtURL:](_KSFileEntry, "entryWithSerialisedDataAtURL:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                objc_msgSend(a1[5], "objectForKey:", v11);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19)
                  goto LABEL_18;
                objc_msgSend(a1[6], "objectForKey:", v11);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v20)
                {
                  v21 = a1[12];
                  objc_msgSend(a1[4], "objectForKeyedSubscript:", v11);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "filesForLanguage:", v22);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                }
                objc_msgSend(a1[12], "infoWithFiles:", v20);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19)
                {
LABEL_18:
                  objc_msgSend(a1[12], "infoWithFiles:", v18);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = v23;
                  if (!v23 || (objc_msgSend(v23, "isBetterThan:", v19) & 1) != 0)
                  {

                    goto LABEL_21;
                  }
                  KSCategory();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                    __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_110_cold_1(v47, &v48, v28);

                }
                else
                {
LABEL_21:
                  block[0] = MEMORY[0x24BDAC760];
                  block[1] = 3221225472;
                  block[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_112;
                  block[3] = &unk_24E205EC8;
                  block[4] = a1[7];
                  v40 = a1[4];
                  v41 = v11;
                  v42 = v18;
                  dispatch_async(MEMORY[0x24BDAC9B8], block);
                  objc_msgSend(a1[4], "objectForKeyedSubscript:", v11);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "addObject:", v25);

                }
              }
            }
            else
            {
              KSCategory();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(a1[4], "objectForKeyedSubscript:", v11);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v50 = "-[_KSUserWordsSynchroniser checkForDownload:uploads:allLanguages:]_block_invoke";
                v51 = 2112;
                v52 = v11;
                v53 = 2112;
                v54 = v29;
                _os_log_error_impl(&dword_21DFEB000, v27, OS_LOG_TYPE_ERROR, "%s  No CKAsset associated with record (%@/%@)", buf, 0x20u);

              }
            }
          }
          else
          {
            KSCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(a1[4], "objectForKeyedSubscript:", v11);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v50 = "-[_KSUserWordsSynchroniser checkForDownload:uploads:allLanguages:]_block_invoke";
              v51 = 2112;
              v52 = v11;
              v53 = 2112;
              v54 = v26;
              _os_log_error_impl(&dword_21DFEB000, v16, OS_LOG_TYPE_ERROR, "%s  Results inconsistency error - no record for %@ (%@)", buf, 0x20u);

            }
          }

          goto LABEL_34;
        }
        KSCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[_KSUserWordsSynchroniser checkForDownload:uploads:allLanguages:]_block_invoke";
          v51 = 2112;
          v52 = v11;
          _os_log_error_impl(&dword_21DFEB000, v14, OS_LOG_TYPE_ERROR, "%s  Unexpected result - record ID %@ not in request map", buf, 0x16u);
        }
LABEL_34:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v7);
  }

  objc_msgSend(a1[7], "checkProgress:withInfo:", 4, v33);
  objc_msgSend(a1[8], "setObject:forKeyedSubscript:", v33, CFSTR("pull"));
  v30 = *((_QWORD *)a1[7] + 1);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2_115;
  v35[3] = &unk_24E204A00;
  v38 = a1[11];
  v36 = a1[9];
  v37 = a1[10];
  dispatch_async(v30, v35);

}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_112(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("_KSUserWordsWereDownloadedLanguageKey");
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("_KSUserWordsWereDownloadedFilesKey");
  v7[0] = v4;
  v7[1] = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("_KSUserWordsWereDownloadedNotification"), v3, v5);

}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2_115(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_3_118(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkProgress:withInfo:", 5, *(_QWORD *)(a1 + 40));
}

void __40___KSUserWordsSynchroniser_keyboardUsed__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, void *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "checkIfExists"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__6;
    v17 = __Block_byref_object_dispose__6;
    v18 = 0;
    v3 = *(void **)(a1 + 32);
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __40___KSUserWordsSynchroniser_keyboardUsed__block_invoke_121;
    v10 = &unk_24E205F90;
    v4 = v2;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v3, "modifyInformationWithOperations:", &v7);
    if (v14[5])
    {
      KSCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = v14[5];
        *(_DWORD *)buf = 136315394;
        v20 = "-[_KSUserWordsSynchroniser keyboardUsed]_block_invoke";
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_21DFEB000, v5, OS_LOG_TYPE_INFO, "%s  Re-setting languages for massive inactivity: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "checkForDownload:uploads:allLanguages:", v14[5], v14[5], v14[5], v7, v8, v9, v10);
    }

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __40___KSUserWordsSynchroniser_keyboardUsed__block_invoke_121(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  float v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("LastUsed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", v5);
    v7 = v6;
    _KSGetSetting(ksDefaultPullTime, &unk_24E20FCF0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

    if (v7 > v10)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("Languages"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      objc_msgSend(v4, "removeObjectForKey:", CFSTR("Languages"));
    }
  }
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("LastUsed"));

  return 1;
}

void __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24E204CA8;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  *(_BYTE *)(a1[4] + 56) = 0;
  *(_BYTE *)(a1[4] + 58) = 0;
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[5]);
}

void __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  KSCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_3_cold_1(a2, (uint64_t)v5, v6);

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_124;
  v10[3] = &unk_24E204BB8;
  v10[4] = v7;
  v11 = v8;
  dispatch_async(v9, v10);

}

void __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_124(uint64_t a1)
{
  int64_t v2;
  dispatch_time_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 58))
    v2 = 10000000000;
  else
    v2 = 3600000000000;
  v3 = dispatch_time(0, v2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_2_125;
  v7[3] = &unk_24E204BB8;
  v7[4] = v4;
  v8 = v5;
  dispatch_after(v3, v6, v7);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 58) = 0;

}

uint64_t __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_2_125(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 57))
  {
    *(_BYTE *)(v1 + 57) = 0;
    return objc_msgSend(*(id *)(result + 32), "generateKeyWithCompletionHandler:", *(_QWORD *)(result + 40));
  }
  return result;
}

void __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_3_127(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void (*v9)(void);
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  KSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[_KSUserWordsSynchroniser generateKeyWithCompletionHandler:]_block_invoke_3";
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_21DFEB000, v4, OS_LOG_TYPE_INFO, "%s  Key save state: %@", buf, 0x16u);
  }

  if (!v3)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_10:
    v9();
    goto LABEL_19;
  }
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDB8EA8];
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB8EA8]))
  {
    v7 = objc_msgSend(v3, "code");

    if (v7 == 5006)
    {
      KSCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[_KSUserWordsSynchroniser generateKeyWithCompletionHandler:]_block_invoke";
        _os_log_impl(&dword_21DFEB000, v8, OS_LOG_TYPE_INFO, "%s  Account not supported", buf, 0xCu);
      }

      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      goto LABEL_10;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", v6))
  {

    goto LABEL_18;
  }
  v11 = objc_msgSend(v3, "code");

  if (v11 != 14)
  {
LABEL_18:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_19;
  }
  KSCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[_KSUserWordsSynchroniser generateKeyWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_21DFEB000, v12, OS_LOG_TYPE_INFO, "%s  Record changed - key exists. Loading from server...", buf, 0xCu);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_128;
  v14[3] = &unk_24E206008;
  v13 = *(void **)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  objc_msgSend(v13, "loadKeyWithCompletion:", v14);

LABEL_19:
}

void __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  KSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[_KSUserWordsSynchroniser generateKeyWithCompletionHandler:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_21DFEB000, v7, OS_LOG_TYPE_INFO, "%s  Key load state: %@", (uint8_t *)&v8, 0x16u);
  }

  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __46___KSUserWordsSynchroniser_checkConfiguration__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "firstTimeDownloadWithKey:", a2);
  return result;
}

void __46___KSUserWordsSynchroniser_checkConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46___KSUserWordsSynchroniser_checkConfiguration__block_invoke_3;
    v6[3] = &unk_24E205E50;
    v7 = v3;
    objc_msgSend(v5, "modifyInformationWithOperations:", v6);

  }
}

uint64_t __46___KSUserWordsSynchroniser_checkConfiguration__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("Key"));
  return a2;
}

void __53___KSUserWordsSynchroniser_firstTimeDownloadWithKey___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53___KSUserWordsSynchroniser_firstTimeDownloadWithKey___block_invoke_2;
  v3[3] = &unk_24E205E50;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "modifyInformationWithOperations:", v3);
  objc_msgSend(*(id *)(a1 + 32), "checkForDownload:uploads:allLanguages:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

}

uint64_t __53___KSUserWordsSynchroniser_firstTimeDownloadWithKey___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    KSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53___KSUserWordsSynchroniser_firstTimeDownloadWithKey___block_invoke_2_cold_1(a1, v6, v7);

  }
  else
  {
    objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("Key"));
  }

  return a2 ^ 1u;
}

void __54___KSUserWordsSynchroniser_deltaDownloadForLanguages___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "checkIfExists"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", *(_QWORD *)(a1 + 40));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "information");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("Languages"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "minusSet:", v4);

    }
    if (objc_msgSend(v7, "count"))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v7, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "checkForDownload:uploads:allLanguages:", v6, 0, *(_QWORD *)(a1 + 40));

    }
  }
}

void __59___KSUserWordsSynchroniser_generateRecordListForLanguages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    KSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[_KSUserWordsSynchroniser generateRecordListForLanguages:]_block_invoke_2";
      v18 = 2112;
      v19 = v5;
      v8 = "%s  Failed to load remote key, error: %@";
      v9 = v7;
      v10 = 22;
LABEL_7:
      _os_log_impl(&dword_21DFEB000, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
    }
  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "isEqualToData:", v6);
    KSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[_KSUserWordsSynchroniser generateRecordListForLanguages:]_block_invoke";
        v8 = "%s  Local key is up to date";
        v9 = v7;
        v10 = 12;
        goto LABEL_7;
      }
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[_KSUserWordsSynchroniser generateRecordListForLanguages:]_block_invoke";
        _os_log_impl(&dword_21DFEB000, v7, OS_LOG_TYPE_INFO, "%s  Local key is outdated; replacing it with the current remote key",
          buf,
          0xCu);
      }

      v13 = *(void **)(a1 + 40);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __59___KSUserWordsSynchroniser_generateRecordListForLanguages___block_invoke_133;
      v14[3] = &unk_24E205E50;
      v15 = v6;
      objc_msgSend(v13, "modifyInformationWithOperations:", v14);
      v7 = v15;
    }
  }

}

uint64_t __59___KSUserWordsSynchroniser_generateRecordListForLanguages___block_invoke_133(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("Key"));
  return a2;
}

void __40___KSUserWordsSynchroniser_checkErrors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  v3 = a2;
  if (v3)
  {
    KSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __40___KSUserWordsSynchroniser_checkErrors___block_invoke_cold_1(a1, (uint64_t)v3, v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "reset");
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40___KSUserWordsSynchroniser_checkErrors___block_invoke_2;
    block[3] = &unk_24E204790;
    block[4] = v5;
    dispatch_async(v6, block);
  }

}

uint64_t __40___KSUserWordsSynchroniser_checkErrors___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 0;
  objc_msgSend(*(id *)(a1 + 32), "modifyInformationWithOperations:", &__block_literal_global_139);
  return objc_msgSend(*(id *)(a1 + 32), "checkConfiguration");
}

uint64_t __40___KSUserWordsSynchroniser_checkErrors___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "removeObjectForKey:", CFSTR("Key"));
  return a2;
}

void __93___KSUserWordsSynchroniser_readFilesWithRecordIDs_forColumns_priority_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "checkErrors:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __76___KSUserWordsSynchroniser_overwriteFilesWithRecords_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v5 = a4;
  v6 = v5;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "checkErrors:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __50___KSUserWordsSynchroniser_loadKeyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "checkErrors:", v5);
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB8EA8]))
    goto LABEL_6;
  v7 = objc_msgSend(v5, "code");

  if (v7 == 2)
  {
    objc_msgSend(v5, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDB8EE8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v10;
LABEL_6:

  }
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v15, "objectForKey:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encryptedValueStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("keybytes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v14);

}

void __51___KSUserWordsSynchroniser_saveKey_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "checkErrors:", v8);
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDB8EA8]))
    goto LABEL_6;
  v10 = objc_msgSend(v8, "code");

  if (v10 == 2)
  {
    objc_msgSend(v8, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDB8EE8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v13;
LABEL_6:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __64___KSUserWordsSynchroniser_dumpAllRecordsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "recordType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

  }
  objc_msgSend(v6, "addObject:", v9);

}

uint64_t __64___KSUserWordsSynchroniser_dumpAllRecordsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a2, CFSTR("Error"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21DFEB000, a1, a3, "%s  Disabling syncing if necessary as account found is not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21DFEB000, a1, a3, "%s  Account inoperable - could not create zone", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21DFEB000, a1, a3, "%s  Disabling syncing if necessary as no compatible account found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 136315394;
  v4 = "-[_KSUserWordsSynchroniser accountDidChange:]_block_invoke";
  v5 = 1024;
  v6 = v2;
  _os_log_error_impl(&dword_21DFEB000, a2, OS_LOG_TYPE_ERROR, "%s  Resetting user words state due to account change %i", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_5();
}

void __48___KSUserWordsSynchroniser_identitiesDidChange___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 57))
    v3 = "reset was pending, attempting immediately";
  else
    v3 = "attempting to access";
  v4 = 136315394;
  v5 = "-[_KSUserWordsSynchroniser identitiesDidChange:]_block_invoke_2";
  v6 = 2080;
  v7 = v3;
  OUTLINED_FUNCTION_6(&dword_21DFEB000, a2, a3, "%s  Identities changed - %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_21DFEB000, v0, v1, "%s  Error reading files (upload check): %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2_106_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_21DFEB000, v0, v1, "%s  Failed to push our dictionaries. Undoubtedly we shall try again. %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_110_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[_KSUserWordsSynchroniser checkForDownload:uploads:allLanguages:]_block_invoke";
  _os_log_error_impl(&dword_21DFEB000, log, OS_LOG_TYPE_ERROR, "%s  The server claimed it had better data, but it did not", buf, 0xCu);
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_110_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_21DFEB000, v0, v1, "%s  Error reading files (download data): %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[_KSUserWordsSynchroniser generateKeyWithCompletionHandler:]_block_invoke_3";
  v5 = 2080;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  OUTLINED_FUNCTION_4_0(&dword_21DFEB000, a3, (uint64_t)a3, "%s  Failed to %s (%@), trying again later", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5_0();
}

void __53___KSUserWordsSynchroniser_firstTimeDownloadWithKey___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", CFSTR("Key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[_KSUserWordsSynchroniser firstTimeDownloadWithKey:]_block_invoke_2";
  v9 = 2112;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  OUTLINED_FUNCTION_4_0(&dword_21DFEB000, a3, v6, "%s  Settings file already exists! Very wrong (new key %@; old key %@)",
    (uint8_t *)&v7);

}

void __40___KSUserWordsSynchroniser_checkErrors___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  const __CFString *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("YES");
  v4 = *(_QWORD *)(a1 + 40);
  v6 = "-[_KSUserWordsSynchroniser checkErrors:]_block_invoke";
  v5 = 136315650;
  v7 = 2112;
  if (!v4)
    v3 = CFSTR("NO");
  v8 = v3;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_4_0(&dword_21DFEB000, a3, (uint64_t)a3, "%s  Failed to reset zone (delete=%@; error=%@)",
    (uint8_t *)&v5);
  OUTLINED_FUNCTION_5_0();
}

@end
