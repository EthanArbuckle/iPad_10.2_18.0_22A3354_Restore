@implementation AVExternalStorageDevice

- (AVExternalStorageDevice)initWithExternalStorageDeviceManager:(OpaqueFigExternalStorageDeviceManager *)a3 figExternalStorageDeviceUUID:(__CFString *)a4
{
  AVExternalStorageDevice *v6;
  OpaqueFigExternalStorageDeviceManager *v7;
  __CFString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVExternalStorageDevice;
  v6 = -[AVExternalStorageDevice init](&v10, sel_init);
  if (v6)
  {
    if (a3)
      v7 = (OpaqueFigExternalStorageDeviceManager *)CFRetain(a3);
    else
      v7 = 0;
    v6->_externalStorageDeviceManager = v7;
    if (a4)
      v8 = (__CFString *)CFRetain(a4);
    else
      v8 = 0;
    v6->_figExternalStorageDeviceUUID = v8;
    v6->_nextAvailableURLArray = 0;
    v6->_baseURL = 0;
  }
  return v6;
}

- (void)dealloc
{
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  __CFString *displayName;
  __CFArray *nextAvailableURLArray;
  __CFString *uniqueIdentifier;
  __CFURL *baseURL;
  __CFString *figExternalStorageDeviceUUID;
  objc_super v9;

  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager)
  {
    CFRelease(externalStorageDeviceManager);
    self->_externalStorageDeviceManager = 0;
  }
  displayName = self->_displayName;
  if (displayName)
  {
    CFRelease(displayName);
    self->_displayName = 0;
  }
  nextAvailableURLArray = self->_nextAvailableURLArray;
  if (nextAvailableURLArray)
  {
    CFRelease(nextAvailableURLArray);
    self->_nextAvailableURLArray = 0;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    CFRelease(uniqueIdentifier);
    self->_uniqueIdentifier = 0;
  }
  baseURL = self->_baseURL;
  if (baseURL)
  {
    CFRelease(baseURL);
    self->_baseURL = 0;
  }
  figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
  if (figExternalStorageDeviceUUID)
  {
    CFRelease(figExternalStorageDeviceUUID);
    self->_figExternalStorageDeviceUUID = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)AVExternalStorageDevice;
  -[AVExternalStorageDevice dealloc](&v9, sel_dealloc);
}

- (id)figExternalStorageDeviceUUID
{
  return (id)-[__CFString copy](self->_figExternalStorageDeviceUUID, "copy");
}

- (NSString)displayName
{
  __CFString *displayName;
  id *p_displayName;
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  __CFString *figExternalStorageDeviceUUID;
  void (*v7)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, id *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_displayName = (id *)&self->_displayName;
  displayName = self->_displayName;
  if (displayName)
  {
    CFRelease(displayName);
    *p_displayName = 0;
  }
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager)
  {
    figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
    v7 = *(void (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v7)
      v7(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E0D05320], *MEMORY[0x1E0C9AE00], p_displayName);
  }
  if (dword_1EE53AAC8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (NSString *)(id)objc_msgSend(*p_displayName, "copy", v10, v11);
}

- (NSInteger)freeSize
{
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  __CFString *figExternalStorageDeviceUUID;
  uint64_t (*v4)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, CFTypeRef *);
  int v5;
  CFTypeRef v6;
  NSInteger SInt64;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef cf[25];

  cf[24] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  cf[0] = 0;
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager
    && (figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID,
        (v4 = *(uint64_t (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32)) != 0))
  {
    v5 = v4(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E0D05328], *MEMORY[0x1E0C9AE00], cf);
    v6 = cf[0];
    if (!v5)
    {
      SInt64 = FigCFNumberGetSInt64();
      v6 = cf[0];
      if (!cf[0])
        goto LABEL_7;
      goto LABEL_5;
    }
    SInt64 = -1;
    if (cf[0])
LABEL_5:
      CFRelease(v6);
  }
  else
  {
    SInt64 = -1;
  }
LABEL_7:
  if (dword_1EE53AAC8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return SInt64;
}

- (NSInteger)totalSize
{
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  __CFString *figExternalStorageDeviceUUID;
  uint64_t (*v4)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, CFTypeRef *);
  int v5;
  CFTypeRef v6;
  NSInteger SInt64;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef cf[25];

  cf[24] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  cf[0] = 0;
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager
    && (figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID,
        (v4 = *(uint64_t (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32)) != 0))
  {
    v5 = v4(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E0D05340], *MEMORY[0x1E0C9AE00], cf);
    v6 = cf[0];
    if (!v5)
    {
      SInt64 = FigCFNumberGetSInt64();
      v6 = cf[0];
      if (!cf[0])
        goto LABEL_7;
      goto LABEL_5;
    }
    SInt64 = -1;
    if (cf[0])
LABEL_5:
      CFRelease(v6);
  }
  else
  {
    SInt64 = -1;
  }
LABEL_7:
  if (dword_1EE53AAC8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return SInt64;
}

- (BOOL)isConnected
{
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  __CFString *figExternalStorageDeviceUUID;
  void (*v4)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, CFTypeRef *);
  BOOL v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef cf[23];

  cf[22] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  cf[0] = 0;
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager
    && (figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID,
        (v4 = *(void (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32)) != 0))
  {
    v4(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E0D05330], *MEMORY[0x1E0C9AE00], cf);
    v5 = cf[0] == (CFTypeRef)*MEMORY[0x1E0C9AE50];
    if (cf[0])
      CFRelease(cf[0]);
  }
  else
  {
    v5 = *MEMORY[0x1E0C9AE50] == 0;
  }
  if (dword_1EE53AAC8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v5;
}

- (id)_uniqueIdentifier
{
  __CFString *uniqueIdentifier;
  id *p_uniqueIdentifier;
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  __CFString *figExternalStorageDeviceUUID;
  void (*v7)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, id *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_uniqueIdentifier = (id *)&self->_uniqueIdentifier;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    CFRelease(uniqueIdentifier);
    *p_uniqueIdentifier = 0;
  }
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager)
  {
    figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
    v7 = *(void (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v7)
      v7(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E0D05348], *MEMORY[0x1E0C9AE00], p_uniqueIdentifier);
  }
  if (dword_1EE53AAC8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (id)objc_msgSend(*p_uniqueIdentifier, "copy", v10, v11);
}

- (NSUUID)uuid
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", -[AVExternalStorageDevice _uniqueIdentifier](self, "_uniqueIdentifier"));
}

- (BOOL)isNotRecommendedForCaptureUse
{
  __CFURL *baseURL;
  uint64_t v4;
  void *v5;
  OpaqueFigExternalStorageDeviceManager *v6;
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  __CFString *figExternalStorageDeviceUUID;
  uint64_t (*v9)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, CFTypeRef *);
  int v10;
  CFTypeRef v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef cf;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  cf = 0;
  baseURL = self->_baseURL;
  v4 = *MEMORY[0x1E0C99CF8];
  v15[0] = *MEMORY[0x1E0C99CF8];
  v5 = (void *)-[__CFURL resourceValuesForKeys:error:](baseURL, "resourceValuesForKeys:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1), 0);
  if (!v5)
    goto LABEL_14;
  v6 = (OpaqueFigExternalStorageDeviceManager *)objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  externalStorageDeviceManager = v6;
  if (!v6)
    goto LABEL_11;
  if (!-[OpaqueFigExternalStorageDeviceManager caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("msdos"))
    || !-[OpaqueFigExternalStorageDeviceManager caseInsensitiveCompare:](externalStorageDeviceManager, "caseInsensitiveCompare:", CFSTR("apfs")))
  {
    LOBYTE(externalStorageDeviceManager) = 1;
    goto LABEL_11;
  }
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (!externalStorageDeviceManager)
    goto LABEL_11;
  figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
  v9 = *(uint64_t (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v9)
  {
    v10 = v9(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E0D05338], *MEMORY[0x1E0C9AE00], &cf);
    v11 = cf;
    if (!v10)
    {
      LOBYTE(externalStorageDeviceManager) = FigCFEqual() != 0;
      v11 = cf;
      if (!cf)
        goto LABEL_11;
      goto LABEL_9;
    }
    LOBYTE(externalStorageDeviceManager) = 0;
    if (cf)
LABEL_9:
      CFRelease(v11);
  }
  else
  {
LABEL_14:
    LOBYTE(externalStorageDeviceManager) = 0;
  }
LABEL_11:
  if (dword_1EE53AAC8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (char)externalStorageDeviceManager;
}

- (NSArray)nextAvailableURLsWithPathExtensions:(NSArray *)extensionArray error:(NSError *)outError
{
  uint64_t v4;
  __CFArray *nextAvailableURLArray;
  __CFArray *Mutable;
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  __CFString *figExternalStorageDeviceUUID;
  uint64_t (*v12)(OpaqueFigExternalStorageDeviceManager *, _QWORD, __CFString *, NSArray *, id *);
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v21;
  NSError *v22;
  NSArray *result;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  nextAvailableURLArray = self->_nextAvailableURLArray;
  if (nextAvailableURLArray)
  {
    CFRelease(nextAvailableURLArray);
    self->_nextAvailableURLArray = 0;
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  self->_nextAvailableURLArray = Mutable;
  if (!Mutable)
  {
    v25 = v4;
    LODWORD(v24) = 0;
    FigDebugAssert3();
    goto LABEL_25;
  }
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (!externalStorageDeviceManager)
  {
LABEL_15:
    if (dword_1EE53AAC8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return (NSArray *)(id)-[__CFArray copy](self->_nextAvailableURLArray, "copy", v24, v25);
  }
  figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
  v12 = *(uint64_t (**)(OpaqueFigExternalStorageDeviceManager *, _QWORD, __CFString *, NSArray *, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v12)
  {
    v13 = -12782;
LABEL_18:
    if (!outError)
      return 0;
    goto LABEL_19;
  }
  v13 = v12(externalStorageDeviceManager, 0, figExternalStorageDeviceUUID, extensionArray, &v30);
  if (v13)
    goto LABEL_18;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v30;
  v15 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (!v15)
    goto LABEL_15;
  v16 = v15;
  v17 = *(_QWORD *)v27;
LABEL_9:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v27 != v17)
      objc_enumerationMutation(v14);
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v18), outError);
    if (!v19)
      break;
    CFArrayAppendValue(self->_nextAvailableURLArray, (const void *)objc_msgSend(v19, "url"));
    if (v16 == ++v18)
    {
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v16)
        goto LABEL_9;
      goto LABEL_15;
    }
  }
LABEL_25:
  v13 = -19277;
  if (!outError)
    return 0;
LABEL_19:
  if (v13 == -19274)
    v21 = -11852;
  else
    v21 = v13;
  v22 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v21, 0, v24, v25);
  result = 0;
  *outError = v22;
  return result;
}

- (id)baseURL
{
  __CFURL **p_baseURL;
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  __CFString *figExternalStorageDeviceUUID;
  void (*v5)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, __CFURL **);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  p_baseURL = &self->_baseURL;
  if (!self->_baseURL)
  {
    externalStorageDeviceManager = self->_externalStorageDeviceManager;
    if (externalStorageDeviceManager)
    {
      figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
      v5 = *(void (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, _QWORD, _QWORD, __CFURL **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
      if (v5)
        v5(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E0D05318], *MEMORY[0x1E0C9AE00], p_baseURL);
    }
  }
  if (dword_1EE53AAC8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (id)-[__CFURL copy](*p_baseURL, "copy", v8, v9);
}

- (void)updateExternalStorageDeviceManager:(OpaqueFigExternalStorageDeviceManager *)a3 andFigExternalStorageDeviceUUID:(id)a4
{
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  OpaqueFigExternalStorageDeviceManager *v8;
  __CFString *figExternalStorageDeviceUUID;
  __CFString *v10;

  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager)
  {
    CFRelease(externalStorageDeviceManager);
    self->_externalStorageDeviceManager = 0;
  }
  if (a3)
    v8 = (OpaqueFigExternalStorageDeviceManager *)CFRetain(a3);
  else
    v8 = 0;
  self->_externalStorageDeviceManager = v8;
  figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
  if (figExternalStorageDeviceUUID)
  {
    CFRelease(figExternalStorageDeviceUUID);
    self->_figExternalStorageDeviceUUID = 0;
  }
  if (a4)
    v10 = (__CFString *)CFRetain(a4);
  else
    v10 = 0;
  self->_figExternalStorageDeviceUUID = v10;
}

+ (AVAuthorizationStatus)authorizationStatus
{
  int v2;

  v2 = -[AVExternalStorageDeviceDiscoverySession _checkAuthorizationStatus](+[AVExternalStorageDeviceDiscoverySession sharedSession](AVExternalStorageDeviceDiscoverySession, "sharedSession"), "_checkAuthorizationStatus");
  if (v2 == 2)
    return 3;
  else
    return 2 * (v2 == 1);
}

+ (void)requestAccessWithCompletionHandler:(void *)handler
{
  if (+[AVExternalStorageDeviceDiscoverySession isSupported](AVExternalStorageDeviceDiscoverySession, "isSupported"))
  {
    -[AVExternalStorageDeviceDiscoverySession _requestAuthorization:](+[AVExternalStorageDeviceDiscoverySession sharedSession](AVExternalStorageDeviceDiscoverySession, "sharedSession"), "_requestAuthorization:", handler);
  }
  else
  {
    (*((void (**)(void *, _QWORD))handler + 2))(handler, 0);
  }
}

@end
