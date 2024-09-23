@implementation AXBHoverTextManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_10 != -1)
    dispatch_once(&initializeMonitor_onceToken_10, &__block_literal_global_19);
}

void __40__AXBHoverTextManager_initializeMonitor__block_invoke()
{
  AXBHoverTextManager *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v0 = objc_alloc_init(AXBHoverTextManager);
  v1 = (void *)_SharedManager_4;
  _SharedManager_4 = (uint64_t)v0;

  objc_msgSend((id)_SharedManager_4, "updateHoverTextSettings");
  objc_msgSend((id)_SharedManager_4, "updateHoverTypingSettings");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BED27F8];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", v3, 0, v4, &__block_literal_global_179_3);

  if (AXHasCapability())
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BED2838];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v6, 0, v7, &__block_literal_global_182);

  }
}

uint64_t __40__AXBHoverTextManager_initializeMonitor__block_invoke_2()
{
  return objc_msgSend((id)_SharedManager_4, "updateHoverTextSettings");
}

uint64_t __40__AXBHoverTextManager_initializeMonitor__block_invoke_3()
{
  return objc_msgSend((id)_SharedManager_4, "updateHoverTypingSettings");
}

- (void)setHoverTextEnabled:(BOOL)a3 isTyping:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  void (*v10)(void);
  NSObject *v11;
  char v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  _BYTE buf[24];
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v4 = a4;
  v5 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = _os_feature_enabled_impl();
  HTLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("disable");
      if (v5)
        v9 = CFSTR("enable");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      _os_log_impl(&dword_232455000, v8, OS_LOG_TYPE_DEFAULT, "HoverText monitor asked to %@ HoverText. isTyping = %i", buf, 0x12u);
    }

    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v10 = (void (*)(void))getHoverTextObjcSymbolLoc_ptr;
    v23 = getHoverTextObjcSymbolLoc_ptr;
    if (!getHoverTextObjcSymbolLoc_ptr)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getHoverTextObjcSymbolLoc_block_invoke;
      v25 = &unk_250187F98;
      v26 = &v20;
      __getHoverTextObjcSymbolLoc_block_invoke((uint64_t)buf);
      v10 = (void (*)(void))v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v10)
      -[AXBHoverTextManager setHoverTextEnabled:isTyping:].cold.1();
    v10();
    v11 = objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v5)
    {
      if (v4)
      {
        v19 = 0;
        v12 = -[NSObject startHoverTextTypingAndReturnError:](v11, "startHoverTextTypingAndReturnError:", &v19);
        v13 = v19;
      }
      else
      {
        v18 = 0;
        v12 = -[NSObject startHoverTextAndReturnError:](v11, "startHoverTextAndReturnError:", &v18);
        v13 = v18;
      }
    }
    else if (v4)
    {
      v17 = 0;
      v12 = -[NSObject stopHoverTextTypingAndReturnError:](v11, "stopHoverTextTypingAndReturnError:", &v17);
      v13 = v17;
    }
    else
    {
      v16 = 0;
      v12 = -[NSObject stopHoverTextAndReturnError:](v11, "stopHoverTextAndReturnError:", &v16);
      v13 = v16;
    }
    v14 = v13;
    if ((v12 & 1) == 0)
    {
      HTLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[AXBHoverTextManager setHoverTextEnabled:isTyping:].cold.2((uint64_t)v14, v15);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_232455000, v8, OS_LOG_TYPE_INFO, "Asked to enable/disable HoverText but feature flag is off, so no", buf, 2u);
  }

}

- (void)updateHoverTextSettings
{
  objc_msgSend((id)_SharedManager_4, "setHoverTextEnabled:isTyping:", _AXSHoverTextEnabled() != 0, 0);
}

- (void)updateHoverTypingSettings
{
  objc_msgSend((id)_SharedManager_4, "setHoverTextEnabled:isTyping:", _AXSHoverTextTypingEnabled() != 0, 1);
}

- (void)setHoverTextEnabled:isTyping:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<HoverTextServiceProtocolObjC> HoverTextObjc_Soft(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXBHoverTextManager.m"), 25, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)setHoverTextEnabled:(uint64_t)a1 isTyping:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_232455000, a2, OS_LOG_TYPE_ERROR, "Error toggling HoverText: %@", (uint8_t *)&v2, 0xCu);
}

@end
