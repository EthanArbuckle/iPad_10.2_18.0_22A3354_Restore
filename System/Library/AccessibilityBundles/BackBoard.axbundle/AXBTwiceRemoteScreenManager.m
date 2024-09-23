@implementation AXBTwiceRemoteScreenManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_13 != -1)
    dispatch_once(&initializeMonitor_onceToken_13, &__block_literal_global_22);
}

void __48__AXBTwiceRemoteScreenManager_initializeMonitor__block_invoke()
{
  AXBTwiceRemoteScreenManager *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v0 = objc_alloc_init(AXBTwiceRemoteScreenManager);
  v1 = (void *)_sharedManager;
  _sharedManager = (uint64_t)v0;

  objc_msgSend((id)_sharedManager, "updateSettings");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BED2950];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v2, 0, v3, &__block_literal_global_179_4);

}

uint64_t __48__AXBTwiceRemoteScreenManager_initializeMonitor__block_invoke_2()
{
  return objc_msgSend((id)_sharedManager, "updateSettings");
}

- (void)setTwiceRemoteScreenEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend((id)_sharedManager, "started") & 1) != 0 || v3)
  {
    *(_QWORD *)&v16 = 0;
    *((_QWORD *)&v16 + 1) = &v16;
    v17 = 0x2020000000;
    v6 = getAXWatchRemoteScreenIsTwiceFeatureOnSymbolLoc_ptr;
    v18 = getAXWatchRemoteScreenIsTwiceFeatureOnSymbolLoc_ptr;
    if (!getAXWatchRemoteScreenIsTwiceFeatureOnSymbolLoc_ptr)
    {
      v7 = (void *)AXWatchRemoteScreenServicesLibrary();
      v6 = dlsym(v7, "AXWatchRemoteScreenIsTwiceFeatureOn");
      *(_QWORD *)(*((_QWORD *)&v16 + 1) + 24) = v6;
      getAXWatchRemoteScreenIsTwiceFeatureOnSymbolLoc_ptr = v6;
    }
    _Block_object_dispose(&v16, 8);
    if (!v6)
      -[AXBTwiceRemoteScreenManager setTwiceRemoteScreenEnabled:].cold.1();
    v9 = ((uint64_t (*)(uint64_t))v6)(v8);
    AXLogTwiceRemoteScreen();
    v10 = objc_claimAutoreleasedReturnValue();
    v4 = v10;
    if ((v9 & 1) != 0)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v16) = 134217984;
        *(_QWORD *)((char *)&v16 + 4) = v3;
        _os_log_impl(&dword_232455000, v4, OS_LOG_TYPE_DEFAULT, "[TWICE] Twice monitor - enable: %ld", (uint8_t *)&v16, 0xCu);
      }

      objc_msgSend((id)_sharedManager, "setStarted:", 1);
      *(_QWORD *)&v16 = 0;
      *((_QWORD *)&v16 + 1) = &v16;
      v17 = 0x2020000000;
      v11 = getAXTwiceRemoteScreenServiceObjcSymbolLoc_ptr;
      v18 = getAXTwiceRemoteScreenServiceObjcSymbolLoc_ptr;
      if (!getAXTwiceRemoteScreenServiceObjcSymbolLoc_ptr)
      {
        v12 = (void *)AXWatchRemoteScreenServicesLibrary();
        v11 = dlsym(v12, "AXTwiceRemoteScreenServiceObjc");
        *(_QWORD *)(*((_QWORD *)&v16 + 1) + 24) = v11;
        getAXTwiceRemoteScreenServiceObjcSymbolLoc_ptr = v11;
      }
      _Block_object_dispose(&v16, 8);
      if (!v11)
        -[AXBTwiceRemoteScreenManager setTwiceRemoteScreenEnabled:].cold.2();
      ((void (*)(uint64_t))v11)(v13);
      v4 = objc_claimAutoreleasedReturnValue();
      -[NSObject npsSetTwiceEnabled:](v4, "npsSetTwiceEnabled:", v3, (_QWORD)v16);
      if (v3)
        v14 = -[NSObject startTwiceRemoteScreen](v4, "startTwiceRemoteScreen");
      else
        v14 = -[NSObject stopTwiceRemoteScreen](v4, "stopTwiceRemoteScreen");
      if ((v14 & 1) == 0)
      {
        AXLogTwiceRemoteScreen();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[AXBTwiceRemoteScreenManager setTwiceRemoteScreenEnabled:].cold.3(v15);

      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v5 = "[TWICE] Feature flag is off";
      goto LABEL_18;
    }
  }
  else
  {
    AXLogTwiceRemoteScreen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v5 = "[TWICE] Avoid loading AXWatchRemoteScreenServices library";
LABEL_18:
      _os_log_impl(&dword_232455000, v4, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v16, 2u);
    }
  }

}

- (void)updateSettings
{
  objc_msgSend((id)_sharedManager, "setTwiceRemoteScreenEnabled:", _AXSTwiceRemoteScreenEnabled() != 0);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void)setTwiceRemoteScreenEnabled:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL AXWatchRemoteScreenIsTwiceFeatureOn_Soft(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXBTwiceRemoteScreenManager.m"), 17, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)setTwiceRemoteScreenEnabled:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<AXWatchRemoteScreenServiceProtocolObjc> AXTwiceRemoteScreenServiceObjc_Soft(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXBTwiceRemoteScreenManager.m"), 16, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)setTwiceRemoteScreenEnabled:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_232455000, log, OS_LOG_TYPE_ERROR, "[TWICE] Error toggling Twice", v1, 2u);
}

@end
