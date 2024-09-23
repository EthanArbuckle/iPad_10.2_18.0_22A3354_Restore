@implementation IDSContinuity

- (IDSContinuity)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  IDSContinuity *v12;
  IDSContinuity *v13;
  void *v14;
  _QWORD v16[4];
  IDSContinuity *v17;
  id v18;
  id v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsNotCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907E6278(v10);

  }
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging continuity](IDSLogging, "continuity");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907E61F0((uint64_t)self, v11);

    v12 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)IDSContinuity;
    v13 = -[IDSContinuity init](&v20, sel_init);
    if (v13)
    {
      +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = sub_1906F0334;
      v16[3] = &unk_1E2C602B8;
      v17 = v13;
      v18 = v6;
      v19 = v7;
      objc_msgSend(v14, "performBlock:", v16);

    }
    self = v13;
    v12 = self;
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _IDSContinuity *v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_1906EE184;
  v6[4] = sub_1906EE094;
  v7 = (_IDSContinuity *)0xAAAAAAAAAAAAAAAALL;
  v7 = self->_internal;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1906F0478;
  v5[3] = &unk_1E2C602E0;
  v5[4] = v6;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v5, 0);

  _Block_object_dispose(v6, 8);
  v4.receiver = self;
  v4.super_class = (Class)IDSContinuity;
  -[IDSContinuity dealloc](&v4, sel_dealloc);
}

- (int64_t)state
{
  void *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0xAAAAAAAAAAAAAAAALL;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1906F056C;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v6, 1);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1906F066C;
  v13[3] = &unk_1E2C60330;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1906F0700;
  v6[3] = &unk_1E2C60358;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 peers:(id)a5 withOptions:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel_startScanningForType_withData_mask_peers_withOptions_);
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_startScanningForType_withData_mask_withOptions_);
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 withOptions:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  int64_t v22;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1906F0818;
  v18[3] = &unk_1E2C60380;
  v21 = v13;
  v22 = a3;
  v18[4] = self;
  v19 = v11;
  v20 = v12;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  objc_msgSend(v14, "performBlock:", v18);

}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 withOptions:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;

  v9 = a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1906F08FC;
  v14[3] = &unk_1E2C60330;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = a3;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "performBlock:", v14);

}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 withOptions:(id)a7 boostedScan:(BOOL)a8
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  -[IDSContinuity startScanningForType:withData:mask:peers:withOptions:boostedScan:duplicates:](self, "startScanningForType:withData:mask:peers:withOptions:boostedScan:duplicates:", a3, a4, a5, a6, a7, a8, v8);
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 withOptions:(id)a6 boostedScan:(BOOL)a7
{
  MEMORY[0x1E0DE7D20](self, sel_startScanningForType_withData_mask_withOptions_boostedScan_duplicates_);
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 withOptions:(id)a7 boostedScan:(BOOL)a8 duplicates:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  BOOL v26;
  BOOL v27;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1906F0A40;
  v21[3] = &unk_1E2C603A8;
  v24 = v16;
  v25 = a3;
  v21[4] = self;
  v22 = v14;
  v23 = v15;
  v26 = a8;
  v27 = a9;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  objc_msgSend(v17, "performBlock:", v21);

}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 withOptions:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8
{
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  int64_t v21;
  BOOL v22;
  BOOL v23;

  v13 = a4;
  v14 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1906F0B44;
  v18[3] = &unk_1E2C603D0;
  v18[4] = self;
  v19 = v13;
  v20 = v14;
  v21 = a3;
  v22 = a7;
  v23 = a8;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v15, "performBlock:", v18);

}

- (void)stopScanningForType:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1906F0BE0;
  v6[3] = &unk_1E2C60358;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)startTrackingPeer:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  +[IDSLogging continuity](IDSLogging, "continuity", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_1907E6320(v3, v4, v5);

}

- (void)stopTrackingPeer:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  +[IDSLogging continuity](IDSLogging, "continuity", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_1907E6398(v3, v4, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
