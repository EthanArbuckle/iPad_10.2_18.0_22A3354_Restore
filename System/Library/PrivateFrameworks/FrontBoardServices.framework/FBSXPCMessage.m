@implementation FBSXPCMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)sendReplyMessageWithPacker:(id)a3
{
  void (**v4)(id, xpc_object_t);
  xpc_object_t v5;
  BSXPCServiceConnectionMessage *reply;
  void (**v7)(id, xpc_object_t);

  v4 = (void (**)(id, xpc_object_t))a3;
  if (self->_reply)
  {
    v7 = v4;
    v5 = xpc_dictionary_create(0, 0, 0);
    if (v7)
      v7[2](v7, v5);
    -[BSXPCServiceConnectionMessage encodeXPCObject:forKey:](self->_reply, "encodeXPCObject:forKey:", v5, CFSTR("fbs_message"));
    -[BSXPCServiceConnectionMessage send](self->_reply, "send");
    reply = self->_reply;
    self->_reply = 0;

    v4 = v7;
  }

}

- (OS_xpc_object)payload
{
  return self->_payload;
}

+ (id)message
{
  return objc_alloc_init((Class)a1);
}

+ (id)messageWithPacker:(id)a3
{
  id v3;
  FBSXPCMessage *v4;

  v3 = a3;
  v4 = -[FBSXPCMessage initWithMessagePacker:]([FBSXPCMessage alloc], "initWithMessagePacker:", v3);

  return v4;
}

- (FBSXPCMessage)initWithMessagePacker:(id)a3
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  FBSXPCMessage *v7;
  FBSXPCMessage *v8;
  FBSXPCMessage *result;
  void *v10;

  v5 = a3;
  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD))v5;
    v7 = -[FBSXPCMessage init](self, "init");
    v8 = v7;
    if (v7)
      ((void (**)(_QWORD, OS_xpc_object *))v6)[2](v6, v7->_payload);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("packer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSXPCMessage initWithMessagePacker:].cold.1(a2, (uint64_t)self, (uint64_t)v10);
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (FBSXPCMessage *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSXPCMessage)init
{
  xpc_object_t v3;
  FBSXPCMessage *v4;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = -[FBSXPCMessage initWithMessagePayload:](self, "initWithMessagePayload:", v3);

  return v4;
}

+ (id)messageWithBSXPCMessage:(id)a3 ownReply:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  FBSXPCMessage *v7;
  uint64_t v8;
  BSXPCServiceConnectionMessage *reply;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("fbs_message"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FBSXPCMessage initWithMessagePayload:]([FBSXPCMessage alloc], "initWithMessagePayload:", v6);
  if (v4)
  {
    objc_msgSend(v5, "createReply");
    v8 = objc_claimAutoreleasedReturnValue();
    reply = v7->_reply;
    v7->_reply = (BSXPCServiceConnectionMessage *)v8;

  }
  return v7;
}

- (FBSXPCMessage)initWithMessagePayload:(id)a3
{
  id v5;
  FBSXPCMessage *v6;
  FBSXPCMessage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBSXPCMessage;
  v6 = -[FBSXPCMessage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_payload, a3);

  return v7;
}

+ (id)messageWithPayload:(id)a3
{
  id v3;
  FBSXPCMessage *v4;

  v3 = a3;
  v4 = -[FBSXPCMessage initWithMessagePayload:]([FBSXPCMessage alloc], "initWithMessagePayload:", v3);

  return v4;
}

- (void)initWithMessagePacker:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBSXPCMessage.m");
  v16 = 1024;
  v17 = 51;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
