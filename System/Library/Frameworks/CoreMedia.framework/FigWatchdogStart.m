@implementation FigWatchdogStart

BOOL __FigWatchdogStart_block_invoke(uint64_t a1, char **a2, _QWORD *a3)
{
  int v3;
  __CFString *v6;
  char *CStringPtrAndBufferToFree;
  void *v9;

  v3 = sVitalWorkSectionsInProgress;
  if (sVitalWorkSectionsInProgress)
  {
    v9 = 0;
    FigSimpleMutexLock((pthread_mutex_t *)sVitalWorkDescriptionMutex);
    v6 = FigCFCopyCompactDescription((const __CFSet *)sVitalWorkDescriptions);
    CStringPtrAndBufferToFree = FigCFStringGetCStringPtrAndBufferToFree(v6, 0x8000100u, (char **)&v9);
    asprintf(a2, "%d vital tasks are still running: %s", sVitalWorkSectionsInProgress, CStringPtrAndBufferToFree);
    FigSimpleMutexUnlock((pthread_mutex_t *)sVitalWorkDescriptionMutex);
    *a3 = -17932;
    if (v6)
      CFRelease(v6);
    free(v9);
  }
  return v3 == 0;
}

@end
