@implementation NEFilterSource

+ (BOOL)filterRequired
{
  id v2;
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _BOOL4 v11;
  NSObject *v12;
  _BYTE v14[32];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (g_delegation_audit_token)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
    v3 = *(_OWORD *)(g_delegation_audit_token + 16);
    *(_OWORD *)v14 = *(_OWORD *)g_delegation_audit_token;
    *(_OWORD *)&v14[16] = v3;
    objc_msgSend(v2, "setSourceApplicationWithToken:", v14);
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v14 = 136315394;
      *(_QWORD *)&v14[4] = "+[NEFilterSource filterRequired]";
      *(_WORD *)&v14[12] = 2112;
      *(_QWORD *)&v14[14] = v2;
      _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "%s: parameters %@", v14, 0x16u);
    }

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CCECB0]), "initWithEndpoint:parameters:", 0, v2);
    v6 = (void *)g_pathEvaluator;
    g_pathEvaluator = v5;

    v7 = (void *)g_pathEvaluator;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v7;
  }
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "filterControlUnit");

  v11 = (v9 & 0x40000000) == 0 && v9 != 0;
  ne_log_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)&v14[4] = "+[NEFilterSource filterRequired]";
    *(_WORD *)&v14[12] = 1024;
    *(_DWORD *)&v14[14] = v11;
    _os_log_debug_impl(&dword_19BD16000, v12, OS_LOG_TYPE_DEBUG, "%s: result %d", v14, 0x12u);
  }

  return v11;
}

+ (void)setDelegation:(id *)a3
{
  g_delegation_audit_token = (uint64_t)a3;
}

- (NEFilterSource)initWithURL:(id)a3 direction:(int64_t)a4 socketIdentifier:(unint64_t)a5
{
  id v9;
  NEFilterSource *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NEFilterSource;
  v10 = -[NEFilterSource init](&v18, sel_init);
  v11 = (uint64_t)v10;
  if (v10)
  {
    v10->_registered = 0;
    objc_storeStrong((id *)&v10->_url, a3);
    *(_QWORD *)(v11 + 40) = a4;
    *(_QWORD *)(v11 + 48) = a5;
    v12 = *(void **)(v11 + 56);
    *(_QWORD *)(v11 + 56) = 0;

    *(_DWORD *)(v11 + 12) = 0;
    *(_QWORD *)(v11 + 24) = 3;
    *(_OWORD *)(v11 + 112) = xmmword_19BED74A0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(v11 + 80);
    *(_QWORD *)(v11 + 80) = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 0);
    v16 = *(void **)(v11 + 64);
    *(_QWORD *)(v11 + 64) = v15;

    *(_QWORD *)(v11 + 104) = 0;
    -[NEFilterSource initGlobals](v11);
  }

  return (NEFilterSource *)v11;
}

- (void)addData:(id)a3 withCompletionQueue:(id)a4 completionHandler:(id)a5
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
  v14[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E3CC05F0;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  -[NEFilterSource prepareAgentWithHandler:](self, v14);

}

- (void)dataCompleteWithCompletionQueue:(id)a3 completionHandler:(id)a4
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
  v10[2] = __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke;
  v10[3] = &unk_1E3CC0550;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NEFilterSource prepareAgentWithHandler:](self, v10);

}

- (NEFilterSource)initWithDecisionQueue:(id)a3
{
  id v5;
  NEFilterSource *v6;
  NEFilterSource *v7;
  uint64_t v8;
  NSMutableData *pendingData;
  dispatch_group_t v10;
  OS_dispatch_group *sendDataGroup;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEFilterSource;
  v6 = -[NEFilterSource init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_registered = 0;
    v6->_status = 3;
    *(_OWORD *)&v6->_peekIndex = xmmword_19BED74A0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 0);
    pendingData = v7->_pendingData;
    v7->_pendingData = (NSMutableData *)v8;

    v7->_pendingDataStartIndex = 0;
    objc_storeStrong((id *)&v7->_queue, a3);
    v10 = dispatch_group_create();
    sendDataGroup = v7->_sendDataGroup;
    v7->_sendDataGroup = (OS_dispatch_group *)v10;

    -[NEFilterSource initGlobals]((uint64_t)v7);
  }

  return v7;
}

- (void)willSendRequest:(id)a3 decisionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  id Property;
  _QWORD v16[5];
  id v17;
  id v18;
  void (**v19)(_QWORD);
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke;
    aBlock[3] = &unk_1E3CC3A30;
    aBlock[4] = self;
    v23 = v6;
    v9 = v7;
    v24 = v9;
    v10 = (void (**)(_QWORD))_Block_copy(aBlock);
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_4;
    v20[3] = &unk_1E3CC46A8;
    v20[4] = self;
    v11 = v9;
    v21 = v11;
    v13 = _Block_copy(v20);
    if (self && objc_getProperty(self, v12, 128, 1))
    {
      Property = objc_getProperty(self, v14, 128, 1);
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_6;
      v16[3] = &unk_1E3CC05A0;
      v16[4] = self;
      v17 = v11;
      v18 = v13;
      v19 = v10;
      -[NEFilterSource prepareAgentForResponse:handler:]((uint64_t)self, Property, v16);

    }
    else
    {
      v10[2](v10);
    }

  }
}

- (void)receivedResponse:(id)a3 decisionHandler:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__NEFilterSource_receivedResponse_decisionHandler___block_invoke;
    v8[3] = &unk_1E3CC0858;
    v8[4] = self;
    v9 = v6;
    -[NEFilterSource prepareAgentForResponse:handler:]((uint64_t)self, a3, v8);

  }
}

- (void)receivedData:(id)a3 decisionHandler:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  SEL v13;
  NSObject *Property;
  SEL v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD aBlock[5];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD block[5];
  id v30;

  v6 = a3;
  v8 = a4;
  if (v8)
  {
    if (self && self->_controlUnit)
    {
      if (objc_getProperty(self, v7, 128, 1))
      {
        v10 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_3;
        aBlock[3] = &unk_1E3CC46A8;
        aBlock[4] = self;
        v11 = v8;
        v26 = v11;
        v12 = _Block_copy(aBlock);
        Property = objc_getProperty(self, v13, 216, 1);
        dispatch_group_enter(Property);
        v16 = objc_getProperty(self, v15, 128, 1);
        v21[0] = v10;
        v21[1] = 3221225472;
        v21[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_5;
        v21[3] = &unk_1E3CC05C8;
        v21[4] = self;
        v23 = v11;
        v24 = v12;
        v22 = v6;
        v17 = v12;
        -[NEFilterSource prepareAgentForResponse:handler:]((uint64_t)self, v16, v21);

        v18 = v26;
      }
      else
      {
        v20 = objc_getProperty(self, v9, 144, 1);
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_2;
        v27[3] = &unk_1E3CC4720;
        v28 = v8;
        dispatch_async(v20, v27);
        v18 = v28;
      }
    }
    else
    {
      self->_status = 1;
      v19 = objc_getProperty(self, v7, 144, 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke;
      block[3] = &unk_1E3CC46A8;
      block[4] = self;
      v30 = v8;
      dispatch_async(v19, block);
      v18 = v30;
    }

  }
}

- (void)finishedLoadingWithDecisionHandler:(id)a3
{
  const char *v4;
  id v5;
  NSObject *v6;
  SEL v7;
  NSObject *Property;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  if (self)
  {
    v6 = objc_getProperty(self, v4, 216, 1);
    Property = objc_getProperty(self, v7, 144, 1);
  }
  else
  {
    v6 = 0;
    Property = 0;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NEFilterSource_finishedLoadingWithDecisionHandler___block_invoke;
  v10[3] = &unk_1E3CC46A8;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_group_notify(v6, Property, v10);

}

- (void)remediateWithDecisionHandler:(id)a3
{
  const char *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  SEL v9;
  const char *v10;
  id v11;
  uint64_t controlUnit;
  void *v13;
  NSObject *Property;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD block[4];
  id v22;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    if (self && (objc_setProperty_atomic(self, v4, 0, 160), self->_expectRemediation))
    {
      -[NEFilterSource url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_getProperty(self, v9, 184, 1);
      controlUnit = self->_controlUnit;
      if ((_DWORD)controlUnit)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_3;
        v15[3] = &unk_1E3CC05F0;
        v15[4] = self;
        v18 = v5;
        v16 = v8;
        v17 = v11;
        -[NEFilterSource connectToFilterUnit:withCompletionHandler:]((uint64_t)self, controlUnit, v15);

        v13 = v18;
      }
      else
      {
        self->_status = 1;
        Property = objc_getProperty(self, v10, 144, 1);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_2;
        v19[3] = &unk_1E3CC46A8;
        v19[4] = self;
        v20 = v5;
        dispatch_async(Property, v19);
        v13 = v20;
      }

    }
    else
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "remediateWithDecisionHandler: dont expect remediation", buf, 2u);
      }

      if (self)
        self = (NEFilterSource *)objc_getProperty(self, v7, 144, 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke;
      block[3] = &unk_1E3CC4720;
      v22 = v5;
      dispatch_async(&self->super, block);
      v8 = v22;
    }

  }
}

- (int64_t)status
{
  return self->_status;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)direction
{
  return self->_direction;
}

- (unint64_t)socketIdentifier
{
  return self->_socketIdentifier;
}

- (NSString)sourceAppIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSourceAppIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (int)sourceAppPid
{
  return self->_sourceAppPid;
}

- (void)setSourceAppPid:(int)a3
{
  self->_sourceAppPid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendDataGroup, 0);
  objc_storeStrong((id *)&self->_parentURL, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_remediationButtonText, 0);
  objc_storeStrong((id *)&self->_remediationURL, 0);
  objc_storeStrong((id *)&self->_urlAppendString, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_currentResponse, 0);
  objc_storeStrong((id *)&self->_flowUUID, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_pendingData, 0);
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

uint64_t __47__NEFilterSource_remediateWithDecisionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "status"), 0);
}

void __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  id Property;
  xpc_object_t v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  unsigned __int8 uuid[8];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    *(_QWORD *)uuid = 0;
    v19 = 0;
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v3, 80, 1);
    objc_msgSend(Property, "getUUIDBytes:", uuid);
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, "command", 5);
    xpc_dictionary_set_uuid(v6, "flow-uuid", uuid);
    objc_msgSend(*(id *)(a1 + 40), "absoluteString");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v6, "url", (const char *)objc_msgSend(v7, "UTF8String"));

    v8 = *(void **)(a1 + 48);
    if (v8)
    {
      objc_msgSend(v8, "absoluteString");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v6, "parent-url", (const char *)objc_msgSend(v9, "UTF8String"));

    }
    v15 = *(id *)(a1 + 56);
    ne_filter_send_message();

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 2;
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uuid = 0;
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "remediateWithDecisionHandler: could not establish connection to data provider", uuid, 2u);
    }

    v12 = *(void **)(a1 + 32);
    if (v12)
      v13 = objc_getProperty(v12, v11, 144, 1);
    else
      v13 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_71;
    block[3] = &unk_1E3CC46A8;
    v14 = *(id *)(a1 + 56);
    block[4] = *(_QWORD *)(a1 + 32);
    v17 = v14;
    dispatch_async(v13, block);

  }
}

- (void)connectToFilterUnit:(void *)a3 withCompletionHandler:
{
  void (**v3)(id, void *);
  void *v4;
  void (**v5)(id, void *);

  v3 = a3;
  if (v3)
  {
    v4 = (void *)ne_filter_copy_connection();
    if (v4)
    {
      v3[2](v3, v4);
    }
    else
    {
      v5 = v3;
      ne_filter_request_connection();

    }
  }

}

void __60__NEFilterSource_connectToFilterUnit_withCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    v3 = (id)ne_filter_copy_connection();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "status"), 0);
}

void __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_2_72(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _BOOL4 v12;
  id Property;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v5, 80, 1);
    *(_DWORD *)buf = 138412546;
    v17 = Property;
    v18 = 2112;
    v19 = v3;
    _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "NEFilterSource got remediation reply %@: %@", buf, 0x16u);
  }

  if (!v3 || MEMORY[0x1A1ACFDA4](v3) != MEMORY[0x1E0C812F8])
  {
    v7 = *(_QWORD *)(a1 + 32);
LABEL_5:
    v8 = 2;
    goto LABEL_6;
  }
  v12 = xpc_dictionary_get_BOOL(v3, "verdict-drop");
  v7 = *(_QWORD *)(a1 + 32);
  if (v12)
    goto LABEL_5;
  v8 = 1;
LABEL_6:
  *(_QWORD *)(v7 + 24) = v8;
  v9 = *(void **)(a1 + 32);
  if (v9)
    v10 = objc_getProperty(v9, v6, 144, 1);
  else
    v10 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_73;
  v14[3] = &unk_1E3CC46A8;
  v11 = *(id *)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v11;
  dispatch_async(v10, v14);

}

void __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_73(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1 + 32;
  v1 = *(_QWORD **)(a1 + 32);
  v2 = *(_QWORD *)(v3 + 8);
  v4 = v1[3];
  -[NEFilterSource filterOptions](v1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);

}

- (id)filterOptions
{
  const char *v2;
  NEFilterBlockPage *v3;
  void *v4;
  const char *v5;
  void *v6;
  SEL v7;
  const char *v8;
  id Property;
  const char *v10;
  SEL v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  SEL v19;
  id v20;
  id v21;
  id v22;
  const __CFString *v23;
  const __CFString *v24;
  NEFilterBlockPage *v25;
  ptrdiff_t v26;
  const char *v27;
  id v28;
  void *v29;
  uint64_t v30;
  NSString *organization;
  void *v32;
  void *v33;
  void *v34;
  SEL v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  SEL v43;

  if (!a1)
    goto LABEL_17;
  if (objc_msgSend(a1, "status") == 2)
  {
    v3 = objc_alloc_init(NEFilterBlockPage);
    objc_msgSend(a1, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_setProperty_atomic_copy(v3, v5, v6, 24);

    if (objc_getProperty(a1, v7, 160, 1))
    {
      Property = objc_getProperty(a1, v8, 160, 1);
      if (v3)
      {
        objc_setProperty_atomic_copy(v3, v10, Property, 32);
        objc_setProperty_atomic_copy(v3, v11, &stru_1E3CC53C8, 40);
      }
      if (objc_msgSend(objc_getProperty(a1, v10, 168, 1), "length"))
      {
        v12 = (__CFString *)objc_getProperty(a1, v8, 168, 1);
        if (v3)
        {
          v13 = v12;
LABEL_20:
          v25 = v3;
          v26 = 48;
          goto LABEL_21;
        }
      }
      else if (v3)
      {
        v13 = CFSTR("Request Access");
        goto LABEL_20;
      }
    }
    else if (v3)
    {
      v13 = CFSTR("display:none");
      v25 = v3;
      v26 = 40;
LABEL_21:
      objc_setProperty_atomic_copy(v25, v8, v13, v26);
    }
    if (objc_getProperty(a1, v8, 176, 1))
    {
      v28 = objc_getProperty(a1, v27, 176, 1);
      v29 = v28;
      if (v3)
      {
        if (v28 && objc_msgSend(v28, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" by &ldquo;%@&rdquo;"), v29);
          v30 = objc_claimAutoreleasedReturnValue();
          organization = v3->_organization;
          v3->_organization = (NSString *)v30;
        }
        else
        {
          organization = v3->_organization;
          v3->_organization = (NSString *)&stru_1E3CC53C8;
        }

      }
    }
    -[NEFilterBlockPage page](v3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v32, "dataUsingEncoding:", 4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v33, "copy");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, CFSTR("PageData"));

      if (objc_getProperty(a1, v35, 160, 1))
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_getProperty(a1, v36, 160, 1), CFSTR("RemediationURL"));
    }
    else
    {
      v14 = 0;
    }

    return v14;
  }
  if (!objc_getProperty(a1, v2, 152, 1))
  {
LABEL_17:
    v14 = 0;
    return v14;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(a1, "url");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_getProperty(a1, v19, 152, 1);
    v21 = v18;
    v22 = v20;
    v23 = &stru_1E3CC53C8;
    if ((objc_msgSend(v21, "containsString:", CFSTR("?")) & 1) != 0)
    {
      v24 = CFSTR("&");
    }
    else
    {
      if (objc_msgSend(v21, "characterAtIndex:", objc_msgSend(v21, "length") - 1) != 47)
        v23 = CFSTR("/");
      v24 = CFSTR("?");
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAddingPercentEncodingWithAllowedCharacters:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@"), v21, v23, v24, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      v41 = v39;
    else
      v41 = 0;

    if (v41)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v41, CFSTR("RedirectURL"));

  }
  v42 = (void *)objc_msgSend(objc_getProperty(a1, v16, 152, 1), "copy");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v42, CFSTR("URLAppendString"));

  objc_setProperty_atomic(a1, v43, 0, 152);
  return v14;
}

void __53__NEFilterSource_finishedLoadingWithDecisionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  const char *v3;
  void *v4;
  BOOL v5;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  SEL v11;
  id v12;
  id v13;
  id v14;
  NSObject *Property;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD aBlock[5];
  id v24;
  _QWORD block[4];
  id v26;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
    v5 = v2 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    if ((*(_BYTE *)(v1 + 8) & 1) != 0 && !*(_DWORD *)(v1 + 16))
    {
      *(_QWORD *)(v1 + 24) = 1;
      Property = objc_getProperty((id)v1, v3, 144, 1);
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke;
      v19 = &unk_1E3CC46A8;
      v20 = v1;
      v21 = v4;
      dispatch_async(Property, &v16);
      v14 = v21;
    }
    else
    {
      if (!objc_getProperty((id)v1, v3, 128, 1))
      {
        v7 = objc_getProperty((id)v1, v6, 144, 1);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_2;
        block[3] = &unk_1E3CC4720;
        v26 = v4;
        dispatch_async(v7, block);

      }
      v8 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_3;
      aBlock[3] = &unk_1E3CC46A8;
      aBlock[4] = v1;
      v9 = v4;
      v24 = v9;
      v10 = _Block_copy(aBlock);
      v12 = objc_getProperty((id)v1, v11, 128, 1);
      v16 = v8;
      v17 = 3221225472;
      v18 = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_5;
      v19 = &unk_1E3CC0578;
      v20 = v1;
      v21 = v9;
      v22 = v10;
      v13 = v10;
      -[NEFilterSource prepareAgentForResponse:handler:](v1, v12, &v16);

      v14 = v24;
    }

  }
}

uint64_t __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "status"), 0);
}

uint64_t __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_3(uint64_t a1, const char *a2)
{
  void *v3;
  NSObject *Property;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    Property = objc_getProperty(v3, a2, 144, 1);
    v5 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = 0;
    Property = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_4;
  v6[3] = &unk_1E3CC46A8;
  v6[4] = v5;
  v7 = *(id *)(a1 + 40);
  dispatch_async(Property, v6);

}

void __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  uint64_t v5;
  int v6;
  const char *v7;
  id v8;
  xpc_object_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *Property;
  id v17;
  NSObject *v18;
  const char *v19;
  id v20;
  id v21;
  unsigned int length;
  _QWORD length_4[5];
  id v24;
  uint8_t buf[4];
  id v26;
  _OWORD bytes[2];
  unsigned __int8 uuid[8];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    goto LABEL_16;
  v6 = *(_DWORD *)(v5 + 16);
  if (!v4 || !v6)
  {
    if (v6)
    {
      v14 = 2;
LABEL_17:
      *(_QWORD *)(v5 + 24) = v14;
      v15 = *(void **)(a1 + 32);
      if (v15)
        Property = objc_getProperty(v15, v3, 144, 1);
      else
        Property = 0;
      length_4[0] = MEMORY[0x1E0C809B0];
      length_4[1] = 3221225472;
      length_4[2] = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_6;
      length_4[3] = &unk_1E3CC46A8;
      v17 = *(id *)(a1 + 40);
      length_4[4] = *(_QWORD *)(a1 + 32);
      v24 = v17;
      dispatch_async(Property, length_4);

      goto LABEL_23;
    }
LABEL_16:
    v14 = 1;
    goto LABEL_17;
  }
  if (objc_msgSend((id)v5, "status") == 3)
  {
    *(_QWORD *)uuid = 0;
    v29 = 0;
    v8 = *(id *)(a1 + 32);
    if (v8)
      v8 = objc_getProperty(v8, v7, 80, 1);
    objc_msgSend(v8, "getUUIDBytes:", uuid);
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "command", 4);
    xpc_dictionary_set_uuid(v9, "flow-uuid", uuid);
    xpc_dictionary_set_int64(v9, "direction", 2);
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      v11 = *(_QWORD *)(v10 + 200);
    else
      v11 = 0;
    xpc_dictionary_set_int64(v9, "byte-count-inbound", v11);
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      v13 = *(_QWORD *)(v12 + 208);
    else
      v13 = 0;
    xpc_dictionary_set_int64(v9, "byte-count-outbound", v13);
    memset(bytes, 0, sizeof(bytes));
    length = 0;
    if (-[NEFilterSource generateCryptoSignature:length:](*(_QWORD **)(a1 + 32), (const char *)bytes, &length))
    {
      xpc_dictionary_set_data(v9, "crypto-signature", bytes, length);
    }
    else
    {
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = *(id *)(a1 + 32);
        if (v20)
          v20 = objc_getProperty(v20, v19, 80, 1);
        *(_DWORD *)buf = 138412290;
        v26 = v20;
        _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "NEFilterSource failed to sign data complete message for %@", buf, 0xCu);
      }

    }
    v21 = *(id *)(a1 + 48);
    ne_filter_send_message();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_23:

}

- (void)prepareAgentForResponse:(void *)a3 handler:
{
  id v5;
  id v6;
  void *v7;
  SEL v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  SEL v27;
  SEL v28;
  void *v29;
  void *v30;
  SEL v31;
  SEL v32;
  void *v33;
  void *v34;
  SEL v35;
  id v36;
  SEL v37;
  id v38;
  SEL v39;
  id v40;
  SEL v41;
  id Property;
  id v43;
  uint8_t buf[4];
  int v45;
  _OWORD buffer[3];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic((id)a1, v8, v6, 128);

    objc_msgSend((id)a1, "setUrl:", v7);
    if ((*(_BYTE *)(a1 + 8) & 1) == 0)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
      objc_msgSend(v9, "setUrl:", v7);
      objc_msgSend(v9, "setPid:", objc_msgSend((id)a1, "sourceAppPid"));
      objc_msgSend((id)a1, "sourceAppIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.SafariViewService")))
      {
        v11 = objc_msgSend(v9, "pid");

        if (v11 >= 1)
          objc_msgSend((id)a1, "setSourceAppIdentifier:", 0);
      }
      else
      {

      }
      objc_msgSend((id)a1, "sourceAppIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSourceApplicationWithBundleID:", v12);

      if (!objc_msgSend(v9, "pid"))
      {
        objc_msgSend(v9, "effectiveBundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          ne_log_obj();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(buffer[0]) = 0;
            _os_log_debug_impl(&dword_19BD16000, v14, OS_LOG_TYPE_DEBUG, "WebKit did not give us any information", (uint8_t *)buffer, 2u);
          }

        }
      }
      if ((int)objc_msgSend((id)a1, "sourceAppPid") >= 1)
      {
        v15 = objc_msgSend((id)a1, "sourceAppPid");
        if (v15 != getpid())
        {
          v47 = 0;
          memset(buffer, 0, sizeof(buffer));
          if (proc_pidinfo(objc_msgSend((id)a1, "sourceAppPid"), 17, 1uLL, buffer, 56) == 56)
          {
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", buffer);
            objc_msgSend(v9, "setProcessUUID:", v16);

            v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", buffer);
            objc_msgSend(v9, "setEffectiveProcessUUID:", v17);
          }
          else
          {
            ne_log_obj();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              v45 = objc_msgSend((id)a1, "sourceAppPid");
              _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to UUID", buf, 8u);
            }
          }

        }
      }
      objc_msgSend(v7, "host");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v7, "port");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)MEMORY[0x1E0CCEC80];
          objc_msgSend(v7, "host");
          v43 = v5;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "port");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "endpointWithHostname:port:", v22, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = v43;
        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        v25 = 0;
      }

      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCECB0]), "initWithEndpoint:parameters:", v25, v9);
      objc_setProperty_atomic((id)a1, v27, v26, 72);

      objc_msgSend(objc_getProperty((id)a1, v28, 72, 1), "path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "clientID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic((id)a1, v31, v30, 80);

      objc_msgSend(objc_getProperty((id)a1, v32, 72, 1), "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a1 + 16) = objc_msgSend(v33, "filterControlUnit");

    }
    objc_msgSend((id)a1, "url");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_getProperty((id)a1, v35, 136, 1);
    v38 = objc_getProperty((id)a1, v37, 128, 1);
    v40 = objc_getProperty((id)a1, v39, 184, 1);
    Property = objc_getProperty((id)a1, v41, 80, 1);
    -[NEFilterSource prepareAgentForURL:urlRequest:urlResponse:parentURL:direction:flowUUID:handler:](a1, v34, v36, v38, v40, 2, Property, v5);

  }
}

- (void)prepareAgentForURL:(void *)a3 urlRequest:(void *)a4 urlResponse:(void *)a5 parentURL:(uint64_t)a6 direction:(void *)a7 flowUUID:(void *)a8 handler:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD, _QWORD);
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint8_t buf[16];

  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = (void (**)(_QWORD, _QWORD))v20;
  if (v20)
  {
    v22 = *(unsigned int *)(a1 + 16);
    if ((_DWORD)v22)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __97__NEFilterSource_prepareAgentForURL_urlRequest_urlResponse_parentURL_direction_flowUUID_handler___block_invoke;
      v24[3] = &unk_1E3CC0528;
      v24[4] = a1;
      v30 = v20;
      v25 = v19;
      v26 = v15;
      v27 = v18;
      v28 = v16;
      v29 = v17;
      v31 = a6;
      -[NEFilterSource connectToFilterUnit:withCompletionHandler:](a1, v22, v24);

    }
    else
    {
      *(_QWORD *)(a1 + 24) = 1;
      ne_log_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEBUG, "prepareAgentForURL: controlUnit = 0, skipping content filtering", buf, 2u);
      }

      v21[2](v21, 0);
    }
  }

}

void __97__NEFilterSource_prepareAgentForURL_urlRequest_urlResponse_parentURL_direction_flowUUID_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  xpc_object_t v5;
  id v6;
  void *v7;
  id v8;
  pid_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (*v16)(void);
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  unsigned int length;
  int length_4;
  uint64_t v26;
  _OWORD bytes[2];
  unsigned __int8 uuid[8];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v3)
  {
    *(_QWORD *)(v4 + 24) = 2;
    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
LABEL_18:
    v16();
    goto LABEL_25;
  }
  if (v4 && (*(_BYTE *)(v4 + 8) & 1) != 0)
  {
    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
    goto LABEL_18;
  }
  *(_QWORD *)uuid = 0;
  v29 = 0;
  objc_msgSend(*(id *)(a1 + 40), "getUUIDBytes:", uuid);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "command", 2);
  xpc_dictionary_set_uuid(v5, "flow-uuid", uuid);
  objc_msgSend(*(id *)(a1 + 48), "absoluteString");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v5, "url", (const char *)objc_msgSend(v6, "UTF8String"));

  objc_msgSend(*(id *)(a1 + 32), "sourceAppIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceAppIdentifier");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v5, "source-app-bundle-id", (const char *)objc_msgSend(v8, "UTF8String"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "sourceAppPid"))
    xpc_dictionary_set_uint64(v5, "source-app-pid", (int)objc_msgSend(*(id *)(a1 + 32), "sourceAppPid"));
  v9 = getpid();
  xpc_dictionary_set_uint64(v5, "source-pid", v9);
  v10 = *(void **)(a1 + 56);
  if (v10)
  {
    objc_msgSend(v10, "absoluteString");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v5, "parent-url", (const char *)objc_msgSend(v11, "UTF8String"));

  }
  if (*(_QWORD *)(a1 + 64))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v12, "encodeObject:forKey:", *(_QWORD *)(a1 + 64), CFSTR("URL_Request"));
    objc_msgSend(v12, "finishEncoding");
    objc_msgSend(v12, "encodedData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_data(v5, "url-request", (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

  }
  if (*(_QWORD *)(a1 + 72))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v14, "encodeObject:forKey:", *(_QWORD *)(a1 + 72), CFSTR("URL_Response"));
    objc_msgSend(v14, "finishEncoding");
    objc_msgSend(v14, "encodedData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_data(v5, "url-response", (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));

  }
  xpc_dictionary_set_int64(v5, "direction", *(_QWORD *)(a1 + 88));
  xpc_dictionary_set_uint64(v5, "connection-direction", 1uLL);
  xpc_dictionary_set_uint64(v5, "socket-identifier", objc_msgSend(*(id *)(a1 + 32), "socketIdentifier"));
  memset(bytes, 0, sizeof(bytes));
  length = 0;
  if (-[NEFilterSource generateCryptoSignature:length:](*(_QWORD **)(a1 + 32), (const char *)bytes, &length))
  {
    xpc_dictionary_set_data(v5, "crypto-signature", bytes, length);
  }
  else
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 40);
      length_4 = 138412290;
      v26 = v20;
      _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "NEFilterSource failed to sign new flow message for %@", (uint8_t *)&length_4, 0xCu);
    }

  }
  ne_log_obj();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = *(_QWORD *)(a1 + 40);
    length_4 = 138412290;
    v26 = v19;
    _os_log_debug_impl(&dword_19BD16000, v18, OS_LOG_TYPE_DEBUG, "NEFilterSource send new flow %@", (uint8_t *)&length_4, 0xCu);
  }

  v21 = *(id *)(a1 + 40);
  v23 = *(id *)(a1 + 80);
  v22 = v3;
  ne_filter_send_message();

LABEL_25:
}

- (uint64_t)generateCryptoSignature:(_DWORD *)a3 length:
{
  uint64_t v3;
  uint64_t v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  if (a2 && a3)
  {
    objc_msgSend(objc_getProperty(a1, a2, 80, 1), "getUUIDBytes:", &v16);
    DWORD2(v17) = 1;
    HIDWORD(v21) = objc_msgSend(a1, "sourceAppPid");
    DWORD2(v21) = getpid();
    v6 = a1[26];
    *(_QWORD *)&v24 = a1[25];
    *((_QWORD *)&v24 + 1) = v6;
    objc_msgSend(a1, "sourceAppIdentifier");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");

    objc_msgSend(a1, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");

    *a3 = 32;
    if (v8)
    {
      strlen(v8);
      if (!v11)
      {
LABEL_8:
        v3 = ne_filter_sign_data();
        ne_log_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if ((v3 & 1) != 0)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEBUG, "generateCryptoSignature: signed flow message", buf, 2u);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "generateCryptoSignature: Failed to sign flow message", buf, 2u);
        }

        return v3;
      }
    }
    else if (!v11)
    {
      goto LABEL_8;
    }
    strlen(v11);
    goto LABEL_8;
  }
  return v3;
}

void __97__NEFilterSource_prepareAgentForURL_urlRequest_urlResponse_parentURL_direction_flowUUID_handler___block_invoke_19(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *string;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  id Property;
  uint64_t v14;
  const char *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t uint64;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3 || MEMORY[0x1A1ACFDA4](v3) != MEMORY[0x1E0C812F8])
  {
    *(_QWORD *)(a1[4] + 24) = 2;
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v32) = 0;
      _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "NEFilterSource could not add new flow", (uint8_t *)&v32, 2u);
    }
LABEL_5:

    goto LABEL_6;
  }
  v6 = xpc_dictionary_get_BOOL(v4, "verdict-drop");
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v31 = a1[5];
    v32 = 138412546;
    v33 = v31;
    v34 = 2112;
    v35 = v4;
    _os_log_debug_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEBUG, "NEFilterSource got new-flow reply %@: %@", (uint8_t *)&v32, 0x16u);
  }

  if (v6)
  {
    *(_QWORD *)(a1[4] + 24) = 2;
    string = xpc_dictionary_get_string(v4, "remediation-url");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)a1[4];
      if (v11)
        objc_setProperty_atomic(v11, v9, v10, 160);

      Property = (id)a1[4];
      if (Property)
        Property = objc_getProperty(Property, v12, 160, 1);
      if (objc_msgSend(Property, "isEqualToString:", CFSTR("x-apple-content-filter://nefilter-unblock")))
      {
        v14 = a1[4];
        if (v14)
          *(_BYTE *)(v14 + 9) = 1;
      }
    }
    v15 = xpc_dictionary_get_string(v4, "remediation-button-text");
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)a1[4];
      if (v18)
        objc_setProperty_atomic(v18, v16, v17, 168);

    }
    v19 = xpc_dictionary_get_string(v4, "organization");
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)a1[4];
      if (v22)
        objc_setProperty_atomic(v22, v20, v21, 176);

    }
  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(v4, "verdict-peek");
    v24 = a1[4];
    if (v24)
      *(_QWORD *)(v24 + 112) = uint64;
    *(_QWORD *)(a1[4] + 120) = xpc_dictionary_get_uint64(v4, "verdict-pass");
    v25 = a1[4];
    if (*(_QWORD *)(v25 + 120) == -1)
      v26 = 1;
    else
      v26 = 3;
    *(_QWORD *)(v25 + 24) = v26;
  }
  v27 = a1[4];
  if (v27)
    *(_BYTE *)(v27 + 8) = 1;
  v28 = xpc_dictionary_get_string(v4, "url-append-string");
  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v28);
    v5 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)a1[4];
    if (v30)
      objc_setProperty_atomic(v30, v29, v5, 152);
    goto LABEL_5;
  }
LABEL_6:
  (*(void (**)(void))(a1[7] + 16))();

}

uint64_t __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "status"), 0);
}

void __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  const char *string;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  id v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;
  id Property;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v5, 80, 1);
    v25 = 138412546;
    v26 = Property;
    v27 = 2112;
    v28 = v3;
    _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "NEFilterSource finishedLoadingWithDecisionHandler got inbound-data-completion reply %@: %@", (uint8_t *)&v25, 0x16u);
  }

  if (!v3 || MEMORY[0x1A1ACFDA4](v3) != MEMORY[0x1E0C812F8])
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 2;
LABEL_5:
    *(_QWORD *)(v6 + 24) = v7;
    goto LABEL_6;
  }
  v8 = xpc_dictionary_get_BOOL(v3, "verdict-drop");
  v6 = *(_QWORD *)(a1 + 32);
  if (!v8)
  {
    v7 = 1;
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 24) = 2;
  string = xpc_dictionary_get_string(v3, "remediation-url");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    if (v12)
      objc_setProperty_atomic(v12, v10, v11, 160);

    v14 = *(id *)(a1 + 32);
    if (v14)
      v14 = objc_getProperty(v14, v13, 160, 1);
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("x-apple-content-filter://nefilter-unblock")))
    {
      v15 = *(_QWORD *)(a1 + 32);
      if (v15)
        *(_BYTE *)(v15 + 9) = 1;
    }
  }
  v16 = xpc_dictionary_get_string(v3, "remediation-button-text");
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(a1 + 32);
    if (v19)
      objc_setProperty_atomic(v19, v17, v18, 168);

  }
  v20 = xpc_dictionary_get_string(v3, "organization");
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(void **)(a1 + 32);
    if (v23)
      objc_setProperty_atomic(v23, v21, v22, 176);

  }
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_4(uint64_t a1, const char *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, 0, 128);
    v3 = *(void **)(a1 + 32);
  }
  v4 = *(_QWORD *)(a1 + 40);
  v5 = objc_msgSend(v3, "status");
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, v5, v6);

}

uint64_t __47__NEFilterSource_receivedData_decisionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "status"), 0);
}

uint64_t __47__NEFilterSource_receivedData_decisionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__NEFilterSource_receivedData_decisionHandler___block_invoke_3(uint64_t a1, const char *a2)
{
  void *v3;
  NSObject *Property;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    Property = objc_getProperty(v3, a2, 144, 1);
    v5 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = 0;
    Property = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_4;
  v6[3] = &unk_1E3CC46A8;
  v6[4] = v5;
  v7 = *(id *)(a1 + 40);
  dispatch_async(Property, v6);

}

void __47__NEFilterSource_receivedData_decisionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  uint64_t v5;
  int v6;
  const char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *Property;
  id v16;
  const char *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[5];
  id v22;

  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    goto LABEL_15;
  v6 = *(_DWORD *)(v5 + 16);
  if (!v4 || !v6)
  {
    if (v6)
    {
      v13 = 2;
LABEL_16:
      *(_QWORD *)(v5 + 24) = v13;
      v14 = *(void **)(a1 + 32);
      if (v14)
        Property = objc_getProperty(v14, v3, 144, 1);
      else
        Property = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_6;
      block[3] = &unk_1E3CC46A8;
      v16 = *(id *)(a1 + 48);
      block[4] = *(_QWORD *)(a1 + 32);
      v22 = v16;
      dispatch_async(Property, block);
      v18 = *(NSObject **)(a1 + 32);
      if (v18)
        v18 = objc_getProperty(v18, v17, 216, 1);
      dispatch_group_leave(v18);
      v12 = v22;
      goto LABEL_21;
    }
LABEL_15:
    v13 = 1;
    goto LABEL_16;
  }
  if (objc_msgSend((id)v5, "status") == 3)
  {
    v8 = *(id *)(a1 + 32);
    if (v8)
      v8 = objc_getProperty(v8, v7, 64, 1);
    objc_msgSend(v8, "appendData:", *(_QWORD *)(a1 + 40));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = objc_msgSend(*(id *)(a1 + 40), "length");
    if (v9)
      *(_QWORD *)(v9 + 200) += v10;
    v11 = *(_QWORD *)(a1 + 32);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_7;
    v19[3] = &unk_1E3CC4720;
    v20 = *(id *)(a1 + 56);
    if ((-[NEFilterSource sendDataToPluginWithConnection:completionHandler:](v11, v4, v19) & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v12 = v20;
LABEL_21:

    goto LABEL_22;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_22:

}

uint64_t __47__NEFilterSource_receivedData_decisionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "status"), 0);
}

uint64_t __47__NEFilterSource_receivedData_decisionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (uint64_t)sendDataToPluginWithConnection:(void *)a3 completionHandler:
{
  id v5;
  const char *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  SEL v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  size_t v17;
  NSObject *v18;
  xpc_object_t v19;
  SEL v20;
  const void *v21;
  SEL v22;
  void *v23;
  SEL v24;
  void *v25;
  id v27;
  id v28;
  uint8_t buf[8];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (!a1)
    goto LABEL_22;
  if (*(_QWORD *)(a1 + 120) == -1
    || !objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "length")
    || (v8 = *(_QWORD *)(a1 + 120),
        v9 = *(_QWORD *)(a1 + 104),
        v8 >= objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "length") + v9))
  {
    v12 = objc_getProperty((id)a1, v6, 64, 1);
    objc_msgSend(v12, "replaceBytesInRange:withBytes:length:", 0, objc_msgSend(objc_getProperty((id)a1, v13, 64, 1), "length"), 0, 0);

    goto LABEL_8;
  }
  v10 = *(_QWORD *)(a1 + 120);
  v11 = *(_QWORD *)(a1 + 104);
  if (v10 > v11)
  {
    objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "replaceBytesInRange:withBytes:length:", 0, v10 - v11, 0, 0);
LABEL_8:
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a1 + 120);
  }
  v14 = objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "length");
  v16 = *(_QWORD *)(a1 + 104);
  if (v14 >= *(_QWORD *)(a1 + 112) - v16)
    v17 = *(_QWORD *)(a1 + 112) - v16;
  else
    v17 = v14;
  if (*(_QWORD *)(a1 + 88) == v16 && *(_QWORD *)(a1 + 96) == v17)
  {
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, v18, OS_LOG_TYPE_INFO, "Duplicate request made.", buf, 2u);
    }

    goto LABEL_21;
  }
  *(_QWORD *)(a1 + 88) = v16;
  *(_QWORD *)(a1 + 96) = v17;
  if (!v17)
  {
LABEL_21:
    a1 = 0;
    goto LABEL_22;
  }
  *(_QWORD *)buf = 0;
  v30 = 0;
  objc_msgSend(objc_getProperty((id)a1, v15, 80, 1), "getUUIDBytes:", buf);
  v19 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v19, "command", 3);
  xpc_dictionary_set_uuid(v19, "flow-uuid", buf);
  v21 = (const void *)objc_msgSend(objc_retainAutorelease(objc_getProperty((id)a1, v20, 64, 1)), "bytes");
  xpc_dictionary_set_data(v19, "data", v21, v17);
  xpc_dictionary_set_uint64(v19, "data-start-offset", *(_QWORD *)(a1 + 104));
  xpc_dictionary_set_int64(v19, "direction", 2);
  if (objc_getProperty((id)a1, v22, 128, 1))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v23, "encodeObject:forKey:", objc_getProperty((id)a1, v24, 128, 1), CFSTR("URL_Response"));
    objc_msgSend(v23, "finishEncoding");
    objc_msgSend(v23, "encodedData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_data(v19, "url-response", (const void *)objc_msgSend(v25, "bytes"), objc_msgSend(v25, "length"));

  }
  v27 = v5;
  v28 = v7;
  ne_filter_send_message();

  a1 = 1;
LABEL_22:

  return a1;
}

void __67__NEFilterSource_sendDataToPluginWithConnection_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *string;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t uint64;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id Property;
  int v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    Property = (id)a1[4];
    if (Property)
      Property = objc_getProperty(Property, v5, 80, 1);
    v28 = 138412546;
    v29 = Property;
    v30 = 2112;
    v31 = v3;
    _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "NEFilterSource got send-inbound-data reply %@: %@", (uint8_t *)&v28, 0x16u);
  }

  if (v3 && MEMORY[0x1A1ACFDA4](v3) == MEMORY[0x1E0C812F8])
  {
    if (xpc_dictionary_get_BOOL(v3, "verdict-drop"))
    {
      *(_QWORD *)(a1[4] + 24) = 2;
      string = xpc_dictionary_get_string(v3, "remediation-url");
      if (string)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)a1[4];
        if (v11)
          objc_setProperty_atomic(v11, v9, v10, 160);

        v13 = (id)a1[4];
        if (v13)
          v13 = objc_getProperty(v13, v12, 160, 1);
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("x-apple-content-filter://nefilter-unblock")))
        {
          v14 = a1[4];
          if (v14)
            *(_BYTE *)(v14 + 9) = 1;
        }
      }
      v15 = xpc_dictionary_get_string(v3, "remediation-button-text");
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)a1[4];
        if (v18)
          objc_setProperty_atomic(v18, v16, v17, 168);

      }
      v19 = xpc_dictionary_get_string(v3, "organization");
      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)a1[4];
        if (v22)
          objc_setProperty_atomic(v22, v20, v21, 176);

      }
      goto LABEL_6;
    }
    uint64 = xpc_dictionary_get_uint64(v3, "verdict-peek");
    v24 = a1[4];
    if (v24)
      *(_QWORD *)(v24 + 112) = uint64;
    v25 = xpc_dictionary_get_uint64(v3, "verdict-pass");
    v6 = a1[4];
    v26 = *(_QWORD *)(v6 + 120);
    if (v25 > v26)
    {
      *(_QWORD *)(v6 + 120) = v25;
      v6 = a1[4];
      v26 = *(_QWORD *)(v6 + 120);
    }
    if (v26 != -1)
    {
      *(_QWORD *)(v6 + 24) = 3;
      if ((-[NEFilterSource sendDataToPluginWithConnection:completionHandler:](a1[4], a1[5], a1[6]) & 1) != 0)
        goto LABEL_7;
      goto LABEL_6;
    }
    v7 = 1;
  }
  else
  {
    v6 = a1[4];
    v7 = 2;
  }
  *(_QWORD *)(v6 + 24) = v7;
LABEL_6:
  (*(void (**)(void))(a1[6] + 16))();
LABEL_7:

}

void __47__NEFilterSource_receivedData_decisionHandler___block_invoke_4(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  NSObject *Property;

  v3 = objc_msgSend(*(id *)(a1 + 32), "status");
  v4 = *(void **)(a1 + 32);
  if (v3 != 3 && v4)
  {
    objc_setProperty_atomic(v4, v2, 0, 128);
    v4 = *(void **)(a1 + 32);
  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(v4, "status");
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

  Property = *(NSObject **)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v8, 216, 1);
  dispatch_group_leave(Property);
}

void __51__NEFilterSource_receivedResponse_decisionHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  NSObject *Property;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    Property = objc_getProperty(v3, a2, 144, 1);
    v5 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = 0;
    Property = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__NEFilterSource_receivedResponse_decisionHandler___block_invoke_2;
  v6[3] = &unk_1E3CC46A8;
  v6[4] = v5;
  v7 = *(id *)(a1 + 40);
  dispatch_async(Property, v6);

}

void __51__NEFilterSource_receivedResponse_decisionHandler___block_invoke_2(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = objc_msgSend(*(id *)(a1 + 32), "status");
  v4 = *(void **)(a1 + 32);
  if (v3 != 3 && v4)
  {
    objc_setProperty_atomic(v4, v2, 0, 128);
    v4 = *(void **)(a1 + 32);
  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(v4, "status");
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);

}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;
  id v5;
  void *v6;
  SEL v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  SEL v27;
  SEL v28;
  void *v29;
  void *v30;
  SEL v31;
  SEL v32;
  void *v33;
  SEL v34;
  void *v35;
  void *v36;
  SEL v37;
  id v38;
  SEL v39;
  id v40;
  SEL v41;
  id v42;
  SEL v43;
  id Property;
  int v45;
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  uint8_t buf[4];
  int v51;
  _OWORD buffer[3];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_2;
  v48[3] = &unk_1E3CC0858;
  v48[4] = v2;
  v3 = *(id *)(a1 + 48);
  v49 = v3;
  if (v2)
  {
    v4 = v48;
    v5 = v1;
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic((id)v2, v7, 0, 128);
    v8 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
    objc_msgSend(v8, "setUrl:", v6);
    objc_msgSend(v8, "setPid:", objc_msgSend((id)v2, "sourceAppPid"));
    objc_msgSend((id)v2, "sourceAppIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.SafariViewService")))
    {
      v10 = objc_msgSend(v8, "pid");

      if (v10 >= 1)
        objc_msgSend((id)v2, "setSourceAppIdentifier:", 0);
    }
    else
    {

    }
    objc_msgSend((id)v2, "sourceAppIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSourceApplicationWithBundleID:", v11);

    if (!objc_msgSend(v8, "pid"))
    {
      objc_msgSend(v8, "effectiveBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        ne_log_obj();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buffer[0]) = 0;
          _os_log_debug_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEBUG, "WebKit did not give us any information", (uint8_t *)buffer, 2u);
        }

      }
    }
    if ((int)objc_msgSend((id)v2, "sourceAppPid") >= 1)
    {
      v14 = objc_msgSend((id)v2, "sourceAppPid");
      if (v14 != getpid())
      {
        v53 = 0;
        memset(buffer, 0, sizeof(buffer));
        if (proc_pidinfo(objc_msgSend((id)v2, "sourceAppPid"), 17, 1uLL, buffer, 56) == 56)
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", buffer);
          objc_msgSend(v8, "setProcessUUID:", v15);

          v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", buffer);
          objc_msgSend(v8, "setEffectiveProcessUUID:", v16);
        }
        else
        {
          ne_log_obj();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v45 = objc_msgSend((id)v2, "sourceAppPid");
            *(_DWORD *)buf = 67109120;
            v51 = v45;
            _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to UUID", buf, 8u);
          }
        }

      }
    }
    objc_msgSend(v6, "host");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v47 = v5;
      objc_msgSend(v6, "port");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)MEMORY[0x1E0CCEC80];
        objc_msgSend(v6, "host");
        v46 = v8;
        v21 = v4;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "port");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "endpointWithHostname:port:", v22, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v21;
        v8 = v46;
      }
      else
      {
        v25 = 0;
      }

      v5 = v47;
    }
    else
    {
      v25 = 0;
    }

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCECB0]), "initWithEndpoint:parameters:", v25, v8);
    objc_setProperty_atomic((id)v2, v27, v26, 72);

    objc_msgSend(objc_getProperty((id)v2, v28, 72, 1), "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "clientID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic((id)v2, v31, v30, 80);

    objc_setProperty_atomic((id)v2, v32, v5, 136);
    objc_msgSend(v5, "HTTPBody");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(v2 + 208) += objc_msgSend(v33, "length");
    objc_msgSend((id)v2, "setUrl:", v6);
    objc_msgSend(objc_getProperty((id)v2, v34, 72, 1), "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v2 + 16) = objc_msgSend(v35, "filterControlUnit");

    objc_msgSend((id)v2, "url");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_getProperty((id)v2, v37, 136, 1);
    v40 = objc_getProperty((id)v2, v39, 128, 1);
    v42 = objc_getProperty((id)v2, v41, 184, 1);
    Property = objc_getProperty((id)v2, v43, 80, 1);
    -[NEFilterSource prepareAgentForURL:urlRequest:urlResponse:parentURL:direction:flowUUID:handler:](v2, v36, v38, v40, v42, 1, Property, v4);

    v3 = v49;
  }

}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_4(uint64_t a1, const char *a2)
{
  void *v3;
  NSObject *Property;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    Property = objc_getProperty(v3, a2, 144, 1);
    v5 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = 0;
    Property = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_5;
  v6[3] = &unk_1E3CC46A8;
  v6[4] = v5;
  v7 = *(id *)(a1 + 40);
  dispatch_async(Property, v6);

}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_6(id *a1, void *a2)
{
  const char *v3;
  id v4;
  _DWORD *v5;
  int v6;
  void (**v7)(void);
  uint64_t v8;
  const char *v9;
  id v10;
  xpc_object_t v11;
  _QWORD *v12;
  int64_t v13;
  _QWORD *v14;
  int64_t v15;
  id v16;
  NSObject *Property;
  id v18;
  NSObject *v19;
  const char *v20;
  id v21;
  id v22;
  id v23;
  unsigned int length;
  _QWORD length_4[5];
  id v26;
  uint8_t buf[4];
  id v28;
  _OWORD bytes[2];
  unsigned __int8 uuid[8];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a1[4];
  if (!v5)
    goto LABEL_17;
  v6 = v5[4];
  if (!v4 || !v6)
  {
    if (v6)
    {
      v8 = 2;
LABEL_18:
      *((_QWORD *)v5 + 3) = v8;
      v16 = a1[4];
      if (v16)
        Property = objc_getProperty(v16, v3, 144, 1);
      else
        Property = 0;
      length_4[0] = MEMORY[0x1E0C809B0];
      length_4[1] = 3221225472;
      length_4[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_7;
      length_4[3] = &unk_1E3CC46A8;
      v18 = a1[5];
      length_4[4] = a1[4];
      v26 = v18;
      dispatch_async(Property, length_4);

      goto LABEL_26;
    }
LABEL_17:
    v8 = 1;
    goto LABEL_18;
  }
  if (objc_msgSend(v5, "status") == 2)
  {
    v7 = (void (**)(void))a1[6];
LABEL_22:
    v7[2]();
    goto LABEL_26;
  }
  if (objc_msgSend(a1[4], "status") != 3)
  {
    v7 = (void (**)(void))a1[7];
    goto LABEL_22;
  }
  *(_QWORD *)uuid = 0;
  v31 = 0;
  v10 = a1[4];
  if (v10)
    v10 = objc_getProperty(v10, v9, 80, 1);
  objc_msgSend(v10, "getUUIDBytes:", uuid);
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v11, "command", 4);
  xpc_dictionary_set_uuid(v11, "flow-uuid", uuid);
  xpc_dictionary_set_int64(v11, "direction", 2);
  v12 = a1[4];
  if (v12)
    v13 = v12[25];
  else
    v13 = 0;
  xpc_dictionary_set_int64(v11, "byte-count-inbound", v13);
  v14 = a1[4];
  if (v14)
    v15 = v14[26];
  else
    v15 = 0;
  xpc_dictionary_set_int64(v11, "byte-count-outbound", v15);
  memset(bytes, 0, sizeof(bytes));
  length = 0;
  if (-[NEFilterSource generateCryptoSignature:length:](a1[4], (const char *)bytes, &length))
  {
    xpc_dictionary_set_data(v11, "crypto-signature", bytes, length);
  }
  else
  {
    ne_log_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = a1[4];
      if (v21)
        v21 = objc_getProperty(v21, v20, 80, 1);
      *(_DWORD *)buf = 138412290;
      v28 = v21;
      _os_log_error_impl(&dword_19BD16000, v19, OS_LOG_TYPE_ERROR, "NEFilterSource failed to sign data complete message for %@", buf, 0xCu);
    }

  }
  v22 = a1[7];
  v23 = a1[6];
  ne_filter_send_message();

LABEL_26:
}

uint64_t __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "status"), 0);
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  const char *string;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  id v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  void *v24;
  id Property;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v5, 80, 1);
    v26 = 138412546;
    v27 = Property;
    v28 = 2112;
    v29 = v3;
    _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "NEFilterSource willSendRequest got inbound-data-completion reply %@: %@", (uint8_t *)&v26, 0x16u);
  }

  if (!v3 || MEMORY[0x1A1ACFDA4](v3) != MEMORY[0x1E0C812F8])
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 2;
LABEL_5:
    *(_QWORD *)(v6 + 24) = v7;
    goto LABEL_6;
  }
  v9 = xpc_dictionary_get_BOOL(v3, "verdict-drop");
  v6 = *(_QWORD *)(a1 + 32);
  if (!v9)
  {
    v7 = 1;
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 24) = 2;
  string = xpc_dictionary_get_string(v3, "remediation-url");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    if (v13)
      objc_setProperty_atomic(v13, v11, v12, 160);

    v15 = *(id *)(a1 + 32);
    if (v15)
      v15 = objc_getProperty(v15, v14, 160, 1);
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("x-apple-content-filter://nefilter-unblock")))
    {
      v16 = *(_QWORD *)(a1 + 32);
      if (v16)
        *(_BYTE *)(v16 + 9) = 1;
    }
  }
  v17 = xpc_dictionary_get_string(v3, "remediation-button-text");
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(a1 + 32);
    if (v20)
      objc_setProperty_atomic(v20, v18, v19, 168);

  }
  v21 = xpc_dictionary_get_string(v3, "organization");
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(void **)(a1 + 32);
    if (v24)
      objc_setProperty_atomic(v24, v22, v23, 176);

  }
LABEL_6:
  v8 = 48;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) == 1)
    v8 = 40;
  (*(void (**)(void))(*(_QWORD *)(a1 + v8) + 16))();

}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_5(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = objc_msgSend(*(id *)(a1 + 32), "status");
  v4 = *(void **)(a1 + 32);
  if (v3 != 3 && v4)
  {
    objc_setProperty_atomic(v4, v2, 0, 128);
    v4 = *(void **)(a1 + 32);
  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(v4, "status");
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);

}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_2(uint64_t a1, const char *a2)
{
  void *v3;
  NSObject *Property;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = *(void **)(a1 + 32);
  if (v3)
    Property = objc_getProperty(v3, a2, 144, 1);
  else
    Property = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_3;
  v6[3] = &unk_1E3CC46A8;
  v5 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_async(Property, v6);

}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "status");
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

}

- (void)initGlobals
{
  dispatch_semaphore_t v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = (id)nw_context_copy_implicit_context();
  v4 = v2;
  nw_queue_context_async();
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  *(_QWORD *)(a1 + 192) = v6[3];

  _Block_object_dispose(&v5, 8);
}

intptr_t __29__NEFilterSource_initGlobals__block_invoke(uint64_t a1)
{
  void *v2;

  ne_filter_get_definition();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = nw_context_get_globals_for_protocol();

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  const char *v6;
  id Property;
  xpc_object_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  const char *v20;
  id v21;
  id v22;
  id v23;
  unsigned int length;
  _QWORD length_4[5];
  id v26;
  _QWORD block[5];
  id v28;
  uint8_t buf[4];
  id v30;
  _OWORD bytes[2];
  unsigned __int8 uuid[8];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
    goto LABEL_16;
  v5 = *(_DWORD *)(v4 + 16);
  if (!v3 || !v5)
  {
    if (v5)
    {
      v13 = 2;
LABEL_17:
      *(_QWORD *)(v4 + 24) = v13;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_2;
      block[3] = &unk_1E3CC46A8;
      v17 = *(NSObject **)(a1 + 40);
      v18 = *(id *)(a1 + 48);
      block[4] = *(_QWORD *)(a1 + 32);
      v28 = v18;
      dispatch_async(v17, block);
      v16 = v28;
      goto LABEL_18;
    }
LABEL_16:
    v13 = 1;
    goto LABEL_17;
  }
  if (objc_msgSend((id)v4, "status") != 3)
  {
    length_4[0] = MEMORY[0x1E0C809B0];
    length_4[1] = 3221225472;
    length_4[2] = __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_3;
    length_4[3] = &unk_1E3CC46A8;
    v14 = *(NSObject **)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    length_4[4] = *(_QWORD *)(a1 + 32);
    v26 = v15;
    dispatch_async(v14, length_4);
    v16 = v26;
LABEL_18:

    goto LABEL_22;
  }
  *(_QWORD *)uuid = 0;
  v33 = 0;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v6, 80, 1);
  objc_msgSend(Property, "getUUIDBytes:", uuid);
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v8, "command", 4);
  xpc_dictionary_set_uuid(v8, "flow-uuid", uuid);
  xpc_dictionary_set_int64(v8, "direction", 2);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(_QWORD *)(v9 + 200);
  else
    v10 = 0;
  xpc_dictionary_set_int64(v8, "byte-count-inbound", v10);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(_QWORD *)(v11 + 208);
  else
    v12 = 0;
  xpc_dictionary_set_int64(v8, "byte-count-outbound", v12);
  memset(bytes, 0, sizeof(bytes));
  length = 0;
  if (-[NEFilterSource generateCryptoSignature:length:](*(_QWORD **)(a1 + 32), (const char *)bytes, &length))
  {
    xpc_dictionary_set_data(v8, "crypto-signature", bytes, length);
  }
  else
  {
    ne_log_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = *(id *)(a1 + 32);
      if (v21)
        v21 = objc_getProperty(v21, v20, 80, 1);
      *(_DWORD *)buf = 138412290;
      v30 = v21;
      _os_log_error_impl(&dword_19BD16000, v19, OS_LOG_TYPE_ERROR, "NEFilterSource failed to sign data complete message for %@", buf, 0xCu);
    }

  }
  v22 = *(id *)(a1 + 40);
  v23 = *(id *)(a1 + 48);
  ne_filter_send_message();

LABEL_22:
}

- (void)prepareAgentWithHandler:(void *)a1
{
  id v3;
  SEL v4;
  id v5;
  SEL v6;
  id v7;
  SEL v8;
  id v9;
  uint64_t v10;
  SEL v11;
  id Property;
  id v13;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "url");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_getProperty(a1, v4, 136, 1);
    v7 = objc_getProperty(a1, v6, 128, 1);
    v9 = objc_getProperty(a1, v8, 184, 1);
    v10 = objc_msgSend(a1, "direction");
    Property = objc_getProperty(a1, v11, 80, 1);
    -[NEFilterSource prepareAgentForURL:urlRequest:urlResponse:parentURL:direction:flowUUID:handler:]((uint64_t)a1, v13, v5, v7, v9, v10, Property, v3);

  }
}

uint64_t __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "status"), 0);
}

void __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "status");
  -[NEFilterSource replacementData](*(id *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

}

void __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _BOOL4 v10;
  const char *string;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  id v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  void *v25;
  id Property;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v5, 80, 1);
    *(_DWORD *)buf = 138412546;
    v30 = Property;
    v31 = 2112;
    v32 = v3;
    _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "NEFilterSource got inbound-data-completion reply %@: %@", buf, 0x16u);
  }

  if (!v3 || MEMORY[0x1A1ACFDA4](v3) != MEMORY[0x1E0C812F8])
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 2;
LABEL_5:
    *(_QWORD *)(v6 + 24) = v7;
    goto LABEL_6;
  }
  v10 = xpc_dictionary_get_BOOL(v3, "verdict-drop");
  v6 = *(_QWORD *)(a1 + 32);
  if (!v10)
  {
    v7 = 1;
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 24) = 2;
  string = xpc_dictionary_get_string(v3, "remediation-url");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 32);
    if (v14)
      objc_setProperty_atomic(v14, v12, v13, 160);

    v16 = *(id *)(a1 + 32);
    if (v16)
      v16 = objc_getProperty(v16, v15, 160, 1);
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("x-apple-content-filter://nefilter-unblock")))
    {
      v17 = *(_QWORD *)(a1 + 32);
      if (v17)
        *(_BYTE *)(v17 + 9) = 1;
    }
  }
  v18 = xpc_dictionary_get_string(v3, "remediation-button-text");
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(a1 + 32);
    if (v21)
      objc_setProperty_atomic(v21, v19, v20, 168);

  }
  v22 = xpc_dictionary_get_string(v3, "organization");
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(a1 + 32);
    if (v25)
      objc_setProperty_atomic(v25, v23, v24, 176);

  }
LABEL_6:
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_68;
  v27[3] = &unk_1E3CC46A8;
  v8 = *(NSObject **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v27[4] = *(_QWORD *)(a1 + 32);
  v28 = v9;
  dispatch_async(v8, v27);

}

void __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "status");
  -[NEFilterSource replacementData](*(id *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

}

- (id)replacementData
{
  id v1;
  NEFilterBlockPage *v2;
  void *v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (a1)
  {
    if (objc_msgSend(a1, "status") == 2)
    {
      v2 = objc_alloc_init(NEFilterBlockPage);
      objc_msgSend(v1, "url");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "absoluteString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
        objc_setProperty_atomic_copy(v2, v4, v5, 24);

      -[NEFilterBlockPage page](v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = v6;
        objc_msgSend(v6, "dataUsingEncoding:", 4);
        v1 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v1 = 0;
      }

    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

void __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  id v7;
  const char *v8;
  void *v9;
  id Property;
  id *v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  NSObject *v15;
  id v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  _QWORD v22[2];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD block[5];
  id v27;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
    goto LABEL_13;
  v5 = *(_DWORD *)(v4 + 16);
  if (!v3 || !v5)
  {
    if (v5)
    {
      v14 = 2;
LABEL_14:
      *(_QWORD *)(v4 + 24) = v14;
      v15 = *(NSObject **)(a1 + 40);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_2;
      block[3] = &unk_1E3CC46A8;
      v11 = &v27;
      v18 = *(id *)(a1 + 56);
      block[4] = *(_QWORD *)(a1 + 32);
      v27 = v18;
      v17 = block;
      goto LABEL_15;
    }
LABEL_13:
    v14 = 1;
    goto LABEL_14;
  }
  if (objc_msgSend((id)v4, "status") != 3)
  {
    v15 = *(NSObject **)(a1 + 40);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_3;
    v24[3] = &unk_1E3CC46A8;
    v11 = &v25;
    v16 = *(id *)(a1 + 56);
    v24[4] = *(_QWORD *)(a1 + 32);
    v25 = v16;
    v17 = v24;
LABEL_15:
    dispatch_async(v15, v17);
    goto LABEL_16;
  }
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_4;
  aBlock[3] = &unk_1E3CC3A30;
  v22[0] = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 56);
  v22[1] = *(_QWORD *)(a1 + 32);
  v23 = v7;
  v9 = _Block_copy(aBlock);
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v8, 64, 1);
  v11 = (id *)v22;
  objc_msgSend(Property, "appendData:", *(_QWORD *)(a1 + 48));
  v12 = *(_QWORD *)(a1 + 32);
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_6;
  v19[3] = &unk_1E3CC4720;
  v13 = v9;
  v20 = v13;
  if ((-[NEFilterSource sendDataToPluginWithConnection:completionHandler:](v12, v3, v19) & 1) == 0)
    v13[2](v13);

LABEL_16:
}

uint64_t __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "status"), 0);
}

void __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "status");
  -[NEFilterSource replacementData](*(id *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

}

void __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v2 = *(NSObject **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_5;
  v4[3] = &unk_1E3CC46A8;
  v3 = *(id *)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "status");
  -[NEFilterSource replacementData](*(id *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

}

@end
