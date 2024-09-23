@implementation LNSpotlightCascadeHandler

+ (void)handleDeletionStream:(id)a3 items:(id)a4 bundleId:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, id);
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  BOOL v28;
  NSObject *v29;
  char v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void (**v43)(_QWORD, id);
  id v44;
  void *v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(_QWORD, id))a6;
  v45 = v11;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_38:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightCascadeHandler.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

    if (v13)
      goto LABEL_4;
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightCascadeHandler.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stream"));

  if (!v12)
    goto LABEL_38;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightCascadeHandler.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

LABEL_4:
  v43 = v14;
  v44 = v13;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightCascadeHandler.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v20, "attributeSet");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "attributeForKey:", CFSTR("_kMDItemAppEntityInstanceIdentifier"));
        v22 = objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v20, "attributeSet");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "attributeForKey:", CFSTR("_kMDItemAppEntityTypeIdentifier"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            +[LNSpotlightCascadeTranslator sourceItemIdentifierFromInstanceIdentifier:typeIdentifier:](LNSpotlightCascadeTranslator, "sourceItemIdentifierFromInstanceIdentifier:typeIdentifier:", v22, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 0;
            v26 = objc_msgSend(v45, "removeItemWithSourceItemIdentifier:error:", v25, &v47);
            v27 = v47;
            if (v26)
              v28 = v27 == 0;
            else
              v28 = 0;
            if (!v28)
            {
              v36 = v27;
              getLNLogCategoryVocabulary();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v53 = (uint64_t)v36;
                _os_log_impl(&dword_1A18F6000, v37, OS_LOG_TYPE_ERROR, "Could not delete item. Error: %@", buf, 0xCu);
              }

              v34 = v43;
              v43[2](v43, v36);

              v33 = v44;
              goto LABEL_36;
            }

          }
          else
          {
            getLNLogCategoryVocabulary();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A18F6000, v29, OS_LOG_TYPE_ERROR, "Missing type id in deletion request, skipping", buf, 2u);
            }

          }
        }
        else
        {
          getLNLogCategoryVocabulary();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A18F6000, v22, OS_LOG_TYPE_ERROR, "Missing instance id in deletion request, skipping", buf, 2u);
          }
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v17)
        continue;
      break;
    }
  }

  v46 = 0;
  v30 = objc_msgSend(v45, "finish:", &v46);
  v36 = v46;
  getLNLogCategoryVocabulary();
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if ((v30 & 1) != 0)
  {
    v34 = v43;
    v33 = v44;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v35 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134217984;
      v53 = v35;
      _os_log_impl(&dword_1A18F6000, v32, OS_LOG_TYPE_INFO, "Deletion request for %ld items completed.", buf, 0xCu);
    }

    v43[2](v43, 0);
  }
  else
  {
    v34 = v43;
    v33 = v44;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (uint64_t)v36;
      _os_log_impl(&dword_1A18F6000, v32, OS_LOG_TYPE_ERROR, "Cannot finish Cascade donation. Error: %@", buf, 0xCu);
    }

    v43[2](v43, v36);
  }
LABEL_36:

}

+ (void)handleIncrementalStream:(id)a3 items:(id)a4 bundleId:(id)a5 existingItemCount:(unint64_t)a6 quota:(unint64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  char v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void (**v40)(_QWORD, id);
  id v41;
  id obj;
  void *v43;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v41 = a5;
  v16 = (void (**)(id, _QWORD))a8;
  v43 = v14;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightCascadeHandler.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stream"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightCascadeHandler.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

LABEL_3:
  if (v41)
  {
    if (v16)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightCascadeHandler.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v16)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightCascadeHandler.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_5:
  getLNLogCategoryVocabulary();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v52 = objc_msgSend(v15, "count");
    _os_log_impl(&dword_1A18F6000, v17, OS_LOG_TYPE_DEBUG, "Making incremental donation for %ld items", buf, 0xCu);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v15;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = *(_QWORD *)v48;
    v40 = (void (**)(_QWORD, id))v16;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v48 != v23)
          objc_enumerationMutation(obj);
        if (v21 + a6 >= a7)
        {
          getLNLogCategoryVocabulary();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v52 = (uint64_t)v41;
            _os_log_impl(&dword_1A18F6000, v31, OS_LOG_TYPE_INFO, "Exhausted allowed Cascade quota for %@.", buf, 0xCu);
          }

          v16 = (void (**)(id, _QWORD))v40;
          goto LABEL_28;
        }
        v25 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        +[LNSpotlightCascadeTranslator translateItem:](LNSpotlightCascadeTranslator, "translateItem:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v46 = v22;
          v27 = objc_msgSend(v43, "addOrUpdateItem:error:", v26, &v46);
          v28 = v46;

          if ((v27 & 1) == 0)
          {
            getLNLogCategoryVocabulary();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v52 = (uint64_t)v26;
              v53 = 2112;
              v54 = v28;
              _os_log_impl(&dword_1A18F6000, v35, OS_LOG_TYPE_ERROR, "Cannot add or update item: %@. Error: %@", buf, 0x16u);
            }

            objc_msgSend(v43, "cancel");
            v16 = (void (**)(id, _QWORD))v40;
            v40[2](v40, v28);

            goto LABEL_38;
          }
          ++v21;
          v22 = v28;
        }
        else
        {
          if (!v20)
          {
            getLNLogCategoryVocabulary();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v25, "uniqueIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v52 = (uint64_t)v30;
              v53 = 2112;
              v54 = v41;
              _os_log_impl(&dword_1A18F6000, v29, OS_LOG_TYPE_ERROR, "Skipping item with unique id %@ from %@ due to translation failure.Subsequent translation errors are silenced for this request.", buf, 0x16u);

            }
          }
          ++v20;
        }

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      v16 = (void (**)(id, _QWORD))v40;
      if (v19)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
    v21 = 0;
    v22 = 0;
  }
LABEL_28:

  v45 = v22;
  v32 = objc_msgSend(v43, "finish:", &v45);
  v28 = v45;

  getLNLogCategoryVocabulary();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if ((v32 & 1) != 0)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v52 = v21;
      v53 = 1024;
      LODWORD(v54) = v20;
      _os_log_impl(&dword_1A18F6000, v34, OS_LOG_TYPE_DEBUG, "Completed incremental donation. Added/Updated %ld items. %d translation errors", buf, 0x12u);
    }

    v16[2](v16, 0);
  }
  else
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = (uint64_t)v28;
      _os_log_impl(&dword_1A18F6000, v34, OS_LOG_TYPE_ERROR, "Cannot finish Cascade donation. Error: %@", buf, 0xCu);
    }

    ((void (**)(id, id))v16)[2](v16, v28);
  }
LABEL_38:

}

+ (id)_getSearchQuery:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v7 = (void *)getCSSearchQueryClass_softClass;
  v15 = getCSSearchQueryClass_softClass;
  if (!getCSSearchQueryClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getCSSearchQueryClass_block_invoke;
    v11[3] = &unk_1E45DDB30;
    v11[4] = &v12;
    __getCSSearchQueryClass_block_invoke((uint64_t)v11);
    v7 = (void *)v13[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v12, 8);
  v9 = (void *)objc_msgSend([v8 alloc], "initWithQueryString:context:", v5, v6);

  return v9;
}

+ (void)handleFullSetStream:(id)a3 items:(id)a4 bundleId:(id)a5 quota:(unint64_t)a6 indexName:(id)a7 serialNumber:(unint64_t)a8 completionHandler:(id)a9
{
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  dispatch_group_t v29;
  NSObject *v30;
  NSObject *v31;
  dispatch_time_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  id v45;
  int v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  char v53;
  id v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void (**v66)(id, void *);
  void *v67;
  id v68;
  id v69;
  id v70;
  _QWORD v71[4];
  NSObject *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _QWORD v80[5];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[4];
  _BYTE v86[10];
  id v87;
  uint8_t v88[128];
  _BYTE buf[24];
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  LNBinaryHeap *v92;
  _QWORD v93[8];
  id v94;
  _QWORD v95[4];

  v95[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v65 = a5;
  v61 = a7;
  v66 = (void (**)(id, void *))a9;
  v67 = v16;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightCascadeHandler.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stream"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightCascadeHandler.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

LABEL_3:
  if (!v65)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightCascadeHandler.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  }
  if (!v66)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightCascadeHandler.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  getLNLogCategoryVocabulary();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v65;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v17, "count");
    _os_log_impl(&dword_1A18F6000, v18, OS_LOG_TYPE_DEBUG, "Making full set donation for %@. %ld items provided in this request.", buf, 0x16u);
  }

  v74 = 0;
  v75 = &v74;
  v76 = 0x2050000000;
  v19 = (void *)getCSSearchQueryContextClass_softClass;
  v77 = (uint64_t (*)(uint64_t, uint64_t))getCSSearchQueryContextClass_softClass;
  v20 = MEMORY[0x1E0C809B0];
  if (!getCSSearchQueryContextClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getCSSearchQueryContextClass_block_invoke;
    v90 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E45DDB30;
    v91 = (void (*)(uint64_t))&v74;
    __getCSSearchQueryContextClass_block_invoke((uint64_t)buf);
    v19 = (void *)v75[3];
  }
  v21 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v74, 8);
  v68 = objc_alloc_init(v21);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_kMDItemSerialNumber < %llu"), a8);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setFilterQueries:", v22);

  v94 = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setBundleIDs:", v23);

  v93[0] = CFSTR("_kMDItemAppEntityPriority");
  v93[1] = CFSTR("kMDItemAppEntityDisplayRepresentationSynonyms");
  v93[2] = CFSTR("_kMDItemAppEntityTypeDisplayRepresentationSynonyms");
  v93[3] = CFSTR("_kMDItemAppEntityTypeDisplayRepresentationName");
  v93[4] = CFSTR("_kMDItemAppEntityTypeIdentifier");
  v93[5] = CFSTR("_kMDItemAppEntityInstanceIdentifier");
  v93[6] = CFSTR("kMDItemAppEntityTitle");
  v93[7] = CFSTR("kMDItemAppEntitySubtitle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setFetchAttributes:", v24);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=*"), CFSTR("_kMDItemAppEntityInstanceIdentifier"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_getSearchQuery:context:", v62, v68);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v90 = __Block_byref_object_copy__9441;
  v91 = __Block_byref_object_dispose__9442;
  v92 = -[LNBinaryHeap initWithCapacity:comparator:admissionPolicy:]([LNBinaryHeap alloc], "initWithCapacity:comparator:admissionPolicy:", (unint64_t)(float)((float)a6 * 0.8), &__block_literal_global_9444, &__block_literal_global_25);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v25 = v17;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v82 != v27)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "insertObject:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i));
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
    }
    while (v26);
  }

  v29 = dispatch_group_create();
  v80[0] = v20;
  v80[1] = 3221225472;
  v80[2] = __111__LNSpotlightCascadeHandler_handleFullSetStream_items_bundleId_quota_indexName_serialNumber_completionHandler___block_invoke_2;
  v80[3] = &unk_1E45DD8C8;
  v80[4] = buf;
  objc_msgSend(v64, "setFoundItemsHandler:", v80);
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__9441;
  v78 = __Block_byref_object_dispose__9442;
  v79 = 0;
  v71[0] = v20;
  v71[1] = 3221225472;
  v71[2] = __111__LNSpotlightCascadeHandler_handleFullSetStream_items_bundleId_quota_indexName_serialNumber_completionHandler___block_invoke_27;
  v71[3] = &unk_1E45DD8F0;
  v73 = &v74;
  v30 = v29;
  v72 = v30;
  objc_msgSend(v64, "setCompletionHandler:", v71);
  dispatch_group_enter(v30);
  getLNLogCategoryVocabulary();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v85 = 0;
    _os_log_impl(&dword_1A18F6000, v31, OS_LOG_TYPE_DEBUG, "Starting Spotlight query", v85, 2u);
  }

  objc_msgSend(v64, "start");
  v32 = dispatch_time(0, 120000000000);
  if (dispatch_group_wait(v30, v32))
  {
    getLNLogCategoryVocabulary();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v85 = 0;
      _os_log_impl(&dword_1A18F6000, v33, OS_LOG_TYPE_INFO, "Exceeded Spotlight timeout for fullset donation query. Bailing on this donation.", v85, 2u);
    }

    v34 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;

    objc_msgSend(v64, "cancel");
    objc_msgSend(v67, "cancel");
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("LNCascadeBridgeErrorDomain"), 1004, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2](v66, v35);
  }
  else
  {
    if (v75[5])
    {
      ((void (*)(void))v66[2])();
      goto LABEL_27;
    }
    getLNLogCategoryVocabulary();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
      *(_DWORD *)v85 = 134217984;
      *(_QWORD *)v86 = v37;
      _os_log_impl(&dword_1A18F6000, v36, OS_LOG_TYPE_DEBUG, "Start pushing %ld items from the heap into Cascade", v85, 0xCu);
    }

    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    while (1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "popObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
        break;
      v42 = (void *)MEMORY[0x1A1B0F3B0]();
      +[LNSpotlightCascadeTranslator translateItem:](LNSpotlightCascadeTranslator, "translateItem:", v35);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        v70 = v40;
        v44 = objc_msgSend(v67, "registerItem:error:", v43, &v70);
        v45 = v70;

        if ((v44 & 1) != 0)
        {
          v46 = 0;
          ++v38;
        }
        else
        {
          getLNLogCategoryVocabulary();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v85 = 0;
            _os_log_impl(&dword_1A18F6000, v49, OS_LOG_TYPE_ERROR, "Error registering an item with Cascade, aborting Cascade stream.", v85, 2u);
          }

          objc_msgSend(v67, "cancel");
          v66[2](v66, v45);
          v46 = 1;
        }
        v40 = v45;
      }
      else
      {
        if (!v39)
        {
          getLNLogCategoryVocabulary();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v35, "uniqueIdentifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v85 = 138412546;
            *(_QWORD *)v86 = v48;
            *(_WORD *)&v86[8] = 2112;
            v87 = v65;
            _os_log_impl(&dword_1A18F6000, v47, OS_LOG_TYPE_ERROR, "Skipping item with unique id %@ from %@ due to translation failure. Subsequent translation errors are silenced for this request.", v85, 0x16u);

          }
        }
        ++v39;
        v46 = 12;
      }

      objc_autoreleasePoolPop(v42);
      v41 = v35;
      if (v46)
      {
        v41 = v35;
        if (v46 != 12)
          goto LABEL_62;
      }
    }
    v50 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;

    if (v38 || !v39)
    {
      getLNLogCategoryVocabulary();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v85 = 67109376;
        *(_DWORD *)v86 = v38;
        *(_WORD *)&v86[4] = 1024;
        *(_DWORD *)&v86[6] = v39;
        _os_log_impl(&dword_1A18F6000, v52, OS_LOG_TYPE_DEBUG, "Finishing Cascade stream with %d registered items and %d translation errors.", v85, 0xEu);
      }

      v69 = v40;
      v53 = objc_msgSend(v67, "finish:", &v69);
      v54 = v69;

      if ((v53 & 1) != 0)
      {
        getLNLogCategoryVocabulary();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v85 = 0;
          _os_log_impl(&dword_1A18F6000, v55, OS_LOG_TYPE_DEBUG, "Finished Cascade donation.", v85, 2u);
        }
        v56 = 0;
      }
      else
      {
        getLNLogCategoryVocabulary();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v85 = 138412290;
          *(_QWORD *)v86 = v54;
          _os_log_impl(&dword_1A18F6000, v55, OS_LOG_TYPE_ERROR, "Cannot finish Cascade donation. Error: %@", v85, 0xCu);
        }
        v56 = v54;
      }

      v66[2](v66, v56);
      v35 = 0;
      v40 = v54;
    }
    else
    {
      getLNLogCategoryVocabulary();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v85 = 67109120;
        *(_DWORD *)v86 = v39;
        _os_log_impl(&dword_1A18F6000, v51, OS_LOG_TYPE_INFO, "Nothing was registered with Cascade. Translation error count: %d", v85, 8u);
      }

      objc_msgSend(v67, "cancel");
      v66[2](v66, 0);
      v35 = 0;
    }
LABEL_62:

  }
LABEL_27:

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(buf, 8);

}

void __111__LNSpotlightCascadeHandler_handleFullSetStream_items_bundleId_quota_indexName_serialNumber_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryVocabulary();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_DEBUG, "Got %ld items from Spotlight in the foundItemsHandler.", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "insertObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void __111__LNSpotlightCascadeHandler_handleFullSetStream_items_bundleId_quota_indexName_serialNumber_completionHandler___block_invoke_27(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = objc_msgSend(v4, "code");
    getLNLogCategoryVocabulary();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == -2003)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        v8 = "Spotlight query was cancelled.";
LABEL_7:
        v9 = v7;
        v10 = OS_LOG_TYPE_DEBUG;
        v11 = 2;
LABEL_10:
        _os_log_impl(&dword_1A18F6000, v9, v10, v8, (uint8_t *)&v12, v11);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v4;
      v8 = "Spotlight query completed with error: %@";
      v9 = v7;
      v10 = OS_LOG_TYPE_ERROR;
      v11 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    getLNLogCategoryVocabulary();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      v8 = "Spotlight query completed.";
      goto LABEL_7;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

BOOL __111__LNSpotlightCascadeHandler_handleFullSetStream_items_bundleId_quota_indexName_serialNumber_completionHandler___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(a2, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForKey:", CFSTR("_kMDItemAppEntityPriority"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = &unk_1E45FA5F8;
  v9 = v8;

  objc_msgSend(v4, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "attributeForKey:", CFSTR("_kMDItemAppEntityPriority"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = &unk_1E45FA5F8;
  v14 = v13;

  v15 = objc_msgSend(v9, "compare:", v14);
  return v15 == -1;
}

uint64_t __111__LNSpotlightCascadeHandler_handleFullSetStream_items_bundleId_quota_indexName_serialNumber_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(a2, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForKey:", CFSTR("_kMDItemAppEntityPriority"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = &unk_1E45FA5F8;
  v9 = v8;

  objc_msgSend(v4, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "attributeForKey:", CFSTR("_kMDItemAppEntityPriority"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = &unk_1E45FA5F8;
  v14 = v13;

  v15 = objc_msgSend(v9, "compare:", v14);
  return v15;
}

@end
