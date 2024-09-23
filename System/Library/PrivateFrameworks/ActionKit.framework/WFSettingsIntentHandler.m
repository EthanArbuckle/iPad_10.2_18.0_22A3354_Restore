@implementation WFSettingsIntentHandler

- (void)createSettingsClientForIntent:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "settingsClientClass");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__WFSettingsIntentHandler_createSettingsClientForIntent_completionHandler___block_invoke;
  v8[3] = &unk_24F8B8270;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(v6, "createClientWithCompletionHandler:", v8);

}

- (void)performSettingIntent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__WFSettingsIntentHandler_performSettingIntent_completionHandler___block_invoke;
  v10[3] = &unk_24F8B8298;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[WFSettingsIntentHandler createSettingsClientForIntent:completionHandler:](self, "createSettingsClientForIntent:completionHandler:", v8, v10);

}

- (void)resolveOperationForSetAirplaneMode:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", objc_msgSend(a3, "operation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)resolveStateForSetAirplaneMode:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD9C10];
  v7 = a4;
  objc_msgSend(a3, "state");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleSetAirplaneMode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__WFSettingsIntentHandler_handleSetAirplaneMode_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)resolveOperationForSetWiFi:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", objc_msgSend(a3, "operation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)resolveStateForSetWiFi:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD9C10];
  v7 = a4;
  objc_msgSend(a3, "state");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleSetWiFi:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  WFSetWiFiIntentResponse *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE19570], "defaultProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isWiFiPowerModificationAllowed");

  if ((v9 & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __52__WFSettingsIntentHandler_handleSetWiFi_completion___block_invoke;
    v13[3] = &unk_24F8B8C28;
    v14 = v7;
    -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", v6, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasCapability:", *MEMORY[0x24BEC1888]))
      v11 = 102;
    else
      v11 = 100;

    v12 = -[WFSetWiFiIntentResponse initWithCode:userActivity:]([WFSetWiFiIntentResponse alloc], "initWithCode:userActivity:", v11, 0);
    (*((void (**)(id, WFSetWiFiIntentResponse *))v7 + 2))(v7, v12);

  }
}

- (void)resolveOperationForSetBluetooth:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", objc_msgSend(a3, "operation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)resolveStateForSetBluetooth:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD9C10];
  v7 = a4;
  objc_msgSend(a3, "state");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleSetBluetooth:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  WFSetBluetoothIntentResponse *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE19570], "defaultProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isBluetoothModificationAllowed");

  if ((v9 & 1) != 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__WFSettingsIntentHandler_handleSetBluetooth_completion___block_invoke;
    v11[3] = &unk_24F8B8C28;
    v12 = v7;
    -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", v6, v11);

  }
  else
  {
    v10 = -[WFSetBluetoothIntentResponse initWithCode:userActivity:]([WFSetBluetoothIntentResponse alloc], "initWithCode:userActivity:", 100, 0);
    (*((void (**)(id, WFSetBluetoothIntentResponse *))v7 + 2))(v7, v10);

  }
}

- (void)resolveOperationForSetCellularData:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", objc_msgSend(a3, "operation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)resolveStateForSetCellularData:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD9C10];
  v7 = a4;
  objc_msgSend(a3, "state");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleSetCellularData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__WFSettingsIntentHandler_handleSetCellularData_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)resolveOperationForSetLowPowerMode:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", objc_msgSend(a3, "operation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)resolveStateForSetLowPowerMode:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD9C10];
  v7 = a4;
  objc_msgSend(a3, "state");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleSetLowPowerMode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__WFSettingsIntentHandler_handleSetLowPowerMode_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)resolveValueForSetBrightness:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "value");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  +[WFSetBrightnessValueResolutionResult successWithResolvedValue:](WFSetBrightnessValueResolutionResult, "successWithResolvedValue:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v6, v7);

}

- (void)handleSetBrightness:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__WFSettingsIntentHandler_handleSetBrightness_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)resolveValueForSetFlashlight:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "value");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  +[WFSetFlashlightValueResolutionResult successWithResolvedValue:](WFSetFlashlightValueResolutionResult, "successWithResolvedValue:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v6, v7);

}

- (void)resolveOperationForSetFlashlight:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", objc_msgSend(a3, "operation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)resolveStateForSetFlashlight:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD9C10];
  v7 = a4;
  objc_msgSend(a3, "state");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleSetFlashlight:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__WFSettingsIntentHandler_handleSetFlashlight_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)resolveStyleForSetAppearance:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[WFDeviceAppearanceTypeResolutionResult successWithResolvedDeviceAppearanceType:](WFDeviceAppearanceTypeResolutionResult, "successWithResolvedDeviceAppearanceType:", objc_msgSend(a3, "style"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)handleSetAppearance:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__WFSettingsIntentHandler_handleSetAppearance_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)resolveOperationForSetAppearance:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", objc_msgSend(a3, "operation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)handleSetOrientationLock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__WFSettingsIntentHandler_handleSetOrientationLock_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)handleSetPersonalHotspot:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__WFSettingsIntentHandler_handleSetPersonalHotspot_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)handleSetSilenceUnknownCallers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__WFSettingsIntentHandler_handleSetSilenceUnknownCallers_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)handleSetNightShift:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__WFSettingsIntentHandler_handleSetNightShift_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)handleSetTrueTone:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__WFSettingsIntentHandler_handleSetTrueTone_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)handleSetAnnounceNotifications:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__WFSettingsIntentHandler_handleSetAnnounceNotifications_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)handleSetStageManager:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__WFSettingsIntentHandler_handleSetStageManager_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

- (void)resolveOperationForSetAlwaysOnDisplay:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", objc_msgSend(a3, "operation"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)resolveStateForSetAlwaysOnDisplay:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD9C10];
  v7 = a4;
  objc_msgSend(a3, "state");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)handleSetAlwaysOnDisplay:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__WFSettingsIntentHandler_handleSetAlwaysOnDisplay_completion___block_invoke;
  v8[3] = &unk_24F8B8C28;
  v9 = v6;
  v7 = v6;
  -[WFSettingsIntentHandler performSettingIntent:completionHandler:](self, "performSettingIntent:completionHandler:", a3, v8);

}

void __63__WFSettingsIntentHandler_handleSetAlwaysOnDisplay_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  WFSetAlwaysOnDisplayIntentResponse *v4;

  if (a2)
    v3 = 5;
  else
    v3 = 4;
  v4 = -[WFSetAlwaysOnDisplayIntentResponse initWithCode:userActivity:]([WFSetAlwaysOnDisplayIntentResponse alloc], "initWithCode:userActivity:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__WFSettingsIntentHandler_handleSetStageManager_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  WFSetStageManagerIntentResponse *v4;

  if (a2)
    v3 = 5;
  else
    v3 = 4;
  v4 = -[WFSetStageManagerIntentResponse initWithCode:userActivity:]([WFSetStageManagerIntentResponse alloc], "initWithCode:userActivity:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __69__WFSettingsIntentHandler_handleSetAnnounceNotifications_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  WFSetAnnounceNotificationsIntentResponse *v4;

  if (a2)
    v3 = 5;
  else
    v3 = 4;
  v4 = -[WFSetAnnounceNotificationsIntentResponse initWithCode:userActivity:]([WFSetAnnounceNotificationsIntentResponse alloc], "initWithCode:userActivity:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__WFSettingsIntentHandler_handleSetTrueTone_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  WFSetTrueToneIntentResponse *v6;

  if (a2)
  {
    v3 = objc_msgSend(a2, "code");
    v4 = 5;
    if (v3 == 5)
      v4 = 101;
    if (v3 == 4)
      v5 = 100;
    else
      v5 = v4;
  }
  else
  {
    v5 = 4;
  }
  v6 = -[WFSetTrueToneIntentResponse initWithCode:userActivity:]([WFSetTrueToneIntentResponse alloc], "initWithCode:userActivity:", v5, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __58__WFSettingsIntentHandler_handleSetNightShift_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  WFSetNightShiftIntentResponse *v6;

  if (a2)
  {
    v3 = objc_msgSend(a2, "code");
    v4 = 5;
    if (v3 == 5)
      v4 = 101;
    if (v3 == 4)
      v5 = 100;
    else
      v5 = v4;
  }
  else
  {
    v5 = 4;
  }
  v6 = -[WFSetNightShiftIntentResponse initWithCode:userActivity:]([WFSetNightShiftIntentResponse alloc], "initWithCode:userActivity:", v5, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __69__WFSettingsIntentHandler_handleSetSilenceUnknownCallers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  WFSetSilenceUnknownCallersIntentResponse *v4;

  if (a2)
    v3 = 5;
  else
    v3 = 4;
  v4 = -[WFSetSilenceUnknownCallersIntentResponse initWithCode:userActivity:]([WFSetSilenceUnknownCallersIntentResponse alloc], "initWithCode:userActivity:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __63__WFSettingsIntentHandler_handleSetPersonalHotspot_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  WFSetPersonalHotspotIntentResponse *v4;

  if (a2)
    v3 = 5;
  else
    v3 = 4;
  v4 = -[WFSetPersonalHotspotIntentResponse initWithCode:userActivity:]([WFSetPersonalHotspotIntentResponse alloc], "initWithCode:userActivity:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __63__WFSettingsIntentHandler_handleSetOrientationLock_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  WFSetOrientationLockIntentResponse *v4;

  if (a2)
    v3 = 5;
  else
    v3 = 4;
  v4 = -[WFSetOrientationLockIntentResponse initWithCode:userActivity:]([WFSetOrientationLockIntentResponse alloc], "initWithCode:userActivity:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __58__WFSettingsIntentHandler_handleSetAppearance_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  WFSetAppearanceIntentResponse *v4;

  if (a2)
    v3 = 5;
  else
    v3 = 4;
  v4 = -[WFSetAppearanceIntentResponse initWithCode:userActivity:]([WFSetAppearanceIntentResponse alloc], "initWithCode:userActivity:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __58__WFSettingsIntentHandler_handleSetFlashlight_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  WFSetFlashlightIntentResponse *v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    v4 = objc_msgSend(v3, "code");
    if ((unint64_t)(v4 - 4) > 3)
      v5 = 5;
    else
      v5 = qword_22D6AD560[v4 - 4];
  }
  else
  {
    v5 = 4;
  }
  v6 = -[WFSetFlashlightIntentResponse initWithCode:userActivity:]([WFSetFlashlightIntentResponse alloc], "initWithCode:userActivity:", v5, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __58__WFSettingsIntentHandler_handleSetBrightness_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  WFSetBrightnessIntentResponse *v4;

  if (a2)
  {
    if (objc_msgSend(a2, "code") == 4)
      v3 = 100;
    else
      v3 = 5;
  }
  else
  {
    v3 = 4;
  }
  v4 = -[WFSetBrightnessIntentResponse initWithCode:userActivity:]([WFSetBrightnessIntentResponse alloc], "initWithCode:userActivity:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__WFSettingsIntentHandler_handleSetLowPowerMode_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  WFSetLowPowerModeIntentResponse *v4;

  if (a2)
    v3 = 5;
  else
    v3 = 4;
  v4 = -[WFSetLowPowerModeIntentResponse initWithCode:userActivity:]([WFSetLowPowerModeIntentResponse alloc], "initWithCode:userActivity:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__WFSettingsIntentHandler_handleSetCellularData_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  WFSetCellularDataIntentResponse *v4;

  if (a2)
    v3 = 5;
  else
    v3 = 4;
  v4 = -[WFSetCellularDataIntentResponse initWithCode:userActivity:]([WFSetCellularDataIntentResponse alloc], "initWithCode:userActivity:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __57__WFSettingsIntentHandler_handleSetBluetooth_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  WFSetBluetoothIntentResponse *v4;

  if (a2)
    v3 = 5;
  else
    v3 = 4;
  v4 = -[WFSetBluetoothIntentResponse initWithCode:userActivity:]([WFSetBluetoothIntentResponse alloc], "initWithCode:userActivity:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __52__WFSettingsIntentHandler_handleSetWiFi_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  WFSetWiFiIntentResponse *v5;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasCapability:", *MEMORY[0x24BEC1888]))
      v4 = 101;
    else
      v4 = 5;

  }
  else
  {
    v4 = 4;
  }
  v5 = -[WFSetWiFiIntentResponse initWithCode:userActivity:]([WFSetWiFiIntentResponse alloc], "initWithCode:userActivity:", v4, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__WFSettingsIntentHandler_handleSetAirplaneMode_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  WFSetAirplaneModeIntentResponse *v4;

  if (a2)
  {
    if (objc_msgSend(a2, "code") == 4)
      v3 = 100;
    else
      v3 = 5;
  }
  else
  {
    v3 = 4;
  }
  v4 = -[WFSetAirplaneModeIntentResponse initWithCode:userActivity:]([WFSetAirplaneModeIntentResponse alloc], "initWithCode:userActivity:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __66__WFSettingsIntentHandler_performSettingIntent_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __66__WFSettingsIntentHandler_performSettingIntent_completionHandler___block_invoke_2;
    v4[3] = &unk_24F8B8C28;
    v3 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "applyWithSettingsClient:completionHandler:", a2, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __66__WFSettingsIntentHandler_performSettingIntent_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    getWFBundledIntentsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[WFSettingsIntentHandler performSettingIntent:completionHandler:]_block_invoke_2";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_ERROR, "%s Performing setting intent failed with error %@", (uint8_t *)&v5, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75__WFSettingsIntentHandler_createSettingsClientForIntent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  getWFBundledIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromClass(*(Class *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[WFSettingsIntentHandler createSettingsClientForIntent:completionHandler:]_block_invoke";
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_INFO, "%s Created client for setting %{public}@", (uint8_t *)&v11, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    NSStringFromClass(*(Class *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[WFSettingsIntentHandler createSettingsClientForIntent:completionHandler:]_block_invoke";
    v13 = 2114;
    v14 = v10;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_ERROR, "%s Creating client for setting %{public}@ failed with error %@", (uint8_t *)&v11, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
