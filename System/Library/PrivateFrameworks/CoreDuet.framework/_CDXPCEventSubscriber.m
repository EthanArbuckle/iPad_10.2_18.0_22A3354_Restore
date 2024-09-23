@implementation _CDXPCEventSubscriber

- (_CDXPCEventSubscriber)initWithToken:(unint64_t)a3 descriptor:(id)a4 userID:(unsigned int)a5 streamName:(id)a6
{
  id v11;
  id v12;
  _CDXPCEventSubscriber *v13;
  _CDXPCEventSubscriber *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_CDXPCEventSubscriber;
  v13 = -[_CDXPCEventSubscriber init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_token = a3;
    objc_storeStrong((id *)&v13->_descriptor, a4);
    v14->_uid = a5;
    objc_storeStrong((id *)&v14->_streamName, a6);
  }

  return v14;
}

- (NSString)clientIdentifier
{
  OS_xpc_object *descriptor;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *string_ptr;

  descriptor = self->_descriptor;
  if (descriptor)
  {
    xpc_dictionary_get_value(descriptor, "client-identifier");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3 && MEMORY[0x193FEEFF8](v3) == MEMORY[0x1E0C81390] && (string_ptr = xpc_string_get_string_ptr(v4)) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string_ptr);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
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
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  _CDXPCEventSubscriber *v4;
  unint64_t token;
  BOOL v6;

  v4 = (_CDXPCEventSubscriber *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      token = self->_token;
      v6 = token == -[_CDXPCEventSubscriber token](v4, "token");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_token;
}

- (id)description
{
  OS_xpc_object *v3;
  OS_xpc_object *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *streamName;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  void *v16;

  v3 = self->_descriptor;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x193FEEEB4](v3);
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_opt_class();
    streamName = self->_streamName;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_token);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_uid);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<<%@: %p>: { streamName=%@, token=%@, uid=%@, descriptor=%s"), v7, self, streamName, v9, v10, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      free(v5);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_opt_class();
    v14 = self->_streamName;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_token);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_uid);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("<<%@: %p>: { streamName=%@, token=%@, uid=%@"), v13, self, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (unint64_t)token
{
  return self->_token;
}

- (OS_xpc_object)descriptor
{
  return self->_descriptor;
}

- (unsigned)uid
{
  return self->_uid;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
