@implementation SpeakThisServicesUI

+ (void)enableSpeakThisServices
{
  SpeakThisServicesUI *v2;
  void *v3;

  if (!_SharedSpeakThisServicesUI)
  {
    v2 = objc_alloc_init(SpeakThisServicesUI);
    v3 = (void *)_SharedSpeakThisServicesUI;
    _SharedSpeakThisServicesUI = (uint64_t)v2;

  }
}

- (SpeakThisServicesUI)init
{
  SpeakThisServicesUI *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SpeakThisServicesUI;
  v2 = -[SpeakThisServicesUI init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleSpeakThisEnabledStatusDidChangeNotification_, *MEMORY[0x24BED2920], 0);

    -[SpeakThisServicesUI _handleSpeakThisEnabledStatusDidChangeNotification:](v2, "_handleSpeakThisEnabledStatusDidChangeNotification:", 0);
  }
  return v2;
}

- (void)_unregisterForKBFrameNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7B70], 0);

}

- (void)_handleSpeakThisEnabledStatusDidChangeNotification:(id)a3
{
  if (_AXSSpeakThisEnabled())
    -[SpeakThisServicesUI _registerForKBFrameNotifications](self, "_registerForKBFrameNotifications");
  else
    -[SpeakThisServicesUI _unregisterForKBFrameNotifications](self, "_unregisterForKBFrameNotifications");
}

+ (void)disableSpeakThisServices
{
  void *v2;

  v2 = (void *)_SharedSpeakThisServicesUI;
  _SharedSpeakThisServicesUI = 0;

}

- (void)_registerForKBFrameNotifications
{
  id v3;

  if (_AXSSpeakThisEnabled())
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__kbFrameWillChange_, *MEMORY[0x24BDF7B70], 0);

  }
  else
  {
    -[SpeakThisServicesUI _unregisterForKBFrameNotifications](self, "_unregisterForKBFrameNotifications");
  }
}

- (void)_kbFrameWillChange:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  CGRect v18;

  v17[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(getSpeakThisServicesClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getSpeakThisServicesClass(), "speakThisMessageKeyKBFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  objc_msgSend(v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDF7A20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGRectValue");
  NSStringFromCGRect(v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v15 = *MEMORY[0x24BDF79B8];
  objc_msgSend(v3, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  v16 = *MEMORY[0x24BDF79C0];
  objc_msgSend(v3, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v14, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardFrameWillUpdate:errorHandler:", v13, &__block_literal_global_3);

}

void __42__SpeakThisServicesUI__kbFrameWillChange___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    AXLogSpeakScreen();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__SpeakThisServicesUI__kbFrameWillChange___block_invoke_cold_1((uint64_t)v2, v3);

  }
}

void __42__SpeakThisServicesUI__kbFrameWillChange___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230B0B000, a2, OS_LOG_TYPE_ERROR, "Error updating keyboard frame: %@", (uint8_t *)&v2, 0xCu);
}

@end
