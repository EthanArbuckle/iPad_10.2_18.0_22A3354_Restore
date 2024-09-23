@implementation IODeregisterForRemoteSystemPower

void __IODeregisterForRemoteSystemPower_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  IONotificationPort *v4;
  io_object_t v5;
  io_connect_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  if (v3)
  {
    dispatch_release(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)v2)
  {
    _Block_release(*(const void **)v2);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(IONotificationPort **)(v2 + 16);
  if (v4)
  {
    IONotificationPortDestroy(v4);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(_DWORD *)(v2 + 8);
  if (v5)
  {
    IOObjectRelease(v5);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(_DWORD *)(v2 + 24);
  if (v6)
  {
    IOServiceClose(v6);
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v2 + 48) = 0;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)v2 = 0u;
  free(*(void **)(a1 + 32));
}

@end
