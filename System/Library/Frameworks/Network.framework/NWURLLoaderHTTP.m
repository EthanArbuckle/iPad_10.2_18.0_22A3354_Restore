@implementation NWURLLoaderHTTP

- (void)start:(id)a3
{
  void (**v4)(_QWORD);
  NWURLLoaderClient *client;
  void *v6;
  NWURLLoaderCache *v7;
  NSURLRequest *v8;
  NWURLSessionTaskConfiguration *v9;
  NWURLSessionTaskConfiguration *v10;
  _BOOL4 v11;
  NWURLSessionTaskConfiguration *v12;
  id *p_isa;
  uint64_t v14;
  uint64_t v15;
  NSURLRequest *v16;
  NSURLRequest *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NWURLLoaderClient *v26;
  void *v27;
  NWURLLoaderClient *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  void (**v32)(_QWORD);
  id v33;
  _QWORD aBlock[5];

  v4 = (void (**)(_QWORD))a3;
  if (bumpProcessFDLimit_onceToken == -1)
  {
    if (self)
    {
LABEL_3:
      client = self->_client;
      goto LABEL_4;
    }
  }
  else
  {
    dispatch_once(&bumpProcessFDLimit_onceToken, &__block_literal_global_196);
    if (self)
      goto LABEL_3;
  }
  client = 0;
LABEL_4:
  -[NWURLLoaderClient loaderDataTask](client, "loaderDataTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (self)
    {
      v7 = self->_cache;
      v8 = self->_request;
      v9 = self->_configuration;
      v10 = v9;
      if (v9)
        v11 = -[NWURLSessionTask _preconnect](v9->_task, "_preconnect");
      else
        v11 = 0;
      v12 = self->_configuration;
      p_isa = (id *)&v12->super.isa;
      if (v12)
      {
        if (-[NSURLRequest _explicitlySetCachePolicy](v12->_request, "_explicitlySetCachePolicy"))
          v14 = objc_msgSend(p_isa[4], "cachePolicy");
        else
          v14 = objc_msgSend(p_isa[2], "requestCachePolicy");
        v15 = v14;
      }
      else
      {
        v15 = 0;
      }
      v16 = v8;
      v17 = v16;
      if (v7 && v7->_cache)
      {
        -[NSURLRequest HTTPMethod](v16, "HTTPMethod");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "caseInsensitiveCompare:", CFSTR("GET"));

        v20 = 0;
        if (!v19)
        {
          v21 = v11 ? 1 : v15;
          if (v21 != 1 && v21 != 4)
          {
            -[NSURLRequest valueForHTTPHeaderField:](v17, "valueForHTTPHeaderField:", CFSTR("Range"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v22 == 0;

          }
        }
      }
      else
      {
        v20 = 0;
      }

      self->_allowCaching = v20;
    }
    else
    {
      p_isa = 0;
      v10 = 0;
      v7 = 0;
      v17 = 0;
    }

    v23 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __25__NWURLLoaderHTTP_start___block_invoke;
    aBlock[3] = &unk_1E14A9808;
    aBlock[4] = self;
    v24 = _Block_copy(aBlock);
    v25 = v24;
    if (self && self->_allowCaching)
    {
      v26 = self->_client;
      -[NWURLLoaderClient loaderDataTask](v26, "loaderDataTask");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = self->_client;
      v30[0] = v23;
      v30[1] = 3221225472;
      v30[2] = __25__NWURLLoaderHTTP_start___block_invoke_2;
      v30[3] = &unk_1E14A9858;
      v30[4] = self;
      v31 = v27;
      v32 = v4;
      v33 = v25;
      v29 = v27;
      -[NWURLLoaderClient loaderRunDelegateBlock:](v28, "loaderRunDelegateBlock:", v30);

    }
    else
    {
      (*((void (**)(void *, _QWORD))v24 + 2))(v24, 0);
      v4[2](v4);
    }

  }
  else
  {
    -[NWURLLoaderHTTP continueLoading]((uint64_t)self);
    v4[2](v4);
  }

}

- (void)stop
{
  NWConcrete_nw_connection *connection;
  NWURLSessionRequestBodyProvider *requestBodyProvider;
  NWURLLoaderClient *client;
  NWURLSessionTaskConfiguration *configuration;
  NWURLError *pendingError;
  SEL v8;
  NWURLError *v9;
  void *v10;
  NWURLLoaderHTTP *v11;
  id v12;
  uint64_t v13;
  NWURLLoaderHTTP *v14;
  void (**v15)(_QWORD);
  SEL v16;
  void (**v17)(id, _QWORD, NWURLError *);
  objc_super v18;

  -[NWURLLoaderHTTP stopResponseStallTimer]((uint64_t)self, (uint64_t)a2);
  -[NWURLLoaderHTTP cancelConnection]((uint64_t)self);
  if (self)
  {
    connection = self->_connection;
    self->_connection = 0;

    -[NWURLSessionRequestBodyProvider close](self->_requestBodyProvider, "close");
    requestBodyProvider = self->_requestBodyProvider;
    self->_requestBodyProvider = 0;

    client = self->_client;
    self->_client = 0;

    configuration = self->_configuration;
    self->_configuration = 0;

    pendingError = self->_pendingError;
    self->_pendingError = 0;

    v17 = (void (**)(id, _QWORD, NWURLError *))self->_responseCompletionHandler;
    objc_setProperty_nonatomic_copy(self, v8, 0, 128);
    if (v17)
    {
      v9 = [NWURLError alloc];
      -[NWURLLoaderClient loaderTask](self->_client, "loaderTask");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self;
      v12 = v10;
      if (v9)
      {
        v13 = *MEMORY[0x1E0CB32E8];
        v18.receiver = v9;
        v18.super_class = (Class)NWURLError;
        v14 = -[NWURLLoaderHTTP initWithDomain:code:userInfo:](&v18, sel_initWithDomain_code_userInfo_, v13, -999, 0);
        v9 = (NWURLError *)v14;
        if (v14)
          -[NWURLLoaderHTTP fillErrorForLoader:andTask:](v14, "fillErrorForLoader:andTask:", v11, v12);
      }

      v17[2](v17, 0, v9);
    }
    v15 = (void (**)(_QWORD))self->_requestCompletionHandler;
    objc_setProperty_nonatomic_copy(self, v16, 0, 136);
    if (v15)
    {
      v15[2](v15);

    }
  }
  else
  {
    objc_msgSend(0, "close");

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
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, a2, a3, 128);
    -[NWURLLoaderHTTP readResponse]((uint64_t)self);
  }
}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  unsigned int v5;
  unsigned int v6;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSCachedURLResponse *v10;
  void *v11;
  void *v12;
  NWConcrete_nw_connection *connection;
  _QWORD v14[5];
  id v15;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v8;
  if (!self)
  {
    connection = 0;
    goto LABEL_6;
  }
  if (!self->_pendingCompletion)
  {
    connection = self->_connection;
LABEL_6:
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__NWURLLoaderHTTP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke;
    v14[3] = &unk_1E14A9C38;
    v14[4] = self;
    v15 = v8;
    nw_connection_receive_internal(connection, 0, v6, v5, v14);

    goto LABEL_8;
  }
  if (self->_loadingFromCache)
  {
    v10 = self->_cachedResponseFound;
    -[NSCachedURLResponse data](v10, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "_createDispatchData");
    ((void (**)(_QWORD, void *, uint64_t, _QWORD))v9)[2](v9, v12, 1, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD, uint64_t, _QWORD))v8 + 2))(v8, 0, 1, 0);
  }
LABEL_8:

}

- (NSString)multipartMixedReplaceBoundary
{
  if (self)
    self = (NWURLLoaderHTTP *)self->_multipartBoundary;
  return (NSString *)self;
}

- (OS_sec_trust)peerTrust
{
  if (self)
    self = (NWURLLoaderHTTP *)self->_peerTrustInternal;
  return (OS_sec_trust *)self;
}

- (BOOL)requestComplete
{
  if (self)
    LOBYTE(self) = self->_requestCompleteInternal;
  return (char)self;
}

- (void)notifyRequestCompletion:(id)a3
{
  id v4;
  void *v5;
  id newValue;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    newValue = v4;
    if (self->_requestCompleteInternal)
      (*((void (**)(id))v4 + 2))(v4);
    else
      objc_setProperty_nonatomic_copy(self, (SEL)v4, v4, 136);
    v5 = newValue;
  }

}

- (id)takeCachedResponse
{
  NSCachedURLResponse *v3;
  NSCachedURLResponse *cachedResponseToStore;

  if (self)
  {
    v3 = self->_cachedResponseToStore;
    cachedResponseToStore = self->_cachedResponseToStore;
    self->_cachedResponseToStore = 0;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (OS_nw_http_fields)trailerFields
{
  if (self)
    self = (NWURLLoaderHTTP *)self->_trailerFieldsInternal;
  return (OS_nw_http_fields *)self;
}

- (BOOL)allowsWrite
{
  return 0;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (NWConcrete_nw_connection)underlyingConnection
{
  if (self)
    self = (NWURLLoaderHTTP *)self->_connection;
  return (NWConcrete_nw_connection *)self;
}

- (void)restartStallTimer:(id)a3
{
  dispatch_source_t *responseStallTimer;
  dispatch_time_t v4;

  if (self)
  {
    responseStallTimer = (dispatch_source_t *)self->_responseStallTimer;
    if (responseStallTimer)
    {
      v4 = dispatch_time(0x8000000000000000, 3000000000);
      if (*responseStallTimer)
      {
        dispatch_source_set_timer(*responseStallTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      }
      else
      {
        responseStallTimer[4] = (dispatch_source_t)v4;
        responseStallTimer[5] = (dispatch_source_t)-1;
        if (*((_BYTE *)responseStallTimer + 48))
        {
          if (*((_BYTE *)responseStallTimer + 49))
            nw_queue_source_run_timer((uint64_t)responseStallTimer, v4);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerTrustInternal, 0);
  objc_storeStrong((id *)&self->_trailerFieldsInternal, 0);
  objc_storeStrong((id *)&self->_httpConnectionMetadata, 0);
  objc_storeStrong(&self->_requestCompletionHandler, 0);
  objc_storeStrong(&self->_responseCompletionHandler, 0);
  objc_storeStrong((id *)&self->_multipartBoundary, 0);
  objc_storeStrong((id *)&self->_cachedResponseToStore, 0);
  objc_storeStrong((id *)&self->_cachedResponseFound, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_pendingError, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_requestBodyProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __85__NWURLLoaderHTTP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_data_t concat;
  void *v23;
  NSObject *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id *v30;
  id *v31;
  id v32;
  BOOL v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  int v50;
  size_t size;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  nw_protocol_metadata_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  NWURLError *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  BOOL v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  BOOL is_equal;
  uint64_t userInfo;
  int *v72;
  int v73;
  id *v74;
  void *v75;
  id *v76;
  id v77;
  uint64_t v78;
  NWURLError *v79;
  uint64_t v80;
  id *v81;
  void *v82;
  id *v83;
  id v84;
  uint64_t v85;
  NWURLError *v86;
  void *v87;
  char *v88;
  NSObject *v89;
  os_log_type_t v90;
  void *v91;
  os_log_type_t v92;
  char *backtrace_string;
  os_log_type_t v94;
  _BOOL4 v95;
  char *v96;
  os_log_type_t v97;
  _BOOL4 v98;
  os_log_type_t v99;
  os_log_type_t v100;
  id v101;
  NSObject *context;
  char v103;
  os_log_type_t type;
  uint64_t v105;
  uint64_t v106;
  int v107;
  _QWORD v108[2];
  int v109;
  _BYTE buf[44];
  __int16 v111;
  int v112;
  __int16 v113;
  id v114;
  _BYTE v115[24];
  int v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  context = a3;
  v10 = a5;
  if (gLogDatapath)
  {
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v40 = (id)gurlLogObj;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v41 = *(_QWORD *)(a1 + 32);
      if (v41 && (v42 = *(id *)(v41 + 48)) != 0)
      {
        v43 = v42;
        objc_msgSend(v42, "logDescription");
      }
      else
      {
        v43 = 0;
        v108[0] = 0;
        v108[1] = 0;
        v109 = 0;
      }
      v47 = *(_QWORD *)(a1 + 32);
      if (v47 && (v48 = *(id *)(v47 + 48)) != 0)
      {
        v49 = v48;
        objc_msgSend(v48, "logDescription");
        v50 = v107;
      }
      else
      {
        v50 = 0;
        v49 = 0;
        v105 = 0;
        v106 = 0;
        v107 = 0;
      }
      if (v9)
        size = dispatch_data_get_size(v9);
      else
        size = 0;
      *(_DWORD *)buf = 136447746;
      *(_QWORD *)&buf[4] = "-[NWURLLoaderHTTP readDataOfMinimumIncompleteLength:maximumLength:completionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2098;
      *(_QWORD *)&buf[20] = v108;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v50;
      *(_WORD *)&buf[34] = 2048;
      *(_QWORD *)&buf[36] = size;
      v111 = 1024;
      v112 = a4;
      v113 = 2112;
      v114 = v10;
      _os_log_impl(&dword_182FBE000, v40, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> received body: %zu, complete: %{BOOL}d, error: %@", buf, 0x3Cu);

    }
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11 && *(_QWORD *)(v11 + 144))
  {
    if (HTTPNotificationCenter_onceToken != -1)
      dispatch_once(&HTTPNotificationCenter_onceToken, &__block_literal_global_197);
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      v13 = *(_QWORD *)(v12 + 144);
    else
      v13 = 0;
    v14 = (id)HTTPNotificationCenter_center;
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("NWURLLoaderHTTPConnectionProgressNotification"), v13);

  }
  if (v10)
  {
    -[NWURLLoaderHTTP errorForNWError:](*(id **)(a1 + 32), v10);
    v101 = (id)objc_claimAutoreleasedReturnValue();
    if (!v101)
      goto LABEL_13;
    v44 = *(_QWORD *)(a1 + 32);
    if (v44)
    {
      if (*(_QWORD *)(v44 + 88))
        goto LABEL_14;
      v45 = v101;
      v46 = *(void **)(v44 + 88);
      v101 = v45;
      *(_QWORD *)(v44 + 88) = v45;
      goto LABEL_43;
    }
    v16 = 0;
  }
  else
  {
    if (!(_DWORD)a4)
    {
LABEL_13:
      v101 = 0;
LABEL_14:
      v16 = *(_QWORD *)(a1 + 32);
      goto LABEL_15;
    }
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
    {
      if (!*(_BYTE *)(v15 + 8))
        goto LABEL_13;
      v101 = 0;
      v46 = *(void **)(v15 + 88);
      *(_QWORD *)(v15 + 88) = 0;
LABEL_43:

      goto LABEL_14;
    }
    v16 = 0;
    v101 = 0;
  }
LABEL_15:
  if (v9)
  {
    if (v16)
    {
      v17 = *(_QWORD **)(v16 + 96);
      v18 = v9;
      if (v17)
      {
        v19 = (void *)v17[3];
        if (v19)
        {
          v20 = v18;
          v21 = v19;
          concat = dispatch_data_create_concat(v21, v20);
          v23 = (void *)v17[3];
          v17[3] = concat;

          v24 = v17[3];
          if (dispatch_data_get_size(v24) > v17[4])
          {
            v17[3] = 0;

            v25 = (void *)v17[5];
            v17[4] = 0;
            v17[5] = 0;

          }
        }
      }
    }
    else
    {
      v52 = v9;
    }

    v16 = *(_QWORD *)(a1 + 32);
  }
  if (v16)
  {
    if (*(_QWORD *)(v16 + 88))
    {
      v26 = *(_QWORD **)(v16 + 96);
      if (v26)
      {
        v27 = (void *)v26[3];
        v26[3] = 0;

        v28 = (void *)v26[5];
        v26[4] = 0;
        v26[5] = 0;

      }
    }
  }
  if (!(_DWORD)a4)
    goto LABEL_71;
  v29 = *(_QWORD *)(a1 + 32);
  if (!v29)
  {
    v31 = 0;
LABEL_57:
    v38 = 0;
    goto LABEL_58;
  }
  v30 = (id *)*(id *)(v29 + 96);
  v31 = v30;
  if (!v30)
    goto LABEL_57;
  v32 = v30[5];
  if (!v32)
    goto LABEL_57;
  v33 = v31[3] == 0;

  if (v33)
    goto LABEL_57;
  v34 = objc_alloc(MEMORY[0x1E0C92BF8]);
  v35 = v31[3];
  v36 = v31[2];
  v37 = v31[5];
  v38 = (void *)objc_msgSend(v34, "initWithResponse:data:userInfo:storagePolicy:", v37, v35, 0, v36);

  v39 = v31[3];
  v31[3] = 0;

LABEL_58:
  v53 = *(_QWORD *)(a1 + 32);
  if (v53)
    objc_storeStrong((id *)(v53 + 112), v38);

  if (context)
  {
    if (nw_protocol_copy_http_definition_onceToken != -1)
      dispatch_once(&nw_protocol_copy_http_definition_onceToken, &__block_literal_global_11_72660);
    v54 = (id)nw_protocol_copy_http_definition_http_definition;
    v55 = nw_content_context_copy_protocol_metadata(context, v54);

    if (v55)
    {
      v56 = nw_http_metadata_copy_trailer_fields(v55);
      v57 = *(_QWORD *)(a1 + 32);
      if (v57)
        objc_storeStrong((id *)(v57 + 160), v56);

    }
  }
  v58 = *(_QWORD *)(a1 + 32);
  if (!v58)
    goto LABEL_137;
  v59 = (NWURLError *)*(id *)(v58 + 88);
  if (v59)
  {
LABEL_70:

    goto LABEL_71;
  }
  v62 = *(_QWORD *)(a1 + 32);
  if (v62)
    v63 = *(void **)(v62 + 48);
  else
LABEL_137:
    v63 = 0;
  objc_msgSend(v63, "clientMetadata");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64 == 0;

  if (v65)
    goto LABEL_71;
  v66 = *(_QWORD *)(a1 + 32);
  if (v66)
    v67 = *(void **)(v66 + 48);
  else
    v67 = 0;
  objc_msgSend(v67, "clientMetadata");
  v68 = (id)objc_claimAutoreleasedReturnValue();
  v59 = (NWURLError *)v68;
  if (!v68)
  {
    __nwlog_obj();
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v115 = 136446210;
    *(_QWORD *)&v115[4] = "nw_http_client_metadata_get_client_error";
    v88 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v103 = 0;
    if (!__nwlog_fault(v88, &type, &v103))
      goto LABEL_133;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v89 = objc_claimAutoreleasedReturnValue();
      v90 = type;
      if (os_log_type_enabled(v89, type))
      {
        *(_DWORD *)v115 = 136446210;
        *(_QWORD *)&v115[4] = "nw_http_client_metadata_get_client_error";
        _os_log_impl(&dword_182FBE000, v89, v90, "%{public}s called with null metadata", v115, 0xCu);
      }
    }
    else if (v103)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v89 = objc_claimAutoreleasedReturnValue();
      v94 = type;
      v95 = os_log_type_enabled(v89, type);
      if (backtrace_string)
      {
        if (v95)
        {
          *(_DWORD *)v115 = 136446466;
          *(_QWORD *)&v115[4] = "nw_http_client_metadata_get_client_error";
          *(_WORD *)&v115[12] = 2082;
          *(_QWORD *)&v115[14] = backtrace_string;
          _os_log_impl(&dword_182FBE000, v89, v94, "%{public}s called with null metadata, dumping backtrace:%{public}s", v115, 0x16u);
        }

        free(backtrace_string);
LABEL_133:
        if (!v88)
        {
LABEL_135:

          goto LABEL_70;
        }
LABEL_134:
        free(v88);
        goto LABEL_135;
      }
      if (v95)
      {
        *(_DWORD *)v115 = 136446210;
        *(_QWORD *)&v115[4] = "nw_http_client_metadata_get_client_error";
        _os_log_impl(&dword_182FBE000, v89, v94, "%{public}s called with null metadata, no backtrace", v115, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v89 = objc_claimAutoreleasedReturnValue();
      v99 = type;
      if (os_log_type_enabled(v89, type))
      {
        *(_DWORD *)v115 = 136446210;
        *(_QWORD *)&v115[4] = "nw_http_client_metadata_get_client_error";
        _os_log_impl(&dword_182FBE000, v89, v99, "%{public}s called with null metadata, backtrace limit exceeded", v115, 0xCu);
      }
    }
LABEL_132:

    goto LABEL_133;
  }
  v69 = nw_protocol_metadata_copy_definition(v68);
  if (nw_protocol_copy_http_client_definition_onceToken != -1)
    dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_52_74156);
  is_equal = nw_protocol_definition_is_equal(v69, (nw_protocol_definition_t)nw_protocol_copy_http_client_definition_definition);

  if (!is_equal)
  {
    __nwlog_obj();
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v115 = 136446210;
    *(_QWORD *)&v115[4] = "nw_http_client_metadata_get_client_error";
    v88 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v103 = 0;
    if (!__nwlog_fault(v88, &type, &v103))
      goto LABEL_133;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v89 = objc_claimAutoreleasedReturnValue();
      v92 = type;
      if (os_log_type_enabled(v89, type))
      {
        *(_DWORD *)v115 = 136446210;
        *(_QWORD *)&v115[4] = "nw_http_client_metadata_get_client_error";
        _os_log_impl(&dword_182FBE000, v89, v92, "%{public}s metadata must be http_client", v115, 0xCu);
      }
    }
    else if (v103)
    {
      v96 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v89 = objc_claimAutoreleasedReturnValue();
      v97 = type;
      v98 = os_log_type_enabled(v89, type);
      if (v96)
      {
        if (v98)
        {
          *(_DWORD *)v115 = 136446466;
          *(_QWORD *)&v115[4] = "nw_http_client_metadata_get_client_error";
          *(_WORD *)&v115[12] = 2082;
          *(_QWORD *)&v115[14] = v96;
          _os_log_impl(&dword_182FBE000, v89, v97, "%{public}s metadata must be http_client, dumping backtrace:%{public}s", v115, 0x16u);
        }

        free(v96);
        if (!v88)
          goto LABEL_135;
        goto LABEL_134;
      }
      if (v98)
      {
        *(_DWORD *)v115 = 136446210;
        *(_QWORD *)&v115[4] = "nw_http_client_metadata_get_client_error";
        _os_log_impl(&dword_182FBE000, v89, v97, "%{public}s metadata must be http_client, no backtrace", v115, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v89 = objc_claimAutoreleasedReturnValue();
      v100 = type;
      if (os_log_type_enabled(v89, type))
      {
        *(_DWORD *)v115 = 136446210;
        *(_QWORD *)&v115[4] = "nw_http_client_metadata_get_client_error";
        _os_log_impl(&dword_182FBE000, v89, v100, "%{public}s metadata must be http_client, backtrace limit exceeded", v115, 0xCu);
      }
    }
    goto LABEL_132;
  }
  *(_QWORD *)v115 = 0;
  *(_QWORD *)&v115[8] = v115;
  v116 = 0;
  *(_QWORD *)&v115[16] = 0x2020000000;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __nw_http_client_metadata_get_client_error_block_invoke;
  *(_QWORD *)&buf[24] = &unk_1E14A9D68;
  *(_QWORD *)&buf[32] = v115;
  userInfo = (uint64_t)v59->super._userInfo;
  if (userInfo)
  {
    __nw_http_client_metadata_get_client_error_block_invoke((uint64_t)buf, userInfo);
    v72 = (int *)(*(_QWORD *)&v115[8] + 24);
  }
  else
  {
    v72 = &v116;
  }
  v73 = *v72;
  _Block_object_dispose(v115, 8);

  if ((v73 - 1) < 2)
  {
    v74 = *(id **)(a1 + 32);
    if (v74)
    {
      v59 = [NWURLError alloc];
      objc_msgSend(v74[6], "loaderTask");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v74;
      v77 = v75;
      if (v59)
      {
        v78 = *MEMORY[0x1E0CB32E8];
        *(_QWORD *)buf = v59;
        *(_QWORD *)&buf[8] = NWURLError;
        v79 = (NWURLError *)objc_msgSendSuper2((objc_super *)buf, sel_initWithDomain_code_userInfo_, v78, -1013, 0);
        v59 = v79;
        if (v79)
          -[NWURLError fillErrorForLoader:andTask:](v79, "fillErrorForLoader:andTask:", v76, v77);
      }

      v80 = *(_QWORD *)(a1 + 32);
      if (!v80)
        goto LABEL_70;
      goto LABEL_92;
    }
    goto LABEL_140;
  }
  if (v73 == 3)
  {
    v81 = *(id **)(a1 + 32);
    if (v81)
    {
      v59 = [NWURLError alloc];
      objc_msgSend(v81[6], "loaderTask");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v81;
      v84 = v82;
      if (v59)
      {
        v85 = *MEMORY[0x1E0CB32E8];
        *(_QWORD *)buf = v59;
        *(_QWORD *)&buf[8] = NWURLError;
        v86 = (NWURLError *)objc_msgSendSuper2((objc_super *)buf, sel_initWithDomain_code_userInfo_, v85, -1012, 0);
        v59 = v86;
        if (v86)
          -[NWURLError fillErrorForLoader:andTask:](v86, "fillErrorForLoader:andTask:", v83, v84);
      }

      v80 = *(_QWORD *)(a1 + 32);
      if (!v80)
        goto LABEL_70;
LABEL_92:
      objc_storeStrong((id *)(v80 + 88), v59);
      goto LABEL_70;
    }
LABEL_140:
    v59 = 0;
    goto LABEL_70;
  }
LABEL_71:
  v60 = *(_QWORD *)(a1 + 32);
  if (v60)
    v61 = *(_QWORD *)(v60 + 88);
  else
    v61 = 0;
  (*(void (**)(_QWORD, NSObject *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v9, a4, v61);

}

- (void)setPendingError:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
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
    objc_msgSend(v2[6], "loaderTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (id *)-[NWURLError initWithNWError:forLoader:andTask:](v4, v3, v2, v5);

  }
  return v2;
}

- (void)readResponse
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  SEL v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  SEL v10;
  void (**v11)(_QWORD);
  SEL v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  char *backtrace_string;
  os_log_type_t v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  id v29;
  os_log_type_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  int v37;
  _QWORD *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  char v43;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  char *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = a1;
    if (*(_BYTE *)(a1 + 11))
    {
      v4 = *(void **)(a1 + 128);
      if (v4)
      {
        v39 = v4;
        objc_setProperty_nonatomic_copy((id)v3, v5, 0, 128);
        (*((void (**)(id, _QWORD, _QWORD))v39 + 2))(v39, 0, *(_QWORD *)(v3 + 88));
LABEL_5:

        return;
      }
      _os_crash();
      __break(1u);
    }
    else
    {
      if (*(_BYTE *)(a1 + 14) && !*(_BYTE *)(a1 + 15))
      {
        v9 = *(void **)(a1 + 128);
        if (v9)
        {
          v39 = v9;
          objc_setProperty_nonatomic_copy((id)v3, v10, 0, 128);
          *(_BYTE *)(v3 + 11) = 1;
          *(_BYTE *)(v3 + 16) = 1;
          v11 = (void (**)(_QWORD))*(id *)(v3 + 136);
          objc_setProperty_nonatomic_copy((id)v3, v12, 0, 136);
          if (v11)
            v11[2](v11);

          v13 = *(id *)(v3 + 104);
          objc_msgSend(v13, "response");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *, _QWORD))v39 + 2))(v39, v14, 0);

          goto LABEL_5;
        }
        _os_crash();
        __break(1u);
        goto LABEL_33;
      }
      if (*(_QWORD *)(a1 + 128))
      {
        v6 = *(id *)(a1 + 72);
        v7 = *(void **)(v3 + 72);
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __31__NWURLLoaderHTTP_readResponse__block_invoke;
        v40[3] = &unk_1E14A9C10;
        v41 = v6;
        v42 = v3;
        v8 = v6;
        nw_connection_receive_internal(v7, 0, 0, 0, v40);

        return;
      }
    }
    v2 = &qword_1EDCE3000;
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v1 = &qword_1EDCE3000;
    v15 = (id)gurlLogObj;
    v16 = *(void **)(v3 + 48);
    v38 = (_QWORD *)v3;
    v17 = *(_QWORD *)(v3 + 72);
    v37 = 136446722;
    *(_DWORD *)buf = 136446722;
    v46 = "-[NWURLLoaderHTTP readResponse]";
    v47 = 2112;
    v48 = v16;
    v49 = 2112;
    v50 = v17;
    v18 = v16;
    v3 = _os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v43 = 0;
    if (!__nwlog_fault((const char *)v3, &type, &v43))
      goto LABEL_41;
    if (type == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v19 = (id)gurlLogObj;
      v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        v21 = (void *)v38[6];
        v22 = v38[9];
        *(_DWORD *)buf = 136446722;
        v46 = "-[NWURLLoaderHTTP readResponse]";
        v47 = 2112;
        v48 = v21;
        v49 = 2112;
        v50 = v22;
        v23 = v21;
        _os_log_impl(&dword_182FBE000, v19, v20, "%{public}s responseCompletionHandler should not be nil for %@ %@", buf, 0x20u);

      }
      goto LABEL_40;
    }
    if (v43)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v19 = (id)gurlLogObj;
      v25 = type;
      v26 = os_log_type_enabled(v19, type);
      if (backtrace_string)
      {
        if (v26)
        {
          v27 = (void *)v38[6];
          v28 = v38[9];
          *(_DWORD *)buf = 136446978;
          v46 = "-[NWURLLoaderHTTP readResponse]";
          v47 = 2112;
          v48 = v27;
          v49 = 2112;
          v50 = v28;
          v51 = 2082;
          v52 = backtrace_string;
          v29 = v27;
          _os_log_impl(&dword_182FBE000, v19, v25, "%{public}s responseCompletionHandler should not be nil for %@ %@, dumping backtrace:%{public}s", buf, 0x2Au);

        }
        free(backtrace_string);
        goto LABEL_41;
      }
      if (v26)
      {
        v34 = (void *)v38[6];
        v35 = v38[9];
        *(_DWORD *)buf = 136446722;
        v46 = "-[NWURLLoaderHTTP readResponse]";
        v47 = 2112;
        v48 = v34;
        v49 = 2112;
        v50 = v35;
        v36 = v34;
        _os_log_impl(&dword_182FBE000, v19, v25, "%{public}s responseCompletionHandler should not be nil for %@ %@, no backtrace", buf, 0x20u);

      }
LABEL_40:

LABEL_41:
      if (v3)
        free((void *)v3);
      return;
    }
LABEL_33:
    if (v2[509] != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v19 = (id)v1[412];
    v30 = type;
    if (os_log_type_enabled(v19, type))
    {
      v31 = (void *)v38[6];
      v32 = v38[9];
      *(_DWORD *)buf = v37;
      v46 = "-[NWURLLoaderHTTP readResponse]";
      v47 = 2112;
      v48 = v31;
      v49 = 2112;
      v50 = v32;
      v33 = v31;
      _os_log_impl(&dword_182FBE000, v19, v30, "%{public}s responseCompletionHandler should not be nil for %@ %@, backtrace limit exceeded", buf, 0x20u);

    }
    goto LABEL_40;
  }
}

void __31__NWURLLoaderHTTP_readResponse__block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  nw_protocol_metadata_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  _QWORD *p_isa;
  NSObject *v29;
  BOOL is_equal;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  uint64_t v42;
  _BYTE *v43;
  _QWORD *v44;
  _QWORD *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  BOOL v49;
  uint64_t v50;
  _QWORD *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  unint64_t v61;
  id v62;
  unint64_t v63;
  double v64;
  double v65;
  id v66;
  unint64_t v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  NSObject *v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  char *v86;
  NSObject *v87;
  os_log_type_t v88;
  uint64_t v89;
  void *v90;
  os_log_type_t v91;
  uint64_t v92;
  id *v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  id *v97;
  uint64_t v98;
  char *v99;
  os_log_type_t v100;
  _BOOL4 v101;
  char *backtrace_string;
  os_log_type_t v103;
  _BOOL4 v104;
  uint64_t v105;
  id v106;
  void *v107;
  int v108;
  os_log_type_t v109;
  os_log_type_t v110;
  NSObject *v111;
  NSObject *v112;
  uint64_t v113;
  id v114;
  void *v115;
  uint64_t v116;
  id v117;
  void *v118;
  int v119;
  _BYTE *v120;
  uint64_t v121;
  id v122;
  id v123;
  nw_protocol_metadata_t v124;
  id v125;
  void *v126;
  id newValue;
  char v128;
  os_log_type_t type;
  uint64_t v130;
  uint64_t v131;
  int v132;
  _QWORD v133[2];
  int v134;
  _BYTE v135[44];
  __int16 v136;
  int v137;
  __int16 v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  _QWORD v143[2];
  int v144;
  _BYTE buf[24];
  uint64_t v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v125 = a2;
  v9 = a3;
  v10 = a5;
  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  if (!v11)
  {
    if (v12)
      goto LABEL_72;
    goto LABEL_164;
  }
  if (v12 == *(_QWORD *)(v11 + 72))
  {
    v13 = *(void **)(v11 + 128);
    if (v13)
    {
      newValue = v13;
      v15 = *(void **)(a1 + 40);
      if (v15)
      {
        objc_setProperty_nonatomic_copy(v15, v14, 0, 128);
        v16 = *(_QWORD *)(a1 + 40);
        if (v16)
        {
          *(_BYTE *)(v16 + 10) = 1;
          v15 = *(void **)(a1 + 40);
        }
        else
        {
          v15 = 0;
        }
      }
      -[NWURLLoaderHTTP stopResponseStallTimer]((uint64_t)v15, (uint64_t)v14);
      v17 = *(_QWORD *)(a1 + 40);
      if (v17 && *(_QWORD *)(v17 + 144))
      {
        if (HTTPNotificationCenter_onceToken != -1)
          dispatch_once(&HTTPNotificationCenter_onceToken, &__block_literal_global_197);
        v18 = *(_QWORD *)(a1 + 40);
        if (v18)
          v19 = *(_QWORD *)(v18 + 144);
        else
          v19 = 0;
        v20 = (id)HTTPNotificationCenter_center;
        objc_msgSend(v20, "postNotificationName:object:", CFSTR("NWURLLoaderHTTPConnectionProgressNotification"), v19);

      }
      v126 = v10;
      if (!v10 && a4 && (v21 = *(_QWORD *)(a1 + 40)) != 0 && *(_BYTE *)(v21 + 8))
      {
        objc_storeStrong((id *)(v21 + 88), 0);
        v10 = 0;
        if (v9)
        {
LABEL_19:
          if (nw_protocol_copy_http_definition_onceToken != -1)
            dispatch_once(&nw_protocol_copy_http_definition_onceToken, &__block_literal_global_11_72660);
          v22 = (id)nw_protocol_copy_http_definition_http_definition;
          v23 = nw_content_context_copy_protocol_metadata(v9, v22);

          v124 = v23;
          -[NWURLLoaderHTTP responseFromMetadata:](*(_QWORD *)(a1 + 40), v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (gLogDatapath)
          {
            if (__nwlog_url_log::onceToken != -1)
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
            v81 = (id)gurlLogObj;
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
            {
              v82 = *(_QWORD *)(a1 + 40);
              if (v82 && (v83 = *(id *)(v82 + 48)) != 0)
              {
                v84 = v83;
                objc_msgSend(v83, "logDescription");
              }
              else
              {
                v84 = 0;
                v133[0] = 0;
                v133[1] = 0;
                v134 = 0;
              }
              v105 = *(_QWORD *)(a1 + 40);
              if (v105 && (v106 = *(id *)(v105 + 48)) != 0)
              {
                v107 = v106;
                objc_msgSend(v106, "logDescription");
                v108 = v132;
              }
              else
              {
                v108 = 0;
                v107 = 0;
                v130 = 0;
                v131 = 0;
                v132 = 0;
              }
              *(_DWORD *)v135 = 136447746;
              *(_QWORD *)&v135[4] = "-[NWURLLoaderHTTP readResponse]_block_invoke";
              *(_WORD *)&v135[12] = 1042;
              *(_DWORD *)&v135[14] = 16;
              *(_WORD *)&v135[18] = 2098;
              *(_QWORD *)&v135[20] = v133;
              *(_WORD *)&v135[28] = 1024;
              *(_DWORD *)&v135[30] = v108;
              *(_WORD *)&v135[34] = 2112;
              *(_QWORD *)&v135[36] = v24;
              v136 = 1024;
              v137 = a4;
              v138 = 2112;
              v139 = v126;
              _os_log_impl(&dword_182FBE000, v81, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> received response: %@, complete: %{BOOL}d, error: %@", v135, 0x3Cu);

            }
          }
          if ((unint64_t)(objc_msgSend(v24, "statusCode") - 100) <= 0x63
            && objc_msgSend(v24, "statusCode") != 101)
          {
            v38 = *(_QWORD *)(a1 + 40);
            if (v38)
              v39 = *(void **)(v38 + 48);
            else
              v39 = 0;
            objc_msgSend(v39, "loaderDidReceiveInformationalResponse:", v24);
            v41 = *(void **)(a1 + 40);
            if (v41)
            {
              objc_setProperty_nonatomic_copy(v41, v40, newValue, 128);
              v41 = *(void **)(a1 + 40);
            }
            -[NWURLLoaderHTTP readResponse](v41);
            goto LABEL_70;
          }
          v25 = *(_QWORD *)(a1 + 40);
          if (v25)
            v26 = *(void **)(v25 + 48);
          else
            v26 = 0;
          objc_msgSend(v26, "clientMetadata");
          v27 = (id)objc_claimAutoreleasedReturnValue();
          p_isa = &v27->isa;
          if (v27)
          {
            v29 = nw_protocol_metadata_copy_definition(v27);
            if (nw_protocol_copy_http_client_definition_onceToken != -1)
              dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_52_74156);
            is_equal = nw_protocol_definition_is_equal(v29, (nw_protocol_definition_t)nw_protocol_copy_http_client_definition_definition);

            if (is_equal)
            {
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              v146 = 0;
              *(_QWORD *)v135 = MEMORY[0x1E0C809B0];
              *(_QWORD *)&v135[8] = 3221225472;
              *(_QWORD *)&v135[16] = __nw_http_client_metadata_get_sniffed_media_type_block_invoke;
              *(_QWORD *)&v135[24] = &unk_1E14A9D68;
              *(_QWORD *)&v135[32] = buf;
              v31 = p_isa[4];
              if (v31)
              {
                __nw_http_client_metadata_get_sniffed_media_type_block_invoke((uint64_t)v135, v31);
                v32 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
              }
              else
              {
                v32 = 0;
              }
              _Block_object_dispose(buf, 8);

              if (!v32)
              {
LABEL_36:
                if (v126)
                {
                  -[NWURLLoaderHTTP errorForNWError:](*(id **)(a1 + 40), v126);
                  v89 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (v24)
                  {
                    v33 = 0;
                    goto LABEL_39;
                  }
                  -[NWURLLoaderHTTP errorForErrorCode:](*(id **)(a1 + 40), -1005);
                  v89 = objc_claimAutoreleasedReturnValue();
                }
                v33 = (void *)v89;
                if (v89)
                {
                  v92 = *(_QWORD *)(a1 + 40);
                  if (v92)
                  {
                    v94 = *(_QWORD *)(v92 + 88);
                    v93 = (id *)(v92 + 88);
                    if (!v94)
                      objc_storeStrong(v93, v33);
                  }
                }
LABEL_39:
                v34 = (a4 & 1) != 0 || objc_msgSend(v24, "statusCode") == 101;
                v35 = *(_QWORD *)(a1 + 40);
                if (!v35)
                  goto LABEL_165;
                *(_BYTE *)(v35 + 11) = v34;
                v36 = *(_QWORD *)(a1 + 40);
                if (!v36)
                  goto LABEL_165;
                if (!*(_BYTE *)(v36 + 13))
                {
LABEL_54:
                  v43 = *(_BYTE **)(a1 + 40);
                  if (!v43 || !v43[15])
                  {
LABEL_62:
                    objc_msgSend(v43, "multipartMixedReplaceBoundary", v120, v121);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v49 = v48 == 0;

                    v50 = *(_QWORD *)(a1 + 40);
                    if (!v49)
                    {
                      if (!v50)
                        goto LABEL_168;
                      v51 = *(_QWORD **)(v50 + 96);
                      if (!v51)
                      {
LABEL_67:
                        v54 = *(_QWORD *)(v50 + 88);
LABEL_68:
                        (*((void (**)(id, void *, uint64_t))newValue + 2))(newValue, v24, v54);
LABEL_69:

LABEL_70:
LABEL_71:

                        v10 = v126;
                        goto LABEL_72;
                      }
                      v52 = (void *)v51[3];
                      v51[3] = 0;

                      v53 = (void *)v51[5];
                      v51[4] = 0;
                      v51[5] = 0;

                      v50 = *(_QWORD *)(a1 + 40);
                    }
                    if (v50)
                      goto LABEL_67;
LABEL_168:
                    v54 = 0;
                    goto LABEL_68;
                  }
                  if (objc_msgSend(v24, "statusCode") == 304)
                  {
                    v44 = *(_QWORD **)(a1 + 40);
                    if (v44)
                      v44 = (_QWORD *)v44[13];
                    v45 = v44;
                    objc_msgSend(v45, "response");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    (*((void (**)(id, void *, _QWORD))newValue + 2))(newValue, v46, 0);

                    goto LABEL_69;
                  }
                  v47 = *(_QWORD *)(a1 + 40);
                  if (v47)
                  {
                    *(_BYTE *)(v47 + 14) = 0;
                    v43 = *(_BYTE **)(a1 + 40);
                    goto LABEL_62;
                  }
LABEL_165:
                  v43 = 0;
                  goto LABEL_62;
                }
                v37 = *(id *)(v36 + 88);
                if (v37)
                {
LABEL_46:

                  goto LABEL_54;
                }
                v42 = *(_QWORD *)(a1 + 40);
                if (v42)
                {
                  if (*(_BYTE *)(v42 + 15))
                    goto LABEL_54;
                  v55 = *(void **)(v42 + 48);
                }
                else
                {
                  v55 = 0;
                }
                objc_msgSend(v55, "loaderDataTask", v120, v121);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = *(_QWORD *)(a1 + 40);
                if (v57)
                {
                  v58 = *(void **)(v57 + 96);
                  v59 = *(void **)(v57 + 24);
                }
                else
                {
                  v58 = 0;
                  v59 = 0;
                }
                v60 = v58;
                v122 = v59;
                v123 = v24;
                v37 = v56;
                if (!v60)
                {
LABEL_100:

                  goto LABEL_46;
                }
                *((_QWORD *)v60 + 2) = 0;
                objc_storeStrong((id *)v60 + 7, v59);
                objc_storeStrong((id *)v60 + 5, v24);
                objc_storeStrong((id *)v60 + 6, v56);
                objc_storeStrong((id *)v60 + 3, MEMORY[0x1E0C80D00]);
                v61 = *((_QWORD *)v60 + 2);
                if (v61)
                {
                  if (v61 != 1)
                  {
                    v61 = 0;
                    goto LABEL_84;
                  }
                  v62 = *((id *)v60 + 1);
                  v63 = objc_msgSend(v62, "memoryCapacity");
                  objc_msgSend(*((id *)v60 + 1), "_maxCacheableEntrySizeRatio");
                  v65 = v64;

                  v61 = (unint64_t)(v65 * (double)v63);
                }
                v66 = *((id *)v60 + 1);
                v67 = objc_msgSend(v66, "diskCapacity");
                objc_msgSend(*((id *)v60 + 1), "_maxCacheableEntrySizeRatio");
                v69 = v68;

                v70 = v69 * (double)v67;
                if (v61 <= (unint64_t)v70)
                  v61 = (unint64_t)v70;
LABEL_84:
                *((_QWORD *)v60 + 4) = v61;
                v71 = objc_msgSend(*((id *)v60 + 5), "statusCode");
                if (v71 <= 300)
                {
                  if (v71 != 200 && v71 != 203)
                    goto LABEL_99;
                }
                else if (((unint64_t)(v71 - 301) > 7 || ((1 << (v71 - 45)) & 0x89) == 0)
                       && v71 != 410
                       && v71 != 404)
                {
                  goto LABEL_99;
                }
                objc_msgSend(*((id *)v60 + 5), "valueForHTTPHeaderField:", CFSTR("Cache-Control"));
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = v72;
                if (!v72 || (objc_msgSend(v72, "rangeOfString:options:", CFSTR("no-store"), 1), !v74))
                {
                  objc_msgSend(*((id *)v60 + 7), "valueForHTTPHeaderField:", CFSTR("Cache-Control"));
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  v76 = v75;
                  if (!v75
                    || (objc_msgSend(v75, "rangeOfString:options:", CFSTR("no-store"), 1), !v77)
                    && (objc_msgSend(v76, "rangeOfString:options:", CFSTR("no-cache"), 1), !v78))
                  {

                    if (objc_msgSend(v123, "expectedContentLength") <= (uint64_t)v61)
                      goto LABEL_100;
                    goto LABEL_99;
                  }

                }
LABEL_99:
                v79 = (void *)*((_QWORD *)v60 + 3);
                *((_QWORD *)v60 + 3) = 0;

                v80 = (void *)*((_QWORD *)v60 + 5);
                *((_QWORD *)v60 + 4) = 0;
                *((_QWORD *)v60 + 5) = 0;

                goto LABEL_100;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v32);
              p_isa = (_QWORD *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "_setMIMEType:", p_isa);
LABEL_35:

              goto LABEL_36;
            }
            __nwlog_obj();
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
            LODWORD(v121) = 12;
            v120 = buf;
            v86 = (char *)_os_log_send_and_compose_impl();

            type = OS_LOG_TYPE_ERROR;
            v128 = 0;
            if (__nwlog_fault(v86, &type, &v128))
            {
              if (type == OS_LOG_TYPE_FAULT)
              {
                __nwlog_obj();
                v87 = objc_claimAutoreleasedReturnValue();
                v91 = type;
                if (os_log_type_enabled(v87, type))
                {
                  *(_DWORD *)buf = 136446210;
                  *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
                  _os_log_impl(&dword_182FBE000, v87, v91, "%{public}s metadata must be http_client", buf, 0xCu);
                }
              }
              else if (v128)
              {
                backtrace_string = (char *)__nw_create_backtrace_string();
                __nwlog_obj();
                v87 = objc_claimAutoreleasedReturnValue();
                v103 = type;
                v104 = os_log_type_enabled(v87, type);
                if (backtrace_string)
                {
                  if (v104)
                  {
                    *(_DWORD *)buf = 136446466;
                    *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
                    *(_WORD *)&buf[12] = 2082;
                    *(_QWORD *)&buf[14] = backtrace_string;
                    _os_log_impl(&dword_182FBE000, v87, v103, "%{public}s metadata must be http_client, dumping backtrace:%{public}s", buf, 0x16u);
                  }

                  free(backtrace_string);
                  if (!v86)
                    goto LABEL_162;
                  goto LABEL_161;
                }
                if (v104)
                {
                  *(_DWORD *)buf = 136446210;
                  *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
                  _os_log_impl(&dword_182FBE000, v87, v103, "%{public}s metadata must be http_client, no backtrace", buf, 0xCu);
                }
              }
              else
              {
                __nwlog_obj();
                v87 = objc_claimAutoreleasedReturnValue();
                v110 = type;
                if (os_log_type_enabled(v87, type))
                {
                  *(_DWORD *)buf = 136446210;
                  *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
                  _os_log_impl(&dword_182FBE000, v87, v110, "%{public}s metadata must be http_client, backtrace limit exceeded", buf, 0xCu);
                }
              }
              goto LABEL_159;
            }
LABEL_160:
            if (!v86)
            {
LABEL_162:

              goto LABEL_35;
            }
LABEL_161:
            free(v86);
            goto LABEL_162;
          }
          __nwlog_obj();
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
          LODWORD(v121) = 12;
          v120 = buf;
          v86 = (char *)_os_log_send_and_compose_impl();

          type = OS_LOG_TYPE_ERROR;
          v128 = 0;
          if (!__nwlog_fault(v86, &type, &v128))
            goto LABEL_160;
          if (type == OS_LOG_TYPE_FAULT)
          {
            __nwlog_obj();
            v87 = objc_claimAutoreleasedReturnValue();
            v88 = type;
            if (os_log_type_enabled(v87, type))
            {
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
              _os_log_impl(&dword_182FBE000, v87, v88, "%{public}s called with null metadata", buf, 0xCu);
            }
          }
          else if (v128)
          {
            v99 = (char *)__nw_create_backtrace_string();
            __nwlog_obj();
            v87 = objc_claimAutoreleasedReturnValue();
            v100 = type;
            v101 = os_log_type_enabled(v87, type);
            if (v99)
            {
              if (v101)
              {
                *(_DWORD *)buf = 136446466;
                *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
                *(_WORD *)&buf[12] = 2082;
                *(_QWORD *)&buf[14] = v99;
                _os_log_impl(&dword_182FBE000, v87, v100, "%{public}s called with null metadata, dumping backtrace:%{public}s", buf, 0x16u);
              }

              free(v99);
              goto LABEL_160;
            }
            if (v101)
            {
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
              _os_log_impl(&dword_182FBE000, v87, v100, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
            }
          }
          else
          {
            __nwlog_obj();
            v87 = objc_claimAutoreleasedReturnValue();
            v109 = type;
            if (os_log_type_enabled(v87, type))
            {
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
              _os_log_impl(&dword_182FBE000, v87, v109, "%{public}s called with null metadata, backtrace limit exceeded", buf, 0xCu);
            }
          }
LABEL_159:

          goto LABEL_160;
        }
      }
      else if (v9)
      {
        goto LABEL_19;
      }
      v95 = *(_QWORD *)(a1 + 40);
      if (v95)
      {
        v96 = *(id *)(v95 + 88);
        if (v96)
        {
LABEL_175:
          if (gLogDatapath)
          {
            v111 = v96;
            if (__nwlog_url_log::onceToken != -1)
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
            v112 = (id)gurlLogObj;
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
            {
              v113 = *(_QWORD *)(a1 + 40);
              if (v113 && (v114 = *(id *)(v113 + 48)) != 0)
              {
                v115 = v114;
                objc_msgSend(v114, "logDescription");
              }
              else
              {
                v115 = 0;
                v143[0] = 0;
                v143[1] = 0;
                v144 = 0;
              }
              v116 = *(_QWORD *)(a1 + 40);
              if (v116 && (v117 = *(id *)(v116 + 48)) != 0)
              {
                v118 = v117;
                objc_msgSend(v117, "logDescription");
                v119 = v142;
              }
              else
              {
                v119 = 0;
                v118 = 0;
                v140 = 0;
                v141 = 0;
                v142 = 0;
              }
              *(_DWORD *)v135 = 136447234;
              *(_QWORD *)&v135[4] = "-[NWURLLoaderHTTP readResponse]_block_invoke";
              *(_WORD *)&v135[12] = 1042;
              *(_DWORD *)&v135[14] = 16;
              *(_WORD *)&v135[18] = 2098;
              *(_QWORD *)&v135[20] = v143;
              *(_WORD *)&v135[28] = 1024;
              *(_DWORD *)&v135[30] = v119;
              *(_WORD *)&v135[34] = 2112;
              *(_QWORD *)&v135[36] = v126;
              _os_log_impl(&dword_182FBE000, v112, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> received no response with error: %@", v135, 0x2Cu);

            }
            v96 = v111;
          }
          v124 = v96;
          (*((void (**)(id, _QWORD, NSObject *))newValue + 2))(newValue, 0, v96);
          goto LABEL_71;
        }
        v97 = *(id **)(a1 + 40);
        if (v10)
          goto LABEL_129;
      }
      else
      {
        v97 = 0;
        if (v10)
        {
LABEL_129:
          -[NWURLLoaderHTTP errorForNWError:](v97, v10);
          v98 = objc_claimAutoreleasedReturnValue();
LABEL_174:
          v96 = v98;
          goto LABEL_175;
        }
      }
      -[NWURLLoaderHTTP errorForErrorCode:](v97, -1011);
      v98 = objc_claimAutoreleasedReturnValue();
      goto LABEL_174;
    }
LABEL_164:
    _os_crash();
    __break(1u);
  }
LABEL_72:

}

- (void)stopResponseStallTimer
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 152);
    if (v3)
    {
      nw_queue_cancel_source(v3, a2);
      *(_QWORD *)(a1 + 152) = 0;
      if (*(_QWORD *)(a1 + 144))
      {
        if (HTTPNotificationCenter_onceToken != -1)
          dispatch_once(&HTTPNotificationCenter_onceToken, &__block_literal_global_197);
        v4 = *(_QWORD *)(a1 + 144);
        v5 = (id)HTTPNotificationCenter_center;
        objc_msgSend(v5, "removeObserver:name:object:", a1, CFSTR("NWURLLoaderHTTPConnectionProgressNotification"), v4);

      }
    }
  }
}

- (id)errorForErrorCode:(id *)a1
{
  NWURLError *v4;
  void *v5;
  id *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  objc_super v12;

  if (!a1)
    return 0;
  v4 = [NWURLError alloc];
  objc_msgSend(a1[6], "loaderTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1;
  v7 = v5;
  if (v4)
  {
    v8 = *MEMORY[0x1E0CB32E8];
    v12.receiver = v4;
    v12.super_class = (Class)NWURLError;
    v9 = objc_msgSendSuper2(&v12, sel_initWithDomain_code_userInfo_, v8, a2, 0);
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "fillErrorForLoader:andTask:", v6, v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)responseFromMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  _BOOL8 v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int version;
  id v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v6 = nw_http_metadata_copy_response(v3);
    v7 = v6;
    if (v6)
    {
      v8 = v6;
      objc_opt_self();
      v34 = v8;
      if ((nw_http_response_get_status_code(v8) - 200) > 0x63)
      {
        v26 = 0;
      }
      else
      {
        v36 = 0;
        v37 = &v36;
        v38 = 0x3032000000;
        v39 = __Block_byref_object_copy__71860;
        v40 = __Block_byref_object_dispose__71861;
        v41 = 0;
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __61__NWURLLoaderHTTP_multipartMixedReplaceBoundaryFromResponse___block_invoke;
        v35[3] = &unk_1E14AA0E8;
        v35[4] = &v36;
        nw_http_fields_access_value_by_name(v8, (unint64_t)"Content-Type", v35);
        v9 = (void *)v37[5];
        if (v9)
        {
          objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(";"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("multipart/x-mixed-replace"));
          v33 = v11;

          if (v14)
          {
            for (i = 1; i < objc_msgSend(v10, "count"); ++i)
            {
              objc_msgSend(v10, "objectAtIndexedSubscript:", i);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "rangeOfString:", CFSTR("="));
              if (v17 != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v16, "substringToIndex:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v16, "substringFromIndex:", v17 + 1);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "stringByTrimmingCharactersInSet:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v20, "isEqualToString:", CFSTR("boundary")))
                {
                  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v24);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = (void *)objc_msgSend(v25, "mutableCopy");

                  if ((unint64_t)objc_msgSend(v26, "length") >= 2
                    && objc_msgSend(v26, "hasPrefix:", CFSTR("\"))
                    && objc_msgSend(v26, "hasSuffix:", CFSTR("\")))
                  {
                    objc_msgSend(v26, "deleteCharactersInRange:", 0, 1);
                    objc_msgSend(v26, "deleteCharactersInRange:", objc_msgSend(v26, "length") - 1, 1);
                  }

                  goto LABEL_21;
                }

              }
            }
          }
          v26 = 0;
LABEL_21:

        }
        else
        {
          v26 = 0;
        }
        _Block_object_dispose(&v36, 8);

      }
      v27 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v26;

      version = nw_http_metadata_get_version(v4);
      v29 = *(id *)(a1 + 24);
      v5 = nw_http_response_copy_url_response(v34, 0, v29, **((void ***)&unk_1E14AD2F8 + version));

      objc_msgSend(*(id *)(a1 + 48), "clientMetadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = nw_http_client_metadata_copy_current_transaction_metadata(v30);

      nw_http_transaction_metadata_set_converted_url_response(v31, v5);
    }
    else
    {
      v5 = 0;
    }

  }
  return (id)v5;
}

void __61__NWURLLoaderHTTP_multipartMixedReplaceBoundaryFromResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (void)cancelConnection
{
  void *v2;
  id v3;
  id v4;
  void *v5;

  if (a1 && !*(_BYTE *)(a1 + 12))
  {
    v2 = *(void **)(a1 + 72);
    if (v2)
    {
      *(_BYTE *)(a1 + 12) = 1;
      v3 = *(id *)(a1 + 40);
      v4 = v2;
      -[NWURLSessionTaskConfiguration activity]((uint64_t)v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      nw_connection_end_activity(v4, v5);

      nw_connection_cancel(*(nw_connection_t *)(a1 + 72));
    }
  }
}

- (void)continueLoading
{
  uint64_t *v1;
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NWConcrete_nw_protocol_options *options;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  _NSHTTPAlternativeServicesStorage *v19;
  NWConcrete_nw_http_alt_svc_storage *v20;
  _NSHTTPAlternativeServicesStorage *storage;
  void *v22;
  id v23;
  uint64_t v24;
  char v25;
  NWConcrete_nw_protocol_options *v26;
  id *v27;
  id v28;
  BOOL is_equal_unsafe;
  NSObject *v30;
  NWConcrete_nw_protocol_options *v31;
  uint64_t v32;
  uint64_t v33;
  NWConcrete_nw_http_cookie_storage *v34;
  NWConcrete_nw_http_cookie_storage *v35;
  NWConcrete_nw_protocol_options *v36;
  uint64_t v37;
  void *v38;
  NWConcrete_nw_protocol_options *v39;
  id v40;
  id *v41;
  id v42;
  BOOL v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  uint64_t v47;
  void *v48;
  NWConcrete_nw_protocol_options *v49;
  NWConcrete_nw_protocol_options *v50;
  id *v51;
  id v52;
  BOOL v53;
  uint64_t v54;
  char v55;
  NWConcrete_nw_protocol_options *v56;
  NWConcrete_nw_protocol_options *v57;
  id *v58;
  id v59;
  BOOL v60;
  uint64_t v61;
  char v62;
  const void *v63;
  NWConcrete_nw_protocol_options *v64;
  NWConcrete_nw_protocol_options *v65;
  id *v66;
  id v67;
  BOOL v68;
  uint64_t v69;
  NWConcrete_nw_protocol_options *v70;
  NWConcrete_nw_protocol_options *v71;
  id *v72;
  id v73;
  BOOL v74;
  void *v75;
  void *v76;
  void *v77;
  NSHTTPCookieStorage *v78;
  NWConcrete_nw_http_cookie_storage *v79;
  NSHTTPCookieStorage *cookieStorage;
  uint64_t v81;
  NSHTTPCookieStorage *v82;
  NSHTTPCookieStorageInternal *internal;
  void *v84;
  void *v85;
  NSHTTPCookieStorage *v86;
  NWConcrete_nw_http_cookie_storage *v87;
  NSHTTPCookieStorage *v88;
  NSHTTPCookieStorageInternal *v89;
  NWConcrete_nw_protocol_options *v90;
  unint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  _QWORD *v94;
  void *v95;
  _BOOL8 v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  id v101;
  _BOOL8 v102;
  id *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  id v108;
  id v109;
  id *v110;
  void *v111;
  void *v112;
  char *v113;
  NSObject *v114;
  os_log_type_t v115;
  void *v116;
  os_log_type_t v117;
  char *backtrace_string;
  os_log_type_t v119;
  _BOOL4 v120;
  os_log_type_t v121;
  _BOOL4 v122;
  void *v123;
  char *v124;
  NSObject *v125;
  os_log_type_t v126;
  void *v127;
  void *v128;
  NSObject *v129;
  os_log_type_t v130;
  void *v131;
  char *v132;
  NSObject *v133;
  os_log_type_t v134;
  void *v135;
  os_log_type_t v136;
  void *v137;
  os_log_type_t v138;
  void *v139;
  os_log_type_t v140;
  void *v141;
  char *v142;
  NSObject *v143;
  os_log_type_t v144;
  void *v145;
  os_log_type_t v146;
  char *v147;
  _BOOL4 v148;
  char *v149;
  _BOOL4 v150;
  char *v151;
  os_log_type_t v152;
  _BOOL4 v153;
  char *v154;
  _BOOL4 v155;
  char *v156;
  _BOOL4 v157;
  char *v158;
  os_log_type_t v159;
  _BOOL4 v160;
  os_log_type_t v161;
  os_log_type_t v162;
  void *v163;
  char *v164;
  NSObject *v165;
  os_log_type_t v166;
  char *v167;
  os_log_type_t v168;
  _BOOL4 v169;
  void *v170;
  os_log_type_t v171;
  char *v172;
  os_log_type_t v173;
  _BOOL4 v174;
  char *v175;
  os_log_type_t v176;
  _BOOL4 v177;
  char *v178;
  os_log_type_t v179;
  _BOOL4 v180;
  os_log_type_t v181;
  os_log_type_t v182;
  os_log_type_t v183;
  os_log_type_t v184;
  os_log_type_t v185;
  os_log_type_t v186;
  os_log_type_t v187;
  os_log_type_t v188;
  os_log_type_t v189;
  os_log_type_t v190;
  uint64_t *v191;
  NWConcrete_nw_protocol_options *v192;
  uint64_t v193;
  void *v194;
  NWConcrete_nw_hsts_storage *v195;
  _NSHSTSStorage *HSTSStorage;
  uint64_t v197;
  NSObject *v198;
  NWConcrete_nw_protocol_options *v199;
  void *v200;
  id *v201;
  id v202;
  BOOL v203;
  uint64_t v204;
  char v205;
  NSObject *v206;
  id *v207;
  id v208;
  BOOL v209;
  NSObject *v210;
  NWConcrete_nw_protocol_options *v211;
  NWConcrete_nw_protocol_options *v212;
  NWConcrete_nw_protocol_options *v213;
  NWConcrete_nw_protocol_options *v214;
  _QWORD *v215;
  id *v216;
  id v217;
  BOOL v218;
  _BOOL4 v219;
  _QWORD *v220;
  id *v221;
  id v222;
  BOOL v223;
  id v224;
  void *v225;
  NSObject *v226;
  nw_connection_t v227;
  void *v228;
  NSObject *v229;
  id v230;
  id v231;
  uint64_t id;
  uint64_t v233;
  void *v234;
  BOOL v235;
  NWURLError *v236;
  void *v237;
  id v238;
  id v239;
  uint64_t v240;
  NWURLError *v241;
  void *v242;
  void *v243;
  char *v244;
  NSObject *v245;
  os_log_type_t v246;
  void *v247;
  char *v248;
  NSObject *v249;
  os_log_type_t v250;
  void *v251;
  char *v252;
  NSObject *v253;
  os_log_type_t v254;
  void *v255;
  char *v256;
  NSObject *v257;
  os_log_type_t v258;
  void *v259;
  os_log_type_t v260;
  void *v261;
  os_log_type_t v262;
  void *v263;
  os_log_type_t v264;
  void *v265;
  os_log_type_t v266;
  char *v267;
  os_log_type_t v268;
  _BOOL4 v269;
  char *v270;
  os_log_type_t v271;
  _BOOL4 v272;
  char *v273;
  _BOOL4 v274;
  char *v275;
  _BOOL4 v276;
  char *v277;
  os_log_type_t v278;
  _BOOL4 v279;
  os_log_type_t v280;
  _BOOL4 v281;
  char *v282;
  _BOOL4 v283;
  char *v284;
  _BOOL4 v285;
  _BOOL4 v286;
  void *v287;
  void *v288;
  uint64_t v289;
  float v290;
  float v291;
  int v292;
  uint64_t v293;
  int v294;
  char v295;
  uint64_t v296;
  void *v297;
  void *v298;
  id v299;
  id v300;
  id v301;
  id v302;
  void *v303;
  void *v304;
  id v305;
  void *v306;
  void *v307;
  _BOOL4 v308;
  NSObject *metadata_for_request;
  uint64_t v310;
  _BOOL4 v311;
  NSObject *v312;
  void (**v313)(_QWORD);
  SEL v314;
  void *v315;
  os_log_type_t v316;
  os_log_type_t v317;
  os_log_type_t v318;
  os_log_type_t v319;
  os_log_type_t v320;
  os_log_type_t v321;
  os_log_type_t v322;
  os_log_type_t v323;
  _BYTE *v324;
  uint64_t v325;
  void *v326;
  uint64_t v327;
  void *v328;
  _BOOL4 v329;
  id v330;
  NSObject *v331;
  NSObject *v332;
  os_log_type_t v333;
  os_log_type_t v334;
  id v335;
  void *v336;
  void *v337;
  NWConcrete_nw_http_cookie_storage *v338;
  _NSHSTSStorage *v339;
  void *v340;
  void *v341;
  id v342;
  NSObject *v343;
  NSObject *protocol;
  os_log_type_t type;
  os_log_type_t typea;
  os_log_type_t typeb;
  os_log_type_t typec;
  NWConcrete_nw_protocol_options *typed;
  nw_endpoint_t endpoint;
  nw_parameters_t parameters;
  NWConcrete_nw_protocol_options *v352;
  NSObject *stack;
  _QWORD v354[5];
  id v355;
  _QWORD v356[5];
  _QWORD v357[5];
  _QWORD v358[5];
  _QWORD v359[5];
  _QWORD v360[5];
  id v361;
  _QWORD v362[5];
  _QWORD v363[4];
  nw_endpoint_t v364;
  uint64_t v365;
  char v366;
  os_log_type_t v367;
  uint64_t v368;
  uint64_t v369;
  unsigned int v370;
  _QWORD v371[2];
  int v372;
  _BYTE buf[24];
  __int128 v374;
  uint64_t v375;

  v375 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v4 = *(id *)(a1 + 24);
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fixInvalidHTTPURL(v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = nw_endpoint_create_with_cfurl((const __CFURL *)v6);
  if (v7 && (v8 = (id)v7, v9 = objc_msgSend(v8, "hostname"), v8, v9))
  {
    v10 = MEMORY[0x1E0C809B0];
    v363[0] = MEMORY[0x1E0C809B0];
    v2 = 3221225472;
    v363[1] = 3221225472;
    v363[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke;
    v363[3] = &unk_1E14A98F8;
    endpoint = (nw_endpoint_t)v8;
    v364 = endpoint;
    v365 = a1;
    v362[0] = v10;
    v362[1] = 3221225472;
    v362[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_7;
    v362[3] = &unk_1E14A9960;
    v362[4] = a1;
    parameters = nw_parameters_create_secure_http_messaging(v363, &__block_literal_global_86, &__block_literal_global_71881, &__block_literal_global_27_71882, v362);
    stack = nw_parameters_copy_default_protocol_stack(parameters);
    v1 = &qword_1EDCE3000;
    if (nw_protocol_copy_http_alt_svc_definition_onceToken == -1)
      goto LABEL_5;
  }
  else
  {
    _os_crash();
    __break(1u);
  }
  dispatch_once(&nw_protocol_copy_http_alt_svc_definition_onceToken, &__block_literal_global_14_72702);
LABEL_5:
  options = nw_protocol_create_options((void *)nw_protocol_copy_http_alt_svc_definition_http_alt_svc_definition);
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
  {
    v13 = *(_QWORD *)(v12 + 24);
    if (v13)
    {
      v14 = *(id *)(v13 + 392);
      v15 = v14;
      if (v14)
      {
        v16 = (void *)*((_QWORD *)v14 + 8);
        if (!v16)
        {
          objc_msgSend(*((id *)v14 + 11), "_alternativeServicesStorage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            v19 = v17;
            v20 = objc_alloc_init(NWConcrete_nw_http_alt_svc_storage);
            storage = v20->storage;
            v20->storage = v19;

            v22 = (void *)v15[8];
            v15[8] = v20;

          }
          v16 = (void *)v15[8];
        }
        v23 = v16;
      }
      else
      {
        v23 = 0;
      }
    }
    else
    {
      v15 = 0;
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }
  nw_http_alt_svc_options_set_alt_svc_storage(options, v23);

  v24 = *(_QWORD *)(a1 + 40);
  if (v24)
    v25 = objc_msgSend(*(id *)(v24 + 32), "assumesHTTP3Capable");
  else
    v25 = 0;
  v26 = options;
  protocol = &v26->super;
  if (!v26)
  {
    __nwlog_obj();
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
    LODWORD(v325) = 12;
    v324 = buf;
    v113 = (char *)_os_log_send_and_compose_impl();

    v367 = OS_LOG_TYPE_ERROR;
    v366 = 0;
    if (!__nwlog_fault(v113, &v367, &v366))
      goto LABEL_245;
    if (v367 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v114 = objc_claimAutoreleasedReturnValue();
      v115 = v367;
      if (os_log_type_enabled(v114, v367))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_182FBE000, v114, v115, "%{public}s called with null options", buf, 0xCu);
      }
      goto LABEL_244;
    }
    if (!v366)
    {
      __nwlog_obj();
      v114 = objc_claimAutoreleasedReturnValue();
      v161 = v367;
      if (os_log_type_enabled(v114, v367))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_182FBE000, v114, v161, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_244;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v114 = objc_claimAutoreleasedReturnValue();
    v119 = v367;
    v120 = os_log_type_enabled(v114, v367);
    if (!backtrace_string)
    {
      if (v120)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_182FBE000, v114, v119, "%{public}s called with null options, no backtrace", buf, 0xCu);
      }
      goto LABEL_244;
    }
    if (v120)
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = backtrace_string;
      _os_log_impl(&dword_182FBE000, v114, v119, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_138;
  }
  v27 = v26;
  v28 = v27[1];

  if (v1[392] != -1)
    dispatch_once(&nw_protocol_copy_http_alt_svc_definition_onceToken, &__block_literal_global_14_72702);
  is_equal_unsafe = nw_protocol_definition_is_equal_unsafe((uint64_t)v28, nw_protocol_copy_http_alt_svc_definition_http_alt_svc_definition);

  if (!is_equal_unsafe)
  {
    __nwlog_obj();
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
    LODWORD(v325) = 12;
    v324 = buf;
    v113 = (char *)_os_log_send_and_compose_impl();

    v367 = OS_LOG_TYPE_ERROR;
    v366 = 0;
    if (!__nwlog_fault(v113, &v367, &v366))
      goto LABEL_245;
    if (v367 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v114 = objc_claimAutoreleasedReturnValue();
      v117 = v367;
      if (os_log_type_enabled(v114, v367))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_182FBE000, v114, v117, "%{public}s protocol options are not http_alt_svc", buf, 0xCu);
      }
LABEL_244:

LABEL_245:
      v30 = protocol;
      if (v113)
        free(v113);
      goto LABEL_21;
    }
    if (!v366)
    {
      __nwlog_obj();
      v114 = objc_claimAutoreleasedReturnValue();
      v162 = v367;
      if (os_log_type_enabled(v114, v367))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_182FBE000, v114, v162, "%{public}s protocol options are not http_alt_svc, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_244;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v114 = objc_claimAutoreleasedReturnValue();
    v121 = v367;
    v122 = os_log_type_enabled(v114, v367);
    if (!backtrace_string)
    {
      if (v122)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_182FBE000, v114, v121, "%{public}s protocol options are not http_alt_svc, no backtrace", buf, 0xCu);
      }
      goto LABEL_244;
    }
    if (v122)
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = backtrace_string;
      _os_log_impl(&dword_182FBE000, v114, v121, "%{public}s protocol options are not http_alt_svc, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_138:

    free(backtrace_string);
    goto LABEL_245;
  }
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = v2;
  *(_QWORD *)&buf[16] = __nw_http_alt_svc_options_set_assumes_http3_capable_block_invoke;
  *(_QWORD *)&v374 = &__block_descriptor_33_e9_B16__0_v8l;
  BYTE8(v374) = v25;
  nw_protocol_options_access_handle(v27, buf);
  v30 = protocol;
LABEL_21:

  nw_protocol_stack_prepend_application_protocol(stack, protocol);
  if (nw_protocol_copy_http_client_bottom_definition_onceToken != -1)
    dispatch_once(&nw_protocol_copy_http_client_bottom_definition_onceToken, &__block_literal_global_56);
  v31 = nw_protocol_create_options((void *)nw_protocol_copy_http_client_bottom_definition_definition);
  nw_protocol_stack_prepend_application_protocol(stack, &v31->super);

  v32 = *(_QWORD *)(a1 + 40);
  if (!v32)
    goto LABEL_90;
  v33 = *(_QWORD *)(v32 + 24);
  if (v33 && *(_BYTE *)(v33 + 20))
  {
    v34 = (NWConcrete_nw_http_cookie_storage *)*(id *)(v33 + 424);
    if (v34)
      goto LABEL_27;
    goto LABEL_90;
  }
  if (*(_QWORD *)(v32 + 32))
    v63 = (const void *)CFURLRequestCopyHTTPCookieStorage();
  else
    v63 = 0;
  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage", v324, v325);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75;
  if (v63)
  {
    if (v63 != (const void *)objc_msgSend(v75, "_cookieStorage"))
    {
      v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C08]), "_initWithCFHTTPCookieStorage:", v63);
      CFRelease(v63);
      v78 = v77;
      v79 = objc_alloc_init(NWConcrete_nw_http_cookie_storage);
      cookieStorage = v79->cookieStorage;
      v79->cookieStorage = v78;

      goto LABEL_89;
    }
    CFRelease(v63);
  }
  v81 = *(_QWORD *)(v32 + 24);
  if (!v81)
    goto LABEL_611;
  v82 = (NSHTTPCookieStorage *)*(id *)(v81 + 392);
  v78 = v82;
  if (v82)
  {
    internal = v82[2]._internal;
    if (!internal)
    {
      -[NSHTTPCookieStorageInternal HTTPCookieStorage](v82[5]._internal, "HTTPCookieStorage");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v84;
      if (v84)
      {
        v86 = v84;
        v87 = objc_alloc_init(NWConcrete_nw_http_cookie_storage);
        v88 = v87->cookieStorage;
        v87->cookieStorage = v86;

        v89 = v78[2]._internal;
        v78[2]._internal = (NSHTTPCookieStorageInternal *)v87;

      }
      internal = v78[2]._internal;
    }
    v79 = internal;
  }
  else
  {
    v79 = 0;
  }
LABEL_89:
  while (2)
  {

    v34 = v79;
    if (v79)
    {
LABEL_27:
      v35 = v34;
      if (nw_protocol_copy_http_cookie_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_13_72674);
      v36 = nw_protocol_create_options((void *)nw_protocol_copy_http_cookie_definition_http_cookie_definition);
      nw_http_cookie_options_set_cookie_storage(v36, v35);
      v37 = *(_QWORD *)(a1 + 40);
      if (!v37)
      {
        v38 = 0;
        goto LABEL_54;
      }
      objc_msgSend(*(id *)(v37 + 24), "_cookieTransformCallback");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
LABEL_37:
        v44 = *(_QWORD *)(a1 + 40);
        if (!v44)
          goto LABEL_54;
        objc_msgSend(*(id *)(v44 + 24), "_siteForCookies");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45 == 0;

        if (v46)
          goto LABEL_54;
        v47 = *(_QWORD *)(a1 + 40);
        if (v47)
        {
          objc_msgSend(*(id *)(v47 + 24), "_siteForCookies");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v48 = 0;
        }
        v49 = v36;
        v50 = v49;
        if (v49)
        {
          v51 = v49;
          v52 = v51[1];

          if (nw_protocol_copy_http_cookie_definition_onceToken != -1)
            dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_13_72674);
          v53 = nw_protocol_definition_is_equal_unsafe((uint64_t)v52, nw_protocol_copy_http_cookie_definition_http_cookie_definition);

          if (v53)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = v2;
            *(_QWORD *)&buf[16] = __nw_http_cookie_options_set_site_for_cookies_block_invoke;
            *(_QWORD *)&v374 = &__block_descriptor_40_e9_B16__0_v8l;
            *((_QWORD *)&v374 + 1) = v48;
            nw_protocol_options_access_handle(v51, buf);
            goto LABEL_46;
          }
          __nwlog_obj();
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
          LODWORD(v325) = 12;
          v324 = buf;
          v128 = (void *)_os_log_send_and_compose_impl();

          v367 = OS_LOG_TYPE_ERROR;
          v366 = 0;
          if (__nwlog_fault((const char *)v128, &v367, &v366))
          {
            if (v367 == OS_LOG_TYPE_FAULT)
            {
              __nwlog_obj();
              v129 = objc_claimAutoreleasedReturnValue();
              v138 = v367;
              if (os_log_type_enabled(v129, v367))
              {
                *(_DWORD *)buf = 136446210;
                *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
                _os_log_impl(&dword_182FBE000, v129, v138, "%{public}s protocol options are not http_cookie", buf, 0xCu);
              }
            }
            else if (v366)
            {
              v156 = (char *)__nw_create_backtrace_string();
              __nwlog_obj();
              v129 = objc_claimAutoreleasedReturnValue();
              typec = v367;
              v157 = os_log_type_enabled(v129, v367);
              if (v156)
              {
                if (v157)
                {
                  *(_DWORD *)buf = 136446466;
                  *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
                  *(_WORD *)&buf[12] = 2082;
                  *(_QWORD *)&buf[14] = v156;
                  _os_log_impl(&dword_182FBE000, v129, typec, "%{public}s protocol options are not http_cookie, dumping backtrace:%{public}s", buf, 0x16u);
                }

                free(v156);
                if (!v128)
                {
LABEL_46:

                  v54 = *(_QWORD *)(a1 + 40);
                  if (v54)
                    v55 = objc_msgSend(*(id *)(v54 + 24), "_isTopLevelNavigation");
                  else
                    v55 = 0;
                  v56 = v50;
                  v57 = v56;
                  if (v50)
                  {
                    v58 = v56;
                    v59 = v58[1];

                    if (nw_protocol_copy_http_cookie_definition_onceToken != -1)
                      dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_13_72674);
                    v60 = nw_protocol_definition_is_equal_unsafe((uint64_t)v59, nw_protocol_copy_http_cookie_definition_http_cookie_definition);

                    if (v60)
                    {
                      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                      *(_QWORD *)&buf[8] = v2;
                      *(_QWORD *)&buf[16] = __nw_http_cookie_options_set_is_top_level_navigation_block_invoke;
                      *(_QWORD *)&v374 = &__block_descriptor_33_e9_B16__0_v8l;
                      BYTE8(v374) = v55;
                      nw_protocol_options_access_handle(v58, buf);
LABEL_53:

LABEL_54:
                      v61 = *(_QWORD *)(a1 + 40);
                      if (v61)
                      {
                        v62 = (objc_msgSend(*(id *)(v61 + 32), "_explicitlySetShouldHandleCookies") & 1) != 0
                            ? objc_msgSend(*(id *)(v61 + 32), "HTTPShouldHandleCookies")
                            : objc_msgSend(*(id *)(v61 + 16), "HTTPShouldSetCookies");
                        if ((v62 & 1) != 0)
                        {
LABEL_67:
                          v69 = *(_QWORD *)(a1 + 40);
                          if (v69
                            && (!objc_msgSend(*(id *)(v69 + 32), "_explicitlySetShouldHandleCookies")
                             || (objc_msgSend(*(id *)(v69 + 32), "HTTPShouldHandleCookies") & 1) != 0))
                          {
                            goto LABEL_76;
                          }
                          v70 = v36;
                          v71 = v70;
                          if (v70)
                          {
                            v72 = v70;
                            v73 = v72[1];

                            if (nw_protocol_copy_http_cookie_definition_onceToken != -1)
                              dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_13_72674);
                            v74 = nw_protocol_definition_is_equal_unsafe((uint64_t)v73, nw_protocol_copy_http_cookie_definition_http_cookie_definition);

                            if (v74)
                            {
                              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                              *(_QWORD *)&buf[8] = v2;
                              *(_QWORD *)&buf[16] = __nw_http_cookie_options_set_should_not_save_cookies_block_invoke;
                              *(_QWORD *)&v374 = &__block_descriptor_33_e9_B16__0_v8l;
                              BYTE8(v374) = 1;
                              nw_protocol_options_access_handle(v72, buf);
LABEL_75:

LABEL_76:
                              nw_protocol_stack_prepend_application_protocol(stack, &v36->super);

                              goto LABEL_91;
                            }
                            __nwlog_obj();
                            v170 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 136446210;
                            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
                            LODWORD(v325) = 12;
                            v324 = buf;
                            v164 = (char *)_os_log_send_and_compose_impl();

                            v367 = OS_LOG_TYPE_ERROR;
                            v366 = 0;
                            if (!__nwlog_fault(v164, &v367, &v366))
                              goto LABEL_326;
                            if (v367 == OS_LOG_TYPE_FAULT)
                            {
                              __nwlog_obj();
                              v165 = objc_claimAutoreleasedReturnValue();
                              v171 = v367;
                              if (os_log_type_enabled(v165, v367))
                              {
                                *(_DWORD *)buf = 136446210;
                                *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
                                _os_log_impl(&dword_182FBE000, v165, v171, "%{public}s protocol options are not http_cookie", buf, 0xCu);
                              }
                            }
                            else if (v366)
                            {
                              v178 = (char *)__nw_create_backtrace_string();
                              __nwlog_obj();
                              v165 = objc_claimAutoreleasedReturnValue();
                              v179 = v367;
                              v180 = os_log_type_enabled(v165, v367);
                              if (v178)
                              {
                                if (v180)
                                {
                                  *(_DWORD *)buf = 136446466;
                                  *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
                                  *(_WORD *)&buf[12] = 2082;
                                  *(_QWORD *)&buf[14] = v178;
                                  _os_log_impl(&dword_182FBE000, v165, v179, "%{public}s protocol options are not http_cookie, dumping backtrace:%{public}s", buf, 0x16u);
                                }

                                free(v178);
                                if (!v164)
                                  goto LABEL_75;
                                goto LABEL_327;
                              }
                              if (v180)
                              {
                                *(_DWORD *)buf = 136446210;
                                *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
                                _os_log_impl(&dword_182FBE000, v165, v179, "%{public}s protocol options are not http_cookie, no backtrace", buf, 0xCu);
                              }
                            }
                            else
                            {
                              __nwlog_obj();
                              v165 = objc_claimAutoreleasedReturnValue();
                              v190 = v367;
                              if (os_log_type_enabled(v165, v367))
                              {
                                *(_DWORD *)buf = 136446210;
                                *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
                                _os_log_impl(&dword_182FBE000, v165, v190, "%{public}s protocol options are not http_cookie, backtrace limit exceeded", buf, 0xCu);
                              }
                            }
                          }
                          else
                          {
                            __nwlog_obj();
                            v163 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 136446210;
                            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
                            LODWORD(v325) = 12;
                            v324 = buf;
                            v164 = (char *)_os_log_send_and_compose_impl();

                            v367 = OS_LOG_TYPE_ERROR;
                            v366 = 0;
                            if (!__nwlog_fault(v164, &v367, &v366))
                              goto LABEL_326;
                            if (v367 == OS_LOG_TYPE_FAULT)
                            {
                              __nwlog_obj();
                              v165 = objc_claimAutoreleasedReturnValue();
                              v166 = v367;
                              if (os_log_type_enabled(v165, v367))
                              {
                                *(_DWORD *)buf = 136446210;
                                *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
                                _os_log_impl(&dword_182FBE000, v165, v166, "%{public}s called with null options", buf, 0xCu);
                              }
                            }
                            else if (v366)
                            {
                              v175 = (char *)__nw_create_backtrace_string();
                              __nwlog_obj();
                              v165 = objc_claimAutoreleasedReturnValue();
                              v176 = v367;
                              v177 = os_log_type_enabled(v165, v367);
                              if (v175)
                              {
                                if (v177)
                                {
                                  *(_DWORD *)buf = 136446466;
                                  *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
                                  *(_WORD *)&buf[12] = 2082;
                                  *(_QWORD *)&buf[14] = v175;
                                  _os_log_impl(&dword_182FBE000, v165, v176, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
                                }

                                free(v175);
LABEL_326:
                                if (!v164)
                                  goto LABEL_75;
LABEL_327:
                                free(v164);
                                goto LABEL_75;
                              }
                              if (v177)
                              {
                                *(_DWORD *)buf = 136446210;
                                *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
                                _os_log_impl(&dword_182FBE000, v165, v176, "%{public}s called with null options, no backtrace", buf, 0xCu);
                              }
                            }
                            else
                            {
                              __nwlog_obj();
                              v165 = objc_claimAutoreleasedReturnValue();
                              v189 = v367;
                              if (os_log_type_enabled(v165, v367))
                              {
                                *(_DWORD *)buf = 136446210;
                                *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
                                _os_log_impl(&dword_182FBE000, v165, v189, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
                              }
                            }
                          }

                          goto LABEL_326;
                        }
                      }
                      v64 = v36;
                      v65 = v64;
                      if (v64)
                      {
                        v66 = v64;
                        v67 = v66[1];

                        if (nw_protocol_copy_http_cookie_definition_onceToken != -1)
                          dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_13_72674);
                        v68 = nw_protocol_definition_is_equal_unsafe((uint64_t)v67, nw_protocol_copy_http_cookie_definition_http_cookie_definition);

                        if (v68)
                        {
                          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                          *(_QWORD *)&buf[8] = v2;
                          *(_QWORD *)&buf[16] = __nw_http_cookie_options_set_should_not_send_cookies_block_invoke;
                          *(_QWORD *)&v374 = &__block_descriptor_33_e9_B16__0_v8l;
                          BYTE8(v374) = 1;
                          nw_protocol_options_access_handle(v66, buf);
LABEL_66:

                          goto LABEL_67;
                        }
                        __nwlog_obj();
                        v145 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 136446210;
                        *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
                        LODWORD(v325) = 12;
                        v324 = buf;
                        v142 = (char *)_os_log_send_and_compose_impl();

                        v367 = OS_LOG_TYPE_ERROR;
                        v366 = 0;
                        if (!__nwlog_fault(v142, &v367, &v366))
                          goto LABEL_312;
                        if (v367 == OS_LOG_TYPE_FAULT)
                        {
                          __nwlog_obj();
                          v143 = objc_claimAutoreleasedReturnValue();
                          v146 = v367;
                          if (os_log_type_enabled(v143, v367))
                          {
                            *(_DWORD *)buf = 136446210;
                            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
                            _os_log_impl(&dword_182FBE000, v143, v146, "%{public}s protocol options are not http_cookie", buf, 0xCu);
                          }
                        }
                        else if (v366)
                        {
                          v172 = (char *)__nw_create_backtrace_string();
                          __nwlog_obj();
                          v143 = objc_claimAutoreleasedReturnValue();
                          v173 = v367;
                          v174 = os_log_type_enabled(v143, v367);
                          if (v172)
                          {
                            if (v174)
                            {
                              *(_DWORD *)buf = 136446466;
                              *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
                              *(_WORD *)&buf[12] = 2082;
                              *(_QWORD *)&buf[14] = v172;
                              _os_log_impl(&dword_182FBE000, v143, v173, "%{public}s protocol options are not http_cookie, dumping backtrace:%{public}s", buf, 0x16u);
                            }

                            free(v172);
                            if (!v142)
                              goto LABEL_66;
                            goto LABEL_313;
                          }
                          if (v174)
                          {
                            *(_DWORD *)buf = 136446210;
                            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
                            _os_log_impl(&dword_182FBE000, v143, v173, "%{public}s protocol options are not http_cookie, no backtrace", buf, 0xCu);
                          }
                        }
                        else
                        {
                          __nwlog_obj();
                          v143 = objc_claimAutoreleasedReturnValue();
                          v188 = v367;
                          if (os_log_type_enabled(v143, v367))
                          {
                            *(_DWORD *)buf = 136446210;
                            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
                            _os_log_impl(&dword_182FBE000, v143, v188, "%{public}s protocol options are not http_cookie, backtrace limit exceeded", buf, 0xCu);
                          }
                        }
                      }
                      else
                      {
                        __nwlog_obj();
                        v141 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 136446210;
                        *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
                        LODWORD(v325) = 12;
                        v324 = buf;
                        v142 = (char *)_os_log_send_and_compose_impl();

                        v367 = OS_LOG_TYPE_ERROR;
                        v366 = 0;
                        if (!__nwlog_fault(v142, &v367, &v366))
                          goto LABEL_312;
                        if (v367 == OS_LOG_TYPE_FAULT)
                        {
                          __nwlog_obj();
                          v143 = objc_claimAutoreleasedReturnValue();
                          v144 = v367;
                          if (os_log_type_enabled(v143, v367))
                          {
                            *(_DWORD *)buf = 136446210;
                            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
                            _os_log_impl(&dword_182FBE000, v143, v144, "%{public}s called with null options", buf, 0xCu);
                          }
                        }
                        else if (v366)
                        {
                          v167 = (char *)__nw_create_backtrace_string();
                          __nwlog_obj();
                          v143 = objc_claimAutoreleasedReturnValue();
                          v168 = v367;
                          v169 = os_log_type_enabled(v143, v367);
                          if (v167)
                          {
                            if (v169)
                            {
                              *(_DWORD *)buf = 136446466;
                              *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
                              *(_WORD *)&buf[12] = 2082;
                              *(_QWORD *)&buf[14] = v167;
                              _os_log_impl(&dword_182FBE000, v143, v168, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
                            }

                            free(v167);
LABEL_312:
                            if (!v142)
                              goto LABEL_66;
LABEL_313:
                            free(v142);
                            goto LABEL_66;
                          }
                          if (v169)
                          {
                            *(_DWORD *)buf = 136446210;
                            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
                            _os_log_impl(&dword_182FBE000, v143, v168, "%{public}s called with null options, no backtrace", buf, 0xCu);
                          }
                        }
                        else
                        {
                          __nwlog_obj();
                          v143 = objc_claimAutoreleasedReturnValue();
                          v187 = v367;
                          if (os_log_type_enabled(v143, v367))
                          {
                            *(_DWORD *)buf = 136446210;
                            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
                            _os_log_impl(&dword_182FBE000, v143, v187, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
                          }
                        }
                      }

                      goto LABEL_312;
                    }
                    __nwlog_obj();
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136446210;
                    *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
                    LODWORD(v325) = 12;
                    v324 = buf;
                    v132 = (char *)_os_log_send_and_compose_impl();

                    v367 = OS_LOG_TYPE_ERROR;
                    v366 = 0;
                    if (!__nwlog_fault(v132, &v367, &v366))
                      goto LABEL_304;
                    if (v367 == OS_LOG_TYPE_FAULT)
                    {
                      __nwlog_obj();
                      v133 = objc_claimAutoreleasedReturnValue();
                      v140 = v367;
                      if (os_log_type_enabled(v133, v367))
                      {
                        *(_DWORD *)buf = 136446210;
                        *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
                        _os_log_impl(&dword_182FBE000, v133, v140, "%{public}s protocol options are not http_cookie", buf, 0xCu);
                      }
                    }
                    else if (v366)
                    {
                      v158 = (char *)__nw_create_backtrace_string();
                      __nwlog_obj();
                      v133 = objc_claimAutoreleasedReturnValue();
                      v159 = v367;
                      v160 = os_log_type_enabled(v133, v367);
                      if (v158)
                      {
                        if (v160)
                        {
                          *(_DWORD *)buf = 136446466;
                          *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
                          *(_WORD *)&buf[12] = 2082;
                          *(_QWORD *)&buf[14] = v158;
                          _os_log_impl(&dword_182FBE000, v133, v159, "%{public}s protocol options are not http_cookie, dumping backtrace:%{public}s", buf, 0x16u);
                        }

                        free(v158);
                        if (!v132)
                          goto LABEL_53;
                        goto LABEL_305;
                      }
                      if (v160)
                      {
                        *(_DWORD *)buf = 136446210;
                        *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
                        _os_log_impl(&dword_182FBE000, v133, v159, "%{public}s protocol options are not http_cookie, no backtrace", buf, 0xCu);
                      }
                    }
                    else
                    {
                      __nwlog_obj();
                      v133 = objc_claimAutoreleasedReturnValue();
                      v186 = v367;
                      if (os_log_type_enabled(v133, v367))
                      {
                        *(_DWORD *)buf = 136446210;
                        *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
                        _os_log_impl(&dword_182FBE000, v133, v186, "%{public}s protocol options are not http_cookie, backtrace limit exceeded", buf, 0xCu);
                      }
                    }
                  }
                  else
                  {
                    __nwlog_obj();
                    v131 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136446210;
                    *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
                    LODWORD(v325) = 12;
                    v324 = buf;
                    v132 = (char *)_os_log_send_and_compose_impl();

                    v367 = OS_LOG_TYPE_ERROR;
                    v366 = 0;
                    if (!__nwlog_fault(v132, &v367, &v366))
                      goto LABEL_304;
                    if (v367 == OS_LOG_TYPE_FAULT)
                    {
                      __nwlog_obj();
                      v133 = objc_claimAutoreleasedReturnValue();
                      v134 = v367;
                      if (os_log_type_enabled(v133, v367))
                      {
                        *(_DWORD *)buf = 136446210;
                        *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
                        _os_log_impl(&dword_182FBE000, v133, v134, "%{public}s called with null options", buf, 0xCu);
                      }
                    }
                    else if (v366)
                    {
                      v151 = (char *)__nw_create_backtrace_string();
                      __nwlog_obj();
                      v133 = objc_claimAutoreleasedReturnValue();
                      v152 = v367;
                      v153 = os_log_type_enabled(v133, v367);
                      if (v151)
                      {
                        if (v153)
                        {
                          *(_DWORD *)buf = 136446466;
                          *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
                          *(_WORD *)&buf[12] = 2082;
                          *(_QWORD *)&buf[14] = v151;
                          _os_log_impl(&dword_182FBE000, v133, v152, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
                        }

                        free(v151);
LABEL_304:
                        if (!v132)
                          goto LABEL_53;
LABEL_305:
                        free(v132);
                        goto LABEL_53;
                      }
                      if (v153)
                      {
                        *(_DWORD *)buf = 136446210;
                        *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
                        _os_log_impl(&dword_182FBE000, v133, v152, "%{public}s called with null options, no backtrace", buf, 0xCu);
                      }
                    }
                    else
                    {
                      __nwlog_obj();
                      v133 = objc_claimAutoreleasedReturnValue();
                      v183 = v367;
                      if (os_log_type_enabled(v133, v367))
                      {
                        *(_DWORD *)buf = 136446210;
                        *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
                        _os_log_impl(&dword_182FBE000, v133, v183, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
                      }
                    }
                  }

                  goto LABEL_304;
                }
LABEL_300:
                free(v128);
                goto LABEL_46;
              }
              if (v157)
              {
                *(_DWORD *)buf = 136446210;
                *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
                _os_log_impl(&dword_182FBE000, v129, typec, "%{public}s protocol options are not http_cookie, no backtrace", buf, 0xCu);
              }
            }
            else
            {
              __nwlog_obj();
              v129 = objc_claimAutoreleasedReturnValue();
              v185 = v367;
              if (os_log_type_enabled(v129, v367))
              {
                *(_DWORD *)buf = 136446210;
                *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
                _os_log_impl(&dword_182FBE000, v129, v185, "%{public}s protocol options are not http_cookie, backtrace limit exceeded", buf, 0xCu);
              }
            }
            goto LABEL_298;
          }
LABEL_299:
          if (!v128)
            goto LABEL_46;
          goto LABEL_300;
        }
        __nwlog_obj();
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
        LODWORD(v325) = 12;
        v324 = buf;
        v128 = (void *)_os_log_send_and_compose_impl();

        v367 = OS_LOG_TYPE_ERROR;
        v366 = 0;
        if (!__nwlog_fault((const char *)v128, &v367, &v366))
          goto LABEL_299;
        if (v367 == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v129 = objc_claimAutoreleasedReturnValue();
          v130 = v367;
          if (os_log_type_enabled(v129, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
            _os_log_impl(&dword_182FBE000, v129, v130, "%{public}s called with null options", buf, 0xCu);
          }
        }
        else if (v366)
        {
          v149 = (char *)__nw_create_backtrace_string();
          __nwlog_obj();
          v129 = objc_claimAutoreleasedReturnValue();
          typea = v367;
          v150 = os_log_type_enabled(v129, v367);
          if (v149)
          {
            if (v150)
            {
              *(_DWORD *)buf = 136446466;
              *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = v149;
              _os_log_impl(&dword_182FBE000, v129, typea, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v149);
            goto LABEL_299;
          }
          if (v150)
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
            _os_log_impl(&dword_182FBE000, v129, typea, "%{public}s called with null options, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          __nwlog_obj();
          v129 = objc_claimAutoreleasedReturnValue();
          v182 = v367;
          if (os_log_type_enabled(v129, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
            _os_log_impl(&dword_182FBE000, v129, v182, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
          }
        }
LABEL_298:

        goto LABEL_299;
      }
      v39 = v36;
      v40 = v38;
      if (v39)
      {
        v41 = v39;
        v42 = v41[1];

        if (nw_protocol_copy_http_cookie_definition_onceToken != -1)
          dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_13_72674);
        v43 = nw_protocol_definition_is_equal_unsafe((uint64_t)v42, nw_protocol_copy_http_cookie_definition_http_cookie_definition);

        if (v43)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = v2;
          *(_QWORD *)&buf[16] = __nw_http_cookie_options_set_transform_callback_block_invoke;
          *(_QWORD *)&v374 = &unk_1E14A9DD0;
          *((_QWORD *)&v374 + 1) = v40;
          nw_protocol_options_access_handle(v41, buf);

LABEL_36:
          goto LABEL_37;
        }
        __nwlog_obj();
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
        LODWORD(v325) = 12;
        v324 = buf;
        v124 = (char *)_os_log_send_and_compose_impl();

        v367 = OS_LOG_TYPE_ERROR;
        v366 = 0;
        if (!__nwlog_fault(v124, &v367, &v366))
          goto LABEL_294;
        if (v367 == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v125 = objc_claimAutoreleasedReturnValue();
          v136 = v367;
          if (os_log_type_enabled(v125, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
            _os_log_impl(&dword_182FBE000, v125, v136, "%{public}s protocol options are not http_cookie", buf, 0xCu);
          }
        }
        else if (v366)
        {
          v154 = (char *)__nw_create_backtrace_string();
          __nwlog_obj();
          v125 = objc_claimAutoreleasedReturnValue();
          typeb = v367;
          v155 = os_log_type_enabled(v125, v367);
          if (v154)
          {
            if (v155)
            {
              *(_DWORD *)buf = 136446466;
              *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = v154;
              _os_log_impl(&dword_182FBE000, v125, typeb, "%{public}s protocol options are not http_cookie, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v154);
            if (!v124)
              goto LABEL_36;
            goto LABEL_295;
          }
          if (v155)
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
            _os_log_impl(&dword_182FBE000, v125, typeb, "%{public}s protocol options are not http_cookie, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          __nwlog_obj();
          v125 = objc_claimAutoreleasedReturnValue();
          v184 = v367;
          if (os_log_type_enabled(v125, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
            _os_log_impl(&dword_182FBE000, v125, v184, "%{public}s protocol options are not http_cookie, backtrace limit exceeded", buf, 0xCu);
          }
        }
      }
      else
      {
        __nwlog_obj();
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
        LODWORD(v325) = 12;
        v324 = buf;
        v124 = (char *)_os_log_send_and_compose_impl();

        v367 = OS_LOG_TYPE_ERROR;
        v366 = 0;
        if (!__nwlog_fault(v124, &v367, &v366))
          goto LABEL_294;
        if (v367 == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v125 = objc_claimAutoreleasedReturnValue();
          v126 = v367;
          if (os_log_type_enabled(v125, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
            _os_log_impl(&dword_182FBE000, v125, v126, "%{public}s called with null options", buf, 0xCu);
          }
        }
        else if (v366)
        {
          v147 = (char *)__nw_create_backtrace_string();
          __nwlog_obj();
          v125 = objc_claimAutoreleasedReturnValue();
          type = v367;
          v148 = os_log_type_enabled(v125, v367);
          if (v147)
          {
            if (v148)
            {
              *(_DWORD *)buf = 136446466;
              *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = v147;
              _os_log_impl(&dword_182FBE000, v125, type, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v147);
LABEL_294:
            if (!v124)
              goto LABEL_36;
LABEL_295:
            free(v124);
            goto LABEL_36;
          }
          if (v148)
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
            _os_log_impl(&dword_182FBE000, v125, type, "%{public}s called with null options, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          __nwlog_obj();
          v125 = objc_claimAutoreleasedReturnValue();
          v181 = v367;
          if (os_log_type_enabled(v125, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
            _os_log_impl(&dword_182FBE000, v125, v181, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
          }
        }
      }

      goto LABEL_294;
    }
LABEL_90:
    v35 = 0;
LABEL_91:
    v338 = v35;
    if (nw_protocol_copy_http_retry_definition_onceToken != -1)
      dispatch_once(&nw_protocol_copy_http_retry_definition_onceToken, &__block_literal_global_32_73077);
    v90 = nw_protocol_create_options((void *)nw_protocol_copy_http_retry_definition_http_retry_definition);
    nw_http_retry_options_set_limit(v90, 3);
    nw_protocol_stack_prepend_application_protocol(stack, &v90->super);

    if (nw_protocol_copy_http_authentication_definition_onceToken != -1)
      dispatch_once(&nw_protocol_copy_http_authentication_definition_onceToken, &__block_literal_global_29_72742);
    v352 = nw_protocol_create_options((void *)nw_protocol_copy_http_authentication_definition_http_authentication_definition);
    v360[0] = MEMORY[0x1E0C809B0];
    v360[1] = v2;
    v360[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_8;
    v360[3] = &unk_1E14A9988;
    v360[4] = a1;
    v91 = (unint64_t)(id)v6;
    v361 = (id)v91;
    nw_http_authentication_options_set_challenge_handler(v352, v360, *(void **)(a1 + 56));
    -[NWURLSessionTaskConfiguration URLCredentialStorage](*(_QWORD *)(a1 + 40));
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    nw_http_authentication_options_set_credential_storage(v352, v340);
    if (*(_QWORD *)(a1 + 40))
    {
      v92 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
      if (v92)
      {
        v93 = *(id *)(v92 + 392);
        v94 = v93;
        if (v93)
        {
          v95 = (void *)v93[7];
          if (!v95)
          {
            v96 = nw_array_create();
            v97 = (void *)v94[7];
            v94[7] = v96;

            v95 = (void *)v94[7];
          }
          v342 = v95;
        }
        else
        {
          v342 = 0;
        }
      }
      else
      {
        v94 = 0;
        v342 = 0;
      }

      if (v342)
        nw_http_authentication_options_set_credential_cache(v352, v342);
      v98 = *(_QWORD *)(a1 + 40);
      if (v98)
      {
        v99 = *(_QWORD *)(v98 + 24);
        if (v99)
        {
          v100 = *(void **)(v99 + 32);
          if (v100)
          {
            v101 = v100;
            if (v101)
            {
LABEL_107:
              v337 = v101;
              nw_http_authentication_options_set_h1_fallback_cache(v352, v101);
              goto LABEL_110;
            }
          }
          else
          {
            v102 = nw_array_create();
            v104 = *(void **)(v99 + 32);
            v103 = (id *)(v99 + 32);
            *v103 = (id)v102;

            v101 = *v103;
            if (v101)
              goto LABEL_107;
          }
        }
      }
      v337 = 0;
LABEL_110:
      v105 = *(_QWORD *)(a1 + 40);
      if (!v105)
        goto LABEL_332;
      goto LABEL_111;
    }
    v337 = 0;
    v342 = 0;
    v105 = *(_QWORD *)(a1 + 40);
    if (!v105)
      goto LABEL_332;
LABEL_111:
    v106 = *(_QWORD *)(v105 + 24);
    if (v106)
    {
      v107 = *(void **)(v106 + 40);
      if (v107)
      {
        v108 = v107;
        if (!v108)
          goto LABEL_332;
LABEL_116:
        v336 = v108;
        nw_http_authentication_options_set_appsso_h1_fallback_headers(v352, (uint64_t)v108);
        goto LABEL_333;
      }
      v109 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v111 = *(void **)(v106 + 40);
      v110 = (id *)(v106 + 40);
      *v110 = v109;

      v108 = *v110;
      if (v108)
        goto LABEL_116;
    }
LABEL_332:
    v336 = 0;
LABEL_333:
    nw_protocol_stack_prepend_application_protocol(stack, &v352->super);
    v6 = (uint64_t)&nw_protocol_http_authentication_identifier::protocol_identifier + 4;
    if (nw_protocol_copy_http_security_definition_onceToken != -1)
      dispatch_once(&nw_protocol_copy_http_security_definition_onceToken, &__block_literal_global_33_73134);
    v191 = &qword_1EDCE3000;
    v192 = nw_protocol_create_options((void *)nw_protocol_copy_http_security_definition_http_security_definition);
    v193 = *(_QWORD *)(a1 + 40);
    if (v193
      && (objc_msgSend(*(id *)(v193 + 16), "_hstsStorage"), (v194 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v339 = v194;
      v195 = objc_alloc_init(NWConcrete_nw_hsts_storage);
      HSTSStorage = v195->HSTSStorage;
      v195->HSTSStorage = v339;

      nw_http_security_options_set_hsts_storage(v192, v195);
    }
    else
    {
      v339 = 0;
    }
    v359[0] = MEMORY[0x1E0C809B0];
    v359[1] = v2;
    v359[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_9;
    v359[3] = &unk_1E14A99B0;
    v359[4] = a1;
    nw_http_security_options_set_handler(v192, v359, *(void **)(a1 + 56));
    v197 = *(_QWORD *)(a1 + 40);
    if (v197)
      LOBYTE(v198) = objc_msgSend(*(id *)(v197 + 32), "_ignoreHSTS");
    else
      LOBYTE(v198) = 0;
    v199 = v192;
    v200 = v199;
    if (v199)
    {
      v201 = v199;
      v202 = v201[1];

      if (nw_protocol_copy_http_security_definition_onceToken != -1)
        goto LABEL_425;
      goto LABEL_343;
    }
    __nwlog_obj();
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
    LODWORD(v325) = 12;
    v324 = buf;
    v244 = (char *)_os_log_send_and_compose_impl();

    v367 = OS_LOG_TYPE_ERROR;
    v366 = 0;
    if (!__nwlog_fault(v244, &v367, &v366))
      goto LABEL_586;
    if (v367 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v245 = objc_claimAutoreleasedReturnValue();
      v246 = v367;
      if (os_log_type_enabled(v245, v367))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
        _os_log_impl(&dword_182FBE000, v245, v246, "%{public}s called with null options", buf, 0xCu);
      }
    }
    else if (v366)
    {
      v267 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v245 = objc_claimAutoreleasedReturnValue();
      v268 = v367;
      v269 = os_log_type_enabled(v245, v367);
      if (v267)
      {
        if (v269)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v267;
          _os_log_impl(&dword_182FBE000, v245, v268, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v267);
        goto LABEL_586;
      }
      if (v269)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
        _os_log_impl(&dword_182FBE000, v245, v268, "%{public}s called with null options, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v245 = objc_claimAutoreleasedReturnValue();
      v316 = v367;
      if (os_log_type_enabled(v245, v367))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
        _os_log_impl(&dword_182FBE000, v245, v316, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_585:

LABEL_586:
    if (!v244)
      goto LABEL_345;
LABEL_587:
    free(v244);
    while (1)
    {
LABEL_345:

      v204 = *(_QWORD *)(a1 + 40);
      if (v204)
        v205 = objc_msgSend(*(id *)(v204 + 16), "_allowsHSTSWithUntrustedRootCertificate");
      else
        v205 = 0;
      v206 = v200;
      v343 = v206;
      if (!v200)
      {
        __nwlog_obj();
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
        LODWORD(v325) = 12;
        v324 = buf;
        v248 = (char *)_os_log_send_and_compose_impl();

        v367 = OS_LOG_TYPE_ERROR;
        v366 = 0;
        if (!__nwlog_fault(v248, &v367, &v366))
          goto LABEL_591;
        if (v367 == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v249 = objc_claimAutoreleasedReturnValue();
          v250 = v367;
          if (os_log_type_enabled(v249, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
            _os_log_impl(&dword_182FBE000, v249, v250, "%{public}s called with null options", buf, 0xCu);
          }
          goto LABEL_590;
        }
        if (!v366)
        {
          __nwlog_obj();
          v249 = objc_claimAutoreleasedReturnValue();
          v317 = v367;
          if (os_log_type_enabled(v249, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
            _os_log_impl(&dword_182FBE000, v249, v317, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
          }
          goto LABEL_590;
        }
        v270 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v249 = objc_claimAutoreleasedReturnValue();
        v271 = v367;
        v272 = os_log_type_enabled(v249, v367);
        if (!v270)
        {
          if (v272)
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
            _os_log_impl(&dword_182FBE000, v249, v271, "%{public}s called with null options, no backtrace", buf, 0xCu);
          }
          goto LABEL_590;
        }
        if (v272)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v270;
          _os_log_impl(&dword_182FBE000, v249, v271, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
        }
        goto LABEL_476;
      }
      v207 = v206;
      v208 = v207[1];

      if (*(_QWORD *)(v6 + 1616) != -1)
        dispatch_once(&nw_protocol_copy_http_security_definition_onceToken, &__block_literal_global_33_73134);
      v209 = nw_protocol_definition_is_equal_unsafe((uint64_t)v208, v191[405]);

      if (v209)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = v2;
        *(_QWORD *)&buf[16] = __nw_http_security_options_set_save_hsts_with_untrusted_root_cert_block_invoke;
        *(_QWORD *)&v374 = &__block_descriptor_33_e9_B16__0_v8l;
        BYTE8(v374) = v205;
        nw_protocol_options_access_handle(v207, buf);
        v210 = v343;
        goto LABEL_352;
      }
      __nwlog_obj();
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
      LODWORD(v325) = 12;
      v324 = buf;
      v248 = (char *)_os_log_send_and_compose_impl();

      v367 = OS_LOG_TYPE_ERROR;
      v366 = 0;
      if (__nwlog_fault(v248, &v367, &v366))
      {
        if (v367 == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v249 = objc_claimAutoreleasedReturnValue();
          v262 = v367;
          if (os_log_type_enabled(v249, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
            _os_log_impl(&dword_182FBE000, v249, v262, "%{public}s protocol options are not http security", buf, 0xCu);
          }
LABEL_590:

          goto LABEL_591;
        }
        if (!v366)
        {
          __nwlog_obj();
          v249 = objc_claimAutoreleasedReturnValue();
          v321 = v367;
          if (os_log_type_enabled(v249, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
            _os_log_impl(&dword_182FBE000, v249, v321, "%{public}s protocol options are not http security, backtrace limit exceeded", buf, 0xCu);
          }
          goto LABEL_590;
        }
        v270 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v249 = objc_claimAutoreleasedReturnValue();
        v280 = v367;
        v281 = os_log_type_enabled(v249, v367);
        if (!v270)
        {
          if (v281)
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
            _os_log_impl(&dword_182FBE000, v249, v280, "%{public}s protocol options are not http security, no backtrace", buf, 0xCu);
          }
          goto LABEL_590;
        }
        if (v281)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v270;
          _os_log_impl(&dword_182FBE000, v249, v280, "%{public}s protocol options are not http security, dumping backtrace:%{public}s", buf, 0x16u);
        }
LABEL_476:

        free(v270);
      }
LABEL_591:
      v210 = v343;
      if (v248)
        free(v248);
LABEL_352:

      nw_protocol_stack_prepend_application_protocol(stack, v343);
      if (nw_protocol_copy_http_encoding_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_encoding_definition_onceToken, &__block_literal_global_30_72927);
      v211 = nw_protocol_create_options((void *)nw_protocol_copy_http_encoding_definition_http_encoding_definition);
      nw_protocol_stack_prepend_application_protocol(stack, &v211->super);

      if (nw_protocol_copy_http_redirect_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_redirect_definition_onceToken, &__block_literal_global_31_72984);
      typed = nw_protocol_create_options((void *)nw_protocol_copy_http_redirect_definition_http_redirect_definition);
      nw_http_redirect_options_set_limit(typed, 20);
      v358[0] = MEMORY[0x1E0C809B0];
      v358[1] = v2;
      v358[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_10;
      v358[3] = &unk_1E14A9A50;
      v358[4] = a1;
      nw_http_redirect_options_set_handler(typed, v358, *(void **)(a1 + 56));
      nw_protocol_stack_prepend_application_protocol(stack, &typed->super);
      objc_msgSend(*(id *)(a1 + 24), "_propertyForKey:", *MEMORY[0x1E0C93088]);
      v341 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v341 || objc_msgSend(MEMORY[0x1E0C9AAB0], "isEqual:", v341))
      {
        if (nw_protocol_copy_http_sniffing_definition_onceToken != -1)
          dispatch_once(&nw_protocol_copy_http_sniffing_definition_onceToken, &__block_literal_global_35_73498);
        v212 = nw_protocol_create_options((void *)nw_protocol_copy_http_sniffing_definition_http_sniffing_definition);
        nw_protocol_stack_prepend_application_protocol(stack, &v212->super);

      }
      if (nw_protocol_copy_http_client_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_52_74156);
      v6 = (uint64_t)&qword_1EDCE3000;
      v213 = nw_protocol_create_options((void *)nw_protocol_copy_http_client_definition_definition);
      v357[0] = MEMORY[0x1E0C809B0];
      v357[1] = v2;
      v357[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_14;
      v357[3] = &unk_1E14A9A78;
      v357[4] = a1;
      v214 = v213;
      v215 = v357;
      if (!v214)
      {
        __nwlog_obj();
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_client_options_set_resend_handler";
        LODWORD(v325) = 12;
        v324 = buf;
        v252 = (char *)_os_log_send_and_compose_impl();

        v367 = OS_LOG_TYPE_ERROR;
        v366 = 0;
        if (!__nwlog_fault(v252, &v367, &v366))
          goto LABEL_596;
        if (v367 == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v253 = objc_claimAutoreleasedReturnValue();
          v254 = v367;
          if (os_log_type_enabled(v253, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_client_options_set_resend_handler";
            _os_log_impl(&dword_182FBE000, v253, v254, "%{public}s called with null options", buf, 0xCu);
          }
        }
        else if (v366)
        {
          v273 = (char *)__nw_create_backtrace_string();
          __nwlog_obj();
          v253 = objc_claimAutoreleasedReturnValue();
          v333 = v367;
          v274 = os_log_type_enabled(v253, v367);
          if (v273)
          {
            if (v274)
            {
              *(_DWORD *)buf = 136446466;
              *(_QWORD *)&buf[4] = "nw_http_client_options_set_resend_handler";
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = v273;
              _os_log_impl(&dword_182FBE000, v253, v333, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v273);
LABEL_596:
            if (!v252)
              goto LABEL_368;
LABEL_597:
            free(v252);
            goto LABEL_368;
          }
          if (v274)
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_client_options_set_resend_handler";
            _os_log_impl(&dword_182FBE000, v253, v333, "%{public}s called with null options, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          __nwlog_obj();
          v253 = objc_claimAutoreleasedReturnValue();
          v318 = v367;
          if (os_log_type_enabled(v253, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_client_options_set_resend_handler";
            _os_log_impl(&dword_182FBE000, v253, v318, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
          }
        }
LABEL_595:

        goto LABEL_596;
      }
      v216 = v214;
      v217 = v216[1];

      if (nw_protocol_copy_http_client_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_52_74156);
      v218 = nw_protocol_definition_is_equal_unsafe((uint64_t)v217, nw_protocol_copy_http_client_definition_definition);

      if (v218)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = v2;
        *(_QWORD *)&buf[16] = __nw_http_client_options_set_resend_handler_block_invoke;
        *(_QWORD *)&v374 = &unk_1E14A9DD0;
        *((_QWORD *)&v374 + 1) = v215;
        nw_protocol_options_access_handle(v216, buf);

        goto LABEL_368;
      }
      __nwlog_obj();
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_http_client_options_set_resend_handler";
      LODWORD(v325) = 12;
      v324 = buf;
      v252 = (char *)_os_log_send_and_compose_impl();

      v367 = OS_LOG_TYPE_ERROR;
      v366 = 0;
      if (!__nwlog_fault(v252, &v367, &v366))
        goto LABEL_596;
      if (v367 == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v253 = objc_claimAutoreleasedReturnValue();
        v264 = v367;
        if (os_log_type_enabled(v253, v367))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_options_set_resend_handler";
          _os_log_impl(&dword_182FBE000, v253, v264, "%{public}s protocol options are not http_client", buf, 0xCu);
        }
        goto LABEL_595;
      }
      if (!v366)
      {
        __nwlog_obj();
        v253 = objc_claimAutoreleasedReturnValue();
        v322 = v367;
        if (os_log_type_enabled(v253, v367))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_options_set_resend_handler";
          _os_log_impl(&dword_182FBE000, v253, v322, "%{public}s protocol options are not http_client, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_595;
      }
      v282 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v253 = objc_claimAutoreleasedReturnValue();
      v334 = v367;
      v283 = os_log_type_enabled(v253, v367);
      if (!v282)
      {
        if (v283)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_options_set_resend_handler";
          _os_log_impl(&dword_182FBE000, v253, v334, "%{public}s protocol options are not http_client, no backtrace", buf, 0xCu);
        }
        goto LABEL_595;
      }
      if (v283)
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "nw_http_client_options_set_resend_handler";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v282;
        _os_log_impl(&dword_182FBE000, v253, v334, "%{public}s protocol options are not http_client, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v282);
      if (v252)
        goto LABEL_597;
LABEL_368:
      v219 = v214 == 0;

      v356[0] = MEMORY[0x1E0C809B0];
      v356[1] = v2;
      v356[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_35;
      v356[3] = &unk_1E14A9AA0;
      v356[4] = a1;
      v198 = v214;
      v220 = v356;
      if (v219)
      {
        __nwlog_obj();
        v255 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
        LODWORD(v325) = 12;
        v324 = buf;
        v256 = (char *)_os_log_send_and_compose_impl();

        v367 = OS_LOG_TYPE_ERROR;
        v366 = 0;
        if (!__nwlog_fault(v256, &v367, &v366))
          goto LABEL_601;
        if (v367 == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v257 = objc_claimAutoreleasedReturnValue();
          v258 = v367;
          if (os_log_type_enabled(v257, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
            _os_log_impl(&dword_182FBE000, v257, v258, "%{public}s called with null options", buf, 0xCu);
          }
        }
        else if (v366)
        {
          v275 = (char *)__nw_create_backtrace_string();
          __nwlog_obj();
          v257 = objc_claimAutoreleasedReturnValue();
          v6 = v367;
          v276 = os_log_type_enabled(v257, v367);
          if (v275)
          {
            if (v276)
            {
              *(_DWORD *)buf = 136446466;
              *(_QWORD *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = v275;
              _os_log_impl(&dword_182FBE000, v257, (os_log_type_t)v6, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v275);
LABEL_601:
            if (!v256)
              goto LABEL_373;
LABEL_602:
            free(v256);
            goto LABEL_373;
          }
          if (v276)
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
            _os_log_impl(&dword_182FBE000, v257, (os_log_type_t)v6, "%{public}s called with null options, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          __nwlog_obj();
          v257 = objc_claimAutoreleasedReturnValue();
          v319 = v367;
          if (os_log_type_enabled(v257, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
            _os_log_impl(&dword_182FBE000, v257, v319, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
          }
        }
LABEL_600:

        goto LABEL_601;
      }
      v221 = v198;
      v222 = v221[1];

      if (nw_protocol_copy_http_client_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_52_74156);
      v223 = nw_protocol_definition_is_equal_unsafe((uint64_t)v222, nw_protocol_copy_http_client_definition_definition);

      if (v223)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = v2;
        *(_QWORD *)&buf[16] = __nw_http_client_options_set_retry_with_h1_handler_block_invoke;
        *(_QWORD *)&v374 = &unk_1E14A9DD0;
        *((_QWORD *)&v374 + 1) = v220;
        nw_protocol_options_access_handle(v221, buf);

        goto LABEL_373;
      }
      __nwlog_obj();
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
      LODWORD(v325) = 12;
      v324 = buf;
      v256 = (char *)_os_log_send_and_compose_impl();

      v367 = OS_LOG_TYPE_ERROR;
      v366 = 0;
      if (!__nwlog_fault(v256, &v367, &v366))
        goto LABEL_601;
      if (v367 == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v257 = objc_claimAutoreleasedReturnValue();
        v266 = v367;
        if (os_log_type_enabled(v257, v367))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
          _os_log_impl(&dword_182FBE000, v257, v266, "%{public}s protocol options are not http_client", buf, 0xCu);
        }
        goto LABEL_600;
      }
      if (!v366)
      {
        __nwlog_obj();
        v257 = objc_claimAutoreleasedReturnValue();
        v323 = v367;
        if (os_log_type_enabled(v257, v367))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
          _os_log_impl(&dword_182FBE000, v257, v323, "%{public}s protocol options are not http_client, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_600;
      }
      v284 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v257 = objc_claimAutoreleasedReturnValue();
      v6 = v367;
      v285 = os_log_type_enabled(v257, v367);
      if (!v284)
      {
        if (v285)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
          _os_log_impl(&dword_182FBE000, v257, (os_log_type_t)v6, "%{public}s protocol options are not http_client, no backtrace", buf, 0xCu);
        }
        goto LABEL_600;
      }
      if (v285)
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v284;
        _os_log_impl(&dword_182FBE000, v257, (os_log_type_t)v6, "%{public}s protocol options are not http_client, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v284);
      if (v256)
        goto LABEL_602;
LABEL_373:

      nw_protocol_stack_prepend_application_protocol(stack, v198);
      if (nw_proxy_copy_http_connect_definition::onceToken != -1)
        dispatch_once(&nw_proxy_copy_http_connect_definition::onceToken, &__block_literal_global_92);
      v224 = (id)nw_proxy_copy_http_connect_definition::proxy_definition;
      v191 = (uint64_t *)nw_proxy_create_options(v224);

      v354[0] = MEMORY[0x1E0C809B0];
      v354[1] = v2;
      v354[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_2_37;
      v354[3] = &unk_1E14A9988;
      v354[4] = a1;
      v335 = (id)v91;
      v355 = v335;
      nw_proxy_options_set_authentication_challenge_handler(v191, v354);
      objc_msgSend(*(id *)(a1 + 24), "valueForHTTPHeaderField:", CFSTR("Proxy-Authorization"));
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      v202 = v225;
      if (v225)
        nw_proxy_options_set_http_proxy_authorization_header(v191, objc_msgSend(v225, "cStringUsingEncoding:", 5));
      nw_parameters_add_proxy_options(parameters, v191);
      v200 = (void *)(a1 + 40);
      -[NWURLSessionTaskConfiguration configureParameters:](*(id **)(a1 + 40), parameters);
      *(_BYTE *)(a1 + 18) = nw_parameters_has_custom_proxy_configs(parameters);
      if (*(_QWORD *)(a1 + 40)
        && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "_hostOverride"),
            (v200 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        nw_parameters_set_url_endpoint(parameters, endpoint);
        v201 = v200;

        v226 = v201;
      }
      else
      {
        v201 = 0;
        v226 = endpoint;
      }
      endpoint = v226;
      v227 = nw_connection_create(v226, parameters);
      v228 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v227;

      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v229 = (id)gurlLogObj;
      if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
      {
        v230 = *(id *)(a1 + 48);
        v6 = (uint64_t)v230;
        if (v230)
        {
          objc_msgSend(v230, "logDescription");
        }
        else
        {
          v371[0] = 0;
          v371[1] = 0;
          v372 = 0;
        }
        v231 = *(id *)(a1 + 48);
        v200 = v231;
        if (v231)
        {
          objc_msgSend(v231, "logDescription");
          v91 = v370;
        }
        else
        {
          v91 = 0;
          v368 = 0;
          v369 = 0;
          v370 = 0;
        }
        id = nw_connection_get_id(*(void **)(a1 + 72));
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 16;
        *(_WORD *)&buf[8] = 2098;
        *(_QWORD *)&buf[10] = v371;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v91;
        LOWORD(v374) = 2048;
        *(_QWORD *)((char *)&v374 + 2) = id;
        _os_log_impl(&dword_182FBE000, v229, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> created [C%llu]", buf, 0x22u);

      }
      if (*(_QWORD *)(a1 + 72))
        break;
      _os_crash();
      __break(1u);
LABEL_425:
      dispatch_once(&nw_protocol_copy_http_security_definition_onceToken, &__block_literal_global_33_73134);
LABEL_343:
      v203 = nw_protocol_definition_is_equal_unsafe((uint64_t)v202, v191[405]);

      if (v203)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = v2;
        *(_QWORD *)&buf[16] = __nw_http_security_options_set_skip_hsts_lookup_block_invoke;
        *(_QWORD *)&v374 = &__block_descriptor_33_e9_B16__0_v8l;
        BYTE8(v374) = (_BYTE)v198;
        nw_protocol_options_access_handle(v201, buf);
      }
      else
      {
        __nwlog_obj();
        v259 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
        LODWORD(v325) = 12;
        v324 = buf;
        v244 = (char *)_os_log_send_and_compose_impl();

        v367 = OS_LOG_TYPE_ERROR;
        v366 = 0;
        if (!__nwlog_fault(v244, &v367, &v366))
          goto LABEL_586;
        if (v367 == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v245 = objc_claimAutoreleasedReturnValue();
          v260 = v367;
          if (os_log_type_enabled(v245, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
            _os_log_impl(&dword_182FBE000, v245, v260, "%{public}s protocol options are not http security", buf, 0xCu);
          }
          goto LABEL_585;
        }
        if (!v366)
        {
          __nwlog_obj();
          v245 = objc_claimAutoreleasedReturnValue();
          v320 = v367;
          if (os_log_type_enabled(v245, v367))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
            _os_log_impl(&dword_182FBE000, v245, v320, "%{public}s protocol options are not http security, backtrace limit exceeded", buf, 0xCu);
          }
          goto LABEL_585;
        }
        v277 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v245 = objc_claimAutoreleasedReturnValue();
        v278 = v367;
        v279 = os_log_type_enabled(v245, v367);
        if (!v277)
        {
          if (v279)
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
            _os_log_impl(&dword_182FBE000, v245, v278, "%{public}s protocol options are not http security, no backtrace", buf, 0xCu);
          }
          goto LABEL_585;
        }
        if (v279)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v277;
          _os_log_impl(&dword_182FBE000, v245, v278, "%{public}s protocol options are not http security, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v277);
        if (v244)
          goto LABEL_587;
      }
    }
    v233 = *(_QWORD *)(a1 + 40);
    if (v233 && (objc_msgSend(*(id *)(v233 + 24), "_preconnect") & 1) != 0)
      goto LABEL_544;
    v331 = endpoint;
    if (*(_QWORD *)(a1 + 32))
    {
      v76 = *(void **)(a1 + 24);
      if (v76)
      {
        objc_msgSend(*(id *)(a1 + 24), "HTTPMethod");
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        v235 = objc_msgSend(v234, "caseInsensitiveCompare:", CFSTR("GET")) == 0;

        if (v235
          || (objc_msgSend(v76, "HTTPMethod"),
              v76 = (void *)objc_claimAutoreleasedReturnValue(),
              v286 = objc_msgSend(v76, "caseInsensitiveCompare:", CFSTR("HEAD")) == 0,
              v76,
              v286))
        {
          if (isWebKitNetworking_onceToken != -1)
            dispatch_once(&isWebKitNetworking_onceToken, &__block_literal_global_174);
          if (isWebKitNetworking_result == 1)
          {
            v236 = [NWURLError alloc];
            objc_msgSend(*(id *)(a1 + 48), "loaderTask");
            v237 = (void *)objc_claimAutoreleasedReturnValue();
            v238 = (id)a1;
            v239 = v237;
            if (v236)
            {
              v240 = *MEMORY[0x1E0CB32E8];
              *(_QWORD *)buf = v236;
              *(_QWORD *)&buf[8] = NWURLError;
              v241 = (NWURLError *)objc_msgSendSuper2((objc_super *)buf, sel_initWithDomain_code_userInfo_, v240, -1103, 0);
              v236 = v241;
              if (v241)
                -[NWURLError fillErrorForLoader:andTask:](v241, "fillErrorForLoader:andTask:", v238, v239);
            }

            v242 = (void *)*((_QWORD *)v238 + 11);
            *((_QWORD *)v238 + 11) = v236;

            v332 = 0;
            *((_BYTE *)v238 + 11) = 1;
            goto LABEL_543;
          }
          _os_crash();
          __break(1u);
LABEL_611:
          v78 = 0;
          v79 = 0;
          continue;
        }
      }
    }
    break;
  }
  v332 = nw_content_context_create("http request");
  v287 = (void *)nw_http_request_create_from_url_request(*(void **)(a1 + 24));
  v329 = nw_http_request_has_method(v287, (uint64_t)"GET") || nw_http_request_has_method(v287, (uint64_t)"HEAD");
  if (*(uint64_t *)(a1 + 32) >= 1 && !nw_http_fields_have_field_with_name(v287, (unint64_t)"Content-Length"))
  {
    snprintf(buf, 0x15uLL, "%lld", *(_QWORD *)(a1 + 32));
    nw_http_fields_append(v287, (uint64_t)"Content-Length", (uint64_t)buf);
  }
  if (!nw_http_fields_have_field_with_name(v287, (unint64_t)"User-Agent"))
  {
    if (nw_utilities_get_user_agent::onceToken != -1)
      dispatch_once(&nw_utilities_get_user_agent::onceToken, &__block_literal_global_9_44031);
    nw_http_fields_append(v287, (uint64_t)"User-Agent", nw_utilities_get_user_agent::user_agent_string);
  }
  if (!nw_http_fields_have_field_with_name(v287, (unint64_t)"Accept"))
    nw_http_fields_append(v287, (uint64_t)"Accept", (uint64_t)"*/*");
  if (!nw_http_fields_have_field_with_name(v287, (unint64_t)"Accept-Language"))
  {
    v288 = (void *)_CFNetworkCopyPreferredLanguageCode();
    nw_http_fields_append(v287, (uint64_t)"Accept-Language", objc_msgSend(v288, "UTF8String"));

  }
  if (!nw_http_fields_have_field_with_name(v287, (unint64_t)"Priority"))
  {
    v289 = *(_QWORD *)(a1 + 40);
    if (v289)
    {
      objc_msgSend(*(id *)(v289 + 24), "priority");
      if (v290 < 0.5)
        goto LABEL_507;
      v291 = 6.6667 - (float)(v290 * 6.6667);
    }
    else
    {
      v290 = 0.0;
LABEL_507:
      v291 = ceilf((float)(v290 * -10.0) + 7.0);
    }
    v292 = (int)v291;
    v293 = *(_QWORD *)(a1 + 40);
    if (v293)
    {
      v294 = objc_msgSend(*(id *)(v293 + 24), "prefersIncrementalDelivery");
      *(_WORD *)buf = 15733;
      buf[2] = v292 + 48;
      if (v294)
      {
        v295 = 0;
        *(_WORD *)&buf[4] = 26912;
        LOBYTE(v293) = 44;
        v296 = 6;
        goto LABEL_512;
      }
      LOBYTE(v293) = 0;
    }
    else
    {
      *(_WORD *)buf = 15733;
      v295 = v292 + 48;
      v296 = 2;
LABEL_512:
      buf[v296] = v295;
    }
    buf[3] = v293;
    nw_http_fields_append(v287, (uint64_t)"Priority", (uint64_t)buf);
  }
  if (*(_BYTE *)(a1 + 15))
  {
    v298 = *(void **)(a1 + 96);
    v297 = *(void **)(a1 + 104);
    v299 = *(id *)(a1 + 24);
    v300 = v298;
    v330 = v287;
    v301 = v299;
    v326 = v300;
    if (v300)
    {
      v302 = v297;
      v327 = objc_msgSend(v302, "storagePolicy");
      objc_msgSend(v302, "response");
      v328 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v301, "valueForHTTPHeaderField:", CFSTR("If-Modified-Since"));
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v303 && v327 != 2)
      {
        objc_msgSend(v328, "_lastModifiedDate");
        v304 = (void *)objc_claimAutoreleasedReturnValue();
        if (v304)
        {
          v305 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          objc_msgSend(v305, "setDateFormat:", CFSTR("EEE, dd MMM yyyy HH:mm:ss zzz"));
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
          v306 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v305, "setTimeZone:", v306);

          objc_msgSend(v305, "stringFromDate:", v304);
          v303 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v303 = 0;
        }

      }
      if (v303)
        nw_http_fields_append(v330, (uint64_t)"If-Modified-Since", objc_msgSend(v303, "UTF8String"));
      objc_msgSend(v301, "valueForHTTPHeaderField:", CFSTR("If-None-Match"), v324, v325);
      v307 = (void *)objc_claimAutoreleasedReturnValue();
      if (v307)
        v308 = 0;
      else
        v308 = v327 != 2;
      if (v308)
      {
        objc_msgSend(v328, "valueForHTTPHeaderField:", CFSTR("ETag"));
        v307 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v307)
        nw_http_fields_append(v330, (uint64_t)"If-None-Match", objc_msgSend(v307, "UTF8String"));

    }
  }
  metadata_for_request = nw_http_create_metadata_for_request(v287);
  nw_content_context_set_metadata_for_protocol(v332, metadata_for_request);
  v310 = *(_QWORD *)(a1 + 32);
  v311 = v329;
  if (v310)
    v311 = 0;
  v312 = *(NSObject **)(a1 + 72);
  if (v311)
  {
    nw_connection_send(v312, 0, v332, 1, &__block_literal_global_24144);
    *(_BYTE *)(a1 + 16) = 1;
    v313 = (void (**)(_QWORD))*(id *)(a1 + 136);
    objc_setProperty_nonatomic_copy((id)a1, v314, 0, 136);
    if (v313)
      v313[2](v313);
    if (*(_BYTE *)(a1 + 9))
      -[NWURLLoaderHTTP startResponseStallTimer](a1);

  }
  else
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = v2;
    *(_QWORD *)&buf[16] = __32__NWURLLoaderHTTP_writeRequest___block_invoke;
    *(_QWORD *)&v374 = &unk_1E14A9B48;
    *((_QWORD *)&v374 + 1) = a1;
    nw_connection_send(v312, 0, v332, v310 == 0, buf);
  }

LABEL_543:
  v315 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v332;

LABEL_544:
  -[NWURLLoaderHTTP configureAndStartConnection:](a1, *(void **)(a1 + 72));

}

void __25__NWURLLoaderHTTP_start___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id *v18;
  id *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id *v40;
  NWURLError *v41;
  void *v42;
  id *v43;
  id v44;
  uint64_t v45;
  NWURLError *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  objc_super v55;

  v54 = a2;
  if (!v54)
    goto LABEL_16;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    v5 = (void *)v4[12];
    v6 = (void *)v4[3];
    v4 = (_QWORD *)v4[5];
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = v4;
  v8 = v6;
  v9 = v5;
  if (v7)
  {
    if (objc_msgSend(v7[4], "_explicitlySetCachePolicy"))
      v10 = objc_msgSend(v7[4], "cachePolicy");
    else
      v10 = objc_msgSend(v7[2], "requestCachePolicy");
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  v12 = v54;
  v13 = v8;
  if (!v9)
    goto LABEL_15;
  if (objc_msgSend(v12, "storagePolicy") == 2)
    goto LABEL_15;
  objc_msgSend(v12, "response");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_15;
  objc_msgSend(v13, "HTTPBody");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

LABEL_15:
    goto LABEL_16;
  }
  objc_msgSend(v13, "HTTPBodyStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_15;
  objc_msgSend(v12, "response");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForHTTPHeaderField:", CFSTR("Vary"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v20, "valueForHTTPHeaderField:", CFSTR("Vary"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("*")) & 1) == 0)
    {
      objc_msgSend(v12, "_wrappedRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v52 = (void *)_CFURLRequestCopyProtocolPropertyForKey();
        if (v52)
        {
          v24 = -[NWURLLoaderCache copyVaryStateFromRequest:varyValueToCopy:](v13, v22);
          if (v24)
          {
            v49 = v24;
            v50 = objc_msgSend(v52, "isEqualToDictionary:", v24);

            if (!v50)
              goto LABEL_47;
            goto LABEL_30;
          }

        }
      }

    }
    goto LABEL_47;
  }
LABEL_30:
  if (!v20 || objc_msgSend(v20, "statusCode") != 301 && objc_msgSend(v20, "statusCode") != 308)
  {
    if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v25 = 1;
    }
    else if (_CFURLResponseMustRevalidate() == 1)
    {
      v25 = 3;
    }
    else
    {
      CFURLResponseGetExpirationTime();
      v25 = 3;
      if (v26 - CFAbsoluteTimeGetCurrent() >= 1.0)
      {
        objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("Must-Revalidate"));
        v53 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("Proxy-Revalidate"));
        v51 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("If-Modified-Since"));
        v27 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("Cache-Control"));
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v28 | v27;

        if (v29 | v51 | v53)
          v30 = 3;
        else
          v30 = 1;
        if (v11 == 5)
          v25 = 3;
        else
          v25 = v30;
      }
    }
    goto LABEL_48;
  }
LABEL_47:
  v25 = 2;
LABEL_48:

  if ((v25 | 2) == 3)
  {
    v31 = *(_QWORD *)(a1 + 32);
    if (v31)
    {
      objc_storeStrong((id *)(v31 + 104), a2);
      v32 = *(_QWORD *)(a1 + 32);
      if (v32)
        *(_BYTE *)(v32 + 14) = 1;
    }
    if (v25 == 3)
    {
      v33 = *(_QWORD *)(a1 + 32);
      if (v33)
      {
        *(_BYTE *)(v33 + 15) = 1;
        v34 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v34 = 0;
      }
      -[NWURLLoaderHTTP continueLoading](v34);
    }
  }
LABEL_16:
  v17 = *(_QWORD *)(a1 + 32);
  if (!v17)
  {
    v19 = 0;
    goto LABEL_57;
  }
  if (*(_BYTE *)(v17 + 14))
    goto LABEL_68;
  v18 = (id *)*(id *)(v17 + 40);
  v19 = v18;
  if (!v18)
    goto LABEL_57;
  if (objc_msgSend(v18[4], "_explicitlySetCachePolicy"))
  {
    if (objc_msgSend(v19[4], "cachePolicy") != 3)
    {
LABEL_57:
      v35 = *(_QWORD *)(a1 + 32);
      if (v35)
        v36 = *(void **)(v35 + 24);
      else
        v36 = 0;
      objc_msgSend(v36, "valueForHTTPHeaderField:", CFSTR("Cache-Control"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "rangeOfString:options:", CFSTR("only-if-cached"), 1);
      v39 = v38;

      if (!v39)
      {
        -[NWURLLoaderHTTP continueLoading](*(_QWORD *)(a1 + 32));
        goto LABEL_68;
      }
      goto LABEL_60;
    }
  }
  else if (objc_msgSend(v19[2], "requestCachePolicy") != 3)
  {
    goto LABEL_57;
  }

LABEL_60:
  v40 = *(id **)(a1 + 32);
  if (v40)
  {
    v41 = [NWURLError alloc];
    objc_msgSend(v40[6], "loaderTask");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v40;
    v44 = v42;
    if (v41)
    {
      v45 = *MEMORY[0x1E0CB32E8];
      v55.receiver = v41;
      v55.super_class = (Class)NWURLError;
      v46 = (NWURLError *)objc_msgSendSuper2(&v55, sel_initWithDomain_code_userInfo_, v45, -1008, 0);
      v41 = v46;
      if (v46)
        -[NWURLError fillErrorForLoader:andTask:](v46, "fillErrorForLoader:andTask:", v43, v44);
    }

    v47 = *(_QWORD *)(a1 + 32);
    if (v47)
      objc_storeStrong((id *)(v47 + 88), v41);
  }
  else
  {
    v41 = 0;
  }

  v48 = *(_QWORD *)(a1 + 32);
  if (v48)
    *(_BYTE *)(v48 + 11) = 1;
LABEL_68:

}

void __25__NWURLLoaderHTTP_start___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[2];
  void (*v9)(uint64_t, void *);
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(v2 + 96);
  else
    v3 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __25__NWURLLoaderHTTP_start___block_invoke_3;
  v10 = &unk_1E14A9830;
  v11 = v2;
  v4 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v5 = v4;
  v6 = v8;
  if (v3)
  {
    v7 = *(void **)(v3 + 8);
    if (v7)
      objc_msgSend(v7, "getCachedResponseForDataTask:completionHandler:", v5, v6);
    else
      v9((uint64_t)v6, 0);
  }

}

void __25__NWURLLoaderHTTP_start___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(NSObject **)(v4 + 56);
  else
    v5 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__NWURLLoaderHTTP_start___block_invoke_4;
  v7[3] = &unk_1E14A9858;
  v7[4] = v4;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __25__NWURLLoaderHTTP_start___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[4];
  if (!v2 || !*(_BYTE *)(v2 + 12))
    (*(void (**)(void))(a1[7] + 16))();
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  const char *hostname;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  uint64_t v18;
  uint64_t verify_block;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v22;
  uint64_t v23;

  v3 = a2;
  hostname = nw_endpoint_get_hostname(*(nw_endpoint_t *)(a1 + 32));
  sec_protocol_options_set_tls_server_name(v3, hostname);
  v5 = MEMORY[0x1E0C809B0];
  verify_block = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __34__NWURLLoaderHTTP_continueLoading__block_invoke_2;
  v22 = &unk_1E14A9880;
  v6 = *(_QWORD *)(a1 + 40);
  v23 = v6;
  if (v6)
    v7 = *(NSObject **)(v6 + 56);
  else
    v7 = 0;
  sec_protocol_options_set_verify_block(v3, &verify_block, v7);
  v14 = v5;
  v15 = 3221225472;
  v16 = __34__NWURLLoaderHTTP_continueLoading__block_invoke_3;
  v17 = &unk_1E14A98D0;
  v8 = *(_QWORD *)(a1 + 40);
  v18 = v8;
  if (v8)
    v9 = *(NSObject **)(v8 + 56);
  else
    v9 = 0;
  sec_protocol_options_set_challenge_block(v3, &v14, v9);
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    v11 = *(_QWORD *)(v10 + 40);
  else
    v11 = 0;
  -[NWURLSessionTaskConfiguration configureSecProtocolOptions:](v11, v3);
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    v13 = *(void **)(v12 + 48);
  else
    v13 = 0;
  objc_msgSend(v13, "joiningContext", v14, v15, v16, v17, v18, verify_block, v20, v21, v22, v23);
  sec_protocol_options_set_nw_protocol_joining_context();

}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char isKindOfClass;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;

  v24 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 48);
  else
    v4 = 0;
  objc_msgSend(v4, "clientMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  nw_http_messaging_options_set_client_metadata(v24, v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6 && (v7 = *(_QWORD *)(v6 + 40)) != 0)
  {
    objc_msgSend(*(id *)(v7 + 16), "_connectionCachePurgeTimeout");
    v9 = v8 - 1;
  }
  else
  {
    v9 = 0xFFFFFFFFLL;
  }
  nw_http1_set_idle_timeout(v24, v9);
  v10 = *(_QWORD *)(a1 + 32);
  if (v10 && (v11 = *(_QWORD *)(v10 + 40)) != 0)
  {
    objc_msgSend(*(id *)(v11 + 16), "_longLivedConnectionCachePurgeTimeout");
    v13 = 2 * v12;
  }
  else
  {
    v13 = 0;
  }
  nw_http2_set_idle_timeout(v24, v13);
  nw_http3_set_idle_timeout(v24, v13);
  v14 = *(_QWORD *)(a1 + 32);
  if (v14 && (v15 = *(_QWORD *)(v14 + 40)) != 0)
    v16 = objc_msgSend(*(id *)(v15 + 16), "HTTPMaximumConnectionsPerHost");
  else
    v16 = 0;
  nw_http1_set_connection_pool_width(v24, v16);
  v17 = *(_QWORD *)(a1 + 32);
  if (!v17)
    goto LABEL_33;
  if (!*(_BYTE *)(v17 + 17))
  {
    v18 = *(_QWORD *)(v17 + 40);
    if (v18)
    {
      v19 = *(id *)(v18 + 24);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v21 = 1;
        goto LABEL_17;
      }
      v22 = objc_msgSend(*(id *)(v18 + 32), "_allowedProtocolTypes");
      if (!v22)
        goto LABEL_27;
      v21 = (v22 >> 4) & 4 | (v22 >> 3) & 2 | v22 & 1;
      if ((v22 & 1) != 0)
      {
        if (((v22 >> 3) & 2) != 0)
          goto LABEL_22;
        goto LABEL_17;
      }
LABEL_34:
      nw_http_messaging_options_set_http1_options(v24, 0);
      if ((v21 & 2) != 0)
      {
LABEL_22:
        if (v21 > 3)
          goto LABEL_27;
        goto LABEL_23;
      }
LABEL_17:
      nw_http_messaging_options_set_http2_options(v24, 0);
      if (v21 > 3)
        goto LABEL_27;
LABEL_23:
      if (nw_get_http3_override_onceToken != -1)
        dispatch_once(&nw_get_http3_override_onceToken, &__block_literal_global_8_72633);
      if (nw_get_http3_override_value != 1)
        nw_http_messaging_options_set_http3_options(v24, 0);
      goto LABEL_27;
    }
LABEL_33:
    v21 = 0;
    goto LABEL_34;
  }
  nw_http_messaging_options_set_http2_options(v24, 0);
  nw_http_messaging_options_set_http3_options(v24, 0);
  v23 = *(_QWORD *)(a1 + 32);
  if (v23)
    *(_BYTE *)(v23 + 17) = 0;
LABEL_27:

}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  -[NWURLLoaderHTTP handleAuthenticationChallenge:url:cancel:completionHandler:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40), 1, a3);
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(void **)(v5 + 48);
  else
    v6 = 0;
  v7 = a4;
  objc_msgSend(v6, "loaderWillPerformHSTSUpgrade:", a3);
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v13 = a5;
  v14 = *(_QWORD *)(a1 + 32);
  if (!v14)
    goto LABEL_5;
  if (!*(_BYTE *)(v14 + 12))
  {
    -[NWURLLoaderHTTP stopResponseStallTimer](v14, v12);
    v14 = *(_QWORD *)(a1 + 32);
LABEL_5:
    -[NWURLLoaderHTTP responseFromMetadata:](v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)nw_endpoint_copy_cfurl(v10);
    v17 = *(_QWORD *)(a1 + 32);
    if (v17)
      v18 = *(void **)(v17 + 24);
    else
      v18 = 0;
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v19, "setURL:", v16);
    if (v16)
    {
      objc_msgSend(v16, "scheme");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length") - 2;
      if (v21 >= 4)
      {

      }
      else
      {
        v22 = objc_msgSend(v20, "caseInsensitiveCompare:", off_1E149C2F8[v21]);

        if (!v22)
        {
          v43 = v15;
          v44 = v10;
          v45 = v9;
          v23 = nw_http_metadata_copy_request(v11);
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_11;
          v54[3] = &unk_1E14A99D8;
          v42 = v19;
          v24 = v19;
          v55 = v24;
          nw_http_request_access_method(v23, v54);
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          objc_msgSend(v24, "_allHTTPHeaderFieldsAsArrays");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v51;
            do
            {
              v29 = 0;
              do
              {
                if (*(_QWORD *)v51 != v28)
                  objc_enumerationMutation(v25);
                objc_msgSend(v24, "setValue:forHTTPHeaderField:", 0, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v29++));
              }
              while (v27 != v29);
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
            }
            while (v27);
          }

          v30 = nw_http_request_copy_url_request(v23, (void *)*MEMORY[0x1E0C930E8], v16);
          objc_msgSend((id)v30, "_allHTTPHeaderFieldsAsArrays");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_12;
          v48[3] = &unk_1E14A9A00;
          v32 = v24;
          v49 = v32;
          objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v48);

          if (v32)
          {
            objc_msgSend(v32, "HTTPMethod");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "caseInsensitiveCompare:", CFSTR("GET"));

            if (!v34
              || (objc_msgSend(v32, "HTTPMethod"),
                  v38 = (void *)objc_claimAutoreleasedReturnValue(),
                  v39 = objc_msgSend(v38, "caseInsensitiveCompare:", CFSTR("HEAD")),
                  v38,
                  !v39))
            {
              objc_msgSend(v32, "setHTTPBody:", 0);
              objc_msgSend(v32, "setHTTPBodyStream:", 0);
            }
          }

          v10 = v44;
          v9 = v45;
          v19 = v42;
          v15 = v43;
          goto LABEL_21;
        }
      }
    }
    if (objc_msgSend(v16, "isFileURL"))
    {
      v40 = *(_QWORD *)(a1 + 32);
      if (!v40 || !*(_QWORD *)(v40 + 88))
      {
        -[NWURLLoaderHTTP errorForErrorCode:]((id *)v40, -1102);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NWURLLoaderHTTP setPendingError:](*(_QWORD *)(a1 + 32), v41);

      }
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v13 + 2))(v13, 0, 0, 0);
      goto LABEL_24;
    }
LABEL_21:
    v35 = *(_QWORD **)(a1 + 32);
    if (v35)
      v35 = (_QWORD *)v35[6];
    v36 = v35;
    v37 = (void *)objc_msgSend(v19, "copy");
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_13;
    v46[3] = &unk_1E14A9A28;
    v46[4] = *(_QWORD *)(a1 + 32);
    v47 = v13;
    objc_msgSend(v36, "loaderWillPerformHTTPRedirection:newRequest:completionHandler:", v15, v37, v46);

LABEL_24:
    goto LABEL_25;
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v13 + 2))(v13, 0, 0, 0);
LABEL_25:

}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, _QWORD);
  uint64_t v7;
  NSObject *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t id;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  nw_content_context_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  _QWORD *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  uint64_t *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (!v7)
  {
LABEL_4:
    v8 = (id)v7;
    v9 = *(_QWORD **)(a1 + 32);
    if (v9)
      v9 = (_QWORD *)v9[9];
    v10 = v9;
    v11 = nw_connection_create_with_connection(v10, v5);
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      objc_storeStrong((id *)(v12 + 72), v11);

    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v13 = (id)gurlLogObj;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
LABEL_20:

      v25 = *(_QWORD *)(a1 + 32);
      if (v25 && *(_QWORD *)(v25 + 72))
      {
        -[NWURLLoaderHTTP stopResponseStallTimer](v25, v24);
        v26 = *(_QWORD *)(a1 + 32);
        if (v26)
          v27 = *(void **)(v26 + 64);
        else
          v27 = 0;
        objc_msgSend(v27, "close", v39, v40, v41, v42, v43, v44);
        v28 = *(_QWORD *)(a1 + 32);
        if (v28)
        {
          v29 = *(void **)(v28 + 64);
          *(_QWORD *)(v28 + 64) = 0;

        }
        v30 = nw_content_context_create("http resend context");
        v31 = *(_QWORD *)(a1 + 32);
        if (v31)
          objc_storeStrong((id *)(v31 + 80), v30);

        v32 = *(_QWORD *)(a1 + 32);
        if (v32)
          v33 = *(_QWORD *)(v32 + 80);
        else
          v33 = 0;
        v6[2](v6, v33);
        v34 = *(_QWORD *)(a1 + 32);
        if (v34)
          v35 = *(void **)(v34 + 72);
        else
          v35 = 0;
        -[NWURLLoaderHTTP configureAndStartConnection:](v34, v35);
        -[NWURLLoaderHTTP needRequestBody](*(_QWORD *)(a1 + 32));
        -[NWURLLoaderHTTP readResponse](*(_QWORD *)(a1 + 32));
        v36 = *(_QWORD **)(a1 + 32);
        if (!v36)
          goto LABEL_34;
      }
      else
      {
        -[NWURLLoaderHTTP setConnection:](v25, v8);
        v36 = *(_QWORD **)(a1 + 32);
        if (!v36)
          goto LABEL_34;
      }
      v36 = (_QWORD *)v36[5];
LABEL_34:
      v37 = v36;
      -[NWURLSessionTaskConfiguration activity]((uint64_t)v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      nw_connection_end_activity(v8, v38);

      nw_connection_cancel(v8);
      goto LABEL_35;
    }
    v14 = *(_QWORD *)(a1 + 32);
    if (v14 && (v15 = *(id *)(v14 + 48)) != 0)
    {
      v16 = v15;
      objc_msgSend(v15, "logDescription");
      v17 = *(_QWORD *)(a1 + 32);
      if (!v17)
        goto LABEL_36;
    }
    else
    {
      v16 = 0;
      v42 = 0;
      v43 = 0;
      LODWORD(v44) = 0;
      v17 = *(_QWORD *)(a1 + 32);
      if (!v17)
        goto LABEL_36;
    }
    v18 = *(id *)(v17 + 48);
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v18, "logDescription");
      v20 = v41;
      v21 = *(_QWORD *)(a1 + 32);
      if (!v21)
      {
LABEL_37:
        v22 = 0;
        goto LABEL_19;
      }
LABEL_18:
      v22 = *(void **)(v21 + 72);
LABEL_19:
      id = nw_connection_get_id(v22);
      *(_DWORD *)buf = 68289538;
      v46 = 16;
      v47 = 2098;
      v48 = &v42;
      v49 = 1024;
      v50 = v20;
      v51 = 2048;
      v52 = id;
      _os_log_impl(&dword_182FBE000, v13, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> created [C%llu]", buf, 0x22u);

      goto LABEL_20;
    }
LABEL_36:
    v20 = 0;
    v19 = 0;
    v39 = 0;
    v40 = 0;
    LODWORD(v41) = 0;
    v21 = *(_QWORD *)(a1 + 32);
    if (!v21)
      goto LABEL_37;
    goto LABEL_18;
  }
  if (!*(_BYTE *)(v7 + 12))
  {
    v7 = *(_QWORD *)(v7 + 72);
    goto LABEL_4;
  }
LABEL_35:

}

uint64_t __34__NWURLLoaderHTTP_continueLoading__block_invoke_35(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;

  (*(void (**)(uint64_t))(a3 + 16))(a3);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    if (*(_BYTE *)(v4 + 12))
      return 0;
    v4 = *(_QWORD *)(v4 + 72);
  }
  v7 = (id)v4;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v9 = *(void **)(v8 + 72);
    *(_QWORD *)(v8 + 72) = 0;

    v10 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v10 = 0;
  }
  -[NWURLLoaderHTTP stopResponseStallTimer](v10, v6);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(void **)(v11 + 64);
  else
    v12 = 0;
  objc_msgSend(v12, "close");
  v13 = *(_QWORD *)(a1 + 32);
  if (v13
    && (v14 = *(void **)(v13 + 64), *(_QWORD *)(v13 + 64) = 0, v14, (v15 = *(_QWORD *)(a1 + 32)) != 0))
  {
    *(_BYTE *)(v15 + 17) = 1;
    v16 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v16 = 0;
  }
  -[NWURLLoaderHTTP continueLoading](v16);
  -[NWURLLoaderHTTP readResponse](*(_QWORD *)(a1 + 32));
  v17 = *(_QWORD **)(a1 + 32);
  if (v17)
    v17 = (_QWORD *)v17[5];
  v18 = v17;
  -[NWURLSessionTaskConfiguration activity]((uint64_t)v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  nw_connection_end_activity(v7, v19);

  nw_connection_cancel(v7);
  return 1;
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_2_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFHTTPMessage *v6;
  __CFHTTPMessage *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _CFHTTPAuthentication *v11;
  _CFHTTPAuthentication *v12;
  _BOOL8 v13;
  void *v14;
  int type;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _DWORD *v23;
  _QWORD *v24;
  _BOOL4 v25;
  NSObject *v26;
  uint64_t v27;
  id *v28;
  id *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[4];
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v37 = a3;
  v6 = (__CFHTTPMessage *)nw_authentication_challenge_copy_http_message(v5);
  if (!v6)
    goto LABEL_26;
  v7 = v6;
  v8 = (void *)nw_authentication_challenge_copy_protection_space(v5);
  v9 = nw_authentication_protection_space_copy_endpoint(v8);
  v10 = (void *)nw_endpoint_copy_cfurl(v9);
  if (v10)
    _CFHTTPMessageSetResponseProxyURL();
  v11 = CFHTTPAuthenticationCreateFromResponse((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7);
  if (!v11)
  {
    v25 = 0;
    goto LABEL_24;
  }
  v12 = v11;
  v13 = nw_http_authentication_parse_schemes(v11, v9, 1, 1, 0);
  v14 = (void *)v13;
  if (v13 && *(_QWORD *)(v13 + 24) != *(_QWORD *)(v13 + 16))
  {
    nw_authentication_challenge_set_protection_space_array(v5, (void *)v13);
    type = nw_authentication_challenge_get_type(v5);
    if (type == 4)
      goto LABEL_22;
    v16 = type;
    v17 = *(_QWORD *)(a1 + 32);
    if (v17)
      v18 = *(_QWORD *)(v17 + 40);
    else
      v18 = 0;
    -[NWURLSessionTaskConfiguration URLCredentialStorage](v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = *(_QWORD *)(a1 + 32);
      if (v20)
        v21 = *(_QWORD *)(v20 + 40);
      else
        v21 = 0;
      -[NWURLSessionTaskConfiguration URLCredentialStorage](v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = a1;
      v23 = nw_authentication_credential_storage_copy_default_credential(v22, v5);

      if (v23)
      {
        v24 = v23;
        v35 = v24[3];

        if (v35)
          nw_authentication_challenge_set_proposed_credential(v5, v24);
      }

      a1 = v36;
    }
    if (v16 != 5)
LABEL_22:
      v25 = 0;
    else
      v25 = _CFHTTPAuthenticationIsSecondNTLMTransaction() != 0;

    CFRelease(v12);
LABEL_24:
    CFRelease(v7);

    if (v25)
    {
LABEL_25:
      (*((void (**)(id, _QWORD, _QWORD))v37 + 2))(v37, 0, 0);
      goto LABEL_35;
    }
LABEL_26:
    v27 = *(_QWORD *)(a1 + 32);
    if (v27)
    {
      v28 = (id *)*(id *)(v27 + 40);
      v29 = v28;
      if (v28 && (objc_msgSend(v28[2], "_requiresSecureHTTPSProxyConnection") & 1) != 0)
        goto LABEL_33;
      v30 = *(_QWORD *)(a1 + 32);
      if (!v30)
      {
LABEL_39:
        if (nw_proxy_options_authbroker_is_available::onceToken != -1)
          dispatch_once(&nw_proxy_options_authbroker_is_available::onceToken, &__block_literal_global_35239);
        v34 = nw_proxy_options_authbroker_is_available::available;

        if ((v34 & 1) != 0)
          goto LABEL_25;
LABEL_34:
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(void **)(a1 + 40);
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_38;
        v38[3] = &unk_1E14A9AC8;
        v38[4] = v32;
        v39 = v37;
        -[NWURLLoaderHTTP handleAuthenticationChallenge:url:cancel:completionHandler:](v32, v5, v33, 0, v38);

        goto LABEL_35;
      }
    }
    else
    {
      v29 = 0;
      v30 = *(_QWORD *)(a1 + 32);
      if (!v30)
        goto LABEL_39;
    }
    if (*(_BYTE *)(v30 + 18)
      || (v31 = *(_QWORD *)(v30 + 40)) != 0
      && (objc_msgSend(*(id *)(v31 + 16), "_preventsSystemHTTPProxyAuthentication") & 1) != 0)
    {
LABEL_33:

      goto LABEL_34;
    }
    goto LABEL_39;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v26 = (id)gLogObj;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v41 = "-[NWURLLoaderHTTP continueLoading]_block_invoke_2";
    _os_log_impl(&dword_182FBE000, v26, OS_LOG_TYPE_ERROR, "%{public}s Unable to determine authentication type", buf, 0xCu);
  }

  CFRelease(v12);
  CFRelease(v7);
  (*((void (**)(id, _QWORD, uint64_t))v37 + 2))(v37, 0, 1);

LABEL_35:
}

- (void)configureAndStartConnection:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t v15;
  _QWORD handler[4];
  NSObject *v17;
  uint64_t v18;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke;
    handler[3] = &unk_1E14AD048;
    v6 = v3;
    v17 = v6;
    v18 = a1;
    nw_connection_set_state_changed_handler(v6, handler);
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke_44;
    v13[3] = &unk_1E14A9AF0;
    v7 = v6;
    v14 = v7;
    v15 = a1;
    nw_connection_set_better_path_available_handler(v7, v13);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke_46;
    v10[3] = &unk_1E14A9AF0;
    v8 = v7;
    v11 = v8;
    v12 = a1;
    nw_connection_set_viability_changed_handler(v8, v10);
    *(_BYTE *)(a1 + 9) = 0;
    v9 = *(void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = 0;

    nw_connection_set_queue(v8, *(dispatch_queue_t *)(a1 + 56));
    -[NWURLSessionTaskConfiguration configureConnection:](*(_QWORD *)(a1 + 40), v8);
    nw_connection_start(v8);

  }
}

void __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id establishment_report;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  id v20;
  id *v21;
  id v22;
  BOOL is_equal_unsafe;
  id v24;
  int privacy_stance;
  id *v26;
  id v27;
  BOOL v28;
  _BYTE *v29;
  id *v30;
  id v31;
  BOOL v32;
  _BYTE *v33;
  id v34;
  id *v35;
  id v36;
  id *v37;
  id v38;
  BOOL v39;
  id v40;
  _QWORD *v41;
  NSObject *v42;
  NSObject *v43;
  nw_protocol_metadata_t v44;
  sec_protocol_metadata_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  _QWORD *v51;
  _BOOL8 v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t *v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  _QWORD *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  id v81;
  id *metadata;
  int v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  id v91;
  id v92;
  NSObject *v93;
  uint64_t v94;
  id v95;
  void *v96;
  uint64_t v97;
  id v98;
  void *v99;
  int v100;
  const char *v101;
  void *v102;
  char *v103;
  NSObject *v104;
  os_log_type_t v105;
  void *v106;
  char *v107;
  NSObject *v108;
  os_log_type_t v109;
  void *v110;
  char *v111;
  NSObject *v112;
  os_log_type_t v113;
  void *v114;
  char *v115;
  NSObject *v116;
  os_log_type_t v117;
  char *backtrace_string;
  NSObject *v119;
  os_log_type_t v120;
  _BOOL4 v121;
  char *v122;
  NSObject *v123;
  os_log_type_t v124;
  _BOOL4 v125;
  char *v126;
  NSObject *v127;
  _BOOL4 v128;
  char *v129;
  NSObject *v130;
  _BOOL4 v131;
  os_log_type_t v132;
  NSObject *v133;
  uint64_t v134;
  id v135;
  void *v136;
  os_log_type_t v137;
  os_log_type_t v138;
  os_log_type_t v139;
  uint64_t v140;
  id v141;
  void *v142;
  int v143;
  uint64_t v144;
  int v145;
  _BYTE *v146;
  uint64_t v147;
  void *v148;
  nw_protocol_metadata_t obj;
  char v150;
  os_log_type_t v151;
  uint64_t v152;
  uint64_t v153;
  int v154;
  _QWORD v155[2];
  int v156;
  os_log_type_t type[8];
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  _QWORD v162[2];
  int v163;
  _BYTE buf[54];
  uint64_t v165;

  v165 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    v7 = *(_QWORD *)(v7 + 72);
  if (*(_QWORD *)(a1 + 32) != v7)
    goto LABEL_100;
  if (gLogDatapath)
  {
    v92 = v5;
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v93 = (id)gurlLogObj;
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
    {
      v94 = *(_QWORD *)(a1 + 40);
      if (v94 && (v95 = *(id *)(v94 + 48)) != 0)
      {
        v96 = v95;
        objc_msgSend(v95, "logDescription");
      }
      else
      {
        v96 = 0;
        v162[0] = 0;
        v162[1] = 0;
        v163 = 0;
      }
      v97 = *(_QWORD *)(a1 + 40);
      if (v97 && (v98 = *(id *)(v97 + 48)) != 0)
      {
        v99 = v98;
        objc_msgSend(v98, "logDescription");
        v100 = v161;
      }
      else
      {
        v100 = 0;
        v99 = 0;
        v159 = 0;
        v160 = 0;
        v161 = 0;
      }
      if (a2 > 5)
        v101 = "unknown";
      else
        v101 = off_1E149DE10[a2];
      *(_DWORD *)buf = 136447490;
      *(_QWORD *)&buf[4] = "-[NWURLLoaderHTTP configureAndStartConnection:]_block_invoke";
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2098;
      *(_QWORD *)&buf[20] = v162;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v100;
      *(_WORD *)&buf[34] = 2080;
      *(_QWORD *)&buf[36] = v101;
      *(_WORD *)&buf[44] = 2112;
      *(_QWORD *)&buf[46] = v92;
      _os_log_impl(&dword_182FBE000, v93, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> connection state: %s, error: %@", buf, 0x36u);

    }
    v6 = v92;
  }
  switch(a2)
  {
    case 1u:
      v8 = *(_QWORD *)(a1 + 40);
      v9 = v6;
      if (v8)
        v10 = *(void **)(v8 + 48);
      else
        v10 = 0;
      objc_msgSend(v10, "loaderWaitingForConnectivity");
      goto LABEL_82;
    case 2u:
      v69 = *(_QWORD *)(a1 + 40);
      v9 = v6;
      if (v69)
        v70 = *(void **)(v69 + 48);
      else
        v70 = 0;
      objc_msgSend(v70, "loaderPreparingConnection");
LABEL_82:
      v6 = v9;
      goto LABEL_100;
    case 3u:
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
        *(_BYTE *)(v11 + 9) = 1;
      v12 = *(NSObject **)(a1 + 32);
      v148 = v6;
      if (nw_protocol_copy_http_connection_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
      v13 = (id)nw_protocol_copy_http_connection_definition_definition;
      obj = nw_connection_copy_protocol_metadata(v12, v13);

      if (!obj)
        goto LABEL_46;
      v14 = *(_QWORD *)(a1 + 40);
      if (v14)
      {
        objc_storeStrong((id *)(v14 + 144), obj);
        v15 = *(_QWORD *)(a1 + 40);
      }
      else
      {
        v15 = 0;
      }
      -[NWURLLoaderHTTP addProgressObserverForResponseStallTimer](v15);
      establishment_report = nw_http_connection_metadata_get_establishment_report(obj);
      v17 = establishment_report == 0;

      if (!v17)
        goto LABEL_46;
      v18 = nw_connection_copy_establishment_report_on_queue(*(void **)(a1 + 32));
      v19 = obj;
      v20 = v18;
      v21 = v19;
      v22 = v21[1];

      if (nw_protocol_copy_http_connection_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
      is_equal_unsafe = nw_protocol_definition_is_equal_unsafe((uint64_t)v22, nw_protocol_copy_http_connection_definition_definition);

      if (is_equal_unsafe)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __nw_http_connection_metadata_set_establishment_report_block_invoke;
        *(_QWORD *)&buf[24] = &unk_1E14A9F20;
        v24 = v20;
        *(_QWORD *)&buf[32] = v24;
        if (v21[4])
        {
          (*(void (**)(_BYTE *))&buf[16])(buf);
          v24 = *(id *)&buf[32];
        }

        goto LABEL_23;
      }
      __nwlog_obj();
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_establishment_report";
      LODWORD(v147) = 12;
      v146 = buf;
      v103 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      v151 = OS_LOG_TYPE_DEFAULT;
      if (!__nwlog_fault(v103, type, &v151))
        goto LABEL_180;
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v104 = objc_claimAutoreleasedReturnValue();
        v105 = type[0];
        if (os_log_type_enabled(v104, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_establishment_report";
          _os_log_impl(&dword_182FBE000, v104, v105, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
LABEL_132:

        goto LABEL_180;
      }
      if (v151 == OS_LOG_TYPE_DEFAULT)
      {
        __nwlog_obj();
        v104 = objc_claimAutoreleasedReturnValue();
        v132 = type[0];
        if (os_log_type_enabled(v104, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_establishment_report";
          _os_log_impl(&dword_182FBE000, v104, v132, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_132;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v119 = objc_claimAutoreleasedReturnValue();
      v120 = type[0];
      v121 = os_log_type_enabled(v119, type[0]);
      if (backtrace_string)
      {
        if (v121)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_establishment_report";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_182FBE000, v119, v120, "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
      }
      else
      {
        if (v121)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_establishment_report";
          _os_log_impl(&dword_182FBE000, v119, v120, "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }

      }
LABEL_180:
      if (v103)
        free(v103);
LABEL_23:

      privacy_stance = nw_connection_get_privacy_stance(*(void **)(a1 + 32));
      nw_http_connection_metadata_set_privacy_stance(v21, privacy_stance);
      if (!nw_connection_uses_multipath(*(void **)(a1 + 32)))
        goto LABEL_30;
      v26 = v21;
      v27 = v21[1];

      if (nw_protocol_copy_http_connection_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
      v28 = nw_protocol_definition_is_equal_unsafe((uint64_t)v27, nw_protocol_copy_http_connection_definition_definition);

      if (v28)
      {
        v29 = v26[4];
        if (v29)
          v29[196] |= 1u;
        goto LABEL_29;
      }
      __nwlog_obj();
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_multipath";
      LODWORD(v147) = 12;
      v146 = buf;
      v111 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      v151 = OS_LOG_TYPE_DEFAULT;
      if (!__nwlog_fault(v111, type, &v151))
        goto LABEL_199;
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v112 = objc_claimAutoreleasedReturnValue();
        v113 = type[0];
        if (os_log_type_enabled(v112, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_multipath";
          _os_log_impl(&dword_182FBE000, v112, v113, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
LABEL_142:

        goto LABEL_199;
      }
      if (v151 == OS_LOG_TYPE_DEFAULT)
      {
        __nwlog_obj();
        v112 = objc_claimAutoreleasedReturnValue();
        v138 = type[0];
        if (os_log_type_enabled(v112, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_multipath";
          _os_log_impl(&dword_182FBE000, v112, v138, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_142;
      }
      v126 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v127 = objc_claimAutoreleasedReturnValue();
      HIDWORD(v147) = type[0];
      v128 = os_log_type_enabled(v127, type[0]);
      if (v126)
      {
        if (v128)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_multipath";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v126;
          _os_log_impl(&dword_182FBE000, v127, BYTE4(v147), "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v126);
      }
      else
      {
        if (v128)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_multipath";
          _os_log_impl(&dword_182FBE000, v127, BYTE4(v147), "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }

      }
LABEL_199:
      if (v111)
        free(v111);
LABEL_29:

LABEL_30:
      *(_QWORD *)type = 0;
      v158 = 0;
      nw_connection_get_uuid(*(void **)(a1 + 32), (unsigned __int8 *)type);
      nw_http_connection_metadata_set_uuid(v21, (uint64_t)type);
      if (!nw_connection_is_unlisted_tracker(*(void **)(a1 + 32)))
        goto LABEL_37;
      v30 = v21;
      v31 = v21[1];

      if (nw_protocol_copy_http_connection_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
      v32 = nw_protocol_definition_is_equal_unsafe((uint64_t)v31, nw_protocol_copy_http_connection_definition_definition);

      if (v32)
      {
        v33 = v30[4];
        if (v33)
          v33[196] |= 2u;
        goto LABEL_36;
      }
      __nwlog_obj();
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_unlisted_tracker";
      LODWORD(v147) = 12;
      v146 = buf;
      v115 = (char *)_os_log_send_and_compose_impl();

      v151 = OS_LOG_TYPE_ERROR;
      v150 = 0;
      if (!__nwlog_fault(v115, &v151, &v150))
        goto LABEL_204;
      if (v151 == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v116 = objc_claimAutoreleasedReturnValue();
        v117 = v151;
        if (os_log_type_enabled(v116, v151))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_unlisted_tracker";
          _os_log_impl(&dword_182FBE000, v116, v117, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
LABEL_147:

        goto LABEL_204;
      }
      if (!v150)
      {
        __nwlog_obj();
        v116 = objc_claimAutoreleasedReturnValue();
        v139 = v151;
        if (os_log_type_enabled(v116, v151))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_unlisted_tracker";
          _os_log_impl(&dword_182FBE000, v116, v139, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_147;
      }
      v129 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v130 = objc_claimAutoreleasedReturnValue();
      HIDWORD(v147) = v151;
      v131 = os_log_type_enabled(v130, v151);
      if (v129)
      {
        if (v131)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_unlisted_tracker";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v129;
          _os_log_impl(&dword_182FBE000, v130, BYTE4(v147), "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v129);
      }
      else
      {
        if (v131)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_unlisted_tracker";
          _os_log_impl(&dword_182FBE000, v130, BYTE4(v147), "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }

      }
LABEL_204:
      if (v115)
        free(v115);
LABEL_36:

LABEL_37:
      v34 = nw_connection_copy_connected_path(*(void **)(a1 + 32));
      if (!v34)
        goto LABEL_45;
      v35 = v21;
      v36 = v34;
      v37 = v35;
      v38 = v21[1];

      if (nw_protocol_copy_http_connection_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
      v39 = nw_protocol_definition_is_equal_unsafe((uint64_t)v38, nw_protocol_copy_http_connection_definition_definition);

      if (v39)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __nw_http_connection_metadata_set_path_block_invoke;
        *(_QWORD *)&buf[24] = &unk_1E14A9F20;
        v40 = v36;
        *(_QWORD *)&buf[32] = v40;
        if (v37[4])
        {
          (*(void (**)(_BYTE *))&buf[16])(buf);
          v40 = *(id *)&buf[32];
        }

        goto LABEL_44;
      }
      __nwlog_obj();
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_path";
      LODWORD(v147) = 12;
      v146 = buf;
      v107 = (char *)_os_log_send_and_compose_impl();

      v151 = OS_LOG_TYPE_ERROR;
      v150 = 0;
      if (!__nwlog_fault(v107, &v151, &v150))
        goto LABEL_194;
      if (v151 == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v108 = objc_claimAutoreleasedReturnValue();
        v109 = v151;
        if (os_log_type_enabled(v108, v151))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_path";
          _os_log_impl(&dword_182FBE000, v108, v109, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
LABEL_137:

        goto LABEL_194;
      }
      if (!v150)
      {
        __nwlog_obj();
        v108 = objc_claimAutoreleasedReturnValue();
        v137 = v151;
        if (os_log_type_enabled(v108, v151))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_path";
          _os_log_impl(&dword_182FBE000, v108, v137, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_137;
      }
      v122 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v123 = objc_claimAutoreleasedReturnValue();
      v124 = v151;
      v125 = os_log_type_enabled(v123, v151);
      if (v122)
      {
        if (v125)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_path";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v122;
          _os_log_impl(&dword_182FBE000, v123, v124, "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v122);
      }
      else
      {
        if (v125)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_set_path";
          _os_log_impl(&dword_182FBE000, v123, v124, "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }

      }
LABEL_194:
      if (v107)
        free(v107);
LABEL_44:

LABEL_45:
LABEL_46:
      v41 = *(_QWORD **)(a1 + 40);
      if (v41)
        v41 = (_QWORD *)v41[9];
      v42 = v41;
      v43 = nw_protocol_boringssl_copy_definition();
      v44 = nw_connection_copy_protocol_metadata(v42, v43);

      if (v44)
      {
        v45 = v44;
        goto LABEL_50;
      }
      v71 = *(_QWORD **)(a1 + 40);
      if (v71)
        v71 = (_QWORD *)v71[9];
      v72 = v71;
      if (nw_protocol_copy_quic_stream_definition::onceToken != -1)
        dispatch_once(&nw_protocol_copy_quic_stream_definition::onceToken, &__block_literal_global_12_55083);
      v73 = (id)nw_protocol_copy_quic_stream_definition::quic_definition;
      v74 = nw_connection_copy_protocol_metadata(v72, v73);

      if (!v74)
      {
        v46 = 0;
        v45 = 0;
LABEL_52:

        goto LABEL_53;
      }
      v45 = nw_quic_copy_sec_protocol_metadata(v74);

      if (v45)
      {
LABEL_50:
        v46 = (void *)sec_protocol_metadata_copy_sec_trust();
        v47 = *(_QWORD *)(a1 + 40);
        if (v47)
          objc_storeStrong((id *)(v47 + 168), v46);
        goto LABEL_52;
      }
LABEL_53:
      v48 = *(_QWORD *)(a1 + 40);
      v49 = *(id *)(a1 + 32);
      v50 = v49;
      if (v48)
      {
        v51 = nw_connection_copy_connected_remote_endpoint(v49);
        v52 = nw_endpoint_copy_proxy_original_endpoint(v51);
        if (nw_connection_is_unlisted_tracker(v50))
        {
          if (v51 && v51[11])
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(*(id *)(v48 + 24), "URL", v146, v147);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "host");
            v53 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          v53 = 0;
        }
        if (v52 || nw_connection_get_privacy_stance(v50) == 2)
        {
          v76 = 0;
        }
        else
        {
          v80 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __35__NWURLLoaderHTTP_reportConnected___block_invoke;
          *(_QWORD *)&buf[24] = &unk_1E14A9B18;
          v81 = v80;
          *(_QWORD *)&buf[32] = v81;
          nw_endpoint_enumerate_cnames(v51, buf);
          if (objc_msgSend(v81, "count"))
            v76 = (void *)objc_msgSend(v81, "copy");
          else
            v76 = 0;

        }
        v77 = *(_QWORD *)(v48 + 144);
        v78 = *(id *)(v48 + 48);
        objc_msgSend(v78, "loaderConnectedWithHTTPConnectionMetadata:CNAMEChain:unlistedTracker:", v77, v76, v53);

      }
      v79 = *(_QWORD *)(a1 + 40);
      if (v79 && *(_BYTE *)(v79 + 16))
        -[NWURLLoaderHTTP startResponseStallTimer](v79);

      v6 = v148;
      goto LABEL_100;
    case 4u:
      v54 = *(_QWORD *)(a1 + 40);
      if (!v6)
        goto LABEL_65;
      if (v54 && *(_QWORD *)(v54 + 88))
        goto LABEL_66;
      v55 = v6;
      -[NWURLLoaderHTTP errorForNWError:]((id *)v54, v6);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = *(_QWORD *)(a1 + 40);
      if (v57)
        objc_storeStrong((id *)(v57 + 88), v56);

      v58 = *(_QWORD *)(a1 + 40);
      if (!v58)
      {
        v54 = 0;
LABEL_69:
        if (-[NWURLLoaderHTTP pendingErrorIsRetryable](v54))
        {
          if (gLogDatapath)
          {
            if (__nwlog_url_log::onceToken != -1)
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
            v133 = (id)gurlLogObj;
            if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
            {
              v134 = *(_QWORD *)(a1 + 40);
              if (v134 && (v135 = *(id *)(v134 + 48)) != 0)
              {
                v136 = v135;
                objc_msgSend(v135, "logDescription");
              }
              else
              {
                v136 = 0;
                v155[0] = 0;
                v155[1] = 0;
                v156 = 0;
              }
              v140 = *(_QWORD *)(a1 + 40);
              if (v140 && (v141 = *(id *)(v140 + 48)) != 0)
              {
                v142 = v141;
                objc_msgSend(v141, "logDescription");
                v143 = v154;
              }
              else
              {
                v143 = 0;
                v142 = 0;
                v152 = 0;
                v153 = 0;
                v154 = 0;
              }
              v144 = *(_QWORD *)(a1 + 40);
              if (v144)
              {
                v145 = *(char *)(v144 + 19);
                v144 = *(_QWORD *)(v144 + 88);
              }
              else
              {
                v145 = 0;
              }
              *(_DWORD *)buf = 136447490;
              *(_QWORD *)&buf[4] = "-[NWURLLoaderHTTP configureAndStartConnection:]_block_invoke";
              *(_WORD *)&buf[12] = 1042;
              *(_DWORD *)&buf[14] = 16;
              *(_WORD *)&buf[18] = 2098;
              *(_QWORD *)&buf[20] = v155;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v143;
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = v145;
              *(_WORD *)&buf[40] = 2112;
              *(_QWORD *)&buf[42] = v144;
              _os_log_impl(&dword_182FBE000, v133, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> retrying pre-connected connection on attempt %u with error: %@", buf, 0x32u);

            }
          }
          -[NWURLLoaderHTTP setPendingError:](*(_QWORD *)(a1 + 40), 0);
          v59 = *(_QWORD *)(a1 + 40);
          if (v59)
          {
            ++*(_BYTE *)(v59 + 19);
            v59 = *(_QWORD *)(a1 + 40);
            if (v59)
              v59 = *(_QWORD *)(v59 + 72);
          }
          v60 = (id)v59;
          -[NWURLLoaderHTTP setConnection:](*(_QWORD *)(a1 + 40), 0);
          -[NWURLLoaderHTTP stopResponseStallTimer](*(_QWORD *)(a1 + 40), v61);
          v62 = *(_QWORD *)(a1 + 40);
          if (v62)
            v63 = *(void **)(v62 + 64);
          else
            v63 = 0;
          objc_msgSend(v63, "close");
          v65 = *(_QWORD *)(a1 + 40);
          v64 = (uint64_t *)(a1 + 40);
          -[NWURLLoaderHTTP setRequestBodyProvider:](v65);
          -[NWURLLoaderHTTP continueLoading](*v64);
          -[NWURLLoaderHTTP needRequestBody](*v64);
          -[NWURLLoaderHTTP readResponse](*v64);
          v66 = (_QWORD *)*v64;
          if (*v64)
            v66 = (_QWORD *)v66[5];
          v67 = v66;
          -[NWURLSessionTaskConfiguration activity]((uint64_t)v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          nw_connection_end_activity(v60, v68);

          nw_connection_cancel(v60);
          goto LABEL_109;
        }
LABEL_104:
        metadata = nw_http_connection_create_metadata(0, 0, 0);
        v83 = nw_connection_get_privacy_stance(*(void **)(a1 + 32));
        nw_http_connection_metadata_set_privacy_stance(metadata, v83);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        nw_connection_get_uuid(*(void **)(a1 + 32), buf);
        nw_http_connection_metadata_set_uuid(metadata, (uint64_t)buf);
        v84 = *(_QWORD *)(a1 + 40);
        if (v84)
          v85 = *(void **)(v84 + 48);
        else
          v85 = 0;
        objc_msgSend(v85, "clientMetadata");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = nw_http_client_metadata_copy_current_transaction_metadata(v86);

        nw_http_transaction_metadata_set_connection_metadata(v87, metadata);
        nw_http_transaction_metadata_set_first_on_connection(v87);
        -[NWURLLoaderHTTP cancelConnection](*(_QWORD *)(a1 + 40));
        v88 = *(_QWORD *)(a1 + 40);
        if (v88)
        {
          v89 = *(void **)(v88 + 48);
          v90 = *(_QWORD *)(v88 + 88);
        }
        else
        {
          v89 = 0;
          v90 = 0;
        }
        v91 = v89;
        objc_msgSend(v91, "loaderFailedToConnect:", v90);

LABEL_109:
        v6 = v55;
        goto LABEL_100;
      }
      *(_BYTE *)(v58 + 8) = 1;
      v54 = *(_QWORD *)(a1 + 40);
      v6 = v55;
LABEL_65:
      if (!v54)
      {
        v55 = v6;
        goto LABEL_69;
      }
LABEL_66:
      if (!*(_BYTE *)(v54 + 9) && !*(_BYTE *)(v54 + 12))
      {
        v55 = v6;
        if (*(char *)(v54 + 19) > 2)
          goto LABEL_104;
        goto LABEL_69;
      }
LABEL_100:

      return;
    default:
      goto LABEL_100;
  }
}

void __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke_44(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v4 = *(_QWORD *)(v4 + 72);
  if (*(_QWORD *)(a1 + 32) == v4)
  {
    if (!gLogDatapath)
    {
      if (!a2)
        return;
      goto LABEL_6;
    }
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v7 = (id)gurlLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 40);
      if (v8 && (v9 = *(id *)(v8 + 48)) != 0)
      {
        v10 = v9;
        objc_msgSend(v9, "logDescription");
      }
      else
      {
        v10 = 0;
        v18 = 0;
        v19 = 0;
        LODWORD(v20) = 0;
      }
      v11 = *(_QWORD *)(a1 + 40);
      if (v11 && (v12 = *(id *)(v11 + 48)) != 0)
      {
        v13 = v12;
        objc_msgSend(v12, "logDescription");
        v14 = v17;

      }
      else
      {
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LODWORD(v17) = 0;
      }
      *(_DWORD *)buf = 136447234;
      v22 = "-[NWURLLoaderHTTP configureAndStartConnection:]_block_invoke";
      v23 = 1042;
      v24 = 16;
      v25 = 2098;
      v26 = &v18;
      v27 = 1024;
      v28 = v14;
      v29 = 1024;
      v30 = a2;
      _os_log_impl(&dword_182FBE000, v7, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> connection better path: %{BOOL}d", buf, 0x28u);

    }
    if (a2)
    {
LABEL_6:
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
        v6 = *(void **)(v5 + 48);
      else
        v6 = 0;
      objc_msgSend(v6, "loaderBetterPathAvailable", v15, v16, v17, v18, v19, v20);
    }
  }
}

void __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke_46(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  NWURLError *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  NWURLError *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  int v28;
  int v29;
  _QWORD v30[2];
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  _QWORD v35[2];
  int v36;
  _BYTE buf[18];
  __int16 v38;
  _QWORD *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v4 = *(_QWORD *)(v4 + 72);
  if (*(_QWORD *)(a1 + 32) == v4)
  {
    if (!gLogDatapath)
    {
      if ((a2 & 1) != 0)
        return;
LABEL_6:
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v5 = (id)gurlLogObj;
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:

        v13 = *(_QWORD *)(a1 + 40);
        if (v13)
        {
          if (*(_QWORD *)(v13 + 88))
          {
LABEL_26:
            -[NWURLLoaderHTTP cancelConnection](v13);
            return;
          }
          v14 = [NWURLError alloc];
          objc_msgSend(*(id *)(v13 + 48), "loaderTask");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (id)v13;
          v17 = v15;
          if (v14)
          {
            v18 = *MEMORY[0x1E0CB32E8];
            *(_QWORD *)buf = v14;
            *(_QWORD *)&buf[8] = NWURLError;
            v19 = (NWURLError *)objc_msgSendSuper2((objc_super *)buf, sel_initWithDomain_code_userInfo_, v18, -1005, 0);
            v14 = v19;
            if (v19)
              -[NWURLError fillErrorForLoader:andTask:](v19, "fillErrorForLoader:andTask:", v16, v17);
          }

          v20 = *(_QWORD *)(a1 + 40);
          if (v20)
            objc_storeStrong((id *)(v20 + 88), v14);
        }
        else
        {
          v14 = 0;
        }

        v13 = *(_QWORD *)(a1 + 40);
        goto LABEL_26;
      }
      v6 = *(_QWORD *)(a1 + 40);
      if (v6 && (v7 = *(id *)(v6 + 48)) != 0)
      {
        v8 = v7;
        objc_msgSend(v7, "logDescription");
        v9 = *(_QWORD *)(a1 + 40);
        if (!v9)
          goto LABEL_16;
      }
      else
      {
        v8 = 0;
        v30[0] = 0;
        v30[1] = 0;
        v31 = 0;
        v9 = *(_QWORD *)(a1 + 40);
        if (!v9)
          goto LABEL_16;
      }
      v10 = *(id *)(v9 + 48);
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v10, "logDescription");
        v12 = v29;

LABEL_17:
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&buf[4] = 16;
        *(_WORD *)&buf[8] = 2098;
        *(_QWORD *)&buf[10] = v30;
        v38 = 1024;
        LODWORD(v39) = v12;
        _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> connection not viable", buf, 0x18u);

        goto LABEL_18;
      }
LABEL_16:
      v12 = 0;
      goto LABEL_17;
    }
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v21 = (id)gurlLogObj;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = *(_QWORD *)(a1 + 40);
      if (v22 && (v23 = *(id *)(v22 + 48)) != 0)
      {
        v24 = v23;
        objc_msgSend(v23, "logDescription");
      }
      else
      {
        v24 = 0;
        v35[0] = 0;
        v35[1] = 0;
        v36 = 0;
      }
      v25 = *(_QWORD *)(a1 + 40);
      if (v25 && (v26 = *(id *)(v25 + 48)) != 0)
      {
        v27 = v26;
        objc_msgSend(v26, "logDescription");
        v28 = v34;

      }
      else
      {
        v28 = 0;
        v32 = 0;
        v33 = 0;
        v34 = 0;
      }
      *(_DWORD *)buf = 136447234;
      *(_QWORD *)&buf[4] = "-[NWURLLoaderHTTP configureAndStartConnection:]_block_invoke";
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      v38 = 2098;
      v39 = v35;
      v40 = 1024;
      v41 = v28;
      v42 = 1024;
      v43 = a2;
      _os_log_impl(&dword_182FBE000, v21, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> connection viable: %{BOOL}d", buf, 0x28u);

    }
    if ((a2 & 1) == 0)
      goto LABEL_6;
  }
}

- (void)addProgressObserverForResponseStallTimer
{
  uint64_t v2;
  id v3;

  if (a1 && *(_QWORD *)(a1 + 152) && *(_QWORD *)(a1 + 144))
  {
    if (HTTPNotificationCenter_onceToken != -1)
      dispatch_once(&HTTPNotificationCenter_onceToken, &__block_literal_global_197);
    v2 = *(_QWORD *)(a1 + 144);
    v3 = (id)HTTPNotificationCenter_center;
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel_restartStallTimer_, CFSTR("NWURLLoaderHTTPConnectionProgressNotification"), v2);

  }
}

- (void)startResponseStallTimer
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  dispatch_time_t v6;
  uint64_t v7;
  _QWORD v8[5];

  if (!*(_BYTE *)(a1 + 10))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      if (objc_msgSend(*(id *)(v2 + 16), "_reportsDataStalls"))
      {
        v3 = *(id *)(a1 + 48);
        objc_msgSend(v3, "networkContext");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __42__NWURLLoaderHTTP_startResponseStallTimer__block_invoke;
        v8[3] = &unk_1E14ACFD0;
        v8[4] = a1;
        *(_QWORD *)(a1 + 152) = nw_queue_context_create_source(v4, 2, 3, 0, v8, 0);

        v5 = *(_QWORD *)(a1 + 152);
        v6 = dispatch_time(0x8000000000000000, 3000000000);
        nw_queue_set_timer_values(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        nw_queue_activate_source(*(_QWORD *)(a1 + 152), v7);
        -[NWURLLoaderHTTP addProgressObserverForResponseStallTimer](a1);
      }
    }
  }
}

- (uint64_t)pendingErrorIsRetryable
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;

  v1 = a1;
  if (a1)
  {
    v2 = *(id *)(a1 + 88);
    if (v2)
    {
      v3 = *(id *)(v1 + 88);
      if (objc_msgSend(v3, "code") == -1005)
      {
        v1 = 1;
      }
      else
      {
        v4 = *(id *)(v1 + 88);
        v1 = objc_msgSend(v4, "code") == -1017 || objc_msgSend(*(id *)(v1 + 88), "code") == -1200;

      }
    }
    else
    {
      v1 = 1;
    }

  }
  return v1;
}

- (void)setConnection:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)setRequestBodyProvider:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), 0);
}

- (void)needRequestBody
{
  void *v2;
  SEL v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  if (a1)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v2 = *(void **)(a1 + 48);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __34__NWURLLoaderHTTP_needRequestBody__block_invoke;
      v6[3] = &unk_1E14A9B70;
      v6[4] = a1;
      objc_msgSend(v2, "loaderNeedsBodyProviderFromOffset:completionHandler:", 0, v6);
    }
    else
    {
      *(_BYTE *)(a1 + 16) = 1;
      v5 = *(id *)(a1 + 136);
      objc_setProperty_nonatomic_copy((id)a1, v3, 0, 136);
      v4 = v5;
      if (v5)
      {
        (*((void (**)(id))v5 + 2))(v5);
        v4 = v5;
      }
      if (*(_BYTE *)(a1 + 9))
      {
        -[NWURLLoaderHTTP startResponseStallTimer](a1);
        v4 = v5;
      }

    }
  }
}

void __34__NWURLLoaderHTTP_needRequestBody__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  if (v4)
  {
    if (v5)
    {
      *(_BYTE *)(v5 + 16) = 0;
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
      {
        objc_storeStrong((id *)(v6 + 64), a2);
        v5 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v5 = 0;
      }
    }
    -[NWURLLoaderHTTP writeRequestBody](v5);
  }
  else
  {
    if (!v5 || !*(_QWORD *)(v5 + 88))
    {
      -[NWURLLoaderHTTP errorForErrorCode:]((id *)v5, -1021);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLLoaderHTTP setPendingError:](*(_QWORD *)(a1 + 32), v7);

      v5 = *(_QWORD *)(a1 + 32);
    }
    -[NWURLLoaderHTTP cancelConnection](v5);
  }

}

- (void)writeRequestBody
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  if (a1)
  {
    v2 = *(id *)(a1 + 64);
    v3 = *(void **)(a1 + 64);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __35__NWURLLoaderHTTP_writeRequestBody__block_invoke;
    v5[3] = &unk_1E14A9BE8;
    v6 = v2;
    v7 = a1;
    v4 = v2;
    objc_msgSend(v3, "readMinimumIncompleteLength:maximumLength:completionHandler:", 1, 0x20000, v5);

  }
}

void __35__NWURLLoaderHTTP_writeRequestBody__block_invoke(uint64_t a1, void *a2, _BOOL4 a3, void *a4)
{
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  int v26;
  size_t size;
  _QWORD *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  NSObject *v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  _QWORD v39[2];
  int v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _QWORD *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  size_t v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = v8;
  v11 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD **)(a1 + 40);
  if (v10)
  {
    if (v11 != v10[8])
      goto LABEL_10;
  }
  else if (v11)
  {
    goto LABEL_10;
  }
  if (gLogDatapath)
  {
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v19 = (id)gurlLogObj;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(_QWORD *)(a1 + 40);
      if (v20 && (v21 = *(id *)(v20 + 48)) != 0)
      {
        v22 = v21;
        objc_msgSend(v21, "logDescription");
      }
      else
      {
        v22 = 0;
        v39[0] = 0;
        v39[1] = 0;
        v40 = 0;
      }
      v23 = *(_QWORD *)(a1 + 40);
      if (v23 && (v24 = *(id *)(v23 + 48)) != 0)
      {
        v25 = v24;
        objc_msgSend(v24, "logDescription");
        v26 = v38;
      }
      else
      {
        v26 = 0;
        v25 = 0;
        v36 = 0;
        v37 = 0;
        v38 = 0;
      }
      if (v7)
        size = dispatch_data_get_size(v7);
      else
        size = 0;
      *(_DWORD *)buf = 136447746;
      v42 = "-[NWURLLoaderHTTP writeRequestBody]_block_invoke";
      v43 = 1042;
      v44 = 16;
      v45 = 2098;
      v46 = v39;
      v47 = 1024;
      v48 = v26;
      v49 = 2048;
      v50 = size;
      v51 = 1024;
      v52 = a3;
      v53 = 2112;
      v54 = v9;
      _os_log_impl(&dword_182FBE000, v19, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> sending body: %zu, complete: %{BOOL}d, error: %@", buf, 0x3Cu);

    }
    v10 = *(_QWORD **)(a1 + 40);
    if (!v9)
      goto LABEL_5;
  }
  else if (!v8)
  {
LABEL_5:
    if (v10)
      v10 = (_QWORD *)v10[9];
    v12 = v10;
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
    {
      v16 = *(void **)(v14 + 72);
      v15 = *(NSObject **)(v14 + 80);
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __35__NWURLLoaderHTTP_writeRequestBody__block_invoke_54;
    v31[3] = &unk_1E14A9BC0;
    v32 = v12;
    v33 = v14;
    v35 = a3;
    v34 = v7;
    v17 = v13;
    v18 = v16;
    nw_connection_send(v18, v34, v15, a3, v31);

    goto LABEL_10;
  }
  if (v10)
    v10 = (_QWORD *)v10[3];
  v28 = v10;
  objc_msgSend(v28, "URL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFailingURL:", v29);

  v30 = *(_QWORD *)(a1 + 40);
  if (!v30 || !*(_QWORD *)(v30 + 88))
  {
    -[NWURLLoaderHTTP setPendingError:](v30, v9);
    v30 = *(_QWORD *)(a1 + 40);
  }
  -[NWURLLoaderHTTP cancelConnection](v30);
  -[NWURLLoaderHTTP finishRequest:](*(_QWORD *)(a1 + 40));
LABEL_10:

}

- (void)finishRequest:(uint64_t)a1
{
  SEL v2;
  void *v3;
  id v4;

  if (a1)
  {
    *(_BYTE *)(a1 + 16) = 1;
    v4 = *(id *)(a1 + 136);
    objc_setProperty_nonatomic_copy((id)a1, v2, 0, 136);
    v3 = v4;
    if (v4)
    {
      (*((void (**)(id))v4 + 2))(v4);
      v3 = v4;
    }

  }
}

void __35__NWURLLoaderHTTP_writeRequestBody__block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  SEL v8;
  NSObject *v9;
  size_t size;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  char v20;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v5 != *(_QWORD *)(v6 + 72))
      goto LABEL_21;
  }
  else if (v5)
  {
    goto LABEL_21;
  }
  if (!v3)
  {
    if (*(_BYTE *)(a1 + 56) && v6)
    {
      *(_BYTE *)(v6 + 16) = 1;
      v7 = (void (**)(_QWORD))*(id *)(v6 + 136);
      objc_setProperty_nonatomic_copy((id)v6, v8, 0, 136);
      if (v7)
        v7[2](v7);
      if (*(_BYTE *)(v6 + 9))
        -[NWURLLoaderHTTP startResponseStallTimer](v6);

    }
    v9 = *(NSObject **)(a1 + 48);
    if (v9)
    {
      size = dispatch_data_get_size(v9);
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
      {
LABEL_13:
        v12 = *(void **)(v11 + 64);
LABEL_14:
        v13 = objc_msgSend(v12, "countOfBytesSent");
        v14 = *(_QWORD *)(a1 + 40);
        if (v14)
        {
          v15 = *(void **)(v14 + 48);
          v16 = *(_BYTE *)(a1 + 56);
          if (v16)
            v17 = v13;
          else
            v17 = *(_QWORD *)(v14 + 32);
        }
        else
        {
          v15 = 0;
          v16 = *(_BYTE *)(a1 + 56);
          if (v16)
            v17 = v13;
          else
            v17 = 0;
        }
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __35__NWURLLoaderHTTP_writeRequestBody__block_invoke_2;
        v19[3] = &unk_1E14A9B98;
        v20 = v16;
        v19[4] = v14;
        objc_msgSend(v15, "loaderDidSendBodyData:totalBytesSent:totalBytesExpectedToSend:completionHandler:", size, v13, v17, v19);
        goto LABEL_21;
      }
    }
    else
    {
      size = 0;
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
        goto LABEL_13;
    }
    v12 = 0;
    goto LABEL_14;
  }
  if (!v6 || !*(_QWORD *)(v6 + 88))
  {
    -[NWURLLoaderHTTP errorForNWError:](*(id **)(a1 + 40), v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLLoaderHTTP setPendingError:](*(_QWORD *)(a1 + 40), v18);

    v6 = *(_QWORD *)(a1 + 40);
  }
  -[NWURLLoaderHTTP cancelConnection](v6);
  -[NWURLLoaderHTTP finishRequest:](*(_QWORD *)(a1 + 40));
LABEL_21:

}

uint64_t __35__NWURLLoaderHTTP_writeRequestBody__block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return -[NWURLLoaderHTTP writeRequestBody](*(_QWORD *)(result + 32));
  return result;
}

void __42__NWURLLoaderHTTP_startResponseStallTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  xpc_object_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *(void **)(v3 + 72);
    if (v4)
    {
      v5 = v4;
      v6 = xpc_uint64_create(3uLL);
      nw_connection_add_client_event_internal(v5, 2, v6, 0);

      v3 = *(_QWORD *)(a1 + 32);
    }
  }
  -[NWURLLoaderHTTP stopResponseStallTimer](v3, a2);
}

uint64_t __35__NWURLLoaderHTTP_reportConnected___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

void __32__NWURLLoaderHTTP_writeRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (v3)
  {
    if (!v4 || !*(_QWORD *)(v4 + 88))
    {
      -[NWURLLoaderHTTP errorForNWError:]((id *)v4, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLLoaderHTTP setPendingError:](*(_QWORD *)(a1 + 32), v5);

      v4 = *(_QWORD *)(a1 + 32);
    }
    -[NWURLLoaderHTTP cancelConnection](v4);
  }
  else
  {
    -[NWURLLoaderHTTP needRequestBody](v4);
  }

}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_38(uint64_t a1, void *a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  id *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  if (v12
    || (a3 & 1) != 0
    || (v5 = *(_QWORD *)(a1 + 32)) == 0
    || (v6 = *(_QWORD *)(v5 + 40)) == 0
    || !objc_msgSend(*(id *)(v6 + 16), "_requiresSecureHTTPSProxyConnection"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_11;
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  if (!v7)
  {
    v10 = 0;
    goto LABEL_13;
  }
  v9 = (id *)*(id *)(v7 + 40);
  v10 = v9;
  if (!v9)
  {
LABEL_13:
    v11 = 0;
    goto LABEL_9;
  }
  v11 = objc_msgSend(v9[2], "_preventsSystemHTTPProxyAuthentication");
LABEL_9:
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 16))(v8, 0, v11);

LABEL_11:
}

- (void)handleAuthenticationChallenge:(void *)a3 url:(uint64_t)a4 cancel:(void *)a5 completionHandler:
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *ns_protection_space;
  CFTypeRef v14;
  const void *v15;
  id proposed_credential;
  void *v17;
  void *ns;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  const char *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[16];

  v9 = a2;
  v10 = a3;
  v12 = a5;
  if (a1)
  {
    -[NWURLLoaderHTTP stopResponseStallTimer](a1, v11);
    ns_protection_space = (void *)nw_authentication_challenge_get_ns_protection_space(v9);
    if (ns_protection_space)
    {
      v14 = nw_authentication_challenge_copy_http_message(v9);
      if (v14)
      {
        v15 = v14;
        proposed_credential = nw_authentication_challenge_get_proposed_credential(v9);
        v17 = proposed_credential;
        if (proposed_credential)
          ns = (void *)nw_authentication_credential_create_ns(proposed_credential);
        else
          ns = 0;
        v19 = (void *)CFURLResponseCreateWithHTTPResponse();
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C48]), "initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:", ns_protection_space, ns, nw_authentication_challenge_get_attempt_count(v9), v19, 0, 0);
        CFRelease(v15);
        v21 = *(void **)(a1 + 48);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __78__NWURLLoaderHTTP_handleAuthenticationChallenge_url_cancel_completionHandler___block_invoke;
        v25[3] = &unk_1E14A9C60;
        v25[4] = a1;
        v26 = v9;
        v27 = v19;
        v28 = v12;
        v22 = v19;
        objc_msgSend(v21, "loaderDidReceiveChallenge:completionHandler:", v20, v25);

        goto LABEL_8;
      }
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v23 = (id)gurlLogObj;
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        (*((void (**)(id, _QWORD, uint64_t))v12 + 2))(v12, 0, a4);
LABEL_8:

        goto LABEL_9;
      }
      *(_WORD *)buf = 0;
      v24 = "HTTP message is NULL";
    }
    else
    {
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v23 = (id)gurlLogObj;
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      *(_WORD *)buf = 0;
      v24 = "Protection space is NULL";
    }
    _os_log_impl(&dword_182FBE000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_19;
  }
LABEL_9:

}

void __78__NWURLLoaderHTTP_handleAuthenticationChallenge_url_cancel_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  -[NWURLLoaderHTTP handleAuthenticationChallengeResponse:credential:challenge:response:completionHandler:](*(_QWORD *)(a1 + 32), a2, a3, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

- (void)handleAuthenticationChallengeResponse:(void *)a3 credential:(void *)a4 challenge:(void *)a5 response:(void *)a6 completionHandler:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *proposed_credential;
  id v17;
  void *v18;
  void *ns;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  if (a1)
  {
    switch(a2)
    {
      case 0:
        if (!v11)
          goto LABEL_13;
        proposed_credential = -[NWConcrete_nw_authentication_credential initWithType:]([NWConcrete_nw_authentication_credential alloc], 1);
        nw_authentication_credential_apply_ns(proposed_credential, v11);
        goto LABEL_6;
      case 1:
        proposed_credential = nw_authentication_challenge_get_proposed_credential(v12);
LABEL_6:
        ((void (**)(_QWORD, void *, _QWORD))v15)[2](v15, proposed_credential, 0);
        goto LABEL_7;
      case 2:
        (*((void (**)(id, _QWORD, uint64_t))v14 + 2))(v14, 0, 1);
        break;
      case 3:
        if (nw_authentication_challenge_try_next_protection_space(v12))
        {
          proposed_credential = (void *)nw_authentication_challenge_get_ns_protection_space(v12);
          if (proposed_credential)
          {
            v17 = nw_authentication_challenge_get_proposed_credential(v12);
            v18 = v17;
            if (v17)
              ns = (void *)nw_authentication_credential_create_ns(v17);
            else
              ns = 0;
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C48]), "initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:", proposed_credential, ns, nw_authentication_challenge_get_attempt_count(v12), v13, 0, 0);
            v21 = *(void **)(a1 + 48);
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __105__NWURLLoaderHTTP_handleAuthenticationChallengeResponse_credential_challenge_response_completionHandler___block_invoke;
            v22[3] = &unk_1E14A9C60;
            v22[4] = a1;
            v23 = v12;
            v24 = v13;
            v25 = v15;
            objc_msgSend(v21, "loaderDidReceiveChallenge:completionHandler:", v20, v22);

          }
          else
          {
            v15[2](v15, 0, 0);
LABEL_7:

          }
        }
        else
        {
LABEL_13:
          v15[2](v15, 0, 0);
        }
        break;
      default:
        break;
    }
  }

}

uint64_t __105__NWURLLoaderHTTP_handleAuthenticationChallengeResponse_credential_challenge_response_completionHandler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return -[NWURLLoaderHTTP handleAuthenticationChallengeResponse:credential:challenge:response:completionHandler:](a1[4], a2, a3, a1[5], a1[6], a1[7]);
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_11(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHTTPMethod:", v3);

}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "addValue:forHTTPHeaderField:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_13(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFURL *fixed;
  _BOOL8 v8;
  void *v9;
  id *metadata_for_request;
  uint64_t v11;
  id v12;

  v12 = a2;
  if (v12 && (objc_msgSend(v12, "URL"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      objc_storeStrong((id *)(v5 + 24), a2);
    objc_msgSend(v12, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    fixed = fixInvalidHTTPURL(v6);
    v8 = nw_endpoint_create_with_cfurl(fixed);

    v9 = (void *)_nw_http_request_create_from_url_request(v12);
    metadata_for_request = nw_http_create_metadata_for_request(v9);
    if (nw_http_request_has_method(v9, (uint64_t)"GET"))
    {
      v11 = *(_QWORD *)(a1 + 32);
      if (v11)
        *(_QWORD *)(v11 + 32) = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_6(int a1, nw_protocol_options_t options)
{
  nw_tcp_options_set_no_delay(options, 1);
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  nw_quic_connection_set_idle_timeout(v2, 0);
  nw_quic_connection_set_keepalive_count(v2, 5);

}

uint64_t __34__NWURLLoaderHTTP_continueLoading__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 48);
  else
    v5 = 0;
  return objc_msgSend(v5, "loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:", a3, a2, a4);
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  handler[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_4;
  handler[3] = &unk_1E14A98A8;
  v9 = v8;
  v14 = v9;
  sec_protocol_metadata_access_distinguished_names(v7, handler);

  v10 = *(_QWORD **)(a1 + 32);
  if (v10)
    v10 = (_QWORD *)v10[6];
  v11 = v10;
  v12 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v11, "loaderDidReceiveClientCertificateChallenge:completionHandler:", v12, v6);

}

uint64_t __34__NWURLLoaderHTTP_continueLoading__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)initWithRequest:(void *)a3 bodyKnownSize:(void *)a4 configuration:(void *)a5 queue:(void *)a6 client:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  id *v17;
  void *v18;
  NWURLLoaderCache *v19;
  id v20;
  NWURLLoaderCache *v21;
  OS_dispatch_data *dataToCache;
  id v23;
  objc_super v25;
  objc_super v26;

  v12 = a2;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)NWURLLoaderHTTP;
    v16 = (id *)objc_msgSendSuper2(&v25, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 3, a2);
      a1[4] = a3;
      objc_storeStrong(a1 + 5, a4);
      objc_storeStrong(a1 + 6, a6);
      objc_storeStrong(a1 + 7, a5);
      v17 = (id *)a1[5];
      if (v17)
      {
        objc_msgSend(v17[2], "URLCache");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      v19 = [NWURLLoaderCache alloc];
      v20 = v18;
      if (v19)
      {
        v26.receiver = v19;
        v26.super_class = (Class)NWURLLoaderCache;
        v21 = (NWURLLoaderCache *)objc_msgSendSuper2(&v26, sel_init);
        v19 = v21;
        if (v21)
        {
          objc_storeStrong((id *)&v21->_cache, v18);
          dataToCache = v19->_dataToCache;
          v19->_cacheStoragePolicy = 0;
          v19->_dataToCache = 0;

        }
      }

      v23 = a1[12];
      a1[12] = v19;

    }
  }

  return a1;
}

@end
