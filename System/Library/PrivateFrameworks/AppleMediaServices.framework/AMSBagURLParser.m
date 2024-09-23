@implementation AMSBagURLParser

id __82__AMSBagURLParser__URLBySubstitutingVariablesInURLString_range_usingPromiseBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a2, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(id *)(a1 + 32);
  if (v6)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
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
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v3);
      }
      else
      {
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v15;
      v26 = 2114;
      v27 = v16;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get value for variable. Placeholder will be removed from URL string. error = %{public}@", buf, 0x16u);
      if (v11)
      {

        v15 = (void *)v3;
      }

    }
  }
  if (v7)
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("{"), &stru_1E2548760, 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("}"), &stru_1E2548760, 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72) - 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "_firstVariableInTemplate:includeTags:", *(_QWORD *)(a1 + 40), 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:options:range:", v8, v7, 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72) - 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", *(_QWORD *)(a1 + 40), &stru_1E2548760, 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v20 = objc_msgSend(*(id *)(a1 + 56), "_rangeOfTemplateInURLString:", v19);
  objc_msgSend(*(id *)(a1 + 56), "_URLBySubstitutingVariablesInURLString:range:usingPromiseBlock:", v19, v20, v21, *(_QWORD *)(a1 + 48));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)URLBySubstitutingVariablesInURLString:(id)a3 usingPromiseBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(a1, "_rangeOfTemplateInURLString:", v7);
  objc_msgSend(a1, "_URLBySubstitutingVariablesInURLString:range:usingPromiseBlock:", v7, v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (_NSRange)_rangeofSubstringWithOpeningTag:(id)a3 closingTag:(id)a4 inString:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  NSUInteger v15;
  NSUInteger v16;
  _NSRange result;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "rangeOfString:", a3);
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    v12 = v9;
    v13 = objc_msgSend(v8, "rangeOfString:options:range:", v7, 0, v9 + 1, objc_msgSend(v8, "length") - (v9 + 1));
    v14 = v13 != 0x7FFFFFFFFFFFFFFFLL && v13 > v12;
    if (v14)
      v10 = v12;
    if (v14)
      v11 = v13 - v12 + 1;
    else
      v11 = 0;
  }

  v15 = v10;
  v16 = v11;
  result.length = v16;
  result.location = v15;
  return result;
}

+ (_NSRange)_rangeOfTemplateInURLString:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = objc_msgSend(a1, "_rangeofSubstringWithOpeningTag:closingTag:inString:", CFSTR("{"), CFSTR("}"), a3);
  result.length = v4;
  result.location = v3;
  return result;
}

+ (id)_URLBySubstitutingVariablesInURLString:(id)a3 range:(_NSRange)a4 usingPromiseBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  void (**v24)(id, void *);
  id v25;
  NSUInteger v26;
  NSUInteger v27;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = (void (**)(id, void *))a5;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSURL initializer returned nil. URL string = %@"), v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AMSError(2, CFSTR("Failed to create URL from URL string"), v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(v9, "substringWithRange:", location, length);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_firstVariableInTemplate:includeTags:", v13, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v10[2](v10, v11);
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v16;
    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __82__AMSBagURLParser__URLBySubstitutingVariablesInURLString_range_usingPromiseBlock___block_invoke;
    v21[3] = &unk_1E253F138;
    v25 = a1;
    v26 = location;
    v27 = length;
    v22 = v9;
    v23 = v13;
    v24 = v10;
    v17 = v13;
    objc_msgSend(v15, "continueWithBlock:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)_firstVariableInTemplate:(id)a3 includeTags:(BOOL)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  v7 = objc_msgSend(a1, "_rangeofSubstringWithOpeningTag:closingTag:inString:", CFSTR("$"), CFSTR("$"), v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "substringWithRange:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (!a4)
    {
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("$"), &stru_1E2548760);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }
  }

  return v9;
}

+ (id)URLBySubstitutingVariablesInURLString:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __68__AMSBagURLParser_URLBySubstitutingVariablesInURLString_usingBlock___block_invoke;
  v32[3] = &unk_1E253F160;
  v8 = v7;
  v33 = v8;
  objc_msgSend(a1, "URLBySubstitutingVariablesInURLString:usingPromiseBlock:", v6, v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v9, "resultWithError:", &v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v31;

  if (v11)
  {
    v12 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12)
    {
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = objc_opt_class();
        v19 = v18;
        if (v16)
        {
          AMSLogKey();
          a1 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] "), v19, a1);
        }
        else
        {
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: "), v18);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v11);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v20;
        v36 = 2114;
        v37 = v27;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error occurred when substituting values into template URL string. Defaulting to original string with no substitution. error = %{public}@", buf, 0x16u);
        if (v16)
        {

          v20 = a1;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v21, 0);
    }
    else
    {
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = objc_opt_class();
        v25 = v24;
        if (v22)
        {
          AMSLogKey();
          a1 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] "), v25, a1);
        }
        else
        {
          objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: "), v24);
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v11);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v26;
        v36 = 2114;
        v37 = v28;
        _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_FAULT, "%{public}@Unexpected error occurred when substituting values into template URL string. Defaulting to original string with no substitution. error = %{public}@", buf, 0x16u);
        if (v22)
        {

          v26 = a1;
        }

      }
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v29 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v29;
  }

  return v10;
}

id __68__AMSBagURLParser_URLBySubstitutingVariablesInURLString_usingBlock___block_invoke(uint64_t a1)
{
  void *v1;
  AMSOptional *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v1);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
