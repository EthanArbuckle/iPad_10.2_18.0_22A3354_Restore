@implementation HDAppSubscriptionEntity

+ (id)allSubscriptionsForType:(int64_t)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  +[HDAppSubscriptionEntity _predicateForDataCode:]((uint64_t)a1, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAppSubscriptionEntity _subscriptionsWithPredicate:profile:error:]((uint64_t)a1, v9, v8, (uint64_t)a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_predicateForDataCode:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_self();
  if (_HKValidDataTypeCode())
  {
    v3 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("code"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)_predicateForBundleID:(uint64_t)a3 dataCode:
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a2;
  v5 = objc_opt_self();
  +[HDAppSubscriptionEntity _predicateForBundleIdentifier:](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDAppSubscriptionEntity _predicateForDataCode:](v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_predicateForBundleIdentifier:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("bundle_id"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)addSubscriptionWithBundleID:(id)a3 dataCode:(int64_t)a4 updateFrequency:(unint64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  int64_t v24;
  unint64_t v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAppSubscriptionEntity.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID != nil"));

    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAppSubscriptionEntity.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataCode >= 0"));

    goto LABEL_3;
  }
  if (a4 < 0)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v14, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = CFSTR("bundle_id");
  v26[1] = CFSTR("code");
  v26[2] = CFSTR("update_frequency");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __94__HDAppSubscriptionEntity_addSubscriptionWithBundleID_dataCode_updateFrequency_profile_error___block_invoke;
  v22[3] = &unk_1E6D10590;
  v23 = v13;
  v24 = a4;
  v25 = a5;
  v17 = v13;
  objc_msgSend(a1, "insertOrReplaceEntity:healthDatabase:properties:error:bindingHandler:", 1, v15, v16, a7, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18 != 0;
}

void __94__HDAppSubscriptionEntity_addSubscriptionWithBundleID_dataCode_updateFrequency_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB144](a2, CFSTR("bundle_id"), *(_QWORD *)(a1 + 32));
  MEMORY[0x1BCCAB114](a2, CFSTR("code"), *(_QWORD *)(a1 + 40));
  JUMPOUT(0x1BCCAB114);
}

+ (BOOL)removeSubscriptionsWithBundleID:(id)a3 dataCode:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a5;
  +[HDAppSubscriptionEntity _predicateForBundleID:dataCode:]((uint64_t)a1, a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a6) = objc_msgSend(a1, "deleteEntitiesWithPredicate:healthDatabase:error:", v11, v12, a6);
  return (char)a6;
}

+ (id)_subscriptionsWithPredicate:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[8];

  v17[7] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_opt_self();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17[0] = CFSTR("bundle_id");
  v17[1] = CFSTR("code");
  v17[2] = CFSTR("update_frequency");
  v17[3] = CFSTR("last_anchor");
  v17[4] = CFSTR("last_ack_time");
  v17[5] = CFSTR("launch_time_hysteresis");
  v17[6] = CFSTR("last_association_anchor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__HDAppSubscriptionEntity__subscriptionsWithPredicate_profile_error___block_invoke;
  v15[3] = &unk_1E6CE9FC0;
  v12 = v9;
  v16 = v12;
  LODWORD(a4) = objc_msgSend(v8, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v10, v7, v11, a4, v15);

  if ((_DWORD)a4)
    v13 = (void *)objc_msgSend(v12, "copy");
  else
    v13 = 0;

  return v13;
}

+ (id)allSubscriptionsForBundleID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAppSubscriptionEntity.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID != nil"));

  }
  +[HDAppSubscriptionEntity _predicateForBundleIdentifier:]((uint64_t)a1, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAppSubscriptionEntity _subscriptionsWithPredicate:profile:error:]((uint64_t)a1, v11, v10, (uint64_t)a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)subscriptionForBundleID:(id)a3 dataCode:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v10 = a5;
  +[HDAppSubscriptionEntity _predicateForBundleID:dataCode:]((uint64_t)a1, a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAppSubscriptionEntity _subscriptionsWithPredicate:profile:error:]((uint64_t)a1, v11, v10, (uint64_t)a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)setLastAnchor:(id)a3 lastAckTime:(id)a4 forBundleID:(id)a5 dataTypes:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  char v24;
  _QWORD v26[4];
  id v27;
  id v28;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  +[HDAppSubscriptionEntity _predicateForBundleID:dataTypes:]((uint64_t)a1, a5, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("last_ack_time"), 0);
  objc_msgSend(v14, "dataAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v18, "addObject:", CFSTR("last_anchor"));
  objc_msgSend(v14, "associationAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v18, "addObject:", CFSTR("last_association_anchor"));
  objc_msgSend(v16, "database");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __89__HDAppSubscriptionEntity_setLastAnchor_lastAckTime_forBundleID_dataTypes_profile_error___block_invoke;
  v26[3] = &unk_1E6CE89A8;
  v27 = v14;
  v28 = v15;
  v22 = v15;
  v23 = v14;
  v24 = objc_msgSend(a1, "updateProperties:predicate:healthDatabase:error:bindingHandler:", v18, v17, v21, a8, v26);

  return v24;
}

+ (id)_predicateForBundleID:(void *)a3 dataTypes:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  uint64_t v18;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  +[HDAppSubscriptionEntity _predicateForBundleIdentifier:](v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __59__HDAppSubscriptionEntity__predicateForBundleID_dataTypes___block_invoke;
  v16 = &unk_1E6D105B8;
  v17 = v8;
  v18 = v6;
  v9 = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v13);

  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v9, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __89__HDAppSubscriptionEntity_setLastAnchor_lastAckTime_forBundleID_dataTypes_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "dataAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCCAB12C](a2, CFSTR("last_anchor"), v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "associationAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "associationAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCCAB12C](a2, CFSTR("last_association_anchor"), v7);

  }
  JUMPOUT(0x1BCCAB12CLL);
}

+ (BOOL)setLaunchTimeHysteresis:(id)a3 forBundleID:(id)a4 dataTypes:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  +[HDAppSubscriptionEntity _predicateForBundleID:dataTypes:]((uint64_t)a1, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("launch_time_hysteresis");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__HDAppSubscriptionEntity_setLaunchTimeHysteresis_forBundleID_dataTypes_profile_error___block_invoke;
  v19[3] = &unk_1E6CE84C8;
  v20 = v12;
  v17 = v12;
  LOBYTE(a7) = objc_msgSend(a1, "updateProperties:predicate:healthDatabase:error:bindingHandler:", v15, v14, v16, a7, v19);

  return (char)a7;
}

void __87__HDAppSubscriptionEntity_setLaunchTimeHysteresis_forBundleID_dataTypes_profile_error___block_invoke()
{
  JUMPOUT(0x1BCCAB12CLL);
}

uint64_t __69__HDAppSubscriptionEntity__subscriptionsWithPredicate_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HDAppSubscription *v6;
  void *v7;
  HDAppSubscription *v8;

  v6 = [HDAppSubscription alloc];
  MEMORY[0x1BCCAB1D4](a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDAppSubscription initWithBundleIdentifier:dataCode:](v6, "initWithBundleIdentifier:dataCode:", v7, HDSQLiteColumnAsInt64());

  -[HDAppSubscription setUpdateFrequency:](v8, "setUpdateFrequency:", HDSQLiteColumnAsInt64());
  -[HDAppSubscription setLastAnchor:](v8, "setLastAnchor:", HDSQLiteColumnAsInt64());
  -[HDAppSubscription setLastAckTime:](v8, "setLastAckTime:", HDSQLiteColumnAsInt64());
  -[HDAppSubscription setLaunchTimeHysteresis:](v8, "setLaunchTimeHysteresis:", HDSQLiteColumnAsInt64());
  -[HDAppSubscription setLastAssociationAnchor:](v8, "setLastAssociationAnchor:", HDSQLiteColumnAsInt64());
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

  return 1;
}

void __59__HDAppSubscriptionEntity__predicateForBundleID_dataTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[HDAppSubscriptionEntity _predicateForDataCode:](*(_QWORD *)(a1 + 40), objc_msgSend(a2, "code"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)databaseTable
{
  return CFSTR("subscription");
}

+ (id)tableAliases
{
  return &unk_1E6DFA5F8;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_103;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("bundle_id");
  v3[1] = CFSTR("code");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
