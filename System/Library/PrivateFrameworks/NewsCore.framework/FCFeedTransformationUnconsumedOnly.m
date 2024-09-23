@implementation FCFeedTransformationUnconsumedOnly

- (FCFeedTransformationUnconsumedOnly)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedTransformationUnconsumedOnly init]";
    v9 = 2080;
    v10 = "FCFeedTransformationUnconsumedOnly.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFeedTransformationUnconsumedOnly init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCFeedTransformationUnconsumedOnly)initWithFilterMethod:(unint64_t)a3 consumedArticleItems:(id)a4 minimumTimeSinceFirstConsumedToFilter:(double)a5 filterDate:(id)a6 articleIDProvider:(id)a7 dateOfArticleIDConsumptionProvider:(id)a8 maxVersionConsumedProvider:(id)a9 dateOfMaxVersionConsumptionProvider:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  FCFeedTransformationUnconsumedOnly *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  FCFeedTransforming *innerFilter;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  double v50;
  _QWORD aBlock[4];
  id v52;
  objc_super v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v33 = v21;
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "consumedArticleItems");
    *(_DWORD *)buf = 136315906;
    v55 = "-[FCFeedTransformationUnconsumedOnly initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedTo"
          "Filter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVer"
          "sionConsumptionProvider:]";
    v56 = 2080;
    v57 = "FCFeedTransformationUnconsumedOnly.m";
    v58 = 1024;
    v59 = 36;
    v60 = 2114;
    v61 = v34;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v21 = v33;
    if (v18)
      goto LABEL_6;
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v35 = v21;
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "filterDate");
    *(_DWORD *)buf = 136315906;
    v55 = "-[FCFeedTransformationUnconsumedOnly initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedTo"
          "Filter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVer"
          "sionConsumptionProvider:]";
    v56 = 2080;
    v57 = "FCFeedTransformationUnconsumedOnly.m";
    v58 = 1024;
    v59 = 37;
    v60 = 2114;
    v61 = v36;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v21 = v35;
  }
LABEL_6:
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v37 = v21;
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleIDProvider");
    *(_DWORD *)buf = 136315906;
    v55 = "-[FCFeedTransformationUnconsumedOnly initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedTo"
          "Filter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVer"
          "sionConsumptionProvider:]";
    v56 = 2080;
    v57 = "FCFeedTransformationUnconsumedOnly.m";
    v58 = 1024;
    v59 = 38;
    v60 = 2114;
    v61 = v38;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v21 = v37;
    if (v20)
      goto LABEL_11;
  }
  else if (v20)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v39 = v21;
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "dateOfArticleIDConsumptionProvider");
    *(_DWORD *)buf = 136315906;
    v55 = "-[FCFeedTransformationUnconsumedOnly initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedTo"
          "Filter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVer"
          "sionConsumptionProvider:]";
    v56 = 2080;
    v57 = "FCFeedTransformationUnconsumedOnly.m";
    v58 = 1024;
    v59 = 39;
    v60 = 2114;
    v61 = v40;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v21 = v39;
  }
LABEL_11:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "maxVersionConsumedProvider");
    *(_DWORD *)buf = 136315906;
    v55 = "-[FCFeedTransformationUnconsumedOnly initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedTo"
          "Filter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVer"
          "sionConsumptionProvider:]";
    v56 = 2080;
    v57 = "FCFeedTransformationUnconsumedOnly.m";
    v58 = 1024;
    v59 = 40;
    v60 = 2114;
    v61 = v41;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v21 = 0;
    if (v22)
      goto LABEL_16;
  }
  else if (v22)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v42 = v21;
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "dateOfMaxVersionConsumptionProvider");
    *(_DWORD *)buf = 136315906;
    v55 = "-[FCFeedTransformationUnconsumedOnly initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedTo"
          "Filter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVer"
          "sionConsumptionProvider:]";
    v56 = 2080;
    v57 = "FCFeedTransformationUnconsumedOnly.m";
    v58 = 1024;
    v59 = 41;
    v60 = 2114;
    v61 = v43;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v21 = v42;
  }
LABEL_16:
  v53.receiver = self;
  v53.super_class = (Class)FCFeedTransformationUnconsumedOnly;
  v23 = -[FCFeedTransformationUnconsumedOnly init](&v53, sel_init);
  if (v23)
  {
    v44 = v21;
    if (a3 == 2)
    {
      v24 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __245__FCFeedTransformationUnconsumedOnly_initWithFilterMethod_consumedArticleItems_minimumTimeSinceFirstConsumedToFilter_filterDate_articleIDProvider_dateOfArticleIDConsumptionProvider_maxVersionConsumedProvider_dateOfMaxVersionConsumptionProvider___block_invoke_3;
      aBlock[3] = &unk_1E4649F78;
      v52 = v21;
      v25 = _Block_copy(aBlock);
      v26 = _Block_copy(v22);

    }
    else
    {
      v24 = MEMORY[0x1E0C809B0];
      if (a3 == 1)
      {
        v26 = _Block_copy(v20);
        v25 = &__block_literal_global_14_6;
      }
      else
      {
        if (a3)
          v25 = 0;
        else
          v25 = &__block_literal_global_169;
        v26 = 0;
      }
    }
    objc_msgSend(v17, "fc_dictionaryWithKeyBlock:", v19);
    v45[0] = v24;
    v45[1] = 3221225472;
    v45[2] = __245__FCFeedTransformationUnconsumedOnly_initWithFilterMethod_consumedArticleItems_minimumTimeSinceFirstConsumedToFilter_filterDate_articleIDProvider_dateOfArticleIDConsumptionProvider_maxVersionConsumedProvider_dateOfMaxVersionConsumptionProvider___block_invoke_4;
    v45[3] = &unk_1E4649FA0;
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v48 = v25;
    v47 = v18;
    v49 = v26;
    v50 = a5;
    v27 = v26;
    v28 = v25;
    v29 = v46;
    +[FCFeedTransformationBlockFilter blockFilterWithPredicate:](FCFeedTransformationBlockFilter, "blockFilterWithPredicate:", v45);
    v30 = objc_claimAutoreleasedReturnValue();
    innerFilter = v23->_innerFilter;
    v23->_innerFilter = (FCFeedTransforming *)v30;

    v21 = v44;
  }

  return v23;
}

uint64_t __245__FCFeedTransformationUnconsumedOnly_initWithFilterMethod_consumedArticleItems_minimumTimeSinceFirstConsumedToFilter_filterDate_articleIDProvider_dateOfArticleIDConsumptionProvider_maxVersionConsumedProvider_dateOfMaxVersionConsumptionProvider___block_invoke()
{
  return 0;
}

uint64_t __245__FCFeedTransformationUnconsumedOnly_initWithFilterMethod_consumedArticleItems_minimumTimeSinceFirstConsumedToFilter_filterDate_articleIDProvider_dateOfArticleIDConsumptionProvider_maxVersionConsumedProvider_dateOfMaxVersionConsumptionProvider___block_invoke_2()
{
  return 1;
}

BOOL __245__FCFeedTransformationUnconsumedOnly_initWithFilterMethod_consumedArticleItems_minimumTimeSinceFirstConsumedToFilter_filterDate_articleIDProvider_dateOfArticleIDConsumptionProvider_maxVersionConsumedProvider_dateOfMaxVersionConsumptionProvider___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 16);
  v6 = a2;
  v7 = v5(v4, a3);
  v8 = objc_msgSend(v6, "publisherArticleVersion");

  return v7 >= v8;
}

BOOL __245__FCFeedTransformationUnconsumedOnly_initWithFilterMethod_consumedArticleItems_minimumTimeSinceFirstConsumedToFilter_filterDate_articleIDProvider_dateOfArticleIDConsumptionProvider_maxVersionConsumedProvider_dateOfMaxVersionConsumptionProvider___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  _BOOL8 v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "articleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    v7 = *(void **)(a1 + 40);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

    v11 = v10 < *(double *)(a1 + 64);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedItems");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCFeedTransformationUnconsumedOnly transformFeedItems:]";
    v11 = 2080;
    v12 = "FCFeedTransformationUnconsumedOnly.m";
    v13 = 1024;
    v14 = 112;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFeedTransformationUnconsumedOnly innerFilter](self, "innerFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transformFeedItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (FCFeedTransforming)innerFilter
{
  return self->_innerFilter;
}

- (void)setInnerFilter:(id)a3
{
  objc_storeStrong((id *)&self->_innerFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerFilter, 0);
}

@end
