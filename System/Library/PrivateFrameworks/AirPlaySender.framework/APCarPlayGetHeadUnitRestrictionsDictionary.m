@implementation APCarPlayGetHeadUnitRestrictionsDictionary

void __APCarPlayGetHeadUnitRestrictionsDictionary_block_invoke(uint64_t a1, const void *a2, void *a3)
{
  CFTypeRef v6;

  if (a3)
  {
    if (gLogCategory_APCarPlayCarServicesInterface <= 90
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(a3, "debugDescription");
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -71148;
  }
  else if (IsAppleInternalBuild())
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = mach_absolute_time();
    if (gLogCategory_APCarPlayCarServicesInterface <= 50
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      UpTicksToMilliseconds();
      LogPrintF();
    }
  }
  if (a2)
    v6 = CFRetain(a2);
  else
    v6 = 0;
  **(_QWORD **)(a1 + 64) = v6;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

@end
