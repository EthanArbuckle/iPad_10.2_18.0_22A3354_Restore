@implementation APAdvertiserRapportManagerInvalidate

void __APAdvertiserRapportManagerInvalidate_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v1 + 24) = 1;
  APAdvertiserRapportManager_stop(v1);
  if (*(_QWORD *)(v1 + 16))
  {
    if (_APAdvertiserRapportManager_getActiveManagers_once != -1)
      dispatch_once(&_APAdvertiserRapportManager_getActiveManagers_once, &__block_literal_global_9);
    FigCFWeakReferenceTableRemoveValue();
    *(_QWORD *)(v1 + 16) = 0;
  }
}

@end
