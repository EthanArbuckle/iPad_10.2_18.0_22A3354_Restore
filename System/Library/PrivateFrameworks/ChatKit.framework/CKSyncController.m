@implementation CKSyncController

- (BOOL)isRestoring
{
  return self->_restoring;
}

+ (id)sharedInstance
{
  if (sharedInstance_once_3 != -1)
    dispatch_once(&sharedInstance_once_3, &__block_literal_global_203);
  return (id)sharedInstance___instance;
}

void __34__CKSyncController_sharedInstance__block_invoke()
{
  CKSyncController *v0;
  void *v1;

  v0 = objc_alloc_init(CKSyncController);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (CKSyncController)init
{
  CKSyncController *v2;
  const char *v3;
  uint64_t v4;
  CKSyncController *v5;
  NSObject *v6;
  const char *v7;
  int *p_restoreStateChangedToken;
  CKSyncController *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  CKSyncController *v15;
  _QWORD handler[4];
  CKSyncController *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKSyncController;
  v2 = -[CKSyncController init](&v18, sel_init);
  if (v2)
  {
    v3 = (const char *)objc_msgSend(CFSTR("com.apple.ChatKit.attachmentRestoredNotification"), "UTF8String");
    v4 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __24__CKSyncController_init__block_invoke;
    handler[3] = &unk_1E2758398;
    v5 = v2;
    v17 = v5;
    v6 = MEMORY[0x1E0C80D38];
    notify_register_dispatch(v3, &v2->_attachmentRestoredToken, MEMORY[0x1E0C80D38], handler);
    v7 = (const char *)objc_msgSend(CFSTR("com.apple.MobileBackup.restoreStateChanged"), "UTF8String");
    p_restoreStateChangedToken = &v5->_restoreStateChangedToken;
    v11 = v4;
    v12 = 3221225472;
    v13 = __24__CKSyncController_init__block_invoke_2;
    v14 = &unk_1E2758398;
    v9 = v5;
    v15 = v9;
    notify_register_dispatch(v7, p_restoreStateChangedToken, v6, &v11);

    -[CKSyncController updateRestoreState](v9, "updateRestoreState", v11, v12, v13, v14);
  }
  return v2;
}

- (void)updateRestoreState
{
  uint64_t v3;
  uint64_t state64;

  state64 = 0;
  notify_get_state(self->_restoreStateChangedToken, &state64);
  v3 = state64;
  -[CKSyncController setRestoring:](self, "setRestoring:", state64 == 2);
  if (v3 != 2)
  {
    notify_cancel(self->_attachmentRestoredToken);
    self->_attachmentRestoredToken = -1;
    notify_cancel(self->_restoreStateChangedToken);
    self->_restoreStateChangedToken = -1;
  }
}

- (void)setRestoring:(BOOL)a3
{
  self->_restoring = a3;
}

uint64_t __24__CKSyncController_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "attachmentRestored");
}

uint64_t __24__CKSyncController_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRestoreState");
}

- (void)prioritizeAttachmentAtPath:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(46);
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_DEBUG, "Prioritize attachment at path %@", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    _CKLog();
  v5 = objc_alloc_init((Class)MEMORY[0x193FF3C18](CFSTR("ATConnection"), CFSTR("AirTraffic")));
  objc_msgSend(v5, "prioritizeAsset:forDataclass:", v3, CFSTR("MessagePart"));

}

- (void)attachmentRestored
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_postAttachmentRestored, 0);
  -[CKSyncController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_postAttachmentRestored, 0, 0.0);
}

- (void)postAttachmentRestored
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.ChatKit.attachmentRestoredNotification"), self);

}

- (int)restoreStateChangedToken
{
  return self->_restoreStateChangedToken;
}

- (void)setRestoreStateChangedToken:(int)a3
{
  self->_restoreStateChangedToken = a3;
}

- (int)attachmentRestoredToken
{
  return self->_attachmentRestoredToken;
}

- (void)setAttachmentRestoredToken:(int)a3
{
  self->_attachmentRestoredToken = a3;
}

@end
