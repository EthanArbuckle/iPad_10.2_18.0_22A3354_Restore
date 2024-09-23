@implementation IMSyncedSettingsManager

- (IMSyncedSettingsManager)init
{
  IMSyncedSettingsManager *v2;
  void *v3;
  void *v4;
  IMSyncedSettingsManager_Impl *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  IMSyncedSettingsManager_Impl *impl;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMSyncedSettingsManager;
  v2 = -[IMSyncedSettingsManager init](&v11, sel_init);
  if (v2)
  {
    +[IMDaemonController sharedController](IMDaemonController, "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "multiplexedConnectionWithLabel:capabilities:context:", CFSTR("IMSyncedSettingsManager"), 0x20000000, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "connectWithCompletion:", &unk_1E471D638);
    v5 = [IMSyncedSettingsManager_Impl alloc];
    +[IMDaemonController sharedController](IMDaemonController, "sharedController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[IMSyncedSettingsManager_Impl initWithDaemonController:connection:notificationCenter:](v5, "initWithDaemonController:connection:notificationCenter:", v6, v4, v7);
    impl = v2->_impl;
    v2->_impl = (IMSyncedSettingsManager_Impl *)v8;

  }
  return v2;
}

- (id)settingValueForKey:(int64_t)a3
{
  IMSyncedSettingsManager_Impl *impl;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1A200ADB4;
  v11 = sub_1A200AC4C;
  v12 = 0;
  impl = self->_impl;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A2077948;
  v6[3] = &unk_1E471FD98;
  v6[4] = &v7;
  -[IMSyncedSettingsManager_Impl settingValueForKey:reply:](impl, "settingValueForKey:reply:", a3, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setSettingValue:(id)a3 forKey:(int64_t)a4
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_setSettingValue_forKey_);
}

- (void)addObserver:(id)a3 selector:(SEL)a4 key:(int64_t)a5
{
  -[IMSyncedSettingsManager_Impl addObserver:selector:key:](self->_impl, "addObserver:selector:key:", a3, a4, a5);
}

- (void)removeObserver:(id)a3 key:(int64_t)a4
{
  -[IMSyncedSettingsManager_Impl removeObserver:key:](self->_impl, "removeObserver:key:", a3, a4);
}

- (IMSyncedSettingsManager_Impl)impl
{
  return (IMSyncedSettingsManager_Impl *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
