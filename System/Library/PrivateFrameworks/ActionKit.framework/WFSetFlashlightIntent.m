@implementation WFSetFlashlightIntent

- (Class)settingsClientClass
{
  return (Class)objc_opt_class();
}

- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  const __CFString *v15;
  objc_class *v16;
  void *v17;
  double v18;
  NSObject *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = -[WFSetFlashlightIntent operation](self, "operation");
  -[WFSetFlashlightIntent state](self, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  -[WFSetFlashlightIntent value](self, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  getWFBundledIntentsLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    if (v8 > 2)
      v15 = CFSTR("Invalid");
    else
      v15 = off_24F8B6D70[v8];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315906;
    v22 = "-[WFSetFlashlightIntent(WFSettingIntent) applyWithSettingsClient:completionHandler:]";
    v23 = 2114;
    v24 = v15;
    v25 = 2114;
    v26 = v17;
    v27 = 1024;
    v28 = v10;
    _os_log_impl(&dword_22D353000, v14, OS_LOG_TYPE_INFO, "%s Applying operation %{public}@ to %{public}@ with state %d", (uint8_t *)&v21, 0x26u);

  }
  if (v8 == 2)
  {
    LODWORD(v18) = v13;
    objc_msgSend(v6, "toggleWithBrightnessLevel:completionHandler:", v7, v18);
  }
  else if (v8 == 1)
  {
    if (v10)
    {
      LODWORD(v18) = v13;
      objc_msgSend(v6, "turnOnWithBrightnessLevel:completionHandler:", v7, v18);
    }
    else
    {
      objc_msgSend(v6, "turnOffWithCompletionHandler:", v7);
    }
  }
  else
  {
    getWFBundledIntentsLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315138;
      v22 = "-[WFSetFlashlightIntent(WFSettingIntent) applyWithSettingsClient:completionHandler:]";
      _os_log_impl(&dword_22D353000, v19, OS_LOG_TYPE_ERROR, "%s Unknown operation!", (uint8_t *)&v21, 0xCu);
    }

    WFSettingsClientError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v20);

  }
}

@end
