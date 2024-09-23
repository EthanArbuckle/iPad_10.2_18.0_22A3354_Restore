@implementation FBAnalyticsLogWatchdogEvent

id __FBAnalyticsLogWatchdogEvent_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_setSafeObject:forKey:", v3, CFSTR("executableName"));

  objc_msgSend(v2, "bs_setSafeObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("bundleIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_setSafeObject:forKey:", v4, CFSTR("watchdogVisibility"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(*(id *)(a1 + 48), "event");
  if ((unint64_t)(v6 - 1) >= 4)
    v7 = 0;
  else
    v7 = v6;
  objc_msgSend(v5, "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_setSafeObject:forKey:", v8, CFSTR("watchdogEventType"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(*(id *)(a1 + 56), "taskState");
  if ((unint64_t)(v10 - 1) >= 3)
    v11 = 0;
  else
    v11 = v10;
  objc_msgSend(v9, "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_setSafeObject:forKey:", v12, CFSTR("taskState"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  v14 = objc_msgSend(*(id *)(a1 + 56), "visibility");
  v15 = 0;
  if ((unint64_t)(v14 - 1) <= 2)
    v15 = qword_1A36198A0[v14 - 1];
  objc_msgSend(v13, "numberWithInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_setSafeObject:forKey:", v16, CFSTR("visibility"));

  if (objc_msgSend(*(id *)(a1 + 64), "isResourceProvision"))
  {
    v17 = *(void **)(a1 + 64);
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = objc_msgSend(v17, "type");
    if (v19 == 2)
      v20 = 2;
    else
      v20 = v19 == 1;
    objc_msgSend(v18, "numberWithInteger:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bs_setSafeObject:forKey:", v21, CFSTR("resourceType"));

  }
  return v2;
}

@end
