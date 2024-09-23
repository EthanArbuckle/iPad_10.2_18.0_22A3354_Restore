@implementation PHNetwork

+ (id)networkFromDictionary:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  PHNetwork *v6;

  if (a3)
  {
    v3 = *MEMORY[0x24BDC2BB8];
    v4 = a3;
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PHNetwork initWithName:]([PHNetwork alloc], "initWithName:", v5);
    -[PHNetwork setDictionaryRepresentation:](v6, "setDictionaryRepresentation:", v4);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (PHNetwork)init
{
  return -[PHNetwork initWithName:](self, "initWithName:", &stru_24E38CD10);
}

- (PHNetwork)initWithName:(id)a3
{
  id v5;
  PHNetwork *v6;
  PHNetwork *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHNetwork;
  v6 = -[PHNetwork init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHNetwork name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24E38CD10, CFSTR("Carrier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)code
{
  void *v3;
  void *v4;
  void *v5;

  -[PHNetwork dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PHNetwork dictionaryRepresentation](self, "dictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BDC2B90]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PHNetwork dictionaryRepresentation](self, "dictionaryRepresentation");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6
      && (v7 = (void *)v6,
          objc_msgSend(v5, "dictionaryRepresentation"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      -[PHNetwork code](self, "code");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v5, "code");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[PHNetwork code](self, "code");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "code");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PHNetwork dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[PHNetwork dictionaryRepresentation](self, "dictionaryRepresentation");
  else
    -[PHNetwork name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PHNetwork name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHNetwork code](self, "code");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PHNetwork: '%@' %@. State:%lu"), v4, v5, -[PHNetwork state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDictionaryRepresentation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
