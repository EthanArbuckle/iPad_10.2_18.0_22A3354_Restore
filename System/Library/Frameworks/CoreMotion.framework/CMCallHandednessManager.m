@implementation CMCallHandednessManager

- (CMCallHandednessManager)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CMCallHandednessManager *v11;
  void *v13;
  const char *v14;
  objc_super v15;

  if ((objc_msgSend_isCallHandednessAvailable(CMCallHandednessManager, a2, v2, v3, v4) & 1) == 0)
  {
    v13 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMCallHandednessManager.mm"), 45, CFSTR("CMCallHandednessManager is not supported on this platform. Use isCallHandednessAvailable to avoid this error"));
  }
  v15.receiver = self;
  v15.super_class = (Class)CMCallHandednessManager;
  v11 = -[CMCallHandednessManager init](&v15, sel_init);
  if (v11)
    v11->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMCallHandednessPrivateQueue", 0);
  return v11;
}

- (void)startCallHandednessUpdates
{
  CFAbsoluteTime Current;
  NSObject *fPrivateQueue;
  _QWORD v5[6];

  Current = CFAbsoluteTimeGetCurrent();
  fPrivateQueue = self->fPrivateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F3C9140;
  v5[3] = &unk_1E2956590;
  v5[4] = self;
  *(CFAbsoluteTime *)&v5[5] = Current;
  dispatch_sync(fPrivateQueue, v5);
}

- (void)stopCallHandednessUpdates
{
  CFAbsoluteTime Current;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *fPrivateQueue;
  _QWORD v9[6];

  Current = CFAbsoluteTimeGetCurrent();
  if (objc_msgSend_isCallHandednessAvailable(CMCallHandednessManager, v4, v5, v6, v7))
  {
    fPrivateQueue = self->fPrivateQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_18F3C956C;
    v9[3] = &unk_1E2956590;
    v9[4] = self;
    *(CFAbsoluteTime *)&v9[5] = Current;
    dispatch_sync(fPrivateQueue, v9);
  }
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  Dispatcher *fDispatcher;
  uint64_t v8;
  Dispatcher *v9;
  objc_super v10;
  _QWORD v11[6];
  int v12;

  if (objc_msgSend_isCallHandednessAvailable(CMCallHandednessManager, a2, v2, v3, v4)
    && self->fDispatcher)
  {
    if (qword_1EE16E8B8 != -1)
      dispatch_once(&qword_1EE16E8B8, &unk_1E2953B48);
    v6 = qword_1EE16E8B0;
    fDispatcher = self->fDispatcher;
    v8 = sub_18F204AE4();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18F1F5EE0;
    v11[3] = &unk_1E2956E98;
    v12 = 0;
    v11[4] = v6;
    v11[5] = fDispatcher;
    sub_18F1F5E28(v8, (uint64_t)v11);
  }
  v9 = self->fDispatcher;
  if (v9)
    (*((void (**)(Dispatcher *))v9->var0 + 1))(v9);
  self->fDispatcher = 0;
  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  v10.receiver = self;
  v10.super_class = (Class)CMCallHandednessManager;
  -[CMCallHandednessManager dealloc](&v10, sel_dealloc);
}

+ (BOOL)isCallHandednessAvailable
{
  sub_18F1F77DC();
  return sub_18F20C9AC();
}

- (void)onCallHandednessStateUpdated:(const Sample *)a3
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
  v6[2] = sub_18F3C9A54;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(fPrivateQueue, v6);
}

- (CMCallHandednessDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CMCallHandednessDelegate *)a3;
}

@end
