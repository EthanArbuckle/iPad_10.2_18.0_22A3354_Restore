@implementation COIDSTransport

- (COIDSTransport)initWithDiscoveryRecord:(id)a3 executionContext:(id)a4
{
  id v7;
  id v8;
  COIDSTransport *v9;
  void *v10;
  uint64_t v11;
  OS_nw_activity *activity;
  uint64_t v13;
  COIDSServiceDirector *director;
  uint64_t v15;
  NSMutableSet *registeredCommands;
  uint64_t v17;
  NSMutableDictionary *acceptableResponses;
  uint64_t v19;
  NSMutableDictionary *outstandingRequests;
  dispatch_source_t v21;
  OS_dispatch_source *timer;
  COIDSTransport *v23;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)COIDSTransport;
    v9 = -[COIDSTransport init](&v25, sel_init);
    if (v9)
    {
      objc_msgSend(v8, "networkActivityFactory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activityWithLabel:parentActivity:", 1, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      activity = v9->_activity;
      v9->_activity = (OS_nw_activity *)v11;

      objc_storeStrong((id *)&v9->_record, a3);
      objc_msgSend(v7, "serviceDirector");
      v13 = objc_claimAutoreleasedReturnValue();
      director = v9->_director;
      v9->_director = (COIDSServiceDirector *)v13;

      objc_storeStrong((id *)&v9->_executionContext, a4);
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v15 = objc_claimAutoreleasedReturnValue();
      registeredCommands = v9->_registeredCommands;
      v9->_registeredCommands = (NSMutableSet *)v15;

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v17 = objc_claimAutoreleasedReturnValue();
      acceptableResponses = v9->_acceptableResponses;
      v9->_acceptableResponses = (NSMutableDictionary *)v17;

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v19 = objc_claimAutoreleasedReturnValue();
      outstandingRequests = v9->_outstandingRequests;
      v9->_outstandingRequests = (NSMutableDictionary *)v19;

      v9->_requestTimeout = 180.0;
      v21 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, 0);
      timer = v9->_timer;
      v9->_timer = (OS_dispatch_source *)v21;

      -[COIDSTransport _configureTimer](v9, "_configureTimer");
    }
    self = v9;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  -[COIDSTransport record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "IDSIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, ids = %@>"), v7, self, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;

  -[COIDSTransport record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "IDSIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[COIDSTransport executionContext](self, "executionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "meshControllerDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[m:%@] <%@: %p, ids = %.8s>"), v7, v9, self, objc_msgSend(v10, "UTF8String"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)supportsLeaderElection
{
  return 0;
}

- (void)activateWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(id, _QWORD);

  v13 = (void (**)(id, _QWORD))a3;
  -[COIDSTransport activity](self, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[COIDSTransport activity](self, "activity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    nw_activity_activate();

  }
  v13[2](v13, 0);
  -[COIDSTransport record](self, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onDemandRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "responseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fromURIToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[COIDSTransport handleMessage:requestIdentifier:responseIdentifier:from:](self, "handleMessage:requestIdentifier:responseIdentifier:from:", v9, v10, v11, v12);

  }
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[COIDSTransport record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)invalidateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  xpc_object_t v8;
  uint64_t v9;
  uint64_t activation_time;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COCoreLogForCategory(17);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[COIDSTransport shortDescription](self, "shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidated", (uint8_t *)&v14, 0xCu);

  }
  -[COIDSTransport activity](self, "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && nw_activity_is_activated())
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      v9 = mach_continuous_time();
      activation_time = nw_activity_get_activation_time();
      xpc_dictionary_set_uint64(v8, "lifetime", v9 - activation_time);
      xpc_dictionary_set_uint64(v8, "transport_type", 2uLL);
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  -[COIDSTransport outstandingRequests](self, "outstandingRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_11);

  -[COIDSTransport outstandingRequests](self, "outstandingRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[COIDSTransport delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "transport:didInvalidateWithError:", self, v4);

}

void __38__COIDSTransport_invalidateWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v7;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = a3;
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", 0x24D4B5058, -4100, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callback");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *, _QWORD, id))v6)[2](v6, v5, 0, v7);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[COIDSTransport record](self, "record");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "record");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)registerCommandForClass:(Class)a3 withCompletion:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)registerRequestForClass:(Class)a3 withCompletion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void (**v12)(void);
  _QWORD v13[4];
  id v14;

  v12 = (void (**)(void))a4;
  NSStringFromClass(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COIDSTransport registeredCommands](self, "registeredCommands");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class acceptableResponses](a3, "acceptableResponses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __57__COIDSTransport_registerRequestForClass_withCompletion___block_invoke;
    v13[3] = &unk_24D4B42A8;
    v14 = v9;
    v10 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);
    -[COIDSTransport acceptableResponses](self, "acceptableResponses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v10, v6);

  }
  v12[2]();

}

void __57__COIDSTransport_registerRequestForClass_withCompletion___block_invoke(uint64_t a1, Class aClass)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  NSStringFromClass(aClass);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)deregisterRequestForClass:(Class)a3
{
  void *v4;
  void *v5;
  id v6;

  NSStringFromClass(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[COIDSTransport registeredCommands](self, "registeredCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v6);

  -[COIDSTransport acceptableResponses](self, "acceptableResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

}

- (id)acceptableResponsesForRequest:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COIDSTransport acceptableResponses](self, "acceptableResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)sendCommand:(id)a3 withCompletionHandler:(id)a4
{
  void *v5;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a4;
  -[COIDSTransport executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  v6[2](v6, 0);
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  xpc_object_t v20;
  void *v21;
  COIDSOutstandingRequestInfo *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id, _QWORD, uint64_t))a4;
  -[COIDSTransport executionContext](self, "executionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDispatchQueue");

  -[COIDSTransport director](self, "director");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeRequest:withIDSIdentifier:", v6, !self->_resolvedIDSIdentifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "activity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[COIDSTransport executionContext](self, "executionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "networkActivityFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activityWithLabel:parentActivity:", 2, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    nw_activity_activate();
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__26;
  v46 = __Block_byref_object_dispose__26;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__26;
  v40 = __Block_byref_object_dispose__26;
  v41 = 0;
  -[COIDSTransport director](self, "director");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[COIDSTransport record](self, "record");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "deviceTokenURI");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __50__COIDSTransport_sendRequest_withResponseHandler___block_invoke;
  v35[3] = &unk_24D4B42D0;
  v35[4] = &v36;
  v35[5] = &v42;
  objc_msgSend(v16, "sendMessage:toDestination:completionHandler:", v17, v19, v35);

  if (v43[5])
    goto LABEL_4;
  if (!v37[5])
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v43[5];
    v43[5] = v31;

LABEL_4:
    if (v15)
    {
      v20 = xpc_dictionary_create(0, 0, 0);
      v21 = v20;
      if (v20)
      {
        xpc_dictionary_set_uint64(v20, "transport_type", 2uLL);
        nw_activity_submit_metrics();
      }
      nw_activity_complete_with_reason();

    }
    v7[2](v7, v6, 0, v43[5]);
    goto LABEL_17;
  }
  v22 = -[COIDSOutstandingRequestInfo initWithRequest:at:callback:activity:]([COIDSOutstandingRequestInfo alloc], "initWithRequest:at:callback:activity:", v6, clock_gettime_nsec_np(_CLOCK_UPTIME_RAW), v7, v15);
  -[COIDSTransport outstandingRequests](self, "outstandingRequests");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v22, v37[5]);

  -[COIDSTransport _timerRequestAdded:](self, "_timerRequestAdded:", v22);
  if (!self->_resolvedIDSIdentifier)
  {
    self->_resolvedIDSIdentifier = 1;
    COCoreLogForCategory(17);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      -[COIDSTransport shortDescription](self, "shortDescription");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      -[COIDSTransport director](self, "director");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "messageFactory");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "idsIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v37[5];
      *(_DWORD *)buf = 138543874;
      v49 = v34;
      v50 = 2114;
      v51 = v26;
      v52 = 2114;
      v53 = v27;
      _os_log_impl(&dword_215E92000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ advertised IDS identifier %{public}@ via message %{public}@", buf, 0x20u);

    }
  }
  COCoreLogForCategory(17);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    -[COIDSTransport shortDescription](self, "shortDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v37[5];
    *(_DWORD *)buf = 138543874;
    v49 = v29;
    v50 = 2114;
    v51 = v6;
    v52 = 2114;
    v53 = v30;
    _os_log_impl(&dword_215E92000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ sent request %{public}@ via message %{public}@", buf, 0x20u);

  }
LABEL_17:
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
}

void __50__COIDSTransport_sendRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)handleMessage:(id)a3 requestIdentifier:(id)a4 responseIdentifier:(id)a5 from:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  COIDSTransport *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[COIDSTransport executionContext](self, "executionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __74__COIDSTransport_handleMessage_requestIdentifier_responseIdentifier_from___block_invoke;
  v19[3] = &unk_24D4B0A10;
  v20 = v10;
  v21 = self;
  v22 = v11;
  v23 = v13;
  v24 = v12;
  v15 = v12;
  v16 = v13;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v14, "dispatchAsync:", v19);

}

void __74__COIDSTransport_handleMessage_requestIdentifier_responseIdentifier_from___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 8))
  {
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", 0x24D4B5E98);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 1;
    COCoreLogForCategory(17);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 48);
      v12 = 138543874;
      v13 = v6;
      v14 = 2114;
      v15 = v4;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received IDS identifier %{public}@ from message %{public}@", (uint8_t *)&v12, 0x20u);

    }
  }
  switch(v2)
  {
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "_handleErrorFromMessage:incomingResponseIdentifier:from:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
      break;
    case 1:
      COCoreLogForCategory(17);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "shortDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 48);
        v11 = *(_QWORD *)(a1 + 64);
        v12 = 138543874;
        v13 = v9;
        v14 = 2114;
        v15 = v10;
        v16 = 2114;
        v17 = v11;
        _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ received response %{public}@ for %{public}@", (uint8_t *)&v12, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "_handleResponseFromMessage:incomingResponseIdentifier:from:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
      break;
    case 0:
      objc_msgSend(*(id *)(a1 + 40), "_handleRequestFromMessage:incomingRequestIdentifier:from:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      break;
  }
}

- (void)_configureTimer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  -[COIDSTransport timer](self, "timer");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  -[COIDSTransport setTimerEnabled:](self, "setTimerEnabled:", 0);
  objc_initWeak(&location, self);
  -[COIDSTransport timer](self, "timer");
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __33__COIDSTransport__configureTimer__block_invoke;
  v9 = &unk_24D4B0CD8;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v4, &v6);

  -[COIDSTransport timer](self, "timer", v6, v7, v8, v9);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __33__COIDSTransport__configureTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_timerFired");
    WeakRetained = v2;
  }

}

- (void)_timerFired
{
  void *v3;
  _QWORD v4[5];

  -[COIDSTransport executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__COIDSTransport__timerFired__block_invoke;
  v4[3] = &unk_24D4B0C80;
  v4[4] = self;
  objc_msgSend(v3, "dispatchAsync:", v4);

}

void __29__COIDSTransport__timerFired__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  __uint64_t v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  dispatch_time_t v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;
  __uint64_t v36;
  _BYTE buf[24];
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(17);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "outstandingRequests");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v4, "count");
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ timer fired. Outstanding requests = %lu", buf, 0x16u);

  }
  v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v7 = (id *)(a1 + 32);
  objc_msgSend(v8, "outstandingRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __29__COIDSTransport__timerFired__block_invoke_30;
  v34[3] = &unk_24D4B42F8;
  v11 = *v7;
  v36 = v5;
  v34[4] = v11;
  v12 = v6;
  v35 = v12;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v34);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(*v7, "outstandingRequests");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObjectForKey:", v17);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v14);
  }

  objc_msgSend(*v7, "outstandingRequests");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count") == 0;

  if (v20)
  {
    objc_msgSend(*v7, "setTimerEnabled:", 0);
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v38 = 0;
    objc_msgSend(*v7, "outstandingRequests");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v10;
    v29[1] = 3221225472;
    v29[2] = __29__COIDSTransport__timerFired__block_invoke_2;
    v29[3] = &unk_24D4B4320;
    v29[4] = buf;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v29);

    v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    objc_msgSend(*v7, "requestTimeout");
    v24 = v23;
    COCoreLogForCategory(17);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (uint64_t)-((double)(uint64_t)(v5 - v22) - v24 * 1000000000.0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      __29__COIDSTransport__timerFired__block_invoke_cold_1((uint64_t *)v7, v26, v25);

    objc_msgSend(*v7, "timer");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_time(0, v26);
    dispatch_source_set_timer(v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

    _Block_object_dispose(buf, 8);
  }

}

void __29__COIDSTransport__timerFired__block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = (double)(unint64_t)(*(_QWORD *)(a1 + 48) - objc_msgSend(v5, "enqeueStart"));
  objc_msgSend(*(id *)(a1 + 32), "requestTimeout");
  if (v7 * 1000000000.0 <= v6)
  {
    objc_msgSend(v5, "activity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = xpc_dictionary_create(0, 0, 0);
      v10 = v9;
      if (v9)
      {
        xpc_dictionary_set_uint64(v9, "transport_type", 2uLL);
        nw_activity_submit_metrics();
      }
      nw_activity_complete_with_reason();

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4003, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "callback");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD, void *))v12)[2](v12, v13, 0, v11);

  }
}

unint64_t __29__COIDSTransport__timerFired__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t result;
  uint64_t v5;

  result = objc_msgSend(a3, "enqeueStart");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_QWORD *)(v5 + 24) - 1 >= result)
    *(_QWORD *)(v5 + 24) = result;
  return result;
}

- (void)_timerRequestAdded:(id)a3
{
  NSObject *v4;
  double v5;
  int64_t v6;
  NSObject *v7;
  dispatch_time_t v8;

  if (!-[COIDSTransport isTimerEnabled](self, "isTimerEnabled", a3))
  {
    COCoreLogForCategory(17);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[COIDSTransport _timerRequestAdded:].cold.1((uint64_t)self, v4);

    -[COIDSTransport setTimerEnabled:](self, "setTimerEnabled:", 1);
    -[COIDSTransport requestTimeout](self, "requestTimeout");
    v6 = (uint64_t)(v5 * 1000000000.0);
    -[COIDSTransport timer](self, "timer");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_time(0, v6);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  }
}

- (void)_handleResponseFromMessage:(id)a3 incomingResponseIdentifier:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  __uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  xpc_object_t v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  -[COIDSTransport outstandingRequests](self, "outstandingRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (double)(v9 - objc_msgSend(v11, "enqeueStart")) / 1000000000.0;
  COCoreLogForCategory(17);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[COIDSTransport shortDescription](self, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v14;
    v30 = 2114;
    v31 = v8;
    v32 = 2048;
    v33 = v12;
    _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ message %{public}@ round trip time: %lfs", buf, 0x20u);

  }
  -[COIDSTransport outstandingRequests](self, "outstandingRequests");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectForKey:", v8);

  objc_msgSend(v11, "callback");
  v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v7, "payload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v11, "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[COIDSTransport acceptableResponsesForRequest:](self, "acceptableResponsesForRequest:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      objc_msgSend(v7, "unarchivePayloadOfTypes:error:", v19, &v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v27;
      v21 = 0;
      if (!v17)
      {
        COCoreLogForCategory(17);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[COIDSTransport _handleResponseFromMessage:incomingResponseIdentifier:from:].cold.2(self, (uint64_t)v20, v22);

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
        v21 = objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v11, "activity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = xpc_dictionary_create(0, 0, 0);
      v25 = v24;
      if (v24)
      {
        xpc_dictionary_set_uint64(v24, "transport_type", 2uLL);
        xpc_dictionary_set_double(v25, "rtt", v12);
        nw_activity_submit_metrics();
      }
      nw_activity_complete_with_reason();

    }
    objc_msgSend(v11, "request");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, NSObject *))v16)[2](v16, v26, v17, v21);

  }
  else
  {
    COCoreLogForCategory(17);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[COIDSTransport _handleResponseFromMessage:incomingResponseIdentifier:from:].cold.1();
  }

}

- (void)_handleErrorFromMessage:(id)a3 incomingResponseIdentifier:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v12;
  xpc_object_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  -[COIDSTransport outstandingRequests](self, "outstandingRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "callback");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "activity");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = xpc_dictionary_create(0, 0, 0);
      v14 = v13;
      if (v13)
      {
        xpc_dictionary_set_uint64(v13, "transport_type", 2uLL);
        nw_activity_submit_metrics();
      }
      nw_activity_complete_with_reason();

    }
    objc_msgSend(v10, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD, void *))v11)[2](v11, v15, 0, v16);

    -[COIDSTransport outstandingRequests](self, "outstandingRequests");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectForKey:", v8);

  }
  else
  {
    COCoreLogForCategory(17);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[COIDSTransport _handleErrorFromMessage:incomingResponseIdentifier:from:].cold.1();
  }

}

- (void)_handleRequestFromMessage:(id)a3 incomingRequestIdentifier:(id)a4 from:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COIDSTransport registeredCommands](self, "registeredCommands");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v8, "unarchivePayloadOfTypes:error:", v11, &v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v27;

  COCoreLogForCategory(17);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[COIDSTransport shortDescription](self, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v16;
      v30 = 2114;
      v31 = v12;
      v32 = 2114;
      v33 = v9;
      _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ received request %{public}@ via message %{public}@", buf, 0x20u);

    }
    -[COIDSTransport delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak((id *)buf, self);
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __75__COIDSTransport__handleRequestFromMessage_incomingRequestIdentifier_from___block_invoke;
      v23[3] = &unk_24D4B4348;
      objc_copyWeak(&v26, (id *)buf);
      v23[4] = self;
      v24 = v9;
      v25 = v10;
      objc_msgSend(v17, "transport:didReceiveRequest:callback:", self, v12, v23);

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[COIDSTransport _handleRequestFromMessage:incomingRequestIdentifier:from:].cold.1(self, (uint64_t)v13, v15);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[COIDSTransport director](self, "director");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "messageFactory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeError:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[COIDSTransport director](self, "director");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendResponse:responseIdentifier:toDestination:", v22, v9, v10);

  }
}

void __75__COIDSTransport__handleRequestFromMessage_incomingRequestIdentifier_from___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "director");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageFactory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v5)
      objc_msgSend(v9, "encodeError:", v5);
    else
      objc_msgSend(v9, "encodeResponse:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "director");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendResponse:responseIdentifier:toDestination:", v13, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (COTransportDelegate)delegate
{
  return (COTransportDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (COConstituent)remote
{
  return self->_remote;
}

- (void)setRemote:(id)a3
{
  objc_storeStrong((id *)&self->_remote, a3);
}

- (COExecutionContext)executionContext
{
  return self->_executionContext;
}

- (CODiscoveryRecordProtocol)record
{
  return self->_record;
}

- (COIDSServiceDirector)director
{
  return self->_director;
}

- (OS_nw_activity)activity
{
  return self->_activity;
}

- (NSMutableDictionary)outstandingRequests
{
  return self->_outstandingRequests;
}

- (void)setOutstandingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingRequests, a3);
}

- (NSMutableSet)registeredCommands
{
  return self->_registeredCommands;
}

- (void)setRegisteredCommands:(id)a3
{
  objc_storeStrong((id *)&self->_registeredCommands, a3);
}

- (NSMutableDictionary)acceptableResponses
{
  return self->_acceptableResponses;
}

- (void)setAcceptableResponses:(id)a3
{
  objc_storeStrong((id *)&self->_acceptableResponses, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (BOOL)isTimerEnabled
{
  return self->_timerEnabled;
}

- (void)setTimerEnabled:(BOOL)a3
{
  self->_timerEnabled = a3;
}

- (double)requestTimeout
{
  return self->_requestTimeout;
}

- (void)setRequestTimeout:(double)a3
{
  self->_requestTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_acceptableResponses, 0);
  objc_storeStrong((id *)&self->_registeredCommands, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_director, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_remote, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __29__COIDSTransport__timerFired__block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_debug_impl(&dword_215E92000, log, OS_LOG_TYPE_DEBUG, "%{public}@ timer reconfiguring to %llu", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_timerRequestAdded:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_215E92000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ enabling timer for default duration", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)_handleResponseFromMessage:incomingResponseIdentifier:from:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_19();
  v3 = v0;
  OUTLINED_FUNCTION_4(&dword_215E92000, v1, (uint64_t)v1, "%{public}@ No response callback for a response with identifier %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_handleResponseFromMessage:(void *)a1 incomingResponseIdentifier:(uint64_t)a2 from:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  v8 = a2;
  OUTLINED_FUNCTION_4(&dword_215E92000, a3, v6, "%{public}@ error decoding response: %{public}@", v7);

  OUTLINED_FUNCTION_11();
}

- (void)_handleErrorFromMessage:incomingResponseIdentifier:from:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_2();
  v3 = v0;
  OUTLINED_FUNCTION_4(&dword_215E92000, v1, (uint64_t)v1, "%{public}@ No response callback for a response with identifier %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_handleRequestFromMessage:(void *)a1 incomingRequestIdentifier:(uint64_t)a2 from:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  v8 = a2;
  OUTLINED_FUNCTION_4(&dword_215E92000, a3, v6, "%{public}@ error decoding request: %@", v7);

  OUTLINED_FUNCTION_11();
}

@end
