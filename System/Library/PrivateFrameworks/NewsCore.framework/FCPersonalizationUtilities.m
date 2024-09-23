@implementation FCPersonalizationUtilities

+ (id)diversifyItems:(id)a3 withPreselectedItems:(id)a4 limit:(unint64_t)a5 similarityStartExpectation:(double)a6 similarityEndExpectation:(double)a7 publisherDiversificationSlope:(double)a8 publisherDiversificationYIntercept:(double)a9
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  unint64_t v37;
  double v38;
  double v39;
  _QWORD v40[6];
  _QWORD aBlock[4];
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = (void *)FCPersonalizationLog;
  if (!os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    if (a5)
      goto LABEL_3;
LABEL_7:
    v26 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_8;
  }
  v27 = (void *)MEMORY[0x1E0CB37E8];
  v28 = v17;
  objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138412546;
  v44 = v29;
  v45 = 2112;
  v46 = v30;
  _os_log_debug_impl(&dword_1A1B90000, v28, OS_LOG_TYPE_DEBUG, "Diversifying set of %@ items down to %@", buf, 0x16u);

  if (!a5)
    goto LABEL_7;
LABEL_3:
  if (objc_msgSend(v15, "count") <= a5)
  {
    v26 = v15;
  }
  else
  {
    objc_msgSend(v15, "fc_subarrayWithMaxCount:", 10 * a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_4;
    aBlock[3] = &unk_1E463F428;
    v42 = &__block_literal_global_7;
    v20 = _Block_copy(aBlock);
    v40[0] = v19;
    v40[1] = 3221225472;
    v40[2] = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_6;
    v40[3] = &__block_descriptor_48_e8_Q16__0Q8l;
    *(double *)&v40[4] = a8;
    *(double *)&v40[5] = a9;
    v21 = _Block_copy(v40);
    v22 = (void *)MEMORY[0x1E0C99D20];
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_7;
    v32[3] = &unk_1E463F508;
    v33 = v16;
    v34 = v18;
    v36 = v20;
    v37 = a5;
    v38 = a6;
    v39 = a7;
    v35 = v21;
    v23 = v18;
    v24 = v21;
    v25 = v20;
    objc_msgSend(v22, "fc_array:", v32);
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:

  return v26;
}

double __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "fc_setByMinusingSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v5, "fc_setByIntersectingSet:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  if (v7)
    return (double)v9 / (double)v7;
  else
    return 1.0;
}

double __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v5 = a2;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_5;
  v16 = &unk_1E463F400;
  v6 = *(id *)(a1 + 32);
  v17 = v5;
  v18 = v6;
  v7 = v5;
  objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKeyPath:", CFSTR("@max.self"), v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  return v11;
}

id __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "topicIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "topicIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v8, v11);
  objc_msgSend(v2, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

unint64_t __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_6(uint64_t a1, unint64_t a2)
{
  return vcvtpd_u64_f64(*(double *)(a1 + 40) + *(double *)(a1 + 32) * (double)a2);
}

void __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  NSObject *v9;
  double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  char *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  char *v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  id v35;
  uint64_t (**v36)(void);
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  _QWORD *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  double v44;
  _QWORD v45[4];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[6];
  _QWORD aBlock[4];
  id v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  char *v73;
  __int16 v74;
  _BYTE v75[18];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__22;
  v68 = __Block_byref_object_dispose__22;
  v69 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__22;
  v62 = __Block_byref_object_dispose__22;
  v63 = (id)objc_opt_new();
  if (*(_QWORD *)(a1 + 32))
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = MEMORY[0x1E0C9AA60];
  objc_msgSend((id)v59[5], "addObjectsFromArray:", v3);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_16;
  aBlock[3] = &unk_1E463F470;
  v57 = &v58;
  v56 = *(id *)(a1 + 32);
  v36 = (uint64_t (**)(void))_Block_copy(aBlock);
  v4 = objc_msgSend((id)v59[5], "count");
  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    v6 = objc_msgSend(v5, "mutableCopy");
    v7 = (void *)v65[5];
    v65[5] = v6;

  }
  else
  {
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_2_18;
    v54[3] = &unk_1E463F498;
    v54[4] = &v58;
    v54[5] = &v64;
    objc_msgSend(v5, "fc_subarrayWithCount:result:", 1, v54);
  }
  v9 = MEMORY[0x1E0C81028];
  *(_QWORD *)&v8 = 136315906;
  v34 = v8;
  while ((unint64_t)v36[2]() < *(_QWORD *)(a1 + 64))
  {
    v10 = *(double *)(a1 + 72);
    v11 = *(double *)(a1 + 80);
    v12 = objc_msgSend((id)v59[5], "count");
    v13 = *(_QWORD *)(a1 + 64);
    v14 = objc_msgSend(*(id *)(a1 + 32), "count");
    v15 = v9;
    v16 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend((id)v59[5], "count") + 1);
    v17 = v36[2]();
    v18 = v10 + (v11 - v10) * (((double)v12 + -1.0) / (double)(unint64_t)(v14 + v13));
    v19 = (id)FCPersonalizationLog;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      if (v17 <= 1)
        v26 = &stru_1E464BC40;
      else
        v26 = CFSTR("s");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18, v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v71 = v25;
      v72 = 2112;
      v73 = (char *)v26;
      v74 = 2112;
      *(_QWORD *)v75 = v27;
      *(_WORD *)&v75[8] = 2112;
      *(_QWORD *)&v75[10] = v28;
      _os_log_debug_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEBUG, "%@ item%@ chosen so far, our similarity threshold is %@ and our unique publisher requirement is %@", buf, 0x2Au);

    }
    v9 = v15;
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0x7FFFFFFFFFFFFFFFLL;
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0x7FFFFFFFFFFFFFFFLL;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v45[3] = 0x7FEFFFFFFFFFFFFFLL;
    v20 = (void *)v65[5];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_24;
    v37[3] = &unk_1E463F4E0;
    v38 = *(id *)(a1 + 56);
    v39 = &v58;
    v40 = v45;
    v41 = &v46;
    v44 = v18;
    v42 = &v50;
    v43 = v16;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v37);
    v21 = v51[3];
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = v47[3];
      v51[3] = v21;
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = v15;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Didn't find a candidate, this should be impossible"));
          *(_DWORD *)buf = v34;
          v71 = "+[FCPersonalizationUtilities diversifyItems:withPreselectedItems:limit:similarityStartExpectation:simila"
                "rityEndExpectation:publisherDiversificationSlope:publisherDiversificationYIntercept:]_block_invoke";
          v72 = 2080;
          v73 = "FCPersonalizationUtilities.m";
          v74 = 1024;
          *(_DWORD *)v75 = 228;
          *(_WORD *)&v75[4] = 2114;
          *(_QWORD *)&v75[6] = v32;
          _os_log_error_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        v21 = v51[3];
      }
    }
    objc_msgSend((id)v65[5], "objectAtIndex:", v21, v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v65[5], "removeObjectAtIndex:", v51[3]);
    objc_msgSend((id)v59[5], "addObject:", v23);
    v24 = (id)FCPersonalizationLog;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v51[3]);
      v29 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36[2]());
      v30 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v65[5], "count"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v71 = v29;
      v72 = 2112;
      v73 = v30;
      v74 = 2112;
      *(_QWORD *)v75 = v31;
      _os_log_debug_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_DEBUG, "Candidate added from index %@, we have now chosen %@ candidates and have %@ remaining in our candidate pool", buf, 0x20u);

      v9 = v15;
    }

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
  }
  objc_msgSend((id)v59[5], "fc_subarrayFromIndex:inclusive:", objc_msgSend(*(id *)(a1 + 32), "count"), 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObjectsFromArray:", v33);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

}

uint64_t __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_16(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
  return v2 - objc_msgSend(*(id *)(a1 + 32), "count");
}

void __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_2_18(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6 = a3;
  objc_msgSend(v5, "addObjectsFromArray:", a2);
  v7 = objc_msgSend(v6, "mutableCopy");

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_24(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  double (*v9)(uint64_t, id, uint64_t);
  id v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v9 = *(double (**)(uint64_t, id, uint64_t))(v7 + 16);
  v10 = a2;
  v11 = v9(v7, v10, v8);
  v12 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v32 = (void *)MEMORY[0x1E0CB37E8];
    v33 = v12;
    objc_msgSend(v32, "numberWithDouble:", v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 138412546;
    v44 = v34;
    v45 = 2112;
    v46 = v35;
    _os_log_debug_impl(&dword_1A1B90000, v33, OS_LOG_TYPE_DEBUG, "Found similarity value of %@ for candidate at index %@", (uint8_t *)&v43, 0x16u);

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v11 < *(double *)(v13 + 24))
  {
    v14 = (void *)FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      v36 = (void *)MEMORY[0x1E0CB37E8];
      v37 = v14;
      objc_msgSend(v36, "numberWithDouble:", v11);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 138412290;
      v44 = v38;
      _os_log_debug_impl(&dword_1A1B90000, v37, OS_LOG_TYPE_DEBUG, "Similarity value %@ is our new lowest similarity value we have found so far", (uint8_t *)&v43, 0xCu);

      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    *(double *)(v13 + 24) = v11;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "fc_arrayByTransformingWithBlock:", &__block_literal_global_27_1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "publisherID");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = v16;
  else
    v17 = CFSTR("unknown+publisher+id");
  objc_msgSend(v15, "arrayByAddingObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fc_uniqueCount");

  if (v19 >= *(_QWORD *)(a1 + 72))
  {
    v25 = *(double *)(a1 + 80);
    v26 = (void *)FCPersonalizationLog;
    v27 = os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG);
    if (v11 <= v25)
    {
      if (v27)
      {
        v39 = (void *)MEMORY[0x1E0CB37E8];
        v40 = v26;
        objc_msgSend(v39, "numberWithDouble:", v11);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138412546;
        v44 = v41;
        v45 = 2112;
        v46 = v42;
        _os_log_debug_impl(&dword_1A1B90000, v40, OS_LOG_TYPE_DEBUG, "Similarity value %@ satisified our threshold of %@ and has been chosen", (uint8_t *)&v43, 0x16u);

      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
      *a4 = 1;
    }
    else if (v27)
    {
      v28 = (void *)MEMORY[0x1E0CB37E8];
      v29 = v26;
      objc_msgSend(v28, "numberWithDouble:", v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 138412546;
      v44 = v30;
      v45 = 2112;
      v46 = v31;
      _os_log_debug_impl(&dword_1A1B90000, v29, OS_LOG_TYPE_DEBUG, "Similarity value %@ did not satisify our threshold of %@ and has not been chosen", (uint8_t *)&v43, 0x16u);

    }
  }
  else
  {
    v20 = (void *)FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v22 = v20;
      objc_msgSend(v21, "numberWithUnsignedInteger:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 138412546;
      v44 = v23;
      v45 = 2112;
      v46 = v24;
      _os_log_debug_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_DEBUG, "If we chose this item our unique publisher count would be %@ which doesn't satisfy our requirement of %@", (uint8_t *)&v43, 0x16u);

    }
  }
}

uint64_t __189__FCPersonalizationUtilities_diversifyItems_withPreselectedItems_limit_similarityStartExpectation_similarityEndExpectation_publisherDiversificationSlope_publisherDiversificationYIntercept___block_invoke_25(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "publisherID");
}

@end
