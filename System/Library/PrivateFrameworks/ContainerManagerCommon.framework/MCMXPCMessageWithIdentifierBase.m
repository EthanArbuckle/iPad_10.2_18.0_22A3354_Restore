@implementation MCMXPCMessageWithIdentifierBase

- (MCMXPCMessageWithIdentifierBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  MCMXPCMessageWithIdentifierBase *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *identifier;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MCMXPCMessageWithIdentifierBase;
  v10 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v17, sel_initWithXPCObject_context_error_, v8, v9, a5);
  if (v10)
  {
    objc_msgSend(v9, "clientIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "codeSignInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMXPCMessageBase identifierFromXPCObject:elseClientIdentifier:](v10, "identifierFromXPCObject:elseClientIdentifier:", v8, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v14;

  }
  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
