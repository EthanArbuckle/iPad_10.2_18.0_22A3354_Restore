@implementation GEOETARequester

+ (id)sharedRequester
{
  if (qword_1ECDBC038 != -1)
    dispatch_once(&qword_1ECDBC038, &__block_literal_global_92);
  return (id)_MergedGlobals_239;
}

void __34__GEOETARequester_sharedRequester__block_invoke()
{
  GEOETARequester *v0;
  void *v1;

  v0 = objc_alloc_init(GEOETARequester);
  v1 = (void *)_MergedGlobals_239;
  _MergedGlobals_239 = (uint64_t)v0;

}

- (GEOETARequester)init
{
  GEOETARequester *v2;
  uint64_t v3;
  geo_isolater *isolater;
  uint64_t v5;
  NSHashTable *pendingSimpleRequests;
  uint64_t v7;
  NSMapTable *pendingRequests;
  GEOETARequester *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GEOETARequester;
  v2 = -[GEOETARequester init](&v11, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 5);
    pendingSimpleRequests = v2->_pendingSimpleRequests;
    v2->_pendingSimpleRequests = (NSHashTable *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 5);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSMapTable *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)dealloc
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_pendingRequests;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[GEOETARequester cancelRequest:](self, "cancelRequest:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)GEOETARequester;
  -[GEOETARequester dealloc](&v8, sel_dealloc);
}

- (void)startRequest:(id)a3 connectionProperties:(id)a4 auditToken:(id)a5 throttleToken:(id)a6 callbackQueue:(id)a7 willSendRequest:(id)a8 finished:(id)a9 networkActivity:(id)a10 error:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  GEOETARequestUpdateable *v33;
  GEOETARequestUpdateable *v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  id v38;
  void *global_workloop;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  _QWORD *v54;
  _QWORD v55[4];
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(_QWORD *);
  void *v60;
  GEOETARequester *v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;

  v16 = a3;
  v47 = a4;
  v51 = a5;
  v50 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = MEMORY[0x1E0C809B0];
  if (v18)
  {
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke;
    v73[3] = &unk_1E1C0C600;
    v74 = v17;
    v75 = v18;
    v49 = (void *)MEMORY[0x18D765024](v73);

    if (v19)
      goto LABEL_3;
  }
  else
  {
    v49 = 0;
    if (v19)
    {
LABEL_3:
      v70[0] = v22;
      v70[1] = 3221225472;
      v70[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_3;
      v70[3] = &unk_1E1C0C628;
      v71 = v17;
      v72 = v19;
      v48 = (void *)MEMORY[0x18D765024](v70);

      if (v21)
        goto LABEL_4;
LABEL_8:
      v23 = 0;
      if (v20)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  v48 = 0;
  if (!v21)
    goto LABEL_8;
LABEL_4:
  v67[0] = v22;
  v67[1] = 3221225472;
  v67[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_5;
  v67[3] = &unk_1E1C00A28;
  v68 = v17;
  v69 = v21;
  v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D765024](v67);

  if (v20)
  {
LABEL_5:
    v64[0] = v22;
    v64[1] = 3221225472;
    v64[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_7;
    v64[3] = &unk_1E1C028E0;
    v65 = v17;
    v66 = v20;
    v24 = (void *)MEMORY[0x18D765024](v64);

    goto LABEL_10;
  }
LABEL_9:
  v24 = 0;
LABEL_10:
  if (!objc_msgSend(v16, "hasXpcUuid"))
  {
    v44 = v21;
    v45 = v18;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = v24;
    v28 = v22;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setXpcUuid:", v29);

    objc_msgSend(v16, "clearSensitiveFields:", 0);
    v43 = v27;
    +[_GEOETARemoteProvider provderWithWillSendRequest:finished:networkActivity:error:](_GEOETARemoteProvider, "provderWithWillSendRequest:finished:networkActivity:error:", v49, v48, v27, v23);
    v57 = v28;
    v58 = 3221225472;
    v59 = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_9;
    v60 = &unk_1E1C01790;
    v61 = self;
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v62 = v25;
    v30 = v16;
    v63 = v30;
    geo_isolate_sync_data();
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "defaultTraits");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOETARequestUpdateable alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("ETA.startETARequest"), v32, v51, v50);
    v34 = v33;
    if (v33)
    {
      v41 = v20;
      v42 = v19;
      -[GEOETARequestUpdateable setRequest:](v33, "setRequest:", v30);
      -[GEOETARequestUpdateable setConnectionProperties:](v34, "setConnectionProperties:", v47);
      v55[0] = v28;
      v55[1] = 3221225472;
      v55[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_10;
      v55[3] = &unk_1E1C093A8;
      v35 = v25;
      v56 = v35;
      +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 4, CFSTR("com.apple.geo.eta.start"), v55);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GEOAnchorPointListElement setAnchorPoint:]((uint64_t)v35, v36);

      if (v35)
        v37 = (void *)v35[1];
      else
        v37 = 0;
      v38 = v37;
      global_workloop = (void *)geo_get_global_workloop();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_12;
      v52[3] = &unk_1E1C0C6A0;
      v52[4] = self;
      v53 = v30;
      v54 = v35;
      -[GEOXPCRequest send:withReply:handler:](v34, "send:withReply:handler:", v38, global_workloop, v52);

      v40 = v56;
      v20 = v41;
      v19 = v42;
      v24 = v43;
    }
    else
    {
      v24 = v43;
      if (!v23)
      {
LABEL_20:

        v21 = v44;
        v18 = v45;
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, CFSTR("Unable to create client request"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v23)[2](v23, v40);
    }

    goto LABEL_20;
  }
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, CFSTR("Request already has xpc uuid"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v23)[2](v23, v25);
LABEL_21:

  }
}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_2;
  v6[3] = &unk_1E1C0C5D8;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_6;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_7(uint64_t a1, char a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_8;
  v4[3] = &unk_1E1C0C650;
  v3 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = a2;
  dispatch_async(v3, v4);

}

uint64_t __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

uint64_t __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_9(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", a1[5], a1[6]);
}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  objc_class *v6;
  void *v7;
  GEOETAUpdateableWillSendReply *v8;
  GEOETAUpdateableWillSendReply *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD *v13;
  GEOETAUpdateableWillSendReply *v14;

  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(v3, "message");
    if (string && !strcmp(string, "ETA.willSendETARequest"))
    {
      v6 = (objc_class *)objc_opt_class();
      GEODecodeModernXPCMessage(v3, v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[GEOXPCReply initWithRequest:]([GEOETAUpdateableWillSendReply alloc], "initWithRequest:", v7);
      v9 = v8;
      v10 = *(_QWORD **)(a1 + 32);
      if (v10 && (v11 = v10[2]) != 0)
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_11;
        v12[3] = &unk_1E1C0C678;
        v13 = v10;
        v14 = v9;
        (*(void (**)(uint64_t, _QWORD *))(v11 + 16))(v11, v12);

      }
      else
      {
        -[GEOXPCReply send](v8, "send");
      }

    }
  }
  else if (v3 == (id)MEMORY[0x1E0C81260] || v3 == (id)MEMORY[0x1E0C81258])
  {
    -[_GEOAnchorPointListElement setAnchorPoint:](*(_QWORD *)(a1 + 32), 0);
  }

}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 && *(_QWORD *)(v4 + 8))
  {
    v5 = v3;
    objc_msgSend(v3, "clearSensitiveFields:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setUpdatedRequest:", v5);
    objc_msgSend(*(id *)(a1 + 40), "send");
    v3 = v5;
  }

}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_finishRequest:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v20, "response");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!(v5 | v6))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -11);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v7 = *(_QWORD **)(a1 + 48);
    if (v7)
    {
      v8 = v7[4];
      if (v8)
      {
        (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
        v7 = *(_QWORD **)(a1 + 48);
      }
    }
    if (v6)
    {
      if (v7)
      {
        v9 = v7[3];
        if (v9)
          (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v6);
      }
    }
    else if (v7 && v7[5])
    {
      objc_msgSend(v20, "errorInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0C99E08];
        objc_msgSend((id)v5, "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dictionaryWithDictionary:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[GEOETATrafficUpdateErrorInfo key](GEOETATrafficUpdateErrorInfo, "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v14);

        v15 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend((id)v5, "domain");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, objc_msgSend((id)v5, "code"), v13);
        v17 = objc_claimAutoreleasedReturnValue();

        v5 = v17;
      }
      v18 = *(_QWORD *)(a1 + 48);
      if (v18)
        v19 = *(_QWORD *)(v18 + 40);
      else
        v19 = 0;
      (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, v5);

    }
  }
  -[_GEOAnchorPointListElement setAnchorPoint:](*(_QWORD *)(a1 + 48), 0);

}

- (void)cancelRequest:(id)a3
{
  id v3;
  GEOETARequestUpdateable *v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  if ((objc_msgSend(v3, "hasXpcUuid") & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    v9 = buf;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__45;
    v12 = __Block_byref_object_dispose__45;
    v13 = 0;
    v7 = v3;
    geo_isolate_sync_data();
    v4 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOETARequestUpdateable alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("ETA.cancelETARequest"), 0, 0, 0);
    -[GEOETARequestUpdateable setRequest:](v4, "setRequest:", v7);
    v5 = (_QWORD *)*((_QWORD *)v9 + 5);
    if (v5)
      v5 = (_QWORD *)v5[1];
    v6 = v5;
    -[GEOXPCRequest send:](v4, "send:", v6);

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: request.hasXpcUuid", buf, 2u);
  }

}

void __33__GEOETARequester_cancelRequest___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    objc_msgSend(*(id *)(a1[4] + 24), "removeObjectForKey:", a1[5]);
}

- (void)startSimpleETARequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 callbackQueue:(id)a6 finished:(id)a7 networkActivity:(id)a8 error:(id)a9
{
  -[GEOETARequester startSimpleETARequest:auditToken:throttleToken:traits:callbackQueue:finished:networkActivity:error:](self, "startSimpleETARequest:auditToken:throttleToken:traits:callbackQueue:finished:networkActivity:error:", a3, a4, a5, 0, a6, a7, a8, a9);
}

- (void)startSimpleETARequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 traits:(id)a6 callbackQueue:(id)a7 finished:(id)a8 networkActivity:(id)a9 error:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  GEOETARequestSimple *v28;
  NSObject *v29;
  void *global_workloop;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  _QWORD v38[5];
  id v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t);
  void *v51;
  GEOETARequester *v52;
  id v53;

  v16 = a3;
  v17 = a6;
  v37 = a7;
  v36 = a8;
  v18 = a9;
  v34 = a10;
  v19 = a5;
  v20 = a4;
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "clientCapabilities");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClientCapabilities:", v22);

  objc_msgSend(v16, "clientCapabilities");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "updateWithETARequest:", v16);

  GEOETARequestRemoveFieldsForSendingRequest(v16);
  v24 = MEMORY[0x1E0C809B0];
  v48 = MEMORY[0x1E0C809B0];
  v49 = 3221225472;
  v50 = __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke;
  v51 = &unk_1E1C00738;
  v52 = self;
  v25 = v16;
  v53 = v25;
  geo_isolate_sync_data();
  if (v17)
  {
    v26 = v17;
  }
  else
  {
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "defaultTraits");
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  v28 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOETARequestSimple alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("ETA.startSimpleETARequest"), v26, v20, v19);

  if (v28)
  {
    v29 = v37;
    if (v18)
    {
      block[0] = v24;
      block[1] = 3221225472;
      block[2] = __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_3;
      block[3] = &unk_1E1C01F48;
      v45 = v18;
      dispatch_async(v37, block);

    }
    -[GEOETARequestSimple setRequest:](v28, "setRequest:", v25, v34);
    global_workloop = (void *)geo_get_global_workloop();
    v38[0] = v24;
    v38[1] = 3221225472;
    v38[2] = __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_4;
    v38[3] = &unk_1E1C0C6F0;
    v38[4] = self;
    v39 = v25;
    v40 = v37;
    v41 = v18;
    v31 = v36;
    v42 = v36;
    v32 = v35;
    v43 = v35;
    -[GEOXPCRequest send:withReply:handler:](v28, "send:withReply:handler:", 0, global_workloop, v38);

    v33 = v39;
    goto LABEL_10;
  }
  v31 = v36;
  v29 = v37;
  v32 = v34;
  if (v34)
  {
    v46[0] = v24;
    v46[1] = 3221225472;
    v46[2] = __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_2;
    v46[3] = &unk_1E1C01F48;
    v47 = v34;
    dispatch_async(v37, v46);
    v33 = v47;
LABEL_10:

  }
}

uint64_t __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

void __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, CFSTR("Unable to create client request"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_finishSimpleRequest:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v5, "response");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 && !v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:underlyingError:", -8, CFSTR("No ETA response"), v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v9;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_5;
    block[3] = &unk_1E1C0C6C8;
    v10 = *(NSObject **)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v13 = v8;
    v16 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 72);
    v6 = v6;
    v14 = v6;
    v11 = v8;
    dispatch_async(v10, block);

  }
}

uint64_t __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = a1[6];
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  v3 = a1[4];
  if (!v3)
  {
    result = a1[8];
    if (!result)
      return result;
    v3 = a1[5];
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  return result;
}

- (void)cancelSimpleETARequest:(id)a3
{
  GEOETARequestSimple *v4;
  id v5;

  v5 = a3;
  if (-[GEOETARequester _finishSimpleRequest:](self, "_finishSimpleRequest:"))
  {
    v4 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOETARequestSimple alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("ETA.cancelSimpleETARequest"), 0, 0, 0);
    -[GEOETARequestSimple setRequest:](v4, "setRequest:", v5);
    -[GEOXPCRequest send:](v4, "send:", 0);

  }
}

- (BOOL)_finishSimpleRequest:(id)a3
{
  id v4;
  _BOOL4 v5;
  geo_isolater *v7;

  v4 = a3;
  v7 = self->_isolater;
  _geo_isolate_lock_data();
  v5 = -[NSHashTable containsObject:](self->_pendingSimpleRequests, "containsObject:", v4);
  if (v5)
    -[NSHashTable removeObject:](self->_pendingSimpleRequests, "removeObject:", v4);
  _geo_isolate_unlock();

  return v5;
}

- (BOOL)_finishRequest:(id)a3
{
  id v4;
  void *v5;
  geo_isolater *v7;

  v4 = a3;
  v7 = self->_isolater;
  _geo_isolate_lock_data();
  -[NSMapTable objectForKey:](self->_pendingRequests, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NSMapTable removeObjectForKey:](self->_pendingRequests, "removeObjectForKey:", v4);
  _geo_isolate_unlock();

  return v5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_pendingSimpleRequests, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
}

@end
