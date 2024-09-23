@implementation LNAssistantContext

- (LNAssistantContext)initWithSessionIdentifier:(id)a3
{
  id v5;
  LNAssistantContext *v6;
  uint64_t v7;
  NSString *sessionIdentifier;
  LNAssistantContext *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAssistantContext.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LNAssistantContext;
  v6 = -[LNAssistantContext init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    sessionIdentifier = v6->_sessionIdentifier;
    v6->_sessionIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  -[LNAssistantContext sessionIdentifier](self, "sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSessionIdentifier:", v6);

  return v4;
}

- (id)description
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
  -[LNAssistantContext sessionIdentifier](self, "sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, sessionIdentifier: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNAssistantContext sessionIdentifier](self, "sessionIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sessionIdentifier"));

}

- (LNAssistantContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNAssistantContext *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNAssistantContext initWithSessionIdentifier:](self, "initWithSessionIdentifier:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
