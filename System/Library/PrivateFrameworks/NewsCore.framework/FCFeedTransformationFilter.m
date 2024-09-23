@implementation FCFeedTransformationFilter

+ (id)transformationWithFilterOptions:(unint64_t)a3 otherArticleIDs:(id)a4 otherClusterIDs:(id)a5 subscribedTagIDs:(id)a6 mutedTagIDs:(id)a7 readingHistoryItems:(id)a8 playlistArticleIDs:(id)a9 downloadedArticleIDs:(id)a10 briefingsTagID:(id)a11 paidAccessChecker:(id)a12 bundleSubscription:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id *v24;
  const char *v25;
  id *v26;
  SEL v27;
  SEL v28;
  SEL v29;
  SEL v30;
  id v31;
  void *v32;
  const char *v33;
  void *v34;
  void *v35;
  SEL v36;
  SEL v37;
  id v38;
  id v41;
  id v42;
  id newValue;

  newValue = a4;
  v42 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v41 = a10;
  v21 = a11;
  v22 = a13;
  v23 = a12;
  v24 = (id *)objc_opt_new();
  v26 = v24;
  if (v24)
  {
    v24[1] = (id)a3;
    objc_setProperty_nonatomic_copy(v24, v25, newValue, 16);
    objc_setProperty_nonatomic_copy(v26, v27, v42, 24);
    objc_setProperty_nonatomic_copy(v26, v28, v17, 40);
    objc_setProperty_nonatomic_copy(v26, v29, v18, 32);
    objc_setProperty_nonatomic_copy(v26, v30, v19, 48);
  }
  if (v20)
    v31 = v20;
  else
    v31 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v32;
  if (v26)
  {
    objc_setProperty_nonatomic_copy(v26, v33, v32, 56);

    v35 = v41;
    objc_setProperty_nonatomic_copy(v26, v36, v41, 64);
    objc_setProperty_nonatomic_copy(v26, v37, v21, 72);
    objc_storeStrong(v26 + 10, a12);

    v38 = v22;
    v23 = v26[11];
    v26[11] = v38;
  }
  else
  {

    v35 = v41;
  }

  return v26;
}

+ (id)transformationWithFilterOptions:(unint64_t)a3 configuration:(id)a4 context:(id)a5 otherArticleIDs:(id)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "setWithArray:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subscriptionList");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "subscribedTagIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subscriptionList");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "mutedTagIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "readingHistory");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "readingHistoryItemsByArticleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "audioPlaylist");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "articleIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "offlineArticleManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "readableArticleIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "briefingsTagID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "paidAccessChecker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleSubscriptionManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "cachedSubscription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "transformationWithFilterOptions:otherArticleIDs:otherClusterIDs:subscribedTagIDs:mutedTagIDs:readingHistoryItems:playlistArticleIDs:downloadedArticleIDs:briefingsTagID:paidAccessChecker:bundleSubscription:", a3, v12, 0, v23, v22, v20, v13, v14, v15, v16, v18);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)transformationWithFilterOptions:(unint64_t)a3 configuration:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  v7 = a5;
  v8 = a4;
  objc_msgSend(v7, "subscriptionList");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "subscribedTagIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscriptionList");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mutedTagIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readingHistory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "readingHistoryItemsByArticleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioPlaylist");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "articleIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "offlineArticleManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "readableArticleIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "briefingsTagID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "paidAccessChecker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleSubscriptionManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "cachedSubscription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "transformationWithFilterOptions:otherArticleIDs:otherClusterIDs:subscribedTagIDs:mutedTagIDs:readingHistoryItems:playlistArticleIDs:downloadedArticleIDs:briefingsTagID:paidAccessChecker:bundleSubscription:", a3, 0, 0, v9, v10, v19, v11, v13, v14, v15, v17);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)transformFeedItems:(id)a3
{
  void *v3;
  void *v4;

  -[FCFeedTransformationFilter transformFeedItemsWithResults:](self, "transformFeedItemsWithResults:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_138);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __49__FCFeedTransformationFilter_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isFiltered") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)transformHeadline:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v10 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCFeedTransformationFilter transformFeedItems:](self, "transformFeedItems:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)transformFeedItemsWithResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSSet *otherArticleIDs;
  void *v9;
  NSSet *v10;
  void *v11;
  void *v12;
  void *v13;
  NSSet *otherClusterIDs;
  NSSet *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  char v30;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    if (self->_filterOptions == 1)
    {
      objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_31);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    otherArticleIDs = self->_otherArticleIDs;
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    otherArticleIDs = 0;
  }
  v9 = (void *)MEMORY[0x1E0C99E20];
  v10 = otherArticleIDs;
  objc_msgSend(v9, "setWithSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E20];
  if (self)
    otherClusterIDs = self->_otherClusterIDs;
  else
    otherClusterIDs = 0;
  v15 = otherClusterIDs;
  objc_msgSend(v13, "setWithSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[FCRestrictions sharedInstance](FCRestrictions, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isExplicitContentAllowed");

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60__FCFeedTransformationFilter_transformFeedItemsWithResults___block_invoke_3;
  v25[3] = &unk_1E4647F28;
  v25[4] = self;
  v26 = v11;
  v27 = v12;
  v28 = v16;
  v30 = v18;
  v19 = v7;
  v29 = v19;
  v20 = v11;
  v21 = v12;
  v22 = v16;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v25);
  v23 = v29;
  v6 = v19;

LABEL_8:
  return v6;
}

FCFeedTransformationFilterItemResult *__60__FCFeedTransformationFilter_transformFeedItemsWithResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  FCFeedTransformationFilterItemResult *v3;

  v2 = a2;
  v3 = -[FCFeedTransformationFilterItemResult initWithItem:filtered:filteredReasons:]([FCFeedTransformationFilterItemResult alloc], "initWithItem:filtered:filteredReasons:", v2, 0, 0);

  return v3;
}

void __60__FCFeedTransformationFilter_transformFeedItemsWithResults___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  int v37;
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  void *v41;
  int v42;
  int v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  void *v48;
  int v49;
  uint64_t v50;
  id v51;
  int v52;
  int v53;
  void *v54;
  int HasAccessToItemInline;
  char *v56;
  char *v57;
  char *v58;
  void *v59;
  uint64_t v60;
  char v61;
  void *v62;
  char v63;
  id v64;
  int v65;
  int v66;
  void *v67;
  int v68;
  void *v69;
  _QWORD *v70;
  _QWORD *v71;
  void *v72;
  int v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  void *v77;
  _QWORD *v78;
  _QWORD *v79;
  void *v80;
  int v81;
  uint64_t v82;
  char v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  int v88;
  id v89;
  void *v90;
  char v91;
  uint64_t v92;
  id v93;
  void *v94;
  int v95;
  uint64_t v96;
  int v97;
  id v98;
  _QWORD *v99;
  _QWORD *v100;
  void *v101;
  int v102;
  id v103;
  _QWORD *v104;
  _QWORD *v105;
  void *v106;
  int v107;
  void *v108;
  void *v109;
  void *v110;
  _QWORD *v111;
  _QWORD *v112;
  int v113;
  int v114;
  int v115;
  id v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  uint64_t v127;
  void *v128;
  _QWORD *v129;
  _QWORD *v130;
  void *v131;
  int v132;
  void *v133;
  id v134;
  void *v135;
  int v136;
  id v137;
  void *v138;
  int v139;
  uint64_t v140;
  void *v141;
  id v142;
  void *v143;
  int v144;
  FCFeedTransformationFilterItemResult *v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
  {
    v7 = 0;
    v25 = 0;
    goto LABEL_184;
  }
  if ((*(_BYTE *)(v5 + 8) & 2) == 0)
    goto LABEL_24;
  objc_msgSend(v3, "articleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    v25 = 0;
    goto LABEL_25;
  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v4, "articleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  v11 = *(_QWORD *)(a1 + 32);
  if (!v11 || (*(_BYTE *)(v11 + 8) & 0x40) == 0)
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v4, "articleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    v14 = *(void **)(a1 + 48);
    objc_msgSend(v4, "articleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v26 = *(void **)(a1 + 48);
      objc_msgSend(v4, "articleID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v4, v27);

      if (v10)
        goto LABEL_8;
LABEL_24:
      v25 = 0;
      v7 = 0;
      goto LABEL_25;
    }
  }
  if (!v10)
    goto LABEL_24;
LABEL_8:
  v17 = *(void **)(a1 + 48);
  objc_msgSend(v4, "articleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    objc_msgSend(v4, "surfacedByArticleListIDs", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v146, v150, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v147;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v147 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v19, "addSurfacedByArticleListID:", *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * i));
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v146, v150, 16);
      }
      while (v22);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "conditionalScore");
      objc_msgSend(v19, "applyConditionalScore:");
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "isEvergreen"))
      objc_msgSend(v19, "markAsEvergreen");
  }

  v7 = 1;
  v25 = 2;
LABEL_25:
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    goto LABEL_184;
  if ((*(_BYTE *)(v5 + 8) & 4) != 0)
  {
    objc_msgSend(v4, "clusterID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    if (v29)
    {
      v30 = *(void **)(a1 + 56);
      objc_msgSend(v4, "clusterID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "containsObject:", v31);

      v7 = v7 | v32;
      v33 = *(_QWORD *)(a1 + 32);
      if (!v33 || (*(_BYTE *)(v33 + 8) & 0x80) == 0)
      {
        v34 = *(void **)(a1 + 56);
        objc_msgSend(v4, "clusterID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v35);

      }
      if (v32)
        v25 |= 4uLL;
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    goto LABEL_184;
  v36 = *(_QWORD *)(v5 + 8);
  if ((v36 & 8) != 0)
  {
    v37 = objc_msgSend(v4, "isFromBlockedStorefront");
    if (v37)
      v25 |= 8uLL;
    v7 = v37 | v7;
    v5 = *(_QWORD *)(a1 + 32);
    if (!v5)
      goto LABEL_184;
    v36 = *(_QWORD *)(v5 + 8);
  }
  if ((v36 & 0x10) != 0 && !*(_BYTE *)(a1 + 72))
  {
    v43 = objc_msgSend(v4, "isExplicitContent");
    if (v43)
      v25 |= 0x10uLL;
    v7 = v43 | v7;
    v5 = *(_QWORD *)(a1 + 32);
    if (!v5)
      goto LABEL_184;
    if ((*(_QWORD *)(v5 + 8) & 0x20) == 0)
      goto LABEL_54;
  }
  else if ((v36 & 0x20) == 0)
  {
LABEL_54:
    v42 = 0;
    goto LABEL_55;
  }
  v38 = *(id *)(v5 + 32);
  if (!objc_msgSend(v38, "count"))
  {

    goto LABEL_54;
  }
  v39 = *(_QWORD **)(a1 + 32);
  if (v39)
    v39 = (_QWORD *)v39[4];
  v40 = v39;
  objc_msgSend(v4, "sourceChannelID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v40, "containsObject:", v41);

  if (v42)
    v25 |= 0x20uLL;
LABEL_55:
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v42 | v7;
  if (!v5)
    goto LABEL_184;
  if ((*(_BYTE *)(v5 + 11) & 4) == 0 || (objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v4, "role") == 8)
    goto LABEL_68;
  v44 = *(_QWORD **)(a1 + 32);
  if (v44)
    v44 = (_QWORD *)v44[4];
  v45 = v44;
  if (!objc_msgSend(v45, "count"))
  {

LABEL_68:
    v49 = 0;
    goto LABEL_69;
  }
  v46 = *(_QWORD **)(a1 + 32);
  if (v46)
    v46 = (_QWORD *)v46[4];
  v47 = v46;
  objc_msgSend(v4, "sourceChannelID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v47, "containsObject:", v48);

  if (v49)
    v25 |= 0x4000000uLL;
LABEL_69:
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v49 | v7;
  if (!v5)
    goto LABEL_184;
  v50 = *(_QWORD *)(v5 + 8);
  if ((v50 & 0x100) == 0)
  {
    if ((v50 & 0x200) == 0)
      goto LABEL_77;
    goto LABEL_72;
  }
  +[FCRestrictions sharedInstance](FCRestrictions, "sharedInstance");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "isNewsVersionAllowed:", objc_msgSend(v4, "minimumNewsVersion"));

  if (!v73)
    v25 |= 0x100uLL;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v73 ^ 1 | v7;
  if (!v5)
    goto LABEL_184;
  v50 = *(_QWORD *)(v5 + 8);
  if ((v50 & 0x200) != 0)
  {
LABEL_72:
    if (objc_msgSend(v4, "contentType") == 2)
    {
      v7 = v7;
    }
    else
    {
      v25 |= 0x200uLL;
      v7 = 1;
    }
    v5 = *(_QWORD *)(a1 + 32);
    if (!v5)
      goto LABEL_184;
    v50 = *(_QWORD *)(v5 + 8);
  }
LABEL_77:
  if ((v50 & 0x800) != 0)
  {
    v51 = *(id *)(v5 + 80);
    v52 = objc_msgSend(v4, "isPaid");
    v53 = objc_msgSend(v4, "isBundlePaid");
    objc_msgSend(v4, "sourceChannelID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    HasAccessToItemInline = FCPaidAccessCheckerHasAccessToItemInline(v51, v52, v53, v54, 19);

    if (!HasAccessToItemInline)
      v25 |= 0x800uLL;
    v7 = HasAccessToItemInline ^ 1 | v7;
    v5 = *(_QWORD *)(a1 + 32);
    if (!v5)
      goto LABEL_184;
    v50 = *(_QWORD *)(v5 + 8);
  }
  if ((v50 & 0x400000000) != 0)
  {
    v56 = (char *)*(id *)(v5 + 88);
    v57 = v56 + 1;
    v58 = v56;
    objc_getAssociatedObject(v58, v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "unsignedIntegerValue");
    v61 = v60;
    objc_getAssociatedObject(v58, (const void *)~v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = objc_msgSend(v62, "unsignedIntegerValue") ^ v61;
    v5 = *(_QWORD *)(a1 + 32);
    if ((v63 & 1) != 0)
    {
      if (v5)
        v5 = *(_QWORD *)(v5 + 80);
      v64 = (id)v5;
      v65 = objc_msgSend(v4, "isPaid");
      v66 = objc_msgSend(v4, "isBundlePaid");
      objc_msgSend(v4, "sourceChannelID");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = FCPaidAccessCheckerHasAccessToItemInline(v64, v65, v66, v67, 35);

      if (!v68)
        v25 |= 0x400000000uLL;
      v7 = v68 ^ 1 | v7;
      v5 = *(_QWORD *)(a1 + 32);
    }
    if (!v5)
      goto LABEL_184;
    v50 = *(_QWORD *)(v5 + 8);
  }
  if ((v50 & 0x1000) != 0)
  {
    objc_msgSend(v4, "topicIDs");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = *(_QWORD **)(a1 + 32);
    if (v70)
      v70 = (_QWORD *)v70[9];
    v71 = v70;
    if (objc_msgSend(v69, "containsObject:", v71))
    {

    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

        goto LABEL_106;
      }
      v74 = objc_msgSend(v4, "role");

      if (v74 != 8)
        goto LABEL_106;
    }
    v25 |= 0x1000uLL;
    v7 = 1;
  }
LABEL_106:
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    goto LABEL_184;
  if ((*(_BYTE *)(v5 + 9) & 4) != 0 && (objc_msgSend(v4, "isPaid") & 1) == 0)
  {
    v75 = objc_msgSend(v4, "isBundlePaid");
    if (!v75)
      v25 |= 0x400uLL;
    v7 = v75 ^ 1 | v7;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    goto LABEL_184;
  if ((*(_BYTE *)(v5 + 10) & 1) != 0
    && objc_msgSend(v4, "isBundlePaid")
    && (objc_msgSend(v4, "sourceChannelID"), (v76 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v77 = (void *)v76;
    v78 = *(_QWORD **)(a1 + 32);
    if (v78)
      v78 = (_QWORD *)v78[11];
    v79 = v78;
    objc_msgSend(v4, "sourceChannelID");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v79, "containsTagID:", v80);

    if (v81)
      v25 |= 0x10000uLL;
  }
  else
  {
    v81 = 0;
  }
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v81 | v7;
  if (!v5)
    goto LABEL_184;
  v82 = *(_QWORD *)(v5 + 8);
  if ((v82 & 0x2000) != 0)
  {
    v83 = objc_opt_respondsToSelector();
    v5 = *(_QWORD *)(a1 + 32);
    if ((v83 & 1) != 0)
    {
      if (v5)
        v5 = *(_QWORD *)(v5 + 80);
      v84 = (id)v5;
      v85 = objc_msgSend(v4, "isPaid");
      v86 = objc_msgSend(v4, "isBundlePaid");
      objc_msgSend(v4, "sourceChannel");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v84, "canGetAccessToItemPaid:bundlePaid:channel:", v85, v86, v87);

      if (!v88)
        v25 |= 0x2000uLL;
      v7 = v88 ^ 1 | v7;
      v5 = *(_QWORD *)(a1 + 32);
    }
    if (!v5)
      goto LABEL_184;
    v82 = *(_QWORD *)(v5 + 8);
  }
  if ((v82 & 0x4000) != 0)
  {
    v93 = *(id *)(v5 + 40);
    objc_msgSend(v4, "sourceChannelID");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v93, "containsObject:", v94);

    if (!v95)
      v25 |= 0x4000uLL;
    v5 = *(_QWORD *)(a1 + 32);
    v7 = v95 ^ 1 | v7;
    if (!v5)
      goto LABEL_184;
    if ((*(_QWORD *)(v5 + 8) & 0x20000000) == 0)
      goto LABEL_146;
    goto LABEL_134;
  }
  if ((v82 & 0x20000000) != 0)
  {
LABEL_134:
    v89 = *(id *)(v5 + 40);
    objc_msgSend(v4, "sourceChannelID");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v89, "containsObject:", v90);

    if ((v91 & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v92 = objc_msgSend(v4, "storyType");
      else
        v92 = 0;
      if (v92 == 5)
      {
        v7 = v7;
      }
      else
      {
        v25 |= 0x20000000uLL;
        v7 = 1;
      }
    }
  }
LABEL_146:
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    goto LABEL_184;
  v96 = *(_QWORD *)(v5 + 8);
  if ((v96 & 0x8000) == 0)
  {
LABEL_152:
    if ((v96 & 0x20000) != 0)
    {
      v98 = *(id *)(v5 + 32);
      if (objc_msgSend(v98, "count"))
      {
        v99 = *(_QWORD **)(a1 + 32);
        if (v99)
          v99 = (_QWORD *)v99[4];
        v100 = v99;
        objc_msgSend(v4, "topicIDs");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = objc_msgSend(v100, "fc_containsAnyObjectInArray:", v101);

        if (v102)
          v25 |= 0x20000uLL;
LABEL_161:
        v5 = *(_QWORD *)(a1 + 32);
        v7 = v102 | v7;
        if (!v5)
          goto LABEL_184;
        if ((*(_BYTE *)(v5 + 10) & 4) == 0)
          goto LABEL_176;
        v103 = *(id *)(v5 + 32);
        if (objc_msgSend(v103, "count"))
        {
          v104 = *(_QWORD **)(a1 + 32);
          if (v104)
            v104 = (_QWORD *)v104[4];
          v105 = v104;
          objc_msgSend(v4, "topicIDs");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend(v105, "fc_containsAnyObjectInArray:", v106);

          if (!v107)
            goto LABEL_176;
          objc_msgSend(v4, "sourceFeedID");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("@$"));
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "componentsSeparatedByCharactersInSet:", v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "objectAtIndexedSubscript:", 0);
          v103 = (id)objc_claimAutoreleasedReturnValue();

          if (v103)
          {
            v111 = *(_QWORD **)(a1 + 32);
            if (v111)
              v111 = (_QWORD *)v111[4];
            v112 = v111;
            v113 = objc_msgSend(v112, "containsObject:", v103);
            v114 = v113 ^ 1;

            if (!v113)
              v25 |= 0x40000uLL;
          }
          else
          {
            v114 = 0;
          }
          v7 = v114 | v7;
        }

LABEL_176:
        v5 = *(_QWORD *)(a1 + 32);
        if (v5)
        {
          if ((*(_BYTE *)(v5 + 10) & 8) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v115 = objc_msgSend(v4, "isEvergreen");
            if (v115)
              v25 |= 0x80000uLL;
            v7 = v115 | v7;
          }
          v5 = *(_QWORD *)(a1 + 32);
          if (v5)
            v5 = *(_QWORD *)(v5 + 48);
        }
        goto LABEL_184;
      }

    }
    v102 = 0;
    goto LABEL_161;
  }
  v97 = objc_msgSend(v4, "hasVideo");
  if (!v97)
    v25 |= 0x8000uLL;
  v7 = v97 ^ 1 | v7;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v96 = *(_QWORD *)(v5 + 8);
    goto LABEL_152;
  }
LABEL_184:
  v116 = (id)v5;
  objc_msgSend(v4, "articleID");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "objectForKey:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = *(_QWORD *)(a1 + 32);
  if (!v119)
    goto LABEL_256;
  v120 = *(_QWORD *)(v119 + 8);
  if ((v120 & 0x100000) != 0)
  {
    v121 = objc_msgSend(v118, "hasArticleBeenSeen");
    if (v121)
      v25 |= 0x100000uLL;
    v7 = v121 | v7;
    v119 = *(_QWORD *)(a1 + 32);
    if (!v119)
      goto LABEL_256;
    v120 = *(_QWORD *)(v119 + 8);
  }
  if ((v120 & 0x200000) != 0)
  {
    v122 = objc_msgSend(v118, "hasArticleBeenRead");
    if (v122)
      v25 |= 0x200000uLL;
    v7 = v122 | v7;
    v119 = *(_QWORD *)(a1 + 32);
    if (!v119)
      goto LABEL_256;
    v120 = *(_QWORD *)(v119 + 8);
  }
  if ((v120 & 0x800000) == 0)
  {
    if ((v120 & 0x400000) == 0)
      goto LABEL_201;
    goto LABEL_197;
  }
  objc_msgSend(v118, "lastListenedAt");
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  if (v133)
    v25 |= 0x800000uLL;
  v119 = *(_QWORD *)(a1 + 32);
  if (v133)
    v7 = 1;
  else
    v7 = v7;
  if (!v119)
    goto LABEL_256;
  v120 = *(_QWORD *)(v119 + 8);
  if ((v120 & 0x400000) != 0)
  {
LABEL_197:
    v123 = objc_msgSend(v118, "hasArticleCompletedReading");
    if (v123)
      v25 |= 0x400000uLL;
    v7 = v123 | v7;
    v119 = *(_QWORD *)(a1 + 32);
    if (!v119)
      goto LABEL_256;
    v120 = *(_QWORD *)(v119 + 8);
  }
LABEL_201:
  if ((v120 & 0x1000000) != 0)
  {
    v124 = objc_msgSend(v118, "hasArticleCompletedListening");
    if (v124)
      v25 |= 0x1000000uLL;
    v7 = v124 | v7;
    v119 = *(_QWORD *)(a1 + 32);
    if (!v119)
      goto LABEL_256;
    v120 = *(_QWORD *)(v119 + 8);
  }
  if ((v120 & 0x8000000) != 0)
  {
    v125 = objc_msgSend(v118, "hasArticleBeenRemovedFromAudio");
    if (v125)
      v25 |= 0x8000000uLL;
    v7 = v125 | v7;
    v119 = *(_QWORD *)(a1 + 32);
    if (!v119)
      goto LABEL_256;
    v120 = *(_QWORD *)(v119 + 8);
  }
  if ((v120 & 0x40000000) != 0)
  {
    if (objc_msgSend(v118, "articleLikingStatus") == 2)
    {
      v25 |= 0x40000000uLL;
      v7 = 1;
    }
    else
    {
      v7 = v7;
    }
    v119 = *(_QWORD *)(a1 + 32);
    if (!v119)
      goto LABEL_256;
    v120 = *(_QWORD *)(v119 + 8);
  }
  if ((v120 & 0x80000000) != 0)
  {
    v126 = objc_msgSend(v4, "isSponsored");
    if (v126)
      v25 |= 0x80000000uLL;
    v7 = v126 | v7;
    v119 = *(_QWORD *)(a1 + 32);
    if (!v119)
      goto LABEL_256;
    v120 = *(_QWORD *)(v119 + 8);
  }
  if ((v120 & 0x2000000) != 0)
  {
    v134 = *(id *)(v119 + 56);
    objc_msgSend(v4, "articleID");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = objc_msgSend(v134, "containsObject:", v135);

    if (v136)
      v25 |= 0x2000000uLL;
    v7 = v136 | v7;
    v119 = *(_QWORD *)(a1 + 32);
    if (!v119)
      goto LABEL_256;
    v120 = *(_QWORD *)(v119 + 8);
    if ((v120 & 0x10000000) == 0)
      goto LABEL_224;
LABEL_245:
    v137 = *(id *)(v119 + 64);
    objc_msgSend(v4, "articleID");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = objc_msgSend(v137, "containsObject:", v138);

    if (!v139)
      v25 |= 0x10000000uLL;
    v7 = v139 ^ 1 | v7;
    v119 = *(_QWORD *)(a1 + 32);
    if (!v119)
      goto LABEL_256;
    if ((*(_QWORD *)(v119 + 8) & 0x100000000) == 0)
      goto LABEL_225;
    goto LABEL_249;
  }
  if ((v120 & 0x10000000) != 0)
    goto LABEL_245;
LABEL_224:
  if ((v120 & 0x100000000) == 0)
  {
LABEL_225:
    if ((*(_BYTE *)(v119 + 12) & 2) != 0)
    {
      if (objc_msgSend(v4, "reduceVisibilityForNonFollowers"))
      {
        objc_msgSend(v4, "sourceChannelID");
        v127 = objc_claimAutoreleasedReturnValue();
        if (v127)
        {
          v128 = (void *)v127;
          v129 = *(_QWORD **)(a1 + 32);
          if (v129)
            v129 = (_QWORD *)v129[5];
          v130 = v129;
          objc_msgSend(v4, "sourceChannelID");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = objc_msgSend(v130, "containsObject:", v131);

          if (!v132)
            v25 |= 0x200000000uLL;
          v7 = v132 ^ 1 | v7;
        }
      }
    }
    goto LABEL_256;
  }
LABEL_249:
  objc_msgSend(v4, "sourceChannelID");
  v140 = objc_claimAutoreleasedReturnValue();
  v119 = *(_QWORD *)(a1 + 32);
  if (v140)
  {
    v141 = (void *)v140;
    if (v119)
      v119 = *(_QWORD *)(v119 + 88);
    v142 = (id)v119;
    objc_msgSend(v4, "sourceChannelID");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend(v142, "containsTagID:", v143);

    if (!v144)
      v25 |= 0x100000000uLL;
    v7 = v144 ^ 1 | v7;
    v119 = *(_QWORD *)(a1 + 32);
  }
  if (v119)
    goto LABEL_225;
LABEL_256:
  v145 = -[FCFeedTransformationFilterItemResult initWithItem:filtered:filteredReasons:]([FCFeedTransformationFilterItemResult alloc], "initWithItem:filtered:filteredReasons:", v4, v7, v25);
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v145);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleSubscription, 0);
  objc_storeStrong((id *)&self->_paidAccessChecker, 0);
  objc_storeStrong((id *)&self->_briefingsTagID, 0);
  objc_storeStrong((id *)&self->_downloadedArticleIDs, 0);
  objc_storeStrong((id *)&self->_playlistArticleIDs, 0);
  objc_storeStrong((id *)&self->_readingHistoryItems, 0);
  objc_storeStrong((id *)&self->_subscribedTagIDs, 0);
  objc_storeStrong((id *)&self->_mutedTagIDs, 0);
  objc_storeStrong((id *)&self->_otherClusterIDs, 0);
  objc_storeStrong((id *)&self->_otherArticleIDs, 0);
}

@end
