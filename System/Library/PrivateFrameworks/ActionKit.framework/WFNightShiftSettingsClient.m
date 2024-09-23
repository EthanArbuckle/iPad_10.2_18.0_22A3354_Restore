@implementation WFNightShiftSettingsClient

- (WFNightShiftSettingsClient)initWithBlueLightClient:(id)a3
{
  id v6;
  WFNightShiftSettingsClient *v7;
  WFNightShiftSettingsClient *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFNightShiftSettingsClient.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("blueLightClient"));

  }
  v11.receiver = self;
  v11.super_class = (Class)WFNightShiftSettingsClient;
  v7 = -[WFNightShiftSettingsClient init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_blueLightClient, a3);

  return v8;
}

- (void)getStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFNightShiftSettingsClient blueLightClient](self, "blueLightClient", (unsigned __int128)0, (unsigned __int128)0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getBlueLightStatus:", &v10);

  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFNightShiftSettingsClient getStateWithCompletionHandler:]";
      v13 = 1024;
      v14 = BYTE1(v10);
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_DEFAULT, "%s Current Night Shift State: %d", buf, 0x12u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, BYTE1(v10), 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFNightShiftSettingsClient getStateWithCompletionHandler:]";
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_ERROR, "%s Failed to fetch current Night Shift state", buf, 0xCu);
    }

    WFSettingsClientError();
    v9 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, uint64_t))v4 + 2))(v4, 0, v9);

    v4 = (id)v9;
  }

}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD);
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  -[WFNightShiftSettingsClient blueLightClient](self, "blueLightClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "setEnabled:", v4);

  getWFActionsLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[WFNightShiftSettingsClient setState:completionHandler:]";
      v14 = 1024;
      v15 = v4;
      _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_DEFAULT, "%s Set Night Shift State: %d", (uint8_t *)&v12, 0x12u);
    }

    v6[2](v6, 0);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[WFNightShiftSettingsClient setState:completionHandler:]";
      v14 = 1024;
      v15 = v4;
      _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_ERROR, "%s Failed to set Night Shift state to: %d", (uint8_t *)&v12, 0x12u);
    }

    WFSettingsClientError();
    v11 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);

    v6 = (void (**)(id, _QWORD))v11;
  }

}

- (CBBlueLightClient)blueLightClient
{
  return self->_blueLightClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blueLightClient, 0);
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (*v7)(void);
  _QWORD *v8;

  v8 = a3;
  v4 = objc_alloc_init((Class)getCBClientClass());
  objc_msgSend(v4, "blueLightClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(getCBClientClass(), "supportsBlueLightReduction") & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBlueLightClient:", v5);
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
