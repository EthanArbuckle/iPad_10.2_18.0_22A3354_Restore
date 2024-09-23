@implementation DNDSModeAssertionInvalidationDetailsRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  id v5;
  DNDSModeAssertionInvalidationDetailsRecord *v6;
  void *v7;

  if (a3)
  {
    v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionInvalidationDetailsRecord);
    objc_msgSend(v5, "bs_safeStringForKey:", a4->var6.var0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSModeAssertionInvalidationDetailsRecord setIdentifier:](v6, "setIdentifier:", v7);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionInvalidationDetailsRecord identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_setSafeObject:forKey:", v7, a3->var6.var0);

  return v6;
}

+ (id)recordForInvalidationDetails:(id)a3
{
  id v3;
  DNDSModeAssertionInvalidationDetailsRecord *v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DNDSModeAssertionInvalidationDetailsRecord);
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSModeAssertionInvalidationDetailsRecord setIdentifier:](v4, "setIdentifier:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)object
{
  void *v2;
  id v3;

  -[DNDSModeAssertionInvalidationDetailsRecord identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D1D700]);
    objc_msgSend(v3, "setIdentifier:", v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
