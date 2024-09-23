@implementation LNActionSummaryString

- (NSString)formatString
{
  return self->_formatString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterIdentifiers, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
}

- (LNActionSummaryString)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  LNActionSummaryString *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formatString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("parameterIdentifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      self = -[LNActionSummaryString initWithFormatString:parameterIdentifiers:](self, "initWithFormatString:parameterIdentifiers:", v5, v9);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (LNActionSummaryString)initWithFormatString:(id)a3 parameterIdentifiers:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNActionSummaryString *v10;
  uint64_t v11;
  NSString *formatString;
  uint64_t v13;
  NSArray *parameterIdentifiers;
  LNActionSummaryString *v15;
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
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionSummaryString.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("formatString"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionSummaryString.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterIdentifiers"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNActionSummaryString;
  v10 = -[LNActionSummaryString init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    formatString = v10->_formatString;
    v10->_formatString = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    parameterIdentifiers = v10->_parameterIdentifiers;
    v10->_parameterIdentifiers = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNActionSummaryString formatString](self, "formatString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("formatString"));

  -[LNActionSummaryString parameterIdentifiers](self, "parameterIdentifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameterIdentifiers"));

}

- (NSArray)parameterIdentifiers
{
  return self->_parameterIdentifiers;
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
  -[LNActionSummaryString formatString](self, "formatString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionSummaryString parameterIdentifiers](self, "parameterIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("description"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, formatString: %@, parameterIdentifiers: [%@]>"), v5, self, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNActionSummaryString formatString](self, "formatString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNActionSummaryString parameterIdentifiers](self, "parameterIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNActionSummaryString *v4;
  LNActionSummaryString *v5;
  LNActionSummaryString *v6;
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

  v4 = (LNActionSummaryString *)a3;
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
    -[LNActionSummaryString formatString](self, "formatString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionSummaryString formatString](v6, "formatString");
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
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[LNActionSummaryString parameterIdentifiers](self, "parameterIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionSummaryString parameterIdentifiers](v6, "parameterIdentifiers");
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
        LOBYTE(v12) = objc_msgSend(v14, "isEqualToArray:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

@end
