@implementation IOHIDEventSystemConnectionCreateVirtualService

void ___IOHIDEventSystemConnectionCreateVirtualService_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[7];

  if (_IOHIDServiceInitVirtual(*(_QWORD *)(a1 + 32)))
  {
    _IOHIDEventSystemAddService(*(const void **)(*(_QWORD *)(a1 + 40) + 8), *(void **)(a1 + 32));
  }
  else
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    v3 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD *)(a1 + 40);
    v4 = *(NSObject **)(v2 + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = ___IOHIDEventSystemConnectionCreateVirtualService_block_invoke_2;
    block[3] = &__block_descriptor_tmp_97;
    v5 = *(_QWORD *)(a1 + 48);
    block[4] = v2;
    block[5] = v5;
    block[6] = v3;
    dispatch_async(v4, block);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void ___IOHIDEventSystemConnectionCreateVirtualService_block_invoke_2(uint64_t a1)
{
  _IOHIDEventSystemConnectionRemoveVirtualService(*(_QWORD *)(a1 + 32), *(const void **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

@end
