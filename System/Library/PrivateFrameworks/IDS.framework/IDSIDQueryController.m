@implementation IDSIDQueryController

- (IDSIDQueryController)init
{
  NSObject *v3;
  IDSIDQueryController *v4;
  IDSIDQueryController *v5;
  IDSInternalQueueController *queueController;
  _QWORD v8[4];
  IDSIDQueryController *v9;
  objc_super v10;

  if (_IDSRunningInDaemon())
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1907E7DEC((uint64_t)self, v3);

    v4 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)IDSIDQueryController;
    v5 = -[IDSIDQueryController init](&v10, sel_init);
    if (v5)
    {
      if (qword_1ECDD6610 != -1)
        dispatch_once(&qword_1ECDD6610, &unk_1E2C5F2F0);
      objc_storeStrong((id *)&v5->_queueController, (id)qword_1ECDD6618);
      queueController = v5->_queueController;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_1906EE6DC;
      v8[3] = &unk_1E2C60550;
      v9 = v5;
      -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v8, 1);

    }
    self = v5;
    v4 = self;
  }

  return v4;
}

- (void)addDelegate:(id)a3 forService:(id)a4 listenerID:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IDSInternalQueueController *queueController;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queueController = self->_queueController;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1906EE438;
  v19[3] = &unk_1E2C610F8;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v19, 1);

}

+ (id)sharedInstance
{
  if (qword_1ECDD6748 != -1)
    dispatch_once(&qword_1ECDD6748, &unk_1E2C5FDD0);
  return (id)qword_1ECDD6708;
}

- (void)setFromID:(id)a3
{
  id v4;
  IDSInternalQueueController *queueController;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queueController = self->_queueController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1907D2448;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v7, 1);

}

- (void)dealloc
{
  IDSInternalQueueController *queueController;
  objc_super v4;

  -[IDSInternalQueueController performBlock:waitUntilDone:](self->_queueController, "performBlock:waitUntilDone:", &unk_1E2C5FEF0, 1);
  queueController = self->_queueController;
  self->_queueController = 0;

  v4.receiver = self;
  v4.super_class = (Class)IDSIDQueryController;
  -[IDSIDQueryController dealloc](&v4, sel_dealloc);
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  IDSInternalQueueController *queueController;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queueController = self->_queueController;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907D2564;
  v11[3] = &unk_1E2C602B8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v11, 1);

}

- (void)removeDelegate:(id)a3
{
  IDSInternalQueueController *queueController;
  id v4;
  _QWORD v5[6];

  queueController = self->_queueController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1907D25E8;
  v5[3] = &unk_1E2C61180;
  v5[4] = self;
  v5[5] = a3;
  v4 = a3;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v5, 1);

}

- (void)removeDelegate:(id)a3 forService:(id)a4 listenerID:(id)a5
{
  id v8;
  id v9;
  IDSInternalQueueController *queueController;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  queueController = self->_queueController;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1907D26B0;
  v14[3] = &unk_1E2C64EC0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a3;
  v11 = v9;
  v12 = v8;
  v13 = a3;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v14, 1);

}

- (void)addListenerID:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  IDSInternalQueueController *queueController;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Adding listener ID: %@   for service: %@", buf, 0x16u);
  }

  queueController = self->_queueController;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1907D2804;
  v12[3] = &unk_1E2C602B8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v12, 1);

}

- (BOOL)removeListenerID:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  IDSInternalQueueController *queueController;
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Removing listener ID: %@   for service: %@", buf, 0x16u);
  }

  queueController = self->_queueController;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1907D29C0;
  v14[3] = &unk_1E2C61360;
  v17 = &v18;
  v14[4] = self;
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v14, 1);
  v12 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return -[IDSIDQueryController refreshIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:](self, "refreshIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", a3, a4, 0, a5, a6, a7);
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  IDSInternalQueueController *queueController;
  BOOL v25;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _BYTE *v34;
  _BYTE buf[24];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandlesOnService();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v36 = v17;
    _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status to refresh ID status for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);

  }
  if (objc_msgSend(v14, "count") && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    if ((unint64_t)objc_msgSend(v14, "count") >= 0x1E)
    {
      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(v14, "count");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v23;
        _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "Client %@ is attempting to send more than a reasonable amount of URI's in a query {count: %lu}", buf, 0x16u);
      }

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v36) = 0;
    queueController = self->_queueController;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1907D2D00;
    v27[3] = &unk_1E2C64EE8;
    v34 = buf;
    v27[4] = self;
    v28 = v14;
    v29 = v15;
    v30 = v16;
    v31 = v17;
    v32 = v18;
    v33 = v19;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v27, 1);
    v25 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)forceRefreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return MEMORY[0x1E0DE7D20](self, sel_forceRefreshIDStatusForDestinations_service_preferredFromID_listenerID_queue_completionBlock_);
}

- (BOOL)forceRefreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  IDSInternalQueueController *queueController;
  BOOL v25;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _BYTE *v34;
  _BYTE buf[24];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandlesOnService();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v36 = v17;
    _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status to force refresh ID status for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);

  }
  if (objc_msgSend(v14, "count") && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    if ((unint64_t)objc_msgSend(v14, "count") >= 0x1E)
    {
      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(v14, "count");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v23;
        _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "Client %@ is attempting to send more than a reasonable amount of URI's in a query {count: %lu}", buf, 0x16u);
      }

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v36) = 0;
    queueController = self->_queueController;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1907D3144;
    v27[3] = &unk_1E2C64EE8;
    v34 = buf;
    v27[4] = self;
    v28 = v14;
    v29 = v15;
    v30 = v16;
    v31 = v17;
    v32 = v18;
    v33 = v19;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v27, 1);
    v25 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 errorCompletionBlock:(id)a7
{
  return MEMORY[0x1E0DE7D20](self, sel_refreshIDStatusForDestinations_service_preferredFromID_listenerID_queue_errorCompletionBlock_);
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 errorCompletionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  IDSInternalQueueController *queueController;
  BOOL v25;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _BYTE *v34;
  _BYTE buf[24];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandlesOnService();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v36 = v17;
    _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status to refresh ID status for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);

  }
  if (objc_msgSend(v14, "count") && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    if ((unint64_t)objc_msgSend(v14, "count") >= 0x1E)
    {
      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(v14, "count");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v23;
        _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "Client %@ is attempting to send more than a reasonable amount of URI's in a query {count: %lu}", buf, 0x16u);
      }

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v36) = 0;
    queueController = self->_queueController;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1907D3588;
    v27[3] = &unk_1E2C64EE8;
    v34 = buf;
    v27[4] = self;
    v28 = v14;
    v29 = v15;
    v30 = v16;
    v31 = v17;
    v32 = v18;
    v33 = v19;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v27, 1);
    v25 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)refreshIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return -[IDSIDQueryController refreshIDStatusForDestination:service:preferredFromID:listenerID:queue:completionBlock:](self, "refreshIDStatusForDestination:service:preferredFromID:listenerID:queue:completionBlock:", a3, a4, 0, a5, a6, a7);
}

- (BOOL)refreshIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  IDSInternalQueueController *queueController;
  BOOL v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _BYTE *v32;
  _BYTE buf[24];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandleOnService();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v34 = v17;
    _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status to refresh ID status for destination %@  on service: %@   from listenerID: %@", buf, 0x20u);

  }
  if (objc_msgSend(v14, "length") && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v34) = 0;
    queueController = self->_queueController;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1907D3868;
    v25[3] = &unk_1E2C64EE8;
    v32 = buf;
    v25[4] = self;
    v26 = v14;
    v27 = v15;
    v28 = v16;
    v29 = v17;
    v30 = v18;
    v31 = v19;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v25, 1);
    v23 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)requiredIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return -[IDSIDQueryController requiredIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:](self, "requiredIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", a3, a4, 0, a5, a6, a7);
}

- (BOOL)requiredIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  IDSInternalQueueController *queueController;
  BOOL v25;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _BYTE *v34;
  _BYTE buf[24];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandlesOnService();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v36 = v17;
    _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status for required ID status for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);

  }
  if (objc_msgSend(v14, "count") && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    if ((unint64_t)objc_msgSend(v14, "count") >= 0x1E)
    {
      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(v14, "count");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v23;
        _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "Client %@ is attempting to send more than a reasonable amount of URI's in a query {count: %lu}", buf, 0x16u);
      }

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v36) = 0;
    queueController = self->_queueController;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1907D3BB0;
    v27[3] = &unk_1E2C64EE8;
    v34 = buf;
    v27[4] = self;
    v28 = v14;
    v29 = v15;
    v30 = v16;
    v31 = v17;
    v32 = v18;
    v33 = v19;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v27, 1);
    v25 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)requiredIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return -[IDSIDQueryController requiredIDStatusForDestination:service:preferredFromID:listenerID:queue:completionBlock:](self, "requiredIDStatusForDestination:service:preferredFromID:listenerID:queue:completionBlock:", a3, a4, 0, a5, a6, a7);
}

- (BOOL)requiredIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  IDSInternalQueueController *queueController;
  BOOL v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _BYTE *v32;
  _BYTE buf[24];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandleOnService();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v34 = v17;
    _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status for required ID status for destination %@  on service: %@   from listenerID: %@", buf, 0x20u);

  }
  if (objc_msgSend(v14, "length") && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v34) = 0;
    queueController = self->_queueController;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1907D3F74;
    v25[3] = &unk_1E2C64EE8;
    v32 = buf;
    v25[4] = self;
    v26 = v14;
    v27 = v15;
    v28 = v16;
    v29 = v17;
    v30 = v18;
    v31 = v19;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v25, 1);
    v23 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 respectExpiry:(BOOL)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  return -[IDSIDQueryController currentIDStatusForDestinations:service:preferredFromID:respectExpiry:listenerID:queue:completionBlock:](self, "currentIDStatusForDestinations:service:preferredFromID:respectExpiry:listenerID:queue:completionBlock:", a3, a4, 0, a5, a6, a7, a8);
}

- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  IDSInternalQueueController *queueController;
  BOOL v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (objc_msgSend(v15, "count") && objc_msgSend(v16, "length") && objc_msgSend(v18, "length"))
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    queueController = self->_queueController;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1907D41B4;
    v24[3] = &unk_1E2C64F10;
    v31 = &v33;
    v24[4] = self;
    v25 = v15;
    v26 = v16;
    v27 = v17;
    v32 = a6;
    v28 = v18;
    v29 = v19;
    v30 = v20;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v24, 1);
    v22 = *((_BYTE *)v34 + 24) != 0;

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 respectExpiry:(BOOL)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  return -[IDSIDQueryController currentIDStatusForDestination:service:preferredFromID:respectExpiry:listenerID:queue:completionBlock:](self, "currentIDStatusForDestination:service:preferredFromID:respectExpiry:listenerID:queue:completionBlock:", a3, a4, 0, a5, a6, a7, a8);
}

- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  IDSInternalQueueController *queueController;
  BOOL v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (objc_msgSend(v15, "length") && objc_msgSend(v16, "length") && objc_msgSend(v18, "length"))
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    queueController = self->_queueController;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1907D4404;
    v24[3] = &unk_1E2C64F10;
    v31 = &v33;
    v24[4] = self;
    v25 = v15;
    v26 = v16;
    v27 = v17;
    v32 = a6;
    v28 = v18;
    v29 = v19;
    v30 = v20;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v24, 1);
    v22 = *((_BYTE *)v34 + 24) != 0;

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return MEMORY[0x1E0DE7D20](self, sel_currentIDStatusForDestinations_service_preferredFromID_listenerID_queue_completionBlock_);
}

- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  return -[IDSIDQueryController currentIDStatusForDestinations:service:preferredFromID:respectExpiry:listenerID:queue:completionBlock:](self, "currentIDStatusForDestinations:service:preferredFromID:respectExpiry:listenerID:queue:completionBlock:", a3, a4, a5, 1, a6, a7, a8);
}

- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return MEMORY[0x1E0DE7D20](self, sel_currentIDStatusForDestination_service_preferredFromID_listenerID_queue_completionBlock_);
}

- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  return -[IDSIDQueryController currentIDStatusForDestination:service:preferredFromID:respectExpiry:listenerID:queue:completionBlock:](self, "currentIDStatusForDestination:service:preferredFromID:respectExpiry:listenerID:queue:completionBlock:", a3, a4, a5, 1, a6, a7, a8);
}

- (BOOL)idInfoForDestinations:(id)a3 service:(id)a4 infoTypes:(unint64_t)a5 options:(id)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9
{
  return -[IDSIDQueryController idInfoForDestinations:service:preferredFromID:infoTypes:options:listenerID:queue:completionBlock:](self, "idInfoForDestinations:service:preferredFromID:infoTypes:options:listenerID:queue:completionBlock:", a3, a4, 0, a5, a6, a7, a8, a9);
}

- (BOOL)idInfoForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 infoTypes:(unint64_t)a6 options:(id)a7 listenerID:(id)a8 queue:(id)a9 completionBlock:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  IDSInternalQueueController *queueController;
  BOOL v25;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _BYTE *v36;
  unint64_t v37;
  _BYTE buf[24];
  id v39;
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v27 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandlesOnService();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    v39 = v19;
    v40 = 2048;
    v41 = a6;
    _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "Client ID Info Request for destinations %@ on service: %@ from listenerID: %@ with infoTypes: %llu", buf, 0x2Au);

  }
  if (objc_msgSend(v16, "count") && objc_msgSend(v17, "length") && objc_msgSend(v19, "length"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v39) = 0;
    queueController = self->_queueController;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1907D47C8;
    v28[3] = &unk_1E2C64F38;
    v36 = buf;
    v28[4] = self;
    v29 = v16;
    v30 = v17;
    v31 = v27;
    v37 = a6;
    v32 = v18;
    v33 = v19;
    v34 = v20;
    v35 = v21;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v28, 1);
    v25 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)_hasCacheForService:(id)a3
{
  id v4;
  IDSInternalQueueController *queueController;
  BOOL v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    queueController = self->_queueController;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1907D4908;
    v8[3] = &unk_1E2C60780;
    v10 = &v11;
    v8[4] = self;
    v9 = v4;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v8, 1);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)_currentCachedIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5
{
  id v8;
  id v9;
  id v10;
  IDSInternalQueueController *queueController;
  id v12;
  id v13;
  id v14;
  int64_t v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  queueController = self->_queueController;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1907D4A68;
  v17[3] = &unk_1E2C63810;
  v21 = &v22;
  v17[4] = self;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v14 = v10;
  v20 = v14;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v17, 1);
  v15 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (BOOL)_warmupQueryCacheForService:(id)a3
{
  id v4;
  NSObject *v5;
  IDSInternalQueueController *queueController;
  BOOL v7;
  _QWORD v9[5];
  id v10;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Client requesting to warmup the query cache for service: %@", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(v4, "length"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v13 = 0x2020000000;
    v14 = 0;
    queueController = self->_queueController;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1907D4C20;
    v9[3] = &unk_1E2C60780;
    p_buf = &buf;
    v9[4] = self;
    v10 = v4;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v9, 1);
    v7 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_flushQueryCacheForService:(id)a3
{
  id v4;
  NSObject *v5;
  IDSInternalQueueController *queueController;
  BOOL v7;
  _QWORD v9[5];
  id v10;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Client requesting to flush the query cache for service: %@", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(v4, "length"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v13 = 0x2020000000;
    v14 = 0;
    queueController = self->_queueController;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1907D4DD4;
    v9[3] = &unk_1E2C60780;
    p_buf = &buf;
    v9[4] = self;
    v10 = v4;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v9, 1);
    v7 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_setCurrentIDStatus:(int64_t)a3 forDestination:(id)a4 service:(id)a5
{
  id v8;
  id v9;
  IDSInternalQueueController *queueController;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  queueController = self->_queueController;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1907D4EB8;
  v13[3] = &unk_1E2C60330;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v13, 1);

}

- (void)flushQueryCache
{
  IDSInternalQueueController *queueController;
  _QWORD v3[5];

  queueController = self->_queueController;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1907D4F28;
  v3[3] = &unk_1E2C60550;
  v3[4] = self;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v3, 1);
}

- (int64_t)_refreshIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5
{
  return MEMORY[0x1E0DE7D20](self, sel__refreshIDStatusForDestination_service_preferredFromID_listenerID_);
}

- (int64_t)_refreshIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  IDSInternalQueueController *queueController;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  double v23;
  int64_t v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  IDSIDQueryController *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _BYTE *v35;
  uint8_t v36[4];
  double v37;
  _BYTE buf[24];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandleOnService();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v39 = v13;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "** BLOCKING Client ID status to refresh ID status for destination %@  on service: %@   from listenerID: %@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v39 = 0;
  v16 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  queueController = self->_queueController;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = sub_1907D51D0;
  v29 = &unk_1E2C64F88;
  v30 = self;
  v18 = v10;
  v31 = v18;
  v19 = v11;
  v32 = v19;
  v20 = v12;
  v33 = v20;
  v21 = v13;
  v34 = v21;
  v35 = buf;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", &v26, 1);
  +[IDSLogging IDQuery](IDSLogging, "IDQuery", v26, v27, v28, v29, v30);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v16, "timeIntervalSinceNow");
    *(_DWORD *)v36 = 134217984;
    v37 = fabs(v23);
    _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "  => Done: %f", v36, 0xCu);
  }

  v24 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);

  return v24;
}

- (id)_refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__refreshIDStatusForDestinations_service_preferredFromID_listenerID_);
}

- (id)_refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  NSObject *v14;
  void *v15;
  id v16;
  IDSInternalQueueController *queueController;
  id v18;
  id v19;
  id v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  NSObject *v22;
  double v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(_QWORD *);
  void *v29;
  IDSIDQueryController *v30;
  id v31;
  id v32;
  id v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  _BYTE *v35;
  uint8_t v36[4];
  double v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (uint64_t (*)(uint64_t, uint64_t))a6;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandlesOnService();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v39 = v13;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "** BLOCKING Client ID status to refresh ID status for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v39 = sub_1906EE324;
  v40 = sub_1906EE164;
  v41 = 0;
  v16 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  queueController = self->_queueController;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = sub_1907D55CC;
  v29 = &unk_1E2C64F88;
  v30 = self;
  v18 = v10;
  v31 = v18;
  v19 = v11;
  v32 = v19;
  v20 = v12;
  v33 = v20;
  v21 = v13;
  v34 = v21;
  v35 = buf;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", &v26, 1);
  +[IDSLogging IDQuery](IDSLogging, "IDQuery", v26, v27, v28, v29, v30);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v16, "timeIntervalSinceNow");
    *(_DWORD *)v36 = 134217984;
    v37 = fabs(v23);
    _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "  => Done: %f", v36, 0xCu);
  }

  v24 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v24;
}

- (int64_t)_currentIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5
{
  return MEMORY[0x1E0DE7D20](self, sel__currentIDStatusForDestination_service_preferredFromID_listenerID_);
}

- (int64_t)_currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6
{
  return MEMORY[0x1E0DE7D20](self, sel__currentIDStatusForDestination_service_preferredFromID_respectExpiry_listenerID_);
}

- (int64_t)_currentIDStatusForDestination:(id)a3 service:(id)a4 respectExpiry:(BOOL)a5 listenerID:(id)a6
{
  return MEMORY[0x1E0DE7D20](self, sel__currentIDStatusForDestination_service_preferredFromID_respectExpiry_listenerID_);
}

- (int64_t)_currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  IDSInternalQueueController *queueController;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  double v26;
  int64_t v27;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  _BYTE *v34;
  BOOL v35;
  uint8_t v36[4];
  double v37;
  _BYTE buf[24];
  const __CFString *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v8 = a6;
  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandleOnService();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v17;
    if (v8)
      v18 = CFSTR("YES");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v39 = v18;
    v40 = 2112;
    v41 = v15;
    _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "** BLOCKING Client ID status cache request for destination %@  on service: %@ respectExpiry: %@   from listenerID: %@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v39 = 0;
  v19 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  queueController = self->_queueController;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1907D5988;
  v29[3] = &unk_1E2C65000;
  v29[4] = self;
  v21 = v12;
  v30 = v21;
  v22 = v13;
  v31 = v22;
  v23 = v14;
  v32 = v23;
  v35 = v8;
  v24 = v15;
  v33 = v24;
  v34 = buf;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v29, 1);
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v19, "timeIntervalSinceNow");
    *(_DWORD *)v36 = 134217984;
    v37 = fabs(v26);
    _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "  => Done: %f", v36, 0xCu);
  }

  v27 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);

  return v27;
}

- (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__currentIDStatusForDestinations_service_preferredFromID_listenerID_);
}

- (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__currentIDStatusForDestinations_service_preferredFromID_respectExpiry_listenerID_);
}

- (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 respectExpiry:(BOOL)a5 listenerID:(id)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__currentIDStatusForDestinations_service_preferredFromID_respectExpiry_listenerID_);
}

- (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  IDSInternalQueueController *queueController;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  double v26;
  id v27;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  _BYTE *v34;
  BOOL v35;
  uint8_t v36[4];
  double v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  __int128 v40;
  uint64_t v41;

  v8 = a6;
  v41 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandlesOnService();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v17;
    if (v8)
      v18 = CFSTR("YES");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v39 = (uint64_t (*)(uint64_t, uint64_t))v18;
    LOWORD(v40) = 2112;
    *(_QWORD *)((char *)&v40 + 2) = v15;
    _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "** BLOCKING Client ID status cache request for destinations %@  on service: %@ respectExpiry: %@   from listenerID: %@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v39 = sub_1906EE324;
  *(_QWORD *)&v40 = sub_1906EE164;
  *((_QWORD *)&v40 + 1) = 0;
  v19 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  queueController = self->_queueController;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1907D5DA4;
  v29[3] = &unk_1E2C65000;
  v29[4] = self;
  v21 = v12;
  v30 = v21;
  v22 = v13;
  v31 = v22;
  v23 = v14;
  v32 = v23;
  v35 = v8;
  v24 = v15;
  v33 = v24;
  v34 = buf;
  -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v29, 1);
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v19, "timeIntervalSinceNow");
    *(_DWORD *)v36 = 134217984;
    v37 = fabs(v26);
    _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "  => Done: %f", v36, 0xCu);
  }

  v27 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v27;
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return -[IDSIDQueryController currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:completionBlock:](self, "currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", a3, a4, 0, a5, a6, a7);
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  IDSInternalQueueController *queueController;
  BOOL v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _BYTE *v32;
  _BYTE buf[24];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandlesOnService();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v34 = v17;
    _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Client Remote Device Request for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);

  }
  if (objc_msgSend(v14, "count") && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v34) = 0;
    queueController = self->_queueController;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1907D60AC;
    v25[3] = &unk_1E2C64EE8;
    v32 = buf;
    v25[4] = self;
    v26 = v14;
    v27 = v15;
    v28 = v16;
    v29 = v17;
    v30 = v18;
    v31 = v19;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v25, 1);
    v23 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlockWithError:(id)a7
{
  return -[IDSIDQueryController currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:completionBlockWithError:](self, "currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:completionBlockWithError:", a3, a4, 0, a5, a6, a7);
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlockWithError:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  IDSInternalQueueController *queueController;
  BOOL v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _BYTE *v32;
  _BYTE buf[24];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandlesOnService();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v34 = v17;
    _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Client Remote Device Request for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);

  }
  if (objc_msgSend(v14, "count") && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v34) = 0;
    queueController = self->_queueController;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1907D637C;
    v25[3] = &unk_1E2C64EE8;
    v32 = buf;
    v25[4] = self;
    v26 = v14;
    v27 = v15;
    v28 = v16;
    v29 = v17;
    v30 = v18;
    v31 = v19;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v25, 1);
    v23 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_currentCachedRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__currentCachedRemoteDevicesForDestinations_service_preferredFromID_listenerID_);
}

- (id)_currentCachedRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  NSObject *v14;
  void *v15;
  IDSInternalQueueController *queueController;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  _BYTE *v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (uint64_t (*)(uint64_t, uint64_t))a6;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandlesOnService();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v26 = v13;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "** BLOCKING  Client Remote Device Request for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);

  }
  if (objc_msgSend(v10, "count") && objc_msgSend(v11, "length") && objc_msgSend(v13, "length"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v26 = sub_1906EE324;
    v27 = sub_1906EE164;
    v28 = 0;
    queueController = self->_queueController;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1907D6614;
    v19[3] = &unk_1E2C64F88;
    v19[4] = self;
    v20 = v10;
    v21 = v11;
    v22 = v12;
    v23 = v13;
    v24 = buf;
    -[IDSInternalQueueController performBlock:waitUntilDone:](queueController, "performBlock:waitUntilDone:", v19, 1);
    v17 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)participantsForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return MEMORY[0x1E0DE7D20](self, sel_participantsForDestinations_service_preferredFromID_listenerID_queue_completionBlock_);
}

- (BOOL)participantsForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v14 = a8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1907D675C;
  v17[3] = &unk_1E2C60960;
  v18 = v14;
  v15 = v14;
  LOBYTE(a7) = -[IDSIDQueryController currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:completionBlock:](self, "currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", a3, a4, a5, a6, a7, v17);

  return (char)a7;
}

- (BOOL)requestIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return MEMORY[0x1E0DE7D20](self, sel_requestIDStatusForDestinations_service_preferredFromID_listenerID_queue_completionBlock_);
}

- (BOOL)requestIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandlesOnService();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412802;
    v25 = v21;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status request for destinations %@  on service: %@   from listenerID: %@", (uint8_t *)&v24, 0x20u);

  }
  v22 = -[IDSIDQueryController refreshIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:](self, "refreshIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", v14, v15, v19, v16, v18, v17);

  return v22;
}

- (BOOL)requestIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return MEMORY[0x1E0DE7D20](self, sel_requestIDStatusForDestination_service_preferredFromID_listenerID_queue_completionBlock_);
}

- (BOOL)requestIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForHandleOnService();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412802;
    v25 = v21;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status request for destination %@  on service: %@   from listenerID: %@", (uint8_t *)&v24, 0x20u);

  }
  v22 = -[IDSIDQueryController refreshIDStatusForDestination:service:preferredFromID:listenerID:queue:completionBlock:](self, "refreshIDStatusForDestination:service:preferredFromID:listenerID:queue:completionBlock:", v14, v15, v19, v16, v18, v17);

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueController, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
