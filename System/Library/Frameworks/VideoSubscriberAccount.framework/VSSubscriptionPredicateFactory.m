@implementation VSSubscriptionPredicateFactory

- (id)_topLevelAccessPredicateForRequestKind:(int64_t)a3 fromTask:(id)a4
{
  id v5;
  int v6;
  void *v7;

  v5 = a4;
  if ((objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", CFSTR("com.apple.private.subscriptionservice.internal")) & 1) != 0|| (v6 = objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", CFSTR("com.apple.private.subscriptionservice.all-sources.read-only")), v7 = 0, !a3)&& v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)allowedSubscriptionSourceKindsPredicateForRequestKind:(int64_t)a3 fromTask:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  -[VSSubscriptionPredicateFactory _topLevelAccessPredicateForRequestKind:fromTask:](self, "_topLevelAccessPredicateForRequestKind:fromTask:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[VSSubscriptionPredicateFactory _predicateTemplateForSourceKind:](self, "_predicateTemplateForSourceKind:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSubscriptionPredicateFactory _predicateTemplateForAppPredicate:withTask:](self, "_predicateTemplateForAppPredicate:withTask:", v8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)objc_opt_class(), "_subscriptionSourceKindPredicateTemplateValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithSubstitutionVariables:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unwrapWithFallback:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)allowedSubscriptionSourcesPredicateForRequestKind:(int64_t)a3 fromTask:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[VSSubscriptionPredicateFactory _predicateTemplateForRequestKind:fromTask:](self, "_predicateTemplateForRequestKind:fromTask:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_subscriptionSourcePredicateTemplateValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithSubstitutionVariables:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unwrapWithFallback:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_predicateTemplateForRequestKind:(int64_t)a3 fromTask:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[VSSubscriptionPredicateFactory _topLevelAccessPredicateForRequestKind:fromTask:](self, "_topLevelAccessPredicateForRequestKind:fromTask:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[VSSubscriptionPredicateFactory _predicateTemplateForSourceOfTask:](self, "_predicateTemplateForSourceOfTask:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSubscriptionPredicateFactory _predicateTemplateForAppPredicate:withTask:](self, "_predicateTemplateForAppPredicate:withTask:", v8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)_subscriptionSourcePredicateTemplateValues
{
  if (_subscriptionSourcePredicateTemplateValues___vs_lazy_init_predicate != -1)
    dispatch_once(&_subscriptionSourcePredicateTemplateValues___vs_lazy_init_predicate, &__block_literal_global_7);
  return (id)_subscriptionSourcePredicateTemplateValues___vs_lazy_init_variable;
}

+ (id)_subscriptionSourceKindPredicateTemplateValues
{
  if (_subscriptionSourceKindPredicateTemplateValues___vs_lazy_init_predicate != -1)
    dispatch_once(&_subscriptionSourceKindPredicateTemplateValues___vs_lazy_init_predicate, &__block_literal_global);
  return (id)_subscriptionSourceKindPredicateTemplateValues___vs_lazy_init_variable;
}

void __80__VSSubscriptionPredicateFactory__subscriptionSourceKindPredicateTemplateValues__block_invoke()
{
  uint64_t v0;
  void *v1;

  __80__VSSubscriptionPredicateFactory__subscriptionSourceKindPredicateTemplateValues__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_subscriptionSourceKindPredicateTemplateValues___vs_lazy_init_variable;
  _subscriptionSourceKindPredicateTemplateValues___vs_lazy_init_variable = v0;

}

id __80__VSSubscriptionPredicateFactory__subscriptionSourceKindPredicateTemplateValues__block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKey:", v1, CFSTR("VSSubscriptionSourceKindVariableName"));

  v2 = (void *)objc_msgSend(v0, "copy");
  return v2;
}

void __76__VSSubscriptionPredicateFactory__subscriptionSourcePredicateTemplateValues__block_invoke()
{
  uint64_t v0;
  void *v1;

  __76__VSSubscriptionPredicateFactory__subscriptionSourcePredicateTemplateValues__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_subscriptionSourcePredicateTemplateValues___vs_lazy_init_variable;
  _subscriptionSourcePredicateTemplateValues___vs_lazy_init_variable = v0;

}

id __76__VSSubscriptionPredicateFactory__subscriptionSourcePredicateTemplateValues__block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("kind"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKey:", v1, CFSTR("VSSubscriptionSourceKindVariableName"));

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKey:", v2, CFSTR("VSSubscriptionSourceIdentifierVariableName"));

  v3 = (void *)objc_msgSend(v0, "copy");
  return v3;
}

+ (id)_subscriptionPredicateTemplateValues
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__VSSubscriptionPredicateFactory__subscriptionPredicateTemplateValues__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_subscriptionPredicateTemplateValues___vs_lazy_init_predicate != -1)
    dispatch_once(&_subscriptionPredicateTemplateValues___vs_lazy_init_predicate, block);
  return (id)_subscriptionPredicateTemplateValues___vs_lazy_init_variable;
}

void __70__VSSubscriptionPredicateFactory__subscriptionPredicateTemplateValues__block_invoke(uint64_t a1)
{
  void (**v1)(void);
  uint64_t v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__VSSubscriptionPredicateFactory__subscriptionPredicateTemplateValues__block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e5__8__0l;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v1 = (void (**)(void))_Block_copy(aBlock);
  v1[2]();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_subscriptionPredicateTemplateValues___vs_lazy_init_variable;
  _subscriptionPredicateTemplateValues___vs_lazy_init_variable = v2;

}

id __70__VSSubscriptionPredicateFactory__subscriptionPredicateTemplateValues__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "_subscriptionSourcePredicateTemplateValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__VSSubscriptionPredicateFactory__subscriptionPredicateTemplateValues__block_invoke_3;
  v7[3] = &unk_1E939EC18;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

void __70__VSSubscriptionPredicateFactory__subscriptionPredicateTemplateValues__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D8236758]();
  v12[0] = CFSTR("source");
  objc_msgSend(v6, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("."));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v11, v5);

  objc_autoreleasePoolPop(v7);
}

- (id)_predicateTemplateForSourceKind:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("VSSubscriptionSourceKindVariableName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expressionForConstantValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v4, v7, 0, 4, 0);
  return v8;
}

- (id)_predicateTemplateForSourceIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB35D0];
  v4 = a3;
  objc_msgSend(v3, "expressionForVariable:", CFSTR("VSSubscriptionSourceIdentifierVariableName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 0, 4, 0);
  return v7;
}

- (id)_predicateTemplateForAppPredicate:(id)a3 withTask:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((objc_msgSend(v7, "shouldAllowAccessForBooleanEntitlement:", CFSTR("com.apple.smoot.subscriptionservice")) & 1) != 0)
  {
    if (!v6)
      goto LABEL_7;
LABEL_6:
    objc_msgSend(v8, "addObject:", v6);
    goto LABEL_7;
  }
  v9 = objc_msgSend(v7, "shouldAllowAccessForBooleanEntitlement:", CFSTR("com.apple.developer.video-subscription-registration"));
  if (v6 && (v9 & 1) != 0)
    goto LABEL_6;
LABEL_7:
  if (objc_msgSend(v7, "shouldAllowAccessForBooleanEntitlement:", CFSTR("com.apple.private.subscriptionservice.web-sources.read-write")))
  {
    -[VSSubscriptionPredicateFactory _predicateTemplateForSourceKind:](self, "_predicateTemplateForSourceKind:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  v11 = objc_msgSend(v8, "count");
  if (v11 == 1)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11)
      objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v8);
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (id)_predicateTemplateForSourceOfTask:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "signingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VSSubscriptionPredicateFactory _predicateTemplateForSourceKind:](self, "_predicateTemplateForSourceKind:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    -[VSSubscriptionPredicateFactory _predicateTemplateForSourceIdentifier:](self, "_predicateTemplateForSourceIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3528];
    v11[0] = v5;
    v11[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    VSErrorLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[VSSubscriptionPredicateFactory _predicateTemplateForSourceOfTask:].cold.1(v5);
    v9 = 0;
  }

  return v9;
}

- (VSAppInstallationInfoCenter)appInstallationInfoCenter
{
  VSAppInstallationInfoCenter *v2;

  v2 = self->_appInstallationInfoCenter;
  if (!v2)
    v2 = objc_alloc_init(VSAppInstallationInfoCenter);
  return v2;
}

- (id)allowedSubscriptionsPredicateForTask:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[VSSubscriptionPredicateFactory _predicateTemplateForSourceOfTask:](self, "_predicateTemplateForSourceOfTask:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_subscriptionPredicateTemplateValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithSubstitutionVariables:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unwrapWithFallback:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allowedSubscriptionsPredicateForRequestKind:(int64_t)a3 fromTask:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[VSSubscriptionPredicateFactory _predicateTemplateForRequestKind:fromTask:](self, "_predicateTemplateForRequestKind:fromTask:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_subscriptionPredicateTemplateValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithSubstitutionVariables:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unwrapWithFallback:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)subscriptionFetchPredicateForTask:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *context;
  void *v70;
  _QWORD v71[4];
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _QWORD v78[2];
  _QWORD v79[4];

  v79[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  context = (void *)MEMORY[0x1D8236758]();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[VSFeatureManager sharedFeatureManager](VSFeatureManager, "sharedFeatureManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "featureIsEnabled:", VSFederatedTwoFeatureName);

  if ((v10 & 1) == 0)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Security task is required when %@ feature is disabled."), VSFederatedTwoFeatureName);
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The taskOrNil parameter must not be nil."));
    }
    -[VSSubscriptionPredicateFactory allowedSubscriptionsPredicateForRequestKind:fromTask:](self, "allowedSubscriptionsPredicateForRequestKind:fromTask:", 0, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v8, "addObject:", v11);

  }
  v70 = v6;
  objc_msgSend(v7, "objectForKey:", CFSTR("VSSubscriptionFetchOptionEarliestExpirationDate"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = 0x1E0CB3000uLL;
  v68 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("expirationDate"), v12);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:");
  objc_msgSend(v7, "objectForKey:", CFSTR("VSSubscriptionFetchOptionExcludeUninstalledApps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    -[VSSubscriptionPredicateFactory appInstallationInfoCenter](self, "appInstallationInfoCenter");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "installedAppBundleIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "forceUnwrapObject");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("source.kind"), &unk_1E93CC510);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("source.kind"), &unk_1E93CC510);
    v18 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("source.identifier"), v63);
    v20 = v7;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3528];
    v79[0] = v19;
    v79[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0CB3528];
    v78[0] = v17;
    v78[1] = v24;
    v13 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "orPredicateWithSubpredicates:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v27);
    v7 = v20;

    v8 = v18;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("VSSubscriptionFetchOptionCreationDateInterval"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    v29 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v29, "initWithStartDate:endDate:", v30, v31);

  }
  v32 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v28, "startDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "endDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "predicateWithFormat:", CFSTR("%K BETWEEN {%@, %@}"), CFSTR("creationDate"), v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v35);
  objc_msgSend(v7, "objectForKey:", CFSTR("VSSubscriptionFetchOptionSources"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v61 = v35;
    v62 = v28;
    v64 = v8;
    v66 = v7;
    v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v60 = v36;
    v38 = v36;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v74 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          v44 = (void *)MEMORY[0x1D8236758]();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v43, "kind"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v46)
          {
            v47 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v47, v45);

          }
          objc_msgSend(v37, "objectForKeyedSubscript:", v45);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "identifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v49);

          objc_autoreleasePoolPop(v44);
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
      }
      while (v40);
    }

    if (objc_msgSend(v37, "count"))
    {
      v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __80__VSSubscriptionPredicateFactory_subscriptionFetchPredicateForTask_withOptions___block_invoke;
      v71[3] = &unk_1E939EC80;
      v72 = v50;
      v51 = v50;
      objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v71);
      objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v64;
      objc_msgSend(v64, "addObject:", v52);

      v7 = v66;
      v13 = 0x1E0CB3000;
    }
    else
    {
      v13 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
      v51 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v64;
      objc_msgSend(v64, "addObject:", v51);
      v7 = v66;
    }
    v35 = v61;
    v28 = v62;
    v36 = v60;

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("VSSubscriptionFetchOptionSourceKind"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    objc_msgSend(*(id *)(v13 + 2176), "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("source.kind"), v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v54);

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("VSSubscriptionFetchOptionSubscriptionInfo"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    objc_msgSend(*(id *)(v13 + 2176), "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("providedSubscriptionInfo"), v55);
    v56 = v36;
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v57);

    v36 = v56;
  }
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
    objc_msgSend(v8, "objectAtIndex:", 0);
  else
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v8);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v58)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The predicate parameter must not be nil."));

  objc_autoreleasePoolPop(context);
  return v58;
}

void __80__VSSubscriptionPredicateFactory_subscriptionFetchPredicateForTask_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a2;
  objc_msgSend(a3, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@ AND (%K IN %@)"), CFSTR("source.kind"), v6, CFSTR("source.identifier"), v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
}

- (id)_expressionByConvertingSubscriptionKeyPathInExpression:(id)a3 toAttributeKeysInEntity:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  id v36;
  id v37;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v39 = v5;
  v7 = objc_msgSend(v5, "expressionType");
  if (v7)
  {
    v36 = v6;
    if (v7 == 14)
    {
      v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v5, "constantValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EFC97B68))
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v35 = v17;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v41;
          v22 = *MEMORY[0x1E0C99778];
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v41 != v21)
                objc_enumerationMutation(v18);
              v24 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
              v25 = (void *)MEMORY[0x1D8236758]();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v26 = (void *)MEMORY[0x1E0C99DA0];
                  v27 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "raise:format:", v22, CFSTR("Unexpectedly, object was %@, instead of NSExpression."), v28);

                  v6 = v36;
                }
                -[VSSubscriptionPredicateFactory _expressionByConvertingSubscriptionKeyPathInExpression:toAttributeKeysInEntity:](self, "_expressionByConvertingSubscriptionKeyPathInExpression:toAttributeKeysInEntity:", v24, v6);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "addObject:", v29);

              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v22, CFSTR("Object (%@) in constant value is not an expression: %@"), v24, v5);
              }
              objc_autoreleasePoolPop(v25);
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          }
          while (v20);
        }

        v17 = v35;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unable to enumerate constant value of aggregate expression: expression"));
      }
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForAggregate:", v37);
      v33 = objc_claimAutoreleasedReturnValue();

      v39 = (id)v33;
    }
    else if (v7 == 3)
    {
      objc_msgSend(v5, "keyPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      objc_msgSend(v6, "attributesByName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v45;
        while (2)
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v45 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
            if (objc_msgSend(v15, "vs_isSuitableForPurpose:", 1))
            {
              objc_msgSend(v15, "vs_subscriptionKeyPath");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "isEqual:", v8))
              {
                v30 = (void *)MEMORY[0x1E0CB35D0];
                objc_msgSend(v15, "name");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "expressionForKeyPath:", v31);
                v32 = objc_claimAutoreleasedReturnValue();

                v39 = (id)v32;
                goto LABEL_31;
              }

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
          if (v12)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("No suitable replacement found for key path %@ in expression %@"), v8, v39);
LABEL_31:

      v6 = v36;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpected type of expression: %@"), v5);
    }
  }

  return v39;
}

- (id)predicateByConvertingSubscriptionKeyPathsInPredicate:(id)a3 toAttributeKeysInEntity:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99778];
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "raise:format:", v10, CFSTR("Unexpectedly, subscriptionPredicate was %@, instead of NSComparisonPredicate."), v12);

    }
    v13 = v8;
    objc_msgSend(v13, "leftExpression");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSubscriptionPredicateFactory _expressionByConvertingSubscriptionKeyPathInExpression:toAttributeKeysInEntity:](self, "_expressionByConvertingSubscriptionKeyPathInExpression:toAttributeKeysInEntity:", v14, v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "rightExpression");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSubscriptionPredicateFactory _expressionByConvertingSubscriptionKeyPathInExpression:toAttributeKeysInEntity:](self, "_expressionByConvertingSubscriptionKeyPathInExpression:toAttributeKeysInEntity:", v16, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0CB3518]);
    v19 = objc_msgSend(v13, "comparisonPredicateModifier");
    v20 = objc_msgSend(v13, "predicateOperatorType");
    v21 = objc_msgSend(v13, "options");

    v22 = (void *)objc_msgSend(v18, "initWithLeftExpression:rightExpression:modifier:type:options:", v15, v17, v19, v20, v21);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v36))
      {

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v8, "isEqual:", v37);

        v22 = v8;
        if ((v38 & 1) != 0)
          goto LABEL_22;
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unknown kind of subscription predicate: %@"), v8);
      }
      v22 = v8;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = (void *)MEMORY[0x1E0C99DA0];
      v24 = *MEMORY[0x1E0C99778];
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "raise:format:", v24, CFSTR("Unexpectedly, subscriptionPredicate was %@, instead of NSCompoundPredicate."), v26);

    }
    v27 = v8;
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v40 = v27;
    objc_msgSend(v27, "subpredicates");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v42;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v32);
          v34 = (void *)MEMORY[0x1D8236758]();
          -[VSSubscriptionPredicateFactory predicateByConvertingSubscriptionKeyPathsInPredicate:toAttributeKeysInEntity:](self, "predicateByConvertingSubscriptionKeyPathsInPredicate:toAttributeKeysInEntity:", v33, v7);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v35);

          objc_autoreleasePoolPop(v34);
          ++v32;
        }
        while (v30 != v32);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v30);
    }

    v13 = v40;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(v40, "compoundPredicateType"), v15);

  }
LABEL_22:

  return v22;
}

- (void)setAppInstallationInfoCenter:(id)a3
{
  objc_storeStrong((id *)&self->_appInstallationInfoCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInstallationInfoCenter, 0);
}

- (void)_predicateTemplateForSourceOfTask:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Unable to determine bundle ID of caller.", v1, 2u);
}

@end
