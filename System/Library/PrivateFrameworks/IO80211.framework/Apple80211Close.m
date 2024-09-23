@implementation Apple80211Close

void __Apple80211Close_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  IONotificationPort *v3;
  NSObject *v4;
  const void *v5;
  io_connect_t v6;
  io_object_t v7;
  io_object_t v8;
  NSObject *v9;
  NSObject *v10;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    pthread_mutex_destroy((pthread_mutex_t *)(v1 + 272));
    pthread_mutex_destroy((pthread_mutex_t *)(v1 + 160));
    pthread_mutex_destroy((pthread_mutex_t *)(v1 + 1592));
    v2 = *(NSObject **)(v1 + 1968);
    if (v2)
    {
      dispatch_source_cancel(v2);
      dispatch_release(*(dispatch_object_t *)(v1 + 1968));
      *(_QWORD *)(v1 + 1968) = 0;
    }
    v3 = *(IONotificationPort **)(v1 + 1960);
    if (v3)
    {
      IONotificationPortDestroy(v3);
      *(_QWORD *)(v1 + 1960) = 0;
    }
    v4 = *(NSObject **)(v1 + 1952);
    if (v4)
    {
      dispatch_release(v4);
      *(_QWORD *)(v1 + 1952) = 0;
    }
    v5 = *(const void **)(v1 + 112);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(v1 + 112) = 0;
    }
    pthread_mutex_destroy((pthread_mutex_t *)(v1 + 1664));
    pthread_mutex_destroy((pthread_mutex_t *)(v1 + 1736));
    *(_WORD *)(v1 + 1801) = 0;
    if ((*(_DWORD *)v1 & 0x80000000) == 0)
      close(*(_DWORD *)v1);
    v6 = *(_DWORD *)(v1 + 1804);
    if (v6)
    {
      IOServiceClose(v6);
      *(_DWORD *)(v1 + 1804) = 0;
    }
    v7 = *(_DWORD *)(v1 + 1976);
    if (v7)
      IOObjectRelease(v7);
    v8 = *(_DWORD *)(v1 + 1980);
    if (v8)
      IOObjectRelease(v8);
    v9 = *(NSObject **)(v1 + 2080);
    if (v9)
    {
      dispatch_release(v9);
      *(_QWORD *)(v1 + 2080) = 0;
    }
    v10 = *(NSObject **)(v1 + 2072);
    if (v10)
      dispatch_release(v10);
    *(_QWORD *)(v1 + 12) = 0;
    *(_QWORD *)(v1 + 4) = 0;
    free((void *)v1);
  }
}

@end
