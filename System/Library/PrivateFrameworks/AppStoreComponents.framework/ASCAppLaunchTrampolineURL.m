@implementation ASCAppLaunchTrampolineURL

+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 widgetId:(id)a5 widgetSize:(int64_t)a6 localizedName:(id)a7
{
  return (id)objc_msgSend(a1, "URLWithAdamId:bundleId:widgetId:widgetSize:localizedName:sourceApplication:topic:", a3, a4, a5, a6, a7, 0, 0);
}

+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 widgetId:(id)a5 widgetSize:(int64_t)a6 localizedName:(id)a7 topic:(id)a8
{
  return (id)objc_msgSend(a1, "URLWithAdamId:bundleId:widgetId:widgetSize:localizedName:sourceApplication:topic:", a3, a4, a5, a6, a7, 0, a8);
}

+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 widgetId:(id)a5 widgetSize:(int64_t)a6 localizedName:(id)a7 sourceApplication:(id)a8 topic:(id)a9
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v27[4];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v28[0] = a5;
  v27[0] = CFSTR("widgetId");
  v27[1] = CFSTR("size");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  objc_msgSend(v15, "numberWithInteger:", a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v22;
  v28[2] = v21;
  v27[2] = CFSTR("targetId");
  v27[3] = CFSTR("name");
  v28[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "URLWithAdamId:bundleId:metrics:sourceApplication:topic:", v21, v20, v23, v17, v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 localizedName:(id)a5 sourceApplication:(id)a6 topic:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("targetId"));
  if (v14)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("name"));
  objc_msgSend(a1, "URLWithAdamId:bundleId:metrics:sourceApplication:topic:", v12, v13, v17, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)URLWithAdamId:(id)a3 bundleId:(id)a4 metrics:(id)a5 sourceApplication:(id)a6 topic:(id)a7
{
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = (__CFString *)a7;
  v15 = a5;
  +[ASCEligibility assertCurrentProcessEligibility]();
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v15, 2, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v16, 4);
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAddingPercentEncodingWithAllowedCharacters:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v20 = v14;
  else
    v20 = &stru_1E7562EE8;
  v21 = v20;
  if (v13)
  {
    v22 = (__CFString *)v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bundleIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = (__CFString *)v24;
    else
      v26 = &stru_1E7562EE8;
    v22 = v26;

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-as3-internal://launchapp?appId=%@&bundleId=%@&trampolineMetrics=%@&topic=%@&sourceApplication=%@"), v11, v12, v19, v21, v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

@end
