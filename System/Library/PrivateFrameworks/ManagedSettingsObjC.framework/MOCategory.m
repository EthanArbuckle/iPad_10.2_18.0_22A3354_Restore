@implementation MOCategory

- (id)persistableValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[MOCategory identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MOCategory identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

+ (id)initializeWithPersistableValue:(id)a3
{
  id v3;
  void *v4;
  MOCategory *v5;

  v3 = a3;
  if (+[MOCategory isValidPersistableRepresentation:](MOCategory, "isValidPersistableRepresentation:", v3))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MOCategory initWithIdentifier:]([MOCategory alloc], "initWithIdentifier:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isValidPersistableRepresentation:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MOCategory)initWithIdentifier:(id)a3
{
  id v5;
  MOCategory *v6;
  MOCategory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOCategory;
  v6 = -[MOCategory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

+ (MOCategory)all
{
  return (MOCategory *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:", CFSTR("all"));
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOCategory *v5;
  MOCategory *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = (MOCategory *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[MOCategory identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 || (-[MOCategory identifier](v6, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[MOCategory identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOCategory identifier](v6, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if (v7)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        v10 = 1;
      }

      goto LABEL_11;
    }
    v10 = 0;
  }
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MOCategory identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MOCategory identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithIdentifier:", v6);

  return v7;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
