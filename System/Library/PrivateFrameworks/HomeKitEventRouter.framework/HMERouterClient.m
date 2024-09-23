@implementation HMERouterClient

- (void)setPrivateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_privateDelegate, a3);
}

- (HMERouterClient)initWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 logger:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMERouterClient *v15;
  HMERouterClient *v16;
  HMETopicRouter *v17;
  HMETopicRouter *topicRouter;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMERouterClient;
  v15 = -[HMERouterClient init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_logger, a6);
    objc_storeStrong((id *)&v16->_queue, a3);
    v17 = -[HMETopicRouter initWithDelegate:logger:]([HMETopicRouter alloc], "initWithDelegate:logger:", v16, v14);
    topicRouter = v16->_topicRouter;
    v16->_topicRouter = v17;

    objc_storeStrong((id *)&v16->_eventStoreReadHandle, a4);
    objc_storeStrong((id *)&v16->_eventStoreWriteHandle, a5);
  }

  return v16;
}

- (HMERouterClient)initWithQueue:(id)a3 storeReadHandle:(id)a4 logger:(id)a5
{
  return -[HMERouterClient initWithQueue:storeReadHandle:storeWriteHandle:logger:](self, "initWithQueue:storeReadHandle:storeWriteHandle:logger:", a3, a4, 0, a5);
}

- (HMERouterClient)initWithQueue:(id)a3
{
  id v4;
  os_log_t v5;
  HMERouterClient *v6;

  v4 = a3;
  v5 = os_log_create("com.apple.HomeKitEventRouter", "HMERouterClient");
  v6 = -[HMERouterClient initWithQueue:storeReadHandle:logger:](self, "initWithQueue:storeReadHandle:logger:", v4, 0, v5);

  return v6;
}

- (id)dumpStateDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMERouterClient topicRouter](self, "topicRouter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dumpStateDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@: \n\t topicRouter: %@]"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  if (!-[HMERouterClient handleChangeRegistrationsWithTopicFilterAdditions:removals:](self, "handleChangeRegistrationsWithTopicFilterAdditions:removals:", v6, v7)&& (objc_msgSend(v6, "count") || objc_msgSend(v7, "count")))
  {
    objc_initWeak(&location, self);
    -[HMERouterClient privateDelegate](self, "privateDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__HMERouterClient_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke;
    v9[3] = &unk_1E3B30EA8;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "sendChangeRegistrationsMessageWithAddedFilters:removedFilters:completion:", v6, v7, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)changeRegistrationsForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMERouterClient queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__HMERouterClient_changeRegistrationsForConsumer_topicFilterAdditions_topicFilterRemovals_completion___block_invoke;
  block[3] = &unk_1E3B31218;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)registerConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[HMERouterClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__HMERouterClient_registerConsumer_topicFilters_completion___block_invoke;
  v15[3] = &unk_1E3B31240;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)unregisterConsumer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMERouterClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HMERouterClient_unregisterConsumer_completion___block_invoke;
  block[3] = &unk_1E3B31268;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)unregisterConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[HMERouterClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__HMERouterClient_unregisterConsumer_topicFilters_completion___block_invoke;
  v15[3] = &unk_1E3B31240;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)changeRegistrationsSyncForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  void (**v10)(id, void *, _QWORD);
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v10 = (void (**)(id, void *, _QWORD))a6;
  v11 = a5;
  v12 = a3;
  -[HMERouterClient queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  -[HMERouterClient topicRouter](self, "topicRouter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:", v12, v16, v11);

  if (v10)
  {
    -[HMERouterClient _cachedEventsForExpandedTopics:](self, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v15, 0);

  }
}

- (void)unregisterConsumerSync:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  -[HMERouterClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMERouterClient topicRouter](self, "topicRouter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterConsumer:", v6);

  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    v9 = v10;
  }

}

- (BOOL)isCachedEventSourceCurrentProcess
{
  return 0;
}

- (void)processReceivedEvents:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *logger;
  unint64_t v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMERouterClient isActiveForSaving](self, "isActiveForSaving"))
  {
    v29 = -[HMERouterClient willWriteToStore](self, "willWriteToStore");
    -[HMERouterClient queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v30 = v4;
    obj = v4;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v39 != v32)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v7, "event");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[HMERouterClient isActiveForSaving](self, "isActiveForSaving"))
          {
            logger = self->_logger;
            if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Went inactive", buf, 2u);
            }

            goto LABEL_30;
          }
          objc_msgSend(v7, "topic");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v8;
          v11 = v9;
          if (self)
          {
            -[HMERouterClient queue](self, "queue");
            v12 = objc_claimAutoreleasedReturnValue();
            dispatch_assert_queue_V2(v12);

            -[HMERouterClient eventStoreWriteHandle](self, "eventStoreWriteHandle");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              -[HMERouterClient eventStoreWriteHandle](self, "eventStoreWriteHandle");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "writer:saveEventIfAllowed:topic:", self, v10, v11);

            }
          }

          v15 = self->_logger;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            objc_msgSend(v7, "topic");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v44 = v17;
            _os_log_impl(&dword_19B524000, v16, OS_LOG_TYPE_DEFAULT, "Forwarding received event for topic %@", buf, 0xCu);

          }
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          -[HMERouterClient topicRouter](self, "topicRouter");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "topic");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "consumersForTopic:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v35 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                if (v25)
                {
                  objc_msgSend(v7, "topic");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "didReceiveEvent:topic:", v10, v26);

                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v22);
          }

        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
        if (v33)
          continue;
        break;
      }
    }
LABEL_30:

    -[HMERouterClient finishedWritingToStore:](self, "finishedWritingToStore:", v29);
    v4 = v30;
  }
  else
  {
    v27 = self->_logger;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B524000, v27, OS_LOG_TYPE_DEFAULT, "Not processing events when not active", buf, 2u);
    }
  }

}

- (id)processReceivedCachedEvents:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *logger;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMERouterClient isActiveForSaving](self, "isActiveForSaving");
  logger = self->_logger;
  v7 = os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = logger;
      *(_DWORD *)buf = 134217984;
      v55 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_19B524000, v8, OS_LOG_TYPE_DEFAULT, "Processing received cached events %ld", buf, 0xCu);

      logger = self->_logger;
    }
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v55 = (uint64_t)v4;
      _os_log_debug_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEBUG, "Processing received cached events %@", buf, 0xCu);
    }
    v37 = -[HMERouterClient willWriteToStore](self, "willWriteToStore");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMERouterClient queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v38 = v4;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v49;
      v40 = *(_QWORD *)v49;
      v41 = v10;
      do
      {
        v14 = 0;
        v42 = v12;
        do
        {
          if (*(_QWORD *)v49 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x1A1AC220C]();
          objc_msgSend(v10, "objectForKeyedSubscript:", v15);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v18 = v15;
          if (!self)
            goto LABEL_30;
          -[HMERouterClient queue](self, "queue");
          v19 = objc_claimAutoreleasedReturnValue();
          dispatch_assert_queue_V2(v19);

          -[HMERouterClient eventStoreWriteHandle](self, "eventStoreWriteHandle");
          v20 = objc_claimAutoreleasedReturnValue();
          if (!v20)
            goto LABEL_30;
          v21 = (void *)v20;
          v22 = -[HMERouterClient isActiveForSaving](self, "isActiveForSaving");

          if (v22)
          {
            -[HMERouterClient eventStoreWriteHandle](self, "eventStoreWriteHandle");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "writer:saveEventIfDifferent:topic:", self, v17, v18);

            if (!v24)
              goto LABEL_32;
            v25 = self->_logger;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v55 = (uint64_t)v18;
              _os_log_debug_impl(&dword_19B524000, v25, OS_LOG_TYPE_DEBUG, "Forwarding received cached event for topic %@", buf, 0xCu);
            }
            v43 = v16;
            -[HMERouterClient topicRouter](self, "topicRouter");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "consumersForTopic:", v18);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v27, "count"))
              objc_msgSend(v39, "addObject:", v18);
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v28 = v27;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v45;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v45 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
                  if (v33 && (objc_opt_respondsToSelector() & 1) != 0)
                    objc_msgSend(v33, "didReceiveCachedEvent:topic:source:", v17, v18, self);
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
              }
              while (v30);
              v18 = v28;
              v13 = v40;
              v10 = v41;
            }
            else
            {
              v18 = v28;
            }
            v12 = v42;
          }
          else
          {
LABEL_30:
            v43 = v16;
            v28 = v17;
          }

          v16 = v43;
LABEL_32:

          objc_autoreleasePoolPop(v16);
          ++v14;
        }
        while (v14 != v12);
        v34 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        v12 = v34;
      }
      while (v34);
    }

    -[HMERouterClient finishedWritingToStore:](self, "finishedWritingToStore:", v37);
    v35 = (void *)objc_msgSend(v39, "copy");

    v4 = v38;
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Not processing events when not active", buf, 2u);
    }
    v35 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v35;
}

- (BOOL)handleChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id location;
  _QWORD v26[5];

  v6 = a3;
  v7 = a4;
  -[HMERouterClient topicRouter](self, "topicRouter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allRegisteredTopicFilters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __78__HMERouterClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke;
  v26[3] = &unk_1E3B31060;
  v26[4] = self;
  +[HMETopicRouter forwardingTopicsForAdditions:removals:current:indexProvider:](HMETopicRouter, "forwardingTopicsForAdditions:removals:current:indexProvider:", v6, v7, v9, v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {

LABEL_4:
    objc_initWeak(&location, self);
    -[HMERouterClient privateDelegate](self, "privateDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __78__HMERouterClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_2;
    v23[3] = &unk_1E3B30EA8;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v17, "sendChangeRegistrationsMessageWithAddedFilters:removedFilters:completion:", v19, v21, v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    goto LABEL_5;
  }
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
    goto LABEL_4;
LABEL_5:

  return 1;
}

- (id)upstreamTopicsForTopic:(id)a3
{
  return 0;
}

- (id)forwardingTopicsForTopics:(id)a3
{
  return a3;
}

- (BOOL)isActiveForSaving
{
  return 1;
}

- (unint64_t)willWriteToStore
{
  return 0;
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 16, 1);
}

- (HMELastEventStoreWriteHandle)eventStoreWriteHandle
{
  return (HMELastEventStoreWriteHandle *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMETopicRouter)topicRouter
{
  return (HMETopicRouter *)objc_getProperty(self, a2, 40, 1);
}

- (HMERouterClientDelegate)privateDelegate
{
  return (HMERouterClientDelegate *)objc_loadWeakRetained((id *)&self->_privateDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_storeStrong((id *)&self->_topicRouter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventStoreWriteHandle, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

uint64_t __78__HMERouterClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "forwardingTopicsForTopics:", a2);
}

void __78__HMERouterClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__HMERouterClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_3;
    v7[3] = &unk_1E3B311C8;
    v7[4] = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

id __78__HMERouterClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_3(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "processReceivedCachedEvents:", *(_QWORD *)(a1 + 40));
}

- (id)_cachedEventsForExpandedTopics:(void *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    objc_msgSend(a1, "eventStoreReadHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1, "eventStoreReadHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "eventsForTopicFilters:", v3);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = (void *)MEMORY[0x1E0C9AA70];
    }
  }

  return a1;
}

uint64_t __62__HMERouterClient_unregisterConsumer_topicFilters_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "topicRouter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterConsumer:topicFilters:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __49__HMERouterClient_unregisterConsumer_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterConsumerSync:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __60__HMERouterClient_registerConsumer_topicFilters_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "topicRouter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerConsumer:topicFilters:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    -[HMERouterClient _cachedEventsForExpandedTopics:](*(void **)(a1 + 32), *(void **)(a1 + 48));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

uint64_t __102__HMERouterClient_changeRegistrationsForConsumer_topicFilterAdditions_topicFilterRemovals_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeRegistrationsSyncForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __75__HMERouterClient_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__HMERouterClient_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_2;
    v7[3] = &unk_1E3B311C8;
    v7[4] = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

id __75__HMERouterClient_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "processReceivedCachedEvents:", *(_QWORD *)(a1 + 40));
}

@end
