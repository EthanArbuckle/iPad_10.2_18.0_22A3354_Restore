@implementation CHMultiLocaleResultProcessor

+ (void)updateMultiLocaleResultDictionary:(id)a3 locales:(id)a4
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t i;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  uint64_t v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v81 = a4;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v12 = objc_msgSend_count(v5, v7, v8, v9, v10, v11);
  objc_msgSend_arrayWithCapacity_(v6, v13, v12, v14, v15, v16);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99DE8];
  v23 = objc_msgSend_count(v5, v18, v19, v20, v21, v22);
  objc_msgSend_arrayWithCapacity_(v17, v24, v23, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v29 = v81;
  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v83, (uint64_t)v89, 16, v31);
  if (v36)
  {
    v37 = *(_QWORD *)v84;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v84 != v37)
          objc_enumerationMutation(v29);
        v39 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v38);
        objc_msgSend_objectForKey_(v5, v32, v39, v33, v34, v35);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          objc_msgSend_objectForKeyedSubscript_(v5, v40, v39, v41, v42, v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)objc_msgSend_copy(v45, v46, v47, v48, v49, v50);
          objc_msgSend_addObject_(v82, v52, (uint64_t)v51, v53, v54, v55);

          objc_msgSend_addObject_(v28, v56, v39, v57, v58, v59);
        }
        else
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v60 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v88 = v39;
            _os_log_impl(&dword_1BE607000, v60, OS_LOG_TYPE_FAULT, "results does not contain result for locale %@", buf, 0xCu);
          }

        }
        ++v38;
      }
      while (v36 != v38);
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v83, (uint64_t)v89, 16, v35);
    }
    while (v36);
  }

  for (i = 0; i < objc_msgSend_count(v28, v61, v62, v63, v64, v65); ++i)
  {
    sub_1BE7B27E8((uint64_t)CHMultiLocaleResultProcessor, v82, v28, i, 0, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v67, v68, i, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v28, v73, i, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v78, (uint64_t)v72, (uint64_t)v77, v79, v80);

  }
}

+ (id)combineMultiLocaleResults:(id)a3 locales:(id)a4 topLocaleIndex:(int64_t)a5 mergedResultPostprocessingBlock:(id)a6 changeableColumnCountBlock:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD, void *);
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t shouldPerformStrictCandidateFiltering;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t isSupportedCyrillicScriptLocale_withMode;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void (**v64)(id, int64_t, id, void *);
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  BOOL v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, uint64_t, _QWORD, void *))a6;
  v64 = (void (**)(id, int64_t, id, void *))a7;
  v70 = 0;
  v69 = 0;
  v61 = v12;
  v62 = v11;
  sub_1BE7B27E8((uint64_t)CHMultiLocaleResultProcessor, v11, v12, a5, &v70, &v69);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v69;
  shouldPerformStrictCandidateFiltering = objc_msgSend_shouldPerformStrictCandidateFiltering_(CHRecognizerConfiguration, v14, (uint64_t)v60, v15, v16, v17);
  v59 = a5;
  objc_msgSend_objectAtIndexedSubscript_(v12, v19, a5, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  isSupportedCyrillicScriptLocale_withMode = objc_msgSend_isSupportedCyrillicScriptLocale_withMode_(CHRecognizerConfiguration, v24, (uint64_t)v23, 4, v25, v26);

  objc_msgSend_tokenizedTextResultFromResults_shouldPerformStrictFiltering_doesTopLocaleRequireSpecialHandling_hasSwap_(CHTokenizedTextResult, v28, (uint64_t)v63, shouldPerformStrictCandidateFiltering, isSupportedCyrillicScriptLocale_withMode, v70);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v35 = (unint64_t)objc_msgSend_count(v11, v29, v30, v31, v32, v33) > 1
        ? 1
        : isSupportedCyrillicScriptLocale_withMode;
    if (v35 == 1)
    {
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v36 = v12;
      v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v65, (uint64_t)v71, 16, v38);
      if (v41)
      {
        v42 = *(_QWORD *)v66;
        if ((shouldPerformStrictCandidateFiltering & 1) != 0)
        {
          v43 = -1;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v66 != v42)
                objc_enumerationMutation(v36);
              if (1 - v59 + v43 + i || v70)
              {
                v13[2](v13, v43 + i + 1, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i), v34);
                v45 = objc_claimAutoreleasedReturnValue();

                v34 = (void *)v45;
              }
            }
            v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v65, (uint64_t)v71, 16, v40);
            v43 += i;
          }
          while (v41);
        }
        else
        {
          v46 = -1;
          do
          {
            v47 = 0;
            v48 = v34;
            do
            {
              if (*(_QWORD *)v66 != v42)
                objc_enumerationMutation(v36);
              v13[2](v13, v46 + v47 + 1, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v47), v48);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              ++v47;
              v48 = v34;
            }
            while (v41 != v47);
            v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v49, (uint64_t)&v65, (uint64_t)v71, 16, v50);
            v46 += v47;
          }
          while (v41);
        }
      }

    }
  }
  if (v64)
  {
    v51 = objc_msgSend_changeableTokenColumnCount(v34, v29, v30, v31, v32, v33);
    if (v51 < objc_msgSend_tokenColumnCount(v34, v52, v53, v54, v55, v56))
    {
      v64[2](v64, v59, v60, v34);
      v57 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v57;
    }
  }

  return v34;
}

@end
