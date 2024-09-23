@implementation VNRequestSpecifierEquivalenciesRegistrar

- (VNRequestSpecifierEquivalenciesRegistrar)init
{
  VNRequestSpecifierEquivalenciesRegistrar *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *equivalenciesLookup;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNRequestSpecifierEquivalenciesRegistrar;
  v2 = -[VNRequestSpecifierEquivalenciesRegistrar init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    equivalenciesLookup = v2->_equivalenciesLookup;
    v2->_equivalenciesLookup = v3;

  }
  return v2;
}

- (BOOL)isRequestSpecifier:(id)a3 equivalentToRequestSpecifier:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_equivalenciesLookup, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v8 = objc_msgSend(v9, "containsObject:", v7);
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_equivalenciesLookup, "objectForKeyedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        v8 = objc_msgSend(v11, "containsObject:", v6);
      else
        v8 = 0;

    }
  }

  return v8;
}

- (id)equivalenciesForRequestSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_equivalenciesLookup, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (BOOL)registerRequestClass:(Class)a3 revision:(unint64_t)a4 equivalencyToRevision:(unint64_t)a5 error:(id *)a6
{
  Class v10;
  void *v11;
  void *v12;
  BOOL v13;

  v10 = VNRequestClassFromClientSubclass(a3);
  +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", v10, a4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", v10, a5, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = -[VNRequestSpecifierEquivalenciesRegistrar registerRequestSpecifier:equivalencyToRequestSpecifier:error:](self, "registerRequestSpecifier:equivalencyToRequestSpecifier:error:", v11, v12, a6);
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)registerRequestClassName:(id)a3 revision:(unint64_t)a4 equivalencyToRevision:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  BOOL v13;

  v10 = a3;
  +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", v10, a4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", v10, a5, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = -[VNRequestSpecifierEquivalenciesRegistrar registerRequestSpecifier:equivalencyToRequestSpecifier:error:](self, "registerRequestSpecifier:equivalencyToRequestSpecifier:error:", v11, v12, a6);
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)registerRequestClassName:(id)a3 revision:(unint64_t)a4 equivalencyToRequestClassName:(id)a5 revision:(unint64_t)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  BOOL v15;

  v12 = a5;
  +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", a3, a4, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", v12, a6, a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = -[VNRequestSpecifierEquivalenciesRegistrar registerRequestSpecifier:equivalencyToRequestSpecifier:error:](self, "registerRequestSpecifier:equivalencyToRequestSpecifier:error:", v13, v14, a7);
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)registerRequestSpecifier:(id)a3 equivalencyToRequestSpecifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *equivalenciesLookup;
  void *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_equivalenciesLookup, "objectForKeyedSubscript:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_equivalenciesLookup, "objectForKeyedSubscript:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (!(v10 | v11))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v8, v9, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_equivalenciesLookup, "setObject:forKeyedSubscript:", v13, v8);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_equivalenciesLookup, "setObject:forKeyedSubscript:", v13, v9);

      goto LABEL_13;
    }
    if (v10)
    {
      if (v11)
      {
        if (v10 != v11)
        {
          if (a5)
          {
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unbalanced equivalencies lookup:\n%@: %@\n%@: %@"), v8, v10, v9, v11);
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v14);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

            LOBYTE(a5) = 0;
          }
          goto LABEL_14;
        }
LABEL_13:
        LOBYTE(a5) = 1;
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend((id)v10, "addObject:", v9);
      equivalenciesLookup = self->_equivalenciesLookup;
      v16 = (void *)v10;
      v17 = v9;
    }
    else
    {
      objc_msgSend((id)v11, "addObject:", v8);
      equivalenciesLookup = self->_equivalenciesLookup;
      v16 = v12;
      v17 = v8;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](equivalenciesLookup, "setObject:forKeyedSubscript:", v16, v17);
    goto LABEL_13;
  }
  LOBYTE(a5) = 1;
LABEL_15:

  return (char)a5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_equivalenciesLookup, 0);
}

@end
