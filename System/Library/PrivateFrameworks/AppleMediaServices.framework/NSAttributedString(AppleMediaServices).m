@implementation NSAttributedString(AppleMediaServices)

- (id)ams_replaceAccountPatternWithUsername:()AppleMediaServices
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  id v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1E2548760;
  objc_msgSend(a1, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeOfString:options:", 0x1E2566EE0, 1);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D002B8], "formattedUsernameFromUsername:", v5);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v12;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "NSAttributedString+AppleMediaServices: [%{public}@] Failed to determine display username", (uint8_t *)&v14, 0xCu);

      }
      v9 = v5;
    }
    objc_msgSend(a1, "ams_replaceOccurrencesOfString:withString:options:", 0x1E2566EE0, v9, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)ams_replaceOccurrencesOfString:()AppleMediaServices withString:options:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(a1, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __92__NSAttributedString_AppleMediaServices__ams_replaceOccurrencesOfString_withString_options___block_invoke;
  v19 = &unk_1E25478F8;
  v20 = v10;
  v21 = v8;
  v12 = v8;
  v13 = v10;
  objc_msgSend(v11, "ams_enumerateRangesOfString:options:usingBlock:", v9, a5 & 4, &v16);

  v14 = (void *)objc_msgSend(v13, "copy", v16, v17, v18, v19);
  return v14;
}

@end
