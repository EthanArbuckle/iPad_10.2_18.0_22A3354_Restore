@implementation LNSuggestedAction

- (LNSuggestedAction)initWithAction:(id)a3 systemProtocol:(id)a4 dialogParameters:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNSuggestedAction *v12;
  LNSuggestedAction *v13;
  uint64_t v14;
  NSDictionary *dialogParameters;
  LNSuggestedAction *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)LNSuggestedAction;
  v12 = -[LNSuggestedAction init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_action, a3);
    objc_storeStrong((id *)&v13->_systemProtocol, a4);
    v14 = objc_msgSend(v11, "copy");
    dialogParameters = v13->_dialogParameters;
    v13->_dialogParameters = (NSDictionary *)v14;

    v16 = v13;
  }

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSuggestedAction action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSuggestedAction systemProtocol](self, "systemProtocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSuggestedAction dialogParameters](self, "dialogParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, action: %@, systemProtocol: %@, dialogParameters: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (LNSuggestedAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  LNSuggestedAction *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemProtocol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("dialogParameters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[LNSuggestedAction initWithAction:systemProtocol:dialogParameters:](self, "initWithAction:systemProtocol:dialogParameters:", v5, v6, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNSuggestedAction action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("action"));

  -[LNSuggestedAction systemProtocol](self, "systemProtocol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("systemProtocol"));

  -[LNSuggestedAction dialogParameters](self, "dialogParameters");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("dialogParameters"));

}

- (LNAction)action
{
  return self->_action;
}

- (LNSystemProtocol)systemProtocol
{
  return self->_systemProtocol;
}

- (NSDictionary)dialogParameters
{
  return self->_dialogParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogParameters, 0);
  objc_storeStrong((id *)&self->_systemProtocol, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
