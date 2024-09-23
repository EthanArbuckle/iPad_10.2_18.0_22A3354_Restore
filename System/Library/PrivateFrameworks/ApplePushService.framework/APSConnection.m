@implementation APSConnection

uint64_t __60__APSConnection__dispatch_async_to_ivarQueue_shutdownBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__APSConnection__connectIfNecessaryOnIvarQueue__block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v6 = CFSTR("no reply received!");
    goto LABEL_7;
  }
  v5 = MEMORY[0x1A1AC945C](v3);
  if (v5 == MEMORY[0x1E0C81310])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_7;
LABEL_10:
    APSGetEnabledTopicsFromXPCDictionary(v4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    APSGetIgnoredTopicsFromXPCDictionary(v4);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1[7] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    APSGetOpportunisticTopicsFromXPCDictionary(v4);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1[8] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    APSGetNonWakingTopicsFromXPCDictionary(v4);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1[9] + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = APSGetEnableCriticalReliability(v4, 0);
    *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24) = APSGetEnableStatusNotifications(v4, 0);
    *(_BYTE *)(*(_QWORD *)(a1[12] + 8) + 24) = APSGetTrackActivityPresence(v4, 0);
    APSGetXPCDataFromDictionary(v4, "publicToken");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1[13] + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    *(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 24) = (int)APSGetXPCIntFromDictionary(v4, "messageSize");
    *(_QWORD *)(*(_QWORD *)(a1[15] + 8) + 24) = (int)APSGetXPCIntFromDictionary(v4, "largeMessageSize");
    v6 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[16] + 8) + 24) = APSGetXPCBoolFromDictionary(v4, "isConnected");
    v9 = 1;
    goto LABEL_11;
  }
  if (v5 == MEMORY[0x1E0C812F8])
    goto LABEL_10;
  v6 = CFSTR("Received reply is not of type dictionary!");
LABEL_7:
  +[APSLog connection](APSLog, "connection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[4];
    *(_DWORD *)buf = 138412546;
    v27 = v8;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_19BBC2000, v7, OS_LOG_TYPE_DEFAULT, "%@ Bad response from apsd: %@", buf, 0x16u);
  }

  v9 = 0;
LABEL_11:
  *(_BYTE *)(*(_QWORD *)(a1[17] + 8) + 24) = v9;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v25 = a1[5];
    if (v25)
      dispatch_semaphore_signal(v25);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[18] + 8) + 40));

}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)_processQueuedTopicMovesOnIvarQueue
{
  uint64_t v3;
  NSArray *v4;
  NSMutableArray *v5;
  NSMutableArray *accumulatedTopicMoves;
  NSMutableArray *v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id *v22;
  NSArray *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *context;
  APSConnection *v50;
  void *v51;
  NSArray *v52;
  NSArray *v53;
  NSArray *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  uint64_t v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1A1AC9000](self, a2);
  v4 = self->_enabledTopics;
  v52 = self->_opportunisticTopics;
  v53 = self->_ignoredTopics;
  v54 = self->_nonWakingTopics;
  v61 = 0;
  v62 = 0;
  v59 = 0;
  v60 = 0;
  os_unfair_lock_lock(&self->_topicMoveLock);
  v5 = self->_accumulatedTopicMoves;
  accumulatedTopicMoves = self->_accumulatedTopicMoves;
  v50 = self;
  self->_accumulatedTopicMoves = 0;

  os_unfair_lock_unlock(&self->_topicMoveLock);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = v5;
  v8 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
  context = (void *)v3;
  if (v8)
  {
    v9 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "topic", context);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "fromListID");
        v14 = objc_msgSend(v11, "toListID");
        v15 = &v62;
        v16 = v4;
        switch(v13)
        {
          case 0:
            goto LABEL_10;
          case 1:
            v15 = &v61;
            v16 = v52;
            goto LABEL_10;
          case 2:
            v15 = &v60;
            v16 = v53;
            goto LABEL_10;
          case 3:
            v15 = &v59;
            v16 = v54;
LABEL_10:
            v17 = v16;
            v18 = v17;
            if (!v17 || !-[NSArray containsObject:](v17, "containsObject:", v12))
              goto LABEL_17;
            v19 = *v15;
            if (!*v15)
            {
              v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v18);
              v21 = *v15;
              *v15 = (void *)v20;

              v19 = *v15;
            }
            objc_msgSend(v19, "removeObject:", v12);
            v22 = &v62;
            v23 = v4;
            switch(v14)
            {
              case 0:
                goto LABEL_21;
              case 1:
                v22 = &v61;
                v23 = v52;
                goto LABEL_21;
              case 2:
                v22 = &v60;
                v23 = v53;
                goto LABEL_21;
              case 3:
                v22 = &v59;
                v23 = v54;
LABEL_21:
                v24 = v23;
                if (!*v22)
                {
                  v26 = objc_alloc(MEMORY[0x1E0C99E20]);
                  if (v24)
                    v27 = objc_msgSend(v26, "initWithArray:", v24);
                  else
                    v27 = objc_msgSend(v26, "initWithCapacity:", 1);
                  v28 = *v22;
                  *v22 = (id)v27;

                }
                objc_msgSend(*v22, "addObject:", v12);
                break;
              default:
                +[APSLog connection](APSLog, "connection");
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v64 = v12;
                  v65 = 2048;
                  v66 = v14;
                  _os_log_fault_impl(&dword_19BBC2000, v24, OS_LOG_TYPE_FAULT, "Unable to move topic %@, The to list is not valid! %lu", buf, 0x16u);
                }
                break;
            }
            break;
          default:
            v18 = 0;
LABEL_17:
            +[APSLog connection](APSLog, "connection");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              -[APSConnection _topicListNameForLogging:](v50, "_topicListNameForLogging:", v14);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v64 = v12;
              v65 = 2112;
              v66 = (uint64_t)v25;
              _os_log_error_impl(&dword_19BBC2000, v24, OS_LOG_TYPE_ERROR, "Unable to move topic %@, This topic was not in the list provided! %@", buf, 0x16u);

            }
            break;
        }

      }
      v8 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    }
    while (v8);
    v30 = v61;
    v29 = v62;
    v31 = v59;
    v8 = v60;
  }
  else
  {
    v31 = 0;
    v30 = 0;
    v29 = 0;
  }
  v51 = v29;
  v32 = v7;

  objc_msgSend(v29, "allObjects");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = (void *)v33;
  else
    v35 = v4;
  v36 = v35;

  objc_msgSend(v30, "allObjects");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (v37)
    v39 = (void *)v37;
  else
    v39 = v52;
  v40 = v39;

  objc_msgSend(v8, "allObjects");
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v41;
  if (v41)
    v43 = (void *)v41;
  else
    v43 = v53;
  v44 = v43;

  objc_msgSend(v31, "allObjects");
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v45;
  if (v45)
    v47 = (void *)v45;
  else
    v47 = v54;
  v48 = v47;

  -[APSConnection _onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:](v50, "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", v36, v44, v40, v48, 1, 0);
  objc_autoreleasePoolPop(context);
}

- (void)moveTopics:(id)a3 fromList:(unint64_t)a4 toList:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  _APSTopicMove *v21;
  dispatch_time_t v22;
  NSObject *ivarQueue;
  NSMutableArray *accumulatedTopicMoves;
  id v25;
  _QWORD block[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  APSConnection *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_msgSend(v8, "count");
  if (a4 != a5 && (a5 | a4) <= 3 && v9)
  {
    +[APSLog connection](APSLog, "connection");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[APSConnection _topicListNameForLogging:](self, "_topicListNameForLogging:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[APSConnection _topicListNameForLogging:](self, "_topicListNameForLogging:", a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v33 = self;
      v34 = 2112;
      v35 = v8;
      v36 = 2112;
      v37 = v11;
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_19BBC2000, v10, OS_LOG_TYPE_DEFAULT, "%@ moveTopics %@ fromList %@ toList %@", buf, 0x2Au);

    }
    os_unfair_lock_lock(&self->_topicMoveLock);
    accumulatedTopicMoves = self->_accumulatedTopicMoves;
    if (!accumulatedTopicMoves)
    {
      v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = self->_accumulatedTopicMoves;
      self->_accumulatedTopicMoves = v13;

    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = v8;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v21 = objc_alloc_init(_APSTopicMove);
          -[_APSTopicMove setTopic:](v21, "setTopic:", v20);
          -[_APSTopicMove setFromListID:](v21, "setFromListID:", a4);
          -[_APSTopicMove setToListID:](v21, "setToListID:", a5);
          -[NSMutableArray addObject:](self->_accumulatedTopicMoves, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v17);
    }

    os_unfair_lock_unlock(&self->_topicMoveLock);
    v8 = v25;
    if (!accumulatedTopicMoves)
    {
      v22 = dispatch_time(0, 500000000);
      ivarQueue = self->_ivarQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__APSConnection_moveTopics_fromList_toList___block_invoke;
      block[3] = &unk_1E3C8B240;
      block[4] = self;
      dispatch_after(v22, ivarQueue, block);
    }
  }

}

- (id)_topicListNameForLogging:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("Unknown List");
  else
    return off_1E3C8BE98[a3];
}

- (void)_onIvarQueue_setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 sendToDaemon:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  NSArray *v25;
  NSArray *enabledTopics;
  NSArray *v27;
  NSArray *ignoredTopics;
  NSArray *v29;
  NSArray *opportunisticTopics;
  NSArray *v31;
  NSArray *nonWakingTopics;
  char v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  OS_xpc_object *connection;
  NSObject *ivarQueue;
  _QWORD handler[5];
  id v45;
  uint8_t buf[4];
  APSConnection *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v9 = a7;
  v60 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  +[APSLog connection](APSLog, "connection");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v9)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v21 = (void *)MEMORY[0x1A1AC918C](v18);
    *(_DWORD *)buf = 138413826;
    v47 = self;
    v48 = 2112;
    v49 = v14;
    v50 = 2112;
    v51 = v15;
    v52 = 2112;
    v53 = v16;
    v54 = 2112;
    v55 = v17;
    v56 = 2112;
    v57 = v20;
    v58 = 2112;
    v59 = v21;
    _os_log_impl(&dword_19BBC2000, v19, OS_LOG_TYPE_DEFAULT, "%@ setEnabledTopics %@ ignoredTopics %@ opportunisticTopics %@ nonWakingTopics %@ sendToDaemon: %@ completion: %@", buf, 0x48u);

  }
  v22 = (void *)MEMORY[0x1A1AC9000]();
  v23 = !-[NSArray isEqualToArray:](self->_enabledTopics, "isEqualToArray:", v14)
     || !-[NSArray isEqualToArray:](self->_ignoredTopics, "isEqualToArray:", v15)
     || !-[NSArray isEqualToArray:](self->_opportunisticTopics, "isEqualToArray:", v16)
     || !-[NSArray isEqualToArray:](self->_nonWakingTopics, "isEqualToArray:", v17);
  if (!-[NSArray count](self->_enabledTopics, "count")
    && !-[NSArray count](self->_ignoredTopics, "count")
    && !-[NSArray count](self->_opportunisticTopics, "count")
    && !-[NSArray count](self->_nonWakingTopics, "count"))
  {
    +[APSLog connection](APSLog, "connection");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = self;
      _os_log_impl(&dword_19BBC2000, v24, OS_LOG_TYPE_DEFAULT, "%@ got all nil topics, considering this as a change to flush any cached topics in apsd for named ports.", buf, 0xCu);
    }

    v23 = 1;
  }
  if (v9)
    -[APSConnection _connectIfNecessaryOnIvarQueue](self, "_connectIfNecessaryOnIvarQueue");
  v25 = (NSArray *)objc_msgSend(v14, "copy");
  enabledTopics = self->_enabledTopics;
  self->_enabledTopics = v25;

  v27 = (NSArray *)objc_msgSend(v15, "copy");
  ignoredTopics = self->_ignoredTopics;
  self->_ignoredTopics = v27;

  v29 = (NSArray *)objc_msgSend(v16, "copy");
  opportunisticTopics = self->_opportunisticTopics;
  self->_opportunisticTopics = v29;

  v31 = (NSArray *)objc_msgSend(v17, "copy");
  nonWakingTopics = self->_nonWakingTopics;
  self->_nonWakingTopics = v31;

  v33 = !v23;
  if (!self->_connection)
    v33 = 1;
  if ((v33 & 1) != 0 || !v9)
  {
    +[APSLog connection](APSLog, "connection");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = self;
      _os_log_impl(&dword_19BBC2000, v34, OS_LOG_TYPE_DEFAULT, "APS %@ _connection is NULL in _sendEnabledTopics:ignoredTopics:opportunisticTopics:!", buf, 0xCu);
    }
  }
  else
  {
    v34 = xpc_dictionary_create(0, 0, 0);
    v35 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(v34, v35, v36, v37, v38, v39, v40, v41, 1);
    APSInsertEnabledTopicsToXPCDictionary(v34, self->_enabledTopics);
    APSInsertIgnoredTopicsToXPCDictionary(v34, self->_ignoredTopics);
    APSInsertOpportunisticTopicsToXPCDictionary(v34, self->_opportunisticTopics);
    APSInsertNonWakingTopicsToXPCDictionary(v34, self->_nonWakingTopics);
    connection = self->_connection;
    ivarQueue = self->_ivarQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke;
    handler[3] = &unk_1E3C8B6E8;
    handler[4] = self;
    v45 = v18;
    xpc_connection_send_message_with_reply(connection, v34, ivarQueue, handler);

  }
  objc_autoreleasePoolPop(v22);

}

- (void)_connectIfNecessaryOnIvarQueue
{
  OUTLINED_FUNCTION_0(&dword_19BBC2000, a1, a3, "Connection timed out trying to communicate with apsd", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __65__APSConnection__asyncOnDelegateQueueWithBlock_requiresDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1A1AC9000]();
  objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || !*(_BYTE *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v2);
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

uint64_t __33__APSConnection_largeMessageSize__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  return result;
}

- (void)_deliverPublicTokenOnIvarQueue:(id)a3 withCompletionBlock:(id)a4
{
  NSData *v7;
  void (**v8)(id, id);
  NSObject *v9;
  NSData *publicToken;
  _QWORD v11[5];
  NSData *v12;
  void (**v13)(id, id);
  uint8_t buf[4];
  APSConnection *v15;
  __int16 v16;
  NSData *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = (NSData *)a3;
  v8 = (void (**)(id, id))a4;
  +[APSLog connection](APSLog, "connection");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_19BBC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ Delivering publicToken from apsd: %@", buf, 0x16u);
  }

  publicToken = self->_publicToken;
  if (publicToken == v7 || publicToken && -[NSData isEqualToData:](v7, "isEqualToData:"))
  {
    if (v8)
      v8[2](v8, v7);
  }
  else
  {
    objc_storeStrong((id *)&self->_publicToken, a3);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__APSConnection__deliverPublicTokenOnIvarQueue_withCompletionBlock___block_invoke;
    v11[3] = &unk_1E3C8B980;
    v11[4] = self;
    v12 = v7;
    v13 = v8;
    -[APSConnection _asyncOnDelegateQueueWithBlock:](self, "_asyncOnDelegateQueueWithBlock:", v11);

  }
}

void __68__APSConnection__deliverPublicTokenOnIvarQueue_withCompletionBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[APSLog connection](APSLog, "connection");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ calling %@ didReceivePublicToken:", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v3, "connection:didReceivePublicToken:", a1[4], a1[5]);
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, a1[5]);
  +[APSLog connection](APSLog, "connection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[4];
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_19BBC2000, v7, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didReceivePublicToken:", (uint8_t *)&v9, 0x16u);
  }

}

void __48__APSConnection__deliverDidReconnectOnIvarQueue__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[APSLog connection](APSLog, "connection");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ Calling %@ connectionDidReconnect", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(v3, "connectionDidReconnect:", *(_QWORD *)(a1 + 32));
    +[APSLog connection](APSLog, "connection");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_19BBC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ connectionDidReconnect", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)setMessageSize:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  APSConnection *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ setMessageSize: %lu", buf, 0x16u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__APSConnection_setMessageSize___block_invoke;
  v6[3] = &unk_1E3C8B850;
  v6[4] = self;
  v6[5] = a3;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v6);
}

- (void)setLargeMessageSize:(unint64_t)a3
{
  NSObject *v5;
  NSObject *ivarQueue;
  _QWORD v7[6];
  uint8_t buf[4];
  APSConnection *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v9 = self;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ setLargeMessageSize: %lu", buf, 0x16u);
  }

  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__APSConnection_setLargeMessageSize___block_invoke;
  v7[3] = &unk_1E3C8B850;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(ivarQueue, v7);
}

- (void)_setTrackActivityPresence:(BOOL)a3 sendToDaemon:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  _QWORD v10[5];
  BOOL v11;
  BOOL v12;
  uint8_t buf[4];
  APSConnection *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v14 = self;
    v16 = v9;
    v15 = 2112;
    if (v4)
      v8 = CFSTR("YES");
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_19BBC2000, v7, OS_LOG_TYPE_DEFAULT, "%@ _setTrackActivityPresence %@ sendToDaemon %@", buf, 0x20u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__APSConnection__setTrackActivityPresence_sendToDaemon___block_invoke;
  v10[3] = &unk_1E3C8B828;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v10);
}

- (void)_setEnableCriticalReliability:(BOOL)a3 sendToDaemon:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  _QWORD v10[5];
  BOOL v11;
  BOOL v12;
  uint8_t buf[4];
  APSConnection *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v14 = self;
    v16 = v9;
    v15 = 2112;
    if (v4)
      v8 = CFSTR("YES");
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_19BBC2000, v7, OS_LOG_TYPE_DEFAULT, "%@ setEnableCriticalReliability %@ sendToDaemon %@", buf, 0x20u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__APSConnection__setEnableCriticalReliability_sendToDaemon___block_invoke;
  v10[3] = &unk_1E3C8B828;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v10);
}

- (void)_deliverPublicToken:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  APSConnection *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[APSLog connection](APSLog, "connection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ Async Delivering publicToken from apsd: %@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__APSConnection__deliverPublicToken_withCompletionBlock___block_invoke;
  v11[3] = &unk_1E3C8B8E0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v11);

}

- (void)_deliverDidReconnectOnIvarQueue
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  APSConnection *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_19BBC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ Delivering did reconnect apsd", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__APSConnection__deliverDidReconnectOnIvarQueue__block_invoke;
  v4[3] = &unk_1E3C8B958;
  v4[4] = self;
  -[APSConnection _asyncOnDelegateQueueWithBlock:](self, "_asyncOnDelegateQueueWithBlock:", v4);
}

- (void)_deliverConnectionStatusChange:(BOOL)a3
{
  _BOOL4 v4;
  NSObject *v5;
  const __CFString *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  APSConnection *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_isDeallocing && !self->_isShutdown)
  {
    v4 = a3;
    +[APSLog connection](APSLog, "connection");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v4)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ Delivering connectionStatusChange from apsd: %@", buf, 0x16u);
    }

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__APSConnection__deliverConnectionStatusChange___block_invoke;
    v7[3] = &unk_1E3C8B9D0;
    v7[4] = self;
    v8 = v4;
    -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v7);
  }
}

uint64_t __44__APSConnection_moveTopics_fromList_toList___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processQueuedTopicMovesOnIvarQueue");
}

uint64_t __37__APSConnection_setLargeMessageSize___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __32__APSConnection_setMessageSize___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = *(_QWORD *)(result + 40);
  return result;
}

- (void)moveTopic:(id)a3 fromList:(unint64_t)a4 toList:(unint64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11 = a3;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = a3;
    objc_msgSend(v8, "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[APSConnection moveTopics:fromList:toList:](self, "moveTopics:fromList:toList:", v10, a4, a5, v11, v12);
  }
}

uint64_t __57__APSConnection__deliverPublicToken_withCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deliverPublicTokenOnIvarQueue:withCompletionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __28__APSConnection_messageSize__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  return result;
}

void __33__APSConnection__deliverMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  char v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  uint8_t buf[4];
  _QWORD *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "containsObject:", *(_QWORD *)(a1 + 40));
  v4 = MEMORY[0x1E0C809B0];
  if ((v3 & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "containsObject:", CFSTR("*")) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "containsObject:", CFSTR("*")) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "containsObject:", CFSTR("*")))
  {
    dispatch_group_enter(v2);
    v5 = *(void **)(a1 + 32);
    v16[0] = v4;
    v16[1] = 3221225472;
    v16[2] = __33__APSConnection__deliverMessage___block_invoke_2;
    v16[3] = &unk_1E3C8B930;
    v16[4] = v5;
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 40);
    v20 = v2;
    objc_msgSend(v5, "_asyncOnDelegateQueueWithBlock:", v16);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = v9[24];
      v12 = v9[26];
      v13 = v9[27];
      *(_DWORD *)buf = 138413314;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v12;
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ Received message from apsd: %@ but it didn't match the enabled topics: %@ or opportunistic topics: %@ or non-waking topics: %@", buf, 0x34u);
    }

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 16);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __33__APSConnection__deliverMessage___block_invoke_126;
  block[3] = &unk_1E3C8B590;
  block[4] = v6;
  v15 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, v7, block);

}

void __51__APSConnection__deliverToken_forTopic_identifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "debugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ Received token %@ forTopic %@ identifier %@", buf, 0x2Au);

  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __51__APSConnection__deliverToken_forTopic_identifier___block_invoke_138;
      v9[3] = &unk_1E3C8BA48;
      v9[4] = v8;
      v10 = v7;
      v11 = *(id *)(a1 + 48);
      v12 = *(id *)(a1 + 56);
      objc_msgSend(v8, "_asyncOnDelegateQueueWithBlock:", v9);

    }
  }
}

void __29__APSConnection_setDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC9000]();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v5;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 1;
    +[APSLog connection](APSLog, "connection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = objc_msgSend(*(id *)(v9 + 128), "count");
      *(_DWORD *)buf = 138412546;
      v25 = v9;
      v26 = 2048;
      v27 = v10;
      _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ Delivering queued delegate calls: %lu", buf, 0x16u);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)MEMORY[0x1A1AC918C](*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15));
          objc_msgSend(*(id *)(a1 + 32), "_asyncOnDelegateQueueWithBlock:", v16, (_QWORD)v19);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 128);
    *(_QWORD *)(v17 + 128) = 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "setEnableStatusNotifications:", objc_opt_respondsToSelector() & 1);
  objc_autoreleasePoolPop(v2);
}

- (void)_asyncOnDelegateQueueWithBlock:(id)a3 requiresDelegate:(BOOL)a4
{
  id v6;
  void *v7;
  CUTWeakReference *delegateReference;
  NSObject *v9;
  NSMutableArray *queuedDelegateBlocks;
  NSMutableArray *v11;
  NSMutableArray *v12;
  dispatch_time_t v13;
  NSObject *ivarQueue;
  NSObject *v15;
  CUTWeakReference *v16;
  NSObject *delegateQueue;
  _QWORD v18[5];
  _QWORD block[4];
  CUTWeakReference *v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  APSConnection *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1A1AC9000]();
    delegateReference = self->_delegateReference;
    if (!delegateReference && a4)
      goto LABEL_19;
    if (self->_delegateQueue)
    {
      v16 = delegateReference;
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__APSConnection__asyncOnDelegateQueueWithBlock_requiresDelegate___block_invoke;
      block[3] = &unk_1E3C8B5B8;
      v20 = v16;
      v22 = a4;
      v21 = v6;
      v15 = v16;
      dispatch_async(delegateQueue, block);

LABEL_15:
      objc_autoreleasePoolPop(v7);
      goto LABEL_16;
    }
    if (!delegateReference)
    {
LABEL_19:
      if (!self->_everHadDelegate)
      {
        +[APSLog connection](APSLog, "connection");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = self;
          _os_log_impl(&dword_19BBC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ queuing call to delegate to tolerate setDelegate race", buf, 0xCu);
        }

        queuedDelegateBlocks = self->_queuedDelegateBlocks;
        if (!queuedDelegateBlocks)
        {
          v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v12 = self->_queuedDelegateBlocks;
          self->_queuedDelegateBlocks = v11;

          v13 = dispatch_time(0, 5000000000);
          ivarQueue = self->_ivarQueue;
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __65__APSConnection__asyncOnDelegateQueueWithBlock_requiresDelegate___block_invoke_51;
          v18[3] = &unk_1E3C8B240;
          v18[4] = self;
          dispatch_after(v13, ivarQueue, v18);
          queuedDelegateBlocks = self->_queuedDelegateBlocks;
        }
        v15 = MEMORY[0x1A1AC918C](v6);
        -[NSMutableArray addObject:](queuedDelegateBlocks, "addObject:", v15);
        goto LABEL_15;
      }
    }
    +[APSLog connection](APSLog, "connection");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = self;
      _os_log_impl(&dword_19BBC2000, v15, OS_LOG_TYPE_DEFAULT, "%@ dropping delegate call, no delegate", buf, 0xCu);
    }
    goto LABEL_15;
  }
LABEL_16:

}

- (void)_asyncOnDelegateQueueWithBlock:(id)a3
{
  -[APSConnection _asyncOnDelegateQueueWithBlock:requiresDelegate:](self, "_asyncOnDelegateQueueWithBlock:requiresDelegate:", a3, 1);
}

- (void)setEnableStatusNotifications:(BOOL)a3
{
  -[APSConnection _setEnableStatusNotifications:sendToDaemon:](self, "_setEnableStatusNotifications:sendToDaemon:", a3, 1);
}

- (void)_setEnabledTopics:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__APSConnection__setEnabledTopics___block_invoke;
  v6[3] = &unk_1E3C8B590;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v6);

}

- (APSConnection)initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  APSConnection *v12;
  int v14;
  APSConnection *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[APSLog connection](APSLog, "connection");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138413058;
    v15 = self;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_19BBC2000, v11, OS_LOG_TYPE_DEFAULT, "Initializing APSConnection %@: env=%@ port=%@ queue=%@", (uint8_t *)&v14, 0x2Au);
  }

  v12 = -[APSConnection _initWithEnvironmentName:namedDelegatePort:enablePushDuringSleep:personaUniqueString:queue:](self, "_initWithEnvironmentName:namedDelegatePort:enablePushDuringSleep:personaUniqueString:queue:", v8, v9, 0, 0, v10);
  return v12;
}

- (id)_initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 enablePushDuringSleep:(BOOL)a5 personaUniqueString:(id)a6 queue:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  APSConnection *v16;
  char *v17;
  id v18;
  dispatch_queue_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  _DWORD *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  BOOL v32;
  int v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  BOOL v37;
  kern_return_t v38;
  mach_error_t v39;
  NSObject *v40;
  dispatch_queue_t v41;
  void *v42;
  dispatch_source_t v43;
  void *v44;
  NSObject *v45;
  _QWORD v47[4];
  char *v48;
  _QWORD handler[4];
  id v50;
  uint8_t *v51;
  objc_super v52;
  uint8_t buf[16];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if ((_os_feature_enabled_impl() & 1) != 0 || !objc_msgSend(v13, "length"))
  {
    v52.receiver = self;
    v52.super_class = (Class)APSConnection;
    v17 = -[APSConnection init](&v52, sel_init);
    if (!v17)
    {
LABEL_32:
      self = v17;
      v16 = self;
      goto LABEL_33;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("APSConnection-ivarQueue: %@"), v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = dispatch_queue_create((const char *)objc_msgSend(v18, "UTF8String"), 0);
    v20 = (void *)*((_QWORD *)v17 + 2);
    *((_QWORD *)v17 + 2) = v19;

    v21 = objc_msgSend(v11, "copy");
    v22 = (void *)*((_QWORD *)v17 + 3);
    *((_QWORD *)v17 + 3) = v21;

    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24 = (void *)*((_QWORD *)v17 + 9);
    *((_QWORD *)v17 + 9) = v23;

    *((_DWORD *)v17 + 16) = 0;
    v25 = v17 + 64;
    *((_QWORD *)v17 + 10) = 1;
    *(int64x2_t *)(v17 + 40) = vdupq_n_s64(0x1400uLL);
    *((_DWORD *)v17 + 47) = 0;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "processName");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v17 + 17);
    *((_QWORD *)v17 + 17) = v27;

    v29 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.aps.ignore.namedPort"));
    v30 = v12;
    v31 = v30;
    v32 = 0;
    v12 = v30;
    if (v30 && (v29 & 1) == 0)
    {
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      *(_OWORD *)buf = 0u;
      v54 = 0u;
      if ((objc_msgSend(v30, "getCString:maxLength:encoding:", buf, 128, 4) & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s unable to convert nameOfPort argument to UTF8 string less than %i characters"), "-[APSConnection _initWithEnvironmentName:namedDelegatePort:enablePushDuringSleep:personaUniqueString:queue:]", 128);
      v33 = bootstrap_check_in2();
      v32 = v33 != 0;
      v12 = v31;
      if (v33)
      {
        NSLog(CFSTR("Unable to bootstrap_check_in() to namedDelegatePort '%@'. APS connections will not persist past process lifetime."), v31);

        v12 = 0;
        *v25 = 0;
      }
    }
    v34 = objc_msgSend(v12, "copy");
    v35 = (void *)*((_QWORD *)v17 + 7);
    *((_QWORD *)v17 + 7) = v34;

    if ((v29 & 1) != 0)
    {
      +[APSLog connection](APSLog, "connection");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19BBC2000, v36, OS_LOG_TYPE_DEFAULT, "Client opted out of using a mach port", buf, 2u);
      }
    }
    else
    {
      v37 = !v32;
      if (!v31)
        v37 = 0;
      if (v37)
        goto LABEL_22;
      +[APSLog connection](APSLog, "connection");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[APSConnection _initWithEnvironmentName:namedDelegatePort:enablePushDuringSleep:personaUniqueString:queue:].cold.1();
    }

LABEL_22:
    if (objc_msgSend(*((id *)v17 + 7), "length"))
    {
      if ((*v25 + 1) <= 1
        && (v38 = mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, (mach_port_name_t *)v17 + 16)) != 0)
      {
        v39 = v38;
        +[APSLog connection](APSLog, "connection");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19BBC2000, v40, OS_LOG_TYPE_DEFAULT, "Failed allocating and checking into port", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s unable to allocate delegate port: %s"), "-[APSConnection _initWithEnvironmentName:namedDelegatePort:enablePushDuringSleep:personaUniqueString:queue:]", mach_error_string(v39));
      }
      else
      {
        v41 = dispatch_queue_create("APSPortQueue", 0);
        v42 = (void *)*((_QWORD *)v17 + 11);
        *((_QWORD *)v17 + 11) = v41;

        v43 = dispatch_source_create(MEMORY[0x1E0C80D98], *((unsigned int *)v17 + 16), 0, *((dispatch_queue_t *)v17 + 11));
        v44 = (void *)*((_QWORD *)v17 + 12);
        *((_QWORD *)v17 + 12) = v43;

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&v54 = 0x3032000000;
        *((_QWORD *)&v54 + 1) = __Block_byref_object_copy_;
        *(_QWORD *)&v55 = __Block_byref_object_dispose_;
        *((_QWORD *)&v55 + 1) = *((id *)v17 + 12);
        v45 = *((_QWORD *)v17 + 12);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __108__APSConnection__initWithEnvironmentName_namedDelegatePort_enablePushDuringSleep_personaUniqueString_queue___block_invoke;
        handler[3] = &unk_1E3C8B568;
        v51 = buf;
        v50 = v12;
        dispatch_source_set_event_handler(v45, handler);
        dispatch_resume(*((dispatch_object_t *)v17 + 12));

        _Block_object_dispose(buf, 8);
      }
    }
    if (v14)
    {
      objc_storeStrong((id *)v17 + 14, a7);
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __108__APSConnection__initWithEnvironmentName_namedDelegatePort_enablePushDuringSleep_personaUniqueString_queue___block_invoke_38;
      v47[3] = &unk_1E3C8B240;
      v48 = v17;
      objc_msgSend(v48, "_dispatch_async_to_ivarQueue:", v47);

    }
    goto LABEL_32;
  }
  +[APSLog connection](APSLog, "connection");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl(&dword_19BBC2000, v15, OS_LOG_TYPE_DEFAULT, "Given specific persona string, feature flag is not enabled {personaUniqueString: %@}", buf, 0xCu);
  }

  v16 = 0;
LABEL_33:

  return v16;
}

- (void)_deliverMessage:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  APSConnection *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[APSLog connection](APSLog, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "identifier");
    objc_msgSend(v4, "topic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v21 = self;
    v22 = 2112;
    v23 = v4;
    v24 = 2048;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ Delivering message from apsd: %@ %lu %@", buf, 0x2Au);

  }
  +[APSLog PUSHTRACE](APSLog, "PUSHTRACE");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "tracingUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ Delivering message from apsd. UUID: %@", buf, 0x16u);

  }
  objc_msgSend(v4, "topic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[APSLog connection](APSLog, "connection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      v13 = "%@ Received empty APS message from apsd";
      v14 = v12;
      v15 = 12;
LABEL_16:
      _os_log_impl(&dword_19BBC2000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (!objc_msgSend(v10, "length"))
  {
    +[APSLog connection](APSLog, "connection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v4;
      v13 = "%@ Received empty topic from apsd: %@";
LABEL_15:
      v14 = v12;
      v15 = 22;
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!v11)
  {
    +[APSLog connection](APSLog, "connection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v4;
      v13 = "%@ Received empty userInfo from apsd: %@";
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __33__APSConnection__deliverMessage___block_invoke;
  v16[3] = &unk_1E3C8B788;
  v16[4] = self;
  v17 = v10;
  v18 = v4;
  v19 = v11;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v16);

LABEL_18:
}

void __33__APSConnection__deliverMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[APSLog connection](APSLog, "connection");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(*(id *)(a1 + 40), "identifier");
    APSLoggableDescriptionForObjectOnTopic_NoLoad(*(void **)(a1 + 48), *(void **)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 56);
    v17 = 138413314;
    v18 = v5;
    v19 = 2112;
    v20 = v3;
    v21 = 2048;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ making delegate (%@) calls to deliver message %lu %@ for topic %@", (uint8_t *)&v17, 0x34u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[APSLog connection](APSLog, "connection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v17 = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_19BBC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ calling %@ connection:didReceiveMessageForTopic:", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(v3, "connection:didReceiveMessageForTopic:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    +[APSLog connection](APSLog, "connection");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v17 = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_19BBC2000, v11, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ connection:didReceiveMessageForTopic:", (uint8_t *)&v17, 0x16u);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[APSLog connection](APSLog, "connection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v17 = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_19BBC2000, v13, OS_LOG_TYPE_DEFAULT, "%@ calling %@ connection:didReceiveIncomingMessage:", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(v3, "connection:didReceiveIncomingMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    +[APSLog connection](APSLog, "connection");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 138412546;
      v18 = v16;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_19BBC2000, v15, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ connection:didReceiveIncomingMessage:", (uint8_t *)&v17, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

- (void)requestTokenForTopic:(id)a3 identifier:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  _QWORD v10[5];
  __CFString *v11;
  id v12;
  uint8_t buf[4];
  APSConnection *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  +[APSLog connection](APSLog, "connection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@: Requesting per-app token for topic %@ and identifier %@", buf, 0x20u);
  }

  if (v6)
  {
    v9 = &stru_1E3C8CB18;
    if (v7)
      v9 = v7;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__APSConnection_requestTokenForTopic_identifier___block_invoke;
    v10[3] = &unk_1E3C8B7B0;
    v10[4] = self;
    v7 = v9;
    v11 = v7;
    v12 = v6;
    -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v10);

  }
}

- (void)_deliverToken:(id)a3 forTopic:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__APSConnection__deliverToken_forTopic_identifier___block_invoke;
  v14[3] = &unk_1E3C8B788;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v14);

}

- (void)_setEnableStatusNotifications:(BOOL)a3 sendToDaemon:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  _QWORD v10[5];
  BOOL v11;
  BOOL v12;
  uint8_t buf[4];
  APSConnection *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v14 = self;
    v16 = v9;
    v15 = 2112;
    if (v4)
      v8 = CFSTR("YES");
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_19BBC2000, v7, OS_LOG_TYPE_DEFAULT, "%@ _setEnableStatusNotifications %@ sendToDaemon %@", buf, 0x20u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__APSConnection__setEnableStatusNotifications_sendToDaemon___block_invoke;
  v10[3] = &unk_1E3C8B828;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v10);
}

- (void)_dispatch_async_to_ivarQueue:(id)a3 shutdownBlock:(id)a4
{
  id v5;
  NSObject *ivarQueue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a3;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__APSConnection__dispatch_async_to_ivarQueue_shutdownBlock___block_invoke;
  block[3] = &unk_1E3C8B908;
  v9 = v5;
  v7 = v5;
  dispatch_async(ivarQueue, block);

}

- (void)_dispatch_async_to_ivarQueue:(id)a3
{
  -[APSConnection _dispatch_async_to_ivarQueue:shutdownBlock:](self, "_dispatch_async_to_ivarQueue:shutdownBlock:", a3, 0);
}

uint64_t __35__APSConnection__setEnabledTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216), 1, 0);
}

void __47__APSConnection__connectIfNecessaryOnIvarQueue__block_invoke(uint64_t a1, void *a2)
{
  aps_connection_event_handler(*(void **)(a1 + 32), a2);
}

- (unint64_t)messageSize
{
  NSObject *ivarQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__APSConnection_messageSize__block_invoke;
  v5[3] = &unk_1E3C8B7D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)largeMessageSize
{
  NSObject *ivarQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__APSConnection_largeMessageSize__block_invoke;
  v5[3] = &unk_1E3C8B7D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke_2;
  v6[3] = &unk_1E3C8B6C0;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v4, "_handleEvent:withHandler:", a2, v6);

}

- (void)_handleEvent:(id)a3 withHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void (**v10)(_QWORD);
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *string;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, id))a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = (void *)MEMORY[0x1A1AC9000]();
  v12 = MEMORY[0x1A1AC945C](v8);
  if (v12 != MEMORY[0x1E0C81310])
  {
    if (v12 == MEMORY[0x1E0C812F8])
    {
      if (v9)
        v9[2](v9, v8);
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (v8 == (id)MEMORY[0x1E0C81258])
  {
    +[APSLog connection](APSLog, "connection");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_19BBC2000, v17, OS_LOG_TYPE_DEFAULT, "_handleEventWithHandler: Interrupted connection to service", (uint8_t *)&v20, 2u);
    }

    __APSConnectionInterruptedHandlerBlock_block_invoke(v18, self->_connection);
LABEL_14:
    if (!v10)
      goto LABEL_16;
LABEL_15:
    v10[2](v10);
    goto LABEL_16;
  }
  v13 = (id)MEMORY[0x1E0C81260];
  +[APSLog connection](APSLog, "connection");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v8 == v13)
  {
    if (v15)
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_19BBC2000, v14, OS_LOG_TYPE_DEFAULT, "_handleEventWithHandler: Connection Invalid for service", (uint8_t *)&v20, 2u);
    }

    __APSConnectionInvalidationHandlerBlock_block_invoke(v19, self->_connection);
    if (v10)
      goto LABEL_15;
  }
  else
  {
    if (v15)
    {
      string = xpc_dictionary_get_string(v8, (const char *)*MEMORY[0x1E0C81270]);
      v20 = 136315138;
      v21 = string;
      _os_log_impl(&dword_19BBC2000, v14, OS_LOG_TYPE_DEFAULT, "Unexpected error for service: %s", (uint8_t *)&v20, 0xCu);
    }

    if (v10)
      goto LABEL_15;
  }
LABEL_16:
  objc_autoreleasePoolPop(v11);

}

void __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = a1 + 32;
    v5 = v7;
    v8 = *(NSObject **)(v7 + 112);
    if (v8)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke_3;
      v16[3] = &unk_1E3C8B698;
      v16[4] = v5;
      v17 = v4;
      dispatch_async(v8, v16);

    }
    else
    {
      +[APSLog connection](APSLog, "connection");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke_2_cold_1(v6, v9, v10, v11, v12, v13, v14, v15);

    }
  }

}

- (void)_handleEvent:(id)a3 withHandler:(id)a4
{
  -[APSConnection _handleEvent:withHandler:errorHandler:](self, "_handleEvent:withHandler:errorHandler:", a3, a4, 0);
}

uint64_t __48__APSConnection__deliverConnectionStatusChange___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  _BYTE *v3;
  _QWORD v4[5];
  char v5;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 70) != v2)
  {
    *(_BYTE *)(v1 + 70) = v2;
    v3 = *(_BYTE **)(result + 32);
    if (v3[69])
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __48__APSConnection__deliverConnectionStatusChange___block_invoke_2;
      v4[3] = &unk_1E3C8B9A8;
      v4[4] = v3;
      v5 = *(_BYTE *)(result + 40);
      return objc_msgSend(v3, "_asyncOnDelegateQueueWithBlock:", v4);
    }
  }
  return result;
}

void __47__APSConnection__connectIfNecessaryOnIvarQueue__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  v10 = *(_QWORD *)(a1[8] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  v12 = *(_QWORD *)(a1[9] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

void __60__APSConnection__setEnableStatusNotifications_sendToDaemon___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _xpc_connection_s *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 69) != v2)
  {
    *(_BYTE *)(v1 + 69) = v2;
    if (*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
      {
        v4 = xpc_dictionary_create(0, 0, 0);
        v5 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
        APSInsertIntsToXPCDictionary(v4, v5, v6, v7, v8, v9, v10, v11, 3);
        objc_msgSend(*(id *)(a1 + 32), "_addEnableStatusNotificationsToXPCMessage:", v4);
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_xpc_connection_s **)(v12 + 104);
        v14 = *(NSObject **)(v12 + 16);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __60__APSConnection__setEnableStatusNotifications_sendToDaemon___block_invoke_2;
        handler[3] = &unk_1E3C8B620;
        handler[4] = v12;
        xpc_connection_send_message_with_reply(v13, v4, v14, handler);
      }
      else
      {
        +[APSLog connection](APSLog, "connection");
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v18 = v15;
          _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ _connection is NULL in _sendEnableStatusNotifications.", buf, 0xCu);
        }
      }

    }
  }
}

+ (id)_createXPCConnectionWithQueueName:(const char *)a3
{
  dispatch_queue_t v3;
  void *v4;

  v3 = dispatch_queue_create(a3, 0);
  APSXPCCreateConnectionForServiceWithQueue(1, 0, "com.apple.apsd", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __49__APSConnection_requestTokenForTopic_identifier___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  xpc_object_t message;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    message = xpc_dictionary_create(0, 0, 0);
    v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 14);
    APSInsertNSStringsToXPCDictionary(message, "identifier", v9, v10, v11, v12, v13, v14, *(_QWORD *)(a1 + 40));
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), message);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v16;
      _os_log_impl(&dword_19BBC2000, v15, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in requestTokenForTopic!", buf, 0xCu);
    }

  }
}

void __60__APSConnection__setEnableCriticalReliability_sendToDaemon___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _xpc_connection_s *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 68) != v2)
  {
    *(_BYTE *)(v1 + 68) = v2;
    if (*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
      {
        v4 = xpc_dictionary_create(0, 0, 0);
        v5 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
        APSInsertIntsToXPCDictionary(v4, v5, v6, v7, v8, v9, v10, v11, 2);
        objc_msgSend(*(id *)(a1 + 32), "_addEnableCriticalReliabilityToXPCMessage:", v4);
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_xpc_connection_s **)(v12 + 104);
        v14 = *(NSObject **)(v12 + 16);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __60__APSConnection__setEnableCriticalReliability_sendToDaemon___block_invoke_2;
        handler[3] = &unk_1E3C8B620;
        handler[4] = v12;
        xpc_connection_send_message_with_reply(v13, v4, v14, handler);
      }
      else
      {
        +[APSLog connection](APSLog, "connection");
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v18 = v15;
          _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ _connection is NULL in _sendEnableCriticalReliability!", buf, 0xCu);
        }
      }

    }
  }
}

void __56__APSConnection__setTrackActivityPresence_sendToDaemon___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _xpc_connection_s *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 71) != v2)
  {
    *(_BYTE *)(v1 + 71) = v2;
    if (*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
      {
        v4 = xpc_dictionary_create(0, 0, 0);
        v5 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
        APSInsertIntsToXPCDictionary(v4, v5, v6, v7, v8, v9, v10, v11, 4);
        objc_msgSend(*(id *)(a1 + 32), "_addTrackActivityPresenceToXPCMessage:", v4);
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_xpc_connection_s **)(v12 + 104);
        v14 = *(NSObject **)(v12 + 16);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __56__APSConnection__setTrackActivityPresence_sendToDaemon___block_invoke_2;
        handler[3] = &unk_1E3C8B620;
        handler[4] = v12;
        xpc_connection_send_message_with_reply(v13, v4, v14, handler);
      }
      else
      {
        +[APSLog connection](APSLog, "connection");
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v18 = v15;
          _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ _connection is NULL in _setTrackActivityPresence!", buf, 0xCu);
        }
      }

    }
  }
}

- (void)setDelegate:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  NSObject *ivarQueue;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  APSConnection *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_feature_enabled_impl();
  +[APSLog connection](APSLog, "connection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v14 = self;
    v15 = 2112;
    if (v5)
      v7 = CFSTR("YES");
    v16 = v4;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_19BBC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ setting delegate %@ {asyncSetDelegate: %@}", buf, 0x20u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __29__APSConnection_setDelegate___block_invoke;
  v11[3] = &unk_1E3C8B590;
  v11[4] = self;
  v8 = v4;
  v12 = v8;
  v9 = (void *)MEMORY[0x1A1AC918C](v11);
  ivarQueue = self->_ivarQueue;
  if (v5)
    dispatch_async(ivarQueue, v9);
  else
    dispatch_sync(ivarQueue, v9);

}

uint64_t __68__APSConnection_setEnabledTopics_ignoredTopics_opportunisticTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216), 1, 0);
}

void __28__APSConnection_publicToken__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  +[APSLog connection](APSLog, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ asked for publicToken, got %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(a3, "copy");
  v11 = (void *)objc_msgSend(v9, "copy");

  v12 = (void *)objc_msgSend(v8, "copy");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__APSConnection_setEnabledTopics_ignoredTopics_opportunisticTopics___block_invoke;
  v16[3] = &unk_1E3C8B788;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v16);

}

- (NSData)publicToken
{
  NSObject *ivarQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__APSConnection_publicToken__block_invoke;
  v5[3] = &unk_1E3C8B7D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

+ (BOOL)isValidEnvironment:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0
    && (!objc_msgSend(v3, "compare:", CFSTR("production"))
     || !objc_msgSend(v3, "compare:", CFSTR("development"))
     || !objc_msgSend(v3, "compare:", CFSTR("demo"))
     || !objc_msgSend(v3, "compare:", CFSTR("qa2")));

  return v4;
}

- (APSConnection)initWithEnvironmentName:(id)a3
{
  return -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:](self, "initWithEnvironmentName:namedDelegatePort:queue:", a3, 0, 0);
}

- (APSConnection)initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4
{
  return -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:](self, "initWithEnvironmentName:namedDelegatePort:queue:", a3, a4, 0);
}

- (APSConnection)initWithEnvironmentName:(id)a3 queue:(id)a4
{
  return -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:](self, "initWithEnvironmentName:namedDelegatePort:queue:", a3, 0, a4);
}

- (APSConnection)initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 personaUniqueString:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  APSConnection *v15;
  int v17;
  APSConnection *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  +[APSLog connection](APSLog, "connection");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138413058;
    v18 = self;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_19BBC2000, v14, OS_LOG_TYPE_DEFAULT, "Initializing APSConnection %@: env=%@ port=%@ queue=%@", (uint8_t *)&v17, 0x2Au);
  }

  v15 = -[APSConnection _initWithEnvironmentName:namedDelegatePort:enablePushDuringSleep:personaUniqueString:queue:](self, "_initWithEnvironmentName:namedDelegatePort:enablePushDuringSleep:personaUniqueString:queue:", v10, v11, 0, v13, v12);
  return v15;
}

void __108__APSConnection__initWithEnvironmentName_namedDelegatePort_enablePushDuringSleep_personaUniqueString_queue___block_invoke(uint64_t a1)
{
  mach_error_t v2;
  BOOL v3;
  mach_error_t v5;
  NSObject *v6;
  char *v7;
  uint64_t v8;
  int v9;
  char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_mig_server();
  if (v2)
    v3 = v2 == 268435459;
  else
    v3 = 1;
  if (!v3 && v2 != 268451843)
  {
    v5 = v2;
    +[APSLog connection](APSLog, "connection");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = mach_error_string(v5);
      v8 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
      v9 = 136315394;
      v10 = v7;
      v11 = 2080;
      v12 = v8;
      _os_log_impl(&dword_19BBC2000, v6, OS_LOG_TYPE_DEFAULT, "dispatch_mig_server failed: %s   port: %s\n", (uint8_t *)&v9, 0x16u);
    }

  }
}

void __108__APSConnection__initWithEnvironmentName_namedDelegatePort_enablePushDuringSleep_personaUniqueString_queue___block_invoke_38(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A1AC9000]();
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  objc_autoreleasePoolPop(v2);
}

- (void)_shutdownOnIvarQueue
{
  mach_port_name_t handle;
  OS_dispatch_source *mach_source;
  unsigned int *p_connectionPort;
  mach_port_name_t connectionPort;
  OS_dispatch_queue *machQueue;

  self->_isShutdown = 1;
  -[APSConnection _disconnectOnIvarQueue](self, "_disconnectOnIvarQueue");
  if (self->_mach_source)
  {
    handle = dispatch_source_get_handle((dispatch_source_t)self->_mach_source);
    dispatch_source_cancel_and_wait();
    if (mach_port_mod_refs(*MEMORY[0x1E0C83DA0], handle, 1u, -1))
      fwrite("mach_port_mod_refs() failed\n", 0x1CuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    mach_source = self->_mach_source;
    self->_mach_source = 0;

    p_connectionPort = &self->_connectionPort;
  }
  else
  {
    p_connectionPort = &self->_connectionPort;
    connectionPort = self->_connectionPort;
    if (!connectionPort)
      goto LABEL_8;
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], connectionPort, 1u, -1);
  }
  *p_connectionPort = 0;
LABEL_8:
  machQueue = self->_machQueue;
  if (machQueue)
  {
    self->_machQueue = 0;

  }
}

- (void)shutdown
{
  NSObject *ivarQueue;
  _QWORD block[5];

  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__APSConnection_shutdown__block_invoke;
  block[3] = &unk_1E3C8B240;
  block[4] = self;
  dispatch_sync(ivarQueue, block);
}

uint64_t __25__APSConnection_shutdown__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[14];
  if (v3)
  {
    v2[14] = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_shutdownOnIvarQueue");
}

- (void)_shutdownFromDealloc
{
  NSObject *v3;
  int v4;
  APSConnection *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_19BBC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ _shutdownFromDealloc", (uint8_t *)&v4, 0xCu);
  }

  -[APSConnection _shutdownOnIvarQueue](self, "_shutdownOnIvarQueue");
}

- (void)dealloc
{
  objc_super v3;

  self->_isDeallocing = 1;
  -[APSConnection _shutdownFromDealloc](self, "_shutdownFromDealloc");
  v3.receiver = self;
  v3.super_class = (Class)APSConnection;
  -[APSConnection dealloc](&v3, sel_dealloc);
}

- (APSConnectionDelegate)delegate
{
  NSObject *ivarQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__APSConnection_delegate__block_invoke;
  v5[3] = &unk_1E3C8B568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (APSConnectionDelegate *)v3;
}

void __25__APSConnection_delegate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "object");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __65__APSConnection__asyncOnDelegateQueueWithBlock_requiresDelegate___block_invoke_51(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(v3 + 128), "count");
    v7 = 138412546;
    v8 = v3;
    v9 = 2048;
    v10 = v4;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ Flushing any queuedDelegateBlocks %lu", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = 0;

}

- (void)_noteDisconnectedFromDaemonOnIvarQueue
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  APSConnection *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = self;
    _os_log_impl(&dword_19BBC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ disconnected from apsd...", buf, 0xCu);
  }

  -[NSMutableDictionary allValues](self->_idsToOutgoingMessages, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[APSLog connection](APSLog, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 138412546;
    v26 = self;
    v27 = 2048;
    v28 = v6;
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ failing %lu pending outgoing messages.", buf, 0x16u);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "messageID", (_QWORD)v20);
        APSError(1, CFSTR("APSD crashed"), v13, v14, v15, v16, v17, v18, v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[APSConnection _deliverOutgoingMessageResultWithID:error:sendRTT:](self, "_deliverOutgoingMessageResultWithID:error:sendRTT:", v12, v19, 0);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

- (void)_reconnectIfNecessaryOnIvarQueueAfterDelay
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  double reconnectDelay;
  double v8;
  BOOL v9;
  double v10;
  dispatch_time_t v11;
  NSObject *ivarQueue;
  double v13;
  _QWORD block[5];
  uint8_t buf[4];
  APSConnection *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_isReconnectScheduled)
  {
    +[APSLog connection](APSLog, "connection");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      v4 = "%@: Skipping reconnect due to already scheduled reconnect";
LABEL_7:
      v5 = v3;
      v6 = 12;
LABEL_8:
      _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, v4, buf, v6);
    }
  }
  else if (self->_connection)
  {
    +[APSLog connection](APSLog, "connection");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      v4 = "%@: Skipping reconnect due to already being connected";
      goto LABEL_7;
    }
  }
  else
  {
    reconnectDelay = self->_reconnectDelay;
    v8 = reconnectDelay + reconnectDelay;
    v9 = reconnectDelay == 0.0;
    v10 = 0.1;
    if (!v9)
      v10 = v8;
    if (v10 > 300.0)
      v10 = 300.0;
    self->_reconnectDelay = v10;
    self->_isReconnectScheduled = 1;
    v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    ivarQueue = self->_ivarQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__APSConnection__reconnectIfNecessaryOnIvarQueueAfterDelay__block_invoke;
    block[3] = &unk_1E3C8B240;
    block[4] = self;
    dispatch_after(v11, ivarQueue, block);
    +[APSLog connection](APSLog, "connection");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_reconnectDelay;
      *(_DWORD *)buf = 138412546;
      v16 = self;
      v17 = 2048;
      v18 = v13;
      v4 = "%@: Will attempt reconnect in %f seconds";
      v5 = v3;
      v6 = 22;
      goto LABEL_8;
    }
  }

}

_BYTE *__59__APSConnection__reconnectIfNecessaryOnIvarQueueAfterDelay__block_invoke(uint64_t a1)
{
  _BYTE *result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = 0;
  result = *(_BYTE **)(a1 + 32);
  if (!result[153] && !result[154])
    return (_BYTE *)objc_msgSend(result, "_connectIfNecessaryOnIvarQueue");
  return result;
}

- (void)_connectIfNecessary
{
  NSObject *ivarQueue;
  _QWORD block[5];

  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__APSConnection__connectIfNecessary__block_invoke;
  block[3] = &unk_1E3C8B240;
  block[4] = self;
  dispatch_sync(ivarQueue, block);
}

uint64_t __36__APSConnection__connectIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
}

+ (void)_safelyCancelAndReleaseConnection:(id)a3
{
  _xpc_connection_s *v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  _QWORD block[4];
  _xpc_connection_s *v10;

  v3 = (_xpc_connection_s *)a3;
  v4 = v3;
  if (v3)
  {
    xpc_connection_set_event_handler(v3, &__block_literal_global_78);
    xpc_connection_cancel(v4);
    v5 = v4;
    v6 = dispatch_time(0, 10000000000);
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__APSConnection__safelyCancelAndReleaseConnection___block_invoke_2;
    block[3] = &unk_1E3C8B240;
    v10 = v5;
    v8 = v5;
    dispatch_after(v6, v7, block);

  }
}

- (void)_cancelConnectionOnIvarQueue
{
  NSObject *v3;
  OS_xpc_object *connection;
  OS_xpc_object *v5;
  int v6;
  APSConnection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_19BBC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ _cancelConnection called", (uint8_t *)&v6, 0xCu);
  }

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v5 = self->_connection;
    self->_connection = 0;

    -[APSConnection _deliverConnectionStatusChange:](self, "_deliverConnectionStatusChange:", 0);
  }
}

- (void)_cancelConnection
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__APSConnection__cancelConnection__block_invoke;
  v2[3] = &unk_1E3C8B240;
  v2[4] = self;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v2);
}

uint64_t __34__APSConnection__cancelConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelConnectionOnIvarQueue");
}

- (void)_disconnectOnIvarQueue
{
  OS_xpc_object *connection;

  self->_isDisconnected = 1;
  connection = self->_connection;
  if (connection)
    APSXPCConnectionSetEventHandlers(connection, 0, 0, 0);
  -[APSConnection _cancelConnectionOnIvarQueue](self, "_cancelConnectionOnIvarQueue");
}

- (void)_disconnect
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __28__APSConnection__disconnect__block_invoke;
  v2[3] = &unk_1E3C8B240;
  v2[4] = self;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v2);
}

uint64_t __28__APSConnection__disconnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disconnectOnIvarQueue");
}

- (void)_disconnectFromDealloc
{
  NSObject *v3;
  int v4;
  APSConnection *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_19BBC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ _disconnectFromDealloc", (uint8_t *)&v4, 0xCu);
  }

  -[APSConnection _disconnectOnIvarQueue](self, "_disconnectOnIvarQueue");
}

- (void)scheduleInRunLoop:(id)a3
{
  id v4;
  __CFRunLoop *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!scheduleInRunLoop__sRunLoopSource)
    scheduleInRunLoop__sRunLoopSource = (uint64_t)CFRunLoopSourceCreate(0, 0, &scheduleInRunLoop__sourceContext);
  v5 = (__CFRunLoop *)objc_msgSend(v4, "getCFRunLoop");
  CFRunLoopAddSource(v5, (CFRunLoopSourceRef)scheduleInRunLoop__sRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__APSConnection_scheduleInRunLoop___block_invoke;
  v7[3] = &unk_1E3C8B590;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v7);

}

uint64_t __35__APSConnection_scheduleInRunLoop___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  dispatch_queue_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  int v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v27 = 138412290;
    v28 = v3;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ scheduleInRunLoop called", (uint8_t *)&v27, 0xCu);
  }

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
  {
    +[APSLog connection](APSLog, "connection");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __35__APSConnection_scheduleInRunLoop___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 112);
    if (v13)
    {
      *(_QWORD *)(v12 + 112) = 0;

    }
  }
  v14 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[APSLog connection](APSLog, "connection");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v14 == v15)
  {
    if (v17)
    {
      v22 = *(_QWORD *)(a1 + 32);
      v27 = 138412290;
      v28 = v22;
      _os_log_impl(&dword_19BBC2000, v16, OS_LOG_TYPE_DEFAULT, "%@ scheduleInRunLoop called with main runloop. Scheduling on main serial queue.", (uint8_t *)&v27, 0xCu);
    }

    v23 = MEMORY[0x1E0C80D38];
    v24 = MEMORY[0x1E0C80D38];
    v25 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v25 + 112);
    *(_QWORD *)(v25 + 112) = v23;
  }
  else
  {
    if (v17)
    {
      v18 = *(_QWORD *)(a1 + 32);
      v27 = 138412290;
      v28 = v18;
      _os_log_impl(&dword_19BBC2000, v16, OS_LOG_TYPE_DEFAULT, "%@ scheduleInRunLoop called with non-main runloop. Scheduling on non-main serial queue.", (uint8_t *)&v27, 0xCu);
    }

    v19 = dispatch_queue_create("APSConnectionQueue", 0);
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 112);
    *(_QWORD *)(v20 + 112) = v19;
  }

  return objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
}

- (void)removeFromRunLoop
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  APSConnection *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_19BBC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ removeFromRunLoop", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__APSConnection_removeFromRunLoop__block_invoke;
  v4[3] = &unk_1E3C8B240;
  v4[4] = self;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v4);
}

uint64_t __34__APSConnection_removeFromRunLoop__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[14];
  if (v3)
  {
    v2[14] = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_disconnectOnIvarQueue");
}

uint64_t __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ calling topics completion", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 sendToDaemon:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __109__APSConnection__setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke;
  v24[3] = &unk_1E3C8B710;
  v24[4] = self;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v30 = a7;
  v28 = v17;
  v29 = v18;
  v19 = v18;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  v23 = v14;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v24);

}

uint64_t __109__APSConnection__setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 72));
}

- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_msgSend(a3, "copy");
  v17 = (void *)objc_msgSend(v15, "copy");

  v18 = (void *)objc_msgSend(v14, "copy");
  v19 = (void *)objc_msgSend(v13, "copy");

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __95__APSConnection_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_completion___block_invoke;
  v25[3] = &unk_1E3C8B738;
  v25[4] = self;
  v26 = v16;
  v27 = v17;
  v28 = v18;
  v29 = v19;
  v30 = v12;
  v20 = v12;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v25);

}

uint64_t __95__APSConnection_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1, *(_QWORD *)(a1 + 72));
}

- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(a3, "copy");
  v14 = (void *)objc_msgSend(v12, "copy");

  v15 = (void *)objc_msgSend(v11, "copy");
  v16 = (void *)objc_msgSend(v10, "copy");

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __84__APSConnection_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics___block_invoke;
  v21[3] = &unk_1E3C8B760;
  v21[4] = self;
  v22 = v13;
  v23 = v14;
  v24 = v15;
  v25 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v21);

}

uint64_t __84__APSConnection_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1, 0);
}

- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v8 = (void *)objc_msgSend(v6, "copy");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__APSConnection_setEnabledTopics_ignoredTopics___block_invoke;
  v11[3] = &unk_1E3C8B7B0;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v11);

}

uint64_t __48__APSConnection_setEnabledTopics_ignoredTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216), 1, 0);
}

- (void)_setOpportunisticTopics:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__APSConnection__setOpportunisticTopics___block_invoke;
  v6[3] = &unk_1E3C8B590;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v6);

}

uint64_t __41__APSConnection__setOpportunisticTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216), 1, 0);
}

- (void)_setIgnoredTopics:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__APSConnection__setIgnoredTopics___block_invoke;
  v6[3] = &unk_1E3C8B590;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v6);

}

uint64_t __35__APSConnection__setIgnoredTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216), 1, 0);
}

- (void)_setNonWakingTopics:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__APSConnection__setNonWakingTopics___block_invoke;
  v6[3] = &unk_1E3C8B590;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v6);

}

uint64_t __37__APSConnection__setNonWakingTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:sendToDaemon:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), *(_QWORD *)(a1 + 40), 1, 0);
}

- (NSArray)enabledTopics
{
  NSObject *ivarQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__APSConnection_enabledTopics__block_invoke;
  v5[3] = &unk_1E3C8B568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __30__APSConnection_enabledTopics__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)ignoredTopics
{
  NSObject *ivarQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__APSConnection_ignoredTopics__block_invoke;
  v5[3] = &unk_1E3C8B568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __30__APSConnection_ignoredTopics__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)opportunisticTopics
{
  NSObject *ivarQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__APSConnection_opportunisticTopics__block_invoke;
  v5[3] = &unk_1E3C8B568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __36__APSConnection_opportunisticTopics__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)nonWakingTopics
{
  NSObject *ivarQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__APSConnection_nonWakingTopics__block_invoke;
  v5[3] = &unk_1E3C8B568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __32__APSConnection_nonWakingTopics__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__APSConnection__setTrackActivityPresence_sendToDaemon___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  void *v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__APSConnection__setTrackActivityPresence_sendToDaemon___block_invoke_3;
  v6[3] = &unk_1E3C8B800;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v4, "_handleEvent:withHandler:", v5, v6);

}

uint64_t __56__APSConnection__setTrackActivityPresence_sendToDaemon___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_setTrackActivityPresence:sendToDaemon:", APSGetTrackActivityPresence(*(void **)(a1 + 32), 0), 0);
}

- (void)setTrackActivityPresence:(BOOL)a3
{
  -[APSConnection _setTrackActivityPresence:sendToDaemon:](self, "_setTrackActivityPresence:sendToDaemon:", a3, 1);
}

- (BOOL)trackActivityPresence
{
  NSObject *ivarQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__APSConnection_trackActivityPresence__block_invoke;
  v5[3] = &unk_1E3C8B7D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__APSConnection_trackActivityPresence__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 71);
  return result;
}

+ (__SecIdentity)copyIdentity
{
  uint64_t v2;
  __SecIdentity *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[5];

  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__APSConnection_copyIdentity__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (copyIdentity_onceToken != -1)
    dispatch_once(&copyIdentity_onceToken, block);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __29__APSConnection_copyIdentity__block_invoke_2;
  v5[3] = &unk_1E3C8B898;
  v5[4] = &v6;
  dispatch_sync((dispatch_queue_t)sIdentityQueue, v5);
  v3 = (__SecIdentity *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __29__APSConnection_copyIdentity__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  mach_timebase_info info;

  v2 = dispatch_queue_create("copyIdentityQueue", 0);
  v3 = (void *)sIdentityQueue;
  sIdentityQueue = (uint64_t)v2;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v5) = info.denom;
  LODWORD(v4) = info.numer;
  *(double *)&copyIdentity_sTimeScale = (double)v4 / (double)v5 * 0.000000001;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_APSClientIdentityUpdatedNotificationFired, CFSTR("APSClientIdentityUpdatedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

CFTypeRef __29__APSConnection_copyIdentity__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  CFTypeRef v5;
  __CFDictionary *Mutable;
  const void *v7;
  void *v8;
  int v9;
  OSStatus v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  dispatch_time_t v16;
  CFTypeRef result;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = sIdentity;
  +[APSLog connection](APSLog, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BBC2000, v3, OS_LOG_TYPE_DEFAULT, "Returning cached identity", buf, 2u);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sIdentity;
    v5 = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    return CFRetain(v5);
  }
  if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BBC2000, v3, OS_LOG_TYPE_DEFAULT, "Copying identity...", buf, 2u);
  }

  result = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], CFSTR("com.apple.apsd"));
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6A90], CFSTR("APSClientIdentity"));
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CB0]);
  v7 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7028], (const void *)*MEMORY[0x1E0C9AE50]);
  +[APSMultiUserMode sharedInstance](APSMultiUserMode, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isMultiUser");

  if (v9)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70C0], v7);
  v10 = SecItemCopyMatching(Mutable, &result);
  if (v10 != -25300 && v10)
  {
    v15 = v10;
    NSLog(CFSTR("SecItemCopyMatching() failed: %ld"), v10);
    +[APSLog connection](APSLog, "connection");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v15;
      v12 = "SecItemCopyMatching() failed: %ld";
      v13 = v11;
      v14 = 12;
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (!result)
  {
    NSLog(CFSTR("No identity found!"));
    +[APSLog connection](APSLog, "connection");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "No identity found!";
      v13 = v11;
      v14 = 2;
LABEL_18:
      _os_log_impl(&dword_19BBC2000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
LABEL_20:
  CFRelease(Mutable);
  v5 = (CFTypeRef)sIdentity;
  if ((CFTypeRef)sIdentity != result)
  {
    if (sIdentity)
      CFRelease((CFTypeRef)sIdentity);
    *(double *)&copyIdentity_sCacheMachAge = *(double *)&copyIdentity_sTimeScale * (double)mach_absolute_time();
    sIdentity = (uint64_t)result;
    v16 = dispatch_time(0, 60000000000);
    dispatch_after(v16, (dispatch_queue_t)sIdentityQueue, &__block_literal_global_107);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sIdentity;
    v5 = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v5)
      return CFRetain(v5);
  }
  return v5;
}

void __29__APSConnection_copyIdentity__block_invoke_106()
{
  NSObject *v1;
  uint8_t v2[16];

  if (-(*(double *)&copyIdentity_sCacheMachAge - (double)mach_absolute_time() * *(double *)&copyIdentity_sTimeScale) > 30.0
    && sIdentity != 0)
  {
    +[APSLog connection](APSLog, "connection");
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_19BBC2000, v1, OS_LOG_TYPE_DEFAULT, "Flushing cached identity", v2, 2u);
    }

    CFRelease((CFTypeRef)sIdentity);
    sIdentity = 0;
  }
}

+ (void)_flushIdentityCache
{
  if (sIdentityQueue)
    dispatch_async((dispatch_queue_t)sIdentityQueue, &__block_literal_global_108);
}

void __36__APSConnection__flushIdentityCache__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (sIdentity)
  {
    +[APSLog connection](APSLog, "connection");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_19BBC2000, v0, OS_LOG_TYPE_DEFAULT, "Flushing cached identity", v1, 2u);
    }

    CFRelease((CFTypeRef)sIdentity);
    sIdentity = 0;
  }
}

- (void)signDataWithDeviceIdentity:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__APSConnection_signDataWithDeviceIdentity_withCompletion___block_invoke;
  v10[3] = &unk_1E3C8B8E0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v10);

}

void __59__APSConnection_signDataWithDeviceIdentity_withCompletion___block_invoke(id *a1)
{
  xpc_object_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  _xpc_connection_s *v29;
  NSObject *v30;
  _QWORD handler[5];
  id v32;
  uint8_t buf[16];

  objc_msgSend(a1[4], "_connectIfNecessaryOnIvarQueue");
  if (*((_QWORD *)a1[4] + 13))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    v3 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(v2, v3, v4, v5, v6, v7, v8, v9, 26);
    objc_msgSend(a1[5], "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(a1[5], "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      APSInsertDatasToXPCDictionary(v2, "dataToSign", v12, v13, v14, v15, v16, v17, (uint64_t)v11);

    }
    objc_msgSend(a1[5], "time");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(a1[5], "time");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntegerValue");
      APSInsertNSUIntegersToXPCDictionary(v2, "serverTime", v21, v22, v23, v24, v25, v26, v20);

    }
    +[APSLog connection](APSLog, "connection");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BBC2000, v27, OS_LOG_TYPE_DEFAULT, "Requesting to sign data with device push identity", buf, 2u);
    }

    v28 = a1[4];
    v29 = (_xpc_connection_s *)*((_QWORD *)v28 + 13);
    v30 = *((_QWORD *)v28 + 2);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __59__APSConnection_signDataWithDeviceIdentity_withCompletion___block_invoke_111;
    handler[3] = &unk_1E3C8B6E8;
    handler[4] = v28;
    v32 = a1[6];
    xpc_connection_send_message_with_reply(v29, v2, v30, handler);

  }
}

void __59__APSConnection_signDataWithDeviceIdentity_withCompletion___block_invoke_111(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__APSConnection_signDataWithDeviceIdentity_withCompletion___block_invoke_2;
  v6[3] = &unk_1E3C8B6E8;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "_handleEvent:withHandler:", v5, v6);

}

void __59__APSConnection_signDataWithDeviceIdentity_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  APSSignDataWithIdentityResponse *v5;

  v5 = objc_alloc_init(APSSignDataWithIdentityResponse);
  APSGetXPCArrayFromDictionary(*(void **)(a1 + 32), "pushCerts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSSignDataWithIdentityResponse setCertificates:](v5, "setCertificates:", v2);

  APSGetXPCDataFromDictionary(*(void **)(a1 + 32), "nonce");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSSignDataWithIdentityResponse setNonce:](v5, "setNonce:", v3);

  APSGetXPCDataFromDictionary(*(void **)(a1 + 32), "sig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSSignDataWithIdentityResponse setSignature:](v5, "setSignature:", v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)rollBAACertsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__APSConnection_rollBAACertsWithCompletion___block_invoke;
  v6[3] = &unk_1E3C8B698;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v6);

}

void __44__APSConnection_rollBAACertsWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _xpc_connection_s *v13;
  NSObject *v14;
  _QWORD handler[5];
  id v16;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    v3 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(v2, v3, v4, v5, v6, v7, v8, v9, 27);
    +[APSLog connection](APSLog, "connection");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BBC2000, v10, OS_LOG_TYPE_DEFAULT, "Requesting to roll BAA certs and push identity for all environments", buf, 2u);
    }

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v13 = *(_xpc_connection_s **)(v11 + 104);
    v14 = *(NSObject **)(v11 + 16);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __44__APSConnection_rollBAACertsWithCompletion___block_invoke_116;
    handler[3] = &unk_1E3C8B6E8;
    handler[4] = v11;
    v16 = v12;
    xpc_connection_send_message_with_reply(v13, v2, v14, handler);

  }
}

void __44__APSConnection_rollBAACertsWithCompletion___block_invoke_116(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__APSConnection_rollBAACertsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E3C8B6E8;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "_handleEvent:withHandler:", v5, v6);

}

void __44__APSConnection_rollBAACertsWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  APSGetXPCArrayFromDictionary(*(void **)(a1 + 32), "pushCerts");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)isConnected
{
  NSObject *ivarQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__APSConnection_isConnected__block_invoke;
  v5[3] = &unk_1E3C8B7D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__APSConnection_isConnected__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 70);
  return result;
}

void __60__APSConnection__setEnableCriticalReliability_sendToDaemon___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  void *v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__APSConnection__setEnableCriticalReliability_sendToDaemon___block_invoke_3;
  v6[3] = &unk_1E3C8B800;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v4, "_handleEvent:withHandler:", v5, v6);

}

uint64_t __60__APSConnection__setEnableCriticalReliability_sendToDaemon___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_setEnableCriticalReliability:sendToDaemon:", APSGetEnableCriticalReliability(*(void **)(a1 + 32), 0), 0);
}

- (void)setEnableCriticalReliability:(BOOL)a3
{
  -[APSConnection _setEnableCriticalReliability:sendToDaemon:](self, "_setEnableCriticalReliability:sendToDaemon:", a3, 1);
}

void __60__APSConnection__setEnableStatusNotifications_sendToDaemon___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  void *v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__APSConnection__setEnableStatusNotifications_sendToDaemon___block_invoke_3;
  v6[3] = &unk_1E3C8B800;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v4, "_handleEvent:withHandler:", v5, v6);

}

uint64_t __60__APSConnection__setEnableStatusNotifications_sendToDaemon___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_setEnableStatusNotifications:sendToDaemon:", APSGetEnableStatusNotifications(*(void **)(a1 + 32), 0), 0);
}

- (void)_addEnableCriticalReliabilityToXPCMessage:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  APSInsertBoolsToXPCDictionary(a3, "enableCriticalReliability", (uint64_t)a3, v3, v4, v5, v6, v7, self->_enableCriticalReliability);
}

- (void)_addTrackActivityPresenceToXPCMessage:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  APSInsertBoolsToXPCDictionary(a3, "trackActivityPresence", (uint64_t)a3, v3, v4, v5, v6, v7, self->_trackActivityPresence);
}

- (void)_addEnableStatusNotificationsToXPCMessage:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  APSInsertBoolsToXPCDictionary(a3, "enableStatusNotifications", (uint64_t)a3, v3, v4, v5, v6, v7, self->_enableStatusNotifications);
}

- (void)_addPushWakeTopicsToXPCMessage:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  APSInsertNSArraysToXPCDictionary(a3, "pushWakeTopics", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)self->_pushWakeTopics);
}

- (void)_addUltraConstrainedTopicsToXPCMessage:(id)a3
{
  APSInsertUltraConstrainedTopicsToXPCDictionary(a3, self->_ultraConstrainedTopics);
}

- (void)_dispatch_sync_to_ivarQueue:(id)a3 shutdownBlock:(id)a4
{
  id v5;
  NSObject *ivarQueue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a3;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__APSConnection__dispatch_sync_to_ivarQueue_shutdownBlock___block_invoke;
  block[3] = &unk_1E3C8B908;
  v9 = v5;
  v7 = v5;
  dispatch_sync(ivarQueue, block);

}

uint64_t __59__APSConnection__dispatch_sync_to_ivarQueue_shutdownBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __33__APSConnection__deliverMessage___block_invoke_126(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "guid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v40 = v3;
    v41 = 2112;
    v42 = v4;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ responding with an ack for message with guid %@", buf, 0x16u);

  }
  +[APSLog PUSHTRACE](APSLog, "PUSHTRACE");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "tracingUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v40 = v6;
    v41 = 2112;
    v42 = v7;
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ responding with an ack. UUID: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
    {
      v9 = xpc_dictionary_create(0, 0, 0);
      v10 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
      APSInsertIntsToXPCDictionary(v9, v10, v11, v12, v13, v14, v15, v16, 22);
      objc_msgSend(*(id *)(a1 + 40), "guid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      APSInsertNSStringsToXPCDictionary(v9, "guid", v18, v19, v20, v21, v22, v23, (uint64_t)v17);

      if (objc_msgSend(*(id *)(a1 + 40), "isTracingEnabled"))
      {
        objc_msgSend(*(id *)(a1 + 40), "tracingUUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        APSInsertDatasToXPCDictionary(v9, "tracingUUID", v25, v26, v27, v28, v29, v30, (uint64_t)v24);

        objc_msgSend(*(id *)(a1 + 40), "topic");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        APSInsertNSStringsToXPCDictionary(v9, "topic", v32, v33, v34, v35, v36, v37, (uint64_t)v31);

      }
      xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), v9);
    }
    else
    {
      +[APSLog connection](APSLog, "connection");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v38 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v40 = v38;
        _os_log_impl(&dword_19BBC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ _connection is NULL in _deliverMessage:.", buf, 0xCu);
      }
    }

  }
}

void __48__APSConnection__deliverConnectionStatusChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[APSLog connection](APSLog, "connection");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ seeing if delegate %@ responds to status changes", (uint8_t *)&v10, 0x16u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[APSLog connection](APSLog, "connection");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_19BBC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ calling %@ didChangeConnectedStatus:", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(v3, "connection:didChangeConnectedStatus:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
    +[APSLog connection](APSLog, "connection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didChangeConnectedStatus:", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)_deliverConnectionStatusFromDealloc:(BOOL)a3
{
  CUTWeakReference *delegateReference;
  void *v6;
  NSObject *v7;
  NSObject *delegateQueue;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  uint8_t buf[4];
  APSConnection *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_isConnected != a3)
  {
    self->_isConnected = a3;
    if (self->_enableStatusNotifications)
    {
      if (self->_delegateQueue)
      {
        delegateReference = self->_delegateReference;
        if (delegateReference)
        {
          -[CUTWeakReference object](delegateReference, "object");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          +[APSLog connection](APSLog, "connection");
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v13 = self;
            v14 = 2112;
            v15 = v6;
            _os_log_impl(&dword_19BBC2000, v7, OS_LOG_TYPE_DEFAULT, "%@ seeing if delegate %@ responds to status changes", buf, 0x16u);
          }

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            delegateQueue = self->_delegateQueue;
            v9[0] = MEMORY[0x1E0C809B0];
            v9[1] = 3221225472;
            v9[2] = __53__APSConnection__deliverConnectionStatusFromDealloc___block_invoke;
            v9[3] = &unk_1E3C8B9D0;
            v10 = v6;
            v11 = a3;
            dispatch_async(delegateQueue, v9);

          }
        }
      }
    }
  }
}

void __53__APSConnection__deliverConnectionStatusFromDealloc___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = 0;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ calling %@ didChangeConnectedStatus:", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "connection:didChangeConnectedStatus:", 0, *(unsigned __int8 *)(a1 + 40));
  +[APSLog connection](APSLog, "connection");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = 0;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didChangeConnectedStatus:", (uint8_t *)&v6, 0x16u);
  }

}

- (void)_deliverOutgoingMessageResultWithID:(unint64_t)a3 error:(id)a4 sendRTT:(unint64_t)a5 ackTimestamp:(unint64_t)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v10 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__APSConnection__deliverOutgoingMessageResultWithID_error_sendRTT_ackTimestamp___block_invoke;
  v12[3] = &unk_1E3C8BA20;
  v12[4] = self;
  v13 = v10;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v11 = v10;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v12);

}

void __80__APSConnection__deliverOutgoingMessageResultWithID_error_sendRTT_ackTimestamp___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v17 = v5;
    v18 = 2048;
    v19 = v3;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ delivering outgoing message result for id %lu, error = %@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSendRTT:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v7, "setAckTimestamp:", *(_QWORD *)(a1 + 64));
  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObjectForKey:", v6);
    v8 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __80__APSConnection__deliverOutgoingMessageResultWithID_error_sendRTT_ackTimestamp___block_invoke_133;
    v13[3] = &unk_1E3C8B9F8;
    v13[4] = v8;
    v14 = v7;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v8, "_asyncOnDelegateQueueWithBlock:", v13);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v17 = v12;
      v18 = 2048;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_19BBC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ Receiving result for sending unknown outgoing message %lu: %@", buf, 0x20u);
    }

  }
}

void __80__APSConnection__deliverOutgoingMessageResultWithID_error_sendRTT_ackTimestamp___block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[APSLog connection](APSLog, "connection");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v16 = 138413058;
    v17 = v5;
    v18 = 2112;
    v19 = v3;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for outgoing message %@ result %@", (uint8_t *)&v16, 0x2Au);
  }

  if (objc_msgSend(*(id *)(a1 + 48), "code"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      +[APSLog connection](APSLog, "connection");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v16 = 138412546;
        v17 = v9;
        v18 = 2112;
        v19 = v3;
        _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ calling %@ didFailToSendOutgoingMessage:", (uint8_t *)&v16, 0x16u);
      }

      objc_msgSend(v3, "connection:didFailToSendOutgoingMessage:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      +[APSLog connection](APSLog, "connection");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v11 = *(_QWORD *)(a1 + 32);
      v16 = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v3;
      v12 = "%@ returned from %@ didFailToSendOutgoingMessage:";
LABEL_14:
      _os_log_impl(&dword_19BBC2000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0x16u);
LABEL_15:

    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[APSLog connection](APSLog, "connection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_19BBC2000, v13, OS_LOG_TYPE_DEFAULT, "%@ calling %@ didSendOutgoingMessage:", (uint8_t *)&v16, 0x16u);
    }

    objc_msgSend(v3, "connection:didSendOutgoingMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    +[APSLog connection](APSLog, "connection");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = 138412546;
    v17 = v15;
    v18 = 2112;
    v19 = v3;
    v12 = "%@ returned from %@ didSendOutgoingMessage:";
    goto LABEL_14;
  }

}

- (void)_deliverOutgoingMessageResultWithID:(unint64_t)a3 error:(id)a4 sendRTT:(unint64_t)a5
{
  -[APSConnection _deliverOutgoingMessageResultWithID:error:sendRTT:ackTimestamp:](self, "_deliverOutgoingMessageResultWithID:error:sendRTT:ackTimestamp:", a3, a4, a5, 0);
}

void __51__APSConnection__deliverToken_forTopic_identifier___block_invoke_138(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[APSLog connection](APSLog, "connection");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      v6 = a1[5];
      v7 = a1[6];
      v8 = a1[7];
      v11 = 138413314;
      v12 = v5;
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for received token %@ for topic %@ identifier %@", (uint8_t *)&v11, 0x34u);
    }

    objc_msgSend(v3, "connection:didReceiveToken:forTopic:identifier:", a1[4], a1[5], a1[6], a1[7]);
    +[APSLog connection](APSLog, "connection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_19BBC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didReceiveToken:forTopic:identifier", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (void)_deliverToken:(id)a3 forInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__APSConnection__deliverToken_forInfo___block_invoke;
  v10[3] = &unk_1E3C8B7B0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v10);

}

void __39__APSConnection__deliverToken_forInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "debugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ Received extended app token %@ forInfo %@", buf, 0x20u);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "topic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __39__APSConnection__deliverToken_forInfo___block_invoke_141;
      v8[3] = &unk_1E3C8B9F8;
      v7 = *(void **)(a1 + 40);
      v9 = *(id *)(a1 + 32);
      v10 = v7;
      v11 = *(id *)(a1 + 48);
      objc_msgSend(v9, "_asyncOnDelegateQueueWithBlock:", v8);

    }
  }
}

void __39__APSConnection__deliverToken_forInfo___block_invoke_141(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[APSLog connection](APSLog, "connection");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      v6 = a1[5];
      v7 = a1[6];
      v10 = 138413058;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for received extended app token %@ for info %@", (uint8_t *)&v10, 0x2Au);
    }

    objc_msgSend(v3, "connection:didReceiveToken:forInfo:", a1[4], a1[5], a1[6]);
    +[APSLog connection](APSLog, "connection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[4];
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didReceiveToken:forInfo", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)_deliverURLToken:(id)a3 forInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__APSConnection__deliverURLToken_forInfo___block_invoke;
  v10[3] = &unk_1E3C8B7B0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v10);

}

void __42__APSConnection__deliverURLToken_forInfo___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    objc_msgSend(a1[5], "debugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = a1[6];
    *(_DWORD *)buf = 138412802;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ Received web token %@ for info %@", buf, 0x20u);

  }
  if (a1[5])
  {
    objc_msgSend(a1[6], "topic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1[4], "_removeURLTokenBlocksForInfo:", a1[6]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __42__APSConnection__deliverURLToken_forInfo___block_invoke_144;
      v12[3] = &unk_1E3C8BA48;
      v13 = v7;
      v8 = a1[4];
      v9 = a1[5];
      v10 = a1[4];
      v14 = v9;
      v15 = v10;
      v16 = a1[6];
      v11 = v7;
      objc_msgSend(v8, "_asyncOnDelegateQueueWithBlock:requiresDelegate:", v12, 0);

    }
  }
}

void __42__APSConnection__deliverURLToken_forInfo___block_invoke_144(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
    }
    while (v6);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[APSLog connection](APSLog, "connection", (_QWORD)v15);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138413058;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_19BBC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for received web token %@ for info %@", buf, 0x2Au);
    }

    objc_msgSend(v3, "connection:didReceiveURLToken:forInfo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    +[APSLog connection](APSLog, "connection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v20 = v14;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_19BBC2000, v13, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didReceiveURLToken:forInfo", buf, 0x16u);
    }

  }
}

- (void)_deliverURLTokenError:(id)a3 forInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__APSConnection__deliverURLTokenError_forInfo___block_invoke;
  v10[3] = &unk_1E3C8B7B0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v10);

}

void __47__APSConnection__deliverURLTokenError_forInfo___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    *(_DWORD *)buf = 138412802;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ Received web token error %@ for info %@", buf, 0x20u);
  }

  if (a1[5])
  {
    objc_msgSend(a1[6], "topic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1[4], "_removeURLTokenBlocksForInfo:", a1[6]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __47__APSConnection__deliverURLTokenError_forInfo___block_invoke_147;
      v12[3] = &unk_1E3C8BA48;
      v13 = v7;
      v8 = a1[4];
      v9 = a1[5];
      v10 = a1[4];
      v14 = v9;
      v15 = v10;
      v16 = a1[6];
      v11 = v7;
      objc_msgSend(v8, "_asyncOnDelegateQueueWithBlock:requiresDelegate:", v12, 0);

    }
  }
}

void __47__APSConnection__deliverURLTokenError_forInfo___block_invoke_147(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
    }
    while (v6);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[APSLog connection](APSLog, "connection", (_QWORD)v15);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138413058;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_19BBC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for received web token error %@ for info %@", buf, 0x2Au);
    }

    objc_msgSend(v3, "connection:didReceiveURLTokenError:forInfo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    +[APSLog connection](APSLog, "connection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v20 = v14;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_19BBC2000, v13, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didReceiveURLTokenError:forInfo", buf, 0x16u);
    }

  }
}

+ (void)_blockingXPCCallWithArgumentBlock:(id)a3 resultHandler:(id)a4
{
  void (**v6)(id, xpc_object_t);
  void (**v7)(id, void *);
  uint64_t v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  NSObject *v15;

  v6 = (void (**)(id, xpc_object_t))a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(a1, "_createXPCConnectionWithQueueName:", "blockingXPCCallQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (_xpc_connection_s *)v8;
  if (v8)
  {
    APSXPCConfigureConnection(v8, &__block_literal_global_153, &__block_literal_global_155, &__block_literal_global_151);
    xpc_connection_resume(v9);
    v10 = xpc_dictionary_create(0, 0, 0);
    v6[2](v6, v10);
    v11 = xpc_connection_send_message_with_reply_sync(v9, v10);
    v12 = v11;
    if (v11)
    {
      v13 = MEMORY[0x1A1AC945C](v11);
      if (v13 == MEMORY[0x1E0C81310])
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), xpc_dictionary_get_string(v12, (const char *)*MEMORY[0x1E0C81270]));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v14)
          goto LABEL_11;
      }
      else if (v13 != MEMORY[0x1E0C812F8])
      {
        v14 = CFSTR("Received reply is not of type dictionary!");
LABEL_11:
        NSLog(CFSTR("Bad response from apsd: %@"), v14);
LABEL_13:
        +[APSConnection _safelyCancelAndReleaseConnection:](APSConnection, "_safelyCancelAndReleaseConnection:", v9);

        goto LABEL_14;
      }
      v7[2](v7, v12);
      v14 = 0;
      goto LABEL_13;
    }
    v14 = CFSTR("no reply received!");
    goto LABEL_11;
  }
  +[APSLog connection](APSLog, "connection");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    +[APSConnection _blockingXPCCallWithArgumentBlock:resultHandler:].cold.1();

LABEL_14:
}

void __65__APSConnection__blockingXPCCallWithArgumentBlock_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[APSLog connection](APSLog, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19BBC2000, v3, OS_LOG_TYPE_DEFAULT, "_makeXPCCallWithArgumentBlock messageHandler %@", (uint8_t *)&v4, 0xCu);
  }

}

void __65__APSConnection__blockingXPCCallWithArgumentBlock_resultHandler___block_invoke_152()
{
  NSObject *v0;
  uint8_t v1[16];

  +[APSLog connection](APSLog, "connection");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19BBC2000, v0, OS_LOG_TYPE_DEFAULT, "_makeXPCCallWithArgumentBlock Connection interrupted while trying to make blocking XPC call", v1, 2u);
  }

}

void __65__APSConnection__blockingXPCCallWithArgumentBlock_resultHandler___block_invoke_154()
{
  NSObject *v0;
  uint8_t v1[16];

  +[APSLog connection](APSLog, "connection");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19BBC2000, v0, OS_LOG_TYPE_DEFAULT, "_makeXPCCallWithArgumentBlock Connection invalidated while trying to make blocking XPC call", v1, 2u);
  }

}

- (BOOL)hasIdentity
{
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (hasIdentity_onceToken != -1)
    dispatch_once(&hasIdentity_onceToken, &__block_literal_global_158);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__APSConnection_hasIdentity__block_invoke_2;
  v5[3] = &unk_1E3C8B7D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)hasIdentity_sQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __28__APSConnection_hasIdentity__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("hasIdentityQueue", 0);
  v1 = (void *)hasIdentity_sQueue;
  hasIdentity_sQueue = (uint64_t)v0;

}

uint64_t __28__APSConnection_hasIdentity__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];

  v1 = result;
  if ((hasIdentity_sHasFoundIdentity & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  else
  {
    v2 = (void *)objc_opt_class();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __28__APSConnection_hasIdentity__block_invoke_3;
    v5[3] = &unk_1E3C8B620;
    v3 = *(_QWORD *)(v1 + 40);
    v5[4] = *(_QWORD *)(v1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __28__APSConnection_hasIdentity__block_invoke_4;
    v4[3] = &unk_1E3C8BAB0;
    v4[4] = v3;
    result = objc_msgSend(v2, "_blockingXPCCallWithArgumentBlock:resultHandler:", v5, v4);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24))
      hasIdentity_sHasFoundIdentity = 1;
  }
  return result;
}

void __28__APSConnection_hasIdentity__block_invoke_3(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id xdict;

  xdict = a2;
  v3 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
  APSInsertIntsToXPCDictionary(xdict, v3, v4, v5, v6, v7, v8, v9, 8);
  APSInsertNSStringsToXPCDictionary(xdict, "environmentName", v10, v11, v12, v13, v14, v15, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

}

BOOL __28__APSConnection_hasIdentity__block_invoke_4(uint64_t a1, void *a2)
{
  _BOOL8 result;

  result = APSGetXPCBoolFromDictionary(a2, "hasIdentity");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (double)serverTime
{
  return (double)(unint64_t)objc_msgSend(a1, "serverTimeInNanoSeconds") / 1000000000.0;
}

+ (unint64_t)serverTimeInNanoSeconds
{
  unint64_t v3;
  double v4;
  _QWORD block[7];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (serverTimeInNanoSeconds_onceToken != -1)
    dispatch_once(&serverTimeInNanoSeconds_onceToken, &__block_literal_global_161);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__APSConnection_serverTimeInNanoSeconds__block_invoke_2;
  block[3] = &unk_1E3C8BB40;
  block[5] = &v7;
  block[6] = a1;
  block[4] = &v11;
  dispatch_sync((dispatch_queue_t)serverTimeInNanoSeconds_sQueue, block);
  v3 = v12[3];
  if (!v3)
  {
    v4 = v8[3];
    if (v4 == 0.0)
    {
      v3 = 0;
    }
    else
    {
      v3 = (unint64_t)(v4 * 1000000000.0);
      v12[3] = v3;
    }
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v3;
}

void __40__APSConnection_serverTimeInNanoSeconds__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("requestServerTimeInNS", 0);
  v1 = (void *)serverTimeInNanoSeconds_sQueue;
  serverTimeInNanoSeconds_sQueue = (uint64_t)v0;

}

uint64_t __40__APSConnection_serverTimeInNanoSeconds__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)objc_opt_class();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__APSConnection_serverTimeInNanoSeconds__block_invoke_4;
  v4[3] = &unk_1E3C8BB18;
  v5 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(v2, "_blockingXPCCallWithArgumentBlock:resultHandler:", &__block_literal_global_163, v4);
}

void __40__APSConnection_serverTimeInNanoSeconds__block_invoke_3(uint64_t a1, void *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id xdict;

  xdict = a2;
  v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
  APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 9);

}

double __40__APSConnection_serverTimeInNanoSeconds__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double result;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = APSGetXPCUnsignedLongLongFromDictionary(v3, "serverTimeNS");
  v4 = APSGetXPCUnsignedLongLongFromDictionary(v3, "serverTime");

  result = (double)v4;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (double)v4;
  return result;
}

+ (id)geoRegion
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (geoRegion_onceToken != -1)
    dispatch_once(&geoRegion_onceToken, &__block_literal_global_165);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__APSConnection_geoRegion__block_invoke_2;
  v5[3] = &unk_1E3C8BBA8;
  v5[4] = &v6;
  v5[5] = a1;
  dispatch_sync((dispatch_queue_t)geoRegion_sQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __26__APSConnection_geoRegion__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("requestGeoRegion", 0);
  v1 = (void *)geoRegion_sQueue;
  geoRegion_sQueue = (uint64_t)v0;

}

uint64_t __26__APSConnection_geoRegion__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  v2 = (void *)objc_opt_class();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__APSConnection_geoRegion__block_invoke_4;
  v4[3] = &unk_1E3C8BAB0;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_blockingXPCCallWithArgumentBlock:resultHandler:", &__block_literal_global_167, v4);
}

void __26__APSConnection_geoRegion__block_invoke_3(uint64_t a1, void *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id xdict;

  xdict = a2;
  v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
  APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 10);

}

void __26__APSConnection_geoRegion__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  APSGetXPCStringFromDictionary(a2, "geoRegion");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (void)requestCourierConnection
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  +[APSLog connection](APSLog, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BBC2000, v3, OS_LOG_TYPE_DEFAULT, "requestCourierConnection", buf, 2u);
  }

  v4 = dispatch_queue_create("requestCourierConnection", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__APSConnection_requestCourierConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v4, block);

}

uint64_t __41__APSConnection_requestCourierConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_blockingXPCCallWithArgumentBlock:resultHandler:", &__block_literal_global_170, &__block_literal_global_171);
}

void __41__APSConnection_requestCourierConnection__block_invoke_2(uint64_t a1, void *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id xdict;

  xdict = a2;
  v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
  APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 13);

}

void __41__APSConnection_requestCourierConnection__block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  +[APSLog connection](APSLog, "connection");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19BBC2000, v0, OS_LOG_TYPE_DEFAULT, "Success!", v1, 2u);
  }

}

+ (void)invalidateDeviceIdentity
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  +[APSLog connection](APSLog, "connection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BBC2000, v3, OS_LOG_TYPE_DEFAULT, "invalidateDeviceIdentity", buf, 2u);
  }

  v4 = dispatch_queue_create("invalidateDeviceIdentity", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__APSConnection_invalidateDeviceIdentity__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v4, block);

}

uint64_t __41__APSConnection_invalidateDeviceIdentity__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_blockingXPCCallWithArgumentBlock:resultHandler:", &__block_literal_global_173, &__block_literal_global_174);
}

void __41__APSConnection_invalidateDeviceIdentity__block_invoke_2(uint64_t a1, void *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id xdict;

  xdict = a2;
  v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
  APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 23);

}

void __41__APSConnection_invalidateDeviceIdentity__block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  +[APSLog connection](APSLog, "connection");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19BBC2000, v0, OS_LOG_TYPE_DEFAULT, "Success!", v1, 2u);
  }

}

+ (double)keepAliveIntervalForEnvironmentName:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  double v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  __int128 buf;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[APSLog connection](APSLog, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "keepAliveIntervalForEnvironmentName %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__APSConnection_keepAliveIntervalForEnvironmentName___block_invoke;
  v11[3] = &unk_1E3C8B620;
  v7 = v4;
  v12 = v7;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __53__APSConnection_keepAliveIntervalForEnvironmentName___block_invoke_2;
  v10[3] = &unk_1E3C8BAB0;
  v10[4] = &buf;
  objc_msgSend(a1, "_blockingXPCCallWithArgumentBlock:resultHandler:", v11, v10);
  v8 = *(double *)(*((_QWORD *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __53__APSConnection_keepAliveIntervalForEnvironmentName___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id xdict;

  xdict = a2;
  v3 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
  APSInsertIntsToXPCDictionary(xdict, v3, v4, v5, v6, v7, v8, v9, 12);
  APSInsertNSStringsToXPCDictionary(xdict, "environmentName", v10, v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 32));

}

void __53__APSConnection_keepAliveIntervalForEnvironmentName___block_invoke_2(uint64_t a1, void *a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = APSGetXPCDoubleFromDictionary(a2, "keepAliveInterval");
}

+ (id)connectionsDebuggingStateOfStyle:(unint64_t)a3
{
  id v3;
  _QWORD v5[5];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v5[4] = &v7;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__APSConnection_connectionsDebuggingStateOfStyle___block_invoke;
  v6[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6[4] = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__APSConnection_connectionsDebuggingStateOfStyle___block_invoke_2;
  v5[3] = &unk_1E3C8BAB0;
  objc_msgSend(a1, "_blockingXPCCallWithArgumentBlock:resultHandler:", v6, v5);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __50__APSConnection_connectionsDebuggingStateOfStyle___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id xdict;

  xdict = a2;
  v3 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
  APSInsertIntsToXPCDictionary(xdict, v3, v4, v5, v6, v7, v8, v9, 5);
  APSInsertIntsToXPCDictionary(xdict, "style", v10, v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 32));

}

void __50__APSConnection_connectionsDebuggingStateOfStyle___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  APSGetXPCStringFromDictionary(a2, "connectionsDebuggingState");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (void)_setTokenState
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__APSConnection__setTokenState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __31__APSConnection__setTokenState__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint32_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (_setTokenState_sTokenFailures > 9)
    return;
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v9 = _setTokenState_sTokenFailures;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "notifySafeToSendFilter - failures=%d", buf, 8u);
  }

  v3 = _setTokenState_token;
  if (_setTokenState_token != -1)
    goto LABEL_5;
  v4 = notify_register_check("APSSafeToSendFilterNotification", &_setTokenState_token);
  if (!v4)
  {
    v3 = _setTokenState_token;
LABEL_5:
    v4 = notify_set_state(v3, 1uLL);
    if (!v4)
    {
      v4 = notify_post("APSSafeToSendFilterNotification");
      if (!v4)
        return;
    }
  }
  +[APSLog connection](APSLog, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v4;
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "setting token failed with status %d", buf, 8u);
  }

  notify_cancel(_setTokenState_token);
  _setTokenState_token = -1;
  ++_setTokenState_sTokenFailures;
  v6 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__APSConnection__setTokenState__block_invoke_180;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
}

uint64_t __31__APSConnection__setTokenState__block_invoke_180(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setTokenState");
}

+ (void)notifySafeToSendFilter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__APSConnection_notifySafeToSendFilter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (notifySafeToSendFilter_onceToken != -1)
    dispatch_once(&notifySafeToSendFilter_onceToken, block);
}

uint64_t __39__APSConnection_notifySafeToSendFilter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setTokenState");
}

- (void)_sendOutgoingMessage:(id)a3 fake:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  BOOL v21;
  uint8_t buf[4];
  APSConnection *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ivarQueue);
  v7 = _os_feature_enabled_impl();
  +[APSLog connection](APSLog, "connection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v6, "identifier");
    objc_msgSend(v6, "topic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    APSLoggableDescriptionForObjectOnTopic_NoLoad(v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    *(_DWORD *)buf = 138413826;
    v15 = CFSTR("NO");
    v23 = self;
    v24 = 2112;
    v26 = 2048;
    if (v4)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    v25 = v6;
    if (v7)
      v15 = CFSTR("YES");
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = v13;
    v32 = 2112;
    v33 = v16;
    v34 = 2112;
    v35 = v15;
    _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ _sendOutgoingMessage: %@ [id=%lu] %@ %@ fake: %@ syncToIvarQueue: %@", buf, 0x48u);

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __43__APSConnection__sendOutgoingMessage_fake___block_invoke;
  v19[3] = &unk_1E3C8BC98;
  v19[4] = self;
  v20 = v6;
  v21 = v4;
  v17 = v6;
  v18 = (void *)MEMORY[0x1A1AC918C](v19);
  if (v7)
    -[APSConnection _dispatch_sync_to_ivarQueue:shutdownBlock:](self, "_dispatch_sync_to_ivarQueue:shutdownBlock:", v18, 0);
  else
    -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v18);

}

void __43__APSConnection__sendOutgoingMessage_fake___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  _xpc_connection_s *v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD handler[5];
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (!*(_QWORD *)(a1 + 40))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Message is null"));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 104))
  {
    v3 = *(void **)(a1 + 40);
    ++*(_QWORD *)(v2 + 80);
    objc_msgSend(v3, "setMessageID:");
    if (!*(_BYTE *)(a1 + 48)
      || (objc_msgSend(*(id *)(a1 + 40), "timestamp"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          !v4))
    {
      v5 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTimestamp:", v6);

    }
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "messageID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

    v10 = xpc_dictionary_create(0, 0, 0);
    LODWORD(v8) = *(unsigned __int8 *)(a1 + 48);
    v11 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    v18 = 6;
    if ((_DWORD)v8)
      v18 = 7;
    APSInsertIntsToXPCDictionary(v10, v11, v12, v13, v14, v15, v16, v17, v18);
    objc_msgSend(*(id *)(a1 + 40), "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    APSCreateXPCObjectFromDictionary(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    xpc_dictionary_set_value(v10, "message", v20);
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(*(id *)(a1 + 40), "topic");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.private.alloy.facetime.multi"));

      if (v22)
      {
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        kdebug_trace();
      }
    }
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(a1 + 40);
    v25 = *(_xpc_connection_s **)(v23 + 104);
    v26 = *(NSObject **)(v23 + 16);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __43__APSConnection__sendOutgoingMessage_fake___block_invoke_2;
    handler[3] = &unk_1E3C8B800;
    handler[4] = v23;
    v29 = v24;
    xpc_connection_send_message_with_reply(v25, v10, v26, handler);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v31 = v27;
      _os_log_impl(&dword_19BBC2000, v10, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in _sendOutgoingMessage!", buf, 0xCu);
    }
  }

}

void __43__APSConnection__sendOutgoingMessage_fake___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__APSConnection__sendOutgoingMessage_fake___block_invoke_3;
  v7[3] = &unk_1E3C8BC70;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v10 = v4;
  v6 = v3;
  objc_msgSend(v5, "_handleEvent:withHandler:", v6, v7);

}

void __43__APSConnection__sendOutgoingMessage_fake___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (APSGetXPCBoolFromDictionary(v4, "success"))
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("APSD rejected message as invalid."));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_9;
  }
  else
  {
    v5 = CFSTR("no reply received!");
  }
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "messageID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

  APSError(1, CFSTR("Unable to send outgoing message to apsd: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[APSLog connection](APSLog, "connection");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v14;
    _os_log_impl(&dword_19BBC2000, v15, OS_LOG_TYPE_DEFAULT, "Error sending outgoing message! %@", buf, 0xCu);
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __43__APSConnection__sendOutgoingMessage_fake___block_invoke_195;
  v18[3] = &unk_1E3C8B9F8;
  v16 = *(void **)(a1 + 48);
  v19 = *(id *)(a1 + 40);
  v20 = v16;
  v21 = v14;
  v17 = v14;
  objc_msgSend(v19, "_asyncOnDelegateQueueWithBlock:", v18);

LABEL_9:
}

void __43__APSConnection__sendOutgoingMessage_fake___block_invoke_195(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[APSLog connection](APSLog, "connection");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v12 = 138413058;
    v13 = v5;
    v14 = 2112;
    v15 = v3;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ checking if %@ responds to message %@ failing to send %@", (uint8_t *)&v12, 0x2Au);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[APSLog connection](APSLog, "connection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[4];
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ calling %@ didFailToSendOutgoingMessage:", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(v3, "connection:didFailToSendOutgoingMessage:error:", a1[4], a1[5], a1[6]);
    +[APSLog connection](APSLog, "connection");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[4];
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_19BBC2000, v10, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didFailToSendOutgoingMessage:", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (void)sendOutgoingMessage:(id)a3
{
  -[APSConnection _sendOutgoingMessage:fake:](self, "_sendOutgoingMessage:fake:", a3, 0);
}

- (void)cancelOutgoingMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  APSConnection *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[APSLog connection](APSLog, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    v13 = 2048;
    v14 = objc_msgSend(v4, "identifier");
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ cancelOutgoingMessage: %@ id=%lu", buf, 0x20u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__APSConnection_cancelOutgoingMessage___block_invoke;
  v7[3] = &unk_1E3C8B590;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v7);

}

void __39__APSConnection_cancelOutgoingMessage___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  xpc_object_t message;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    message = xpc_dictionary_create(0, 0, 0);
    v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 11);
    v9 = objc_msgSend(*(id *)(a1 + 40), "messageID");
    APSInsertIntsToXPCDictionary(message, "messageID", v10, v11, v12, v13, v14, v15, v9);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), message);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v20 = v17;
      _os_log_impl(&dword_19BBC2000, v16, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in cancelOutgoingMessage!", buf, 0xCu);
    }

  }
}

- (void)sendFakeMessage:(id)a3
{
  -[APSConnection _sendOutgoingMessage:fake:](self, "_sendOutgoingMessage:fake:", a3, 1);
}

- (void)requestTokenForInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  APSConnection *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[APSLog connection](APSLog, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@: Requesting extended app token for info %@", buf, 0x16u);
  }

  objc_msgSend(v4, "topic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_msgSend(v4, "setIdentifier:", &stru_1E3C8CB18);
    objc_msgSend(v4, "expirationDate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_8;
    v9 = (void *)v8;
    objc_msgSend(v4, "expirationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);

    if (v12 == -1)
    {
      +[APSLog connection](APSLog, "connection");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v17 = self;
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_19BBC2000, v13, OS_LOG_TYPE_DEFAULT, "%@: Token was requested for an expiration date that is in the past %@", buf, 0x16u);
      }

    }
    else
    {
LABEL_8:
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __37__APSConnection_requestTokenForInfo___block_invoke;
      v14[3] = &unk_1E3C8B590;
      v14[4] = self;
      v15 = v4;
      -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v14);

    }
  }

}

void __37__APSConnection_requestTokenForInfo___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  xpc_object_t xdict;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    xdict = xpc_dictionary_create(0, 0, 0);
    v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 15);
    objc_msgSend(*(id *)(a1 + 40), "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    APSCreateXPCObjectFromDictionary(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    xpc_dictionary_set_value(xdict, "info", v10);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), xdict);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_impl(&dword_19BBC2000, v11, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in requestTokenForInfo!", buf, 0xCu);
    }

  }
}

- (void)invalidateTokenForTopic:(id)a3 identifier:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  id v9;
  __CFString *v10;
  _QWORD v11[5];
  __CFString *v12;
  id v13;
  uint8_t buf[4];
  APSConnection *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  +[APSLog connection](APSLog, "connection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ invalidateTokenForTopic: %@ identifier %@", buf, 0x20u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  if (!v7)
    v7 = &stru_1E3C8CB18;
  v11[1] = 3221225472;
  v11[2] = __52__APSConnection_invalidateTokenForTopic_identifier___block_invoke;
  v11[3] = &unk_1E3C8B7B0;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v11);

}

void __52__APSConnection_invalidateTokenForTopic_identifier___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  xpc_object_t message;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    message = xpc_dictionary_create(0, 0, 0);
    v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 17);
    APSInsertNSStringsToXPCDictionary(message, "identifier", v9, v10, v11, v12, v13, v14, *(_QWORD *)(a1 + 40));
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), message);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v16;
      _os_log_impl(&dword_19BBC2000, v15, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in invalidateTokenForTopic!", buf, 0xCu);
    }

  }
}

- (void)invalidateTokenForInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  APSConnection *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[APSLog connection](APSLog, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ invalidateTokenForInfo: %@", buf, 0x16u);
  }

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(v4, "setIdentifier:", &stru_1E3C8CB18);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__APSConnection_invalidateTokenForInfo___block_invoke;
  v8[3] = &unk_1E3C8B590;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v8);

}

void __40__APSConnection_invalidateTokenForInfo___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  xpc_object_t xdict;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    xdict = xpc_dictionary_create(0, 0, 0);
    v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 18);
    objc_msgSend(*(id *)(a1 + 40), "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    APSCreateXPCObjectFromDictionary(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    xpc_dictionary_set_value(xdict, "info", v10);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), xdict);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_impl(&dword_19BBC2000, v11, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in invalidateTokenForInfo!", buf, 0xCu);
    }

  }
}

- (void)calloutToDelegatesForURLTokenError:(id)a3 forInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  APSConnection *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__APSConnection_calloutToDelegatesForURLTokenError_forInfo_completion___block_invoke;
  v14[3] = &unk_1E3C8BCC0;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[APSConnection _asyncOnDelegateQueueWithBlock:requiresDelegate:](self, "_asyncOnDelegateQueueWithBlock:requiresDelegate:", v14, 0);

}

void __71__APSConnection_calloutToDelegatesForURLTokenError_forInfo_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1[7];
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, a1[4]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[APSLog connection](APSLog, "connection");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      v6 = a1[5];
      v8 = a1[6];
      v11 = 138413058;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for received web token error %@ for info %@", (uint8_t *)&v11, 0x2Au);
    }

    objc_msgSend(v3, "connection:didReceiveURLTokenError:forInfo:", a1[5], a1[4], a1[6]);
    +[APSLog connection](APSLog, "connection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[5];
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_19BBC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ didReceiveURLTokenError:forInfo", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (void)requestURLTokenForInfo:(id)a3
{
  -[APSConnection requestURLTokenForInfo:completion:](self, "requestURLTokenForInfo:completion:", a3, 0);
}

- (void)requestURLTokenForInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29[4];
  id v30;
  APSConnection *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint8_t buf[4];
  APSConnection *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[APSLog connection](APSLog, "connection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x1A1AC918C](v7);
    *(_DWORD *)buf = 138412802;
    v37 = self;
    v38 = 2112;
    v39 = v6;
    v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@: requestURLTokenForInfo %@ completion %@", buf, 0x20u);

  }
  objc_msgSend(v6, "topic");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        objc_msgSend(v6, "vapidPublicKey"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    +[APSLog connection](APSLog, "connection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[APSConnection requestURLTokenForInfo:completion:].cold.1();

    v26 = CFSTR("Missing topic and/or vapidPublicKey");
    goto LABEL_11;
  }
  objc_msgSend(v6, "expirationDate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v6, "expirationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "compare:", v16);

    if (v17 == -1)
    {
      +[APSLog connection](APSLog, "connection");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[APSConnection requestURLTokenForInfo:completion:].cold.2();

      v26 = CFSTR("expirationDate is in the past");
LABEL_11:
      APSURLTokenError(100, v26, v20, v21, v22, v23, v24, v25, v29[0]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[APSConnection calloutToDelegatesForURLTokenError:forInfo:completion:](self, "calloutToDelegatesForURLTokenError:forInfo:completion:", v27, v6, v7);

      goto LABEL_12;
    }
  }
  v18 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __51__APSConnection_requestURLTokenForInfo_completion___block_invoke;
  v33[3] = &unk_1E3C8BCE8;
  v33[4] = self;
  v35 = v7;
  v34 = v6;
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = (uint64_t)__51__APSConnection_requestURLTokenForInfo_completion___block_invoke_207;
  v29[3] = (uint64_t)&unk_1E3C8B8E0;
  v30 = v34;
  v31 = self;
  v32 = v35;
  -[APSConnection _dispatch_async_to_ivarQueue:shutdownBlock:](self, "_dispatch_async_to_ivarQueue:shutdownBlock:", v33, v29);

LABEL_12:
}

void __51__APSConnection_requestURLTokenForInfo_completion___block_invoke(uint64_t a1)
{
  id *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  xpc_object_t xdict;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*((_QWORD *)*v2 + 13))
  {
    objc_msgSend(*v2, "_insertURLTokenBlock:forInfo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    xdict = xpc_dictionary_create(0, 0, 0);
    v3 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(xdict, v3, v4, v5, v6, v7, v8, v9, 16);
    objc_msgSend(*(id *)(a1 + 40), "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    APSCreateXPCObjectFromDictionary(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    xpc_dictionary_set_value(xdict, "info", v11);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), xdict);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __51__APSConnection_requestURLTokenForInfo_completion___block_invoke_cold_1();

    APSURLTokenError(101, CFSTR("No connection to apsd"), v13, v14, v15, v16, v17, v18, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "calloutToDelegatesForURLTokenError:forInfo:completion:", v19, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void __51__APSConnection_requestURLTokenForInfo_completion___block_invoke_207(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __51__APSConnection_requestURLTokenForInfo_completion___block_invoke_207_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  APSURLTokenError(101, CFSTR("Shutting down, unable to reach apsd"), v9, v10, v11, v12, v13, v14, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "calloutToDelegatesForURLTokenError:forInfo:completion:", v15, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)_insertURLTokenBlock:(id)a3 forInfo:(id)a4
{
  id v6;
  NSMutableDictionary *pendingURLTokenBlocks;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  pendingURLTokenBlocks = self->_pendingURLTokenBlocks;
  if (!pendingURLTokenBlocks)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_pendingURLTokenBlocks;
    self->_pendingURLTokenBlocks = v8;

    pendingURLTokenBlocks = self->_pendingURLTokenBlocks;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](pendingURLTokenBlocks, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingURLTokenBlocks, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1A1AC918C](v14);
    objc_msgSend(v11, "addObject:", v12);
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v11 = (void *)MEMORY[0x1A1AC918C](v14);
    v12 = (void *)objc_msgSend(v13, "initWithObjects:", v11, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingURLTokenBlocks, "setObject:forKeyedSubscript:", v12, v6);
  }

}

- (id)_removeURLTokenBlocksForInfo:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *pendingURLTokenBlocks;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingURLTokenBlocks, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingURLTokenBlocks, "setObject:forKeyedSubscript:", 0, v4);
    if (!-[NSMutableDictionary count](self->_pendingURLTokenBlocks, "count"))
    {
      pendingURLTokenBlocks = self->_pendingURLTokenBlocks;
      self->_pendingURLTokenBlocks = 0;

    }
  }

  return v5;
}

- (void)calloutToInvalidateCompletion:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__APSConnection_calloutToInvalidateCompletion_withSuccess_error___block_invoke;
    v10[3] = &unk_1E3C8BD10;
    v12 = v8;
    v13 = a4;
    v11 = v9;
    -[APSConnection _asyncOnDelegateQueueWithBlock:requiresDelegate:](self, "_asyncOnDelegateQueueWithBlock:requiresDelegate:", v10, 0);

  }
}

uint64_t __65__APSConnection_calloutToInvalidateCompletion_withSuccess_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)invalidateURLTokenForInfo:(id)a3
{
  -[APSConnection invalidateURLTokenForInfo:completion:](self, "invalidateURLTokenForInfo:completion:", a3, 0);
}

- (void)invalidateURLTokenForInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  APSConnection *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[APSLog connection](APSLog, "connection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x1A1AC918C](v7);
    *(_DWORD *)buf = 138412802;
    v27 = self;
    v28 = 2112;
    v29 = v6;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ invalidateURLTokenForInfo: %@ completion %@", buf, 0x20u);

  }
  objc_msgSend(v6, "topic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke;
    v23[3] = &unk_1E3C8B8E0;
    v23[4] = self;
    v24 = v6;
    v25 = v7;
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = (uint64_t)__54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_215;
    v20[3] = (uint64_t)&unk_1E3C8B8E0;
    v20[4] = (uint64_t)self;
    v21 = v24;
    v22 = v25;
    -[APSConnection _dispatch_async_to_ivarQueue:shutdownBlock:](self, "_dispatch_async_to_ivarQueue:shutdownBlock:", v23, v20);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[APSConnection requestURLTokenForInfo:completion:].cold.1();

    APSURLTokenError(100, CFSTR("Missing topic"), v13, v14, v15, v16, v17, v18, v20[0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[APSConnection calloutToInvalidateCompletion:withSuccess:error:](self, "calloutToInvalidateCompletion:withSuccess:error:", v7, 0, v19);

  }
}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke(id *a1)
{
  id *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _xpc_connection_s *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD handler[5];
  id v33;
  id v34;

  v2 = a1 + 4;
  objc_msgSend(a1[4], "_connectIfNecessaryOnIvarQueue");
  if (*((_QWORD *)*v2 + 13))
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    v4 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(v3, v4, v5, v6, v7, v8, v9, v10, 19);
    objc_msgSend(a1[5], "topic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    APSInsertNSStringsToXPCDictionary(v3, "topic", v12, v13, v14, v15, v16, v17, (uint64_t)v11);

    v18 = a1[4];
    v19 = a1[5];
    v20 = (_xpc_connection_s *)*((_QWORD *)v18 + 13);
    v21 = *((_QWORD *)v18 + 2);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_2;
    handler[3] = &unk_1E3C8BD38;
    handler[4] = v18;
    v33 = v19;
    v34 = a1[6];
    xpc_connection_send_message_with_reply(v20, v3, v21, handler);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_cold_1();

    v23 = a1[4];
    v24 = a1[6];
    APSURLTokenError(101, CFSTR("No connection to apsd"), v25, v26, v27, v28, v29, v30, v31);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "calloutToInvalidateCompletion:withSuccess:error:", v24, 0, v3);
  }

}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_3;
  v10[3] = &unk_1E3C8BD38;
  v5 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = *(id *)(a1 + 48);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_212;
  v7[3] = &unk_1E3C8B8E0;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v11, "_handleEvent:withHandler:errorHandler:", a2, v10, v7);

}

uint64_t __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v2 = result;
    +[APSLog connection](APSLog, "connection");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(v2 + 32);
      v5 = *(_QWORD *)(v2 + 40);
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_19BBC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ invalidateURLTokenForInfo calling completion for %@", (uint8_t *)&v6, 0x16u);
    }

    return objc_msgSend(*(id *)(v2 + 32), "calloutToInvalidateCompletion:withSuccess:error:", *(_QWORD *)(v2 + 48), 1, 0);
  }
  return result;
}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_212(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_212_cold_1();

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  APSURLTokenError(101, CFSTR("apsd connection interrupted"), v5, v6, v7, v8, v9, v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calloutToInvalidateCompletion:withSuccess:error:", v4, 0, v11);

}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_215(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_215_cold_1();

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  APSURLTokenError(101, CFSTR("Shutting down, unable to reach apsd"), v5, v6, v7, v8, v9, v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calloutToInvalidateCompletion:withSuccess:error:", v4, 0, v11);

}

- (void)currentTokenForInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  APSConnection *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[APSLog connection](APSLog, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@: Current token for info %@", buf, 0x16u);
  }

  objc_msgSend(v4, "topic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_msgSend(v4, "setIdentifier:", &stru_1E3C8CB18);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37__APSConnection_currentTokenForInfo___block_invoke;
    v8[3] = &unk_1E3C8B590;
    v8[4] = self;
    v9 = v4;
    -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v8);

  }
}

void __37__APSConnection_currentTokenForInfo___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  xpc_object_t xdict;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    xdict = xpc_dictionary_create(0, 0, 0);
    v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 20);
    objc_msgSend(*(id *)(a1 + 40), "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    APSCreateXPCObjectFromDictionary(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    xpc_dictionary_set_value(xdict, "info", v10);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), xdict);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_impl(&dword_19BBC2000, v11, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in currentTokenForInfo!", buf, 0xCu);
    }

  }
}

- (void)currentURLTokenForInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  APSConnection *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[APSLog connection](APSLog, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@: Current url token for info %@", buf, 0x16u);
  }

  objc_msgSend(v4, "topic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__APSConnection_currentURLTokenForInfo___block_invoke;
    v7[3] = &unk_1E3C8B590;
    v7[4] = self;
    v8 = v4;
    -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v7);

  }
}

void __40__APSConnection_currentURLTokenForInfo___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  xpc_object_t xdict;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    xdict = xpc_dictionary_create(0, 0, 0);
    v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(xdict, v2, v3, v4, v5, v6, v7, v8, 21);
    objc_msgSend(*(id *)(a1 + 40), "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    APSCreateXPCObjectFromDictionary(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    xpc_dictionary_set_value(xdict, "info", v10);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), xdict);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_impl(&dword_19BBC2000, v11, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in currentTokenForInfo!", buf, 0xCu);
    }

  }
}

- (void)requestKeepAlive
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__APSConnection_requestKeepAlive__block_invoke;
  v2[3] = &unk_1E3C8B240;
  v2[4] = self;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v2);
}

void __33__APSConnection_requestKeepAlive__block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  xpc_object_t message;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    message = xpc_dictionary_create(0, 0, 0);
    v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 49);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), message);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl(&dword_19BBC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in requestKeepAlive!", buf, 0xCu);
    }

  }
}

- (void)confirmReceiptForMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "isTracingEnabled"))
  {
    objc_msgSend(v4, "tracingUUID");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "topic");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __42__APSConnection_confirmReceiptForMessage___block_invoke;
        v8[3] = &unk_1E3C8B590;
        v8[4] = self;
        v9 = v4;
        -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v8);

      }
    }
  }

}

void __42__APSConnection_confirmReceiptForMessage___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  xpc_object_t message;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    message = xpc_dictionary_create(0, 0, 0);
    v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 24);
    objc_msgSend(*(id *)(a1 + 40), "tracingUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    APSInsertDatasToXPCDictionary(message, "tracingUUID", v10, v11, v12, v13, v14, v15, (uint64_t)v9);

    objc_msgSend(*(id *)(a1 + 40), "topic");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    APSInsertNSStringsToXPCDictionary(message, "topic", v17, v18, v19, v20, v21, v22, (uint64_t)v16);

    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), message);
  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v27 = v24;
      _os_log_impl(&dword_19BBC2000, v23, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in confirmReceiptForMessage!", buf, 0xCu);
    }

  }
}

- (void)subscribeToChannel:(id)a3 forTopic:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[APSConnection subscribeToChannels:forTopic:](self, "subscribeToChannels:forTopic:", v9, v7, v10, v11);
}

- (void)subscribeToChannels:(id)a3 forTopic:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  APSChannelSubscriptionFailure *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  uint8_t v44[4];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSConnection enabledTopics](self, "enabledTopics");
  v8 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject containsObject:](v8, "containsObject:", v7))
    goto LABEL_6;
  -[APSConnection opportunisticTopics](self, "opportunisticTopics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsObject:", v7))
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  -[APSConnection nonWakingTopics](self, "nonWakingTopics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "containsObject:", v7))
  {

    goto LABEL_5;
  }
  -[APSConnection ignoredTopics](self, "ignoredTopics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "containsObject:", v7);

  if ((v28 & 1) == 0)
  {
    +[APSLog connection](APSLog, "connection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[APSConnection subscribeToChannels:forTopic:].cold.2(v8);
    goto LABEL_6;
  }
LABEL_7:
  v29 = v7;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  v13 = v30;
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v39;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v16);
        v18 = objc_alloc(MEMORY[0x1E0C99D50]);
        objc_msgSend(v17, "channelID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithBase64EncodedString:options:", v19, 0);

        +[APSLog connection](APSLog, "connection");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v20)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v43 = v17;
            _os_log_impl(&dword_19BBC2000, v22, OS_LOG_TYPE_DEFAULT, "Sending subscription request %@ to daemon", buf, 0xCu);
          }

          objc_msgSend(v17, "dictionaryRepresentation");
          v23 = (APSChannelSubscriptionFailure *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v23);
        }
        else
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[APSConnection subscribeToChannels:forTopic:].cold.1(v44, v17, &v45, v22);

          v23 = objc_alloc_init(APSChannelSubscriptionFailure);
          objc_msgSend(v17, "channelID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[APSChannelSubscriptionFailure setChannelID:](v23, "setChannelID:", v24);

          -[APSChannelSubscriptionFailure setFailureReason:](v23, "setFailureReason:", 0);
          objc_msgSend(v32, "addObject:", v23);
          objc_msgSend(v31, "removeObject:", v17);
          v13 = v30;
        }

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v32, "count"))
  {
    -[APSConnection delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __46__APSConnection_subscribeToChannels_forTopic___block_invoke;
      v36[3] = &unk_1E3C8BD60;
      v36[4] = self;
      v37 = v32;
      -[APSConnection _asyncOnDelegateQueueWithBlock:](self, "_asyncOnDelegateQueueWithBlock:", v36);

    }
  }
  if (objc_msgSend(v31, "count"))
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __46__APSConnection_subscribeToChannels_forTopic___block_invoke_2;
    v33[3] = &unk_1E3C8B7B0;
    v33[4] = self;
    v34 = v30;
    v35 = v29;
    -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v33);

  }
}

void __46__APSConnection_subscribeToChannels_forTopic___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:channelSubscriptionsFailedWithFailures:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __46__APSConnection_subscribeToChannels_forTopic___block_invoke_2(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  xpc_object_t message;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    message = xpc_dictionary_create(0, 0, 0);
    v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 50);
    APSInsertNSArraysToXPCDictionary(message, "channelDicts", v9, v10, v11, v12, v13, v14, *(_QWORD *)(a1 + 40));
    APSInsertNSStringsToXPCDictionary(message, "pushTopic", v15, v16, v17, v18, v19, v20, *(_QWORD *)(a1 + 48));
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), message);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_impl(&dword_19BBC2000, v21, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in subscribeToChannel:forTopic:!", buf, 0xCu);
    }

  }
}

- (void)unsubscribeFromChannel:(id)a3 forTopic:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[APSConnection unsubscribeFromChannels:forTopic:](self, "unsubscribeFromChannels:forTopic:", v9, v7, v10, v11);
}

- (void)unsubscribeFromChannels:(id)a3 forTopic:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        +[APSLog connection](APSLog, "connection");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v12;
          _os_log_impl(&dword_19BBC2000, v13, OS_LOG_TYPE_DEFAULT, "Sending unsubscribe request %@ to daemon", buf, 0xCu);
        }

        objc_msgSend(v12, "dictionaryRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __50__APSConnection_unsubscribeFromChannels_forTopic___block_invoke;
  v19[3] = &unk_1E3C8B7B0;
  v19[4] = self;
  v20 = v6;
  v21 = v17;
  v15 = v17;
  v16 = v6;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v19);

}

void __50__APSConnection_unsubscribeFromChannels_forTopic___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  xpc_object_t message;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    message = xpc_dictionary_create(0, 0, 0);
    v2 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(message, v2, v3, v4, v5, v6, v7, v8, 51);
    APSInsertNSDictionariesToXPCDictionary(message, "channelDicts", v9, v10, v11, v12, v13, v14, *(_QWORD *)(a1 + 40));
    APSInsertNSStringsToXPCDictionary(message, "pushTopic", v15, v16, v17, v18, v19, v20, *(_QWORD *)(a1 + 48));
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), message);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_impl(&dword_19BBC2000, v21, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in unsubscribeFromChannel:forTopic:!", buf, 0xCu);
    }

  }
}

- (void)getRegisteredChannelsForTopic:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  APSConnection *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke;
    v18[3] = &unk_1E3C8BDB0;
    v18[4] = self;
    v19 = v7;
    v10 = (void *)MEMORY[0x1A1AC918C](v18);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_3;
    v15[3] = &unk_1E3C8B8E0;
    v15[4] = self;
    v16 = v6;
    v17 = v10;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_229;
    v13[3] = &unk_1E3C8B698;
    v13[4] = self;
    v14 = v17;
    v11 = v17;
    -[APSConnection _dispatch_async_to_ivarQueue:shutdownBlock:](self, "_dispatch_async_to_ivarQueue:shutdownBlock:", v15, v13);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_impl(&dword_19BBC2000, v12, OS_LOG_TYPE_DEFAULT, "%@ APS getRegisteredChannelsForTopic:withCompletion: was given a nil block -- returning", buf, 0xCu);
    }

  }
}

void __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_2;
  v11[3] = &unk_1E3C8BD88;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "_asyncOnDelegateQueueWithBlock:requiresDelegate:", v11, 0);

}

uint64_t __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _xpc_connection_s *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD handler[5];
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    v3 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(v2, v3, v4, v5, v6, v7, v8, v9, 52);
    APSInsertNSStringsToXPCDictionary(v2, "pushTopic", v10, v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 40));
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v18 = *(_xpc_connection_s **)(v16 + 104);
    v19 = *(NSObject **)(v16 + 16);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_4;
    handler[3] = &unk_1E3C8BD38;
    handler[4] = v16;
    v31 = v17;
    v32 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v18, v2, v19, handler);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      _os_log_impl(&dword_19BBC2000, v20, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in subscribeToChannel:forTopic:!", buf, 0xCu);
    }

    v22 = *(_QWORD *)(a1 + 48);
    APSPubSubError(100, CFSTR("Failed connecting to apsd"), v23, v24, v25, v26, v27, v28, v29);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v2);
  }

}

void __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_5;
  v13[3] = &unk_1E3C8BDD8;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v17 = *(id *)(a1 + 48);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_224;
  v10[3] = &unk_1E3C8B8E0;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v9 = v6;
  objc_msgSend(v4, "_handleEvent:withHandler:errorHandler:", v9, v13, v10);

}

void __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_5(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  if (v2)
  {
    APSGetXPCArrayFromDictionary(v2, "subscribedChannels");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
          v11 = objc_alloc((Class)CUTWeakLinkClass());
          v12 = (void *)objc_msgSend(v11, "initWithDictionary:", v10, (_QWORD)v16);
          objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      }
      while (v7);
    }

    +[APSLog connection](APSLog, "connection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = a1[5];
      v15 = a1[6];
      *(_DWORD *)buf = 138412802;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_19BBC2000, v13, OS_LOG_TYPE_DEFAULT, "%@ push topic %@ got registered channels %@", buf, 0x20u);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_224(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BYTE v13[12];
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)v13 = 138412546;
    *(_QWORD *)&v13[4] = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ APS received an error in getRegisteredChannelsForTopic:withCompletion: %@", v13, 0x16u);
  }

  v5 = a1[6];
  APSPubSubError(100, CFSTR("XPC Error received"), v6, v7, v8, v9, v10, v11, *(uint64_t *)v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v12);

}

void __62__APSConnection_getRegisteredChannelsForTopic_withCompletion___block_invoke_229(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE v12[12];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v12 = 138412290;
    *(_QWORD *)&v12[4] = v3;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ APS getRegisteredChannelsForTopic:withCompletion: shutting down -- returning", v12, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 40);
  APSPubSubError(100, CFSTR("Shutting down, unable to reach apsd"), v5, v6, v7, v8, v9, v10, *(uint64_t *)v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v11);

}

- (void)getRegisteredChannelsForTopic:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  uint8_t buf[4];
  APSConnection *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__APSConnection_getRegisteredChannelsForTopic_completion___block_invoke;
    v9[3] = &unk_1E3C8BE00;
    v10 = v6;
    -[APSConnection getRegisteredChannelsForTopic:withCompletion:](self, "getRegisteredChannelsForTopic:withCompletion:", a3, v9);
    v8 = v10;
  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      _os_log_impl(&dword_19BBC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ APS getRegisteredChannelsForTopic:completion: was given a nil block -- returning", buf, 0xCu);
    }
  }

}

uint64_t __58__APSConnection_getRegisteredChannelsForTopic_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
    a2 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (id)registeredChannelsForTopic:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__APSConnection_registeredChannelsForTopic_error___block_invoke;
  v13[3] = &unk_1E3C8BE78;
  v13[4] = self;
  v8 = v6;
  v14 = v8;
  v15 = &v17;
  v16 = &v23;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __50__APSConnection_registeredChannelsForTopic_error___block_invoke_231;
  v12[3] = &unk_1E3C8B7D8;
  v12[4] = self;
  v12[5] = &v23;
  -[APSConnection _dispatch_sync_to_ivarQueue:shutdownBlock:](self, "_dispatch_sync_to_ivarQueue:shutdownBlock:", v13, v12);
  if (a4)
  {
    v9 = (void *)v24[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __50__APSConnection_registeredChannelsForTopic_error___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessaryOnIvarQueue");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    v3 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(v2, v3, v4, v5, v6, v7, v8, v9, 52);
    APSInsertNSStringsToXPCDictionary(v2, "pushTopic", v10, v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 40));
    v16 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 104), v2);
    v17 = *(void **)(a1 + 32);
    v18 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __50__APSConnection_registeredChannelsForTopic_error___block_invoke_2;
    v40[3] = &unk_1E3C8BE28;
    v19 = v16;
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(a1 + 40);
    v41 = v19;
    v42 = v20;
    v22 = v21;
    v23 = *(_QWORD *)(a1 + 48);
    v24 = *(_QWORD *)(a1 + 56);
    v43 = v22;
    v44 = v23;
    v37[0] = v18;
    v37[1] = 3221225472;
    v37[2] = __50__APSConnection_registeredChannelsForTopic_error___block_invoke_230;
    v37[3] = &unk_1E3C8BE50;
    v37[4] = *(_QWORD *)(a1 + 32);
    v38 = v19;
    v39 = v24;
    v25 = v19;
    objc_msgSend(v17, "_handleEvent:withHandler:errorHandler:", v25, v40, v37);

  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v46 = v27;
      _os_log_impl(&dword_19BBC2000, v26, OS_LOG_TYPE_DEFAULT, "%@ APS _connection is NULL in subscribeToChannel:forTopic:!", buf, 0xCu);
    }

    APSPubSubError(100, CFSTR("Failed connecting to apsd"), v28, v29, v30, v31, v32, v33, v36);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v2 = *(xpc_object_t *)(v35 + 40);
    *(_QWORD *)(v35 + 40) = v34;
  }

}

void __50__APSConnection_registeredChannelsForTopic_error___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  if (v2)
  {
    APSGetXPCArrayFromDictionary(v2, "subscribedChannels");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9);
          v11 = objc_alloc((Class)CUTWeakLinkClass());
          v12 = (void *)objc_msgSend(v11, "initWithDictionary:", v10, (_QWORD)v19);
          objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      }
      while (v7);
    }

    +[APSLog connection](APSLog, "connection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = a1[5];
      v15 = a1[6];
      *(_DWORD *)buf = 138412802;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_19BBC2000, v13, OS_LOG_TYPE_DEFAULT, "%@ push topic %@ got registered channels %@", buf, 0x20u);
    }

    v16 = objc_msgSend(v4, "copy");
    v17 = *(_QWORD *)(a1[7] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
}

void __50__APSConnection_registeredChannelsForTopic_error___block_invoke_230(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BYTE v14[12];
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)v14 = 138412546;
    *(_QWORD *)&v14[4] = v3;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ APS received an error in getRegisteredChannelsForTopic:withCompletion: %@", v14, 0x16u);
  }

  APSPubSubError(100, CFSTR("XPC Error received"), v5, v6, v7, v8, v9, v10, *(uint64_t *)v14);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

void __50__APSConnection_registeredChannelsForTopic_error___block_invoke_231(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BYTE v13[12];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[APSLog connection](APSLog, "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v13 = 138412290;
    *(_QWORD *)&v13[4] = v3;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ APS getRegisteredChannelsForTopic:withCompletion: shutting down -- returning", v13, 0xCu);
  }

  APSPubSubError(100, CFSTR("Shutting down, unable to reach apsd"), v4, v5, v6, v7, v8, v9, *(uint64_t *)v13);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (void)_deliverFailedChannelSubscriptions:(id)a3 onTopic:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  APSConnection *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__APSConnection__deliverFailedChannelSubscriptions_onTopic___block_invoke;
  v10[3] = &unk_1E3C8B7B0;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v10);

}

void __60__APSConnection__deliverFailedChannelSubscriptions_onTopic___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  APSChannelSubscriptionFailure *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id obj;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        v8 = objc_alloc_init(APSChannelSubscriptionFailure);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("channelID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[APSChannelSubscriptionFailure setChannelID:](v8, "setChannelID:", v9);

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("reason"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[APSChannelSubscriptionFailure setFailureReason:](v8, "setFailureReason:", objc_msgSend(v10, "integerValue"));
        -[APSChannelSubscriptionFailure setPushTopic:](v8, "setPushTopic:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v2, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v4);
  }

  +[APSLog connection](APSLog, "connection");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v24 = v12;
    v25 = 2112;
    v26 = v2;
    v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_19BBC2000, v11, OS_LOG_TYPE_DEFAULT, "%@ Received failed subscription requests %@ for topic %@", buf, 0x20u);
  }

  v14 = *(void **)(a1 + 48);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__APSConnection__deliverFailedChannelSubscriptions_onTopic___block_invoke_236;
  v17[3] = &unk_1E3C8BD60;
  v17[4] = v14;
  v18 = v2;
  v15 = v2;
  objc_msgSend(v14, "_asyncOnDelegateQueueWithBlock:", v17);

}

void __60__APSConnection__deliverFailedChannelSubscriptions_onTopic___block_invoke_236(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[APSLog connection](APSLog, "connection");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ calling %@ for subscription failures", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(v3, "connection:channelSubscriptionsFailedWithFailures:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    +[APSLog connection](APSLog, "connection");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_19BBC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ returned from %@ channelSubscriptionsFailedWithFailures:", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)_onIvarQueue_setPushWakeTopics:(id)a3
{
  NSArray *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  APSConnection *v16;
  __int16 v17;
  NSArray *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  +[APSLog connection](APSLog, "connection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_19BBC2000, v6, OS_LOG_TYPE_DEFAULT, "%@: Setting PushWakeTopics: %@", buf, 0x16u);
  }

  if (self->_pushWakeTopics != v5)
    objc_storeStrong((id *)&self->_pushWakeTopics, a3);
  -[APSConnection _connectIfNecessaryOnIvarQueue](self, "_connectIfNecessaryOnIvarQueue");
  if (self->_connection)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    v8 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(v7, v8, v9, v10, v11, v12, v13, v14, 38);
    -[APSConnection _addPushWakeTopicsToXPCMessage:](self, "_addPushWakeTopicsToXPCMessage:", v7);
    xpc_connection_send_message(self->_connection, v7);
  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_impl(&dword_19BBC2000, v7, OS_LOG_TYPE_DEFAULT, "%@ _connection is NULL in _setPushWakeTopics", buf, 0xCu);
    }
  }

}

- (void)setUltraConstrainedTopics:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__APSConnection_setUltraConstrainedTopics___block_invoke;
  v6[3] = &unk_1E3C8B590;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[APSConnection _dispatch_async_to_ivarQueue:](self, "_dispatch_async_to_ivarQueue:", v6);

}

uint64_t __43__APSConnection_setUltraConstrainedTopics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_setUltraConstrainedTopics:", *(_QWORD *)(a1 + 40));
}

- (void)_onIvarQueue_setUltraConstrainedTopics:(id)a3
{
  NSArray *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  APSConnection *v16;
  __int16 v17;
  NSArray *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  +[APSLog connection](APSLog, "connection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_19BBC2000, v6, OS_LOG_TYPE_DEFAULT, "%@: Setting UltraConstrainedTopics: %@", buf, 0x16u);
  }

  if (self->_ultraConstrainedTopics != v5)
    objc_storeStrong((id *)&self->_ultraConstrainedTopics, a3);
  -[APSConnection _connectIfNecessaryOnIvarQueue](self, "_connectIfNecessaryOnIvarQueue");
  if (self->_connection)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    v8 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(v7, v8, v9, v10, v11, v12, v13, v14, 25);
    -[APSConnection _addUltraConstrainedTopicsToXPCMessage:](self, "_addUltraConstrainedTopicsToXPCMessage:", v7);
    xpc_connection_send_message(self->_connection, v7);
  }
  else
  {
    +[APSLog connection](APSLog, "connection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_impl(&dword_19BBC2000, v7, OS_LOG_TYPE_DEFAULT, "%@ _connection is NULL in _setUltraConstrainedTopics", buf, 0xCu);
    }
  }

}

- (BOOL)usesAppLaunchStats
{
  return self->_usesAppLaunchStats;
}

- (void)setUsesAppLaunchStats:(BOOL)a3
{
  self->_usesAppLaunchStats = a3;
}

- (os_unfair_lock_s)topicMoveLock
{
  return self->_topicMoveLock;
}

- (void)setTopicMoveLock:(os_unfair_lock_s)a3
{
  self->_topicMoveLock = a3;
}

- (NSMutableArray)accumulatedTopicMoves
{
  return self->_accumulatedTopicMoves;
}

- (void)setAccumulatedTopicMoves:(id)a3
{
  objc_storeStrong((id *)&self->_accumulatedTopicMoves, a3);
}

- (BOOL)isShutdown
{
  return self->_isShutdown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedTopicMoves, 0);
  objc_storeStrong((id *)&self->_nonWakingTopics, 0);
  objc_storeStrong((id *)&self->_opportunisticTopics, 0);
  objc_storeStrong((id *)&self->_ignoredTopics, 0);
  objc_storeStrong((id *)&self->_enabledTopics, 0);
  objc_storeStrong((id *)&self->_pendingURLTokenBlocks, 0);
  objc_storeStrong((id *)&self->_ultraConstrainedTopics, 0);
  objc_storeStrong((id *)&self->_pushWakeTopics, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_queuedDelegateBlocks, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_mach_source, 0);
  objc_storeStrong((id *)&self->_machQueue, 0);
  objc_storeStrong((id *)&self->_idsToOutgoingMessages, 0);
  objc_storeStrong((id *)&self->_connectionPortName, 0);
  objc_storeStrong((id *)&self->_publicToken, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_delegateReference, 0);
}

- (void)_initWithEnvironmentName:namedDelegatePort:enablePushDuringSleep:personaUniqueString:queue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19BBC2000, v0, v1, "Client provided an invalid port name! {nameOfPort: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __35__APSConnection_scheduleInRunLoop___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19BBC2000, a1, a3, "We should not call scheduleInRunLoop if _queue is not null!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __121__APSConnection__onIvarQueue_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_sendToDaemon_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_19BBC2000, a2, a3, "%@ provided setTopics completion block without delegate queue to callback on -- dropping", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_blockingXPCCallWithArgumentBlock:resultHandler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v2 = 2080;
  v3 = "com.apple.apsd";
  _os_log_fault_impl(&dword_19BBC2000, v0, OS_LOG_TYPE_FAULT, "%@: Failed to perform blocking call, unable to allocate XPC connection to '%s'", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)requestURLTokenForInfo:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19BBC2000, v0, v1, "Web token info does not contain required fields. Failing %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)requestURLTokenForInfo:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19BBC2000, v0, v1, "Web token info contains past expiration date. Failing %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__APSConnection_requestURLTokenForInfo_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_19BBC2000, v0, (uint64_t)v0, "%@ APS _connection is NULL in requestURLTokenForInfo %@", v1);
  OUTLINED_FUNCTION_2();
}

void __51__APSConnection_requestURLTokenForInfo_completion___block_invoke_207_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19BBC2000, a2, a3, "requestURLTokenForInfo shutting down. Failing %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_19BBC2000, v0, (uint64_t)v0, "%@ APS _connection is NULL in invalidateURLTokenForInfo %@", v1);
  OUTLINED_FUNCTION_2();
}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_212_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_19BBC2000, v0, v1, "%@ invalidateURLTokenForInfo commmunication error. Failing %@", v2);
  OUTLINED_FUNCTION_2();
}

void __54__APSConnection_invalidateURLTokenForInfo_completion___block_invoke_215_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_19BBC2000, v0, v1, "%@ invalidateURLTokenForInfo shutting down. Failing %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)subscribeToChannels:(_QWORD *)a3 forTopic:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "channelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_19BBC2000, a4, OS_LOG_TYPE_ERROR, "ChannelID is not invalid.  Provided ID is not a base64 string. %@", a1, 0xCu);

}

- (void)subscribeToChannels:(os_log_t)log forTopic:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19BBC2000, log, OS_LOG_TYPE_FAULT, "You are subscribing to a push topic that has not been enabled. This can lead to undefined behavior.  Please enable topics before subscribing.", v1, 2u);
  OUTLINED_FUNCTION_7();
}

@end
