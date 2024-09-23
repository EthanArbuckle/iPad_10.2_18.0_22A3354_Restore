@implementation WFTrueToneSettingsClient

- (WFTrueToneSettingsClient)initWithBrightnessClient:(id)a3 adaptationClient:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFTrueToneSettingsClient *v11;
  WFTrueToneSettingsClient *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTrueToneSettingsClient.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("brightnessClient"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTrueToneSettingsClient.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adaptationClient"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)WFTrueToneSettingsClient;
  v11 = -[WFTrueToneSettingsClient init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_brightnessClient, a3);
    objc_storeStrong((id *)&v12->_adaptationClient, a4);
  }

  return v12;
}

- (void)getStateWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[WFTrueToneSettingsClient adaptationClient](self, "adaptationClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "available");

  if ((v6 & 1) != 0)
  {
    -[WFTrueToneSettingsClient adaptationClient](self, "adaptationClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "getEnabled");

    getWFActionsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[WFTrueToneSettingsClient getStateWithCompletionHandler:]";
      v14 = 1024;
      v15 = v8;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_DEFAULT, "%s Current True Tone State: %d", (uint8_t *)&v12, 0x12u);
    }

    v4[2](v4, v8, 0);
  }
  else
  {
    getWFActionsLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[WFTrueToneSettingsClient getStateWithCompletionHandler:]";
      _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_ERROR, "%s True Tone is not currently available", (uint8_t *)&v12, 0xCu);
    }

    WFSettingsClientError();
    v11 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v11);

    v4 = (void (**)(id, uint64_t, _QWORD))v11;
  }

}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *);
  void *v7;
  char v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  -[WFTrueToneSettingsClient adaptationClient](self, "adaptationClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "available");

  if ((v8 & 1) == 0)
  {
LABEL_10:
    WFSettingsClientError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v13);

    goto LABEL_11;
  }
  -[WFTrueToneSettingsClient adaptationClient](self, "adaptationClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "setEnabled:", v4);

  getWFActionsLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[WFTrueToneSettingsClient setState:completionHandler:]";
      v16 = 1024;
      v17 = v4;
      _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_ERROR, "%s Failed to set True Tone state to: %d", (uint8_t *)&v14, 0x12u);
    }

    goto LABEL_10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[WFTrueToneSettingsClient setState:completionHandler:]";
    v16 = 1024;
    v17 = v4;
    _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_DEFAULT, "%s Successfully set True Tone state to: %d", (uint8_t *)&v14, 0x12u);
  }

  v6[2](v6, 0);
LABEL_11:

}

- (CBClient)brightnessClient
{
  return self->_brightnessClient;
}

- (CBAdaptationClient)adaptationClient
{
  return self->_adaptationClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptationClient, 0);
  objc_storeStrong((id *)&self->_brightnessClient, 0);
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (*v7)(void);
  _QWORD *v8;

  v8 = a3;
  v4 = objc_alloc_init((Class)getCBClientClass_20376());
  objc_msgSend(v4, "adaptationClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(getCBClientClass_20376(), "supportsAdaptation") & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBrightnessClient:adaptationClient:", v4, v5);
    v7 = (void (*)(void))v8[2];
  }
  else
  {
    WFSettingsClientError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void (*)(void))v8[2];
  }
  v7();

}

@end
