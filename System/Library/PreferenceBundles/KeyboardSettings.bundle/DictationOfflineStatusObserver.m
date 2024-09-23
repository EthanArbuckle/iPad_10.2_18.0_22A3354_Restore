@implementation DictationOfflineStatusObserver

- (DictationOfflineStatusObserver)initWithDelegate:(id)a3
{
  id v4;
  DictationOfflineStatusObserver *v5;
  DictationOfflineStatusObserver *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  CFStringRef *v9;
  _QWORD block[4];
  DictationOfflineStatusObserver *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DictationOfflineStatusObserver;
  v5 = -[DictationOfflineStatusObserver init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DictationOfflineStatusObserver setDelegate:](v5, "setDelegate:", v4);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v8 = IsTrialAssetDeliveryEnabled();
    v9 = (CFStringRef *)MEMORY[0x24BE094E0];
    if (!v8)
      v9 = (CFStringRef *)MEMORY[0x24BE094C0];
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)EmbeddedSpeechNewAssetInstalled, *v9, 0, (CFNotificationSuspensionBehavior)0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__DictationOfflineStatusObserver_initWithDelegate___block_invoke;
    block[3] = &unk_24E7321B8;
    v12 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  return v6;
}

uint64_t __51__DictationOfflineStatusObserver_initWithDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOfflineDictationStatus");
}

- (void)updateOfflineDictationStatus
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__DictationOfflineStatusObserver_updateOfflineDictationStatus__block_invoke;
  v4[3] = &unk_24E732208;
  v4[4] = self;
  objc_msgSend(v3, "getOfflineDictationStatusWithCompletion:", v4);

}

void __62__DictationOfflineStatusObserver_updateOfflineDictationStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__DictationOfflineStatusObserver_updateOfflineDictationStatus__block_invoke_2;
  v5[3] = &unk_24E7321E0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __62__DictationOfflineStatusObserver_updateOfflineDictationStatus__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "offlineDictationStatusUpdated:", *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  int v4;
  CFNotificationName *v5;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v4 = IsTrialAssetDeliveryEnabled();
  v5 = (CFNotificationName *)MEMORY[0x24BE094E0];
  if (!v4)
    v5 = (CFNotificationName *)MEMORY[0x24BE094C0];
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, *v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)DictationOfflineStatusObserver;
  -[DictationOfflineStatusObserver dealloc](&v6, sel_dealloc);
}

- (DictationOfflineStatusObserverDelegate)delegate
{
  return (DictationOfflineStatusObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
