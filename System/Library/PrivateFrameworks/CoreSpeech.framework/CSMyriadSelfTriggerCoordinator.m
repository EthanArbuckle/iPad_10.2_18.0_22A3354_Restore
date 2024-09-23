@implementation CSMyriadSelfTriggerCoordinator

- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  os_log_t *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id WeakRetained;
  char v16;
  id v17;
  uint64_t v18;
  char v19;
  __int16 v20;
  __int16 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99DF0];
  v6 = a4;
  objc_msgSend(v5, "dataWithCapacity:", 13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v20 = 0;
  v19 = 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D19728]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  objc_msgSend(v7, "appendBytes:length:", &v21, 2, v9);
  objc_msgSend(v7, "appendBytes:length:", &v20, 1);
  objc_msgSend(v7, "appendBytes:length:", (char *)&v20 + 1, 1);
  objc_msgSend(v7, "appendBytes:length:", &v18, 8);
  objc_msgSend(v7, "appendBytes:length:", &v19, 1);
  v10 = (os_log_t *)MEMORY[0x1E0D18F60];
  v11 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[CSMyriadSelfTriggerCoordinator selfTriggerDetector:didDetectSelfTrigger:]";
    v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Advert data: %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "myriadHashFilePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "writeToFile:atomically:", v13, 0) & 1) == 0)
  {
    v14 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[CSMyriadSelfTriggerCoordinator selfTriggerDetector:didDetectSelfTrigger:]";
      _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s advert data write failed", buf, 0xCu);
    }
  }
  notify_post("com.apple.siri.corespeech.selftrigger");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    v17 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v17, "CSMyriadSelfTriggerCoordinator:didGenerateMyriadPHashForSelfTrigger:", self, v7);

  }
}

- (CSMyriadSelfTriggerCoordinatorDelegate)delegate
{
  return (CSMyriadSelfTriggerCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
