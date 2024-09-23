@implementation GEODirectionsRequesterRemoteProxy

- (GEODirectionsRequesterRemoteProxy)init
{
  GEODirectionsRequesterRemoteProxy *v2;
  uint64_t v3;
  geo_isolater *isolater;
  uint64_t v5;
  NSMapTable *pendingRequestConnections;
  GEODirectionsRequesterRemoteProxy *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEODirectionsRequesterRemoteProxy;
  v2 = -[GEODirectionsRequesterRemoteProxy init](&v9, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 5);
    pendingRequestConnections = v2->_pendingRequestConnections;
    v2->_pendingRequestConnections = (NSMapTable *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)startRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 useBackgroundURL:(BOOL)a6 requestPriority:(id)a7 callbackQueue:(id)a8 finished:(id)a9 networkActivity:(id)a10 error:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  GEOXPCDirectionsRequest *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _BOOL4 v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(_QWORD *);
  void *v41;
  GEODirectionsRequesterRemoteProxy *v42;
  id v43;
  id v44;

  v31 = a6;
  v16 = a3;
  v30 = a9;
  v17 = a10;
  v18 = a11;
  v32 = a8;
  v19 = a7;
  v20 = a5;
  v21 = a4;
  objc_msgSend(v16, "clearSensitiveFields:", 0);
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 3, CFSTR("Directions.start"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = MEMORY[0x1E0C809B0];
  v39 = 3221225472;
  v40 = __146__GEODirectionsRequesterRemoteProxy_startRequest_traits_auditToken_useBackgroundURL_requestPriority_callbackQueue_finished_networkActivity_error___block_invoke;
  v41 = &unk_1E1C01790;
  v42 = self;
  v43 = v22;
  v44 = v16;
  v23 = v22;
  geo_isolate_sync_data();
  v24 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOXPCDirectionsRequest alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("directions.start"), v21, v20, 0);

  -[GEOXPCDirectionsRequest setDirectionsRequest:](v24, "setDirectionsRequest:", v44);
  v25 = objc_msgSend(v19, "intValue");

  -[GEOXPCDirectionsRequest setPriority:](v24, "setPriority:", v25);
  -[GEOXPCDirectionsRequest setUseBackgroundURL:](v24, "setUseBackgroundURL:", v31);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __146__GEODirectionsRequesterRemoteProxy_startRequest_traits_auditToken_useBackgroundURL_requestPriority_callbackQueue_finished_networkActivity_error___block_invoke_2;
  v33[3] = &unk_1E1C08CB8;
  v33[4] = self;
  v34 = v44;
  v35 = v17;
  v36 = v30;
  v37 = v18;
  v26 = v18;
  v27 = v30;
  v28 = v17;
  v29 = v44;
  -[GEOXPCRequest send:withReply:handler:](v24, "send:withReply:handler:", v23, v32, v33);

  +[GEODirectionsAnalyticsReporter reportDirectionsAnalyticsForRequest:]((uint64_t)GEODirectionsAnalyticsReporter, v29);
}

uint64_t __146__GEODirectionsRequesterRemoteProxy_startRequest_traits_auditToken_useBackgroundURL_requestPriority_callbackQueue_finished_networkActivity_error___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", a1[5], a1[6]);
}

void __146__GEODirectionsRequesterRemoteProxy_startRequest_traits_auditToken_useBackgroundURL_requestPriority_callbackQueue_finished_networkActivity_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_takeConnectionForRequest:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_15;
  objc_msgSend(v14, "directionsResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "directionsError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v5;
  }
  else
  {
    if (v7)
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", -11, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
LABEL_7:
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
  if (v7)
  {
    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v7);
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 64);
    if (v13)
      (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v10, v8);
  }
  objc_msgSend(v6, "close");

LABEL_15:
}

- (void)cancelRequest:(id)a3
{
  id v4;
  void *v5;
  GEOXPCDirectionsRequest *v6;
  void *global_queue;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[GEODirectionsRequesterRemoteProxy _takeConnectionForRequest:](self, "_takeConnectionForRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOXPCDirectionsRequest alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("directions.cancel"), 0, 0, 0);
    -[GEOXPCDirectionsRequest setDirectionsRequest:](v6, "setDirectionsRequest:", v4);
    global_queue = (void *)geo_get_global_queue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__GEODirectionsRequesterRemoteProxy_cancelRequest___block_invoke;
    v8[3] = &unk_1E1C08CE0;
    v9 = v5;
    -[GEOXPCRequest send:withReply:handler:](v6, "send:withReply:handler:", v9, global_queue, v8);

  }
}

uint64_t __51__GEODirectionsRequesterRemoteProxy_cancelRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close");
}

- (id)_takeConnectionForRequest:(id)a3
{
  id v4;
  void *v5;
  geo_isolater *v7;

  v4 = a3;
  v7 = self->_isolater;
  _geo_isolate_lock_data();
  -[NSMapTable objectForKey:](self->_pendingRequestConnections, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[NSMapTable removeObjectForKey:](self->_pendingRequestConnections, "removeObjectForKey:", v4);
  _geo_isolate_unlock();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestConnections, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
}

@end
