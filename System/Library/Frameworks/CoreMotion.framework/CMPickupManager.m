@implementation CMPickupManager

- (CMPickupManager)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CMPickupManager *v11;
  void *v13;
  const char *v14;
  objc_super v15;

  if ((objc_msgSend_isPickupAvailable(CMPickupManager, a2, v2, v3, v4) & 1) == 0)
  {
    v13 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMPickupManager.mm"), 42, CFSTR("Pickup Detection is not supported on this platform. Use isPickupAvailable to avoid this error."));
  }
  v15.receiver = self;
  v15.super_class = (Class)CMPickupManager;
  v11 = -[CMPickupManager init](&v15, sel_init);
  if (v11)
    v11->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMPickupDetectorPrivateQueue", 0);
  return v11;
}

- (void)dealloc
{
  uint64_t v3;
  Dispatcher *fDispatcher;
  uint64_t v5;
  Dispatcher *v6;
  objc_super v7;
  _QWORD v8[6];
  int v9;

  if (self->fDispatcher)
  {
    if (qword_1EE16E958 != -1)
      dispatch_once(&qword_1EE16E958, &unk_1E29532C8);
    v3 = qword_1EE16E950;
    fDispatcher = self->fDispatcher;
    v5 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F1F5EE0;
    v8[3] = &unk_1E2956E98;
    v9 = 0;
    v8[4] = v3;
    v8[5] = fDispatcher;
    sub_18F1F5E28(v5, (uint64_t)v8);
    v6 = self->fDispatcher;
    if (v6)
      (*((void (**)(Dispatcher *))v6->var0 + 1))(v6);
  }
  self->fDispatcher = 0;
  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  v7.receiver = self;
  v7.super_class = (Class)CMPickupManager;
  -[CMPickupManager dealloc](&v7, sel_dealloc);
}

- (void)startPickupUpdates
{
  NSObject *fPrivateQueue;
  _QWORD block[5];

  fPrivateQueue = self->fPrivateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F468064;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fPrivateQueue, block);
}

- (void)stopPickupUpdates
{
  NSObject *fPrivateQueue;
  _QWORD block[5];

  fPrivateQueue = self->fPrivateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F46843C;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fPrivateQueue, block);
}

+ (BOOL)isPickupAvailable
{
  return ((unint64_t)sub_18F1F7BFC() >> 33) & 1;
}

- (void)onPickupStateUpdated:(const Sample *)a3
{
  int timestamp_low;
  uint64_t v4;
  NSObject *fPrivateQueue;
  _QWORD v6[6];

  timestamp_low = LOBYTE(a3->timestamp);
  v4 = timestamp_low == 1;
  if (timestamp_low == 2)
    v4 = 2;
  fPrivateQueue = self->fPrivateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F46880C;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(fPrivateQueue, v6);
}

- (CMPickupDelegate)delegate
{
  return (CMPickupDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
