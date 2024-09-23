uint64_t GCFrameworkStaticInitializer()
{
  return +[GCFrameworkInitialization listenForObservers](GCFrameworkInitialization, "listenForObservers");
}

uint64_t gc_isInternalBuild()
{
  if (gc_isInternalBuild_onceToken != -1)
    dispatch_once(&gc_isInternalBuild_onceToken, &__block_literal_global_11);
  return gc_isInternalBuild_isInternalBuild;
}

uint64_t currentProcessIsGameControllerDaemon()
{
  if (currentProcessIsGameControllerDaemon_onceToken != -1)
    dispatch_once(&currentProcessIsGameControllerDaemon_onceToken, &__block_literal_global_167);
  return currentProcessIsGameControllerDaemon_IsGameControllerDaemon;
}

void __currentProcessIsGameControllerDaemon_block_invoke()
{
  void *v0;
  id v1;

  +[NSBundle mainBundle](&off_254DF2768, "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  currentProcessIsGameControllerDaemon_IsGameControllerDaemon = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.GameController.gamecontrollerd"));

}

uint64_t __gc_isInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  gc_isInternalBuild_isInternalBuild = result;
  return result;
}

void sub_215184B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_4(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

BOOL GCMicroGamepadSnapshotDataFromNSData(GCMicroGamepadSnapshotData *snapshotData, NSData *data)
{
  NSData *v3;
  NSData *v4;
  BOOL v5;
  uint64_t v6;
  int v8;

  v3 = data;
  v4 = v3;
  v5 = 0;
  if (snapshotData && v3)
  {
    v8 = 0;
    -[NSData getBytes:length:](v3, "getBytes:length:", &v8, 4);
    v6 = HIWORD(v8);
    if (HIWORD(v8) <= 0x14u)
    {
      -[NSData getBytes:length:](v4, "getBytes:length:", snapshotData, HIWORD(v8));
      if ((_DWORD)v6 != 20)
        bzero((char *)snapshotData + HIWORD(v8), 20 - v6);
      v5 = 1;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

BOOL GCExtendedGamepadSnapshotDataFromNSData(GCExtendedGamepadSnapshotData *snapshotData, NSData *data)
{
  NSData *v3;
  NSData *v4;
  BOOL v5;
  uint64_t v6;
  int v8;

  v3 = data;
  v4 = v3;
  v5 = 0;
  if (snapshotData && v3)
  {
    v8 = 0;
    -[NSData getBytes:length:](v3, "getBytes:length:", &v8, 4);
    v6 = HIWORD(v8);
    if (HIWORD(v8) <= 0x3Fu)
    {
      -[NSData getBytes:length:](v4, "getBytes:length:", snapshotData, HIWORD(v8));
      if ((_DWORD)v6 != 63)
        bzero((char *)snapshotData + HIWORD(v8), 63 - v6);
      v5 = 1;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

NSData *__cdecl NSDataFromGCMicroGamepadSnapshotData(GCMicroGamepadSnapshotData *snapshotData)
{
  GCMicroGamepadSnapshotData *v1;
  __int128 v3;
  uint64_t v4;

  if (snapshotData)
  {
    v1 = snapshotData;
    if (!snapshotData->version)
    {
      v3 = *(_OWORD *)&snapshotData->version;
      *(float *)&v4 = snapshotData->buttonX;
      LODWORD(v3) = 1310976;
      v1 = (GCMicroGamepadSnapshotData *)&v3;
    }
    +[NSData dataWithBytes:length:](&off_254DEDA10, "dataWithBytes:length:", v1, 20, v3, v4);
    snapshotData = (GCMicroGamepadSnapshotData *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)snapshotData;
}

NSData *__cdecl NSDataFromGCExtendedGamepadSnapshotData(GCExtendedGamepadSnapshotData *snapshotData)
{
  GCExtendedGamepadSnapshotData *v1;
  __int128 v2;
  __int128 v4;
  __int128 v5;
  _OWORD v6[2];

  if (snapshotData)
  {
    v1 = snapshotData;
    if (!snapshotData->version)
    {
      v2 = *(_OWORD *)&snapshotData->buttonB;
      v4 = *(_OWORD *)&snapshotData->version;
      v5 = v2;
      v6[0] = *(_OWORD *)&snapshotData->rightShoulder;
      *(_OWORD *)((char *)v6 + 15) = *(_OWORD *)((char *)&snapshotData->rightThumbstickX + 3);
      LODWORD(v4) = 4129025;
      v1 = (GCExtendedGamepadSnapshotData *)&v4;
    }
    +[NSData dataWithBytes:length:](&off_254DEDA10, "dataWithBytes:length:", v1, 63, v4, v5, v6[0], v6[1]);
    snapshotData = (GCExtendedGamepadSnapshotData *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)snapshotData;
}

BOOL GCMicroGamepadSnapShotDataV100FromNSData(GCMicroGamepadSnapShotDataV100 *snapshotData, NSData *data)
{
  NSData *v3;
  NSData *v4;
  BOOL v5;
  uint64_t v6;
  int v8;

  v3 = data;
  v4 = v3;
  v5 = 0;
  if (snapshotData && v3)
  {
    v8 = 0;
    -[NSData getBytes:length:](v3, "getBytes:length:", &v8, 4);
    v6 = HIWORD(v8);
    if (HIWORD(v8) <= 0x14u)
    {
      -[NSData getBytes:length:](v4, "getBytes:length:", snapshotData, HIWORD(v8));
      if ((_DWORD)v6 != 20)
        bzero((char *)snapshotData + HIWORD(v8), 20 - v6);
      v5 = 1;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

BOOL GCExtendedGamepadSnapShotDataV100FromNSData(GCExtendedGamepadSnapShotDataV100 *snapshotData, NSData *data)
{
  NSData *v3;
  NSData *v4;
  BOOL v5;
  uint64_t v6;
  int v8;

  v3 = data;
  v4 = v3;
  v5 = 0;
  if (snapshotData && v3)
  {
    v8 = 0;
    -[NSData getBytes:length:](v3, "getBytes:length:", &v8, 4);
    v6 = HIWORD(v8);
    if (HIWORD(v8) <= 0x3Cu)
    {
      -[NSData getBytes:length:](v4, "getBytes:length:", snapshotData, HIWORD(v8));
      if ((_DWORD)v6 != 60)
        bzero((char *)snapshotData + HIWORD(v8), 60 - v6);
      v5 = 1;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

NSData *__cdecl NSDataFromGCMicroGamepadSnapShotDataV100(GCMicroGamepadSnapShotDataV100 *snapshotData)
{
  GCMicroGamepadSnapShotDataV100 *v1;
  __int128 v3;
  uint64_t v4;

  if (snapshotData)
  {
    v1 = snapshotData;
    if (!snapshotData->version)
    {
      v3 = *(_OWORD *)&snapshotData->version;
      *(float *)&v4 = snapshotData->buttonX;
      LODWORD(v3) = 1310976;
      v1 = (GCMicroGamepadSnapShotDataV100 *)&v3;
    }
    +[NSData dataWithBytes:length:](&off_254DEDA10, "dataWithBytes:length:", v1, 20, v3, v4);
    snapshotData = (GCMicroGamepadSnapShotDataV100 *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)snapshotData;
}

NSData *__cdecl NSDataFromGCExtendedGamepadSnapShotDataV100(GCExtendedGamepadSnapShotDataV100 *snapshotData)
{
  GCExtendedGamepadSnapShotDataV100 *v1;
  __int128 v2;
  __int128 v4;
  __int128 v5;
  _OWORD v6[2];

  if (snapshotData)
  {
    v1 = snapshotData;
    if (!snapshotData->version)
    {
      v2 = *(_OWORD *)&snapshotData->buttonB;
      v4 = *(_OWORD *)&snapshotData->version;
      v5 = v2;
      v6[0] = *(_OWORD *)&snapshotData->rightShoulder;
      *(_OWORD *)((char *)v6 + 12) = *(_OWORD *)&snapshotData->rightThumbstickX;
      LODWORD(v4) = 3932416;
      v1 = (GCExtendedGamepadSnapShotDataV100 *)&v4;
    }
    +[NSData dataWithBytes:length:](&off_254DEDA10, "dataWithBytes:length:", v1, 60, v4, v5, v6[0], v6[1]);
    snapshotData = (GCExtendedGamepadSnapShotDataV100 *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)snapshotData;
}

void sub_215189648(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSXPCInterface *GCAgentClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEAC68);
}

id GCAgentServerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD0ED0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCVideoRelocationXPCProxyServiceRemoteClientInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_connectToVideoRelocationXPCProxyServiceWithClient_reply_, 0, 0);

  GCVideoRelocationXPCProxyServiceRemoteServerInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_connectToVideoRelocationXPCProxyServiceWithClient_reply_, 0, 1);

  GCUserDefaultsXPCProxyServiceRemoteClientInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_connectToUserDefaultsXPCProxyServiceWithClient_reply_, 0, 0);

  GCUserDefaultsXPCProxyServiceRemoteServerInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v4, sel_connectToUserDefaultsXPCProxyServiceWithClient_reply_, 0, 1);

  return v0;
}

void sub_215189F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21518A824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCBatteryXPCProxyRemoteClientEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DC3348);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

id GCBatteryXPCProxyRemoteServerEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DC34F8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

NSXPCInterface *GCBatteryXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD1630);
}

id GCBatteryXPCProxyServiceRemoteServerInterface()
{
  void *v0;
  void *v1;
  void *v2;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD59C8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCBatteryXPCProxyRemoteClientEndpointInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_batteryXPCProxyServiceClientEndpointConnect_reply_, 0, 0);

  GCBatteryXPCProxyRemoteServerEndpointInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_batteryXPCProxyServiceClientEndpointConnect_reply_, 0, 1);

  return v0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

const __CFString *GCSystemGestureModeToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Off");
  else
    return off_24D2B2CE8[a1];
}

void sub_21518C418(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21518C5A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21518C9E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21518CB40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21518D12C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21518D41C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21518D92C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _DescendantPointerEvent(uint64_t a1)
{
  uint64_t v1;
  const __CFArray *Children;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const void *ValueAtIndex;
  uint64_t v8;

  v1 = a1;
  if (a1 && IOHIDEventGetType() != 17)
  {
    Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children && (v3 = Children, Count = CFArrayGetCount(Children), Count >= 1))
    {
      v5 = Count;
      v6 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
        v8 = _DescendantPointerEvent(ValueAtIndex);
        if (v8)
          break;
        if (v5 == ++v6)
          return 0;
      }
      return v8;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21518DE6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21518DED8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21518E09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_21518E288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t HapticSharedMemory::allocate(uint64_t a1, void **a2, _DWORD *a3)
{
  xpc_object_t v6;
  void *v7;
  uint64_t inited;
  int *v9;
  int v10;
  id v11;
  xpc_object_t v12;
  void *v13;
  void (**v15)(SharableMemoryBlock::XPCServerToken *__hidden);
  uint64_t v16;
  id v17;

  v6 = xpc_null_create();
  v7 = *a2;
  *a2 = v6;

  *a3 = 0;
  v16 = 1;
  v15 = &off_24D2B5E38;
  v17 = 0;
  inited = SharableMemoryBlock::InitServer(a1, 0x189C0uLL, &v15);
  if (!(_DWORD)inited)
  {
    v9 = *(int **)(a1 + 24);
    if (v9)
    {
      NSLog(CFSTR("clearing ring buffer"));
      v10 = *(_DWORD *)(a1 + 16) - 16;
      v9[1] = 0;
      v9[2] = 0;
      *v9 = v10;
    }
    v11 = v17;
    v12 = v11;
    if (!v11)
      v12 = xpc_null_create();

    v13 = *a2;
    *a2 = v12;

    *a3 = HIDWORD(v16);
  }
  SharableMemoryBlock::XPCServerToken::~XPCServerToken((SharableMemoryBlock::XPCServerToken *)&v15);
  return inited;
}

void sub_21518F324(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  SharableMemoryBlock::XPCServerToken::~XPCServerToken((SharableMemoryBlock::XPCServerToken *)va);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_215192AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  id *v17;
  va_list va;

  va_start(va, a17);
  __destructor_8_s0_s8_s16(v17);
  __destructor_8_s0_s8_s16((id *)va);
  _Unwind_Resume(a1);
}

double __copy_helper_block_e8_40n20_8_8_s0_s8_s16_t24w64(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)&result = __copy_constructor_8_8_s0_s8_s16_t24w64(a1 + 40, a2 + 40).n128_u64[0];
  return result;
}

__n128 __copy_constructor_8_8_s0_s8_s16_t24w64(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v5;
  __int128 v6;

  *(_QWORD *)a1 = *(id *)a2;
  *(_QWORD *)(a1 + 8) = *(id *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(id *)(a2 + 16);
  result = *(__n128 *)(a2 + 40);
  v5 = *(_OWORD *)(a2 + 56);
  v6 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 72) = v6;
  *(_OWORD *)(a1 + 56) = v5;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40n11_8_s0_s8_s16(uint64_t a1)
{
  __destructor_8_s0_s8_s16((id *)(a1 + 40));
}

void __destructor_8_s0_s8_s16(id *a1)
{

}

void sub_215195074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x2199DEBB0](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_2151959A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  __destructor_8_s0_s48_s56_s64((id *)(v1 - 176));
  _Unwind_Resume(a1);
}

id __copy_constructor_8_8_s0_t8w39_s48_s56_s64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  id result;

  *(_QWORD *)a1 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 39);
  v5 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 39) = v4;
  *(_QWORD *)(a1 + 48) = *(id *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(id *)(a2 + 56);
  result = *(id *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = result;
  return result;
}

void __destructor_8_s0_s48_s56_s64(id *a1)
{

}

void sub_215195C54(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  objc_begin_catch(a1);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + *(int *)(v2 + 2752)));
  objc_exception_rethrow();
}

void sub_215195C70(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_215195DC8(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_215195DE0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_215195ED8(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_215195EEC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void SetupVirtualGameControllerIfForced()
{
  if (SetupVirtualGameControllerIfForced_onceToken != -1)
    dispatch_once(&SetupVirtualGameControllerIfForced_onceToken, &__block_literal_global_3);
}

id VirtualControllerBundle()
{
  void *v0;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;

  v0 = (void *)VirtualControllerBundle_Bundle;
  if (VirtualControllerBundle_Bundle)
    return v0;
  GCFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("VirtualGameController"), CFSTR("bundle"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    +[NSBundle bundleWithURL:](&off_254DF2768, "bundleWithURL:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v13 = 0;
      v7 = objc_msgSend(v5, "loadAndReturnError:", &v13);
      v8 = v13;
      if ((v7 & 1) != 0)
      {
        v9 = v6;
        v10 = 0;
        v11 = VirtualControllerBundle_Bundle;
        VirtualControllerBundle_Bundle = (uint64_t)v9;
      }
      else
      {
        _gc_log_virtualcontroller();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          VirtualControllerBundle_cold_3((uint64_t)v8, v11);
        v10 = 1;
      }

    }
    else
    {
      _gc_log_virtualcontroller();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        VirtualControllerBundle_cold_2(v4);
      v10 = 1;
    }

    if (!v10)
    {
      v0 = (void *)VirtualControllerBundle_Bundle;
      return v0;
    }
  }
  else
  {
    _gc_log_virtualcontroller();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      VirtualControllerBundle_cold_1(v2);

  }
  return 0;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id gcBundle()
{
  if (gcBundle_onceToken != -1)
    dispatch_once(&gcBundle_onceToken, &__block_literal_global_4);
  return (id)_gcBundle;
}

void __gcBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[NSBundle bundleWithIdentifier:](&off_254DF2768, "bundleWithIdentifier:", CFSTR("com.apple.GameController"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_gcBundle;
  _gcBundle = v0;

}

id GCExecutablePathWithPID()
{
  int v0;
  _BYTE buffer[4096];
  uint64_t v3;

  v0 = MEMORY[0x24BDAC7A8]();
  v3 = *MEMORY[0x24BDAC8D0];
  return (id)objc_msgSend(objc_alloc((Class)&off_254DEDEA8), "initWithBytes:length:encoding:", buffer, proc_pidpath(v0, buffer, 0x1000u), 4);
}

id GCBundleWithPID()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  GCExecutablePathWithPID();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSURL fileURLWithPath:](&off_254DF3050, "fileURLWithPath:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    if (v2)
    {
      +[NSBundle bundleWithURL:](&off_254DF2768, "bundleWithURL:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id GCFrameworkBundle()
{
  if (GCFrameworkBundle_onceToken != -1)
    dispatch_once(&GCFrameworkBundle_onceToken, &__block_literal_global_68);
  return (id)GCFrameworkBundle_bundle;
}

id GCGameIntentBlocklist()
{
  if (GCGameIntentBlocklist_onceToken != -1)
    dispatch_once(&GCGameIntentBlocklist_onceToken, &__block_literal_global_70);
  return (id)GCGameIntentBlocklist__gameIntentBlockList;
}

double clamp(double a1, double a2, double a3)
{
  if (a1 <= a3)
    a3 = a1;
  if (a1 >= a2)
    return a3;
  else
    return a2;
}

__IOHIDDevice *deviceMatchesUsageAndUsagePage(__IOHIDDevice *result, int a2, int a3)
{
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  BOOL v8;
  uint64_t v9;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v11;
  const void *Value;
  const void *v13;
  const void *v14;
  CFTypeID v15;
  CFTypeID v16;
  int v18;
  uint64_t valuePtr;

  if (result)
  {
    result = (__IOHIDDevice *)IOHIDDeviceGetProperty(result, CFSTR("DeviceUsagePairs"));
    if (result)
    {
      v5 = result;
      Count = CFArrayGetCount(result);
      if (Count < 1)
      {
        return 0;
      }
      else
      {
        v7 = Count;
        v18 = a3;
        v8 = 0;
        v9 = 1;
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v9 - 1);
          if (ValueAtIndex)
          {
            v11 = ValueAtIndex;
            Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("DeviceUsage"));
            v13 = CFDictionaryGetValue(v11, CFSTR("DeviceUsagePage"));
            if (Value)
            {
              v14 = v13;
              if (v13)
              {
                v15 = CFGetTypeID(Value);
                if (v15 == CFNumberGetTypeID())
                {
                  v16 = CFGetTypeID(v14);
                  if (v16 == CFNumberGetTypeID())
                  {
                    valuePtr = 0;
                    CFNumberGetValue((CFNumberRef)Value, kCFNumberIntType, (char *)&valuePtr + 4);
                    CFNumberGetValue((CFNumberRef)v14, kCFNumberIntType, &valuePtr);
                    v8 = (_DWORD)valuePtr == a2 && HIDWORD(valuePtr) == v18;
                  }
                }
              }
            }
          }
          if (v9 >= v7)
            break;
          ++v9;
        }
        while (!v8);
      }
      return (__IOHIDDevice *)v8;
    }
  }
  return result;
}

BOOL elementRangesMatch(__IOHIDElement *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  CFIndex LogicalMin;
  CFIndex LogicalMax;
  CFIndex PhysicalMin;
  CFIndex PhysicalMax;
  uint32_t ReportSize;
  uint32_t ReportCount;

  LogicalMin = IOHIDElementGetLogicalMin(a1);
  LogicalMax = IOHIDElementGetLogicalMax(a1);
  PhysicalMin = IOHIDElementGetPhysicalMin(a1);
  PhysicalMax = IOHIDElementGetPhysicalMax(a1);
  ReportSize = IOHIDElementGetReportSize(a1);
  ReportCount = IOHIDElementGetReportCount(a1);
  return LogicalMin == a2
      && LogicalMax == a3
      && PhysicalMin == a4
      && PhysicalMax == a5
      && ReportSize == a6
      && ReportCount == a7;
}

BOOL doesDescriptorConformToSpec(__IOHIDServiceClient *a1)
{
  return IOHIDServiceClientConformsTo(a1, 1u, 5u) != 0;
}

__IOHIDServiceClient *serviceMatchesUsageAndUsagePage(__IOHIDServiceClient *result, int a2, int a3)
{
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  BOOL v8;
  uint64_t v9;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v11;
  const __CFNumber *Value;
  const __CFNumber *v13;
  const __CFNumber *v14;
  uint64_t valuePtr;

  if (result)
  {
    result = (__IOHIDServiceClient *)IOHIDServiceClientCopyProperty(result, CFSTR("DeviceUsagePairs"));
    if (result)
    {
      v5 = result;
      Count = CFArrayGetCount(result);
      if (Count < 1)
      {
        v8 = 0;
      }
      else
      {
        v7 = Count;
        v8 = 0;
        v9 = 1;
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v9 - 1);
          if (ValueAtIndex)
          {
            v11 = ValueAtIndex;
            Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("DeviceUsage"));
            v13 = (const __CFNumber *)CFDictionaryGetValue(v11, CFSTR("DeviceUsagePage"));
            if (Value)
            {
              v14 = v13;
              if (v13)
              {
                valuePtr = 0;
                CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4);
                CFNumberGetValue(v14, kCFNumberIntType, &valuePtr);
                v8 = (_DWORD)valuePtr == a2 && HIDWORD(valuePtr) == a3;
              }
            }
          }
          if (v9 >= v7)
            break;
          ++v9;
        }
        while (!v8);
      }
      CFRelease(v5);
      return (__IOHIDServiceClient *)v8;
    }
  }
  return result;
}

uint64_t isDeviceParentAuthenticated(__IOHIDServiceClient *a1)
{
  void *v2;
  void *v3;
  mach_port_t v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_registry_entry_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  GC_IOHIDServiceClientGetStringProperty(a1, CFSTR("Transport"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("USB")))
  {
    IOHIDServiceClientGetRegistryID(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BDD8B18];
    v5 = IORegistryEntryIDMatching(objc_msgSend(v3, "unsignedLongValue"));
    MatchingService = IOServiceGetMatchingService(v4, v5);
    if (MatchingService)
    {
      v7 = MatchingService;
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v13[0] = 67109376;
          v13[1] = v7;
          v14 = 2048;
          v15 = objc_msgSend(v3, "unsignedLongValue");
          _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "Retrieved matching service %d for registry %lu", (uint8_t *)v13, 0x12u);
        }

      }
      v8 = (void *)IORegistryEntrySearchCFProperty(v7, "IOService", CFSTR("Authenticated"), 0, 3u);
      if (v8)
      {
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            LOWORD(v13[0]) = 0;
            _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "Found kIOHIDAuthenticatedDeviceKey property set in parent", (uint8_t *)v13, 2u);
          }

        }
        v9 = objc_msgSend(v8, "BOOLValue");
      }
      else
      {
        v9 = 0;
      }
      IOObjectRelease(v7);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t isDeviceMFiGamepadCompliantForDeviceRef(__IOHIDDevice *a1)
{
  CFArrayRef v1;
  CFArrayRef v2;
  const __CFArray *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __IOHIDElement *v11;
  uint32_t UsagePage;
  uint32_t Usage;
  unsigned int v15;
  uint64_t v16;
  NSObject *v18;
  CFArrayRef v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  unsigned int v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v1 = IOHIDDeviceCopyMatchingElements(a1, 0, 0);
  v2 = v1;
  if (v1)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = v1;
    v3 = v1;
    v4 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v3);
          v11 = *(__IOHIDElement **)(*((_QWORD *)&v20 + 1) + 8 * i);
          UsagePage = IOHIDElementGetUsagePage(v11);
          Usage = IOHIDElementGetUsage(v11);
          if (UsagePage == 9)
          {
            if (Usage <= 8)
              v8 |= (1 << (Usage - 1));
          }
          else if (UsagePage == 1)
          {
            if (Usage - 144 <= 3)
              v7 |= (1 << (Usage + 112));
          }
          else if (Usage == 547 && UsagePage == 12)
          {
            v6 = 1;
          }
        }
        v5 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
    }

    v15 = v6 & 1;
    v2 = v19;
  }
  else
  {
    v15 = 0;
    v7 = 0;
    v8 = 0;
  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v25 = v8;
      v26 = 2048;
      v27 = v7;
      v28 = 1024;
      v29 = v15;
      _os_log_impl(&dword_215181000, v18, OS_LOG_TYPE_INFO, "Is device MFi compliant? Buttons: 0x%lx, Dpad: 0x%lx, ACHome: %d", buf, 0x1Cu);
    }

  }
  if (~(_BYTE)v8 | (unint64_t)(~(_BYTE)v7 & 0xF))
    v16 = 0;
  else
    v16 = v15;

  return v16;
}

__IOHIDServiceClient *isDeviceKeyboard(__IOHIDServiceClient *a1)
{
  __IOHIDServiceClient *result;

  result = serviceMatchesUsageAndUsagePage(a1, 1, 6);
  if ((_DWORD)result)
    return (__IOHIDServiceClient *)(isDeviceAppleDirectionalRemote(a1) ^ 1);
  return result;
}

uint64_t isDeviceAppleDirectionalRemote(__IOHIDServiceClient *a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  _BOOL4 v8;
  unsigned int v9;

  GC_IOHIDServiceClientGetNumberProperty(a1, CFSTR("VendorID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  GC_IOHIDServiceClientGetNumberProperty(a1, CFSTR("ProductID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  v6 = serviceMatchesUsageAndUsagePage(a1, 12, 1);
  v7 = serviceMatchesUsageAndUsagePage(a1, 13, 5);
  v8 = (v5 & 0xFFFFFFFE) == 0x314 && v3 == 76;
  if ((v5 & 0xFFFFFFFE) == 0x314)
    v9 = v7;
  else
    v9 = 0;
  if (v3 == 147 && v5 == 40960)
    v8 = 1;
  return v8 & v6 | v9;
}

__IOHIDServiceClient *isDeviceMouse(__IOHIDServiceClient *a1)
{
  return serviceMatchesUsageAndUsagePage(a1, 1, 2);
}

__IOHIDServiceClient *isDeviceAppleEmbeddedBluetoothButtons(__IOHIDServiceClient *a1)
{
  return serviceMatchesUsageAndUsagePage(a1, 12, 1);
}

__IOHIDServiceClient *isDeviceAppleMultiPointDigitizer(__IOHIDServiceClient *a1)
{
  return serviceMatchesUsageAndUsagePage(a1, 13, 12);
}

__IOHIDServiceClient *isDeviceAppleTouchpad(__IOHIDServiceClient *a1)
{
  return serviceMatchesUsageAndUsagePage(a1, 13, 5);
}

__IOHIDServiceClient *isDeviceMotionLite(__IOHIDServiceClient *a1)
{
  return serviceMatchesUsageAndUsagePage(a1, 65280, 16);
}

__IOHIDServiceClient *isDeviceAppleControlCenterRemote(__IOHIDServiceClient *a1)
{
  return serviceMatchesUsageAndUsagePage(a1, 13, 5);
}

__IOHIDServiceClient *isDeviceAppleSiriRemote(__IOHIDServiceClient *a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  unsigned int v10;
  __IOHIDServiceClient *v11;
  unsigned int v12;
  unsigned int v13;

  GC_IOHIDServiceClientGetNumberProperty(a1, CFSTR("VendorID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  GC_IOHIDServiceClientGetNumberProperty(a1, CFSTR("ProductID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  v7 = v5 == 614 || v5 == 621;
  v8 = v3 == 76 && v7;
  v9 = 1;
  v10 = serviceMatchesUsageAndUsagePage(a1, 12, 1);
  v11 = serviceMatchesUsageAndUsagePage(a1, 13, 12);
  v12 = serviceMatchesUsageAndUsagePage(a1, 65280, 16);
  v13 = serviceMatchesUsageAndUsagePage(a1, 13, 5);
  if (!v8 || ((v10 | v12 | v13) & 1) == 0)
  {
    if (v5 == 621 || v5 == 614)
      return v11;
    else
      return 0;
  }
  return (__IOHIDServiceClient *)v9;
}

uint64_t isDeviceXbox(int a1, int a2)
{
  uint64_t result;

  if (a1 != 1118)
    return 0;
  result = 1;
  if (a2 > 2817)
  {
    if ((a2 - 2818) <= 0x22 && ((1 << (a2 - 2)) & 0x7C0030409) != 0)
      return result;
    return 0;
  }
  if (a2 != 654 && a2 != 736 && a2 != 765)
    return 0;
  return result;
}

BOOL isDeviceDualShock4(int a1, int a2)
{
  _BOOL4 v3;

  v3 = a2 == 1476 || a2 == 2508;
  return a1 == 1356 && v3;
}

BOOL isDeviceDualSense(int a1, int a2)
{
  return a1 == 1356 && a2 == 3302;
}

BOOL isDeviceDualSenseEdge(int a1, int a2)
{
  return a1 == 1356 && a2 == 3570;
}

BOOL isDeviceLuna(int a1, int a2)
{
  return a1 == 369 && a2 == 1049;
}

BOOL isDeviceSwitchJoyCon(int a1, unsigned int a2)
{
  _BOOL4 v3;

  v3 = a2 == 8206 || a2 >> 1 == 4099;
  return a1 == 1406 && v3;
}

BOOL isDeviceSwitchProController(int a1, int a2)
{
  return a1 == 1406 && a2 == 8201;
}

BOOL isDeviceSwitchSuperFamicomController(int a1, int a2)
{
  return a1 == 1406 && a2 == 8215;
}

BOOL isDeviceSwitchN64Controller(int a1, int a2)
{
  return a1 == 1406 && a2 == 8217;
}

id ControllerClassForService(__IOHIDServiceClient *a1)
{
  NSObject *v3;
  int v4;
  __IOHIDServiceClient *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (isDeviceKeyboard(a1))
  {
    if (!gc_isInternalBuild())
      goto LABEL_12;
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = a1;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "Keyboard discovered: %@", (uint8_t *)&v4, 0xCu);
    }
    goto LABEL_25;
  }
  if (serviceMatchesUsageAndUsagePage(a1, 1, 2))
  {
    if (!gc_isInternalBuild())
      goto LABEL_12;
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = a1;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "Mouse discovered: %@", (uint8_t *)&v4, 0xCu);
    }
    goto LABEL_25;
  }
  if (isDeviceAppleSiriRemote(a1))
  {
    if (!gc_isInternalBuild())
      goto LABEL_12;
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v4) = 0;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "is apple siri remote", (uint8_t *)&v4, 2u);
    }
    goto LABEL_25;
  }
  if (isDeviceAppleDirectionalRemote(a1))
  {
    if (!gc_isInternalBuild())
    {
LABEL_12:
      objc_opt_class();
      return (id)objc_claimAutoreleasedReturnValue();
    }
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v4) = 0;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "is apple directional remote", (uint8_t *)&v4, 2u);
    }
LABEL_25:

    goto LABEL_12;
  }
  return 0;
}

const __CFString *VendorNameForATVProfile(void *a1)
{
  id v1;
  uint64_t v2;
  const __CFString *v3;

  v1 = a1;
  if (objc_msgSend(v1, "conformsToProtocol:", &unk_254DCB1F0))
  {
    v2 = objc_msgSend(v1, "deviceType");
    if ((unint64_t)(v2 - 1) > 5)
      v3 = CFSTR("Unset");
    else
      v3 = off_24D2B3260[v2 - 1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL currentProcessHasEntitlement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _BOOL8 value;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  id v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "UTF8String");
  v2 = (void *)xpc_copy_entitlement_for_self();
  v3 = v2;
  if (v2)
  {
    value = xpc_BOOL_get_value(v2);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = CFSTR("NO");
        if (value)
          v6 = CFSTR("YES");
        v8 = 138412546;
        v9 = v1;
        v10 = 2112;
        v11 = v6;
        _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "Does the current process have entitlement (%@)? %@", (uint8_t *)&v8, 0x16u);
      }
LABEL_13:

    }
  }
  else
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v1;
        _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "Unable to find entitlement %@", (uint8_t *)&v8, 0xCu);
      }
      value = 0;
      goto LABEL_13;
    }
    value = 0;
  }

  return value;
}

id currentProcessBundleIdentifier()
{
  if (currentProcessBundleIdentifier_onceToken != -1)
    dispatch_once(&currentProcessBundleIdentifier_onceToken, &__block_literal_global_170);
  return (id)currentProcessBundleIdentifier_currentProcessBundleIdentifier;
}

void __currentProcessBundleIdentifier_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[NSBundle mainBundle](&off_254DF2768, "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)currentProcessBundleIdentifier_currentProcessBundleIdentifier;
  currentProcessBundleIdentifier_currentProcessBundleIdentifier = v0;

}

__CFString *nameForKeyCode(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  if (nameForKeyCode_onceToken != -1)
    dispatch_once(&nameForKeyCode_onceToken, &__block_literal_global_171);
  v2 = (void *)nameForKeyCode_dict;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    v5 = &stru_24D2B85A8;
  v6 = v5;

  return v6;
}

void __nameForKeyCode_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  _QWORD v136[134];
  _QWORD v137[136];

  v137[134] = *MEMORY[0x24BDAC8D0];
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 4);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = v135;
  v137[0] = CFSTR("A");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 5);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v136[1] = v134;
  v137[1] = CFSTR("B");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 6);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v136[2] = v133;
  v137[2] = CFSTR("C");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 7);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v136[3] = v132;
  v137[3] = CFSTR("D");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 8);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v136[4] = v131;
  v137[4] = CFSTR("E");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 9);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v136[5] = v130;
  v137[5] = CFSTR("F");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 10);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v136[6] = v129;
  v137[6] = CFSTR("G");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 11);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v136[7] = v128;
  v137[7] = CFSTR("H");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 12);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v136[8] = v127;
  v137[8] = CFSTR("I");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 13);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v136[9] = v126;
  v137[9] = CFSTR("J");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 14);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v136[10] = v125;
  v137[10] = CFSTR("K");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 15);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v136[11] = v124;
  v137[11] = CFSTR("L");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 16);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v136[12] = v123;
  v137[12] = CFSTR("M");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 17);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v136[13] = v122;
  v137[13] = CFSTR("N");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 18);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v136[14] = v121;
  v137[14] = CFSTR("O");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 19);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v136[15] = v120;
  v137[15] = CFSTR("P");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 20);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v136[16] = v119;
  v137[16] = CFSTR("Q");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 21);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v136[17] = v118;
  v137[17] = CFSTR("R");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 22);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v136[18] = v117;
  v137[18] = CFSTR("S");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 23);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v136[19] = v116;
  v137[19] = CFSTR("T");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 24);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v136[20] = v115;
  v137[20] = CFSTR("U");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 25);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v136[21] = v114;
  v137[21] = CFSTR("V");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 26);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v136[22] = v113;
  v137[22] = CFSTR("W");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 27);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v136[23] = v112;
  v137[23] = CFSTR("X");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 28);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v136[24] = v111;
  v137[24] = CFSTR("Y");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 29);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v136[25] = v110;
  v137[25] = CFSTR("Z");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 30);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v136[26] = v109;
  v137[26] = CFSTR("One");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 31);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v136[27] = v108;
  v137[27] = CFSTR("Two");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 32);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v136[28] = v107;
  v137[28] = CFSTR("Three");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 33);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v136[29] = v106;
  v137[29] = CFSTR("Four");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 34);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v136[30] = v105;
  v137[30] = CFSTR("Five");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 35);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v136[31] = v104;
  v137[31] = CFSTR("Six");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 36);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v136[32] = v103;
  v137[32] = CFSTR("Seven");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 37);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v136[33] = v102;
  v137[33] = CFSTR("Eight");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 38);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v136[34] = v101;
  v137[34] = CFSTR("Nine");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 39);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v136[35] = v100;
  v137[35] = CFSTR("Zero");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 40);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v136[36] = v99;
  v137[36] = CFSTR("ReturnOrEnter");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 41);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v136[37] = v98;
  v137[37] = CFSTR("Escape");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 42);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v136[38] = v97;
  v137[38] = CFSTR("DeleteOrBackspace");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 43);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v136[39] = v96;
  v137[39] = CFSTR("Tab");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 44);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v136[40] = v95;
  v137[40] = CFSTR("Spacebar");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 45);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v136[41] = v94;
  v137[41] = CFSTR("Hyphen");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 46);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v136[42] = v93;
  v137[42] = CFSTR("EqualSign");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 47);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v136[43] = v92;
  v137[43] = CFSTR("OpenBracket");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 48);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v136[44] = v91;
  v137[44] = CFSTR("CloseBracket");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 49);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v136[45] = v90;
  v137[45] = CFSTR("Backslash");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 50);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v136[46] = v89;
  v137[46] = CFSTR("NonUSPound");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 51);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v136[47] = v88;
  v137[47] = CFSTR("Semicolon");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 52);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v136[48] = v87;
  v137[48] = CFSTR("Quote");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 53);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v136[49] = v86;
  v137[49] = CFSTR("GraveAccentAndTilde");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 54);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v136[50] = v85;
  v137[50] = CFSTR("Comma");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 55);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v136[51] = v84;
  v137[51] = CFSTR("Period");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 56);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v136[52] = v83;
  v137[52] = CFSTR("Slash");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 57);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v136[53] = v82;
  v137[53] = CFSTR("CapsLock");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 58);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v136[54] = v81;
  v137[54] = CFSTR("F1");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 59);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v136[55] = v80;
  v137[55] = CFSTR("F2");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 60);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v136[56] = v79;
  v137[56] = CFSTR("F3");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 61);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v136[57] = v78;
  v137[57] = CFSTR("F4");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 62);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v136[58] = v77;
  v137[58] = CFSTR("F5");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 63);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v136[59] = v76;
  v137[59] = CFSTR("F6");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 64);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v136[60] = v75;
  v137[60] = CFSTR("F7");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 65);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v136[61] = v74;
  v137[61] = CFSTR("F8");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 66);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v136[62] = v73;
  v137[62] = CFSTR("F9");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 67);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v136[63] = v72;
  v137[63] = CFSTR("F10");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 68);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v136[64] = v71;
  v137[64] = CFSTR("F11");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v136[65] = v70;
  v137[65] = CFSTR("F12");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 104);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v136[66] = v69;
  v137[66] = CFSTR("F13");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 105);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v136[67] = v68;
  v137[67] = CFSTR("F14");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 106);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v136[68] = v67;
  v137[68] = CFSTR("F15");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 107);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v136[69] = v66;
  v137[69] = CFSTR("F16");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 108);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v136[70] = v65;
  v137[70] = CFSTR("F17");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 109);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v136[71] = v64;
  v137[71] = CFSTR("F18");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 110);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v136[72] = v63;
  v137[72] = CFSTR("F19");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 111);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v136[73] = v62;
  v137[73] = CFSTR("F20");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 70);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v136[74] = v61;
  v137[74] = CFSTR("PrintScreen");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 71);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v136[75] = v60;
  v137[75] = CFSTR("ScrollLock");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 72);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v136[76] = v59;
  v137[76] = CFSTR("Pause");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 73);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v136[77] = v58;
  v137[77] = CFSTR("Insert");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 74);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v136[78] = v57;
  v137[78] = CFSTR("Home");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 75);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v136[79] = v56;
  v137[79] = CFSTR("PageUp");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 76);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v136[80] = v55;
  v137[80] = CFSTR("DeleteForward");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 77);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v136[81] = v54;
  v137[81] = CFSTR("End");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 78);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v136[82] = v53;
  v137[82] = CFSTR("PageDown");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 79);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v136[83] = v52;
  v137[83] = CFSTR("RightArrow");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 80);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v136[84] = v51;
  v137[84] = CFSTR("LeftArrow");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 81);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v136[85] = v50;
  v137[85] = CFSTR("DownArrow");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 82);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v136[86] = v49;
  v137[86] = CFSTR("UpArrow");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 83);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v136[87] = v48;
  v137[87] = CFSTR("KeypadNumLock");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 84);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v136[88] = v47;
  v137[88] = CFSTR("KeypadSlash");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 85);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v136[89] = v46;
  v137[89] = CFSTR("KeypadAsterisk");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 45);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v136[90] = v45;
  v137[90] = CFSTR("Hyphen");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 87);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v136[91] = v44;
  v137[91] = CFSTR("KeypadPlus");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 88);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v136[92] = v43;
  v137[92] = CFSTR("KeypadEnter");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 89);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v136[93] = v42;
  v137[93] = CFSTR("Keypad1");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 90);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v136[94] = v41;
  v137[94] = CFSTR("Keypad2");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 91);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v136[95] = v40;
  v137[95] = CFSTR("Keypad3");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 92);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v136[96] = v39;
  v137[96] = CFSTR("Keypad4");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 93);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v136[97] = v38;
  v137[97] = CFSTR("Keypad5");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 94);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v136[98] = v37;
  v137[98] = CFSTR("Keypad6");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 95);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v136[99] = v36;
  v137[99] = CFSTR("Keypad7");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 96);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v136[100] = v35;
  v137[100] = CFSTR("Keypad8");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 97);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v136[101] = v34;
  v137[101] = CFSTR("Keypad9");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 98);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v136[102] = v33;
  v137[102] = CFSTR("Keypad0");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 99);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v136[103] = v32;
  v137[103] = CFSTR("KeypadPeriod");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 103);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v136[104] = v31;
  v137[104] = CFSTR("KeypadEqualSign");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 100);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v136[105] = v30;
  v137[105] = CFSTR("NonUSBackslash");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 101);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v136[106] = v29;
  v137[106] = CFSTR("Application");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 102);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v136[107] = v28;
  v137[107] = CFSTR("Power");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 135);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v136[108] = v27;
  v137[108] = CFSTR("International1");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 136);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v136[109] = v26;
  v137[109] = CFSTR("International2");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 137);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v136[110] = v25;
  v137[110] = CFSTR("International3");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 138);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v136[111] = v24;
  v137[111] = CFSTR("International4");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 139);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v136[112] = v23;
  v137[112] = CFSTR("International5");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 140);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v136[113] = v22;
  v137[113] = CFSTR("International6");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 141);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v136[114] = v21;
  v137[114] = CFSTR("International7");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 142);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v136[115] = v20;
  v137[115] = CFSTR("International8");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 143);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v136[116] = v19;
  v137[116] = CFSTR("International9");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 144);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v136[117] = v18;
  v137[117] = CFSTR("LANG1");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 145);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v136[118] = v17;
  v137[118] = CFSTR("LANG2");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 146);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v136[119] = v16;
  v137[119] = CFSTR("LANG3");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 147);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v136[120] = v15;
  v137[120] = CFSTR("LANG4");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 148);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v136[121] = v14;
  v137[121] = CFSTR("LANG5");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 149);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v136[122] = v13;
  v137[122] = CFSTR("LANG6");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 150);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v136[123] = v12;
  v137[123] = CFSTR("LANG7");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 151);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v136[124] = v0;
  v137[124] = CFSTR("LANG8");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 152);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v136[125] = v1;
  v137[125] = CFSTR("LANG9");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 224);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v136[126] = v2;
  v137[126] = CFSTR("LeftControl");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 225);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v136[127] = v3;
  v137[127] = CFSTR("LeftShift");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 226);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v136[128] = v4;
  v137[128] = CFSTR("LeftAlt");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 227);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v136[129] = v5;
  v137[129] = CFSTR("LeftGUI");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 228);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v136[130] = v6;
  v137[130] = CFSTR("RightControl");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 229);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v136[131] = v7;
  v137[131] = CFSTR("RightShift");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 230);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v136[132] = v8;
  v137[132] = CFSTR("RightAlt");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 231);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v136[133] = v9;
  v137[133] = CFSTR("RightGUI");
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v137, v136, 134);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)nameForKeyCode_dict;
  nameForKeyCode_dict = v10;

}

unint64_t GCOverrideCurrentProcessLinkedOn(unint64_t a1)
{
  unint64_t result;

  result = mapFromVersionSet(a1);
  OverrideLinkedOn = result;
  return result;
}

unint64_t mapFromVersionSet(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  int *v5;
  int base_platform;
  void *v7;
  void *v8;

  v1 = HIDWORD(a1);
  if ((_DWORD)a1 == -1)
  {
    v2 = 0;
    while (dword_21526CD00[v2] != HIDWORD(a1))
    {
      v2 += 5;
      if (v2 == 25)
      {
        unk_254DEC4F8(&off_254DEC660, "currentHandler");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "dyld_build_version_t mapFromVersionSet(dyld_build_version_t)");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("GCUtility.m"), 729, CFSTR("No versionMap entry for combined version: %x.  Update versionMap!"), v1);

        v5 = 0;
        goto LABEL_7;
      }
    }
    v5 = &dword_21526CD00[v2];
LABEL_7:
    dyld_get_active_platform();
    base_platform = dyld_get_base_platform();
    if (base_platform <= 2)
    {
      if (base_platform == 1)
      {
        LODWORD(v1) = v5[1];
        LODWORD(a1) = 1;
        return a1 | ((unint64_t)v1 << 32);
      }
      if (base_platform == 2)
      {
        LODWORD(v1) = v5[2];
LABEL_17:
        LODWORD(a1) = 2;
        return a1 | ((unint64_t)v1 << 32);
      }
      goto LABEL_14;
    }
    if (base_platform == 3)
    {
      LODWORD(v1) = v5[3];
      goto LABEL_17;
    }
    if (base_platform != 11)
    {
LABEL_14:
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "dyld_build_version_t mapFromVersionSet(dyld_build_version_t)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("GCUtility.m"), 740, CFSTR("Unknown platform!"));

      LODWORD(a1) = 0;
      LODWORD(v1) = 0;
      return a1 | ((unint64_t)v1 << 32);
    }
    LODWORD(v1) = v5[4];
    LODWORD(a1) = 11;
  }
  return a1 | ((unint64_t)v1 << 32);
}

uint64_t GCCurrentProcessLinkedOnAfter(unint64_t a1)
{
  unint64_t v1;

  if (!(_DWORD)OverrideLinkedOn)
    return dyld_program_sdk_at_least();
  v1 = mapFromVersionSet(a1);
  return (_DWORD)OverrideLinkedOn == (_DWORD)v1 && HIDWORD(OverrideLinkedOn) >= HIDWORD(v1);
}

id loadNSDictionaryFromJSON(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  +[NSBundle bundleForClass:](&off_254DF2768, "bundleForClass:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", v3, CFSTR("json"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSData dataWithContentsOfFile:options:error:](&off_254DEDA10, "dataWithContentsOfFile:options:error:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSJSONSerialization JSONObjectWithData:options:error:](&off_254DF3160, "JSONObjectWithData:options:error:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    loadNSDictionaryFromJSON_cold_1();

  return v7;
}

uint64_t GCApplicationIsAlmond()
{
  void *v0;
  uint64_t v1;

  +[NSProcessInfo processInfo](&off_254DF29B0, "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isiOSAppOnMac");

  return v1;
}

uint64_t GCApplicationIsMacCatalyst()
{
  void *v0;
  uint64_t v1;

  +[NSProcessInfo processInfo](&off_254DF29B0, "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isMacCatalystApp");

  return v1;
}

uint64_t GCBypassMFiAuthentication()
{
  if (GCBypassMFiAuthentication_onceToken != -1)
    dispatch_once(&GCBypassMFiAuthentication_onceToken, &__block_literal_global_183);
  return GCBypassMFiAuthentication_bypassMFiAuthentication;
}

const __CFString *GCFrameworkInitializationReasonToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_24D2B3578[a1 - 1];
}

void _keyboardDependentNotificationInit()
{
  if (_keyboardDependentNotificationInit_onceToken != -1)
    dispatch_once(&_keyboardDependentNotificationInit_onceToken, &__block_literal_global_89);
}

uint64_t ___keyboardDependentNotificationInit_block_invoke()
{
  return +[GCFrameworkInitialization enableKeyboardSupportWithReason:](GCFrameworkInitialization, "enableKeyboardSupportWithReason:", 1);
}

void _mouseDependentNotificationInit()
{
  if (_mouseDependentNotificationInit_onceToken != -1)
    dispatch_once(&_mouseDependentNotificationInit_onceToken, &__block_literal_global_90);
}

uint64_t ___mouseDependentNotificationInit_block_invoke()
{
  return +[GCFrameworkInitialization enableMouseSupportWithReason:](GCFrameworkInitialization, "enableMouseSupportWithReason:", 1);
}

void _controllerDependentNotificationInit()
{
  if (_controllerDependentNotificationInit_onceToken != -1)
    dispatch_once(&_controllerDependentNotificationInit_onceToken, &__block_literal_global_91);
}

uint64_t ___controllerDependentNotificationInit_block_invoke()
{
  return +[GCFrameworkInitialization enableControllerSupportWithReason:](GCFrameworkInitialization, "enableControllerSupportWithReason:", 1);
}

void HandleReport(void *a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  id v10;
  void *v11;
  double v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  unsigned int v36;
  float v37;
  NSObject *v38;
  __int16 v39;
  double v40;
  unsigned __int16 *v41;
  __int16 v42;
  int v43;
  double v44;
  int v45;
  double v46;
  int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  int v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  unsigned int v84;
  int v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  SEL v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t i;
  NSObject *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  v10 = a1;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
      HandleReport_cold_5();

    if (a4)
      goto LABEL_283;
  }
  else if (a4)
  {
    goto LABEL_283;
  }
  if (*((_QWORD *)v10 + 7) == a3)
  {
    v11 = (void *)objc_opt_new();
    v13 = v11;
    switch(*((_DWORD *)v10 + 19))
    {
      case 0:
        if (a5 == 1)
        {
          LODWORD(v12) = 1.0;
          v14 = *(_DWORD *)(a6 + 1) & 0xF;
          if (v14)
          {
            LODWORD(v12) = 0;
            if (v14 == 1)
              *(float *)&v12 = 1.0;
            if (v14 == 7)
              *(float *)&v12 = 1.0;
          }
          objc_msgSend(v11, "setDpadUpValue:", v12);
          if ((*(_DWORD *)(a6 + 1) & 0xF) == 5)
            *(float *)&v15 = 1.0;
          else
            *(float *)&v15 = 0.0;
          if ((*(_DWORD *)(a6 + 1) & 0xFu) - 3 < 2)
            *(float *)&v15 = 1.0;
          objc_msgSend(v13, "setDpadDownValue:", v15);
          if ((*(_DWORD *)(a6 + 1) & 0xF) == 7)
            *(float *)&v16 = 1.0;
          else
            *(float *)&v16 = 0.0;
          if ((*(_DWORD *)(a6 + 1) & 0xFu) - 5 < 2)
            *(float *)&v16 = 1.0;
          objc_msgSend(v13, "setDpadLeftValue:", v16);
          if ((*(_DWORD *)(a6 + 1) & 0xF) == 3)
            *(float *)&v17 = 1.0;
          else
            *(float *)&v17 = 0.0;
          if ((*(_DWORD *)(a6 + 1) & 0xFu) - 1 < 2)
            *(float *)&v17 = 1.0;
          objc_msgSend(v13, "setDpadRightValue:", v17);
          if ((*(_DWORD *)(a6 + 1) & 0x10) != 0)
            *(float *)&v18 = 1.0;
          else
            *(float *)&v18 = 0.0;
          objc_msgSend(v13, "setButtonAValue:", v18);
          if ((*(_DWORD *)(a6 + 1) & 0x20) != 0)
            *(float *)&v19 = 1.0;
          else
            *(float *)&v19 = 0.0;
          objc_msgSend(v13, "setButtonBValue:", v19);
          if ((*(_DWORD *)(a6 + 1) & 0x80) != 0)
            *(float *)&v20 = 1.0;
          else
            *(float *)&v20 = 0.0;
          objc_msgSend(v13, "setButtonYValue:", v20);
          if ((*(_DWORD *)(a6 + 1) & 0x40) != 0)
            *(float *)&v21 = 1.0;
          else
            *(float *)&v21 = 0.0;
          objc_msgSend(v13, "setButtonXValue:", v21);
          if ((*(_DWORD *)(a6 + 1) & 0x800) != 0)
            *(float *)&v22 = 1.0;
          else
            *(float *)&v22 = 0.0;
          objc_msgSend(v13, "setLeftTrigger:", v22);
          if ((*(_DWORD *)(a6 + 1) & 0x400) != 0)
            *(float *)&v23 = 1.0;
          else
            *(float *)&v23 = 0.0;
          objc_msgSend(v13, "setRightTrigger:", v23);
          if ((*(_DWORD *)(a6 + 1) & 0x2000) != 0)
            *(float *)&v24 = 1.0;
          else
            *(float *)&v24 = 0.0;
          objc_msgSend(v13, "setLeftThumbstickButton:", v24);
          if ((*(_DWORD *)(a6 + 1) & 0x1000) != 0)
            *(float *)&v25 = 1.0;
          else
            *(float *)&v25 = 0.0;
          objc_msgSend(v13, "setRightThumbstickButton:", v25);
          if ((*(_DWORD *)(a6 + 1) & 0x200) != 0)
            *(float *)&v26 = 1.0;
          else
            *(float *)&v26 = 0.0;
          objc_msgSend(v13, "setButtonLeftShoulder:", v26);
          if ((*(_DWORD *)(a6 + 1) & 0x100) != 0)
            *(float *)&v27 = 1.0;
          else
            *(float *)&v27 = 0.0;
          objc_msgSend(v13, "setButtonRightShoulder:", v27);
          if ((*(_DWORD *)(a6 + 1) & 0x4000) != 0)
            *(float *)&v28 = 1.0;
          else
            *(float *)&v28 = 0.0;
          objc_msgSend(v13, "setButtonHome:", v28);
          if ((*(_DWORD *)(a6 + 1) & 0x400) != 0)
            *(float *)&v29 = 1.0;
          else
            *(float *)&v29 = 0.0;
          objc_msgSend(v13, "setButtonMenu:", v29);
          if ((*(_DWORD *)(a6 + 1) & 0x800) != 0)
            *(float *)&v30 = 1.0;
          else
            *(float *)&v30 = 0.0;
          objc_msgSend(v13, "setButtonOptions:", v30);
          *(float *)&v31 = (float)(*(unsigned __int8 *)(a6 + 7) ^ 0xFFu) / 255.0;
          objc_msgSend(v13, "setButtonSpecial0:", v31);
          *(float *)&v32 = (float)~(*(_DWORD *)(a6 + 7) >> 8) / 255.0;
          objc_msgSend(v13, "setButtonSpecial1:", v32);
          *(float *)&v33 = (float)(*(unsigned __int8 *)(a6 + 9) ^ 0xFFu) / 255.0;
          objc_msgSend(v13, "setButtonSpecial2:", v33);
          *(float *)&v34 = (float)(*(unsigned __int16 *)(a6 + 5) - 0x7FFF) / 32767.0;
          objc_msgSend(v13, "setButtonSpecial3:", v34);
          v36 = (*(_DWORD *)(a6 + 1) >> 15) & 0x7F;
          if (v36 <= 0xF)
          {
            v37 = -1.0;
            switch(v36)
            {
              case 1u:
                goto LABEL_274;
              case 2u:
                goto LABEL_127;
              case 4u:
                goto LABEL_264;
              case 8u:
                goto LABEL_269;
              default:
                goto LABEL_273;
            }
            goto LABEL_274;
          }
          goto LABEL_138;
        }
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            HandleReport_cold_1();
          goto LABEL_281;
        }
        goto LABEL_282;
      case 1:
        if (!a5)
        {
          v37 = 1.0;
          LODWORD(v12) = 1.0;
          v63 = *(_DWORD *)a6 & 0xF;
          if (v63)
          {
            LODWORD(v12) = 0;
            if (v63 == 1)
              *(float *)&v12 = 1.0;
            if (v63 == 7)
              *(float *)&v12 = 1.0;
          }
          objc_msgSend(v11, "setDpadUpValue:", v12);
          if ((*(_DWORD *)a6 & 0xF) == 5)
            *(float *)&v64 = 1.0;
          else
            *(float *)&v64 = 0.0;
          if ((*(_DWORD *)a6 & 0xFu) - 3 < 2)
            *(float *)&v64 = 1.0;
          objc_msgSend(v13, "setDpadDownValue:", v64);
          if ((*(_DWORD *)a6 & 0xF) == 7)
            *(float *)&v65 = 1.0;
          else
            *(float *)&v65 = 0.0;
          if ((*(_DWORD *)a6 & 0xFu) - 5 < 2)
            *(float *)&v65 = 1.0;
          objc_msgSend(v13, "setDpadLeftValue:", v65);
          if ((*(_DWORD *)a6 & 0xF) == 3)
            *(float *)&v66 = 1.0;
          else
            *(float *)&v66 = 0.0;
          if ((*(_DWORD *)a6 & 0xFu) - 1 < 2)
            *(float *)&v66 = 1.0;
          objc_msgSend(v13, "setDpadRightValue:", v66);
          if ((*(_DWORD *)a6 & 0x10) != 0)
            *(float *)&v67 = 1.0;
          else
            *(float *)&v67 = 0.0;
          objc_msgSend(v13, "setButtonAValue:", v67);
          if ((*(_DWORD *)a6 & 0x40) != 0)
            *(float *)&v68 = 1.0;
          else
            *(float *)&v68 = 0.0;
          objc_msgSend(v13, "setButtonBValue:", v68);
          if ((*(_DWORD *)a6 & 0x80) != 0)
            *(float *)&v69 = 1.0;
          else
            *(float *)&v69 = 0.0;
          objc_msgSend(v13, "setButtonYValue:", v69);
          if ((*(_DWORD *)a6 & 0x20) != 0)
            *(float *)&v70 = 1.0;
          else
            *(float *)&v70 = 0.0;
          objc_msgSend(v13, "setButtonXValue:", v70);
          if ((*(_DWORD *)a6 & 0x800) != 0)
            *(float *)&v71 = 1.0;
          else
            *(float *)&v71 = 0.0;
          objc_msgSend(v13, "setLeftTrigger:", v71);
          if ((*(_DWORD *)a6 & 0x400) != 0)
            *(float *)&v72 = 1.0;
          else
            *(float *)&v72 = 0.0;
          objc_msgSend(v13, "setRightTrigger:", v72);
          if ((*(_DWORD *)a6 & 0x8000) != 0)
            *(float *)&v73 = 1.0;
          else
            *(float *)&v73 = 0.0;
          objc_msgSend(v13, "setLeftThumbstickButton:", v73);
          if ((*(_DWORD *)a6 & 0x4000) != 0)
            *(float *)&v74 = 1.0;
          else
            *(float *)&v74 = 0.0;
          objc_msgSend(v13, "setRightThumbstickButton:", v74);
          if ((*(_DWORD *)a6 & 0x200) != 0)
            *(float *)&v75 = 1.0;
          else
            *(float *)&v75 = 0.0;
          objc_msgSend(v13, "setButtonLeftShoulder:", v75);
          if ((*(_DWORD *)a6 & 0x100) != 0)
            *(float *)&v76 = 1.0;
          else
            *(float *)&v76 = 0.0;
          objc_msgSend(v13, "setButtonRightShoulder:", v76);
          if ((*(_DWORD *)a6 & 0x10000000) != 0)
            *(float *)&v77 = 1.0;
          else
            *(float *)&v77 = 0.0;
          objc_msgSend(v13, "setButtonHome:", v77);
          if ((*(_DWORD *)a6 & 0x2000) != 0)
            *(float *)&v78 = 1.0;
          else
            *(float *)&v78 = 0.0;
          objc_msgSend(v13, "setButtonOptions:", v78);
          if ((*(_DWORD *)a6 & 0x1000) != 0)
            *(float *)&v79 = 1.0;
          else
            *(float *)&v79 = 0.0;
          objc_msgSend(v13, "setButtonSpecial15:", v79);
          *(float *)&v80 = (float)(*(unsigned __int8 *)(a6 + 6) ^ 0xFFu) / 255.0;
          objc_msgSend(v13, "setButtonSpecial0:", v80);
          *(float *)&v81 = (float)(*(unsigned __int8 *)(a6 + 7) ^ 0xFFu) / 255.0;
          objc_msgSend(v13, "setButtonSpecial1:", v81);
          *(float *)&v82 = (float)(~(*(unsigned __int8 *)(a6 + 8) << 16) >> 16) / 255.0;
          objc_msgSend(v13, "setButtonSpecial2:", v82);
          *(float *)&v83 = (float)(*(unsigned __int16 *)(a6 + 4) - 0x7FFF) / 32767.0;
          objc_msgSend(v13, "setButtonSpecial3:", v83);
          v84 = *(_WORD *)(a6 + 2) & 0x7F;
          if (v84 <= 0xF)
          {
            switch(*(_WORD *)(a6 + 2) & 0x7F)
            {
              case 1:
                goto LABEL_274;
              case 2:
                goto LABEL_264;
              case 4:
                goto LABEL_269;
              case 8:
                goto LABEL_270;
              default:
                goto LABEL_273;
            }
            goto LABEL_274;
          }
          goto LABEL_265;
        }
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            HandleReport_cold_2();
          goto LABEL_281;
        }
        goto LABEL_282;
      case 2:
        if (a5 == 1)
        {
          v39 = *(_WORD *)(a6 + 1);
          LODWORD(v12) = 1.0;
          if ((v39 & 0xF) != 0)
          {
            LODWORD(v12) = 0;
            if ((v39 & 0xF) == 1)
              *(float *)&v12 = 1.0;
            if ((*(_WORD *)(a6 + 1) & 0xF) == 7)
              *(float *)&v12 = 1.0;
          }
          objc_msgSend(v11, "setDpadUpValue:", v12);
          v42 = *(_WORD *)(a6 + 1);
          v41 = (unsigned __int16 *)(a6 + 1);
          v43 = v42 & 0xF;
          if (v43 == 5)
            *(float *)&v40 = 1.0;
          else
            *(float *)&v40 = 0.0;
          if ((v43 - 3) < 2)
            *(float *)&v40 = 1.0;
          objc_msgSend(v13, "setDpadDownValue:", v40);
          v45 = *v41 & 0xF;
          if (v45 == 7)
            *(float *)&v44 = 1.0;
          else
            *(float *)&v44 = 0.0;
          if ((v45 - 5) < 2)
            *(float *)&v44 = 1.0;
          objc_msgSend(v13, "setDpadLeftValue:", v44);
          v47 = *v41 & 0xF;
          if (v47 == 3)
            *(float *)&v46 = 1.0;
          else
            *(float *)&v46 = 0.0;
          if ((v47 - 1) < 2)
            *(float *)&v46 = 1.0;
          objc_msgSend(v13, "setDpadRightValue:", v46);
          if ((*v41 & 0x10) != 0)
            *(float *)&v48 = 1.0;
          else
            *(float *)&v48 = 0.0;
          objc_msgSend(v13, "setButtonAValue:", v48);
          if ((*v41 & 0x20) != 0)
            *(float *)&v49 = 1.0;
          else
            *(float *)&v49 = 0.0;
          objc_msgSend(v13, "setButtonBValue:", v49);
          if ((*v41 & 0x80) != 0)
            *(float *)&v50 = 1.0;
          else
            *(float *)&v50 = 0.0;
          objc_msgSend(v13, "setButtonYValue:", v50);
          if ((*v41 & 0x40) != 0)
            *(float *)&v51 = 1.0;
          else
            *(float *)&v51 = 0.0;
          objc_msgSend(v13, "setButtonXValue:", v51);
          if ((*v41 & 0x800) != 0)
            *(float *)&v52 = 1.0;
          else
            *(float *)&v52 = 0.0;
          objc_msgSend(v13, "setLeftTrigger:", v52);
          if ((*v41 & 0x400) != 0)
            *(float *)&v53 = 1.0;
          else
            *(float *)&v53 = 0.0;
          objc_msgSend(v13, "setRightTrigger:", v53);
          if ((*v41 & 0x2000) != 0)
            *(float *)&v54 = 1.0;
          else
            *(float *)&v54 = 0.0;
          objc_msgSend(v13, "setLeftThumbstickButton:", v54);
          if ((*v41 & 0x1000) != 0)
            *(float *)&v55 = 1.0;
          else
            *(float *)&v55 = 0.0;
          objc_msgSend(v13, "setRightThumbstickButton:", v55);
          if ((*v41 & 0x200) != 0)
            *(float *)&v56 = 1.0;
          else
            *(float *)&v56 = 0.0;
          objc_msgSend(v13, "setButtonLeftShoulder:", v56);
          if ((*v41 & 0x100) != 0)
            *(float *)&v57 = 1.0;
          else
            *(float *)&v57 = 0.0;
          objc_msgSend(v13, "setButtonRightShoulder:", v57);
          if ((*v41 & 0x4000) != 0)
            *(float *)&v58 = 1.0;
          else
            *(float *)&v58 = 0.0;
          objc_msgSend(v13, "setButtonHome:", v58);
          *(float *)&v59 = (float)(*((unsigned __int8 *)v41 + 5) ^ 0xFFu) / 255.0;
          objc_msgSend(v13, "setButtonSpecial0:", v59);
          *(float *)&v60 = (float)~(*(_DWORD *)((char *)v41 + 5) >> 8) / 255.0;
          objc_msgSend(v13, "setButtonSpecial1:", v60);
          *(float *)&v61 = (float)(*((unsigned __int8 *)v41 + 7) ^ 0xFFu) / 255.0;
          objc_msgSend(v13, "setButtonSpecial2:", v61);
          *(float *)&v62 = (float)(*(unsigned __int16 *)((char *)v41 + 3) - 0x7FFF) / 32767.0;
          objc_msgSend(v13, "setButtonSpecial3:", v62);
          v36 = ((*v41 | (*((unsigned __int8 *)v41 + 2) << 16)) >> 15) & 0x7F;
          if (v36 <= 0xF)
          {
            v37 = -1.0;
            switch(v36)
            {
              case 1u:
                goto LABEL_274;
              case 2u:
LABEL_127:
                v37 = 1.0;
                break;
              case 4u:
                goto LABEL_264;
              case 8u:
                goto LABEL_269;
              default:
                goto LABEL_273;
            }
            goto LABEL_274;
          }
LABEL_138:
          switch(v36)
          {
            case 0x10u:
LABEL_270:
              v37 = 4.0;
              goto LABEL_274;
            case 0x20u:
              goto LABEL_272;
            case 0x40u:
              goto LABEL_271;
          }
          goto LABEL_273;
        }
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            HandleReport_cold_3();
          goto LABEL_281;
        }
        goto LABEL_282;
      case 3:
        if (a5)
        {
          if (!gc_isInternalBuild())
          {
LABEL_282:

            break;
          }
          getGCLogger();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            HandleReport_cold_4();
        }
        else
        {
          v37 = 1.0;
          LODWORD(v12) = 1.0;
          v85 = *(_DWORD *)a6 & 0xF;
          if (v85)
          {
            LODWORD(v12) = 0;
            if (v85 == 1)
              *(float *)&v12 = 1.0;
            if (v85 == 7)
              *(float *)&v12 = 1.0;
          }
          objc_msgSend(v11, "setDpadUpValue:", v12);
          if ((*(_DWORD *)a6 & 0xF) == 5)
            *(float *)&v86 = 1.0;
          else
            *(float *)&v86 = 0.0;
          if ((*(_DWORD *)a6 & 0xFu) - 3 < 2)
            *(float *)&v86 = 1.0;
          objc_msgSend(v13, "setDpadDownValue:", v86);
          if ((*(_DWORD *)a6 & 0xF) == 7)
            *(float *)&v87 = 1.0;
          else
            *(float *)&v87 = 0.0;
          if ((*(_DWORD *)a6 & 0xFu) - 5 < 2)
            *(float *)&v87 = 1.0;
          objc_msgSend(v13, "setDpadLeftValue:", v87);
          if ((*(_DWORD *)a6 & 0xF) == 3)
            *(float *)&v88 = 1.0;
          else
            *(float *)&v88 = 0.0;
          if ((*(_DWORD *)a6 & 0xFu) - 1 < 2)
            *(float *)&v88 = 1.0;
          objc_msgSend(v13, "setDpadRightValue:", v88);
          if ((*(_DWORD *)a6 & 0x10) != 0)
            *(float *)&v89 = 1.0;
          else
            *(float *)&v89 = 0.0;
          objc_msgSend(v13, "setButtonAValue:", v89);
          if ((*(_DWORD *)a6 & 0x40) != 0)
            *(float *)&v90 = 1.0;
          else
            *(float *)&v90 = 0.0;
          objc_msgSend(v13, "setButtonBValue:", v90);
          if ((*(_DWORD *)a6 & 0x80) != 0)
            *(float *)&v91 = 1.0;
          else
            *(float *)&v91 = 0.0;
          objc_msgSend(v13, "setButtonYValue:", v91);
          if ((*(_DWORD *)a6 & 0x20) != 0)
            *(float *)&v92 = 1.0;
          else
            *(float *)&v92 = 0.0;
          objc_msgSend(v13, "setButtonXValue:", v92);
          if ((*(_DWORD *)a6 & 0x800) != 0)
            *(float *)&v93 = 1.0;
          else
            *(float *)&v93 = 0.0;
          objc_msgSend(v13, "setLeftTrigger:", v93);
          if ((*(_DWORD *)a6 & 0x400) != 0)
            *(float *)&v94 = 1.0;
          else
            *(float *)&v94 = 0.0;
          objc_msgSend(v13, "setRightTrigger:", v94);
          if ((*(_DWORD *)a6 & 0x8000) != 0)
            *(float *)&v95 = 1.0;
          else
            *(float *)&v95 = 0.0;
          objc_msgSend(v13, "setLeftThumbstickButton:", v95);
          if ((*(_DWORD *)a6 & 0x4000) != 0)
            *(float *)&v96 = 1.0;
          else
            *(float *)&v96 = 0.0;
          objc_msgSend(v13, "setRightThumbstickButton:", v96);
          if ((*(_DWORD *)a6 & 0x200) != 0)
            *(float *)&v97 = 1.0;
          else
            *(float *)&v97 = 0.0;
          objc_msgSend(v13, "setButtonLeftShoulder:", v97);
          if ((*(_DWORD *)a6 & 0x100) != 0)
            *(float *)&v98 = 1.0;
          else
            *(float *)&v98 = 0.0;
          objc_msgSend(v13, "setButtonRightShoulder:", v98);
          if ((*(_DWORD *)a6 & 0x10000000) != 0)
            *(float *)&v99 = 1.0;
          else
            *(float *)&v99 = 0.0;
          objc_msgSend(v13, "setButtonHome:", v99);
          if ((*(_DWORD *)a6 & 0x2000) != 0)
            *(float *)&v100 = 1.0;
          else
            *(float *)&v100 = 0.0;
          objc_msgSend(v13, "setButtonOptions:", v100);
          if ((*(_DWORD *)a6 & 0x1000) != 0)
            *(float *)&v101 = 1.0;
          else
            *(float *)&v101 = 0.0;
          objc_msgSend(v13, "setButtonSpecial15:", v101);
          *(float *)&v102 = (float)(*(unsigned __int8 *)(a6 + 6) ^ 0xFFu) / 255.0;
          objc_msgSend(v13, "setButtonSpecial0:", v102);
          *(float *)&v103 = (float)(*(unsigned __int8 *)(a6 + 7) ^ 0xFFu) / 255.0;
          objc_msgSend(v13, "setButtonSpecial1:", v103);
          *(float *)&v104 = (float)(~(*(unsigned __int8 *)(a6 + 8) << 16) >> 16) / 255.0;
          objc_msgSend(v13, "setButtonSpecial2:", v104);
          *(float *)&v105 = (float)(*(unsigned __int16 *)(a6 + 4) - 0x7FFF) / 32767.0;
          objc_msgSend(v13, "setButtonSpecial3:", v105);
          v84 = *(_WORD *)(a6 + 2) & 0x7F;
          if (v84 > 0xF)
          {
LABEL_265:
            switch(v84)
            {
              case 0x10u:
LABEL_272:
                v37 = 5.0;
                break;
              case 0x20u:
LABEL_271:
                v37 = 6.0;
                break;
              case 0x40u:
                v37 = -1.0;
                break;
              default:
LABEL_273:
                v37 = 0.0;
                break;
            }
          }
          else
          {
            switch(*(_WORD *)(a6 + 2) & 0x7F)
            {
              case 1:
                break;
              case 2:
LABEL_264:
                v37 = 2.0;
                break;
              case 4:
LABEL_269:
                v37 = 3.0;
                break;
              case 8:
                goto LABEL_270;
              default:
                goto LABEL_273;
            }
          }
LABEL_274:
          *(float *)&v35 = v37;
          objc_msgSend(v13, "setButtonSpecial4:", v35);
          v38 = objc_getProperty(v10, v106, 144, 1);
          v112 = 0u;
          v113 = 0u;
          v114 = 0u;
          v115 = 0u;
          v107 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v112, v116, 16);
          if (v107)
          {
            v108 = v107;
            v109 = *(_QWORD *)v113;
            do
            {
              for (i = 0; i != v108; ++i)
              {
                if (*(_QWORD *)v113 != v109)
                  objc_enumerationMutation(v38);
                (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * i) + 16))();
              }
              v108 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v112, v116, 16);
            }
            while (v108);
          }
        }
LABEL_281:

        goto LABEL_282;
      default:
        goto LABEL_282;
    }
  }
LABEL_283:

}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

__CFString *GCInputBackLeftButton(uint64_t a1)
{
  id v2;

  if (a1 < 0)
  {
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("*** Back button names begin at position '0'.  Position '%zd' is not valid."), a1);
    +[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v2);
  }
  if (!a1)
    return CFSTR("Back Left Button 0");
  if (a1 == 1)
    return CFSTR("Back Left Button 1");
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("Back Left Button %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *GCInputBackRightButton(uint64_t a1)
{
  id v2;

  if (a1 < 0)
  {
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("*** Back button names begin at position '0'.  Position '%zd' is not valid."), a1);
    +[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v2);
  }
  if (!a1)
    return CFSTR("Back Right Button 0");
  if (a1 == 1)
    return CFSTR("Back Right Button 1");
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("Back Right Button %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

GCInputButtonName GCInputArcadeButtonName(NSInteger row, NSInteger column)
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("Arcade Button %ld, %ld"), row, column);
}

NSString *GCInputAuxiliaryMouseButtonName(uint64_t a1)
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("Button %ld"), a1);
}

id GCControllerServiceRemoteClientInterface()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD1070);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_class();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_publishControllers_, 0, 0);

  GCIPCObjectIdentifier_Classes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_opt_class();
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_unpublishControllersWithIdentifiers_, 0, 0);

  return v0;
}

id GCControllerServiceRemoteServerInterface()
{
  void *v0;
  uint64_t v1;
  void *v2;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD56C0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_class();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_fetchControllerDescriptionsWithReply_, 0, 1);

  return v0;
}

void sub_2151A7604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2151A7D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCMotionXPCProxyRemoteClientEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DC7CE8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

id GCMotionXPCProxyRemoteServerEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DC7DF0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

NSXPCInterface *GCMotionXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD1520);
}

id GCMotionXPCProxyServiceRemoteServerInterface()
{
  void *v0;
  void *v1;
  void *v2;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD5930);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCMotionXPCProxyRemoteClientEndpointInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_motionXPCProxyServiceClientEndpointConnect_reply_, 0, 0);

  GCMotionXPCProxyRemoteServerEndpointInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_motionXPCProxyServiceClientEndpointConnect_reply_, 0, 1);

  return v0;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id GCIPCObjectIdentifier_Classes()
{
  if (GCIPCObjectIdentifier_Classes_onceToken != -1)
    dispatch_once(&GCIPCObjectIdentifier_Classes_onceToken, &__block_literal_global_8);
  return (id)GCIPCObjectIdentifier_Classes_IPCObjectIdentifierTypes;
}

void sub_2151A8C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_2151A8EBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151AB9A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_2151ABBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2151ABDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_2151AC180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_2151AC2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_2151AC538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  void *v0;

  return objc_msgSend(v0, "objectSlotCount");
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  void *v0;

  return objc_msgSend(v0, "primitiveSlotCount");
}

NSXPCInterface *GCUserDefaultsXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEAD88);
}

id GCUserDefaultsXPCProxyServiceRemoteServerInterface()
{
  void *v0;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD0DE8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEAD88), sel_userDefaultsCheckIn_, 0, 0);
  return v0;
}

void sub_2151AFACC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2151AFB64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_2151AFCC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2151AFD9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2151AFF18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2151AFFD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id _GCHIDEventSourceDescription_Classes()
{
  if (_GCHIDEventSourceDescription_Classes_onceToken != -1)
    dispatch_once(&_GCHIDEventSourceDescription_Classes_onceToken, &__block_literal_global_9);
  return (id)_GCHIDEventSourceDescription_Classes_Classes;
}

void sub_2151B2A78(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_2151B30C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_2151B3350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_2151B3E64(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void DecodeJoyConRGBColor(void *a1, _BYTE *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a1;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("red"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("green"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("blue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          *a2 = objc_msgSend(v5, "intValue");
          a2[1] = objc_msgSend(v6, "intValue");
          a2[2] = objc_msgSend(v7, "intValue");
        }
      }
    }

    v4 = v8;
  }

}

void sub_2151B46A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;
  id *v18;
  id *v19;
  uint64_t v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v20 - 56));
  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_2151B4800(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151B5570(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151B5AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_2151B657C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2151B6CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCGameIntentXPCProxyRemoteClientEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DCAA20);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

id GCGameIntentXPCProxyRemoteServerEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DCAAB0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

NSXPCInterface *GCGameIntentXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD1850);
}

id GCGameIntentXPCProxyServiceRemoteServerInterface()
{
  void *v0;
  void *v1;
  void *v2;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD5A60);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCGameIntentXPCProxyRemoteClientEndpointInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_gameIntentXPCProxyServiceClientEndpointConnect_reply_, 0, 0);

  GCGameIntentXPCProxyRemoteServerEndpointInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_gameIntentXPCProxyServiceClientEndpointConnect_reply_, 0, 1);

  return v0;
}

void OUTLINED_FUNCTION_0_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t __deprecated_GCGamepad_Class()
{
  return objc_opt_class();
}

id getGCLogger()
{
  if (getGCLogger_onceToken != -1)
    dispatch_once(&getGCLogger_onceToken, &__block_literal_global_23);
  return (id)gcLogger;
}

void __getGCLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GameController", "default");
  v1 = (void *)gcLogger;
  gcLogger = (uint64_t)v0;

}

id getGCAppStateMonitorLogger()
{
  if (getGCAppStateMonitorLogger_onceToken != -1)
    dispatch_once(&getGCAppStateMonitorLogger_onceToken, &__block_literal_global_26);
  return (id)gcAppStateMonitorLogger;
}

void __getGCAppStateMonitorLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GameController", "monitor");
  v1 = (void *)gcAppStateMonitorLogger;
  gcAppStateMonitorLogger = (uint64_t)v0;

}

id getGCInitLogger()
{
  if (getGCInitLogger_onceToken != -1)
    dispatch_once(&getGCInitLogger_onceToken, &__block_literal_global_28);
  return (id)gcInitializationLogger;
}

void __getGCInitLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GameController", "init");
  v1 = (void *)gcInitializationLogger;
  gcInitializationLogger = (uint64_t)v0;

}

id getGCAnalyticsLogger()
{
  if (getGCAnalyticsLogger_onceToken != -1)
    dispatch_once(&getGCAnalyticsLogger_onceToken, &__block_literal_global_30);
  return (id)gcAnalyticsLogger;
}

void __getGCAnalyticsLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GameController", "analytics");
  v1 = (void *)gcAnalyticsLogger;
  gcAnalyticsLogger = (uint64_t)v0;

}

id getGCDLogger()
{
  if (getGCDLogger_onceToken != -1)
    dispatch_once(&getGCDLogger_onceToken, &__block_literal_global_32);
  return (id)gcdLogger;
}

void __getGCDLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GameController.Daemon", "default");
  v1 = (void *)gcdLogger;
  gcdLogger = (uint64_t)v0;

}

void setGCHIDLoggerCategory(char *category)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)gcHIDLogger;
  gcHIDLogger = (uint64_t)v1;

}

id getGCHIDLogger()
{
  if (getGCHIDLogger_onceToken != -1)
    dispatch_once(&getGCHIDLogger_onceToken, &__block_literal_global_35);
  return (id)gcHIDLogger;
}

void __getGCHIDLogger_block_invoke()
{
  if (!gcHIDLogger)
    objc_storeStrong((id *)&gcHIDLogger, MEMORY[0x24BDACB70]);
}

id getGCSettingsLogger()
{
  if (getGCSettingsLogger_onceToken != -1)
    dispatch_once(&getGCSettingsLogger_onceToken, &__block_literal_global_36);
  return (id)gcSettingsLogger;
}

void __getGCSettingsLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GameController.Settings", "default");
  v1 = (void *)gcSettingsLogger;
  gcSettingsLogger = (uint64_t)v0;

}

id getGCHapticsLogger()
{
  if (getGCHapticsLogger_onceToken != -1)
    dispatch_once(&getGCHapticsLogger_onceToken, &__block_literal_global_38);
  return (id)gcHapticsLogger;
}

void __getGCHapticsLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GameController.Haptics", "default");
  v1 = (void *)gcHapticsLogger;
  gcHapticsLogger = (uint64_t)v0;

}

id getGCSignpostLogger()
{
  if (getGCSignpostLogger_onceToken != -1)
    dispatch_once(&getGCSignpostLogger_onceToken, &__block_literal_global_40);
  return (id)gcSignpostLogger;
}

void __getGCSignpostLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller", "Signposts");
  v1 = (void *)gcSignpostLogger;
  gcSignpostLogger = (uint64_t)v0;

}

id getGCRuntimeIssuesLogger()
{
  if (getGCRuntimeIssuesLogger_onceToken != -1)
    dispatch_once(&getGCRuntimeIssuesLogger_onceToken, &__block_literal_global_42);
  return (id)gcRuntimeIssuesLogger;
}

void __getGCRuntimeIssuesLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runtime-issues", "GameController");
  v1 = (void *)gcRuntimeIssuesLogger;
  gcRuntimeIssuesLogger = (uint64_t)v0;

}

void sub_2151BB414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2151BBD54(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Unwind_Resume(a1);
}

uint64_t _publishCustomController(void *a1)
{
  id v1;
  int IsGameControllerDaemon;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location[2];

  v1 = a1;
  IsGameControllerDaemon = currentProcessIsGameControllerDaemon();
  if ((IsGameControllerDaemon & 1) == 0)
  {
    +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "physicalInputProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_GCXRComponent componentWithPhysicalInputProfile:](_GCXRComponent, "componentWithPhysicalInputProfile:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "XR Component: adding", (uint8_t *)location, 2u);
        }

      }
      objc_msgSend(v1, "_addComponent:", v5);
    }
    objc_initWeak(location, v3);
    objc_msgSend(v3, "controllersQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___publishCustomController_block_invoke;
    v9[3] = &unk_24D2B4268;
    objc_copyWeak(&v11, location);
    v10 = v1;
    dispatch_barrier_async(v6, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);

  }
  return IsGameControllerDaemon ^ 1u;
}

void sub_2151BC8D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ___publishCustomController_block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_onqueue_publishCustomController:", *(_QWORD *)(a1 + 32));

}

uint64_t _unpublishCustomController(void *a1)
{
  id v1;
  int IsGameControllerDaemon;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v1 = a1;
  IsGameControllerDaemon = currentProcessIsGameControllerDaemon();
  if ((IsGameControllerDaemon & 1) == 0)
  {
    +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v3);
    objc_msgSend(v3, "controllersQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___unpublishCustomController_block_invoke;
    block[3] = &unk_24D2B4268;
    objc_copyWeak(&v8, &location);
    v7 = v1;
    dispatch_barrier_async(v4, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
  return IsGameControllerDaemon ^ 1u;
}

void sub_2151BCA14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ___unpublishCustomController_block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_onqueue_unpublishCustomController:", *(_QWORD *)(a1 + 32));

}

void ConnectToDriverService(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (&unk_254DEADE8 == v7)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __ConnectToDriverService_block_invoke;
    v25[3] = &unk_24D2B4380;
    v12 = &v26;
    v26 = v10;
    objc_msgSend(v8, "connectToNintendoJoyConFusionGestureServiceWithClient:reply:", v9, v25);
  }
  else if (&unk_254DEAF08 == v7)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __ConnectToDriverService_block_invoke_2;
    v23[3] = &unk_24D2B43A8;
    v12 = &v24;
    v24 = v10;
    objc_msgSend(v8, "connectToLightServiceWithClient:reply:", v9, v23);
  }
  else if (&unk_254DEAF68 == v7)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __ConnectToDriverService_block_invoke_3;
    v21[3] = &unk_24D2B43D0;
    v12 = &v22;
    v22 = v10;
    objc_msgSend(v8, "connectToAdaptiveTriggersServiceWithClient:reply:", v9, v21);
  }
  else if (&unk_254DEAFC8 == v7)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __ConnectToDriverService_block_invoke_4;
    v19[3] = &unk_24D2B43F8;
    v12 = &v20;
    v20 = v10;
    objc_msgSend(v8, "connectToMotionServiceWithClient:reply:", v9, v19);
  }
  else if (&unk_254DEAE48 == v7)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __ConnectToDriverService_block_invoke_5;
    v17[3] = &unk_24D2B4420;
    v12 = &v18;
    v18 = v10;
    objc_msgSend(v8, "connectToBatteryServiceWithClient:reply:", v9, v17);
  }
  else if (&unk_254DEB028 == v7)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __ConnectToDriverService_block_invoke_6;
    v15[3] = &unk_24D2B4448;
    v12 = &v16;
    v16 = v10;
    objc_msgSend(v8, "connectToGameIntentServiceWithClient:reply:", v9, v15);
  }
  else
  {
    if (&unk_254DEB0B8 != v7)
      ConnectToDriverService_cold_1((uint64_t)v7);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __ConnectToDriverService_block_invoke_7;
    v13[3] = &unk_24D2B4470;
    v12 = &v14;
    v14 = v10;
    objc_msgSend(v8, "connectToGenericDeviceDriverConfigurationServiceWithClient:reply:", v9, v13);
  }

}

void sub_2151BD1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_2151BDB44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151BDBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2151BDCFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

NSXPCInterface *GCLightServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB118);
}

NSXPCInterface *GCLightServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB178);
}

void LogError(const char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  vsyslog(3, a1, va);
}

void LogWarning(const char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  vsyslog(4, a1, va);
}

id GCControllerComponent_Classes()
{
  if (GCControllerComponent_Classes_onceToken != -1)
    dispatch_once(&GCControllerComponent_Classes_onceToken, &__block_literal_global_191);
  return (id)GCControllerComponent_Classes_Classes;
}

id _GCControllerComponentDescription_Classes()
{
  if (_GCControllerComponentDescription_Classes_onceToken != -1)
    dispatch_once(&_GCControllerComponentDescription_Classes_onceToken, &__block_literal_global_209);
  return (id)_GCControllerComponentDescription_Classes_Classes;
}

void sub_2151C0B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_GCHapticServerManager;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2151C0DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  id *v16;
  id *v17;

  v17 = v16;
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2151C11AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_2151C1528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location, void *a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_2151C16C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2151C17F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2151C1A08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2151C1BD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2151C1FD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2151C20B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2151C21AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_2151C25CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_2151C2778(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2151C2824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_2151C2B80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL HapticSharedMemory::readCommand(HapticSharedMemory *this, HapticCommand *a2)
{
  _DWORD *mBuffer;
  int v3;
  uint64_t v4;
  unsigned __int16 *v6;
  size_t v7;
  int v8;
  uint64_t v9;
  HapticCommand *v10;
  char *v11;
  size_t v12;
  unsigned int v13;

  mBuffer = this->mBuffer;
  v3 = mBuffer[1];
  v4 = (int)mBuffer[2];
  if ((_DWORD)v4 != v3)
  {
    v6 = (unsigned __int16 *)((char *)mBuffer + v4 + 16);
    NSLog(CFSTR("about to copy %u bytes from memory starting at read index %u"), *v6, v4);
    v7 = *v6;
    if (!*v6)
      HapticSharedMemory::readCommand();
    if ((int)v4 + (int)v7 >= *mBuffer)
      v8 = *mBuffer;
    else
      v8 = 0;
    v9 = (v4 + v7 - v8);
    if ((int)v9 <= (int)v4)
    {
      v12 = (*mBuffer - v4);
      memcpy(a2, (char *)mBuffer + v4 + 16, v12);
      v13 = *v6;
      if (v12 >= v13)
      {
LABEL_11:
        NSLog(CFSTR("updating rb read index to %d"), v9);
        mBuffer[2] = v9;
        return (_DWORD)v4 != v3;
      }
      v10 = (HapticCommand *)((char *)a2 + v12);
      v7 = v13 - v12;
      v11 = (char *)(mBuffer + 4);
    }
    else
    {
      v10 = a2;
      v11 = (char *)mBuffer + v4 + 16;
    }
    memcpy(v10, v11, v7);
    goto LABEL_11;
  }
  return (_DWORD)v4 != v3;
}

void sub_2151C2E70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2151C3000(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2151C3948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{

  _Unwind_Resume(a1);
}

void sub_2151C3BDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2151C3F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2151C4350(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_2151C45C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2151C48B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2151C4C38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2151C4F30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_2151C5820(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

id _gc_log_device_physicalinput()
{
  if (_gc_log_device_physicalinput_onceToken != -1)
    dispatch_once(&_gc_log_device_physicalinput_onceToken, &__block_literal_global_17);
  return (id)_gc_log_device_physicalinput_Log;
}

void ___gc_log_device_physicalinput_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller", "PhysicalInput");
  v1 = (void *)_gc_log_device_physicalinput_Log;
  _gc_log_device_physicalinput_Log = (uint64_t)v0;

}

void sub_2151C8E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(&a13 + i));
  _Unwind_Resume(a1);
}

void sub_2151C9C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)&a9 + i));
  _Unwind_Resume(a1);
}

void sub_2151CE5FC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(v1 + i));
  _Unwind_Resume(a1);
}

void sub_2151CE828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

NSXPCInterface *GCVideoRelocationXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB238);
}

NSXPCInterface *GCVideoRelocationXPCProxyServiceRemoteServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB298);
}

void sub_2151CF450(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(v1 + i));
  _Unwind_Resume(a1);
}

void sub_2151D0854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)&a9 + i));
  _Unwind_Resume(a1);
}

void sub_2151D2FA8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(v1 + i));
  _Unwind_Resume(a1);
}

void __handleAncillaryButtonEvent_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "%@ pause event", (uint8_t *)&v10, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__deprecated_controllerPausedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__deprecated_controllerPausedHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
}

void __handleAncillaryButtonEvent_block_invoke_70(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "valueDidChangeHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

void __handleGameControllerExtendedEvent_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "valueDidChangeHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

void __handleGameControllerEvent_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "valueDidChangeHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

void sub_2151D45EC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(v1 + i));
  _Unwind_Resume(a1);
}

void sub_2151D4C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2151D5310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;
  id *v18;
  id *v19;
  uint64_t v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v20 - 56));
  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_2151D5478(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151D6E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(&a27 + i));
  _Unwind_Resume(a1);
}

void sub_2151D753C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_12(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_2151D8354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)&a9 + i));
  _Unwind_Resume(a1);
}

uint64_t xAxisUpdateContext(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  int v5;

  v2 = xAxisUpdateContext_Offset;
  if (xAxisUpdateContext_Offset == -1)
  {
    xAxisUpdateContext_Offset = 2;
    v5 = +[_GCDevicePhysicalInputAxis2DInput updateContextSize](_GCDevicePhysicalInputAxis2DInput, "updateContextSize");
    v2 = xAxisUpdateContext_Offset + v5;
    xAxisUpdateContext_Offset += v5;
  }
  v3 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    v3 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_8 = v3;
    v2 = xAxisUpdateContext_Offset;
  }
  return a1 + v3 + v2;
}

uint64_t yAxisUpdateContext(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  int v5;
  int v6;

  v2 = yAxisUpdateContext_Offset;
  if (yAxisUpdateContext_Offset == -1)
  {
    yAxisUpdateContext_Offset = 2;
    v5 = +[_GCDevicePhysicalInputAxis2DInput updateContextSize](_GCDevicePhysicalInputAxis2DInput, "updateContextSize");
    yAxisUpdateContext_Offset += v5;
    v6 = +[_GCDevicePhysicalInputAxisInput updateContextSize](_GCDevicePhysicalInputAxisInput, "updateContextSize");
    v2 = yAxisUpdateContext_Offset + v6;
    yAxisUpdateContext_Offset += v6;
  }
  v3 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    v3 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_8 = v3;
    v2 = yAxisUpdateContext_Offset;
  }
  return a1 + v3 + v2;
}

uint64_t upButtonUpdateContext(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  int v5;
  int v6;
  int v7;

  v2 = upButtonUpdateContext_Offset;
  if (upButtonUpdateContext_Offset == -1)
  {
    upButtonUpdateContext_Offset = 2;
    v5 = +[_GCDevicePhysicalInputAxis2DInput updateContextSize](_GCDevicePhysicalInputAxis2DInput, "updateContextSize");
    upButtonUpdateContext_Offset += v5;
    v6 = +[_GCDevicePhysicalInputAxisInput updateContextSize](_GCDevicePhysicalInputAxisInput, "updateContextSize");
    upButtonUpdateContext_Offset += v6;
    v7 = +[_GCDevicePhysicalInputAxisInput updateContextSize](_GCDevicePhysicalInputAxisInput, "updateContextSize");
    v2 = upButtonUpdateContext_Offset + v7;
    upButtonUpdateContext_Offset += v7;
  }
  v3 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    v3 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_8 = v3;
    v2 = upButtonUpdateContext_Offset;
  }
  return a1 + v3 + v2;
}

uint64_t downButtonUpdateContext(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  int v5;
  int v6;
  int v7;
  int v8;

  v2 = downButtonUpdateContext_Offset;
  if (downButtonUpdateContext_Offset == -1)
  {
    downButtonUpdateContext_Offset = 2;
    v5 = +[_GCDevicePhysicalInputAxis2DInput updateContextSize](_GCDevicePhysicalInputAxis2DInput, "updateContextSize");
    downButtonUpdateContext_Offset += v5;
    v6 = +[_GCDevicePhysicalInputAxisInput updateContextSize](_GCDevicePhysicalInputAxisInput, "updateContextSize");
    downButtonUpdateContext_Offset += v6;
    v7 = +[_GCDevicePhysicalInputAxisInput updateContextSize](_GCDevicePhysicalInputAxisInput, "updateContextSize");
    downButtonUpdateContext_Offset += v7;
    v8 = +[_GCDevicePhysicalInputButtonInput updateContextSize](_GCDevicePhysicalInputButtonInput, "updateContextSize");
    v2 = downButtonUpdateContext_Offset + v8;
    downButtonUpdateContext_Offset += v8;
  }
  v3 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    v3 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_8 = v3;
    v2 = downButtonUpdateContext_Offset;
  }
  return a1 + v3 + v2;
}

uint64_t leftButtonUpdateContext(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v2 = leftButtonUpdateContext_Offset;
  if (leftButtonUpdateContext_Offset == -1)
  {
    leftButtonUpdateContext_Offset = 2;
    v5 = +[_GCDevicePhysicalInputAxis2DInput updateContextSize](_GCDevicePhysicalInputAxis2DInput, "updateContextSize");
    leftButtonUpdateContext_Offset += v5;
    v6 = +[_GCDevicePhysicalInputAxisInput updateContextSize](_GCDevicePhysicalInputAxisInput, "updateContextSize");
    leftButtonUpdateContext_Offset += v6;
    v7 = +[_GCDevicePhysicalInputAxisInput updateContextSize](_GCDevicePhysicalInputAxisInput, "updateContextSize");
    leftButtonUpdateContext_Offset += v7;
    v8 = +[_GCDevicePhysicalInputButtonInput updateContextSize](_GCDevicePhysicalInputButtonInput, "updateContextSize");
    leftButtonUpdateContext_Offset += v8;
    v9 = +[_GCDevicePhysicalInputButtonInput updateContextSize](_GCDevicePhysicalInputButtonInput, "updateContextSize");
    v2 = leftButtonUpdateContext_Offset + v9;
    leftButtonUpdateContext_Offset += v9;
  }
  v3 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    v3 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_8 = v3;
    v2 = leftButtonUpdateContext_Offset;
  }
  return a1 + v3 + v2;
}

uint64_t rightButtonUpdateContext(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v2 = rightButtonUpdateContext_Offset;
  if (rightButtonUpdateContext_Offset == -1)
  {
    rightButtonUpdateContext_Offset = 2;
    v5 = +[_GCDevicePhysicalInputAxis2DInput updateContextSize](_GCDevicePhysicalInputAxis2DInput, "updateContextSize");
    rightButtonUpdateContext_Offset += v5;
    v6 = +[_GCDevicePhysicalInputAxisInput updateContextSize](_GCDevicePhysicalInputAxisInput, "updateContextSize");
    rightButtonUpdateContext_Offset += v6;
    v7 = +[_GCDevicePhysicalInputAxisInput updateContextSize](_GCDevicePhysicalInputAxisInput, "updateContextSize");
    rightButtonUpdateContext_Offset += v7;
    v8 = +[_GCDevicePhysicalInputButtonInput updateContextSize](_GCDevicePhysicalInputButtonInput, "updateContextSize");
    rightButtonUpdateContext_Offset += v8;
    v9 = +[_GCDevicePhysicalInputButtonInput updateContextSize](_GCDevicePhysicalInputButtonInput, "updateContextSize");
    rightButtonUpdateContext_Offset += v9;
    v10 = +[_GCDevicePhysicalInputButtonInput updateContextSize](_GCDevicePhysicalInputButtonInput, "updateContextSize");
    v2 = rightButtonUpdateContext_Offset + v10;
    rightButtonUpdateContext_Offset += v10;
  }
  v3 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    v3 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_8 = v3;
    v2 = rightButtonUpdateContext_Offset;
  }
  return a1 + v3 + v2;
}

void sub_2151DD568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)&a9 + i));
  _Unwind_Resume(a1);
}

void sub_2151DF5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2151E07C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)&a9 + i));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

CFStringRef NSStringFromGCPoint2(float a1, float a2)
{
  return (id)CFStringCreateWithFormat(0, 0, CFSTR("{%.*g, %.*g}"), 6, a1, 6, a2);
}

void sub_2151E2514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2151E2E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCLightXPCProxyRemoteClientEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DCE5D8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

id GCLightXPCProxyRemoteServerEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DCE700);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

NSXPCInterface *GCLightXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD12F8);
}

id GCLightXPCProxyServiceRemoteServerInterface()
{
  void *v0;
  void *v1;
  void *v2;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD57F8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCLightXPCProxyRemoteClientEndpointInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_lightXPCProxyServiceClientEndpointConnect_reply_, 0, 0);

  GCLightXPCProxyRemoteServerEndpointInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_lightXPCProxyServiceClientEndpointConnect_reply_, 0, 1);

  return v0;
}

void OUTLINED_FUNCTION_0_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

NSXPCInterface *GCAdaptiveTriggersServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DCFA80);
}

NSXPCInterface *GCAdaptiveTriggersServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB358);
}

NSXPCInterface *GCNintendoJoyConFusionGestureServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DCA2D0);
}

NSXPCInterface *GCNintendoJoyConFusionGestureServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB3B8);
}

id _GCGamepadEventSourceDescription_Classes()
{
  if (_GCGamepadEventSourceDescription_Classes_onceToken != -1)
    dispatch_once(&_GCGamepadEventSourceDescription_Classes_onceToken, &__block_literal_global_19);
  return (id)_GCGamepadEventSourceDescription_Classes_Classes;
}

NSXPCInterface *GCPhotoVideoXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB418);
}

id GCPhotoVideoXPCProxyServiceRemoteServerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB478);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", objc_opt_class(), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_onVideoRecordingStart_, 0, 1);

  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_onVideoRecordingStopWithURL_reply_, 0, 0);

  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_onVideoRecordingStopWithURL_reply_, 0, 1);

  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_takeScreenshotWithReply_, 0, 1);

  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_generateURLFor_withReply_, 0, 0);

  v6 = objc_opt_class();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_generateURLFor_withReply_, 0, 1);

  return v0;
}

void sub_2151E63E8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)&STACK[0x5B0]);
  _Unwind_Resume(a1);
}

id getGKDaemonProxyClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getGKDaemonProxyClass_softClass;
  v7 = getGKDaemonProxyClass_softClass;
  if (!getGKDaemonProxyClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getGKDaemonProxyClass_block_invoke;
    v3[3] = &unk_24D2B4C40;
    v3[4] = &v4;
    __getGKDaemonProxyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2151E69D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getGKLocalPlayerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getGKLocalPlayerClass_softClass;
  v7 = getGKLocalPlayerClass_softClass;
  if (!getGKLocalPlayerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getGKLocalPlayerClass_block_invoke;
    v3[3] = &unk_24D2B4C40;
    v3[4] = &v4;
    __getGKLocalPlayerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2151E6A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getGKGameClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getGKGameClass_softClass;
  v7 = getGKGameClass_softClass;
  if (!getGKGameClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getGKGameClass_block_invoke;
    v3[3] = &unk_24D2B4C40;
    v3[4] = &v4;
    __getGKGameClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2151E6B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getGKDashboardLaunchContextGameController()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getGKDashboardLaunchContextGameControllerSymbolLoc_ptr;
  v6 = getGKDashboardLaunchContextGameControllerSymbolLoc_ptr;
  if (!getGKDashboardLaunchContextGameControllerSymbolLoc_ptr)
  {
    v1 = (void *)GameCenterFoundationLibrary();
    v0 = (id *)dlsym(v1, "GKDashboardLaunchContextGameController");
    v4[3] = (uint64_t)v0;
    getGKDashboardLaunchContextGameControllerSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getGKDashboardLaunchContextGameController_cold_1();
  return *v0;
}

void sub_2151E6BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_2151E7968(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151E7F3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151E8190(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151E830C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151E8568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  void *v16;
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_2151E87B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151E8830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2151E8970(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151E8A74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151E8B84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151E8CA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151E9198(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151E940C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151EA728(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151EAA78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151EACE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getGKDaemonProxyClass_block_invoke(uint64_t a1)
{
  Class result;

  GameCenterFoundationLibrary();
  result = objc_getClass("GKDaemonProxy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getGKDaemonProxyClass_block_invoke_cold_1();
  getGKDaemonProxyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t GameCenterFoundationLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!GameCenterFoundationLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D2B4C60;
    v3 = 0;
    GameCenterFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!GameCenterFoundationLibraryCore_frameworkLibrary)
    GameCenterFoundationLibrary_cold_1(&v1);
  return GameCenterFoundationLibraryCore_frameworkLibrary;
}

Class __getGKLocalPlayerClass_block_invoke(uint64_t a1)
{
  Class result;

  GameCenterFoundationLibrary();
  result = objc_getClass("GKLocalPlayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getGKLocalPlayerClass_block_invoke_cold_1();
  getGKLocalPlayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getGKGameClass_block_invoke(uint64_t a1)
{
  Class result;

  GameCenterFoundationLibrary();
  result = objc_getClass("GKGame");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getGKGameClass_block_invoke_cold_1();
  getGKGameClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_13(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id getLogger()
{
  if (getLogger_once != -1)
    dispatch_once(&getLogger_once, &__block_literal_global_136);
  return (id)getLogger_logger;
}

void sub_2151EC298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void __onqueue_3PSyntheticControllersChanged(void *a1, uint64_t a2)
{
  dispatch_queue_t *v3;
  NSObject *v4;
  os_activity_scope_state_s v5;

  v3 = a1;
  dispatch_assert_queue_V2(v3[2]);
  v4 = _os_activity_create(&dword_215181000, "[Synthetic Device Manager] Third-party synthetic game controllers changed", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v4, &v5);
  if ((_DWORD)a2)
    __3PSyntheticControllersDrainIterator(v3, a2);
  __onqueue_3PSyntheticControllersScan(v3);
  os_activity_scope_leave(&v5);

}

void sub_2151EC348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void __3PSyntheticControllersDrainIterator(void *a1, uint64_t a2)
{
  io_object_t v3;
  id v4;

  v4 = a1;
  while (1)
  {
    while (1)
    {
      v3 = IOIteratorNext(a2);
      if (!v3)
        break;
      IOObjectRelease(v3);
    }
    if (IOIteratorIsValid(a2))
      break;
    MEMORY[0x2199DE3DC](a2);
  }

}

void __onqueue_3PSyntheticControllersScan(void *a1)
{
  CFTypeRef *v1;
  mach_port_t v2;
  const __CFDictionary *v3;
  NSObject *v4;
  io_iterator_t v5;
  char *v6;
  io_object_t v7;
  io_iterator_t existing;

  v1 = a1;
  existing = 0;
  v2 = *MEMORY[0x24BDD8B18];
  v3 = (const __CFDictionary *)CFRetain(v1[8]);
  if (IOServiceGetMatchingServices(v2, v3, &existing))
  {
    getLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __onqueue_3PSyntheticControllersScan_cold_1();

  }
  v5 = existing;
  if (existing)
  {
    v6 = 0;
    while (1)
    {
      v7 = IOIteratorNext(v5);
      if (v7)
      {
        ++v6;
        IOObjectRelease(v7);
      }
      else
      {
        if (IOIteratorIsValid(existing))
          goto LABEL_13;
        MEMORY[0x2199DE3DC](existing);
        v6 = 0;
      }
      v5 = existing;
    }
  }
  v6 = 0;
LABEL_13:
  v1[10] = v6;
  -[GCSyntheticDeviceManager _onqueue_refreshSyntheticControllersEnabled]((uint64_t)v1);

}

void sub_2151EC8C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void __getLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GameController", "SyntheticDeviceManager");
  v1 = (void *)getLogger_logger;
  getLogger_logger = (uint64_t)v0;

}

void OUTLINED_FUNCTION_0_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_2151EDD14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2151EFF54(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2151F03D8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2151F0640(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2151F08A8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2151F0A98(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2151F1770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2151F1B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_2151F1F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2151F2454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2151F28B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2151F2B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_2151F3730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)&a9 + i));
  _Unwind_Resume(a1);
}

NSXPCInterface *GCMotionServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB4D8);
}

NSXPCInterface *GCMotionServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB538);
}

id _gc_log_virtualcontroller()
{
  if (_gc_log_virtualcontroller_onceToken != -1)
    dispatch_once(&_gc_log_virtualcontroller_onceToken, &__block_literal_global_21);
  return (id)_gc_log_virtualcontroller_Log;
}

void ___gc_log_virtualcontroller_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller", "VirtualController");
  v1 = (void *)_gc_log_virtualcontroller_Log;
  _gc_log_virtualcontroller_Log = (uint64_t)v0;

}

void GCAnalyticsSendVirtualControllerConnectedEvent(void *a1, void *a2, char a3)
{
  id v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v5 = a1;
  if (v5)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3254779904;
    v6[2] = __GCAnalyticsSendVirtualControllerConnectedEvent_block_invoke;
    v6[3] = &__block_descriptor_48_e8_32n11_8_8_s0_t8w1_e30___NSObject_OS_xpc_object__8__0l;
    v7 = a2;
    v8 = a3;
    objc_msgSend(v5, "sendEvent:withXPCPayloadBuilder:", CFSTR("com.apple.GameController.VirtualController.connected"), v6);

  }
}

void sub_2151F59E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

id __copy_helper_block_e8_32n11_8_8_s0_t8w1(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = result;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return result;
}

void __destroy_helper_block_e8_32n4_8_s0(uint64_t a1)
{

}

void sub_2151F5F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2151F67B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCSettingsXPCProxyRemoteClientEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD0758);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

id GCSettingsXPCProxyRemoteServerEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD0840);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

NSXPCInterface *GCSettingsXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD1740);
}

id GCSettingsXPCProxyServiceRemoteServerInterface()
{
  void *v0;
  void *v1;
  void *v2;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD5BC8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCSettingsXPCProxyRemoteClientEndpointInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_settingsXPCProxyServiceClientEndpointConnect_reply_, 0, 0);

  GCSettingsXPCProxyRemoteServerEndpointInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_settingsXPCProxyServiceClientEndpointConnect_reply_, 0, 1);

  return v0;
}

void OUTLINED_FUNCTION_0_17(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2151F8058(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2151F9B78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151FCB3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151FCD80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2151FCFC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getRPScreenRecorderClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRPScreenRecorderClass_softClass;
  v7 = getRPScreenRecorderClass_softClass;
  if (!getRPScreenRecorderClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getRPScreenRecorderClass_block_invoke;
    v3[3] = &unk_24D2B4C40;
    v3[4] = &v4;
    __getRPScreenRecorderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2151FD928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2151FDDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRPScreenRecorderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!ReplayKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D2B52A8;
    v5 = 0;
    ReplayKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ReplayKitLibraryCore_frameworkLibrary)
    __getRPScreenRecorderClass_block_invoke_cold_1(&v3);
  result = objc_getClass("RPScreenRecorder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRPScreenRecorderClass_block_invoke_cold_2();
  getRPScreenRecorderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_18(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2151FFE28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2152005E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

void sub_21520079C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215200978(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215200A3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215200AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_215200B84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_215201748(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t clientParamToSynthParam(int a1, float a2, unsigned int *a3, float *a4)
{
  float v4;
  BOOL v5;
  float v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v30;

  if (a1 <= 1019)
  {
    switch(a1)
    {
      case 1000:
        v4 = fminf(a2, 1.0);
        v5 = a2 <= 0.0;
        v6 = 0.0;
        if (!v5)
          v6 = v4;
        a1 = 5000;
        if (!a3)
          goto LABEL_71;
        goto LABEL_70;
      case 1001:
        v12 = fminf(a2, 1.0);
        if (a2 <= -1.0)
          v13 = -1.0;
        else
          v13 = v12;
        v6 = v13 * 0.5 + 0.5;
        a1 = 5001;
        if (!a3)
          goto LABEL_71;
        goto LABEL_70;
      case 1010:
        v14 = fminf(a2, 1.0);
        if (a2 <= -1.0)
          v15 = -1.0;
        else
          v15 = v14;
        v6 = (float)(v15 * 63.5) + 63.5;
        a1 = 73;
        if (!a3)
          goto LABEL_71;
        goto LABEL_70;
      case 1011:
        v16 = fminf(a2, 1.0);
        if (a2 <= -1.0)
          v17 = -1.0;
        else
          v17 = v16;
        v6 = (float)(v17 * 63.5) + 63.5;
        a1 = 75;
        if (!a3)
          goto LABEL_71;
        goto LABEL_70;
      case 1012:
        v18 = fminf(a2, 1.0);
        if (a2 <= -1.0)
          v19 = -1.0;
        else
          v19 = v18;
        v6 = (float)(v19 * 63.5) + 63.5;
        a1 = 72;
        if (!a3)
          goto LABEL_71;
        goto LABEL_70;
      case 1013:
        v20 = fminf(a2, 1.0);
        if (a2 <= -1.0)
          v21 = -1.0;
        else
          v21 = v20;
        v6 = v21 * 0.5 + 0.5;
        a1 = 5004;
        if (!a3)
          goto LABEL_71;
        goto LABEL_70;
      case 1015:
        v22 = fminf(a2, 1.0);
        if (a2 <= -1.0)
          v23 = -1.0;
        else
          v23 = v22;
        v6 = v23 * 0.5 + 0.5;
        a1 = 5011;
        if (!a3)
          goto LABEL_71;
        goto LABEL_70;
      default:
        goto LABEL_25;
    }
  }
  v7 = 4294967292;
  if (a1 <= 2009)
  {
    switch(a1)
    {
      case 1020:
        return v7;
      case 2000:
        v26 = fminf(a2, 1.0);
        v5 = a2 <= 0.0;
        v6 = 0.0;
        if (!v5)
          v6 = v26;
        a1 = 5002;
        if (!a3)
          goto LABEL_71;
        goto LABEL_70;
      case 2001:
        v10 = fminf(a2, 1.0);
        if (a2 <= -1.0)
          v11 = -1.0;
        else
          v11 = v10;
        v6 = v11 * 0.5 + 0.5;
        a1 = 5003;
        if (!a3)
          goto LABEL_71;
        goto LABEL_70;
    }
    goto LABEL_25;
  }
  if (a1 > 2011)
  {
    if (a1 == 2012)
    {
      v27 = fminf(a2, 1.0);
      if (a2 <= -1.0)
        v28 = -1.0;
      else
        v28 = v27;
      v6 = (float)(v28 * 63.5) + 63.5;
      a1 = 81;
      if (!a3)
        goto LABEL_71;
      goto LABEL_70;
    }
    if (a1 == 2020)
      return v7;
LABEL_25:
    if (a1 > 0xFF)
      return 4294962494;
    v30 = 127.0;
    if (a2 < 1.0)
      v30 = a2 * 127.0;
    v5 = a2 <= 0.0;
    v6 = 0.0;
    if (!v5)
      v6 = v30;
    if (!a3)
      goto LABEL_71;
    goto LABEL_70;
  }
  if (a1 == 2010)
  {
    v24 = fminf(a2, 1.0);
    if (a2 <= -1.0)
      v25 = -1.0;
    else
      v25 = v24;
    v6 = (float)(v25 * 63.5) + 63.5;
    a1 = 79;
    if (!a3)
      goto LABEL_71;
  }
  else
  {
    v8 = fminf(a2, 1.0);
    if (a2 <= -1.0)
      v9 = -1.0;
    else
      v9 = v8;
    v6 = (float)(v9 * 63.5) + 63.5;
    a1 = 80;
    if (!a3)
      goto LABEL_71;
  }
LABEL_70:
  *a3 = a1;
LABEL_71:
  v7 = 0;
  if (a4)
    *a4 = v6;
  return v7;
}

void sub_215201D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  a11.super_class = (Class)_GCHapticPlayer;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_19(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1_18(uint64_t result, uint64_t a2, double a3, float a4)
{
  *(float *)result = a4;
  *(_QWORD *)(result + 4) = a2;
  *(_WORD *)(result + 12) = 2048;
  *(double *)(result + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_2_17(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_5(uint64_t result, double a2, float a3)
{
  *(float *)result = a3;
  *(double *)(result + 4) = a2;
  return result;
}

id _gc_log_keyboard_and_mouse()
{
  if (_gc_log_keyboard_and_mouse_onceToken != -1)
    dispatch_once(&_gc_log_keyboard_and_mouse_onceToken, &__block_literal_global_24);
  return (id)_gc_log_keyboard_and_mouse_Log;
}

void ___gc_log_keyboard_and_mouse_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller", "Keyboard+Mouse");
  v1 = (void *)_gc_log_keyboard_and_mouse_Log;
  _gc_log_keyboard_and_mouse_Log = (uint64_t)v0;

}

void sub_2152034DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215204914(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215204D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_215204E80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _HIDEventCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v5;

  v5 = a2;
  IOHIDEventGetSenderID();
  IOHIDEventGetTimeStamp();
  IOHIDEventGetType();
  kdebug_trace();
  objc_msgSend(v5, "publishHIDEvent:", a4);

}

uint64_t _IOObjectCFRetain(int a1, uint64_t object)
{
  if (IOObjectRetain(object))
    return 0;
  else
    return object;
}

uint64_t _IOObjectCFRelease(int a1, io_object_t object)
{
  return IOObjectRelease(object);
}

void DeviceMatched(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _GCLogitechRacingWheel *v10;
  id v11;
  void *v12;
  void *v13;
  _GCLogitechRacingWheel *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[4];
  _GCLogitechRacingWheel *v19;
  io_object_t notification;
  uint64_t entryID;
  uint8_t buf[4];
  _GCLogitechRacingWheel *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v3 + 1));
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDAC9B8];
    while (1)
    {
      entryID = 0;
      IORegistryEntryGetRegistryEntryID(v5, &entryID);
      if (!entryID)
      {
        if (!gc_isInternalBuild())
          goto LABEL_23;
        getGCLogger();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          DeviceMatched_cold_1();
        goto LABEL_16;
      }
      v7 = (void *)*((_QWORD *)v3 + 5);
      +[NSNumber numberWithUnsignedLongLong:](&off_254DED908, "numberWithUnsignedLongLong:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_23;
      v10 = -[_GCLogitechRacingWheel initWithService:]([_GCLogitechRacingWheel alloc], "initWithService:", v5);
      if (!v10)
        break;
      notification = 0;
      if (IOServiceAddInterestNotification(*((IONotificationPortRef *)v3 + 2), v5, "IOGeneralInterest", (IOServiceInterestCallback)DeviceGeneralNotification, v3, &notification))
      {
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            DeviceMatched_cold_3();

        }
        goto LABEL_23;
      }
      CFSetAddValue(*((CFMutableSetRef *)v3 + 4), (const void *)notification);
      v11 = v3;
      objc_sync_enter(v11);
      v12 = (void *)*((_QWORD *)v3 + 5);
      +[NSNumber numberWithUnsignedLongLong:](&off_254DED908, "numberWithUnsignedLongLong:", entryID);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v13);

      objc_sync_exit(v11);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v10;
          _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "Steering Wheel Device Matched: %@", buf, 0xCu);
        }

      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __DeviceMatched_block_invoke;
      block[3] = &unk_24D2B2B20;
      v19 = v10;
      v14 = v10;
      dispatch_async(v6, block);

      v5 = IOIteratorNext(a2);
      if (!(_DWORD)v5)
        goto LABEL_23;
    }
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        DeviceMatched_cold_2();
LABEL_16:

    }
  }
LABEL_23:

}

void sub_215205A3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215205AB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void DeviceGeneralNotification(void *a1, io_registry_entry_t a2, int a3)
{
  _QWORD *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t entryID;
  uint8_t buf[4];
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  if (a3 == -536870896)
  {
    entryID = 0;
    IORegistryEntryGetRegistryEntryID(a2, &entryID);
    if (entryID)
    {
      v6 = (void *)v5[5];
      +[NSNumber numberWithUnsignedLongLong:](&off_254DED908, "numberWithUnsignedLongLong:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v8;
            _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "Steering Wheel Device Removed: %@", buf, 0xCu);
          }

        }
        v9 = v5;
        objc_sync_enter(v9);
        v10 = (void *)v5[5];
        +[NSNumber numberWithUnsignedLongLong:](&off_254DED908, "numberWithUnsignedLongLong:", entryID);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v11);

        objc_sync_exit(v9);
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __DeviceGeneralNotification_block_invoke;
        v13[3] = &unk_24D2B2B20;
        v8 = v8;
        v14 = v8;
        dispatch_async(MEMORY[0x24BDAC9B8], v13);

      }
    }
    else
    {
      if (!gc_isInternalBuild())
        goto LABEL_8;
      getGCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        DeviceGeneralNotification_cold_1();
    }

  }
LABEL_8:

}

void sub_215205CEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void GCExtendedGamepadInitInfoMake(void *a1@<X8>)
{
  uint64_t i;

  bzero(a1, 0x638uLL);
  for (i = 8; i != 1160; i += 72)
    *((_BYTE *)a1 + i) = 1;
  GCExtendedGamepadInitInfoPopulateNames((uint64_t)a1);
}

void sub_215205F3C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(v1 + i));
  _Unwind_Resume(a1);
}

void GCExtendedGamepadInitInfoPopulateNames(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;

  objc_storeStrong((id *)a1, CFSTR("Direction Pad"));
  objc_storeStrong((id *)(a1 + 72), CFSTR("Button A"));
  objc_storeStrong((id *)(a1 + 144), CFSTR("Button B"));
  objc_storeStrong((id *)(a1 + 216), CFSTR("Button X"));
  objc_storeStrong((id *)(a1 + 288), CFSTR("Button Y"));
  objc_storeStrong((id *)(a1 + 360), CFSTR("Left Thumbstick"));
  objc_storeStrong((id *)(a1 + 432), CFSTR("Right Thumbstick"));
  objc_storeStrong((id *)(a1 + 504), CFSTR("Left Shoulder"));
  objc_storeStrong((id *)(a1 + 576), CFSTR("Right Shoulder"));
  objc_storeStrong((id *)(a1 + 648), CFSTR("Left Trigger"));
  objc_storeStrong((id *)(a1 + 720), CFSTR("Right Trigger"));
  objc_storeStrong((id *)(a1 + 792), CFSTR("Left Thumbstick Button"));
  objc_storeStrong((id *)(a1 + 864), CFSTR("Right Thumbstick Button"));
  objc_storeStrong((id *)(a1 + 936), CFSTR("Button Home"));
  objc_storeStrong((id *)(a1 + 1008), CFSTR("Button Menu"));
  objc_storeStrong((id *)(a1 + 1080), CFSTR("Button Options"));
  objc_storeStrong((id *)(a1 + 1152), CFSTR("Left Bumper"));
  objc_storeStrong((id *)(a1 + 1224), CFSTR("Right Bumper"));
  objc_storeStrong((id *)(a1 + 1296), CFSTR("Back Left Button 0"));
  objc_storeStrong((id *)(a1 + 1368), CFSTR("Back Left Button 1"));
  objc_storeStrong((id *)(a1 + 1440), CFSTR("Back Right Button 0"));
  objc_storeStrong((id *)(a1 + 1512), CFSTR("Back Right Button 1"));
  v2 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = CFSTR("DIRECTION_PAD");

  v3 = *(void **)(a1 + 128);
  *(_QWORD *)(a1 + 128) = CFSTR("BUTTON_A");

  v4 = *(void **)(a1 + 200);
  *(_QWORD *)(a1 + 200) = CFSTR("BUTTON_B");

  v5 = *(void **)(a1 + 272);
  *(_QWORD *)(a1 + 272) = CFSTR("BUTTON_X");

  v6 = *(void **)(a1 + 344);
  *(_QWORD *)(a1 + 344) = CFSTR("BUTTON_Y");

  v7 = *(void **)(a1 + 560);
  *(_QWORD *)(a1 + 560) = CFSTR("LEFT_SHOULDER");

  v8 = *(void **)(a1 + 632);
  *(_QWORD *)(a1 + 632) = CFSTR("RIGHT_SHOULDER");

  v9 = *(void **)(a1 + 704);
  *(_QWORD *)(a1 + 704) = CFSTR("LEFT_TRIGGER");

  v10 = *(void **)(a1 + 776);
  *(_QWORD *)(a1 + 776) = CFSTR("RIGHT_TRIGGER");

  v11 = *(void **)(a1 + 416);
  *(_QWORD *)(a1 + 416) = CFSTR("LEFT_THUMBSTICK");

  v12 = *(void **)(a1 + 488);
  *(_QWORD *)(a1 + 488) = CFSTR("RIGHT_THUMBSTICK");

  v13 = *(void **)(a1 + 848);
  *(_QWORD *)(a1 + 848) = CFSTR("BUTTON_LEFT_THUMBSTICK");

  v14 = *(void **)(a1 + 920);
  *(_QWORD *)(a1 + 920) = CFSTR("BUTTON_RIGHT_THUMBSTICK");

  v15 = *(void **)(a1 + 1208);
  *(_QWORD *)(a1 + 1208) = CFSTR("BUTTON_L4");

  v16 = *(void **)(a1 + 1280);
  *(_QWORD *)(a1 + 1280) = CFSTR("BUTTON_R4");

  v17 = *(void **)(a1 + 1496);
  *(_QWORD *)(a1 + 1496) = CFSTR("BUTTON_M1");

  v18 = *(void **)(a1 + 1568);
  *(_QWORD *)(a1 + 1568) = CFSTR("BUTTON_M3");

  v19 = *(void **)(a1 + 1352);
  *(_QWORD *)(a1 + 1352) = CFSTR("BUTTON_M2");

  v20 = *(void **)(a1 + 1424);
  *(_QWORD *)(a1 + 1424) = CFSTR("BUTTON_M4");

  v21 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = CFSTR("dpad");

  v22 = *(void **)(a1 + 120);
  *(_QWORD *)(a1 + 120) = CFSTR("a.circle");

  v23 = *(void **)(a1 + 192);
  *(_QWORD *)(a1 + 192) = CFSTR("b.circle");

  v24 = *(void **)(a1 + 336);
  *(_QWORD *)(a1 + 336) = CFSTR("y.circle");

  v25 = *(void **)(a1 + 264);
  *(_QWORD *)(a1 + 264) = CFSTR("x.circle");

  v26 = *(void **)(a1 + 552);
  *(_QWORD *)(a1 + 552) = CFSTR("l1.rectangle.roundedbottom");

  v27 = *(void **)(a1 + 624);
  *(_QWORD *)(a1 + 624) = CFSTR("r1.rectangle.roundedbottom");

  v28 = *(void **)(a1 + 696);
  *(_QWORD *)(a1 + 696) = CFSTR("l2.rectangle.roundedtop");

  v29 = *(void **)(a1 + 768);
  *(_QWORD *)(a1 + 768) = CFSTR("r2.rectangle.roundedtop");

  v30 = *(void **)(a1 + 408);
  *(_QWORD *)(a1 + 408) = CFSTR("l.joystick");

  v31 = *(void **)(a1 + 480);
  *(_QWORD *)(a1 + 480) = CFSTR("r.joystick");

  v32 = *(void **)(a1 + 840);
  *(_QWORD *)(a1 + 840) = CFSTR("l.joystick.down");

  v33 = *(void **)(a1 + 912);
  *(_QWORD *)(a1 + 912) = CFSTR("r.joystick.press.down");

  v34 = *(void **)(a1 + 1200);
  *(_QWORD *)(a1 + 1200) = CFSTR("l4.button.horizontal");

  v35 = *(void **)(a1 + 1272);
  *(_QWORD *)(a1 + 1272) = CFSTR("r4.button.horizontal");

  v36 = *(void **)(a1 + 1488);
  *(_QWORD *)(a1 + 1488) = CFSTR("m1.button.horizontal");

  v37 = *(void **)(a1 + 1560);
  *(_QWORD *)(a1 + 1560) = CFSTR("m3.button.horizontal");

  v38 = *(void **)(a1 + 1344);
  *(_QWORD *)(a1 + 1344) = CFSTR("m2.button.horizontal");

  v39 = *(void **)(a1 + 1416);
  *(_QWORD *)(a1 + 1416) = CFSTR("m4.button.horizontal");

  *(_BYTE *)(a1 + 44) = 1;
  *(_BYTE *)(a1 + 116) = 1;
  *(_BYTE *)(a1 + 188) = 1;
  *(_BYTE *)(a1 + 332) = 1;
  *(_BYTE *)(a1 + 260) = 1;
  *(_BYTE *)(a1 + 548) = 1;
  *(_BYTE *)(a1 + 620) = 1;
  *(_BYTE *)(a1 + 692) = 1;
  *(_BYTE *)(a1 + 764) = 1;
  *(_BYTE *)(a1 + 404) = 1;
  *(_BYTE *)(a1 + 476) = 1;
  *(_BYTE *)(a1 + 836) = 1;
  *(_BYTE *)(a1 + 908) = 1;
  *(_BYTE *)(a1 + 1196) = 1;
  *(_BYTE *)(a1 + 1268) = 1;
  *(_BYTE *)(a1 + 1340) = 1;
  *(_BYTE *)(a1 + 1412) = 1;
  *(_BYTE *)(a1 + 1484) = 1;
  *(_BYTE *)(a1 + 1556) = 1;
  *(_OWORD *)(a1 + 16) = xmmword_21526F100;
  *(_DWORD *)(a1 + 88) = 4;
  *(_DWORD *)(a1 + 160) = 5;
  *(_DWORD *)(a1 + 304) = 7;
  *(_DWORD *)(a1 + 232) = 6;
  *(_DWORD *)(a1 + 520) = 8;
  *(_DWORD *)(a1 + 592) = 9;
  *(_OWORD *)(a1 + 376) = xmmword_21526F110;
  *(_OWORD *)(a1 + 448) = xmmword_21526F120;
  *(_DWORD *)(a1 + 664) = 18;
  *(_DWORD *)(a1 + 736) = 19;
  *(_DWORD *)(a1 + 808) = 20;
  *(_DWORD *)(a1 + 880) = 21;
  *(_DWORD *)(a1 + 1168) = 41;
  *(_DWORD *)(a1 + 1240) = 42;
  *(_DWORD *)(a1 + 1312) = 43;
  *(_DWORD *)(a1 + 1384) = 44;
  *(_DWORD *)(a1 + 1456) = 45;
  *(_DWORD *)(a1 + 1528) = 46;
  *(_DWORD *)(a1 + 40) = 1;
  *(_DWORD *)(a1 + 112) = 1;
  *(_DWORD *)(a1 + 184) = 1;
  *(_DWORD *)(a1 + 328) = 1;
  *(_DWORD *)(a1 + 256) = 1;
  *(_DWORD *)(a1 + 544) = 1;
  *(_DWORD *)(a1 + 616) = 1;
  *(_DWORD *)(a1 + 400) = 1;
  *(_DWORD *)(a1 + 472) = 1;
  *(_DWORD *)(a1 + 688) = 1;
  *(_DWORD *)(a1 + 760) = 1;
  *(_DWORD *)(a1 + 832) = 1;
  *(_DWORD *)(a1 + 904) = 1;
  *(_DWORD *)(a1 + 1192) = 1;
  *(_DWORD *)(a1 + 1264) = 1;
  *(_DWORD *)(a1 + 1336) = 1;
  *(_DWORD *)(a1 + 1408) = 1;
  *(_DWORD *)(a1 + 1480) = 1;
  *(_DWORD *)(a1 + 1552) = 1;
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Paddle 3"));
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = *(void **)(a1 + 1360);
  *(_QWORD *)(a1 + 1360) = v40;

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Paddle 4"));
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = *(void **)(a1 + 1432);
  *(_QWORD *)(a1 + 1432) = v42;

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Paddle 1"));
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = *(void **)(a1 + 1504);
  *(_QWORD *)(a1 + 1504) = v44;

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Paddle 2"));
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = *(void **)(a1 + 1576);
  *(_QWORD *)(a1 + 1576) = v46;

}

void sub_2152066E0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(v1 + i));
  _Unwind_Resume(a1);
}

void sub_2152076D8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(v1 + i));
  _Unwind_Resume(a1);
}

void sub_2152079F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
  uint64_t v38;

  __destructor_8_s0_s48_s56_s64(&a38);
  __destructor_8_s0_s48_s56_s64((id *)(v38 - 160));
  _Unwind_Resume(a1);
}

void sub_21520A9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(&a40 + i));
  _Unwind_Resume(a1);
}

id allCodes()
{
  if (allCodes_onceToken != -1)
    dispatch_once(&allCodes_onceToken, &__block_literal_global_26);
  return (id)allCodes_codes;
}

void __allCodes_block_invoke()
{
  void *v0;

  v0 = (void *)allCodes_codes;
  allCodes_codes = (uint64_t)&unk_24D30FAB8;

}

void sub_21520B2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double __timestampToSecondsMultiplier_block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;

  mach_timebase_info((mach_timebase_info_t)&timestampToSecondsMultiplier_timebaseInfo);
  LODWORD(v0) = timestampToSecondsMultiplier_timebaseInfo;
  LODWORD(v1) = *(_DWORD *)algn_254DBE1AC;
  result = (double)v0 / (double)v1 / 1000000000.0;
  timestampToSecondsMultiplier_multiplier = *(_QWORD *)&result;
  return result;
}

NSXPCInterface *GCHapticClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB818);
}

NSXPCInterface *GCHapticServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD7DC8);
}

void sub_2152126D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215215354(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_21(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id _GCKeyboardEventSourceDescription_Classes()
{
  if (_GCKeyboardEventSourceDescription_Classes_onceToken != -1)
    dispatch_once(&_GCKeyboardEventSourceDescription_Classes_onceToken, &__block_literal_global_29);
  return (id)_GCKeyboardEventSourceDescription_Classes_Classes;
}

void sub_215216A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)&a9 + i));
  _Unwind_Resume(a1);
}

id _gc_log_ui()
{
  if (_gc_log_ui_onceToken != -1)
    dispatch_once(&_gc_log_ui_onceToken, &__block_literal_global_30);
  return (id)_gc_log_ui_Log;
}

void ___gc_log_ui_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.gamecontroller", "UI");
  v1 = (void *)_gc_log_ui_Log;
  _gc_log_ui_Log = (uint64_t)v0;

}

void sub_215218364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215218D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCAdaptiveTriggersXPCProxyRemoteClientEndpointInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD5098);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  v2 = objc_opt_class();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_newStatuses_, 0, 0);

  return v0;
}

id GCAdaptiveTriggersXPCProxyRemoteServerEndpointInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD51C0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  v2 = objc_opt_class();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_fetchStatusesWithReply_, 0, 1);

  return v0;
}

NSXPCInterface *GCAdaptiveTriggersXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD1418);
}

id GCAdaptiveTriggersXPCProxyServiceRemoteServerInterface()
{
  void *v0;
  void *v1;
  void *v2;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD5898);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCAdaptiveTriggersXPCProxyRemoteClientEndpointInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_adaptiveTriggersXPCProxyServiceClientEndpointConnect_reply_, 0, 0);

  GCAdaptiveTriggersXPCProxyRemoteServerEndpointInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_adaptiveTriggersXPCProxyServiceClientEndpointConnect_reply_, 0, 1);

  return v0;
}

void OUTLINED_FUNCTION_0_22(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

NSXPCInterface *GCGameIntentServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DCFC40);
}

NSXPCInterface *GCGameIntentServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB878);
}

void sub_21521A634(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21521AB60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double NSTimeIntervalFromMachAbsoluteTime(uint64_t a1)
{
  if (NSTimeIntervalFromMachAbsoluteTime_once != -1)
    dispatch_once(&NSTimeIntervalFromMachAbsoluteTime_once, &__block_literal_global_31);
  return (double)((unint64_t)NSTimeIntervalFromMachAbsoluteTime_sTimebaseInfo
                * a1
                / *(unsigned int *)algn_254DBE22C)
       / 1000000000.0;
}

void sub_21521BEB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21521C3D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21521C520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21521C6C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21521D168(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21521D23C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21521D3A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21521E9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_21521EF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __setActiveDevices_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 56) = 0;
  return result;
}

Class __getRPScreenRecorderClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!ReplayKitLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_24D2B5778;
    v5 = 0;
    ReplayKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ReplayKitLibraryCore_frameworkLibrary_0)
    __getRPScreenRecorderClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("RPScreenRecorder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRPScreenRecorderClass_block_invoke_cold_2_0();
  getRPScreenRecorderClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSSUIServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!ScreenshotServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D2B5790;
    v5 = 0;
    ScreenshotServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ScreenshotServicesLibraryCore_frameworkLibrary)
    __getSSUIServiceClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SSUIService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSSUIServiceClass_block_invoke_cold_2();
  getSSUIServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_22(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21521F3F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_215221718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_2152219AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215221C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215221EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215222120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2152223E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21522269C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215222950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215222C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215222F78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2152231FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2152234F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2152236D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2152238E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215223CE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_23(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_215226520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_215226FA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void GCControllerMBDelegateBTSessionEventCallback(uint64_t a1, int a2, int a3, void *a4)
{
  _QWORD *v7;
  NSObject *v8;
  const char *v9;
  int v10;
  int v11;
  NSObject *v12;
  uint8_t *v13;
  NSObject *v14;
  uint32_t v15;
  int v16;
  int v17;
  NSObject *v18;
  _DWORD v19[4];
  uint8_t buf[8];
  void (*v21)();
  void (*v22)();
  uint64_t (*v23)();
  void (*v24)();
  void (*v25)();
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (a3 | a2)
  {
    if (a2 == 3)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v9 = "BT session failed";
          goto LABEL_21;
        }
LABEL_23:

      }
    }
    else if (a2 == 2)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v9 = "BT session terminated";
          goto LABEL_21;
        }
        goto LABEL_23;
      }
    }
    else if (a2 == 1 && gc_isInternalBuild())
    {
      getGCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "BT session detached";
LABEL_21:
        v13 = buf;
        v14 = v8;
        v15 = 2;
LABEL_22:
        _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_DEFAULT, v9, v13, v15);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
  }
  else
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v18, OS_LOG_TYPE_DEFAULT, "BT session attached", buf, 2u);
      }

    }
    if (!v7[1])
    {
      v7[1] = a1;
      v10 = BTDiscoveryAgentCreate();
      if (v10)
      {
        v11 = v10;
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v11;
            _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_DEFAULT, "BT discovery agent create failed (%d)", buf, 8u);
          }

        }
      }
      else
      {
        BTDiscoveryAgentStartScan();
      }
      *(_QWORD *)buf = GCControllerMBDelegateBTPairingAgentStatusEventCallback;
      v21 = GCControllerMBDelegateBTPairingAgentPincodeCallback;
      v22 = GCControllerMBDelegateBTPairingAgentAuthorizationCallback;
      v23 = GCControllerMBDelegateBTPairingAgentUserConfirmationCallback;
      v24 = GCControllerMBDelegateBTPairingAgentPassKeyDisplayCallback;
      v25 = GCControllerMBDelegateBTPairingAgentLocalOOBDataReadyCallback;
      v16 = BTPairingAgentCreate();
      if (!v16)
      {
        BTPairingAgentStart();
        goto LABEL_30;
      }
      v17 = v16;
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        v19[0] = 67109120;
        v19[1] = v17;
        v9 = "BT pairing agent create failed (%d)";
        v13 = (uint8_t *)v19;
        v14 = v8;
        v15 = 8;
        goto LABEL_22;
      }
    }
  }
LABEL_30:

}

void sub_215227B78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void GCControllerMBDelegateBTDiscoveryAgentStatusEventCallback(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v11 = v2;
  v12 = v3;
  switch(a2)
  {
    case 0:
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v10 = 0;
        v5 = "BT discovery scan started";
        v6 = (uint8_t *)&v10;
        goto LABEL_15;
      }
      break;
    case 1:
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v9 = 0;
        v5 = "BT discovery scan stopped";
        v6 = (uint8_t *)&v9;
        goto LABEL_15;
      }
      break;
    case 2:
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v8 = 0;
        v5 = "BT discovery query started";
        v6 = (uint8_t *)&v8;
        goto LABEL_15;
      }
      break;
    case 3:
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v7 = 0;
          v5 = "BT discovery query stopped";
          v6 = (uint8_t *)&v7;
LABEL_15:
          _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
        }
LABEL_16:

      }
      break;
    default:
      return;
  }
}

void GCControllerMBDelegateBTDiscoveryAgentDiscoveryEventCallback(uint64_t a1, int a2)
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  switch(a2)
  {
    case 2:
      if (!gc_isInternalBuild())
        return;
      getGCLogger();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v3 = "BT discovery device changed";
LABEL_13:
        _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 2u);
      }
LABEL_26:

      return;
    case 1:
      if (!gc_isInternalBuild())
        return;
      getGCLogger();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v3 = "BT discovery device lost";
        goto LABEL_13;
      }
      goto LABEL_26;
    case 0:
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_DEFAULT, "BT discovery device found", buf, 2u);
        }

      }
      BTDeviceGetDeviceClass();
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v8 = 0;
          _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "-> deviceClass: %x", buf, 8u);
        }

      }
      BTDeviceGetDeviceType();
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v8 = 0;
          _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_DEFAULT, "-> deviceType: %x (Generic)", buf, 8u);
        }

      }
      BTDeviceConnectServices();
      break;
  }
}

void GCControllerMBDelegateBTPairingAgentLocalOOBDataReadyCallback()
{
  NSObject *v0;
  uint8_t v1[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_215181000, v0, OS_LOG_TYPE_DEFAULT, "BT pairing local OOB data generated", v1, 2u);
    }

  }
}

void GCControllerMBDelegateBTPairingAgentStatusEventCallback(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v11 = v2;
  v12 = v3;
  switch(a2)
  {
    case 0:
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v10 = 0;
        v5 = "BT pairing agent started";
        v6 = (uint8_t *)&v10;
        goto LABEL_15;
      }
      break;
    case 1:
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v9 = 0;
        v5 = "BT pairing agent stopped";
        v6 = (uint8_t *)&v9;
        goto LABEL_15;
      }
      break;
    case 2:
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v8 = 0;
        v5 = "BT pairing attempt started";
        v6 = (uint8_t *)&v8;
        goto LABEL_15;
      }
      break;
    case 3:
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v7 = 0;
          v5 = "BT pairing attempt complete";
          v6 = (uint8_t *)&v7;
LABEL_15:
          _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
        }
LABEL_16:

      }
      break;
    default:
      return;
  }
}

void GCControllerMBDelegateBTPairingAgentPincodeCallback()
{
  NSObject *v0;
  uint8_t v1[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_215181000, v0, OS_LOG_TYPE_DEFAULT, "BT pairing pincodeRequest", v1, 2u);
    }

  }
}

void GCControllerMBDelegateBTPairingAgentAuthorizationCallback()
{
  NSObject *v0;
  uint8_t v1[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_215181000, v0, OS_LOG_TYPE_DEFAULT, "BT pairing authorizationRequest", v1, 2u);
    }

  }
}

uint64_t GCControllerMBDelegateBTPairingAgentUserConfirmationCallback()
{
  NSObject *v1;
  uint8_t buf[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v1, OS_LOG_TYPE_DEFAULT, "BT pairing userConfirmationRequest", buf, 2u);
    }

  }
  return BTDeviceGetDeviceClass();
}

void GCControllerMBDelegateBTPairingAgentPassKeyDisplayCallback()
{
  NSObject *v0;
  uint8_t v1[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_215181000, v0, OS_LOG_TYPE_DEFAULT, "BT pairing passKeyRequest", v1, 2u);
    }

  }
}

void sub_2152288D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215229454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCSystemGestureXPCProxyRemoteClientEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD69F0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

id GCSystemGestureXPCProxyRemoteServerEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD6B30);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

NSXPCInterface *GCSystemGestureXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD1968);
}

id GCSystemGestureXPCProxyServiceRemoteServerInterface()
{
  void *v0;
  void *v1;
  void *v2;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD5B00);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCSystemGestureXPCProxyRemoteClientEndpointInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_systemGestureXPCProxyServiceClientEndpointConnect_reply_, 0, 0);

  GCSystemGestureXPCProxyRemoteServerEndpointInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_systemGestureXPCProxyServiceClientEndpointConnect_reply_, 0, 1);

  return v0;
}

void OUTLINED_FUNCTION_0_25(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21522A9BC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(v1 + i));
  _Unwind_Resume(a1);
}

void sub_21522AB20(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(v1 + i));
  _Unwind_Resume(a1);
}

id GCDriverClientInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
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

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB8D8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCNintendoJoyConFusionGestureServiceClientInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_connectToNintendoJoyConFusionGestureServiceWithClient_reply_, 0, 0);

  GCNintendoJoyConFusionGestureServiceServerInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_connectToNintendoJoyConFusionGestureServiceWithClient_reply_, 0, 1);

  GCLightServiceClientInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_connectToLightServiceWithClient_reply_, 0, 0);

  GCLightServiceServerInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v4, sel_connectToLightServiceWithClient_reply_, 0, 1);

  GCAdaptiveTriggersServiceClientInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_connectToAdaptiveTriggersServiceWithClient_reply_, 0, 0);

  GCAdaptiveTriggersServiceServerInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v6, sel_connectToAdaptiveTriggersServiceWithClient_reply_, 0, 1);

  GCMotionServiceClientInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_connectToMotionServiceWithClient_reply_, 0, 0);

  GCMotionServiceServerInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel_connectToMotionServiceWithClient_reply_, 0, 1);

  GCBatteryServiceClientInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_connectToBatteryServiceWithClient_reply_, 0, 0);

  GCBatteryServiceServerInterface();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v10, sel_connectToBatteryServiceWithClient_reply_, 0, 1);

  GCGameIntentServiceClientInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v11, sel_connectToGameIntentServiceWithClient_reply_, 0, 0);

  GCGameIntentServiceServerInterface();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_connectToGameIntentServiceWithClient_reply_, 0, 1);

  GCGenericDeviceDriverConfigurationServiceClientInterface();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_connectToGenericDeviceDriverConfigurationServiceWithClient_reply_, 0, 0);

  GCGenericDeviceDriverConfigurationServiceServerInterface();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v14, sel_connectToGenericDeviceDriverConfigurationServiceWithClient_reply_, 0, 1);

  return v0;
}

NSXPCInterface *GCDriverServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB938);
}

double dqIdentity()
{
  return *(double *)&_PromotedConst;
}

float32x4_t dqMakeDualQuaternion(float32x4_t a1)
{
  int8x16_t v1;
  float32x2_t v2;
  unsigned __int32 v4;
  float32x2_t v5;
  float32x2_t v6;

  v1 = (int8x16_t)vmulq_f32(a1, a1);
  v2 = vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL));
  if (vaddv_f32(v2) == 0.0)
  {
    return (float32x4_t)xmmword_21526F060;
  }
  else
  {
    v4 = vadd_f32(v2, (float32x2_t)vdup_lane_s32((int32x2_t)v2, 1)).u32[0];
    v5 = vrsqrte_f32((float32x2_t)v4);
    v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4, vmul_f32(v5, v5)));
    return vmulq_n_f32(a1, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4, vmul_f32(v6, v6))).f32[0]);
  }
}

double dqAdd(float32x4_t a1, double a2, float32x4_t a3)
{
  double result;

  *(_QWORD *)&result = vaddq_f32(a1, a3).u64[0];
  return result;
}

double dqNormalize(uint64_t a1, uint64_t a2, uint64_t a3, float32x4_t a4)
{
  int8x16_t v4;
  float v5;
  double result;

  v4 = (int8x16_t)vmulq_f32(a4, a4);
  v5 = vaddv_f32(vadd_f32(*(float32x2_t *)v4.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)));
  if (v5 <= 0.000001)
    dqNormalize_cold_1(a1, a2, a3);
  *(_QWORD *)&result = vmulq_n_f32(a4, 1.0 / v5).u64[0];
  return result;
}

double dqMul(float32x4_t a1, double a2, float32x4_t a3)
{
  int32x4_t v3;
  int8x16_t v4;
  float32x4_t v5;
  double result;

  v3 = (int32x4_t)vnegq_f32(a1);
  v4 = (int8x16_t)vtrn2q_s32((int32x4_t)a1, vtrn1q_s32((int32x4_t)a1, v3));
  v5 = (float32x4_t)vrev64q_s32((int32x4_t)a1);
  v5.i32[0] = v3.i32[1];
  v5.i32[3] = v3.i32[2];
  *(_QWORD *)&result = vaddq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)a1, (int8x16_t)v3, 8uLL), *(float32x2_t *)a3.f32, 1), (float32x4_t)vextq_s8(v4, v4, 8uLL), a3.f32[0]), vmlaq_laneq_f32(vmulq_laneq_f32(a1, a3, 3), v5, a3, 2)).u64[0];
  return result;
}

double dqMulConst(float32x4_t a1, double a2, float a3)
{
  double result;

  *(_QWORD *)&result = vmulq_n_f32(a1, a3).u64[0];
  return result;
}

double dqDLB(uint64_t a1, uint64_t a2, uint64_t a3, float32x4_t a4, double a5, float32x4_t a6, double a7, float a8)
{
  float32x4_t v8;
  int8x16_t v9;
  float v10;
  double result;

  v8 = vaddq_f32(vmulq_n_f32(a6, a8), vmulq_n_f32(a4, 1.0 - a8));
  v9 = (int8x16_t)vmulq_f32(v8, v8);
  v10 = vaddv_f32(vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)));
  if (v10 <= 0.000001)
    dqDLB_cold_1(a1, a2, a3);
  *(_QWORD *)&result = vmulq_n_f32(v8, 1.0 / v10).u64[0];
  return result;
}

double dqConjugate(float32x4_t a1)
{
  double result;

  *(_QWORD *)&result = vmulq_f32(a1, (float32x4_t)xmmword_21526F610).u64[0];
  return result;
}

void dqScLERP(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float a5)
{
  int8x16_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int32x4_t v11;
  int8x16_t v12;
  float32x4_t v13;
  float v14;

  if ((vminvq_u32((uint32x4_t)vceqq_f32(a1, a3)) & 0x80000000) == 0
    || (vminvq_u32((uint32x4_t)vceqq_f32(a2, a4)) & 0x80000000) == 0)
  {
    v6 = (int8x16_t)vmulq_f32(a1, a3);
    v7 = a1;
    v8 = (float32x4_t)vextq_s8(v6, v6, 8uLL);
    *(float32x2_t *)a1.f32 = vadd_f32(*(float32x2_t *)v6.i8, *(float32x2_t *)v8.f32);
    a1.f32[0] = vaddv_f32(*(float32x2_t *)a1.f32);
    v8.i32[0] = 0;
    v9 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v8, a1), 0), (int8x16_t)vnegq_f32(a3), (int8x16_t)a3);
    v10 = vmulq_f32(v7, (float32x4_t)xmmword_21526F610);
    v11 = (int32x4_t)vnegq_f32(v10);
    v12 = (int8x16_t)vtrn2q_s32((int32x4_t)v10, vtrn1q_s32((int32x4_t)v10, v11));
    v13 = (float32x4_t)vrev64q_s32((int32x4_t)v10);
    v13.i32[0] = v11.i32[1];
    v13.i32[3] = v11.i32[2];
    v14 = acosf(COERCE_FLOAT(vaddq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8(*(int8x16_t *)&v10, *(int8x16_t *)&v11, 8uLL), *(float32x2_t *)&v9, 1), (float32x4_t)vextq_s8(v12, v12, 8uLL), *(float *)&v9), vmlaq_laneq_f32(vmulq_laneq_f32(v10, v9, 3), v13, v9, 2)).i32[3]));
    __sincosf_stret((float)((float)(v14 + v14) * a5) * 0.5);
  }
}

double dqGetTranslation(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2;
  float32x4_t v3;
  int32x4_t v4;
  int8x16_t v5;
  float32x4_t v6;
  float32x4_t v7;
  double result;

  v2 = vaddq_f32(a2, a2);
  v3 = vmulq_f32(a1, (float32x4_t)xmmword_21526F610);
  v4 = (int32x4_t)vnegq_f32(v3);
  v5 = (int8x16_t)vtrn2q_s32((int32x4_t)v3, vtrn1q_s32((int32x4_t)v3, v4));
  v6 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL), *(float32x2_t *)v2.f32, 1), (float32x4_t)vextq_s8(v5, v5, 8uLL), v2.f32[0]);
  v7 = (float32x4_t)vrev64q_s32((int32x4_t)v3);
  v7.i32[0] = v4.i32[1];
  v7.i32[3] = v4.i32[2];
  *(_QWORD *)&result = vaddq_f32(v6, vmlaq_laneq_f32(vmulq_laneq_f32(v3, v2, 3), v7, v2, 2)).u64[0];
  return result;
}

__n64 dqGetMatrix(uint64_t a1, uint64_t a2, uint64_t a3, float32x4_t a4)
{
  int8x16_t v5;
  float v6;
  __n64 result;

  v5 = (int8x16_t)vmulq_f32(a4, a4);
  v6 = vaddv_f32(vadd_f32(*(float32x2_t *)v5.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)));
  if (v6 <= 0.000001)
    dqGetMatrix_cold_1(a1, a2, a3);
  _Q4 = vmulq_n_f32(a4, 1.0 / v6);
  _S6 = _Q4.i32[3];
  _S5 = _Q4.f32[1];
  _S16 = _Q4.i32[2];
  __asm
  {
    FMLA            S17, S6, V4.S[3]
    FMLS            S17, S5, V4.S[1]
    FMLS            S17, S16, V4.S[2]
  }
  result.n64_u32[0] = _S17;
  _S17 = _Q4.f32[0] + _Q4.f32[0];
  __asm { FMLA            S19, S17, V4.S[1] }
  result.n64_u32[1] = _S19;
  __asm
  {
    FMLA            S19, S17, V4.S[2]
    FMLA            S19, S17, V4.S[1]
    FMLA            S19, S6, V4.S[3]
    FMLS            S19, S4, V4.S[0]
    FMLS            S19, S16, V4.S[2]
  }
  _S19 = _S5 + _S5;
  __asm
  {
    FMLA            S20, S19, V4.S[2]
    FMLA            S7, S17, V4.S[2]
    FMLA            S7, S19, V4.S[2]
    FMLA            S7, S6, V4.S[3]
    FMLS            S7, S4, V4.S[0]
    FMLS            S7, S5, V4.S[1]
  }
  return result;
}

void OUTLINED_FUNCTION_0_26(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 59, a4);
}

void sub_21522E81C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21522E910(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSString *hapticParamCurveSegmentToString(unsigned int *a1)
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("HapticParamCurveSegment = {\n\tchannel = %d,\n\tparameter = %d\n\tstartTime = %f\n\tendTime = %f\n\tstartValue = %f\n\tendValue = %f\n}"), *a1, a1[1], *((_QWORD *)a1 + 1), *((_QWORD *)a1 + 2), *((_QWORD *)a1 + 3), *((_QWORD *)a1 + 4));
}

id defaultMapping(int a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  _QWORD v87[26];
  _QWORD v88[26];
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[22];
  _QWORD v92[22];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[28];
  _QWORD v96[28];
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[6];

  v99[4] = *MEMORY[0x24BDAC8D0];
  v99[0] = &unk_24D30F9D0;
  v97[0] = CFSTR("Buttons");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v84;
  v96[0] = &unk_24D30EF20;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 9);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v83;
  v96[1] = &unk_24D30EF38;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v95[2] = v82;
  v96[2] = &unk_24D30EF50;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v95[3] = v81;
  v96[3] = &unk_24D30EF68;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v95[4] = v80;
  v96[4] = &unk_24D30EF80;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v95[5] = v79;
  v96[5] = &unk_24D30EF98;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v95[6] = v78;
  v96[6] = &unk_24D30EFB0;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v95[7] = v77;
  v96[7] = &unk_24D30EFC8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v95[8] = v76;
  v96[8] = &unk_24D30EFE0;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v95[9] = v75;
  v96[9] = &unk_24D30EFF8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v95[10] = v74;
  v96[10] = &unk_24D30F010;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v95[11] = v73;
  v96[11] = &unk_24D30F028;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 225);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v95[12] = v72;
  v96[12] = &unk_24D30F0B8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v95[13] = v71;
  v96[13] = &unk_24D30F040;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v95[14] = v70;
  v96[14] = &unk_24D30F058;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v95[15] = v69;
  v96[15] = &unk_24D30F070;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 11);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v95[16] = v68;
  v96[16] = &unk_24D30EF38;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 18);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v95[17] = v67;
  v96[17] = &unk_24D30EF68;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 24);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v95[18] = v66;
  v96[18] = &unk_24D30EF50;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 12);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v95[19] = v65;
  v96[19] = &unk_24D30EF80;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 13);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v95[20] = v64;
  v96[20] = &unk_24D30EF98;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 14);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v95[21] = v62;
  v96[21] = &unk_24D30EFB0;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 15);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v95[22] = v61;
  v96[22] = &unk_24D30EFC8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v95[23] = v60;
  v96[23] = &unk_24D30F040;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v95[24] = v59;
  v96[24] = &unk_24D30F058;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 45);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v95[25] = v58;
  v96[25] = &unk_24D30F070;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v95[26] = v57;
  v96[26] = &unk_24D30F0B8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 45);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v95[27] = v56;
  v96[27] = &unk_24D30F070;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v96, v95, 28);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v55;
  v98[1] = &unk_24D30F9F8;
  v97[1] = CFSTR("Config");
  v97[2] = CFSTR("LeftThumbstickSensitivity");
  v98[2] = &unk_24D30FB30;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v98, v97, 3);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v54;
  v93[0] = CFSTR("Buttons");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 44);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v53;
  v92[0] = &unk_24D30EF20;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 11);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v52;
  v92[1] = &unk_24D30EF38;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 18);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v91[2] = v51;
  v92[2] = &unk_24D30EF50;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 24);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v91[3] = v49;
  v92[3] = &unk_24D30EF68;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 12);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v91[4] = v47;
  v92[4] = &unk_24D30EF80;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 13);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v91[5] = v46;
  v92[5] = &unk_24D30EF98;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 14);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v91[6] = v45;
  v92[6] = &unk_24D30EFB0;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 15);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v91[7] = v44;
  v92[7] = &unk_24D30EFC8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 82);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v91[8] = v43;
  v92[8] = &unk_24D30EFE0;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 80);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v91[9] = v38;
  v92[9] = &unk_24D30EFF8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 81);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v91[10] = v37;
  v92[10] = &unk_24D30F010;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 79);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v91[11] = v36;
  v92[11] = &unk_24D30F028;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 230);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v91[12] = v35;
  v92[12] = &unk_24D30F040;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 229);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v91[13] = v33;
  v92[13] = &unk_24D30F058;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v91[14] = v31;
  v92[14] = &unk_24D30F040;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v91[15] = v30;
  v92[15] = &unk_24D30F058;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 56);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v91[16] = v29;
  v92[16] = &unk_24D30F070;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 45);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v91[17] = v28;
  v92[17] = &unk_24D30F070;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 38);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v91[18] = v27;
  v92[18] = &unk_24D30F0A0;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 39);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v91[19] = v26;
  v92[19] = &unk_24D30F088;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 62);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v91[20] = v25;
  v92[20] = &unk_24D30F0D0;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v91[21] = v24;
  v92[21] = &unk_24D30F0B8;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v92, v91, 22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v23;
  v94[1] = &unk_24D30FA20;
  v93[1] = CFSTR("Config");
  v93[2] = CFSTR("LeftThumbstickSensitivity");
  v94[2] = &unk_24D30FB78;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v94, v93, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v22;
  v89[0] = CFSTR("Buttons");
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 44);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v86;
  v88[0] = &unk_24D30EF20;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v21;
  v88[1] = &unk_24D30EF50;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v20;
  v88[2] = &unk_24D30EF68;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v16;
  v88[3] = &unk_24D30EF38;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 82);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v15;
  v88[4] = &unk_24D30EFE0;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 80);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v87[5] = v14;
  v88[5] = &unk_24D30EFF8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 81);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v87[6] = v13;
  v88[6] = &unk_24D30F010;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 79);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v87[7] = v12;
  v88[7] = &unk_24D30F028;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 26);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v87[8] = v42;
  v88[8] = &unk_24D30EF80;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v87[9] = v41;
  v88[9] = &unk_24D30EF98;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 22);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v87[10] = v40;
  v88[10] = &unk_24D30EFB0;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v87[11] = v39;
  v88[11] = &unk_24D30EFC8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 43);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v87[12] = v32;
  v88[12] = &unk_24D30F0B8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 20);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v87[13] = v50;
  v88[13] = &unk_24D30F040;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 8);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v87[14] = v48;
  v88[14] = &unk_24D30F058;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 21);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v87[15] = v34;
  v88[15] = &unk_24D30F0E8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v87[16] = v19;
  v88[16] = &unk_24D30EF80;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v87[17] = v18;
  v88[17] = &unk_24D30EF98;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v87[18] = v17;
  v88[18] = &unk_24D30EFB0;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 15);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v87[19] = v1;
  v88[19] = &unk_24D30EFC8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 28);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v87[20] = v2;
  v88[20] = &unk_24D30F0B8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v87[21] = v3;
  v88[21] = &unk_24D30F040;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v87[22] = v4;
  v88[22] = &unk_24D30F058;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v87[23] = v5;
  v88[23] = &unk_24D30F0E8;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 53);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v87[24] = v6;
  v88[24] = &unk_24D30F070;
  +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", 45);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v87[25] = v7;
  v88[25] = &unk_24D30F070;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v88, v87, 26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v8;
  v90[1] = &unk_24D30FA48;
  v89[1] = CFSTR("Config");
  v89[2] = CFSTR("LeftThumbstickSensitivity");
  v90[2] = &unk_24D30FBC0;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v9;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v99, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a1);
  v85 = (id)objc_claimAutoreleasedReturnValue();

  return v85;
}

NSObject *createDispatchTimer(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
{
  id v7;
  NSObject *v8;
  dispatch_time_t v9;

  v7 = a4;
  v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, a3);
  if (v8)
  {
    v9 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v8, v9, a1, a2);
    dispatch_source_set_event_handler(v8, v7);
    dispatch_resume(v8);
  }

  return v8;
}

id GetProperty(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = GetProperties_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&GetProperties_onceToken, &__block_literal_global_37);
  objc_msgSend((id)GetProperties_properties, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void OUTLINED_FUNCTION_0_27(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_215234088(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)(v1 + i));
  _Unwind_Resume(a1);
}

id AllControllerProfiles()
{
  if (AllControllerProfiles_onceToken != -1)
    dispatch_once(&AllControllerProfiles_onceToken, &__block_literal_global_38);
  return (id)AllControllerProfiles_ControllerProfiles;
}

id hexStringFromByteArray(uint64_t a1, int a2)
{
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  +[NSMutableString stringWithCapacity:](&off_254DF2C58, "stringWithCapacity:", 2 * a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 >= 1)
  {
    v5 = a2 + 1;
    do
    {
      if ((_DWORD)v5 == 2)
        v6 = &stru_24D2B85A8;
      else
        v6 = CFSTR(":");
      +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%02x%@"), *(unsigned __int8 *)(a1 + (v5 - 2)), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v7);

      --v5;
    }
    while (v5 > 1);
  }
  +[NSString stringWithString:](&off_254DEDEA8, "stringWithString:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t isPartnerSupportEnabled()
{
  if (isPartnerSupportEnabled_onceToken != -1)
    dispatch_once(&isPartnerSupportEnabled_onceToken, &__block_literal_global_39);
  return isPartnerSupportEnabled__partnerSupportEnabled;
}

void __isPartnerSupportEnabled_block_invoke()
{
  void *v0;
  NSObject *v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEF040), "initWithSuiteName:", CFSTR("com.apple.GameController"));
  isPartnerSupportEnabled__partnerSupportEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("GCPartnersEnable"));
  getGCHIDLogger();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = isPartnerSupportEnabled__partnerSupportEnabled;
    _os_log_impl(&dword_215181000, v1, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v2, 8u);
  }

}

uint64_t SharableMemoryBase::AllocNonShared(SharableMemoryBase *this, size_t size)
{
  void *v4;
  std::bad_alloc *exception;
  std::bad_alloc *v7;

  *((_BYTE *)this + 8) = 1;
  v4 = malloc_type_malloc(size, 0x7C51E058uLL);
  if (size && !v4)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v7 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v7, MEMORY[0x24BEDB758], MEMORY[0x24BEDB670]);
  }
  *((_QWORD *)this + 2) = size;
  *((_QWORD *)this + 3) = v4;
  if (v4)
    return 0;
  else
    return 4294967188;
}

uint64_t SharableMemoryBase::Set(uint64_t this, void *a2, uint64_t a3)
{
  *(_BYTE *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = a3;
  *(_QWORD *)(this + 24) = a2;
  return this;
}

uint64_t SharableMemoryBlock::InitServer(uint64_t a1, size_t a2, _DWORD *a3)
{
  int v6;
  unsigned int v7;
  unsigned int v8;
  pid_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  memory_object_size_t v15;
  vm_map_t *v16;
  uint64_t memory_entry_64;
  void *v18;
  int v19;
  memory_object_offset_t v20;
  xpc_object_t v21;
  memory_object_size_t size;
  char __str[8];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v6 = a3[2];
  if (!v6)
  {
    v13 = a2 + *MEMORY[0x24BDB03C8] - 1;
    v14 = -*MEMORY[0x24BDB03C8];
    *(_QWORD *)__str = 0;
    v15 = v13 & v14;
    if ((v13 & v14) != 0)
    {
      v16 = (vm_map_t *)MEMORY[0x24BDAEC58];
      v12 = vm_allocate(*MEMORY[0x24BDAEC58], (vm_address_t *)__str, v13 & v14, 1);
      if ((_DWORD)v12)
        return v12;
      size = v15;
      memory_entry_64 = mach_make_memory_entry_64(*v16, &size, *(memory_object_offset_t *)__str, 3, (mach_port_t *)(a1 + 32), 0);
      if ((_DWORD)memory_entry_64)
      {
        v12 = memory_entry_64;
        MEMORY[0x2199DEEF8](*v16, *(_QWORD *)__str, v15);
        return v12;
      }
      ++debugSerial;
      v20 = *(_QWORD *)__str;
      **(_DWORD **)__str = debugSerial;
      v19 = *(_DWORD *)(a1 + 32);
    }
    else
    {
      v19 = 0;
      v20 = 0;
      *(_DWORD *)(a1 + 32) = 0;
    }
    v12 = 0;
    *(_WORD *)(a1 + 8) = 257;
    *(_QWORD *)(a1 + 16) = v15;
    *(_QWORD *)(a1 + 24) = v20;
    a3[3] = v15;
LABEL_19:
    a3[4] = v19;
    return v12;
  }
  if (v6 == 1)
  {
    *(_QWORD *)(a1 + 16) = a2;
    v18 = mmap(0, a2, 3, 4097, -1, 0);
    *(_QWORD *)(a1 + 24) = v18;
    if ((unint64_t)v18 + 1 > 1)
    {
      *(_WORD *)(a1 + 8) = 257;
      v21 = xpc_shmem_create(v18, *(_QWORD *)(a1 + 16));
      v12 = 0;
      *(_QWORD *)(a1 + 48) = v21;
      a3[3] = *(_QWORD *)(a1 + 16);
      *((_QWORD *)a3 + 2) = v21;
      return v12;
    }
    return *__error();
  }
  if (v6 != 2)
    return 0;
  do
  {
    v7 = __ldxr((unsigned int *)&SharableMemoryBlock::InitServer(unsigned long,SharableMemoryBlock::ServerToken &)::gBufSerialNum);
    v8 = v7 + 1;
  }
  while (__stxr(v7 + 1, (unsigned int *)&SharableMemoryBlock::InitServer(unsigned long,SharableMemoryBlock::ServerToken &)::gBufSerialNum));
  *(_DWORD *)(a1 + 40) = v8;
  v9 = getpid();
  snprintf(__str, 0x40uLL, "AppleABL.%x.%x", v9, v8);
  v10 = shm_open(__str, 514, 511);
  *(_DWORD *)(a1 + 36) = v10;
  if (v10 == -1)
    return *__error();
  ftruncate(v10, a2);
  *(_QWORD *)(a1 + 16) = a2;
  v11 = mmap(0, a2, 3, 1, *(_DWORD *)(a1 + 36), 0);
  *(_QWORD *)(a1 + 24) = v11;
  if ((unint64_t)v11 + 1 > 1)
  {
    v12 = 0;
    *(_WORD *)(a1 + 8) = 257;
    a3[3] = *(_QWORD *)(a1 + 16);
    v19 = *(_DWORD *)(a1 + 36);
    goto LABEL_19;
  }
  v12 = *__error();
  close(*(_DWORD *)(a1 + 36));
  *(_DWORD *)(a1 + 36) = -1;
  shm_unlink(__str);
  return v12;
}

uint64_t SharableMemoryBlock::InitClient(uint64_t a1, uint64_t a2)
{
  int v4;
  vm_size_t v5;
  mem_entry_name_port_t v6;
  ipc_space_t *v7;
  uint64_t v8;
  int v9;
  size_t v10;
  void *v11;
  void *v12;
  size_t v13;
  vm_address_t v14;
  vm_address_t address;

  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v4 = *(_DWORD *)(a2 + 8);
  if (v4 == 2)
  {
    v9 = *(_DWORD *)(a2 + 20);
    *(_DWORD *)(a1 + 36) = v9;
    *(_DWORD *)(a2 + 20) = -1;
    v10 = *(unsigned int *)(a2 + 12);
    *(_QWORD *)(a1 + 16) = v10;
    v11 = mmap(0, v10, 3, 1, v9, 0);
    *(_QWORD *)(a1 + 24) = v11;
    if ((unint64_t)v11 + 1 < 2)
    {
      v8 = *__error();
      close(*(_DWORD *)(a1 + 36));
      *(_DWORD *)(a1 + 36) = -1;
      return v8;
    }
LABEL_9:
    v8 = 0;
    *(_WORD *)(a1 + 8) = 256;
    return v8;
  }
  if (v4 == 1)
  {
    v12 = *(void **)(a2 + 24);
    *(_QWORD *)(a1 + 48) = v12;
    *(_QWORD *)(a2 + 24) = 0;
    v13 = xpc_shmem_map(v12, (void **)(a1 + 24));
    *(_QWORD *)(a1 + 16) = v13;
    if (!v13)
    {
      xpc_release(*(xpc_object_t *)(a1 + 48));
      *(_QWORD *)(a1 + 48) = 0;
      return 0xFFFFFFFFLL;
    }
    goto LABEL_9;
  }
  if (v4)
    return 0;
  address = 0;
  v5 = (*MEMORY[0x24BDB03C8] + *(unsigned int *)(a2 + 12) - 1) & -*MEMORY[0x24BDB03C8];
  v6 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 32) = v6;
  *(_DWORD *)(a2 + 20) = 0;
  v7 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  v8 = vm_map(*MEMORY[0x24BDAEC58], &address, v5, 0xFuLL, 1, v6, 0, 0, 3, 3, 1u);
  if ((_DWORD)v8)
  {
    mach_port_deallocate(*v7, *(_DWORD *)(a1 + 32));
    *(_DWORD *)(a1 + 32) = 0;
  }
  else
  {
    *(_WORD *)(a1 + 8) = 256;
    v14 = address;
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = v14;
  }
  return v8;
}

void SharableMemoryBlock::Free(SharableMemoryBlock *this)
{
  void *v2;
  ipc_space_t *v3;
  mach_port_name_t v4;
  void *v5;
  int v6;
  pid_t v7;
  char __str[64];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    if (*((_BYTE *)this + 9))
    {
      if (*((_DWORD *)this + 8))
      {
        v3 = (ipc_space_t *)MEMORY[0x24BDAEC58];
        MEMORY[0x2199DEEF8](*MEMORY[0x24BDAEC58]);
        v4 = *((_DWORD *)this + 8);
        if (v4)
          mach_port_deallocate(*v3, v4);
        *((_BYTE *)this + 9) = 0;
        *((_DWORD *)this + 8) = 0;
      }
      else
      {
        v5 = (void *)*((_QWORD *)this + 6);
        if (v5)
        {
          xpc_release(v5);
          *((_QWORD *)this + 6) = 0;
          munmap(*((void **)this + 3), *((_QWORD *)this + 2));
        }
        else if (*((_DWORD *)this + 9) != -1)
        {
          munmap(v2, *((_QWORD *)this + 2));
          close(*((_DWORD *)this + 9));
          if (*((_BYTE *)this + 8))
          {
            v6 = *((_DWORD *)this + 10);
            v7 = getpid();
            snprintf(__str, 0x40uLL, "AppleABL.%x.%x", v7, v6);
            shm_unlink(__str);
          }
          *((_DWORD *)this + 9) = -1;
        }
      }
    }
    else if (*((_BYTE *)this + 8))
    {
      free(*((void **)this + 3));
    }
  }
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
}

uint64_t SharableMemoryBlock::MachClientToken::Reset(uint64_t this)
{
  uint64_t v1;
  mach_port_name_t v2;

  v1 = this;
  v2 = *(_DWORD *)(this + 20);
  if (v2)
  {
    this = mach_port_deallocate(*MEMORY[0x24BDAEC58], v2);
    *(_DWORD *)(v1 + 20) = 0;
  }
  *(_DWORD *)(v1 + 12) = 0;
  return this;
}

void SharableMemoryBlock::XPCClientToken::Reset(SharableMemoryBlock::XPCClientToken *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    xpc_release(v2);
    *((_QWORD *)this + 3) = 0;
  }
  *((_DWORD *)this + 3) = 0;
}

uint64_t SharableMemoryBlock::FDClientToken::Reset(SharableMemoryBlock::FDClientToken *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 5);
  if ((_DWORD)result != -1)
  {
    result = close(result);
    *((_DWORD *)this + 5) = -1;
  }
  *((_DWORD *)this + 3) = 0;
  return result;
}

void SharableMemoryBlock::XPCServerToken::~XPCServerToken(SharableMemoryBlock::XPCServerToken *this)
{
  JUMPOUT(0x2199DE55CLL);
}

void SharableMemoryBlock::XPCClientToken::~XPCClientToken(SharableMemoryBlock::XPCClientToken *this)
{
  void *v2;

  *(_QWORD *)this = &off_24D2B5E10;
  if (*((_BYTE *)this + 16))
  {
    v2 = (void *)*((_QWORD *)this + 3);
    if (v2)
    {
      xpc_release(v2);
      *((_QWORD *)this + 3) = 0;
    }
    *((_DWORD *)this + 3) = 0;
  }
}

{
  SharableMemoryBlock::XPCClientToken::~XPCClientToken(this);
  JUMPOUT(0x2199DE55CLL);
}

BOOL SharableMemoryBlock::XPCClientToken::IsValid(SharableMemoryBlock::XPCClientToken *this)
{
  return *((_QWORD *)this + 3) != 0;
}

void SharableMemoryBlock::~SharableMemoryBlock(SharableMemoryBlock *this)
{
  *(_QWORD *)this = &off_24D2B5EC8;
  SharableMemoryBlock::Free(this);
}

{
  *(_QWORD *)this = &off_24D2B5EC8;
  SharableMemoryBlock::Free(this);
  JUMPOUT(0x2199DE55CLL);
}

void sub_215237A24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_215237D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_215237D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_215237DD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215237FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)_GCHapticClientProxy;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2152380E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2152381D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2152383A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523852C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2152386A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2152387D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2152388C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215238A14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_215238EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  id *v15;
  uint64_t v16;

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)(v16 - 40));

  _Unwind_Resume(a1);
}

void sub_215239018(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2152393D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2152399F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_215239BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_215239C00()
{
  JUMPOUT(0x215239BECLL);
}

void sub_215239EF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21523A074(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523A260(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523A42C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21523A4E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523A68C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523A748(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523A8DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523A9CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21523AD88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21523AEC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21523B0D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21523B390(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id NSErrorFromOSStatus(int a1)
{
  if (!a1)
    return 0;
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), a1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_21523B550(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21523B6A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21523B7F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21523B938(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21523BA70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523BC04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21523BD6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21523BEA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523BFD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523C10C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523C240(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523C404(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523C5AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523C75C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21523C860(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void SharableMemoryBlock::~SharableMemoryBlock(id *this)
{
  *this = &off_24D2B5EC8;
  SharableMemoryBlock::Free((SharableMemoryBlock *)this);

}

void HapticSharedMemory::~HapticSharedMemory(HapticSharedMemory *this)
{
  SharableMemoryBlock::~SharableMemoryBlock((id *)&this->_vptr$SharableMemoryBase);
  JUMPOUT(0x2199DE55CLL);
}

void sub_21523CE24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __refcountZeroed_block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

CFTypeRef GC_IOHIDServiceClientGetStringProperty(__IOHIDServiceClient *a1, const __CFString *a2)
{
  return (id)IOHIDServiceClientCopyProperty(a1, a2);
}

CFTypeRef GC_IOHIDServiceClientGetNumberProperty(__IOHIDServiceClient *a1, const __CFString *a2)
{
  return (id)IOHIDServiceClientCopyProperty(a1, a2);
}

CFTypeRef GC_IOHIDServiceClientGetDictionaryProperty(__IOHIDServiceClient *a1, const __CFString *a2)
{
  return (id)IOHIDServiceClientCopyProperty(a1, a2);
}

void GC_IOHIDSetLEDs(const void *a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[6];

  if (a1)
  {
    CFRetain(a1);
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __GC_IOHIDSetLEDs_block_invoke;
    v5[3] = &__block_descriptor_48_e5_v8__0l;
    v5[4] = a1;
    v5[5] = a2;
    dispatch_async(v4, v5);

  }
}

double NormalizedLogicalAxisValueRaw(double a1, double a2, double a3)
{
  double result;

  result = round(((a1 - a2 + a1 - a2) / (a3 - a2) + -1.0) * 1024.0) * 0.0009765625;
  if (result < -1.0)
    result = -1.0;
  if (result > 1.0)
    return 1.0;
  return result;
}

double NormalizedLogicalButtonValueRaw(double a1, double a2, double a3)
{
  double result;

  result = round((a1 - a2) / (a3 - a2) * 1024.0) * 0.0009765625;
  if (result > 1.0)
    return 1.0;
  return result;
}

CFIndex NormalizedLogicalAxisValue(__IOHIDValue *a1)
{
  __IOHIDElement *Element;

  Element = IOHIDValueGetElement(a1);
  IOHIDValueGetIntegerValue(a1);
  IOHIDElementGetLogicalMin(Element);
  return IOHIDElementGetLogicalMax(Element);
}

CFIndex NormalizedLogicalButtonValue(__IOHIDValue *a1)
{
  __IOHIDElement *Element;

  Element = IOHIDValueGetElement(a1);
  IOHIDValueGetIntegerValue(a1);
  IOHIDElementGetLogicalMin(Element);
  return IOHIDElementGetLogicalMax(Element);
}

double NormalizedPhysicalButtonValue(__IOHIDValue *a1)
{
  return round(IOHIDValueGetScaledValue(a1, 1u) * 256.0) * 0.00390625;
}

void sub_21523D62C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_21523FDA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21523FFA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2152401AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _DescendantPointerEvent_0(uint64_t a1)
{
  uint64_t v1;
  const __CFArray *Children;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const void *ValueAtIndex;
  uint64_t v8;

  v1 = a1;
  if (a1 && IOHIDEventGetType() != 17)
  {
    Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children && (v3 = Children, Count = CFArrayGetCount(Children), Count >= 1))
    {
      v5 = Count;
      v6 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
        v8 = _DescendantPointerEvent_0(ValueAtIndex);
        if (v8)
          break;
        if (v5 == ++v6)
          return 0;
      }
      return v8;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void OUTLINED_FUNCTION_0_28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

NSXPCInterface *GCAppClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD1AA8);
}

id GCAppServerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD5E78);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCControllerServiceRemoteClientInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_connectToControllerServiceWithClient_reply_, 0, 0);

  GCControllerServiceRemoteServerInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_connectToControllerServiceWithClient_reply_, 0, 1);

  GCPlayerIndicatorXPCProxyServiceRemoteClientInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_connectToPlayerIndicatorXPCProxyServiceWithClient_reply_, 0, 0);

  GCPlayerIndicatorXPCProxyServiceRemoteServerInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v4, sel_connectToPlayerIndicatorXPCProxyServiceWithClient_reply_, 0, 1);

  GCLightXPCProxyServiceRemoteClientInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_connectToLightXPCProxyServiceWithClient_reply_, 0, 0);

  GCLightXPCProxyServiceRemoteServerInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v6, sel_connectToLightXPCProxyServiceWithClient_reply_, 0, 1);

  GCAdaptiveTriggersXPCProxyServiceRemoteClientInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_connectToAdaptiveTriggersXPCProxyServiceWithClient_reply_, 0, 0);

  GCAdaptiveTriggersXPCProxyServiceRemoteServerInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel_connectToAdaptiveTriggersXPCProxyServiceWithClient_reply_, 0, 1);

  GCMotionXPCProxyServiceRemoteClientInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_connectToMotionXPCProxyServiceWithClient_reply_, 0, 0);

  GCMotionXPCProxyServiceRemoteServerInterface();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v10, sel_connectToMotionXPCProxyServiceWithClient_reply_, 0, 1);

  GCBatteryXPCProxyServiceRemoteClientInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v11, sel_connectToBatteryXPCProxyServiceWithClient_reply_, 0, 0);

  GCBatteryXPCProxyServiceRemoteServerInterface();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_connectToBatteryXPCProxyServiceWithClient_reply_, 0, 1);

  GCSettingsXPCProxyServiceRemoteClientInterface();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_connectToSettingsXPCProxyServiceWithClient_reply_, 0, 0);

  GCSettingsXPCProxyServiceRemoteServerInterface();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v14, sel_connectToSettingsXPCProxyServiceWithClient_reply_, 0, 1);

  GCPhotoVideoXPCProxyServiceRemoteClientInterface();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v15, sel_connectToPhotoVideoXPCProxyServiceWithClient_reply_, 0, 0);

  GCPhotoVideoXPCProxyServiceRemoteServerInterface();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v16, sel_connectToPhotoVideoXPCProxyServiceWithClient_reply_, 0, 1);

  GCGameIntentXPCProxyServiceRemoteClientInterface();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v17, sel_connectToGameIntentXPCProxyServiceWithClient_reply_, 0, 0);

  GCGameIntentXPCProxyServiceRemoteServerInterface();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v18, sel_connectToGameIntentXPCProxyServiceWithClient_reply_, 0, 1);

  GCSystemGestureXPCProxyServiceRemoteClientInterface();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v19, sel_connectToSystemGestureXPCProxyServiceWithClient_reply_, 0, 0);

  GCSystemGestureXPCProxyServiceRemoteServerInterface();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v20, sel_connectToSystemGestureXPCProxyServiceWithClient_reply_, 0, 1);

  return v0;
}

void sub_215243C4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_29(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_215246750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215246968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2152470E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_30(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id _GCMotionEventSourceDescription_Classes()
{
  if (_GCMotionEventSourceDescription_Classes_onceToken != -1)
    dispatch_once(&_GCMotionEventSourceDescription_Classes_onceToken, &__block_literal_global_44);
  return (id)_GCMotionEventSourceDescription_Classes_Classes;
}

void sub_2152496B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215249DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GCPlayerIndicatorXPCProxyRemoteClientEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DE1068);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

id GCPlayerIndicatorXPCProxyRemoteServerEndpointInterface()
{
  void *v0;
  void *v1;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DE1150);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCIPCObjectIdentifier_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchObjectIdentifierWithReply_, 0, 1);

  return v0;
}

NSXPCInterface *GCPlayerIndicatorXPCProxyServiceRemoteClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD11F0);
}

id GCPlayerIndicatorXPCProxyServiceRemoteServerInterface()
{
  void *v0;
  void *v1;
  void *v2;

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DD5760);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GCPlayerIndicatorXPCProxyRemoteClientEndpointInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v1, sel_playerIndicatorXPCProxyServiceClientEndpointConnect_reply_, 0, 0);

  GCPlayerIndicatorXPCProxyRemoteServerEndpointInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_playerIndicatorXPCProxyServiceClientEndpointConnect_reply_, 0, 1);

  return v0;
}

void OUTLINED_FUNCTION_0_31(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21524A9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21524B090(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_21524B2F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

const __CFString *stringFromState(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("nil");
  if (a1 == 2)
    v1 = CFSTR("digital");
  if (a1 == 1)
    return CFSTR("analog");
  else
    return v1;
}

NSNumber *numberFromInt(int a1)
{
  return +[NSNumber numberWithInteger:](&off_254DED908, "numberWithInteger:", a1);
}

id convertToDict(unsigned int *a1, void (*a2)(_QWORD))
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[15];
  _QWORD v22[17];

  v22[15] = *MEMORY[0x24BDAC8D0];
  v21[0] = CFSTR("buttonA");
  a2(*a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("buttonB");
  a2(a1[1]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  v21[2] = CFSTR("buttonX");
  a2(a1[2]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  v21[3] = CFSTR("buttonY");
  a2(a1[3]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = CFSTR("buttonMenu");
  a2(a1[4]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v16;
  v21[5] = CFSTR("buttonOptions");
  a2(a1[5]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v15;
  v21[6] = CFSTR("leftShoulder");
  a2(a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v4;
  v21[7] = CFSTR("rightShoulder");
  a2(a1[7]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v5;
  v21[8] = CFSTR("leftTrigger");
  a2(a1[8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v6;
  v21[9] = CFSTR("rightTrigger");
  a2(a1[9]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v7;
  v21[10] = CFSTR("dpad");
  a2(a1[10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v8;
  v21[11] = CFSTR("leftThumbstick");
  a2(a1[11]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v9;
  v21[12] = CFSTR("rightThumbstick");
  a2(a1[12]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v10;
  v21[13] = CFSTR("leftThumbstickButton");
  a2(a1[13]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v11;
  v21[14] = CFSTR("rightThumbstickButton");
  a2(a1[14]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[14] = v12;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v22, v21, 15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void *getElementTimePressed(void *a1, const char *a2)
{
  if (a1)
    return (void *)objc_msgSend(a1, "getAndResetTimesPressed");
  return a1;
}

uint64_t getElementCapability(uint64_t result)
{
  if (result)
  {
    if (objc_msgSend((id)result, "isAnalog"))
      return 1;
    else
      return 2;
  }
  return result;
}

void mapToAnalytics(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;

  v5 = a1;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 44) = 0u;
  v59 = v5;
  objc_msgSend(v5, "extendedGamepad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v59, "extendedGamepad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buttonA");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)a3 = a2();

    objc_msgSend(v59, "extendedGamepad");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buttonB");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 4) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "buttonX");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 8) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "buttonY");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 12) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "buttonMenu");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 16) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "buttonOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 20) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leftShoulder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 24) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rightShoulder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 28) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leftTrigger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 32) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "rightTrigger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 36) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dpad");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 40) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leftThumbstick");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 44) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "rightThumbstick");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 48) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leftThumbstickButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 52) = a2();

    objc_msgSend(v59, "extendedGamepad");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "rightThumbstickButton");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 56) = a2();
LABEL_8:

    v52 = v59;
    goto LABEL_9;
  }
  objc_msgSend(v59, "gamepad");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v59, "gamepad");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "buttonA");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)a3 = a2();

    objc_msgSend(v59, "gamepad");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "buttonB");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 4) = a2();

    objc_msgSend(v59, "gamepad");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "buttonX");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 8) = a2();

    objc_msgSend(v59, "gamepad");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "buttonY");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 12) = a2();

    objc_msgSend(v59, "gamepad");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leftShoulder");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 24) = a2();

    objc_msgSend(v59, "gamepad");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "rightShoulder");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 28) = a2();

    objc_msgSend(v59, "gamepad");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v35 = v50;
    objc_msgSend(v50, "dpad");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 40) = a2();
    goto LABEL_8;
  }
  objc_msgSend(v59, "microGamepad");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = v59;
  if (v51)
  {
    objc_msgSend(v59, "microGamepad");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "buttonA");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)a3 = a2();

    objc_msgSend(v59, "microGamepad");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "buttonX");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 8) = a2();

    objc_msgSend(v59, "microGamepad");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "buttonMenu");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a3 + 16) = a2();

    objc_msgSend(v59, "microGamepad");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_9:

}

void dataFromController(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  id v21;
  _OWORD v22[2];
  _BYTE v23[28];

  v3 = a1;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_QWORD *)(a2 + 80) = 0;
  v21 = v3;
  objc_msgSend(v3, "detailedProductCategory");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = &stru_24D2B85A8;
  *(_QWORD *)a2 = v6;

  objc_msgSend(v21, "vendorName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = &stru_24D2B85A8;
  *(_QWORD *)(a2 + 8) = v9;

  objc_msgSend(v21, "physicalInputProfileName");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (__CFString *)v10;
  else
    v12 = &stru_24D2B85A8;
  *(_QWORD *)(a2 + 16) = v12;

  *(_BYTE *)(a2 + 24) = objc_msgSend(v21, "isAttachedToDevice");
  v13 = objc_msgSend(v21, "isATVRemote");
  *(_BYTE *)(a2 + 26) = v13;
  if (v13)
  {
    objc_msgSend(v21, "hidServices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(a2 + 27) = objc_msgSend(v14, "count") != 0;

  }
  else
  {
    *(_BYTE *)(a2 + 27) = 0;
  }
  objc_msgSend(v21, "extendedGamepad");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v21, "extendedGamepad");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rightThumbstickButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v21, "extendedGamepad");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "leftThumbstickButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(a2 + 25) = v19 != 0;

    }
    else
    {
      *(_BYTE *)(a2 + 25) = 0;
    }

  }
  else
  {
    *(_BYTE *)(a2 + 25) = 0;
  }

  mapToAnalytics(v21, (uint64_t (*)(void))getElementCapability, (uint64_t)v22);
  v20 = v22[1];
  *(_OWORD *)(a2 + 28) = v22[0];
  *(_OWORD *)(a2 + 44) = v20;
  *(_OWORD *)(a2 + 60) = *(_OWORD *)v23;
  *(_OWORD *)(a2 + 72) = *(_OWORD *)&v23[12];

}

void sub_21524C338(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s0_s8_s16(v1);
  _Unwind_Resume(a1);
}

int32x2_t batchInputData(uint64_t a1, void *a2)
{
  int32x4_t v3;
  int32x2_t result;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7[2];

  v6 = 0u;
  memset(v7, 0, 28);
  v5 = 0u;
  mapToAnalytics(a2, (uint64_t (*)(void))getElementTimePressed, (uint64_t)&v5);
  v3 = vaddq_s32(*(int32x4_t *)(a1 + 16), v6);
  *(int32x4_t *)a1 = vaddq_s32(*(int32x4_t *)a1, v5);
  *(int32x4_t *)(a1 + 16) = v3;
  *(int32x4_t *)(a1 + 32) = vaddq_s32(*(int32x4_t *)(a1 + 32), v7[0]);
  result = vadd_s32(*(int32x2_t *)(a1 + 48), *(int32x2_t *)v7[1].i8);
  *(int32x2_t *)(a1 + 48) = result;
  *(_DWORD *)(a1 + 56) += v7[1].i32[2];
  return result;
}

void sub_21524C47C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

NSXPCInterface *GCBatteryServiceClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DCFAE0);
}

NSXPCInterface *GCBatteryServiceServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEB998);
}

NSData *__cdecl NSDataFromGCGamepadSnapShotDataV100(GCGamepadSnapShotDataV100 *snapshotData)
{
  GCGamepadSnapShotDataV100 *v1;
  __int128 v2;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  if (snapshotData)
  {
    v1 = snapshotData;
    if (!snapshotData->version)
    {
      v2 = *(_OWORD *)&snapshotData->buttonB;
      v4 = *(_OWORD *)&snapshotData->version;
      v5 = v2;
      *(float *)&v6 = snapshotData->rightShoulder;
      LODWORD(v4) = 2359552;
      v1 = (GCGamepadSnapShotDataV100 *)&v4;
    }
    +[NSData dataWithBytes:length:](&off_254DEDA10, "dataWithBytes:length:", v1, 36, v4, v5, v6);
    snapshotData = (GCGamepadSnapShotDataV100 *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)snapshotData;
}

BOOL GCGamepadSnapShotDataV100FromNSData(GCGamepadSnapShotDataV100 *snapshotData, NSData *data)
{
  NSData *v3;
  NSData *v4;
  BOOL v5;
  int v7;

  v3 = data;
  v4 = v3;
  v5 = 0;
  if (snapshotData && v3)
  {
    if (-[NSData length](v3, "length") < 0x24
      || (v7 = 0, -[NSData getBytes:length:](v4, "getBytes:length:", &v7, 4), (unsigned __int16)v7 < 0x100u)
      || HIWORD(v7) < 0x24u)
    {
      v5 = 0;
    }
    else
    {
      -[NSData getBytes:length:](v4, "getBytes:length:", snapshotData, 36);
      v5 = 1;
    }
  }

  return v5;
}

void sub_2152504EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_2152510B8(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s0_s48_s56_s64(v1);
  _Unwind_Resume(a1);
}

void sub_215251210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __destructor_8_s0_s48_s56_s64((id *)va);
  _Unwind_Resume(a1);
}

void sub_215251290(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s0_s48_s56_s64(v1);
  _Unwind_Resume(a1);
}

void sub_215251414(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s0_s48_s56_s64(v1);
  _Unwind_Resume(a1);
}

void sub_215251580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __destructor_8_s0_s48_s56_s64((id *)va);
  _Unwind_Resume(a1);
}

void sub_2152516A0(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s0_s48_s56_s64(v1);
  _Unwind_Resume(a1);
}

void sub_215251760(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s0_s48_s56_s64(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_32(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_29(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 38, a4);
}

id @objc UISceneConnectionOptions.gameControllerActivationContext.getter(void *a1)
{
  id v2;
  void *v4;

  lazy protocol witness table accessor for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition();
  v2 = a1;
  UISceneConnectionOptions.subscript.getter();

  return v4;
}

uint64_t UISceneConnectionOptions.gameControllerActivationContext.getter()
{
  uint64_t v1;

  lazy protocol witness table accessor for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition();
  UISceneConnectionOptions.subscript.getter();
  return v1;
}

unint64_t lazy protocol witness table accessor for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition;
  if (!lazy protocol witness table cache variable for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCGameControllerConnectingOptionDefinition, &type metadata for GCGameControllerConnectingOptionDefinition);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition);
  }
  return result;
}

uint64_t GCPhysicalInputElementCollection.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id GCPhysicalInputElementCollection.subscript.getter()
{
  void **v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *v0;
  v2 = (void *)MEMORY[0x2199DDDF4]();
  v3 = objc_msgSend(v1, sel_elementForAlias_, v2);

  return v3;
}

{
  void **v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v1 = *v0;
  dispatch thunk of RawRepresentable.rawValue.getter();
  v2 = v1;
  v3 = (void *)MEMORY[0x2199DDDF4]();
  v4 = objc_msgSend(v2, sel_elementForAlias_, v3);

  swift_bridgeObjectRelease();
  return v4;
}

BOOL static GCPhysicalInputElementCollection.Index.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

BOOL static GCPhysicalInputElementCollection.Index.< infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

id GCPhysicalInputElementCollection.subscript.getter(_QWORD *a1)
{
  id *v1;

  return objc_msgSend(*v1, sel_elementAtIndex_, *a1);
}

void GCPhysicalInputElementCollection.startIndex.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

id GCPhysicalInputElementCollection.endIndex.getter@<X0>(_QWORD *a1@<X8>)
{
  id *v1;
  id result;

  result = objc_msgSend(*v1, sel_count);
  *a1 = result;
  return result;
}

_QWORD *GCPhysicalInputElementCollection.index(after:)@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    *a2 = *result + 1;
  return result;
}

void protocol witness for Collection.startIndex.getter in conformance GCPhysicalInputElementCollection<A>(_QWORD *a1@<X8>)
{
  GCPhysicalInputElementCollection.startIndex.getter(a1);
}

void (*protocol witness for Collection.subscript.read in conformance GCPhysicalInputElementCollection<A>(_QWORD *a1, _QWORD *a2))(_QWORD *a1)
{
  _QWORD *v4;
  uint64_t (*v5)();
  uint64_t v6;

  v4 = malloc(0x30uLL);
  *a1 = v4;
  v5 = GCPhysicalInputElementCollection.subscript.read(v4, a2);
  v4[4] = v6;
  v4[5] = v5;
  return protocol witness for Collection.subscript.read in conformance GCPhysicalInputElementCollection<A>;
}

void protocol witness for Collection.subscript.read in conformance GCPhysicalInputElementCollection<A>(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 40))(*a1);
  free(v1);
}

uint64_t (*GCPhysicalInputElementCollection.subscript.read(_QWORD *a1, _QWORD *a2))()
{
  id *v2;

  *a1 = objc_msgSend(*v2, sel_elementAtIndex_, *a2);
  return GCPhysicalInputElementCollection.subscript.read;
}

uint64_t GCPhysicalInputElementCollection.subscript.read()
{
  return swift_unknownObjectRelease();
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance GCPhysicalInputElementCollection<A>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance GCPhysicalInputElementCollection<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return specialized Collection._failEarlyRangeCheck(_:bounds:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x24BEE1B68], MEMORY[0x24BEE07E0]);
}

{
  return specialized Collection._failEarlyRangeCheck(_:bounds:)(a1, a2, a3, a4, MEMORY[0x24BEE08B8], (uint64_t (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE07F0]);
}

_QWORD *protocol witness for Collection.index(after:) in conformance GCPhysicalInputElementCollection<A>@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return GCPhysicalInputElementCollection.index(after:)(a1, a2);
}

_QWORD *protocol witness for Collection.formIndex(after:) in conformance GCPhysicalInputElementCollection<A>(_QWORD *a1)
{
  _QWORD *result;
  uint64_t v3;

  result = GCPhysicalInputElementCollection.index(after:)(a1, &v3);
  *a1 = v3;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance GCPhysicalInputElementCollection<A>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  GCPhysicalInputElementCollection.startIndex.getter(a1 + 1);
  *a1 = v3;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance GCPhysicalInputElementCollection<A>(uint64_t a1)
{
  MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCPhysicalInputElementCollection<A>, a1);
  return Collection.underestimatedCount.getter();
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance GCPhysicalInputElementCollection<A>()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance GCPhysicalInputElementCollection<A>(uint64_t a1)
{
  id *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCPhysicalInputElementCollection<A>, a1);
  v4 = specialized Collection._copyToContiguousArray()(v1, a1, v3);

  return v4;
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance GCPhysicalInputElementCollection<A>()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

GameController::GCPhysicalInputElementName __swiftcall GCPhysicalInputElementName.init(rawValue:)(GameController::GCPhysicalInputElementName rawValue)
{
  GameController::GCPhysicalInputElementName *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t GCPhysicalInputElementName.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for shifter()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCPhysicalInputElementName.shifter = result;
  unk_254DBE320 = v1;
  return result;
}

uint64_t *GCPhysicalInputElementName.shifter.unsafeMutableAddressor()
{
  if (one-time initialization token for shifter != -1)
    swift_once();
  return &static GCPhysicalInputElementName.shifter;
}

uint64_t static GCPhysicalInputElementName.shifter.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (one-time initialization token for shifter != -1)
    swift_once();
  v2 = unk_254DBE320;
  *a1 = static GCPhysicalInputElementName.shifter;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance GCPhysicalInputElementName@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GCPhysicalInputElementName@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GCPhysicalInputElementName()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GCPhysicalInputElementName()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GCPhysicalInputElementName()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GCPhysicalInputElementName(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

id GCPhysicalInputElementCollection<>.subscript.getter(uint64_t *a1)
{
  void **v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = *a1;
  v3 = a1[1];
  v4 = *v1;
  swift_bridgeObjectRetain();
  v5 = v4;
  v6 = (void *)MEMORY[0x2199DDDF4](v2, v3);
  v7 = objc_msgSend(v5, sel_elementForAlias_, v6);

  swift_bridgeObjectRelease();
  return v7;
}

uint64_t GCPhysicalInputElementCollection.subscript.getter()
{
  void **v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v5;

  v1 = *v0;
  dispatch thunk of RawRepresentable.rawValue.getter();
  v2 = v1;
  v3 = GCPhysicalInputElementCollection.subscript.getter();

  swift_bridgeObjectRelease();
  if (!v3)
    return 0;
  swift_getAssociatedTypeWitness();
  if (swift_dynamicCast())
    return v5;
  else
    return 0;
}

void base witness table accessor for Equatable in GCPhysicalInputElementCollection<A>.Index()
{
  JUMPOUT(0x2199DEEA4);
}

void base witness table accessor for Sequence in GCPhysicalInputElementCollection<A>()
{
  JUMPOUT(0x2199DEEA4);
}

void associated type witness table accessor for Collection.Index : Comparable in GCPhysicalInputElementCollection<A>()
{
  JUMPOUT(0x2199DEEA4);
}

void associated type witness table accessor for Collection.Indices : Collection in GCPhysicalInputElementCollection<A>()
{
  JUMPOUT(0x2199DEEA4);
}

void associated type witness table accessor for Collection.SubSequence : Collection in GCPhysicalInputElementCollection<A>()
{
  JUMPOUT(0x2199DEEA4);
}

void associated type witness table accessor for Sequence.Iterator : IteratorProtocol in GCPhysicalInputElementCollection<A>()
{
  JUMPOUT(0x2199DEEA4);
}

unint64_t lazy protocol witness table accessor for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName;
  if (!lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCPhysicalInputElementName, &type metadata for GCPhysicalInputElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName;
  if (!lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCPhysicalInputElementName, &type metadata for GCPhysicalInputElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName;
  if (!lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCPhysicalInputElementName, &type metadata for GCPhysicalInputElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for GCPhysicalInputElementName(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = lazy protocol witness table accessor for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName();
  result = lazy protocol witness table accessor for type GCPhysicalInputElementName and conformance GCPhysicalInputElementName();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t type metadata instantiation function for GCPhysicalInputElementCollection()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for GCPhysicalInputElementCollection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for GCPhysicalInputElementCollection);
}

uint64_t type metadata instantiation function for GCPhysicalInputElementCollection.Index()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for GCPhysicalInputElementCollection.Index(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for GCPhysicalInputElementCollection.Index);
}

_QWORD *initializeBufferWithCopyOfBuffer for GCPhysicalInputElementName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GCPhysicalInputElementName()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for GCPhysicalInputElementName(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for GCPhysicalInputElementName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCPhysicalInputElementName(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GCPhysicalInputElementName(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GCPhysicalInputElementName()
{
  return &type metadata for GCPhysicalInputElementName;
}

uint64_t specialized Collection._failEarlyRangeCheck(_:bounds:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  void (*v12)(char *, uint64_t, uint64_t);
  char v13;
  void (*v14)(char *, uint64_t);
  uint64_t result;
  void (*v16)(char *, uint64_t);
  uint64_t v17;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v4 = type metadata accessor for Range();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  v11 = dispatch thunk of static Comparable.<= infix(_:_:)();
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, a1, v4);
  v12(v8, a2, v4);
  if ((v11 & 1) == 0)
  {
    v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    result = ((uint64_t (*)(char *, uint64_t))v16)(v10, v4);
    goto LABEL_5;
  }
  v13 = dispatch thunk of static Comparable.<= infix(_:_:)();
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  result = ((uint64_t (*)(char *, uint64_t))v14)(v10, v4);
  if ((v13 & 1) == 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t specialized Collection._failEarlyRangeCheck(_:bounds:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
  char v20;
  uint64_t result;
  uint64_t v22;
  uint64_t (*v23)(char *, char *, uint64_t, uint64_t);

  v23 = a6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v11 = a5(0, AssociatedTypeWitness, AssociatedConformanceWitness);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v15 = (char *)&v22 - v14;
  v16 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v22 - v17;
  v19 = dispatch thunk of static Comparable.<= infix(_:_:)();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a2, v11);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
    goto LABEL_5;
  }
  v20 = v23(v18, &v15[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
  if ((v20 & 1) == 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199DEE80](a1, v6, a5);
}

NSEnumerator_optional __swiftcall GCDevicePhysicalInputStateDiff.changedElements()()
{
  void *v0;
  objc_class *v1;
  Swift::Bool v2;
  NSEnumerator_optional result;

  v1 = (objc_class *)objc_msgSend(v0, sel_changedElements);
  result.value.super.isa = v1;
  result.is_nil = v2;
  return result;
}

id GCDevicePhysicalInputStateDiff.changedElements()@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  id result;
  uint64_t (*v4)@<X0>(uint64_t *@<X0>, uint64_t *@<X8>);
  BOOL (*v5)(_QWORD *);
  uint64_t (*v6)@<X0>(uint64_t@<X0>, _QWORD *@<X8>);

  result = objc_msgSend(v1, sel_changedElements);
  if (result)
  {
    v4 = specialized closure #2 in LazySequenceProtocol.compactMap<A>(_:);
    v5 = specialized closure #1 in LazySequenceProtocol.compactMap<A>(_:);
    v6 = closure #1 in GCDevicePhysicalInputStateDiff.changedElements();
  }
  else
  {
    v6 = 0;
    v5 = 0;
    v4 = 0;
  }
  *a1 = result;
  a1[1] = v6;
  a1[2] = 0;
  a1[3] = v5;
  a1[4] = 0;
  a1[5] = v4;
  a1[6] = 0;
  return result;
}

uint64_t closure #1 in GCDevicePhysicalInputStateDiff.changedElements()@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  outlined init with copy of Any(a1, (uint64_t)&v4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for GCPhysicalInputElement);
  result = swift_dynamicCast();
  if ((result & 1) == 0)
    *a2 = 0;
  return result;
}

BOOL specialized closure #1 in LazySequenceProtocol.compactMap<A>(_:)(_QWORD *a1)
{
  return *a1 != 0;
}

uint64_t specialized closure #2 in LazySequenceProtocol.compactMap<A>(_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = *a1;
  if (result)
  {
    *a2 = result;
    return swift_unknownObjectRetain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LazyMapSequence<LazyFilterSequence<LazyMapSequence<NSEnumerator, GCPhysicalInputElement?>>, GCPhysicalInputElement> and conformance LazyMapSequence<A, B>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type LazyMapSequence<LazyFilterSequence<LazyMapSequence<NSEnumerator, GCPhysicalInputElement?>>, GCPhysicalInputElement> and conformance LazyMapSequence<A, B>;
  if (!lazy protocol witness table cache variable for type LazyMapSequence<LazyFilterSequence<LazyMapSequence<NSEnumerator, GCPhysicalInputElement?>>, GCPhysicalInputElement> and conformance LazyMapSequence<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for LazyMapSequence<LazyFilterSequence<LazyMapSequence<NSEnumerator, GCPhysicalInputElement?>>, GCPhysicalInputElement>);
    result = MEMORY[0x2199DEEA4](MEMORY[0x24BEE2B40], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LazyMapSequence<LazyFilterSequence<LazyMapSequence<NSEnumerator, GCPhysicalInputElement?>>, GCPhysicalInputElement> and conformance LazyMapSequence<A, B>);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199DEE98](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199DEE8C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

GameController::GCAxisElementName __swiftcall GCAxisElementName.init(rawValue:)(GameController::GCAxisElementName rawValue)
{
  GameController::GCAxisElementName *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t GCAxisElementName.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for steeringWheel()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCAxisElementName.steeringWheel = result;
  unk_254DBE840 = v1;
  return result;
}

uint64_t *GCAxisElementName.steeringWheel.unsafeMutableAddressor()
{
  if (one-time initialization token for steeringWheel != -1)
    swift_once();
  return &static GCAxisElementName.steeringWheel;
}

uint64_t static GCAxisElementName.steeringWheel.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (one-time initialization token for steeringWheel != -1)
    swift_once();
  v2 = unk_254DBE840;
  *a1 = static GCAxisElementName.steeringWheel;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance GCAxisElementName@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GCAxisElementName@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GCAxisElementName()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GCAxisElementName()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GCAxisElementName()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GCAxisElementName(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

id GCPhysicalInputElementCollection<>.subscript.getter()
{
  void **v0;
  id v1;
  id v2;
  void *v4;

  v4 = *v0;
  swift_bridgeObjectRetain();
  v1 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GCPhysicalInputElementCollection<GCAxisElement>);
  v2 = GCPhysicalInputElementCollection.subscript.getter();

  swift_bridgeObjectRelease();
  return v2;
}

{
  void **v0;
  id v1;
  id v2;
  void *v4;

  v4 = *v0;
  swift_bridgeObjectRetain();
  v1 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GCPhysicalInputElementCollection<GCDirectionPadElement>);
  v2 = GCPhysicalInputElementCollection.subscript.getter();

  swift_bridgeObjectRelease();
  return v2;
}

{
  void **v0;
  id v1;
  id v2;
  void *v4;

  v4 = *v0;
  swift_bridgeObjectRetain();
  v1 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GCPhysicalInputElementCollection<GCSwitchElement>);
  v2 = GCPhysicalInputElementCollection.subscript.getter();

  swift_bridgeObjectRelease();
  return v2;
}

{
  void **v0;
  id v1;
  id v2;
  void *v4;

  v4 = *v0;
  swift_bridgeObjectRetain();
  v1 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GCPhysicalInputElementCollection<GCButtonElement>);
  v2 = GCPhysicalInputElementCollection.subscript.getter();

  swift_bridgeObjectRelease();
  return v2;
}

unint64_t lazy protocol witness table accessor for type GCAxisElementName and conformance GCAxisElementName()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName;
  if (!lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCAxisElementName, &type metadata for GCAxisElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName;
  if (!lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCAxisElementName, &type metadata for GCAxisElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName;
  if (!lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCAxisElementName, &type metadata for GCAxisElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCAxisElementName and conformance GCAxisElementName);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for GCAxisElementName(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = lazy protocol witness table accessor for type GCAxisElementName and conformance GCAxisElementName();
  result = lazy protocol witness table accessor for type GCAxisElementName and conformance GCAxisElementName();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for GCAxisElementName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GCAxisElementName()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for GCAxisElementName(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for GCAxisElementName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCAxisElementName(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GCAxisElementName(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GCAxisElementName()
{
  return &type metadata for GCAxisElementName;
}

uint64_t GCDevicePhysicalInputState.elements.getter@<X0>(_QWORD *a1@<X8>)
{
  return GCDevicePhysicalInputState.elements.getter((SEL *)&selRef_elements, (uint64_t *)&demangling cache variable for type metadata for GCPhysicalInputElement, a1);
}

uint64_t GCDevicePhysicalInputState.buttons.getter@<X0>(_QWORD *a1@<X8>)
{
  return GCDevicePhysicalInputState.elements.getter((SEL *)&selRef_buttons, &demangling cache variable for type metadata for GCButtonElement, a1);
}

uint64_t GCDevicePhysicalInputState.axes.getter@<X0>(_QWORD *a1@<X8>)
{
  return GCDevicePhysicalInputState.elements.getter((SEL *)&selRef_axes, &demangling cache variable for type metadata for GCAxisElement, a1);
}

uint64_t GCDevicePhysicalInputState.switches.getter@<X0>(_QWORD *a1@<X8>)
{
  return GCDevicePhysicalInputState.elements.getter((SEL *)&selRef_switches, &demangling cache variable for type metadata for GCSwitchElement, a1);
}

uint64_t GCDevicePhysicalInputState.dpads.getter@<X0>(_QWORD *a1@<X8>)
{
  return GCDevicePhysicalInputState.elements.getter((SEL *)&selRef_dpads, (uint64_t *)&demangling cache variable for type metadata for GCDirectionPadElement, a1);
}

uint64_t GCDevicePhysicalInputState.elements.getter@<X0>(SEL *a1@<X1>, uint64_t *a2@<X2>, _QWORD *a3@<X8>)
{
  void *v3;
  void *v5;
  id v7;

  v5 = v3;
  v7 = objc_msgSend(v5, *a1);
  __swift_instantiateConcreteTypeFromMangledName(a2);
  return GCPhysicalInputElementCollection.init(_:)((uint64_t)v7, a3);
}

uint64_t (*implicit closure #1 in variable initialization expression of static GCGameControllerConnectingOptionDefinition.sceneDelegateMethod(uint64_t a1))()
{
  *(_QWORD *)(swift_allocObject() + 16) = a1;
  swift_unknownObjectRetain();
  return implicit closure #2 in implicit closure #1 in variable initialization expression of static GCGameControllerConnectingOptionDefinition.sceneDelegateMethodpartial apply;
}

uint64_t (**GCGameControllerConnectingOptionDefinition.sceneDelegateMethod.unsafeMutableAddressor())()
{
  return &static GCGameControllerConnectingOptionDefinition.sceneDelegateMethod;
}

uint64_t (*(*static GCGameControllerConnectingOptionDefinition.sceneDelegateMethod.getter())(uint64_t a1))()
{
  return implicit closure #1 in variable initialization expression of static GCGameControllerConnectingOptionDefinition.sceneDelegateMethod;
}

uint64_t static GCGameControllerConnectingOptionDefinition.invokeSceneDelegate(_:scene:payload:)(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

unint64_t lazy protocol witness table accessor for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box;
  if (!lazy protocol witness table cache variable for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCGameControllerActivationContext._Box, &type metadata for GCGameControllerActivationContext._Box);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box;
  if (!lazy protocol witness table cache variable for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCGameControllerActivationContext._Box, &type metadata for GCGameControllerActivationContext._Box);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCGameControllerActivationContext._Box and conformance GCGameControllerActivationContext._Box);
  }
  return result;
}

uint64_t (*protocol witness for static UISceneConnectionOptionDefinition.sceneDelegateMethod.getter in conformance GCGameControllerConnectingOptionDefinition())@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return _sSo29GCGameControllerSceneDelegate_pSo7UISceneCSo0aB17ActivationContextCIeggg_Ieggo_SoAA_pxq_q0_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lyAcEytIsegnnr_Iegnr_TR020_s14GameController06a37B26ConnectingOptionDefinitionO19scened11MethodyySo7e9C_So0cB17fg9CtcSo0cb5C28H0_pcvpZfiyAF_AHtcSoAI_pcfu_Tf3nnpf_n;
}

uint64_t _sSo29GCGameControllerSceneDelegate_pSo7UISceneCSo0aB17ActivationContextCIeggg_Ieggo_SoAA_pxq_q0_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lyAcEytIsegnnr_Iegnr_TR020_s14GameController06a37B26ConnectingOptionDefinitionO19scened11MethodyySo7e9C_So0cB17fg9CtcSo0cb5C28H0_pcvpZfiyAF_AHtcSoAI_pcfu_Tf3nnpf_n@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = partial apply for implicit closure #2 in implicit closure #1 in variable initialization expression of static GCGameControllerConnectingOptionDefinition.sceneDelegateMethod;
  *(_QWORD *)(v5 + 24) = v4;
  *a2 = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed UIScene, @guaranteed GCGameControllerActivationContext) -> ();
  a2[1] = v5;
  return swift_unknownObjectRetain();
}

uint64_t protocol witness for static UISceneConnectionOptionDefinition.invokeSceneDelegate(_:scene:payload:) in conformance GCGameControllerConnectingOptionDefinition(uint64_t (**a1)(uint64_t *, uint64_t *), uint64_t a2, uint64_t *a3)
{
  uint64_t (*v3)(uint64_t *, uint64_t *);
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v5 = *a3;
  v6 = a2;
  return v3(&v6, &v5);
}

ValueMetadata *type metadata accessor for GCGameControllerConnectingOptionDefinition()
{
  return &type metadata for GCGameControllerConnectingOptionDefinition;
}

uint64_t sub_21525643C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

id partial apply for implicit closure #2 in implicit closure #1 in variable initialization expression of static GCGameControllerConnectingOptionDefinition.sceneDelegateMethod(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return objc_msgSend(*(id *)(v2 + 16), sel_scene_didActivateGameControllerWithContext_, a1, a2);
}

uint64_t sub_215256478()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed UIScene, @guaranteed GCGameControllerActivationContext) -> ()(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

GameController::GCDirectionPadElementName __swiftcall GCDirectionPadElementName.init(rawValue:)(GameController::GCDirectionPadElementName rawValue)
{
  GameController::GCDirectionPadElementName *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t GCDirectionPadElementName.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for directionPad()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputDirectionPad.getter();
  static GCDirectionPadElementName.directionPad = result;
  unk_254DBEAE0 = v1;
  return result;
}

uint64_t *GCDirectionPadElementName.directionPad.unsafeMutableAddressor()
{
  if (one-time initialization token for directionPad != -1)
    swift_once();
  return &static GCDirectionPadElementName.directionPad;
}

uint64_t static GCDirectionPadElementName.directionPad.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCDirectionPadElementName.directionPad.getter(&one-time initialization token for directionPad, &static GCDirectionPadElementName.directionPad, &qword_254DBEAE0, a1);
}

uint64_t one-time initialization function for leftThumbstick()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputLeftThumbstick.getter();
  static GCDirectionPadElementName.leftThumbstick = result;
  *(_QWORD *)algn_254DBEAF8 = v1;
  return result;
}

uint64_t *GCDirectionPadElementName.leftThumbstick.unsafeMutableAddressor()
{
  if (one-time initialization token for leftThumbstick != -1)
    swift_once();
  return &static GCDirectionPadElementName.leftThumbstick;
}

uint64_t static GCDirectionPadElementName.leftThumbstick.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCDirectionPadElementName.directionPad.getter(&one-time initialization token for leftThumbstick, &static GCDirectionPadElementName.leftThumbstick, (uint64_t *)algn_254DBEAF8, a1);
}

uint64_t one-time initialization function for rightThumbstick()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputRightThumbstick.getter();
  static GCDirectionPadElementName.rightThumbstick = result;
  *(_QWORD *)algn_254DBEB10 = v1;
  return result;
}

uint64_t *GCDirectionPadElementName.rightThumbstick.unsafeMutableAddressor()
{
  if (one-time initialization token for rightThumbstick != -1)
    swift_once();
  return &static GCDirectionPadElementName.rightThumbstick;
}

uint64_t static GCDirectionPadElementName.rightThumbstick.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCDirectionPadElementName.directionPad.getter(&one-time initialization token for rightThumbstick, &static GCDirectionPadElementName.rightThumbstick, (uint64_t *)algn_254DBEB10, a1);
}

uint64_t static GCDirectionPadElementName.directionPad.getter@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;

  if (*a1 != -1)
    swift_once();
  v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;
  return swift_bridgeObjectRetain();
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance GCDirectionPadElementName@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GCDirectionPadElementName@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GCDirectionPadElementName()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GCDirectionPadElementName()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GCDirectionPadElementName()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GCDirectionPadElementName(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

unint64_t lazy protocol witness table accessor for type GCDirectionPadElementName and conformance GCDirectionPadElementName()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName;
  if (!lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCDirectionPadElementName, &type metadata for GCDirectionPadElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName;
  if (!lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCDirectionPadElementName, &type metadata for GCDirectionPadElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName;
  if (!lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCDirectionPadElementName, &type metadata for GCDirectionPadElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCDirectionPadElementName and conformance GCDirectionPadElementName);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for GCDirectionPadElementName(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = lazy protocol witness table accessor for type GCDirectionPadElementName and conformance GCDirectionPadElementName();
  result = lazy protocol witness table accessor for type GCDirectionPadElementName and conformance GCDirectionPadElementName();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for GCDirectionPadElementName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GCDirectionPadElementName()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for GCDirectionPadElementName(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for GCDirectionPadElementName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCDirectionPadElementName(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GCDirectionPadElementName(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GCDirectionPadElementName()
{
  return &type metadata for GCDirectionPadElementName;
}

uint64_t GCInputButtonA.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonB.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonX.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonY.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputDirectionPad.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputLeftThumbstick.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputRightThumbstick.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputLeftShoulder.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputRightShoulder.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputLeftTrigger.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputRightTrigger.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputLeftThumbstickButton.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputRightThumbstickButton.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonHome.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonMenu.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonOptions.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputButtonShare.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputXboxPaddleOne.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputXboxPaddleTwo.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputXboxPaddleThree.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputXboxPaddleFour.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputDualShockTouchpadOne.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputDualShockTouchpadTwo.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputDualShockTouchpadButton.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputSteeringWheel.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputShifter.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputPedalAccelerator.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputPedalBrake.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputPedalClutch.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputLeftPaddle.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t GCInputRightPaddle.getter()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

GameController::GCSwitchElementName __swiftcall GCSwitchElementName.init(rawValue:)(GameController::GCSwitchElementName rawValue)
{
  GameController::GCSwitchElementName *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t GCSwitchElementName.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance GCSwitchElementName@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GCSwitchElementName@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GCSwitchElementName()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GCSwitchElementName()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GCSwitchElementName()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GCSwitchElementName(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

unint64_t lazy protocol witness table accessor for type GCSwitchElementName and conformance GCSwitchElementName()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName;
  if (!lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCSwitchElementName, &type metadata for GCSwitchElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName;
  if (!lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCSwitchElementName, &type metadata for GCSwitchElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName;
  if (!lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCSwitchElementName, &type metadata for GCSwitchElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCSwitchElementName and conformance GCSwitchElementName);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for GCSwitchElementName(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = lazy protocol witness table accessor for type GCSwitchElementName and conformance GCSwitchElementName();
  result = lazy protocol witness table accessor for type GCSwitchElementName and conformance GCSwitchElementName();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for GCSwitchElementName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GCSwitchElementName()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for GCSwitchElementName(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for GCSwitchElementName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCSwitchElementName(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GCSwitchElementName(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GCSwitchElementName()
{
  return &type metadata for GCSwitchElementName;
}

uint64_t GCGameControllerActivationContext.asBSAction(with:)()
{
  void *v0;
  id v1;
  uint64_t v2;

  lazy protocol witness table accessor for type GCGameControllerConnectingOptionDefinition and conformance GCGameControllerConnectingOptionDefinition();
  v1 = v0;
  v2 = static UISceneConnectionOptionDefinition.createAction(payload:responder:)();

  return v2;
}

id GCGameControllerActivationContext._Box.init(from:)(_QWORD *a1)
{
  return specialized GCGameControllerActivationContext._Box.init(from:)(a1);
}

uint64_t GCGameControllerActivationContext._Box.encode(to:)(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  _BYTE v6[24];
  uint64_t v7;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  v3 = objc_msgSend(a2, sel_previousApplicationBundleID);
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

  }
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, v7);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  lazy protocol witness table accessor for type String? and conformance <A> A?(&lazy protocol witness table cache variable for type String? and conformance <A> A?, MEMORY[0x24BEE0D08], MEMORY[0x24BEE4AA8]);
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

id protocol witness for Decodable.init(from:) in conformance GCGameControllerActivationContext._Box@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id result;

  result = specialized GCGameControllerActivationContext._Box.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GCGameControllerActivationContext._Box(_QWORD *a1)
{
  void **v1;

  return GCGameControllerActivationContext._Box.encode(to:)(a1, *v1);
}

id specialized GCGameControllerActivationContext._Box.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  id v3;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];

  v3 = (id)a1[3];
  __swift_project_boxed_opaque_existential_1(a1, (uint64_t)v3);
  dispatch thunk of Decoder.singleValueContainer()();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    lazy protocol witness table accessor for type String? and conformance <A> A?((unint64_t *)&lazy protocol witness table cache variable for type String? and conformance <A> A?, MEMORY[0x24BEE0D38], MEMORY[0x24BEE4AC0]);
    dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
    if (v6)
    {
      v5 = (void *)MEMORY[0x2199DDDF4]();
      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = 0;
    }
    v3 = objc_msgSend(objc_allocWithZone((Class)GCGameControllerActivationContext), sel_initWithPreviousApplication_, v5);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v3;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

ValueMetadata *type metadata accessor for GCGameControllerActivationContext._Box()
{
  return &type metadata for GCGameControllerActivationContext._Box;
}

uint64_t lazy protocol witness table accessor for type String? and conformance <A> A?(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for String?);
    v8 = a2;
    result = MEMORY[0x2199DEEA4](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

GameController::GCButtonElementName __swiftcall GCButtonElementName.init(rawValue:)(GameController::GCButtonElementName rawValue)
{
  GameController::GCButtonElementName *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t GCButtonElementName.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for a()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputButtonA.getter();
  static GCButtonElementName.a = result;
  unk_254DBF030 = v1;
  return result;
}

uint64_t *GCButtonElementName.a.unsafeMutableAddressor()
{
  if (one-time initialization token for a != -1)
    swift_once();
  return &static GCButtonElementName.a;
}

uint64_t static GCButtonElementName.a.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for a, &static GCButtonElementName.a, &qword_254DBF030, a1);
}

uint64_t one-time initialization function for b()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputButtonB.getter();
  static GCButtonElementName.b = result;
  *(_QWORD *)algn_254DBF048 = v1;
  return result;
}

uint64_t *GCButtonElementName.b.unsafeMutableAddressor()
{
  if (one-time initialization token for b != -1)
    swift_once();
  return &static GCButtonElementName.b;
}

uint64_t static GCButtonElementName.b.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for b, &static GCButtonElementName.b, (uint64_t *)algn_254DBF048, a1);
}

uint64_t one-time initialization function for x()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputButtonX.getter();
  static GCButtonElementName.x = result;
  unk_254DBF060 = v1;
  return result;
}

uint64_t *GCButtonElementName.x.unsafeMutableAddressor()
{
  if (one-time initialization token for x != -1)
    swift_once();
  return &static GCButtonElementName.x;
}

uint64_t static GCButtonElementName.x.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for x, &static GCButtonElementName.x, &qword_254DBF060, a1);
}

uint64_t one-time initialization function for y()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputButtonY.getter();
  static GCButtonElementName.y = result;
  *(_QWORD *)algn_254DBF078 = v1;
  return result;
}

uint64_t *GCButtonElementName.y.unsafeMutableAddressor()
{
  if (one-time initialization token for y != -1)
    swift_once();
  return &static GCButtonElementName.y;
}

uint64_t static GCButtonElementName.y.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for y, &static GCButtonElementName.y, (uint64_t *)algn_254DBF078, a1);
}

uint64_t one-time initialization function for leftShoulder()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputLeftShoulder.getter();
  static GCButtonElementName.leftShoulder = result;
  unk_254DBF090 = v1;
  return result;
}

uint64_t *GCButtonElementName.leftShoulder.unsafeMutableAddressor()
{
  if (one-time initialization token for leftShoulder != -1)
    swift_once();
  return &static GCButtonElementName.leftShoulder;
}

uint64_t static GCButtonElementName.leftShoulder.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for leftShoulder, &static GCButtonElementName.leftShoulder, &qword_254DBF090, a1);
}

uint64_t one-time initialization function for rightShoulder()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputRightShoulder.getter();
  static GCButtonElementName.rightShoulder = result;
  *(_QWORD *)algn_254DBF0A8 = v1;
  return result;
}

uint64_t *GCButtonElementName.rightShoulder.unsafeMutableAddressor()
{
  if (one-time initialization token for rightShoulder != -1)
    swift_once();
  return &static GCButtonElementName.rightShoulder;
}

uint64_t static GCButtonElementName.rightShoulder.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for rightShoulder, &static GCButtonElementName.rightShoulder, (uint64_t *)algn_254DBF0A8, a1);
}

uint64_t one-time initialization function for leftBumper()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.leftBumper = result;
  unk_254DBF0C0 = v1;
  return result;
}

uint64_t *GCButtonElementName.leftBumper.unsafeMutableAddressor()
{
  if (one-time initialization token for leftBumper != -1)
    swift_once();
  return &static GCButtonElementName.leftBumper;
}

uint64_t static GCButtonElementName.leftBumper.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for leftBumper, &static GCButtonElementName.leftBumper, &qword_254DBF0C0, a1);
}

uint64_t one-time initialization function for rightBumper()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.rightBumper = result;
  *(_QWORD *)algn_254DBF0D8 = v1;
  return result;
}

uint64_t *GCButtonElementName.rightBumper.unsafeMutableAddressor()
{
  if (one-time initialization token for rightBumper != -1)
    swift_once();
  return &static GCButtonElementName.rightBumper;
}

uint64_t static GCButtonElementName.rightBumper.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for rightBumper, &static GCButtonElementName.rightBumper, (uint64_t *)algn_254DBF0D8, a1);
}

uint64_t one-time initialization function for leftTrigger()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputLeftTrigger.getter();
  static GCButtonElementName.leftTrigger = result;
  unk_254DBF0F0 = v1;
  return result;
}

uint64_t *GCButtonElementName.leftTrigger.unsafeMutableAddressor()
{
  if (one-time initialization token for leftTrigger != -1)
    swift_once();
  return &static GCButtonElementName.leftTrigger;
}

uint64_t static GCButtonElementName.leftTrigger.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for leftTrigger, &static GCButtonElementName.leftTrigger, &qword_254DBF0F0, a1);
}

uint64_t one-time initialization function for rightTrigger()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputRightTrigger.getter();
  static GCButtonElementName.rightTrigger = result;
  *(_QWORD *)algn_254DBF108 = v1;
  return result;
}

uint64_t *GCButtonElementName.rightTrigger.unsafeMutableAddressor()
{
  if (one-time initialization token for rightTrigger != -1)
    swift_once();
  return &static GCButtonElementName.rightTrigger;
}

uint64_t static GCButtonElementName.rightTrigger.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for rightTrigger, &static GCButtonElementName.rightTrigger, (uint64_t *)algn_254DBF108, a1);
}

uint64_t one-time initialization function for leftThumbstickButton()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputLeftThumbstickButton.getter();
  static GCButtonElementName.leftThumbstickButton = result;
  unk_254DBF120 = v1;
  return result;
}

uint64_t *GCButtonElementName.leftThumbstickButton.unsafeMutableAddressor()
{
  if (one-time initialization token for leftThumbstickButton != -1)
    swift_once();
  return &static GCButtonElementName.leftThumbstickButton;
}

uint64_t static GCButtonElementName.leftThumbstickButton.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for leftThumbstickButton, &static GCButtonElementName.leftThumbstickButton, &qword_254DBF120, a1);
}

uint64_t one-time initialization function for rightThumbstickButton()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputRightThumbstickButton.getter();
  static GCButtonElementName.rightThumbstickButton = result;
  *(_QWORD *)algn_254DBF138 = v1;
  return result;
}

uint64_t *GCButtonElementName.rightThumbstickButton.unsafeMutableAddressor()
{
  if (one-time initialization token for rightThumbstickButton != -1)
    swift_once();
  return &static GCButtonElementName.rightThumbstickButton;
}

uint64_t static GCButtonElementName.rightThumbstickButton.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for rightThumbstickButton, &static GCButtonElementName.rightThumbstickButton, (uint64_t *)algn_254DBF138, a1);
}

void static GCButtonElementName.backLeftButton(position:)(uint64_t *a1@<X8>)
{
  static GCButtonElementName.backLeftButton(position:)((uint64_t (*)(void))GCInputBackLeftButton, a1);
}

void static GCButtonElementName.backRightButton(position:)(uint64_t *a1@<X8>)
{
  static GCButtonElementName.backLeftButton(position:)((uint64_t (*)(void))GCInputBackRightButton, a1);
}

uint64_t one-time initialization function for home()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputButtonHome.getter();
  static GCButtonElementName.home = result;
  unk_254DBF150 = v1;
  return result;
}

uint64_t *GCButtonElementName.home.unsafeMutableAddressor()
{
  if (one-time initialization token for home != -1)
    swift_once();
  return &static GCButtonElementName.home;
}

uint64_t static GCButtonElementName.home.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for home, &static GCButtonElementName.home, &qword_254DBF150, a1);
}

uint64_t one-time initialization function for menu()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputButtonMenu.getter();
  static GCButtonElementName.menu = result;
  *(_QWORD *)algn_254DBF168 = v1;
  return result;
}

uint64_t *GCButtonElementName.menu.unsafeMutableAddressor()
{
  if (one-time initialization token for menu != -1)
    swift_once();
  return &static GCButtonElementName.menu;
}

uint64_t static GCButtonElementName.menu.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for menu, &static GCButtonElementName.menu, (uint64_t *)algn_254DBF168, a1);
}

uint64_t one-time initialization function for options()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputButtonOptions.getter();
  static GCButtonElementName.options = result;
  unk_254DBF180 = v1;
  return result;
}

uint64_t *GCButtonElementName.options.unsafeMutableAddressor()
{
  if (one-time initialization token for options != -1)
    swift_once();
  return &static GCButtonElementName.options;
}

uint64_t static GCButtonElementName.options.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for options, &static GCButtonElementName.options, &qword_254DBF180, a1);
}

uint64_t one-time initialization function for share()
{
  uint64_t result;
  uint64_t v1;

  result = GCInputButtonShare.getter();
  static GCButtonElementName.share = result;
  *(_QWORD *)algn_254DBF198 = v1;
  return result;
}

uint64_t *GCButtonElementName.share.unsafeMutableAddressor()
{
  if (one-time initialization token for share != -1)
    swift_once();
  return &static GCButtonElementName.share;
}

uint64_t static GCButtonElementName.share.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for share, &static GCButtonElementName.share, (uint64_t *)algn_254DBF198, a1);
}

uint64_t one-time initialization function for pedalAccelerator()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.pedalAccelerator = result;
  unk_254DBF1B0 = v1;
  return result;
}

uint64_t *GCButtonElementName.pedalAccelerator.unsafeMutableAddressor()
{
  if (one-time initialization token for pedalAccelerator != -1)
    swift_once();
  return &static GCButtonElementName.pedalAccelerator;
}

uint64_t static GCButtonElementName.pedalAccelerator.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for pedalAccelerator, &static GCButtonElementName.pedalAccelerator, &qword_254DBF1B0, a1);
}

uint64_t one-time initialization function for pedalBrake()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.pedalBrake = result;
  *(_QWORD *)algn_254DBF1C8 = v1;
  return result;
}

uint64_t *GCButtonElementName.pedalBrake.unsafeMutableAddressor()
{
  if (one-time initialization token for pedalBrake != -1)
    swift_once();
  return &static GCButtonElementName.pedalBrake;
}

uint64_t static GCButtonElementName.pedalBrake.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for pedalBrake, &static GCButtonElementName.pedalBrake, (uint64_t *)algn_254DBF1C8, a1);
}

uint64_t one-time initialization function for pedalClutch()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.pedalClutch = result;
  unk_254DBF1E0 = v1;
  return result;
}

uint64_t *GCButtonElementName.pedalClutch.unsafeMutableAddressor()
{
  if (one-time initialization token for pedalClutch != -1)
    swift_once();
  return &static GCButtonElementName.pedalClutch;
}

uint64_t static GCButtonElementName.pedalClutch.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for pedalClutch, &static GCButtonElementName.pedalClutch, &qword_254DBF1E0, a1);
}

uint64_t one-time initialization function for leftPaddle()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.leftPaddle = result;
  *(_QWORD *)algn_254DBF1F8 = v1;
  return result;
}

uint64_t *GCButtonElementName.leftPaddle.unsafeMutableAddressor()
{
  if (one-time initialization token for leftPaddle != -1)
    swift_once();
  return &static GCButtonElementName.leftPaddle;
}

uint64_t static GCButtonElementName.leftPaddle.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for leftPaddle, &static GCButtonElementName.leftPaddle, (uint64_t *)algn_254DBF1F8, a1);
}

uint64_t one-time initialization function for rightPaddle()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.rightPaddle = result;
  unk_254DBF210 = v1;
  return result;
}

uint64_t *GCButtonElementName.rightPaddle.unsafeMutableAddressor()
{
  if (one-time initialization token for rightPaddle != -1)
    swift_once();
  return &static GCButtonElementName.rightPaddle;
}

uint64_t static GCButtonElementName.rightPaddle.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.a.getter(&one-time initialization token for rightPaddle, &static GCButtonElementName.rightPaddle, &qword_254DBF210, a1);
}

uint64_t static GCButtonElementName.a.getter@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;

  if (*a1 != -1)
    swift_once();
  v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;
  return swift_bridgeObjectRetain();
}

void static GCButtonElementName.arcadeButton(row:column:)(NSInteger a1@<X0>, NSInteger a2@<X1>, uint64_t *a3@<X8>)
{
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = GCInputArcadeButtonName(a1, a2);
  if (v4)
  {
    v5 = v4;
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;

    *a3 = v6;
    a3[1] = v8;
  }
  else
  {
    __break(1u);
  }
}

uint64_t one-time initialization function for primaryMouseButton()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.primaryMouseButton = result;
  unk_254DBF450 = v1;
  return result;
}

uint64_t *GCButtonElementName.primaryMouseButton.unsafeMutableAddressor()
{
  if (one-time initialization token for primaryMouseButton != -1)
    swift_once();
  return &static GCButtonElementName.primaryMouseButton;
}

uint64_t static GCButtonElementName.primaryMouseButton.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.primaryMouseButton.getter(&one-time initialization token for primaryMouseButton, &static GCButtonElementName.primaryMouseButton, &qword_254DBF450, a1);
}

uint64_t one-time initialization function for secondaryMouseButton()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.secondaryMouseButton = result;
  unk_254DBF460 = v1;
  return result;
}

uint64_t *GCButtonElementName.secondaryMouseButton.unsafeMutableAddressor()
{
  if (one-time initialization token for secondaryMouseButton != -1)
    swift_once();
  return &static GCButtonElementName.secondaryMouseButton;
}

uint64_t static GCButtonElementName.secondaryMouseButton.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.primaryMouseButton.getter(&one-time initialization token for secondaryMouseButton, &static GCButtonElementName.secondaryMouseButton, &qword_254DBF460, a1);
}

uint64_t one-time initialization function for thirdMouseButton()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static GCButtonElementName.thirdMouseButton = result;
  unk_254DBF470 = v1;
  return result;
}

uint64_t *GCButtonElementName.thirdMouseButton.unsafeMutableAddressor()
{
  if (one-time initialization token for thirdMouseButton != -1)
    swift_once();
  return &static GCButtonElementName.thirdMouseButton;
}

uint64_t static GCButtonElementName.thirdMouseButton.getter@<X0>(_QWORD *a1@<X8>)
{
  return static GCButtonElementName.primaryMouseButton.getter(&one-time initialization token for thirdMouseButton, &static GCButtonElementName.thirdMouseButton, &qword_254DBF470, a1);
}

uint64_t static GCButtonElementName.primaryMouseButton.getter@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;

  if (*a1 != -1)
    swift_once();
  v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;
  return swift_bridgeObjectRetain();
}

void static GCButtonElementName.auxiliaryMouseButon(_:)(uint64_t *a1@<X8>)
{
  static GCButtonElementName.backLeftButton(position:)((uint64_t (*)(void))GCInputAuxiliaryMouseButtonName, a1);
}

void static GCButtonElementName.backLeftButton(position:)(uint64_t (*a1)(void)@<X1>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (id)a1();
  if (v3)
  {
    v4 = v3;
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;

    *a2 = v5;
    a2[1] = v7;
  }
  else
  {
    __break(1u);
  }
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance GCButtonElementName@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GCButtonElementName@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GCButtonElementName()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GCButtonElementName()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GCButtonElementName()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GCButtonElementName(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

unint64_t lazy protocol witness table accessor for type GCButtonElementName and conformance GCButtonElementName()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName;
  if (!lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCButtonElementName, &type metadata for GCButtonElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName;
  if (!lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCButtonElementName, &type metadata for GCButtonElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName;
  if (!lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName)
  {
    result = MEMORY[0x2199DEEA4](&protocol conformance descriptor for GCButtonElementName, &type metadata for GCButtonElementName);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCButtonElementName and conformance GCButtonElementName);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for GCButtonElementName(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = lazy protocol witness table accessor for type GCButtonElementName and conformance GCButtonElementName();
  result = lazy protocol witness table accessor for type GCButtonElementName and conformance GCButtonElementName();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for GCButtonElementName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GCButtonElementName()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for GCButtonElementName(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for GCButtonElementName(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCButtonElementName(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GCButtonElementName(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GCButtonElementName()
{
  return &type metadata for GCButtonElementName;
}

void VirtualControllerBundle_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "bundleURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_215181000, v3, v4, "Failed locate VirtualGameController bundle in '%{public}@'.", v5, v6, v7, v8, 2u);

}

void VirtualControllerBundle_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_215181000, v2, v3, "Failed to load bundle at path '%{public}@'.", v4, v5, v6, v7, 2u);

}

void VirtualControllerBundle_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_215181000, a2, OS_LOG_TYPE_FAULT, "Failed to load bundle: '%{public}@'.", (uint8_t *)&v2, 0xCu);
}

void loadNSDictionaryFromJSON_cold_1()
{
  __assert_rtn("loadNSDictionaryFromJSON", "GCUtility.m", 765, "[jsonObject isKindOfClass:NSDictionary.class]");
}

void HandleReport_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_215181000, v0, v1, "Bad report ID: 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void HandleReport_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_215181000, v0, v1, "Bad report ID: 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void HandleReport_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_215181000, v0, v1, "Bad report ID: 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void HandleReport_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_215181000, v0, v1, "Bad report ID: 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void HandleReport_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_2();
  v3 = 2048;
  v4 = v0;
  _os_log_debug_impl(&dword_215181000, v1, OS_LOG_TYPE_DEBUG, "Racing wheel input report: id=0x%x length=%zu", v2, 0x12u);
}

void ConnectToDriverService_cold_1(uint64_t a1)
{
  void *v2;
  void *v3;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "void ConnectToDriverService(Protocol *__strong, __strong id, __strong id, void (^__strong)(__strong id, NSError *__strong))");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("GCDriverConnection.m"), 63, CFSTR("Unknown service: %@"), a1);

  __break(1u);
}

void HapticSharedMemory::readCommand()
{
  __assert_rtn("readCommand", "HapticSharedMemory.h", 520, "srcCmd->head.mSize != 0");
}

void getGKDashboardLaunchContextGameController_cold_1()
{
  void *v0;
  void *v1;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "NSString *getGKDashboardLaunchContextGameController(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_GCDefaultLogicalDevice.m"), 54, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getGKDaemonProxyClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "Class getGKDaemonProxyClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_GCDefaultLogicalDevice.m"), 52, CFSTR("Unable to find class %s"), "GKDaemonProxy");

  __break(1u);
}

void GameCenterFoundationLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "void *GameCenterFoundationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_GCDefaultLogicalDevice.m"), 50, CFSTR("%s"), *a1);

  __break(1u);
}

void __getGKLocalPlayerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "Class getGKLocalPlayerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_GCDefaultLogicalDevice.m"), 51, CFSTR("Unable to find class %s"), "GKLocalPlayer");

  __break(1u);
}

void __getGKGameClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "Class getGKGameClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_GCDefaultLogicalDevice.m"), 53, CFSTR("Unable to find class %s"), "GKGame");

  __break(1u);
}

void __onqueue_3PSyntheticControllersScan_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_15(&dword_215181000, v0, v1, "#IOKit Failed to match 3rd party synthetic game controllers: %{mach.errno}d.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_13();
}

void __getRPScreenRecorderClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "void *ReplayKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("GCControllerManagerApp.m"), 39, CFSTR("%s"), *a1);

  __break(1u);
}

void __getRPScreenRecorderClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "Class getRPScreenRecorderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("GCControllerManagerApp.m"), 40, CFSTR("Unable to find class %s"), "RPScreenRecorder");

  __break(1u);
}

void DeviceMatched_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_18();
  OUTLINED_FUNCTION_0_20(&dword_215181000, v0, v1, "Ignoring matched device - invalid registry entry ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_19();
}

void DeviceMatched_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_18();
  OUTLINED_FUNCTION_0_20(&dword_215181000, v0, v1, "Ignoring matched device - unknown device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_19();
}

void DeviceMatched_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_18();
  OUTLINED_FUNCTION_0_20(&dword_215181000, v0, v1, "Ignoring matched device - failed to register removal notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_19();
}

void DeviceGeneralNotification_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_18();
  OUTLINED_FUNCTION_0_20(&dword_215181000, v0, v1, "Ignoring removed device - invalid registry entry ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_19();
}

void __getRPScreenRecorderClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "void *ReplayKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("GCAppClientProxy.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void __getRPScreenRecorderClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "Class getRPScreenRecorderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("GCAppClientProxy.m"), 28, CFSTR("Unable to find class %s"), "RPScreenRecorder");

  __break(1u);
}

void __getSSUIServiceClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "void *ScreenshotServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("GCAppClientProxy.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSSUIServiceClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithUTF8String:](&off_254DEDEA8, "stringWithUTF8String:", "Class getSSUIServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("GCAppClientProxy.m"), 21, CFSTR("Unable to find class %s"), "SSUIService");

  __break(1u);
}

void dqNormalize_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_26("dqNormalize", "GCDualQuaternion.m", a3, "mag > 0.000001f");
}

void dqDLB_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_26("dqNormalize", "GCDualQuaternion.m", a3, "mag > 0.000001f");
}

void dqGetMatrix_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_26("dqNormalize", "GCDualQuaternion.m", a3, "mag > 0.000001f");
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t static UISceneConnectionOptionDefinition.createAction(payload:responder:)()
{
  return MEMORY[0x24BEBC9A8]();
}

uint64_t static UISceneConnectionOptionDefinition.didFinishHandling(payload:for:)()
{
  return MEMORY[0x24BEBC9B0]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t static Comparable.> infix(_:_:)()
{
  return MEMORY[0x24BEE07F8]();
}

uint64_t static Comparable.>= infix(_:_:)()
{
  return MEMORY[0x24BEE0800]();
}

uint64_t static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x24BEE0808]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t Collection.underestimatedCount.getter()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t Collection.count.getter()
{
  return MEMORY[0x24BEE1978]();
}

uint64_t Collection.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x24BEE1988]();
}

uint64_t Collection.index(_:offsetBy:)()
{
  return MEMORY[0x24BEE1990]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t Collection.distance(from:to:)()
{
  return MEMORY[0x24BEE19C0]();
}

uint64_t Collection<>.indices.getter()
{
  return MEMORY[0x24BEE19F8]();
}

uint64_t Collection<>.subscript.getter()
{
  return MEMORY[0x24BEE1A18]();
}

uint64_t type metadata accessor for Range()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t UISceneConnectionOptions.subscript.getter()
{
  return MEMORY[0x24BEBCDD0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t _copyCollectionToContiguousArray<A>(_:)()
{
  return MEMORY[0x24BEE3D90]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BKSHIDEventGetPointerAttributes()
{
  return MEMORY[0x24BE0B550]();
}

uint64_t BTDeviceConnectServices()
{
  return MEMORY[0x24BE66E68]();
}

uint64_t BTDeviceGetDeviceClass()
{
  return MEMORY[0x24BE66EA8]();
}

uint64_t BTDeviceGetDeviceType()
{
  return MEMORY[0x24BE66EB8]();
}

uint64_t BTDiscoveryAgentCreate()
{
  return MEMORY[0x24BE66F68]();
}

uint64_t BTDiscoveryAgentDestroy()
{
  return MEMORY[0x24BE66F70]();
}

uint64_t BTDiscoveryAgentStartScan()
{
  return MEMORY[0x24BE66F80]();
}

uint64_t BTDiscoveryAgentStopScan()
{
  return MEMORY[0x24BE66F88]();
}

uint64_t BTPairingAgentAcceptSSP()
{
  return MEMORY[0x24BE67058]();
}

uint64_t BTPairingAgentCreate()
{
  return MEMORY[0x24BE67068]();
}

uint64_t BTPairingAgentDestroy()
{
  return MEMORY[0x24BE67078]();
}

uint64_t BTPairingAgentStart()
{
  return MEMORY[0x24BE67088]();
}

uint64_t BTPairingAgentStop()
{
  return MEMORY[0x24BE67090]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x24BE670B0]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x24BE670B8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x24BDBC3E0](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t GCGenericDeviceDriverConfigurationServiceClientInterface()
{
  return MEMORY[0x24BE3A670]();
}

uint64_t GCGenericDeviceDriverConfigurationServiceServerInterface()
{
  return MEMORY[0x24BE3A678]();
}

uint64_t GCLookupService()
{
  return MEMORY[0x24BE3A680]();
}

uint64_t GCLookupSetFallbackProvider()
{
  return MEMORY[0x24BE3A688]();
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x24BDD7EB8](object, options);
}

CFTypeRef IOCFUnserializeWithSize(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x24BDD7ED0](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

void IOHIDDeviceActivate(IOHIDDeviceRef device)
{
  MEMORY[0x24BDD8008](device);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x24BDD8018](device, *(_QWORD *)&options);
}

CFArrayRef IOHIDDeviceCopyMatchingElements(IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return (CFArrayRef)MEMORY[0x24BDD8028](device, matching, *(_QWORD *)&options);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x24BDD8038](allocator, *(_QWORD *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8040](device, key);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x24BDD8060](device, *(_QWORD *)&options);
}

void IOHIDDeviceRegisterInputReportWithTimeStampCallback(IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportWithTimeStampCallback callback, void *context)
{
  MEMORY[0x24BDD8070](device, report, reportLength, callback, context);
}

void IOHIDDeviceSetDispatchQueue(IOHIDDeviceRef device, dispatch_queue_t queue)
{
  MEMORY[0x24BDD8090](device, queue);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x24BDD80A8](device, *(_QWORD *)&reportType, reportID, report, reportLength);
}

CFIndex IOHIDElementGetLogicalMax(IOHIDElementRef element)
{
  return MEMORY[0x24BDD80D8](element);
}

CFIndex IOHIDElementGetLogicalMin(IOHIDElementRef element)
{
  return MEMORY[0x24BDD80E0](element);
}

CFIndex IOHIDElementGetPhysicalMax(IOHIDElementRef element)
{
  return MEMORY[0x24BDD80F0](element);
}

CFIndex IOHIDElementGetPhysicalMin(IOHIDElementRef element)
{
  return MEMORY[0x24BDD80F8](element);
}

uint32_t IOHIDElementGetReportCount(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8100](element);
}

uint32_t IOHIDElementGetReportSize(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8110](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8130](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8138](element);
}

uint64_t IOHIDEventCreate()
{
  return MEMORY[0x24BDD8158]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x24BDD8260]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x24BDD8268]();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x24BDD8270]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x24BDD8290]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x24BDD8298]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x24BDD82B8]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x24BDD82C0]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x24BDD82D0]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x24BDD8340]();
}

uint64_t IOHIDEventSystemClientActivate()
{
  return MEMORY[0x24BDD8350]();
}

uint64_t IOHIDEventSystemClientCancel()
{
  return MEMORY[0x24BDD8358]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x24BDD8360](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x24BDD8370]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingBlock()
{
  return MEMORY[0x24BDD8380]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x24BDD8398]();
}

uint64_t IOHIDEventSystemClientSetCancelHandler()
{
  return MEMORY[0x24BDD83C8]();
}

uint64_t IOHIDEventSystemClientSetDispatchQueue()
{
  return MEMORY[0x24BDD83D0]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x24BDD83E0]();
}

BOOLean_t IOHIDServiceClientConformsTo(IOHIDServiceClientRef service, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x24BDD8520](service, *(_QWORD *)&usagePage, *(_QWORD *)&usage);
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8530](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x24BDD8538](service);
}

uint64_t IOHIDServiceClientRegisterRemovalBlock()
{
  return MEMORY[0x24BDD8540]();
}

uint64_t IOHIDServiceClientSetElementValue()
{
  return MEMORY[0x24BDD8550]();
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x24BDD8558](service, key, property);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return (IOHIDElementRef)MEMORY[0x24BDD8638](value);
}

CFIndex IOHIDValueGetIntegerValue(IOHIDValueRef value)
{
  return MEMORY[0x24BDD8640](value);
}

double_t IOHIDValueGetScaledValue(IOHIDValueRef value, IOHIDValueScaleType type)
{
  double_t result;

  MEMORY[0x24BDD8650](value, *(_QWORD *)&type);
  return result;
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8660](*(_QWORD *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
  MEMORY[0x24BDD8670](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

uint64_t IOPSCreatePowerSource()
{
  return MEMORY[0x24BDD87F8]();
}

uint64_t IOPSReleasePowerSource()
{
  return MEMORY[0x24BDD8870]();
}

uint64_t IOPSSetPowerSourceDetails()
{
  return MEMORY[0x24BDD8880]();
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD8918](entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x24BDD1250](proto);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SBSSuspendFrontmostApplication()
{
  return MEMORY[0x24BEB0D50]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x24BDBCF60]();
}

uint64_t _CFNotificationCenterRegisterDependentNotificationList()
{
  return MEMORY[0x24BDBD010]();
}

uint64_t _GCFConvertStringToLocalizedString()
{
  return MEMORY[0x24BE3A6A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x24BEDB660](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24D2B22E0();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _objc_rootRelease()
{
  return MEMORY[0x24BEDCE20]();
}

uint64_t _objc_rootRetainCount()
{
  return MEMORY[0x24BEDCE28]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x24BDACB10](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

uint64_t analytics_send_event()
{
  return MEMORY[0x24BE1A1E8]();
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x24BE1A1F8]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x24BEDCE88](cls, extraBytes);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x24BDADDA0]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x24BDADE40]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x24BDADE48]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x24BDADE50]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x24BDADE70]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x24BDAE0D0]();
}

uint64_t dyld_get_base_platform()
{
  return MEMORY[0x24BDAE0D8]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x24BDAEB70](*(_QWORD *)&target_task, size, offset, *(_QWORD *)&permission, object_handle, *(_QWORD *)&parent_entry);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x24BDAF010](__rqtp, __rmtp);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_clear_deallocating()
{
  return MEMORY[0x24BEDCFF0]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

void objc_removeAssociatedObjects(id object)
{
  MEMORY[0x24BEDD290](object);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty(id self, SEL _cmd, ptrdiff_t offset, id newValue, BOOL atomic, char shouldCopy)
{
  MEMORY[0x24BEDD3C8](self, _cmd, offset, newValue, atomic, shouldCopy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

void *__cdecl object_getIndexedIvars(id a1)
{
  return (void *)MEMORY[0x24BEDD470](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAFDA0](a1, *(_QWORD *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x24BDAFDA8](a1);
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x24BDB03B0](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
  MEMORY[0x24BDB0460](*(_QWORD *)&a1, a2, a3);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x24BDB06D8](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x24BDB0828]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x24BDB0A10]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x24BDB0A18]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x24BDB0A20]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x24BDB0A30]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x24BDB0A38]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0B60](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x24BDB0B70](xshmem, region);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x24BDB0B78]();
}

