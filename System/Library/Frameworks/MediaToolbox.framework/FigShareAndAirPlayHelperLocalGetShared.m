@implementation FigShareAndAirPlayHelperLocalGetShared

void __FigShareAndAirPlayHelperLocalGetShared_block_invoke()
{
  const __CFAllocator *v0;
  _QWORD *DerivedStorage;
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  FigShareAndAirPlayHelperGetClassID();
  if (!CMDerivedObjectCreate())
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
    DerivedStorage[1] = dispatch_queue_create("FigShareAndAirPlayHelperLocal.queue", 0);
    *DerivedStorage = CFSetCreateMutable(v0, 0, 0);
    v4 = 0;
    v5 = &v4;
    v6 = 0x3052000000;
    v7 = __Block_byref_object_copy__4;
    v8 = __Block_byref_object_dispose__4;
    v2 = (void *)getTUCallCenterClass_softClass;
    v9 = getTUCallCenterClass_softClass;
    if (!getTUCallCenterClass_softClass)
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __getTUCallCenterClass_block_invoke;
      v3[3] = &unk_1E2F91F58;
      v3[4] = &v4;
      __getTUCallCenterClass_block_invoke((uint64_t)v3);
      v2 = (void *)v5[5];
    }
    _Block_object_dispose(&v4, 8);
    DerivedStorage[2] = objc_msgSend((id)objc_msgSend(v2, "sharedInstance"), "conversationManager");
    FigShareAndAirPlayHelperLocalGetShared_sSharedHelper = 0;
  }
}

@end
