@implementation MFContentProtectionDumpDiagnosticState

uint64_t __MFContentProtectionDumpDiagnosticState_block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const char *v9;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t result;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  objc_class *v22;
  NSString *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if ((_contentProtectionState + 1) > 4)
    v3 = CFSTR("unknown");
  else
    v3 = off_1E81CB000[_contentProtectionState + 1];
  objc_msgSend(v2, "appendFormat:", CFSTR("Recorded state: %@\n"), v3);
  v4 = *(void **)(a1 + 32);
  v5 = (int)_KeyBagLockState() + 1;
  if (v5 > 4)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E81CB000[v5];
  objc_msgSend(v4, "appendFormat:", CFSTR("System state: %@\n"), v6);
  v7 = *(void **)(a1 + 32);
  v8 = MKBDeviceUnlockedSinceBoot();
  v9 = "YES";
  if (!v8)
    v9 = "NO";
  objc_msgSend(v7, "appendFormat:", CFSTR("Unlocked since boot: %s\n"), v9);
  v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v10, "setTimeStyle:", 1);
  objc_msgSend(v10, "setDateStyle:", 2);
  if (*(double *)&_lastNotificationTime == 0.0)
    v11 = CFSTR("never");
  else
    v11 = (const __CFString *)objc_msgSend(v10, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)&_lastNotificationTime));
  if (*(double *)&_beganObservingTime == 0.0)
    v12 = CFSTR("never");
  else
    v12 = (const __CFString *)objc_msgSend(v10, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)&_beganObservingTime));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Last lock_status notification: %@ (began observing %@)\n"), v11, v12);
  result = objc_msgSend((id)_observers, "count");
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Observers:\n"));
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = (void *)objc_msgSend((id)_observers, "allValues");
    result = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (result)
    {
      v15 = result;
      v16 = *(_QWORD *)v25;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
          v19 = objc_msgSend(v18, "observer");
          v20 = objc_msgSend(v18, "queue");
          v21 = *(void **)(a1 + 32);
          v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          objc_msgSend(v21, "appendFormat:", CFSTR("\t<%@:%p> (%s)\n"), v23, v19, dispatch_queue_get_label(v20));
          ++v17;
        }
        while (v15 != v17);
        result = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v15 = result;
      }
      while (result);
    }
  }
  return result;
}

@end
