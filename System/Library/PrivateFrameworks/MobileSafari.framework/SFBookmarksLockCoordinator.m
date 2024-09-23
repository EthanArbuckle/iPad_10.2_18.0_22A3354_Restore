@implementation SFBookmarksLockCoordinator

+ (SFBookmarksLockCoordinator)sharedCoordinator
{
  if (sharedCoordinator_onceToken != -1)
    dispatch_once(&sharedCoordinator_onceToken, &__block_literal_global_12);
  return (SFBookmarksLockCoordinator *)(id)sharedCoordinator_sharedInstance;
}

void __47__SFBookmarksLockCoordinator_sharedCoordinator__block_invoke()
{
  SFBookmarksLockCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(SFBookmarksLockCoordinator);
  v1 = (void *)sharedCoordinator_sharedInstance;
  sharedCoordinator_sharedInstance = (uint64_t)v0;

}

- (SFBookmarksLockCoordinator)init
{
  SFBookmarksLockCoordinator *v2;
  void *v3;
  SFBookmarksLockCoordinator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFBookmarksLockCoordinator;
  v2 = -[SFBookmarksLockCoordinator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__willResignActive, *MEMORY[0x1E0DC4868], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__didBecomeActive, *MEMORY[0x1E0DC4750], 0);
    v2->_needsBookmarksLockOnAppResume = 0;
    v4 = v2;

  }
  return v2;
}

- (void)_willResignActive
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B7B2000, v3, OS_LOG_TYPE_INFO, "Application will resign active, unlocking bookmarks if needed", v4, 2u);
  }
  self->_needsBookmarksLockOnAppResume = self->_haveBookmarksLock;
  -[SFBookmarksLockCoordinator unlockBookmarksIfNeeded](self, "unlockBookmarksIfNeeded");
}

- (void)_didBecomeActive
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B7B2000, v3, OS_LOG_TYPE_INFO, "Application did become active, locking bookmarks if needed", v4, 2u);
  }
  if (self->_needsBookmarksLockOnAppResume)
    -[SFBookmarksLockCoordinator lockBookmarks](self, "lockBookmarks");
  self->_needsBookmarksLockOnAppResume = 0;
}

- (BOOL)hasBookmarksLock
{
  return self->_haveBookmarksLock;
}

- (BOOL)lockBookmarks
{
  BOOL result;
  NSObject *v4;
  uint8_t v5[16];

  -[SFBookmarksLockCoordinator _clearBookmarkLockTimer](self, "_clearBookmarkLockTimer");
  if (self->_haveBookmarksLock)
    return 1;
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18B7B2000, v4, OS_LOG_TYPE_INFO, "Lock coordinator locking bookmarks", v5, 2u);
  }
  result = objc_msgSend(MEMORY[0x1E0DCCBA0], "lockSync");
  self->_haveBookmarksLock = result;
  return result;
}

- (void)unlockBookmarksSoon
{
  NSTimer *v3;
  NSTimer *bookmarkLockTimer;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__unlockBookmarksNow, 0, 0, 10.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  bookmarkLockTimer = self->_bookmarkLockTimer;
  self->_bookmarkLockTimer = v3;

}

- (void)unlockBookmarksIfNeeded
{
  if (self->_haveBookmarksLock)
    -[SFBookmarksLockCoordinator _unlockBookmarksNow](self, "_unlockBookmarksNow");
}

- (void)_unlockBookmarksNow
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B7B2000, v3, OS_LOG_TYPE_INFO, "Lock coordinator unlocking bookmarks", v4, 2u);
  }
  -[SFBookmarksLockCoordinator _clearBookmarkLockTimer](self, "_clearBookmarkLockTimer");
  objc_msgSend(MEMORY[0x1E0DCCBA0], "unlockSync");
  self->_haveBookmarksLock = 0;
}

- (void)_clearBookmarkLockTimer
{
  NSTimer *bookmarkLockTimer;

  -[NSTimer invalidate](self->_bookmarkLockTimer, "invalidate");
  bookmarkLockTimer = self->_bookmarkLockTimer;
  self->_bookmarkLockTimer = 0;

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFBookmarksLockCoordinator;
  -[SFBookmarksLockCoordinator dealloc](&v2, sel_dealloc);
}

+ (void)showLockedDatabaseAlertForAction:(int64_t)a3 fromViewController:(id)a4
{
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
  id v15;

  v15 = a4;
  if ((unint64_t)a3 > 1)
  {
    v5 = 0;
  }
  else
  {
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  objc_msgSend(v15, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)*MEMORY[0x1E0DC4730];
  objc_msgSend(v11, "_eventRoutingScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_cancelAllEventsOfType:onEventRoutingScene:", 3, v13);

  objc_msgSend(v11, "rootViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkLockTimer, 0);
}

@end
