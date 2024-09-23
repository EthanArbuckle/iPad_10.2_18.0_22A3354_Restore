@implementation DSTestAutomation

- (DSTestAutomation)init
{
  DSTestAutomation *v2;
  DSTestAutomation *v3;
  int AppBooleanValue;
  BOOL v5;
  char v6;
  Boolean keyExistsAndHasValidFormat;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DSTestAutomation;
  v2 = -[DSTestAutomation init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_testAutomationEnabled = 0;
    CFPreferencesAppSynchronize(CFSTR("com.apple.Diagnostics"));
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("TestAutomation"), CFSTR("com.apple.Diagnostics"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v5 = AppBooleanValue == 0;
    else
      v5 = 1;
    v6 = !v5;
    v3->_testAutomationEnabled = v6;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_singleton;
}

void __34__DSTestAutomation_sharedInstance__block_invoke()
{
  DSTestAutomation *v0;
  void *v1;

  v0 = objc_alloc_init(DSTestAutomation);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;

}

+ (void)postInteractiveTestEvent:(id)a3 info:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "testAutomationEnabled");

  if (v8)
  {
    v10[0] = CFSTR("event");
    v10[1] = CFSTR("type");
    v11[0] = CFSTR("DSTestAutomationEvent");
    v11[1] = CFSTR("InteractiveTestEvent");
    v10[2] = CFSTR("interactiveEvent");
    v10[3] = CFSTR("info");
    v11[2] = v5;
    v11[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(0xFA2u, v9);

  }
}

+ (void)postConfiguration:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "testAutomationEnabled");

  if (v5)
  {
    v7[0] = CFSTR("event");
    v7[1] = CFSTR("type");
    v8[0] = CFSTR("DSTestAutomationEvent");
    v8[1] = CFSTR("Configuration");
    v7[2] = CFSTR("info");
    v8[2] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(0xFA2u, v6);

  }
}

- (BOOL)testAutomationEnabled
{
  return self->_testAutomationEnabled;
}

- (void)setTestAutomationEnabled:(BOOL)a3
{
  self->_testAutomationEnabled = a3;
}

@end
