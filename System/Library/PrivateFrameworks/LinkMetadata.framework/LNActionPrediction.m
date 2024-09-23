@implementation LNActionPrediction

- (LNActionPrediction)initWithParameterIdentifiers:(id)a3 displayRepresentation:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNActionPrediction *v10;
  uint64_t v11;
  NSArray *parameterIdentifiers;
  uint64_t v13;
  LNDisplayRepresentation *displayRepresentation;
  LNActionPrediction *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionPrediction.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterIdentifiers"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionPrediction.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayRepresentation"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNActionPrediction;
  v10 = -[LNActionPrediction init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    parameterIdentifiers = v10->_parameterIdentifiers;
    v10->_parameterIdentifiers = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    displayRepresentation = v10->_displayRepresentation;
    v10->_displayRepresentation = (LNDisplayRepresentation *)v13;

    v15 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNActionPrediction parameterIdentifiers](self, "parameterIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parameterIdentifiers"));

  -[LNActionPrediction displayRepresentation](self, "displayRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayRepresentation"));

}

- (LNActionPrediction)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  LNActionPrediction *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("parameterIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayRepresentation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    self = -[LNActionPrediction initWithParameterIdentifiers:displayRepresentation:](self, "initWithParameterIdentifiers:displayRepresentation:", v8, v9);
    v11 = self;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionPrediction parameterIdentifiers](self, "parameterIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionPrediction displayRepresentation](self, "displayRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, parameterIdentifiers: %@, displayRepresentation: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNActionPrediction parameterIdentifiers](self, "parameterIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNActionPrediction displayRepresentation](self, "displayRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNActionPrediction *v4;
  LNActionPrediction *v5;
  LNActionPrediction *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (LNActionPrediction *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[LNActionPrediction parameterIdentifiers](self, "parameterIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionPrediction parameterIdentifiers](v6, "parameterIdentifiers");
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
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v12 = objc_msgSend(v9, "isEqualToArray:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[LNActionPrediction displayRepresentation](self, "displayRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionPrediction displayRepresentation](v6, "displayRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17)
        LOBYTE(v12) = objc_msgSend(v14, "isEqual:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (NSArray)parameterIdentifiers
{
  return self->_parameterIdentifiers;
}

- (LNDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_parameterIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
