@implementation JEDeresURLTreatmentAction

- (JEDeresURLTreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  id v6;
  JEDeresURLTreatmentAction *v7;
  void *v8;
  JEDeresURLTreatmentAction *v9;
  uint64_t v10;
  NSString *scope;
  void *v12;
  id v13;
  void *v14;
  NSDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *allowedParameters;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v29.receiver = self;
  v29.super_class = (Class)JEDeresURLTreatmentAction;
  v7 = -[JETreatmentAction initWithField:configuration:](&v29, sel_initWithField_configuration_, a3, v6);
  if (!v7)
  {
LABEL_19:
    v9 = v7;
    goto LABEL_20;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scope"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    v10 = -[JEDeresURLTreatmentAction copy](v9, "copy");
    scope = v7->_scope;
    v7->_scope = (NSString *)v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowedParams"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v13, "count"));
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = (NSDictionary *)v13;
      v16 = -[NSDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        v19 = MEMORY[0x1E0C9AA70];
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20++), (_QWORD)v25);
          }
          while (v17 != v20);
          v17 = -[NSDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v17);
      }

      v21 = objc_msgSend(v14, "copy");
      allowedParameters = v7->_allowedParameters;
      v7->_allowedParameters = (NSDictionary *)v21;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = objc_msgSend(v12, "copy");
        v15 = v7->_allowedParameters;
        v7->_allowedParameters = (NSDictionary *)v23;
      }
      else
      {
        v15 = v7->_allowedParameters;
        v7->_allowedParameters = (NSDictionary *)MEMORY[0x1E0C9AA70];
      }
    }

    goto LABEL_19;
  }
LABEL_20:

  return v9;
}

- (id)performAction:(id)a3 context:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  NSString *scope;
  uint64_t v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)JEDeresURLTreatmentAction;
  -[JETreatmentAction performAction:context:](&v24, sel_performAction_context_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      scope = self->_scope;
    else
      scope = 0;
    if (-[NSString isEqualToString:](scope, "isEqualToString:", CFSTR("hostname")))
    {
      objc_msgSend(v7, "host");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_19:
      v10 = (void *)v9;

      goto LABEL_20;
    }
    objc_msgSend(v7, "setPassword:", 0);
    objc_msgSend(v7, "setUser:", 0);
    if (self)
      v11 = self->_scope;
    else
      v11 = 0;
    v12 = v11;
    if (-[NSString isEqualToString:](v12, "isEqualToString:", CFSTR("urlWithoutParams")))
    {

    }
    else
    {
      if (self)
        v13 = self->_scope;
      else
        v13 = 0;
      v14 = -[NSString isEqualToString:](v13, "isEqualToString:", CFSTR("fullWithoutParams"));

      if (!v14)
      {
        if (self)
          v18 = self->_scope;
        else
          v18 = 0;
        v19 = v18;
        if (-[NSString isEqualToString:](v19, "isEqualToString:", CFSTR("urlWithoutPath")))
        {

        }
        else
        {
          if (self)
            v20 = self->_scope;
          else
            v20 = 0;
          v21 = -[NSString isEqualToString:](v20, "isEqualToString:", CFSTR("fullWithoutPath"));

          if (!v21)
            goto LABEL_18;
        }
        objc_msgSend(v7, "setFragment:", 0);
        objc_msgSend(v7, "queryItems");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[JEDeresURLTreatmentAction allowedQueryItemsFromItems:](self, "allowedQueryItemsFromItems:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setQueryItems:", v23);

        objc_msgSend(v7, "setPath:", 0);
LABEL_18:
        objc_msgSend(v7, "string");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
    }
    objc_msgSend(v7, "setFragment:", 0);
    objc_msgSend(v7, "queryItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[JEDeresURLTreatmentAction allowedQueryItemsFromItems:](self, "allowedQueryItemsFromItems:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQueryItems:", v16);

    goto LABEL_18;
  }
  v10 = 0;
LABEL_20:

  return v10;
}

- (id)allowedQueryItemsFromItems:(id)a3
{
  id v4;
  NSDictionary *allowedParameters;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];

  v4 = a3;
  if (self)
    allowedParameters = self->_allowedParameters;
  else
    allowedParameters = 0;
  if (-[NSDictionary count](allowedParameters, "count") && objc_msgSend(v4, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__JEDeresURLTreatmentAction_allowedQueryItemsFromItems___block_invoke;
    v11[3] = &unk_1E3DDED48;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __56__JEDeresURLTreatmentAction_allowedQueryItemsFromItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[12];
  v5 = v4;
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("allowedValues"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    if (v9)
    {
      objc_msgSend(v3, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v11);

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedParameters, 0);
  objc_storeStrong((id *)&self->_scope, 0);
}

@end
