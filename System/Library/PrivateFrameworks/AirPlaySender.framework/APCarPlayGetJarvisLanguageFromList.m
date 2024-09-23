@implementation APCarPlayGetJarvisLanguageFromList

void __APCarPlayGetJarvisLanguageFromList_block_invoke(uint64_t a1, const void *a2, void *a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;

  if (objc_msgSend(a3, "code"))
  {
    if (gLogCategory_APCarPlaySiriInterface <= 90
      && (gLogCategory_APCarPlaySiriInterface != -1 || _LogCategory_Initialize()))
    {
      v8 = objc_msgSend(a3, "localizedDescription");
      LogPrintF();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a3, "code", v8);
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a3, "code", v7);
    }
  }
  else if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CFRetain(a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v6 = *(NSObject **)(a1 + 32);
  if (v6)
    dispatch_release(v6);
}

@end
