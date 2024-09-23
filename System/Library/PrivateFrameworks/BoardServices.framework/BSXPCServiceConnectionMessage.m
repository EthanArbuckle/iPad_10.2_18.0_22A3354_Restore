@implementation BSXPCServiceConnectionMessage

- (void)setMessageID:(void *)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    if (v3)
      objc_msgSend(a1, "encodeObject:forKey:", v3, CFSTR("bsxpc"));
    else
      objc_msgSend(a1, "_removeValueForKey:", CFSTR("bsxpc"));
  }

}

- (BOOL)send
{
  return -[BSXPCServiceConnectionMessage _sendWithMode:]((uint64_t)self, 0);
}

- (void)invalidate
{
  uint64_t v3;
  void *v4;
  id completion;
  uint64_t v6;
  void *v7;
  BSXPCServiceConnectionHandshake *handshake;
  BSXPCServiceConnectionMessageDelegate *delegate;

  v3 = (int)*MEMORY[0x1E0D018B8];
  v4 = *(Class *)((char *)&self->super.super.isa + v3);
  *(Class *)((char *)&self->super.super.isa + v3) = 0;

  completion = self->_completion;
  self->_completion = 0;

  v6 = (int)*MEMORY[0x1E0D018C0];
  v7 = *(Class *)((char *)&self->super.super.isa + v6);
  *(Class *)((char *)&self->super.super.isa + v6) = 0;

  handshake = self->_handshake;
  self->_handshake = 0;

  delegate = self->_delegate;
  self->_delegate = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_handshake, 0);
}

- (BSXPCServiceConnectionMessage)initWithMessage:(id)a3
{
  BSXPCServiceConnectionMessage *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSXPCServiceConnectionMessage;
  result = -[BSXPCCoder initWithMessage:](&v4, sel_initWithMessage_, a3);
  if (result)
    result->_sendFlag = 0;
  return result;
}

- (void)setChildIdentifierIsRemotelyDefined:(void *)a1
{
  if (a1)
    return (void *)objc_msgSend(a1, "encodeBool:forKey:", a2, CFSTR("bsxpc_CIDr"));
  return a1;
}

- (void)setChildIdentifier:(void *)result
{
  void *v2;
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  uint8_t buf[4];
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("childIdentifier > 0"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_setChildIdentifier_);
        v4 = (id)objc_claimAutoreleasedReturnValue();
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v8 = v4;
        v9 = 2114;
        v10 = v6;
        v11 = 2048;
        v12 = v2;
        v13 = 2114;
        v14 = CFSTR("BSXPCServiceConnectionMessage.m");
        v15 = 1024;
        v16 = 117;
        v17 = 2114;
        v18 = v3;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A79C49CLL);
    }
    return (void *)objc_msgSend(result, "encodeUInt64:forKey:", a2, CFSTR("bsxpc_CID"));
  }
  return result;
}

- (void)setReplyQueue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (void)setSelectorName:(void *)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    if (v3)
      objc_msgSend(a1, "encodeObject:forKey:", v3, CFSTR("bsxpc_SEL"));
    else
      objc_msgSend(a1, "_removeValueForKey:", CFSTR("bsxpc_SEL"));
  }

}

void __60__BSXPCServiceConnectionMessage_sendSynchronouslyWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)createReply
{
  BSXPCServiceConnectionMessageReply *v3;
  BSXPCServiceConnectionMessageReply *v4;

  if (-[BSXPCServiceConnectionMessage expectsReply](self, "expectsReply"))
  {
    v3 = [BSXPCServiceConnectionMessageReply alloc];
    v4 = -[BSXPCServiceConnectionMessageReply initWithMessage:](v3, "initWithMessage:", *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D018B8]));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)expectsReply
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D018B8]);
  if (v2)
    LOBYTE(v2) = xpc_dictionary_expects_reply();
  return v2;
}

- (void)childIdentifier
{
  if (a1)
    return (void *)objc_msgSend(a1, "decodeUInt64ForKey:", CFSTR("bsxpc_CID"));
  return a1;
}

- (id)messageID
{
  if (a1)
  {
    objc_msgSend(a1, "decodeStringForKey:", CFSTR("bsxpc"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)childIdentifierIsRemotelyDefined
{
  if (a1)
    return (void *)objc_msgSend(a1, "decodeBoolForKey:", CFSTR("bsxpc_CIDr"));
  return a1;
}

- (id)selectorName
{
  if (a1)
  {
    objc_msgSend(a1, "decodeStringForKey:", CFSTR("bsxpc_SEL"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)sendSynchronously
{
  return -[BSXPCServiceConnectionMessage _sendWithMode:]((uint64_t)self, 1);
}

- (id)sendSynchronouslyWithError:(id *)a3
{
  void *v5;
  id completion;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__BSXPCServiceConnectionMessage_sendSynchronouslyWithError___block_invoke;
  v9[3] = &unk_1E390DE98;
  v9[4] = &v10;
  v9[5] = &v16;
  v5 = (void *)MEMORY[0x19AECAA00](v9, a2);
  completion = self->_completion;
  self->_completion = v5;

  -[BSXPCServiceConnectionMessage sendSynchronously](self, "sendSynchronously");
  if (a3)
    *a3 = objc_retainAutorelease((id)v17[5]);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (uint64_t)_initWithXPCConnection:(void *)a3 targetQueue:(void *)a4 handshake:(int)a5 activationGeneration:(void *)a6 delegate:
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (a1)
  {
    v16 = objc_msgSend((id)a1, "initWithMessage:", 0);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong((id *)(v16 + (int)*MEMORY[0x1E0D018C0]), a2);
      objc_storeStrong((id *)(a1 + 72), a3);
      objc_storeStrong((id *)(a1 + 40), a4);
      *(_DWORD *)(a1 + 64) = a5;
      objc_storeStrong((id *)(a1 + 48), a6);
    }
  }

  return a1;
}

+ (id)messageWithXPCConnection:(void *)a3 targetQueue:(void *)a4 handshake:(int)a5 activationGeneration:(void *)a6 delegate:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = objc_alloc((Class)objc_opt_self());
  v15 = (void *)-[BSXPCServiceConnectionMessage _initWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)v14, v10, v11, v12, a5, v13);

  return v15;
}

- (BOOL)_sendWithMode:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  _QWORD *v10;
  void (**v11)(_QWORD, _QWORD);
  int *v12;
  _xpc_connection_s *v13;
  NSObject *v14;
  NSObject *v15;
  _xpc_connection_s *v16;
  NSObject *v17;
  void *v19;
  id v20;
  objc_class *v21;
  void *v22;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  void *v31;
  id v32;
  objc_class *v33;
  void *v34;
  void *v35;
  id v36;
  objc_class *v37;
  void *v38;
  void *v39;
  id v40;
  objc_class *v41;
  void *v42;
  void *v43;
  id v44;
  objc_class *v45;
  void *v46;
  id *v47;
  id *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  int v52;
  _BYTE block[24];
  void *v54;
  __int128 v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((BSAtomicSetFlag() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can not send the same message twice"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__sendWithMode_);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)block = 138544642;
        *(_QWORD *)&block[4] = v20;
        *(_WORD *)&block[12] = 2114;
        *(_QWORD *)&block[14] = v22;
        *(_WORD *)&block[22] = 2048;
        v54 = (void *)a1;
        LOWORD(v55) = 2114;
        *(_QWORD *)((char *)&v55 + 2) = CFSTR("BSXPCServiceConnectionMessage.m");
        WORD5(v55) = 1024;
        HIDWORD(v55) = 145;
        v56 = 2114;
        v57 = v19;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7D9798);
    }
    if (a2)
    {
      if (a2 == 1 && !*(_QWORD *)(a1 + 80))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("only messages with a reply can be sent synchronously"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__sendWithMode_);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)block = 138544642;
          *(_QWORD *)&block[4] = v28;
          *(_WORD *)&block[12] = 2114;
          *(_QWORD *)&block[14] = v30;
          *(_WORD *)&block[22] = 2048;
          v54 = (void *)a1;
          LOWORD(v55) = 2114;
          *(_QWORD *)((char *)&v55 + 2) = CFSTR("BSXPCServiceConnectionMessage.m");
          WORD5(v55) = 1024;
          HIDWORD(v55) = 146;
          v56 = 2114;
          v57 = v27;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7D9988);
      }
      if (*(_BYTE *)(a1 + 60))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("only async messages are batchable"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__sendWithMode_);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)block = 138544642;
          *(_QWORD *)&block[4] = v24;
          *(_WORD *)&block[12] = 2114;
          *(_QWORD *)&block[14] = v26;
          *(_WORD *)&block[22] = 2048;
          v54 = (void *)a1;
          LOWORD(v55) = 2114;
          *(_QWORD *)((char *)&v55 + 2) = CFSTR("BSXPCServiceConnectionMessage.m");
          WORD5(v55) = 1024;
          HIDWORD(v55) = 147;
          v56 = 2114;
          v57 = v23;
          _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19A7D9890);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "sendIfNecessary");
    v4 = *(void **)(a1 + 48);
    if (!v4 || objc_msgSend(v4, "shouldSendMessage:", a1))
    {
      objc_msgSend((id)a1, "createMessage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(id *)(a1 + 88);
      v7 = (void *)MEMORY[0x19AECAA00](*(_QWORD *)(a1 + 80));
      v8 = *(id *)(a1 + 48);
      if (v7)
      {
        v9 = *(_DWORD *)(a1 + 64);
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke;
        v49[3] = &unk_1E390DDD0;
        v10 = v49;
        v47 = &v51;
        v51 = v7;
        v48 = &v50;
        v50 = v8;
        v52 = v9;
      }
      else
      {
        v10 = 0;
      }
      v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AECAA00](v10);
      v12 = (int *)MEMORY[0x1E0D018C0];
      v13 = *(_xpc_connection_s **)(a1 + (int)*MEMORY[0x1E0D018C0]);
      if (v13)
      {
        if (!v11)
        {
          if (*(_BYTE *)(a1 + 61))
            xpc_connection_send_notification();
          else
            xpc_connection_send_message(v13, v5);
          goto LABEL_34;
        }
        if (a2 == 1)
        {
          v14 = xpc_connection_send_message_with_reply_sync(v13, v5);
          ((void (**)(_QWORD, NSObject *))v11)[2](v11, v14);
LABEL_33:

          goto LABEL_34;
        }
        objc_msgSend(v6, "backingQueueIfExists");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          xpc_connection_send_message_with_reply(*(xpc_connection_t *)(a1 + *v12), v5, v14, v11);
          goto LABEL_33;
        }
        v15 = *(NSObject **)(a1 + 72);
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must have a connection target queue to send a message with a reply."));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__actuallySendWithMode_);
            v32 = (id)objc_claimAutoreleasedReturnValue();
            v33 = (objc_class *)objc_opt_class();
            NSStringFromClass(v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)block = 138544642;
            *(_QWORD *)&block[4] = v32;
            *(_WORD *)&block[12] = 2114;
            *(_QWORD *)&block[14] = v34;
            *(_WORD *)&block[22] = 2048;
            v54 = (void *)a1;
            LOWORD(v55) = 2114;
            *(_QWORD *)((char *)&v55 + 2) = CFSTR("BSXPCServiceConnectionMessage.m");
            WORD5(v55) = 1024;
            HIDWORD(v55) = 197;
            v56 = 2114;
            v57 = v31;
            _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A7D9A7CLL);
        }
        if (!v6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must have a connection reply queue to send a message with a reply."));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__actuallySendWithMode_);
            v36 = (id)objc_claimAutoreleasedReturnValue();
            v37 = (objc_class *)objc_opt_class();
            NSStringFromClass(v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)block = 138544642;
            *(_QWORD *)&block[4] = v36;
            *(_WORD *)&block[12] = 2114;
            *(_QWORD *)&block[14] = v38;
            *(_WORD *)&block[22] = 2048;
            v54 = (void *)a1;
            LOWORD(v55) = 2114;
            *(_QWORD *)((char *)&v55 + 2) = CFSTR("BSXPCServiceConnectionMessage.m");
            WORD5(v55) = 1024;
            HIDWORD(v55) = 198;
            v56 = 2114;
            v57 = v35;
            _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A7D9B70);
        }
        v16 = *(_xpc_connection_s **)(a1 + *v12);
        *(_QWORD *)block = MEMORY[0x1E0C809B0];
        *(_QWORD *)&block[8] = 3221225472;
        *(_QWORD *)&block[16] = __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_35;
        v54 = &unk_1E390DE20;
        *(_QWORD *)&v55 = v6;
        *((_QWORD *)&v55 + 1) = v11;
        xpc_connection_send_message_with_reply(v16, v5, v15, block);

        v14 = 0;
LABEL_32:

        goto LABEL_33;
      }
      if (v11)
      {
        if (a2 != 1)
        {
          objc_msgSend(v6, "backingQueueIfExists");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            *(_QWORD *)block = MEMORY[0x1E0C809B0];
            *(_QWORD *)&block[8] = 3221225472;
            *(_QWORD *)&block[16] = __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_3;
            v54 = &unk_1E390DE48;
            *(_QWORD *)&v55 = v11;
            dispatch_async(v14, block);
          }
          else
          {
            v17 = *(NSObject **)(a1 + 72);
            if (!v17)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must have a connection target queue to send a message with a reply."));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__actuallySendWithMode_);
                v40 = (id)objc_claimAutoreleasedReturnValue();
                v41 = (objc_class *)objc_opt_class();
                NSStringFromClass(v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)block = 138544642;
                *(_QWORD *)&block[4] = v40;
                *(_WORD *)&block[12] = 2114;
                *(_QWORD *)&block[14] = v42;
                *(_WORD *)&block[22] = 2048;
                v54 = (void *)a1;
                LOWORD(v55) = 2114;
                *(_QWORD *)((char *)&v55 + 2) = CFSTR("BSXPCServiceConnectionMessage.m");
                WORD5(v55) = 1024;
                HIDWORD(v55) = 219;
                v56 = 2114;
                v57 = v39;
                _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);

              }
              objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7D9C64);
            }
            if (!v6)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must have a connection reply queue to send a message with a reply."));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__actuallySendWithMode_);
                v44 = (id)objc_claimAutoreleasedReturnValue();
                v45 = (objc_class *)objc_opt_class();
                NSStringFromClass(v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)block = 138544642;
                *(_QWORD *)&block[4] = v44;
                *(_WORD *)&block[12] = 2114;
                *(_QWORD *)&block[14] = v46;
                *(_WORD *)&block[22] = 2048;
                v54 = (void *)a1;
                LOWORD(v55) = 2114;
                *(_QWORD *)((char *)&v55 + 2) = CFSTR("BSXPCServiceConnectionMessage.m");
                WORD5(v55) = 1024;
                HIDWORD(v55) = 220;
                v56 = 2114;
                v57 = v43;
                _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);

              }
              objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19A7D9D58);
            }
            *(_QWORD *)block = MEMORY[0x1E0C809B0];
            *(_QWORD *)&block[8] = 3221225472;
            *(_QWORD *)&block[16] = __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_37;
            v54 = &unk_1E390DD00;
            *(_QWORD *)&v55 = v6;
            *((_QWORD *)&v55 + 1) = v11;
            dispatch_async(v17, block);

            v14 = 0;
          }
          goto LABEL_32;
        }
        v11[2](v11, MEMORY[0x1E0C81260]);
      }
LABEL_34:
      objc_msgSend((id)a1, "invalidate");

      if (v7)
      {

      }
    }
  }
  return a1 != 0;
}

- (char)connection
{
  if (a1)
    a1 = (char *)*(id *)&a1[*MEMORY[0x1E0D018C0]];
  return a1;
}

void __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  BSXPCServiceConnectionMessage *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7 && (v3 = MEMORY[0x19AECADB4](), v4 = MEMORY[0x1E0C81310], v7, v7, v3 == v4))
  {
    v6 = *(_QWORD *)(a1 + 40);
    BSServiceConnectionErrorCreate(3uLL, 0, CFSTR("XPC error received on message reply handler"));
    v5 = (BSXPCServiceConnectionMessage *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, BSXPCServiceConnectionMessage *))(v6 + 16))(v6, 0, v5);
  }
  else
  {
    v5 = -[BSXPCServiceConnectionMessage initWithMessage:]([BSXPCServiceConnectionMessage alloc], "initWithMessage:", v7);
    objc_msgSend(*(id *)(a1 + 32), "updateAuditTokenFromReplyMessage:fromActivationGeneration:", v5, *(unsigned int *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_2;
  v7[3] = &unk_1E390DDF8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performAsync:", v7);

}

uint64_t __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_37(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_2_38;
  v2[3] = &unk_1E390DE48;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performAsync:", v2);

}

uint64_t __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_2_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_subMessages
{
  void *v2;
  void *v3;
  id v4;
  _QWORD applier[4];
  id v7;

  if (!a1 || !objc_msgSend(a1, "containsValueForKey:", CFSTR("bsxpc_BATCH")))
    return 0;
  objc_msgSend(a1, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812C8], CFSTR("bsxpc_BATCH"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __45__BSXPCServiceConnectionMessage__subMessages__block_invoke;
    applier[3] = &unk_1E390DE70;
    v4 = v3;
    v7 = v4;
    xpc_array_apply(v2, applier);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __45__BSXPCServiceConnectionMessage__subMessages__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  BSXPCServiceConnectionMessage *v6;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = -[BSXPCServiceConnectionMessage initWithMessage:]([BSXPCServiceConnectionMessage alloc], "initWithMessage:", v4);
  objc_msgSend(v5, "addObject:", v6);

  return 1;
}

@end
