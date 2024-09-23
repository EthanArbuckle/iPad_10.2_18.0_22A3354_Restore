@implementation IDSDaemonRequestTimer

- (void)_accessRequestContextMapInCriticalSectionWithBlock:(id)a3
{
  _opaque_pthread_mutex_t *p_requestContextMapLock;
  void (**v4)(_QWORD);

  p_requestContextMapLock = &self->_requestContextMapLock;
  v4 = (void (**)(_QWORD))a3;
  pthread_mutex_lock(p_requestContextMapLock);
  v4[2](v4);

  pthread_mutex_unlock(p_requestContextMapLock);
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_requestContextMapLock);
  v3.receiver = self;
  v3.super_class = (Class)IDSDaemonRequestTimer;
  -[IDSDaemonRequestTimer dealloc](&v3, sel_dealloc);
}

- (IDSDaemonRequestTimer)init
{
  IDSDaemonRequestTimer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *requestContextMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IDSDaemonRequestTimer;
  v2 = -[IDSDaemonRequestTimer init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestContextMap = v2->_requestContextMap;
    v2->_requestContextMap = v3;

    pthread_mutex_init(&v2->_requestContextMapLock, 0);
  }
  return v2;
}

- (int64_t)inFlightRequestCount
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19077D3BC;
  v4[3] = &unk_1E2C60308;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDaemonRequestTimer _accessRequestContextMapInCriticalSectionWithBlock:](self, "_accessRequestContextMapInCriticalSectionWithBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)scheduleTimeoutWithResponseHandler:(id)a3 timeoutInterval:(double)a4 timeoutBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  double v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v8)
  {
    if (a4 > 0.0 && v9 != 0)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = sub_1906EE2B4;
      v23 = sub_1906EE12C;
      v24 = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = sub_19077D528;
      v14[3] = &unk_1E2C63958;
      v14[4] = self;
      v15 = v8;
      v17 = &v19;
      v18 = a4;
      v16 = v10;
      -[IDSDaemonRequestTimer _accessRequestContextMapInCriticalSectionWithBlock:](self, "_accessRequestContextMapInCriticalSectionWithBlock:", v14);
      v11 = (id)v20[5];

      _Block_object_dispose(&v19, 8);
    }
  }

  return v11;
}

- (id)_criticalFindRequestContextWithResponseHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary allValues](self->_requestContextMap, "allValues");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "responseHandler", (_QWORD)v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_handleSystemTimerFired:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19077D804;
  v6[3] = &unk_1E2C607A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[IDSDaemonRequestTimer _accessRequestContextMapInCriticalSectionWithBlock:](self, "_accessRequestContextMapInCriticalSectionWithBlock:", v6);

}

- (void)_criticalInvokeTimeoutBlockForRequestID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestContextMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "responseHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "timeoutBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 1;
    if (!v11)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_19077D904;
      block[3] = &unk_1E2C604E8;
      v13 = v9;
      dispatch_async(v8, block);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_requestContextMap, "removeObjectForKey:", v4);

  }
}

- (id)invalidateTimeoutAndReturnHandlerForRequestID:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1906EE2B4;
  v15 = sub_1906EE12C;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19077D9FC;
  v8[3] = &unk_1E2C60780;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[IDSDaemonRequestTimer _accessRequestContextMapInCriticalSectionWithBlock:](self, "_accessRequestContextMapInCriticalSectionWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)_criticalInvalidateTimeoutAndReturnHandlerForRequestID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestContextMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "killSystemTimer");
    objc_msgSend(v6, "responseHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_requestContextMap, "removeObjectForKey:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)invalidateTimeoutsAndReturnHandlersForAllRequests
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_19077DB54;
  v9[3] = &unk_1E2C60448;
  v9[4] = self;
  v5 = v4;
  v10 = v5;
  v11 = a2;
  -[IDSDaemonRequestTimer _accessRequestContextMapInCriticalSectionWithBlock:](self, "_accessRequestContextMapInCriticalSectionWithBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContextMap, 0);
}

@end
