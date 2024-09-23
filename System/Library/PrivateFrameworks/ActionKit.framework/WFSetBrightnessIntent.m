@implementation WFSetBrightnessIntent

- (Class)settingsClientClass
{
  return (Class)objc_opt_class();
}

- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  float v9;
  float v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  double v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WFSetBrightnessIntent value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  getWFBundledIntentsLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315650;
    v16 = "WFPerformDecimalSettingIntent";
    v17 = 2114;
    v18 = v13;
    v19 = 2048;
    v20 = v10;
    _os_log_impl(&dword_22D353000, v11, OS_LOG_TYPE_INFO, "%s Setting %{public}@ to value %f", (uint8_t *)&v15, 0x20u);

  }
  *(float *)&v14 = v10;
  objc_msgSend(v6, "setValue:completionHandler:", v7, v14);

}

@end
