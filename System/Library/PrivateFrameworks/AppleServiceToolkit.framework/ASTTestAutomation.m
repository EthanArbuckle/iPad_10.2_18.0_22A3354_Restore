@implementation ASTTestAutomation

- (ASTTestAutomation)init
{
  ASTTestAutomation *v2;
  ASTTestAutomation *v3;
  int AppBooleanValue;
  BOOL v5;
  char v6;
  Boolean keyExistsAndHasValidFormat;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ASTTestAutomation;
  v2 = -[ASTTestAutomation init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_testAutomationEnabled = 0;
    CFPreferencesAppSynchronize(CFSTR("com.apple.AppleServiceToolkit"));
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("TestAutomation"), CFSTR("com.apple.AppleServiceToolkit"), &keyExistsAndHasValidFormat);
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
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  return (id)sharedInstance_singleton;
}

void __35__ASTTestAutomation_sharedInstance__block_invoke()
{
  ASTTestAutomation *v0;
  void *v1;

  v0 = objc_alloc_init(ASTTestAutomation);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;

}

+ (void)postServerResponse:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (+[ASTLinking isAXRuntimeFrameworkAvailable](ASTLinking, "isAXRuntimeFrameworkAvailable"))
  {
    +[ASTTestAutomation sharedInstance](ASTTestAutomation, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "testAutomationEnabled");

    if (v5)
    {
      v7[0] = CFSTR("event");
      v7[1] = CFSTR("type");
      v8[0] = CFSTR("ASTTestAutomationEvent");
      v8[1] = CFSTR("ServerResponse");
      v7[2] = CFSTR("info");
      v8[2] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(0xFA2u, v6);

    }
  }

}

+ (void)postServerRequest:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (+[ASTLinking isAXRuntimeFrameworkAvailable](ASTLinking, "isAXRuntimeFrameworkAvailable"))
  {
    +[ASTTestAutomation sharedInstance](ASTTestAutomation, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "testAutomationEnabled");

    if (v5)
    {
      v7[0] = CFSTR("event");
      v7[1] = CFSTR("type");
      v8[0] = CFSTR("ASTTestAutomationEvent");
      v8[1] = CFSTR("ServerRequest");
      v7[2] = CFSTR("info");
      v8[2] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(0xFA2u, v6);

    }
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
