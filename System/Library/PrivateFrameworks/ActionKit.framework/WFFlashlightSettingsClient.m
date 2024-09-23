@implementation WFFlashlightSettingsClient

- (WFFlashlightSettingsClient)initWithFlashlight:(id)a3
{
  id v6;
  WFFlashlightSettingsClient *v7;
  WFFlashlightSettingsClient *v8;
  WFFlashlightSettingsClient *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFlashlightSettingsClient.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("flashlight"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFFlashlightSettingsClient;
  v7 = -[WFFlashlightSettingsClient init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_flashlight, a3);
    v9 = v8;
  }

  return v8;
}

- (void)turnOffWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  double v7;
  int v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  getWFBundledIntentsLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[WFFlashlightSettingsClient turnOffWithCompletionHandler:]";
    _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_INFO, "%s Turning flashlight off", buf, 0xCu);
  }

  -[WFFlashlightSettingsClient flashlight](self, "flashlight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  LODWORD(v7) = 0;
  v8 = objc_msgSend(v6, "setFlashlightLevel:withError:", &v12, v7);
  v9 = v12;

  v10 = v9;
  if (v8)
  {
    -[WFFlashlightSettingsClient flashlight](self, "flashlight");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "turnPowerOff");

    v10 = 0;
  }
  ((void (**)(id, id))v4)[2](v4, v10);

}

- (void)turnOnWithBrightnessLevel:(float)a3 completionHandler:(id)a4
{
  float v5;
  void (**v6)(id, id);
  NSObject *v7;
  void *v8;
  double v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 == 0.0)
    v5 = 0.01;
  else
    v5 = a3;
  v6 = (void (**)(id, id))a4;
  getWFBundledIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[WFFlashlightSettingsClient turnOnWithBrightnessLevel:completionHandler:]";
    v14 = 2048;
    v15 = v5;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_INFO, "%s Turning flashlight on to level %f", buf, 0x16u);
  }

  -[WFFlashlightSettingsClient flashlight](self, "flashlight");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  *(float *)&v9 = v5;
  objc_msgSend(v8, "setFlashlightLevel:withError:", &v11, v9);
  v10 = v11;

  v6[2](v6, v10);
}

- (void)toggleWithBrightnessLevel:(float)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  float v8;
  float v9;
  NSObject *v10;
  const __CFString *v11;
  double v12;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[WFFlashlightSettingsClient flashlight](self, "flashlight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "flashlightLevel");
  v9 = v8;

  getWFBundledIntentsLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = CFSTR("off");
    if (v9 > 0.0)
      v11 = CFSTR("on");
    v13 = 136315394;
    v14 = "-[WFFlashlightSettingsClient toggleWithBrightnessLevel:completionHandler:]";
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_INFO, "%s Flashlight is currently %@", (uint8_t *)&v13, 0x16u);
  }

  if (v9 <= 0.0)
  {
    *(float *)&v12 = a3;
    -[WFFlashlightSettingsClient turnOnWithBrightnessLevel:completionHandler:](self, "turnOnWithBrightnessLevel:completionHandler:", v6, v12);
  }
  else
  {
    -[WFFlashlightSettingsClient turnOffWithCompletionHandler:](self, "turnOffWithCompletionHandler:", v6);
  }

}

- (AVFlashlight)flashlight
{
  return self->_flashlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flashlight, 0);
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  dispatch_time_t v6;
  NSObject *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(getAVFlashlightClass(), "hasFlashlight") & 1) != 0)
  {
    getAVFlashlightClass();
    v5 = (id)objc_opt_new();
    if (v5)
    {
      v6 = dispatch_time(0, 200000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __64__WFFlashlightSettingsClient_createClientWithCompletionHandler___block_invoke;
      block[3] = &unk_24F8B8D30;
      v5 = v5;
      v10 = v5;
      v11 = v4;
      v12 = a1;
      dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      WFSettingsClientError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

    }
  }
  else
  {
    getWFBundledIntentsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "+[WFFlashlightSettingsClient createClientWithCompletionHandler:]";
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_ERROR, "%s Device has no flashlight", buf, 0xCu);
    }

    WFSettingsClientError();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v5);
  }

}

void __64__WFFlashlightSettingsClient_createClientWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isOverheated"))
  {
    getWFBundledIntentsLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "+[WFFlashlightSettingsClient createClientWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_22D353000, v2, OS_LOG_TYPE_ERROR, "%s Flashlight is overheated", buf, 0xCu);
    }
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isAvailable") & 1) != 0)
    {
      v5 = (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithFlashlight:", *(_QWORD *)(a1 + 32));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      return;
    }
    getWFBundledIntentsLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "+[WFFlashlightSettingsClient createClientWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_22D353000, v2, OS_LOG_TYPE_ERROR, "%s Flashlight is unavailable", buf, 0xCu);
    }
  }

  v3 = *(_QWORD *)(a1 + 40);
  WFSettingsClientError();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

@end
