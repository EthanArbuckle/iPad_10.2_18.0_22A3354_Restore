@implementation CKCurrentConversationsManager

+ (id)sharedInstance
{
  if (sharedInstance_creation_1 != -1)
    dispatch_once(&sharedInstance_creation_1, &__block_literal_global_223);
  return (id)sharedInstance_sInstance_3;
}

- (NSCountedSet)currentConversations
{
  NSCountedSet *currentConversations;
  NSCountedSet *v4;
  NSCountedSet *v5;

  currentConversations = self->_currentConversations;
  if (!currentConversations)
  {
    v4 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    v5 = self->_currentConversations;
    self->_currentConversations = v4;

    currentConversations = self->_currentConversations;
  }
  return currentConversations;
}

- (void)loadHistoryForConversation:(id)a3 keepAllCurrentlyLoadedMessages:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  id v12;

  v4 = a4;
  v12 = a3;
  v5 = objc_msgSend(v12, "limitToLoad");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "defaultConversationViewingMessageCount");

  if (v7 >= v5)
    v7 = v5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "initialConversationViewingMessageCount");

  if (v7 <= v9)
    v10 = v9;
  else
    v10 = v7;
  if (v4)
  {
    v11 = objc_msgSend(v12, "limitToLoad");
    if (v10 <= v11)
      v10 = v11;
  }
  else
  {
    objc_msgSend(v12, "clearConversationLoadFromSpotlight");
  }
  objc_msgSend(v12, "setLoadedMessageCount:", v10);

}

void __47__CKCurrentConversationsManager_sharedInstance__block_invoke()
{
  CKCurrentConversationsManager *v0;
  void *v1;

  v0 = objc_alloc_init(CKCurrentConversationsManager);
  v1 = (void *)sharedInstance_sInstance_3;
  sharedInstance_sInstance_3 = (uint64_t)v0;

}

- (void)addConversation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  CKCurrentConversationsManagerOrderedNode *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v4, "deviceIndependentID");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "shortDescription");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138412290;
          v19 = v8;
          _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Adding/incrementing conversation count in cache: %@", (uint8_t *)&v18, 0xCu);

        }
      }
      -[CKCurrentConversationsManager currentConversations](self, "currentConversations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v5);

      -[CKCurrentConversationsManager idToNodeDictionary](self, "idToNodeDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v5);
      v11 = (CKCurrentConversationsManagerOrderedNode *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[CKCurrentConversationsManager orderedKeys](self, "orderedKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeLinkedListNode:", v11);
      }
      else
      {
        v11 = -[IMDoubleLinkedListNode initWithObject:]([CKCurrentConversationsManagerOrderedNode alloc], "initWithObject:", v4);
        -[CKCurrentConversationsManagerOrderedNode setKey:](v11, "setKey:", v5);
        -[CKCurrentConversationsManager idToNodeDictionary](self, "idToNodeDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v5);
      }

      -[CKCurrentConversationsManager orderedKeys](self, "orderedKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendLinkedListNode:", v11);

      -[CKCurrentConversationsManager orderedKeys](self, "orderedKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      LODWORD(v17) = v17 > -[CKCurrentConversationsManager cacheSize](self, "cacheSize");

      if ((_DWORD)v17)
        -[CKCurrentConversationsManager pruneCacheToSize:](self, "pruneCacheToSize:", -[CKCurrentConversationsManager cacheSize](self, "cacheSize"));

    }
    else if (v4 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v14;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "CKCurrentConversationsManager: Not caching conversation with no deviceIndependentID: %@", (uint8_t *)&v18, 0xCu);

      }
    }
    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Not caching pending conversation: %@", (uint8_t *)&v18, 0xCu);

    }
LABEL_22:

  }
}

- (void)removeConversation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "deviceIndependentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "shortDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Decrementing conversation count in cache: %@", (uint8_t *)&v9, 0xCu);

      }
    }
    -[CKCurrentConversationsManager currentConversations](self, "currentConversations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v5);

  }
}

- (void)purgeConversation:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "deviceIndependentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CKCurrentConversationsManager currentConversations](self, "currentConversations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countForObject:", v4);

    for (; v6; --v6)
    {
      -[CKCurrentConversationsManager currentConversations](self, "currentConversations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v4);

    }
    -[CKCurrentConversationsManager idToNodeDictionary](self, "idToNodeDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKCurrentConversationsManager _prepareToDumpCachedConversation:](self, "_prepareToDumpCachedConversation:", v12);
    -[CKCurrentConversationsManager orderedKeys](self, "orderedKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeLinkedListNode:", v9);

    -[CKCurrentConversationsManager idToNodeDictionary](self, "idToNodeDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v4);

  }
}

- (void)purgeConversations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CKCurrentConversationsManager purgeConversation:](self, "purgeConversation:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)pruneCache
{
  -[CKCurrentConversationsManager pruneCacheToSize:](self, "pruneCacheToSize:", 0);
}

- (void)pruneCacheToSize:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v17 = 134217984;
      v18 = a3;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Pruning conversation cache to size %ld", (uint8_t *)&v17, 0xCu);
    }

  }
  -[CKCurrentConversationsManager orderedKeys](self, "orderedKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    while (1)
    {
      -[CKCurrentConversationsManager orderedKeys](self, "orderedKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count") > a3;

      if (!v9)
      {
LABEL_13:

        return;
      }
      objc_msgSend(v7, "next");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deviceIndependentID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "key");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        break;
      if (-[CKCurrentConversationsManager _canDumpConversationFromCache:](self, "_canDumpConversationFromCache:", v11))
      {
        -[CKCurrentConversationsManager _prepareToDumpCachedConversation:](self, "_prepareToDumpCachedConversation:", v11);
        -[CKCurrentConversationsManager orderedKeys](self, "orderedKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeLinkedListNode:", v7);

        -[CKCurrentConversationsManager idToNodeDictionary](self, "idToNodeDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObjectForKey:", v12);
LABEL_11:

      }
      v7 = (void *)v10;
      if (!v10)
        goto LABEL_13;
    }
    -[CKCurrentConversationsManager orderedKeys](self, "orderedKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeLinkedListNode:", v7);

    -[CKCurrentConversationsManager idToNodeDictionary](self, "idToNodeDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v13);
    goto LABEL_11;
  }
}

- (BOOL)_canDumpConversationFromCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "deviceIndependentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CKCurrentConversationsManager currentConversations](self, "currentConversations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countForObject:", v5) == 0;

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "shortDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "CKCurrentConversationsManager: asking to dump conversation with no deviceIndependentID: %@", (uint8_t *)&v11, 0xCu);

      }
    }
    v7 = 0;
  }

  return v7;
}

- (void)_prepareToDumpCachedConversation:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "  => Preparing to dump conversation from cache: %@", (uint8_t *)&v8, 0xCu);

    }
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "defaultConversationSummaryMessageCount");

  objc_msgSend(v3, "setLoadedMessageCount:", v7);
}

- (IMDoubleLinkedList)orderedKeys
{
  IMDoubleLinkedList *orderedKeys;
  IMDoubleLinkedList *v4;
  IMDoubleLinkedList *v5;

  orderedKeys = self->_orderedKeys;
  if (!orderedKeys)
  {
    v4 = (IMDoubleLinkedList *)objc_alloc_init(MEMORY[0x1E0D36A20]);
    v5 = self->_orderedKeys;
    self->_orderedKeys = v4;

    orderedKeys = self->_orderedKeys;
  }
  return orderedKeys;
}

- (NSMutableDictionary)idToNodeDictionary
{
  NSMutableDictionary *idToNodeDictionary;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  idToNodeDictionary = self->_idToNodeDictionary;
  if (!idToNodeDictionary)
  {
    v4 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[CKCurrentConversationsManager cacheSize](self, "cacheSize"));
    v5 = self->_idToNodeDictionary;
    self->_idToNodeDictionary = v4;

    idToNodeDictionary = self->_idToNodeDictionary;
  }
  return idToNodeDictionary;
}

- (unint64_t)cacheSize
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conversationCacheSize");

  if (!v3 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "CKCurrentConversationsManager: Conversation cache size is zero!", v6, 2u);
    }

  }
  return v3;
}

- (void)setCurrentConversations:(id)a3
{
  objc_storeStrong((id *)&self->_currentConversations, a3);
}

- (void)setIdToNodeDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_idToNodeDictionary, a3);
}

- (void)setOrderedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_orderedKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_idToNodeDictionary, 0);
  objc_storeStrong((id *)&self->_currentConversations, 0);
}

@end
