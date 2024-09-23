@implementation IOGCDeviceManagerHandleDevices

BOOL ____IOGCDeviceManagerHandleDevices_block_invoke(uint64_t a1, void *a2)
{
  const void *Value;
  uint64_t v5;
  const __CFDictionary *Mutable;
  uint64_t v7;
  const void *v8;
  _QWORD v10[6];

  Value = CFSetGetValue(*(CFSetRef *)(*(_QWORD *)(a1 + 32) + 32), a2);
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    goto LABEL_7;
  v5 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v5 + 56))
    goto LABEL_9;
  Mutable = *(const __CFDictionary **)(v5 + 72);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable(*(CFAllocatorRef *)(v5 + 8), 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    *(_QWORD *)(v5 + 72) = Mutable;
  }
  if (CFDictionaryContainsKey(Mutable, a2))
    goto LABEL_7;
  v7 = *(_QWORD *)(v5 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ____IOGCDeviceManagerStartObservingDevice_block_invoke;
  v10[3] = &__block_descriptor_48_e12_v20__0I8_v12l;
  v10[4] = v5;
  v10[5] = a2;
  v8 = (const void *)objc_msgSend(a2, "addInterestNotification:type:handler:", v7, "IOGeneralInterest", v10);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v5 + 72), a2, v8);
  if (v8)
  {
LABEL_7:
    if (!Value)
      return _IOGCDeviceGetPlugInInterface((uint64_t)a2) != 0;
  }
  else
  {
LABEL_9:
    if (Value)
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 48), Value);
  }
  return 0;
}

void ____IOGCDeviceManagerHandleDevices_block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ____IOGCDeviceManagerHandleDevices_block_invoke_3;
  v7[3] = &__block_descriptor_48_e12_v24__0_8_B16l;
  v8 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v7);
  v4 = *(void **)(a1 + 56);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = ____IOGCDeviceManagerHandleDevices_block_invoke_4;
  v5[3] = &__block_descriptor_48_e12_v24__0_8_B16l;
  v6 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  CFRelease(*(CFTypeRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t ____IOGCDeviceManagerHandleDevices_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), a2, 0);
}

uint64_t ____IOGCDeviceManagerHandleDevices_block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 40), a2, 1);
}

@end
