@implementation CMSessionMgrCopyDisplayIdentifierToSession

void __CMSessionMgrCopyDisplayIdentifierToSession_block_invoke(uint64_t a1)
{
  CFStringRef v2;
  __CFString *v3;
  __CFDictionary *Mutable;
  uint64_t v5;
  uint64_t v6;
  CFIndex i;
  const __CFNumber *ValueAtIndex;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CFStringRef Copy;
  id v13;
  NSObject *SerialQueue;
  NSObject *v15;
  uint64_t valuePtr;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20[2];
  id location;

  v2 = MX_RunningBoardServices_CopyDisplayIDForPID(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientPID"), "intValue"));
  if (v2)
  {
    v3 = (__CFString *)v2;
    objc_msgSend(*(id *)(a1 + 32), "setDisplayID:", v2);

    if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
      -[MXAdditiveRoutingManager sendActiveSessionsInfoToVA](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance"), "sendActiveSessionsInfoToVA");
    CMSMNotificationUtility_PostHighestArbitrationPriorityForTipiDidChangeIfNeeded();
  }
  if (objc_msgSend(*(id *)(a1 + 32), "displayID") && objc_msgSend(*(id *)(a1 + 32), "reporterIDs"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(Mutable, CFSTR("MXHostApplicationDisplayID"), (const void *)objc_msgSend(*(id *)(a1 + 32), "displayID"));
    v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "reporterIDs"), "count");
    if (v5 >= 1)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        valuePtr = 1;
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)objc_msgSend(*(id *)(a1 + 32), "reporterIDs"), i);
        CFNumberGetValue(ValueAtIndex, kCFNumberSInt64Type, &valuePtr);
        off_1EE2B3D70(valuePtr, Mutable);
      }
    }
    if (Mutable)
      CFRelease(Mutable);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = *(void **)(a1 + 32);
    v10 = objc_msgSend(v9, "displayID");
    v11 = MEMORY[0x1E0C809B0];
    if (v10)
    {
      Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)objc_msgSend(v9, "displayID"));
      v13 = v9;
      SerialQueue = MX_CoreServices_GetSerialQueue();
      valuePtr = v11;
      v17 = 3221225472;
      v18 = __cmsCopyInitialRouteSharingPolicyToSession_block_invoke;
      v19 = &unk_1E309DAB0;
      v20[0] = v9;
      v20[1] = (id)Copy;
      MXDispatchAsync((uint64_t)"cmsCopyInitialRouteSharingPolicyToSession", (uint64_t)"CMSessionManager.m", 6561, 0, 0, SerialQueue, (uint64_t)&valuePtr);
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    v15 = MX_CoreServices_GetSerialQueue();
    valuePtr = v11;
    v17 = 3221225472;
    v18 = __cmsCopyGameAudioPreferencesToSession_block_invoke;
    v19 = &unk_1E309EC60;
    objc_copyWeak(v20, &location);
    MXDispatchAsync((uint64_t)"cmsCopyGameAudioPreferencesToSession", (uint64_t)"CMSessionManager.m", 6605, 0, 0, v15, (uint64_t)&valuePtr);
    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }

}

@end
