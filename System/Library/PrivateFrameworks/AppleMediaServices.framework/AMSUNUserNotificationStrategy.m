@implementation AMSUNUserNotificationStrategy

+ (id)_activeNotificationsWithCenterBundleId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AMSUserNotification *v15;
  AMSUserNotification *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "_centerForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__72;
  v29 = __Block_byref_object_dispose__72;
  v30 = 0;
  v7 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__AMSUNUserNotificationStrategy__activeNotificationsWithCenterBundleId___block_invoke;
  v22[3] = &unk_1E2546720;
  v24 = &v25;
  v8 = v7;
  v23 = v8;
  objc_msgSend(v6, "getDeliveredNotificationsWithCompletionHandler:", v22);
  v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (id)v26[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        v15 = [AMSUserNotification alloc];
        v16 = -[AMSUserNotification initWithUNNotification:](v15, "initWithUNNotification:", v14, (_QWORD)v18);
        objc_msgSend(v5, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
    }
    while (v11);
  }

  _Block_object_dispose(&v25, 8);
  return v5;
}

void __72__AMSUNUserNotificationStrategy__activeNotificationsWithCenterBundleId___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (BOOL)_badgeBundleId:(id)a3 increment:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  char v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  id *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a4;
  v8 = a3;
  objc_msgSend(a1, "_centerForBundleId:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "badgeNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longLongValue");

  if (v6)
    v12 = v11 + 1;
  else
    v12 = v11 - 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v14 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __64__AMSUNUserNotificationStrategy__badgeBundleId_increment_error___block_invoke;
  v19[3] = &unk_1E2546748;
  v21 = &v23;
  v22 = a5;
  v15 = v14;
  v20 = v15;
  objc_msgSend(v9, "setBadgeNumber:withCompletionHandler:", v13, v19);
  v16 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v15, v16);
  v17 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return v17;
}

intptr_t __64__AMSUNUserNotificationStrategy__badgeBundleId_increment_error___block_invoke(uint64_t a1, id a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (a2)
  {
    *(_BYTE *)(v3 + 24) = 0;
    if (*(_QWORD *)(a1 + 48))
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(a2);
  }
  else
  {
    *(_BYTE *)(v3 + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_postNotification:(id)a3 bag:(id)a4 centerBundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSMutableBinaryPromise *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  AMSMutableBinaryPromise *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  AMSMutableBinaryPromise *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  AMSMutableBinaryPromise *v29;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  AMSMutableBinaryPromise *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(AMSMutableBinaryPromise);
  objc_msgSend(v8, "logKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = AMSSetLogKey(v12);

  objc_msgSend(a1, "_centerForBundleId:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    AMSError(0, CFSTR("Unknown Center"), CFSTR("Unable to locate notification center for posting"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutableBinaryPromise finishWithError:](v11, "finishWithError:", v15);

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v11;
    v19 = (void *)objc_opt_class();
    v31 = v19;
    objc_msgSend(v8, "logKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v39 = v19;
    v11 = v18;
    v40 = 2114;
    v41 = v20;
    v42 = 2114;
    v43 = v21;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting notification: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v8, "createUNNotificationContent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createUNNotificationRequestFromContent:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __70__AMSUNUserNotificationStrategy__postNotification_bag_centerBundleId___block_invoke;
  v32[3] = &unk_1E2546770;
  v33 = v8;
  v34 = v14;
  v37 = a1;
  v24 = v11;
  v35 = v24;
  v36 = v9;
  v25 = v9;
  v26 = v14;
  v27 = v8;
  +[AMSUserNotification handleServiceExtensionNotificationRequest:bag:withContentHandler:](AMSUserNotification, "handleServiceExtensionNotificationRequest:bag:withContentHandler:", v23, v25, v32);
  v28 = v36;
  v29 = v24;

  return v29;
}

void __70__AMSUNUserNotificationStrategy__postNotification_bag_centerBundleId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "logKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = AMSSetLogKey(v5);

  objc_msgSend(*(id *)(a1 + 32), "createUNNotificationRequestFromContent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__AMSUNUserNotificationStrategy__postNotification_bag_centerBundleId___block_invoke_2;
  v11[3] = &unk_1E2545270;
  v14 = *(_QWORD *)(a1 + 64);
  v8 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v8, "addNotificationRequest:withCompletionHandler:", v7, v11);
  +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "flush");

}

void __70__AMSUNUserNotificationStrategy__postNotification_bag_centerBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v7;
      v20 = 2114;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      v24 = 2114;
      v25 = v3;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to post notification: %{public}@. Error: %{public}@", (uint8_t *)&v18, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class();
      v14 = *(void **)(a1 + 32);
      v15 = v13;
      objc_msgSend(v14, "logKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v13;
      v20 = 2114;
      v21 = v16;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully posted notification: %{public}@", (uint8_t *)&v18, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess");
  }

}

+ (id)_removeNotificationWithIdentifier:(id)a3 centerBundleId:(id)a4 logKey:(id)a5 scheduledOnly:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a4;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v24 = (id)objc_opt_class();
    v25 = 2114;
    v26 = v11;
    v27 = 2114;
    v28 = v10;
    v15 = v24;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing notification: %{public}@", buf, 0x20u);

  }
  objc_msgSend(a1, "_centerForBundleId:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a6)
  {
    v22 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeDeliveredNotificationsWithIdentifiers:", v17);

  }
  v21 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removePendingNotificationRequestsWithIdentifiers:", v18);

  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_removeNotification:(id)a3 centerBundleId:(id)a4
{
  void *v4;
  void *v5;

  AMSError(11, CFSTR("Remove Not Implemented"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_centerForBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isEqualToString:", v5);

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", v3);
    }
    v8 = (void *)v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
