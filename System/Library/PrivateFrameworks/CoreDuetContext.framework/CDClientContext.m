@implementation CDClientContext

uint64_t __56___CDClientContext_handleContextualChange_info_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t result;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "informativeCallback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "informativeCallback");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v5 = (*(unsigned __int8 (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    if ((v5 & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 56), "cleanupInternalReferencesToRegistration:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

void __35___CDClientContext_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0D37D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface_clientInterface;
  clientInterface_clientInterface = v0;

  v2 = (void *)MEMORY[0x1E0C99E20];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v4);

  objc_msgSend((id)clientInterface_clientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleContextualChange_info_handler_, 0, 0);
  objc_msgSend((id)clientInterface_clientInterface, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_handleContextualChange_info_handler_, 1, 0);
  objc_msgSend((id)clientInterface_clientInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleRegistrationCompleted_handler_, 0, 0);

}

void __35___CDClientContext_serverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0D45F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serverInterface_serverInterface;
  serverInterface_serverInterface = v0;

  v2 = (void *)serverInterface_serverInterface;
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_setObject_forPath_handler_, 0, 0);

  objc_msgSend((id)serverInterface_serverInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setObject_forPath_handler_, 1, 0);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", objc_opt_class());
  v15 = (id)objc_claimAutoreleasedReturnValue();
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unionSet:", v4);

  objc_msgSend(v15, "addObject:", objc_opt_class());
  objc_msgSend((id)serverInterface_serverInterface, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_valuesForPaths_handler_, 0, 1);
  v5 = (void *)serverInterface_serverInterface;
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_addObjects_andRemoveObjects_forArrayAtPath_handler_, 0, 0);

  v7 = (void *)serverInterface_serverInterface;
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_addObjects_andRemoveObjects_forArrayAtPath_handler_, 1, 0);

  v9 = (void *)serverInterface_serverInterface;
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_removeObjectsMatchingPredicate_fromArrayAtPath_handler_, 0, 1);

  objc_msgSend((id)serverInterface_serverInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_propertiesOfPath_handler_, 0, 0);
  v11 = (void *)serverInterface_serverInterface;
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_propertiesOfPath_handler_, 0, 1);

  objc_msgSend((id)serverInterface_serverInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_propertiesOfPath_handler_, 1, 1);
  v13 = (void *)serverInterface_serverInterface;
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_setObject_lastModifiedDate_forContextualKeyPath_handler_, 0, 0);

  objc_msgSend((id)serverInterface_serverInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setObject_lastModifiedDate_forContextualKeyPath_handler_, 1, 0);
  objc_msgSend((id)serverInterface_serverInterface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setObject_lastModifiedDate_forContextualKeyPath_handler_, 2, 0);

}

void __31___CDClientContext_userContext__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEndpoint:", 0);
  v1 = (void *)userContext_context;
  userContext_context = v0;

}

void __37___CDClientContext_currentConnection__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "unprotectedSetUpXPCConnectionWithEndpoint:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __37___CDClientContext_initWithEndpoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unprotectedSetUpXPCConnectionWithEndpoint:", *(_QWORD *)(a1 + 40));
}

void __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  v4 = *(void **)(a1 + 56);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      v6 = *(NSObject **)(a1 + 48);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 56);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_124;
    block[3] = &unk_1E26D52B0;
    v8 = v4;
    dispatch_async(v6, block);
    if (!v5)

  }
}

void __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_2(&dword_18DD73000, v0, v1, "error getting value for %@ : %@");
  OUTLINED_FUNCTION_1();
}

void __62___CDClientContext_unprotectedSetUpXPCConnectionWithEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (const __CFString *)*((_QWORD *)WeakRetained + 6);
      if (!v4)
        v4 = CFSTR("com.apple.coreduetd.context");
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_18DD73000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ interrupted", (uint8_t *)&v5, 0xCu);
    }
    *((_BYTE *)WeakRetained + 8) = 1;
  }

}

void __43___CDClientContext_subscribeToEventStreams__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  _QWORD handler[4];
  id v8;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __43___CDClientContext_subscribeToEventStreams__block_invoke_cold_1();
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v3 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __43___CDClientContext_subscribeToEventStreams__block_invoke_112;
  handler[3] = &unk_1E26D51D0;
  objc_copyWeak(&v8, &location);
  xpc_set_event_stream_handler("com.apple.coreduetcontext.mdcs_events", v2, handler);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __43___CDClientContext_subscribeToEventStreams__block_invoke_cold_1();
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __43___CDClientContext_subscribeToEventStreams__block_invoke_114;
  v5[3] = &unk_1E26D51D0;
  objc_copyWeak(&v6, &location);
  xpc_set_event_stream_handler("com.apple.coreduetcontext.client_event_stream", v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __40___CDClientContext_defaultCallbackQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.cdclientcontext.callbackQueue", v2);
  v1 = (void *)defaultCallbackQueue_callbackQueue;
  defaultCallbackQueue_callbackQueue = (uint64_t)v0;

}

void __43___CDClientContext_subscribeToEventStreams__block_invoke_112(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleMDCSEvent:", v3);

}

void __43___CDClientContext_subscribeToEventStreams__block_invoke_114(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleNotificationEvent:", v3);

}

void __47___CDClientContext_handleFetchPropertiesEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 96);
  if (v3)
  {
    if (os_log_type_enabled(*(os_log_t *)(v4 + 96), OS_LOG_TYPE_ERROR))
      __47___CDClientContext_handleFetchPropertiesEvent___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(*(os_log_t *)(v4 + 96), OS_LOG_TYPE_DEBUG))
  {
    __47___CDClientContext_handleFetchPropertiesEvent___block_invoke_cold_1(v5);
  }
  +[_CDXPCCodecs fetchPropertiesReplyWithEvent:error:](_CDXPCContextCodecs, "fetchPropertiesReplyWithEvent:error:", *(_QWORD *)(a1 + 40), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    xpc_dictionary_send_reply();

}

void __68___CDClientContext_handleSubscribeToContextValueNotificationsEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  +[_CDXPCContextCodecs subscribeToContextValueNotificationsReplyWithEvent:error:](_CDXPCContextCodecs, "subscribeToContextValueNotificationsReplyWithEvent:error:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    xpc_dictionary_send_reply();
    v2 = v3;
  }

}

void __72___CDClientContext_handleUnsubscribeFromContextValueNotificationsEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  +[_CDXPCContextCodecs unsubscribeFromContextValueNotificationsReplyWithEvent:error:](_CDXPCContextCodecs, "unsubscribeFromContextValueNotificationsReplyWithEvent:error:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    xpc_dictionary_send_reply();
    v2 = v3;
  }

}

void __41___CDClientContext_handleKeepAliveEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  +[_CDXPCCodecs keepAliveReplyWithEvent:error:](_CDXPCContextCodecs, "keepAliveReplyWithEvent:error:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    xpc_dictionary_send_reply();
    v2 = v3;
  }

}

void __54___CDClientContext_handleRequestActivateDevicesEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  +[_CDXPCCodecs requestActivateDevicesReplyWithEvent:error:](_CDXPCContextCodecs, "requestActivateDevicesReplyWithEvent:error:", *(_QWORD *)(a1 + 32), a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_send_reply();

}

void __52___CDClientContext_hasKnowledgeOfContextualKeyPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __52___CDClientContext_hasKnowledgeOfContextualKeyPath___block_invoke_cold_1();

}

uint64_t __52___CDClientContext_hasKnowledgeOfContextualKeyPath___block_invoke_123(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __76___CDClientContext_objectForContextualKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_124(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _CDContextValue *v7;
  _CDContextValue *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(_CDContextValue);
  v8 = v7;
  if (v5)
  {
    -[_CDContextValue setValue:](v7, "setValue:", v5);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = v5;
    v11 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDContextValue setValue:](v8, "setValue:", v12);

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;
  }

  -[_CDContextValue setLastModifiedDate:](v8, "setLastModifiedDate:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setCachedValueIfClientHasRegistrations:forKeyPath:", v8, *(_QWORD *)(a1 + 40));
  v14 = *(void **)(a1 + 56);
  if (v14)
  {
    v15 = *(_QWORD *)(a1 + 48);
    if (v15)
    {
      v16 = *(NSObject **)(a1 + 48);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 56);
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2_127;
    v19[3] = &unk_1E26D5300;
    v17 = v14;
    v18 = *(_QWORD *)(a1 + 64);
    v20 = v17;
    v21 = v18;
    dispatch_async(v16, v19);
    if (!v15)

  }
}

uint64_t __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2_127(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __86___CDClientContext_lastModifiedDateForContextualKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  v4 = *(void **)(a1 + 56);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      v6 = *(NSObject **)(a1 + 48);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 56);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_129;
    block[3] = &unk_1E26D52B0;
    v8 = v4;
    dispatch_async(v6, block);
    if (!v5)

  }
}

uint64_t __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "lastModifiedDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  _CDContextValue *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a2;
  v8 = objc_alloc_init(_CDContextValue);
  -[_CDContextValue setValue:](v8, "setValue:", v7);

  -[_CDContextValue setLastModifiedDate:](v8, "setLastModifiedDate:", v6);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  objc_msgSend(*(id *)(a1 + 32), "setCachedValueIfClientHasRegistrations:forKeyPath:", v8, *(_QWORD *)(a1 + 40));
  v9 = *(void **)(a1 + 56);
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
    {
      v11 = *(NSObject **)(a1 + 48);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 56);
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_5;
    v14[3] = &unk_1E26D5300;
    v12 = v9;
    v13 = *(_QWORD *)(a1 + 64);
    v15 = v12;
    v16 = v13;
    dispatch_async(v11, v14);
    if (!v10)

  }
}

uint64_t __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __37___CDClientContext_registerCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  os_activity_scope_state_s state;

  v2 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext re-register", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37___CDClientContext_registerCallback___block_invoke_2;
    v6[3] = &unk_1E26D5378;
    v6[4] = v5;
    v7 = WeakRetained;
    objc_msgSend(v5, "retryTimes:block:", 3, v6);

  }
}

uint64_t __37___CDClientContext_registerCallback___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(*(id *)(a1 + 32), "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37___CDClientContext_registerCallback___block_invoke_3;
  v8[3] = &unk_1E26D5350;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v10 = &v11;
  v8[4] = v3;
  v9 = v4;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerCallback:", *(_QWORD *)(a1 + 40));

  v6 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v6;
}

void __37___CDClientContext_registerCallback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __37___CDClientContext_registerCallback___block_invoke_3_cold_1(a1, v4);
  }

}

uint64_t __37___CDClientContext_registerCallback___block_invoke_133(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(*(id *)(a1 + 32), "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37___CDClientContext_registerCallback___block_invoke_2_134;
  v8[3] = &unk_1E26D5350;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v10 = &v11;
  v8[4] = v3;
  v9 = v4;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerCallback:", *(_QWORD *)(a1 + 40));

  v6 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v6;
}

void __37___CDClientContext_registerCallback___block_invoke_2_134(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __37___CDClientContext_registerCallback___block_invoke_2_134_cold_1(a1, v4);
  }

}

void __38___CDClientContext_evaluatePredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __38___CDClientContext_evaluatePredicate___block_invoke_cold_1();

}

uint64_t __38___CDClientContext_evaluatePredicate___block_invoke_135(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __80___CDClientContext_setObject_forContextualKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  v4 = *(void **)(a1 + 64);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v6 = *(NSObject **)(a1 + 56);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 64);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_136;
    block[3] = &unk_1E26D52B0;
    v8 = v4;
    dispatch_async(v6, block);
    if (!v5)

  }
}

uint64_t __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_136(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_137(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = *(NSObject **)(a1 + 32);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "defaultCallbackQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v2 = *(void **)(a1 + 56);
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2;
    v9[3] = &unk_1E26D5418;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 64);
    v11 = v6;
    v12 = v7;
    v8 = *(void **)(a1 + 48);
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = v8;
    dispatch_async(v5, v9);
    if (!v4)

  }
}

void __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(a1[6] + 16))();
  v2 = *(NSObject **)(a1[4] + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[5];
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18DD73000, v2, OS_LOG_TYPE_INFO, "Finished completion handler after setting object for key path: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __77___CDClientContext_addObjects_toArrayAtKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  v4 = *(void **)(a1 + 64);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v6 = *(NSObject **)(a1 + 56);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 64);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_138;
    block[3] = &unk_1E26D52B0;
    v8 = v4;
    dispatch_async(v6, block);
    if (!v5)

  }
}

uint64_t __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_138(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_139(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = *(NSObject **)(a1 + 32);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "defaultCallbackQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v2 = *(void **)(a1 + 56);
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2;
    v9[3] = &unk_1E26D5418;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 64);
    v11 = v6;
    v12 = v7;
    v8 = *(void **)(a1 + 48);
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = v8;
    dispatch_async(v5, v9);
    if (!v4)

  }
}

void __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(a1[6] + 16))();
  v2 = *(NSObject **)(a1[4] + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[5];
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18DD73000, v2, OS_LOG_TYPE_INFO, "Finished completion handler after adding objects to key path: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __82___CDClientContext_removeObjects_fromArrayAtKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  v4 = *(void **)(a1 + 64);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v6 = *(NSObject **)(a1 + 56);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 64);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_140;
    block[3] = &unk_1E26D52B0;
    v8 = v4;
    dispatch_async(v6, block);
    if (!v5)

  }
}

uint64_t __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_140(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_141(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_18DD73000, v3, OS_LOG_TYPE_INFO, "Done removing object from keypath: %@", buf, 0xCu);
  }
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      v7 = *(NSObject **)(a1 + 48);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 56);
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_142;
    v11[3] = &unk_1E26D5418;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 64);
    v13 = v8;
    v14 = v9;
    v10 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    dispatch_async(v7, v11);
    if (!v6)

  }
}

void __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_142(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(a1[6] + 16))();
  v2 = *(NSObject **)(a1[4] + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[5];
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18DD73000, v2, OS_LOG_TYPE_INFO, "Finished completion handler after removing object from keypath: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __99___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  v4 = *(void **)(a1 + 64);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v6 = *(NSObject **)(a1 + 56);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 64);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_143;
    block[3] = &unk_1E26D52B0;
    v8 = v4;
    dispatch_async(v6, block);
    if (!v5)

  }
}

uint64_t __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_143(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_144(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_18DD73000, v5, OS_LOG_TYPE_INFO, "Done removing objects matching predicate from keypath: %@", buf, 0xCu);
  }
  v7 = *(void **)(a1 + 56);
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      v9 = *(NSObject **)(a1 + 48);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 56);
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_145;
    v13[3] = &unk_1E26D5490;
    v17 = v7;
    v10 = v4;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v14 = v10;
    v15 = v11;
    v16 = v12;
    dispatch_async(v9, v13);
    if (!v8)

  }
}

void __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_145(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(a1[7] + 16))();
  v2 = *(NSObject **)(a1[5] + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[6];
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18DD73000, v2, OS_LOG_TYPE_INFO, "Finished completion handler after removing objects matching predicate from keypath: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __96___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  v4 = *(void **)(a1 + 72);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 64);
    if (v5)
    {
      v6 = *(NSObject **)(a1 + 64);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 72);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_147;
    block[3] = &unk_1E26D52B0;
    v8 = v4;
    dispatch_async(v6, block);
    if (!v5)

  }
}

uint64_t __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_148(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_18DD73000, v3, OS_LOG_TYPE_INFO, "Done adding to and removing from keypath: %@", buf, 0xCu);
  }
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      v7 = *(NSObject **)(a1 + 48);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 56);
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_149;
    v11[3] = &unk_1E26D5418;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 64);
    v13 = v8;
    v14 = v9;
    v10 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    dispatch_async(v7, v11);
    if (!v6)

  }
}

void __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_149(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(a1[6] + 16))();
  v2 = *(NSObject **)(a1[4] + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[5];
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18DD73000, v2, OS_LOG_TYPE_INFO, "Finished completion handler after adding to and removing from keypath: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __66___CDClientContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __66___CDClientContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke_cold_1();

}

void __66___CDClientContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke_150(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __67___CDClientContext_valuesForKeyPaths_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v6 = *(NSObject **)(a1 + 40);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultCallbackQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 48);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_151;
    block[3] = &unk_1E26D52B0;
    v8 = v4;
    dispatch_async(v6, block);
    if (!v5)

  }
}

uint64_t __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_151(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v7 = *(NSObject **)(a1 + 32);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "defaultCallbackQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 56);
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_3;
    v11[3] = &unk_1E26D5418;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 64);
    v13 = v8;
    v14 = v9;
    v10 = *(void **)(a1 + 48);
    v11[4] = *(_QWORD *)(a1 + 40);
    v12 = v10;
    dispatch_async(v7, v11);
    if (!v6)

  }
}

void __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_3(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(a1[6] + 16))();
  v2 = *(NSObject **)(a1[4] + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[5];
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18DD73000, v2, OS_LOG_TYPE_INFO, "Finished completion handler after getting values for key paths: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __68___CDClientContext_setObject_lastModifiedDate_forContextualKeyPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __68___CDClientContext_setObject_lastModifiedDate_forContextualKeyPath___block_invoke_cold_1();

}

uint64_t __68___CDClientContext_setObject_lastModifiedDate_forContextualKeyPath___block_invoke_153(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __75___CDClientContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __75___CDClientContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke_cold_1();

}

void __77___CDClientContext_deactivateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR))
    __77___CDClientContext_deactivateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke_cold_1();

}

void __43___CDClientContext_subscribeToEventStreams__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_18DD73000, MEMORY[0x1E0C81028], v0, "Registering xpc_set_event_stream_handler(\"%s\", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __47___CDClientContext_handleFetchPropertiesEvent___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18DD73000, log, OS_LOG_TYPE_DEBUG, "Fetched properties", v1, 2u);
}

void __47___CDClientContext_handleFetchPropertiesEvent___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "Failed to fetch properties: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52___CDClientContext_hasKnowledgeOfContextualKeyPath___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_2(&dword_18DD73000, v0, v1, "error checking knowledge of key path %@ : %@");
  OUTLINED_FUNCTION_1();
}

void __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_2(&dword_18DD73000, v0, v1, "error getting last modified date for key %@ : %@");
  OUTLINED_FUNCTION_1();
}

void __37___CDClientContext_registerCallback___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_16(a1, a2);
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_18DD73000, v3, v5, "Error re-registering %@ (%@)", v6);

  OUTLINED_FUNCTION_1_1();
}

void __37___CDClientContext_registerCallback___block_invoke_2_134_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_16(a1, a2);
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_18DD73000, v3, v5, "Error registering %@ (%@)", v6);

  OUTLINED_FUNCTION_1_1();
}

void __38___CDClientContext_evaluatePredicate___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_2(&dword_18DD73000, v0, v1, "error evaluating predicate %@ : %@");
  OUTLINED_FUNCTION_1();
}

void __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4(&dword_18DD73000, v0, v1, "error in setObject %@ for keyPath %@ : %@");
  OUTLINED_FUNCTION_12();
}

void __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4(&dword_18DD73000, v0, v1, "error in addObjects %@ for keyPath %@ : %@");
  OUTLINED_FUNCTION_12();
}

void __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4(&dword_18DD73000, v0, v1, "error in removeObjects %@ for keyPath %@ : %@");
  OUTLINED_FUNCTION_12();
}

void __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4(&dword_18DD73000, v0, v1, "error in removeObjectsMatchingPredicate %@ for keyPath %@ : %@");
  OUTLINED_FUNCTION_12();
}

void __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_0(&dword_18DD73000, v0, v1, "error in adding: %@ removing: %@ for keyPath %@ : %@");
}

void __66___CDClientContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "error getting values for key paths: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "error getting values for key paths : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68___CDClientContext_setObject_lastModifiedDate_forContextualKeyPath___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_0(&dword_18DD73000, v0, v1, "error in setObject %@ lastModifiedDate %@ for keyPath %@ : %@");
}

void __75___CDClientContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "error activating devices: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77___CDClientContext_deactivateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "error deactivating devices: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
