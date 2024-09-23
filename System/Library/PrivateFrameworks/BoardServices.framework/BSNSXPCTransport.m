@implementation BSNSXPCTransport

uint64_t __48__BSNSXPCTransport__sendMessage_asNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __38__BSNSXPCTransport_setMessageHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "createReply");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BSNSXPCReplyIsInternal"));
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("BSNSXPCMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v7, 0);
      objc_msgSend(v5, "send");
    }
    else
    {
      objc_msgSend(v5, "message");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v7, v10);

    }
  }
  else
  {
    BSServiceXPCErrorsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      objc_msgSend(v4, "message");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_error_impl(&dword_19A799000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to decode underlying message : message=%@", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (void)setTargetQueue:(id)a3
{
  id v5;
  BSXPCServiceConnection *connection;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  BSNSXPCTransport *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v15 = v8;
      v16 = 2114;
      v17 = v10;
      v18 = 2048;
      v19 = self;
      v20 = 2114;
      v21 = CFSTR("BSNSXPCTransport.m");
      v22 = 1024;
      v23 = 414;
      v24 = 2114;
      v25 = v7;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A9140);
  }
  connection = self->_connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__BSNSXPCTransport_setTargetQueue___block_invoke;
  v12[3] = &unk_1E390D1D0;
  v12[4] = self;
  v11 = v5;
  v13 = v11;
  -[BSXPCServiceConnection configure:]((uint64_t)connection, (uint64_t)v12);

}

void __35__BSNSXPCTransport_setTargetQueue___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  v4 = a2;
  -[BSXPCServiceConnectionEventHandler setTargetQueue:]((uint64_t)v4, *(void **)(a1 + 40));

}

void __38__BSNSXPCTransport_setMessageHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__BSNSXPCTransport_setMessageHandler___block_invoke_2;
  v7[3] = &unk_1E390D130;
  v4 = *(id *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  if (a2)
  {
    v5 = objc_msgSend(v7, "copy");
    v6 = *(void **)(a2 + 80);
    *(_QWORD *)(a2 + 80) = v5;

  }
}

void __36__BSNSXPCTransport_setErrorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __36__BSNSXPCTransport_setErrorHandler___block_invoke_2;
  v9[3] = &unk_1E390D180;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 56);
  v9[4] = v4;
  v9[1] = 3221225472;
  v10 = v5;
  v6 = *(id *)(a1 + 48);
  v11 = v6;
  if (a2)
  {
    v7 = objc_msgSend(v9, "copy");
    v8 = *(void **)(a2 + 88);
    *(_QWORD *)(a2 + 88) = v7;

    v6 = v11;
  }

}

- (void)sendMessage:(id)a3
{
  -[BSNSXPCTransport _sendMessage:asNotification:]((uint64_t)self, a3, 0);
}

- (void)setPerMessageAssertionAttributes:(id)a3
{
  BSXPCServiceConnection *connection;
  BSXPCServiceConnection *v5;
  int v6;
  void *v7;
  NSArray *v8;
  NSArray *perMessageAttributes;
  NSArray *v10;
  id v11;

  v11 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (objc_msgSend(v11, "count"))
  {
    connection = self->_connection;
    if (connection)
      connection = (BSXPCServiceConnection *)connection->_context;
    v5 = connection;
    v6 = -[BSXPCServiceConnection isNonLaunching](v5, "isNonLaunching");

    if (v6)
    {
      objc_msgSend(getRBSConstraintsAttributeClass(), "attributeWithConstraints:", 7);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayByAddingObject:", v7);
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      perMessageAttributes = self->_perMessageAttributes;
      self->_perMessageAttributes = v8;

    }
    else
    {
      v10 = (NSArray *)objc_msgSend(v11, "copy");
      v7 = self->_perMessageAttributes;
      self->_perMessageAttributes = v10;
    }
  }
  else
  {
    v7 = self->_perMessageAttributes;
    self->_perMessageAttributes = 0;
  }

}

- (int)processIdentifier
{
  void *v2;
  int v3;

  -[BSNSXPCTransport _auditToken]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pid");

  return v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  id v6;

  -[BSNSXPCTransport _auditToken]((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend(v4, "realToken");
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (id)_auditToken
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  if (a1)
  {
    -[BSXPCServiceConnection auditToken](*(os_unfair_lock_s **)(a1 + 8));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (v1)
    {
      v3 = v1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D016E0], "invalidToken");
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)cancel
{
  _BSNSXPCInvalidCallbackTracking *v3;
  BSXPCServiceConnection *connection;
  _BSNSXPCInvalidCallbackTracking *v5;
  _QWORD v6[4];
  _BSNSXPCInvalidCallbackTracking *v7;

  -[BSXPCServiceConnection invalidate](self->_connection, "invalidate");
  if (-[_BSNSXPCInvalidCallbackTracking isInvalidationStillPending]((os_unfair_lock_s *)self->_configured_invalidCallbackTracking))
  {
    v3 = self->_configured_invalidCallbackTracking;
    connection = self->_connection;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __26__BSNSXPCTransport_cancel__block_invoke;
    v6[3] = &unk_1E390D210;
    v5 = v3;
    v7 = v5;
    if (!-[BSXPCServiceConnection _asyncToConnectionQueueIfEverActivated:]((uint64_t)connection, (uint64_t)v6))
      -[_BSNSXPCInvalidCallbackTracking clearPendingInvalidation]((uint64_t)v5);

  }
}

void __36__BSNSXPCTransport_setErrorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v25 = a2;
  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  if ((v7 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("unexpected error domain: %@"), v12, v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544642;
      v27 = v14;
      v28 = 2114;
      v29 = v16;
      v30 = 2048;
      v31 = v17;
      v32 = 2114;
      v33 = CFSTR("BSNSXPCTransport.m");
      v34 = 1024;
      v35 = 325;
      v36 = 2114;
      v37 = v13;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7AF43CLL);
  }
  v8 = (void *)MEMORY[0x1E0C81260];
  v9 = MEMORY[0x1E0C81260];
  if (objc_msgSend(v5, "code") == 1)
  {
    if (-[_BSNSXPCInvalidCallbackTracking isInvalidationStillPending](*(os_unfair_lock_s **)(a1 + 40)))
    {
      v8 = (void *)MEMORY[0x1E0C81258];
      v10 = MEMORY[0x1E0C81258];

    }
  }
  else
  {
    if (objc_msgSend(v5, "code") != 2)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromBSServiceConnectionErrorCode(objc_msgSend(v5, "code"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("unexpected error code: %@"), v19, v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138544642;
        v27 = v21;
        v28 = 2114;
        v29 = v23;
        v30 = 2048;
        v31 = v24;
        v32 = 2114;
        v33 = CFSTR("BSNSXPCTransport.m");
        v34 = 1024;
        v35 = 332;
        v36 = 2114;
        v37 = v20;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7AF554);
    }
    -[_BSNSXPCInvalidCallbackTracking clearPendingInvalidation](*(_QWORD *)(a1 + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_sendMessage:(int)a3 asNotification:
{
  id v5;
  void *v6;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  _QWORD *v9;
  _QWORD *v10;
  char v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  _BYTE *v16;
  __CFString *v17;
  _QWORD *v18;
  _QWORD *v19;
  const char *v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  _QWORD newValue[4];
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (!v5 || MEMORY[0x19AECADB4](v5) != MEMORY[0x1E0C812F8])
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("xMessage was invalid : %@"), v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__sendMessage_asNotification_);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v28 = v22;
        v29 = 2114;
        v30 = v24;
        v31 = 2048;
        v32 = a1;
        v33 = 2114;
        v34 = CFSTR("BSNSXPCTransport.m");
        v35 = 1024;
        v36 = 196;
        v37 = 2114;
        v38 = v21;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B43F8);
    }
    xpc_dictionary_get_remote_connection(v6);
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (a3)
        xpc_connection_send_notification();
      else
        xpc_connection_send_message(v7, v6);
    }
    else
    {
      v9 = *(_QWORD **)(a1 + 8);
      if (v9)
        v9 = (_QWORD *)v9[22];
      v10 = v9;
      if (objc_msgSend(v10, "isNonLaunching"))
      {
        v11 = *(_BYTE *)(a1 + 76);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot send to non-launching services without specifying launching attributes"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__sendMessage_asNotification_);
            v13 = (id)objc_claimAutoreleasedReturnValue();
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v28 = v13;
            v29 = 2114;
            v30 = v15;
            v31 = 2048;
            v32 = a1;
            v33 = 2114;
            v34 = CFSTR("BSNSXPCTransport.m");
            v35 = 1024;
            v36 = 206;
            v37 = 2114;
            v38 = v12;
            _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A7B41D0);
        }
      }
      else
      {

      }
      -[BSXPCServiceConnection createMessageWithOptions:](*(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 76));
      v16 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "encodeXPCObject:forKey:", v6, CFSTR("BSNSXPCMessage"));
      if (a3)
        v17 = CFSTR("per-notification");
      else
        v17 = CFSTR("per-async-message");
      v18 = -[BSNSXPCTransport _newMessageSessionWithReason:]((_QWORD *)a1, v17);
      if (v18)
      {
        objc_msgSend(v16, "encodeBool:forKey:", 1, CFSTR("BSNSXPCReplyIsInternal"));
        newValue[0] = MEMORY[0x1E0C809B0];
        newValue[1] = 3221225472;
        newValue[2] = __48__BSNSXPCTransport__sendMessage_asNotification___block_invoke;
        newValue[3] = &unk_1E390D0C0;
        v19 = v18;
        v26 = v19;
        if (v16)
        {
          objc_setProperty_nonatomic_copy(v16, v20, newValue, 80);
          v19 = v26;
        }

      }
      else if (a3 && v16)
      {
        v16[61] = 1;
      }
      objc_msgSend(v16, "send");

    }
  }

}

- (id)sendMessageWithReplySync:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BSXPCServiceConnection *connection;
  BSXPCServiceConnection *v9;
  unsigned __int8 messageOptions;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  BSNSXPCTransport *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5 || MEMORY[0x19AECADB4](v5) != MEMORY[0x1E0C812F8])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("xMessage was invalid : %@"), v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v33 = v24;
      v34 = 2114;
      v35 = v26;
      v36 = 2048;
      v37 = self;
      v38 = 2114;
      v39 = CFSTR("BSNSXPCTransport.m");
      v40 = 1024;
      v41 = 348;
      v42 = 2114;
      v43 = v23;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B4814);
  }
  xpc_dictionary_get_remote_connection(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot send a reply via sendMessageWithReplySync:"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v33 = v28;
      v34 = 2114;
      v35 = v30;
      v36 = 2048;
      v37 = self;
      v38 = 2114;
      v39 = CFSTR("BSNSXPCTransport.m");
      v40 = 1024;
      v41 = 349;
      v42 = 2114;
      v43 = v27;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B4908);
  }
  connection = self->_connection;
  if (connection)
    connection = (BSXPCServiceConnection *)connection->_context;
  v9 = connection;
  if (-[BSXPCServiceConnection isNonLaunching](v9, "isNonLaunching"))
  {
    messageOptions = self->_messageOptions;

    if ((messageOptions & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot send to non-launching services without specifying launching attributes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v33 = v12;
        v34 = 2114;
        v35 = v14;
        v36 = 2048;
        v37 = self;
        v38 = 2114;
        v39 = CFSTR("BSNSXPCTransport.m");
        v40 = 1024;
        v41 = 350;
        v42 = 2114;
        v43 = v11;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B4630);
    }
  }
  else
  {

  }
  -[BSXPCServiceConnection createMessageWithOptions:]((uint64_t)self->_connection, self->_messageOptions);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeXPCObject:forKey:", v6, CFSTR("BSNSXPCMessage"));
  v16 = -[BSNSXPCTransport _newMessageSessionWithReason:](self, CFSTR("per-sync-message"));
  v31 = 0;
  objc_msgSend(v15, "sendSynchronouslyWithError:", &v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v31;
  objc_msgSend(v16, "invalidate");
  if (v17)
  {
    objc_msgSend(v17, "message");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v18)
    {
      v20 = (void *)MEMORY[0x1E0C81260];
      v21 = MEMORY[0x1E0C81260];
      goto LABEL_17;
    }
    v19 = (uint64_t)xpc_dictionary_create(0, 0, 0);
  }
  v20 = (void *)v19;
LABEL_17:

  return v20;
}

- (os_unfair_lock_s)_initWithConnection:(void *)a3 configurator:(void *)a4 assertionProvider:
{
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  id *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  int v24;
  objc_super v26;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!a1)
    goto LABEL_12;
  v26.receiver = a1;
  v26.super_class = (Class)BSNSXPCTransport;
  v11 = (id *)-[os_unfair_lock_s init](&v26, sel_init);
  a1 = (os_unfair_lock_s *)v11;
  if (!v11)
    goto LABEL_12;
  objc_storeStrong(v11 + 1, a2);
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = *(_QWORD *)&a1[2]._os_unfair_lock_opaque;
  if (!v13)
  {
    v15 = 0;
    goto LABEL_14;
  }
  v14 = *(id *)(v13 + 176);
  v15 = v14;
  if (!v14)
  {
LABEL_14:
    v16 = 0;
    goto LABEL_6;
  }
  v16 = (void *)*((_QWORD *)v14 + 1);
LABEL_6:
  v17 = v16;
  objc_msgSend(v12, "stringWithFormat:", CFSTR("BSNSXPCTransport%@"), v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(void **)&a1[4]._os_unfair_lock_opaque;
  *(_QWORD *)&a1[4]._os_unfair_lock_opaque = v18;

  v20 = objc_msgSend(v10, "copy");
  v21 = *(void **)&a1[12]._os_unfair_lock_opaque;
  *(_QWORD *)&a1[12]._os_unfair_lock_opaque = v20;

  a1[18]._os_unfair_lock_opaque = 0;
  os_unfair_lock_lock(a1 + 18);
  ((void (**)(id, os_unfair_lock_s *))v9)[2](v9, a1);
  os_unfair_lock_unlock(a1 + 18);
  LOBYTE(a1[19]._os_unfair_lock_opaque) = 0;
  v22 = *(_QWORD **)&a1[2]._os_unfair_lock_opaque;
  if (v22)
    v22 = (_QWORD *)v22[22];
  v23 = v22;
  v24 = objc_msgSend(v23, "isNonLaunching");

  if (v24 && (*(_QWORD *)&a1[6]._os_unfair_lock_opaque || *(_QWORD *)&a1[8]._os_unfair_lock_opaque))
    LOBYTE(a1[19]._os_unfair_lock_opaque) = 1;
LABEL_12:

  return a1;
}

- (void)setMessageHandler:(id)a3
{
  id v4;
  BSXPCServiceConnection *connection;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BSNSXPCTransport setMessageHandler:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v12 = v7;
      v13 = 2114;
      v14 = CFSTR("BSNSXPCTransport.m");
      v15 = 1024;
      v16 = 297;
      v17 = 2114;
      v18 = v6;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BA0CCLL);
  }
  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__BSNSXPCTransport_setMessageHandler___block_invoke;
  v9[3] = &unk_1E390D158;
  v8 = v4;
  v9[4] = self;
  v10 = v8;
  -[BSXPCServiceConnection configure:]((uint64_t)connection, (uint64_t)v9);

}

- (void)setErrorHandler:(id)a3
{
  id v5;
  void *v6;
  _BSNSXPCInvalidCallbackTracking *v7;
  id v8;
  uint64_t v9;
  id lock_handler;
  BSXPCServiceConnection *connection;
  _BSNSXPCInvalidCallbackTracking *v12;
  id v13;
  _BSNSXPCInvalidCallbackTracking *configured_invalidCallbackTracking;
  _BSNSXPCInvalidCallbackTracking *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  _BSNSXPCInvalidCallbackTracking *v20;
  id v21;
  SEL v22;
  _BYTE v23[22];
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BSNSXPCTransport setErrorHandler:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138544130;
      *(_QWORD *)&v23[4] = v17;
      *(_WORD *)&v23[12] = 2114;
      *(_QWORD *)&v23[14] = CFSTR("BSNSXPCTransport.m");
      v24 = 1024;
      v25 = 319;
      v26 = 2114;
      v27 = v16;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v23, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BB89CLL);
  }
  v6 = (void *)objc_msgSend(v5, "copy");
  os_unfair_lock_lock(&self->_lock);
  v7 = [_BSNSXPCInvalidCallbackTracking alloc];
  v8 = v6;
  if (v7)
  {
    *(_QWORD *)v23 = v7;
    *(_QWORD *)&v23[8] = _BSNSXPCInvalidCallbackTracking;
    v7 = (_BSNSXPCInvalidCallbackTracking *)objc_msgSendSuper2((objc_super *)v23, sel_init);
    if (v7)
    {
      v9 = objc_msgSend(v8, "copy");
      lock_handler = v7->_lock_handler;
      v7->_lock_handler = (id)v9;

      v7->_lock._os_unfair_lock_opaque = 0;
    }
  }

  connection = self->_connection;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __36__BSNSXPCTransport_setErrorHandler___block_invoke;
  v19[3] = &unk_1E390D1A8;
  v22 = a2;
  v19[4] = self;
  v12 = v7;
  v20 = v12;
  v13 = v8;
  v21 = v13;
  -[BSXPCServiceConnection configure:]((uint64_t)connection, (uint64_t)v19);
  configured_invalidCallbackTracking = self->_configured_invalidCallbackTracking;
  self->_configured_invalidCallbackTracking = v12;
  v15 = v12;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setFaultOnSuspend
{
  os_unfair_lock_assert_owner(&self->_lock);
  self->_faultOnSuspend = 1;
}

- (void)setActivateOnResume
{
  os_unfair_lock_assert_owner(&self->_lock);
  self->_activateOnResume = 1;
}

- (void)activate
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  BSNSXPCTransport *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[BSXPCServiceConnection activateNowOrWhenReady:]((uint64_t)self->_connection, 0);
  if (!self->_targetQueue)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setTargetQueue not called before activate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138544642;
      v9 = v5;
      v10 = 2114;
      v11 = v7;
      v12 = 2048;
      v13 = self;
      v14 = 2114;
      v15 = CFSTR("BSNSXPCTransport.m");
      v16 = 1024;
      v17 = 424;
      v18 = 2114;
      v19 = v4;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BBAC0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configured_invalidCallbackTracking, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong(&self->_assertionProvider, 0);
  objc_storeStrong((id *)&self->_refCountedAssertion, 0);
  objc_storeStrong((id *)&self->_refCounter, 0);
  objc_storeStrong((id *)&self->_perMessageAttributes, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __26__BSNSXPCTransport_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void (**v3)(id, _QWORD);

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 16));
    v3 = (void (**)(id, _QWORD))MEMORY[0x19AECAA00](*(_QWORD *)(v1 + 8));
    v2 = *(void **)(v1 + 8);
    *(_QWORD *)(v1 + 8) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 16));
    if (v3)
      v3[2](v3, MEMORY[0x1E0C81260]);

  }
}

- (void)resume
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  BSNSXPCTransport *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!self->_activateOnResume)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("resume is not supported on a wrapped BSServiceConnection"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138544642;
      v9 = v5;
      v10 = 2114;
      v11 = v7;
      v12 = 2048;
      v13 = self;
      v14 = 2114;
      v15 = CFSTR("BSNSXPCTransport.m");
      v16 = 1024;
      v17 = 448;
      v18 = 2114;
      v19 = v4;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BC004);
  }
  -[BSNSXPCTransport activate](self, "activate");
}

void __62__BSNSXPCTransport_sendMessageWithReply_onQueue_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v6)
  {
    objc_msgSend(v6, "message");
    a3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    a3 = (void *)MEMORY[0x1E0C81260];
    v5 = MEMORY[0x1E0C81260];
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)sendNotification:(id)a3
{
  -[BSNSXPCTransport _sendMessage:asNotification:]((uint64_t)self, a3, 1);
}

- (void)sendMessageWithReply:(id)a3 onQueue:(id)a4 replyHandler:(id)a5
{
  id v9;
  OS_dispatch_queue *v10;
  id v11;
  void *v12;
  BSXPCServiceConnection *connection;
  BSXPCServiceConnection *v14;
  unsigned __int8 messageOptions;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  OS_dispatch_queue *targetQueue;
  _QWORD *v22;
  _QWORD *v23;
  const char *v24;
  id v25;
  void *v26;
  id v27;
  objc_class *v28;
  void *v29;
  void *v30;
  id v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v35;
  objc_class *v36;
  void *v37;
  void *v38;
  id v39;
  objc_class *v40;
  void *v41;
  void *v42;
  id v43;
  objc_class *v44;
  void *v45;
  _QWORD newValue[4];
  id v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  BSNSXPCTransport *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (OS_dispatch_queue *)a4;
  v11 = a5;
  if (!v9 || MEMORY[0x19AECADB4](v9) != MEMORY[0x1E0C812F8])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("xMessage was invalid : %@"), v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v50 = v27;
      v51 = 2114;
      v52 = v29;
      v53 = 2048;
      v54 = self;
      v55 = 2114;
      v56 = CFSTR("BSNSXPCTransport.m");
      v57 = 1024;
      v58 = 376;
      v59 = 2114;
      v60 = v26;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BC488);
  }
  xpc_dictionary_get_remote_connection(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot send a reply via sendMessageWithReply:onQueue:replyHandler:"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v50 = v31;
      v51 = 2114;
      v52 = v33;
      v53 = 2048;
      v54 = self;
      v55 = 2114;
      v56 = CFSTR("BSNSXPCTransport.m");
      v57 = 1024;
      v58 = 377;
      v59 = 2114;
      v60 = v30;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BC57CLL);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v50 = v35;
      v51 = 2114;
      v52 = v37;
      v53 = 2048;
      v54 = self;
      v55 = 2114;
      v56 = CFSTR("BSNSXPCTransport.m");
      v57 = 1024;
      v58 = 378;
      v59 = 2114;
      v60 = v34;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BC67CLL);
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v50 = v39;
      v51 = 2114;
      v52 = v41;
      v53 = 2048;
      v54 = self;
      v55 = 2114;
      v56 = CFSTR("BSNSXPCTransport.m");
      v57 = 1024;
      v58 = 379;
      v59 = 2114;
      v60 = v38;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BC77CLL);
  }
  connection = self->_connection;
  if (connection)
    connection = (BSXPCServiceConnection *)connection->_context;
  v14 = connection;
  if (-[BSXPCServiceConnection isNonLaunching](v14, "isNonLaunching"))
  {
    messageOptions = self->_messageOptions;

    if ((messageOptions & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot send to non-launching services without specifying launching attributes"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v50 = v17;
        v51 = 2114;
        v52 = v19;
        v53 = 2048;
        v54 = self;
        v55 = 2114;
        v56 = CFSTR("BSNSXPCTransport.m");
        v57 = 1024;
        v58 = 380;
        v59 = 2114;
        v60 = v16;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7BC290);
    }
  }
  else
  {

  }
  -[BSXPCServiceConnection createMessageWithOptions:]((uint64_t)self->_connection, self->_messageOptions);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeXPCObject:forKey:", v9, CFSTR("BSNSXPCMessage"));
  targetQueue = self->_targetQueue;
  if (targetQueue != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queue does not match configured queue : param=%@ config=%@"), v10, targetQueue);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v43 = (id)objc_claimAutoreleasedReturnValue();
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v50 = v43;
      v51 = 2114;
      v52 = v45;
      v53 = 2048;
      v54 = self;
      v55 = 2114;
      v56 = CFSTR("BSNSXPCTransport.m");
      v57 = 1024;
      v58 = 385;
      v59 = 2114;
      v60 = v42;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7BC874);
  }
  v22 = -[BSNSXPCTransport _newMessageSessionWithReason:](self, CFSTR("per-async-message-with-reply"));
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __62__BSNSXPCTransport_sendMessageWithReply_onQueue_replyHandler___block_invoke;
  newValue[3] = &unk_1E390D260;
  v23 = v22;
  v47 = v23;
  v25 = v11;
  v48 = v25;
  if (v20)
    objc_setProperty_nonatomic_copy(v20, v24, newValue, 80);
  objc_msgSend(v20, "send");

}

- (void)dealloc
{
  objc_super v3;

  -[BSCompoundAssertion invalidate](self->_refCounter, "invalidate");
  -[RBSAssertion invalidate](self->_refCountedAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BSNSXPCTransport;
  -[BSNSXPCTransport dealloc](&v3, sel_dealloc);
}

- (void)_newAcquiredAssertionWithAttributes:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[8];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE buf[24];
  void *v39;
  _BYTE v40[10];
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("attributes"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__newAcquiredAssertionWithAttributes_);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2048;
      v39 = a1;
      *(_WORD *)v40 = 2114;
      *(_QWORD *)&v40[2] = CFSTR("BSNSXPCTransport.m");
      v41 = 1024;
      v42 = 144;
      v43 = 2114;
      v44 = v21;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C1924);
  }
  v4 = a1[1];
  if (!v4)
    goto LABEL_29;
  v5 = *(id *)(v4 + 168);
  if (!v5)
  {
LABEL_30:
    v10 = 0;
    goto LABEL_31;
  }
  v6 = a1[6];
  if (v6)
  {
    (*(void (**)(uint64_t, _QWORD, id, id))(v6 + 16))(v6, a1[2], v5, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v8 = (void *)_MergedGlobals_3;
    v37 = _MergedGlobals_3;
    if (!_MergedGlobals_3)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getRBSAssertionClass_block_invoke_1;
      v39 = &unk_1E390CE38;
      *(_QWORD *)v40 = &v34;
      __getRBSAssertionClass_block_invoke_1((uint64_t)buf);
      v8 = (void *)v35[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v34, 8);
    v7 = (void *)objc_msgSend([v9 alloc], "initWithExplanation:target:attributes:", a1[2], v5, v3);
  }
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ failed to create assertion : attributes=%@"), a1[2], v3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__newAcquiredAssertionWithAttributes_);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2048;
      v39 = a1;
      *(_WORD *)v40 = 2114;
      *(_QWORD *)&v40[2] = CFSTR("BSNSXPCTransport.m");
      v41 = 1024;
      v42 = 155;
      v43 = 2114;
      v44 = v25;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C1A20);
  }
  v33 = 0;
  v11 = objc_msgSend(v7, "acquireWithError:", &v33);
  v12 = v33;
  v13 = v12;
  if ((v11 & 1) != 0)
    goto LABEL_21;
  objc_msgSend(v12, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v15 = (id *)qword_1ECD9C5B0;
  v39 = (void *)qword_1ECD9C5B0;
  if (!qword_1ECD9C5B0)
  {
    v16 = RunningBoardServicesLibrary_1();
    v15 = (id *)dlsym(v16, "RBSAssertionErrorDomain");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v15;
    qword_1ECD9C5B0 = (uint64_t)v15;
  }
  _Block_object_dispose(buf, 8);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getRBSAssertionErrorDomain(void)");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("BSNSXPCTransport.m"), 32, CFSTR("%s"), dlerror());

    __break(1u);
LABEL_29:
    v5 = 0;
    goto LABEL_30;
  }
  v17 = *v15;
  if (objc_msgSend(v14, "isEqualToString:", v17))
  {
    v18 = objc_msgSend(v13, "code") == 4;

    if (v18)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __56__BSNSXPCTransport__newAcquiredAssertionWithAttributes___block_invoke;
      v32[3] = &unk_1E390D238;
      v32[4] = a1;
      v32[5] = v13;
      v32[6] = v3;
      v32[7] = sel__newAcquiredAssertionWithAttributes_;
      __56__BSNSXPCTransport__newAcquiredAssertionWithAttributes___block_invoke((uint64_t)v32);
    }
  }
  else
  {

  }
  BSServiceXPCErrorsLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = a1[2];
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v39 = v3;
    _os_log_error_impl(&dword_19A799000, v19, OS_LOG_TYPE_ERROR, "%{public}@ failed to acquire assertion : error=%{public}@ attributes=%{public}@", buf, 0x20u);
  }

LABEL_21:
LABEL_31:

  return v10;
}

void __56__BSNSXPCTransport__newAcquiredAssertionWithAttributes___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint8_t buf[4];
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ failed to acquire assertion : error=%@  attributes=%@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138544642;
    v8 = v3;
    v9 = 2114;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2114;
    v14 = CFSTR("BSNSXPCTransport.m");
    v15 = 1024;
    v16 = 161;
    v17 = 2114;
    v18 = v2;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (_QWORD)_newMessageSessionWithReason:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)a1[3];
    if (v4)
      v5 = -[BSNSXPCTransport _newAcquiredAssertionWithAttributes:](a1, v4);
    else
      v5 = 0;
    v6 = (void *)a1[4];
    if (v6)
    {
      objc_msgSend(v6, "acquireForReason:", v3);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (id)v7;
      v9 = v5 != 0;
      if (v5 && v7)
      {
        v10 = objc_alloc(MEMORY[0x1E0D01868]);
        v11 = a1[2];
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __49__BSNSXPCTransport__newMessageSessionWithReason___block_invoke;
        v14[3] = &unk_1E390D098;
        v15 = v5;
        v8 = v8;
        v16 = v8;
        a1 = (_QWORD *)objc_msgSend(v10, "initWithIdentifier:forReason:invalidationBlock:", v11, CFSTR("combiner"), v14);

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      v8 = 0;
      v9 = v5 != 0;
    }
    if (v9)
      v12 = v5;
    else
      v12 = v8;
    a1 = v12;
    goto LABEL_14;
  }
LABEL_15:

  return a1;
}

uint64_t __49__BSNSXPCTransport__newMessageSessionWithReason___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)setRefCountedAssertionAttributes:(id)a3
{
  id v4;
  BSXPCServiceConnection *connection;
  BSXPCServiceConnection *v6;
  int v7;
  void *v8;
  BSCompoundAssertion *v9;
  void *v10;
  void *v11;
  NSString *explanation;
  BSCompoundAssertion *v13;
  BSCompoundAssertion *refCounter;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (objc_msgSend(v4, "count"))
  {
    connection = self->_connection;
    if (connection)
      connection = (BSXPCServiceConnection *)connection->_context;
    v6 = connection;
    v7 = -[BSXPCServiceConnection isNonLaunching](v6, "isNonLaunching");

    if (v7)
      objc_msgSend(getRBSConstraintsAttributeClass(), "attributeWithConstraints:", 7);
    else
      objc_msgSend(getRBSConstraintsAttributeClass(), "attributeWithConstraints:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v11 = (void *)MEMORY[0x1E0D01718];
    explanation = self->_explanation;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__BSNSXPCTransport_setRefCountedAssertionAttributes___block_invoke;
    v15[3] = &unk_1E390D0E8;
    objc_copyWeak(&v17, &location);
    v4 = v10;
    v16 = v4;
    objc_msgSend(v11, "assertionWithIdentifier:stateDidChangeHandler:", explanation, v15);
    v13 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    refCounter = self->_refCounter;
    self->_refCounter = v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    -[BSCompoundAssertion invalidate](self->_refCounter, "invalidate");
    v9 = self->_refCounter;
    self->_refCounter = 0;

  }
}

void __53__BSNSXPCTransport_setRefCountedAssertionAttributes___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = objc_msgSend(v8, "isActive");
    v5 = (void *)WeakRetained[5];
    if (v4)
    {
      if (!v5)
      {
        v6 = -[BSNSXPCTransport _newAcquiredAssertionWithAttributes:](WeakRetained, *(void **)(a1 + 32));
LABEL_7:
        v7 = (void *)WeakRetained[5];
        WeakRetained[5] = v6;

      }
    }
    else if (v5)
    {
      objc_msgSend(v5, "invalidate");
      v6 = 0;
      goto LABEL_7;
    }
  }

}

- (id)newExternalMessageSessionWithReason:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  void *v8;

  v4 = a3;
  v5 = -[BSNSXPCTransport _newMessageSessionWithReason:](self, v4);
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01868]), "initWithIdentifier:forReason:invalidationBlock:", self->_explanation, v4, &__block_literal_global);
  v8 = v7;

  return v8;
}

- (void)sendBarrierBlock:(id)a3
{
  -[BSXPCServiceConnection sendBarrierBlock:]((uint64_t)self->_connection, a3);
}

- (void)suspend
{
  os_log_type_t v3;
  NSObject *v4;
  NSString *explanation;
  void *v7;
  NSString *v8;
  objc_class *v9;
  void *v10;
  int v11;
  NSString *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BSNSXPCTransport *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_faultOnSuspend)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suspend is not supported on a wrapped BSServiceConnection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138544642;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      v15 = 2048;
      v16 = self;
      v17 = 2114;
      v18 = CFSTR("BSNSXPCTransport.m");
      v19 = 1024;
      v20 = 440;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7C2444);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_faultedOnSuspend)
  {
    v3 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    self->_lock_faultedOnSuspend = 1;
    v3 = OS_LOG_TYPE_FAULT;
  }
  os_unfair_lock_unlock(&self->_lock);
  BSServiceXPCErrorsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, v3))
  {
    explanation = self->_explanation;
    v11 = 138543362;
    v12 = explanation;
    _os_log_impl(&dword_19A799000, v4, v3, "%{public}@ cannot suspend this type of transport", (uint8_t *)&v11, 0xCu);
  }

}

- (int)auditSessionIdentifier
{
  void *v2;
  int v3;

  -[BSNSXPCTransport _auditToken]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "asid");

  return v3;
}

- (unsigned)effectiveUserIdentifier
{
  void *v2;
  unsigned int v3;

  -[BSNSXPCTransport _auditToken]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "euid");

  return v3;
}

- (unsigned)effectiveGroupIdentifier
{
  void *v2;
  unsigned int v3;

  -[BSNSXPCTransport _auditToken]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "egid");

  return v3;
}

@end
