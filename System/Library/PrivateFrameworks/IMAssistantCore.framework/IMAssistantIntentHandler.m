@implementation IMAssistantIntentHandler

- (IMAssistantIntentHandler)init
{
  IMAssistantIntentHandler *v2;
  NSObject *v3;
  NSMutableArray *v4;
  NSMutableArray *recentIntentHandlers;
  id v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMAssistantIntentHandler;
  v2 = -[IMAssistantIntentHandler init](&v9, sel_init);
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21ED90000, v3, OS_LOG_TYPE_INFO, "Intent Extension initialized", v8, 2u);
      }

    }
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    recentIntentHandlers = v2->_recentIntentHandlers;
    v2->_recentIntentHandlers = v4;

    IMSetEmbeddedTempDirectory();
    v6 = +[IMAssistantMessageHandler connectToIMDaemonController](IMAssistantMessageHandler, "connectToIMDaemonController");
  }
  return v2;
}

- (id)handlerForIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __objc2_class **v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssistantIntentHandler existingHandlerForIntentIdentifier:](self, "existingHandlerForIntentIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_17:
    -[IMAssistantIntentHandler updateRecentlyUsedHandlersWithHandler:](self, "updateRecentlyUsedHandlersWithHandler:", v6);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412802;
        v14 = v10;
        v15 = 2048;
        v16 = v6;
        v17 = 2112;
        v18 = v4;
        _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Using %@ %p for intent %@", (uint8_t *)&v13, 0x20u);

      }
    }
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = off_24E3952E0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = off_24E3952E8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = off_24E3952F0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = off_24E3952C0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v7 = off_24E3952C8;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v7 = &off_24E395300;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_21;
              v7 = off_24E395298;
            }
          }
        }
      }
    }
  }
  v6 = (void *)objc_msgSend(objc_alloc(*v7), "initWithIntentIdentifier:", v5);
  if (v6)
    goto LABEL_17;
LABEL_21:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_21ED90000, v11, OS_LOG_TYPE_INFO, "Received an unknown intent: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  v6 = 0;
LABEL_26:

  return v6;
}

- (id)existingHandlerForIntentIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = self->_recentIntentHandlers;
    objc_sync_enter(v5);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_recentIntentHandlers;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v10, "intentIdentifier", (_QWORD)v18);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v4, "isEqualToString:", v11);

          if (v12)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v23 = v4;
                _os_log_impl(&dword_21ED90000, v14, OS_LOG_TYPE_INFO, "Found existing handler for intent identifier: %@.", buf, 0xCu);
              }

            }
            v13 = v10;
            goto LABEL_16;
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_16:

    objc_sync_exit(v5);
    if (!v13 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Existing handler not found for intent identifier: %@. Creating new handler.", buf, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v16, OS_LOG_TYPE_INFO, "Intent does not have an intentIdentifier set. Creating new handler.", buf, 2u);
      }

    }
    v13 = 0;
  }

  return v13;
}

- (void)updateRecentlyUsedHandlersWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(v4, "intentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21ED90000, v7, OS_LOG_TYPE_INFO, "Updating recently used intent handler cache for an intent with no intentIdentifier.", v10, 2u);
    }

  }
  v8 = self->_recentIntentHandlers;
  objc_sync_enter(v8);
  v9 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_recentIntentHandlers, "indexOfObjectIdenticalTo:", v4);
  if (v9)
  {
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_recentIntentHandlers, "removeObjectAtIndex:", v9);
    -[NSMutableArray insertObject:atIndex:](self->_recentIntentHandlers, "insertObject:atIndex:", v4, 0);
    if ((unint64_t)-[NSMutableArray count](self->_recentIntentHandlers, "count") >= 6)
      -[NSMutableArray removeLastObject](self->_recentIntentHandlers, "removeLastObject");
  }
  objc_sync_exit(v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentIntentHandlers, 0);
}

@end
