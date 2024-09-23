@implementation NEHelper

- (NEHelper)initWithDelegateClassID:(int)a3 queue:(id)a4 additionalProperties:(id)a5
{
  id v9;
  id v10;
  NEHelper *v11;
  NEHelper *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *connectionQueue;
  objc_super v17;

  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NEHelper;
  v11 = -[NEHelper init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("NEHelper connection queue", v13);
    connectionQueue = v12->_connectionQueue;
    v12->_connectionQueue = (OS_dispatch_queue *)v14;

    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_classID = a3;
    objc_storeStrong((id *)&v12->_additionalProperties, a5);
  }

  return v12;
}

- (NEHelper)initWithDelegateClassID:(int)a3 queue:(id)a4
{
  return -[NEHelper initWithDelegateClassID:queue:additionalProperties:](self, "initWithDelegateClassID:queue:additionalProperties:", *(_QWORD *)&a3, a4, 0);
}

- (void)dealloc
{
  OS_xpc_object *connection;
  objc_super v4;

  if (self)
  {
    connection = self->_connection;
    if (connection)
    {
      xpc_connection_cancel(connection);
      objc_storeStrong((id *)&self->_connection, 0);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NEHelper;
  -[NEHelper dealloc](&v4, sel_dealloc);
}

- (void)sendRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  OS_xpc_object *connection;
  _xpc_connection_s *v10;
  NSObject *Property;
  xpc_connection_t mach_service;
  xpc_connection_t v13;
  void (**v14)(void *, xpc_object_t);
  const char *v15;
  xpc_object_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  void *v20;
  _xpc_connection_s *v21;
  NSDictionary *additionalProperties;
  NSDictionary *v23;
  void *v24;
  OS_xpc_object *v25;
  _xpc_connection_s *v26;
  _QWORD aBlock[5];
  id v28;
  _QWORD block[4];
  id v30;
  _QWORD handler[5];
  _xpc_connection_s *v32;
  id v33;
  id location;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (self)
  {
    os_unfair_lock_assert_owner(&self->_lock);
    connection = self->_connection;
    if (connection)
    {
LABEL_3:
      v10 = connection;
      goto LABEL_8;
    }
    Property = objc_getProperty(self, v8, 48, 1);
    mach_service = xpc_connection_create_mach_service("com.apple.nehelper", Property, 2uLL);
    v13 = mach_service;
    if (mach_service && MEMORY[0x1A1ACFDA4](mach_service) == MEMORY[0x1E0C812E0])
    {
      objc_initWeak(&location, self);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __25__NEHelper_getConnection__block_invoke;
      handler[3] = &unk_1E3CC0830;
      handler[4] = self;
      objc_copyWeak(&v33, &location);
      v21 = v13;
      v32 = v21;
      xpc_connection_set_event_handler(v21, handler);
      xpc_connection_resume(v21);
      additionalProperties = self->_additionalProperties;
      if (additionalProperties)
      {
        v23 = additionalProperties;
        v24 = (void *)_CFXPCCreateXPCObjectFromCFObject();

      }
      else
      {
        v24 = xpc_dictionary_create(0, 0, 0);
      }
      xpc_dictionary_set_uint64(v24, "delegate-class-id", self->_classID);
      xpc_connection_send_message(v21, v24);
      v25 = self->_connection;
      self->_connection = v21;
      v26 = v21;

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
      connection = self->_connection;
      goto LABEL_3;
    }

  }
  v10 = 0;
LABEL_8:
  os_unfair_lock_unlock(&self->_lock);
  if (v7)
  {
    if (v10)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __40__NEHelper_sendRequest_responseHandler___block_invoke_2;
      aBlock[3] = &unk_1E3CC0858;
      aBlock[4] = self;
      v28 = v7;
      v14 = (void (**)(void *, xpc_object_t))_Block_copy(aBlock);
      if (-[NEHelper isSynchronous](self, "isSynchronous"))
      {
        v16 = xpc_connection_send_message_with_reply_sync(v10, v6);
        v14[2](v14, v16);

      }
      else
      {
        if (self)
          v19 = objc_getProperty(self, v15, 40, 1);
        else
          v19 = 0;
        xpc_connection_send_message_with_reply(v10, v6, v19, v14);
      }

      v20 = v28;
LABEL_25:

      goto LABEL_26;
    }
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(handler[0]) = 0;
      _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "Failed to send a message to nehelper: connection is nil", (uint8_t *)handler, 2u);
    }

    if (!-[NEHelper isSynchronous](self, "isSynchronous"))
    {
      if (self)
        self = (NEHelper *)objc_getProperty(self, v18, 40, 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__NEHelper_sendRequest_responseHandler___block_invoke;
      block[3] = &unk_1E3CC4720;
      v30 = v7;
      dispatch_async(&self->super, block);
      v20 = v30;
      goto LABEL_25;
    }
    (*((void (**)(id, _QWORD, uint64_t, _QWORD))v7 + 2))(v7, 0, 5, 0);
  }
  else if (v10)
  {
    xpc_connection_send_message(v10, v6);
  }
LABEL_26:

}

- (id)incomingMessageHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setIncomingMessageHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (BOOL)isSynchronous
{
  return self->_isSynchronous;
}

- (void)setIsSynchronous:(BOOL)a3
{
  self->_isSynchronous = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalProperties, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_incomingMessageHandler, 0);
}

uint64_t __40__NEHelper_sendRequest_responseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__NEHelper_sendRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && MEMORY[0x1A1ACFDA4](v3) == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_int64(v4, "result-code");
    xpc_dictionary_get_value(v4, "result-data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v5 = (void *)MEMORY[0x1A1ACFC3C](v4);
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
        LODWORD(v8) = *(_DWORD *)(v8 + 16);
      v9[0] = 67109378;
      v9[1] = v8;
      v10 = 2080;
      v11 = v5;
      _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "Failed to send a %d message to nehelper: %s", (uint8_t *)v9, 0x12u);
    }

    free(v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __25__NEHelper_getConnection__block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  id Property;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v4 = a2;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v3, 40, 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__NEHelper_getConnection__block_invoke_2;
  block[3] = &unk_1E3CC1360;
  v6 = Property;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v9 = v4;
  v10 = *(id *)(a1 + 40);
  v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
}

void __25__NEHelper_getConnection__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  NSObject *v5;
  const char *string;
  void *v7;
  char *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    if (MEMORY[0x1A1ACFDA4]() == MEMORY[0x1E0C81310])
    {
      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x1E0C81270]);
        v10 = 136315138;
        v11 = string;
        _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEFAULT, "Lost connection to nehelper: %s", (uint8_t *)&v10, 0xCu);
      }

      os_unfair_lock_lock(WeakRetained + 2);
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
      v7 = *(void **)&WeakRetained[8]._os_unfair_lock_opaque;
      *(_QWORD *)&WeakRetained[8]._os_unfair_lock_opaque = 0;

      os_unfair_lock_unlock(WeakRetained + 2);
    }
    else if (*(_QWORD *)(a1 + 32) && MEMORY[0x1A1ACFDA4]() == MEMORY[0x1E0C812F8])
    {
      -[os_unfair_lock_s incomingMessageHandler](WeakRetained, "incomingMessageHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        -[os_unfair_lock_s incomingMessageHandler](WeakRetained, "incomingMessageHandler");
        v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v4[2](v4, *(_QWORD *)(a1 + 32));

      }
      else
      {
        v8 = (char *)MEMORY[0x1A1ACFC3C](*(_QWORD *)(a1 + 32));
        ne_log_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315138;
          v11 = v8;
          _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "Got an unexpected message on the nehelper connection: %s", (uint8_t *)&v10, 0xCu);
        }

        free(v8);
      }
    }
  }

}

@end
