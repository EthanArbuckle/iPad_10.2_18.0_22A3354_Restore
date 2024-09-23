@implementation AFApplicationContextSnapshot

- (id)serializedBackingStore
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (AFApplicationContextSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFApplicationContextSnapshot *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationContexts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[AFApplicationContextSnapshot initWithApplicationContexts:](self, "initWithApplicationContexts:", v6);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (AFApplicationContextSnapshot)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFApplicationContextSnapshotMutation *);
  AFApplicationContextSnapshot *v5;
  AFApplicationContextSnapshot *v6;
  _AFApplicationContextSnapshotMutation *v7;
  void *v8;
  uint64_t v9;
  NSArray *applicationContexts;
  objc_super v12;

  v4 = (void (**)(id, _AFApplicationContextSnapshotMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFApplicationContextSnapshot;
  v5 = -[AFApplicationContextSnapshot init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFApplicationContextSnapshotMutation initWithBase:]([_AFApplicationContextSnapshotMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFApplicationContextSnapshotMutation isDirty](v7, "isDirty"))
    {
      -[_AFApplicationContextSnapshotMutation getApplicationContexts](v7, "getApplicationContexts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      applicationContexts = v6->_applicationContexts;
      v6->_applicationContexts = (NSArray *)v9;

    }
  }

  return v6;
}

- (AFApplicationContextSnapshot)init
{
  return -[AFApplicationContextSnapshot initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFApplicationContextSnapshot)initWithApplicationContexts:(id)a3
{
  id v4;
  id v5;
  AFApplicationContextSnapshot *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__AFApplicationContextSnapshot_initWithApplicationContexts___block_invoke;
  v8[3] = &unk_1E3A352D0;
  v9 = v4;
  v5 = v4;
  v6 = -[AFApplicationContextSnapshot initWithBuilder:](self, "initWithBuilder:", v8);

  return v6;
}

- (NSString)description
{
  return (NSString *)-[AFApplicationContextSnapshot _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFApplicationContextSnapshot;
  -[AFApplicationContextSnapshot description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {applicationContexts = %@}"), v5, self->_applicationContexts);

  return v6;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_applicationContexts, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AFApplicationContextSnapshot *v4;
  NSArray *v5;
  NSArray *applicationContexts;
  BOOL v7;

  v4 = (AFApplicationContextSnapshot *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AFApplicationContextSnapshot applicationContexts](v4, "applicationContexts");
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      applicationContexts = self->_applicationContexts;
      v7 = applicationContexts == v5 || -[NSArray isEqual:](applicationContexts, "isEqual:", v5);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (AFApplicationContextSnapshot)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  AFApplicationContextSnapshot *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("AFApplicationContextSnapshot::applicationContexts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AFApplicationContextSnapshot initWithApplicationContexts:](self, "initWithApplicationContexts:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_applicationContexts, CFSTR("AFApplicationContextSnapshot::applicationContexts"));
}

- (NSArray)applicationContexts
{
  return self->_applicationContexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationContexts, 0);
}

uint64_t __60__AFApplicationContextSnapshot_initWithApplicationContexts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setApplicationContexts:", *(_QWORD *)(a1 + 32));
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
  void (**v4)(id, _AFApplicationContextSnapshotMutation *);
  _AFApplicationContextSnapshotMutation *v5;
  AFApplicationContextSnapshot *v6;
  void *v7;
  uint64_t v8;
  NSArray *applicationContexts;

  v4 = (void (**)(id, _AFApplicationContextSnapshotMutation *))a3;
  if (v4)
  {
    v5 = -[_AFApplicationContextSnapshotMutation initWithBase:]([_AFApplicationContextSnapshotMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFApplicationContextSnapshotMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFApplicationContextSnapshot);
      -[_AFApplicationContextSnapshotMutation getApplicationContexts](v5, "getApplicationContexts");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      applicationContexts = v6->_applicationContexts;
      v6->_applicationContexts = (NSArray *)v8;

    }
    else
    {
      v6 = (AFApplicationContextSnapshot *)-[AFApplicationContextSnapshot copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFApplicationContextSnapshot *)-[AFApplicationContextSnapshot copy](self, "copy");
  }

  return v6;
}

@end
