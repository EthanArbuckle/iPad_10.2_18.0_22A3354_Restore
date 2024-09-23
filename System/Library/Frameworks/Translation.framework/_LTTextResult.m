@implementation _LTTextResult

- (_LTTextResult)initWithLocalePair:(id)a3 sourceText:(id)a4 targetText:(id)a5 clientIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _LTTextResult *v15;
  _LTTextResult *v16;
  uint64_t v17;
  NSString *sourceText;
  uint64_t v19;
  NSString *targetText;
  uint64_t v21;
  NSString *clientIdentifier;
  _LTTextResult *v23;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_LTTextResult;
  v15 = -[_LTTextResult init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_localePair, a3);
    v17 = objc_msgSend(v12, "copy");
    sourceText = v16->_sourceText;
    v16->_sourceText = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    targetText = v16->_targetText;
    v16->_targetText = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    clientIdentifier = v16->_clientIdentifier;
    v16->_clientIdentifier = (NSString *)v21;

    v23 = v16;
  }

  return v16;
}

- (NSLocale)sourceLocale
{
  return -[_LTLocalePair sourceLocale](self->_localePair, "sourceLocale");
}

- (NSLocale)targetLocale
{
  return -[_LTLocalePair targetLocale](self->_localePair, "targetLocale");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_LTTextResult clientIdentifier](self, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[_LTTextResult clientIdentifier](self, "clientIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v8 = 0;
      }
      else
      {
        -[_LTTextResult clientIdentifier](self, "clientIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v11 == 0;

      }
    }

    -[_LTTextResult localePair](self, "localePair");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localePair");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", v13))
    {
      -[_LTTextResult sourceText](self, "sourceText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", v15))
      {
        -[_LTTextResult targetText](self, "targetText");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "targetText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v16, "isEqualToString:", v17) & v8;

      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[_LTTextResult localePair](self, "localePair");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_LTTextResult sourceText](self, "sourceText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[_LTTextResult targetText](self, "targetText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[_LTTextResult clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[_LTTextResult sourceText](self, "sourceText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p source: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (NSString)sourceText
{
  return self->_sourceText;
}

- (NSString)targetText
{
  return self->_targetText;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_targetText, 0);
  objc_storeStrong((id *)&self->_sourceText, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
}

@end
