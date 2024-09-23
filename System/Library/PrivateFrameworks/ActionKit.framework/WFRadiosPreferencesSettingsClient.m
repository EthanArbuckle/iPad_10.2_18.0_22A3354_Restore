@implementation WFRadiosPreferencesSettingsClient

- (WFRadiosPreferencesSettingsClient)initWithRadiosPreferences:(id)a3
{
  id v6;
  WFRadiosPreferencesSettingsClient *v7;
  WFRadiosPreferencesSettingsClient *v8;
  WFRadiosPreferencesSettingsClient *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRadiosPreferencesSettingsClient.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("radiosPreferences"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFRadiosPreferencesSettingsClient;
  v7 = -[WFRadiosPreferencesSettingsClient init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_radiosPreferences, a3);
    v9 = v8;
  }

  return v8;
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  objc_class *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE buf[24];
  void *v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getRadiosPreferencesClass_softClass;
  v14 = getRadiosPreferencesClass_softClass;
  if (!getRadiosPreferencesClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getRadiosPreferencesClass_block_invoke;
    v16 = &unk_24F8BB430;
    v17 = &v11;
    __getRadiosPreferencesClass_block_invoke((uint64_t)buf);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  v7 = objc_alloc_init(v6);
  getWFBundledIntentsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[WFRadiosPreferencesSettingsClient createClientWithCompletionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_DEBUG, "%s Got RadiosPreferences: %@", buf, 0x16u);
  }

  if (v7)
  {
    v9 = objc_alloc((Class)a1);
    v10 = (void *)objc_msgSend(v9, "initWithRadiosPreferences:", v7, v11);
    v4[2](v4, v10, 0);
  }
  else
  {
    WFSettingsClientError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v10);
  }

}

@end
