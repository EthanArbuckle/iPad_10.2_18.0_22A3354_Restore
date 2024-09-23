@implementation COCapabilityLegacyShim

- (COCapabilityLegacyShim)initWithDelegate:(id)a3
{
  id v4;
  COCapabilityLegacyShim *v5;
  COCapabilityLegacyShim *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  void *v10;
  uint64_t v11;
  NSSet *supportedCapabilities;
  NSSet *v13;
  NSSet *availableCapabilities;
  NSSet *v15;
  NSSet *companionCapabilities;
  NSObject *v17;
  _QWORD block[4];
  COCapabilityLegacyShim *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)COCapabilityLegacyShim;
  v5 = -[COCapabilityLegacyShim init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.CoordinationCore.Capabilities.LegacyShim", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", CFSTR("com.apple.SoundBoard.capability.Krono"));
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    supportedCapabilities = v6->_supportedCapabilities;
    v6->_supportedCapabilities = (NSSet *)v11;

    v13 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    availableCapabilities = v6->_availableCapabilities;
    v6->_availableCapabilities = v13;

    v15 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    companionCapabilities = v6->_companionCapabilities;
    v6->_companionCapabilities = v15;

    *(_DWORD *)&v6->_companionQueryInProgress = 0;
    v17 = v6->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__COCapabilityLegacyShim_initWithDelegate___block_invoke;
    block[3] = &unk_24D4B0C80;
    v20 = v6;
    dispatch_async(v17, block);

  }
  return v6;
}

void __43__COCapabilityLegacyShim_initWithDelegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_rapportStart");
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__COCapabilityLegacyShim_initWithDelegate___block_invoke_2;
  block[3] = &unk_24D4B0C80;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

}

void __43__COCapabilityLegacyShim_initWithDelegate___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "availableCapabilities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_notifyDelegate:", v2);

}

- (void)dealloc
{
  objc_super v3;

  -[COCapabilityLegacyShim _rapportStop](self, "_rapportStop");
  v3.receiver = self;
  v3.super_class = (Class)COCapabilityLegacyShim;
  -[COCapabilityLegacyShim dealloc](&v3, sel_dealloc);
}

- (void)_stateUpdate
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = -[COCapabilityLegacyShim _isStereoPeerActive](self, "_isStereoPeerActive");
  COCoreLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "Legacy Shim: Stereo Pair peer is active", v8, 2u);
    }

    -[COCapabilityLegacyShim _stateQuery](self, "_stateQuery");
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "Legacy Shim: Stereo Pair peer is not active", buf, 2u);
    }

    -[COCapabilityLegacyShim setCompanionQueryNeeded:](self, "setCompanionQueryNeeded:", 0);
    -[COCapabilityLegacyShim setCompanionQueryUnsuccessful:](self, "setCompanionQueryUnsuccessful:", 0);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[COCapabilityLegacyShim setCompanionCapabilities:](self, "setCompanionCapabilities:", v6);

    -[COCapabilityLegacyShim supportedCapabilities](self, "supportedCapabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[COCapabilityLegacyShim setAvailableCapabilities:](self, "setAvailableCapabilities:", v7);

  }
}

- (void)_stateQuery
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id buf[2];

  if (-[COCapabilityLegacyShim isCompanionQueryInProgress](self, "isCompanionQueryInProgress"))
  {
    COCoreLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_INFO, "Legacy Shim: query already in progress", (uint8_t *)buf, 2u);
    }

    -[COCapabilityLegacyShim setCompanionQueryNeeded:](self, "setCompanionQueryNeeded:", 1);
  }
  else
  {
    -[COCapabilityLegacyShim setCompanionQueryNeeded:](self, "setCompanionQueryNeeded:", 0);
    -[COCapabilityLegacyShim setCompanionQueryInProgress:](self, "setCompanionQueryInProgress:", 1);
    -[COCapabilityLegacyShim setCompanionQueryIncompatible:](self, "setCompanionQueryIncompatible:", 0);
    COCoreLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "Legacy Shim: issuing query", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    -[COCapabilityLegacyShim rapport](self, "rapport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[COCapabilityLegacyShim _messageCreateRequest](self, "_messageCreateRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BE7CC88];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __37__COCapabilityLegacyShim__stateQuery__block_invoke;
    v8[3] = &unk_24D4B0CB0;
    objc_copyWeak(&v9, buf);
    objc_msgSend(v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("com.apple.SoundBoard.Capabilities"), v6, v7, 0, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

void __37__COCapabilityLegacyShim__stateQuery__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__COCapabilityLegacyShim__stateQuery__block_invoke_2;
    block[3] = &unk_24D4B08D0;
    block[4] = v9;
    v12 = v6;
    v13 = v7;
    dispatch_async(v10, block);

  }
}

uint64_t __37__COCapabilityLegacyShim__stateQuery__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rapportProcessResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rapportStart
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_215E92000, v0, v1, "Legacy Shim: starting companion link", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  id v5;
  id v6;

  COCoreLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __39__COCapabilityLegacyShim__rapportStart__block_invoke_cold_1();

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(v3);
    objc_msgSend(v5, "_rapportStop");

    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "_rapportStart");

  }
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;

  v3 = a2;
  COCoreLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __39__COCapabilityLegacyShim__rapportStart__block_invoke_16_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "_rapportEventShouldUpdateState:", v3))
    objc_msgSend(v6, "_stateUpdate");

}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;

  v3 = a2;
  COCoreLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __39__COCapabilityLegacyShim__rapportStart__block_invoke_18_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "_rapportEventShouldUpdateState:", v3))
    objc_msgSend(v6, "_stateUpdate");

}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;

  v3 = a2;
  COCoreLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __39__COCapabilityLegacyShim__rapportStart__block_invoke_19_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "_rapportEventShouldUpdateState:", v3))
    objc_msgSend(v6, "_stateUpdate");

}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    COCoreLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__COCapabilityLegacyShim__rapportStart__block_invoke_20_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_rapportRegister");
    objc_msgSend(*(id *)(a1 + 32), "_stateUpdate");
  }

}

- (void)_rapportStop
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_215E92000, v0, v1, "Legacy Shim: stopping companion link", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_rapportRegister
{
  void *v3;
  _QWORD v4[5];
  id location;

  objc_initWeak(&location, self);
  -[COCapabilityLegacyShim rapport](self, "rapport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__COCapabilityLegacyShim__rapportRegister__block_invoke;
  v4[3] = &unk_24D4B0D50;
  v4[4] = self;
  objc_msgSend(v3, "registerRequestID:options:handler:", CFSTR("com.apple.SoundBoard.Capabilities"), 0, v4);

  objc_destroyWeak(&location);
}

void __42__COCapabilityLegacyShim__rapportRegister__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a2;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v9, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__COCapabilityLegacyShim__rapportRegister__block_invoke_2;
    block[3] = &unk_24D4B0D28;
    block[4] = v9;
    v12 = v6;
    v13 = v7;
    dispatch_async(v10, block);

  }
}

uint64_t __42__COCapabilityLegacyShim__rapportRegister__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rapportProcessRequest:emittingResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rapportDeregister
{
  id v2;

  -[COCapabilityLegacyShim rapport](self, "rapport");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterRequestID:", CFSTR("com.apple.SoundBoard.Capabilities"));

}

- (BOOL)_rapportEventShouldUpdateState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  -[COCapabilityLegacyShim rapport](self, "rapport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  v8 = (v7 & 1) != 0 || -[COCapabilityLegacyShim _isStereoPeer:](self, "_isStereoPeer:", v4);
  return v8;
}

- (void)_rapportProcessRequest:(id)a3 emittingResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (!-[COCapabilityLegacyShim _messageValidateRequest:](self, "_messageValidateRequest:", v6))
  {
    COCoreLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[COCapabilityLegacyShim _rapportProcessRequest:emittingResponse:].cold.1();

  }
  -[COCapabilityLegacyShim _messageCreateResponse](self, "_messageCreateResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v9, 0, 0);

  -[COCapabilityLegacyShim queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__COCapabilityLegacyShim__rapportProcessRequest_emittingResponse___block_invoke;
  block[3] = &unk_24D4B0C80;
  block[4] = self;
  dispatch_async(v10, block);

}

uint64_t __66__COCapabilityLegacyShim__rapportProcessRequest_emittingResponse___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "isCompanionQueryNeeded") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "isCompanionQueryUnsuccessful") & 1) != 0
    || (result = objc_msgSend(*(id *)(a1 + 32), "isCompanionQueryIncompatible"), (_DWORD)result))
  {
    COCoreLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_INFO, "Legacy Shim: needs to query due to request", v4, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_stateUpdate");
  }
  return result;
}

- (void)_rapportProcessResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  dispatch_time_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _QWORD v31[4];
  id v32;
  _QWORD block[5];
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COCapabilityLegacyShim setCompanionQueryInProgress:](self, "setCompanionQueryInProgress:", 0);
  if (v6 && !v7)
  {
    if (-[COCapabilityLegacyShim _messageValidateResponse:](self, "_messageValidateResponse:", v6))
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("supported"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[COCapabilityLegacyShim _messageDecodeCapabilities:](self, "_messageDecodeCapabilities:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
        COCoreLogForCategory(5);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v11;
          _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "Legacy Shim: response has Capabilities(%@)", buf, 0xCu);
        }
      }
      else
      {
        COCoreLogForCategory(5);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[COCapabilityLegacyShim _rapportProcessResponse:error:].cold.4();
      }

      goto LABEL_25;
    }
    COCoreLogForCategory(5);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[COCapabilityLegacyShim _rapportProcessResponse:error:].cold.5();
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v7, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE7CC90]))
  {

LABEL_15:
    COCoreLogForCategory(5);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[COCapabilityLegacyShim _rapportProcessResponse:error:].cold.3();
    goto LABEL_17;
  }
  v14 = objc_msgSend(v7, "code");

  if (v14 != -6714)
    goto LABEL_15;
  COCoreLogForCategory(5);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[COCapabilityLegacyShim _rapportProcessResponse:error:].cold.2();

  -[COCapabilityLegacyShim setCompanionQueryIncompatible:](self, "setCompanionQueryIncompatible:", 1);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
  if (v10)
  {
    -[COCapabilityLegacyShim setCompanionQueryUnsuccessful:](self, "setCompanionQueryUnsuccessful:", 0);
    -[COCapabilityLegacyShim setCompanionCapabilities:](self, "setCompanionCapabilities:", v10);
    -[COCapabilityLegacyShim supportedCapabilities](self, "supportedCapabilities");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    -[COCapabilityLegacyShim companionCapabilities](self, "companionCapabilities");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "intersectSet:", v29);

    -[COCapabilityLegacyShim setAvailableCapabilities:](self, "setAvailableCapabilities:", v28);
    -[COCapabilityLegacyShim queue](self, "queue");
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__COCapabilityLegacyShim__rapportProcessResponse_error___block_invoke;
    block[3] = &unk_24D4B0C80;
    block[4] = self;
    dispatch_async(v30, block);

    goto LABEL_27;
  }
LABEL_18:
  if (!-[COCapabilityLegacyShim isCompanionQueryUnsuccessful](self, "isCompanionQueryUnsuccessful"))
  {
    -[COCapabilityLegacyShim setCompanionQueryUnsuccessful:](self, "setCompanionQueryUnsuccessful:", 1);
    COCoreLogForCategory(5);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[COCapabilityLegacyShim _rapportProcessResponse:error:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    objc_initWeak((id *)buf, self);
    v25 = dispatch_walltime(0, 120000000000);
    -[COCapabilityLegacyShim queue](self, "queue");
    v26 = objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __56__COCapabilityLegacyShim__rapportProcessResponse_error___block_invoke_23;
    v31[3] = &unk_24D4B0CD8;
    objc_copyWeak(&v32, (id *)buf);
    dispatch_after(v25, v26, v31);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
LABEL_27:

}

uint64_t __56__COCapabilityLegacyShim__rapportProcessResponse_error___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  result = objc_msgSend(*(id *)(a1 + 32), "isCompanionQueryNeeded");
  if ((_DWORD)result)
  {
    COCoreLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_INFO, "Legacy Shim: refreshing due to pending query", v4, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_stateUpdate");
  }
  return result;
}

void __56__COCapabilityLegacyShim__rapportProcessResponse_error___block_invoke_23(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained
    && ((objc_msgSend(WeakRetained, "isCompanionQueryNeeded") & 1) != 0
     || objc_msgSend(v2, "isCompanionQueryUnsuccessful")))
  {
    COCoreLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_INFO, "Legacy Shim: query still needed after delay", v4, 2u);
    }

    objc_msgSend(v2, "_stateUpdate");
  }

}

- (id)_messageCreateRequest
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("version");
  v4[0] = &unk_24D4CF350;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_messageCreateResponse
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("version");
  v5[1] = CFSTR("supported");
  v6[0] = &unk_24D4CF350;
  -[COCapabilityLegacyShim _messageEncodeCapabilities](self, "_messageEncodeCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_messageValidateRequest:(id)a3
{
  void *v3;
  float v4;
  float v5;
  NSObject *v6;
  NSObject *v7;
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
  uint64_t v21;

  objc_msgSend(a3, "objectForKey:", CFSTR("version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  COCoreLogForCategory(5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1.0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[COCapabilityLegacyShim _messageValidateRequest:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[COCapabilityLegacyShim _messageValidateRequest:].cold.2(v7, v15, v16, v17, v18, v19, v20, v21);
  }

  return v5 == 1.0;
}

- (BOOL)_messageValidateResponse:(id)a3
{
  void *v3;
  float v4;
  float v5;
  NSObject *v6;
  NSObject *v7;
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
  uint64_t v21;

  objc_msgSend(a3, "objectForKey:", CFSTR("version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  COCoreLogForCategory(5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1.0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[COCapabilityLegacyShim _messageValidateResponse:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[COCapabilityLegacyShim _messageValidateResponse:].cold.2(v7, v15, v16, v17, v18, v19, v20, v21);
  }

  return v5 == 1.0;
}

- (id)_messageEncodeCapabilities
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  id v11;

  -[COCapabilityLegacyShim supportedCapabilities](self, "supportedCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    COCoreLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[COCapabilityLegacyShim _messageEncodeCapabilities].cold.1();

    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }

  return v4;
}

- (id)_messageDecodeCapabilities:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  _QWORD v25[4];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDBCF20];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v6, v3, &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            COCoreLogForCategory(5);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              -[COCapabilityLegacyShim _messageDecodeCapabilities:].cold.2();
            goto LABEL_18;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v13)
          continue;
        break;
      }
    }

    v16 = v11;
  }
  else
  {
    COCoreLogForCategory(5);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[COCapabilityLegacyShim _messageDecodeCapabilities:].cold.1();
LABEL_18:

    v16 = 0;
  }

  return v16;
}

- (NSSet)availableCapabilities
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__COCapabilityLegacyShim_availableCapabilities__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCapabilityLegacyShim _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

void __47__COCapabilityLegacyShim_availableCapabilities__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setAvailableCapabilities:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  COCapabilityLegacyShim *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__COCapabilityLegacyShim_setAvailableCapabilities___block_invoke;
  v7[3] = &unk_24D4B08A8;
  v5 = v4;
  v8 = v5;
  v9 = self;
  v10 = &v11;
  -[COCapabilityLegacyShim _withLock:](self, "_withLock:", v7);
  if (*((_BYTE *)v12 + 24))
  {
    v6 = (void *)objc_msgSend(v5, "copy");
    -[COCapabilityLegacyShim _notifyDelegate:](self, "_notifyDelegate:", v6);

  }
  _Block_object_dispose(&v11, 8);

}

void __51__COCapabilityLegacyShim_setAvailableCapabilities___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16)) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

    COCoreLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "Legacy Shim: available Capabilities updated(%@)", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (NSSet)companionCapabilities
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__COCapabilityLegacyShim_companionCapabilities__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCapabilityLegacyShim _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

void __47__COCapabilityLegacyShim_companionCapabilities__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setCompanionCapabilities:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  COCapabilityLegacyShim *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__COCapabilityLegacyShim_setCompanionCapabilities___block_invoke;
  v6[3] = &unk_24D4B0858;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[COCapabilityLegacyShim _withLock:](self, "_withLock:", v6);

}

void __51__COCapabilityLegacyShim_setCompanionCapabilities___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v2;

    COCoreLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "Legacy Shim: companion Capabilities updated(%@)", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_notifyDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  COCapabilityLegacyShim *v11;
  id v12;

  v4 = a3;
  -[COCapabilityLegacyShim delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__COCapabilityLegacyShim__notifyDelegate___block_invoke;
    block[3] = &unk_24D4B08D0;
    v10 = v5;
    v11 = self;
    v12 = v6;
    v8 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __42__COCapabilityLegacyShim__notifyDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "legacyShim:availableCapabilitiesChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)_isStereoPairMember
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[COCapabilityLegacyShim rapport](self, "rapport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaSystemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)_isStereoPeer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (-[COCapabilityLegacyShim _isStereoPairMember](self, "_isStereoPairMember"))
  {
    -[COCapabilityLegacyShim rapport](self, "rapport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaSystemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "mediaSystemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isStereoPeerActive
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!-[COCapabilityLegacyShim _isStereoPairMember](self, "_isStereoPairMember"))
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[COCapabilityLegacyShim rapport](self, "rapport", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[COCapabilityLegacyShim rapport](self, "rapport");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "isEqual:", v11);

        if ((v12 & 1) == 0 && -[COCapabilityLegacyShim _isStereoPeer:](self, "_isStereoPeer:", v9))
        {
          v13 = 1;
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (COCapabilityLegacyShimDelegate)delegate
{
  return (COCapabilityLegacyShimDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSSet)supportedCapabilities
{
  return self->_supportedCapabilities;
}

- (BOOL)isCompanionQueryInProgress
{
  return self->_companionQueryInProgress;
}

- (void)setCompanionQueryInProgress:(BOOL)a3
{
  self->_companionQueryInProgress = a3;
}

- (BOOL)isCompanionQueryNeeded
{
  return self->_companionQueryNeeded;
}

- (void)setCompanionQueryNeeded:(BOOL)a3
{
  self->_companionQueryNeeded = a3;
}

- (BOOL)isCompanionQueryUnsuccessful
{
  return self->_companionQueryUnsuccessful;
}

- (void)setCompanionQueryUnsuccessful:(BOOL)a3
{
  self->_companionQueryUnsuccessful = a3;
}

- (BOOL)isCompanionQueryIncompatible
{
  return self->_companionQueryIncompatible;
}

- (void)setCompanionQueryIncompatible:(BOOL)a3
{
  self->_companionQueryIncompatible = a3;
}

- (RPCompanionLinkClient)rapport
{
  return self->_rapport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapport, 0);
  objc_storeStrong((id *)&self->_supportedCapabilities, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_companionCapabilities, 0);
  objc_storeStrong((id *)&self->_availableCapabilities, 0);
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_215E92000, v0, v1, "Legacy Shim: companion link invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_16_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_215E92000, v0, v1, "Legacy Shim: Rapport local device updated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_215E92000, v0, v1, "Legacy Shim: Rapport device found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_215E92000, v0, v1, "Legacy Shim: Rapport device lost", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __39__COCapabilityLegacyShim__rapportStart__block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "Legacy Shim: Rapport activation failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_rapportProcessRequest:emittingResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "Legacy Shim: received invalid request %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_rapportProcessResponse:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E92000, a1, a3, "Legacy Shim: retrying in %lu seconds", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)_rapportProcessResponse:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_215E92000, v0, v1, "Legacy Shim: response not handled - Capability check not supported by companion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_rapportProcessResponse:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_215E92000, v1, OS_LOG_TYPE_ERROR, "Legacy Shim: response missing(%@) or error(%@)", v2, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_rapportProcessResponse:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "Legacy Shim: response(%@) lacks Capabilities", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_rapportProcessResponse:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "Legacy Shim: received invalid response(%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_messageValidateRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_215E92000, a1, a3, "Legacy Shim: received request (version %f)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)_messageValidateRequest:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E92000, a1, a3, "Legacy Shim: received request with incompatible version (%f)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)_messageValidateResponse:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_215E92000, a1, a3, "Legacy Shim: received response (version %f)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)_messageValidateResponse:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E92000, a1, a3, "Legacy Shim: received response with incompatible version (%f)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)_messageEncodeCapabilities
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "Legacy Shim: failed to encode: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_messageDecodeCapabilities:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "Legacy Shim failed to decode: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_messageDecodeCapabilities:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_215E92000, v0, v1, "Legacy Shim: failed type check", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
