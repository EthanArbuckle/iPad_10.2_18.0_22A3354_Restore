@implementation DASSubmissionManager

void __29___DASSubmissionManager_init__block_invoke(uint64_t a1)
{
  void *v2;
  id obj;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "activityGroupQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "activityGroupQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29___DASSubmissionManager_init__block_invoke_2;
  v4[3] = &unk_1E624BA18;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);

  objc_sync_exit(obj);
}

void __29___DASSubmissionManager_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1B0DF4000, v7, OS_LOG_TYPE_DEFAULT, "For pool %{public}@, have queued %{public}@", (uint8_t *)&v8, 0x16u);
  }

}

uint64_t __56___DASSubmissionManager_submitActivities_withScheduler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "schedulingPriority");
  if (v8 > objc_msgSend(v7, "schedulingPriority"))
    goto LABEL_2;
  v10 = objc_msgSend(v7, "schedulingPriority");
  if (v10 < objc_msgSend(v6, "schedulingPriority"))
  {
LABEL_4:
    v9 = 1;
    goto LABEL_10;
  }
  if ((objc_msgSend(v6, "requiresInexpensiveNetworking") & 1) != 0
    || (objc_msgSend(v7, "requiresInexpensiveNetworking") & 1) == 0)
  {
    if (!objc_msgSend(v7, "requiresInexpensiveNetworking")
      || objc_msgSend(v7, "requiresInexpensiveNetworking"))
    {
      objc_msgSend(v6, "startBefore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startBefore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "compare:", v12);

      goto LABEL_10;
    }
    goto LABEL_4;
  }
LABEL_2:
  v9 = -1;
LABEL_10:

  return v9;
}

@end
