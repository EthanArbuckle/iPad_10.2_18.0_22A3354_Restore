@implementation WFSetStageManagerIntent

- (Class)settingsClientClass
{
  return (Class)objc_opt_class();
}

- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  -[WFSetStageManagerIntent showRecentApps](self, "showRecentApps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowRecentApps:", objc_msgSend(v7, "BOOLValue"));

  -[WFSetStageManagerIntent showDock](self, "showDock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowDock:", objc_msgSend(v8, "BOOLValue"));

  WFPerformBooleanSettingIntent(self, v9, v6);
}

@end
