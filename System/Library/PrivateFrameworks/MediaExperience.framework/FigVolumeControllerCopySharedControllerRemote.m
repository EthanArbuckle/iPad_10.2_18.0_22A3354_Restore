@implementation FigVolumeControllerCopySharedControllerRemote

uint64_t __FigVolumeControllerCopySharedControllerRemote_block_invoke()
{
  uint64_t result;
  _QWORD *DerivedStorage;

  FigVolumeControllerGetClassID();
  result = CMDerivedObjectCreate();
  if (!(_DWORD)result)
  {
    DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
    *DerivedStorage = FigSimpleMutexCreate();
    result = FigSimpleMutexCreate();
    DerivedStorage[1] = result;
  }
  return result;
}

@end
