@implementation AMSUIWebModel

+ (id)backgroundColorFromPageModel:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

+ (id)impressionEventFromPageModel:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;
  AMSUIWebMetricsEvent *v8;

  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("impressionEvent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (v7)
    v8 = -[AMSUIWebMetricsEvent initWithJSObject:context:]([AMSUIWebMetricsEvent alloc], "initWithJSObject:context:", v7, v5);
  else
    v8 = 0;

  return v8;
}

+ (id)navigationBarFromPageModel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  AMSUIWebNavigationBarModel *v7;
  void *v8;
  AMSUIWebNavigationBarModel *v9;

  v5 = a4;
  v6 = a3;
  v7 = [AMSUIWebNavigationBarModel alloc];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("navigationBar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AMSUIWebNavigationBarModel initWithJSObject:context:](v7, "initWithJSObject:context:", v8, v5);
  return v9;
}

+ (id)pageModelFromJSObject:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  _QWORD v23[7];
  _QWORD v24[8];

  v24[7] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modelClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  v23[0] = CFSTR("AMSCameraReaderPageModel");
  v24[0] = objc_opt_class();
  v23[1] = CFSTR("AMSDynamicPageModel");
  v24[1] = objc_opt_class();
  v23[2] = CFSTR("AMSErrorPageModel");
  v24[2] = objc_opt_class();
  v23[3] = CFSTR("AMSLoadingPageModel");
  v24[3] = objc_opt_class();
  v23[4] = CFSTR("AMSSafariPageModel");
  v24[4] = objc_opt_class();
  v23[5] = CFSTR("AMSRoutePageModel");
  v24[5] = objc_opt_class();
  v23[6] = CFSTR("AMSWebPageModel");
  v24[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)(id)objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  if (!v10 || (v11 = (void *)objc_msgSend([v10 alloc], "initWithJSObject:context:", v5, v6)) == 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      objc_msgSend(v6, "logKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v14;
      v19 = 2114;
      v20 = v15;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid page model: %{public}@", (uint8_t *)&v17, 0x20u);

    }
    v11 = 0;
  }

  return v11;
}

+ (CGSize)windowSizeFromPageModel:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(a1, "windowSizeFromJSObject:key:", a3, CFSTR("windowSize"));
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)windowSizeFromJSObject:(id)a3 key:(id)a4
{
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = 0.0;
  v7 = 0.0;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v6 = v10;

    }
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v7 = v13;

    }
  }

  v14 = v6;
  v15 = v7;
  result.height = v15;
  result.width = v14;
  return result;
}

@end
