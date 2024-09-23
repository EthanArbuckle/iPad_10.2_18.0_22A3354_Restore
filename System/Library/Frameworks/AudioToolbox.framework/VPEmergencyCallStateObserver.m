@implementation VPEmergencyCallStateObserver

- (VPEmergencyCallStateObserver)initWithEmergencyCallStateHandler:(id)a3
{
  id v4;
  VPEmergencyCallStateObserver *v5;
  void *v6;
  void *v7;
  id handler;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  uint64_t v11;
  TUCallCenter *underlyingCallCenter;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VPEmergencyCallStateObserver;
  v5 = -[VPEmergencyCallStateObserver init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_handleCallStatusChanged_, *MEMORY[0x1E0DBD4E0], 0);
    v7 = _Block_copy(v4);
    handler = v5->_handler;
    v5->_handler = v7;

    v9 = dispatch_queue_create("com.apple.coreaudio.vpem", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0DBD1C8], "callCenterWithQueue:", v5->_serialQueue);
    v11 = objc_claimAutoreleasedReturnValue();
    underlyingCallCenter = v5->_underlyingCallCenter;
    v5->_underlyingCallCenter = (TUCallCenter *)v11;

    -[VPEmergencyCallStateObserver notifyInitialEmergencyCallStatus](v5, "notifyInitialEmergencyCallStatus");
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VPEmergencyCallStateObserver;
  -[VPEmergencyCallStateObserver dealloc](&v4, sel_dealloc);
}

- (void)notifyInitialEmergencyCallStatus
{
  void *v3;
  void **v4;
  void *v5;
  NSObject *v6;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__VPEmergencyCallStateObserver_notifyInitialEmergencyCallStatus__block_invoke;
  aBlock[3] = &unk_1E69CC490;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  if (VPLogScope(void)::once != -1)
    dispatch_once(&VPLogScope(void)::once, &__block_literal_global_19930);
  v4 = (void **)VPLogScope(void)::scope;
  if (VPLogScope(void)::scope && CALegacyLog::LogEnabled(3, VPLogScope(void)::scope, 0))
  {
    v5 = *v4;
    if (!*v4)
      v5 = (void *)MEMORY[0x1E0C81028];
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "vpEmergencyCallStatusHandler.mm";
      v10 = 1024;
      v11 = 63;
      _os_log_impl(&dword_1B5ED0000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Notifying initial emergency call status!", buf, 0x12u);
    }

  }
  dispatch_async((dispatch_queue_t)self->_serialQueue, v3);

}

- (void)handleCallStatusChanged:(id)a3
{
  void (**handler)(id, uint64_t);
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  handler = (void (**)(id, uint64_t))self->_handler;
  if (handler)
    handler[2](handler, objc_msgSend(v5, "isEmergency"));

}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (TUCallCenter)underlyingCallCenter
{
  return self->_underlyingCallCenter;
}

- (void)setUnderlyingCallCenter:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingCallCenter, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_underlyingCallCenter, 0);
  objc_storeStrong(&self->_handler, 0);
}

void __64__VPEmergencyCallStateObserver_notifyInitialEmergencyCallStatus__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "currentAudioAndVideoCalls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__VPEmergencyCallStateObserver_notifyInitialEmergencyCallStatus__block_invoke_2;
  v3[3] = &unk_1E69CC468;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __64__VPEmergencyCallStateObserver_notifyInitialEmergencyCallStatus__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(v4, "isEmergency"));

}

@end
