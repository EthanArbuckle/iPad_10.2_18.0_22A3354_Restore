@implementation WFDevice(SystemSettings)

- (id)volumeWithError:()SystemSettings
{
  void *v0;
  id v1;
  void *v2;
  double v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v0 = (void *)getAVSystemControllerClass_softClass;
  v11 = getAVSystemControllerClass_softClass;
  if (!getAVSystemControllerClass_softClass)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getAVSystemControllerClass_block_invoke;
    v7[3] = &unk_24F8BB430;
    v7[4] = &v8;
    __getAVSystemControllerClass_block_invoke((uint64_t)v7);
    v0 = (void *)v9[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v1, "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7[0]) = 0;
  v6 = 0;
  v4 = 0;
  if (objc_msgSend(v2, "getActiveCategoryVolume:andName:", v7, &v6))
  {
    LODWORD(v3) = v7[0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)getAppearanceWithCompletion:()SystemSettings
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__WFDevice_SystemSettings__getAppearanceWithCompletion___block_invoke;
  v5[3] = &unk_24F8B23B8;
  v6 = v3;
  v4 = v3;
  +[WFAppearanceSettingsClient createClientWithCompletionHandler:](WFAppearanceSettingsClient, "createClientWithCompletionHandler:", v5);

}

- (void)getBrightnessWithCompletion:()SystemSettings
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__WFDevice_SystemSettings__getBrightnessWithCompletion___block_invoke;
  v5[3] = &unk_24F8B2408;
  v6 = v3;
  v4 = v3;
  +[WFBrightnessSettingsClient createClientWithCompletionHandler:](WFBrightnessSettingsClient, "createClientWithCompletionHandler:", v5);

}

@end
