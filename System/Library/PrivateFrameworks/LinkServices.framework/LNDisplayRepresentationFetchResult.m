@implementation LNDisplayRepresentationFetchResult

- (LNDisplayRepresentationFetchResult)initWithAction:(id)a3 displayRepresentation:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  LNDisplayRepresentationFetchResult *v11;
  uint64_t v12;
  LNAction *action;
  uint64_t v14;
  LNDisplayRepresentation *displayRepresentation;
  uint64_t v16;
  NSError *error;
  LNDisplayRepresentationFetchResult *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)LNDisplayRepresentationFetchResult;
  v11 = -[LNDisplayRepresentationFetchResult init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    action = v11->_action;
    v11->_action = (LNAction *)v12;

    v14 = objc_msgSend(v9, "copy");
    displayRepresentation = v11->_displayRepresentation;
    v11->_displayRepresentation = (LNDisplayRepresentation *)v14;

    v16 = objc_msgSend(v10, "copy");
    error = v11->_error;
    v11->_error = (NSError *)v16;

    v18 = v11;
  }

  return v11;
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
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisplayRepresentationFetchResult action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisplayRepresentationFetchResult displayRepresentation](self, "displayRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisplayRepresentationFetchResult error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, action: %@, displayRepresentation: %@, error: %@>"), v5, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNDisplayRepresentationFetchResult action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("action"));

  -[LNDisplayRepresentationFetchResult displayRepresentation](self, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayRepresentation"));

  -[LNDisplayRepresentationFetchResult error](self, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("error"));

}

- (LNDisplayRepresentationFetchResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  LNDisplayRepresentationFetchResult *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[LNDisplayRepresentationFetchResult initWithAction:displayRepresentation:error:](self, "initWithAction:displayRepresentation:error:", v5, v6, v7);
  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[LNDisplayRepresentationFetchResult action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNDisplayRepresentationFetchResult displayRepresentation](self, "displayRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNDisplayRepresentationFetchResult error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  LNDisplayRepresentationFetchResult *v4;
  LNDisplayRepresentationFetchResult *v5;
  LNDisplayRepresentationFetchResult *v6;
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

  v4 = (LNDisplayRepresentationFetchResult *)a3;
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
    -[LNDisplayRepresentationFetchResult action](self, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDisplayRepresentationFetchResult action](v6, "action");
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
    -[LNDisplayRepresentationFetchResult displayRepresentation](self, "displayRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDisplayRepresentationFetchResult displayRepresentation](v6, "displayRepresentation");
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
    -[LNDisplayRepresentationFetchResult error](self, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDisplayRepresentationFetchResult error](v6, "error");
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

- (LNAction)action
{
  return self->_action;
}

- (LNDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
