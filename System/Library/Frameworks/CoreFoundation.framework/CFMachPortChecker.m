@implementation CFMachPortChecker

void ____CFMachPortChecker_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CFRunLoopSource *v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  void (*v6)(uint64_t);
  BOOL v7;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 96));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(__CFRunLoopSource **)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 32);
  v5 = *(_QWORD *)(v2 + 64);
  v6 = *(void (**)(uint64_t))(v2 + 112);
  *(_QWORD *)(v2 + 64) = 0;
  if (v4)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 96));
    v4(v2, v5);
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 96));
  }
  if (v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 96));
    CFRunLoopSourceInvalidate(v3);
    CFRelease(v3);
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 96));
  }
  if (v6)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 96));
    v6(v5);
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 96));
  }
  *(_DWORD *)(v2 + 16) = 2;
  __dmb(0xBu);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 96));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
