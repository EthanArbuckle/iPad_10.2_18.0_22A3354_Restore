@implementation AXBMotionCuesManager

+ (void)initializeMonitor
{
  if (AXDeviceSupportsMotionCues())
  {
    if (initializeMonitor_onceToken_4 != -1)
      dispatch_once(&initializeMonitor_onceToken_4, &__block_literal_global_10);
  }
}

uint64_t __41__AXBMotionCuesManager_initializeMonitor__block_invoke()
{
  AXBMotionCuesManager *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(AXBMotionCuesManager);
  v1 = (void *)_SharedManager_1;
  _SharedManager_1 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BED28B0];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", v3, 0, v4, &__block_literal_global_179_1);

  return AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __41__AXBMotionCuesManager_initializeMonitor__block_invoke_2()
{
  return objc_msgSend((id)_SharedManager_1, "updateSettings");
}

uint64_t __41__AXBMotionCuesManager_initializeMonitor__block_invoke_3()
{
  return objc_msgSend((id)_SharedManager_1, "updateSettings");
}

- (void)setMotionCuesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  char v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 buf;
  void *(*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v5 = AXDeviceSupportsMotionCues();
  AXLogMotionCues();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_232455000, v7, OS_LOG_TYPE_DEFAULT, "Motion Cues monitor requested enable/disable with value: %@", (uint8_t *)&buf, 0xCu);

    }
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v9 = (void (*)(uint64_t))getAXMotionCuesManagerSymbolLoc_ptr;
    v15 = getAXMotionCuesManagerSymbolLoc_ptr;
    if (!getAXMotionCuesManagerSymbolLoc_ptr)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v17 = __getAXMotionCuesManagerSymbolLoc_block_invoke;
      v18 = &unk_250187F98;
      v19 = &v12;
      __getAXMotionCuesManagerSymbolLoc_block_invoke((uint64_t)&buf);
      v9 = (void (*)(uint64_t))v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v9)
      -[AXBMotionCuesManager setMotionCuesEnabled:].cold.1();
    v9(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v3)
    {
      -[NSObject enableWithCompletionBlock:](v11, "enableWithCompletionBlock:", &__block_literal_global_183, v12);
      self->_featureEnabled = 1;
    }
    else if (self->_featureEnabled)
    {
      -[NSObject disable:](v11, "disable:", &__block_literal_global_185, v12);
      self->_featureEnabled = 0;
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_232455000, v7, OS_LOG_TYPE_INFO, "Asked for Motion Cues to enable/disable but feature flag is off, so no", (uint8_t *)&buf, 2u);
  }

}

void __45__AXBMotionCuesManager_setMotionCuesEnabled___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  AXLogMotionCues();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __45__AXBMotionCuesManager_setMotionCuesEnabled___block_invoke_cold_1(a2);

}

void __45__AXBMotionCuesManager_setMotionCuesEnabled___block_invoke_184(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  AXLogMotionCues();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __45__AXBMotionCuesManager_setMotionCuesEnabled___block_invoke_184_cold_1(a2);

}

- (void)updateSettings
{
  _AXSMotionCuesMode();
  objc_msgSend((id)_SharedManager_1, "setMotionCuesEnabled:", _AXSMotionCuesEnabled() != 0);
}

- (void)setMotionCuesEnabled:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<AXMotionCuesServiceProtocol> AXMotionCuesManager_Soft(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXBMotionCuesManager.m"), 17, CFSTR("%s"), dlerror());

  __break(1u);
}

void __45__AXBMotionCuesManager_setMotionCuesEnabled___block_invoke_cold_1(char a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_232455000, v2, v3, "Enable request result for motion cues: %@ %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __45__AXBMotionCuesManager_setMotionCuesEnabled___block_invoke_184_cold_1(char a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_232455000, v2, v3, "Disable request result for motion cues: %@ %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
