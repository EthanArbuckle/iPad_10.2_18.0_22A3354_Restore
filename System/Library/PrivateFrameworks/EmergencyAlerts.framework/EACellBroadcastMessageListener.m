@implementation EACellBroadcastMessageListener

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance___sharedInstance;
}

void __48__EACellBroadcastMessageListener_sharedInstance__block_invoke()
{
  EACellBroadcastMessageListener *v0;
  void *v1;

  v0 = objc_alloc_init(EACellBroadcastMessageListener);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (void)_cellBroadcastMessageReceived:(id)a3
{
  -[EAEmergencyAlertCenter handleRawCellBroadcastMessage:withCompletionHandler:](self->_emergencyAlertCenter, "handleRawCellBroadcastMessage:withCompletionHandler:", a3, 0);
}

- (EACellBroadcastMessageListener)init
{
  EACellBroadcastMessageListener *v3;
  EAEmergencyAlertCenter *v4;
  EAEmergencyAlertCenter *emergencyAlertCenter;
  objc_super v7;

  EARegisterUserNotificationsLogging();
  v7.receiver = self;
  v7.super_class = (Class)EACellBroadcastMessageListener;
  v3 = -[EACellBroadcastMessageListener init](&v7, sel_init);
  if (v3)
  {
    v4 = objc_alloc_init(EAEmergencyAlertCenter);
    emergencyAlertCenter = v3->_emergencyAlertCenter;
    v3->_emergencyAlertCenter = v4;

  }
  return v3;
}

- (void)start
{
  TUAddTelephonyCenterObserver();
}

- (void)dealloc
{
  objc_super v3;

  TURemoveTelephonyCenterObserver();
  v3.receiver = self;
  v3.super_class = (Class)EACellBroadcastMessageListener;
  -[EACellBroadcastMessageListener dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emergencyAlertCenter, 0);
}

@end
