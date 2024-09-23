@implementation AXPushNotificationToSystemForBroadcast

uint64_t __AXPushNotificationToSystemForBroadcast_block_invoke_2()
{
  uint64_t v0;
  const __CFData *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  NSObject *v6;
  const void *v7;
  size_t v8;
  UInt8 buffer[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
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
  uint64_t v42;
  CFRange v43;

  v0 = MEMORY[0x1E0C80A78]();
  v42 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)buffer = 0u;
  v11 = 0u;
  v1 = *(const __CFData **)(v0 + 32);
  if (v1)
  {
    v43.length = *(unsigned int *)(v0 + 64);
    v43.location = 0;
    CFDataGetBytes(v1, v43, buffer);
  }
  v2 = *(unsigned int *)(v0 + 68);
  v3 = getpid();
  v4 = _AXMIGBroadcastNotification(v2, v3, *(unsigned int *)(v0 + 72), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), (uint64_t)buffer, *(unsigned int *)(v0 + 64), *(_QWORD *)(v0 + 56), *(_DWORD *)(v0 + 76));
  if (v4)
  {
    v5 = v4;
    AXLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __AXPushNotificationToSystemForBroadcast_block_invoke_2_cold_1((int *)(v0 + 72), v5, v6);

  }
  v7 = *(const void **)(v0 + 32);
  if (v7)
    CFRelease(v7);
  v8 = *(unsigned int *)(v0 + 76);
  if ((_DWORD)v8)
    munmap(*(void **)(v0 + 56), v8);
  return _AXReleasePortFromCache(*(unsigned int *)(v0 + 68));
}

void __AXPushNotificationToSystemForBroadcast_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("broadcast-ax-notify", v2);
  v1 = (void *)AXPushNotificationToSystemForBroadcast_broadcast_queue;
  AXPushNotificationToSystemForBroadcast_broadcast_queue = (uint64_t)v0;

}

void __AXPushNotificationToSystemForBroadcast_block_invoke_2_cold_1(int *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1B54A6000, log, OS_LOG_TYPE_ERROR, "Unable to broadcast %d: err %d", (uint8_t *)v4, 0xEu);
}

@end
