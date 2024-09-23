@implementation INAppResolverOptions

- (BOOL)includeUserActivityTypes
{
  void *v2;
  void *v3;
  char v4;

  -[INAppResolverOptions dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("IncludeUserActivityTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)skipSupportedIntentsCheck
{
  void *v2;
  void *v3;
  char v4;

  -[INAppResolverOptions dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SkipSupportedIntentsCheck"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (INAppResolverOptions)initWithDictionary:(id)a3
{
  id v5;
  INAppResolverOptions *v6;
  INAppResolverOptions *v7;
  INAppResolverOptions *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INAppResolverOptions;
  v6 = -[INAppResolverOptions init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = v7;
  }

  return v7;
}

- (INAppResolverOptions)initWithCoder:(id)a3
{
  id v4;
  INAppResolverOptions *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  INAppResolverOptions *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INAppResolverOptions;
  v5 = -[INAppResolverOptions init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dictionary"));
    v6 = objc_claimAutoreleasedReturnValue();
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INAppResolverOptions dictionary](self, "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dictionary"));

}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

+ (INAppResolverOptions)optionsWithDictionary:(id)a3
{
  id v3;
  INAppResolverOptions *v4;

  v3 = a3;
  v4 = -[INAppResolverOptions initWithDictionary:]([INAppResolverOptions alloc], "initWithDictionary:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
