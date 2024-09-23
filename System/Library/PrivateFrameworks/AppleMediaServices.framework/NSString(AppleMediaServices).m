@implementation NSString(AppleMediaServices)

- (id)ams_sha512HashStringUsingEncoding:()AppleMediaServices error:
{
  uint64_t v4;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint8_t v30[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = objc_opt_class();
      v14 = v13;
      if (v11)
      {
        AMSLogKey();
        v4 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v4);
      }
      else
      {
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(a1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v15;
      v38 = 2114;
      v39 = v16;
      v40 = 2048;
      v41 = a3;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to convert string to data. string = %{public}@ | encoding = %lu", buf, 0x20u);
      if (v11)
      {

        v15 = (void *)v4;
      }

    }
    if (a4)
    {
      AMSError(0, CFSTR("Conversion Error"), CFSTR("Unable to convert string to data."), 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v17 = objc_retainAutorelease(v8);
  if (CC_SHA512((const void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), buf))
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    for (i = 0; i != 64; ++i)
      objc_msgSend(v18, "appendFormat:", CFSTR("%02x"), buf[i]);
    v20 = (void *)objc_msgSend(v18, "copy");

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = objc_opt_class();
      v26 = v25;
      if (v23)
      {
        AMSLogKey();
        v4 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: [%@] "), v26, v4);
      }
      else
      {
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: "), v25);
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(a1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v30 = 138543874;
      v31 = v27;
      v32 = 2114;
      v33 = v28;
      v34 = 2048;
      v35 = a3;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to hash data. string = %{public}@ | encoding = %lu", v30, 0x20u);
      if (v23)
      {

        v27 = (void *)v4;
      }

    }
    if (a4)
    {
      AMSError(0, CFSTR("Hash Error"), CFSTR("Unable to string to a hashed representation."), 0);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (uint64_t)ams_isPercentEncodedForAllowedCharacters:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "stringByRemovingPercentEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "isEqualToString:", v6);
  return v7;
}

- (void)ams_enumerateRangesOfString:()AppleMediaServices options:usingBlock:
{
  void (**v8)(id, uint64_t, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v8 = a5;
  if (objc_msgSend(a1, "length"))
  {
    v9 = objc_msgSend(a1, "rangeOfString:options:range:", v16, a4, 0, objc_msgSend(a1, "length"));
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v9;
      v12 = v10;
      v13 = 0;
      do
      {
        v8[2](v8, v11, v12);
        if ((a4 & 4) != 0)
        {
          v14 = v11 - 1;
        }
        else
        {
          v13 = v11 + v12;
          v14 = objc_msgSend(a1, "length") - (v11 + v12);
        }
        v11 = objc_msgSend(a1, "rangeOfString:options:range:", v16, a4, v13, v14);
        v12 = v15;
      }
      while (v11 != 0x7FFFFFFFFFFFFFFFLL);
    }
  }

}

- (BOOL)ams_matchesRegex:()AppleMediaServices
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 1024) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)ams_replaceAccountPatternWithUsername:()AppleMediaServices
{
  __CFString *v4;
  __CFString *v5;
  id v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1E2548760;
  if (objc_msgSend(a1, "rangeOfString:options:", CFSTR("%%appleId%%"), 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D002B8], "formattedUsernameFromUsername:", v5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v10;
        _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "NSString+AppleMediaServices: [%{public}@] Failed to determine display username", (uint8_t *)&v12, 0xCu);

      }
      v7 = v5;
    }
    objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("%%appleId%%"), v7, 1, 0, objc_msgSend(a1, "length"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)ams_replacingMarkupUsingAccount:()AppleMediaServices shouldUppercase:
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_replaceAccountPatternWithUsername:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    objc_msgSend(v7, "localizedUppercaseString");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v7);
  objc_msgSend(MEMORY[0x1E0CB3940], "_replaceMarkupForMutableAttributedString:markupType:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "_replaceMarkupForMutableAttributedString:markupType:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "_replaceBreakingSpaceMarkupForMutableAttributedString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v12);
  return v13;
}

- (id)ams_sha256HashStringUsingEncoding:()AppleMediaServices error:
{
  uint64_t v4;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint8_t v30[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = objc_opt_class();
      v14 = v13;
      if (v11)
      {
        AMSLogKey();
        v4 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v4);
      }
      else
      {
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(a1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v15;
      v38 = 2114;
      v39 = v16;
      v40 = 2048;
      v41 = a3;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to convert string to data. string = %{public}@ | encoding = %lu", buf, 0x20u);
      if (v11)
      {

        v15 = (void *)v4;
      }

    }
    if (a4)
    {
      AMSError(0, CFSTR("Conversion Error"), CFSTR("Unable to convert string to data."), 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v17 = objc_retainAutorelease(v8);
  if (CC_SHA256((const void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), buf))
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    for (i = 0; i != 32; ++i)
      objc_msgSend(v18, "appendFormat:", CFSTR("%02x"), buf[i]);
    v20 = (void *)objc_msgSend(v18, "copy");

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = objc_opt_class();
      v26 = v25;
      if (v23)
      {
        AMSLogKey();
        v4 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: [%@] "), v26, v4);
      }
      else
      {
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: "), v25);
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(a1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v30 = 138543874;
      v31 = v27;
      v32 = 2114;
      v33 = v28;
      v34 = 2048;
      v35 = a3;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to hash data. string = %{public}@ | encoding = %lu", v30, 0x20u);
      if (v23)
      {

        v27 = (void *)v4;
      }

    }
    if (a4)
    {
      AMSError(0, CFSTR("Hash Error"), CFSTR("Unable to string to a hashed representation."), 0);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (id)ams_stringByRemovingCharactersInSet:()AppleMediaServices
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsJoinedByString:", &stru_1E2548760);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)_replaceBreakingSpaceMarkupForMutableAttributedString:()AppleMediaServices
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("[br/]"));
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
    v9 = 0;
    do
    {
      v10 = v5;
      objc_msgSend(v3, "replaceCharactersInRange:withString:", v8, v7, CFSTR("\n"));
      objc_msgSend(v3, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lowercaseString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v5, "rangeOfString:", CFSTR("[br/]"));
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v8 = v12;
    }
    while (v9++ < 9);
  }

  return v3;
}

+ (id)_replaceMarkupForMutableAttributedString:()AppleMediaServices markupType:
{
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  CTFontRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  CTFontRef cf;

  v5 = a3;
  v6 = v5;
  v7 = CFSTR("[b]");
  v8 = CFSTR("[/b]");
  if (a4)
  {
    v8 = 0;
    v7 = 0;
  }
  if (a4 == 1)
    v9 = CFSTR("[/i]");
  else
    v9 = v8;
  if (a4 == 1)
    v10 = CFSTR("[i]");
  else
    v10 = v7;
  objc_msgSend(v5, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "rangeOfString:", v10) != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      if (a4 != 1)
        goto LABEL_23;
      v13 = CFSTR("Helvetica-Italic");
    }
    else
    {
      v13 = CFSTR("Helvetica-Bold");
    }
    v14 = CTFontCreateWithName(v13, 14.0, 0);
    if (v14)
    {
      cf = v14;
      v15 = objc_msgSend(v12, "rangeOfString:", v10);
      v17 = v16;
      v18 = objc_msgSend(v12, "rangeOfString:", v9);
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v20 = v18;
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v21 = 0;
          do
          {
            v22 = v9;
            v23 = v12;
            objc_msgSend(v6, "replaceCharactersInRange:withString:", v20, v19, &stru_1E2548760);
            objc_msgSend(v6, "replaceCharactersInRange:withString:", v15, v17, &stru_1E2548760);
            objc_msgSend(v6, "string");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "lowercaseString");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v22;
            v15 = objc_msgSend(v12, "rangeOfString:", v10);
            v17 = v25;
            v26 = objc_msgSend(v12, "rangeOfString:", v22);
            if (v15 == 0x7FFFFFFFFFFFFFFFLL)
              break;
            v20 = v26;
            if (v26 == 0x7FFFFFFFFFFFFFFFLL)
              break;
          }
          while (v21++ < 9);
        }
      }
      CFRelease(cf);
    }
  }
LABEL_23:

  return v6;
}

- (BOOL)ams_caseInsensitiveEquals:()AppleMediaServices
{
  return objc_msgSend(a1, "caseInsensitiveCompare:") == 0;
}

@end
