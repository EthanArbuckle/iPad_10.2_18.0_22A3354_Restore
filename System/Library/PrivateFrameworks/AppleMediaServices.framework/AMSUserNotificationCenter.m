@implementation AMSUserNotificationCenter

+ (id)activeNotificationsWithCenterBundleId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_determineStrategyForBundleId:", v4), "_activeNotificationsWithCenterBundleId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)badgeBundleId:(id)a3 badgeId:(id)a4 enabled:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(a1, "_determineStrategyForBundleId:", v10);
  if (v10 && v11)
  {
    v18 = v12;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__76;
    v36 = __Block_byref_object_dispose__76;
    v37 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__AMSUserNotificationCenter_badgeBundleId_badgeId_enabled_error___block_invoke;
    v21[3] = &unk_1E2547738;
    v27 = a5;
    v22 = v11;
    v24 = &v32;
    v25 = &v28;
    v26 = v18;
    v23 = v10;
    +[AMSDefaults updateBadgeIdsForBundle:block:](AMSDefaults, "updateBadgeIdsForBundle:block:", v23, v21);
    if (a6)
      *a6 = objc_retainAutorelease((id)v33[5]);
    v19 = *((_BYTE *)v29 + 24) != 0;

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);

  }
  else if (a6)
  {
    AMSErrorWithFormat(2, CFSTR("Failed To Badge"), CFSTR("Invalid parameters. center:%@ badgeId:%@"), v13, v14, v15, v16, v17, (uint64_t)v10);
    v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __65__AMSUserNotificationCenter_badgeBundleId_badgeId_enabled_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id obj;
  id v24;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 72);
  v5 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));
  if (v4)
  {
    if (v5)
    {
      v6 = CFSTR("Failed to badge");
      v7 = CFSTR("Badge id already exists");
LABEL_11:
      AMSError(7, v6, v7, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

      goto LABEL_12;
    }
    v13 = *(void **)(a1 + 64);
    v14 = *(unsigned __int8 *)(a1 + 72);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v24 = *(id *)(v16 + 40);
    v17 = objc_msgSend(v13, "_badgeBundleId:increment:error:", v15, v14, &v24);
    objc_storeStrong((id *)(v16 + 40), v24);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v17;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
      goto LABEL_9;
    }
LABEL_12:
    v18 = 0;
    goto LABEL_13;
  }
  if ((v5 & 1) == 0)
  {
    v6 = CFSTR("Failed to unbadge");
    v7 = CFSTR("Badge id not found");
    goto LABEL_11;
  }
  v8 = *(void **)(a1 + 64);
  v9 = *(unsigned __int8 *)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v8, "_badgeBundleId:increment:error:", v10, v9, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v12;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    goto LABEL_12;
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));
LABEL_9:
  v18 = 1;
LABEL_13:

  return v18;
}

+ (id)postNotification:(id)a3 bag:(id)a4 centerBundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_determineStrategyForBundleId:", v8), "_postNotification:bag:centerBundleId:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)removeNotification:(id)a3 centerBundleId:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_determineStrategyForBundleId:", v6), "_removeNotification:centerBundleId:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)removeNotificationWithIdentifier:(id)a3 centerBundleId:(id)a4 logKey:(id)a5 scheduledOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_determineStrategyForBundleId:", v11), "_removeNotificationWithIdentifier:centerBundleId:logKey:scheduledOnly:", v12, v11, v10, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (Class)_determineStrategyForBundleId:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "length");
  if (v3)
    v3 = (id)objc_opt_class();
  return (Class)v3;
}

- (AMSUserNotificationStrategy)strategy
{
  return self->_strategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategy, 0);
}

@end
