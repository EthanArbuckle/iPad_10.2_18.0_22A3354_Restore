@implementation FCFeedTransformationEndOfArticle

+ (id)transformationWithConfiguration:(id)a3 context:(id)a4 isPaywallAvailable:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "endOfArticleMinPaidHeadlineRatio");
  objc_msgSend(v9, "setPaidHeadlineRatio:");
  objc_msgSend(v9, "setMaxiumInaccessibleHeadlineCount:", objc_msgSend(v8, "endOfArticleMaxInaccessiblePaidArticleCount"));
  v10 = objc_msgSend(v8, "endOfArticleExpireArticlesAfter");

  objc_msgSend(v9, "setExpireArticlesAfter:", v10);
  objc_msgSend(v9, "setMinimumResultHeadlineCount:", 4);
  objc_msgSend(v9, "setIsPaywallAvailable:", v5);
  objc_msgSend(v7, "purchaseProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPurchaseProvider:", v11);
  return v9;
}

- (id)transformItems:(id)a3 isPaidBlock:(id)a4 sourceChannelIDProvider:(id)a5
{
  id v7;
  NSObject *v8;
  FCFeedTransformationEndOfArticle *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  unint64_t v15;
  double v16;
  double v17;
  unint64_t v18;
  void *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  id v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  id v69;
  void *v71;
  id v72;
  id v73;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  id v81;
  __int128 *v82;
  unint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  id v89;
  _QWORD aBlock[5];
  id v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  __int128 *p_buf;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[4];
  id v107;
  _QWORD v108[6];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint8_t v112[128];
  __int128 v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  __int128 buf;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v73 = a4;
  v72 = a5;
  v8 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "Transforming items: %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v119 = 0x3032000000;
  v120 = __Block_byref_object_copy__35;
  v121 = __Block_byref_object_dispose__35;
  v122 = (id)objc_msgSend(v7, "mutableCopy", v7);
  v9 = self;
  v10 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
  if (v10 > -[FCFeedTransformationEndOfArticle minimumResultHeadlineCount](self, "minimumResultHeadlineCount"))
  {
    *(_QWORD *)&v113 = 0;
    *((_QWORD *)&v113 + 1) = &v113;
    v114 = 0x3032000000;
    v115 = __Block_byref_object_copy__35;
    v116 = __Block_byref_object_dispose__35;
    v117 = 0;
    v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v12 = -[FCFeedTransformationEndOfArticle minimumResultHeadlineCount](self, "minimumResultHeadlineCount");
    v108[0] = MEMORY[0x1E0C809B0];
    v108[1] = 3221225472;
    v108[2] = __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke;
    v108[3] = &unk_1E463F498;
    v108[4] = &buf;
    v108[5] = &v113;
    objc_msgSend(v11, "fc_subarrayWithCount:result:", v12, v108);
    -[FCFeedTransformationEndOfArticle paidHeadlineRatio](self, "paidHeadlineRatio");
    v14 = 0.0;
    if (v13 != 0.0)
    {
      v15 = -[FCFeedTransformationEndOfArticle minimumResultHeadlineCount](self, "minimumResultHeadlineCount", v13, 0.0);
      -[FCFeedTransformationEndOfArticle paidHeadlineRatio](self, "paidHeadlineRatio");
      v17 = floor(v16 * (double)v15);
      v14 = 1.0;
      if (v17 >= 1.0)
        v14 = v17;
    }
    v18 = (unint64_t)v14;
    if ((unint64_t)v14)
    {
      v19 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      v106[0] = MEMORY[0x1E0C809B0];
      v106[1] = 3221225472;
      v106[2] = __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_2;
      v106[3] = &unk_1E4644500;
      v20 = v73;
      v107 = v20;
      v21 = objc_msgSend(v19, "fc_countOfObjectsPassingTest:", v106);
      v22 = v18 - v21;
      if (v18 > v21)
      {
        v23 = (void *)objc_opt_new();
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 40), "copy");
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v103;
LABEL_11:
          v27 = 0;
          while (1)
          {
            if (*(_QWORD *)v103 != v26)
              objc_enumerationMutation(v24);
            v28 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * v27);
            if ((*((unsigned int (**)(id, uint64_t))v20 + 2))(v20, v28))
            {
              objc_msgSend(v23, "addObject:", v28);
              objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 40), "removeObject:", v28);
            }
            if (objc_msgSend(v23, "count") >= v22)
              break;
            if (v25 == ++v27)
            {
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
              if (v25)
                goto LABEL_11;
              break;
            }
          }
        }

        v29 = (void *)objc_opt_new();
        v30 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        v97[0] = MEMORY[0x1E0C809B0];
        v97[1] = 3221225472;
        v97[2] = __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_3;
        v97[3] = &unk_1E4644528;
        v31 = v29;
        v98 = v31;
        v32 = v23;
        v99 = v32;
        p_buf = &buf;
        v100 = v20;
        objc_msgSend(v30, "enumerateObjectsWithOptions:usingBlock:", 2, v97);
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v33 = v31;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
        if (v34)
        {
          v35 = *(_QWORD *)v94;
LABEL_21:
          v36 = 0;
          while (1)
          {
            if (*(_QWORD *)v94 != v35)
              objc_enumerationMutation(v33);
            v37 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v36);
            if (!objc_msgSend(v32, "count"))
              break;
            objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectAtIndex:", objc_msgSend(v37, "unsignedIntegerValue"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 40), "insertObject:atIndex:", v38, 0);
            v39 = *(void **)(*((_QWORD *)&buf + 1) + 40);
            v40 = objc_msgSend(v37, "unsignedIntegerValue");
            objc_msgSend(v32, "firstObject");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "replaceObjectAtIndex:withObject:", v40, v41);

            objc_msgSend(v32, "removeObjectAtIndex:", 0);
            if (v34 == ++v36)
            {
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
              if (v34)
                goto LABEL_21;
              break;
            }
          }
        }

      }
      v9 = self;
    }
    if (-[FCFeedTransformationEndOfArticle isPaywallAvailable](v9, "isPaywallAvailable"))
      v42 = -[FCFeedTransformationEndOfArticle maxiumInaccessibleHeadlineCount](self, "maxiumInaccessibleHeadlineCount");
    else
      v42 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_4;
    aBlock[3] = &unk_1E4644550;
    aBlock[4] = self;
    v91 = v73;
    v92 = v72;
    v43 = _Block_copy(aBlock);
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_5;
    v88[3] = &unk_1E4644578;
    v44 = v43;
    v89 = v44;
    v45 = _Block_copy(v88);
    v46 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "fc_countOfObjectsPassingTest:", v45);
    v47 = v46 - v42;
    if (v46 > v42)
    {
      v48 = (void *)objc_opt_new();
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v49 = *(id *)(*((_QWORD *)&v113 + 1) + 40);
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v84, v110, 16);
      if (v50)
      {
        v51 = *(_QWORD *)v85;
LABEL_35:
        v52 = 0;
        while (1)
        {
          if (*(_QWORD *)v85 != v51)
            objc_enumerationMutation(v49);
          v53 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v52);
          if ((*((unsigned int (**)(id, uint64_t))v44 + 2))(v44, v53))
            objc_msgSend(v48, "addObject:", v53);
          if (objc_msgSend(v48, "count") >= v47)
            break;
          if (v50 == ++v52)
          {
            v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v84, v110, 16);
            if (v50)
              goto LABEL_35;
            break;
          }
        }
      }

      v54 = (void *)objc_opt_new();
      v55 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_6;
      v79[3] = &unk_1E46445A0;
      v56 = v54;
      v80 = v56;
      v83 = v47;
      v81 = v45;
      v82 = &buf;
      objc_msgSend(v55, "enumerateObjectsWithOptions:usingBlock:", 2, v79);
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v57 = v56;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v75, v109, 16);
      if (v58)
      {
        v59 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v58; ++i)
          {
            if (*(_QWORD *)v76 != v59)
              objc_enumerationMutation(v57);
            v61 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
            if (objc_msgSend(v48, "count"))
            {
              v62 = *(void **)(*((_QWORD *)&buf + 1) + 40);
              v63 = objc_msgSend(v61, "unsignedIntegerValue");
              objc_msgSend(v48, "firstObject");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "replaceObjectAtIndex:withObject:", v63, v64);

              v65 = 0;
              v66 = v48;
            }
            else
            {
              if (-[FCFeedTransformationEndOfArticle isPaywallAvailable](self, "isPaywallAvailable"))
                goto LABEL_54;
              v66 = *(void **)(*((_QWORD *)&buf + 1) + 40);
              v65 = objc_msgSend(v61, "unsignedIntegerValue");
            }
            objc_msgSend(v66, "removeObjectAtIndex:", v65);
          }
          v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v75, v109, 16);
        }
        while (v58);
      }
LABEL_54:

    }
    _Block_object_dispose(&v113, 8);

  }
  v67 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v68 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    LODWORD(v113) = 138412290;
    *(_QWORD *)((char *)&v113 + 4) = v68;
    _os_log_impl(&dword_1A1B90000, v67, OS_LOG_TYPE_DEFAULT, "Transformed items: %@", (uint8_t *)&v113, 0xCu);
  }
  v69 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v69;
}

void __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = objc_msgSend(a2, "mutableCopy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_msgSend(v5, "mutableCopy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

uint64_t __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v7 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v7 >= objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) == 0)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }
}

uint64_t __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    objc_msgSend(*(id *)(a1 + 32), "purchaseProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "purchasedTagIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_5(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

void __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(_QWORD *)(a1 + 56))
  {
    *a4 = 1;
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    if ((_DWORD)v7)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

    }
  }
}

- (id)transformFeedItems:(id)a3
{
  return -[FCFeedTransformationEndOfArticle transformItems:isPaidBlock:sourceChannelIDProvider:](self, "transformItems:isPaidBlock:sourceChannelIDProvider:", a3, &__block_literal_global_77, &__block_literal_global_7_1);
}

uint64_t __55__FCFeedTransformationEndOfArticle_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPaid");
}

uint64_t __55__FCFeedTransformationEndOfArticle_transformFeedItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sourceChannelID");
}

- (id)transformHeadlines:(id)a3
{
  return -[FCFeedTransformationEndOfArticle transformItems:isPaidBlock:sourceChannelIDProvider:](self, "transformItems:isPaidBlock:sourceChannelIDProvider:", a3, &__block_literal_global_9, &__block_literal_global_11_0);
}

uint64_t __55__FCFeedTransformationEndOfArticle_transformHeadlines___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPaid");
}

id __55__FCFeedTransformationEndOfArticle_transformHeadlines___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "sourceChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)minimumResultHeadlineCount
{
  return self->_minimumResultHeadlineCount;
}

- (void)setMinimumResultHeadlineCount:(unint64_t)a3
{
  self->_minimumResultHeadlineCount = a3;
}

- (double)paidHeadlineRatio
{
  return self->_paidHeadlineRatio;
}

- (void)setPaidHeadlineRatio:(double)a3
{
  self->_paidHeadlineRatio = a3;
}

- (unint64_t)maxiumInaccessibleHeadlineCount
{
  return self->_maxiumInaccessibleHeadlineCount;
}

- (void)setMaxiumInaccessibleHeadlineCount:(unint64_t)a3
{
  self->_maxiumInaccessibleHeadlineCount = a3;
}

- (unint64_t)expireArticlesAfter
{
  return self->_expireArticlesAfter;
}

- (void)setExpireArticlesAfter:(unint64_t)a3
{
  self->_expireArticlesAfter = a3;
}

- (BOOL)isPaywallAvailable
{
  return self->_isPaywallAvailable;
}

- (void)setIsPaywallAvailable:(BOOL)a3
{
  self->_isPaywallAvailable = a3;
}

- (FCPurchaseProviderType)purchaseProvider
{
  return self->_purchaseProvider;
}

- (void)setPurchaseProvider:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseProvider, 0);
}

@end
