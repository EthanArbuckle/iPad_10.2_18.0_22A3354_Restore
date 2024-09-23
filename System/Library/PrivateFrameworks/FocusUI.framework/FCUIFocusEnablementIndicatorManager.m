@implementation FCUIFocusEnablementIndicatorManager

+ (id)managerWithBannerPoster:(id)a3 systemApertureElementRegistrar:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (!SBSIsSystemApertureAvailable()
    || (+[FCUIFocusEnablementIndicatorSystemApertureManager managerWithSystemApertureElementRegistrar:](FCUIFocusEnablementIndicatorSystemApertureManager, "managerWithSystemApertureElementRegistrar:", v6), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[FCUIFocusEnablementIndicatorBannerManager managerWithBannerPoster:](FCUIFocusEnablementIndicatorBannerManager, "managerWithBannerPoster:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (FCUIFocusEnablementIndicatorManager)init
{
  FCUIFocusEnablementIndicatorManager *v2;
  FCUIFocusEnablementIndicatorManager *v3;
  uint64_t v4;
  FCActivityManager *activityManager;
  NSObject *SerialWithQoS;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FCUIFocusEnablementIndicatorManager;
  v2 = -[FCUIFocusEnablementIndicatorManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lastActiveActivityLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x24BE37EB8], "sharedActivityManager");
    v4 = objc_claimAutoreleasedReturnValue();
    activityManager = v3->_activityManager;
    v3->_activityManager = (FCActivityManager *)v4;

    -[FCActivityManager addObserver:](v3->_activityManager, "addObserver:", v3);
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __43__FCUIFocusEnablementIndicatorManager_init__block_invoke;
    v8[3] = &unk_24D20A8F8;
    objc_copyWeak(&v9, &location);
    dispatch_async(SerialWithQoS, v8);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__FCUIFocusEnablementIndicatorManager_init__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v2;
  void *v3;
  os_unfair_lock_s *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (os_unfair_lock_s *)WeakRetained;
    objc_msgSend(WeakRetained[1], "activeActivity");
    v2 = objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(v4 + 6);
    v3 = *(void **)&v4[4]._os_unfair_lock_opaque;
    *(_QWORD *)&v4[4]._os_unfair_lock_opaque = v2;

    os_unfair_lock_unlock(v4 + 6);
    WeakRetained = (id *)v4;
  }

}

- (void)activeActivityDidChangeForManager:(id)a3
{
  id v4;
  FCActivityDescribing *v5;
  int v6;
  FCActivityDescribing *v7;
  const __CFString *v8;
  FCActivityDescribing *v9;
  FCActivityDescribing *lastActiveActivity;
  FCActivityDescribing *v11;

  v4 = a3;
  objc_msgSend(v4, "activeActivity");
  v5 = (FCActivityDescribing *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "shouldActivityShowStatusPill:", v5);

  os_unfair_lock_lock(&self->_lastActiveActivityLock);
  v7 = self->_lastActiveActivity;
  os_unfair_lock_unlock(&self->_lastActiveActivityLock);
  if ((-[FCUIFocusEnablementIndicatorManager shouldKeepPresentingAfterActiveActivityDidChange:lastActivity:](self, "shouldKeepPresentingAfterActiveActivityDidChange:lastActivity:", v5, v7) & 1) == 0)
  {
    if (v5)
      v8 = CFSTR("Revoking for mode change");
    else
      v8 = CFSTR("Revoking for mode end");
    -[FCUIFocusEnablementIndicatorManager revokeWithReason:](self, "revokeWithReason:", v8);
  }
  if (v6)
  {
    if (v5)
      v9 = v5;
    else
      v9 = v7;
    if (v9)
      -[FCUIFocusEnablementIndicatorManager postActivity:enabled:](self, "postActivity:enabled:");
  }
  os_unfair_lock_lock(&self->_lastActiveActivityLock);
  lastActiveActivity = self->_lastActiveActivity;
  self->_lastActiveActivity = v5;
  v11 = v5;

  os_unfair_lock_unlock(&self->_lastActiveActivityLock);
}

- (id)postPersistentActivityWithModeIdentifier:(id)a3 systemApertureElementProvider:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  -[FCActivityManager activityWithIdentifier:](self->_activityManager, "activityWithIdentifier:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  -[FCActivityManager activeActivity](self->_activityManager, "activeActivity");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = BSEqualObjects();
  if (!(v7 | v8))
  {
    -[FCActivityManager defaultActivity](self->_activityManager, "defaultActivity");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  -[FCUIFocusEnablementIndicatorManager postPersistentActivity:enabled:systemApertureElementProvider:pickerPresentation:](self, "postPersistentActivity:enabled:systemApertureElementProvider:pickerPresentation:", v7, v9, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)postPersistentActivityPickerWithSystemApertureElementProvider:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FCActivityManager activeActivity](self->_activityManager, "activeActivity");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    -[FCActivityManager defaultActivity](self->_activityManager, "defaultActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[FCUIFocusEnablementIndicatorManager postPersistentActivity:enabled:systemApertureElementProvider:pickerPresentation:](self, "postPersistentActivity:enabled:systemApertureElementProvider:pickerPresentation:", v6, v5 != 0, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldKeepPresentingAfterActiveActivityDidChange:(id)a3
{
  return 0;
}

- (id)postPersistentActivity:(id)a3 enabled:(BOOL)a4 systemApertureElementProvider:(id)a5 pickerPresentation:(BOOL)a6
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveActivity, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end
