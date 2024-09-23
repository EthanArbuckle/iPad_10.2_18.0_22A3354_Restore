@implementation AXUIElementPostNotification

void ___AXUIElementPostNotification_block_invoke_2()
{
  uint64_t v0;
  const __CFData *v1;
  size_t v2;
  const void *v3;
  UInt8 buffer[16];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
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
  uint64_t v36;
  CFRange v37;

  v0 = MEMORY[0x1E0C80A78]();
  v36 = *MEMORY[0x1E0C80C00];
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
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  *(_OWORD *)buffer = 0u;
  v5 = 0u;
  v1 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(v0 + 32) + 8) + 24);
  if (v1)
  {
    v37.length = *(unsigned int *)(v0 + 72);
    v37.location = 0;
    CFDataGetBytes(v1, v37, buffer);
  }
  _AXMIGPostNotification(*(unsigned int *)(*(_QWORD *)(v0 + 40) + 16), *(unsigned int *)(v0 + 76), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(unsigned int *)(v0 + 80), (uint64_t)buffer, *(unsigned int *)(v0 + 72), *(_QWORD *)(v0 + 64), *(_DWORD *)(v0 + 84), *(_QWORD *)(*(_QWORD *)(v0 + 40) + 24));
  v2 = *(unsigned int *)(v0 + 84);
  if ((_DWORD)v2)
    munmap(*(void **)(v0 + 64), v2);
  CFRelease(*(CFTypeRef *)(v0 + 40));
  v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(v0 + 32) + 8) + 24);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) + 8) + 24) = 0;
  }
}

void ___AXUIElementPostNotification_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("post-ax-notify", v2);
  v1 = (void *)_AXUIElementPostNotification_DifferentQueue;
  _AXUIElementPostNotification_DifferentQueue = (uint64_t)v0;

}

@end
