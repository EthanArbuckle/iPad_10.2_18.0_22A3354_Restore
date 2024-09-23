@implementation SGMessagesSuggestionsService

- (SGMessagesSuggestionsService)init
{
  SGMessagesSuggestionsService *v2;
  SGMessagesDaemonConnection *v3;
  SGMessagesDaemonConnection *messagesDaemonConnection;
  uint64_t v5;
  NSMutableDictionary *previousMessages;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGMessagesSuggestionsService;
  v2 = -[SGSuggestionsService initWithMachServiceName:protocol:](&v8, sel_initWithMachServiceName_protocol_, CFSTR("com.apple.suggestd.messages"), &unk_1EE66AE50);
  if (v2)
  {
    v3 = -[SGMessagesDaemonConnection initWithDaemonConnectionFuture:]([SGMessagesDaemonConnection alloc], "initWithDaemonConnectionFuture:", v2->super._daemonConnectionFuture);
    messagesDaemonConnection = v2->_messagesDaemonConnection;
    v2->_messagesDaemonConnection = v3;

    v5 = objc_opt_new();
    previousMessages = v2->_previousMessages;
    v2->_previousMessages = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)setManagerForTesting:(id)a3
{
  -[SGMessagesDaemonConnection setManagerForTesting:](self->_messagesDaemonConnection, "setManagerForTesting:", a3);
}

- (void)setupContextIfNeededForConversation:(id)a3
{
  id v4;
  void *v5;
  SGCircularBufferArray *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_previousMessages, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[SGCircularBufferArray initWithCapacity:]([SGCircularBufferArray alloc], "initWithCapacity:", 10);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[SGMessagesSuggestionsService delegate](self, "delegate", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestionsService:needsContextForConversationIdentifier:numberOfMessagesNeeded:", self, v4, 10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          -[SGCircularBufferArray addObject:](v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_previousMessages, "setObject:forKeyedSubscript:", v6, v4);
  }

}

- (void)sendContextForMessage:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "domainIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessagesSuggestionsService.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conversationIdentifier"));

  }
  -[SGMessagesSuggestionsService setupContextIfNeededForConversation:](self, "setupContextIfNeededForConversation:", v5);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = (void *)v5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_previousMessages, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[SGMessagesDaemonConnection remoteSuggestionManagerWithErrorHandler:](self->_messagesDaemonConnection, "remoteSuggestionManagerWithErrorHandler:", &__block_literal_global_8117);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "suggestionsFromMessage:options:completionHandler:", v11, 3, &__block_literal_global_91);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (BOOL)isMessageEligibleForSuggestions:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  objc_msgSend(a3, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentCreationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5 > -3600.0;

  return v6;
}

- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  SGMessagesDaemonConnection *messagesDaemonConnection;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessagesSuggestionsService.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  if (-[SGMessagesSuggestionsService isMessageEligibleForSuggestions:](self, "isMessageEligibleForSuggestions:", v9))
  {
    -[SGMessagesSuggestionsService sendContextForMessage:](self, "sendContextForMessage:", v9);
    messagesDaemonConnection = self->_messagesDaemonConnection;
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__SGMessagesSuggestionsService_suggestionsFromMessage_options_completionHandler___block_invoke;
    v18[3] = &unk_1E47626D8;
    v13 = v10;
    v19 = v13;
    -[SGMessagesDaemonConnection remoteSuggestionManagerWithErrorHandler:](messagesDaemonConnection, "remoteSuggestionManagerWithErrorHandler:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __81__SGMessagesSuggestionsService_suggestionsFromMessage_options_completionHandler___block_invoke_2;
    v16[3] = &unk_1E4762700;
    v17 = v13;
    objc_msgSend(v14, "suggestionsFromMessage:options:completionHandler:", v9, a4, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  }

}

- (void)harvestedSuggestionsFromMessage:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  SGMessagesDaemonConnection *messagesDaemonConnection;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessagesSuggestionsService.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  if (-[SGMessagesSuggestionsService isMessageEligibleForSuggestions:](self, "isMessageEligibleForSuggestions:", v11))
  {
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleIdentifier");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessagesSuggestionsService.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

        v14 = 0;
      }
    }
    messagesDaemonConnection = self->_messagesDaemonConnection;
    v17 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __107__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler___block_invoke;
    v24[3] = &unk_1E47626D8;
    v18 = v13;
    v25 = v18;
    -[SGMessagesDaemonConnection remoteSuggestionManagerWithErrorHandler:](messagesDaemonConnection, "remoteSuggestionManagerWithErrorHandler:", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __107__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler___block_invoke_2;
    v22[3] = &unk_1E4762700;
    v23 = v18;
    objc_msgSend(v19, "harvestedSuggestionsFromMessage:bundleIdentifier:options:completionHandler:", v11, v14, a5, v22);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v13 + 2))(v13, 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  }

}

- (void)harvestedSuggestionsFromMessage:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  SGMessagesDaemonConnection *messagesDaemonConnection;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessagesSuggestionsService.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  if (-[SGMessagesSuggestionsService isMessageEligibleForSuggestions:](self, "isMessageEligibleForSuggestions:", v11))
  {
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleIdentifier");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessagesSuggestionsService.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

        v14 = 0;
      }
    }
    messagesDaemonConnection = self->_messagesDaemonConnection;
    v17 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __104__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion___block_invoke;
    v24[3] = &unk_1E47626D8;
    v18 = v13;
    v25 = v18;
    -[SGMessagesDaemonConnection remoteSuggestionManagerWithErrorHandler:](messagesDaemonConnection, "remoteSuggestionManagerWithErrorHandler:", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __104__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion___block_invoke_2;
    v22[3] = &unk_1E4762728;
    v23 = v18;
    objc_msgSend(v19, "harvestedSuggestionsFromMessage:bundleIdentifier:options:withCompletion:", v11, v14, a5, v22);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }

}

- (void)harvestedSuggestionsFromMessages:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  SGMessagesDaemonConnection *messagesDaemonConnection;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessagesSuggestionsService.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messages"));

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessagesSuggestionsService.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  messagesDaemonConnection = self->_messagesDaemonConnection;
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __91__SGMessagesSuggestionsService_harvestedSuggestionsFromMessages_options_completionHandler___block_invoke;
  v22[3] = &unk_1E47626D8;
  v15 = v10;
  v23 = v15;
  -[SGMessagesDaemonConnection remoteSuggestionManagerWithErrorHandler:](messagesDaemonConnection, "remoteSuggestionManagerWithErrorHandler:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __91__SGMessagesSuggestionsService_harvestedSuggestionsFromMessages_options_completionHandler___block_invoke_2;
  v20[3] = &unk_1E4762700;
  v21 = v15;
  v17 = v15;
  objc_msgSend(v16, "harvestedSuggestionsFromMessages:bundleIdentifier:options:completionHandler:", v9, v12, a4, v20);

}

- (SGMessagesSuggestionsServiceDelegate)delegate
{
  return (SGMessagesSuggestionsServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SGMessagesDaemonConnection)messagesDaemonConnection
{
  return (SGMessagesDaemonConnection *)objc_getProperty(self, a2, 136, 1);
}

- (void)setMessagesDaemonConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSMutableDictionary)previousMessages
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPreviousMessages:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousMessages, 0);
  objc_storeStrong((id *)&self->_messagesDaemonConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __91__SGMessagesSuggestionsService_harvestedSuggestionsFromMessages_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__SGMessagesSuggestionsService_harvestedSuggestionsFromMessages_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response3");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, void *, void *))(v2 + 16))(v2, v7, v4, v5, v6);
}

uint64_t __104__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

uint64_t __107__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __107__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "error");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v6, v4, v5);
}

uint64_t __81__SGMessagesSuggestionsService_suggestionsFromMessage_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__SGMessagesSuggestionsService_suggestionsFromMessage_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response3");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, void *, void *))(v2 + 16))(v2, v7, v4, v5, v6);
}

@end
