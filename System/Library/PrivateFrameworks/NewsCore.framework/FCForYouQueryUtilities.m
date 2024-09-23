@implementation FCForYouQueryUtilities

+ (void)fetchTagsForQueryingWithSubscribedTags:(id)a3 mutedTagIDs:(id)a4 purchasedTagIDs:(id)a5 bundleSubscriptionProvider:(id)a6 configuration:(id)a7 contentContext:(id)a8 fallbackToPresubscribedTagIDs:(BOOL)a9 qualityOfService:(int64_t)a10 completionHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(id, void *, _QWORD);
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  void (**v39)(id, void *, _QWORD);
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = (void (**)(id, void *, _QWORD))a11;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscribedTags");
    *(_DWORD *)buf = 136315906;
    v42 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscription"
          "Provider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    v43 = 2080;
    v44 = "FCForYouQueryUtilities.m";
    v45 = 1024;
    v46 = 92;
    v47 = 2114;
    v48 = v33;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18)
      goto LABEL_6;
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "mutedTagIDs");
    *(_DWORD *)buf = 136315906;
    v42 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscription"
          "Provider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    v43 = 2080;
    v44 = "FCForYouQueryUtilities.m";
    v45 = 1024;
    v46 = 93;
    v47 = 2114;
    v48 = v34;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentContext");
    *(_DWORD *)buf = 136315906;
    v42 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscription"
          "Provider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    v43 = 2080;
    v44 = "FCForYouQueryUtilities.m";
    v45 = 1024;
    v46 = 94;
    v47 = 2114;
    v48 = v35;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v23)
      goto LABEL_11;
  }
  else if (v23)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completionHandler");
    *(_DWORD *)buf = 136315906;
    v42 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscription"
          "Provider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    v43 = 2080;
    v44 = "FCForYouQueryUtilities.m";
    v45 = 1024;
    v46 = 95;
    v47 = 2114;
    v48 = v36;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_11:
  if (objc_msgSend(v17, "count") || !a9)
  {
    objc_msgSend(a1, "_filterTagsForQuerying:withMutedTagIDs:", v17, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2](v23, v24, 0);
  }
  else
  {
    objc_msgSend(v21, "presubscribedFeedIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
    {
      FCDispatchQueueForQualityOfService(a10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "tagController");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = a1;
      v28 = v17;
      v29 = v22;
      v30 = v21;
      v31 = v20;
      v32 = (void *)v26;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __214__FCForYouQueryUtilities_fetchTagsForQueryingWithSubscribedTags_mutedTagIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_contentContext_fallbackToPresubscribedTagIDs_qualityOfService_completionHandler___block_invoke;
      v37[3] = &unk_1E463DA00;
      v40 = v27;
      v38 = v18;
      v39 = v23;
      objc_msgSend(v32, "fetchTagsForTagIDs:qualityOfService:callbackQueue:completionHandler:", v24, a10, v25, v37);

      v20 = v31;
      v21 = v30;
      v22 = v29;
      v17 = v28;

    }
    else
    {
      v25 = (void *)objc_opt_new();
      v23[2](v23, v25, 0);
    }

  }
}

void __214__FCForYouQueryUtilities_fetchTagsForQueryingWithSubscribedTags_mutedTagIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_contentContext_fallbackToPresubscribedTagIDs_qualityOfService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a2, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_filterTagsForQuerying:withMutedTagIDs:", v7, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)fetchTagsForQueryingWithSubscribedTagIDs:(id)a3 mutedTagIDs:(id)a4 purchasedTagIDs:(id)a5 bundleSubscriptionProvider:(id)a6 configuration:(id)a7 contentContext:(id)a8 fallbackToPresubscribedTagIDs:(BOOL)a9 qualityOfService:(int64_t)a10 completionHandler:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  int64_t v46;
  BOOL v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v18 = a8;
  v19 = a11;
  if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscribedTagIDs");
    *(_DWORD *)buf = 136315906;
    v49 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscripti"
          "onProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    v50 = 2080;
    v51 = "FCForYouQueryUtilities.m";
    v52 = 1024;
    v53 = 135;
    v54 = 2114;
    v55 = v29;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v17)
      goto LABEL_6;
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "mutedTagIDs");
    *(_DWORD *)buf = 136315906;
    v49 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscripti"
          "onProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    v50 = 2080;
    v51 = "FCForYouQueryUtilities.m";
    v52 = 1024;
    v53 = 136;
    v54 = 2114;
    v55 = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentContext");
    *(_DWORD *)buf = 136315906;
    v49 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscripti"
          "onProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    v50 = 2080;
    v51 = "FCForYouQueryUtilities.m";
    v52 = 1024;
    v53 = 137;
    v54 = 2114;
    v55 = v31;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v20 = v19;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completionHandler");
    *(_DWORD *)buf = 136315906;
    v49 = "+[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscripti"
          "onProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:]";
    v50 = 2080;
    v51 = "FCForYouQueryUtilities.m";
    v52 = 1024;
    v53 = 138;
    v54 = 2114;
    v55 = v32;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  FCDispatchQueueForQualityOfService(a10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tagController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __216__FCForYouQueryUtilities_fetchTagsForQueryingWithSubscribedTagIDs_mutedTagIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_contentContext_fallbackToPresubscribedTagIDs_qualityOfService_completionHandler___block_invoke;
  v38[3] = &unk_1E463DA28;
  v39 = v17;
  v40 = v35;
  v41 = v34;
  v42 = v33;
  v43 = v18;
  v44 = v20;
  v45 = a1;
  v47 = a9;
  v46 = a10;
  v37 = v18;
  v24 = v33;
  v25 = v34;
  v26 = v35;
  v27 = v17;
  v28 = v20;
  objc_msgSend(v22, "fetchTagsForTagIDs:qualityOfService:callbackQueue:completionHandler:", v23, a10, v21, v38);

}

void __216__FCForYouQueryUtilities_fetchTagsForQueryingWithSubscribedTagIDs_mutedTagIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_contentContext_fallbackToPresubscribedTagIDs_qualityOfService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    LOBYTE(v6) = *(_BYTE *)(a1 + 96);
    objc_msgSend(*(id *)(a1 + 80), "fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v6, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 72));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

+ (id)feedRequestsForTags:(id)a3 tagBinProvider:(id)a4 hiddenFeedIDs:(id)a5 allowPaidBundleFeed:(BOOL)a6 purchasedTagIDs:(id)a7 bundleSubscriptionProvider:(id)a8 configuration:(id)a9 maxCount:(unint64_t)a10 feedRange:(id)a11 sidecar:(id)a12 isRunningPPT:(BOOL)a13
{
  return (id)objc_msgSend(a1, "feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:maxCount:feedRange:sidecar:options:", a3, a4, a5, a7, a8, a9);
}

+ (id)feedRequestsForTags:(id)a3 tagBinProvider:(id)a4 hiddenFeedIDs:(id)a5 purchasedTagIDs:(id)a6 bundleSubscriptionProvider:(id)a7 configuration:(id)a8 maxCount:(unint64_t)a9 feedRange:(id)a10 sidecar:(id)a11 options:(unint64_t)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  int HasBundleSubscriptionToChannelInline;
  id v33;
  void *v34;
  void *v35;
  FCFeedRequest *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  FCFeedRequest *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  uint64_t v62;
  FCFeedRequest *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  char v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  FCFeedRequest *v76;
  void *v77;
  uint64_t k;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t m;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  FCFeedRequest *v89;
  void *v90;
  void *v91;
  FCFeedRequest *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t n;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  FCFeedRequest *v102;
  FCForYouQueryResult *v103;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  uint64_t (**v119)(_QWORD, _QWORD);
  id v120;
  uint64_t v121;
  id obj;
  void *v123;
  uint64_t v124;
  void *v125;
  int v126;
  id v127;
  id v128;
  unsigned int (**v129)(void *, id);
  id v130;
  id v131;
  void *v132;
  void *v133;
  int v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  id v140;
  void *v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _QWORD aBlock[4];
  id v167;
  id v168;
  id v169;
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  void *v175;
  uint8_t v176[128];
  uint8_t buf[4];
  const char *v178;
  __int16 v179;
  char *v180;
  __int16 v181;
  int v182;
  __int16 v183;
  void *v184;
  uint64_t v185;

  v185 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v110 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v139 = a10;
  v140 = a11;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tags");
    *(_DWORD *)buf = 136315906;
    v178 = "+[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionP"
           "rovider:configuration:maxCount:feedRange:sidecar:options:]";
    v179 = 2080;
    v180 = "FCForYouQueryUtilities.m";
    v181 = 1024;
    v182 = 213;
    v183 = 2114;
    v184 = v105;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18)
      goto LABEL_6;
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagBinProvider");
    *(_DWORD *)buf = 136315906;
    v178 = "+[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionP"
           "rovider:configuration:maxCount:feedRange:sidecar:options:]";
    v179 = 2080;
    v180 = "FCForYouQueryUtilities.m";
    v181 = 1024;
    v182 = 214;
    v183 = 2114;
    v184 = v106;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "configuration");
    *(_DWORD *)buf = 136315906;
    v178 = "+[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionP"
           "rovider:configuration:maxCount:feedRange:sidecar:options:]";
    v179 = 2080;
    v180 = "FCForYouQueryUtilities.m";
    v181 = 1024;
    v182 = 215;
    v183 = 2114;
    v184 = v107;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!a9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "maxCount");
    *(_DWORD *)buf = 136315906;
    v178 = "+[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionP"
           "rovider:configuration:maxCount:feedRange:sidecar:options:]";
    v179 = 2080;
    v180 = "FCForYouQueryUtilities.m";
    v181 = 1024;
    v182 = 216;
    v183 = 2114;
    v184 = v108;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v139 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedRange");
    *(_DWORD *)buf = 136315906;
    v178 = "+[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionP"
           "rovider:configuration:maxCount:feedRange:sidecar:options:]";
    v179 = 2080;
    v180 = "FCForYouQueryUtilities.m";
    v181 = 1024;
    v182 = 217;
    v183 = 2114;
    v184 = v109;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topStoriesConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "channelID");
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "editorialChannelID");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "editorialGemsSectionID");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __167__FCForYouQueryUtilities_feedRequestsForTags_tagBinProvider_hiddenFeedIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_maxCount_feedRange_sidecar_options___block_invoke;
  aBlock[3] = &unk_1E463DA50;
  v120 = v20;
  v167 = v120;
  v117 = v19;
  v168 = v117;
  v112 = v21;
  v169 = v112;
  v129 = (unsigned int (**)(void *, id))_Block_copy(aBlock);
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  obj = v17;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v162, v176, 16);
  v119 = (uint64_t (**)(_QWORD, _QWORD))v18;
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v163;
    v114 = *(_QWORD *)v163;
    do
    {
      v26 = 0;
      v121 = v24;
      do
      {
        if (*(_QWORD *)v163 != v25)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * v26);
        v137 = (*((uint64_t (**)(id, void *))v18 + 2))(v18, v27);
        v28 = objc_msgSend(v27, "tagType");
        if (v28 == 1)
        {
          +[FCFeedContext feedContextForTag:](FCFeedContext, "feedContextForTag:", v27);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_alloc_init(FCFeedRequest);
          objc_msgSend(v27, "freeFeedIDForBin:", v137);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCFeedRequest setFeedID:](v36, "setFeedID:", v37);
          -[FCFeedRequest setFeedRange:](v36, "setFeedRange:", v139);
          -[FCFeedRequest setMaxCount:](v36, "setMaxCount:", a9);
          objc_msgSend(v118, "addObject:", v36);
          objc_msgSend(v141, "setObject:forKey:", v35, v37);

        }
        else if (v28 == 2)
        {
          objc_msgSend(v27, "asChannel");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v134 = objc_msgSend(v116, "isEqualToString:", v30);
          v126 = objc_msgSend(v115, "isEqualToString:", v30);
          v31 = objc_msgSend(v117, "containsObject:", v30);
          HasBundleSubscriptionToChannelInline = FCPaidAccessCheckerHasBundleSubscriptionToChannelInline(v120, v30, 8);
          v130 = v30;
          v33 = v115;
          v123 = v33;
          v124 = v26;
          if ((a12 & 4) != 0
            || (a12 & 2) == 0
            && (((v31 | HasBundleSubscriptionToChannelInline) & 1) != 0
             || objc_msgSend(v130, "isEqualToString:", v33)))
          {
            objc_msgSend(v29, "sectionIDs");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v29, "defaultSectionID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              objc_msgSend(v29, "defaultSectionID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v175 = v39;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v175, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

            }
          }
          v160 = 0u;
          v161 = 0u;
          v158 = 0u;
          v159 = 0u;
          v127 = v34;
          v40 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v158, v174, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v159;
            do
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(_QWORD *)v159 != v42)
                  objc_enumerationMutation(v127);
                v44 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * i);
                objc_msgSend(v29, "defaultSectionID");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v44, "isEqualToString:", v45);

                v47 = v133;
                if (!v46)
                  v47 = v132;
                v48 = v47;
                if (v134)
                {
                  +[FCFeedContext feedContextForTopStoriesChannel:sectionID:](FCFeedContext, "feedContextForTopStoriesChannel:sectionID:", v29, v44);
                  v49 = objc_claimAutoreleasedReturnValue();
                }
                else if (v126)
                {
                  if (objc_msgSend(v44, "isEqualToString:", v125))
                    +[FCFeedContext feedContextForEditorialChannel:editorialGemsSectionID:](FCFeedContext, "feedContextForEditorialChannel:editorialGemsSectionID:", v29, v44);
                  else
                    +[FCFeedContext feedContextForEditorialChannel:sectionID:](FCFeedContext, "feedContextForEditorialChannel:sectionID:", v29, v44);
                  v49 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  +[FCFeedContext feedContextForChannel:sectionID:](FCFeedContext, "feedContextForChannel:sectionID:", v29, v44);
                  v49 = objc_claimAutoreleasedReturnValue();
                }
                v50 = (void *)v49;
                objc_msgSend(v29, "freeFeedIDForSection:bin:", v44, v137);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                if (v51)
                {
                  v52 = objc_alloc_init(FCFeedRequest);
                  -[FCFeedRequest setFeedID:](v52, "setFeedID:", v51);
                  -[FCFeedRequest setFeedRange:](v52, "setFeedRange:", v139);
                  -[FCFeedRequest setMaxCount:](v52, "setMaxCount:", a9);
                  objc_msgSend(v29, "defaultSectionID");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FCFeedRequest setIsExpendable:](v52, "setIsExpendable:", objc_msgSend(v44, "isEqualToString:", v53) ^ 1);

                  objc_msgSend(v48, "addObject:", v52);
                  objc_msgSend(v141, "setObject:forKey:", v50, v51);
                  if (v129[2](v129, v130))
                  {
                    objc_msgSend(v29, "paidFeedIDForSection:bin:", v44, v137);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    v55 = v54;
                    if (v54 && (objc_msgSend(v54, "isEqualToString:", v51) & 1) == 0)
                    {
                      v56 = (void *)-[FCFeedRequest copy](v52, "copy");
                      objc_msgSend(v56, "setFeedID:", v55);
                      objc_msgSend(v48, "addObject:", v56);
                      objc_msgSend(v141, "setObject:forKey:", v50, v55);

                    }
                  }

                }
              }
              v41 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v158, v174, 16);
            }
            while (v41);
          }

          v18 = v119;
          v25 = v114;
          v24 = v121;
          v26 = v124;
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("only expected to build a For You query from channels and topics"));
          *(_DWORD *)buf = 136315906;
          v178 = "+[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscri"
                 "ptionProvider:configuration:maxCount:feedRange:sidecar:options:]";
          v179 = 2080;
          v180 = "FCForYouQueryUtilities.m";
          v181 = 1024;
          v182 = 371;
          v183 = 2114;
          v184 = v38;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        ++v26;
      }
      while (v26 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v162, v176, 16);
    }
    while (v24);
  }

  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v57 = v110;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v154, v173, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v155;
    do
    {
      for (j = 0; j != v59; ++j)
      {
        if (*(_QWORD *)v155 != v60)
          objc_enumerationMutation(v57);
        v62 = *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * j);
        v63 = objc_alloc_init(FCFeedRequest);
        -[FCFeedRequest setFeedID:](v63, "setFeedID:", v62);
        -[FCFeedRequest setFeedRange:](v63, "setFeedRange:", v139);
        -[FCFeedRequest setMaxCount:](v63, "setMaxCount:", a9);
        objc_msgSend(v113, "addObject:", v63);
        +[FCFeedContext feedContextForHiddenFeed](FCFeedContext, "feedContextForHiddenFeed");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "setObject:forKeyedSubscript:", v64, v62);

      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v154, v173, 16);
    }
    while (v59);
  }

  if ((a12 & 1) == 0)
  {
    objc_msgSend(v120, "bundleSubscription");
    v65 = objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject((id)v65, (const void *)(v65 + 1));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "unsignedIntegerValue");
    v68 = v67;
    objc_getAssociatedObject((id)v65, (const void *)~v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (objc_msgSend(v69, "unsignedIntegerValue") + 1) ^ (v68 + 1);

    objc_msgSend(v112, "paidBundleConfig");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v71;
    if ((v70 & 1) != 0)
      objc_msgSend(v71, "globalFeedIDForPaidUsers");
    else
      objc_msgSend(v71, "globalFeedIDForFreeUsers");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend(v112, "paidBundleConfig");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v74, "areMagazinesEnabled");

      if (v75)
      {
        v76 = objc_alloc_init(FCFeedRequest);
        -[FCFeedRequest setFeedID:](v76, "setFeedID:", v73);
        -[FCFeedRequest setFeedRange:](v76, "setFeedRange:", v139);
        -[FCFeedRequest setMaxCount:](v76, "setMaxCount:", a9);
        objc_msgSend(v111, "addObject:", v76);
        +[FCFeedContext feedContextForPaidBundleFeed](FCFeedContext, "feedContextForPaidBundleFeed");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "setObject:forKeyedSubscript:", v77, v73);

      }
    }

  }
  v128 = v57;
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  objc_msgSend(v140, "additionalChannelsToQuery");
  v131 = (id)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v150, v172, 16);
  if (v138)
  {
    v135 = *(_QWORD *)v151;
    do
    {
      for (k = 0; k != v138; ++k)
      {
        if (*(_QWORD *)v151 != v135)
          objc_enumerationMutation(v131);
        v79 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * k);
        v146 = 0u;
        v147 = 0u;
        v148 = 0u;
        v149 = 0u;
        objc_msgSend(v140, "additionalSectionIDsToQueryForChannel:", v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v146, v171, 16);
        if (v81)
        {
          v82 = v81;
          v83 = *(_QWORD *)v147;
          do
          {
            for (m = 0; m != v82; ++m)
            {
              if (*(_QWORD *)v147 != v83)
                objc_enumerationMutation(v80);
              v85 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * m);
              +[FCFeedContext feedContextForChannel:sectionID:](FCFeedContext, "feedContextForChannel:sectionID:", v79, v85);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "freeFeedIDForSection:bin:", v85, 3);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              if (v87)
              {
                objc_msgSend(v141, "objectForKey:", v87);
                v88 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v88)
                {
                  v89 = objc_alloc_init(FCFeedRequest);
                  -[FCFeedRequest setFeedID:](v89, "setFeedID:", v87);
                  -[FCFeedRequest setFeedRange:](v89, "setFeedRange:", v139);
                  -[FCFeedRequest setMaxCount:](v89, "setMaxCount:", a9);
                  -[FCFeedRequest setIsExpendable:](v89, "setIsExpendable:", 1);
                  objc_msgSend(v136, "addObject:", v89);
                  objc_msgSend(v141, "setObject:forKey:", v86, v87);

                }
              }
              if (objc_msgSend(v140, "shouldIncludePaidFeedForChannel:", v79))
              {
                objc_msgSend(v79, "paidFeedIDForSection:bin:", v85, 3);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                if (v90)
                {
                  objc_msgSend(v141, "objectForKey:", v90);
                  v91 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v91)
                  {
                    v92 = objc_alloc_init(FCFeedRequest);
                    -[FCFeedRequest setFeedID:](v92, "setFeedID:", v90);
                    -[FCFeedRequest setFeedRange:](v92, "setFeedRange:", v139);
                    -[FCFeedRequest setMaxCount:](v92, "setMaxCount:", a9);
                    -[FCFeedRequest setIsExpendable:](v92, "setIsExpendable:", 1);
                    objc_msgSend(v136, "addObject:", v92);
                    objc_msgSend(v141, "setObject:forKey:", v86, v90);

                  }
                }

              }
            }
            v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v146, v171, 16);
          }
          while (v82);
        }

      }
      v138 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v150, v172, 16);
    }
    while (v138);
  }

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  objc_msgSend(v140, "additionalTopicsToQuery");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v142, v170, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v143;
    do
    {
      for (n = 0; n != v95; ++n)
      {
        if (*(_QWORD *)v143 != v96)
          objc_enumerationMutation(v93);
        v98 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * n);
        +[FCFeedContext feedContextForTag:](FCFeedContext, "feedContextForTag:", v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "freeFeedIDForBin:", ((uint64_t (**)(_QWORD, void *))v119)[2](v119, v98));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        if (v100)
        {
          objc_msgSend(v141, "objectForKey:", v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v101)
          {
            v102 = objc_alloc_init(FCFeedRequest);
            -[FCFeedRequest setFeedID:](v102, "setFeedID:", v100);
            -[FCFeedRequest setFeedRange:](v102, "setFeedRange:", v139);
            -[FCFeedRequest setMaxCount:](v102, "setMaxCount:", a9);
            objc_msgSend(v136, "addObject:", v102);
            objc_msgSend(v141, "setObject:forKey:", v99, v100);

          }
        }

      }
      v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v142, v170, 16);
    }
    while (v95);
  }

  v103 = -[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBundleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]([FCForYouQueryResult alloc], "initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBundleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:", v133, v132, v118, v111, v113, v136, v141);
  return v103;
}

uint64_t __167__FCForYouQueryUtilities_feedRequestsForTags_tagBinProvider_hiddenFeedIDs_purchasedTagIDs_bundleSubscriptionProvider_configuration_maxCount_feedRange_sidecar_options___block_invoke(void **a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  int HasBundleSubscriptionToChannelInline;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v3, "bundleSubscription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleChannelIDs");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)v6, "containsObject:", v4);

  LOBYTE(v6) = objc_msgSend(a1[5], "containsObject:", v4);
  HasBundleSubscriptionToChannelInline = FCPaidAccessCheckerHasBundleSubscriptionToChannelInline(a1[4], v4, 235);

  if ((v6 & 1) != 0)
    return 1;
  if ((v7 & HasBundleSubscriptionToChannelInline) == 1)
  {
    objc_msgSend(a1[6], "paidBundleConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "forYouIncludePaidSectionFeedsForPaidUsers");

    if ((v11 & 1) != 0)
      return 1;
  }
  if (((v7 ^ 1 | HasBundleSubscriptionToChannelInline) & 1) != 0)
    return 0;
  objc_msgSend(a1[6], "paidBundleConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "forYouIncludePaidSectionFeedsForFreeUsers");

  return v13;
}

+ (id)_filterTagsForQuerying:(id)a3 withMutedTagIDs:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tags");
    *(_DWORD *)buf = 136315906;
    v16 = "+[FCForYouQueryUtilities _filterTagsForQuerying:withMutedTagIDs:]";
    v17 = 2080;
    v18 = "FCForYouQueryUtilities.m";
    v19 = 1024;
    v20 = 472;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "mutedTagIDs");
    *(_DWORD *)buf = 136315906;
    v16 = "+[FCForYouQueryUtilities _filterTagsForQuerying:withMutedTagIDs:]";
    v17 = 2080;
    v18 = "FCForYouQueryUtilities.m";
    v19 = 1024;
    v20 = 473;
    v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__FCForYouQueryUtilities__filterTagsForQuerying_withMutedTagIDs___block_invoke;
  v13[3] = &unk_1E463DA78;
  v14 = v6;
  v7 = v6;
  objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __65__FCForYouQueryUtilities__filterTagsForQuerying_withMutedTagIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "asChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v4, "identifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsObject:", v3) & 1) != 0)
    {
      v7 = 0;
LABEL_10:

      goto LABEL_11;
    }
    if (!v5)
    {
      v7 = 1;
      goto LABEL_10;
    }
LABEL_7:
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "parentID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "containsObject:", v9) ^ 1;

    if (!v4)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (v5)
    goto LABEL_7;
  v7 = 1;
LABEL_11:

  return v7;
}

@end
