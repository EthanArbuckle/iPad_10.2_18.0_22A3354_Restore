@implementation LNConnectionActionResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (LNConnectionActionResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  LNConnectionActionResponse *v8;
  _OWORD v10[2];

  v4 = a3;
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], CFSTR("listenerEndpoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
    objc_msgSend(v7, "_setEndpoint:", v5);
    if (v6)
      objc_msgSend(v6, "if_auditToken");
    else
      memset(v10, 0, sizeof(v10));
    self = -[LNConnectionActionResponse initWithXPCListenerEndpoint:auditToken:](self, "initWithXPCListenerEndpoint:auditToken:", v7, v10);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (LNConnectionActionResponse)initWithXPCListenerEndpoint:(id)a3 auditToken:(id *)a4
{
  id v7;
  LNConnectionActionResponse *v8;
  LNConnectionActionResponse *v9;
  __int128 v10;
  LNConnectionActionResponse *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LNConnectionActionResponse;
  v8 = -[LNConnectionActionResponse init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_listenerEndpoint, a3);
    v10 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v9->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v9->_auditToken.val[4] = v10;
    v11 = v9;
  }

  return v9;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  -[LNConnectionActionResponse listenerEndpoint](self, "listenerEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeXPCObject:forKey:", v6, CFSTR("listenerEndpoint"));

  v7 = (void *)MEMORY[0x1E0C99D50];
  -[LNConnectionActionResponse auditToken](self, "auditToken");
  objc_msgSend(v7, "if_dataWithAuditToken:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("auditToken"));

}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)self[1].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnectionActionResponse listenerEndpoint](self, "listenerEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, listenerEndpoint: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  v5 = (void *)MEMORY[0x1E0C99D50];
  -[LNConnectionActionResponse auditToken](self, "auditToken");
  objc_msgSend(v5, "if_dataWithAuditToken:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("auditToken"));

  -[LNConnectionActionResponse listenerEndpoint](self, "listenerEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("listenerEndpoint"));

}

- (LNConnectionActionResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  LNConnectionActionResponse *v9;
  id v11;
  uint64_t v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listenerEndpoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "if_auditToken");
    self = -[LNConnectionActionResponse initWithXPCListenerEndpoint:auditToken:](self, "initWithXPCListenerEndpoint:auditToken:", v5, &v12);
    v9 = self;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
