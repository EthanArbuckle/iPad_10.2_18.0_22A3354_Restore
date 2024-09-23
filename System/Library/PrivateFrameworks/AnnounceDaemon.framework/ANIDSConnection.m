@implementation ANIDSConnection

- (ANIDSConnection)init
{
  ANIDSConnection *v2;
  uint64_t v3;
  NSMutableDictionary *outgoingMessages;
  id v5;
  uint64_t v6;
  IDSService *service;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *idsQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ANIDSConnection;
  v2 = -[ANIDSConnection init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    outgoingMessages = v2->_outgoingMessages;
    v2->_outgoingMessages = (NSMutableDictionary *)v3;

    v5 = objc_alloc(MEMORY[0x1E0D34358]);
    v6 = objc_msgSend(v5, "initWithService:", *MEMORY[0x1E0CF79F0]);
    service = v2->_service;
    v2->_service = (IDSService *)v6;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.announce.IDSMessageQueue", v8);
    idsQueue = v2->_idsQueue;
    v2->_idsQueue = (OS_dispatch_queue *)v9;

    -[IDSService addDelegate:queue:](v2->_service, "addDelegate:queue:", v2, v2->_idsQueue);
    +[ANIDSConnection purgeTemporaryFiles](ANIDSConnection, "purgeTemporaryFiles");

  }
  return v2;
}

- (id)sendMessage:(id)a3 messageUUIDString:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  ANIDSConnection *v40;
  id v41;
  id v42;
  id v43;
  uint64_t *v44;
  id obj;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  const __CFString *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__9;
  v50 = __Block_byref_object_dispose__9;
  v51 = 0;
  obj = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v51, obj);
  v12 = (void *)v47[5];
  if (v12)
  {
    v13 = v12;
LABEL_3:
    v14 = v13;
    goto LABEL_30;
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1026, *MEMORY[0x1E0CF7C50]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  v15 = objc_msgSend(MEMORY[0x1E0D34358], "checkMessageSize:priority:", objc_msgSend(v11, "length"), 300);
  objc_msgSend(MEMORY[0x1E0CF7DF8], "messageWithoutDataFromMessage:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CF7DF8], "messageDataFromMessage:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF7E48], "createTemporaryFileWithData:extension:directory:", v17, *MEMORY[0x1E0CF7C80], CFSTR("46203C20-99A0-4622-A2B2-82E7339B26CA"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ANLogHandleIDSConnection();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

        goto LABEL_20;
      }
      v20 = v20;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:

        goto LABEL_19;
      }
      v21 = objc_msgSend(v11, "length");
      *(_DWORD *)buf = 138412802;
      v53 = &stru_1E93913D0;
      v54 = 2048;
      v55 = v21;
      v56 = 2112;
      v57 = v18;
      v22 = "%@Data is too big to send as message over IDS: %lu. Sending as file %@ plus metadata.";
      v23 = v20;
      v24 = 32;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v53 = &stru_1E93913D0;
        _os_log_impl(&dword_1D23A0000, v20, OS_LOG_TYPE_ERROR, "%@Failed to create temporary file for large message.", buf, 0xCu);
      }

      ANLogHandleIDSConnection();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v20 = v20;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v25 = objc_msgSend(v11, "length");
      *(_DWORD *)buf = 138412546;
      v53 = &stru_1E93913D0;
      v54 = 2048;
      v55 = v25;
      v22 = "%@Data is too big to send as message over IDS: %lu but could not get/create file so still trying to send as a message";
      v23 = v20;
      v24 = 22;
    }
    _os_log_impl(&dword_1D23A0000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    goto LABEL_18;
  }
  v18 = 0;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLForDefault:", *MEMORY[0x1E0CF7B68]);

  if (v27)
  {
    ANLogHandleIDSConnection();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v28, OS_LOG_TYPE_ERROR, "%@Forcing IDS Delivery Failure", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:description:", 1036, *MEMORY[0x1E0CF7C50], CFSTR("Force Delivery Failure Enabled in User Defaults"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v47[5];
    v47[5] = v29;

    -[ANIDSConnection delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "connection:failedDeliveryForMessage:withError:", self, v16, v47[5]);
    v14 = 0;
  }
  else
  {
    -[ANIDSConnection idsQueue](self, "idsQueue");
    v32 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__ANIDSConnection_sendMessage_messageUUIDString_destination___block_invoke;
    block[3] = &unk_1E9390C30;
    v37 = v9;
    v38 = v10;
    v33 = v18;
    v39 = v33;
    v40 = self;
    v41 = v16;
    v44 = &v46;
    v42 = v11;
    v43 = v8;
    dispatch_sync(v32, block);

    if (v33)
    {
      ANLogHandleIDSConnection();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = &stru_1E93913D0;
        _os_log_impl(&dword_1D23A0000, v34, OS_LOG_TYPE_DEFAULT, "%@Removing temporary file for large message.", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CF7E48], "removeItem:", v33);
    }
    v14 = (id)v47[5];

    v31 = v37;
  }

LABEL_30:
  _Block_object_dispose(&v46, 8);

  return v14;
}

void __61__ANIDSConnection_sendMessage_messageUUIDString_destination___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id obj;
  id v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberForDefault:", *MEMORY[0x1E0CF7B88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D341C8]);

  v5 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34150]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D34120]);
  IDSGetUUIDData();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D341E0]);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 64);
    v12 = (void *)objc_msgSend(v2, "copy");
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    obj = *(id *)(v13 + 40);
    v26 = 0;
    LOBYTE(v11) = objc_msgSend(v9, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", v10, v11, v7, 300, v12, &v26, &obj);
    v14 = v26;
    objc_storeStrong((id *)(v13 + 40), obj);

    if ((v11 & 1) != 0)
    {
LABEL_3:
      ANLogHandleIDSConnection();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = &stru_1E93913D0;
        v29 = 2112;
        v30 = v14;
        _os_log_impl(&dword_1D23A0000, v15, OS_LOG_TYPE_DEFAULT, "%@IDS Send Successful with identifier: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 56), "outgoingMessages");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v16, "setObject:forKey:", *(_QWORD *)(a1 + 64), v14);
      goto LABEL_9;
    }
  }
  else
  {
    v17 = *(_QWORD *)(a1 + 72);
    v18 = (void *)objc_msgSend(v2, "copy");
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v23 = *(id *)(v19 + 40);
    v24 = 0;
    v20 = objc_msgSend(v9, "sendData:toDestinations:priority:options:identifier:error:", v17, v7, 300, v18, &v24, &v23);
    v14 = v24;
    objc_storeStrong((id *)(v19 + 40), v23);

    if ((v20 & 1) != 0)
      goto LABEL_3;
  }
  ANLogHandleIDSConnection();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v21 = *(_QWORD *)(a1 + 80);
    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    *(_DWORD *)buf = 138412802;
    v28 = &stru_1E93913D0;
    v29 = 2112;
    v30 = v22;
    v31 = 2112;
    v32 = v21;
    _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_ERROR, "%@IDS Send Failed: Error = %@, Message = %@", buf, 0x20u);
  }
LABEL_9:

}

+ (void)purgeTemporaryFiles
{
  objc_msgSend(MEMORY[0x1E0CF7E48], "purgeTemporarySubDirectory:", CFSTR("46203C20-99A0-4622-A2B2-82E7339B26CA"));
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a5, 0, 0, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v20;
  if (v17)
  {
    ANLogHandleIDSConnection();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v22 = &stru_1E93913D0;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_1D23A0000, v18, OS_LOG_TYPE_ERROR, "%@Failed to convert data into dictionary: %@", buf, 0x16u);
    }

    +[ANAnalytics shared](ANAnalytics, "shared");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "error:", 5020);

  }
  else if (v16)
  {
    -[ANIDSConnection service:account:incomingMessage:fromID:context:](self, "service:account:incomingMessage:fromID:context:", v12, v13, v16, v14, v15);
  }

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a3;
  ANLogHandleIDSConnection();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = &stru_1E93913D0;
    v33 = 2112;
    v34 = v12;
    _os_log_impl(&dword_1D23A0000, v15, OS_LOG_TYPE_DEFAULT, "%@Received IDS Message from ID = %@", buf, 0x16u);
  }

  v16 = (void *)objc_opt_new();
  objc_msgSend(v13, "senderCorrelationIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setSenderCorrelationIdentifier:", v17);
  objc_msgSend(v14, "deviceForFromID:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setIsValidDevice:", v18 != 0);
  ANLogHandleIDSConnection();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v18, "modelIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v32 = &stru_1E93913D0;
    v33 = 2112;
    v34 = v16;
    v35 = 2112;
    v36 = v20;
    _os_log_impl(&dword_1D23A0000, v19, OS_LOG_TYPE_DEFAULT, "%@Sender Context: (%@) - %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CF7E80], "senderWithID:type:", v12, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  dispatch_get_global_queue(33, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ANIDSConnection_service_account_incomingMessage_fromID_context___block_invoke;
  block[3] = &unk_1E9390C98;
  objc_copyWeak(&v30, (id *)buf);
  block[4] = self;
  v27 = v11;
  v28 = v21;
  v29 = v16;
  v23 = v16;
  v24 = v21;
  v25 = v11;
  dispatch_async(v22, block);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

}

void __66__ANIDSConnection_service_account_incomingMessage_fromID_context___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:didReceiveMessage:fromSender:senderContext:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &__block_literal_global_30);

}

void __66__ANIDSConnection_service_account_incomingMessage_fromID_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    ANLogHandleIDSConnection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412546;
      v5 = &stru_1E93913D0;
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_ERROR, "%@IDS Receive Failure: %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  ANLogHandleIDSConnection();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v27 = &stru_1E93913D0;
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v18;
    _os_log_impl(&dword_1D23A0000, v20, OS_LOG_TYPE_DEFAULT, "%@Received IDS File %@ from ID = %@", buf, 0x20u);
  }

  v25 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v16, 0, &v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v25;
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CF7DF8], "messageFromData:data:", v17, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANIDSConnection service:account:incomingMessage:fromID:context:](self, "service:account:incomingMessage:fromID:context:", v14, v15, v23, v18, v19);
  }
  else
  {
    ANLogHandleIDSConnection();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v27 = &stru_1E93913D0;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v18;
      v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_1D23A0000, v24, OS_LOG_TYPE_ERROR, "%@Failed to convert file resource %@ sent from %@ to data: %@", buf, 0x2Au);
    }

    +[ANAnalytics shared](ANAnalytics, "shared");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "error:", 5021);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL4 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v9 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a7;
  -[ANIDSConnection outgoingMessages](self, "outgoingMessages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ANIDSConnection outgoingMessages](self, "outgoingMessages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectForKey:", v11);

  ANLogHandleIDSConnection();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v9)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = &stru_1E93913D0;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_1D23A0000, v17, OS_LOG_TYPE_DEFAULT, "%@IDS Delivery Successful for message with identifier (%@)", buf, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v25 = &stru_1E93913D0;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_1D23A0000, v17, OS_LOG_TYPE_ERROR, "%@IDS Delivery Failed for message with identifier (%@). Error: %@", buf, 0x20u);
    }

    +[ANAnalytics shared](ANAnalytics, "shared");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "error:", 5022);

    objc_initWeak((id *)buf, self);
    dispatch_get_global_queue(33, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __79__ANIDSConnection_service_account_identifier_didSendWithSuccess_error_context___block_invoke;
    v20[3] = &unk_1E93906B8;
    objc_copyWeak(&v23, (id *)buf);
    v20[4] = self;
    v21 = v14;
    v22 = v12;
    dispatch_async(v19, v20);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

void __79__ANIDSConnection_service_account_identifier_didSendWithSuccess_error_context___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:failedDeliveryForMessage:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (ANConnectionDelegate)delegate
{
  return (ANConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IDSService)service
{
  return self->_service;
}

- (OS_dispatch_queue)idsQueue
{
  return self->_idsQueue;
}

- (NSMutableDictionary)outgoingMessages
{
  return self->_outgoingMessages;
}

- (void)setOutgoingMessages:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingMessages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingMessages, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
