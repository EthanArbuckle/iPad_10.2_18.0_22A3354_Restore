@implementation HMETopicRouter

- (HMETopicRouter)initWithDelegate:(id)a3 logger:(id)a4
{
  id v6;
  id v7;
  HMETopicRouter *v8;
  HMETopicRouter *v9;
  uint64_t v10;
  NSMapTable *registrations;
  uint64_t v12;
  NSMutableSet *registeredTopics;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMETopicRouter;
  v8 = -[HMETopicRouter init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_logger, a4);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    registrations = v9->_registrations;
    v9->_registrations = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    registeredTopics = v9->_registeredTopics;
    v9->_registeredTopics = (NSMutableSet *)v12;

    objc_storeWeak((id *)&v9->_delegate, v6);
  }

  return v9;
}

- (HMETopicRouter)init
{
  return -[HMETopicRouter initWithDelegate:](self, "initWithDelegate:", 0);
}

- (HMETopicRouter)initWithDelegate:(id)a3
{
  return -[HMETopicRouter initWithDelegate:logCategory:](self, "initWithDelegate:logCategory:", a3, "TopicRouter");
}

- (HMETopicRouter)initWithDelegate:(id)a3 logCategory:(const char *)a4
{
  id v6;
  os_log_t v7;
  HMETopicRouter *v8;

  v6 = a3;
  v7 = os_log_create("com.apple.HomeKitEventRouter", a4);
  v8 = -[HMETopicRouter initWithDelegate:logger:](self, "initWithDelegate:logger:", v6, v7);

  return v8;
}

- (void)registerConsumer:(id)a3 topicFilters:(id)a4
{
  -[HMETopicRouter changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:](self, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:", a3, a4, MEMORY[0x1E0C9AA60]);
}

- (void)unregisterConsumer:(id)a3 topicFilters:(id)a4
{
  -[HMETopicRouter changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:](self, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:", a3, MEMORY[0x1E0C9AA60], a4);
}

- (void)changeRegistrationsForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *logger;
  void *v22;
  void *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  id v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  id v44;
  id obj;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v48 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v61 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
        -[HMETopicRouter registrations](self, "registrations");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMETopicRouter registrations](self, "registrations");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKey:", v16, v8);

        }
        objc_msgSend(v16, "addObject:", v14);
        -[HMETopicRouter registeredTopics](self, "registeredTopics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "containsObject:", v14);

        if ((v19 & 1) == 0)
        {
          -[HMETopicRouter registeredTopics](self, "registeredTopics");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v14);

          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v14;
            _os_log_debug_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEBUG, "Added topic filter %@", buf, 0xCu);
          }
          objc_msgSend(v50, "addObject:", v14);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v11);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v44 = v48;
  v22 = v50;
  v23 = v47;
  v49 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v49)
  {
    v46 = *(_QWORD *)v57;
    *(_QWORD *)&v24 = 138412290;
    v43 = v24;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v57 != v46)
          objc_enumerationMutation(v44);
        v51 = v25;
        v26 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v25);
        -[HMETopicRouter registrations](self, "registrations", v43);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKey:", v8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeObject:", v26);

        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        -[HMETopicRouter registrations](self, "registrations");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v53;
          while (2)
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v53 != v32)
                objc_enumerationMutation(v29);
              v34 = *(id *)(*((_QWORD *)&v52 + 1) + 8 * j);
              if (v34 != v8)
              {
                -[HMETopicRouter registrations](self, "registrations");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKey:", v34);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v36, "containsObject:", v26);

                if ((v37 & 1) != 0)
                {

                  v22 = v50;
                  v23 = v47;
                  goto LABEL_32;
                }
              }
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
            if (v31)
              continue;
            break;
          }
        }

        v38 = self->_logger;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v43;
          v67 = v26;
          _os_log_debug_impl(&dword_19B524000, v38, OS_LOG_TYPE_DEBUG, "Removed topic filter %@", buf, 0xCu);
        }
        -[HMETopicRouter registeredTopics](self, "registeredTopics");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "removeObject:", v26);

        v23 = v47;
        objc_msgSend(v47, "addObject:", v26);
        v22 = v50;
LABEL_32:
        v25 = v51 + 1;
      }
      while (v51 + 1 != v49);
      v49 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v49);
  }

  if (objc_msgSend(v22, "count") || objc_msgSend(v23, "count"))
  {
    -[HMETopicRouter delegate](self, "delegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allObjects");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allObjects");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "didChangeRegistrationsWithTopicFilterAdditions:removals:", v41, v42);

  }
}

- (void)fetchCachedEventsForConsumer:(id)a3 topicFilters:(id)a4 cachedEventCollection:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a5;
  v7 = a4;
  objc_msgSend(v9, "willAddAdditionalEvents");
  -[HMETopicRouter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedEventsForTopicFilters:cachedEventCollection:", v7, v9);

  objc_msgSend(v9, "didFinishAddingAdditionalEvents");
}

- (id)topicsForConsumer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    -[HMETopicRouter registrations](self, "registrations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v8;
}

- (void)unregisterConsumer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMETopicRouter registrations](self, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HMETopicRouter registrations](self, "registrations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v4);

  -[HMETopicRouter unregisterConsumer:topicFilters:](self, "unregisterConsumer:topicFilters:", v4, v8);
}

- (id)consumersForTopic:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMETopicRouter *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  id obj;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  -[HMETopicRouter delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HMETopicRouter registrations](self, "registrations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      v19 = v6;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1A1AC220C]();
        -[HMETopicRouter registrations](self, "registrations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v13 = v7;
          v14 = self;
          objc_msgSend(v4, "upstreamTopicsForTopic:", v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "mutableCopy");

          objc_msgSend(v16, "intersectSet:", v12);
          if ((objc_msgSend(v12, "containsObject:", v22) & 1) != 0)
          {
            self = v14;
            v7 = v13;
            v6 = v19;
LABEL_13:
            objc_msgSend(v21, "addObject:", v9);
            goto LABEL_14;
          }
          if (v16)
          {
            self = v14;
            v7 = v13;
            v6 = v19;
            if (!objc_msgSend(v16, "count"))
              goto LABEL_14;
            goto LABEL_13;
          }
          self = v14;
          v7 = v13;
          v6 = v19;
        }
        else
        {
          v16 = 0;
          if ((objc_msgSend(v12, "containsObject:", v22) & 1) != 0)
            goto LABEL_13;
        }
LABEL_14:

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v6 = v17;
    }
    while (v17);
  }

  return v21;
}

- (id)minimalSpanningTopicFilters
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unimplemented method"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)allRegisteredTopicFilters
{
  void *v2;
  void *v3;

  -[HMETopicRouter registeredTopics](self, "registeredTopics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)dumpStateDescription
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  BOOL v25;
  int v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  __CFString *v35;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[HMETopicRouter registrations](self, "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  if (!objc_msgSend(v3, "count"))
  {
    v35 = CFSTR("[HMETopicRouter registrations: {}]");
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v3;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  v37 = v3;
  v5 = 0;
  if (!v39)
    goto LABEL_40;
  v38 = *(_QWORD *)v54;
  v42 = v4;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v54 != v38)
        objc_enumerationMutation(obj);
      v41 = v6;
      objc_msgSend(obj, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v6));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v44 = v7;
      v46 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v46)
      {
        v45 = *(_QWORD *)v50;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v50 != v45)
              objc_enumerationMutation(v44);
            objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v8), "componentsSeparatedByString:", CFSTR("."));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v9, "count") < 5)
            {
LABEL_27:
              v21 = 0;
              v22 = 0;
              v23 = 0;
              v26 = 0;
              goto LABEL_30;
            }
            objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("settings")))
            {
              objc_msgSend(v9, "lastObject");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("updated"));

              if (!v12)
                goto LABEL_27;
              v43 = v5;
              v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
              objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14);

              v15 = objc_alloc(MEMORY[0x1E0CB3A28]);
              objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (void *)objc_msgSend(v15, "initWithUUIDString:", v16);

              objc_msgSend(v9, "subarrayWithRange:", 3, objc_msgSend(v9, "count") - 4);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "componentsJoinedByString:", CFSTR("."));
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = (void *)v19;
              v21 = 0;
              v22 = 0;
              v23 = 0;
              if (v10)
                v24 = v17 == 0;
              else
                v24 = 1;
              v25 = v24 || v19 == 0;
              v26 = !v25;
              if (!v25)
              {
                v21 = objc_retainAutorelease(v10);
                v22 = objc_retainAutorelease(v17);
                v23 = objc_retainAutorelease(v20);
              }

              v4 = v42;
              v5 = v43;
            }
            else
            {
              v21 = 0;
              v22 = 0;
              v23 = 0;
              v26 = 0;
            }

LABEL_30:
            v27 = v21;
            v28 = v22;
            v29 = v23;
            if (v26)
            {
              if (!v5)
                v5 = v27;
              objc_msgSend(v4, "objectForKeyedSubscript:", v28);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v30)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, v28);

              }
              objc_msgSend(v4, "objectForKeyedSubscript:", v28);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "addObject:", v29);

            }
            ++v8;
          }
          while (v46 != v8);
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v46);
      }

      v6 = v41 + 1;
    }
    while (v41 + 1 != v39);
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  }
  while (v39);
LABEL_40:

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{\n"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "appendFormat:", CFSTR("\t\t[(HM) uuid = %@]\n"), v5);
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __38__HMETopicRouter_dumpStateDescription__block_invoke;
  v47[3] = &unk_1E3B30E80;
  v48 = v33;
  v34 = v33;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v47);
  objc_msgSend(v34, "appendFormat:", CFSTR("\t}\n"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[HMETopicRouter registrations: %@]"), v34);
  v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v3 = v37;
LABEL_42:

  return v35;
}

- (NSMapTable)registrations
{
  return self->_registrations;
}

- (NSMutableSet)registeredTopics
{
  return self->_registeredTopics;
}

- (HMETopicRouterDelegate)delegate
{
  return (HMETopicRouterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_registeredTopics, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __38__HMETopicRouter_dumpStateDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t\t\t[(AC) uuid = %@]\n"), a2);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t\t\t\t[(AS) keyPath = %@]\n"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

+ (id)forwardingTopicsForAdditions:(id)a3 removals:(id)a4 current:(id)a5 indexProvider:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  v13 = (void *)MEMORY[0x1A1AC220C]();
  v14 = (void *)objc_msgSend(v11, "mutableCopy");
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v14, "addObjectsFromArray:", v10);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minusSet:", v16);

  objc_msgSend(v15, "addObjectsFromArray:", v9);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minusSet:", v17);

  v12[2](v12, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  v12[2](v12, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  v22 = (void *)objc_msgSend(v19, "mutableCopy");
  objc_msgSend(v22, "minusSet:", v21);
  objc_msgSend(v21, "minusSet:", v19);
  v25[0] = v22;
  v25[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v13);
  return v23;
}

@end
