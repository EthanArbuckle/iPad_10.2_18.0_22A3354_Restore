@implementation IDSParakeetMessagingController

- (IDSParakeetMessagingController)init
{
  void *v3;
  IDSServerMessagingController *v4;
  IDSServerMessagingController *v5;
  void *v6;
  void *v7;
  IDSParakeetMessagingController *v8;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E2CAE558, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IDSServerMessagingController initWithTopic:commands:]([IDSServerMessagingController alloc], "initWithTopic:commands:", CFSTR("com.apple.private.rupert.parakeet.ip"), v3);
  v5 = -[IDSServerMessagingController initWithTopic:]([IDSServerMessagingController alloc], "initWithTopic:", CFSTR("com.apple.private.rupert.parakeet"));
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IDSParakeetMessagingController initWithIPServerMessagingController:offGridServerMessagingController:queue:](self, "initWithIPServerMessagingController:offGridServerMessagingController:queue:", v4, v5, v7);

  return v8;
}

- (IDSParakeetMessagingController)initWithIPServerMessagingController:(id)a3 offGridServerMessagingController:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSParakeetMessagingController *v12;
  IDSParakeetMessagingController *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *stopStateMachineByIdentifier;
  NSMutableSet *v16;
  NSMutableSet *incomingMessagesWithoutAcks;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IDSParakeetMessagingController;
  v12 = -[IDSParakeetMessagingController init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_IPServerMessagingController, a3);
    -[IDSServerMessagingController addDelegate:](v13->_IPServerMessagingController, "addDelegate:", v13);
    objc_storeStrong((id *)&v13->_offGridServerMessagingController, a4);
    -[IDSServerMessagingController addDelegate:](v13->_offGridServerMessagingController, "addDelegate:", v13);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    stopStateMachineByIdentifier = v13->_stopStateMachineByIdentifier;
    v13->_stopStateMachineByIdentifier = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    incomingMessagesWithoutAcks = v13->_incomingMessagesWithoutAcks;
    v13->_incomingMessagesWithoutAcks = v16;

    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (void)_noteSentStopForIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);

  v8 = a3;
  v9 = a5;
  -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907FB318();
    goto LABEL_12;
  }
  if (objc_msgSend(v11, "state"))
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907FB378();
LABEL_12:

    goto LABEL_13;
  }
  if (!a4)
  {
    objc_msgSend(v11, "setState:", 5);
    objc_msgSend(v11, "messageHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v11, "messageHandler");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v14)[2](v14, 0, v9);

    }
    -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", v8);
    goto LABEL_12;
  }
  objc_msgSend(v11, "setState:", 1);
LABEL_13:

}

- (void)_noteAckTimerFiredForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;

  v4 = a3;
  -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "state");
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7 == 4)
    {
      if (v9)
        sub_1907FB468();

      objc_msgSend(v6, "setState:", 1);
      -[IDSParakeetMessagingController _noteReceivedStopResponseForIdentifier:success:error:](self, "_noteReceivedStopResponseForIdentifier:success:error:", v4, 1, 0);
    }
    else
    {
      if (v9)
        sub_1907FB4E8();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907FB408();

  }
}

- (void)_noteReceivedStopResponseForIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  NSObject *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[4];
  id v37;
  NSObject *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[3];
  char v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[3];
  char v48;
  id location[2];

  v8 = a3;
  v9 = a5;
  -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1907FB578();
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "state") && objc_msgSend(v11, "state") != 1)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1907FB5D8((uint64_t)v8, v11);
    goto LABEL_13;
  }
  if (!a4)
  {
    objc_msgSend(v11, "setState:", 5);
    objc_msgSend(v11, "messageHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v11, "messageHandler");
      v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v23)[2](v23, 0, v9);

    }
    -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v21, "removeObjectForKey:", v8);
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v11, "setState:", 2);
  v12 = dispatch_group_create();
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v48 = 1;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = sub_1906EE304;
  v45[4] = sub_1906EE154;
  v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 1;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_1906EE304;
  v41[4] = sub_1906EE154;
  v42 = 0;
  dispatch_group_enter(v12);
  -[IDSParakeetMessagingController IPServerMessagingController](self, "IPServerMessagingController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = sub_1907CD898;
  v36[3] = &unk_1E2C64C88;
  v15 = v8;
  v37 = v15;
  v39 = v41;
  v40 = v43;
  v16 = v12;
  v38 = v16;
  objc_msgSend(v13, "sendServerStorageFetchWithCompletion:", v36);

  dispatch_group_enter(v16);
  -[IDSParakeetMessagingController offGridServerMessagingController](self, "offGridServerMessagingController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v14;
  v31[1] = 3221225472;
  v31[2] = sub_1907CD9B8;
  v31[3] = &unk_1E2C64C88;
  v18 = v15;
  v32 = v18;
  v34 = v45;
  v35 = v47;
  v19 = v16;
  v33 = v19;
  objc_msgSend(v17, "sendServerStorageFetchWithCompletion:", v31);

  -[IDSParakeetMessagingController queue](self, "queue");
  v20 = objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = sub_1907CDAD8;
  v24[3] = &unk_1E2C64CB0;
  objc_copyWeak(&v30, location);
  v26 = v47;
  v27 = v43;
  v28 = v45;
  v29 = v41;
  v25 = v18;
  dispatch_group_notify(v19, v20, v24);

  objc_destroyWeak(&v30);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v47, 8);
  objc_destroyWeak(location);

LABEL_14:
}

- (void)_noteSentFetchForIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  _BYTE buf[12];
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1907FB670();
    goto LABEL_9;
  }
  if (objc_msgSend(v11, "state") != 2)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1907FB6D0((uint64_t)v8, v11);
LABEL_9:

    goto LABEL_20;
  }
  -[IDSParakeetMessagingController incomingMessagesWithoutAcks](self, "incomingMessagesWithoutAcks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") == 0;

  objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      v21 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      if (v6)
        v21 = CFSTR("YES");
      *(_QWORD *)&buf[4] = v21;
      v32 = 2112;
      v33 = v9;
      v34 = 2112;
      v35 = v8;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Calling stop completion {success: %@, error: %@, identifier: %@}", buf, 0x20u);
    }

    objc_msgSend(v11, "setState:", 5);
    objc_msgSend(v11, "messageHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v11, "messageHandler");
      v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _BOOL8, id))v23)[2](v23, v6, v9);

    }
    -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeObjectForKey:", v8);

  }
  else
  {
    if (v15)
    {
      -[IDSParakeetMessagingController incomingMessagesWithoutAcks](self, "incomingMessagesWithoutAcks");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "_noteSentFetch - messages have been delivered, waiting for acks {identifier: %@, incomingMessagesWithoutAcks: %@}", buf, 0x16u);

    }
    objc_msgSend(v11, "setState:", 4);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v17 = objc_alloc(MEMORY[0x1E0D36A18]);
    -[IDSParakeetMessagingController queue](self, "queue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = sub_1907CDFD8;
    v28 = &unk_1E2C64CD8;
    objc_copyWeak(&v30, (id *)buf);
    v29 = v8;
    v19 = (void *)objc_msgSend(v17, "initWithQueue:interval:repeats:handlerBlock:", v18, 300, 0, &v25);
    objc_msgSend(v11, "setFinalAckTimer:", v19, v25, v26, v27, v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
LABEL_20:

}

- (void)_noteCanceledFetchForIdentifier:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  NSObject *v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v11, "state") == 3)
    {
      objc_msgSend(v11, "setState:", 5);
      objc_msgSend(v11, "messageHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v11, "messageHandler");
        v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _BOOL8, id))v13)[2](v13, v6, v9);

      }
      -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectForKey:](v14, "removeObjectForKey:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1907FB7C8();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907FB768();
  }

}

- (void)_noteAckedMessageWithMessageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[IDSParakeetMessagingController incomingMessagesWithoutAcks](self, "incomingMessagesWithoutAcks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

    -[IDSParakeetMessagingController incomingMessagesWithoutAcks](self, "incomingMessagesWithoutAcks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1907FB898(self, v8);
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "copy");

      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v10)
      {
        v11 = v10;
        v23 = v4;
        v12 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v8);
            v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = objc_msgSend(v16, "state");
            objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
            if (v17 == 4)
            {
              if (v19)
              {
                *(_DWORD *)buf = 138412290;
                v29 = v14;
                _os_log_error_impl(&dword_1906E0000, v18, OS_LOG_TYPE_ERROR, "_noteAckedMessage - all messages have been acked, completing {identifier: %@}", buf, 0xCu);
              }

              objc_msgSend(v16, "setState:", 5);
              objc_msgSend(v16, "messageHandler");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                objc_msgSend(v16, "messageHandler");
                v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                v21[2](v21, 1, 0);

              }
              -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
              v18 = objc_claimAutoreleasedReturnValue();
              -[NSObject removeObjectForKey:](v18, "removeObjectForKey:", v14);
            }
            else if (v19)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "state"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v29 = v14;
              v30 = 2112;
              v31 = v22;
              _os_log_error_impl(&dword_1906E0000, v18, OS_LOG_TYPE_ERROR, "_noteSentCancel - state machine not in expected state {identifier: %@, stateMachine.state: %@}", buf, 0x16u);

            }
          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v11);
        v4 = v23;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907FB858(v8);
  }

}

- (void)stopParakeetSessionWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  IDSServerMessagingOptions *v9;
  void *v10;
  IDSParakeetMessagingStopStateMachine *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _BYTE buf[12];
  __int16 v22;
  void *v23;
  __int16 v24;
  IDSServerMessagingOptions *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(IDSServerMessagingOptions);
  -[IDSServerMessagingOptions setTimeout:](v9, "setTimeout:", &unk_1E2CAE5B0);
  -[IDSServerMessagingOptions setCommand:](v9, "setCommand:", &unk_1E2CAE558);
  -[IDSServerMessagingOptions setCancelOnClientCrash:](v9, "setCancelOnClientCrash:", MEMORY[0x1E0C9AAB0]);
  v26 = CFSTR("pmt");
  v27[0] = &unk_1E2CAE570;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSServerMessagingOptions setAdditionalTopLevelFields:](v9, "setAdditionalTopLevelFields:", v10);

  v11 = objc_alloc_init(IDSParakeetMessagingStopStateMachine);
  -[IDSParakeetMessagingStopStateMachine setState:](v11, "setState:", 0);
  -[IDSParakeetMessagingStopStateMachine setMessageHandler:](v11, "setMessageHandler:", v7);
  -[IDSParakeetMessagingStopStateMachine setIdentifier:](v11, "setIdentifier:", v8);
  -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, v8);

  objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Client triggered stop parakeet session { self: %@, guid: %@, options: %@}", buf, 0x20u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  -[IDSParakeetMessagingController IPServerMessagingController](self, "IPServerMessagingController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1907CE784;
  v17[3] = &unk_1E2C64D00;
  objc_copyWeak(&v19, (id *)buf);
  v15 = v8;
  v18 = v15;
  objc_msgSend(v14, "sendMessageData:withOptions:identifier:completion:", 0, v9, &v20, v17);
  v16 = v20;

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

- (void)cancelParakeetSessionStopWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  IDSParakeetMessagingStopStateMachine *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _BYTE buf[12];
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(IDSParakeetMessagingStopStateMachine);
  -[IDSParakeetMessagingStopStateMachine setState:](v9, "setState:", 3);
  -[IDSParakeetMessagingStopStateMachine setMessageHandler:](v9, "setMessageHandler:", v7);
  -[IDSParakeetMessagingStopStateMachine setIdentifier:](v9, "setIdentifier:", v8);
  -[IDSParakeetMessagingController stopStateMachineByIdentifier](self, "stopStateMachineByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, v8);

  objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Client triggered cancel of stopped parakeet session { self: %@, guid: %@ }", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  -[IDSParakeetMessagingController IPServerMessagingController](self, "IPServerMessagingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1907CEAD8;
  v15[3] = &unk_1E2C64D28;
  objc_copyWeak(&v17, (id *)buf);
  v14 = v6;
  v16 = v14;
  objc_msgSend(v12, "cancelMessageWithIdentifier:completion:", v13, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)sendCertifiedDeliveryReceipt:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.private.rupert.parakeet.ip")))
  {
    -[IDSParakeetMessagingController IPServerMessagingController](self, "IPServerMessagingController");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v6;
    -[NSObject sendCertifiedDeliveryReceipt:](v6, "sendCertifiedDeliveryReceipt:", v4);
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.private.rupert.parakeet")))
  {
    -[IDSParakeetMessagingController offGridServerMessagingController](self, "offGridServerMessagingController");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_1907FB928();
LABEL_8:

  -[IDSParakeetMessagingController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1907CED38;
  v10[3] = &unk_1E2C607A8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

- (void)controller:(id)a3 receivedIncomingMessageData:(id)a4 context:(id)a5
{
  id v7;
  IDSParakeetMessagingController *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  IDSParakeetMessagingController *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  IDSParakeetMessagingController *v23;
  __int16 v24;
  IDSParakeetMessagingController *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (IDSParakeetMessagingController *)a5;
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 134218242;
    v23 = self;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "Parakeet client received incoming data { self: %p, context: %@ }", (uint8_t *)&v22, 0x16u);
  }

  -[IDSParakeetMessagingController command](v8, "command");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11 == 176)
  {
    -[IDSParakeetMessagingController IPServerMessagingController](self, "IPServerMessagingController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSParakeetMessagingController certifiedDeliveryContext](v8, "certifiedDeliveryContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendCertifiedDeliveryReceipt:", v13);

    -[IDSParakeetMessagingController identifier](v8, "identifier");
    v14 = (IDSParakeetMessagingController *)objc_claimAutoreleasedReturnValue();
    -[IDSParakeetMessagingController _noteReceivedStopResponseForIdentifier:success:error:](self, "_noteReceivedStopResponseForIdentifier:success:error:", v14, 1, 0);
  }
  else
  {
    -[IDSParakeetMessagingController identifier](v8, "identifier");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[IDSParakeetMessagingController certifiedDeliveryContext](v8, "certifiedDeliveryContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[IDSParakeetMessagingController incomingMessagesWithoutAcks](self, "incomingMessagesWithoutAcks");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[IDSParakeetMessagingController identifier](v8, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

      }
    }
    -[IDSParakeetMessagingController delegate](self, "delegate");
    v14 = (IDSParakeetMessagingController *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v14)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412546;
        v23 = v8;
        v24 = 2048;
        v25 = v14;
        _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "Forwarding server message to delegate { context: %@, delegate: %p }", (uint8_t *)&v22, 0x16u);
      }

      -[IDSParakeetMessagingController controller:receivedIncomingMessageData:context:](v14, "controller:receivedIncomingMessageData:context:", self, v7, v8);
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1907FB9A4();

    }
  }

}

- (IDSParakeetMessagingControllerDelegate)delegate
{
  return (IDSParakeetMessagingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IDSServerMessagingController)IPServerMessagingController
{
  return self->_IPServerMessagingController;
}

- (IDSServerMessagingController)offGridServerMessagingController
{
  return self->_offGridServerMessagingController;
}

- (NSMutableDictionary)stopStateMachineByIdentifier
{
  return self->_stopStateMachineByIdentifier;
}

- (void)setStopStateMachineByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stopStateMachineByIdentifier, a3);
}

- (unint64_t)emptyStorageState
{
  return self->_emptyStorageState;
}

- (void)setEmptyStorageState:(unint64_t)a3
{
  self->_emptyStorageState = a3;
}

- (NSMutableSet)incomingMessagesWithoutAcks
{
  return self->_incomingMessagesWithoutAcks;
}

- (void)setIncomingMessagesWithoutAcks:(id)a3
{
  objc_storeStrong((id *)&self->_incomingMessagesWithoutAcks, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_incomingMessagesWithoutAcks, 0);
  objc_storeStrong((id *)&self->_stopStateMachineByIdentifier, 0);
  objc_storeStrong((id *)&self->_offGridServerMessagingController, 0);
  objc_storeStrong((id *)&self->_IPServerMessagingController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
