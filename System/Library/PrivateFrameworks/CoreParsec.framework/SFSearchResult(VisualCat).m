@implementation SFSearchResult(VisualCat)

- (uint64_t)processVisualCATResultSynchronously
{
  uint64_t result;
  void *v3;
  id v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2050000000;
    v3 = (void *)getCATPatternClass_softClass;
    v9 = getCATPatternClass_softClass;
    if (!getCATPatternClass_softClass)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __getCATPatternClass_block_invoke;
      v5[3] = &unk_1E3921EE0;
      v5[4] = &v6;
      __getCATPatternClass_block_invoke((uint64_t)v5);
      v3 = (void *)v7[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v6, 8);
    return objc_msgSend(a1, "processVisualCATResultSynchronouslyUsingPatternClass:", v4);
  }
  return result;
}

- (void)processVisualCATResultSynchronouslyUsingPatternClass:()VisualCat
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  dispatch_time_t v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  id obj;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *ptr;
  _QWORD aBlock[4];
  NSObject *v58;
  id v59;
  os_signpost_id_t v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  const __CFString *v70;
  void *v71;
  uint8_t v72[128];
  __int128 buf;
  Class (*v74)(uint64_t);
  void *v75;
  uint64_t *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a1, "card");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {

    }
    else
    {
      objc_msgSend(a1, "inlineCard");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cardSections");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (!v9)
        return;
    }
    objc_msgSend(a1, "card");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cardSections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(a1, "inlineCard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cardSections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v11)

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = v15;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v54)
    {
      v53 = *(_QWORD *)v63;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v63 != v53)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v55 = v18;
            objc_msgSend(v55, "pattern_model");
            ptr = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(ptr, "pattern_template_directory");
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
              goto LABEL_31;
            v66 = 0;
            v67 = &v66;
            v68 = 0x2050000000;
            v20 = (void *)getDEExecutorClass_softClass;
            v69 = getDEExecutorClass_softClass;
            if (!getDEExecutorClass_softClass)
            {
              *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
              *((_QWORD *)&buf + 1) = 3221225472;
              v74 = __getDEExecutorClass_block_invoke;
              v75 = &unk_1E3921EE0;
              v76 = &v66;
              __getDEExecutorClass_block_invoke((uint64_t)&buf);
              v20 = (void *)v67[3];
            }
            v21 = objc_retainAutorelease(v20);
            _Block_object_dispose(&v66, 8);
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/Assistant/FlowDelegatePlugins/InformationFlowPlugin.bundle"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (PARLogHandleForCategory_onceToken_19 != -1)
              dispatch_once(&PARLogHandleForCategory_onceToken_19, &__block_literal_global_20);
            v23 = PARLogHandleForCategory_logHandles_4_21;
            if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_21, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v22;
              _os_log_debug_impl(&dword_19A825000, v23, OS_LOG_TYPE_DEBUG, "Falling back to default template path from bundle %@.", (uint8_t *)&buf, 0xCu);
            }
            objc_msgSend(v21, "bundleTemplateDir:", v22);
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {

LABEL_31:
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v19, 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              if (v24)
              {
                v51 = v24;
                if (PARLogHandleForCategory_onceToken_19 != -1)
                  dispatch_once(&PARLogHandleForCategory_onceToken_19, &__block_literal_global_20);
                v26 = PARLogHandleForCategory_logHandles_4_21;
                if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_21, OS_LOG_TYPE_DEBUG))
                {
                  LODWORD(buf) = 138412290;
                  *(_QWORD *)((char *)&buf + 4) = v19;
                  _os_log_debug_impl(&dword_19A825000, v26, OS_LOG_TYPE_DEBUG, "Processing response wrapper section with template path %@.", (uint8_t *)&buf, 0xCu);
                }
                objc_msgSend(ptr, "pattern_parameters");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                if (v52)
                {
                  v61 = 0;
                  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v52, 0, &v61);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = v61;
                  if (!v28 && v27)
                  {
                    v50 = v27;
                    goto LABEL_45;
                  }
                  if (PARLogHandleForCategory_onceToken_19 != -1)
                    dispatch_once(&PARLogHandleForCategory_onceToken_19, &__block_literal_global_20);
                  v43 = (void *)PARLogHandleForCategory_logHandles_4_21;
                  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_21, OS_LOG_TYPE_ERROR))
                  {
                    v45 = v43;
                    -[NSObject localizedDescription](v28, "localizedDescription");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(buf) = 138412290;
                    *(_QWORD *)((char *)&buf + 4) = v46;
                    _os_log_error_impl(&dword_19A825000, v45, OS_LOG_TYPE_ERROR, "Error decoding JSON params: %@", (uint8_t *)&buf, 0xCu);

                  }
                  v50 = (void *)MEMORY[0x1E0C9AA70];
                }
                else
                {
                  v50 = (void *)MEMORY[0x1E0C9AA70];
LABEL_45:
                  v30 = dispatch_group_create();
                  dispatch_group_enter(v30);
                  if (PARLogHandleForCategory_onceToken_19 != -1)
                    dispatch_once(&PARLogHandleForCategory_onceToken_19, &__block_literal_global_20);
                  v31 = os_signpost_id_make_with_pointer((os_log_t)PARLogHandleForCategory_logHandles_4_21, ptr);
                  if (PARLogHandleForCategory_onceToken_19 != -1)
                    dispatch_once(&PARLogHandleForCategory_onceToken_19, &__block_literal_global_20);
                  v32 = (id)PARLogHandleForCategory_logHandles_4_21;
                  v33 = v32;
                  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
                  {
                    LOWORD(buf) = 0;
                    _os_signpost_emit_with_name_impl(&dword_19A825000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "execute", ", (uint8_t *)&buf, 2u);
                  }

                  aBlock[0] = MEMORY[0x1E0C809B0];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __82__SFSearchResult_VisualCat__processVisualCATResultSynchronouslyUsingPatternClass___block_invoke;
                  aBlock[3] = &unk_1E3921EB8;
                  v60 = v31;
                  v28 = v30;
                  v58 = v28;
                  v59 = v55;
                  v34 = _Block_copy(aBlock);
                  objc_msgSend(ptr, "pattern_id");
                  v35 = objc_claimAutoreleasedReturnValue();
                  v36 = (void *)v35;
                  if (v35)
                    v37 = (const __CFString *)v35;
                  else
                    v37 = &stru_1E39232C8;
                  v70 = CFSTR("locale");
                  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "languageCode");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v71 = v39;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a3, "execute:templateDir:patternId:parameters:globals:options:completion:", 0, v51, v37, v50, v40, 0, v34);

                  v41 = dispatch_time(0, 1000000000);
                  if (dispatch_group_wait(v28, v41))
                  {
                    if (PARLogHandleForCategory_onceToken_19 != -1)
                      dispatch_once(&PARLogHandleForCategory_onceToken_19, &__block_literal_global_20);
                    v42 = PARLogHandleForCategory_logHandles_4_21;
                    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_21, OS_LOG_TYPE_ERROR))
                    {
                      LOWORD(buf) = 0;
                      _os_log_error_impl(&dword_19A825000, v42, OS_LOG_TYPE_ERROR, "Timed out waiting for VisualCAT rendering to complete.", (uint8_t *)&buf, 2u);
                    }
                  }

                  v27 = v58;
                }

              }
              else
              {
                if (PARLogHandleForCategory_onceToken_19 != -1)
                  dispatch_once(&PARLogHandleForCategory_onceToken_19, &__block_literal_global_20);
                v29 = PARLogHandleForCategory_logHandles_4_21;
                if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_21, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(buf) = 0;
                  _os_log_error_impl(&dword_19A825000, v29, OS_LOG_TYPE_ERROR, "Unable to locate template path.", (uint8_t *)&buf, 2u);
                }
              }

              v22 = (void *)v19;
            }
            else
            {
              if (PARLogHandleForCategory_onceToken_19 != -1)
                dispatch_once(&PARLogHandleForCategory_onceToken_19, &__block_literal_global_20);
              v44 = PARLogHandleForCategory_logHandles_4_21;
              if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_21, OS_LOG_TYPE_ERROR))
              {
                LOWORD(buf) = 0;
                _os_log_error_impl(&dword_19A825000, v44, OS_LOG_TYPE_ERROR, "Couldn't find path to fallback template.", (uint8_t *)&buf, 2u);
              }
            }

          }
          ++v17;
        }
        while (v54 != v17);
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        v54 = v47;
      }
      while (v47);
    }

  }
  else
  {
    if (PARLogHandleForCategory_onceToken_19 != -1)
      dispatch_once(&PARLogHandleForCategory_onceToken_19, &__block_literal_global_20);
    v6 = PARLogHandleForCategory_logHandles_4_21;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_4_21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_19A825000, v6, OS_LOG_TYPE_ERROR, "Failed to dynamically load the DialogEngine framework.", (uint8_t *)&buf, 2u);
    }
  }
}

@end
