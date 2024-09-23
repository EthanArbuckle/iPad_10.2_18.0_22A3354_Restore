@implementation APBrowserRapportManagerInvalidate

void __APBrowserRapportManagerInvalidate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 51))
  {
    v3 = -72284;
  }
  else
  {
    APBrowserRapportManager_stop(*(_QWORD *)(a1 + 40));
    APBrowserRapportManager_dispatchEvent((_QWORD *)v2, 4, 0);
    *(_BYTE *)(v2 + 51) = 1;
    if (*(_QWORD *)(v2 + 40))
    {
      if (_APBrowserRapportManager_getActiveManagers_once != -1)
        dispatch_once(&_APBrowserRapportManager_getActiveManagers_once, &__block_literal_global_16);
      FigCFWeakReferenceTableRemoveValue();
      v3 = 0;
      *(_QWORD *)(v2 + 40) = 0;
    }
    else
    {
      v3 = 0;
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

@end
