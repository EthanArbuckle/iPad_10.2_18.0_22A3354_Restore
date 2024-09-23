@implementation IPTextMessageConversation

- (IPTextMessageConversation)init
{
  IPTextMessageConversation *v2;
  uint64_t v3;
  NSMutableDictionary *messageByMessageIdentifierDictionary;
  uint64_t v5;
  NSMutableDictionary *eventsByMessageIdentifierDictionary;
  IPCircularBufferArray *v7;
  IPCircularBufferArray *lastMessages;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IPTextMessageConversation;
  v2 = -[IPTextMessageConversation init](&v10, sel_init);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 100);
  messageByMessageIdentifierDictionary = v2->_messageByMessageIdentifierDictionary;
  v2->_messageByMessageIdentifierDictionary = (NSMutableDictionary *)v3;

  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 100);
  eventsByMessageIdentifierDictionary = v2->_eventsByMessageIdentifierDictionary;
  v2->_eventsByMessageIdentifierDictionary = (NSMutableDictionary *)v5;

  v7 = -[IPCircularBufferArray initWithCapacity:]([IPCircularBufferArray alloc], "initWithCapacity:", 30);
  lastMessages = v2->_lastMessages;
  v2->_lastMessages = v7;

  return v2;
}

- (NSArray)allMessages
{
  IPTextMessageConversation *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[IPCircularBufferArray allObjects](v2->_lastMessages, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return (NSArray *)v4;
}

- (void)addMessage:(id)a3
{
  id v4;
  IPTextMessageConversation *v5;
  void *v6;
  void *v7;
  IPCircularBufferArray *lastMessages;
  _QWORD v9[5];
  _QWORD v10[5];
  IPTextMessageConversation *v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "setType:", IPMessageTypeShortMessage);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_messageByMessageIdentifierDictionary, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_messageByMessageIdentifierDictionary, "setObject:forKeyedSubscript:", v4, v6);
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = __Block_byref_object_copy__2;
    v10[4] = __Block_byref_object_dispose__2;
    v11 = v5;
    lastMessages = v11->_lastMessages;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40__IPTextMessageConversation_addMessage___block_invoke;
    v9[3] = &unk_24DAA5648;
    v9[4] = v10;
    -[IPCircularBufferArray addObject:completionHandler:](lastMessages, "addObject:completionHandler:", v4, v9);
    _Block_object_dispose(v10, 8);

  }
  objc_sync_exit(v5);

}

void __40__IPTextMessageConversation_addMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    objc_msgSend(a2, "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "messageByMessageIdentifierDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v5);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventsByMessageIdentifierDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

  }
}

- (void)reset
{
  IPTextMessageConversation *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](obj->_messageByMessageIdentifierDictionary, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](obj->_eventsByMessageIdentifierDictionary, "removeAllObjects");
  -[IPCircularBufferArray removeAllObjects](obj->_lastMessages, "removeAllObjects");
  objc_sync_exit(obj);

}

- (id)messageForIdentifier:(id)a3
{
  id v4;
  IPTextMessageConversation *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_messageByMessageIdentifierDictionary, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)scanEventsInLastMessageOnly:(BOOL)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __89__IPTextMessageConversation_scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke;
  v10[3] = &unk_24DAA5670;
  v11 = v8;
  v9 = v8;
  -[IPTextMessageConversation _scanEventsInLastMessageOnly:synchronously:completionHandler:](self, "_scanEventsInLastMessageOnly:synchronously:completionHandler:", v6, v5, v10);

}

uint64_t __89__IPTextMessageConversation_scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_scanEventsInLastMessageOnly:(BOOL)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  IPTextMessageConversation *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  _QWORD v29[5];
  IPTextMessageConversation *v30;

  v5 = a4;
  v8 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__2;
  v29[4] = __Block_byref_object_dispose__2;
  v9 = self;
  v30 = v9;
  -[IPTextMessageConversation allMessages](v9, "allMessages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isGroupConversation");

  if (_scanEventsInLastMessageOnly_synchronously_completionHandler__onceToken != -1)
    dispatch_once(&_scanEventsInLastMessageOnly_synchronously_completionHandler__onceToken, &__block_literal_global_5);
  if (v12)
    v13 = 1;
  else
    v13 = _scanEventsInLastMessageOnly_synchronously_completionHandler__sKMaxNumberOfMessagesToKeep;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPTextMessageConversation allMessages](v9, "allMessages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __90__IPTextMessageConversation__scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke_2;
  v22[3] = &unk_24DAA56E0;
  v22[4] = v9;
  v16 = v8;
  v25 = v16;
  v17 = v15;
  v23 = v17;
  v27 = v13;
  v18 = v14;
  v28 = a3;
  v24 = v18;
  v26 = v29;
  v19 = MEMORY[0x219A2F888](v22);
  v20 = (void *)v19;
  if (v5)
  {
    (*(void (**)(uint64_t))(v19 + 16))(v19);
  }
  else
  {
    dispatch_get_global_queue(17, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v21, v20);

  }
  _Block_object_dispose(v29, 8);

}

void __90__IPTextMessageConversation__scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _scanEventsInLastMessageOnly_synchronously_completionHandler__sKMaxNumberOfMessagesToKeep = objc_msgSend(v0, "integerForKey:", CFSTR("IPTextMessageConversationMaxNumberOfMessagesToKeep"));

  if ((unint64_t)(_scanEventsInLastMessageOnly_synchronously_completionHandler__sKMaxNumberOfMessagesToKeep - 21) <= 0xFFFFFFFFFFFFFFEBLL)
    _scanEventsInLastMessageOnly_synchronously_completionHandler__sKMaxNumberOfMessagesToKeep = 7;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerForKey:", CFSTR("IPTextMessageConversationMaxTimeIntervalInHoursForMessagesToKeep"));

  v3 = 86400;
  if ((unint64_t)(v2 - 101) >= 0xFFFFFFFFFFFFFF9CLL)
    v3 = 3600 * v2;
  _scanEventsInLastMessageOnly_synchronously_completionHandler__kMaxTimeIntervalInSecondsForMessagesToKeep = v3;
}

void __90__IPTextMessageConversation__scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  IPFeatureTextMessageScanner *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id obj;
  id obja;
  uint64_t v49;
  _QWORD v50[5];
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v49 = a1;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    objc_sync_exit(obj);

    v43 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 40), "lastObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dateSent");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v63 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v6, "dateSent");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timeIntervalSinceDate:", v46);
          v9 = v8 > (double)(unint64_t)(3600
                                             * _scanEventsInLastMessageOnly_synchronously_completionHandler__kMaxTimeIntervalInSecondsForMessagesToKeep);

          if (!v9)
            objc_msgSend(v43, "addObject:", v6);
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      }
      while (v3);
    }

    +[IPTextMessageConversation collapsedMessagesFromMessages:](IPTextMessageConversation, "collapsedMessagesFromMessages:", v43);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v40, "count");
    v11 = v10;
    v12 = *(_QWORD *)(v49 + 72);
    v13 = v10 - v12;
    if (v10 < v12)
      v13 = 0;
    if (v13 < v10)
    {
      if (v10 < v12)
        v12 = v10;
      v14 = -(uint64_t)v12;
      do
      {
        objc_msgSend(v40, "objectAtIndexedSubscript:", v11 + v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v49 + 48), "addObject:", v15);

      }
      while (!__CFADD__(v14++, 1));
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v42 = *(id *)(v49 + 48);
    v17 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v17)
    {
      v41 = 0;
      v44 = *(_QWORD *)v59;
      do
      {
        v18 = 0;
        v19 = v41;
        v45 = v17;
        v41 += v17;
        do
        {
          if (*(_QWORD *)v59 != v44)
            objc_enumerationMutation(v42);
          v20 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v18);
          if (!*(_BYTE *)(v49 + 80)
            || (objc_msgSend(*(id *)(v49 + 48), "lastObject"),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                v22 = v20 == v21,
                v21,
                v22))
          {
            objc_msgSend(v20, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = *(id *)(v49 + 32);
              objc_sync_enter(v24);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v49 + 64) + 8) + 40), "eventsByMessageIdentifierDictionary");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v23);
              obja = (id)objc_claimAutoreleasedReturnValue();

              objc_sync_exit(v24);
              if (obja)
              {
                objc_msgSend(obja, "count");
                (*(void (**)(void))(*(_QWORD *)(v49 + 56) + 16))();
              }
              else
              {
                v26 = (void *)objc_opt_new();
                if (v19)
                {
                  for (j = 0; j != v19; ++j)
                  {
                    objc_msgSend(*(id *)(v49 + 48), "objectAtIndexedSubscript:", j);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "messageUnits");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "firstObject");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "text");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v31, "length"))
                    {
                      objc_msgSend(v28, "messageUnits");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "addObjectsFromArray:", v32);

                    }
                  }
                }
                v33 = objc_alloc_init(IPFeatureTextMessageScanner);
                objc_msgSend(v20, "messageUnits");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v50[0] = MEMORY[0x24BDAC760];
                v50[1] = 3221225472;
                v50[2] = __90__IPTextMessageConversation__scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke_3;
                v50[3] = &unk_24DAA56B8;
                v35 = *(_QWORD *)(v49 + 64);
                v50[4] = *(_QWORD *)(v49 + 32);
                v57 = v35;
                v51 = v23;
                v52 = v43;
                v36 = *(id *)(v49 + 56);
                v53 = v20;
                v54 = v26;
                v55 = v34;
                v56 = v36;
                v37 = v34;
                v38 = v26;
                -[IPFeatureTextMessageScanner scanEventsInMessageUnits:contextMessageUnits:synchronously:completionHandler:](v33, "scanEventsInMessageUnits:contextMessageUnits:synchronously:completionHandler:", v37, v38, 1, v50);

              }
            }

          }
          ++v19;
          ++v18;
        }
        while (v18 != v45);
        v17 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v17);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_sync_exit(obj);

  }
}

void __90__IPTextMessageConversation__scanEventsInLastMessageOnly_synchronously_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x24BDBD1A8];
  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "eventsByMessageIdentifierDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

  objc_sync_exit(v5);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setIpsos_usedBubblesCount:", objc_msgSend(*(id *)(a1 + 48), "count", (_QWORD)v11));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

- (id)eventsInPreviouslyScannedMessageWithIdentifier:(id)a3
{
  id v4;
  IPTextMessageConversation *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_eventsByMessageIdentifierDictionary, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

+ (id)collapsedMessagesFromMessages:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v30;
  void *v31;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v31 = (void *)objc_opt_new();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateSent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v33 = *(_QWORD *)v35;
    do
    {
      v11 = 0;
      v30 = v10;
      v12 = -v10;
      v13 = v33;
      do
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v7);
        if (v12 != v11)
        {
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v11);
          objc_msgSend(v14, "dateSent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "timeIntervalSinceDate:", v5);
          v17 = v16;

          objc_msgSend(v14, "sender");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18 == v6 && v17 < 60.0)
          {
            v38[0] = v4;
            v38[1] = v14;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "collapseMessages:", v23);
            v24 = v6;
            v25 = v7;
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = v26;
            v7 = v25;
            v6 = v24;
            v13 = v33;
            v22 = v27;

            objc_msgSend(v14, "dateSent");
            v21 = objc_claimAutoreleasedReturnValue();

            v20 = v22;
          }
          else
          {
            if (v4)
              objc_msgSend(v31, "addObject:", v4);
            v20 = v14;

            objc_msgSend(v20, "dateSent");
            v21 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "sender");
            v22 = v6;
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }

          v5 = (void *)v21;
          v4 = v20;
        }
        ++v11;
      }
      while (v9 != v11);
      v10 = v30 + v9;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v9);
  }

  objc_msgSend(v31, "addObject:", v4);
  v28 = v31;

  return v28;
}

+ (id)collapseMessages:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  IPMessage *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  IPMessage *v23;
  IPMessageUnit *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  IPMessageUnit *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "count");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "messageUnits");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "text");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "length"))
        {
          objc_msgSend(v4, "appendString:", v14);
          if (v5 - 1 - v9 != i)
            objc_msgSend(v4, "appendString:", CFSTR(" "));
        }

      }
      v9 += v8;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [IPMessage alloc];
  objc_msgSend(v15, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sender");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recipients");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateSent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "type");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[IPMessage initWithIdentifier:subject:sender:recipients:dateSent:type:](v16, "initWithIdentifier:subject:sender:recipients:dateSent:type:", v17, v18, v19, v20, v21, v22);

  v24 = -[IPMessageUnit initWithText:originalMessage:index:]([IPMessageUnit alloc], "initWithText:originalMessage:index:", v4, v23, 0);
  v31 = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPMessage setMessageUnits:](v23, "setMessageUnits:", v25);

  return v23;
}

- (void)setAllMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)messageByMessageIdentifierDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMessageByMessageIdentifierDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)eventsByMessageIdentifierDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEventsByMessageIdentifierDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsByMessageIdentifierDictionary, 0);
  objc_storeStrong((id *)&self->_messageByMessageIdentifierDictionary, 0);
  objc_storeStrong((id *)&self->_allMessages, 0);
  objc_storeStrong((id *)&self->_lastMessages, 0);
}

@end
