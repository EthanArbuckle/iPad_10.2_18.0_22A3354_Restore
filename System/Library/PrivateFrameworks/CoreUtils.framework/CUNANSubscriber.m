@implementation CUNANSubscriber

- (CUNANSubscriber)init
{
  CUNANSubscriber *v2;
  CUNANSubscriber *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUNANSubscriber;
  v2 = -[CUNANSubscriber init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUNANSubscriber;
    pthread_mutex_init(&v2->_mutex, 0);
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  NSString *v3;
  NSString *v4;
  LogCategory *ucat;
  objc_super v6;

  v3 = self->_mockID;
  v4 = v3;
  if (v3)
    CUNANMockRemoveSubscriber(v3, self);
  pthread_mutex_destroy(&self->_mutex);
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CUNANSubscriber;
  -[CUNANSubscriber dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[CUNANSubscriber descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t changeFlags;
  id *v17;
  id *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id *v32;
  NSMutableDictionary *wfaEndpoints;
  id v34;
  uint64_t v36;
  _QWORD v37[5];
  int v38;
  id v39;
  id v40;
  id v41;
  id obj;
  uint64_t v43;
  id *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v43 = 0;
  v44 = (id *)&v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__5171;
  v47 = __Block_byref_object_dispose__5172;
  v48 = 0;
  obj = 0;
  NSAppendPrintF((CFMutableStringRef *)&obj, (uint64_t)"CUNANSubscriber %@", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_serviceType);
  objc_storeStrong(&v48, obj);
  changeFlags = self->_changeFlags;
  if ((_DWORD)changeFlags)
  {
    v17 = v44;
    v41 = v44[5];
    NSAppendPrintF((CFMutableStringRef *)&v41, (uint64_t)", CF %{flags}", v10, v11, v12, v13, v14, v15, changeFlags);
    objc_storeStrong(v17 + 5, v41);
  }
  v18 = v44;
  v40 = v44[5];
  v19 = -[NSMutableDictionary count](self->_wfaEndpoints, "count");
  NSAppendPrintF((CFMutableStringRef *)&v40, (uint64_t)", %d endpoints(s)", v20, v21, v22, v23, v24, v25, v19);
  objc_storeStrong(v18 + 5, v40);
  if (a3 <= 20)
  {
    v32 = v44;
    v39 = v44[5];
    NSAppendPrintF((CFMutableStringRef *)&v39, (uint64_t)"\n", v26, v27, v28, v29, v30, v31, v36);
    objc_storeStrong(v32 + 5, v39);
    wfaEndpoints = self->_wfaEndpoints;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __40__CUNANSubscriber_descriptionWithLevel___block_invoke;
    v37[3] = &unk_1E25DCE48;
    v38 = a3;
    v37[4] = &v43;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](wfaEndpoints, "enumerateKeysAndObjectsUsingBlock:", v37);
  }
  v34 = v44[5];
  _Block_object_dispose(&v43, 8);

  return v34;
}

- (NSArray)discoveredEndpoints
{
  _opaque_pthread_mutex_t *p_mutex;
  NSMutableDictionary *wfaEndpoints;
  void *v5;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  wfaEndpoints = self->_wfaEndpoints;
  if (wfaEndpoints)
  {
    -[NSMutableDictionary allValues](wfaEndpoints, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  pthread_mutex_unlock(p_mutex);
  return (NSArray *)v5;
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE067478;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CUNANSubscriber_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_activateWithCompletion:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  LogCategory *ucat;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  NSString *v17;
  CUNANSubscriber *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void (*v29)(void);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  LogCategory *v34;
  void *v35;
  void *v36;
  WiFiAwareSubscriber *v37;
  WiFiAwareSubscriber *wfaSubscriber;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  WiFiAwareSubscriber *v45;
  void *v46;
  id activateCompletion;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  LogCategory *v53;
  uint64_t v54;
  _QWORD *aBlock;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  aBlock = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANSubscriber _activateWithCompletion:]", 0x1Eu, (uint64_t)"Activate '%@', %#{flags}\n", v4, v5, v6, v7, (uint64_t)self->_serviceType);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v9 = self->_serviceType;
  if (-[NSString length](v9, "length"))
  {
    v16 = self->_mockID;
    if (v16)
    {
      v17 = v16;
      v18 = self;
      os_unfair_lock_lock((os_unfair_lock_t)&gCUNANMockLock);
      objc_msgSend((id)gCUNANMockSubscribers, "objectForKeyedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
        v20 = (void *)gCUNANMockSubscribers;
        if (!gCUNANMockSubscribers)
        {
          v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v22 = (void *)gCUNANMockSubscribers;
          gCUNANMockSubscribers = (uint64_t)v21;

          v20 = (void *)gCUNANMockSubscribers;
        }
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v17);
      }
      objc_msgSend(v19, "addObject:", v18);
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      objc_msgSend((id)gCUNANMockPublishers, "objectForKeyedSubscript:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v57 != v26)
              objc_enumerationMutation(v23);
            objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "mockEndpoint");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
              -[CUNANSubscriber reportMockEndpointFound:](v18, "reportMockEndpointFound:", v28);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        }
        while (v25);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&gCUNANMockLock);
      if (aBlock)
      {
        v29 = (void (*)(void))aBlock[2];
LABEL_35:
        v29();
        goto LABEL_41;
      }
      goto LABEL_41;
    }
    v35 = (void *)objc_msgSend(objc_alloc((Class)getWiFiAwareSubscribeConfigurationClass[0]()), "initWithServiceName:", v9);
    v36 = v35;
    if ((self->_controlFlags & 1) != 0)
      objc_msgSend(v35, "setAuthenticationType:", 0);
    v37 = (WiFiAwareSubscriber *)objc_msgSend(objc_alloc((Class)getWiFiAwareSubscriberClass[0]()), "initWithConfiguration:", v36);
    wfaSubscriber = self->_wfaSubscriber;
    self->_wfaSubscriber = v37;

    v45 = self->_wfaSubscriber;
    if (v45)
    {
      -[WiFiAwareSubscriber setDelegate:](v45, "setDelegate:", self);
      v46 = _Block_copy(aBlock);
      activateCompletion = self->_activateCompletion;
      self->_activateCompletion = v46;

      -[WiFiAwareSubscriber start](self->_wfaSubscriber, "start");
LABEL_40:

      v17 = 0;
      goto LABEL_41;
    }
    NSErrorWithOSStatusF(4294960596, (uint64_t)"Create WFASubscriber failed", v39, v40, v41, v42, v43, v44, v54);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = self->_ucat;
    if (v53->var0 <= 90)
    {
      if (v53->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v53, 0x5Au))
          goto LABEL_37;
        v53 = self->_ucat;
      }
      LogPrintF((uint64_t)v53, (uint64_t)"-[CUNANSubscriber _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v48, v49, v50, v51, (uint64_t)v52);
    }
LABEL_37:
    if (aBlock)
      ((void (*)(void))aBlock[2])();

    goto LABEL_40;
  }
  NSErrorWithOSStatusF(4294960591, (uint64_t)"No service name", v10, v11, v12, v13, v14, v15, v54);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  v34 = self->_ucat;
  if (v34->var0 <= 90)
  {
    if (v34->var0 != -1)
    {
LABEL_24:
      LogPrintF((uint64_t)v34, (uint64_t)"-[CUNANSubscriber _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v30, v31, v32, v33, (uint64_t)v17);
      goto LABEL_33;
    }
    if (_LogCategory_Initialize((uint64_t)v34, 0x5Au))
    {
      v34 = self->_ucat;
      goto LABEL_24;
    }
  }
LABEL_33:
  if (aBlock)
  {
    v29 = (void (*)(void))aBlock[2];
    goto LABEL_35;
  }
LABEL_41:

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CUNANSubscriber_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  LogCategory *v12;
  uint64_t v13;
  NSString *v14;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_6;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
LABEL_6:
        v14 = self->_mockID;
        if (v14)
          CUNANMockRemoveSubscriber(v14, self);
        if (self->_startedCalled)
        {
          -[WiFiAwareSubscriber stop](self->_wfaSubscriber, "stop");
        }
        else
        {
          v12 = self->_ucat;
          if (v12->var0 <= 30)
          {
            if (v12->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v12, 0x1Eu))
                goto LABEL_14;
              v12 = self->_ucat;
            }
            LogPrintF((uint64_t)v12, (uint64_t)"-[CUNANSubscriber _invalidate]", 0x1Eu, (uint64_t)"Deferring stop until start completes", v8, v9, v10, v11, v13);
          }
        }
LABEL_14:
        -[CUNANSubscriber _invalidated](self, "_invalidated");

        return;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANSubscriber _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v13);
    goto LABEL_6;
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id endpointFoundHandler;
  id endpointLostHandler;
  id endpointChangedHandler;
  id interruptionHandler;
  id v8;
  id receiveHandler;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  LogCategory *ucat;
  uint64_t v15;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_wfaSubscriber)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    endpointFoundHandler = self->_endpointFoundHandler;
    self->_endpointFoundHandler = 0;

    endpointLostHandler = self->_endpointLostHandler;
    self->_endpointLostHandler = 0;

    endpointChangedHandler = self->_endpointChangedHandler;
    self->_endpointChangedHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    receiveHandler = self->_receiveHandler;
    self->_receiveHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_8:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANSubscriber _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v10, v11, v12, v13, v15);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_8;
      }
    }
  }
}

- (void)_lostAllEndpoints
{
  NSMutableDictionary *wfaEndpoints;
  _QWORD v4[5];

  if (self->_endpointLostHandler)
  {
    wfaEndpoints = self->_wfaEndpoints;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __36__CUNANSubscriber__lostAllEndpoints__block_invoke;
    v4[3] = &unk_1E25DCE70;
    v4[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](wfaEndpoints, "enumerateKeysAndObjectsUsingBlock:", v4);
  }
  pthread_mutex_lock(&self->_mutex);
  -[NSMutableDictionary removeAllObjects](self->_wfaEndpoints, "removeAllObjects");
  pthread_mutex_unlock(&self->_mutex);
}

- (void)reportMockEndpointFound:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CUNANSubscriber_reportMockEndpointFound___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)reportMockEndpointLost:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CUNANSubscriber_reportMockEndpointLost___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)sendMessageData:(id)a3 endpoint:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke;
  v15[3] = &unk_1E25DE2C8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(dispatchQueue, v15);

}

- (void)subscriberStarted:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CUNANSubscriber_subscriberStarted___block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];

  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__CUNANSubscriber_subscriber_failedToStartWithError___block_invoke;
  v5[3] = &unk_1E25DD170;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];

  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__CUNANSubscriber_subscriber_terminatedWithReason___block_invoke;
  v5[3] = &unk_1E25DD170;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CUNANSubscriber_subscriber_receivedDiscoveryResult___block_invoke;
  block[3] = &unk_1E25DCEE8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v6;
  LogCategory *ucat;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CUNANEndpoint *v22;
  CUNANEndpoint *v23;
  unsigned int v24;
  unsigned int changeFlags;
  uint64_t v26;
  LogCategory *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  LogCategory *v33;
  NSMutableDictionary *wfaEndpoints;
  NSMutableDictionary *v35;
  NSMutableDictionary *v36;
  LogCategory *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (**endpointChangedHandler)(id, CUNANEndpoint *, _QWORD);
  void (**endpointFoundHandler)(id, CUNANEndpoint *);
  uint64_t v45;
  void *v46;
  id v47;

  v47 = a3;
  v6 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      objc_msgSend(v6, "publisherAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "publishID");
      objc_msgSend(v6, "serviceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serviceSpecificInfo");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANSubscriber _subscriber:receivedDiscoveryResult:]", 9u, (uint64_t)"WFA discovery result: PA <%@>, PI %u, SV '%@', SI <%@>\n", v11, v12, v13, v14, (uint64_t)v9);

      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v6, "publisherAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publishID");
  _WiFiAwareCreateEndpointIdentifier(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_wfaEndpoints, "objectForKeyedSubscript:", v17);
    v22 = (CUNANEndpoint *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = v22;
      v24 = -[CUNANEndpoint updateWithDiscoveryResult:](v22, "updateWithDiscoveryResult:", v6);
      changeFlags = self->_changeFlags;
      v26 = (v24 | 4) & changeFlags;
      if (((v24 | 4) & changeFlags) == 0)
      {
LABEL_27:

        goto LABEL_28;
      }
      v27 = self->_ucat;
      if (v27->var0 <= 10)
      {
        if (v27->var0 != -1)
        {
LABEL_10:
          CUDescriptionWithLevel(v23, 50);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF((uint64_t)v27, (uint64_t)"-[CUNANSubscriber _subscriber:receivedDiscoveryResult:]", 0xAu, (uint64_t)"Endpoint changed: %@, %#{flags}\n", v29, v30, v31, v32, (uint64_t)v28);

          goto LABEL_22;
        }
        if (_LogCategory_Initialize((uint64_t)self->_ucat, 0xAu))
        {
          v27 = self->_ucat;
          goto LABEL_10;
        }
      }
LABEL_22:
      endpointChangedHandler = (void (**)(id, CUNANEndpoint *, _QWORD))self->_endpointChangedHandler;
      if (endpointChangedHandler)
        endpointChangedHandler[2](endpointChangedHandler, v23, v26);
      goto LABEL_27;
    }
    v23 = objc_alloc_init(CUNANEndpoint);
    -[CUNANEndpoint setIdentifier:](v23, "setIdentifier:", v17);
    -[CUNANEndpoint updateWithDiscoveryResult:](v23, "updateWithDiscoveryResult:", v6);
    pthread_mutex_lock(&self->_mutex);
    wfaEndpoints = self->_wfaEndpoints;
    if (!wfaEndpoints)
    {
      v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v36 = self->_wfaEndpoints;
      self->_wfaEndpoints = v35;

      wfaEndpoints = self->_wfaEndpoints;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](wfaEndpoints, "setObject:forKeyedSubscript:", v23, v17);
    pthread_mutex_unlock(&self->_mutex);
    v37 = self->_ucat;
    if (v37->var0 <= 10)
    {
      if (v37->var0 != -1)
      {
LABEL_18:
        CUDescriptionWithLevel(v23, 50);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)v37, (uint64_t)"-[CUNANSubscriber _subscriber:receivedDiscoveryResult:]", 0xAu, (uint64_t)"Endpoint found: %@\n", v39, v40, v41, v42, (uint64_t)v38);

        goto LABEL_25;
      }
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0xAu))
      {
        v37 = self->_ucat;
        goto LABEL_18;
      }
    }
LABEL_25:
    endpointFoundHandler = (void (**)(id, CUNANEndpoint *))self->_endpointFoundHandler;
    if (endpointFoundHandler)
      endpointFoundHandler[2](endpointFoundHandler, v23);
    goto LABEL_27;
  }
  v33 = self->_ucat;
  if (v33->var0 <= 90)
  {
    if (v33->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v33, 0x5Au))
        goto LABEL_28;
      v33 = self->_ucat;
    }
    LogPrintF((uint64_t)v33, (uint64_t)"-[CUNANSubscriber _subscriber:receivedDiscoveryResult:]", 0x5Au, (uint64_t)"### WFA discovery result missing identifier\n", v18, v19, v20, v21, v45);
  }
LABEL_28:

}

- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned __int8 v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__CUNANSubscriber_subscriber_lostDiscoveryResultForPublishID_address___block_invoke;
  v13[3] = &unk_1E25DE250;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

- (void)_subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  id v7;
  LogCategory *ucat;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  LogCategory *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  LogCategory *v31;
  LogCategory *v32;
  void (**endpointLostHandler)(id, void *);
  uint64_t v34;
  id v35;

  v35 = a3;
  v7 = a5;
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      objc_msgSend(v7, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANSubscriber _subscriber:lostDiscoveryResultForPublishID:address:]", 9u, (uint64_t)"WFA lost result: PA <%@>, PI %u\n", v10, v11, v12, v13, (uint64_t)v9);

      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v7, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _WiFiAwareCreateEndpointIdentifier(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_wfaEndpoints, "objectForKeyedSubscript:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      pthread_mutex_lock(&self->_mutex);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_wfaEndpoints, "setObject:forKeyedSubscript:", 0, v15);
      pthread_mutex_unlock(&self->_mutex);
      v25 = self->_ucat;
      if (v25->var0 > 10)
        goto LABEL_17;
      if (v25->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0xAu))
        {
LABEL_17:
          endpointLostHandler = (void (**)(id, void *))self->_endpointLostHandler;
          if (endpointLostHandler)
            endpointLostHandler[2](endpointLostHandler, v24);
          goto LABEL_19;
        }
        v25 = self->_ucat;
      }
      CUDescriptionWithLevel(v24, 50);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v25, (uint64_t)"-[CUNANSubscriber _subscriber:lostDiscoveryResultForPublishID:address:]", 0xAu, (uint64_t)"Endpoint lost: %@\n", v27, v28, v29, v30, (uint64_t)v26);

      goto LABEL_17;
    }
    v32 = self->_ucat;
    if (v32->var0 <= 30)
    {
      if (v32->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v32, 0x1Eu))
          goto LABEL_19;
        v32 = self->_ucat;
      }
      LogPrintF((uint64_t)v32, (uint64_t)"-[CUNANSubscriber _subscriber:lostDiscoveryResultForPublishID:address:]", 0x1Eu, (uint64_t)"WFA lost result missing not found: %@\n", v20, v21, v22, v23, (uint64_t)v15);
    }
LABEL_19:

    goto LABEL_20;
  }
  v31 = self->_ucat;
  if (v31->var0 <= 90)
  {
    if (v31->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v31, 0x5Au))
        goto LABEL_20;
      v31 = self->_ucat;
    }
    LogPrintF((uint64_t)v31, (uint64_t)"-[CUNANSubscriber _subscriber:lostDiscoveryResultForPublishID:address:]", 0x5Au, (uint64_t)"### WFA lost result missing identifier\n", v16, v17, v18, v19, v34);
  }
LABEL_20:

}

- (void)subscriber:(id)a3 receivedMessage:(id)a4 fromPublishID:(unsigned __int8)a5 address:(id)a6
{
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unsigned __int8 v17;

  v9 = a4;
  v10 = a6;
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__CUNANSubscriber_subscriber_receivedMessage_fromPublishID_address___block_invoke;
  v14[3] = &unk_1E25DE250;
  v14[4] = self;
  v15 = v10;
  v17 = a5;
  v16 = v9;
  v12 = v9;
  v13 = v10;
  dispatch_async(dispatchQueue, v14);

}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)label
{
  return self->_label;
}

- (NSString)mockID
{
  return self->_mockID;
}

- (void)setMockID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)endpointFoundHandler
{
  return self->_endpointFoundHandler;
}

- (void)setEndpointFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)endpointLostHandler
{
  return self->_endpointLostHandler;
}

- (void)setEndpointLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)endpointChangedHandler
{
  return self->_endpointChangedHandler;
}

- (void)setEndpointChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)receiveHandler
{
  return self->_receiveHandler;
}

- (void)setReceiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiveHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_endpointChangedHandler, 0);
  objc_storeStrong(&self->_endpointLostHandler, 0);
  objc_storeStrong(&self->_endpointFoundHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_mockID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wfaSubscriber, 0);
  objc_storeStrong((id *)&self->_wfaEndpoints, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

void __68__CUNANSubscriber_subscriber_receivedMessage_fromPublishID_address___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  CUNANEndpoint *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  void (**v12)(id, _QWORD, CUNANEndpoint *);

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    v3 = _Block_copy(*(const void **)(v1 + 200));
    if (!v3)
    {
LABEL_8:

      return;
    }
    v12 = (void (**)(id, _QWORD, CUNANEndpoint *))v3;
    v4 = objc_alloc_init(CUNANEndpoint);
    objc_msgSend(*(id *)(a1 + 40), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WiFiAwareCreateEndpointIdentifier(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUNANEndpoint setIdentifier:](v4, "setIdentifier:", v6);

    -[CUNANEndpoint setInstanceID:](v4, "setInstanceID:", *(unsigned __int8 *)(a1 + 56));
    -[CUNANEndpoint setMacAddress:](v4, "setMacAddress:", *(_QWORD *)(a1 + 40));
    v11 = *(int **)(*(_QWORD *)(a1 + 32) + 96);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v11, 0x1Eu))
          goto LABEL_7;
        v11 = *(int **)(*(_QWORD *)(a1 + 32) + 96);
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUNANSubscriber subscriber:receivedMessage:fromPublishID:address:]_block_invoke", 0x1Eu, (uint64_t)"Received message: EP %@, Data %@", v7, v8, v9, v10, (uint64_t)v4);
    }
LABEL_7:
    v12[2](v12, *(_QWORD *)(a1 + 48), v4);

    v3 = v12;
    goto LABEL_8;
  }
}

_QWORD *__70__CUNANSubscriber_subscriber_lostDiscoveryResultForPublishID_address___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[14])
    return (_QWORD *)objc_msgSend(result, "_subscriber:lostDiscoveryResultForPublishID:address:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  return result;
}

_QWORD *__54__CUNANSubscriber_subscriber_receivedDiscoveryResult___block_invoke(_QWORD *a1)
{
  _QWORD *result;

  result = (_QWORD *)a1[4];
  if (result[14])
    return (_QWORD *)objc_msgSend(result, "_subscriber:receivedDiscoveryResult:", a1[5], a1[6]);
  return result;
}

void __51__CUNANSubscriber_subscriber_terminatedWithReason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BYTE *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  _BOOL4 v32;
  uint64_t v33;
  void (**v34)(id, _QWORD);

  v8 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v8 + 112))
  {
    v10 = *(int **)(v8 + 96);
    if (*v10 > 30)
      goto LABEL_8;
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v8 = *(_QWORD *)(a1 + 32);
      if (!v11)
      {
LABEL_8:
        v34 = (void (**)(id, _QWORD))_Block_copy(*(const void **)(v8 + 8));
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 8);
        *(_QWORD *)(v12 + 8) = 0;

        v20 = *(_QWORD *)(a1 + 40);
        if (v34)
        {
          if (v20 == 2)
          {
            v34[2](v34, 0);
LABEL_15:
            v23 = *(_QWORD *)(a1 + 32);
            v24 = *(void **)(v23 + 112);
            *(_QWORD *)(v23 + 112) = 0;

            objc_msgSend(*(id *)(a1 + 32), "_invalidated");
LABEL_16:

            return;
          }
          NSErrorWithOSStatusF(4294960596, (uint64_t)"Unexpected terminate", v14, v15, v16, v17, v18, v19, v33);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *))v34)[2](v34, v21);

        }
        else if (v20 == 2)
        {
          goto LABEL_15;
        }
        v22 = *(_BYTE **)(a1 + 32);
        if (v22[16])
          goto LABEL_15;
        objc_msgSend(v22, "_lostAllEndpoints");
        v29 = *(_QWORD *)(a1 + 32);
        v30 = *(_QWORD *)(v29 + 184);
        if (v30)
        {
          (*(void (**)(void))(v30 + 16))();
          v29 = *(_QWORD *)(a1 + 32);
        }
        v31 = *(int **)(v29 + 96);
        if (*v31 <= 30)
        {
          if (*v31 == -1)
          {
            v32 = _LogCategory_Initialize((uint64_t)v31, 0x1Eu);
            v29 = *(_QWORD *)(a1 + 32);
            if (!v32)
              goto LABEL_23;
            v31 = *(int **)(v29 + 96);
          }
          LogPrintF((uint64_t)v31, (uint64_t)"-[CUNANSubscriber subscriber:terminatedWithReason:]_block_invoke", 0x1Eu, (uint64_t)"WFASubscriber restarting after unexpected termination\n", v25, v26, v27, v28, v33);
          v29 = *(_QWORD *)(a1 + 32);
        }
LABEL_23:
        objc_msgSend(*(id *)(v29 + 112), "start");
        goto LABEL_16;
      }
      v10 = *(int **)(v8 + 96);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANSubscriber subscriber:terminatedWithReason:]_block_invoke", 0x1Eu, (uint64_t)"WFASubscriber terminated: '%@', %s\n", a5, a6, a7, a8, *(_QWORD *)(v8 + 152));
    v8 = *(_QWORD *)(a1 + 32);
    goto LABEL_8;
  }
}

void __53__CUNANSubscriber_subscriber_failedToStartWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  int *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int *v23;
  _BOOL4 v24;
  uint64_t v25;
  void (**v26)(id, void *);

  v8 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v8 + 112))
  {
    v10 = (*(_DWORD *)(a1 + 40) + 312300);
    v11 = *(int **)(v8 + 96);
    if (*v11 > 90)
      goto LABEL_7;
    if (*v11 == -1)
    {
      v12 = _LogCategory_Initialize((uint64_t)v11, 0x5Au);
      v8 = *(_QWORD *)(a1 + 32);
      if (!v12)
      {
LABEL_7:
        *(_BYTE *)(v8 + 88) = 1;
        v26 = (void (**)(id, void *))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 8));
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(void **)(v13 + 8);
        *(_QWORD *)(v13 + 8) = 0;

        if (v26)
        {
          NSErrorWithOSStatusF(v10, (uint64_t)"Subscriber start failed", v15, v16, v17, v18, v19, v20, v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v26[2](v26, v21);

        }
        v22 = *(_QWORD *)(a1 + 32);
        if (!*(_BYTE *)(v22 + 16))
          goto LABEL_15;
        v23 = *(int **)(v22 + 96);
        if (*v23 <= 30)
        {
          if (*v23 == -1)
          {
            v24 = _LogCategory_Initialize((uint64_t)v23, 0x1Eu);
            v22 = *(_QWORD *)(a1 + 32);
            if (!v24)
              goto LABEL_14;
            v23 = *(int **)(v22 + 96);
          }
          LogPrintF((uint64_t)v23, (uint64_t)"-[CUNANSubscriber subscriber:failedToStartWithError:]_block_invoke", 0x1Eu, (uint64_t)"WFASubscriber stop after start completed", v17, v18, v19, v20, v25);
          v22 = *(_QWORD *)(a1 + 32);
        }
LABEL_14:
        objc_msgSend(*(id *)(v22 + 112), "stop");
LABEL_15:

        return;
      }
      v11 = *(int **)(v8 + 96);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUNANSubscriber subscriber:failedToStartWithError:]_block_invoke", 0x5Au, (uint64_t)"### WFASubscriber start failed: '%@', %#m\n", a5, a6, a7, a8, *(_QWORD *)(v8 + 152));
    v8 = *(_QWORD *)(a1 + 32);
    goto LABEL_7;
  }
}

void __37__CUNANSubscriber_subscriberStarted___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int *v20;
  _BOOL4 v21;
  uint64_t v22;
  id v23;

  v8 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v8 + 112))
  {
    v10 = *(int **)(v8 + 96);
    if (*v10 > 30)
      goto LABEL_7;
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v8 = *(_QWORD *)(a1 + 32);
      if (!v11)
      {
LABEL_7:
        *(_BYTE *)(v8 + 88) = 1;
        v23 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 8));
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 8);
        *(_QWORD *)(v12 + 8) = 0;

        v18 = v23;
        if (v23)
        {
          (*((void (**)(id, _QWORD))v23 + 2))(v23, 0);
          v18 = v23;
        }
        v19 = *(_QWORD *)(a1 + 32);
        if (!*(_BYTE *)(v19 + 16))
          goto LABEL_15;
        v20 = *(int **)(v19 + 96);
        if (*v20 <= 30)
        {
          if (*v20 == -1)
          {
            v21 = _LogCategory_Initialize((uint64_t)v20, 0x1Eu);
            v19 = *(_QWORD *)(a1 + 32);
            if (!v21)
              goto LABEL_14;
            v20 = *(int **)(v19 + 96);
          }
          LogPrintF((uint64_t)v20, (uint64_t)"-[CUNANSubscriber subscriberStarted:]_block_invoke", 0x1Eu, (uint64_t)"WFASubscriber stop after start completed", v14, v15, v16, v17, v22);
          v19 = *(_QWORD *)(a1 + 32);
        }
LABEL_14:
        objc_msgSend(*(id *)(v19 + 112), "stop");
        v18 = v23;
LABEL_15:

        return;
      }
      v10 = *(int **)(v8 + 96);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANSubscriber subscriberStarted:]_block_invoke", 0x1Eu, (uint64_t)"WFASubscriber started: '%@'\n", a5, a6, a7, a8, *(_QWORD *)(v8 + 152));
    v8 = *(_QWORD *)(a1 + 32);
    goto LABEL_7;
  }
}

void __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD aBlock[5];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__5171;
  v39 = __Block_byref_object_dispose__5172;
  v40 = 0;
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E25DE160;
  v3 = *(_QWORD *)(a1 + 32);
  v34 = &v35;
  aBlock[4] = v3;
  v33 = *(id *)(a1 + 56);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  if (!v10)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960551, (uint64_t)"Subscriber not activated", v5, v6, v7, v8, v9, v27);
    v24 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v36[5];
    v36[5] = v24;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "discoveryResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "publishID");
    objc_msgSend(v12, "publisherAddress");
  }
  else
  {
    v13 = objc_msgSend(*(id *)(a1 + 40), "instanceID");
    objc_msgSend(*(id *)(a1 + 40), "macAddress");
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No peer address", v14, v15, v16, v17, v18, v27);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v36[5];
    v36[5] = v25;

    goto LABEL_11;
  }
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(int **)(v20 + 96);
  if (*v21 <= 30)
  {
    if (*v21 == -1)
    {
      v22 = _LogCategory_Initialize((uint64_t)v21, 0x1Eu);
      v20 = *(_QWORD *)(a1 + 32);
      if (!v22)
        goto LABEL_10;
      v21 = *(int **)(v20 + 96);
    }
    LogPrintF((uint64_t)v21, (uint64_t)"-[CUNANSubscriber sendMessageData:endpoint:completionHandler:]_block_invoke", 0x1Eu, (uint64_t)"SendMessage start: EP %@, Data %.12@", v15, v16, v17, v18, *(_QWORD *)(a1 + 40));
    v20 = *(_QWORD *)(a1 + 32);
  }
LABEL_10:
  v28[0] = v2;
  v28[1] = 3221225472;
  v28[2] = __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_3;
  v28[3] = &unk_1E25DCEC0;
  v28[4] = v20;
  v23 = *(_QWORD *)(a1 + 48);
  v29 = *(id *)(a1 + 40);
  v30 = *(id *)(a1 + 48);
  v31 = *(id *)(a1 + 56);
  objc_msgSend(v10, "sendMessage:toPeerAddress:withInstanceID:completionHandler:", v23, v19, v13, v28);

LABEL_11:
LABEL_12:

  v4[2](v4);
  _Block_object_dispose(&v35, 8);

}

uint64_t __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  int *v10;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40);
  if (v8)
  {
    v9 = (_QWORD *)result;
    v10 = *(int **)(*(_QWORD *)(result + 32) + 96);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au))
          return (*(uint64_t (**)(void))(v9[5] + 16))();
        v10 = *(int **)(v9[4] + 96);
        v8 = *(_QWORD *)(*(_QWORD *)(v9[6] + 8) + 40);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANSubscriber sendMessageData:endpoint:completionHandler:]_block_invoke_2", 0x5Au, (uint64_t)"### SendMessage failed: %{error}", a5, a6, a7, a8, v8);
    }
    return (*(uint64_t (**)(void))(v9[5] + 16))();
  }
  return result;
}

void __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_4;
  block[3] = &unk_1E25DCE98;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 128);
  block[1] = 3221225472;
  v10 = a2;
  block[4] = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  dispatch_async(v5, block);

}

void __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  int *v16;
  uint64_t v17;
  id v18;

  v9 = a1[8];
  if (v9)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], (v9 + 312300), (uint64_t)"SendMessage failed", a4, a5, a6, a7, a8, v17);
    v10 = objc_claimAutoreleasedReturnValue();
    v15 = *(int **)(a1[4] + 96);
    v18 = (id)v10;
    if (*v15 <= 90)
    {
      if (*v15 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v15, 0x5Au))
          goto LABEL_9;
        v15 = *(int **)(a1[4] + 96);
      }
      LogPrintF((uint64_t)v15, (uint64_t)"-[CUNANSubscriber sendMessageData:endpoint:completionHandler:]_block_invoke_4", 0x5Au, (uint64_t)"### SendMessage failed: EP %@, Data %.12@, %{error}", v11, v12, v13, v14, a1[5]);
    }
LABEL_9:
    (*(void (**)(void))(a1[7] + 16))();

    return;
  }
  v16 = *(int **)(a1[4] + 96);
  if (*v16 <= 30)
  {
    if (*v16 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v16, 0x1Eu))
        goto LABEL_11;
      v16 = *(int **)(a1[4] + 96);
    }
    LogPrintF((uint64_t)v16, (uint64_t)"-[CUNANSubscriber sendMessageData:endpoint:completionHandler:]_block_invoke_4", 0x1Eu, (uint64_t)"SendMessage completed: EP %@, Data %.12@", a5, a6, a7, a8, a1[5]);
  }
LABEL_11:
  (*(void (**)(void))(a1[7] + 16))();
}

uint64_t __42__CUNANSubscriber_reportMockEndpointLost___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    v2 = result;
    v3 = *(int **)(v1 + 96);
    if (*v3 > 30)
      goto LABEL_7;
    if (*v3 == -1)
    {
      v9 = _LogCategory_Initialize(*(_QWORD *)(v1 + 96), 0x1Eu);
      v1 = *(_QWORD *)(v2 + 32);
      if (!v9)
      {
LABEL_7:
        result = *(_QWORD *)(v1 + 168);
        if (result)
          return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(v2 + 40));
        return result;
      }
      v3 = *(int **)(v1 + 96);
    }
    CUDescriptionWithLevel(*(void **)(v2 + 40), 50);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUNANSubscriber reportMockEndpointLost:]_block_invoke", 0x1Eu, (uint64_t)"Mock Endpoint Lost: %@", v5, v6, v7, v8, (uint64_t)v4);

    v1 = *(_QWORD *)(v2 + 32);
    goto LABEL_7;
  }
  return result;
}

uint64_t __43__CUNANSubscriber_reportMockEndpointFound___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    v2 = result;
    v3 = *(int **)(v1 + 96);
    if (*v3 > 30)
      goto LABEL_7;
    if (*v3 == -1)
    {
      v9 = _LogCategory_Initialize(*(_QWORD *)(v1 + 96), 0x1Eu);
      v1 = *(_QWORD *)(v2 + 32);
      if (!v9)
      {
LABEL_7:
        result = *(_QWORD *)(v1 + 160);
        if (result)
          return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(v2 + 40));
        return result;
      }
      v3 = *(int **)(v1 + 96);
    }
    CUDescriptionWithLevel(*(void **)(v2 + 40), 50);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUNANSubscriber reportMockEndpointFound:]_block_invoke", 0x1Eu, (uint64_t)"Mock Endpoint found: %@", v5, v6, v7, v8, (uint64_t)v4);

    v1 = *(_QWORD *)(v2 + 32);
    goto LABEL_7;
  }
  return result;
}

void __36__CUNANSubscriber__lostAllEndpoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  int *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(int **)(v6 + 96);
  if (*v7 <= 10)
  {
    if (*v7 == -1)
    {
      v13 = _LogCategory_Initialize(*(_QWORD *)(v6 + 96), 0xAu);
      v6 = *(_QWORD *)(a1 + 32);
      if (!v13)
        goto LABEL_5;
      v7 = *(int **)(v6 + 96);
    }
    CUDescriptionWithLevel(v5, 50);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v7, (uint64_t)"-[CUNANSubscriber _lostAllEndpoints]_block_invoke", 0xAu, (uint64_t)"Endpoint lost: %@\n", v9, v10, v11, v12, (uint64_t)v8);

    v6 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  (*(void (**)(void))(*(_QWORD *)(v6 + 168) + 16))();

}

uint64_t __29__CUNANSubscriber_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __42__CUNANSubscriber_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __40__CUNANSubscriber_descriptionWithLevel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id obj;

  if (*(int *)(a1 + 40) >= 11)
    v3 = 50;
  else
    v3 = 30;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v4 + 40);
  CUDescriptionWithLevel(a3, v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF((CFMutableStringRef *)&obj, (uint64_t)"    %@\n", v5, v6, v7, v8, v9, v10, (uint64_t)v11);
  objc_storeStrong((id *)(v4 + 40), obj);

}

@end
