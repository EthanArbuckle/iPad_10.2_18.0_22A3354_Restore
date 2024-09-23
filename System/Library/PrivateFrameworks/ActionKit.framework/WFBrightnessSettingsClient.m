@implementation WFBrightnessSettingsClient

+ (void)createClientWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v4, v5, 0);

}

- (void)getValueWithCompletionHandler:(id)a3
{
  void (**v3)(id, _QWORD, float);
  void *v4;
  void *v5;
  float v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BYTE buf[24];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, _QWORD, float))a3;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v4 = getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr;
  v11 = getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr;
  if (!getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr)
  {
    v5 = BackBoardServicesLibrary();
    v4 = dlsym(v5, "BKSDisplayBrightnessGetCurrent");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v4;
    getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(buf, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "float WFBKSDisplayBrightnessGetCurrent(void)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("WFBrightnessSettingsClient.m"), 20, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v6 = ((float (*)(void))v4)();
  getWFBundledIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFBrightnessSettingsClient getValueWithCompletionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v6;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_INFO, "%s Retrieved system brightness level: %f", buf, 0x16u);
  }

  v3[2](v3, 0, v6);
}

- (void)setValue:(float)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BYTE buf[24];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a4;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v6 = getBKSDisplayBrightnessIsBrightnessLevelControlAvailableSymbolLoc_ptr;
  v24 = getBKSDisplayBrightnessIsBrightnessLevelControlAvailableSymbolLoc_ptr;
  if (!getBKSDisplayBrightnessIsBrightnessLevelControlAvailableSymbolLoc_ptr)
  {
    v7 = BackBoardServicesLibrary();
    v6 = dlsym(v7, "BKSDisplayBrightnessIsBrightnessLevelControlAvailable");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v6;
    getBKSDisplayBrightnessIsBrightnessLevelControlAvailableSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(buf, 8);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL WFBKSDisplayBrightnessIsBrightnessLevelControlAvailable(void)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("WFBrightnessSettingsClient.m"), 21, CFSTR("%s"), dlerror());

    goto LABEL_25;
  }
  if ((((uint64_t (*)(void))v6)() & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v8 = getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr;
    v24 = getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr;
    if (!getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr)
    {
      v9 = BackBoardServicesLibrary();
      v8 = dlsym(v9, "BKSDisplayBrightnessTransactionCreate");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
      getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr = v8;
    }
    _Block_object_dispose(buf, 8);
    if (v8)
    {
      v10 = (const void *)((uint64_t (*)(_QWORD))v8)(0);
      getWFBundledIntentsLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFBrightnessSettingsClient setValue:completionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl(&dword_22D353000, v11, OS_LOG_TYPE_INFO, "%s Created brightness transaction %@", buf, 0x16u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v12 = getBKSDisplayBrightnessSetSymbolLoc_ptr;
      v24 = getBKSDisplayBrightnessSetSymbolLoc_ptr;
      if (!getBKSDisplayBrightnessSetSymbolLoc_ptr)
      {
        v13 = BackBoardServicesLibrary();
        v12 = dlsym(v13, "BKSDisplayBrightnessSet");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v12;
        getBKSDisplayBrightnessSetSymbolLoc_ptr = v12;
      }
      _Block_object_dispose(buf, 8);
      if (v12)
      {
        ((void (*)(uint64_t, float))v12)(1, a3);
        getWFBundledIntentsLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFBrightnessSettingsClient setValue:completionHandler:]";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = a3;
          _os_log_impl(&dword_22D353000, v14, OS_LOG_TYPE_INFO, "%s Set system brightness level to %f", buf, 0x16u);
        }

        if (v10)
          CFRelease(v10);
        v5[2](v5, 0);
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void WFBKSDisplayBrightnessSet(float, Boolean)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("WFBrightnessSettingsClient.m"), 18, CFSTR("%s"), dlerror());

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BKSDisplayBrightnessTransactionRef WFBKSDisplayBrightnessTransactionCreate(CFAllocatorRef)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFBrightnessSettingsClient.m"), 19, CFSTR("%s"), dlerror());

    }
LABEL_25:
    __break(1u);
  }
  getWFBundledIntentsLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[WFBrightnessSettingsClient setValue:completionHandler:]";
    _os_log_impl(&dword_22D353000, v15, OS_LOG_TYPE_INFO, "%s Brightness control unavailable", buf, 0xCu);
  }

  WFSettingsClientError();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v5)[2](v5, v16);

LABEL_21:
}

@end
