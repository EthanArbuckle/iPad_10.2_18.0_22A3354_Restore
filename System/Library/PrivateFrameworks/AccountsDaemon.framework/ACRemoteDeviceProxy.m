@implementation ACRemoteDeviceProxy

- (ACRemoteDeviceProxy)init
{
  ACRemoteDeviceProxy *v2;
  NSObject *v3;
  ACRemoteCommandHandler *v4;
  ACRemoteCommandHandler *remoteCommandHandler;
  NSMutableDictionary *v6;
  NSMutableDictionary *completionHandlersByInternalMessageID;
  NSMutableDictionary *v8;
  NSMutableDictionary *internalMessageIDsByTransportID;
  NSLock *v10;
  NSLock *completionHandlersLock;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *messageSendingQueue;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *commandProcessingQueue;
  uint64_t v18;
  IDSService *messageSendingService;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ACRemoteDeviceProxy;
  v2 = -[ACRemoteDeviceProxy init](&v21, sel_init);
  if (v2)
  {
    _ACLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ACRemoteDeviceProxy init].cold.1(v3);

    v4 = objc_alloc_init(ACRemoteCommandHandler);
    remoteCommandHandler = v2->_remoteCommandHandler;
    v2->_remoteCommandHandler = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    completionHandlersByInternalMessageID = v2->_completionHandlersByInternalMessageID;
    v2->_completionHandlersByInternalMessageID = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    internalMessageIDsByTransportID = v2->_internalMessageIDsByTransportID;
    v2->_internalMessageIDsByTransportID = v8;

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    completionHandlersLock = v2->_completionHandlersLock;
    v2->_completionHandlersLock = v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.accounts.IDSQ", v12);
    messageSendingQueue = v2->_messageSendingQueue;
    v2->_messageSendingQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.accounts.IDS.commandProcessing", v15);
    commandProcessingQueue = v2->_commandProcessingQueue;
    v2->_commandProcessingQueue = (OS_dispatch_queue *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.accountssync"));
    messageSendingService = v2->_messageSendingService;
    v2->_messageSendingService = (IDSService *)v18;

    -[IDSService addDelegate:queue:](v2->_messageSendingService, "addDelegate:queue:", v2, v2->_messageSendingQueue);
  }
  return v2;
}

- (void)sendCommand:(id)a3 withAccount:(id)a4 completion:(id)a5
{
  -[ACRemoteDeviceProxy sendCommand:withAccount:options:completion:](self, "sendCommand:withAccount:options:completion:", a3, a4, 0, a5);
}

- (void)sendCommand:(id)a3 withAccount:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  char v29;
  void *v30;
  NSObject *messageSendingQueue;
  void *v32;
  id v33;
  _QWORD block[4];
  id v35;
  ACRemoteDeviceProxy *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  char v42;
  _QWORD aBlock[4];
  id v44;
  os_signpost_id_t v45;
  uint64_t v46;
  uint8_t buf[4];
  os_signpost_id_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _ACLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ACRemoteDeviceProxy sendCommand:withAccount:options:completion:].cold.1();

  _ACDNotificationSignpostSystem();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = _ACSignpostCreate();
  v18 = v17;

  _ACDNotificationSignpostSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 138412546;
    v48 = (os_signpost_id_t)v11;
    v49 = 2112;
    v50 = v12;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v16, "SendRemoteCommand", "%@: %@", buf, 0x16u);
  }

  _ACDNotificationSignpostSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v48 = v16;
    v49 = 2112;
    v50 = v11;
    v51 = 2112;
    v52 = v12;
    _os_log_debug_impl(&dword_20D8CB000, v21, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: SendRemoteCommand %@: %@", buf, 0x20u);
  }

  v22 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__ACRemoteDeviceProxy_sendCommand_withAccount_options_completion___block_invoke;
  aBlock[3] = &unk_24C7E2E88;
  v45 = v16;
  v46 = v18;
  v23 = v13;
  v44 = v23;
  v24 = _Block_copy(aBlock);
  if (-[ACRemoteDeviceProxy _isValidCommandForOutgoingMessage:](self, "_isValidCommandForOutgoingMessage:", v10))
  {
    +[ACRemoteDeviceMessage actionMessageWithCommand:account:options:](ACRemoteDeviceMessage, "actionMessageWithCommand:account:options:", v10, v11, v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDB4348]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v33 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = objc_msgSend(v26, "BOOLValue");

      if ((v27 & 1) != 0)
        goto LABEL_21;
    }
    else
    {

    }
    if ((objc_msgSend(v10, "isEqual:", *MEMORY[0x24BDB4300], v11) & 1) == 0
      && (objc_msgSend(v10, "isEqual:", *MEMORY[0x24BDB4328]) & 1) == 0
      && (objc_msgSend(v10, "isEqual:", *MEMORY[0x24BDB4330]) & 1) == 0
      && (objc_msgSend(v10, "isEqual:", *MEMORY[0x24BDB4338]) & 1) == 0
      && !objc_msgSend(v10, "isEqual:", *MEMORY[0x24BDB4318]))
    {
      v29 = 0;
      goto LABEL_22;
    }
LABEL_21:
    v29 = 1;
    objc_msgSend(v25, "setNeedsReply:", 1, v33);
LABEL_22:
    objc_msgSend(v25, "data");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      messageSendingQueue = self->_messageSendingQueue;
      block[0] = v22;
      block[1] = 3221225472;
      block[2] = __66__ACRemoteDeviceProxy_sendCommand_withAccount_options_completion___block_invoke_15;
      block[3] = &unk_24C7E2EB0;
      v35 = v12;
      v36 = self;
      v40 = v24;
      v37 = v10;
      v38 = v25;
      v39 = v30;
      v42 = v29;
      v41 = v23;
      dispatch_async(messageSendingQueue, block);

      v32 = v35;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 19, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v32);
    }
    v11 = v33;

    goto LABEL_26;
  }
  _ACLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = (os_signpost_id_t)v10;
    _os_log_impl(&dword_20D8CB000, v28, OS_LOG_TYPE_DEFAULT, "\"Command %@ cannot be sent from this platform.\", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 20, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void *, _QWORD, _QWORD, void *))v24 + 2))(v24, 0, 0, v25);
LABEL_26:

}

void __66__ACRemoteDeviceProxy_sendCommand_withAccount_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  const __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  Nanoseconds = _ACSignpostGetNanoseconds();
  _ACDNotificationSignpostSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 40);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13 = CFSTR("NO");
    if ((_DWORD)a2)
      v13 = CFSTR("YES");
    v17 = 138543618;
    v18 = v13;
    v19 = 2112;
    v20 = *(double *)&v8;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SendRemoteCommand", "%{public}@ (%@)", (uint8_t *)&v17, 0x16u);
  }

  _ACDNotificationSignpostSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v17 = 134218754;
    v18 = *(const __CFString **)(a1 + 40);
    v19 = 2048;
    v20 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    if ((_DWORD)a2)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    v21 = 2114;
    v22 = v16;
    v23 = 2112;
    v24 = v8;
    _os_log_debug_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SendRemoteCommand %{public}@ (%@)", (uint8_t *)&v17, 0x2Au);
  }

  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    (*(void (**)(uint64_t, uint64_t, id, id))(v15 + 16))(v15, a2, v7, v8);

}

void __66__ACRemoteDeviceProxy_sendCommand_withAccount_options_completion___block_invoke_15(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void (*v38)(void);
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BDB4358]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "devicesForBTUUID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") != 1)
    {
      _ACLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v40 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v57 = v4;
        v58 = 2112;
        v59 = v3;
        v60 = 2112;
        v61 = v40;
        _os_log_error_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_ERROR, "\"BTUUID matched 0 or multiple devices, which shouldn't be the case, matches: %@, BTUUID: %@, options: %@\", buf, 0x20u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 20, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

      v6 = v3;
      goto LABEL_51;
    }
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)IDSCopyIDForDevice();
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __66__ACRemoteDeviceProxy_sendCommand_withAccount_options_completion___block_invoke_15_cold_1();

    if (v6)
      goto LABEL_20;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "linkedDevicesWithRelationship:", 1);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v51;
LABEL_8:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v12);
      if (objc_msgSend(v13, "isActive"))
      {
        if ((objc_msgSend(v13, "isLocallyPaired") & 1) != 0)
          break;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v10)
          goto LABEL_8;
        goto LABEL_15;
      }
    }
    v6 = (void *)IDSCopyIDForDevice();

    if (!v6)
      goto LABEL_44;
LABEL_20:
    v16 = objc_msgSend(*(id *)(a1 + 40), "_priorityForMessageCarryingCommand:", *(_QWORD *)(a1 + 48));
    _ACLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      v57 = v6;
      v58 = 2112;
      v59 = v18;
      v60 = 2112;
      v61 = v19;
      _os_log_impl(&dword_20D8CB000, v17, OS_LOG_TYPE_DEFAULT, "\"Message is about to be sent to %@ with priority %@: %@\", buf, 0x20u);

    }
    v20 = *(void **)(a1 + 40);
    v21 = *(_QWORD *)(a1 + 64);
    v48 = 0;
    v49 = 0;
    v22 = objc_msgSend(v20, "_sendMessageData:toDestination:withPriority:bypassDuet:transportID:error:", v21, v6, v16, 1, &v49, &v48);
    v23 = v49;
    v24 = v48;
    if ((v22 & 1) != 0)
    {
      if (!v23)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 21, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

        goto LABEL_50;
      }
      if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BDB4308]))
      {
        v41 = v24;
        v42 = v23;
        v43 = v2;
        _ACLogSystem();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D8CB000, v25, OS_LOG_TYPE_DEFAULT, "\"Command message is deletion. Will also send to non-active paired devices.\", buf, 2u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "devices");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v45 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              if ((objc_msgSend(v31, "isActive") & 1) == 0)
              {
                v32 = (void *)IDSCopyIDForDevice();
                if (v32)
                {
                  objc_msgSend(*(id *)(a1 + 40), "_sendMessageData:toDestination:withPriority:bypassDuet:transportID:error:", *(_QWORD *)(a1 + 64), v32, v16, 0, 0, 0);
                }
                else
                {
                  _ACLogSystem();
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v57 = v31;
                    _os_log_error_impl(&dword_20D8CB000, v33, OS_LOG_TYPE_ERROR, "\"IDSCopyIDForDevice failed for inactive paired device: %@\", buf, 0xCu);
                  }

                }
              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
          }
          while (v28);
        }

        v23 = v42;
        v2 = v43;
        v24 = v41;
      }
      if (*(_BYTE *)(a1 + 88))
      {
        v34 = *(void **)(a1 + 40);
        v35 = *(_QWORD *)(a1 + 80);
        objc_msgSend(*(id *)(a1 + 56), "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "_enqueueCompletionHandler:forMessageWithInternalID:transportID:", v35, v36, v23);

LABEL_50:
        goto LABEL_51;
      }
      v38 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    }
    else
    {
      v38 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    }
    v38();
    goto LABEL_50;
  }
LABEL_15:

LABEL_44:
  _ACLogSystem();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D8CB000, v37, OS_LOG_TYPE_DEFAULT, "\"Attempted to send remote proxy message with no paired device to target\", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 20, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_51:

}

- (BOOL)_sendMessageData:(id)a3 toDestination:(id)a4 withPriority:(int64_t)a5 bypassDuet:(BOOL)a6 transportID:(id *)a7 error:(id *)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  IDSService *messageSendingService;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v9 = a6;
  v40 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  _ACLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v35 = v16;
    v36 = 2112;
    v37 = v14;
    v38 = 2112;
    v39 = v17;
    _os_log_impl(&dword_20D8CB000, v15, OS_LOG_TYPE_DEFAULT, "\"IDSService send request: %@ bytes to destination %@ with priority %@.\", buf, 0x20u);

  }
  messageSendingService = self->_messageSendingService;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = *MEMORY[0x24BE4FA78];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = *MEMORY[0x24BE4FA90];
  v33[0] = v20;
  v33[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = 0;
  v22 = -[IDSService sendData:toDestinations:priority:options:identifier:error:](messageSendingService, "sendData:toDestinations:priority:options:identifier:error:", v13, v19, a5, v21, &v31, &v30);
  v23 = v31;
  v24 = v30;

  _ACLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if ((v22 & 1) != 0)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v23;
      _os_log_impl(&dword_20D8CB000, v26, OS_LOG_TYPE_DEFAULT, "\"IDSService send request succeeded. Transport ID for sent message: %@\", buf, 0xCu);
    }

    v27 = v23;
    a8 = a7;
    if (!a7)
      goto LABEL_12;
LABEL_11:
    *a8 = objc_retainAutorelease(v27);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[ACRemoteDeviceProxy _sendMessageData:toDestination:withPriority:bypassDuet:transportID:error:].cold.1();

  v27 = v24;
  if (a8)
    goto LABEL_11;
LABEL_12:

  return v22;
}

- (void)_sendReplyForMessage:(id)a3 toDestination:(id)a4 withSuccess:(BOOL)a5 result:(id)a6 error:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  IDSService *messageSendingService;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  NSObject *v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v9 = a5;
  v34[2] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  +[ACRemoteDeviceMessage replyForMessage:withSuccess:result:error:](ACRemoteDeviceMessage, "replyForMessage:withSuccess:result:error:", v12, v9, a6, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    messageSendingService = self->_messageSendingService;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BE4FA90];
    v33[0] = *MEMORY[0x24BE4FA78];
    v33[1] = v18;
    v34[0] = MEMORY[0x24BDBD1C8];
    v34[1] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 0;
    v20 = -[IDSService sendData:toDestinations:priority:options:identifier:error:](messageSendingService, "sendData:toDestinations:priority:options:identifier:error:", v15, v17, 200, v19, &v26, &v25);
    v21 = v26;
    v22 = v25;

    _ACLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if ((v20 & 1) != 0)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v28 = v14;
        v29 = 2112;
        v30 = v12;
        v31 = 2112;
        v32 = v21;
        _os_log_impl(&dword_20D8CB000, v24, OS_LOG_TYPE_DEFAULT, "\"Reply %@ successfully sent in response to message %@. Transport ID: %@\", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[ACRemoteDeviceProxy _sendMessageData:toDestination:withPriority:bypassDuet:transportID:error:].cold.1();
    }

  }
  else
  {
    _ACLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[ACRemoteDeviceProxy _sendReplyForMessage:toDestination:withSuccess:result:error:].cold.1();
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  _ACLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACRemoteDeviceProxy service:account:identifier:didSendWithSuccess:error:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_7;
  }
  if (a6)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = v14;
      _os_log_impl(&dword_20D8CB000, v17, OS_LOG_TYPE_DEFAULT, "\"Success for message with Transport ID %@!\", (uint8_t *)&v25, 0xCu);
    }
LABEL_7:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[ACRemoteDeviceProxy service:account:identifier:didSendWithSuccess:error:].cold.2();

  -[ACRemoteDeviceProxy _dequeueCompletionHandlersForMessageWithTransportID:success:result:error:](self, "_dequeueCompletionHandlersForMessageWithTransportID:success:result:error:", v14, 0, 0, v15);
LABEL_11:

}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  NSObject *v11;
  ACRemoteDeviceMessage *v12;
  id v13;
  NSObject *v14;
  NSObject *p_super;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *commandProcessingQueue;
  _QWORD v28[4];
  ACRemoteDeviceMessage *v29;
  ACRemoteDeviceProxy *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  ACRemoteDeviceMessage *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  _ACLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ACRemoteDeviceProxy service:account:incomingData:fromID:context:].cold.3();

  if (v9)
  {
    v12 = -[ACRemoteDeviceMessage initWithData:]([ACRemoteDeviceMessage alloc], "initWithData:", v9);
    if (-[ACRemoteDeviceMessage isReply](v12, "isReply"))
    {
      -[ACRemoteDeviceMessage sentMessageIdentifier](v12, "sentMessageIdentifier");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      _ACLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      p_super = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v12;
          _os_log_impl(&dword_20D8CB000, p_super, OS_LOG_TYPE_DEFAULT, "\"Reply message succesfully received. %@\", buf, 0xCu);
        }

        v16 = -[ACRemoteDeviceMessage success](v12, "success");
        -[ACRemoteDeviceMessage result](v12, "result");
        p_super = objc_claimAutoreleasedReturnValue();
        -[ACRemoteDeviceMessage error](v12, "error");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACRemoteDeviceProxy _dequeueCompletionHandlersForMessageWithInternalID:success:result:error:](self, "_dequeueCompletionHandlersForMessageWithInternalID:success:result:error:", v13, v16, p_super, v17);

      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[ACRemoteDeviceProxy service:account:incomingData:fromID:context:].cold.2();
      }
    }
    else
    {
      _ACLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v12;
        _os_log_impl(&dword_20D8CB000, v25, OS_LOG_TYPE_DEFAULT, "\"Action message received. Dispatching to handler. %@\", buf, 0xCu);
      }

      v26 = (void *)os_transaction_create();
      commandProcessingQueue = self->_commandProcessingQueue;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __67__ACRemoteDeviceProxy_service_account_incomingData_fromID_context___block_invoke;
      v28[3] = &unk_24C7E2F00;
      v29 = v12;
      v30 = self;
      v31 = v10;
      v32 = v26;
      v13 = v26;
      dispatch_async(commandProcessingQueue, v28);

      p_super = &v29->super;
    }

  }
  else
  {
    _ACLogSystem();
    v12 = (ACRemoteDeviceMessage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
      -[ACRemoteDeviceProxy service:account:incomingData:fromID:context:].cold.1(&v12->super, v18, v19, v20, v21, v22, v23, v24);
  }

}

void __67__ACRemoteDeviceProxy_service_account_incomingData_fromID_context___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  dispatch_semaphore_t v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = dispatch_semaphore_create(0);
  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_20D8CB000, v3, OS_LOG_TYPE_DEFAULT, "\"Processing: %@\", buf, 0xCu);
  }

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  objc_msgSend(*(id *)(a1 + 32), "command");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__ACRemoteDeviceProxy_service_account_incomingData_fromID_context___block_invoke_22;
  v13[3] = &unk_24C7E2ED8;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  v14 = v9;
  v15 = v10;
  v16 = v11;
  v17 = *(id *)(a1 + 56);
  v18 = v2;
  v12 = v2;
  objc_msgSend(v5, "handleCommand:forAccount:options:completion:", v6, v7, v8, v13);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

void __67__ACRemoteDeviceProxy_service_account_incomingData_fromID_context___block_invoke_22(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(*(id *)(a1 + 32), "needsReply");
  _ACLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v12 = *(_QWORD *)(a1 + 32);
      v15 = 138412290;
      v16 = v12;
      _os_log_impl(&dword_20D8CB000, v10, OS_LOG_TYPE_DEFAULT, "\"Processed message that requires a reply. %@\", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_sendReplyForMessage:toDestination:withSuccess:result:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), a2, v7, v8);
  }
  else
  {
    if (v11)
    {
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_20D8CB000, v10, OS_LOG_TYPE_DEFAULT, "\"Processed message that does not need a reply. %@. Success: %@. Error: %@\", (uint8_t *)&v15, 0x20u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));

}

- (void)_enqueueCompletionHandler:(id)a3 forMessageWithInternalID:(id)a4 transportID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _ACLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ACRemoteDeviceProxy _enqueueCompletionHandler:forMessageWithInternalID:transportID:].cold.1();

  -[NSLock lock](self->_completionHandlersLock, "lock");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_internalMessageIDsByTransportID, "setObject:forKeyedSubscript:", v9, v10);

  -[NSMutableDictionary objectForKey:](self->_completionHandlersByInternalMessageID, "objectForKey:", v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = _Block_copy(v8);
  objc_msgSend(v12, "addObject:", v13);

  -[NSMutableDictionary setObject:forKey:](self->_completionHandlersByInternalMessageID, "setObject:forKey:", v12, v9);
  -[NSLock unlock](self->_completionHandlersLock, "unlock");

}

- (void)_dequeueCompletionHandlersForMessageWithInternalID:(id)a3 success:(BOOL)a4 result:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  -[NSLock lock](self->_completionHandlersLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_completionHandlersByInternalMessageID, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_completionHandlersByInternalMessageID, "removeObjectForKey:", v9);
  -[NSLock unlock](self->_completionHandlersLock, "unlock");
  _ACLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v14;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_20D8CB000, v13, OS_LOG_TYPE_DEFAULT, "\"Calling out to %@ pending completions about message with ID %@\", buf, 0x16u);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19) + 16))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19));
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

}

- (void)_dequeueCompletionHandlersForMessageWithTransportID:(id)a3 success:(BOOL)a4 result:(id)a5 error:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[NSLock lock](self->_completionHandlersLock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_internalMessageIDsByTransportID, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_completionHandlersLock, "unlock");
  if (v13)
  {
    -[ACRemoteDeviceProxy _dequeueCompletionHandlersForMessageWithInternalID:success:result:error:](self, "_dequeueCompletionHandlersForMessageWithInternalID:success:result:error:", v13, v8, v11, v12);
  }
  else
  {
    _ACLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ACRemoteDeviceProxy _dequeueCompletionHandlersForMessageWithTransportID:success:result:error:].cold.1();

  }
}

- (BOOL)_isValidCommandForOutgoingMessage:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = *MEMORY[0x24BDB4328];
  v5 = *MEMORY[0x24BDB4318];
  v6 = *MEMORY[0x24BDB4300];
  v7 = *MEMORY[0x24BDB4330];
  v8 = *MEMORY[0x24BDB4308];
  v9 = *MEMORY[0x24BDB4338];
  v10 = *MEMORY[0x24BDB4310];
  v11 = *MEMORY[0x24BDB4320];
  v12 = a3;
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v13, "containsObject:", v12);

  return v4;
}

- (int64_t)_priorityForMessageCarryingCommand:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB4328]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB4300]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB4310]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB4308]) & 1) != 0)
  {
    v4 = 200;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB4318]))
  {
    v4 = 200;
  }
  else
  {
    v4 = 100;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlersLock, 0);
  objc_storeStrong((id *)&self->_internalMessageIDsByTransportID, 0);
  objc_storeStrong((id *)&self->_completionHandlersByInternalMessageID, 0);
  objc_storeStrong((id *)&self->_remoteCommandHandler, 0);
  objc_storeStrong((id *)&self->_commandProcessingQueue, 0);
  objc_storeStrong((id *)&self->_messageSendingQueue, 0);
  objc_storeStrong((id *)&self->_messageSendingService, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D8CB000, log, OS_LOG_TYPE_DEBUG, "\"Initializing ACRemoteDeviceProxy...\", v1, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)sendCommand:withAccount:options:completion:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[7];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136381443;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_20D8CB000, v2, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@, %@)", (uint8_t *)v3, 0x26u);
}

void __66__ACRemoteDeviceProxy_sendCommand_withAccount_options_completion___block_invoke_15_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_20D8CB000, v1, OS_LOG_TYPE_DEBUG, "\"Resolved target remote device to: %@ from btUUID: %@\", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_sendMessageData:toDestination:withPriority:bypassDuet:transportID:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"IDSService send request failed. Error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sendReplyForMessage:toDestination:withSuccess:result:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"No data for reply to message %@!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)service:(uint64_t)a3 account:(uint64_t)a4 identifier:(uint64_t)a5 didSendWithSuccess:(uint64_t)a6 error:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, a1, a3, "\"IDS callback did not provide a message identifier!\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)service:account:identifier:didSendWithSuccess:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Message with Transport ID %@ could not be sent!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)service:(uint64_t)a3 account:(uint64_t)a4 incomingData:(uint64_t)a5 fromID:(uint64_t)a6 context:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, a1, a3, "\"IDS is calling us back with no data!\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)service:account:incomingData:fromID:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Reply received without a sentMessageIdentifier! %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)service:account:incomingData:fromID:context:.cold.3()
{
  os_log_t v0;
  _DWORD v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136380931;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)((char *)&v1[3] + 2) = 265;
  _os_log_debug_impl(&dword_20D8CB000, v0, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called", (uint8_t *)v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)_enqueueCompletionHandler:forMessageWithInternalID:transportID:.cold.1()
{
  os_log_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136381187;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_20D8CB000, v0, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@)", (uint8_t *)v1, 0x1Cu);
}

- (void)_dequeueCompletionHandlersForMessageWithTransportID:success:result:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"No internal identifier was found for message with transport ID: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
