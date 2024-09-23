@implementation CFPrefsCloudSource

- (CFPrefsCloudSource)initWithDomain:(__CFString *)a3 user:(__CFString *)a4 byHost:(BOOL)a5 containerPath:(__CFString *)a6 containingPreferences:(id)a7
{
  CFPrefsCloudSource *result;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CFPrefsCloudSource;
  result = -[CFPrefsPlistSource initWithDomain:user:byHost:containerPath:containingPreferences:](&v8, sel_initWithDomain_user_byHost_containerPath_containingPreferences_, a3, a4, a5, a6, a7);
  if (result)
    atomic_store((unint64_t)&sentinelGeneration, (unint64_t *)&result->super.super.shmemEntry);
  return result;
}

- (id)createSynchronizeMessage
{
  id v3;
  void *v4;
  const char *configPath;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CFPrefsCloudSource;
  v3 = -[CFPrefsPlistSource createSynchronizeMessage](&v7, sel_createSynchronizeMessage);
  v4 = v3;
  if (v3)
  {
    configPath = self->_configPath;
    if (configPath)
    {
      xpc_dictionary_set_string(v3, "CFPreferencesCloudConfig", configPath);
      xpc_dictionary_set_string(v4, "CFPreferencesCloudStoreIdentifier", self->_storeName);
    }
  }
  return v4;
}

- (int)alreadylocked_updateObservingRemoteChanges
{
  unsigned __int8 v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = atomic_load((unsigned __int8 *)&self->super._volatile);
  if ((v2 & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CFPrefsCloudSource;
  return -[CFPrefsPlistSource alreadylocked_updateObservingRemoteChanges](&v4, sel_alreadylocked_updateObservingRemoteChanges);
}

- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3
{
  int v5;
  _CFXPreferences *containingPreferences;
  __CFString *v7;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&self->super.super._lock);
  if (-[CFPrefsPlistSource isDirectModeEnabled](self, "isDirectModeEnabled"))
  {
    v5 = 3;
  }
  else
  {
    v5 = 1;
    if (xpc_user_sessions_enabled())
    {
      if (CFEqual(CFSTR("kCFPreferencesAnyUser"), -[CFPrefsPlistSource userIdentifier](self, "userIdentifier")))
        v5 = 2;
      else
        v5 = 1;
    }
  }
  containingPreferences = self->super.super._containingPreferences;
  v7 = -[CFPrefsPlistSource userIdentifier](self, "userIdentifier");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CFPrefsCloudSource_fullCloudSynchronizeWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E13344F8;
  v8[4] = self;
  v8[5] = a3;
  -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](&containingPreferences->super.isa, v5, v7, (uint64_t)v8);
}

void __64__CFPrefsCloudSource_fullCloudSynchronizeWithCompletionHandler___block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
  os_unfair_lock_s *v3;
  void *v5;
  void *v6;
  qos_class_t v7;
  NSObject *global_queue;
  os_unfair_lock_s *v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v3 = *(os_unfair_lock_s **)(a1 + 32);
  if (a2)
  {
    v5 = (void *)-[os_unfair_lock_s createSynchronizeMessage](v3, "createSynchronizeMessage");
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_BOOL(v5, "FullCloudSync", 1);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 52));
      v7 = qos_class_self();
      global_queue = dispatch_get_global_queue(v7, 0);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __64__CFPrefsCloudSource_fullCloudSynchronizeWithCompletionHandler___block_invoke_2;
      v10[3] = &unk_1E13344D0;
      v10[4] = *(_QWORD *)(a1 + 40);
      xpc_connection_send_message_with_reply(a2, v6, global_queue, v10);
      xpc_release(v6);
      return;
    }
    v9 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 52);
  }
  else
  {
    v9 = v3 + 13;
  }
  os_unfair_lock_unlock(v9);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
}

void __64__CFPrefsCloudSource_fullCloudSynchronizeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  CFDictionaryRef v2;

  v2 = CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, 0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRelease(v2);
}

- (void)mergeIntoDictionary:(__CFDictionary *)a3 sourceDictionary:(__CFDictionary *)a4 cloudKeyEvaluator:(id)a5
{
  __CFDictionary *v9;
  _QWORD context[9];

  context[8] = *MEMORY[0x1E0C80C00];
  if (self->_enabled)
  {
    os_unfair_lock_lock(&self->super.super._lock);
    v9 = -[CFPrefsPlistSource alreadylocked_copyDictionary](self, "alreadylocked_copyDictionary");
    os_unfair_lock_unlock(&self->super.super._lock);
    if (v9)
    {
      context[0] = MEMORY[0x1E0C809B0];
      context[1] = 3221225472;
      context[2] = __77__CFPrefsCloudSource_mergeIntoDictionary_sourceDictionary_cloudKeyEvaluator___block_invoke;
      context[3] = &unk_1E1334520;
      context[6] = a3;
      context[7] = a4;
      context[4] = self;
      context[5] = a5;
      _CFPrefsDictionaryApplyBlock(v9, context);
      CFRelease(v9);
    }
  }
}

void __77__CFPrefsCloudSource_mergeIntoDictionary_sourceDictionary_cloudKeyEvaluator___block_invoke(uint64_t a1, const void *a2, const void *a3)
{
  __CFDictionary *v6;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 48), a2, a3);
    v6 = *(__CFDictionary **)(a1 + 56);
    if (v6)
      CFDictionaryAddValue(v6, a2, *(const void **)(a1 + 32));
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t *p_shmemEntry;
  id v6;
  void *v7;
  _CFXPreferences *containingPreferences;
  int v9;
  __CFString *v10;
  _QWORD v11[6];
  int v12;
  int v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&self->super.super._lock);
  atomic_store(!v3, (unsigned __int8 *)&self->super._volatile);
  self->_enabled = v3;
  p_shmemEntry = (unint64_t *)&self->super.super.shmemEntry;
  if (!v3)
  {
    atomic_store((unint64_t)&sentinelGeneration, p_shmemEntry);
  }
  else
  {
    atomic_store(0, p_shmemEntry);
    v13 = 0;
    v6 = -[CFPrefsPlistSource alreadylocked_createObserverUpdateMessageWithOperation:forRole:](self, "alreadylocked_createObserverUpdateMessageWithOperation:forRole:", -[CFPrefsCloudSource alreadylocked_updateObservingRemoteChanges](self, "alreadylocked_updateObservingRemoteChanges"), &v13);
    if (v6)
    {
      v7 = v6;
      containingPreferences = self->super.super._containingPreferences;
      v9 = v13;
      v10 = -[CFPrefsPlistSource userIdentifier](self, "userIdentifier");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __33__CFPrefsCloudSource_setEnabled___block_invoke;
      v11[3] = &unk_1E1334570;
      v12 = v13;
      v11[4] = self;
      v11[5] = v7;
      -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](&containingPreferences->super.isa, v9, v10, (uint64_t)v11);
      xpc_release(v7);
    }
  }
  os_unfair_lock_unlock(&self->super.super._lock);
}

void __33__CFPrefsCloudSource_setEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  const os_unfair_lock *v7;
  _QWORD v8[6];
  os_activity_scope_state_s state;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = _os_activity_create(&dword_182A8C000, "Updating Key-Value Observers Of Preferences", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v5 = *(_DWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(const os_unfair_lock **)(*(_QWORD *)(a1 + 32) + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __33__CFPrefsCloudSource_setEnabled___block_invoke_2;
    v8[3] = &unk_1E1334548;
    v8[4] = a2;
    v8[5] = v6;
    if (v5 == 1)
    {
      CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(v7, (uint64_t)v8);
    }
    else if (v5 == 3)
    {
      CFPREFERENCES_IS_WAITING_FOR_DIRECT_CFPREFSD(v7, (uint64_t)v8);
    }
    else
    {
      CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v7, (uint64_t)v8);
    }

    os_activity_scope_leave(&state);
  }
}

void __33__CFPrefsCloudSource_setEnabled___block_invoke_2(uint64_t a1)
{
  xpc_object_t v1;

  v1 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  if (v1)
    xpc_release(v1);
}

- (void)setConfigurationPath:(__CFString *)a3
{
  char *configPath;
  char buffer[1026];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&self->super.super._lock);
  configPath = (char *)self->_configPath;
  if (configPath)
    free(configPath);
  bzero(buffer, 0x402uLL);
  if (a3 && CFStringGetCString(a3, buffer, 1026, 0x8000100u))
    self->_configPath = strdup(buffer);
  os_unfair_lock_unlock(&self->super.super._lock);
}

- (void)setStoreName:(__CFString *)a3
{
  char *storeName;
  char buffer[1026];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&self->super.super._lock);
  storeName = (char *)self->_storeName;
  if (storeName)
    free(storeName);
  bzero(buffer, 0x402uLL);
  if (a3 && CFStringGetCString(a3, buffer, 1026, 0x8000100u))
    self->_storeName = strdup(buffer);
  os_unfair_lock_unlock(&self->super.super._lock);
}

- (void)dealloc
{
  char *storeName;
  char *configPath;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  storeName = (char *)self->_storeName;
  if (storeName)
    free(storeName);
  configPath = (char *)self->_configPath;
  if (configPath)
    free(configPath);
  v5.receiver = self;
  v5.super_class = (Class)CFPrefsCloudSource;
  -[CFPrefsPlistSource dealloc](&v5, sel_dealloc);
}

@end
