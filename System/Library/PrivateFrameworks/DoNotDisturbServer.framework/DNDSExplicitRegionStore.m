@implementation DNDSExplicitRegionStore

- (DNDSExplicitRegionStore)init
{
  return (DNDSExplicitRegionStore *)-[DNDSExplicitRegionStore _initWithStore:](self, "_initWithStore:", 0);
}

- (id)_initWithStore:(id)a3
{
  id v4;
  DNDSExplicitRegionStore *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  NSSet *enteredRegionIdentifiersPendingExit;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DNDSExplicitRegionStore;
  v5 = -[DNDSExplicitRegionStore init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "enteredRegionIdentifiersPendingExit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    enteredRegionIdentifiersPendingExit = v5->_enteredRegionIdentifiersPendingExit;
    v5->_enteredRegionIdentifiersPendingExit = v9;

  }
  return v5;
}

- (id)_initWithEnteredRegionIdentifiersPendingExit:(id)a3
{
  id v5;
  DNDSExplicitRegionStore *v6;
  DNDSExplicitRegionStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSExplicitRegionStore;
  v6 = -[DNDSExplicitRegionStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_enteredRegionIdentifiersPendingExit, a3);

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DNDSExplicitRegionStore enteredRegionIdentifiersPendingExit](self, "enteredRegionIdentifiersPendingExit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDSExplicitRegionStore *v4;
  DNDSExplicitRegionStore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (DNDSExplicitRegionStore *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSExplicitRegionStore enteredRegionIdentifiersPendingExit](self, "enteredRegionIdentifiersPendingExit");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSExplicitRegionStore enteredRegionIdentifiersPendingExit](v5, "enteredRegionIdentifiersPendingExit");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[DNDSExplicitRegionStore enteredRegionIdentifiersPendingExit](self, "enteredRegionIdentifiersPendingExit");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[DNDSExplicitRegionStore enteredRegionIdentifiersPendingExit](v5, "enteredRegionIdentifiersPendingExit");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDSExplicitRegionStore enteredRegionIdentifiersPendingExit](self, "enteredRegionIdentifiersPendingExit");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSExplicitRegionStore enteredRegionIdentifiersPendingExit](v5, "enteredRegionIdentifiersPendingExit");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqual:", v11);

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSExplicitRegionStore enteredRegionIdentifiersPendingExit](self, "enteredRegionIdentifiersPendingExit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; enteredRegionIdentifiersPendingExit: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSExplicitRegionStore _initWithStore:]([DNDSMutableExplicitRegionStore alloc], "_initWithStore:", self);
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("enteredRegionIdentifiersPendingExit"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "_initWithEnteredRegionIdentifiersPendingExit:", v10);

  return v11;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](self->_enteredRegionIdentifiersPendingExit, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("enteredRegionIdentifiersPendingExit"));

  return v4;
}

- (NSSet)enteredRegionIdentifiersPendingExit
{
  return self->_enteredRegionIdentifiersPendingExit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enteredRegionIdentifiersPendingExit, 0);
}

@end
