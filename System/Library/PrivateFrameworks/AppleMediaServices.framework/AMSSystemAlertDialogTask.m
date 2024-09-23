@implementation AMSSystemAlertDialogTask

- (AMSSystemAlertDialogTask)initWithRequest:(id)a3
{
  id v5;
  AMSSystemAlertDialogTask *v6;
  AMSSystemAlertDialogTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSystemAlertDialogTask;
  v6 = -[AMSTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v7->_defaultButtonIndex = -1;
    v7->_dismissOnHomeButton = 1;
    v7->_displaysOnLockscreen = 0;
    v7->_shouldDismissAfterUnlock = 1;
    v7->_unlockActionButtonIndex = -1;
  }

  return v7;
}

- (id)present
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__AMSSystemAlertDialogTask_present__block_invoke;
  v3[3] = &unk_1E2541E90;
  v3[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __35__AMSSystemAlertDialogTask_present__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const void *v11;
  const void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  uint8_t v26[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE buf[12];
  __int16 v31;
  _BYTE v32[10];
  void *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v6;
    v31 = 2114;
    *(_QWORD *)v32 = v8;
    *(_WORD *)&v32[8] = 2114;
    v33 = v9;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting system alert using request: %{public}@", buf, 0x20u);

  }
  *(_QWORD *)buf = *MEMORY[0x1E0C9B830];
  *(_DWORD *)&buf[8] = 1;
  *(_QWORD *)&v32[2] = *MEMORY[0x1E0C9B868];
  LODWORD(v33) = 2;
  v34 = *MEMORY[0x1E0C9B838];
  v35 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_reorderButtonActions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v11 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_createNoteDictionaryWithKeys:buttonActions:outOptions:", buf, v10, &v25);
  if (v11)
    goto LABEL_6;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_opt_class();
    v17 = *(void **)(a1 + 32);
    v18 = v16;
    objc_msgSend(v17, "request");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v26 = 138543618;
    v27 = v16;
    v28 = 2114;
    v29 = v20;
    _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create note dictionary.", v26, 0x16u);

  }
  AMSError(0, CFSTR("System Dialog Task Failed"), CFSTR("Unknown error occurred creating the note dictionary"), 0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
LABEL_6:
    v12 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_showNotificationFromDictionary:options:", v11, v25);
    if (v12)
    {
      v13 = 0;
    }
    else
    {
      AMSError(0, CFSTR("System Dialog Task Failed"), CFSTR("Unable to create the system notification"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v13 = (void *)v21;
    v12 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isDialogDismissalEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "setUserNotification:", v12);
  if (v13)
  {
    v22 = 0;
    goto LABEL_24;
  }
  objc_msgSend(*(id *)(a1 + 32), "_handleResponseForNote:buttonActions:keys:", v12, v10, buf);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v22 = (void *)v23;
  }
  else
  {
    AMSError(0, CFSTR("System Dialog Task Failed"), CFSTR("System dialog task finished without a result"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoDismissResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_24;
    objc_msgSend(*(id *)(a1 + 32), "autoDismissResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = 0;
LABEL_24:
  if (v12)
    CFRelease(v12);
  if (v11)
    CFRelease(v11);
  if (v13)
  {
    if (a2)
      *a2 = objc_retainAutorelease(v13);

    v22 = 0;
  }

  return v22;
}

- (void)_dismiss
{
  void *v3;
  AMSDialogResult *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[AMSSystemAlertDialogTask userNotification](self, "userNotification"))
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSSystemAlertDialogTask isDialogDismissalEnabled](self, "isDialogDismissalEnabled"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v11;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Tried to dismiss nothing (isDialogDismissalEnabled is %{public}@ and should be YES)", (uint8_t *)&v14, 0x20u);

    }
    goto LABEL_12;
  }
  -[AMSSystemAlertDialogTask request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AMSDialogResult initWithOriginalRequest:selectedActionIdentifier:]([AMSDialogResult alloc], "initWithOriginalRequest:selectedActionIdentifier:", v3, CFSTR("No action required"));
  -[AMSSystemAlertDialogTask setAutoDismissResult:](self, "setAutoDismissResult:", v4);

  v5 = CFUserNotificationCancel(-[AMSSystemAlertDialogTask userNotification](self, "userNotification"));
  -[AMSSystemAlertDialogTask setUserNotification:](self, "setUserNotification:", 0);
  if ((_DWORD)v5)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to dismiss dialog, CFUserNotificationCancel returned %{public}@", (uint8_t *)&v14, 0x20u);

    }
LABEL_12:

  }
}

- (__CFDictionary)_createNoteDictionaryWithKeys:(ButtonKey *)a3 buttonActions:(id)a4 outOptions:(unint64_t *)a5
{
  id v7;
  __CFDictionary *Mutable;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  const void *v16;
  const void *v17;
  ButtonKey *v18;
  void *v19;
  void *v20;
  __CFString *var0;
  void *v22;
  const void *v23;
  const void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  const void *v47;
  id v48;
  unint64_t v49;
  unint64_t v50;
  const void *v51;
  _BOOL4 v52;
  const void *v53;
  const void *v54;
  const void *v55;
  const void *v56;
  const void *v57;
  const void *v58;
  const void *v59;
  const void *v60;
  const void *v61;
  const void *v62;
  const void *v63;
  const void *v64;
  const void *v65;
  const void *v66;
  const void *v67;
  void *v69;
  AMSSystemAlertDialogTask *v70;
  const void *v72;
  __CFString *v73;
  __CFString *v74;

  v7 = a4;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    if (a5)
    {
      *a5 = 3;
      if (objc_msgSend(v7, "count"))
        *a5 |= 0x20uLL;
    }
    -[AMSSystemAlertDialogTask request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C9B800], v10);
    v70 = self;
    -[AMSSystemAlertDialogTask request](self, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "message");
    v12 = (const void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C9B810], v12);
    v13 = objc_msgSend(v7, "count", v12);
    v14 = 3;
    if (v13 < 3)
      v14 = v13;
    if (v14)
    {
      v15 = 0;
      v74 = (__CFString *)*MEMORY[0x1E0C9B830];
      v73 = (__CFString *)*MEMORY[0x1E0C9B868];
      v72 = (const void *)*MEMORY[0x1E0DABB28];
      v16 = (const void *)*MEMORY[0x1E0DABC30];
      v17 = (const void *)*MEMORY[0x1E0DABB70];
      v18 = a3;
      do
      {
        v19 = v7;
        objc_msgSend(v7, "objectAtIndexedSubscript:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        var0 = v18->var0;
        objc_msgSend(v20, "title");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        CFDictionarySetValue(Mutable, var0, v22);

        if (var0 == v73)
          v23 = v16;
        else
          v23 = v17;
        if (var0 == v74)
          v24 = v72;
        else
          v24 = v23;
        if (objc_msgSend(v20, "style") == 1)
          v25 = 1;
        else
          v25 = 2 * (objc_msgSend(v20, "style") == 2);
        v7 = v19;
        CFDictionarySetValue(Mutable, v24, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25));

        ++v15;
        v26 = objc_msgSend(v19, "count");
        v27 = 3;
        if (v26 < 3)
          v27 = v26;
        ++v18;
      }
      while (v27 > v15);
    }
    -[AMSSystemAlertDialogTask request](v70, "request");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "textFields");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    if (v30)
    {
      v31 = v7;
      v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[AMSSystemAlertDialogTask request](v70, "request");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "textFields");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v35)
      {
        v36 = 0;
        do
        {
          -[AMSSystemAlertDialogTask request](v70, "request");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "textFields");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectAtIndexedSubscript:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = objc_alloc_init(MEMORY[0x1E0DAAF28]);
          objc_msgSend(v40, "setAutocapitalizationType:", 0);
          objc_msgSend(v40, "setAutocorrectionType:", 1);
          objc_msgSend(v40, "setSecure:", objc_msgSend(v39, "secure"));
          objc_msgSend(v39, "placeholder");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setTitle:", v41);

          objc_msgSend(v39, "text");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setValue:", v42);

          objc_msgSend(v40, "setKeyboardType:", -[AMSSystemAlertDialogTask _keyboardTypeFor:](v70, "_keyboardTypeFor:", objc_msgSend(v39, "keyboardType")));
          objc_msgSend(v40, "build");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v43);

          ++v36;
          -[AMSSystemAlertDialogTask request](v70, "request");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "textFields");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "count");

        }
        while (v36 < v46);
      }
      v47 = (const void *)*MEMORY[0x1E0DABA70];
      v48 = v32;
      CFDictionarySetValue(Mutable, v47, v48);

      v7 = v31;
    }
    v49 = -[AMSSystemAlertDialogTask _defaultButtonIndexForActions:](v70, "_defaultButtonIndexForActions:", v7);
    if (v49 <= 2)
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0DABB78], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3[v49].var1));
    v50 = -[AMSSystemAlertDialogTask unlockActionButtonIndex](v70, "unlockActionButtonIndex");
    if (v50 <= 2)
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0DABB58], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3[v50].var1));
    v51 = (const void *)*MEMORY[0x1E0DABBA8];
    v52 = -[AMSSystemAlertDialogTask displaysOnLockscreen](v70, "displaysOnLockscreen");
    v53 = (const void *)*MEMORY[0x1E0C9AE50];
    v54 = (const void *)*MEMORY[0x1E0C9AE40];
    if (v52)
      v55 = (const void *)*MEMORY[0x1E0C9AE50];
    else
      v55 = (const void *)*MEMORY[0x1E0C9AE40];
    CFDictionarySetValue(Mutable, v51, v55);
    v56 = (const void *)*MEMORY[0x1E0DABBC8];
    if (-[AMSSystemAlertDialogTask displaysOnLockscreen](v70, "displaysOnLockscreen"))
      v57 = v53;
    else
      v57 = v54;
    CFDictionarySetValue(Mutable, v56, v57);
    v58 = (const void *)*MEMORY[0x1E0DABB10];
    if (-[AMSSystemAlertDialogTask dismissOnHomeButton](v70, "dismissOnHomeButton"))
      v59 = v53;
    else
      v59 = v54;
    CFDictionarySetValue(Mutable, v58, v59);
    v60 = (const void *)*MEMORY[0x1E0DABB98];
    if (-[AMSSystemAlertDialogTask dismissOnLock](v70, "dismissOnLock"))
      v61 = v53;
    else
      v61 = v54;
    CFDictionarySetValue(Mutable, v60, v61);
    v62 = (const void *)*MEMORY[0x1E0C9B820];
    if (-[AMSSystemAlertDialogTask shouldDisplayAsTopMost](v70, "shouldDisplayAsTopMost"))
      v63 = v53;
    else
      v63 = v54;
    CFDictionarySetValue(Mutable, v62, v63);
    v64 = (const void *)*MEMORY[0x1E0DABBB0];
    if (-[AMSSystemAlertDialogTask shouldDismissAfterUnlock](v70, "shouldDismissAfterUnlock"))
      v65 = v53;
    else
      v65 = v54;
    CFDictionarySetValue(Mutable, v64, v65);
    v66 = (const void *)*MEMORY[0x1E0DABC38];
    if (-[AMSSystemAlertDialogTask shouldPendInSetupIfNotAllowed](v70, "shouldPendInSetupIfNotAllowed"))
      v67 = v53;
    else
      v67 = v54;
    CFDictionarySetValue(Mutable, v66, v67);

  }
  return Mutable;
}

- (__CFUserNotification)_showNotificationFromDictionary:(__CFDictionary *)a3 options:(unint64_t)a4
{
  CFUserNotificationRef v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  SInt32 error;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  error = 0;
  v5 = CFUserNotificationCreate(0, 0.0, a4, &error, a3);
  if (v5 && error)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      -[AMSSystemAlertDialogTask request](self, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v8;
      v16 = 2114;
      v17 = v11;
      v18 = 2048;
      v19 = error;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error creating note %ld.", buf, 0x20u);

    }
    CFRelease(v5);
    return 0;
  }
  return v5;
}

- (int64_t)_defaultButtonIndexForActions:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[AMSSystemAlertDialogTask defaultButtonIndex](self, "defaultButtonIndex");
  if ((v5 & 0x8000000000000000) == 0)
    goto LABEL_30;
  -[AMSSystemAlertDialogTask request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v10)
    {
      v11 = v10;
      v28 = v5;
      v29 = v4;
      v12 = 0;
      v13 = *(_QWORD *)v37;
      while (2)
      {
        v14 = 0;
        v30 = v11 + v12;
        v31 = v12;
        do
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v14), "identifier", v28);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSSystemAlertDialogTask request](self, "request");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "defaultAction");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v15, "isEqualToString:", v18);

          if ((v19 & 1) != 0)
          {
            v5 = v31 + v14;
            goto LABEL_13;
          }
          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        v12 = v30;
        if (v11)
          continue;
        break;
      }
      v5 = v28;
LABEL_13:

      v4 = v29;
      if ((v5 & 0x8000000000000000) == 0)
        goto LABEL_30;
    }
    else
    {

    }
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v4;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (!v21)
  {

LABEL_29:
    v5 = objc_msgSend(v20, "count") - 1;
    goto LABEL_30;
  }
  v22 = v21;
  v23 = 0;
  v24 = *(_QWORD *)v33;
  while (2)
  {
    v25 = 0;
    v26 = v22 + v23;
    do
    {
      if (*(_QWORD *)v33 != v24)
        objc_enumerationMutation(v20);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v25), "style") == 2)
      {
        v5 = v23 + v25;
        goto LABEL_26;
      }
      ++v25;
    }
    while (v22 != v25);
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    v23 = v26;
    if (v22)
      continue;
    break;
  }
LABEL_26:

  if (v5 < 0)
    goto LABEL_29;
LABEL_30:

  return v5;
}

- (id)_handleResponseForNote:(__CFUserNotification *)a3 buttonActions:(id)a4 keys:(ButtonKey *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  int *p_var1;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  AMSDialogResult *v27;
  void *v28;
  void *v29;
  AMSDialogResult *v30;
  id v32;
  CFOptionFlags responseFlags;
  void *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  responseFlags = 0;
  v9 = (void *)0x1E0CB3000;
  if (CFUserNotificationReceiveResponse(a3, 0.0, &responseFlags))
  {
LABEL_5:
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
      v32 = v8;
      -[AMSSystemAlertDialogTask request](self, "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = objc_opt_class();
      v19 = v18;
      if (v16)
      {
        -[AMSSystemAlertDialogTask request](self, "request");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logKey");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] "), v19, v8);
      }
      else
      {
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: "), v18);
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v20;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@System dialog finished without a selected button", buf, 0xCu);
      if (v16)
      {

        v20 = v9;
      }

      v8 = v32;
    }

    v10 = -1;
    v21 = 1;
  }
  else
  {
    v10 = 0;
    p_var1 = &a5->var1;
    while (1)
    {
      v12 = *p_var1;
      p_var1 += 4;
      if (responseFlags == v12)
        break;
      if (++v10 == 3)
        goto LABEL_5;
    }
    v21 = 0;
  }
  CFUserNotificationGetResponseDictionary(a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0C9B880]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = 0;
      if ((v21 & 1) != 0)
        goto LABEL_21;
LABEL_23:
      objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v24 = objc_msgSend(v23, "copy");
  }
  v25 = (void *)v24;
  if ((v21 & 1) == 0)
    goto LABEL_23;
LABEL_21:
  v26 = 0;
LABEL_24:
  v27 = [AMSDialogResult alloc];
  -[AMSSystemAlertDialogTask request](self, "request");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[AMSDialogResult initWithOriginalRequest:selectedActionIdentifier:](v27, "initWithOriginalRequest:selectedActionIdentifier:", v28, v29);

  -[AMSDialogResult setTextfieldValues:](v30, "setTextfieldValues:", v25);
  return v30;
}

- (int64_t)_keyboardTypeFor:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return qword_18CF5CD10[a3];
}

- (id)_reorderButtonActions
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[AMSSystemAlertDialogTask request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[AMSSystemAlertDialogTask request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 <= 1)
  {
LABEL_2:

    return v8;
  }
  v9 = objc_msgSend(v7, "count");

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v9 != 2)
  {
    v28 = 0uLL;
    v29 = 0uLL;
    *((_QWORD *)&v26 + 1) = 0;
    v27 = 0uLL;
    -[AMSSystemAlertDialogTask request](self, "request", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "buttonActions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v20)
    {
      v21 = v20;
      v6 = 0;
      v22 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v24, "style") == 2)
          {
            v25 = v24;

            v6 = v25;
          }
          else
          {
            objc_msgSend(v8, "addObject:", v24);
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v21);

      if (v6)
        objc_msgSend(v8, "addObject:", v6);
    }
    else
    {

      v6 = 0;
    }
    goto LABEL_2;
  }
  v32 = 0uLL;
  v33 = 0uLL;
  v30 = 0uLL;
  v31 = 0uLL;
  -[AMSSystemAlertDialogTask request](self, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buttonActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        if (objc_msgSend(v16, "style") == 2)
          objc_msgSend(v8, "insertObject:atIndex:", v16, 0);
        else
          objc_msgSend(v8, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v13);
  }

  return v8;
}

- (AMSDialogRequest)request
{
  return self->_request;
}

- (AMSDialogResult)autoDismissResult
{
  return self->_autoDismissResult;
}

- (void)setAutoDismissResult:(id)a3
{
  objc_storeStrong((id *)&self->_autoDismissResult, a3);
}

- (int64_t)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (void)setDefaultButtonIndex:(int64_t)a3
{
  self->_defaultButtonIndex = a3;
}

- (BOOL)dismissOnHomeButton
{
  return self->_dismissOnHomeButton;
}

- (void)setDismissOnHomeButton:(BOOL)a3
{
  self->_dismissOnHomeButton = a3;
}

- (BOOL)dismissOnLock
{
  return self->_dismissOnLock;
}

- (void)setDismissOnLock:(BOOL)a3
{
  self->_dismissOnLock = a3;
}

- (BOOL)shouldDismissAfterUnlock
{
  return self->_shouldDismissAfterUnlock;
}

- (void)setShouldDismissAfterUnlock:(BOOL)a3
{
  self->_shouldDismissAfterUnlock = a3;
}

- (BOOL)shouldDisplayAsTopMost
{
  return self->_shouldDisplayAsTopMost;
}

- (void)setShouldDisplayAsTopMost:(BOOL)a3
{
  self->_shouldDisplayAsTopMost = a3;
}

- (BOOL)shouldPendInSetupIfNotAllowed
{
  return self->_shouldPendInSetupIfNotAllowed;
}

- (void)setShouldPendInSetupIfNotAllowed:(BOOL)a3
{
  self->_shouldPendInSetupIfNotAllowed = a3;
}

- (BOOL)displaysOnLockscreen
{
  return self->_displaysOnLockscreen;
}

- (void)setDisplaysOnLockscreen:(BOOL)a3
{
  self->_displaysOnLockscreen = a3;
}

- (int64_t)unlockActionButtonIndex
{
  return self->_unlockActionButtonIndex;
}

- (void)setUnlockActionButtonIndex:(int64_t)a3
{
  self->_unlockActionButtonIndex = a3;
}

- (__CFUserNotification)userNotification
{
  return self->_userNotification;
}

- (void)setUserNotification:(__CFUserNotification *)a3
{
  self->_userNotification = a3;
}

- (BOOL)isDialogDismissalEnabled
{
  return self->_isDialogDismissalEnabled;
}

- (void)setIsDialogDismissalEnabled:(BOOL)a3
{
  self->_isDialogDismissalEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoDismissResult, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
