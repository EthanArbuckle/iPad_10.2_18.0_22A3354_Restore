@implementation NTPBTodayConfig(Mastering)

- (void)nt_resolveFallbacksWithPaidAccessChecker:()Mastering heldArticleRecords:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTPBTodayConfig(Mastering) nt_resolveFallbacksWithPaidAccessChecker:heldArticleRecords:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTPBTodayConfig(Mastering) nt_resolveFallbacksWithPaidAccessChecker:heldArticleRecords:].cold.1();
LABEL_6:
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(a1, "todayQueueConfigs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v51;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v51 != v34)
          objc_enumerationMutation(obj);
        v36 = v8;
        v9 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v8);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        objc_msgSend(v9, "todaySectionConfigs");
        v40 = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v47;
          v37 = *(_QWORD *)v47;
          do
          {
            v13 = 0;
            v41 = v11;
            do
            {
              if (*(_QWORD *)v47 != v12)
                objc_enumerationMutation(v40);
              v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v13);
              v15 = objc_msgSend(v14, "sectionType");
              if (v15 == 5)
              {
                objc_msgSend(v14, "itemsTodaySectionConfig");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = 0u;
                v43 = 0u;
                v44 = 0u;
                v45 = 0u;
                objc_msgSend(v20, "items");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
                if (v26)
                {
                  v27 = v26;
                  v38 = v20;
                  v39 = v13;
                  v28 = *(_QWORD *)v43;
                  do
                  {
                    for (i = 0; i != v27; ++i)
                    {
                      if (*(_QWORD *)v43 != v28)
                        objc_enumerationMutation(v17);
                      v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                      objc_msgSend(v30, "article");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v31)
                      {
                        objc_msgSend(a1, "_resolveArticle:withPaidAccessChecker:heldArticleRecords:", v31, v6, v7);
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v30, "setArticle:", v32);

                      }
                    }
                    v27 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
                  }
                  while (v27);
                  v12 = v37;
                  v20 = v38;
                  v11 = v41;
                  v13 = v39;
                }
              }
              else
              {
                if (v15 == 4)
                {
                  objc_msgSend(v14, "personalizedTodaySectionConfig");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "personalizedArticles");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "_resolveArticles:withPaidAccessChecker:heldArticleRecords:", v22, v6, v7);
                  v23 = v13;
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = (void *)objc_msgSend(v24, "mutableCopy");
                  objc_msgSend(v21, "setPersonalizedArticles:", v25);

                  v13 = v23;
                  objc_msgSend(v21, "mandatoryArticles");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "_resolveArticles:withPaidAccessChecker:heldArticleRecords:", v17, v6, v7);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = (void *)objc_msgSend(v18, "mutableCopy");
                  v20 = v21;
                  objc_msgSend(v21, "setMandatoryArticles:", v19);
                }
                else
                {
                  if (v15 != 3)
                    goto LABEL_33;
                  objc_msgSend(v14, "articleIDsTodaySectionConfig");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "articles");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "_resolveArticles:withPaidAccessChecker:heldArticleRecords:", v17, v6, v7);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = (void *)objc_msgSend(v18, "mutableCopy");
                  v20 = v16;
                  objc_msgSend(v16, "setArticles:", v19);
                }

                v11 = v41;
              }

LABEL_33:
              ++v13;
            }
            while (v13 != v11);
            v11 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          }
          while (v11);
        }

        v8 = v36 + 1;
      }
      while (v36 + 1 != v35);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v35);
  }

}

- (id)_resolveArticle:()Mastering withPaidAccessChecker:heldArticleRecords:
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  char v26;
  void *v27;
  char v28;
  char v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  char v35;
  id v36;
  void *v37;
  char v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  const char *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v49;
  char v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v53 = a4;
  v54 = a5;
  v8 = v7;
  NTSharedLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v56 = v8;
    _os_log_impl(&dword_2197E6000, v9, OS_LOG_TYPE_DEBUG, "resolving article %{public}@", buf, 0xCu);
  }

  objc_msgSend(v8, "paidArticle");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v8;
  if (v10)
  {
    v12 = (void *)v10;
    v49 = v8;
    while (1)
    {
      NTSharedLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v56 = v12;
        _os_log_impl(&dword_2197E6000, v13, OS_LOG_TYPE_DEBUG, "considering paid article %{public}@", buf, 0xCu);
      }

      objc_msgSend(v12, "articleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "recordWithID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = objc_msgSend(v15, "isPaid");
        v17 = objc_msgSend(v15, "isBundlePaid");
        objc_msgSend(v15, "sourceChannelTagID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v53;
        v20 = v18;
        objc_msgSend(v19, "bundleSubscriptionProvider");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "purchaseProvider");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v21;
        v24 = v22;
        v25 = v20;
        if ((v16 & 1) == 0 && !v17)
          goto LABEL_28;
        v26 = v16 ^ 1;
        if (!v24)
          v26 = 1;
        if ((v26 & 1) == 0)
        {
          objc_msgSend(v24, "purchasedTagIDs");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "containsObject:", v25);

          if ((v28 & 1) != 0)
          {
LABEL_28:

            NTSharedLog();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v12, "articleID");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v56 = v47;
              _os_log_impl(&dword_2197E6000, v46, OS_LOG_TYPE_DEBUG, "user has access to %{public}@", buf, 0xCu);

            }
            v11 = v12;
            v8 = v49;

            break;
          }
        }
        v29 = v17 ^ 1;
        if (!v23)
          v29 = 1;
        if ((v29 & 1) == 0)
        {
          v30 = v23;
          v31 = v25;
          if (!v31)
            goto LABEL_19;
          objc_msgSend(v30, "bundleSubscription");
          v32 = objc_claimAutoreleasedReturnValue();
          objc_getAssociatedObject((id)v32, (const void *)(v32 + 1));
          v51 = v31;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "unsignedIntegerValue");
          v35 = v34;
          objc_getAssociatedObject((id)v32, (const void *)~v34);
          v52 = v19;
          v36 = v30;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "unsignedIntegerValue") ^ v35;

          v30 = v36;
          v19 = v52;

          v31 = v51;
          if ((v38 & 1) != 0)
          {
            objc_msgSend(v30, "bundleSubscription");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "bundleChannelIDs");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v44, "containsObject:", v51);

            if ((v50 & 1) != 0)
              goto LABEL_28;
          }
          else
          {
LABEL_19:

          }
        }

        NTSharedLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "articleID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v56 = v40;
          v41 = v39;
          v42 = "user does not have access to %{public}@";
          goto LABEL_25;
        }
      }
      else
      {
        NTSharedLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "articleID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v56 = v40;
          v41 = v39;
          v42 = "did not find record for article %{public}@";
LABEL_25:
          _os_log_impl(&dword_2197E6000, v41, OS_LOG_TYPE_DEBUG, v42, buf, 0xCu);

        }
      }

      objc_msgSend(v12, "paidArticle");
      v45 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v45;
      if (!v45)
      {
        v8 = v49;
        v11 = v49;
        break;
      }
    }
  }

  return v11;
}

- (id)_resolveArticles:()Mastering withPaidAccessChecker:heldArticleRecords:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __88__NTPBTodayConfig_Mastering___resolveArticles_withPaidAccessChecker_heldArticleRecords___block_invoke;
  v14[3] = &unk_24DB5F580;
  v14[4] = a1;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)nt_resolveFallbacksWithPaidAccessChecker:()Mastering heldArticleRecords:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"heldArticleRecords", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)nt_resolveFallbacksWithPaidAccessChecker:()Mastering heldArticleRecords:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"paidAccessChecker", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
