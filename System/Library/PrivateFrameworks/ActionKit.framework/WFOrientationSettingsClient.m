@implementation WFOrientationSettingsClient

- (WFOrientationSettingsClient)initWithSpringBoardServer:(id)a3
{
  id v6;
  WFOrientationSettingsClient *v7;
  WFOrientationSettingsClient *v8;
  WFOrientationSettingsClient *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOrientationSettingsClient.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("server"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFOrientationSettingsClient;
  v7 = -[WFOrientationSettingsClient init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_server, a3);
    v9 = v8;
  }

  return v8;
}

- (void)getStateWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[WFOrientationSettingsClient server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOrientationLocked");

  getWFBundledIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[WFOrientationSettingsClient getStateWithCompletionHandler:]";
    v10 = 1024;
    v11 = v6;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_INFO, "%s Retrieved orientation lock state: %d", (uint8_t *)&v8, 0x12u);
  }

  v4[2](v4, v6, 0);
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD);
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  -[WFOrientationSettingsClient server](self, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOrientationLocked:", v4);

  getWFBundledIntentsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[WFOrientationSettingsClient setState:completionHandler:]";
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_INFO, "%s Set orientation lock state to %d", (uint8_t *)&v9, 0x12u);
  }

  v6[2](v6, 0);
}

- (AXSpringBoardServer)server
{
  return self->_server;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v5 = (void *)getAXSpringBoardServerClass_softClass;
  v13 = getAXSpringBoardServerClass_softClass;
  if (!getAXSpringBoardServerClass_softClass)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getAXSpringBoardServerClass_block_invoke;
    v9[3] = &unk_24F8BB430;
    v9[4] = &v10;
    __getAXSpringBoardServerClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v6, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSpringBoardServer:", v7);
    v4[2](v4, v8, 0);
  }
  else
  {
    WFSettingsClientError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v8);
  }

}

@end
