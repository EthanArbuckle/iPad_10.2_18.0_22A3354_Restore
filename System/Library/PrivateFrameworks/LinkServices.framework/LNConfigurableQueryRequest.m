@implementation LNConfigurableQueryRequest

- (LNConfigurableQueryRequest)initWithQueryType:(id)a3 target:(id)a4 options:(id)a5
{
  id v10;
  id v11;
  id v12;
  LNConfigurableQueryRequest *v13;
  LNConfigurableQueryRequest *v14;
  LNQueryRequestOptions *v15;
  LNQueryRequestOptions *options;
  LNConfigurableQueryRequest *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConfigurableQueryRequest.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryType"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConfigurableQueryRequest.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)LNConfigurableQueryRequest;
  v13 = -[LNConfigurableQueryRequest init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queryType, a3);
    objc_storeStrong((id *)&v14->_target, a4);
    if (v12)
      v15 = (LNQueryRequestOptions *)v12;
    else
      v15 = objc_alloc_init(LNQueryRequestOptions);
    options = v14->_options;
    v14->_options = v15;

    v17 = v14;
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  -[LNConfigurableQueryRequest queryType](self, "queryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[LNConfigurableQueryRequest target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p, type: %@, target: %@>"), v9, self, v4, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[LNQueryRequestTypeBase hash](self->_queryType, "hash");
  v4 = -[LNQueryRequestTargetBase hash](self->_target, "hash") ^ v3;
  return v4 ^ -[LNQueryRequestOptions hash](self->_options, "hash");
}

- (BOOL)isEqual:(id)a3
{
  LNConfigurableQueryRequest *v4;
  LNConfigurableQueryRequest *v5;
  LNConfigurableQueryRequest *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (LNConfigurableQueryRequest *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[LNConfigurableQueryRequest queryType](self, "queryType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConfigurableQueryRequest queryType](v6, "queryType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_25;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[LNConfigurableQueryRequest target](self, "target");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConfigurableQueryRequest target](v6, "target");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v12 = objc_msgSend(v14, "isEqual:", v18);

      if (!v12)
        goto LABEL_25;
    }
    -[LNConfigurableQueryRequest options](self, "options");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConfigurableQueryRequest options](v6, "options");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23)
        LOBYTE(v12) = objc_msgSend(v20, "isEqual:", v23);
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNConfigurableQueryRequest queryType](self, "queryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("queryType"));

  -[LNConfigurableQueryRequest target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("target"));

  -[LNConfigurableQueryRequest options](self, "options");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("options"));

}

- (LNConfigurableQueryRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  LNConfigurableQueryRequest *v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "queryTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("queryType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "targetTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("target"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v6 && v8)
  {
    self = -[LNConfigurableQueryRequest initWithQueryType:target:options:](self, "initWithQueryType:target:options:", v6, v8, v9);
    v10 = self;
  }

  return v10;
}

- (LNQueryRequestTypeBase)queryType
{
  return self->_queryType;
}

- (LNQueryRequestTargetBase)target
{
  return self->_target;
}

- (LNQueryRequestOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_queryType, 0);
}

+ (id)queryTypes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
}

+ (id)targetTypes
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (NSSet)xpcClasses
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v10);

  objc_msgSend(a1, "targetTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v11);

  v12 = (void *)objc_msgSend(v9, "copy");
  return (NSSet *)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
