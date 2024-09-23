@implementation IOHIDEventSystemConnectionRemoveNotification

void ___IOHIDEventSystemConnectionRemoveNotification_block_invoke(CFTypeRef *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)a1[4] + 67);
  CFDictionaryRemoveValue(*((CFMutableDictionaryRef *)a1[4] + 2), a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)a1[4] + 67);
  CFRelease(a1[4]);
  CFRelease(a1[5]);
  CFRelease(a1[6]);
}

@end
