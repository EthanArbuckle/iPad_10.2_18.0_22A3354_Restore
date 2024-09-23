@implementation _IDSContinuity

- (_IDSContinuity)initWithDelegate:(id)a3 queue:(id)a4 delegateContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  _IDSContinuity *v15;
  _IDSContinuity *v16;
  void *v17;
  uint64_t v18;
  id delegateContext;
  uint64_t v20;
  CUTWeakReference *delegate;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907FBEBC();

  }
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging continuity](IDSLogging, "continuity");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907E8578((uint64_t)self, v14);

    v15 = 0;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)_IDSContinuity;
    v16 = -[_IDSContinuity init](&v26, sel_init);
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:selector:name:object:", v16, sel__daemonDied_, CFSTR("__k_IDSDaemonDidConnectNotification"), 0);

      objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v10);
      v18 = objc_claimAutoreleasedReturnValue();
      delegateContext = v16->_delegateContext;
      v16->_delegateContext = (id)v18;

      objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v8);
      v20 = objc_claimAutoreleasedReturnValue();
      delegate = v16->_delegate;
      v16->_delegate = (CUTWeakReference *)v20;

      objc_storeStrong((id *)&v16->_queue, a4);
      v16->_state = 0;
      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "listener");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addHandler:", v16);

      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "continuityClientInstanceCreated");

    }
    self = v16;
    v15 = self;
  }

  return v15;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0, 0);

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeHandler:", self);

  v6.receiver = self;
  v6.super_class = (Class)_IDSContinuity;
  -[_IDSContinuity dealloc](&v6, sel_dealloc);
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "assertQueueIsCurrent");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907FBF48();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "continuityStartAdvertisingOfType:withData:withOptions:", a3, v8, v7);

}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assertQueueIsCurrent");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907FBFD4();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "continuityStopAdvertisingOfType:", a3);

}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assertQueueIsCurrent");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907FC060();

  }
  objc_msgSend(v9, "__imArrayByApplyingBlock:", &unk_1E2C5FDF0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "continuityStartScanningForType:withData:mask:peers:", a3, v11, v10, v15);

}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "assertQueueIsCurrent");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907FC0EC();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "continuityStartScanningForType:withData:mask:", a3, v8, v7);

}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;

  v8 = a8;
  v9 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "assertQueueIsCurrent");

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1907FC178();

  }
  objc_msgSend(v13, "__imArrayByApplyingBlock:", &unk_1E2C5FDF0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "continuityStartScanningForType:withData:mask:peers:boostedScan:duplicates:", a3, v15, v14, v19, v9, v8);

}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 boostedScan:(BOOL)a6 duplicates:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;

  v7 = a7;
  v8 = a6;
  v11 = a5;
  v12 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "assertQueueIsCurrent");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1907FC204();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "continuityStartScanningForType:withData:mask:boostedScan:duplicates:", a3, v12, v11, v8, v7);

}

- (void)stopScanningForType:(int64_t)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assertQueueIsCurrent");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907FC290();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "continuityStopScanningForType:", a3);

}

- (void)startTrackingPeer:(id)a3 forType:(int64_t)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v5 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907FC31C();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "continuityStartTrackingPeer:forType:", v10, a4);
}

- (void)stopTrackingPeer:(id)a3 forType:(int64_t)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v5 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907FC3A8();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "continuityStopTrackingPeer:forType:", v10, a4);
}

- (void)_handleReconnect
{
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FC434();

  }
  v6 = MEMORY[0x1E0C809B0];
  self->_state = 1;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = sub_1907D75B0;
  v8[3] = &unk_1E2C65050;
  v8[4] = self;
  -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v8);
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "continuityClientInstanceCreated");

}

- (void)_daemonDied:(id)a3
{
  void *v4;
  _QWORD v5[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1907D7678;
  v5[3] = &unk_1E2C60550;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

- (void)_callDelegateWithBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *queue;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "assertQueueIsCurrent");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907FC4C0();

    }
    -[CUTWeakReference object](self->_delegate, "object");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    queue = self->_queue;
    if (queue && v8)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = sub_1907D7788;
      v11[3] = &unk_1E2C60E00;
      v13 = v4;
      v12 = v9;
      dispatch_async(queue, v11);

    }
  }

}

- (void)continuityDidUpdateStateToState:(int64_t)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_state != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_state = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = sub_1907D77F8;
    v4[3] = &unk_1E2C65050;
    v4[4] = self;
    -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v4);
  }
}

- (void)continuityDidStartAdvertisingOfType:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1907D789C;
  v3[3] = &unk_1E2C65078;
  v3[4] = self;
  v3[5] = a3;
  -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v3);
}

- (void)continuityDidStopAdvertisingOfType:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1907D7954;
  v3[3] = &unk_1E2C65078;
  v3[4] = self;
  v3[5] = a3;
  -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v3);
}

- (void)continuityDidStopAdvertisingOfType:(int64_t)a3 withError:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907D7A3C;
  v8[3] = &unk_1E2C650A0;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v8);

}

- (void)continuityDidFailToStartAdvertisingOfType:(int64_t)a3 withError:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907D7B24;
  v8[3] = &unk_1E2C650A0;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v8);

}

- (void)continuityDidStartScanningForType:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1907D7BFC;
  v3[3] = &unk_1E2C65078;
  v3[4] = self;
  v3[5] = a3;
  -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v3);
}

- (void)continuityDidStopScanningForType:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1907D7CB4;
  v3[3] = &unk_1E2C65078;
  v3[4] = self;
  v3[5] = a3;
  -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v3);
}

- (void)continuityDidFailToStartScanningForType:(int64_t)a3 withError:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907D7D9C;
  v8[3] = &unk_1E2C650A0;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v8);

}

- (void)continuityDidDiscoverType:(int64_t)a3 withData:(id)a4 fromPeer:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _IDSContinuity *v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1907D7ED0;
  v12[3] = &unk_1E2C650C8;
  v13 = v9;
  v14 = self;
  v15 = v8;
  v16 = a3;
  v10 = v8;
  v11 = v9;
  -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v12);

}

- (void)continuityDidLosePeer:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_continuityDidLosePeer_forType_);
}

- (void)continuityDidLosePeer:(id)a3 forType:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _IDSContinuity *v10;
  int64_t v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907D7FE8;
  v8[3] = &unk_1E2C650A0;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v8);

}

- (void)continuityDidStartTrackingPeer:(id)a3 error:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_continuityDidStartTrackingPeer_forType_error_);
}

- (void)continuityDidStartTrackingPeer:(id)a3 forType:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _IDSContinuity *v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1907D812C;
  v12[3] = &unk_1E2C650C8;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v16 = a4;
  v10 = v9;
  v11 = v8;
  -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v12);

}

- (void)continuityDidStopTrackingPeer:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_continuityDidStopTrackingPeer_forType_);
}

- (void)continuityDidStopTrackingPeer:(id)a3 forType:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _IDSContinuity *v10;
  int64_t v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907D8244;
  v8[3] = &unk_1E2C650A0;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  -[_IDSContinuity _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v8);

}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong(&self->_delegateContext, 0);
}

@end
