@implementation CSVoiceTriggerAssetHandlerFromFile

- (CSVoiceTriggerAssetHandlerFromFile)initWithDisableOnDeviceCompilation:(BOOL)a3
{
  CSVoiceTriggerAssetHandlerFromFile *v4;
  uint64_t v5;
  CSOnDeviceCompilationHandler *onDeviceCompilationHandler;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSVoiceTriggerAssetHandlerFromFile;
  v4 = -[CSVoiceTriggerAssetHandler init](&v8, sel_init);
  if (v4)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0D19180], "sharedHandler");
      v5 = objc_claimAutoreleasedReturnValue();
      onDeviceCompilationHandler = v4->_onDeviceCompilationHandler;
      v4->_onDeviceCompilationHandler = (CSOnDeviceCompilationHandler *)v5;

    }
    -[CSVoiceTriggerAssetHandlerFromFile start](v4, "start");
  }
  return v4;
}

- (CSVoiceTriggerAssetHandlerFromFile)init
{
  return -[CSVoiceTriggerAssetHandlerFromFile initWithDisableOnDeviceCompilation:](self, "initWithDisableOnDeviceCompilation:", 0);
}

- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  CSOnDeviceCompilationHandler *onDeviceCompilationHandler;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fakeVoiceTriggerAssetPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v9);

  if (v12)
    objc_msgSend(MEMORY[0x1E0D18FC0], "assetForAssetType:resourcePath:configVersion:assetProvider:", 0, v10, CFSTR("override-asset"), 2);
  else
    objc_msgSend(MEMORY[0x1E0D18FC0], "defaultFallBackAssetForVoiceTrigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    onDeviceCompilationHandler = self->_onDeviceCompilationHandler;
    if (onDeviceCompilationHandler)
    {
      v17 = 0;
      -[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:](onDeviceCompilationHandler, "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:", v13, 0, v6, &v17);
      v15 = v17;
      v16 = *MEMORY[0x1E0D18F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[CSVoiceTriggerAssetHandlerFromFile getVoiceTriggerAssetWithEndpointId:completion:]";
        v20 = 2112;
        v21 = v15;
        _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Compile cached asset to onDevice CacheIr with error: %@", buf, 0x16u);
      }

    }
  }
  if (v7)
    v7[2](v7, v13, 0);

}

- (void)getPreinstallVoiceTriggerAssetForCurrentLocale:(id)a3
{
  -[CSVoiceTriggerAssetHandlerFromFile getVoiceTriggerAssetWithEndpointId:completion:](self, "getVoiceTriggerAssetWithEndpointId:completion:", 0, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDeviceCompilationHandler, 0);
}

@end
