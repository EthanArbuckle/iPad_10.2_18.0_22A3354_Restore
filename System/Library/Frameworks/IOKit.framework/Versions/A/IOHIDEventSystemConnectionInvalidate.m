@implementation IOHIDEventSystemConnectionInvalidate

void ___IOHIDEventSystemConnectionInvalidate_block_invoke_2(uint64_t a1)
{
  CFSetRef v2;

  os_unfair_recursive_lock_lock_with_options();
  v2 = _IOHIDEventSystemConnectionCopyServices(*(CFSetRef **)(a1 + 32));
  CFSetRemoveAllValues(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 32) + 80));
  os_unfair_recursive_lock_unlock();
  CFRelease(v2);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___IOHIDEventSystemConnectionInvalidate_block_invoke(uint64_t a1)
{
  CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 32), (CFDictionaryApplierFunction)__VirtualServicesApplier, *(void **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
