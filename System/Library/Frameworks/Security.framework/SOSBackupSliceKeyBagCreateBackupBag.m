@implementation SOSBackupSliceKeyBagCreateBackupBag

void __SOSBackupSliceKeyBagCreateBackupBag_block_invoke(uint64_t a1, unint64_t a2, const UInt8 *a3)
{
  int v6;
  const __CFAllocator *v7;
  CFDataRef v8;
  const __CFDictionary *v9;
  uint64_t v10;
  void *v11;
  CFMutableDictionaryRef Mutable;
  const __CFSet *v13;
  uint64_t v14;
  CFDataRef v15;
  int v16;
  CFMutableDictionaryRef v17;
  const void *v18;
  CFTypeRef *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  NSObject *v26;
  CFDataRef v27;
  const void *v28;
  const __CFAllocator *v29;
  void *context[8];
  CFIndex length;
  CFIndex *p_length;
  uint64_t v33;
  char v34;
  unsigned int v35;
  uint8_t buf[8];
  uint64_t v37;
  void (*v38)(uint64_t, const __CFString *, const void *);
  void *v39;
  CFIndex *v40;
  CFDataRef v41;
  CFMutableDictionaryRef v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = CCRandomCopyBytes();
  if (SecError(v6, *(__CFString ***)(a1 + 32), CFSTR("SecRandom falied!")))
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    v10 = *(_QWORD *)(a1 + 40);
    v9 = *(const __CFDictionary **)(a1 + 48);
    v11 = *(void **)(a1 + 32);
    v29 = v7;
    Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    length = 0;
    p_length = &length;
    v33 = 0x2020000000;
    v34 = 1;
    v13 = *(const __CFSet **)(v10 + 24);
    v14 = MEMORY[0x1E0C809B0];
    context[0] = (void *)MEMORY[0x1E0C809B0];
    context[1] = (void *)3221225472;
    context[2] = __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke;
    context[3] = &unk_1E1FD1548;
    context[6] = Mutable;
    context[7] = v11;
    context[4] = &length;
    context[5] = v8;
    CFSetApplyFunction(v13, (CFSetApplierFunction)apply_block_1_5075, context);
    *(_QWORD *)buf = v14;
    v37 = 3221225472;
    v38 = __SOSBackupSliceKeyBagCopyWrappedKeys_block_invoke_54;
    v39 = &unk_1E1FD1570;
    v42 = Mutable;
    v43 = v11;
    v40 = &length;
    v41 = v8;
    CFDictionaryApplyFunction(v9, (CFDictionaryApplierFunction)apply_block_2_5101, buf);
    v15 = v8;
    v16 = *((unsigned __int8 *)p_length + 24);
    if (!*((_BYTE *)p_length + 24) && Mutable)
      CFRelease(Mutable);
    if (v16)
      v17 = Mutable;
    else
      v17 = 0;
    _Block_object_dispose(&length, 8);
    v18 = *(const void **)(v10 + 32);
    if (v18)
      CFRelease(v18);
    *(_QWORD *)(v10 + 32) = v17;
    v21 = a1 + 32;
    v19 = *(CFTypeRef **)(a1 + 32);
    v20 = *(_QWORD *)(v21 + 8);
    context[0] = 0;
    LODWORD(length) = 0;
    v35 = -1;
    SecRequirementError(a2 >> 31 == 0, v19, CFSTR("Invalid size: %zu"), a2);
    if (!(a2 >> 31)
      && (v22 = aks_create_bag((uint64_t)a3, a2, 4u, &v35),
          SecKernError(v22, v19, CFSTR("bag allocation failed: %d"), v22))
      && (v23 = aks_save_bag(v35), SecKernError(v23, v19, CFSTR("save bag failed: %d"), v23)))
    {
      v24 = aks_unload_bag(v35);
      if (v24)
      {
        v25 = v24;
        v26 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v25;
          _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "unload bag failed: %d", buf, 8u);
        }
      }
      v27 = CFDataCreate(v29, (const UInt8 *)context[0], (int)length);
      SecAllocationError((uint64_t)v27, v19, CFSTR("Bag CFData Allocation Failed"));
    }
    else
    {
      v27 = 0;
    }
    if (context[0])
      free(context[0]);
    v28 = *(const void **)(v20 + 16);
    if (v28)
      CFRelease(v28);
    *(_QWORD *)(v20 + 16) = v27;
    if (v15)
      CFRelease(v15);
  }
}

@end
