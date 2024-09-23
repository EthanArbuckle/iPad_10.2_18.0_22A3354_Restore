@implementation CFPrefsDaemon

uint64_t __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    if (!*(_QWORD *)(a1 + 48)
      || (result = CFEqual((CFTypeRef)objc_msgSend(a2, "domain"), *(CFTypeRef *)(a1 + 48)), (_DWORD)result))
    {
      result = (uint64_t)CFRetain(a2);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
                + 8 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++) = result;
    }
  }
  return result;
}

uint64_t __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a2, "observingConnectionWasInvalidated:", *(_QWORD *)(a1 + 32));
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "removeObservingConnection:daemon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

BOOL __49__CFPrefsDaemon_handleMultiMessage_replyHandler___block_invoke(int a1, int a2, id a3)
{
  Class Class;

  Class = object_getClass(a3);
  return Class == (Class)MEMORY[0x1E0C812F8] || Class == (Class)MEMORY[0x1E0C81350];
}

+ (BOOL)_getUncanonicalizedSourcePath:(__CFString *)a3 withDomain:(const __CFString *)a4 user:(int)a5 byHost:(const __CFString *)a6 containerPath:(int)a7 managed:(int)a8 managedUsesContainer:
{
  _BOOL8 PathForManagedBundleID;
  size_t v16;
  size_t v17;

  objc_opt_self();
  if (a7)
    PathForManagedBundleID = _CFPrefsGetPathForManagedBundleID(a3, a4, a8, a2);
  else
    PathForManagedBundleID = _CFPrefsGetPathForTriplet(a3, a4, a5, a6, a2);
  if (!strncmp("/private/var/empty", (const char *)a2, 0x12uLL) || !strncmp("/var/empty", (const char *)a2, 0xAuLL))
  {
    v16 = strlen((const char *)a2);
    bzero(a2, v16);
    PathForManagedBundleID = 0;
  }
  if (!strncmp((const char *)a2, "/private", 8uLL))
  {
    v17 = strlen((const char *)a2);
    memmove(a2, a2 + 8, v17 - 7);
  }
  return PathForManagedBundleID;
}

- (uint64_t)_setSource:(int)a3 isDead:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    v5 = result;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(result + 48));
    result = objc_msgSend(a2, "managed");
    if ((_DWORD)result)
    {
      result = objc_msgSend(a2, "shmemIndex");
      v6 = *(_QWORD *)(v5 + 56 + 8 * (result >> 6));
      v7 = v6 | (1 << result);
      v8 = v6 & ~(1 << result);
      if (a3)
        v8 = v7;
      *(_QWORD *)(v5 + 56 + 8 * (result >> 6)) = v8;
    }
  }
  return result;
}

- (void)handleSourceMessage:(uint64_t)a3 replyHandler:
{
  CFStringRef v6;
  __CFString *FixedUpDomainForMessage;
  _xpc_connection_s *remote_connection;
  _xpc_connection_s *value;
  uint64_t v10;
  uint64_t v11;
  _xpc_connection_s *v12;
  _xpc_connection_s *Class;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _xpc_connection_s *v17;
  _xpc_connection_s *v18;
  uint64_t v19;
  uint64_t v20;
  xpc_object_t v21;
  const __CFString *v22;
  int v23;
  BOOL v24;
  const char *string;
  xpc_object_t v26;
  xpc_object_t v27;
  NSObject *v28;
  int v29;
  CFStringRef v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  uint64_t v37;
  xpc_object_t v38;
  void *v39;
  xpc_object_t ErrorReply;
  void *v41;
  void *v42;
  _BOOL4 v43;
  _BOOL4 v44;
  uint64_t v45;
  _BOOL4 v46;
  _BOOL4 v47;
  _QWORD v48[6];
  _QWORD v49[8];
  _QWORD v50[6];
  _QWORD applier[6];
  const char *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint8_t buf[16];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  _CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded(a2);
  xpc_retain(a2);
  v53 = 0;
  v6 = _CFPrefsCopyFixedUpUserForMessage(a2, (BOOL *)&v53 + 1, &v53);
  if (xpc_user_sessions_enabled()
    && !xpc_user_sessions_get_session_uid()
    && !(_BYTE)v53
    && !CFEqual(v6, CFSTR("kCFPreferencesAnyUser")))
  {
    ErrorReply = createErrorReply("Access to user preferences from system session not allowed", a2);
    (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, ErrorReply);
    xpc_release(ErrorReply);
    CFRelease(v6);
    return;
  }
  v52 = 0;
  v46 = xpc_dictionary_get_BOOL(a2, "CFPreferencesIsByHost");
  FixedUpDomainForMessage = (__CFString *)_CFPrefsGetFixedUpDomainForMessage(a2, v6, v46, &v52);
  if (FixedUpDomainForMessage)
  {
    xpc_dictionary_set_value(a2, "AllowWritingSpecialKeysToGlobalPreferences", 0);
    if (FixedUpDomainForMessage == CFSTR("kCFPreferencesAnyApplication") && eduModeEnabled())
    {
      remote_connection = xpc_dictionary_get_remote_connection(a2);
      if (!remote_connection)
      {
        value = (_xpc_connection_s *)xpc_dictionary_get_value(a2, "connection");
        remote_connection = value;
        if (!value || (value = object_getClass(value), value != (_xpc_connection_s *)MEMORY[0x1E0C812E0]))
          -[CFPrefsDaemon handleSourceMessage:replyHandler:].cold.1((uint64_t)value, v10, v11);
      }
      if (xpc_connection_get_euid(remote_connection) == 502
        && _CFPrefsBooleanEntitlementValueForMessage(a2, (uint64_t)"com.apple.private.defaults-shared-ipad-loginui"))
      {
        xpc_dictionary_set_value(a2, "AllowWritingSpecialKeysToGlobalPreferences", MEMORY[0x1E0C81240]);
      }
    }
    v47 = xpc_dictionary_get_BOOL(a2, "CFPreferencesIsManaged");
    v12 = xpc_dictionary_get_remote_connection(a2);
    if (!v12)
    {
      Class = (_xpc_connection_s *)xpc_dictionary_get_value(a2, "connection");
      v12 = Class;
      if (!Class || (Class = object_getClass(Class), Class != (_xpc_connection_s *)MEMORY[0x1E0C812E0]))
        -[CFPrefsDaemon handleSourceMessage:replyHandler:].cold.2((uint64_t)Class, v14, v15);
    }
    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 1;
    v54 = MEMORY[0x1E0C809B0];
    v55 = 3221225472;
    v56 = (uint64_t)___CFPrefsMessageSenderIsSandboxed_block_invoke_0;
    v57 = (void (*)(uint64_t, uint64_t))&unk_1E1336848;
    v58 = (void (*)(uint64_t))a2;
    v59 = &v60;
    withClientContext(v12, (uint64_t)&v54);
    v16 = *((unsigned __int8 *)v61 + 24);
    _Block_object_dispose(&v60, 8);
    v43 = xpc_dictionary_get_BOOL(a2, "CFPreferencesCurrentApplicationDomain");
    if (v47)
    {
      if (handleSourceMessage_replyHandler__onceToken != -1)
        dispatch_once(&handleSourceMessage_replyHandler__onceToken, &__block_literal_global_62);
      if (handleSourceMessage_replyHandler__enableContainerizedManagedPrefs == 1)
      {
        v17 = xpc_dictionary_get_remote_connection(a2);
        if (!v17)
        {
          v18 = (_xpc_connection_s *)xpc_dictionary_get_value(a2, "connection");
          v17 = v18;
          if (!v18 || (v18 = object_getClass(v18), v18 != (_xpc_connection_s *)MEMORY[0x1E0C812E0]))
            -[CFPrefsDaemon handleSourceMessage:replyHandler:].cold.3((uint64_t)v18, v19, v20);
        }
        v60 = 0;
        v61 = &v60;
        v62 = 0x2020000000;
        v63 = 0;
        v54 = MEMORY[0x1E0C809B0];
        v55 = 3221225472;
        v56 = (uint64_t)___CFPrefsIsConnectionPlatformBinary_block_invoke;
        v57 = (void (*)(uint64_t, uint64_t))&unk_1E1336D60;
        v58 = (void (*)(uint64_t))v17;
        v59 = &v60;
        withClientContext(v17, (uint64_t)&v54);
        v44 = *((_BYTE *)v61 + 24) == 0;
        _Block_object_dispose(&v60, 8);
      }
      else
      {
        v44 = 0;
      }
      xpc_dictionary_set_value(a2, "CFPreferencesHasFixedUpContainer", 0);
      v23 = 0;
      v22 = 0;
      if (!v16)
        goto LABEL_38;
    }
    else
    {
      xpc_dictionary_set_value(a2, "CFPreferencesHasFixedUpContainer", 0);
      v22 = _CFPrefsCopyFixedUpContainerForMessage(a2, (uint64_t)FixedUpDomainForMessage, (uint64_t)v52, HIBYTE(v53), v16 != 0);
      if (v22)
      {
        xpc_dictionary_set_BOOL(a2, "CFPreferencesHasFixedUpContainer", 1);
        v44 = 0;
        v23 = 1;
        if (!v16)
          goto LABEL_38;
      }
      else
      {
        v23 = 0;
        v44 = 0;
        if (!v16)
          goto LABEL_38;
      }
    }
    if (_CFPrefsSandboxCheckForMessage_0(a2))
    {
      v24 = 0;
      goto LABEL_39;
    }
LABEL_38:
    v24 = xpc_dictionary_get_string(a2, "Key") == 0;
LABEL_39:
    v45 = a3;
    v54 = 0;
    v55 = (uint64_t)&v54;
    v56 = 0x3052000000;
    v57 = __Block_byref_object_copy__5;
    v58 = __Block_byref_object_dispose__5;
    v59 = 0;
    string = xpc_dictionary_get_string(a2, "CFPreferencesCloudConfig");
    v26 = xpc_dictionary_get_value(a2, "CFPreferencesCloudStoreIdentifier");
    v27 = v26;
    if (v26)
    {
      if (object_getClass(v26) != (Class)MEMORY[0x1E0C81390])
      {
        v28 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = _CFPrefsPIDForMessage(a2);
          -[CFPrefsDaemon handleSourceMessage:replyHandler:].cold.4(buf, v29, v28);
        }
        goto LABEL_64;
      }
      if (string)
      {
        xpc_retain(v27);
LABEL_47:
        v30 = CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, string, 0x8000100u);
        if (v24
          || _CFPrefsBooleanEntitlementValueForMessage(a2, (uint64_t)"com.apple.private.trust-defaults-kvstore-identifier"))
        {
          *(_QWORD *)(v55 + 40) = v27;
        }
        else if (v43)
        {
          v41 = (void *)_CFPrefsCopyEntitlementForMessage(a2, (uint64_t)"com.apple.developer.ubiquity-kvstore-identifier");
          v42 = v41;
          if (v41)
          {
            if (object_getClass(v41) == (Class)MEMORY[0x1E0C81390] && xpc_equal(v27, v42))
              *(_QWORD *)(v55 + 40) = v27;
            xpc_release(v42);
          }
        }
        if (!*(_QWORD *)(v55 + 40))
        {
          v31 = (void *)_CFPrefsCopyEntitlementForMessage(a2, (uint64_t)"com.apple.private.ubiquity-kvstore-access");
          v32 = v31;
          if (v31)
          {
            if (object_getClass(v31) == (Class)MEMORY[0x1E0C812C8])
            {
              applier[0] = MEMORY[0x1E0C809B0];
              applier[1] = 3221225472;
              applier[2] = __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_71;
              applier[3] = &unk_1E1336A18;
              applier[4] = v27;
              applier[5] = &v54;
              xpc_array_apply(v32, applier);
            }
            xpc_release(v32);
          }
        }
        if (!*(_QWORD *)(v55 + 40))
        {
          v33 = (void *)_CFPrefsCopyEntitlementForMessage(a2, (uint64_t)"com.apple.private.ubiquity-additional-kvstore-identifiers");
          v34 = v33;
          if (v33)
          {
            if (object_getClass(v33) == (Class)MEMORY[0x1E0C812C8])
            {
              v50[0] = MEMORY[0x1E0C809B0];
              v50[1] = 3221225472;
              v50[2] = __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_2;
              v50[3] = &unk_1E1336A18;
              v50[4] = v27;
              v50[5] = &v54;
              xpc_array_apply(v34, v50);
            }
            xpc_release(v34);
          }
        }
        v35 = *(void **)(v55 + 40);
        if (v35)
          xpc_retain(v35);
        if (v27)
          xpc_release(v27);
LABEL_65:
        v36 = v23 ^ 1;
        if (HIBYTE(v53))
          v36 = 1;
        if ((v36 & 1) != 0 || CFStringHasPrefix(v22, CFSTR("/private/var/containers/Shared/SystemGroup/")))
        {
          v37 = *(_QWORD *)(v55 + 40);
          if (!string || v37)
          {
            v60 = 0;
            v61 = &v60;
            v62 = 0x2020000000;
            v63 = 0;
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_3;
            v49[3] = &unk_1E1336A40;
            v49[6] = v45;
            v49[7] = &v60;
            v49[4] = a2;
            v49[5] = a1;
            v48[0] = MEMORY[0x1E0C809B0];
            v48[1] = 3221225472;
            v48[2] = __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_4;
            v48[3] = &unk_1E1336A68;
            v48[4] = a2;
            v48[5] = &v60;
            -[CFPrefsDaemon withSourceForDomain:inContainer:user:byHost:managed:managedUsesContainer:cloudStoreEntitlement:cloudConfigurationPath:performWithSourceLock:afterReleasingSourceLock:](a1, FixedUpDomainForMessage, v22, v6, v46, v47, v44, v37, v30, (uint64_t)v49, (uint64_t)v48);
            _Block_object_dispose(&v60, 8);
LABEL_75:
            v39 = *(void **)(v55 + 40);
            if (v39)
              xpc_release(v39);
            if (v23)
              CFRelease(v22);
            if (v30)
              CFRelease(v30);
            if (v6)
              CFRelease(v6);
            _Block_object_dispose(&v54, 8);
            return;
          }
          v38 = createErrorReply("'com.apple.developer.ubiquity-kvstore-identifier' entitlement needed to use cloud preferences", a2);
          (*(void (**)(uint64_t, xpc_object_t))(v45 + 16))(v45, v38);
        }
        else
        {
          v38 = createErrorReply("Using kCFPreferencesAnyUser with a container is only allowed for System Containers", a2);
          (*(void (**)(uint64_t, xpc_object_t))(v45 + 16))(v45, v38);
        }
        xpc_release(v38);
        xpc_release(a2);
        goto LABEL_75;
      }
    }
    else if (string)
    {
      v27 = xpc_string_create(v52);
      goto LABEL_47;
    }
LABEL_64:
    v30 = 0;
    goto LABEL_65;
  }
  if (v6)
    CFRelease(v6);
  v21 = createErrorReply("Domain not found", a2);
  (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, v21);
  xpc_release(v21);
  xpc_release(a2);
}

- (void)withSourceForDomain:(const __CFString *)a3 inContainer:(const __CFString *)a4 user:(int)a5 byHost:(int)a6 managed:(int)a7 managedUsesContainer:(uint64_t)a8 cloudStoreEntitlement:(const void *)a9 cloudConfigurationPath:(uint64_t)a10 performWithSourceLock:(uint64_t)a11 afterReleasingSourceLock:
{
  CFPDSourceLookUpKey *v18;
  CFStringRef v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[7];
  _QWORD v25[12];
  char v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a7 && (a6 & 1) == 0)
      -[CFPrefsDaemon withSourceForDomain:inContainer:user:byHost:managed:managedUsesContainer:cloudStoreEntitlement:cloudConfigurationPath:performWithSourceLock:afterReleasingSourceLock:].cold.1();
    v18 = 0;
    if (a2 && a4)
    {
      v23 = a8;
      if (-[CFPrefsDaemon shmem](a1))
      {
        v19 = +[CFPrefsDaemon _copyUncanonicalizedSourcePathWithDomain:user:byHost:containerPath:managed:managedUsesContainer:]((uint64_t)CFPrefsDaemon, a2, a4, a5, a3, a6, a7);
        v18 = objc_alloc_init(CFPDSourceLookUpKey);
        if (a9)
          v20 = (__CFString *)CFRetain(a9);
        else
          v20 = 0;
        v18->cloudPath = v20;
        if (v19)
        {
          v18->uncanonicalizedPath = (__CFString *)CFRetain(v19);
          CFRelease(v19);
        }
        else
        {
          v18->uncanonicalizedPath = 0;
        }
      }
      else
      {
        v18 = 0;
      }
      a8 = v23;
    }
    v29 = 0;
    v30 = &v29;
    v31 = 0x3052000000;
    v32 = __Block_byref_object_copy__4;
    v33 = __Block_byref_object_dispose__4;
    v34 = 0;
    v21 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke;
    v25[3] = &unk_1E1336200;
    v25[8] = a2;
    v25[9] = a3;
    v26 = a5;
    v27 = a6;
    v25[10] = a4;
    v25[11] = a9;
    v25[4] = v18;
    v25[5] = a8;
    v25[6] = a1;
    v25[7] = &v29;
    v28 = a7;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke((uint64_t)v25, *(CFSetRef *)(a1 + 32), *(__CFBag **)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v22 = (void *)v30[5];
    if (v22)
    {
      v24[0] = v21;
      v24[1] = 3221225472;
      v24[2] = __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_2;
      v24[3] = &unk_1E1336250;
      v24[5] = a10;
      v24[6] = &v29;
      v24[4] = a1;
      objc_msgSend(v22, "lockedSync:", v24);
    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(a10 + 16))(a10, 0);
    }
    if (a11)
      (*(void (**)(uint64_t, uint64_t))(a11 + 16))(a11, v30[5]);

    _Block_object_dispose(&v29, 8);
  }
}

+ (CFStringRef)_copyUncanonicalizedSourcePathWithDomain:(const __CFString *)a3 user:(int)a4 byHost:(const __CFString *)a5 containerPath:(int)a6 managed:(int)a7 managedUsesContainer:
{
  CFStringEncoding v13;
  char cStr[1026];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  bzero(cStr, 0x402uLL);
  if (!+[CFPrefsDaemon _getUncanonicalizedSourcePath:withDomain:user:byHost:containerPath:managed:managedUsesContainer:]((uint64_t)CFPrefsDaemon, (UInt8 *)cStr, a2, a3, a4, a5, a6, a7))return 0;
  v13 = CFStringFileSystemEncoding();
  return CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, cStr, v13);
}

void __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_3(uint64_t a1, __CFSet *a2, uint64_t a3)
{
  uint64_t v5;
  BOOL v6;
  void *value;
  BOOL v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = CFBasicHashRemoveValue(a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v6 = v5 == 1;
  if (v5 == 1)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setUncanonicalizedPathCached:", 0);
  v8 = v6;
  value = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "processEndOfMessageIntendingToRemoveSource:replacingWithTombstone:", &v8, &value);
  if (v8)
  {
    -[CFPrefsDaemon _setSource:isDead:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 1);
    CFSetRemoveValue(a2, *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    if (value)
      CFSetAddValue(a2, value);
  }
}

void __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke(uint64_t a1, CFSetRef theSet, __CFBag *a3)
{
  const void *v4;
  void *v7;
  id v8;
  const __CFString *v9;
  uint64_t v10;
  int v11;
  int v12;
  __CFString *v13;
  uint64_t v14;
  CFHashCode v15;
  CFIndex v16;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  CFPDCloudSource *v22;
  void *v23;
  id v24;
  void *Value;

  v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = CFSetGetValue(theSet, v4);
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v7)
    {
      objc_msgSend(v7, "setUncanonicalizedPathCached:", 1);
      CFBagAddValue(a3, *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    else
    {
      v9 = *(const __CFString **)(a1 + 64);
      v10 = *(_QWORD *)(a1 + 72);
      v11 = *(unsigned __int8 *)(a1 + 96);
      v12 = *(unsigned __int8 *)(a1 + 97);
      v13 = *(__CFString **)(a1 + 80);
      v14 = *(_QWORD *)(a1 + 88);
      if (v9)
      {
        v15 = 7 * (CFHash(*(CFTypeRef *)(a1 + 64)) % 0x249);
        v16 = CFStringGetLength(v9) % 7;
      }
      else
      {
        LODWORD(v15) = 0;
        LODWORD(v16) = 0;
      }
      if ((int)v16 + (int)v15 > 4088 || (_DWORD)v16 + (_DWORD)v15 == 0)
        v18 = v16 + 1;
      else
        v18 = v16 + v15;
      if (v10)
        v19 = 6;
      else
        v19 = 5;
      if (!(v10 | v14))
      {
        v19 = CFSTR("kCFPreferencesAnyUser") == v13 ? 2 : v11 == 0;
        v20 = CFSTR("kCFPreferencesAnyUser") == v13 ? 4 : 3;
        if (v12)
          v19 = v20;
      }
      v21 = v19 + v18;
      if (*(_QWORD *)(a1 + 88))
        v22 = -[CFPDCloudSource initWithDomain:userName:storeName:configurationPath:containerPath:shmemIndex:daemon:]([CFPDCloudSource alloc], "initWithDomain:userName:storeName:configurationPath:containerPath:shmemIndex:daemon:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 72), v21, *(_QWORD *)(a1 + 48));
      else
        v22 = (CFPDCloudSource *)-[CFPrefsDaemon _createSourceWithDomain:user:container:byHost:managed:shmemIndex:](*(CFPDContainerSource **)(a1 + 48), *(const __CFString **)(a1 + 64), *(const void **)(a1 + 80), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 96), *(unsigned __int8 *)(a1 + 97), v21);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v22;
      v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (v23)
      {
        objc_msgSend(v23, "setUncanonicalizedPathCached:", 1);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setManagedPreferencesUseContainer:", *(unsigned __int8 *)(a1 + 98));
        CFSetAddValue(theSet, *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        CFBagAddValue(a3, *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        -[CFPrefsDaemon _setSource:isDead:](*(_QWORD *)(a1 + 48), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);
        v24 = -[CFPDObserverOnlyTombstone initMatchingSource:]([CFPDObserverOnlyTombstone alloc], "initMatchingSource:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        Value = (void *)CFSetGetValue(theSet, v24);

        if (Value)
        {
          objc_msgSend(Value, "transferObservingConnectionsToSource:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
          CFSetRemoveValue(theSet, Value);
        }
      }
    }

  }
}

void __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(a1[5] + 16))();
  v2 = a1[4];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_3;
  v4[3] = &unk_1E1336228;
  v3 = a1[6];
  v4[4] = v2;
  v4[5] = v3;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 48));
  __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_3((uint64_t)v4, *(__CFSet **)(v2 + 32), *(_QWORD *)(v2 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 48));
}

void __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_3(uint64_t a1, void *a2)
{
  xpc_object_t value;
  void *v5;
  xpc_object_t ErrorReply;
  xpc_object_t v7;
  const char *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  __int128 *data;
  __int128 v14;
  void *Class;
  uint64_t v16;
  uint64_t v17;
  size_t length;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "FullCloudSync"))
  {
    if (a2)
    {
      value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "CFPreferencesShmemIndex");
      if (!value
        || (v5 = value, object_getClass(value) != (Class)MEMORY[0x1E0C81328])
        || (v10 = xpc_int64_get_value(v5), v10 == -1)
        || v10 == objc_msgSend(a2, "shmemIndex"))
      {
        ErrorReply = (xpc_object_t)objc_msgSend(a2, "acceptMessage:", *(_QWORD *)(a1 + 32));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_11:
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        xpc_release(ErrorReply);
        return;
      }
      v12 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      length = 0;
      v19 = 0u;
      v20 = 0u;
      data = (__int128 *)xpc_dictionary_get_data(v12, "CFPreferencesAuditToken", &length);
      if (data && length == 32)
      {
        v14 = data[1];
        v19 = *data;
        v20 = v14;
      }
      else
      {
        if (!xpc_dictionary_get_remote_connection(v12))
        {
          Class = xpc_dictionary_get_value(v12, "connection");
          if (!Class || (Class = object_getClass(Class), Class != (void *)MEMORY[0x1E0C812E0]))
            __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_3_cold_1((uint64_t)Class, v16, v17);
        }
        xpc_connection_get_audit_token();
      }
      -[CFPrefsDaemon logDomainInconsistencyForProcess:message:source:](v11, SDWORD1(v20), *(void **)(a1 + 32), a2);
      v9 = *(void **)(a1 + 32);
      v8 = "Lookup inconsistency";
    }
    else
    {
      v8 = "Domain or user not found";
      v9 = *(void **)(a1 + 32);
    }
    ErrorReply = createErrorReply(v8, v9);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a2, "synchronizeWithCloud:replyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v7 = createErrorReply("Domain not cloud-backed", *(xpc_object_t *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    xpc_release(v7);
  }
}

void __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_4(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(a2, "cleanUpAfterAcceptingMessage:", *(_QWORD *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (uint64_t)shmem
{
  uint64_t v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (isCFPrefsD == 1)
    {
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __22__CFPrefsDaemon_shmem__block_invoke;
      v2[3] = &unk_1E12E5C68;
      v2[4] = result;
      if (shmem_onceToken != -1)
        dispatch_once(&shmem_onceToken, v2);
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)&shmem_directModeShmemLock);
      if (!*(_QWORD *)(v1 + 576))
        -[CFPrefsDaemon _initializeShmemPage:](v1, (uint64_t *)(v1 + 576));
      os_unfair_lock_unlock((os_unfair_lock_t)&shmem_directModeShmemLock);
    }
    result = *(_QWORD *)(v1 + 576);
    if (!result)
      -[CFPrefsDaemon shmem].cold.1();
  }
  return result;
}

- (uint64_t)getShmemName:(uint64_t)result bufLen:(char *)__str
{
  if (result)
  {
    if (*(_DWORD *)(result + 24) == 2)
      return snprintf(__str, 0x1FuLL, "%scfprefs.system.daemonv%d");
    else
      return snprintf(__str, 0x1FuLL, "%scfprefs.user.daemonv%d");
  }
  return result;
}

xpc_object_t __49__CFPrefsDaemon_handleMultiMessage_replyHandler___block_invoke_2(xpc_object_t result, xpc_object_t object)
{
  uint64_t v2;

  if (object)
  {
    v2 = (uint64_t)result;
    result = xpc_retain(object);
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 8 * *(int *)(v2 + 40)) = result;
  }
  return result;
}

- (CFPDContainerSource)_createSourceWithDomain:(const void *)a3 user:(uint64_t)a4 container:(uint64_t)a5 byHost:(uint64_t)a6 managed:(uint64_t)a7 shmemIndex:
{
  uint64_t v12;
  int v13;
  _BOOL4 v14;

  if (result)
  {
    v12 = (uint64_t)result;
    if (a4)
    {
      return -[CFPDContainerSource initWithDomain:userName:container:byHost:managed:shmemIndex:daemon:]([CFPDContainerSource alloc], "initWithDomain:userName:container:byHost:managed:shmemIndex:daemon:", cf1, a3, a4, a5, a6, a7, result);
    }
    else
    {
      if (CFEqual(cf1, CFSTR("kCFPreferencesAnyApplication")))
      {
        if (CFEqual(a3, CFSTR("kCFPreferencesAnyUser")))
          v13 = 0;
        else
          v13 = (a5 | a6) ^ 1;
      }
      else
      {
        v13 = 0;
      }
      v14 = (_CFPrefsCurrentProcessIsCFPrefsD() & 1) == 0 && CFStringHasSuffix(cf1, CFSTR("_TestMirror")) != 0;
      if ((v13 | v14) == 1)
        return (CFPDContainerSource *)-[CFPDMirroredSource initWithDomain:userName:byHost:managed:mirroredKeys:shmemIndex:daemon:]([CFPDMirroredSource alloc], "initWithDomain:userName:byHost:managed:mirroredKeys:shmemIndex:daemon:", cf1, a3, a5, a6, &off_1E1488D68, a7, v12);
      else
        return (CFPDContainerSource *)-[CFPDSource initWithDomain:userName:byHost:managed:shmemIndex:daemon:]([CFPDSource alloc], "initWithDomain:userName:byHost:managed:shmemIndex:daemon:", cf1, a3, a5, a6, a7, v12);
    }
  }
  return result;
}

- (uint64_t)role
{
  if (result)
    return *(unsigned int *)(result + 24);
  return result;
}

uint64_t __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_5(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 57) = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 24) = 0;
  return result;
}

- (uint64_t)_initializeShmemPage:(uint64_t)result
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  char __str[1024];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  bzero(__str, 0x400uLL);
  if (*(_DWORD *)(v3 + 24) == 2)
    snprintf(__str, 0x1FuLL, "%scfprefs.system.daemonv%d");
  else
    snprintf(__str, 0x1FuLL, "%scfprefs.user.daemonv%d");
  if ((isCFPrefsD & 1) != 0)
  {
    result = shm_open(__str, 514, 420);
  }
  else
  {
    getpid();
    result = sandbox_check();
    if ((_DWORD)result)
    {
LABEL_12:
      v5 = *a2;
LABEL_13:
      if (v5)
        return result;
      goto LABEL_14;
    }
    result = shm_open(__str, 2, 420);
  }
  if ((result & 0x80000000) != 0)
    goto LABEL_12;
  v4 = result;
  ftruncate(result, 0x4000);
  *a2 = (uint64_t)mmap(0, 0x4000uLL, 3, 1, v4, 0);
  result = close(v4);
  v5 = *a2;
  if (*a2 != -1)
    goto LABEL_13;
  *a2 = 0;
LABEL_14:
  if (isCFPrefsD == 1)
  {
    v6 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CFPrefsDaemon _initializeShmemPage:].cold.1((uint64_t)__str, v6);
  }
  result = (uint64_t)malloc_type_calloc(1uLL, 0x4000uLL, 0x100004052888210uLL);
  *a2 = result;
  return result;
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3(uint64_t a1, id a2)
{
  uint64_t v4;
  _xpc_connection_s *v5;
  const __CFSet *v6;
  void *v7;
  _xpc_connection_s *v8;
  unint64_t *context;
  uint64_t v10;
  _xpc_connection_s *v11;
  _QWORD v12[4];
  __int128 v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  if (object_getClass(a2) == (Class)MEMORY[0x1E0C812F8])
  {
    v8 = *(_xpc_connection_s **)(a1 + 32);
    if (terminating)
    {
      xpc_connection_cancel(v8);
    }
    else
    {
      context = (unint64_t *)xpc_connection_get_context(v8);
      if (!context)
        __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3_cold_1();
      v10 = atomic_load(context + 1);
      if (!v10)
        __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3_cold_2();
      v11 = *(_xpc_connection_s **)(a1 + 32);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_4;
      v19[3] = &unk_1E1336668;
      v19[4] = v11;
      -[CFPrefsDaemon handleMessage:fromPeer:replyHandler:](v10, a2, v11, (uint64_t)v19);
    }
  }
  else if (a2 == (id)MEMORY[0x1E0C81260])
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v4 = MEMORY[0x1E0C809B0];
    v5 = *(_xpc_connection_s **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_5;
    v14[3] = &unk_1E13367B0;
    v14[4] = &v15;
    withClientContext(v5, (uint64_t)v14);
    v6 = (const __CFSet *)v16[3];
    if (v6)
    {
      if (CFSetGetCount(v6) >= 1)
      {
        v7 = (void *)v16[3];
        v12[0] = v4;
        v12[1] = 3221225472;
        v12[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_6;
        v12[3] = &unk_1E13365A0;
        v13 = *(_OWORD *)(a1 + 32);
        CFSetApply(v7, (uint64_t)v12);
      }
      CFRelease((CFTypeRef)v16[3]);
    }
    _Block_object_dispose(&v15, 8);
  }
}

- (void)handleMultiMessage:(uint64_t)a3 replyHandler:
{
  int v5;
  void *value;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;
  void *v10;
  const char *v11;
  xpc_object_t ErrorReply;
  size_t count;
  uint64_t v14;
  size_t v15;
  unint64_t v16;
  uint64_t v17;
  xpc_object_t *v18;
  xpc_object_t *v19;
  size_t v20;
  uint64_t v21;
  objc_class *v22;
  xpc_object_t v23;
  int v24;
  xpc_object_t reply;
  xpc_object_t v26;
  objc_class *v27;
  CFStringRef v28;
  NSException *v29;
  uint64_t v30;
  xpc_object_t *v31;
  uint64_t v32;
  uint64_t v33;
  xpc_object_t (*v34)(xpc_object_t, xpc_object_t);
  void *v35;
  xpc_object_t *v36;
  int v37;
  size_t v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v5 = a1;
  if (!xpc_dictionary_get_remote_connection(xdict))
  {
    value = xpc_dictionary_get_value(xdict, "connection");
    if (!value || (value = object_getClass(value), value != (void *)MEMORY[0x1E0C812E0]))
      -[CFPrefsDaemon handleMultiMessage:replyHandler:].cold.1((uint64_t)value, v7, v8);
  }
  v9 = xpc_dictionary_get_value(xdict, "CFPreferencesMessages");
  if (!v9 || (v10 = v9, object_getClass(v9) != (Class)MEMORY[0x1E0C812C8]))
  {
    v11 = "There must be an array of contained messages present in multimessages";
LABEL_8:
    ErrorReply = createErrorReply(v11, xdict);
    (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, ErrorReply);
    xpc_release(ErrorReply);
    return;
  }
  if (!xpc_array_apply(v10, &__block_literal_global_91))
  {
    v11 = "Contained messages must be dictionaries or nulls in multimessages";
    goto LABEL_8;
  }
  count = xpc_array_get_count(v10);
  v15 = count;
  if (count >> 60)
  {
    v28 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), count);
    v29 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v28, 0);
    CFRelease(v28);
    objc_exception_throw(v29);
  }
  if (count <= 1)
    count = 1;
  v16 = MEMORY[0x1E0C80A78](count, v14);
  v18 = (xpc_object_t *)((char *)&v30 - v17);
  v38[0] = 0;
  if (v15 >= 0x101)
  {
    v19 = (xpc_object_t *)_CFCreateArrayStorage(v16, 0, v38);
    v30 = (uint64_t)&v30;
    v18 = v19;
    goto LABEL_18;
  }
  v19 = 0;
  if (v15)
  {
    v30 = (uint64_t)&v30;
LABEL_18:
    v20 = 0;
    v31 = v19;
    do
    {
      v18[v20] = xpc_array_get_value(v10, v20);
      ++v20;
    }
    while (v15 != v20);
    v21 = 0;
    v22 = (objc_class *)MEMORY[0x1E0C812F8];
    do
    {
      v23 = v18[v21];
      v18[v21] = 0;
      if (object_getClass(v23) == v22)
      {
        v32 = MEMORY[0x1E0C809B0];
        v33 = 3221225472;
        v34 = __49__CFPrefsDaemon_handleMultiMessage_replyHandler___block_invoke_2;
        v35 = &__block_descriptor_44_e33_v16__0__NSObject_OS_xpc_object__8l;
        v36 = v18;
        v37 = v21;
        -[CFPrefsDaemon handleMessage:fromPeer:replyHandler:](v5, v23);
      }
      if (!v18[v21])
        v18[v21] = xpc_null_create();
      ++v21;
    }
    while (v15 != v21);
    v24 = 1;
    v19 = v31;
    goto LABEL_27;
  }
  v24 = 0;
LABEL_27:
  reply = xpc_dictionary_create_reply(xdict);
  if (!reply)
    reply = xpc_dictionary_create(0, 0, 0);
  v26 = xpc_array_create(v18, v15);
  xpc_dictionary_set_value(reply, "CFPreferencesMessages", v26);
  xpc_release(v26);
  if (v24)
  {
    v27 = (objc_class *)MEMORY[0x1E0C81350];
    do
    {
      if (object_getClass(*v18) != v27)
        xpc_release(*v18);
      ++v18;
      --v15;
    }
    while (v15);
  }
  (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, reply);
  xpc_release(reply);
  free(v19);
}

- (void)handleMessage:(_xpc_connection_s *)a3 fromPeer:(uint64_t)a4 replyHandler:
{
  Class Class;
  int64_t int64;
  const __CFSet *v10;
  xpc_object_t ErrorReply;

  if (a1)
  {
    Class = object_getClass(a2);
    if (Class != (Class)MEMORY[0x1E0C81310])
    {
      if (Class != (Class)MEMORY[0x1E0C812F8])
        -[CFPrefsDaemon handleMessage:fromPeer:replyHandler:].cold.1();
      if (byte_1EDCCE37C && !xpc_dictionary_get_BOOL(a2, "PreviousMessageInjectedFailure"))
      {
        xpc_connection_cancel(a3);
      }
      else
      {
        xpc_dictionary_set_value(a2, "connection", a3);
        int64 = xpc_dictionary_get_int64(a2, "CFPreferencesOperation");
        switch(int64)
        {
          case 1:
          case 7:
          case 8:
          case 9:
            -[CFPrefsDaemon handleSourceMessage:replyHandler:](a1, a2, a4);
            break;
          case 2:
            -[CFPrefsDaemon handleAgentCheckInMessage:](a1);
            goto LABEL_13;
          case 3:
            -[CFPrefsDaemon handleFlushManagedMessage:replyHandler:](a1, a2, a4);
            break;
          case 4:
            -[CFPrefsDaemon handleFlushSourceForDomainMessage:replyHandler:](a1, a2, a4);
            break;
          case 5:
            -[CFPrefsDaemon handleMultiMessage:replyHandler:](a1, a2, a4);
            break;
          case 6:
            log_client_activity(a2, (uint64_t)"reported a user was deleted", 0);
            break;
          default:
            if (int64 == 999)
            {
              v10 = (const __CFSet *)+[_CFPrefsSynchronizer sharedInstance]();
              -[_CFPrefsSynchronizer synchronize](v10);
LABEL_13:
              (*(void (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
            }
            else
            {
              ErrorReply = createErrorReply("Unsupported CFPreferences Daemon Operation", a2);
              (*(void (**)(uint64_t, xpc_object_t))(a4 + 16))(a4, ErrorReply);
              xpc_release(ErrorReply);
            }
            break;
        }
      }
    }
  }
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_4(uint64_t a1, void *a2)
{
  if (a2)
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), a2);
}

- (void)handleFlushSourceForDomainMessage:(uint64_t)a3 replyHandler:
{
  const char *string;
  const char *v7;
  CFStringRef v8;
  const __CFString *v9;
  xpc_object_t reply;

  if (a1)
  {
    string = xpc_dictionary_get_string(xdict, "CFPreferencesDomain");
    if (string)
    {
      v7 = string;
      log_client_activity(xdict, (uint64_t)"requested flush of sources", (uint64_t)string);
      v8 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, v7, 0x8000100u, (CFAllocatorRef)&__kCFAllocatorNull);
      if (v8)
      {
        v9 = v8;
        -[CFPrefsDaemon withSnapshotOfSourcesForDomainIdentifier:performBlock:](a1, (uint64_t)v8, (uint64_t)&__block_literal_global_88);
        -[CFPrefsDaemon updateShmemForDomain:](a1, v9);
        CFRelease(v9);
      }
    }
    reply = xpc_dictionary_create_reply(xdict);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, reply);
    xpc_release(reply);
  }
}

- (void)withSnapshotOfSourcesForDomainIdentifier:(uint64_t)a3 performBlock:
{
  void *v5;
  unint64_t v6;
  int8x16_t v7;
  CFIndex (*v8)(int8x16_t *, CFSetRef);
  void *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v7.i64[0] = MEMORY[0x1E0C809B0];
    v7.i64[1] = 3221225472;
    v8 = __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke;
    v9 = &unk_1E1336188;
    v10 = &v13;
    v11 = &v17;
    v12 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke(&v7, *(CFSetRef *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v18[3], v14[3]);
    v5 = (void *)v18[3];
    if (v5)
    {
      if (v14[3])
      {
        v6 = 0;
        do
          CFRelease(*(CFTypeRef *)(v18[3] + 8 * v6++));
        while (v6 < v14[3]);
        v5 = (void *)v18[3];
      }
      free(v5);
    }
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
}

CFIndex __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke(int8x16_t *a1, CFSetRef theSet)
{
  CFIndex result;
  uint64_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = CFSetGetCount(theSet);
  *(_QWORD *)(*(_QWORD *)(a1[2].i64[0] + 8) + 24) = result;
  v5 = *(_QWORD *)(*(_QWORD *)(a1[2].i64[0] + 8) + 24);
  if (v5)
  {
    *(_QWORD *)(*(_QWORD *)(a1[2].i64[1] + 8) + 24) = malloc_type_calloc(1uLL, 8 * v5, 0x80040B8603338uLL);
    *(_QWORD *)(*(_QWORD *)(a1[2].i64[0] + 8) + 24) = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke_2;
    v6[3] = &unk_1E1336160;
    v8 = a1[3].i64[0];
    v7 = vextq_s8(a1[2], a1[2], 8uLL);
    return CFSetApply(theSet, (uint64_t)v6);
  }
  return result;
}

uint64_t __64__CFPrefsDaemon_handleFlushSourceForDomainMessage_replyHandler___block_invoke(uint64_t a1, void **a2, uint64_t a3)
{
  uint64_t v3;
  void *v5;
  uint64_t result;

  if (a3)
  {
    v3 = a3;
    do
    {
      v5 = *a2++;
      result = objc_msgSend(v5, "respondToFileWrittenToBehindOurBack");
      --v3;
    }
    while (v3);
  }
  return result;
}

- (uint64_t)updateShmemForDomain:(uint64_t)result
{
  uint64_t v3;
  CFHashCode v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;

  if (result)
  {
    result = -[CFPrefsDaemon shmem](result);
    v3 = result;
    if (a2)
    {
      v4 = 7 * (CFHash(a2) % 0x249);
      result = CFStringGetLength(a2);
      v5 = result % 7;
    }
    else
    {
      v4 = 0;
      v5 = 0;
    }
    v6 = v5 + v4;
    if ((int)v5 + (int)v4 > 4088 || (_DWORD)v6 == 0)
      v6 = v5 + 1;
    if ((unsigned __int16)v6 <= 0xFFF8u)
    {
      v8 = v6 + 7;
      v6 = (unsigned __int16)v6;
      do
      {
        v9 = (unsigned int *)(v3 + 4 * v6);
        do
          v10 = __ldaxr(v9);
        while (__stlxr(v10 + 1, v9));
        if (v10 == -1)
          atomic_store(1u, v9);
        ++v6;
      }
      while (v6 < v8);
    }
  }
  return result;
}

- (os_unfair_lock_s)initWithRole:(int)a3 testMode:
{
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v11;
  _QWORD v13[5];
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v14.receiver = a1;
  v14.super_class = (Class)CFPrefsDaemon;
  v5 = (os_unfair_lock_s *)objc_msgSendSuper2(&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    LOBYTE(v5[142]._os_unfair_lock_opaque) = a3;
    if (a3)
      os_transaction_create();
    if (!a2)
    {
      if ((isCFPrefsD & 1) == 0)
        -[CFPrefsDaemon initWithRole:testMode:].cold.1();
      if (initWithRole_testMode__onceToken != -1)
        dispatch_once(&initWithRole_testMode__onceToken, &__block_literal_global_103);
      if (initWithRole_testMode__runningInSystemContext)
        a2 = 2;
      else
        a2 = 1;
    }
    v6[6]._os_unfair_lock_opaque = a2;
    if (LOBYTE(v6[142]._os_unfair_lock_opaque))
      v7 = "com.apple.cfprefsd.daemon.system.test";
    else
      v7 = "com.apple.cfprefsd.daemon.system";
    v8 = "com.apple.cfprefsd.daemon.test";
    if (!LOBYTE(v6[142]._os_unfair_lock_opaque))
      v8 = "com.apple.cfprefsd.daemon";
    if (a2 == 2)
      v9 = v7;
    else
      v9 = v8;
    *(_QWORD *)&v6[4]._os_unfair_lock_opaque = v9;
    if (isCFPrefsD == 1)
      mach_service = xpc_connection_create_mach_service(v9, 0, 1uLL);
    else
      mach_service = xpc_connection_create(0, 0);
    v11 = mach_service;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_2;
    v13[3] = &unk_1E1336668;
    v13[4] = v6;
    xpc_connection_set_event_handler(mach_service, v13);
    v6[12]._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(v6 + 12);
    *(_QWORD *)&v6[8]._os_unfair_lock_opaque = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeSetCallBacks);
    *(_QWORD *)&v6[10]._os_unfair_lock_opaque = CFBagCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeBagCallBacks);
    os_unfair_lock_unlock(v6 + 12);
    *(_QWORD *)&v6[2]._os_unfair_lock_opaque = v11;
    xpc_connection_activate(v11);
  }
  return v6;
}

- (uint64_t)listener
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)updateShmemIndex:(uint64_t)result
{
  unsigned int *v3;
  unsigned int v4;

  if (result)
  {
    result = -[CFPrefsDaemon shmem](result);
    v3 = (unsigned int *)(result + 4 * a2);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 + 1, v3));
    if (v4 == -1)
      atomic_store(1u, v3);
  }
  return result;
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_2(uint64_t a1, _xpc_connection_s *a2)
{
  uint64_t v4;
  pid_t pid;
  NSObject *v6;
  NSObject *v7;
  _CFPrefsClientContext *v8;
  _QWORD handler[6];
  char __str[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (object_getClass(a2) == (Class)MEMORY[0x1E0C812E0])
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3;
    handler[3] = &unk_1E1336BA0;
    v4 = *(_QWORD *)(a1 + 32);
    handler[4] = a2;
    handler[5] = v4;
    xpc_connection_set_event_handler(a2, handler);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    *(_OWORD *)__str = 0u;
    v11 = 0u;
    pid = xpc_connection_get_pid(a2);
    if ((snprintf(__str, 0x80uLL, "client-%d", pid) - 1) > 0x7E)
    {
      v7 = 0;
    }
    else
    {
      v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = dispatch_queue_create(__str, v6);
    }
    xpc_connection_set_target_queue(a2, v7);

    v8 = objc_alloc_init(_CFPrefsClientContext);
    v8->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v8->_lock);
    atomic_store(*(_QWORD *)(a1 + 32), (unint64_t *)&v8->_cfprefsd);
    *(_WORD *)&v8->_sandboxed = -1;
    v8->_valid = 1;
    os_unfair_lock_unlock(&v8->_lock);
    xpc_connection_set_context(a2, v8);
    xpc_connection_set_finalizer_f(a2, (xpc_finalizer_t)client_context_finalizer);
    xpc_connection_activate(a2);
  }
}

uint64_t __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke()
{
  uint64_t result;

  result = access("/containerized_managed_preferences", 0);
  if (!(_DWORD)result)
    handleSourceMessage_replyHandler__enableContainerizedManagedPrefs = 1;
  return result;
}

- (void)synchronousWithSourceCache:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)withAllKnownManagedSources:(uint64_t)a1
{
  unint64_t v4;
  unint64_t v5;
  _QWORD v6[10];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v23 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    v24 = &v23;
    v25 = 0x22010000000;
    v26 = &unk_182F2761F;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke;
    v6[3] = &unk_1E13361D8;
    v6[6] = &v11;
    v6[7] = &v7;
    v6[8] = &v15;
    v6[9] = &v23;
    v6[4] = a1;
    v6[5] = &v19;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    __59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke(v6, *(CFSetRef *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, v20[3], v12[3], v16[3], v8[3], v24 + 4);
    if (v20[3])
    {
      if (v12[3])
      {
        v4 = 0;
        do
          CFRelease(*(CFTypeRef *)(v20[3] + 8 * v4++));
        while (v4 < v12[3]);
      }
      if (v8[3])
      {
        v5 = 0;
        do
          CFRelease(*(CFTypeRef *)(v16[3] + 8 * v5++));
        while (v5 < v8[3]);
      }
      free((void *)v20[3]);
    }
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
  }
}

void *__59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke(_QWORD *a1, CFSetRef theSet)
{
  CFIndex Count;
  CFIndex v5;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  CFIndex v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  Count = CFSetGetCount(theSet);
  if (Count >= 1)
  {
    v5 = Count;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke_2;
    v7[3] = &unk_1E13361B0;
    v8 = *(_OWORD *)(a1 + 5);
    v9 = a1[7];
    v10 = v5;
    CFSetApply(theSet, (uint64_t)v7);
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24)
                                                 + 8 * v5
                                                 - 8 * *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  }
  return memcpy((void *)(*(_QWORD *)(a1[9] + 8) + 32), (const void *)(a1[4] + 56), 0x200uLL);
}

uint64_t __59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a2, "managed"))
  {
    result = (uint64_t)CFRetain(a2);
    v5 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    v6 = *(_QWORD *)(a1[5] + 8);
    v7 = *(_QWORD *)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v7 + 1;
    *(_QWORD *)(v5 + 8 * v7) = result;
  }
  else
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(a2, "managed");
      if ((_DWORD)result)
      {
        ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
        result = (uint64_t)CFRetain(a2);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24)
                  + 8 * (a1[7] - *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))) = result;
      }
    }
  }
  return result;
}

- (void)logDomainInconsistencyForProcess:(void *)a3 message:(void *)a4 source:
{
  id v8;
  qos_class_t v9;
  NSObject *global_queue;
  _QWORD block[7];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = a4;
    xpc_retain(a3);
    v9 = qos_class_main();
    global_queue = dispatch_get_global_queue(v9, 2uLL);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke;
    block[3] = &unk_1E13369F0;
    v12 = a2;
    block[4] = a3;
    block[5] = a1;
    block[6] = a4;
    dispatch_async(global_queue, block);
  }
}

void __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke(uint64_t a1)
{
  int int64;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _QWORD v8[6];
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "CFPreferencesShmemIndex");
  v3 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_cold_1(a1, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_49;
  v8[3] = &unk_1E13369C8;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_DWORD *)(a1 + 56);
  v9 = int64;
  v10 = v6;
  v7 = *(_QWORD *)(a1 + 32);
  v8[4] = v5;
  v8[5] = v7;
  -[CFPrefsDaemon synchronousWithSourceCache:](v4, (uint64_t)v8);
}

void __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_49(uint64_t a1, CFSetRef theSet)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  const void *v6;
  const void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD context[2];
  id v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  context[0] = *(unsigned int *)(a1 + 48);
  context[1] = &v22;
  v22 = 0;
  CFSetApplyFunction(theSet, (CFSetApplierFunction)indexSearchCallback, context);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_2;
  v12[3] = &unk_1E13366E0;
  v12[4] = v22;
  v12[5] = &v17;
  objc_msgSend(v22, "lockedSync:", v12);
  v4 = *(void **)(a1 + 32);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_3;
  v11[3] = &unk_1E13366E0;
  v11[4] = v4;
  v11[5] = &v13;
  objc_msgSend(v4, "lockedSync:", v11);
  v5 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v8 = *(_DWORD *)(a1 + 52);
    v9 = v18[3];
    v10 = v14[3];
    *(_DWORD *)buf = 67240706;
    v24 = v8;
    v25 = 2114;
    v26 = v9;
    v27 = 2114;
    v28 = v10;
    _os_log_fault_impl(&dword_182A8C000, v5, OS_LOG_TYPE_FAULT, "CFPreferences detected an inconsistency. An attempt by process %{public}d to access preferences in \n%{public}@\n actually resolved to \n%{public}@\n Typically this indicates that the process's sandbox profile changed in a way that added or removed a shared-preference-* rule or changed its container path. To avoid overwriting data incorrectly, cfprefsd is disconnecting this client from this source, its preferences will not be saved to disk", buf, 0x1Cu);
  }
  v6 = (const void *)v18[3];
  if (v6)
    CFRelease(v6);
  v7 = (const void *)v14[3];
  if (v7)
    CFRelease(v7);

  xpc_release(*(xpc_object_t *)(a1 + 40));
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

uint64_t __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "debugDump");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "debugDump");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)handleFlushManagedMessage:(uint64_t)a3 replyHandler:
{
  xpc_object_t reply;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    log_client_activity(a2, (uint64_t)"requested flush of managed sources", 0);
    _CFPrefsResetManagedPreferencesStateCache();
    reply = xpc_dictionary_create_reply(a2);
    if (!reply)
      reply = xpc_dictionary_create(0, 0, 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__CFPrefsDaemon_handleFlushManagedMessage_replyHandler___block_invoke;
    v7[3] = &unk_1E1336AB8;
    v7[5] = reply;
    v7[6] = a3;
    v7[4] = a1;
    -[CFPrefsDaemon withAllKnownManagedSources:](a1, (uint64_t)v7);
  }
}

- (void)handleAgentCheckInMessage:(uint64_t)a1
{
  NSObject *v1;

  if (a1)
  {
    v1 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      -[CFPrefsDaemon handleAgentCheckInMessage:].cold.1(v1);
  }
}

- (void)handleUserDeletedMessage:(uint64_t)a1 replyHandler:(void *)a2
{
  if (a1)
    log_client_activity(a2, (uint64_t)"reported a user was deleted", 0);
}

- (void)handleSimulateTimerSynchronizeForTesting
{
  const __CFSet *v1;

  if (a1)
  {
    v1 = (const __CFSet *)+[_CFPrefsSynchronizer sharedInstance]();
    -[_CFPrefsSynchronizer synchronize](v1);
  }
}

uint64_t __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_71(uint64_t a1, int a2, id a3)
{
  uint64_t result;

  if (object_getClass(a3) != (Class)MEMORY[0x1E0C81390] || !xpc_equal(*(xpc_object_t *)(a1 + 32), a3))
    return 1;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(_QWORD *)(a1 + 32);
  return result;
}

uint64_t __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_2(uint64_t a1, int a2, id a3)
{
  uint64_t result;

  if (object_getClass(a3) != (Class)MEMORY[0x1E0C81390] || !xpc_equal(*(xpc_object_t *)(a1 + 32), a3))
    return 1;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(_QWORD *)(a1 + 32);
  return result;
}

void __56__CFPrefsDaemon_handleFlushManagedMessage_replyHandler___block_invoke(uint64_t a1, void **a2, uint64_t a3, void **a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  void *v12;
  uint64_t v13;
  unint64_t i;
  __int16 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, int);
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v10 = a3;
    do
    {
      v12 = *a2++;
      objc_msgSend(v12, "respondToFileWrittenToBehindOurBack");
      --v10;
    }
    while (v10);
  }
  v13 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __56__CFPrefsDaemon_handleFlushManagedMessage_replyHandler___block_invoke_2;
  v20 = &unk_1E1336A90;
  v21 = *(_QWORD *)(a1 + 32);
  do
  {
    for (i = *(_QWORD *)(a6 + 8 * v13); i; i &= ~(1 << v15))
    {
      v15 = __clz(__rbit64(i));
      v19((uint64_t)&v17, (__int16)((((_WORD)v13 << 6) | 1) + v15 - 1));
    }
    ++v13;
  }
  while (v13 != 64);
  for (; a5; --a5)
  {
    v16 = *a4++;
    objc_msgSend(v16, "notifyObservers", v17, v18);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

uint64_t __56__CFPrefsDaemon_handleFlushManagedMessage_replyHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;
  unsigned int *v4;
  unsigned int v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    result = -[CFPrefsDaemon shmem](result);
    v4 = (unsigned int *)(result + 4 * a2);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 + 1, v4));
    if (v5 == -1)
      atomic_store(1u, v4);
  }
  return result;
}

uint64_t __39__CFPrefsDaemon_initWithRole_testMode___block_invoke()
{
  uint64_t result;
  BOOL v1;

  result = xpc_user_sessions_enabled();
  if ((_DWORD)result)
  {
    result = xpc_user_sessions_get_session_uid();
    v1 = (_DWORD)result == 0;
  }
  else
  {
    v1 = 0;
  }
  initWithRole_testMode__runningInSystemContext = v1;
  return result;
}

- (BOOL)isInTestMode
{
  if (result)
    return *(_BYTE *)(result + 568) != 0;
  return result;
}

uint64_t __22__CFPrefsDaemon_shmem__block_invoke(uint64_t a1)
{
  return -[CFPrefsDaemon _initializeShmemPage:](*(_QWORD *)(a1 + 32), (uint64_t *)(*(_QWORD *)(a1 + 32) + 576));
}

- (uint64_t)updateEntireShmem
{
  uint64_t i;
  unsigned int *v2;
  unsigned int v3;

  if (result)
  {
    result = -[CFPrefsDaemon shmem](result);
    for (i = 1; i != 4096; ++i)
    {
      v2 = (unsigned int *)(result + 4 * i);
      do
        v3 = __ldaxr(v2);
      while (__stlxr(v3 + 1, v2));
      if (v3 == -1)
        atomic_store(1u, v2);
    }
  }
  return result;
}

- (uint64_t)userID
{
  if (a1 && (*(_DWORD *)(a1 + 24) | 2) == 3)
    return cfprefsdEuid();
  else
    return 0;
}

- (BOOL)enterSandbox
{
  return 1;
}

- (void)withSourceForDomain:inContainer:user:byHost:managed:managedUsesContainer:cloudStoreEntitlement:cloudConfigurationPath:performWithSourceLock:afterReleasingSourceLock:.cold.1()
{
  __assert_rtn("-[CFPrefsDaemon(SourceSupport) withSourceForDomain:inContainer:user:byHost:managed:managedUsesContainer:cloudStoreEntitlement:cloudConfigurationPath:performWithSourceLock:afterReleasingSourceLock:]", "CFPDSource.m", 410, "managed");
}

void __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 56);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_182A8C000, a2, OS_LOG_TYPE_FAULT, "Lookup inconsistency for request from pid %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2_16();
}

- (void)handleMessage:fromPeer:replyHandler:.cold.1()
{
  __assert_rtn("-[CFPrefsDaemon handleMessage:fromPeer:replyHandler:]", "cfprefsd.m", 700, "type == XPC_TYPE_DICTIONARY");
}

- (void)handleSourceMessage:(uint64_t)a3 replyHandler:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_33("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)handleSourceMessage:(uint64_t)a3 replyHandler:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_33("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)handleSourceMessage:(uint64_t)a3 replyHandler:.cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_33("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)handleSourceMessage:(os_log_t)log replyHandler:.cold.4(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_182A8C000, log, OS_LOG_TYPE_ERROR, "Client (%d) passed an invalid cloud store identifier value.", buf, 8u);
}

- (void)handleAgentCheckInMessage:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182A8C000, log, OS_LOG_TYPE_ERROR, "cfprefsd agents don't exist on non-macOS platforms", v1, 2u);
  OUTLINED_FUNCTION_2_16();
}

- (void)handleMultiMessage:(uint64_t)a3 replyHandler:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_33("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_33("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)initWithRole:testMode:.cold.1()
{
  __assert_rtn("-[CFPrefsDaemon initWithRole:testMode:]", "cfprefsd.m", 1331, "isCFPrefsD");
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3_cold_1()
{
  __assert_rtn("-[CFPrefsDaemon initWithRole:testMode:]_block_invoke_3", "cfprefsd.m", 1361, "ctxt");
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3_cold_2()
{
  __assert_rtn("-[CFPrefsDaemon initWithRole:testMode:]_block_invoke_3", "cfprefsd.m", 1363, "cfpd");
}

- (void)_initializeShmemPage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315138;
  v3 = a1;
  _os_log_fault_impl(&dword_182A8C000, a2, OS_LOG_TYPE_FAULT, "cfprefsd could not create a shmem named %s, cross-process preferences will not work correctly", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3_8();
}

- (void)shmem
{
  __assert_rtn("-[CFPrefsDaemon shmem]", "cfprefsd.m", 1507, "_shmem");
}

@end
