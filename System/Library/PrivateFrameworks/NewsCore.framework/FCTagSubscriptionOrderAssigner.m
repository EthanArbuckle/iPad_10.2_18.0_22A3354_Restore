@implementation FCTagSubscriptionOrderAssigner

- (_QWORD)initWithInitialOrder:(uint64_t)a3 orderSpacing:
{
  objc_super v5;

  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)FCTagSubscriptionOrderAssigner;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      result[1] = a2;
      result[2] = a3;
    }
  }
  return result;
}

- (id)assignOrderToTagSubscriptions:(id)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscriptions != nil");
      *(_DWORD *)buf = 136315906;
      v15 = "-[FCTagSubscriptionOrderAssigner assignOrderToTagSubscriptions:]";
      v16 = 2080;
      v17 = "FCTagSubscriptionOrderAssigner.m";
      v18 = 1024;
      v19 = 42;
      v20 = 2114;
      v21 = v9;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v5 = (void *)objc_opt_new();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__FCTagSubscriptionOrderAssigner_assignOrderToTagSubscriptions___block_invoke_2;
    v10[3] = &unk_1E46472C0;
    v11 = v4;
    v12 = a1;
    v6 = v5;
    v13 = v6;
    objc_msgSend(v11, "fc_enumerateIslandsOfCommonValuesForKeyBlock:withBlock:", &__block_literal_global_129, v10);
    v7 = v13;
    a1 = v6;

  }
  return a1;
}

- (FCTagSubscriptionOrderAssigner)init
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
    v8 = "-[FCTagSubscriptionOrderAssigner init]";
    v9 = 2080;
    v10 = "FCTagSubscriptionOrderAssigner.m";
    v11 = 1024;
    v12 = 26;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTagSubscriptionOrderAssigner init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

id __64__FCTagSubscriptionOrderAssigner_assignOrderToTagSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "order");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", v3 == 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __64__FCTagSubscriptionOrderAssigner_assignOrderToTagSubscriptions___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = a2;
  if (objc_msgSend(a3, "BOOLValue"))
  {
    if (a4)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a4 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "order");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "longLongValue");

    }
    else
    {
      v11 = 0;
    }
    v12 = a4 + a5;
    if (v12 == objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = v31;
      v15 = v14;
      if (a4)
      {
        if (v13)
        {
          if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscriptions != nil");
            *(_DWORD *)buf = 136315906;
            v33 = "-[FCTagSubscriptionOrderAssigner _assignOrderToSubscriptions:inOpenEndRangeWithPreviousValue:]";
            v34 = 2080;
            v35 = "FCTagSubscriptionOrderAssigner.m";
            v36 = 1024;
            v37 = 141;
            v38 = 2114;
            v39 = v27;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          v16 = *(_QWORD *)(v13 + 16);
          v17 = v16 + v11;
LABEL_23:
          v24 = v15;
LABEL_29:
          -[FCTagSubscriptionOrderAssigner _assignOrderToSubscriptions:withInitialOrder:orderSpacing:](v24, v17, v16);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

          objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v26);
          goto LABEL_31;
        }
      }
      else if (v13)
      {
        if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscriptions != nil");
          *(_DWORD *)buf = 136315906;
          v33 = "-[FCTagSubscriptionOrderAssigner _assignOrderToSubscriptionsInOpenRange:]";
          v34 = 2080;
          v35 = "FCTagSubscriptionOrderAssigner.m";
          v36 = 1024;
          v37 = 158;
          v38 = 2114;
          v39 = v29;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        v17 = *(_QWORD *)(v13 + 8);
        v16 = *(_QWORD *)(v13 + 16);
        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "order");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "longLongValue");

      v21 = *(_QWORD *)(a1 + 40);
      v22 = v31;
      v23 = v22;
      if (a4)
      {
        if (v21)
        {
          if (!v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscriptions != nil");
            *(_DWORD *)buf = 136315906;
            v33 = "-[FCTagSubscriptionOrderAssigner _assignOrderToSubscriptions:inClosedRangeWithPreviousValue:nextValue:]";
            v34 = 2080;
            v35 = "FCTagSubscriptionOrderAssigner.m";
            v36 = 1024;
            v37 = 106;
            v38 = 2114;
            v39 = v28;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          v16 = (v20 - v11) / (unint64_t)(objc_msgSend(v23, "count") + 1);
          v17 = v16 + v11;
          v24 = v23;
          goto LABEL_29;
        }
      }
      else if (v21)
      {
        if (!v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscriptions != nil");
          *(_DWORD *)buf = 136315906;
          v33 = "-[FCTagSubscriptionOrderAssigner _assignOrderToSubscriptions:inOpenStartRangeWithNextValue:]";
          v34 = 2080;
          v35 = "FCTagSubscriptionOrderAssigner.m";
          v36 = 1024;
          v37 = 123;
          v38 = 2114;
          v39 = v30;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        v25 = *(_QWORD *)(v21 + 16);
        v17 = v20 - objc_msgSend(v23, "count") * v25;
        v24 = v23;
        v16 = v25;
        goto LABEL_29;
      }
    }
    v26 = 0;
    goto LABEL_30;
  }
LABEL_31:

}

- (id)_assignOrderToSubscriptions:(void *)a1 withInitialOrder:(uint64_t)a2 orderSpacing:(uint64_t)a3
{
  id v5;
  void *v6;
  void *v8;
  _QWORD v9[6];
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
  v5 = a1;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "subscriptions != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCTagSubscriptionOrderAssigner _assignOrderToSubscriptions:withInitialOrder:orderSpacing:]";
    v12 = 2080;
    v13 = "FCTagSubscriptionOrderAssigner.m";
    v14 = 1024;
    v15 = 176;
    v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__FCTagSubscriptionOrderAssigner__assignOrderToSubscriptions_withInitialOrder_orderSpacing___block_invoke;
  v9[3] = &__block_descriptor_48_e75____FCReorderableTagSubscription__24__0Q8___FCReorderableTagSubscription__16l;
  v9[4] = a2;
  v9[5] = a3;
  objc_msgSend(v5, "fc_arrayByTransformingWithBlockWithIndex:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __92__FCTagSubscriptionOrderAssigner__assignOrderToSubscriptions_withInitialOrder_orderSpacing___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 32) + *(_QWORD *)(a1 + 40) * a2;
  v5 = a3;
  objc_msgSend(v3, "numberWithLongLong:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "copyWithOrder:", v6);

  return v7;
}

@end
