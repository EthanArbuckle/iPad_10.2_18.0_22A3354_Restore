@implementation AFConversationStore

- (AFConversationStore)init
{
  AFConversationStore *v2;
  uint64_t v3;
  NSMutableDictionary *conversationsByIdentifier;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AFConversationStore;
  v2 = -[AFConversationStore init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    conversationsByIdentifier = v2->_conversationsByIdentifier;
    v2->_conversationsByIdentifier = (NSMutableDictionary *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("AFConversationStore", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)_registerConversation:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AFConversationStore _conversationsByIdentifier](self, "_conversationsByIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)saveConversation:(id)a3 withIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__AFConversationStore_saveConversation_withIdentifier_completionBlock___block_invoke;
  v15[3] = &unk_1E3A346A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)fetchConversationWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AFConversationStore_fetchConversationWithIdentifier_completionBlock___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)removeConversationWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AFConversationStore_removeConversationWithIdentifier_completionBlock___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (NSMutableDictionary)_conversationsByIdentifier
{
  return self->_conversationsByIdentifier;
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
  objc_storeStrong((id *)&self->_conversationsByIdentifier, 0);
}

void __72__AFConversationStore_removeConversationWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_conversationsByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  AFFileURLForConversationWithIdentifier(*(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v8 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v8);
  v6 = v8;

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v5, v6);

}

void __71__AFConversationStore_fetchConversationWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  AFConversation *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 found;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "_conversationsByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    AFFileURLForConversationWithIdentifier(*(void **)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v5, 1, &v16);
    v4 = v16;
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeConversationWithIdentifier:completionBlock:", *(_QWORD *)(a1 + 40), 0);
      v15 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, &v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v15;

      if (v7)
      {
        v9 = -[AFConversation initWithPropertyListRepresentation:]([AFConversation alloc], "initWithPropertyListRepresentation:", v7);
        v3 = v9;
        if (v9)
        {
          -[AFConversation lastItem](v9, "lastItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "_setLastRestoredItem:", v10);

          objc_msgSend(*(id *)(a1 + 32), "saveConversation:withIdentifier:completionBlock:", v3, *(_QWORD *)(a1 + 40), 0);
          objc_msgSend(*(id *)(a1 + 32), "_registerConversation:withIdentifier:", v3, *(_QWORD *)(a1 + 40));
        }
        else
        {
          +[AFConversationError errorWithCode:localizedFailureReason:](AFConversationError, "errorWithCode:localizedFailureReason:", 100, CFSTR("Unable to decode conversation from property list"));
          v11 = objc_claimAutoreleasedReturnValue();

          v8 = (id)v11;
        }
      }
      else
      {
        v3 = 0;
      }

      v4 = v8;
    }
    else
    {
      v3 = 0;
    }

  }
  found = AFIsFileNotFoundError(v4);
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
  {
    if (found)
      v14 = 0;
    else
      v14 = v4;
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v3, v14);
  }

}

void __71__AFConversationStore_saveConversation_withIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_registerConversation:withIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "propertyListRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (v3)
  {
    AFFileURLForConversationWithIdentifier(*(void **)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v4;
    v6 = objc_msgSend(v3, "writeToURL:options:error:", v5, 805306369, &v14);
    v7 = v14;

    if ((_DWORD)v6)
    {
      v8 = *MEMORY[0x1E0C999D8];
      v13 = v7;
      v9 = objc_msgSend(v5, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v8, &v13);
      v4 = v13;

      if ((v9 & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        v10 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v17 = "-[AFConversationStore saveConversation:withIdentifier:completionBlock:]_block_invoke";
          v18 = 2112;
          v19 = v5;
          _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s Unable to exclude %@ from backup; deleting.",
            buf,
            0x16u);
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeItemAtURL:error:", v5, 0);

        v6 = 0;
      }
    }
    else
    {
      v4 = v7;
    }

  }
  else
  {
    v6 = 0;
  }
  v12 = *(_QWORD *)(a1 + 56);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, v6, v4);

}

@end
