@implementation NEAppProxyTCPFlow

- (NEAppProxyTCPFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4
{
  id v6;
  NEAppProxyTCPFlow *v7;
  NSObject *v8;
  OS_nw_endpoint *remoteFlowEndpoint;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NEAppProxyTCPFlow;
  v7 = -[NEAppProxyFlow initWithNEFlow:queue:](&v11, sel_initWithNEFlow_queue_, a3, v6);
  if (v7)
  {
    v8 = +[NEAppProxyFlow copyRemoteEndpointFromFlow:]();
    remoteFlowEndpoint = v7->_remoteFlowEndpoint;
    v7->_remoteFlowEndpoint = (OS_nw_endpoint *)v8;

    if (!v7->_remoteFlowEndpoint)
      __assert_rtn("-[NEAppProxyTCPFlow initWithNEFlow:queue:]", "NEAppProxyTCPFlow.m", 20, "_remoteFlowEndpoint != nil");
  }

  return v7;
}

- (void)readDataWithCompletionHandler:(void *)completionHandler
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id Property;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;

  v4 = completionHandler;
  v5 = MEMORY[0x1E0C809B0];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __51__NEAppProxyTCPFlow_readDataWithCompletionHandler___block_invoke;
  v18 = &unk_1E3CBF490;
  v6 = v4;
  v19 = v6;
  v7 = NEFlowAsyncRead();
  if (v7)
  {
    v9 = v7;
    if (self)
      Property = objc_getProperty(self, v8, 40, 1);
    else
      Property = 0;
    v11 = Property;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __51__NEAppProxyTCPFlow_readDataWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E3CC3B08;
    v13 = v6;
    v14 = v9;
    dispatch_async(v11, block);

  }
}

- (void)writeData:(NSData *)data withCompletionHandler:(void *)completionHandler
{
  void *v6;
  NSData *v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  id Property;
  NSObject *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  id v18;
  NSObject *v19;
  _NEFlow *v20;
  CFHashCode v21;
  _NEFlow *flow;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  id v30;
  _QWORD block[4];
  id v32;
  uint8_t buf[4];
  CFHashCode v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = completionHandler;
  v7 = data;
  v8 = isa_nsdata(v7);
  v9 = MEMORY[0x1E0C809B0];
  if ((v8 & 1) == 0)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      if (self)
        flow = self->super._flow;
      else
        flow = 0;
      *(_DWORD *)buf = 134217984;
      v34 = CFHash(flow);
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "%lu: Data object passed is not an NSData", buf, 0xCu);
    }

    if (self)
      Property = objc_getProperty(self, v11, 40, 1);
    else
      Property = 0;
    v13 = Property;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke;
    block[3] = &unk_1E3CC4720;
    v32 = v6;
    dispatch_async(v13, block);

  }
  v26 = v9;
  v27 = 3221225472;
  v28 = __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke_2;
  v29 = &unk_1E3CBF4E0;
  v14 = v6;
  v30 = v14;
  v15 = NEFlowWrite();

  if (v15)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (self)
        v20 = self->super._flow;
      else
        v20 = 0;
      v21 = CFHash(v20);
      *(_DWORD *)buf = 134217984;
      v34 = v21;
      _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "%lu: Failed to write flow Data", buf, 0xCu);
    }

    if (self)
      v18 = objc_getProperty(self, v17, 40, 1);
    else
      v18 = 0;
    v19 = v18;
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke_5;
    v23[3] = &unk_1E3CC3B08;
    v24 = v14;
    v25 = v15;
    dispatch_async(v19, v23);

  }
}

- (NWEndpoint)remoteEndpoint
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CCEC78];
  -[NEAppProxyTCPFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointWithCEndpoint:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NWEndpoint *)v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NEAppProxyFlow metaData](self, "metaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppProxyTCPFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppProxyFlow networkInterface](self, "networkInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NEAppProxyFlow isBound](self, "isBound");
  v8 = &stru_1E3CC53C8;
  if (v7)
    v8 = CFSTR("(bound)");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("TCP %@ remote: %@ interface %@%@"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (OS_nw_endpoint)remoteFlowEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteFlowEndpoint, 0);
}

void __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __51__NEAppProxyTCPFlow_readDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (v8)
    v5 = v8;
  v6 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v7);

}

void __51__NEAppProxyTCPFlow_readDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

@end
