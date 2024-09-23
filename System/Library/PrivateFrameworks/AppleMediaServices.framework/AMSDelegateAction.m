@implementation AMSDelegateAction

- (AMSDelegateAction)initWithIdentifier:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  AMSDelegateAction *v9;
  AMSDelegateAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSDelegateAction;
  v9 = -[AMSDelegateAction init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_parameters, a4);
  }

  return v10;
}

- (AMSDelegateAction)initWithDialogAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  AMSDelegateAction *v15;

  v4 = a3;
  objc_msgSend(v4, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", CFSTR("identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;

      if (!v12)
      {
        v13 = 0;
        goto LABEL_11;
      }
      v13 = v12;
      v11 = v7;
      v7 = v13;
    }
    else
    {
      v13 = 0;
    }

LABEL_11:
  }
  objc_msgSend(v4, "parameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AMSDelegateAction initWithIdentifier:parameters:](self, "initWithIdentifier:parameters:", v7, v14);

  return v15;
}

- (id)description
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  if (os_variant_has_internal_content())
  {
    -[AMSDelegateAction parameters](self, "parameters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "description");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("<private>");
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[AMSDelegateAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("{ id: %@, parameters: %@ }"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)actionPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDelegateAction parameters](self, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSDelegateAction parameters](self, "parameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("actionKind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[AMSDelegateAction identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("actionKind"));

  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
