@implementation FigBufferedAirPlayGlobalRoutingRegistryLocalGetShared

void __FigBufferedAirPlayGlobalRoutingRegistryLocalGetShared_block_invoke()
{
  _QWORD *DerivedStorage;
  dispatch_queue_t v1;

  FigBufferedAirPlayGlobalRoutingRegistryGetClassID();
  if (!CMDerivedObjectCreate())
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
    *DerivedStorage = FigBufferedAirPlayClientRoutingRegistryGetSharedInstance();
    v1 = dispatch_queue_create("com.apple.coremedia.globalroutingregistry.notification", 0);
    DerivedStorage[1] = v1;
    if (v1)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      FigBufferedAirPlayGlobalRoutingRegistryLocalGetShared_sGlobalRegistry = 0;
    }
  }
}

@end
