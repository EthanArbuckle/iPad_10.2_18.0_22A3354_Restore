@implementation AFApplicationContext

- (AFApplicationContext)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFApplicationContextMutation *);
  AFApplicationContext *v5;
  AFApplicationContext *v6;
  _AFApplicationContextMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *associatedBundleIdentifier;
  void *v11;
  uint64_t v12;
  AFBulletin *bulletin;
  void *v14;
  uint64_t v15;
  AceObject *aceContext;
  void *v17;
  uint64_t v18;
  NSDictionary *contextDictionary;
  void *v20;
  uint64_t v21;
  NSArray *aceContexts;
  objc_super v24;

  v4 = (void (**)(id, _AFApplicationContextMutation *))a3;
  v24.receiver = self;
  v24.super_class = (Class)AFApplicationContext;
  v5 = -[AFApplicationContext init](&v24, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFApplicationContextMutation initWithBase:]([_AFApplicationContextMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFApplicationContextMutation isDirty](v7, "isDirty"))
    {
      -[_AFApplicationContextMutation getAssociatedBundleIdentifier](v7, "getAssociatedBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      associatedBundleIdentifier = v6->_associatedBundleIdentifier;
      v6->_associatedBundleIdentifier = (NSString *)v9;

      -[_AFApplicationContextMutation getBulletin](v7, "getBulletin");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      bulletin = v6->_bulletin;
      v6->_bulletin = (AFBulletin *)v12;

      -[_AFApplicationContextMutation getAceContext](v7, "getAceContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      aceContext = v6->_aceContext;
      v6->_aceContext = (AceObject *)v15;

      -[_AFApplicationContextMutation getContextDictionary](v7, "getContextDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      contextDictionary = v6->_contextDictionary;
      v6->_contextDictionary = (NSDictionary *)v18;

      -[_AFApplicationContextMutation getAceContexts](v7, "getAceContexts");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      aceContexts = v6->_aceContexts;
      v6->_aceContexts = (NSArray *)v21;

    }
  }

  return v6;
}

- (AFApplicationContext)init
{
  return -[AFApplicationContext initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFApplicationContext)initWithAssociatedBundleIdentifier:(id)a3 bulletin:(id)a4 aceContext:(id)a5 contextDictionary:(id)a6 aceContexts:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  AFApplicationContext *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __109__AFApplicationContext_initWithAssociatedBundleIdentifier_bulletin_aceContext_contextDictionary_aceContexts___block_invoke;
  v24[3] = &unk_1E3A34F20;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = -[AFApplicationContext initWithBuilder:](self, "initWithBuilder:", v24);

  return v22;
}

- (id)description
{
  return -[AFApplicationContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFApplicationContext;
  -[AFApplicationContext description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {associatedBundleIdentifier = %@, bulletin = %@, aceContext = %@, contextDictionary = %@, aceContexts = %@}"), v5, self->_associatedBundleIdentifier, self->_bulletin, self->_aceContext, self->_contextDictionary, self->_aceContexts);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_associatedBundleIdentifier, "hash");
  v4 = -[AFBulletin hash](self->_bulletin, "hash") ^ v3;
  v5 = -[AceObject hash](self->_aceContext, "hash");
  v6 = v4 ^ v5 ^ -[NSDictionary hash](self->_contextDictionary, "hash");
  return v6 ^ -[NSArray hash](self->_aceContexts, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AFApplicationContext *v4;
  AFApplicationContext *v5;
  NSString *v6;
  NSString *associatedBundleIdentifier;
  AFBulletin *v8;
  AFBulletin *bulletin;
  AceObject *v10;
  AceObject *aceContext;
  NSDictionary *v12;
  NSDictionary *contextDictionary;
  NSArray *v14;
  NSArray *aceContexts;
  BOOL v16;

  v4 = (AFApplicationContext *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AFApplicationContext associatedBundleIdentifier](v5, "associatedBundleIdentifier");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      associatedBundleIdentifier = self->_associatedBundleIdentifier;
      if (associatedBundleIdentifier == v6
        || -[NSString isEqual:](associatedBundleIdentifier, "isEqual:", v6))
      {
        -[AFApplicationContext bulletin](v5, "bulletin");
        v8 = (AFBulletin *)objc_claimAutoreleasedReturnValue();
        bulletin = self->_bulletin;
        if (bulletin == v8 || -[AFBulletin isEqual:](bulletin, "isEqual:", v8))
        {
          -[AFApplicationContext aceContext](v5, "aceContext");
          v10 = (AceObject *)objc_claimAutoreleasedReturnValue();
          aceContext = self->_aceContext;
          if (aceContext == v10 || -[AceObject isEqual:](aceContext, "isEqual:", v10))
          {
            -[AFApplicationContext contextDictionary](v5, "contextDictionary");
            v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            contextDictionary = self->_contextDictionary;
            if (contextDictionary == v12 || -[NSDictionary isEqual:](contextDictionary, "isEqual:", v12))
            {
              -[AFApplicationContext aceContexts](v5, "aceContexts");
              v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
              aceContexts = self->_aceContexts;
              v16 = aceContexts == v14 || -[NSArray isEqual:](aceContexts, "isEqual:", v14);

            }
            else
            {
              v16 = 0;
            }

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (AFApplicationContext)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  AFApplicationContext *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFApplicationContext::associatedBundleIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFApplicationContext::bulletin"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFApplicationContext::aceContext"));
  v4 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0C99E60];
  v23 = (void *)v4;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("AFApplicationContext::contextDictionary"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v18, CFSTR("AFApplicationContext::aceContexts"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[AFApplicationContext initWithAssociatedBundleIdentifier:bulletin:aceContext:contextDictionary:aceContexts:](self, "initWithAssociatedBundleIdentifier:bulletin:aceContext:contextDictionary:aceContexts:", v25, v24, v23, v15, v19);
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *associatedBundleIdentifier;
  id v5;

  associatedBundleIdentifier = self->_associatedBundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", associatedBundleIdentifier, CFSTR("AFApplicationContext::associatedBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bulletin, CFSTR("AFApplicationContext::bulletin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_aceContext, CFSTR("AFApplicationContext::aceContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextDictionary, CFSTR("AFApplicationContext::contextDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_aceContexts, CFSTR("AFApplicationContext::aceContexts"));

}

- (NSString)associatedBundleIdentifier
{
  return self->_associatedBundleIdentifier;
}

- (AFBulletin)bulletin
{
  return self->_bulletin;
}

- (AceObject)aceContext
{
  return self->_aceContext;
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (NSArray)aceContexts
{
  return self->_aceContexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceContexts, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
  objc_storeStrong((id *)&self->_aceContext, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifier, 0);
}

void __109__AFApplicationContext_initWithAssociatedBundleIdentifier_bulletin_aceContext_contextDictionary_aceContexts___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setAssociatedBundleIdentifier:", v3);
  objc_msgSend(v4, "setBulletin:", a1[5]);
  objc_msgSend(v4, "setAceContext:", a1[6]);
  objc_msgSend(v4, "setContextDictionary:", a1[7]);
  objc_msgSend(v4, "setAceContexts:", a1[8]);

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFApplicationContextMutation *);
  _AFApplicationContextMutation *v5;
  AFApplicationContext *v6;
  void *v7;
  uint64_t v8;
  NSString *associatedBundleIdentifier;
  void *v10;
  uint64_t v11;
  AFBulletin *bulletin;
  void *v13;
  uint64_t v14;
  AceObject *aceContext;
  void *v16;
  uint64_t v17;
  NSDictionary *contextDictionary;
  void *v19;
  uint64_t v20;
  NSArray *aceContexts;

  v4 = (void (**)(id, _AFApplicationContextMutation *))a3;
  if (v4)
  {
    v5 = -[_AFApplicationContextMutation initWithBase:]([_AFApplicationContextMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFApplicationContextMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFApplicationContext);
      -[_AFApplicationContextMutation getAssociatedBundleIdentifier](v5, "getAssociatedBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      associatedBundleIdentifier = v6->_associatedBundleIdentifier;
      v6->_associatedBundleIdentifier = (NSString *)v8;

      -[_AFApplicationContextMutation getBulletin](v5, "getBulletin");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      bulletin = v6->_bulletin;
      v6->_bulletin = (AFBulletin *)v11;

      -[_AFApplicationContextMutation getAceContext](v5, "getAceContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      aceContext = v6->_aceContext;
      v6->_aceContext = (AceObject *)v14;

      -[_AFApplicationContextMutation getContextDictionary](v5, "getContextDictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      contextDictionary = v6->_contextDictionary;
      v6->_contextDictionary = (NSDictionary *)v17;

      -[_AFApplicationContextMutation getAceContexts](v5, "getAceContexts");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      aceContexts = v6->_aceContexts;
      v6->_aceContexts = (NSArray *)v20;

    }
    else
    {
      v6 = (AFApplicationContext *)-[AFApplicationContext copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFApplicationContext *)-[AFApplicationContext copy](self, "copy");
  }

  return v6;
}

@end
