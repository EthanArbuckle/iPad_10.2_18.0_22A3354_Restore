@implementation NWURLLoaderTCP

- (void)start:(id)a3
{
  NSString *hostname;
  NSString *v6;
  void (**v7)(_QWORD);
  const char *v8;
  uint64_t v9;
  _BOOL8 host_with_numeric_port;
  void *v11;
  void *v12;
  nw_parameters_t secure_tcp;
  NWURLSessionTaskConfiguration *configuration;
  OS_nw_connection *v15;
  OS_nw_connection *connection;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  OS_nw_connection *v20;
  NWURLSessionTaskConfiguration *v21;
  OS_nw_connection *v22;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD handler[5];
  _QWORD aBlock[5];

  if (self)
    hostname = self->_hostname;
  else
    hostname = 0;
  v6 = hostname;
  v7 = (void (**)(_QWORD))a3;
  v8 = -[NSString UTF8String](v6, "UTF8String");
  v9 = MEMORY[0x1E0C809B0];
  if (self)
  {
    host_with_numeric_port = nw_endpoint_create_host_with_numeric_port(v8, LOWORD(self->_port));
    v11 = _Block_copy(&__block_literal_global_18950);
    if (self->_TLS)
    {
      self->_addedTLS = 1;
      aBlock[0] = v9;
      aBlock[1] = 3221225472;
      aBlock[2] = __24__NWURLLoaderTCP_start___block_invoke;
      aBlock[3] = &unk_1E14A9960;
      aBlock[4] = self;
      v12 = _Block_copy(aBlock);

      v11 = v12;
    }
    secure_tcp = nw_parameters_create_secure_tcp(v11, &__block_literal_global_189);
    configuration = self->_configuration;
  }
  else
  {
    host_with_numeric_port = nw_endpoint_create_host_with_numeric_port(v8, 0);
    v11 = _Block_copy(&__block_literal_global_18950);
    secure_tcp = nw_parameters_create_secure_tcp(v11, &__block_literal_global_189);
    configuration = 0;
  }
  -[NWURLSessionTaskConfiguration configureParameters:]((id *)&configuration->super.isa, secure_tcp);
  v15 = (OS_nw_connection *)nw_connection_create((nw_endpoint_t)host_with_numeric_port, secure_tcp);
  if (self)
  {
    connection = self->_connection;
    self->_connection = v15;

    v17 = self->_connection;
  }
  else
  {

    v17 = 0;
  }
  handler[0] = v9;
  handler[1] = 3221225472;
  handler[2] = __24__NWURLLoaderTCP_start___block_invoke_3;
  handler[3] = &unk_1E14ACF48;
  handler[4] = self;
  nw_connection_set_state_changed_handler(v17, handler);
  if (self)
    v18 = self->_connection;
  else
    v18 = 0;
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __24__NWURLLoaderTCP_start___block_invoke_4;
  v25[3] = &unk_1E149FE40;
  v25[4] = self;
  nw_connection_set_better_path_available_handler(v18, v25);
  if (self)
    v19 = self->_connection;
  else
    v19 = 0;
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __24__NWURLLoaderTCP_start___block_invoke_5;
  v24[3] = &unk_1E149FE40;
  v24[4] = self;
  nw_connection_set_viability_changed_handler(v19, v24);
  if (self)
  {
    v20 = self->_connection;
    nw_connection_set_queue((nw_connection_t)v20, (dispatch_queue_t)self->_queue);

    v21 = self->_configuration;
    v22 = self->_connection;
  }
  else
  {
    nw_connection_set_queue(0, 0);
    v21 = 0;
    v22 = 0;
  }
  -[NWURLSessionTaskConfiguration configureConnection:]((uint64_t)v21, v22);

  if (self)
    v23 = self->_connection;
  else
    v23 = 0;
  nw_connection_start(v23);
  v7[2](v7);

}

- (void)stop
{
  OS_nw_connection *v3;
  _BOOL4 cancelled;
  NWURLLoaderClient *client;

  if (self)
  {
    v3 = self->_connection;
    if (v3)
    {
      cancelled = self->_cancelled;

      if (!cancelled)
      {
        self->_cancelled = 1;
        nw_connection_cancel((nw_connection_t)self->_connection);
      }
    }
    client = self->_client;
    self->_client = 0;

  }
}

- (void)updateClient:(id)a3
{
  id v5;

  v5 = a3;
  if (self)
    objc_storeStrong((id *)&self->_client, a3);

}

- (void)readResponse:(id)a3
{
  id v3;

  v3 = a3;
  _os_crash();
  __break(1u);
}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableArray *pendingWork;
  NSMutableArray *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  NWURLLoaderTCP *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;

  v8 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __84__NWURLLoaderTCP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke;
  v18 = &unk_1E149C2D8;
  v19 = self;
  v21 = a3;
  v22 = a4;
  v9 = v8;
  v20 = v9;
  v10 = _Block_copy(&v15);
  v11 = v10;
  if (!self)
  {
    pendingWork = 0;
    goto LABEL_6;
  }
  if (!self->_ready)
  {
    pendingWork = self->_pendingWork;
LABEL_6:
    v13 = pendingWork;
    v14 = _Block_copy(v11);
    -[NSMutableArray addObject:](v13, "addObject:", v14, v15, v16, v17, v18, v19);

    goto LABEL_4;
  }
  (*((void (**)(void *))v10 + 2))(v10);
LABEL_4:

}

- (NSString)multipartMixedReplaceBoundary
{
  return 0;
}

- (OS_sec_trust)peerTrust
{
  if (self)
    self = (NWURLLoaderTCP *)self->_peerTrustInternal;
  return (OS_sec_trust *)self;
}

- (BOOL)requestComplete
{
  return 1;
}

- (void)notifyRequestCompletion:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)takeCachedResponse
{
  return 0;
}

- (OS_nw_http_fields)trailerFields
{
  return 0;
}

- (BOOL)allowsWrite
{
  return 1;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSMutableArray *pendingWork;
  NSMutableArray *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  NWURLLoaderTCP *v21;
  id v22;
  id v23;
  BOOL v24;

  v8 = a3;
  v9 = a5;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __55__NWURLLoaderTCP_writeData_complete_completionHandler___block_invoke;
  v20 = &unk_1E14A9268;
  v21 = self;
  v10 = v8;
  v22 = v10;
  v24 = a4;
  v11 = v9;
  v23 = v11;
  v12 = _Block_copy(&v17);
  v13 = v12;
  if (!self)
  {
    pendingWork = 0;
    goto LABEL_6;
  }
  if (!self->_ready)
  {
    pendingWork = self->_pendingWork;
LABEL_6:
    v15 = pendingWork;
    v16 = _Block_copy(v13);
    -[NSMutableArray addObject:](v15, "addObject:", v16, v17, v18, v19, v20, v21, v22);

    goto LABEL_4;
  }
  (*((void (**)(void *))v12 + 2))(v12);
LABEL_4:

}

- (OS_nw_connection)underlyingConnection
{
  if (self)
    self = (NWURLLoaderTCP *)self->_connection;
  return (OS_nw_connection *)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerTrustInternal, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_pendingWork, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
}

void __55__NWURLLoaderTCP_writeData_complete_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  char v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(NSObject **)(v1 + 64);
  else
    v2 = 0;
  v3 = *(_BYTE *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__NWURLLoaderTCP_writeData_complete_completionHandler___block_invoke_2;
  v5[3] = &unk_1E14A3020;
  v5[4] = v1;
  v4 = *(NSObject **)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  nw_connection_send(v2, v4, (nw_content_context_t)&__block_literal_global_4, v3, v5);

}

void __55__NWURLLoaderTCP_writeData_complete_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (!v3 || !*(_QWORD *)(v3 + 72))
    {
      -[NWURLLoaderTCP errorForNWError:]((id *)v3, v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
        objc_storeStrong((id *)(v5 + 72), v4);

    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(_QWORD *)(v6 + 72);
  else
    v7 = 0;
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7);

}

- (id)errorForNWError:(id *)a1
{
  id *v2;
  id v3;
  NWURLError *v4;
  void *v5;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v4 = [NWURLError alloc];
    objc_msgSend(v2[5], "loaderTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (id *)-[NWURLError initWithNWError:forLoader:andTask:](v4, v3, v2, v5);

  }
  return v2;
}

void __84__NWURLLoaderTCP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  unsigned int v3;
  unsigned int v4;
  _QWORD v5[5];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 64);
  else
    v2 = 0;
  v3 = *(_DWORD *)(a1 + 48);
  v4 = *(_DWORD *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__NWURLLoaderTCP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_2;
  v5[3] = &unk_1E14A9C38;
  v5[4] = v1;
  v6 = *(id *)(a1 + 40);
  nw_connection_receive_internal(v2, 0, v3, v4, v5);

}

void __84__NWURLLoaderTCP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (!v11 || !*(_QWORD *)(v11 + 72))
    {
      -[NWURLLoaderTCP errorForNWError:]((id *)v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      if (v13)
        objc_storeStrong((id *)(v13 + 72), v12);

    }
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    v15 = *(_QWORD *)(v14 + 72);
  else
    v15 = 0;
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v16, a4, v15);

}

void __24__NWURLLoaderTCP_start___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  -[NWURLLoaderTCP configureTLS:](v2, v3);

}

void __24__NWURLLoaderTCP_start___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  nw_protocol_metadata_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NWConcrete_nw_protocol_options *options;
  uint64_t v45;
  NWConcrete_nw_protocol_options *v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  switch(a2)
  {
    case 1:
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
        objc_msgSend(*(id *)(v6 + 40), "loaderWaitingForConnectivity");
      else
        objc_msgSend(0, "loaderWaitingForConnectivity");
      goto LABEL_54;
    case 2:
      v41 = *(_QWORD *)(a1 + 32);
      if (v41)
        v42 = *(void **)(v41 + 40);
      else
        v42 = 0;
      objc_msgSend(v42, "loaderPreparingConnection");
      goto LABEL_54;
    case 3:
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        v8 = *(void **)(v7 + 40);
      else
        v8 = 0;
      objc_msgSend(v8, "loaderConnectedWithHTTPConnectionMetadata:CNAMEChain:unlistedTracker:", 0, 0, 0);
      v9 = *(_QWORD *)(a1 + 32);
      if (!v9)
        goto LABEL_10;
      if (*(_BYTE *)(v9 + 10) && !*(_BYTE *)(v9 + 11))
      {
        *(_BYTE *)(v9 + 11) = 1;
        v43 = (void *)nw_protocol_boringssl_copy_definition();
        options = nw_protocol_create_options(v43);

        v45 = *(_QWORD *)(a1 + 32);
        v46 = options;
        -[NWURLLoaderTCP configureTLS:](v45, v46);

        v47 = *(_QWORD *)(a1 + 32);
        if (v47)
          v48 = *(void **)(v47 + 64);
        else
          v48 = 0;
        nw_connection_append_and_start_application_protocol(v48, v46);

      }
      else
      {
        v9 = *(_QWORD *)(v9 + 64);
LABEL_10:
        v10 = (id)v9;
        v11 = nw_protocol_boringssl_copy_definition();
        v12 = nw_connection_copy_protocol_metadata(v10, v11);

        if (v12)
        {
          v13 = v12;
          v14 = (void *)sec_protocol_metadata_copy_sec_trust();
          v15 = *(_QWORD *)(a1 + 32);
          if (v15)
            objc_storeStrong((id *)(v15 + 80), v14);

        }
        v16 = *(_QWORD **)(a1 + 32);
        if (v16)
          v16 = (_QWORD *)v16[7];
        v17 = v16;
        v18 = *(_QWORD *)(a1 + 32);
        if (v18)
        {
          v19 = *(void **)(v18 + 56);
          *(_QWORD *)(v18 + 56) = 0;

          v20 = *(_QWORD *)(a1 + 32);
          if (v20)
            *(_BYTE *)(v20 + 8) = 1;
        }
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v21 = v17;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v54;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v54 != v23)
                objc_enumerationMutation(v21);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v24++) + 16))();
            }
            while (v22 != v24);
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
          }
          while (v22);
        }

      }
      goto LABEL_54;
    case 4:
      v25 = *(_QWORD **)(a1 + 32);
      if (v25)
        v25 = (_QWORD *)v25[7];
      v26 = v25;
      v27 = *(_QWORD *)(a1 + 32);
      if (v27
        && (v28 = *(void **)(v27 + 56), *(_QWORD *)(v27 + 56) = 0,
                                        v28,
                                        (v29 = *(_QWORD *)(a1 + 32)) != 0))
      {
        v30 = *(_BYTE *)(v29 + 8) != 0;
        *(_BYTE *)(v29 + 8) = 1;
        if (!v5)
          goto LABEL_37;
      }
      else
      {
        v30 = 0;
        if (!v5)
          goto LABEL_37;
      }
      v31 = *(_QWORD *)(a1 + 32);
      if (!v31 || !*(_QWORD *)(v31 + 72))
      {
        -[NWURLLoaderTCP errorForNWError:]((id *)v31, v5);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = *(_QWORD *)(a1 + 32);
        if (v33)
          objc_storeStrong((id *)(v33 + 72), v32);

      }
LABEL_37:
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v34 = v26;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v50;
        do
        {
          v37 = 0;
          do
          {
            if (*(_QWORD *)v50 != v36)
              objc_enumerationMutation(v34);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v37) + 16))(*(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v37));
            ++v37;
          }
          while (v35 != v37);
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v35);
      }

      if (v30)
        goto LABEL_50;
      v38 = *(_QWORD *)(a1 + 32);
      if (!v38)
        goto LABEL_63;
      if (!*(_BYTE *)(v38 + 9))
      {
        *(_BYTE *)(v38 + 9) = 1;
        v39 = *(_QWORD *)(a1 + 32);
        if (v39)
          v40 = *(NSObject **)(v39 + 64);
        else
LABEL_63:
          v40 = 0;
        nw_connection_cancel(v40);
      }
LABEL_50:

LABEL_54:
      return;
    default:
      goto LABEL_54;
  }
}

uint64_t __24__NWURLLoaderTCP_start___block_invoke_4(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2)
      v3 = *(void **)(v2 + 40);
    else
      v3 = 0;
    return objc_msgSend(v3, "loaderBetterPathAvailable");
  }
  return result;
}

void __24__NWURLLoaderTCP_start___block_invoke_5(uint64_t a1, char a2)
{
  uint64_t v3;
  NWURLError *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  NWURLError *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  if ((a2 & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (!v3 || !*(_QWORD *)(v3 + 72))
    {
      v4 = [NWURLError alloc];
      v5 = *(_QWORD **)(a1 + 32);
      if (v5)
        v6 = (void *)v5[5];
      else
        v6 = 0;
      v7 = v6;
      objc_msgSend(v7, "loaderTask");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v5;
      v10 = v8;
      if (v4)
      {
        v11 = *MEMORY[0x1E0CB32E8];
        v15.receiver = v4;
        v15.super_class = (Class)NWURLError;
        v12 = (NWURLError *)objc_msgSendSuper2(&v15, sel_initWithDomain_code_userInfo_, v11, -1005, 0);
        v4 = v12;
        if (v12)
          -[NWURLError fillErrorForLoader:andTask:](v12, "fillErrorForLoader:andTask:", v9, v10);
      }

      v13 = *(_QWORD *)(a1 + 32);
      if (v13)
        objc_storeStrong((id *)(v13 + 72), v4);

      v3 = *(_QWORD *)(a1 + 32);
      if (!v3)
        goto LABEL_17;
    }
    if (*(_BYTE *)(v3 + 9))
      return;
    *(_BYTE *)(v3 + 9) = 1;
    v14 = *(_QWORD *)(a1 + 32);
    if (!v14)
    {
LABEL_17:
      nw_connection_cancel(0);
      return;
    }
    nw_connection_cancel(*(nw_connection_t *)(v14 + 64));
  }
}

- (void)configureTLS:(uint64_t)a1
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD verify_block[5];

  if (a1)
  {
    v3 = MEMORY[0x1E0C809B0];
    verify_block[0] = MEMORY[0x1E0C809B0];
    verify_block[1] = 3221225472;
    verify_block[2] = __31__NWURLLoaderTCP_configureTLS___block_invoke;
    verify_block[3] = &unk_1E14A9880;
    verify_block[4] = a1;
    v4 = *(NSObject **)(a1 + 48);
    v5 = a2;
    sec_protocol_options_set_verify_block(v5, verify_block, v4);
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __31__NWURLLoaderTCP_configureTLS___block_invoke_2;
    v6[3] = &unk_1E14A98D0;
    v6[4] = a1;
    sec_protocol_options_set_challenge_block(v5, v6, *(dispatch_queue_t *)(a1 + 48));
    -[NWURLSessionTaskConfiguration configureSecProtocolOptions:](*(_QWORD *)(a1 + 32), v5);

  }
}

uint64_t __31__NWURLLoaderTCP_configureTLS___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 40);
  else
    v5 = 0;
  return objc_msgSend(v5, "loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:", a3, a2, a4);
}

void __31__NWURLLoaderTCP_configureTLS___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  _QWORD handler[4];
  id v14;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = a2;
  v8 = objc_alloc_init(v5);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __31__NWURLLoaderTCP_configureTLS___block_invoke_3;
  handler[3] = &unk_1E14A98A8;
  v9 = v8;
  v14 = v9;
  sec_protocol_metadata_access_distinguished_names(v7, handler);

  v10 = *(_QWORD **)(a1 + 32);
  if (v10)
    v10 = (_QWORD *)v10[5];
  v11 = v10;
  v12 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v11, "loaderDidReceiveClientCertificateChallenge:completionHandler:", v12, v6);

}

uint64_t __31__NWURLLoaderTCP_configureTLS___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __24__NWURLLoaderTCP_start___block_invoke_2(int a1, nw_protocol_options_t options)
{
  nw_tcp_options_set_no_delay(options, 1);
}

@end
