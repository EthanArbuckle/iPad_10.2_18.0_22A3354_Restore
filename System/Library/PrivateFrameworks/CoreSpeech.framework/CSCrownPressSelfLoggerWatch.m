@implementation CSCrownPressSelfLoggerWatch

- (CSCrownPressSelfLoggerWatch)init
{
  CSCrownPressSelfLoggerWatch *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSCrownPressSelfLoggerWatch;
  v2 = -[CSCrownPressSelfLoggerWatch init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("CSCrownPressSelfLoggerWatch queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_listeningEnabled = 0;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  +[CSSiriAssertionMonitor sharedInstance](CSSiriAssertionMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)CSCrownPressSelfLoggerWatch;
  -[CSCrownPressSelfLoggerWatch dealloc](&v5, sel_dealloc);
}

- (void)setup
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CSCrownPressSelfLoggerWatch_setup__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_emitCrownPressedEventwithMHUUID:(id)a3 didUseAOM:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[CSCrownPressSelfLoggerWatch _emitCrownPressedEventwithMHUUID:didUseAOM:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Mint a new MHUUID for crown press events", (uint8_t *)&v15, 0xCu);
    }
  }
  v8 = objc_alloc_init(MEMORY[0x1E0D99A88]);
  objc_msgSend(v8, "setIsAlwaysOnMicAudioUsed:", v4);
  v9 = objc_alloc_init(MEMORY[0x1E0D99A60]);
  v10 = objc_alloc_init(MEMORY[0x1E0D99A68]);
  v11 = objc_alloc(MEMORY[0x1E0D9A500]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
  v13 = (void *)objc_msgSend(v11, "initWithNSUUID:", v12);
  objc_msgSend(v10, "setMhId:", v13);

  objc_msgSend(v9, "setEventMetadata:", v10);
  objc_msgSend(v9, "setCrownPressed:", v8);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emitMessage:", v9);

}

- (void)_handleDidStartStreamWithContext:(id)a3 withOption:(id)a4 successfully:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  CSCrownPressSelfLoggerWatch *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a5;
  v8 = a4;
  if (v5)
  {
    v16 = v8;
    v9 = objc_msgSend(a3, "isHomePressed");
    v8 = v16;
    if (v9)
    {
      if (self->_listeningEnabled
        && (v10 = -[CSCrownPressSelfLoggerWatch displayWakeHostTime](self, "displayWakeHostTime"),
            v11 = objc_msgSend(v16, "startRecordingHostTime"),
            v8 = v16,
            v10 <= v11))
      {
        objc_msgSend(v16, "requestMHUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = self;
        v14 = v12;
        v15 = 0;
      }
      else
      {
        objc_msgSend(v8, "requestMHUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = self;
        v14 = v12;
        v15 = 1;
      }
      -[CSCrownPressSelfLoggerWatch _emitCrownPressedEventwithMHUUID:didUseAOM:](v13, "_emitCrownPressedEventwithMHUUID:didUseAOM:", v14, v15);

      v8 = v16;
    }
  }

}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;

  v10 = a4;
  v11 = a6;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __117__CSCrownPressSelfLoggerWatch_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke;
  v15[3] = &unk_1E7C29278;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = a5;
  v13 = v11;
  v14 = v10;
  dispatch_async(queue, v15);

}

- (void)CSSiriAssertionMonitor:(id)a3 didReceiveBacklightOnEnabled:(BOOL)a4 atHostTime:(unint64_t)a5
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v7;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__CSCrownPressSelfLoggerWatch_CSSiriAssertionMonitor_didReceiveBacklightOnEnabled_atHostTime___block_invoke;
  block[3] = &unk_1E7C284A8;
  v7 = a4;
  block[4] = self;
  block[5] = a5;
  dispatch_async(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)displayWakeHostTime
{
  return self->_displayWakeHostTime;
}

- (void)setDisplayWakeHostTime:(unint64_t)a3
{
  self->_displayWakeHostTime = a3;
}

- (BOOL)listeningEnabled
{
  return self->_listeningEnabled;
}

- (void)setListeningEnabled:(BOOL)a3
{
  self->_listeningEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __94__CSCrownPressSelfLoggerWatch_CSSiriAssertionMonitor_didReceiveBacklightOnEnabled_atHostTime___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 48);
  if (*(_BYTE *)(result + 48))
    *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __117__CSCrownPressSelfLoggerWatch_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidStartStreamWithContext:withOption:successfully:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

void __36__CSCrownPressSelfLoggerWatch_setup__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerObserver:", *(_QWORD *)(a1 + 32));

  +[CSSiriAssertionMonitor sharedInstance](CSSiriAssertionMonitor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", *(_QWORD *)(a1 + 32));

}

@end
