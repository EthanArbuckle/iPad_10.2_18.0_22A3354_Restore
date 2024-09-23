@implementation IMDRecentsController

+ (IMDRecentsController)sharedInstance
{
  if (qword_1ED935D30 != -1)
    dispatch_once(&qword_1ED935D30, &unk_1E922EF98);
  return (IMDRecentsController *)(id)qword_1ED935E70;
}

- (void)_setTimerForPruningTypingContext
{
  IMTimer *v3;
  IMTimer *typingContextTimer;

  if (!self->_typingContextTimer)
  {
    v3 = (IMTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AE0]), "initWithTimeInterval:name:shouldWake:target:selector:userInfo:", CFSTR("typing-indicator-cleanup"), 0, self, sel___pruneTypingContexts, 0, 1500.0);
    typingContextTimer = self->_typingContextTimer;
    self->_typingContextTimer = v3;

  }
}

- (void)__pruneTypingContexts
{
  IMTimer *typingContextTimer;
  NSMutableDictionary *typingContext;
  NSMutableDictionary *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  -[IMTimer invalidate](self->_typingContextTimer, "invalidate");
  typingContextTimer = self->_typingContextTimer;
  self->_typingContextTimer = 0;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1D15CD0E8;
  v11 = sub_1D15CD0F8;
  v12 = 0;
  typingContext = self->_typingContext;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D15CD100;
  v6[3] = &unk_1E922EFC0;
  v6[4] = &v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](typingContext, "enumerateKeysAndObjectsUsingBlock:", v6);
  if (objc_msgSend((id)v8[5], "count"))
    -[NSMutableDictionary removeObjectsForKeys:](self->_typingContext, "removeObjectsForKeys:", v8[5]);
  if (!-[NSMutableDictionary count](self->_typingContext, "count"))
  {
    v5 = self->_typingContext;
    self->_typingContext = 0;

  }
  if (-[NSMutableDictionary count](self->_typingContext, "count"))
    -[IMDRecentsController _setTimerForPruningTypingContext](self, "_setTimerForPruningTypingContext");
  _Block_object_dispose(&v7, 8);

}

- (BOOL)hasRecentlyMessaged:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          -[NSMutableDictionary objectForKey:](self->_typingContext, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10 && !sub_1D15CD184(v10))
          {

            v12 = 1;
            goto LABEL_14;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_14:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)noteRecentMessageForPeople:(id)a3
{
  id v4;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *typingContext;
  void *v7;
  id v8;
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
  if (objc_msgSend(v4, "count"))
  {
    if (!self->_typingContext)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      typingContext = self->_typingContext;
      self->_typingContext = Mutable;

    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 300.0);
    if (v7)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = v4;
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
            -[NSMutableDictionary setObject:forKey:](self->_typingContext, "setObject:forKey:", v7, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }

    }
    -[IMDRecentsController _setTimerForPruningTypingContext](self, "_setTimerForPruningTypingContext", (_QWORD)v13);

  }
}

- (void)updateLatestActiveDestination:(id)a3 ForHandle:(id)a4 incomingType:(unsigned __int8)a5
{
  int v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  IMDMessageActiveDevice *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *activeDeviceForHandle;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v18;
  id v19;

  v5 = a5;
  v19 = a3;
  v8 = a4;
  if (v19 && v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v10 = v9;
    if (v9)
    {
      if (v5 == 1)
        v11 = v9;
      else
        v11 = 0;
      v12 = v11;
      v13 = -[IMDMessageActiveDevice initWithIDSDestination:latestDate:latestReadReceiptDate:hasReceivedReadReceipt:]([IMDMessageActiveDevice alloc], "initWithIDSDestination:latestDate:latestReadReceiptDate:hasReceivedReadReceipt:", v19, v10, v12, v5 == 1);
      -[NSMutableDictionary objectForKey:](self->_activeDeviceForHandle, "objectForKey:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 && objc_msgSend(v14, "isEqual:", v13))
      {
        objc_msgSend(v15, "setLatestActiveDate:", v10);
        if (v5 == 1)
        {
          objc_msgSend(v15, "setHasReceivedReadReceipt:", 1);
          objc_msgSend(v15, "setLatestReadReceipt:", v10);
        }
      }
      else
      {
        activeDeviceForHandle = self->_activeDeviceForHandle;
        if (!activeDeviceForHandle)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          v18 = self->_activeDeviceForHandle;
          self->_activeDeviceForHandle = Mutable;

          activeDeviceForHandle = self->_activeDeviceForHandle;
        }
        -[NSMutableDictionary setObject:forKey:](activeDeviceForHandle, "setObject:forKey:", v13, v8);
      }

    }
  }

}

- (id)activeDeviceForHandle:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_activeDeviceForHandle, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDeviceForHandle, 0);
  objc_storeStrong((id *)&self->_typingContextTimer, 0);
  objc_storeStrong((id *)&self->_typingContext, 0);
}

@end
