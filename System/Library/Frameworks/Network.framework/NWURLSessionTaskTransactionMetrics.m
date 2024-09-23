@implementation NWURLSessionTaskTransactionMetrics

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionTaskTransactionMetrics;
  if (-[NWURLSessionTaskTransactionMetrics isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (NSURLRequest)request
{
  NWURLSessionTaskTransactionMetrics *v2;
  id outbound_message;
  void *v4;
  char *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  BOOL is_equal;
  uint64_t isa;
  void *v11;
  id v12;
  _BOOL8 v13;
  id v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  id v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  char *backtrace_string;
  os_log_type_t v23;
  _BOOL4 v24;
  char *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  os_log_type_t v28;
  os_log_type_t v29;
  _QWORD v31[5];
  char v32;
  os_log_type_t type;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v2 = self;
  v38 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  outbound_message = nw_http_transaction_metadata_get_outbound_message(self);
  v4 = outbound_message;
  if (outbound_message)
  {
    if (nw_http_metadata_copy_request(outbound_message))
    {
      v5 = (char *)&loc_1836279AC + *((int *)qword_183628038 + nw_http_metadata_get_version(v4));
      __asm { BR              X11 }
    }
    goto LABEL_54;
  }
  if (!v2 || (v6 = v2->_clientMetadata) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_initial_request";
    v15 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v32 = 0;
    if (__nwlog_fault(v15, &type, &v32))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (id)gLogObj;
        v17 = type;
        if (os_log_type_enabled(v16, type))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s called with null metadata", buf, 0xCu);
        }
      }
      else if (v32)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (id)gLogObj;
        v23 = type;
        v24 = os_log_type_enabled(v16, type);
        if (backtrace_string)
        {
          if (v24)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_initial_request";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v16, v23, "%{public}s called with null metadata, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_45;
        }
        if (v24)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_182FBE000, v16, v23, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (id)gLogObj;
        v28 = type;
        if (os_log_type_enabled(v16, type))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_182FBE000, v16, v28, "%{public}s called with null metadata, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_45:
    if (v15)
      free(v15);
    v7 = 0;
    goto LABEL_53;
  }
  v7 = v6;
  v8 = nw_protocol_metadata_copy_definition(v6);
  if (nw_protocol_copy_http_client_definition_onceToken != -1)
    dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_52_74156);
  is_equal = nw_protocol_definition_is_equal(v8, (nw_protocol_definition_t)nw_protocol_copy_http_client_definition_definition);

  if (!is_equal)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v18 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_initial_request";
    v19 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v32 = 0;
    if (__nwlog_fault(v19, &type, &v32))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_182FBE000, v20, v21, "%{public}s metadata must be http_client", buf, 0xCu);
        }
      }
      else if (v32)
      {
        v25 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        v26 = type;
        v27 = os_log_type_enabled(v20, type);
        if (v25)
        {
          if (v27)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_initial_request";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v25;
            _os_log_impl(&dword_182FBE000, v20, v26, "%{public}s metadata must be http_client, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v25);
          goto LABEL_51;
        }
        if (v27)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_182FBE000, v20, v26, "%{public}s metadata must be http_client, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        v29 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_182FBE000, v20, v29, "%{public}s metadata must be http_client, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_51:
    if (v19)
      free(v19);
LABEL_53:

LABEL_54:
    v13 = 0;
    goto LABEL_55;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy__4;
  v36 = __Block_byref_object_dispose__5;
  v37 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __nw_http_client_metadata_get_initial_request_block_invoke;
  v31[3] = &unk_1E14A9D68;
  v31[4] = buf;
  isa = (uint64_t)v7[4].isa;
  if (isa)
  {
    __nw_http_client_metadata_get_initial_request_block_invoke((uint64_t)v31, isa);
    v11 = *(void **)(*(_QWORD *)&buf[8] + 40);
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;
  _Block_object_dispose(buf, 8);

  if (!v12)
    goto LABEL_54;
  v13 = nw_http_request_copy_url_request(v12, (void *)*MEMORY[0x1E0C930E8], 0);

LABEL_55:
  return (NSURLRequest *)(id)v13;
}

- (NSURLResponse)response
{
  OS_nw_protocol_metadata *v3;
  OS_nw_protocol_metadata *v4;
  NSObject *v5;
  BOOL is_equal;
  uint64_t v7;
  void *v8;
  id outbound_message;
  OS_nw_protocol_metadata *transactionMetadata;
  id inbound_message;
  void *v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  int v17;
  int version;
  void *v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  char *backtrace_string;
  os_log_type_t v25;
  _BOOL4 v26;
  os_log_type_t v27;
  void *v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  char *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  os_log_type_t v35;
  _QWORD v36[5];
  char v37;
  os_log_type_t type;
  _BYTE buf[24];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v3 = self->_transactionMetadata;
    if (v3)
    {
      v4 = v3;
      v5 = nw_protocol_metadata_copy_definition((nw_protocol_metadata_t)v3);
      if (nw_protocol_copy_http_transaction_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_transaction_definition_onceToken, &__block_literal_global_59_74256);
      is_equal = nw_protocol_definition_is_equal(v5, (nw_protocol_definition_t)nw_protocol_copy_http_transaction_definition_definition);

      if (is_equal)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v40 = 0;
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __nw_http_transaction_metadata_get_converted_url_response_block_invoke;
        v36[3] = &unk_1E14A9D68;
        v36[4] = buf;
        v7 = *((_QWORD *)v4 + 4);
        if (v7)
        {
          __nw_http_transaction_metadata_get_converted_url_response_block_invoke((uint64_t)v36, v7);
          v8 = *(void **)(*(_QWORD *)&buf[8] + 24);
        }
        else
        {
          v8 = 0;
        }
        _Block_object_dispose(buf, 8);

        if (v8)
          return (NSURLResponse *)v8;
        goto LABEL_10;
      }
      __nwlog_obj();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
      v21 = (char *)_os_log_send_and_compose_impl();

      type = OS_LOG_TYPE_ERROR;
      v37 = 0;
      if (!__nwlog_fault(v21, &type, &v37))
        goto LABEL_42;
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
          _os_log_impl(&dword_182FBE000, v22, v23, "%{public}s metadata must be http_transaction", buf, 0xCu);
        }
      }
      else if (v37)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        v25 = type;
        v26 = os_log_type_enabled(v22, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v22, v25, "%{public}s metadata must be http_transaction, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_42;
        }
        if (v26)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
          _os_log_impl(&dword_182FBE000, v22, v25, "%{public}s metadata must be http_transaction, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        v27 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
          _os_log_impl(&dword_182FBE000, v22, v27, "%{public}s metadata must be http_transaction, backtrace limit exceeded", buf, 0xCu);
        }
      }

LABEL_42:
      if (v21)
        free(v21);

LABEL_10:
      outbound_message = nw_http_transaction_metadata_get_outbound_message(self->_transactionMetadata);
      transactionMetadata = self->_transactionMetadata;
      goto LABEL_11;
    }
  }
  __nwlog_obj();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  *(_QWORD *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
  v29 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v37 = 0;
  if (__nwlog_fault(v29, &type, &v37))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
        _os_log_impl(&dword_182FBE000, v30, v31, "%{public}s called with null metadata", buf, 0xCu);
      }
LABEL_60:

      goto LABEL_61;
    }
    if (!v37)
    {
      __nwlog_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      v35 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
        _os_log_impl(&dword_182FBE000, v30, v35, "%{public}s called with null metadata, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_60;
    }
    v32 = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v30 = objc_claimAutoreleasedReturnValue();
    v33 = type;
    v34 = os_log_type_enabled(v30, type);
    if (!v32)
    {
      if (v34)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
        _os_log_impl(&dword_182FBE000, v30, v33, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
      }
      goto LABEL_60;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v32;
      _os_log_impl(&dword_182FBE000, v30, v33, "%{public}s called with null metadata, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(v32);
  }
LABEL_61:
  if (v29)
    free(v29);
  if (self)
    goto LABEL_10;
  outbound_message = nw_http_transaction_metadata_get_outbound_message(0);
  transactionMetadata = 0;
LABEL_11:
  inbound_message = nw_http_transaction_metadata_get_inbound_message(transactionMetadata);
  v12 = inbound_message;
  if (!outbound_message || !inbound_message)
  {

LABEL_24:
    v8 = 0;
    return (NSURLResponse *)v8;
  }
  v13 = nw_http_metadata_copy_request(outbound_message);
  v14 = nw_http_metadata_copy_response(v12);
  v15 = v14;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 1;
  v17 = !v16;
  if (v16)
  {
    v8 = 0;
  }
  else
  {
    version = nw_http_metadata_get_version(v12);
    v8 = (void *)nw_http_response_copy_url_response(v15, v13, 0, **((void ***)&unk_1E14AD2C8 + version));
  }

  if (!v17)
    goto LABEL_24;
  return (NSURLResponse *)v8;
}

- (NSDate)fetchStartDate
{
  NWURLSessionTaskTransactionMetrics *v2;
  void *start_time;
  uint64_t v4;
  OS_nw_protocol_metadata *clientMetadata;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  start_time = (void *)nw_http_transaction_metadata_get_start_time(self);
  if (start_time)
  {
    v4 = (uint64_t)start_time;
    if (v2)
      clientMetadata = v2->_clientMetadata;
    else
      clientMetadata = 0;
    start_time = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }
  return (NSDate *)start_time;
}

- (NSDate)domainLookupStartDate
{
  NWURLSessionTaskTransactionMetrics *v2;
  void *start_time;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid))
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time)
      start_time = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)+ (double)v2->connectionTiming.domainLookupStartMS * 0.001);
  }
  else
  {
    start_time = 0;
  }
  return (NSDate *)start_time;
}

- (NSDate)domainLookupEndDate
{
  NWURLSessionTaskTransactionMetrics *v2;
  void *start_time;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid))
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time)
      start_time = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)+ (double)(v2->connectionTiming.domainLookupDurationMS+ v2->connectionTiming.domainLookupStartMS)* 0.001);
  }
  else
  {
    start_time = 0;
  }
  return (NSDate *)start_time;
}

- (NSDate)connectStartDate
{
  NWURLSessionTaskTransactionMetrics *v2;
  void *start_time;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid))
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time)
      start_time = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)+ (double)v2->connectionTiming.connectStartTimeMS * 0.001);
  }
  else
  {
    start_time = 0;
  }
  return (NSDate *)start_time;
}

- (NSDate)secureConnectionStartDate
{
  NWURLSessionTaskTransactionMetrics *v2;
  void *start_time;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid)
    && v2->connectionTiming.secure)
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time)
      start_time = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)+ (double)(v2->connectionTiming.connectDurationMS+ v2->connectionTiming.connectStartTimeMS- v2->connectionTiming.secureConnectionDurationMS)* 0.001);
  }
  else
  {
    start_time = 0;
  }
  return (NSDate *)start_time;
}

- (NSDate)secureConnectionEndDate
{
  NWURLSessionTaskTransactionMetrics *v2;
  void *start_time;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid)
    && v2->connectionTiming.secure)
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time)
      start_time = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)+ (double)(v2->connectionTiming.connectDurationMS + v2->connectionTiming.connectStartTimeMS)* 0.001);
  }
  else
  {
    start_time = 0;
  }
  return (NSDate *)start_time;
}

- (NSDate)connectEndDate
{
  NWURLSessionTaskTransactionMetrics *v2;
  void *start_time;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid))
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time)
      start_time = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)+ (double)(v2->connectionTiming.connectDurationMS + v2->connectionTiming.connectStartTimeMS)* 0.001);
  }
  else
  {
    start_time = 0;
  }
  return (NSDate *)start_time;
}

- (NSDate)requestStartDate
{
  NWURLSessionTaskTransactionMetrics *v2;
  void *outbound_message_start_time;
  uint64_t v4;
  OS_nw_protocol_metadata *clientMetadata;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  outbound_message_start_time = (void *)nw_http_transaction_metadata_get_outbound_message_start_time(self);
  if (outbound_message_start_time)
  {
    v4 = (uint64_t)outbound_message_start_time;
    if (v2)
      clientMetadata = v2->_clientMetadata;
    else
      clientMetadata = 0;
    outbound_message_start_time = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }
  return (NSDate *)outbound_message_start_time;
}

- (NSDate)requestEndDate
{
  NWURLSessionTaskTransactionMetrics *v2;
  void *outbound_message_end_time;
  uint64_t v4;
  OS_nw_protocol_metadata *clientMetadata;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  outbound_message_end_time = (void *)nw_http_transaction_metadata_get_outbound_message_end_time(self);
  if (outbound_message_end_time)
  {
    v4 = (uint64_t)outbound_message_end_time;
    if (v2)
      clientMetadata = v2->_clientMetadata;
    else
      clientMetadata = 0;
    outbound_message_end_time = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }
  return (NSDate *)outbound_message_end_time;
}

- (NSDate)responseStartDate
{
  NWURLSessionTaskTransactionMetrics *v2;
  void *inbound_message_start_time;
  uint64_t v4;
  OS_nw_protocol_metadata *clientMetadata;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  inbound_message_start_time = (void *)nw_http_transaction_metadata_get_inbound_message_start_time(self);
  if (inbound_message_start_time)
  {
    v4 = (uint64_t)inbound_message_start_time;
    if (v2)
      clientMetadata = v2->_clientMetadata;
    else
      clientMetadata = 0;
    inbound_message_start_time = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }
  return (NSDate *)inbound_message_start_time;
}

- (NSDate)responseEndDate
{
  NWURLSessionTaskTransactionMetrics *v2;
  void *inbound_message_end_time;
  uint64_t v4;
  OS_nw_protocol_metadata *clientMetadata;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  inbound_message_end_time = (void *)nw_http_transaction_metadata_get_inbound_message_end_time(self);
  if (inbound_message_end_time)
  {
    v4 = (uint64_t)inbound_message_end_time;
    if (v2)
      clientMetadata = v2->_clientMetadata;
    else
      clientMetadata = 0;
    inbound_message_end_time = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }
  return (NSDate *)inbound_message_end_time;
}

- (NSString)networkProtocolName
{
  NWURLSessionTaskTransactionMetrics *v2;
  id connection_metadata;
  void *v4;
  NSObject *sec_metadata;
  OS_nw_protocol_metadata *clientMetadata;
  const char *negotiated_protocol;
  __CFString *v8;
  __CFString *v9;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v4 = connection_metadata;
  if (connection_metadata
    && (sec_metadata = nw_http_connection_metadata_get_sec_metadata(connection_metadata)) != 0
    || (!v2 ? (clientMetadata = 0) : (clientMetadata = v2->_clientMetadata),
        (sec_metadata = nw_http_client_metadata_get_sec_metadata(clientMetadata)) != 0))
  {
    negotiated_protocol = sec_protocol_metadata_get_negotiated_protocol(sec_metadata);
    if (negotiated_protocol)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", negotiated_protocol);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {

      v8 = CFSTR("http/1.1");
    }
  }
  else
  {
    v9 = CFSTR("http/1.1");
    if (!v4)
      v9 = 0;
    v8 = v9;
  }

  return (NSString *)v8;
}

- (BOOL)isProxyConnection
{
  id connection_metadata;
  void *v3;
  id establishment_report;
  unsigned __int8 *v5;
  _BOOL4 v6;

  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata
    && (establishment_report = nw_http_connection_metadata_get_establishment_report(connection_metadata)) != 0)
  {
    v5 = (unsigned __int8 *)establishment_report;
    v6 = (v5[84] >> 1) & 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isReusedConnection
{
  NWURLSessionTaskTransactionMetrics *v2;
  id connection_metadata;
  OS_nw_protocol_metadata *transactionMetadata;
  _BOOL4 v5;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  if (connection_metadata)
  {
    if (v2)
      transactionMetadata = v2->_transactionMetadata;
    else
      transactionMetadata = 0;
    v5 = !nw_http_transaction_metadata_is_first_on_connection(transactionMetadata);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (int64_t)resourceFetchType
{
  return 1;
}

- (int64_t)countOfRequestHeaderBytesSent
{
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  return nw_http_transaction_metadata_get_outbound_header_size(self);
}

- (int64_t)countOfRequestBodyBytesSent
{
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  return nw_http_transaction_metadata_get_outbound_body_transfer_size(self);
}

- (int64_t)countOfRequestBodyBytesBeforeEncoding
{
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  return nw_http_transaction_metadata_get_outbound_body_size(self);
}

- (int64_t)countOfResponseHeaderBytesReceived
{
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  return nw_http_transaction_metadata_get_inbound_header_size(self);
}

- (int64_t)countOfResponseBodyBytesReceived
{
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  return nw_http_transaction_metadata_get_inbound_body_transfer_size(self);
}

- (int64_t)countOfResponseBodyBytesAfterDecoding
{
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  return nw_http_transaction_metadata_get_inbound_body_size(self);
}

- (NSString)localAddress
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  -[NWURLSessionTaskTransactionMetrics localEndpoint]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = v2, v5 = objc_msgSend(v4, "type"), v4, v5 == 1))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v4;
    v8 = objc_msgSend(v7, "hostname");

    objc_msgSend(v6, "stringWithUTF8String:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return (NSString *)v9;
}

- (NSNumber)localPort
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  -[NWURLSessionTaskTransactionMetrics localEndpoint]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = v2, v5 = objc_msgSend(v4, "type"), v4, v5 == 1))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v4;
    v8 = __rev16(objc_msgSend(v7, "port"));

    objc_msgSend(v6, "numberWithUnsignedShort:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return (NSNumber *)v9;
}

- (NSString)remoteAddress
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  -[NWURLSessionTaskTransactionMetrics remoteEndpoint]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = v2, v5 = objc_msgSend(v4, "type"), v4, v5 == 1))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v4;
    v8 = objc_msgSend(v7, "hostname");

    objc_msgSend(v6, "stringWithUTF8String:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return (NSString *)v9;
}

- (NSNumber)remotePort
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  -[NWURLSessionTaskTransactionMetrics remoteEndpoint]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = v2, v5 = objc_msgSend(v4, "type"), v4, v5 == 1))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v4;
    v8 = __rev16(objc_msgSend(v7, "port"));

    objc_msgSend(v6, "numberWithUnsignedShort:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return (NSNumber *)v9;
}

- (NSNumber)negotiatedTLSProtocolVersion
{
  NWURLSessionTaskTransactionMetrics *v2;
  id connection_metadata;
  void *v4;
  NSObject *sec_metadata;
  OS_nw_protocol_metadata *clientMetadata;
  void *v7;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v4 = connection_metadata;
  if (connection_metadata
    && (sec_metadata = nw_http_connection_metadata_get_sec_metadata(connection_metadata)) != 0
    || (!v2 ? (clientMetadata = 0) : (clientMetadata = v2->_clientMetadata),
        (sec_metadata = nw_http_client_metadata_get_sec_metadata(clientMetadata)) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_metadata));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (NSNumber *)v7;
}

- (NSNumber)negotiatedTLSCipherSuite
{
  NWURLSessionTaskTransactionMetrics *v2;
  id connection_metadata;
  void *v4;
  NSObject *sec_metadata;
  OS_nw_protocol_metadata *clientMetadata;
  void *v7;

  v2 = self;
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v4 = connection_metadata;
  if (connection_metadata
    && (sec_metadata = nw_http_connection_metadata_get_sec_metadata(connection_metadata)) != 0
    || (!v2 ? (clientMetadata = 0) : (clientMetadata = v2->_clientMetadata),
        (sec_metadata = nw_http_client_metadata_get_sec_metadata(clientMetadata)) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", sec_protocol_metadata_get_negotiated_tls_ciphersuite(sec_metadata));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (NSNumber *)v7;
}

- (BOOL)isCellular
{
  id connection_metadata;
  void *v3;
  NSObject *path;
  NSObject *v5;
  BOOL v6;

  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata && (path = nw_http_connection_metadata_get_path(connection_metadata)) != 0)
  {
    v5 = path;
    v6 = nw_path_uses_interface_type(path, nw_interface_type_cellular);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isExpensive
{
  id connection_metadata;
  void *v3;
  NSObject *path;
  NSObject *v5;
  BOOL is_expensive;

  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata && (path = nw_http_connection_metadata_get_path(connection_metadata)) != 0)
  {
    v5 = path;
    is_expensive = nw_path_is_expensive(path);

  }
  else
  {
    is_expensive = 0;
  }

  return is_expensive;
}

- (BOOL)isConstrained
{
  id connection_metadata;
  void *v3;
  NSObject *path;
  NSObject *v5;
  BOOL is_constrained;

  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata && (path = nw_http_connection_metadata_get_path(connection_metadata)) != 0)
  {
    v5 = path;
    is_constrained = nw_path_is_constrained(path);

  }
  else
  {
    is_constrained = 0;
  }

  return is_constrained;
}

- (BOOL)isMultipath
{
  id connection_metadata;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  BOOL is_equal;
  uint64_t isa;
  BOOL v8;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  char *backtrace_string;
  os_log_type_t v15;
  _BOOL4 v16;
  os_log_type_t v17;
  os_log_type_t type[8];
  os_log_type_t *v19;
  uint64_t v20;
  char v21;
  char v22;
  _BYTE buf[24];
  void *v24;
  os_log_type_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata)
  {
    v4 = connection_metadata;
    v5 = nw_protocol_metadata_copy_definition(v4);
    if (nw_protocol_copy_http_connection_definition_onceToken != -1)
      dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
    is_equal = nw_protocol_definition_is_equal(v5, (nw_protocol_definition_t)nw_protocol_copy_http_connection_definition_definition);

    if (is_equal)
    {
      *(_QWORD *)type = 0;
      v19 = type;
      v20 = 0x2020000000;
      v21 = 0;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __nw_http_connection_metadata_is_multipath_block_invoke;
      v24 = &unk_1E14A9D68;
      v25 = type;
      isa = (uint64_t)v4[4].isa;
      if (isa)
      {
        __nw_http_connection_metadata_is_multipath_block_invoke((uint64_t)buf, isa);
        v8 = *((_BYTE *)v19 + 24) != 0;
      }
      else
      {
        v8 = 0;
      }
      _Block_object_dispose(type, 8);
LABEL_12:

      goto LABEL_13;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_http_connection_metadata_is_multipath";
    v11 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v22 = 0;
    if (__nwlog_fault(v11, type, &v22))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        v13 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_is_multipath";
          _os_log_impl(&dword_182FBE000, v12, v13, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
      }
      else if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        v15 = type[0];
        v16 = os_log_type_enabled(v12, type[0]);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "nw_http_connection_metadata_is_multipath";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v12, v15, "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_30;
        }
        if (v16)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_is_multipath";
          _os_log_impl(&dword_182FBE000, v12, v15, "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        v17 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_is_multipath";
          _os_log_impl(&dword_182FBE000, v12, v17, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_30:
    if (v11)
      free(v11);
    v8 = 0;
    goto LABEL_12;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (int64_t)domainResolutionProtocol
{
  id connection_metadata;
  void *v3;
  NSObject *establishment_report;
  NSObject *v5;
  int64_t v6;
  _QWORD enumerate_block[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata
    && (establishment_report = nw_http_connection_metadata_get_establishment_report(connection_metadata)) != 0)
  {
    v5 = establishment_report;
    v9 = 0;
    v10 = &v9;
    v12 = 0;
    v11 = 0x2020000000;
    enumerate_block[0] = MEMORY[0x1E0C809B0];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __62__NWURLSessionTaskTransactionMetrics_domainResolutionProtocol__block_invoke;
    enumerate_block[3] = &unk_1E149EDB0;
    enumerate_block[4] = &v9;
    nw_establishment_report_enumerate_resolution_reports(establishment_report, enumerate_block);
    v6 = *((unsigned int *)v10 + 6);
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSUUID)_connectionIdentifier
{
  id connection_metadata;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata)
  {
    v6[0] = 0;
    v6[1] = 0;
    nw_http_connection_metadata_get_uuid(connection_metadata, (uint64_t)v6);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v6);
  }
  else
  {
    v4 = 0;
  }

  return (NSUUID *)v4;
}

- (int)_privacyStance
{
  id connection_metadata;
  void *v3;
  int privacy_stance;

  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata)
    privacy_stance = nw_http_connection_metadata_get_privacy_stance(connection_metadata);
  else
    privacy_stance = 0;

  return privacy_stance;
}

- (BOOL)_isUnlistedTracker
{
  id connection_metadata;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  BOOL is_equal;
  uint64_t isa;
  BOOL v8;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  char *backtrace_string;
  os_log_type_t v15;
  _BOOL4 v16;
  os_log_type_t v17;
  os_log_type_t type[8];
  os_log_type_t *v19;
  uint64_t v20;
  char v21;
  char v22;
  _BYTE buf[24];
  void *v24;
  os_log_type_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata)
  {
    v4 = connection_metadata;
    v5 = nw_protocol_metadata_copy_definition(v4);
    if (nw_protocol_copy_http_connection_definition_onceToken != -1)
      dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
    is_equal = nw_protocol_definition_is_equal(v5, (nw_protocol_definition_t)nw_protocol_copy_http_connection_definition_definition);

    if (is_equal)
    {
      *(_QWORD *)type = 0;
      v19 = type;
      v20 = 0x2020000000;
      v21 = 0;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __nw_http_connection_metadata_is_unlisted_tracker_block_invoke;
      v24 = &unk_1E14A9D68;
      v25 = type;
      isa = (uint64_t)v4[4].isa;
      if (isa)
      {
        __nw_http_connection_metadata_is_unlisted_tracker_block_invoke((uint64_t)buf, isa);
        v8 = *((_BYTE *)v19 + 24) != 0;
      }
      else
      {
        v8 = 0;
      }
      _Block_object_dispose(type, 8);
LABEL_12:

      goto LABEL_13;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
    v11 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v22 = 0;
    if (__nwlog_fault(v11, type, &v22))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        v13 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
          _os_log_impl(&dword_182FBE000, v12, v13, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
      }
      else if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        v15 = type[0];
        v16 = os_log_type_enabled(v12, type[0]);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v12, v15, "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_30;
        }
        if (v16)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
          _os_log_impl(&dword_182FBE000, v12, v15, "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v12 = (id)gLogObj;
        v17 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
          _os_log_impl(&dword_182FBE000, v12, v17, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_30:
    if (v11)
      free(v11);
    v8 = 0;
    goto LABEL_12;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMetadata, 0);
  objc_storeStrong((id *)&self->_transactionMetadata, 0);
}

uint64_t __62__NWURLSessionTaskTransactionMetrics_domainResolutionProtocol__block_invoke(uint64_t a1, nw_resolution_report_t resolution_report)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = nw_resolution_report_get_protocol(resolution_report);
  return 0;
}

- (nw_endpoint_t)remoteEndpoint
{
  id connection_metadata;
  void *v2;
  NSObject *establishment_report;
  NSObject *v4;
  nw_endpoint_t v5;
  NSObject *path;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (!a1)
    return (nw_endpoint_t)0;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(*(void **)(a1 + 104));
  v2 = connection_metadata;
  if (!connection_metadata)
    goto LABEL_9;
  if (nw_http_connection_metadata_get_privacy_stance(connection_metadata) != 2)
  {
    path = nw_http_connection_metadata_get_path(v2);
    if (path)
    {
      v4 = path;
      v5 = nw_path_copy_effective_remote_endpoint(path);
      goto LABEL_8;
    }
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  establishment_report = nw_http_connection_metadata_get_establishment_report(v2);
  if (!establishment_report)
    goto LABEL_9;
  v4 = establishment_report;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__28238;
  v13 = __Block_byref_object_dispose__28239;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__NWURLSessionTaskTransactionMetrics_remoteEndpoint__block_invoke;
  v8[3] = &unk_1E149ED88;
  v8[4] = &v9;
  nw_establishment_report_enumerate_proxied_next_hop_endpoints(establishment_report, v8);
  v5 = (nw_endpoint_t)(id)v10[5];
  _Block_object_dispose(&v9, 8);

LABEL_8:
LABEL_10:

  return v5;
}

uint64_t __52__NWURLSessionTaskTransactionMetrics_remoteEndpoint__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

- (nw_endpoint_t)localEndpoint
{
  id connection_metadata;
  void *v2;
  NSObject *path;
  NSObject *v4;
  nw_endpoint_t v5;

  if (a1)
  {
    connection_metadata = nw_http_transaction_metadata_get_connection_metadata(*(void **)(a1 + 104));
    v2 = connection_metadata;
    if (connection_metadata && (path = nw_http_connection_metadata_get_path(connection_metadata)) != 0)
    {
      v4 = path;
      v5 = nw_path_copy_effective_local_endpoint(path);

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)computeConnectionTiming
{
  id connection_metadata;
  void *v3;
  NSObject *establishment_report;
  NSObject *v5;
  uint64_t attempt_started_after_milliseconds;
  uint64_t resolution_started_after_milliseconds;
  uint64_t flow_started_after_milliseconds;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 is_equal;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD enumerate_block[5];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_BYTE *)(a1 + 97))
  {
    connection_metadata = nw_http_transaction_metadata_get_connection_metadata(*(void **)(a1 + 104));
    v3 = connection_metadata;
    if (!connection_metadata)
    {
LABEL_20:

      return;
    }
    establishment_report = nw_http_connection_metadata_get_establishment_report(connection_metadata);
    v5 = establishment_report;
    if (!establishment_report)
    {
LABEL_19:

      goto LABEL_20;
    }
    attempt_started_after_milliseconds = nw_establishment_report_get_attempt_started_after_milliseconds(establishment_report);
    resolution_started_after_milliseconds = nw_establishment_report_get_resolution_started_after_milliseconds(v5);
    flow_started_after_milliseconds = nw_establishment_report_get_flow_started_after_milliseconds(v5);
    *(_QWORD *)(a1 + 56) = resolution_started_after_milliseconds + attempt_started_after_milliseconds;
    v9 = flow_started_after_milliseconds + attempt_started_after_milliseconds;
    v10 = MEMORY[0x1E0C809B0];
    *(_QWORD *)(a1 + 72) = v9;
    enumerate_block[0] = v10;
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __61__NWURLSessionTaskTransactionMetrics_computeConnectionTiming__block_invoke;
    enumerate_block[3] = &unk_1E149ED38;
    enumerate_block[4] = a1;
    nw_establishment_report_enumerate_resolution_reports(v5, enumerate_block);
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__28238;
    v29 = __Block_byref_object_dispose__28239;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __61__NWURLSessionTaskTransactionMetrics_computeConnectionTiming__block_invoke_3;
    v20[3] = &unk_1E149ED60;
    v20[4] = &v25;
    v20[5] = &v21;
    nw_establishment_report_enumerate_protocols(v5, v20);
    v11 = v26[5];
    if (v11)
    {
      v12 = nw_protocol_boringssl_copy_definition();
      if (nw_protocol_definition_is_equal(v11, v12))
      {

      }
      else
      {
        v13 = v26[5];
        if (nw_protocol_copy_quic_connection_definition::onceToken != -1)
          dispatch_once(&nw_protocol_copy_quic_connection_definition::onceToken, &__block_literal_global_54912);
        v14 = (id)nw_protocol_copy_quic_connection_definition::quic_definition;
        is_equal = nw_protocol_definition_is_equal(v13, v14);

        if (!is_equal)
          goto LABEL_12;
      }
      *(_QWORD *)(a1 + 88) = v22[3];
      *(_BYTE *)(a1 + 96) = 1;
    }
LABEL_12:
    v16 = nw_establishment_report_get_duration_milliseconds(v5) - *(_QWORD *)(a1 + 72);
    *(_QWORD *)(a1 + 80) = v16;
    if (*(_QWORD *)(a1 + 88) > v16)
    {
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v17 = (id)gurlLogObj;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = *(_QWORD *)(a1 + 80);
        v19 = *(_QWORD *)(a1 + 88);
        *(_DWORD *)buf = 134218240;
        v33 = v19;
        v34 = 2048;
        v35 = v18;
        _os_log_impl(&dword_182FBE000, v17, OS_LOG_TYPE_INFO, "TLS (%llu ms) took longer than connect (%llu ms)", buf, 0x16u);
      }

      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a1 + 80);
    }
    *(_BYTE *)(a1 + 97) = 1;
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);

    goto LABEL_19;
  }
}

uint64_t __61__NWURLSessionTaskTransactionMetrics_computeConnectionTiming__block_invoke(uint64_t a1, nw_resolution_report_t resolution_report)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) += nw_resolution_report_get_milliseconds(resolution_report);
  return 1;
}

uint64_t __61__NWURLSessionTaskTransactionMetrics_computeConnectionTiming__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

  return 1;
}

- (id)initWithTransactionMetadata:(void *)a3 clientMetadata:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)NWURLSessionTaskTransactionMetrics;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 13, a2);
      objc_storeStrong(a1 + 14, a3);
    }
  }

  return a1;
}

@end
