@implementation SetEventsInternal

void __fpic_SetEventsInternal_block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t DerivedStorage;
  uint64_t Count;
  const __CFAllocator *v7;
  CFMutableArrayRef Mutable;
  const __CFDictionary *v9;
  uint64_t v10;
  const void *ValueAtIndex;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  CFMutableArrayRef v15;
  CFMutableArrayRef v16;
  CFMutableArrayRef v17;
  __CFArray *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v20;
  CFIndex v21;
  const __CFDictionary *v22;
  __CFString *v23;
  uint64_t v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  const void *v30;
  uint64_t v31;
  const __CFArray *v32;
  const void *v33;
  uint64_t v34;
  const __CFArray *v35;
  const __CFArray *v36;
  CFIndex v37;
  CFIndex v38;
  CFIndex v39;
  __CFString *v40;
  const __CFArray *v41;
  int v42;
  uint64_t v44;
  const __CFAllocator *allocator;
  __CFDictionary *theDict;
  __CFArray *theArray;
  CFRange v48;

  v2 = *(const __CFArray **)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 104);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (v2)
    Count = CFArrayGetCount(v2);
  else
    Count = 0;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (!Mutable)
  {
    v20 = FigSignalErrorAt();
    v9 = 0;
    goto LABEL_18;
  }
  v9 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!v9)
  {
    v20 = FigSignalErrorAt();
    CFRelease(Mutable);
    Mutable = 0;
    goto LABEL_18;
  }
  v48.location = 0;
  v48.length = Count;
  CFArrayAppendArray(Mutable, v2, v48);
  if (Count < 1)
  {
    v20 = 0;
    goto LABEL_18;
  }
  allocator = v7;
  theArray = Mutable;
  v10 = Count + 1;
  theDict = v9;
  v44 = v3;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v2, v10 - 2);
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, const void *))(DerivedStorage + 80))(v3, v4, ValueAtIndex);
    v13 = (__CFString *)FigPlayerInterstitialEventCopyPrimaryItem(v12);
    if (!v13)
    {
      v20 = FigSignalErrorAt();
      goto LABEL_63;
    }
    v14 = v13;
    if (!fpic_doesPlayerItemWrapperBelongToCurrentlyEngagedPrimaryItem(v3, v13, v4))
      break;
LABEL_15:
    CFRelease(v14);
    if ((unint64_t)--v10 <= 1)
    {
      v20 = 0;
      Mutable = theArray;
      goto LABEL_18;
    }
  }
  if (CFDictionaryContainsKey(v9, v14))
  {
LABEL_13:
    Value = (__CFArray *)CFDictionaryGetValue(v9, v14);
    CFArrayInsertValueAtIndex(Value, 0, ValueAtIndex);
    CFArrayRemoveValueAtIndex(theArray, v10 - 2);
    if (dword_1EE2A33C8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v9 = theDict;
    }
    goto LABEL_15;
  }
  v15 = CFArrayCreateMutable(allocator, 0, MEMORY[0x1E0C9B378]);
  if (v15)
  {
    v16 = v15;
    CFDictionaryAddValue(theDict, v14, v15);
    v17 = v16;
    v9 = theDict;
    v3 = v44;
    CFRelease(v17);
    goto LABEL_13;
  }
  v20 = FigSignalErrorAt();
  CFRelease(v14);
  v9 = theDict;
LABEL_63:
  CFRelease(theArray);
  CFRelease(v9);
  Mutable = 0;
  v9 = 0;
LABEL_18:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v20;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    if (Mutable)
      v21 = CFArrayGetCount(Mutable);
    else
      v21 = 0;
    v22 = v9;
    if (!FigCFEqual() && v21 < 1)
    {
      v23 = 0;
      goto LABEL_42;
    }
    if (v21 < 1)
    {
      v23 = 0;
    }
    else
    {
      v24 = *(_QWORD *)(a1 + 96);
      v25 = CFArrayGetValueAtIndex(Mutable, 0);
      v26 = fpic_UnwrapEvent(v24, (uint64_t)v25);
      v23 = (__CFString *)FigPlayerInterstitialEventCopyPrimaryItem(v26);
    }
    if (*(_BYTE *)(a1 + 120))
    {
      v27 = *(_QWORD *)(a1 + 112);
      if (v21)
        v28 = 1;
      else
        v28 = *(_QWORD *)(v27 + 192) == 0;
      *(_BYTE *)(v27 + 972) = v28;
    }
    else
    {
      v29 = *(_QWORD *)(a1 + 112);
      v30 = *(const void **)(v29 + 192);
      *(_QWORD *)(v29 + 192) = Mutable;
      if (Mutable)
        CFRetain(Mutable);
      if (v30)
        CFRelease(v30);
    }
    v31 = *(_QWORD *)(a1 + 112);
    v32 = Mutable;
    v9 = v22;
    if (*(_BYTE *)(a1 + 120))
    {
      if (!*(_BYTE *)(v31 + 972))
        v32 = *(const __CFArray **)(v31 + 192);
      goto LABEL_41;
    }
    if (!*(_BYTE *)(v31 + 972))
    {
LABEL_41:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = fpic_setEventsInAddOrderForPlayerItem(*(const void **)(a1 + 96), v23, v32, *(_QWORD *)(a1 + 104), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 24), *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 64)+ 8)+ 24), (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)+ 24), *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32);
      if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
LABEL_42:
        v33 = *(const void **)(a1 + 96);
        v34 = *(_QWORD *)(a1 + 104);
        v35 = (const __CFArray *)FigCFDictionaryCopyArrayOfKeys();
        if (v35)
        {
          v36 = v35;
          v37 = CFArrayGetCount(v35);
          v38 = v37 - 1;
          if (v37 < 1)
          {
            v42 = 0;
          }
          else
          {
            v39 = 0;
            do
            {
              v40 = (__CFString *)CFArrayGetValueAtIndex(v36, v39);
              v41 = (const __CFArray *)CFDictionaryGetValue(v22, v40);
              v42 = fpic_setEventsInAddOrderForPlayerItem(v33, v40, v41, v34, 0, 0, 0, 0, 0, 0);
              if (v42)
                break;
            }
            while (v38 != v39++);
          }
          CFRelease(v36);
        }
        else
        {
          v42 = 0;
        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v42;
        if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
          fpic_ReplaceNetworkURLsWithOfflineURLs(*(const void **)(a1 + 96), *(_QWORD *)(a1 + 104));
        v9 = v22;
      }
    }
    if (v23)
      CFRelease(v23);
  }
  if (Mutable)
    CFRelease(Mutable);
  if (v9)
    CFRelease(v9);
}

@end
