@implementation CATArbitrator

- (CATArbitrator)init
{
  CATArbitrator *v2;
  uint64_t v3;
  NSMutableDictionary *mRegistrationByKey;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CATArbitrator;
  v2 = -[CATArbitrator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mRegistrationByKey = v2->mRegistrationByKey;
    v2->mRegistrationByKey = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)debugDescription
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;

  v3 = self->mRegistrationByKey;
  objc_sync_enter(v3);
  -[NSMutableDictionary debugDescription](self->mRegistrationByKey, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p %@>"), objc_opt_class(), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)resourceForKey:(id)a3 exclusive:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATArbitrator resourcesForKeys:exclusive:](self, "resourcesForKeys:exclusive:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)resourcesForKeys:(id)a3 exclusive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  CATArbitrator *v24;
  id v25;
  void *context;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  CATArbitrator *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    v19 = (void *)MEMORY[0x24BDBD1B8];
    goto LABEL_23;
  }
  v7 = (void *)objc_opt_new();
  context = (void *)MEMORY[0x20BD108A4]();
  v8 = self->mRegistrationByKey;
  objc_sync_enter(v8);
  v24 = self;
  v9 = (void *)-[NSMutableDictionary copy](self->mRegistrationByKey, "copy");
  objc_sync_exit(v8);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = v6;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (!v11)
    goto LABEL_22;
  v12 = *(_QWORD *)v28;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v28 != v12)
        objc_enumerationMutation(v10);
      v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v7, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "makeResourceProxyIfPossible:", v4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v14);

            continue;
          }
          objc_msgSend(v7, "allValues");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "makeObjectsPerformSelector:", sel_invalidate);

          objc_msgSend(v7, "removeAllObjects");
          v7 = v17;
        }
        else
        {
          if (_CATLogGeneral_onceToken != -1)
            dispatch_once(&_CATLogGeneral_onceToken, &__block_literal_global);
          v20 = _CATLogGeneral_logObj;
          if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v32 = v24;
            v33 = 2112;
            v34 = v14;
            _os_log_impl(&dword_209592000, v20, OS_LOG_TYPE_INFO, "%@ is missing entry for %@", buf, 0x16u);
          }
          objc_msgSend(v7, "allValues");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "makeObjectsPerformSelector:", sel_invalidate);

          objc_msgSend(v7, "removeAllObjects");
        }

        v7 = 0;
        goto LABEL_22;
      }
    }
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v11)
      continue;
    break;
  }
LABEL_22:

  objc_autoreleasePoolPop(context);
  v19 = (void *)objc_msgSend(v7, "copy");

  v6 = v25;
LABEL_23:

  return v19;
}

- (id)waitForResourcesForKeys:(id)a3 exclusive:(BOOL)a4 delegateQueue:(id)a5 completionBlock:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  qos_class_t v14;
  _CATArbitratorWaitToken *v15;
  NSMutableDictionary *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  id v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v8 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    v14 = qos_class_self();
    dispatch_get_global_queue(v14, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v12;
  v27 = v13;
  v15 = -[_CATArbitratorWaitToken initWithDelegateQueue:completionBlock:]([_CATArbitratorWaitToken alloc], "initWithDelegateQueue:completionBlock:", v13, v12);
  if (objc_msgSend(v10, "count"))
  {
    v16 = self->mRegistrationByKey;
    objc_sync_enter(v16);
    v17 = (void *)-[NSMutableDictionary copy](self->mRegistrationByKey, "copy");
    objc_sync_exit(v16);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = v10;
    v18 = v10;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            -[_CATArbitratorWaitToken waitForRegistrationEntry:forKey:exclusive:](v15, "waitForRegistrationEntry:forKey:exclusive:", v23, v22, v8);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v19);
    }

    v10 = v25;
  }
  -[_CATArbitratorWaitToken resume](v15, "resume");

  return v15;
}

- (void)stopWaiting:(id)a3
{
  objc_msgSend(a3, "cancel");
}

- (void)registerResource:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[CATArbitrator registerResource:forKey:maxConcurrentCount:](self, "registerResource:forKey:maxConcurrentCount:", v10, v7, 1);

}

- (void)registerResource:(id)a3 forKey:(id)a4 maxConcurrentCount:(unint64_t)a5
{
  id v9;
  _CATArbitratorRegistrationEntry *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v9 = a4;
  if (v19)
  {
    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    if (a5)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

  if (!v9)
    goto LABEL_8;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 240, CFSTR("%@ cannot call %@ with maxConcurrentCount == 0"), self, v16);

LABEL_4:
  v10 = -[_CATArbitratorRegistrationEntry initWithResource:maxConcurrentCount:]([_CATArbitratorRegistrationEntry alloc], "initWithResource:maxConcurrentCount:", v19, a5);
  v11 = self->mRegistrationByKey;
  objc_sync_enter(v11);
  -[NSMutableDictionary objectForKeyedSubscript:](self->mRegistrationByKey, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 245, CFSTR("%@ cannot call %@ when key (%@) is already registered"), self, v18, v9);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mRegistrationByKey, "setObject:forKeyedSubscript:", v10, v9);
  objc_sync_exit(v11);

}

- (unint64_t)unregisterResourceForKey:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = self->mRegistrationByKey;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->mRegistrationByKey, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->mRegistrationByKey, "removeObjectForKey:", v4);
    v7 = objc_msgSend(v6, "currentCount");
  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v5);

  objc_msgSend(v6, "invalidate");
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRegistrationByKey, 0);
}

@end
