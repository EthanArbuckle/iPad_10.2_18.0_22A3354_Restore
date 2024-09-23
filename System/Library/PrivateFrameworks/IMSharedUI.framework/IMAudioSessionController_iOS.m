@implementation IMAudioSessionController_iOS

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  objc_super v6;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)IMAudioSessionController_iOS;
  -[IMAudioSessionController_iOS dealloc](&v6, sel_dealloc);
}

- (IMAudioSessionController_iOS)init
{
  const char *v2;
  uint64_t v3;
  IMAudioSessionController_iOS *v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMAudioSessionController_iOS;
  v4 = -[IMAudioSessionController_iOS init](&v11, sel_init);
  if (v4)
  {
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v5, v6, (uint64_t)v4, sel_audioSessionInterruption_, *MEMORY[0x24BDB15D8], 0);
    objc_msgSend_addObserver_selector_name_object_(v5, v7, (uint64_t)v4, sel_audioSessionRouteChange_, *MEMORY[0x24BDB1728], 0);
    objc_msgSend_addObserver_selector_name_object_(v5, v8, (uint64_t)v4, sel_audioSessionMediaServicesWereLost_, *MEMORY[0x24BDB1608], 0);
    objc_msgSend_addObserver_selector_name_object_(v5, v9, (uint64_t)v4, sel_audioSessionMediaServicesWereReset_, *MEMORY[0x24BDB1610], 0);

  }
  return v4;
}

- (void)configureAudioSessionWithOptions:(unint64_t)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  char v9;
  const char *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  id *v17;
  id v18;
  const char *v19;
  char v20;
  const char *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  const char *v25;
  char v26;
  const char *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)IMAudioSessionController_iOS;
  -[IMAudioSessionController configureAudioSessionWithOptions:](&v35, sel_configureAudioSessionWithOptions_);
  objc_msgSend_sharedInstance(MEMORY[0x24BDB1858], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDB1618];
  v34 = 0;
  v9 = objc_msgSend_setMode_error_(v6, v8, v7, &v34);
  v12 = v34;
  if ((v9 & 1) == 0)
  {
    objc_msgSend_audio(IMSharedUILogs, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_20D65DC54();

  }
  v14 = a3 & 1;
  v15 = 44;
  if ((a3 & 1) == 0)
    v15 = 36;
  if ((a3 & 2) != 0)
    v15 = 0;
  v16 = v15 | (a3 >> 1) & 2;
  v17 = (id *)MEMORY[0x24BDB1598];
  if ((a3 & 2) == 0)
    v17 = (id *)MEMORY[0x24BDB15A0];
  v18 = *v17;

  v33 = 0;
  v20 = objc_msgSend_setCategory_withOptions_error_(v6, v19, (uint64_t)v18, v16, &v33);
  v23 = v33;
  if ((v20 & 1) == 0)
  {
    objc_msgSend_audio(IMSharedUILogs, v21, v22);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_20D65DBF4();

  }
  v32 = 0;
  v26 = objc_msgSend_setActivationContext_error_(v6, v25, MEMORY[0x24BDBD1B8], &v32);
  v29 = v32;
  if ((v26 & 1) == 0)
  {
    objc_msgSend_audio(IMSharedUILogs, v27, v28);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_20D65DB94();

  }
  objc_msgSend_audio(IMSharedUILogs, v27, v28);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    sub_20D65DAE4(v14, v6, v31);

}

- (void)audioSessionRouteChange:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_audio(IMSharedUILogs, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v26 = 138412290;
    v27 = v4;
    _os_log_impl(&dword_20D651000, v7, OS_LOG_TYPE_INFO, "audioSessionRouteChange: %@", (uint8_t *)&v26, 0xCu);
  }

  objc_msgSend_setDirty_(self, v8, 1);
  if (objc_msgSend_isActive(self, v9, v10))
  {
    objc_msgSend_userInfo(v4, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v13, v14, *MEMORY[0x24BDB1738]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_unsignedIntegerValue(v15, v16, v17);

    if ((unint64_t)(v18 - 1) <= 1)
    {
      objc_msgSend_audio(IMSharedUILogs, v19, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_20D651000, v21, OS_LOG_TYPE_INFO, "Available audio routes changed", (uint8_t *)&v26, 2u);
      }

      v24 = objc_msgSend_options(self, v22, v23);
      objc_msgSend_activateWithOptions_completion_(self, v25, v24, 0);
    }
  }

}

- (void)audioSessionInterruption:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_audio(IMSharedUILogs, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_20D651000, v7, OS_LOG_TYPE_INFO, "audioSessionInterruption: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend_setDirty_(self, v8, 1);
}

- (void)audioSessionMediaServicesWereLost:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_audio(IMSharedUILogs, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_20D651000, v7, OS_LOG_TYPE_INFO, "audioSessionMediaServicesWereLost: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend_setDirty_(self, v8, 1);
}

- (void)audioSessionMediaServicesWereReset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_audio(IMSharedUILogs, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_20D651000, v7, OS_LOG_TYPE_INFO, "audioSessionMediaServicesWereReset: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend_setDirty_(self, v8, 1);
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const char *v6;
  char active;
  id v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  char v14;
  const char *v15;
  uint64_t v16;
  objc_super v17;
  id v18;
  id v19;

  v3 = a3;
  if (a3)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BDB1858], a2, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    active = objc_msgSend_setActive_error_(v5, v6, 1, &v19);
    v8 = v19;

    if ((active & 1) == 0)
    {
      objc_msgSend_audio(IMSharedUILogs, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_20D65DCB4();
LABEL_8:

    }
  }
  else
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BDB1858], a2, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v14 = objc_msgSend_setActive_withOptions_error_(v12, v13, 0, 1, &v18);
    v8 = v18;

    if ((v14 & 1) == 0)
    {
      objc_msgSend_audio(IMSharedUILogs, v15, v16);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_20D65DD14();
      goto LABEL_8;
    }
  }

  v17.receiver = self;
  v17.super_class = (Class)IMAudioSessionController_iOS;
  -[IMAudioSessionController setActive:](&v17, sel_setActive_, v3);
}

@end
