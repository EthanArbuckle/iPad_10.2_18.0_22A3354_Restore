@implementation WFAnnounceNotificationsSettingsClient

- (WFAnnounceNotificationsSettingsClient)initWithGateway:(id)a3
{
  id v6;
  WFAnnounceNotificationsSettingsClient *v7;
  WFAnnounceNotificationsSettingsClient *v8;
  WFAnnounceNotificationsSettingsClient *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAnnounceNotificationsSettingsClient.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gateway"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFAnnounceNotificationsSettingsClient;
  v7 = -[WFAnnounceNotificationsSettingsClient init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_settingsGateway, a3);
    v9 = v8;
  }

  return v8;
}

- (void)getStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[WFAnnounceNotificationsSettingsClient settingsGateway](self, "settingsGateway");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__WFAnnounceNotificationsSettingsClient_getStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F8B5B78;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getEffectiveGlobalAnnounceSettingWithCompletion:", v7);

}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v5;
  void *v6;
  void (**v7)(id, _QWORD);

  if (a3)
    v5 = 2;
  else
    v5 = 1;
  v7 = (void (**)(id, _QWORD))a4;
  -[WFAnnounceNotificationsSettingsClient settingsGateway](self, "settingsGateway");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEffectiveGlobalAnnounceSetting:", v5);

  v7[2](v7, 0);
}

- (BBSettingsGateway)settingsGateway
{
  return self->_settingsGateway;
}

- (void)setSettingsGateway:(id)a3
{
  objc_storeStrong((id *)&self->_settingsGateway, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsGateway, 0);
}

uint64_t __71__WFAnnounceNotificationsSettingsClient_getStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  objc_class *v6;
  id v7;
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
  v5 = (void *)getBBSettingsGatewayClass_softClass;
  v13 = getBBSettingsGatewayClass_softClass;
  if (!getBBSettingsGatewayClass_softClass)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getBBSettingsGatewayClass_block_invoke;
    v9[3] = &unk_24F8BB430;
    v9[4] = &v10;
    __getBBSettingsGatewayClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v10, 8);
  v7 = objc_alloc_init(v6);
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGateway:", v7);
  v4[2](v4, v8, 0);

}

@end
