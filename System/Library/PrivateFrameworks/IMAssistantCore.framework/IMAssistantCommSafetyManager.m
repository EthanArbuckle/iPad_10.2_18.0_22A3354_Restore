@implementation IMAssistantCommSafetyManager

- (IMAssistantCommSafetyManager)initWithCommSafetyRequestsManager:(id)a3 commSafetySettingsManager:(id)a4
{
  id v7;
  id v8;
  IMAssistantCommSafetyManager *v9;
  IMAssistantCommSafetyManager *v10;
  IMAssistantCommSafetyManager *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMAssistantCommSafetyManager;
  v9 = -[IMAssistantCommSafetyManager init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_commSafetyRequestsManager, a3);
    objc_storeStrong((id *)&v10->_commSafetySettingsManager, a4);
    v11 = v10;
  }

  return v10;
}

- (void)isSensitiveContent:(id)a3 withChatID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[IMAssistantCommSafetyManager commSafetyRequestsManager](self, "commSafetyRequestsManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "isSensitiveContent:withChatID:completionHandler:", v10, v9, v8);

}

- (BOOL)checksForSensitivityOnSend
{
  void *v2;
  char v3;

  -[IMAssistantCommSafetyManager commSafetySettingsManager](self, "commSafetySettingsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "checksForSensitivityOnSend");

  return v3;
}

- (BOOL)checksForSensitivityOnReceive
{
  void *v2;
  char v3;

  -[IMAssistantCommSafetyManager commSafetySettingsManager](self, "commSafetySettingsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "checksForSensitivityOnReceive");

  return v3;
}

- (IMCommSafetyRequestsManager)commSafetyRequestsManager
{
  return self->_commSafetyRequestsManager;
}

- (IMCommSafetySettingsManager)commSafetySettingsManager
{
  return self->_commSafetySettingsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commSafetySettingsManager, 0);
  objc_storeStrong((id *)&self->_commSafetyRequestsManager, 0);
}

@end
