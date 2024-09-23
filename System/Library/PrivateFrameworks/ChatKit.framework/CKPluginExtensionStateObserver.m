@implementation CKPluginExtensionStateObserver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1)
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_35);
  return (id)sSharedInstance;
}

- (void)prepareForResume
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[CKPluginExtensionStateObserver prepareForResume]";
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
    }

  }
  -[CKPluginExtensionStateObserver _passKitUIDismissed](self, "_passKitUIDismissed");
  -[CKPluginExtensionStateObserver _iTunesStoreDialogDidDismiss](self, "_iTunesStoreDialogDidDismiss");
}

- (void)_passKitUIDismissed
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 136315138;
      v6 = "-[CKPluginExtensionStateObserver _passKitUIDismissed]";
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "%s _passKitUIDismissed", (uint8_t *)&v5, 0xCu);
    }

  }
  -[CKPluginExtensionStateObserver setPassKitUIPresented:](self, "setPassKitUIPresented:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CKPluginExtensionStateObserverPassKitUIDismissed"), 0);

}

- (void)setPassKitUIPresented:(BOOL)a3
{
  self->_passKitUIPresented = a3;
}

- (void)_iTunesStoreDialogDidDismiss
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[CKPluginExtensionStateObserver _iTunesStoreDialogDidDismiss]";
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "%s _iTunesStoreDialogDidDismiss", (uint8_t *)&v4, 0xCu);
    }

  }
  -[CKPluginExtensionStateObserver setITunesStoreDialogPresented:](self, "setITunesStoreDialogPresented:", 0);
}

- (void)setITunesStoreDialogPresented:(BOOL)a3
{
  self->_iTunesStoreDialogPresented = a3;
}

void __48__CKPluginExtensionStateObserver_sharedInstance__block_invoke()
{
  CKPluginExtensionStateObserver *v0;
  void *v1;

  v0 = objc_alloc_init(CKPluginExtensionStateObserver);
  v1 = (void *)sSharedInstance;
  sSharedInstance = (uint64_t)v0;

}

- (CKPluginExtensionStateObserver)init
{
  CKPluginExtensionStateObserver *v2;
  CKPluginExtensionStateObserver *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *v7;
  __CFNotificationCenter *v8;
  __CFNotificationCenter *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKPluginExtensionStateObserver;
  v2 = -[CKPluginExtensionStateObserver init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_passKitUIPresented = 0;
    v2->_iTunesStoreDialogPresented = 0;
    _PassKitApiInit();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_PassKitUIPresentedCallBack, (CFStringRef)kPKDarwinNotificationEventInAppPresented, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v3, (CFNotificationCallback)_PassKitUIDismissedCallBack, (CFStringRef)kPKDarwinNotificationEventInAppDismissed, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v3, (CFNotificationCallback)_TouchIDUIPresentedCallBack, CFSTR("com.apple.LocalAuthentication.ui.presented"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, v3, (CFNotificationCallback)_TouchIDUIDismissedCallBack, CFSTR("com.apple.LocalAuthentication.ui.dismissed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    _ITunesStoreAPIInit();
    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v8, v3, (CFNotificationCallback)_iTunesStoreDialogWillDisplayCallBack, (CFStringRef)kITunesDaemonWillDisplayDialog, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v3, (CFNotificationCallback)_iTunesStoreDialogDidDismissCallBack, (CFStringRef)kITunesDaemonDidDismissDialog, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel__stickerDragStarted_, CFSTR("CKPluginExtensionStateObserverStickerDragStarted"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel__stickerDragEnded_, CFSTR("CKPluginExtensionStateObserverStickerDragEnded"), 0);

  }
  return v3;
}

+ (id)_sharedInstanceIfInitialized
{
  return (id)sSharedInstance;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("YES");
  if (self->_passKitUIPresented)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (!self->_iTunesStoreDialogPresented)
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ _passKitUIPresented %@, iTunesStoreDialogPresented %@>"), v4, v6, v5);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)kPKDarwinNotificationEventInAppPresented, 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)kITunesDaemonWillDisplayDialog, 0);
  v5.receiver = self;
  v5.super_class = (Class)CKPluginExtensionStateObserver;
  -[CKPluginExtensionStateObserver dealloc](&v5, sel_dealloc);
}

- (void)_iTunesStoreDialogWillDisplay
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[CKPluginExtensionStateObserver _iTunesStoreDialogWillDisplay]";
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "%s _iTunesStoreDialogWillDisplay", (uint8_t *)&v4, 0xCu);
    }

  }
  -[CKPluginExtensionStateObserver setITunesStoreDialogPresented:](self, "setITunesStoreDialogPresented:", 1);
}

- (void)_passKitUIPresented
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[CKPluginExtensionStateObserver _passKitUIPresented]";
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "%s _passKitUIPresented", (uint8_t *)&v4, 0xCu);
    }

  }
  -[CKPluginExtensionStateObserver setPassKitUIPresented:](self, "setPassKitUIPresented:", 1);
}

- (void)_stickerDragStarted:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[CKPluginExtensionStateObserver _stickerDragStarted:]";
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s _stickerDragStarted", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKPluginExtensionStateObserver setStickerDragActiveInCurrentProcess:](self, "setStickerDragActiveInCurrentProcess:", 1);

}

- (void)_stickerDragEnded:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[CKPluginExtensionStateObserver _stickerDragEnded:]";
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s _stickerDragEnded", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKPluginExtensionStateObserver setStickerDragActiveInCurrentProcess:](self, "setStickerDragActiveInCurrentProcess:", 0);

}

- (BOOL)passKitUIPresented
{
  return self->_passKitUIPresented;
}

- (BOOL)stickerDragActiveInCurrentProcess
{
  return self->_stickerDragActiveInCurrentProcess;
}

- (void)setStickerDragActiveInCurrentProcess:(BOOL)a3
{
  self->_stickerDragActiveInCurrentProcess = a3;
}

- (BOOL)iTunesStoreDialogPresented
{
  return self->_iTunesStoreDialogPresented;
}

@end
