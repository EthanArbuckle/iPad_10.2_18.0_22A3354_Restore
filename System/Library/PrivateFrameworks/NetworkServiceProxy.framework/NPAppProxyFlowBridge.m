@implementation NPAppProxyFlowBridge

- (NPAppProxyFlowBridge)initWithAppProxyFlow:(id)a3 nwContext:(id)a4
{
  id v7;
  id v8;
  NPAppProxyFlowBridge *v9;
  uint64_t v10;
  OS_os_transaction *networkTransaction;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  SEL v14;
  uint64_t v15;
  NWEndpoint *remoteEndpoint;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NPAppProxyFlowBridge;
  v9 = -[NPAppProxyFlowBridge init](&v18, sel_init);
  if (v9)
  {
    kdebug_trace();
    v10 = os_transaction_create();
    networkTransaction = v9->_networkTransaction;
    v9->_networkTransaction = (OS_os_transaction *)v10;

    objc_storeStrong((id *)&v9->_flow, a3);
    v12 = dispatch_queue_create("NPAppProxyFlowBridge queue", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    objc_msgSend(objc_getProperty(v9, v14, 16, 1), "remoteEndpoint");
    v15 = objc_claimAutoreleasedReturnValue();
    remoteEndpoint = v9->_remoteEndpoint;
    v9->_remoteEndpoint = (NWEndpoint *)v15;

    objc_storeStrong((id *)&v9->_nwContext, a4);
    -[NPAppProxyFlowBridge startConnection]((nw_connection_t *)v9);
  }

  return v9;
}

- (void)startConnection
{
  NSObject *v2;
  SEL v3;
  id v4;
  SEL v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  _OWORD *v11;
  __int128 v12;
  void *v13;
  SEL v14;
  void *v15;
  SEL v16;
  id Property;
  id v18;
  SEL v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  NSObject *host;
  nw_connection_t v25;
  nw_connection_t v26;
  uint64_t v27;
  nw_connection_t v28;
  NSObject *v29;
  NSObject *v30;
  SEL v31;
  NSObject *v32;
  _QWORD v33[5];
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  nw_connection_t *v39;
  _OWORD v40[2];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = nw_parameters_create();
    v4 = objc_getProperty(a1, v3, 16, 1);
    objc_opt_class();
    objc_opt_isKindOfClass();

    nw_parameters_set_data_mode();
    objc_msgSend(objc_getProperty(a1, v5, 16, 1), "metaData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceAppAuditToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(objc_getProperty(a1, v8, 16, 1), "metaData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sourceAppAuditToken");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (_OWORD *)objc_msgSend(v10, "bytes");

      v12 = v11[1];
      v40[0] = *v11;
      v40[1] = v12;
      +[NPUtilities machoUUIDFromPID:](NPUtilities, "machoUUIDFromPID:", +[NPUtilities pidFromAuditToken:](NPUtilities, "pidFromAuditToken:", v40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = 0uLL;
      objc_msgSend(v13, "getUUIDBytes:", v40);
      nw_parameters_set_e_proc_uuid();

    }
    nw_parameters_set_account_id();
    nw_parameters_set_indefinite();
    nw_parameters_set_context();
    objc_msgSend(objc_getProperty(a1, v14, 16, 1), "remoteHostname");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    Property = objc_getProperty(a1, v16, 24, 1);
    if (v15)
    {
      v18 = Property;
      objc_msgSend(objc_getProperty(a1, v19, 16, 1), "remoteHostname");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (const char *)objc_msgSend(v20, "UTF8String");
      objc_msgSend(v18, "port");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_retainAutorelease(v22);
      host = nw_endpoint_create_host(v21, (const char *)objc_msgSend(v23, "UTF8String"));

    }
    else
    {
      host = objc_msgSend(Property, "copyCEndpoint");
    }
    v25 = nw_connection_create(host, v2);
    v26 = a1[4];
    a1[4] = v25;

    v27 = MEMORY[0x1E0C809B0];
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __39__NPAppProxyFlowBridge_startConnection__block_invoke;
    v38 = &unk_1E4137410;
    v39 = a1;
    nw_connection_set_cancel_handler();
    v28 = a1[4];
    v33[0] = v27;
    v33[1] = 3221225472;
    v33[2] = __39__NPAppProxyFlowBridge_startConnection__block_invoke_2;
    v33[3] = &unk_1E41380F8;
    v33[4] = a1;
    v34 = host;
    v29 = host;
    MEMORY[0x1A1AEA3A4](v28, v33);
    v30 = a1[4];
    v32 = objc_getProperty(a1, v31, 40, 1);
    nw_connection_set_queue(v30, v32);
    nw_connection_start(a1[4]);

  }
}

void __45__NPAppProxyFlowBridge_handleConnectionReady__block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  NSObject *Property;
  uint64_t v9;
  _DWORD *v10;
  const char *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hash");
      *(_DWORD *)buf = 134218242;
      v16 = v12;
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_ERROR, "Failed to open flow %lu: %@", buf, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      Property = objc_getProperty(v7, v6, 40, 1);
      v9 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v9 = 0;
      Property = 0;
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__NPAppProxyFlowBridge_handleConnectionReady__block_invoke_2;
    v13[3] = &unk_1E4137FE0;
    v13[4] = v9;
    v14 = v4;
    dispatch_async(Property, v13);

  }
  else
  {
    v10 = *(_DWORD **)(a1 + 32);
    if (v10)
    {
      -[NPAppProxyFlowBridge readDataFromClient](v10, v3);
      -[NPAppProxyFlowBridge readDataFromConnection](v10, v11);
    }
  }

}

void __45__NPAppProxyFlowBridge_handleConnectionReady__block_invoke_2(uint64_t a1)
{
  -[NPAppProxyFlowBridge closeAllWithError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)closeAllWithError:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 32);
    v6 = v3;
    if (v4)
    {
      nw_connection_cancel(v4);
      v5 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

    }
    -[NPAppProxyFlowBridge closeFlowWithError:](a1, v6);
    v3 = v6;
  }

}

- (void)readDataFromClient
{
  void *v2;
  id Property;
  _QWORD v4[5];

  if (result)
  {
    v2 = result;
    Property = objc_getProperty(result, a2, 16, 1);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __42__NPAppProxyFlowBridge_readDataFromClient__block_invoke;
    v4[3] = &unk_1E41380D0;
    v4[4] = v2;
    return (void *)objc_msgSend(Property, "readDataWithCompletionHandler:", v4);
  }
  return result;
}

- (void)readDataFromConnection
{
  const char *v3;
  NSObject *Property;
  _QWORD completion[5];

  if (a1 && objc_getProperty(a1, a2, 32, 1) && (a1[3] & 0xFFFFFFFE) != 4)
  {
    Property = objc_getProperty(a1, v3, 32, 1);
    completion[0] = MEMORY[0x1E0C809B0];
    completion[1] = 3221225472;
    completion[2] = __46__NPAppProxyFlowBridge_readDataFromConnection__block_invoke;
    completion[3] = &unk_1E4138080;
    completion[4] = a1;
    nw_connection_receive(Property, 0, 0xFFFFFFFF, completion);
  }
}

- (void)closeFlowWithError:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    v3 = *(void **)(a1 + 16);
    if (v3)
    {
      objc_msgSend(v3, "closeReadWithError:", v6);
      objc_msgSend(*(id *)(a1 + 16), "closeWriteWithError:", v6);
      v4 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

    }
    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

  }
}

- (void)writeDataToConnection:(uint64_t)a1
{
  const char *v3;
  NSObject *v4;
  const char *v5;
  int v6;
  NSObject *Property;
  NSObject *v8;
  char v9;
  _QWORD *v10;
  NSObject *v11;
  _QWORD v12[5];

  v4 = a2;
  if (a1 && objc_getProperty((id)a1, v3, 32, 1))
  {
    v6 = *(_DWORD *)(a1 + 12);
    Property = objc_getProperty((id)a1, v5, 32, 1);
    v8 = *MEMORY[0x1E0CCECF0];
    if (v6 == 3)
    {
      v9 = *(_BYTE *)(a1 + 9);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __46__NPAppProxyFlowBridge_writeDataToConnection___block_invoke;
      v12[3] = &unk_1E4138058;
      v12[4] = a1;
      v10 = v12;
      v11 = v4;
    }
    else
    {
      v10 = (_QWORD *)*MEMORY[0x1E0CCECE0];
      v11 = v4;
      v9 = 0;
    }
    nw_connection_send(Property, v11, v8, v9, v10);
  }

}

void __46__NPAppProxyFlowBridge_writeDataToConnection___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  CFErrorRef v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    v4 = nw_error_copy_cf_error(v3);
    -[NPAppProxyFlowBridge closeAllWithError:](*(_QWORD *)(a1 + 32), v4);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 9))
      -[NPAppProxyFlowBridge closeAllWithError:](v5, 0);
    else
      -[NPAppProxyFlowBridge readDataFromClient]();
  }

}

void __56__NPAppProxyFlowBridge_handleDataWriteToFlowCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (v2)
    goto LABEL_2;
  if (*(_BYTE *)(v1 + 8))
  {
    v2 = *(void **)(v1 + 56);
LABEL_2:
    -[NPAppProxyFlowBridge closeAllWithError:](v1, v2);
    return;
  }
  -[NPAppProxyFlowBridge readDataFromConnection]();
}

void __40__NPAppProxyFlowBridge_writeDataToFlow___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  id v4;
  NSObject *Property;
  _QWORD v6[4];
  id v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  if (v2)
  {
    Property = objc_getProperty(v2, v3, 40, 1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__NPAppProxyFlowBridge_handleDataWriteToFlowCompletion___block_invoke;
    v6[3] = &unk_1E4137FE0;
    v7 = v4;
    v8 = v2;
    dispatch_async(Property, v6);

  }
}

void __46__NPAppProxyFlowBridge_readDataFromConnection__block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  CFErrorRef v13;
  _BYTE *v14;
  id v15;
  SEL v16;
  id Property;
  const char *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];

  v22 = a2;
  v9 = a3;
  v10 = a5;
  v12 = v10;
  if (v10 || a4)
  {
    if (v10)
      v13 = nw_error_copy_cf_error(v10);
    else
      v13 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v13);
    if (v12)

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  }
  v14 = *(_BYTE **)(a1 + 32);
  if (v22)
  {
    if (v14)
    {
      v15 = v22;
      Property = objc_getProperty(v14, v16, 16, 1);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __40__NPAppProxyFlowBridge_writeDataToFlow___block_invoke;
      v23[3] = &unk_1E4138008;
      v23[4] = v14;
      objc_msgSend(Property, "writeData:withCompletionHandler:", v15, v23);

    }
  }
  else if (v14[8])
  {
    v19 = objc_getProperty(*(id *)(a1 + 32), v11, 16, 1);
    v20 = *(void **)(a1 + 32);
    if (v20)
      v21 = objc_getProperty(v20, v18, 56, 1);
    else
      v21 = 0;
    objc_msgSend(v19, "closeWriteWithError:", v21, 0);

  }
}

void __55__NPAppProxyFlowBridge_handleDataFromClient_readError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  const void *v4;
  const char *v5;
  size_t v6;
  void *v7;
  NSObject *Property;
  dispatch_data_t v9;
  _QWORD destructor[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(v2, "code") != 10)
  {
    -[NPAppProxyFlowBridge closeAllWithError:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
  }
  else
  {
    v3 = *(void **)(a1 + 48);
    if (v3 && objc_msgSend(v3, "length"))
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x3032000000;
      v14 = __Block_byref_object_copy__2;
      v15 = __Block_byref_object_dispose__2;
      v16 = *(id *)(a1 + 48);
      v4 = (const void *)objc_msgSend(objc_retainAutorelease(v16), "bytes");
      v6 = objc_msgSend((id)v12[5], "length");
      v7 = *(void **)(a1 + 40);
      if (v7)
        Property = objc_getProperty(v7, v5, 40, 1);
      else
        Property = 0;
      destructor[0] = MEMORY[0x1E0C809B0];
      destructor[1] = 3221225472;
      destructor[2] = __55__NPAppProxyFlowBridge_handleDataFromClient_readError___block_invoke_2;
      destructor[3] = &unk_1E41380A8;
      destructor[4] = &v11;
      v9 = dispatch_data_create(v4, v6, Property, destructor);
      -[NPAppProxyFlowBridge writeDataToConnection:](*(_QWORD *)(a1 + 40), v9);

      _Block_object_dispose(&v11, 8);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "closeReadWithError:", 0);
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 9) = 1;
      -[NPAppProxyFlowBridge writeDataToConnection:](*(_QWORD *)(a1 + 40), 0);
    }
  }
}

void __55__NPAppProxyFlowBridge_handleDataFromClient_readError___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __42__NPAppProxyFlowBridge_readDataFromClient__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  const char *v6;
  id v7;
  NSObject *Property;
  _QWORD block[4];
  id v10;
  void *v11;
  id v12;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v7 = a3;
  if (v4)
  {
    Property = objc_getProperty(v4, v6, 40, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__NPAppProxyFlowBridge_handleDataFromClient_readError___block_invoke;
    block[3] = &unk_1E4137348;
    v10 = v7;
    v11 = v4;
    v12 = v5;
    dispatch_async(Property, block);

  }
}

void __39__NPAppProxyFlowBridge_startConnection__block_invoke(uint64_t a1)
{
  -[NPAppProxyFlowBridge closeAllWithError:](*(_QWORD *)(a1 + 32), 0);
}

void __39__NPAppProxyFlowBridge_startConnection__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  CFErrorRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id Property;
  uint64_t v15;
  uint64_t v16;
  int error_code;
  _BYTE v18[24];
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v7, 16, 1);
      v15 = objc_msgSend(Property, "hash");
      v16 = *(_QWORD *)(a1 + 40);
      error_code = nw_error_get_error_code(v5);
      *(_DWORD *)v18 = 134218498;
      *(_QWORD *)&v18[4] = v15;
      *(_WORD *)&v18[12] = 2112;
      *(_QWORD *)&v18[14] = v16;
      *(_WORD *)&v18[22] = 2080;
      v19 = strerror(error_code);
      _os_log_error_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_ERROR, "Bridge %lu: nw_connection with [%@] received error: %s", v18, 0x20u);
    }

    v8 = nw_error_copy_cf_error(v5);
    -[NPAppProxyFlowBridge closeAllWithError:](*(_QWORD *)(a1 + 32), v8);

    goto LABEL_14;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    *(_DWORD *)(v9 + 12) = a2;
  if ((a2 - 4) < 2)
  {
LABEL_9:
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      *(_DWORD *)(v10 + 12) = 5;
      v11 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v11 = 0;
    }
    -[NPAppProxyFlowBridge closeFlowWithError:](v11, 0);
    goto LABEL_14;
  }
  if (a2 != 3)
  {
    if (a2)
      goto LABEL_14;
    goto LABEL_9;
  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    v13 = *(void **)(v12 + 16);
    *(_QWORD *)v18 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v18[8] = 3221225472;
    *(_QWORD *)&v18[16] = __45__NPAppProxyFlowBridge_handleConnectionReady__block_invoke;
    v19 = (char *)&unk_1E4138008;
    v20 = v12;
    objc_msgSend(v13, "openWithLocalEndpoint:completionHandler:", 0, v18);
  }
LABEL_14:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwContext, 0);
  objc_storeStrong((id *)&self->_connectionError, 0);
  objc_storeStrong((id *)&self->_networkTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_flow, 0);
}

@end
