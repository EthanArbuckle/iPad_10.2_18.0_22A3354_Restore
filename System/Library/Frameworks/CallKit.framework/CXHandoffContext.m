@implementation CXHandoffContext

- (CXHandoffContext)initWithHandoffIdentifier:(id)a3
{
  id v5;
  CXHandoffContext *v6;
  CXHandoffContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CXHandoffContext;
  v6 = -[CXHandoffContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_handoffIdentifier, a3);

  return v7;
}

- (CXHandoffContext)init
{

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXHandoffContext handoffIdentifier](self, "handoffIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" handoffIdentifier=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" isOutgoing=%d"), -[CXHandoffContext isOutgoing](self, "isOutgoing"));
  -[CXHandoffContext remoteHandle](self, "remoteHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" remoteHandle=%@"), v5);

  -[CXHandoffContext context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" context=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CXHandoffContext)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CXHandoffContext *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CXHandle *v13;
  CXHandle *remoteHandle;
  void *v15;
  uint64_t v16;
  NSDictionary *context;

  v4 = a3;
  NSStringFromSelector(sel_handoffIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CXHandoffContext initWithHandoffIdentifier:](self, "initWithHandoffIdentifier:", v6);

  if (v7)
  {
    NSStringFromSelector(sel_isOutgoing);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_outgoing = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("remoteHandleType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("remoteHandleValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CXHandle initWithType:value:]([CXHandle alloc], "initWithType:value:", v11, v12);
    remoteHandle = v7->_remoteHandle;
    v7->_remoteHandle = v13;

    NSStringFromSelector(sel_context);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    context = v7->_context;
    v7->_context = (NSDictionary *)v16;

  }
  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXHandoffContext handoffIdentifier](self, "handoffIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handoffIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CXHandoffContext isOutgoing](self, "isOutgoing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isOutgoing);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[CXHandoffContext remoteHandle](self, "remoteHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("remoteHandleType"));

  -[CXHandoffContext remoteHandle](self, "remoteHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("remoteHandleValue"));

  -[CXHandoffContext context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_context);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v14);

  v15 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXHandoffContext)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CXHandoffContext *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  CXHandle *remoteHandle;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *context;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_handoffIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CXHandoffContext initWithHandoffIdentifier:](self, "initWithHandoffIdentifier:", v7);

  if (v8)
  {
    NSStringFromSelector(sel_isOutgoing);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_outgoing = objc_msgSend(v4, "decodeBoolForKey:", v9);

    v10 = objc_opt_class();
    NSStringFromSelector(sel_remoteHandle);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    remoteHandle = v8->_remoteHandle;
    v8->_remoteHandle = (CXHandle *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_context);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    context = v8->_context;
    v8->_context = (NSDictionary *)v22;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[CXHandoffContext handoffIdentifier](self, "handoffIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handoffIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[CXHandoffContext isOutgoing](self, "isOutgoing");
  NSStringFromSelector(sel_isOutgoing);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  -[CXHandoffContext remoteHandle](self, "remoteHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_remoteHandle);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[CXHandoffContext context](self, "context");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_context);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, v11);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CXHandoffContext isEqualToHandoffContext:](self, "isEqualToHandoffContext:", v4);

  return v5;
}

- (BOOL)isEqualToHandoffContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  int v12;

  v4 = a3;
  -[CXHandoffContext handoffIdentifier](self, "handoffIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handoffIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CXHandoffContext remoteHandle](self, "remoteHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 | v8 && !objc_msgSend((id)v7, "isEqual:", v8))
    {
      LOBYTE(v12) = 0;
    }
    else
    {
      -[CXHandoffContext context](self, "context");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v9 | v10 && !objc_msgSend((id)v9, "isEqual:", v10))
      {
        LOBYTE(v12) = 0;
      }
      else
      {
        v11 = -[CXHandoffContext isOutgoing](self, "isOutgoing");
        v12 = v11 ^ objc_msgSend(v4, "isOutgoing") ^ 1;
      }

    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  unint64_t v11;

  -[CXHandoffContext handoffIdentifier](self, "handoffIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CXHandoffContext remoteHandle](self, "remoteHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CXHandoffContext context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  v9 = -[CXHandoffContext isOutgoing](self, "isOutgoing");
  v10 = 1237;
  if (v9)
    v10 = 1231;
  v11 = v8 ^ v10;

  return v11;
}

- (NSString)handoffIdentifier
{
  return self->_handoffIdentifier;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (void)setOutgoing:(BOOL)a3
{
  self->_outgoing = a3;
}

- (CXHandle)remoteHandle
{
  return self->_remoteHandle;
}

- (void)setRemoteHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_remoteHandle, 0);
  objc_storeStrong((id *)&self->_handoffIdentifier, 0);
}

@end
