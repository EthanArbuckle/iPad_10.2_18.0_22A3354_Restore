@implementation AMSBuyParams

+ (id)buyParamsWithString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:", v3);

  return v4;
}

- (AMSBuyParams)init
{
  AMSBuyParams *v2;
  uint64_t v3;
  NSMutableDictionary *backingDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSBuyParams;
  v2 = -[AMSBuyParams init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    backingDictionary = v2->_backingDictionary;
    v2->_backingDictionary = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (AMSBuyParams)initWithArray:(id)a3
{
  id v4;
  AMSBuyParams *v5;
  AMSBuyParams *v6;

  v4 = a3;
  v5 = -[AMSBuyParams init](self, "init");
  v6 = v5;
  if (v5)
    -[AMSBuyParams _parseBuyParamsArray:](v5, "_parseBuyParamsArray:", v4);

  return v6;
}

- (AMSBuyParams)initWithString:(id)a3
{
  id v4;
  AMSBuyParams *v5;
  AMSBuyParams *v6;

  v4 = a3;
  v5 = -[AMSBuyParams init](self, "init");
  v6 = v5;
  if (v5)
    -[AMSBuyParams _parseBuyParams:](v5, "_parseBuyParams:", v4);

  return v6;
}

- (NSDictionary)normalizedDictionary
{
  void *v2;
  void *v3;

  -[AMSBuyParams _normalizedDictionary](self, "_normalizedDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (void)clear
{
  -[NSMutableDictionary removeAllObjects](self->_backingDictionary, "removeAllObjects");
}

- (BOOL)containsKey:(id)a3
{
  NSMutableDictionary *backingDictionary;
  id v4;
  void *v5;
  char v6;

  backingDictionary = self->_backingDictionary;
  v4 = a3;
  -[NSMutableDictionary allKeys](backingDictionary, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)isFreeTrial
{
  void *v2;
  id v3;
  void *v4;
  char v5;

  -[AMSBuyParams objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("offrd-free-trial"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("true"));

  return v5;
}

- (double)price
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[AMSBuyParams objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("price"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (objc_msgSend(v3, "length"))
  {
    if (_MergedGlobals_87 != -1)
      dispatch_once(&_MergedGlobals_87, &__block_literal_global_21);
    objc_msgSend((id)qword_1ECEACFF8, "numberFromString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "doubleValue");
      v7 = v6;
    }
    else
    {
      v7 = 9.22337204e18;
    }

  }
  else
  {
    v7 = 9.22337204e18;
  }

  return v7;
}

void __21__AMSBuyParams_price__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v0, "setNumberStyle:", 1);
  v1 = (void *)qword_1ECEACFF8;
  qword_1ECEACFF8 = (uint64_t)v0;

}

- (NSDictionary)dictionary
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_backingDictionary, "copy");
}

- (id)parameterForKey:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary valueForKey:](self->_backingDictionary, "valueForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setParameter:(id)a3 forKey:(id)a4
{
  if (a4)
    -[NSMutableDictionary setValue:forKey:](self->_backingDictionary, "setValue:forKey:", a3);
}

- (id)requestDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB38B0];
  -[AMSBuyParams _normalizedDictionary](self, "_normalizedDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 100, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringValue
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AMSBuyParams _normalizedDictionary](self, "_normalizedDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __27__AMSBuyParams_stringValue__block_invoke;
  v9[3] = &unk_1E253FA48;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  v6 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v6, "setQueryItems:", v5);
  objc_msgSend(v6, "percentEncodedQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __27__AMSBuyParams_stringValue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v11 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v11;

    if (v7)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v11);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;

    if (v9)
      goto LABEL_13;
  }
  else
  {

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v8, "base64EncodedStringWithOptions:", 0), (v9 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_opt_new();
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_backingDictionary, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AMSBuyParams: %p buyParams = %@>"), self, self->_backingDictionary);
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_backingDictionary, "objectForKeyedSubscript:", a3);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backingDictionary, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)_convertParsedBuyParamIfNeeded:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((!objc_msgSend(v5, "hasPrefix:", CFSTR("("))
     || (objc_msgSend(v5, "hasSuffix:", CFSTR(")")) & 1) == 0)
    && (!objc_msgSend(v5, "hasPrefix:", CFSTR("{"))
     || !objc_msgSend(v5, "hasSuffix:", CFSTR("}"))))
  {
    goto LABEL_21;
  }
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_opt_class();
    v4 = v10;
    if (v8)
    {
      AMSLogKey();
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v4, v3);
    }
    else
    {
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing buyParams object value: %@", buf, 0x16u);
    if (v8)
    {

      v11 = (void *)v3;
    }

  }
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v12, 0, 0, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

LABEL_21:
    v13 = v5;
    goto LABEL_27;
  }
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    if (v16)
    {
      v18 = objc_opt_class();
      AMSLogKey();
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] "), v18, v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v19;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Deserialized buyParam object value to: %@", buf, 0x16u);
    if (v16)
    {

      v19 = (void *)v4;
    }

  }
LABEL_27:

  return v13;
}

- (id)_normalizedDictionary
{
  id v3;
  NSMutableDictionary *backingDictionary;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  backingDictionary = self->_backingDictionary;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__AMSBuyParams__normalizedDictionary__block_invoke;
  v7[3] = &unk_1E253FA48;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](backingDictionary, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __37__AMSBuyParams__normalizedDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);

}

- (void)_parseBuyParamsArray:(id)a3
{
  uint64_t v3;
  id v5;
  _UNKNOWN **v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = &off_1E2519000;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_opt_class();
    v12 = v11;
    if (v9)
    {
      AMSLogKey();
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, v3);
    }
    else
    {
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v60 = (uint64_t)v13;
    v61 = 2112;
    v62 = v14;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing buyParams array: %@", buf, 0x16u);
    if (v9)
    {

      v13 = (void *)v3;
    }

    v6 = &off_1E2519000;
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v5;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v55 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "rangeOfString:", CFSTR("="));
        if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
          objc_msgSend(v6[274], "sharedPurchaseConfig");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v23;
          if (v22)
          {
            if (!v23)
            {
              objc_msgSend(v6[274], "sharedConfig");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v24, "OSLogObject");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              AMSLogKey();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)MEMORY[0x1E0CB3940];
              v28 = objc_opt_class();
              v29 = v28;
              if (v26)
              {
                AMSLogKey();
                v50 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: [%@] "), v29, v50);
                v30 = objc_claimAutoreleasedReturnValue();
                v48 = (void *)v30;
                v31 = v52;
              }
              else
              {
                objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: "), v28);
                v30 = objc_claimAutoreleasedReturnValue();
                v31 = (void *)v30;
              }
              AMSHashIfNeeded(v19);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v60 = v30;
              v61 = 2114;
              v62 = v43;
              _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@Malformed buy param: %{public}@", buf, 0x16u);
              v52 = v31;
              v44 = v31;
              v6 = &off_1E2519000;
              if (v26)
              {

                v44 = (void *)v50;
              }

            }
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6[274], "sharedPurchaseConfig");
            v35 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v35, 0);
          }
          else
          {
            if (!v23)
            {
              objc_msgSend(v6[274], "sharedConfig");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v24, "OSLogObject");
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
            {
              AMSLogKey();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = (void *)MEMORY[0x1E0CB3940];
              v39 = objc_opt_class();
              v40 = v39;
              if (v37)
              {
                AMSLogKey();
                v49 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: [%@] "), v40, v49);
                v41 = objc_claimAutoreleasedReturnValue();
                v47 = (void *)v41;
                v42 = v51;
              }
              else
              {
                objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: "), v39);
                v41 = objc_claimAutoreleasedReturnValue();
                v42 = (void *)v41;
              }
              AMSHashIfNeeded(v19);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v60 = v41;
              v61 = 2114;
              v62 = v45;
              _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_FAULT, "%{public}@Malformed buy param: %{public}@", buf, 0x16u);
              v51 = v42;
              v46 = v42;
              v6 = &off_1E2519000;
              if (v37)
              {

                v46 = (void *)v49;
              }

            }
          }
        }
        else
        {
          v32 = v20;
          v33 = v21;
          objc_msgSend(v19, "substringToIndex:", v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "substringFromIndex:", v32 + v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringByRemovingPercentEncoding");
          v35 = objc_claimAutoreleasedReturnValue();

          -[AMSBuyParams _convertParsedBuyParamIfNeeded:](self, "_convertParsedBuyParamIfNeeded:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backingDictionary, "setObject:forKeyedSubscript:", v36, v24);

        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v16);
  }

}

- (void)_parseBuyParams:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    v10 = v9;
    if (v7)
    {
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12;
    }
    AMSHashIfNeeded(v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v12;
    v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing buyParams string: %@", buf, 0x16u);
    if (v7)

  }
  v14 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v14, "setPercentEncodedQuery:", v4);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v14, "queryItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v19, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length"))
        {
          objc_msgSend(v19, "value");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backingDictionary, "setObject:forKeyedSubscript:", v21, v20);

        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSBuyParams stringValue](self, "stringValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCodingKeyBuyParamsString"));

}

- (AMSBuyParams)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AMSBuyParams *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyBuyParamsString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AMSBuyParams initWithString:](self, "initWithString:", v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

@end
