@implementation IMAssistantMessageQueryHandler

- (BOOL)resolvePersons:(id)a3 forIntent:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  void (**v34)(_QWORD, void *, _QWORD);
  void *v35;
  id v36;
  char v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v36 = a4;
  v8 = a5;
  v35 = v7;
  if (!objc_msgSend(v7, "count"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);
    v31 = 0;
    goto LABEL_41;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v45 = (uint64_t)v7;
      v46 = 2112;
      v47 = v36;
      _os_log_impl(&dword_21ED90000, v9, OS_LOG_TYPE_INFO, "Resolving persons: %@ for intent: %@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v12)
  {

    goto LABEL_39;
  }
  v13 = *(_QWORD *)v40;
  v37 = 1;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v40 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v14);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v45 = (uint64_t)v15;
          _os_log_impl(&dword_21ED90000, v16, OS_LOG_TYPE_INFO, "Resolving person: %@", buf, 0xCu);
        }

      }
      objc_msgSend(v15, "__im_assistant_allContactIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = objc_msgSend(v17, "count");
            *(_DWORD *)buf = 134218242;
            v45 = v19;
            v46 = 2112;
            v47 = v17;
            _os_log_impl(&dword_21ED90000, v18, OS_LOG_TYPE_INFO, "Successfully resolved person to %ld contact identifiers: %@", buf, 0x16u);
          }

        }
LABEL_26:
        objc_msgSend(v11, "addObject:", v15);
        objc_msgSend(MEMORY[0x24BDD9F40], "successWithResolvedPerson:", v15);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      objc_msgSend(v15, "personHandle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length") == 0;

      v23 = IMOSLoggingEnabled();
      if (!v22)
      {
        if (v23)
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v15, "personHandle");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "value");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v45 = (uint64_t)v26;
            _os_log_impl(&dword_21ED90000, v24, OS_LOG_TYPE_INFO, "Successfully resolved person to handle: %@", buf, 0xCu);

          }
        }
        goto LABEL_26;
      }
      if (v23)
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "displayName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v45 = (uint64_t)v29;
          v46 = 2112;
          v47 = v36;
          _os_log_impl(&dword_21ED90000, v28, OS_LOG_TYPE_INFO, "Could not resolve person %@ for intent %@", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x24BDD9F40], "unsupported");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
LABEL_27:
      objc_msgSend(v10, "addObject:", v27);

      ++v14;
    }
    while (v12 != v14);
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    v12 = v30;
  }
  while (v30);

  if ((v37 & 1) == 0)
  {
    v34[2](v34, v10, 0);
    v31 = 0;
    goto LABEL_40;
  }
LABEL_39:
  v32 = (void *)objc_msgSend(v11, "copy");
  ((void (**)(_QWORD, void *, void *))v34)[2](v34, v10, v32);

  v31 = 1;
LABEL_40:

  v8 = v34;
LABEL_41:

  return v31;
}

- (id)resolveDateTimeRange:(id)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x24BDD9CA0], "successWithResolvedDateComponentsRange:");
  else
    objc_msgSend(MEMORY[0x24BDD9CA0], "notRequired");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (OS_dispatch_queue)IMAssistantIMSPIQueue
{
  if (qword_25548BA78 != -1)
    dispatch_once(&qword_25548BA78, &unk_24E396320);
  return (OS_dispatch_queue *)(id)qword_25548BA70;
}

- (id)allIMHandlesForHandle:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "imHandleWithID:", v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)SPIQueryMessagesForChats:(id)a3 onlyUnread:(BOOL)a4 limit:(int64_t)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v27 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v29 = a6;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "chatDataSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allGUIDsForChat:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v19 = objc_msgSend(v17, "count");
              *(_DWORD *)buf = 134218498;
              v37 = v19;
              v38 = 2112;
              v39 = v17;
              v40 = 2112;
              v41 = v14;
              _os_log_impl(&dword_21ED90000, v18, OS_LOG_TYPE_INFO, "Found %ld chat guids: %@, matching chat: %@", buf, 0x20u);
            }

          }
          objc_msgSend(v9, "addObjectsFromArray:", v17);
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v11);
  }

  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v9, "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v21;
  v31 = v20;
  -[IMAssistantMessageQueryHandler handlesAndServicesForChatGuids:handles:services:](self, "handlesAndServicesForChatGuids:handles:services:", v22, &v31, &v30);
  v23 = v31;

  v24 = v30;
  v25 = (void *)objc_msgSend(v23, "copy");
  v26 = (void *)objc_msgSend(v24, "copy");

  -[IMAssistantMessageQueryHandler SPIQueryMessagesForChatsWithIdentifiers:services:onlyUnread:limit:completion:](self, "SPIQueryMessagesForChatsWithIdentifiers:services:onlyUnread:limit:completion:", v25, v26, v27, a5, v29);
}

- (void)SPIQueryMessagesForChatsWithIdentifiers:(id)a3 services:(id)a4 onlyUnread:(BOOL)a5 limit:(int64_t)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  os_signpost_id_t v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  int64_t v39;
  uint64_t v40;

  v9 = a5;
  v40 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "queryMessagesWithChatIdentifiers", (const char *)&unk_21EDC1733, buf, 2u);
  }

  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_21EDB70E8;
  v29 = &unk_24E395A00;
  v31 = v15;
  v18 = v13;
  v30 = v18;
  v19 = (void *)MEMORY[0x2207BE4D4](&v26);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v33 = v12;
      v34 = 2112;
      v35 = v11;
      v36 = 1024;
      v37 = v9;
      v38 = 2048;
      v39 = a6;
      _os_log_impl(&dword_21ED90000, v20, OS_LOG_TYPE_INFO, "Calling IMSPIQueryMessagesWithChatIdentifiers services: %@, chatIdentifiers: %@, onlyUnread: %d, limit: %ld", buf, 0x26u);
    }

  }
  +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue](IMAssistantMessageQueryHandler, "IMAssistantIMSPIQueue", v26, v27, v28, v29);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = IMSPIQueryMessagesWithChatIdentifiersAndQOS();

  if ((v22 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v23, OS_LOG_TYPE_INFO, "IMSPIQueryMessagesWithChatIdentifiers failed", buf, 2u);
      }

    }
    _IMAssistantCoreSearchForMessageSignpostLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v15 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21ED90000, v25, OS_SIGNPOST_INTERVAL_END, v15, "queryMessagesWithChatIdentifiers", (const char *)&unk_21EDC1733, buf, 2u);
    }

    (*((void (**)(id, _QWORD))v18 + 2))(v18, 0);
  }

}

- (void)handlesAndServicesForPersons:(id)a3 handles:(id *)a4 services:(id *)a5
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v28;
  uint64_t v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = sub_21EDB7464;
  v40[3] = &unk_24E396348;
  v25 = v7;
  v41 = v25;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207BE4D4](v40);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v37;
    v28 = *(_QWORD *)v37;
    do
    {
      v12 = 0;
      v29 = v10;
      do
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v12);
        objc_msgSend(v13, "__im_assistant_allContactIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "personHandle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "count"))
        {
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v17 = v14;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
          if (v18)
          {
            v19 = v18;
            v31 = v16;
            v20 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v33 != v20)
                  objc_enumerationMutation(v17);
                -[IMAssistantMessageHandler contactWithIdentifier:](self, "contactWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "__im_assistant_allIMHandles");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *))v8)[2](v8, v23);

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
            }
            while (v19);
            v11 = v28;
            v10 = v29;
            v16 = v31;
          }
        }
        else
        {
          if (!objc_msgSend(v16, "length"))
            goto LABEL_18;
          -[IMAssistantMessageQueryHandler allIMHandlesForHandle:](self, "allIMHandlesForHandle:", v16);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v8)[2](v8, v17);
        }

LABEL_18:
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v10);
  }

  objc_msgSend(v25, "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssistantMessageQueryHandler handlesAndServicesForChatGuids:handles:services:](self, "handlesAndServicesForChatGuids:handles:services:", v24, a4, a5);

}

- (void)handlesAndServicesForChatGuids:(id)a3 handles:(id *)a4 services:(id *)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        IMComponentsFromChatGUID();
        v13 = 0;
        v14 = 0;
        if (objc_msgSend(v13, "length") && objc_msgSend(v14, "length"))
        {
          objc_msgSend(v6, "addObject:", v13);
          objc_msgSend(v7, "addObject:", v14);
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v12;
            _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Could not parse identifier or service from chat GUID: %@", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v9);
  }

  if (a4)
    *a4 = (id)objc_msgSend(v6, "copy");
  if (a5)
    *a5 = (id)objc_msgSend(v7, "copy");

}

- (void)SPIQueryMessagesForSenders:(id)a3 onlyUnread:(BOOL)a4 limit:(int64_t)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  char v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  os_signpost_id_t v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  int64_t v39;
  uint64_t v40;

  v8 = a4;
  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v30 = 0;
  v31 = 0;
  -[IMAssistantMessageQueryHandler handlesAndServicesForPersons:handles:services:](self, "handlesAndServicesForPersons:handles:services:", v10, &v31, &v30);
  v12 = v31;
  v13 = v30;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v33 = v12;
      v34 = 2112;
      v35 = v13;
      v36 = 1024;
      v37 = v8;
      v38 = 2048;
      v39 = a5;
      _os_log_impl(&dword_21ED90000, v14, OS_LOG_TYPE_INFO, "Performing query for messages from handles: %@ services: %@ onlyUnread: %d, limit: %ld", buf, 0x26u);
    }

  }
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_generate(v15);

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "queryMessagesWithIDs", (const char *)&unk_21EDC1733, buf, 2u);
  }

  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = sub_21EDB7C44;
  v27 = &unk_24E395A00;
  v29 = v16;
  v19 = v11;
  v28 = v19;
  v20 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207BE4D4](&v24);
  +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue](IMAssistantMessageQueryHandler, "IMAssistantIMSPIQueue", v24, v25, v26, v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS();

  if ((v22 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v23, OS_LOG_TYPE_INFO, "IMSPIQueryMessagesWithIDsWithOnlyUnread failed", buf, 2u);
      }

    }
    v20[2](v20, 0);
  }

}

- (void)SPIQueryUnreadMessages:(int64_t)a3 completion:(id)a4
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  os_signpost_id_t v19;
  uint8_t buf[16];

  v4 = a4;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "queryUnreadMessages", (const char *)&unk_21EDC1733, buf, 2u);
  }

  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = sub_21EDB7EA0;
  v17 = &unk_24E395A00;
  v19 = v6;
  v9 = v4;
  v18 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207BE4D4](&v14);
  +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue](IMAssistantMessageQueryHandler, "IMAssistantIMSPIQueue", v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = IMSPIQueryUnreadMessagesWithQOS();

  if ((v12 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "IMSPIQueryUnreadMessages failed", buf, 2u);
      }

    }
    v10[2](v10, 0);
  }

}

- (void)SPIQueryMessagesWithGUIDs:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  os_signpost_id_t v21;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "queryMessagesWithGUIDs", (const char *)&unk_21EDC1733, buf, 2u);
  }

  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = sub_21EDB810C;
  v19 = &unk_24E395A00;
  v21 = v8;
  v11 = v6;
  v20 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207BE4D4](&v16);
  +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue](IMAssistantMessageQueryHandler, "IMAssistantIMSPIQueue", v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = IMSPIQueryMessagesWithGUIDsAndQOS();

  if ((v14 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "IMSPIQueryMessagesWithGUIDs failed", buf, 2u);
      }

    }
    v12[2](v12, 0);
  }

}

- (void)SPIQueryMessagesWithRowIDs:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  os_signpost_id_t v21;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "queryMessagesWithRowIDs", (const char *)&unk_21EDC1733, buf, 2u);
  }

  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = sub_21EDB8378;
  v19 = &unk_24E395A00;
  v21 = v8;
  v11 = v6;
  v20 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207BE4D4](&v16);
  +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue](IMAssistantMessageQueryHandler, "IMAssistantIMSPIQueue", v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = IMSPIQueryMessagesWithRowIDsAndQOS();

  if ((v14 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "IMSPIQueryMessagesWithRowIDs failed", buf, 2u);
      }

    }
    v12[2](v12, 0);
  }

}

- (id)recipientsPredicate:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[IMAssistantMessageQueryHandler unifiedContactIdentifiersForPerson:](self, "unifiedContactIdentifiersForPerson:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    v13 = (void *)MEMORY[0x24BDD1758];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_21EDB85D8;
    v17[3] = &unk_24E396370;
    v18 = v6;
    v19 = v5;
    v14 = v5;
    objc_msgSend(v13, "predicateWithBlock:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)sendersPredicate:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[IMAssistantMessageQueryHandler unifiedContactIdentifiersForPerson:](self, "unifiedContactIdentifiersForPerson:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    v13 = (void *)MEMORY[0x24BDD1758];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_21EDB8970;
    v17[3] = &unk_24E396398;
    v18 = v6;
    v19 = v5;
    v14 = v5;
    objc_msgSend(v13, "predicateWithBlock:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)spokenPhrasesForSpeakableStrings:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "spokenPhrase", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length"))
          objc_msgSend(v5, "addObject:", v12);
        objc_msgSend(v11, "alternativeSpeakableMatches");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          -[IMAssistantMessageQueryHandler spokenPhrasesForSpeakableStrings:](self, "spokenPhrasesForSpeakableStrings:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)vocabularyIdentifiersFromSpeakableStrings:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "vocabularyIdentifier", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length"))
          objc_msgSend(v5, "addObject:", v12);
        objc_msgSend(v11, "alternativeSpeakableMatches");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          -[IMAssistantMessageQueryHandler vocabularyIdentifiersFromSpeakableStrings:](self, "vocabularyIdentifiersFromSpeakableStrings:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)messageContentsPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v6 = 0;
      do
      {
        if (v6)
          objc_msgSend(v4, "appendString:", CFSTR(" AND "));
        objc_msgSend(v4, "appendString:", CFSTR("self LIKE[cd] %@"));
        v7 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("*%@*"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);

        ++v6;
      }
      while (v6 < objc_msgSend(v3, "count"));
    }
    v10 = (void *)MEMORY[0x24BDD1758];
    v11 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v10, "predicateWithFormat:argumentArray:", v11, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)chatParticipantForSPIHandle:(id)a3
{
  id v4;
  void *v5;
  IMAssistantMessageSearchChatParticipant *v6;
  void *v7;
  uint64_t v8;
  IMAssistantMessageSearchChatParticipant *v9;

  v4 = a3;
  -[IMAssistantMessageHandler contactIdentifiersMatchingSPIHandle:](self, "contactIdentifiersMatchingSPIHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [IMAssistantMessageSearchChatParticipant alloc];
  objc_msgSend(v4, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isMe");

  v9 = -[IMAssistantMessageSearchChatParticipant initWithHandle:contactIdentifiers:isMe:](v6, "initWithHandle:contactIdentifiers:isMe:", v7, v5, v8);
  return v9;
}

- (id)chatParticipantsForSPIHandles:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[IMAssistantMessageQueryHandler chatParticipantForSPIHandle:](self, "chatParticipantForSPIHandle:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)unifiedContactIdentifiersForPerson:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "__im_assistant_allContactIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[IMAssistantMessageHandler unifiedContactIdentifierForContactIdentifier:](self, "unifiedContactIdentifierForContactIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)chatsContainingRequiredParticipants:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  void *v38;
  char v39;
  NSObject *v40;
  uint64_t v41;
  __int128 v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id obj;
  void *v50;
  IMAssistantMessageQueryHandler *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  id v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v51 = self;
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allExistingChats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v4, "count"));
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v73 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
        -[IMAssistantMessageQueryHandler unifiedContactIdentifiersForPerson:](v51, "unifiedContactIdentifiersForPerson:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    }
    while (v8);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v45 = v7;
  v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v69;
    *(_QWORD *)&v13 = 138412290;
    v43 = v13;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v69 != v46)
        {
          v15 = v14;
          objc_enumerationMutation(v45);
          v14 = v15;
        }
        v48 = v14;
        v50 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v14);
        -[IMAssistantMessageHandler contactIdentifiersForParticipantsInChat:](v51, "contactIdentifiersForParticipantsInChat:", v43);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "participantsWithState:", 16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "__imArrayByApplyingBlock:", &unk_24E3963D8);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v19 = v16;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v65;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v65 != v21)
                objc_enumerationMutation(v19);
              objc_msgSend(v18, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j));
            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
          }
          while (v20);
        }

        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v54 = obj;
        v23 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
        if (v23)
        {
          v55 = *(_QWORD *)v61;
          while (2)
          {
            for (k = 0; k != v23; ++k)
            {
              if (*(_QWORD *)v61 != v55)
                objc_enumerationMutation(v54);
              v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
              if ((objc_msgSend(v25, "isMe") & 1) == 0)
              {
                objc_msgSend(v53, "objectForKey:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v26, "count"))
                {
                  v58 = 0u;
                  v59 = 0u;
                  v56 = 0u;
                  v57 = 0u;
                  v27 = v26;
                  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
                  if (v28)
                  {
                    v29 = *(_QWORD *)v57;
                    while (2)
                    {
                      for (m = 0; m != v28; ++m)
                      {
                        if (*(_QWORD *)v57 != v29)
                          objc_enumerationMutation(v27);
                        if (objc_msgSend(v18, "containsObject:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * m)))
                        {

                          goto LABEL_48;
                        }
                      }
                      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
                      if (v28)
                        continue;
                      break;
                    }
                  }

                }
                objc_msgSend(v25, "personHandle");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "value");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "length") == 0;

                if (v33)
                  goto LABEL_51;
                objc_msgSend(v25, "personHandle");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "value");
                v35 = (id)objc_claimAutoreleasedReturnValue();
                if (MEMORY[0x2207BE180]() || IMStringIsEmail())
                {
                  IMCanonicalizeFormattedString();
                  v36 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (!MEMORY[0x2207BE168](v35) && IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v37 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = v43;
                      v77 = (uint64_t)v35;
                      _os_log_impl(&dword_21ED90000, v37, OS_LOG_TYPE_INFO, "Could not canonicalize handle \"%@\" because it is neither a phone number nor an email address.", buf, 0xCu);
                    }

                  }
                  v36 = v35;
                }
                v38 = v36;

                v39 = objc_msgSend(v52, "containsObject:", v38);
                if ((v39 & 1) == 0)
                {
LABEL_51:

                  goto LABEL_52;
                }
              }
LABEL_48:
              ;
            }
            v23 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
            if (v23)
              continue;
            break;
          }
        }

        objc_msgSend(v44, "addObject:", v50);
LABEL_52:

        v14 = v48 + 1;
      }
      while (v48 + 1 != v47);
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
    }
    while (v47);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = objc_msgSend(v44, "count");
      *(_DWORD *)buf = 134218242;
      v77 = v41;
      v78 = 2112;
      v79 = v44;
      _os_log_impl(&dword_21ED90000, v40, OS_LOG_TYPE_INFO, "Found %ld chats matching participants. Chats: %@", buf, 0x16u);
    }

  }
  return v44;
}

- (id)chatsWithConversationIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chatDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v23;
    *(_QWORD *)&v10 = 138412546;
    v21 = v10;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        IMAssistantChatIdentifierFromConversationIdentifier(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "existingChatWithChatIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = IMOSLoggingEnabled();
        if (v15)
        {
          if (v16)
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v21;
              v27 = v13;
              v28 = 2112;
              v29 = v14;
              _os_log_impl(&dword_21ED90000, v17, OS_LOG_TYPE_INFO, "Found exsting chat matching conversationIdentifier: %@ chatIdentifier: %@", buf, 0x16u);
            }

          }
          objc_msgSend(v5, "addObject:", v15, v21, (_QWORD)v22);
        }
        else if (v16)
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v21;
            v27 = v13;
            v28 = 2112;
            v29 = v14;
            _os_log_impl(&dword_21ED90000, v18, OS_LOG_TYPE_INFO, "Could not find chat matching conversationIdentifier: %@ chatIdentifier: %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

  v19 = (void *)objc_msgSend(v5, "copy");
  return v19;
}

- (id)chatsForChatNames:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v22 = v4;
    -[IMAssistantMessageQueryHandler vocabularyIdentifiersFromSpeakableStrings:](self, "vocabularyIdentifiersFromSpeakableStrings:", v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "__imArrayByApplyingBlock:", &unk_24E396418);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAssistantMessageQueryHandler spokenPhrasesForSpeakableStrings:](self, "spokenPhrasesForSpeakableStrings:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chatDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allExistingChats");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v15, "chatIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "displayName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "length") && (objc_msgSend(v6, "containsObject:", v16) & 1) != 0
            || objc_msgSend(v17, "length") && objc_msgSend(v7, "containsObject:", v17))
          {
            objc_msgSend(v5, "addObject:", v15);
          }

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v12);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = objc_msgSend(v5, "count");
        *(_DWORD *)buf = 134218754;
        v29 = v19;
        v30 = 2112;
        v31 = v7;
        v32 = 2112;
        v33 = v23;
        v34 = 2112;
        v35 = v5;
        _os_log_impl(&dword_21ED90000, v18, OS_LOG_TYPE_INFO, "Found %ld chats matching chat names:%@ vocabularyIdentifiers:%@ chats:%@", buf, 0x2Au);
      }

    }
    objc_msgSend(v5, "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v22;
  }
  else
  {
    v20 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v20;
}

- (void)searchMessagesWithContents:(id)a3 messageIdentifiers:(id)a4 notificationIdentifiers:(id)a5 chatNames:(id)a6 conversationIdentifiers:(id)a7 recipients:(id)a8 senders:(id)a9 dateTimeRange:(id)a10 attributes:(unint64_t)a11 completion:(id)a12
{
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  BOOL v54;
  int v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  __CFString *v63;
  void *v64;
  __CFString *v65;
  __CFString *v66;
  unsigned int v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  __int128 v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  _QWORD v80[5];
  _QWORD v81[5];
  id v82;
  id v83;
  id v84;
  id v85;
  char v86;
  char v87;
  char v88;
  uint8_t buf[4];
  const __CFString *v90;
  __int16 v91;
  const __CFString *v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v70 = a3;
  v73 = a4;
  v69 = a5;
  v66 = (__CFString *)a6;
  v65 = (__CFString *)a7;
  v72 = a8;
  v71 = a9;
  v74 = a10;
  v61 = a12;
  v67 = ((a11 & 1) == 0) & (a11 >> 1);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = CFSTR("NO");
      if (v67)
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      if ((a11 & ((a11 & 2) == 0)) != 0)
        v19 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v90 = v20;
      v91 = 2112;
      v92 = v19;
      _os_log_impl(&dword_21ED90000, v18, OS_LOG_TYPE_INFO, "Searching for messages with attributes onlyUnreadMessages: %@ | onlyReadMessages %@", buf, 0x16u);
    }

  }
  objc_msgSend(v74, "startDateComponents", v61);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "date");
  *(_QWORD *)&v75 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v74, "endDateComponents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "date");
  *((_QWORD *)&v75 + 1) = objc_claimAutoreleasedReturnValue();

  if (v75 == 0)
  {
    v25 = 0;
    v75 = 0uLL;
  }
  else
  {
    if (!(_QWORD)v75)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      *(_QWORD *)&v75 = objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v23, OS_LOG_TYPE_INFO, "No start date specified for date filtering, using open ended start date.", buf, 2u);
        }

      }
    }
    if (!*((_QWORD *)&v75 + 1))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      *((_QWORD *)&v75 + 1) = objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v24, OS_LOG_TYPE_INFO, "No end date specified for date filtering, using open ended end date.", buf, 2u);
        }

      }
    }
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v75);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v90 = (const __CFString *)v75;
        v91 = 2112;
        v92 = (const __CFString *)*((_QWORD *)&v75 + 1);
        _os_log_impl(&dword_21ED90000, v26, OS_LOG_TYPE_INFO, "Filtering the search results to date time interval: [%@, %@]", buf, 0x16u);
      }

    }
  }
  -[IMAssistantMessageQueryHandler messageContentsPredicate:](self, "messageContentsPredicate:", v70);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssistantMessageQueryHandler recipientsPredicate:](self, "recipientsPredicate:", v72);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssistantMessageQueryHandler sendersPredicate:](self, "sendersPredicate:", v71);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "isInternationalSpamFilteringEnabled"))
  {
    -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "chatDataSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "blackholedChatsExist");

  }
  else
  {
    v33 = 0;
  }

  v34 = MEMORY[0x24BDAC760];
  v81[0] = MEMORY[0x24BDAC760];
  v81[1] = 3221225472;
  v81[2] = sub_21EDBAC9C;
  v81[3] = &unk_24E396440;
  v86 = v33;
  v81[4] = self;
  v35 = v25;
  v82 = v35;
  v87 = ((a11 & 1) == 0) & (a11 >> 1);
  v88 = a11 & ((a11 & 2) == 0);
  v36 = v27;
  v83 = v36;
  v37 = v29;
  v84 = v37;
  v38 = v28;
  v85 = v38;
  v39 = (void *)MEMORY[0x2207BE4D4](v81);
  v80[0] = v34;
  v80[1] = 3221225472;
  v80[2] = sub_21EDBBA34;
  v80[3] = &unk_24E396468;
  v80[4] = self;
  v40 = (void *)MEMORY[0x2207BE4D4](v80);
  v76[0] = v34;
  v76[1] = 3221225472;
  v76[2] = sub_21EDBBD5C;
  v76[3] = &unk_24E396490;
  v41 = v39;
  v77 = v41;
  v42 = v40;
  v78 = v42;
  v43 = v62;
  v79 = v43;
  v44 = (void *)MEMORY[0x2207BE4D4](v76);
  if (v73)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v45, OS_LOG_TYPE_INFO, "Performing search via message identifiers search, then filter.", buf, 2u);
      }

    }
    -[IMAssistantMessageQueryHandler messagesMatchingMessageIdentifiers:completion:](self, "messagesMatchingMessageIdentifiers:completion:", v73, v44);
    goto LABEL_85;
  }
  if (objc_msgSend(v69, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v46, OS_LOG_TYPE_INFO, "Performing search for messages matching the notification identifiers, then filter.", buf, 2u);
      }

    }
    -[IMAssistantMessageQueryHandler messagesMatchingMessageIdentifiers:completion:](self, "messagesMatchingMessageIdentifiers:completion:", v69, v44);
    goto LABEL_85;
  }
  if (-[__CFString count](v66, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v47, OS_LOG_TYPE_INFO, "Performing search via chat name search, then filter.", buf, 2u);
      }

    }
    -[IMAssistantMessageQueryHandler chatsForChatNames:](self, "chatsForChatNames:", v66);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "count"))
    {
LABEL_47:
      -[IMAssistantMessageQueryHandler SPIQueryMessagesForChats:onlyUnread:limit:completion:](self, "SPIQueryMessagesForChats:onlyUnread:limit:completion:", v48, v67, 10 * objc_msgSend(v48, "count"), v44);
LABEL_60:

      goto LABEL_85;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v66;
        _os_log_impl(&dword_21ED90000, v50, OS_LOG_TYPE_INFO, "Failed to find any chats matching chatNames: %@", buf, 0xCu);
      }

    }
LABEL_59:
    (*((void (**)(id, _QWORD))v43 + 2))(v43, 0);
    goto LABEL_60;
  }
  if (-[__CFString count](v65, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v49, OS_LOG_TYPE_INFO, "Performing search via chat search, then filter.", buf, 2u);
      }

    }
    -[IMAssistantMessageQueryHandler chatsWithConversationIdentifiers:](self, "chatsWithConversationIdentifiers:", v65);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "count"))
      goto LABEL_47;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v65;
        _os_log_impl(&dword_21ED90000, v53, OS_LOG_TYPE_INFO, "Failed to find any chats matching conversation identifiers: %@", buf, 0xCu);
      }

    }
    goto LABEL_59;
  }
  if (objc_msgSend(v72, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v51, OS_LOG_TYPE_INFO, "Performing search via recipients search, then filter.", buf, 2u);
      }

    }
    v63 = (__CFString *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[__CFString addObjectsFromArray:](v63, "addObjectsFromArray:", v72);
    -[__CFString addObjectsFromArray:](v63, "addObjectsFromArray:", v71);
    -[IMAssistantMessageQueryHandler chatsContainingRequiredParticipants:](self, "chatsContainingRequiredParticipants:", v63);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "count"))
    {
      -[IMAssistantMessageQueryHandler SPIQueryMessagesForChats:onlyUnread:limit:completion:](self, "SPIQueryMessagesForChats:onlyUnread:limit:completion:", v52, v67, 10 * objc_msgSend(v52, "count"), v44);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v90 = v63;
          _os_log_impl(&dword_21ED90000, v57, OS_LOG_TYPE_INFO, "Failed to find chats containing all specified persons (recipients + senders) during search: %@", buf, 0xCu);
        }

      }
      (*((void (**)(id, _QWORD))v43 + 2))(v43, 0);
    }

  }
  else
  {
    v54 = objc_msgSend(v71, "count") == 0;
    v55 = IMOSLoggingEnabled();
    if (v54)
    {
      if (v67)
      {
        if (v55)
        {
          OSLogHandleForIMFoundationCategory();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v58, OS_LOG_TYPE_INFO, "Performing search via unread search, then filter.", buf, 2u);
          }

        }
        -[IMAssistantMessageQueryHandler SPIQueryUnreadMessages:completion:](self, "SPIQueryUnreadMessages:completion:", 50, v44);
      }
      else
      {
        if (v55)
        {
          OSLogHandleForIMFoundationCategory();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED90000, v59, OS_LOG_TYPE_INFO, "Performing search via examining all chats, then filter.", buf, 2u);
          }

        }
        -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "chatDataSource");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "allExistingChats");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        -[IMAssistantMessageQueryHandler SPIQueryMessagesForChats:onlyUnread:limit:completion:](self, "SPIQueryMessagesForChats:onlyUnread:limit:completion:", v64, 0, 10, v44);
      }
    }
    else
    {
      if (v55)
      {
        OSLogHandleForIMFoundationCategory();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED90000, v56, OS_LOG_TYPE_INFO, "Performing search via senders search, then filter.", buf, 2u);
        }

      }
      -[IMAssistantMessageQueryHandler SPIQueryMessagesForSenders:onlyUnread:limit:completion:](self, "SPIQueryMessagesForSenders:onlyUnread:limit:completion:", v71, v67, 10 * objc_msgSend(v71, "count"), v44);
    }
  }
LABEL_85:

}

- (BOOL)messageIsFromBlackholedChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "chatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssistantMessageHandler messageHandlerDataSource](self, "messageHandlerDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chatDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingChatWithChatIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v5;
        _os_log_impl(&dword_21ED90000, v10, OS_LOG_TYPE_INFO, "Could not find chatIdentifier %@ in chat registry, looking up IMSPIChat to determine blackhole status.", (uint8_t *)&v16, 0xCu);
      }

    }
    objc_msgSend(v4, "spiChatWithQOS:", 25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "isBlackholed");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "guid");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "guid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412802;
        v17 = v13;
        v18 = 2112;
        v19 = v14;
        v20 = 1024;
        v21 = v9;
        _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "Determined message %@ from chat %@ isBlackholed=%d", (uint8_t *)&v16, 0x1Cu);

      }
    }

  }
  return v9;
}

- (void)messagesMatchingMessageIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("x-apple-sms:guid="));

  v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v14 = 134217984;
        v15 = objc_msgSend(v6, "count");
        _os_log_impl(&dword_21ED90000, v11, OS_LOG_TYPE_INFO, "Looking up %ld messages with IMSPIQueryMessagesWithRowIDs", (uint8_t *)&v14, 0xCu);
      }

    }
    objc_msgSend(v6, "__imArrayByApplyingBlock:", &unk_24E3964D0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAssistantMessageQueryHandler SPIQueryMessagesWithRowIDs:completion:](self, "SPIQueryMessagesWithRowIDs:completion:", v12, v7);

  }
  else
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = 134217984;
        v15 = objc_msgSend(v6, "count");
        _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "Looking up %ld messages with IMSPIQueryMessagesWithGUIDs", (uint8_t *)&v14, 0xCu);
      }

    }
    -[IMAssistantMessageQueryHandler SPIQueryMessagesWithGUIDs:completion:](self, "SPIQueryMessagesWithGUIDs:completion:", v6, v7);
  }

}

@end
