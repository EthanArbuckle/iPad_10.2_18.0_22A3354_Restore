@implementation CFPDCloudSource

- (id)copyConfigurationFromPath:(uint64_t)a1
{
  uint64_t v3;
  int v4;
  id v5;
  char buffer[1026];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  bzero(buffer, 0x402uLL);
  if (!CFStringGetFileSystemRepresentation(a2, buffer, 1026))
    return 0;
  v3 = open(buffer, 256);
  if ((v3 & 0x80000000) != 0)
    return 0;
  v4 = v3;
  v5 = +[CFPDDataBuffer newBufferFromFile:allowMappingIfSafe:](CFPDDataBuffer, "newBufferFromFile:allowMappingIfSafe:", v3, 0);
  close(v4);
  return v5;
}

- (void)registerForChangeNotifications
{
  __CFSet *v2;
  NSObject *global_queue;
  int out_token;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&registerForChangeNotifications_cloudSourcesLock);
    v2 = (__CFSet *)registerForChangeNotifications_cloudSources;
    if (!registerForChangeNotifications_cloudSources)
    {
      registerForChangeNotifications_cloudSources = (uint64_t)CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeSetCallBacks);
      out_token = 0;
      global_queue = dispatch_get_global_queue(-2, 0);
      notify_register_dispatch("SYDRemotePreferencesSourceDidChangeExternally", &out_token, global_queue, &__block_literal_global_9);
      v2 = (__CFSet *)registerForChangeNotifications_cloudSources;
    }
    CFSetAddValue(v2, a1);
    os_unfair_lock_unlock((os_unfair_lock_t)&registerForChangeNotifications_cloudSourcesLock);
  }
}

void __49__CFPDCloudSource_registerForChangeNotifications__block_invoke()
{
  os_unfair_lock_lock((os_unfair_lock_t)&registerForChangeNotifications_cloudSourcesLock);
  CFSetApplyFunction((CFSetRef)registerForChangeNotifications_cloudSources, (CFSetApplierFunction)remoteStoreChanged, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)&registerForChangeNotifications_cloudSourcesLock);
}

- (CFPDCloudSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 storeName:(id)a5 configurationPath:(__CFString *)a6 containerPath:(__CFString *)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9
{
  CFPDCloudSource *v12;
  CFDataRef v13;
  __CFString *v14;
  SYDRemotePreferencesSource *cloudSource;
  id v16;
  const void *v17;
  SEL v18;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)CFPDCloudSource;
  v12 = -[CFPDContainerSource initWithDomain:userName:container:byHost:managed:shmemIndex:daemon:](&v20, sel_initWithDomain_userName_container_byHost_managed_shmemIndex_daemon_, a3, a4, a7, 0, 0, a8, a9);
  if (v12)
  {
    v13 = _CFXPCCreateCFObjectFromXPCObject((const __CFArray *)a5);
    if (a6)
      v14 = (__CFString *)CFRetain(a6);
    else
      v14 = 0;
    v12->_configurationPath = v14;
    cloudSource = (SYDRemotePreferencesSource *)objc_msgSend(objc_alloc((Class)getSYDRemotePreferencesSourceClass()), "initWithApplicationID:storeID:shared:additionalSource:containerPath:", CFSTR("NSUserDefaults"), v13, 1, 1, a7);
    v12->cloudSource = cloudSource;
    if (v13)
    {
      CFRelease(v13);
      cloudSource = v12->cloudSource;
    }
    -[SYDRemotePreferencesSource registerForSynchronizedDefaults](cloudSource, "registerForSynchronizedDefaults");
    v16 = -[CFPDCloudSource copyConfigurationFromPath:]((uint64_t)v12, a6);
    v17 = (const void *)objc_msgSend(v16, "copyPropertyListWithMutability:error:", 0, 0);

    if (v17)
    {
      if (CFGetTypeID(v17) == 18)
      {
        v18 = sel_registerName("setDefaultsConfiguration:");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[SYDRemotePreferencesSource performSelector:withObject:](v12->cloudSource, "performSelector:withObject:", v18, v17);
      }
      CFRelease(v17);
    }
    -[CFPDCloudSource registerForChangeNotifications](v12);
  }
  return v12;
}

- (uint64_t)enqueueNewKey:(uint64_t)a1 value:(const __CFArray *)a2 encoding:(xpc_object_t)xdict inBatch:(int)a4
{
  uint64_t v4;
  CFDataRef v7;
  const void *v8;
  size_t length;
  const UInt8 *bytes_ptr;
  const __CFData *v11;
  CFTypeID v12;
  CFTypeID TypeID;
  void *v14;
  NSObject *v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v4 = a1;
  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v4;
  if (a4 == 1)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 1;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__CFPDCloudSource_enqueueNewKey_value_encoding_inBatch___block_invoke;
    v17[3] = &unk_1E12E5C18;
    v17[4] = a1;
    v17[5] = &v18;
    xpc_dictionary_apply(xdict, v17);
    v4 = *((_BYTE *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
    return v4;
  }
  v7 = _CFXPCCreateCFObjectFromXPCObject(a2);
  if (object_getClass(xdict) == (Class)MEMORY[0x1E0C812E8])
  {
    length = xpc_data_get_length(xdict);
    bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(xdict);
    v11 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, bytes_ptr, length, (CFAllocatorRef)&__kCFAllocatorNull);
    v8 = CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v11, 0, 0, 0);
    CFRelease(v11);
    if (!v7)
      goto LABEL_11;
  }
  else
  {
    v8 = _CFXPCCreateCFObjectFromXPCObject((const __CFArray *)xdict);
    if (!v7)
      goto LABEL_11;
  }
  if (v8)
  {
    v12 = CFGetTypeID(v8);
    TypeID = CFNullGetTypeID();
    v14 = *(void **)(v4 + 152);
    if (v12 == TypeID)
      objc_msgSend(v14, "setValue:forKey:", 0, v7);
    else
      objc_msgSend(v14, "setValue:forKey:", v8, v7);
    objc_msgSend(*(id *)(v4 + 152), "synchronizeForced:", 0);
    objc_msgSend((id)v4, "updateShmemEntry");
    v15 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CFPDCloudSource enqueueNewKey:value:encoding:inBatch:].cold.1((uint64_t)a2, v4, v15);
    v4 = 1;
    goto LABEL_17;
  }
LABEL_11:
  v4 = 0;
  if (v7)
LABEL_17:
    CFRelease(v7);
  if (v8)
    CFRelease(v8);
  return v4;
}

uint64_t __56__CFPDCloudSource_enqueueNewKey_value_encoding_inBatch___block_invoke(uint64_t a1, char *string, void *a3)
{
  xpc_object_t v5;
  uint64_t v6;
  char v7;

  v5 = xpc_string_create(string);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    v7 = -[CFPDCloudSource enqueueNewKey:value:encoding:inBatch:](*(_QWORD *)(a1 + 32), (int)v5, a3);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    v7 = 0;
  }
  *(_BYTE *)(v6 + 24) = v7;
  xpc_release(v5);
  return 1;
}

- (id)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:(uint64_t)a1
{
  uint64_t v1;
  const void *v2;
  id v3;

  if (!a1)
    return 0;
  v1 = objc_msgSend(*(id *)(a1 + 152), "copyDictionary");
  if (!v1)
    return 0;
  v2 = (const void *)v1;
  v3 = +[CFPDDataBuffer newBufferFromPropertyList:](CFPDDataBuffer, "newBufferFromPropertyList:", v1);
  CFRelease(v2);
  return v3;
}

- (void)synchronizeWithCloud:(id)a3 replyHandler:(id)a4
{
  xpc_object_t reply;
  SYDRemotePreferencesSource *cloudSource;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  reply = xpc_dictionary_create_reply(a3);
  if (!reply)
    reply = xpc_dictionary_create(0, 0, 0);
  cloudSource = self->cloudSource;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__CFPDCloudSource_synchronizeWithCloud_replyHandler___block_invoke;
  v8[3] = &unk_1E12E5C40;
  v8[4] = reply;
  v8[5] = a4;
  -[SYDRemotePreferencesSource synchronizationWithCompletionHandler:](cloudSource, "synchronizationWithCompletionHandler:", v8);
}

void __53__CFPDCloudSource_synchronizeWithCloud_replyHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (id)copyPropertyListValidatingPlist:(BOOL)a3
{
  return -[CFPDCloudSource copyPropertyListWithoutDrainingPendingChangesValidatingPlist:]((uint64_t)self);
}

- (__CFString)debugDump
{
  return (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("\n*****************************************************\nCLOUD\nDomain: %@\nUser: %@\nContainer: %@\nplist data:%@\nshmem index:%d\ndirty:%d\n"), self->super.super._domain, self->super.super._userName, -[CFPDContainerSource container](self, "container"), self->super.super._plist, self->super.super._generationShmemIndex, (*((unsigned __int8 *)&self->super.super + 142) >> 1) & 1);
}

- (__CFString)cloudConfigurationPath
{
  return self->_configurationPath;
}

- (int)validateMessage:(id)a3 withNewKey:(id)a4 newValue:(id)a5 plistIsAvailableToRead:(BOOL)a6 containerPath:(const char *)a7 fileUID:(unsigned int)a8 mode:(unsigned __int16)a9 diagnosticMessage:(const char *)a10
{
  return 1;
}

- (id)_writeToDisk:(id *)result
{
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2)
    {
      return (id *)objc_msgSend(result[19], "synchronizeForced:", 0);
    }
    else
    {
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __32__CFPDCloudSource__writeToDisk___block_invoke;
      v2[3] = &unk_1E12E5C68;
      v2[4] = result;
      return (id *)objc_msgSend(result, "lockedAsync:", v2);
    }
  }
  return result;
}

uint64_t __32__CFPDCloudSource__writeToDisk___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "synchronizeForced:", 0);
}

- (void)processEndOfMessageIntendingToRemoveSource:(BOOL *)a3 replacingWithTombstone:(id *)a4
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *a3 = 0;
  v4.receiver = self;
  v4.super_class = (Class)CFPDCloudSource;
  -[CFPDSource processEndOfMessageIntendingToRemoveSource:replacingWithTombstone:](&v4, sel_processEndOfMessageIntendingToRemoveSource_replacingWithTombstone_);
}

- (void)enqueueNewKey:(os_log_t)log value:encoding:inBatch:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 48);
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_debug_impl(&dword_182A8C000, log, OS_LOG_TYPE_DEBUG, "writing key %{public}@ in cloud domain %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
