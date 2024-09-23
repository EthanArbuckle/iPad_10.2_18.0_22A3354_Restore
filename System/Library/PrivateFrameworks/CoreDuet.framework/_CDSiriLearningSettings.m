@implementation _CDSiriLearningSettings

- (NSArray)allLearningDisabledBundleIDs
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  v13 = 0;
  if (self && self->_hasPrefsAccess)
  {
    -[_CDSiriLearningSettings notificationQueue](self);
    v3 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55___CDSiriLearningSettings_allLearningDisabledBundleIDs__block_invoke;
    v7[3] = &unk_1E26E2E78;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v3, v7);

    v4 = (void *)v9[5];
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___CDSiriLearningSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (id)sharedInstance_manager;
}

- (id)_unsafe_allLearningDisabledBundleIDs
{
  NSObject *v2;
  void *v3;

  if (a1)
  {
    -[_CDSiriLearningSettings notificationQueue]((id)a1);
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    v3 = (void *)objc_msgSend(*(id *)(a1 + 24), "copy");
    if (!v3)
    {
      +[_CDSiriLearningSettings uncachedAllLearningDisabledBundleIDs]();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)(a1 + 12) != -1)
        objc_storeStrong((id *)(a1 + 24), v3);
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)notificationQueue
{
  if (a1)
  {
    if (notificationQueue_onceToken != -1)
      dispatch_once(&notificationQueue_onceToken, &__block_literal_global_36);
    a1 = (id)notificationQueue_queue;
  }
  return a1;
}

+ (CFPropertyListRef)uncachedAllLearningDisabledBundleIDs
{
  objc_opt_self();
  return (id)CFPreferencesCopyAppValue(CFSTR("SiriCanLearnFromAppBlacklist"), CFSTR("com.apple.suggestions"));
}

- (void)_unsafe_clearAllLearningDisabledBundleIDs
{
  NSObject *v2;
  void *v3;

  if (a1)
  {
    -[_CDSiriLearningSettings notificationQueue](a1);
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    v3 = (void *)a1[3];
    a1[3] = 0;

  }
}

- (void)setDelegates:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (BOOL)isLearningDisabledForBundleID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  v6 = 0;
  if (self && v4 && self->_hasPrefsAccess)
  {
    -[_CDSiriLearningSettings allLearningDisabledBundleIDs](self, "allLearningDisabledBundleIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsObject:", v5);

  }
  return v6;
}

- (void)_startWithCallback:(uint64_t)a1
{
  id v3;
  os_unfair_lock_s *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD handler[5];

  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v5 = *(id *)(a1 + 32);
    v6 = (void *)MEMORY[0x193FEEAF4](v3);
    objc_msgSend(v5, "addObject:", v6);

    if (*(_DWORD *)(a1 + 12) == -1)
    {
      -[_CDSiriLearningSettings notificationQueue]((id)a1);
      v7 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __46___CDSiriLearningSettings__startWithCallback___block_invoke;
      handler[3] = &unk_1E26E4758;
      handler[4] = a1;
      notify_register_dispatch("com.apple.suggestions.settingsChanged", (int *)(a1 + 12), v7, handler);

    }
    objc_msgSend((id)a1, "allLearningDisabledBundleIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v4);

  }
}

- (void)startSanitizingKnowledgeStore:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57___CDSiriLearningSettings_startSanitizingKnowledgeStore___block_invoke;
  v6[3] = &unk_1E26E4C58;
  v7 = v4;
  v5 = v4;
  -[_CDSiriLearningSettings _startWithCallback:]((uint64_t)self, v6);

}

- (void)startSanitizingInteractionStore:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59___CDSiriLearningSettings_startSanitizingInteractionStore___block_invoke;
  v6[3] = &unk_1E26E4C58;
  v7 = v4;
  v5 = v4;
  -[_CDSiriLearningSettings _startWithCallback:]((uint64_t)self, v6);

}

- (void)stopSanitizing
{
  int notifyToken;
  NSObject *v4;
  _QWORD block[5];

  if (self && self->_hasPrefsAccess)
  {
    os_unfair_lock_lock(&self->_lock);
    notifyToken = self->_notifyToken;
    if (notifyToken != -1)
    {
      notify_cancel(notifyToken);
      self->_notifyToken = -1;
      -[_CDSiriLearningSettings notificationQueue](self);
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41___CDSiriLearningSettings_stopSanitizing__block_invoke;
      block[3] = &unk_1E26E2F20;
      block[4] = self;
      dispatch_async(v4, block);

    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_allLearningDisabledBundleIDs, 0);
}

@end
