@implementation CESRRawSpeechProfileTools

+ (id)localeFromRawSpeechProfile:(id)a3 error:(id *)a4
{
  return +[CESRRawSpeechProfileExtractor extractLocaleFromRawSpeechProfile:error:](CESRRawSpeechProfileExtractor, "extractLocaleFromRawSpeechProfile:error:", a3, a4);
}

+ (id)vocabularyItemsOfType:(int64_t)a3 fromRawSpeechProfile:(id)a4 error:(id *)a5
{
  id v7;
  __objc2_class **v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = off_1E672AFC8;
  switch(a3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      v8 = off_1E672AFC0;
      goto LABEL_10;
    case 3:
      v8 = off_1E672AFB8;
      goto LABEL_10;
    case 4:
      v8 = off_1E672AFD8;
      goto LABEL_10;
    case 5:
      v8 = off_1E672AFE0;
      goto LABEL_10;
    default:
      if (a3 == 16)
      {
        v8 = off_1E672AFE8;
      }
      else
      {
        if (a3 != 21)
          goto LABEL_14;
        v8 = off_1E672AFD0;
      }
LABEL_10:
      v9 = objc_alloc_init(*v8);
      if (v9)
      {
        v10 = v9;
        v11 = (void *)*MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
        {
          v20 = v11;
          KVItemTypeDescription();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v23 = "+[CESRRawSpeechProfileTools vocabularyItemsOfType:fromRawSpeechProfile:error:]";
          v24 = 2112;
          v25 = v21;
          _os_log_debug_impl(&dword_1B3E5F000, v20, OS_LOG_TYPE_DEBUG, "%s Extracting vocabulary items of type: %@ from rawSpeechProfile.", buf, 0x16u);

        }
        +[CESRRawSpeechProfileExtractor extractItemsFromRawSpeechProfile:converter:error:](CESRRawSpeechProfileExtractor, "extractItemsFromRawSpeechProfile:converter:error:", v7, v10, a5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
LABEL_14:
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v14 = (void *)MEMORY[0x1E0CB3940];
      KVItemTypeDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Target item type: %@ not supported."), v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 4, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a5 && v17)
        *a5 = objc_retainAutorelease(v17);

      v12 = 0;
LABEL_18:

      return v12;
  }
}

+ (id)convertRawSpeechProfile:(id)a3 deviceId:(id)a4 userId:(id)a5 omitItemTypes:(id)a6 error:(id *)a7
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  int v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v55;
  void *v56;
  void *v57;
  id obj;
  id v59;
  id v60;
  id v61;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _QWORD v84[7];
  _BYTE buf[24];
  void *v86;
  id v87;
  id v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v60 = a4;
  v59 = a5;
  v10 = a6;
  KVItemTypeToNumber();
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v66;
  KVItemTypeToNumber();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v11;
  KVItemTypeToNumber();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v12;
  KVItemTypeToNumber();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v13;
  KVItemTypeToNumber();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v84[4] = v14;
  KVItemTypeToNumber();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v84[5] = v15;
  KVItemTypeToNumber();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v84[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  v19 = v17;
  v57 = v18;
  if (objc_msgSend(v18, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v19, "count"));
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___applyItemTypeFilter_block_invoke;
    v86 = &unk_1E67342E8;
    v87 = v18;
    v21 = v20;
    v88 = v21;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", buf);
    v22 = v88;
    v23 = v21;

    v18 = v57;
  }
  else
  {
    v23 = v19;
  }

  v24 = (void *)MEMORY[0x1E0D42C08];
  v25 = a7;
  objc_msgSend(MEMORY[0x1E0D42C10], "syntheticWithDatasetCount:error:", objc_msgSend(v23, "count"), a7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0;
  objc_msgSend(v24, "builderWithProfileInfo:format:error:", v26, 1, &v81);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v81;

  v65 = (void *)v27;
  v56 = v23;
  if (v27)
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v23;
    v30 = v60;
    v29 = v61;
    v31 = v59;
    v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v78;
      while (2)
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v78 != v64)
            objc_enumerationMutation(obj);
          v33 = KVItemTypeFromNumber();
          v34 = (void *)*MEMORY[0x1E0CFE6C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
          {
            v49 = v34;
            KVItemTypeDescription();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "+[CESRRawSpeechProfileTools convertRawSpeechProfile:deviceId:userId:omitItemTypes:error:]";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v50;
            _os_log_debug_impl(&dword_1B3E5F000, v49, OS_LOG_TYPE_DEBUG, "%s Extracting and converting vocabulary items of type: %@ from rawSpeechProfile", buf, 0x16u);

          }
          v76 = v28;
          +[CESRRawSpeechProfileTools vocabularyItemsOfType:fromRawSpeechProfile:error:](CESRRawSpeechProfileTools, "vocabularyItemsOfType:fromRawSpeechProfile:error:", v33, v29, &v76);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v76;

          if (!v35)
          {
            if (v25 && v36)
            {
              v40 = objc_retainAutorelease(v36);
              *v25 = v40;
            }
            else
            {
              v40 = v36;
            }
            goto LABEL_53;
          }
          v67 = v32;
          v37 = objc_alloc(MEMORY[0x1E0D42BC0]);
          v38 = objc_msgSend(v35, "count");
          v75 = v36;
          LODWORD(v55) = v38;
          v39 = (void *)objc_msgSend(v37, "initWithItemType:originAppId:deviceId:userId:lastModifiedTime:capturedTime:itemCount:error:", v33, 0, v30, v31, 0, 0, v55, &v75);
          v40 = v75;

          if (!v39)
          {
            if (v25 && v40)
              *v25 = objc_retainAutorelease(v40);

            goto LABEL_53;
          }
          v74 = v40;
          objc_msgSend(v65, "addDataset:error:", v39, &v74);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v74;

          if (v41)
          {
            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            v42 = v35;
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
            if (v43)
            {
              v44 = *(_QWORD *)v71;
              while (2)
              {
                v45 = 0;
                v46 = v28;
                do
                {
                  if (*(_QWORD *)v71 != v44)
                    objc_enumerationMutation(v42);
                  v47 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v45);
                  v69 = v46;
                  objc_msgSend(v41, "addItem:error:", v47, &v69);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = v69;

                  if (!v48)
                  {
                    LODWORD(v43) = 1;
                    v25 = a7;
                    if (a7)
                    {
                      v30 = v60;
                      v29 = v61;
                      v31 = v59;
                      if (v28)
                      {
                        v28 = objc_retainAutorelease(v28);
                        *a7 = v28;
                      }
                    }
                    else
                    {
                      v30 = v60;
                      v29 = v61;
                      v31 = v59;
                    }
                    goto LABEL_31;
                  }
                  ++v45;
                  v46 = v28;
                }
                while (v43 != v45);
                v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
                if (v43)
                  continue;
                break;
              }
              v30 = v60;
              v29 = v61;
              v31 = v59;
              v25 = a7;
            }
LABEL_31:

          }
          else
          {
            LODWORD(v43) = 1;
            if (v25 && v28)
            {
              v28 = objc_retainAutorelease(v28);
              *v25 = v28;
            }
          }

          if ((_DWORD)v43)
          {
            v40 = v28;
LABEL_53:

            v52 = 0;
            v28 = v40;
            goto LABEL_54;
          }
          v32 = v67 + 1;
        }
        while (v67 + 1 != v63);
        v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
        if (v63)
          continue;
        break;
      }
    }
    v51 = v28;

    v68 = v28;
    objc_msgSend(v65, "buildWithError:", &v68);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v68;

    if (v52)
    {
      v53 = v52;
    }
    else if (v25 && v28)
    {
      *v25 = objc_retainAutorelease(v28);
    }

  }
  else
  {
    v52 = 0;
    v30 = v60;
    v29 = v61;
    v31 = v59;
    if (a7 && v28)
    {
      v28 = objc_retainAutorelease(v28);
      v52 = 0;
      *a7 = v28;
    }
  }
LABEL_54:

  return v52;
}

+ (id)mergeMultiUserPrimaryProfile:(id)a3 withCompanionProfiles:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  id *v10;
  uint64_t v11;
  id v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id *v19;
  void *v20;
  uint64_t v21;
  id *v22;
  NSObject *v23;
  id *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  _BOOL4 v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  id *v40;
  uint64_t v41;
  id *v42;
  void *v43;
  void *v44;
  id *v45;
  id v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  unint64_t v80;
  void *v81;
  void *v82;
  _QWORD v84[4];
  id v85;
  uint64_t *v86;
  id v87;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  id v95;
  _QWORD v96[4];
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[4];
  id v104;
  id obj;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint8_t v118[128];
  uint8_t buf[4];
  const char *v120;
  __int16 v121;
  id v122;
  _BYTE v123[128];
  uint64_t v124;
  _QWORD v125[4];

  v125[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v81 = v6;
  v82 = v7;
  if (!v6 || !objc_msgSend(v7, "count"))
  {
    v49 = (void *)MEMORY[0x1E0CB35C8];
    v124 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing required primary/companion profile data (primary: %@ companion: %@)"), v6, v8);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v125[0] = v50;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, &v124, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 9, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (a5 && v52)
      *a5 = objc_retainAutorelease(v52);

    v48 = 0;
    goto LABEL_70;
  }
  v106 = 0;
  v107 = &v106;
  v108 = 0x3032000000;
  v109 = __Block_byref_object_copy__1822;
  v110 = __Block_byref_object_dispose__1823;
  v111 = 0;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = (id *)(v107 + 5);
  obj = (id)v107[5];
  v11 = MEMORY[0x1E0C809B0];
  v103[0] = MEMORY[0x1E0C809B0];
  v103[1] = 3221225472;
  v103[2] = __86__CESRRawSpeechProfileTools_mergeMultiUserPrimaryProfile_withCompanionProfiles_error___block_invoke;
  v103[3] = &unk_1E6734278;
  v12 = v9;
  v104 = v12;
  v13 = objc_msgSend(v6, "enumerateDatasetsWithError:usingBlock:", &obj, v103);
  objc_storeStrong(v10, obj);
  if ((v13 & 1) == 0)
  {
    if (a5)
    {
      v54 = (void *)v107[5];
      if (v54)
        *a5 = objc_retainAutorelease(v54);
    }
    v48 = 0;
    v14 = v104;
    goto LABEL_69;
  }

  v80 = objc_msgSend(v12, "count");
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v14 = v82;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v100 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
        v19 = (id *)(v107 + 5);
        v98 = (id)v107[5];
        v96[0] = v11;
        v96[1] = 3221225472;
        v96[2] = __86__CESRRawSpeechProfileTools_mergeMultiUserPrimaryProfile_withCompanionProfiles_error___block_invoke_2;
        v96[3] = &unk_1E6734278;
        v97 = v12;
        LOBYTE(v18) = objc_msgSend(v18, "enumerateDatasetsWithError:usingBlock:", &v98, v96);
        objc_storeStrong(v19, v98);
        if ((v18 & 1) == 0)
        {
          if (a5)
          {
            v55 = (void *)v107[5];
            if (v55)
              *a5 = objc_retainAutorelease(v55);
          }

          v48 = 0;
          goto LABEL_69;
        }

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
    }
    while (v15);
  }

  v20 = (void *)MEMORY[0x1E0D42C10];
  v21 = objc_msgSend(v12, "count");
  v22 = (id *)(v107 + 5);
  v95 = (id)v107[5];
  objc_msgSend(v20, "syntheticWithDatasetCount:error:", v21, &v95);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v22, v95);
  if (!v14)
  {
    if (a5)
    {
      v56 = (void *)v107[5];
      v48 = 0;
      if (v56)
      {
        v14 = 0;
        v48 = 0;
        *a5 = objc_retainAutorelease(v56);
      }
    }
    else
    {
      v48 = 0;
    }
    goto LABEL_69;
  }
  v23 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v120 = "+[CESRRawSpeechProfileTools mergeMultiUserPrimaryProfile:withCompanionProfiles:error:]";
    v121 = 2112;
    v122 = v14;
    _os_log_impl(&dword_1B3E5F000, v23, OS_LOG_TYPE_INFO, "%s Preparing to merge with profileInfo: %@", buf, 0x16u);
  }
  v24 = (id *)(v107 + 5);
  v94 = (id)v107[5];
  objc_msgSend(MEMORY[0x1E0D42C08], "builderWithProfileInfo:format:error:", v14, 1, &v94);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v24, v94);
  if (!v79)
  {
    v48 = 0;
    if (a5)
    {
      v57 = (void *)v107[5];
      if (v57)
      {
        v48 = 0;
        *a5 = objc_retainAutorelease(v57);
      }
    }
    goto LABEL_68;
  }
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v75 = v12;
  v25 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v90, v118, 16);
  if (!v25)
    goto LABEL_32;
  v26 = 0;
  v77 = *(_QWORD *)v91;
  while (2)
  {
    v27 = 0;
    v78 = v26 + 1;
    v72 = v26 + v25;
    v76 = v25;
    do
    {
      if (*(_QWORD *)v91 != v77)
        objc_enumerationMutation(v75);
      v28 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v27);
      objc_msgSend(v28, "datasetInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v78 + v27 <= v80)
        goto LABEL_28;
      objc_msgSend(v29, "deviceId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v30;
      v33 = objc_msgSend(v31, "length") == 0;

      if (v33)
      {
        v59 = (void *)MEMORY[0x1E0CB35C8];
        v116 = *MEMORY[0x1E0CB2D50];
        v60 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v32, "deviceId");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "stringWithFormat:", CFSTR("Companion profile has invalid deviceId: %@ in dataset: %@"), v61, v32);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = v62;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
        v63 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 7, v63);
        v64 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_61;
      }
      objc_msgSend(v32, "userId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "length") == 0;

      if (v35)
      {
        v65 = (void *)MEMORY[0x1E0CB35C8];
        v114 = *MEMORY[0x1E0CB2D50];
        v66 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v32, "userId");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "stringWithFormat:", CFSTR("Companion profile has invalid userId: %@ in dataset: %@"), v61, v32);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = v62;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
        v63 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 8, v63);
        v64 = (id)objc_claimAutoreleasedReturnValue();
LABEL_61:
        if (a5 && v64)
        {
          v64 = objc_retainAutorelease(v64);
          *a5 = v64;
        }

        goto LABEL_65;
      }
      v30 = v32;
      v36 = objc_msgSend(v32, "itemType");
      if (v36 > 0x15)
        goto LABEL_74;
      if (((1 << v36) & 0x20000E) != 0)
        goto LABEL_28;
      if (((1 << v36) & 0x10020) == 0)
      {
LABEL_74:
        v69 = (void *)MEMORY[0x1E0CB35C8];
        v112 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dataset: %@ not applicable from companion profile"), v32);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = v61;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 9, v62);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v70;
        if (a5 && v70)
        {
          v63 = objc_retainAutorelease(v70);
          *a5 = v63;
        }
LABEL_65:

LABEL_66:
LABEL_67:

        v48 = 0;
        goto LABEL_68;
      }
      v73 = objc_alloc(MEMORY[0x1E0D42BC0]);
      v37 = objc_msgSend(v32, "itemType");
      objc_msgSend(v32, "originAppId");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "userId");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v32, "itemCount");
      v40 = (id *)(v107 + 5);
      v89 = (id)v107[5];
      LODWORD(v71) = v39;
      v41 = objc_msgSend(v73, "initWithItemType:originAppId:deviceId:userId:lastModifiedTime:capturedTime:itemCount:error:", v37, v74, 0, v38, 0, 0, v71, &v89);
      objc_storeStrong(v40, v89);

      v30 = (void *)v41;
      if (!v41)
      {
        if (a5)
        {
          v68 = (void *)v107[5];
          if (v68)
            *a5 = objc_retainAutorelease(v68);
        }
        goto LABEL_67;
      }
LABEL_28:
      v42 = (id *)(v107 + 5);
      v88 = (id)v107[5];
      v32 = v30;
      objc_msgSend(v79, "addDataset:error:", v30, &v88);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v42, v88);
      v45 = (id *)(v107 + 5);
      v44 = (void *)v107[5];
      if (!v43)
      {
        if (a5 && v44)
          *a5 = objc_retainAutorelease(v44);
        goto LABEL_66;
      }
      v87 = (id)v107[5];
      v84[0] = v11;
      v84[1] = 3221225472;
      v84[2] = __86__CESRRawSpeechProfileTools_mergeMultiUserPrimaryProfile_withCompanionProfiles_error___block_invoke_27;
      v84[3] = &unk_1E67342A0;
      v46 = v43;
      v85 = v46;
      v86 = &v106;
      v47 = objc_msgSend(v28, "enumerateItemsWithError:usingBlock:", &v87, v84);
      objc_storeStrong(v45, v87);
      if ((v47 & 1) == 0)
      {
        if (a5)
        {
          v58 = (void *)v107[5];
          if (v58)
            *a5 = objc_retainAutorelease(v58);
        }

        goto LABEL_66;
      }

      ++v27;
    }
    while (v76 != v27);
    v25 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v90, v118, 16);
    v26 = v72;
    if (v25)
      continue;
    break;
  }
LABEL_32:

  objc_msgSend(v79, "buildWithError:", a5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_68:

LABEL_69:
  _Block_object_dispose(&v106, 8);

LABEL_70:
  return v48;
}

+ (id)placeholderItemIdWithCategoryName:(id)a3
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (__CFString *)a3;
  if (placeholderItemIdWithCategoryName__onceToken != -1)
    dispatch_once(&placeholderItemIdWithCategoryName__onceToken, &__block_literal_global_1807);
  if (!v3)
    v3 = CFSTR("unspecified");
  objc_msgSend((id)placeholderItemIdWithCategoryName__categoryCounts, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (void *)v4;
  else
    v5 = &unk_1E67454B0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "integerValue") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)placeholderItemIdWithCategoryName__categoryCounts, "setObject:forKey:", v6, v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), CFSTR("speechprofile"), v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)itemWithType:(int64_t)a3 itemId:(id)a4 fieldType:(int64_t)a5 value:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v9 = a4;
  v10 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0D42BF0]);
  v12 = (id)objc_msgSend(v11, "setItemType:itemId:error:", a3, v9, 0);
  v13 = (id)objc_msgSend(v11, "addFieldWithType:value:error:", a5, v10, 0);
  objc_msgSend(v11, "buildItemWithError:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __63__CESRRawSpeechProfileTools_placeholderItemIdWithCategoryName___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)placeholderItemIdWithCategoryName__categoryCounts;
  placeholderItemIdWithCategoryName__categoryCounts = (uint64_t)v0;

}

uint64_t __86__CESRRawSpeechProfileTools_mergeMultiUserPrimaryProfile_withCompanionProfiles_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "datasetInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "itemType");

  if (v5 == 4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

uint64_t __86__CESRRawSpeechProfileTools_mergeMultiUserPrimaryProfile_withCompanionProfiles_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "datasetInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "itemType");

  if (v5 <= 0x15 && ((1 << v5) & 0x21002E) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

BOOL __86__CESRRawSpeechProfileTools_mergeMultiUserPrimaryProfile_withCompanionProfiles_error___block_invoke_27(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "addItem:error:", a2, &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);

  return v4 != 0;
}

@end
