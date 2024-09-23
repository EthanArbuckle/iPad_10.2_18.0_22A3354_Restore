@implementation SOSViewsGetBitmasks

void __SOSViewsGetBitmasks_block_invoke()
{
  const __CFSet *v0;
  const __CFAllocator *v1;
  const __CFArray *Mutable;
  uint64_t v3;
  uint64_t Count;
  NSObject *v5;
  _QWORD *v6;
  _QWORD v7[5];
  _QWORD context[5];
  uint8_t buf[8];
  uint8_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  CFRange v14;
  CFRange v15;

  v13 = *MEMORY[0x1E0C80C00];
  if (SOSViewsGetAllCurrent_dot != -1)
    dispatch_once(&SOSViewsGetAllCurrent_dot, &__block_literal_global_90_6235);
  v0 = (const __CFSet *)sosAllViews;
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v3 = MEMORY[0x1E0C809B0];
  context[0] = MEMORY[0x1E0C809B0];
  context[1] = 3221225472;
  context[2] = __SOSViewsGetBitmasks_block_invoke_2;
  context[3] = &__block_descriptor_40_e10_v16__0r_v8l;
  context[4] = Mutable;
  CFSetApplyFunction(v0, (CFSetApplierFunction)apply_block_1_6233, context);
  Count = CFArrayGetCount(Mutable);
  if (Count < 33)
  {
    *(_QWORD *)buf = 0;
    v10 = buf;
    v11 = 0x2020000000;
    v12 = 1;
    v14.location = 0;
    v14.length = Count;
    CFArraySortValues(Mutable, v14, (CFComparatorFunction)MEMORY[0x1E0C98F10], 0);
    SOSViewsGetBitmasks_masks = (uint64_t)CFDictionaryCreateMutable(v1, 0, MEMORY[0x1E0C9AEB8], 0);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __SOSViewsGetBitmasks_block_invoke_108;
    v7[3] = &unk_1E1FD26D0;
    v7[4] = buf;
    v6 = v7;
    v15.length = CFArrayGetCount(Mutable);
    v15.location = 0;
    CFArrayApplyFunction(Mutable, v15, (CFArrayApplierFunction)apply_block_1_6233, v6);

    _Block_object_dispose(buf, 8);
    if (!Mutable)
      return;
    goto LABEL_9;
  }
  secLogObjForScope("views");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = Count;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "Too many views defined, can't make bitmask (%d)", buf, 8u);
  }

  if (Mutable)
LABEL_9:
    CFRelease(Mutable);
}

void __SOSViewsGetBitmasks_block_invoke_2(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), a2);
}

void __SOSViewsGetBitmasks_block_invoke_108(uint64_t a1, const void *a2)
{
  CFDictionaryAddValue((CFMutableDictionaryRef)SOSViewsGetBitmasks_masks, a2, (const void *)*(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) *= 2;
}

@end
