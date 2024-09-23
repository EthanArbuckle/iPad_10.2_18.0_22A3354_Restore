@implementation AVExternalStorageDeviceDiscoverySession

+ (AVExternalStorageDeviceDiscoverySession)sharedSession
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (sharedSession_onceToken != -1)
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_0);
  if (dword_1EE53AAC8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (AVExternalStorageDeviceDiscoverySession *)sharedSession_sAVExternalStorageDeviceDiscoverySession;
}

AVExternalStorageDeviceDiscoverySession *__56__AVExternalStorageDeviceDiscoverySession_sharedSession__block_invoke()
{
  AVExternalStorageDeviceDiscoverySession *result;

  result = objc_alloc_init(AVExternalStorageDeviceDiscoverySession);
  sharedSession_sAVExternalStorageDeviceDiscoverySession = (uint64_t)result;
  return result;
}

+ (BOOL)isSupported
{
  if (isSupported_once != -1)
    dispatch_once(&isSupported_once, &__block_literal_global_57);
  return isSupported_sIsSupported;
}

uint64_t __54__AVExternalStorageDeviceDiscoverySession_isSupported__block_invoke()
{
  uint64_t result;

  result = FigExternalStorageDeviceManagerRemoteSupported();
  if ((_DWORD)result)
    result = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQN46I2BPHSDKPVN3YSGNPHPTAPE"));
  isSupported_sIsSupported = result;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (AVExternalStorageDeviceDiscoverySession)init
{
  AVExternalStorageDeviceDiscoverySession *v2;
  AVExternalStorageDeviceDiscoverySession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVExternalStorageDeviceDiscoverySession;
  v2 = -[AVExternalStorageDeviceDiscoverySession init](&v5, sel_init);
  v3 = v2;
  if (v2
    && -[AVExternalStorageDeviceDiscoverySession _setupExternalStorageDeviceDiscoverySession](v2, "_setupExternalStorageDeviceDiscoverySession"))
  {

    return 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  MEMORY[0x1A1AF1298](self->_lock, a2);
  -[AVExternalStorageDeviceDiscoverySession _tearDownExternalStorageDeviceDiscoverySessionToReconnectToServer:](self, "_tearDownExternalStorageDeviceDiscoverySessionToReconnectToServer:", 0);
  MEMORY[0x1A1AF12A4](self->_lock);
  FigSimpleMutexDestroy();
  self->_lock = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVExternalStorageDeviceDiscoverySession;
  -[AVExternalStorageDeviceDiscoverySession dealloc](&v3, sel_dealloc);
}

- (int)_checkAuthorizationStatus
{
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  void (*v3)(OpaqueFigExternalStorageDeviceManager *, _QWORD, int *);
  int v5;

  v5 = 0;
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (!externalStorageDeviceManager)
    return 0;
  v3 = *(void (**)(OpaqueFigExternalStorageDeviceManager *, _QWORD, int *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 16)
                                                                                     + 40);
  if (!v3)
    return 0;
  v3(externalStorageDeviceManager, 0, &v5);
  return v5;
}

- (void)_requestAuthorization:(id)a3
{
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  void (*v5)(OpaqueFigExternalStorageDeviceManager *, _QWORD, id);

  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager)
  {
    v5 = *(void (**)(OpaqueFigExternalStorageDeviceManager *, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 48);
    if (v5)
      v5(externalStorageDeviceManager, 0, a3);
  }
}

- (int)_setupExternalStorageDeviceDiscoverySession
{
  int result;
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;
  uint64_t (*v5)(OpaqueFigExternalStorageDeviceManager *, _QWORD, AVExternalStorageDeviceDiscoverySession *, uint64_t (*)(void *, uint64_t, uint64_t));

  if (!self->_externalStorageDevices)
    self->_externalStorageDevices = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!self->_uuidOfExternalStorageDevice)
    self->_uuidOfExternalStorageDevice = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!self->_lock)
    self->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  if (!+[AVExternalStorageDeviceDiscoverySession isSupported](AVExternalStorageDeviceDiscoverySession, "isSupported"))return FigSignalErrorAt();
  result = FigExternalStorageDeviceManagerRemoteCreate();
  if (result == -16155)
  {
    usleep(0x3D090u);
    result = FigExternalStorageDeviceManagerRemoteCreate();
  }
  if (!result)
  {
    externalStorageDeviceManager = self->_externalStorageDeviceManager;
    if (!externalStorageDeviceManager)
      return 0;
    v5 = *(uint64_t (**)(OpaqueFigExternalStorageDeviceManager *, _QWORD, AVExternalStorageDeviceDiscoverySession *, uint64_t (*)(void *, uint64_t, uint64_t)))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v5)
    {
      result = v5(externalStorageDeviceManager, 0, self, esdds_handleStorageDeviceManagerCallback);
      if (!result)
      {
        self->_weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", self);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", self->_weakReference, avExternalStorageDeviceNotification, *MEMORY[0x1E0D05310], self->_externalStorageDeviceManager, 0);
        return 0;
      }
    }
    else
    {
      return -12782;
    }
  }
  return result;
}

- (void)_tearDownExternalStorageDeviceDiscoverySessionToReconnectToServer:(BOOL)a3
{
  OpaqueFigExternalStorageDeviceManager *externalStorageDeviceManager;

  FigSimpleMutexCheckIsLockedOnThisThread();
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avExternalStorageDeviceNotification, *MEMORY[0x1E0D05310], self->_externalStorageDeviceManager);

  self->_weakReference = 0;
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager)
  {
    CFRelease(externalStorageDeviceManager);
    self->_externalStorageDeviceManager = 0;
  }
  if (!a3)
  {

    self->_externalStorageDevices = 0;
  }

  self->_uuidOfExternalStorageDevice = 0;
}

- (void)_reconnectToServer
{
  MEMORY[0x1A1AF1298](self->_lock, a2);
  -[AVExternalStorageDeviceDiscoverySession _tearDownExternalStorageDeviceDiscoverySessionToReconnectToServer:](self, "_tearDownExternalStorageDeviceDiscoverySessionToReconnectToServer:", 1);
  -[AVExternalStorageDeviceDiscoverySession _setupExternalStorageDeviceDiscoverySession](self, "_setupExternalStorageDeviceDiscoverySession");
  JUMPOUT(0x1A1AF12A4);
}

- (NSArray)externalStorageDevices
{
  return &self->_externalStorageDevices->super;
}

@end
