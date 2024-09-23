@implementation WFLowPowerModeSettingsClient

- (WFLowPowerModeSettingsClient)initWithLowPowerMode:(id)a3
{
  id v6;
  WFLowPowerModeSettingsClient *v7;
  WFLowPowerModeSettingsClient *v8;
  WFLowPowerModeSettingsClient *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLowPowerModeSettingsClient.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lowPowerMode"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFLowPowerModeSettingsClient;
  v7 = -[WFLowPowerModeSettingsClient init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_lowPowerMode, a3);
    v9 = v8;
  }

  return v8;
}

- (void)getStateWithCompletionHandler:(id)a3
{
  void *v3;
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
  v3 = (void *)MEMORY[0x24BDD1760];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  objc_msgSend(v3, "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLowPowerModeEnabled");

  getWFBundledIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[WFLowPowerModeSettingsClient getStateWithCompletionHandler:]";
    v10 = 1024;
    v11 = v6;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_INFO, "%s Retrieved Low Power Mode state: %d", (uint8_t *)&v8, 0x12u);
  }

  v4[2](v4, v6, 0);
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__WFLowPowerModeSettingsClient_setState_completionHandler___block_invoke;
  v8[3] = &unk_24F8B5BB8;
  v8[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[WFLowPowerModeSettingsClient getStateWithCompletionHandler:](self, "getStateWithCompletionHandler:", v8);

}

- (_PMLowPowerMode)lowPowerMode
{
  return self->_lowPowerMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowPowerMode, 0);
}

void __59__WFLowPowerModeSettingsClient_setState_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _BYTE buf[24];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BE0C3B8]);
    if (a2)
      v7 = 1;
    else
      v7 = 2;
    v8 = (void *)objc_msgSend(v6, "initWithMode:reason:", v7, 0);
    objc_msgSend((id)objc_opt_class(), "energyModeStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendEvent:", v8);

    v11 = *(unsigned __int8 *)(a1 + 48);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v13 = (_QWORD *)getkPMLPMSourceSiriSymbolLoc_ptr;
    v30 = getkPMLPMSourceSiriSymbolLoc_ptr;
    if (!getkPMLPMSourceSiriSymbolLoc_ptr)
    {
      v14 = LowPowerModeLibrary();
      v13 = dlsym(v14, "kPMLPMSourceSiri");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
      getkPMLPMSourceSiriSymbolLoc_ptr = (uint64_t)v13;
    }
    _Block_object_dispose(buf, 8);
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getkPMLPMSourceSiri(void)");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("WFLowPowerModeSettingsClient.m"), 24, CFSTR("%s"), dlerror());

      __break(1u);
    }
    if ((objc_msgSend(v12, "setPowerMode:fromSource:", v11, *v13) & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "reversalArbiter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "lastEventEquals:", v8);

      if (v16)
      {
        getWFBundledIntentsLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[WFLowPowerModeSettingsClient setState:completionHandler:]_block_invoke";
          _os_log_impl(&dword_22D353000, v17, OS_LOG_TYPE_INFO, "%s powerd doesn't seem to be writing to Biome, handling the write ourselves", buf, 0xCu);
        }

        v18 = objc_alloc(MEMORY[0x24BE0C3B8]);
        if (*(_BYTE *)(a1 + 48))
          v19 = 1;
        else
          v19 = 2;
        v20 = (void *)objc_msgSend(v18, "initWithMode:reason:", v19, 2);
        objc_msgSend((id)objc_opt_class(), "energyModeStream");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "source");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sendEvent:", v20);

      }
      getWFBundledIntentsLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = *(unsigned __int8 *)(a1 + 48);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFLowPowerModeSettingsClient setState:completionHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v24;
        _os_log_impl(&dword_22D353000, v23, OS_LOG_TYPE_INFO, "%s Set Low Power Mode state to %d", buf, 0x12u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v25 = *(_QWORD *)(a1 + 40);
      WFSettingsClientError();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

    }
  }

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
  v5 = (void *)get_PMLowPowerModeClass_softClass;
  v13 = get_PMLowPowerModeClass_softClass;
  if (!get_PMLowPowerModeClass_softClass)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __get_PMLowPowerModeClass_block_invoke;
    v9[3] = &unk_24F8BB430;
    v9[4] = &v10;
    __get_PMLowPowerModeClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v6, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLowPowerMode:", v7);
    v4[2](v4, v8, 0);
  }
  else
  {
    WFSettingsClientError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v8);
  }

}

+ (id)energyModeStream
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "Device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Power");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "EnergyMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)reversalArbiter
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BEC4018]);
  objc_msgSend(a1, "energyModeStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBiomeStream:", v4);

  return v5;
}

+ (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "reversalArbiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__WFLowPowerModeSettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F8B5BE0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getBookmarkForCurrentStateWithCompletionHandler:", v7);

}

+ (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "reversalArbiter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "biomeBookmark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__WFLowPowerModeSettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke;
  v11[3] = &unk_24F8B0F00;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "getReversalStateWithBookmark:completionHandler:", v9, v11);

}

void __79__WFLowPowerModeSettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    v3 = objc_msgSend(a2, "mode") == 1;
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __80__WFLowPowerModeSettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC4020]), "initWithBiomeBookmark:", v5);
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, 0, a3);
  }

}

@end
