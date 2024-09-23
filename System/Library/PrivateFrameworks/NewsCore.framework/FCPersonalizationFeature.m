@implementation FCPersonalizationFeature

+ (id)featuresFromIssue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "sourceChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "topicTagIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  if (v6 && v7)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __46__FCPersonalizationFeature_featuresFromIssue___block_invoke;
    v20[3] = &unk_1E4640AE8;
    v21 = v6;
    objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v9);

  }
  v10 = (void *)MEMORY[0x1E0C99D20];
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __46__FCPersonalizationFeature_featuresFromIssue___block_invoke_2;
  v17[3] = &unk_1E463EFB0;
  v18 = v6;
  v19 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "fc_array:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fc_arrayByTransformingWithBlock:", &__block_literal_global_41_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v14);

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

FCPublisherTopicFeature *__46__FCPersonalizationFeature_featuresFromIssue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FCPublisherTopicFeature *v4;

  v3 = a2;
  v4 = -[FCPublisherTopicFeature initWithPublisherTagID:topicTagID:]([FCPublisherTopicFeature alloc], "initWithPublisherTagID:topicTagID:", *(_QWORD *)(a1 + 32), v3);

  return v4;
}

void __46__FCPersonalizationFeature_featuresFromIssue___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "fc_safelyAddObject:", v3);
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", *(_QWORD *)(a1 + 40));

}

FCTagIDFeature *__46__FCPersonalizationFeature_featuresFromIssue___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  FCTagIDFeature *v3;

  v2 = a2;
  v3 = -[FCTagIDFeature initWithTagID:]([FCTagIDFeature alloc], "initWithTagID:", v2);

  return v3;
}

+ (id)featuresFromTodayPersonalizationEvent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke;
  v8[3] = &unk_1E463AA30;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "fc_array:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "headlinePublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personalizationSectionFeatureId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "headlineTopics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_44_1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v8 = v7 == 0;
  else
    v8 = 1;
  v9 = MEMORY[0x1E0C809B0];
  if (!v8)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke_3;
    v21[3] = &unk_1E4640AE8;
    v22 = v4;
    objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v10);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "action") == 3
    || objc_msgSend(*(id *)(a1 + 32), "action") == 4
    || objc_msgSend(*(id *)(a1 + 32), "action") == 5
    || objc_msgSend(*(id *)(a1 + 32), "action") == 6)
  {
    +[FCHeadlineFeatureArticleWithVideoContent articleWithVideoContentFeature](FCHeadlineFeatureArticleWithVideoContent, "articleWithVideoContentFeature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  if (v5)
  {
    +[FCPersonalizationFeature featureForFreeValuedIdentifier:](FCPersonalizationFeature, "featureForFreeValuedIdentifier:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  v13 = (void *)MEMORY[0x1E0C99D20];
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke_4;
  v18[3] = &unk_1E463EFB0;
  v19 = v4;
  v20 = v7;
  v14 = v7;
  v15 = v4;
  objc_msgSend(v13, "fc_array:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fc_arrayByTransformingWithBlock:", &__block_literal_global_47_2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v17);

}

uint64_t __66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagId");
}

FCPublisherTopicFeature *__66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  FCPublisherTopicFeature *v4;

  v3 = a2;
  v4 = -[FCPublisherTopicFeature initWithPublisherTagID:topicTagID:]([FCPublisherTopicFeature alloc], "initWithPublisherTagID:topicTagID:", *(_QWORD *)(a1 + 32), v3);

  return v4;
}

void __66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "fc_safelyAddObject:", v3);
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", *(_QWORD *)(a1 + 40));

}

FCTagIDFeature *__66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  FCTagIDFeature *v3;

  v2 = a2;
  v3 = -[FCTagIDFeature initWithTagID:]([FCTagIDFeature alloc], "initWithTagID:", v2);

  return v3;
}

+ (id)featuresFromPersonalizingItem:(id)a3 personalizationTreatment:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  FCTagIDFeature *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  FCTagIDFeature *v15;
  FCPublisherTopicFeature *v16;
  void *v17;
  char v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  FCPublisherPremiumFeature *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publisherID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[FCTagIDFeature initWithTagID:]([FCTagIDFeature alloc], "initWithTagID:", v7);
    objc_msgSend(v6, "addObject:", v8);

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v31 = v5;
  objc_msgSend(v5, "topicIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        v15 = -[FCTagIDFeature initWithTagID:]([FCTagIDFeature alloc], "initWithTagID:", v14);
        objc_msgSend(v6, "addObject:", v15);

        if (v7)
        {
          v16 = -[FCPublisherTopicFeature initWithPublisherTagID:topicTagID:]([FCPublisherTopicFeature alloc], "initWithPublisherTagID:topicTagID:", v7, v14);
          objc_msgSend(v6, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v11);
  }

  if ((objc_msgSend(v31, "isANF") & 1) != 0)
    +[FCHeadlineFeatureArticleTypeFlint articleTypeFlintFeature](FCHeadlineFeatureArticleTypeFlint, "articleTypeFlintFeature");
  else
    +[FCHeadlineFeatureArticleTypeNonFlint articleTypeNonFlintFeature](FCHeadlineFeatureArticleTypeNonFlint, "articleTypeNonFlintFeature");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v17);

  v18 = objc_opt_respondsToSelector();
  if (v30 && (v18 & 1) != 0 && objc_msgSend(v31, "bodyTextLength") >= 1)
  {
    v19 = objc_msgSend(v31, "bodyTextLength");
    objc_msgSend(v30, "articleLengthMediumThreshold");
    if (v19 <= (int)v20)
    {
      +[FCArticleLengthFeature shortLengthFeature](FCArticleLengthFeature, "shortLengthFeature");
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = objc_msgSend(v31, "bodyTextLength");
      objc_msgSend(v30, "articleLengthLongThreshold");
      if (v21 <= (int)v22)
        +[FCArticleLengthFeature mediumLengthFeature](FCArticleLengthFeature, "mediumLengthFeature");
      else
        +[FCArticleLengthFeature longLengthFeature](FCArticleLengthFeature, "longLengthFeature");
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v23;
    objc_msgSend(v6, "addObject:", v23);

  }
  if (v7 && objc_msgSend(v31, "isPaid"))
  {
    v25 = -[FCPublisherPremiumFeature initWithTagID:]([FCPublisherPremiumFeature alloc], "initWithTagID:", v7);
    objc_msgSend(v6, "addObject:", v25);

  }
  if (objc_msgSend(v31, "hasVideo"))
  {
    +[FCHeadlineFeatureArticleWithVideoContent articleWithVideoContentFeature](FCHeadlineFeatureArticleWithVideoContent, "articleWithVideoContentFeature");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v26);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v31, "iAdCategories");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fc_arrayByTransformingWithBlock:", &__block_literal_global_55_0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v28);

  }
  return v6;
}

FCAdCategoryFeature *__83__FCPersonalizationFeature_featuresFromPersonalizingItem_personalizationTreatment___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FCAdCategoryFeature *v3;

  v2 = a2;
  v3 = -[FCAdCategoryFeature initWithTagID:]([FCAdCategoryFeature alloc], "initWithTagID:", v2);

  return v3;
}

+ (id)featuresFromTag:(id)a3
{
  id v3;
  void *v4;
  FCTagIDFeature *v5;
  void *v6;
  FCTagIDFeature *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = [FCTagIDFeature alloc];
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FCTagIDFeature initWithTagID:](v5, "initWithTagID:", v6);
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

+ (id)featuresFromTagIDs:(id)a3
{
  return (id)objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_58);
}

FCTagIDFeature *__47__FCPersonalizationFeature_featuresFromTagIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FCTagIDFeature *v3;

  v2 = a2;
  v3 = -[FCTagIDFeature initWithTagID:]([FCTagIDFeature alloc], "initWithTagID:", v2);

  return v3;
}

+ (id)featureFromTagID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "featuresFromTagIDs:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)featureForIdentifier:(id)a3
{
  return +[FCPersonalizationFeature featureForIdentifier:allowFreeValued:]((uint64_t)a1, a3, 0);
}

+ (id)featureForIdentifier:(char)a3 allowFreeValued:
{
  id v4;
  uint64_t v5;
  __objc2_class *v6;
  void *v7;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_self();
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("f0")))
  {
    +[FCBaselineFeature baselineFeature](FCBaselineFeature, "baselineFeature");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v7 = (void *)v5;
    goto LABEL_19;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("f1")))
  {
    +[FCHeadlineFeatureArticleTypeFlint articleTypeFlintFeature](FCHeadlineFeatureArticleTypeFlint, "articleTypeFlintFeature");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("f7")))
  {
LABEL_6:
    +[FCHeadlineFeatureArticleWithVideoContent articleWithVideoContentFeature](FCHeadlineFeatureArticleWithVideoContent, "articleWithVideoContentFeature");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("f2")))
  {
    +[FCHeadlineFeatureArticleTypeNonFlint articleTypeNonFlintFeature](FCHeadlineFeatureArticleTypeNonFlint, "articleTypeNonFlintFeature");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("f3")))
  {
    v6 = FCTagIDFeature;
LABEL_17:
    v5 = objc_msgSend([v6 alloc], "initWithPersonalizationIdentifier:", v4);
    goto LABEL_18;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("f4")))
  {
    v6 = FCPublisherTopicFeature;
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("f5")))
  {
    v6 = FCPublisherPremiumFeature;
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("f6")))
  {
    v6 = FCGroupTypeFeature;
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("f7")))
    goto LABEL_6;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("f8")))
  {
    v5 = (uint64_t)-[FCTodayWidgetSectionIDFeature initWithPersonalizationIdentifier:]([FCTodayWidgetSectionIDFeature alloc], v4);
    goto LABEL_18;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("f9")))
  {
    v6 = FCPublisherVideoContentFeature;
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("fa0")))
  {
    v6 = FCArticleLengthFeature;
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("fa1")))
  {
    v6 = FCAdCategoryFeature;
    goto LABEL_17;
  }
  if (v4 && (a3 & 1) != 0)
  {
    v5 = (uint64_t)-[FCPersonalizationFeature initWithIdentifier:]([FCPersonalizationFeature alloc], v4);
    goto LABEL_18;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The identifier %@ didn't map to any headline features"), v4);
    *(_DWORD *)buf = 136315906;
    v12 = "+[FCPersonalizationFeature featureForIdentifier:allowFreeValued:]";
    v13 = 2080;
    v14 = "FCPersonalizationFeature.m";
    v15 = 1024;
    v16 = 330;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v9 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (const char *)v4;
    _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "The identifier %{public}@ didn't map to any headline features", buf, 0xCu);
  }
  v7 = 0;
LABEL_19:

  return v7;
}

- (_QWORD)initWithIdentifier:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier");
      *(_DWORD *)buf = 136315906;
      v11 = "-[FCPersonalizationFeature initWithIdentifier:]";
      v12 = 2080;
      v13 = "FCPersonalizationFeature.m";
      v14 = 1024;
      v15 = 357;
      v16 = 2114;
      v17 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v9.receiver = a1;
    v9.super_class = (Class)FCPersonalizationFeature;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v5 = objc_msgSend(v4, "copy");
      v6 = (void *)a1[2];
      a1[2] = v5;

    }
  }

  return a1;
}

+ (id)featureForFreeValuedIdentifier:(id)a3
{
  return +[FCPersonalizationFeature featureForIdentifier:allowFreeValued:]((uint64_t)a1, a3, 1);
}

+ (id)featureObserver
{
  return 0;
}

- (FCPersonalizationFeature)init
{
  return (FCPersonalizationFeature *)-[FCPersonalizationFeature initWithIdentifier:](self, &stru_1E464BC40);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPersonalizationFeature personalizationIdentifier](self, "personalizationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("FCPersonalizationFeature with type %@ and personalizationIdentifier %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)featureWeightWithConfigurableValues:(id)a3 publisherID:(id)a4
{
  return 1.0;
}

- (BOOL)shouldBeBoosted
{
  return self->_shouldBeBoosted;
}

- (void)setShouldBeBoosted:(BOOL)a3
{
  self->_shouldBeBoosted = a3;
}

- (NSString)personalizationIdentifier
{
  return self->_personalizationIdentifier;
}

- (NSString)fc_description
{
  return self->_fc_description;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_fc_description, 0);
  objc_storeStrong((id *)&self->_personalizationIdentifier, 0);
}

- (unint64_t)hash
{
  return -[NSString hash](-[FCPersonalizationFeature personalizationIdentifier](self, "personalizationIdentifier"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  return -[NSString isEqual:](-[FCPersonalizationFeature personalizationIdentifier](self, "personalizationIdentifier"), "isEqual:", objc_msgSend(a3, "personalizationIdentifier"));
}

@end
