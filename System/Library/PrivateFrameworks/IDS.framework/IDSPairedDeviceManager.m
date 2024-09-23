@implementation IDSPairedDeviceManager

+ (id)sharedInstance
{
  if (qword_1ECDD6728 != -1)
    dispatch_once(&qword_1ECDD6728, &unk_1E2C5F970);
  return (id)qword_1ECDD66E8;
}

- (IDSPairedDeviceManager)init
{
  IDSPairedDeviceManager *v2;
  uint64_t v3;
  IDSXPCDaemonController *xpcDaemonController;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IDSPairedDeviceManager;
  v2 = -[IDSPairedDeviceManager init](&v8, sel_init);
  if (v2)
  {
    +[IDSXPCDaemonController weakSharedInstance](IDSXPCDaemonController, "weakSharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    xpcDaemonController = v2->_xpcDaemonController;
    v2->_xpcDaemonController = (IDSXPCDaemonController *)v3;

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "listener");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addHandler:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeHandler:", self);

  v5.receiver = self;
  v5.super_class = (Class)IDSPairedDeviceManager;
  -[IDSPairedDeviceManager dealloc](&v5, sel_dealloc);
}

- (NSSet)allowedTrafficClassifiers
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1906EE234;
  v11 = sub_1906EE0EC;
  v12 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19072B81C;
  v6[3] = &unk_1E2C60308;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v6, 1);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (void)setAllowedTrafficClassifiers:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  IDSPairedDeviceManager *v11;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithSet:copyItems:", v5, 1);

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_19072B8F0;
  v9[3] = &unk_1E2C607A8;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)dropAllMessagesWithoutAnyAllowedClassifier
{
  id v2;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performBlock:", &unk_1E2C5F0F0);

}

- (void)setPairedDeviceInfo:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  NSObject *v7;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_19072BAF4;
    v6[3] = &unk_1E2C60550;
    v7 = v3;
    objc_msgSend(v4, "performBlock:", v6);

    v5 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_1907E9C40();
  }

}

- (void)deletePairedDevice:(id)a3 withCompletionBlock:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
  if (objc_msgSend(v8, "length") || !v11)
  {
    if (!v10)
    {
      v10 = MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C80D38];
    }
    if (!v9)
      v9 = &unk_1E2C5F110;
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_19072BD48;
    v22[3] = &unk_1E2C61EC0;
    v10 = v10;
    v23 = v10;
    v9 = v9;
    v24 = v9;
    v15 = (void *)MEMORY[0x19400FE1C](v22);
    -[IDSPairedDeviceManager xpcDaemonController](self, "xpcDaemonController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = sub_19072BDEC;
    v18[3] = &unk_1E2C61EE8;
    v19 = v8;
    v21 = v15;
    v20 = v11;
    v17 = v15;
    objc_msgSend(v16, "performTask:", v18);

    v12 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907E9CA0();
  }

}

- (void)getLocalDeviceInfoWithCompletionBlock:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[16];
  _QWORD v25[4];
  NSObject *v26;
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_19072C10C;
    v25[3] = &unk_1E2C61EC0;
    v26 = v7;
    v27 = v6;
    v10 = (void *)MEMORY[0x19400FE1C](v25);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Querying local device info from IDSD asynchronously", buf, 2u);
    }

    -[IDSPairedDeviceManager xpcDaemonController](self, "xpcDaemonController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = sub_19072C1B0;
    v22[3] = &unk_1E2C61F38;
    v23 = v10;
    v13 = v10;
    objc_msgSend(v12, "performTask:", v22);

    v14 = v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907E9D00(v14, v15, v16, v17, v18, v19, v20, v21);
  }

}

- (void)getPairedDeviceInfoWithCompletionBlock:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[16];
  _QWORD v25[4];
  NSObject *v26;
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_19072C590;
    v25[3] = &unk_1E2C61EC0;
    v26 = v7;
    v27 = v6;
    v10 = (void *)MEMORY[0x19400FE1C](v25);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Querying paired device info from IDSD asynchronously", buf, 2u);
    }

    -[IDSPairedDeviceManager xpcDaemonController](self, "xpcDaemonController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = sub_19072C634;
    v22[3] = &unk_1E2C61F38;
    v23 = v10;
    v13 = v10;
    objc_msgSend(v12, "performTask:", v22);

    v14 = v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907E9E30(v14, v15, v16, v17, v18, v19, v20, v21);
  }

}

- (void)getDeliveryStatsWithCompletionBlock:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_19072C988;
    v18[3] = &unk_1E2C61F60;
    v18[4] = self;
    v20 = v6;
    v19 = v8;
    objc_msgSend(v9, "performBlock:", v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_1907E9F60(v10, v11, v12, v13, v14, v15, v16, v17);

  }
}

- (void)device:(id)a3 pairingDeleted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  _IDSCompletionHandler *v10;
  NSObject *v11;
  _IDSCompletionHandler *v12;
  _IDSCompletionHandler *deleteCompletion;
  _QWORD block[4];
  _IDSCompletionHandler *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Received pairing removed notification from daemon, device: %@, deleted: %@", buf, 0x16u);
  }

  if (self->_deleteCompletion)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "Invoking pairingDelete completion block", buf, 2u);
    }

    v10 = self->_deleteCompletion;
    -[IDSDelegateInfo queue](v10, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19072CBA0;
    block[3] = &unk_1E2C60550;
    v15 = v10;
    v12 = v10;
    dispatch_async(v11, block);

    deleteCompletion = self->_deleteCompletion;
    self->_deleteCompletion = 0;

  }
}

- (void)deliveryStats:(id)a3
{
  id v4;
  _IDSCompletionHandler *deliveryStatsCompletion;
  _IDSCompletionHandler *v6;
  NSObject *v7;
  _IDSCompletionHandler *v8;
  _IDSCompletionHandler *v9;
  _QWORD v10[4];
  _IDSCompletionHandler *v11;
  id v12;

  v4 = a3;
  deliveryStatsCompletion = self->_deliveryStatsCompletion;
  if (deliveryStatsCompletion)
  {
    v6 = deliveryStatsCompletion;
    -[IDSDelegateInfo queue](v6, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_19072CC9C;
    v10[3] = &unk_1E2C607A8;
    v11 = v6;
    v12 = v4;
    v8 = v6;
    dispatch_async(v7, v10);

    v9 = self->_deliveryStatsCompletion;
    self->_deliveryStatsCompletion = 0;

  }
}

- (void)constructRAResponseDictionary:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IDSPairedDeviceManager xpcDaemonController](self, "xpcDaemonController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19072CD98;
  v11[3] = &unk_1E2C61F88;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performTask:", v11);

}

- (IDSXPCDaemonController)xpcDaemonController
{
  return self->_xpcDaemonController;
}

- (void)setXpcDaemonController:(id)a3
{
  objc_storeStrong((id *)&self->_xpcDaemonController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTrafficClassifiers, 0);
  objc_storeStrong((id *)&self->_xpcDaemonController, 0);
  objc_storeStrong((id *)&self->_deliveryStatsCompletion, 0);
  objc_storeStrong((id *)&self->_pairedCompletion, 0);
  objc_storeStrong((id *)&self->_localCompletion, 0);
  objc_storeStrong((id *)&self->_deleteCompletion, 0);
}

@end
