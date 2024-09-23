@implementation AMSMediaTokenServiceDeserializer

+ (id)_correctPayload:(id)a3
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("-"), CFSTR("+"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("_"), CFSTR("/"), 0, 0, objc_msgSend(v3, "length"));
  v4 = objc_msgSend(v3, "length") & 3;
  switch(v4)
  {
    case 3:
      v5 = CFSTR("=");
LABEL_7:
      objc_msgSend(v3, "appendString:", v5);
      break;
    case 2:
      v5 = CFSTR("==");
      goto LABEL_7;
    case 1:

      v3 = 0;
      break;
  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

+ (id)mediaTokenFromDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_deserializeMediaTokenDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else if (a4)
    {
      AMSError(301, CFSTR("Invalid token result"), CFSTR("Result could not be decoded."), 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a4)
  {
    AMSError(301, CFSTR("Invalid token result"), CFSTR("Result object is not a dictionary."), 0);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_deserializeMediaTokenDictionary:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  AMSMediaToken *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  void *v31;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  NSObject *v37;
  __int16 v38;
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("token"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;

    if (v5)
    {
      -[NSObject componentsSeparatedByString:](v5, "componentsSeparatedByString:", CFSTR("."));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count") != 3)
      {
        +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject OSLogObject](v7, "OSLogObject");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v35 = (id)objc_opt_class();
          v36 = 2112;
          v37 = v5;
          v22 = v35;
          _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Media token string was not split to 3 parts. Media token string: %@", buf, 0x16u);

        }
        v20 = 0;
        goto LABEL_45;
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_correctPayload:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "OSLogObject");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v35 = (id)objc_opt_class();
          v36 = 2112;
          v37 = v5;
          v23 = v35;
          _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Payload string could not be corrected. Media token string: %@", buf, 0x16u);

        }
        v20 = 0;
        goto LABEL_44;
      }
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
      if (!v9)
      {
        +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject OSLogObject](v11, "OSLogObject");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v35 = (id)objc_opt_class();
          v36 = 2112;
          v37 = v5;
          v24 = v35;
          _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Payload data could not be encoded from media token string. Media token string: %@", buf, 0x16u);

        }
        v20 = 0;
        goto LABEL_43;
      }
      v33 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v33);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v33;
      if (v11 || !v10)
      {
        +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v19, "OSLogObject");
        v25 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          goto LABEL_41;
        v26 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v35 = v26;
        v36 = 2114;
        v37 = v11;
        v38 = 2112;
        v39 = v5;
        v27 = v26;
        v28 = "%{public}@: Dictionary could not be decoded from payload data. Error: %{public}@. Media token string: %@";
        v29 = v25;
        v30 = 32;
      }
      else
      {
        -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("exp"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("iat"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        if (v14 != 0.0 && v17 != 0.0)
        {
          v18 = v14 - v17;
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", v18);
          v20 = -[AMSMediaToken initWithString:expirationDate:lifetime:]([AMSMediaToken alloc], "initWithString:expirationDate:lifetime:", v5, v19, v18);
LABEL_42:

LABEL_43:
LABEL_44:

LABEL_45:
          goto LABEL_46;
        }
        +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v19, "OSLogObject");
        v25 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
LABEL_41:

          v20 = 0;
          goto LABEL_42;
        }
        v31 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v35 = v31;
        v36 = 2112;
        v37 = v5;
        v27 = v31;
        v28 = "%{public}@: Time intervals could not be retrieved from date dictionary. Media token string: %@";
        v29 = v25;
        v30 = 22;
      }
      _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);

      goto LABEL_41;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
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
    *(_DWORD *)buf = 138543362;
    v35 = (id)objc_opt_class();
    v21 = v35;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Media token string not found in response.", buf, 0xCu);

  }
  v5 = 0;
  v20 = 0;
LABEL_46:

  return v20;
}

@end
