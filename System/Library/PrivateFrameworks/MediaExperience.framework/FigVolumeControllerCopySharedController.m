@implementation FigVolumeControllerCopySharedController

void __FigVolumeControllerCopySharedController_block_invoke()
{
  const __CFAllocator *v0;
  int v1;
  _QWORD *DerivedStorage;
  uint64_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  CFMutableDictionaryRef Mutable;
  int v7;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  if (dword_1EE2B3E88 >= 0x100)
    dword_1EE2B3E88 = 0;
  FigVolumeControllerGetClassID();
  v1 = CMDerivedObjectCreate();
  if (v1)
  {
    v7 = v1;
  }
  else
  {
    DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
    v3 = FigSimpleMutexCreate();
    DerivedStorage[1] = v3;
    if (v3
      && (v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
          v5 = dispatch_queue_create("com.apple.coremedia.volumeController.notificationqueue", v4),
          (*DerivedStorage = v5) != 0)
      && (Mutable = CFDictionaryCreateMutable(v0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]),
          (DerivedStorage[2] = Mutable) != 0))
    {
      v7 = 0;
      FigVolumeControllerCopySharedController_volumeController = 0;
    }
    else
    {
      v7 = -17591;
    }
  }
  FigVolumeControllerCopySharedController_err = v7;
}

@end
