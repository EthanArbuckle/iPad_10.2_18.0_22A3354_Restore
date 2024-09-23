@implementation NEHotspotConfigurationHelper

- (NEHotspotConfigurationHelper)init
{
  NEHotspotConfigurationHelper *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NEHotspotConfigurationHelper;
  v2 = -[NEHotspotConfigurationHelper init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("NEHotspotConfigurationHelper queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

+ (id)sharedManager
{
  objc_opt_self();
  if (sharedManager_init_manager_6715 != -1)
    dispatch_once(&sharedManager_init_manager_6715, &__block_literal_global_6716);
  return (id)sharedManager_g_manager_6717;
}

void __45__NEHotspotConfigurationHelper_sharedManager__block_invoke()
{
  NEHotspotConfigurationHelper *v0;
  void *v1;

  v0 = objc_alloc_init(NEHotspotConfigurationHelper);
  v1 = (void *)sharedManager_g_manager_6717;
  sharedManager_g_manager_6717 = (uint64_t)v0;

}

- (id)helper
{
  _QWORD *v1;
  void *v2;
  NEHelper *v3;
  void *v4;
  id v5;

  v1 = a1;
  objc_sync_enter(v1);
  v2 = (void *)v1[1];
  if (!v2)
  {
    v3 = -[NEHelper initWithDelegateClassID:queue:]([NEHelper alloc], "initWithDelegateClassID:queue:", 9, v1[2]);
    v4 = (void *)v1[1];
    v1[1] = v3;

    v2 = (void *)v1[1];
  }
  v5 = v2;
  objc_sync_exit(v1);

  return v5;
}

- (void)sendRequest:(uint64_t)a3 requestType:(void *)a4 resultHandler:
{
  id v7;
  id v8;
  xpc_object_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v7 = a4;
  v8 = a2;
  v9 = xpc_dictionary_create(0, 0, 0);
  v10 = v9;
  if (a3 == 2)
  {
    xpc_dictionary_set_uint64(v9, "MessageType", 0x3EBuLL);
  }
  else if (a3 == 1)
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v8;
        xpc_dictionary_set_uint64(v10, "MessageType", 0x3EAuLL);
        v13 = objc_retainAutorelease(v12);
        v14 = (const char *)objc_msgSend(v13, "cStringUsingEncoding:", 4);

        xpc_dictionary_set_string(v10, "NetworkToRemove", v14);
      }
    }
  }
  else
  {
    if (a3 || !v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v10 = 0;
      goto LABEL_16;
    }
    xpc_dictionary_set_uint64(v10, "MessageType", 0x3E9uLL);
    v11 = objc_retainAutorelease(v8);
    xpc_dictionary_set_data(v10, "AddParameter", (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
  }

  if (v10)
  {
    if (v7)
    {
      xpc_dictionary_set_BOOL(v10, "IsResponseExpected", 1);
      -[NEHotspotConfigurationHelper helper](a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __70__NEHotspotConfigurationHelper_sendRequest_requestType_resultHandler___block_invoke;
      v17[3] = &unk_1E3CC08A0;
      v17[4] = a1;
      v18 = v7;
      objc_msgSend(v15, "sendRequest:responseHandler:", v10, v17);

    }
    else
    {
      xpc_dictionary_set_BOOL(v10, "IsResponseExpected", 0);
      -[NEHotspotConfigurationHelper helper](a1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendRequest:responseHandler:", v10, 0);

    }
  }
LABEL_16:

}

void __70__NEHotspotConfigurationHelper_sendRequest_requestType_resultHandler___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t uint64;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (a3 == (void *)107)
  {
LABEL_19:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_20;
  }
  if (v7 && MEMORY[0x1A1ACFDA4](v7) == MEMORY[0x1E0C812F8])
  {
    uint64 = xpc_dictionary_get_uint64(v8, "MessageType");
    if (uint64 == 1005)
    {
      xpc_dictionary_get_value(v8, "QueryResult");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if (*(_QWORD *)(a1 + 32))
        {
          v11 = (void *)_CFXPCCreateCFObjectFromXPCObject();
          if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v12 = v11;
          }
          else
          {
            ne_log_obj();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              v21 = 138412290;
              v22 = (id)objc_opt_class();
              v20 = v22;
              _os_log_debug_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEBUG, "%@ received an invalid response to query.", (uint8_t *)&v21, 0xCu);

            }
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }
        (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3);

      }
      else
      {
        ne_log_obj();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v21 = 134217984;
          v22 = a3;
          _os_log_debug_impl(&dword_19BD16000, v18, OS_LOG_TYPE_DEBUG, "query request received nil response with result code = %lld", (uint8_t *)&v21, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

      if ((a2 & 1) == 0)
        goto LABEL_16;
      goto LABEL_20;
    }
    if (uint64 == 1004)
    {
      (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3);
    }
    else
    {
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v21 = 138412290;
        v22 = (id)objc_opt_class();
        v19 = v22;
        _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "%@ received unknown response.", (uint8_t *)&v21, 0xCu);

      }
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 108);
    }
  }
  if ((a2 & 1) == 0)
  {
LABEL_16:
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_opt_class();
      v21 = 138412290;
      v22 = v16;
      v17 = v16;
      _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "%@ failed to communicate to helper server.", (uint8_t *)&v21, 0xCu);

    }
    goto LABEL_19;
  }
LABEL_20:

}

@end
