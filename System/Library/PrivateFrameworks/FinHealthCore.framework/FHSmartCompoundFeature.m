@implementation FHSmartCompoundFeature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *compoundFeatureKey;
  id v5;

  compoundFeatureKey = self->_compoundFeatureKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", compoundFeatureKey, CFSTR("compoundFeature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rankedValues, CFSTR("rankedValues"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locale, CFSTR("locale"));

}

- (FHSmartCompoundFeature)initWithCoder:(id)a3
{
  id v4;
  FHSmartCompoundFeature *v5;
  uint64_t v6;
  NSString *compoundFeatureKey;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *rankedValues;
  uint64_t v13;
  NSString *locale;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FHSmartCompoundFeature;
  v5 = -[FHSmartCompoundFeature init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compoundFeature"));
    v6 = objc_claimAutoreleasedReturnValue();
    compoundFeatureKey = v5->_compoundFeatureKey;
    v5->_compoundFeatureKey = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("rankedValues"));
    v11 = objc_claimAutoreleasedReturnValue();
    rankedValues = v5->_rankedValues;
    v5->_rankedValues = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v13 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSString *)v13;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[FHSmartCompoundFeature compoundFeatureKey](self, "compoundFeatureKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[FHSmartCompoundFeature rankedValues](self, "rankedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[FHSmartCompoundFeature locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6 + 29791;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  FHSmartCompoundFeature *v4;
  FHSmartCompoundFeature *v5;
  NSString *compoundFeatureKey;
  void *v7;
  NSArray *rankedValues;
  void *v9;
  NSString *locale;
  void *v11;
  char v12;

  v4 = (FHSmartCompoundFeature *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    compoundFeatureKey = self->_compoundFeatureKey;
    -[FHSmartCompoundFeature compoundFeatureKey](v5, "compoundFeatureKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](compoundFeatureKey, "isEqual:", v7))
    {
      rankedValues = self->_rankedValues;
      -[FHSmartCompoundFeature rankedValues](v5, "rankedValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSArray isEqual:](rankedValues, "isEqual:", v9))
      {
        locale = self->_locale;
        -[FHSmartCompoundFeature locale](v5, "locale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSString isEqual:](locale, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (FHSmartCompoundFeature)initWithCompoundFeatureKey:(id)a3 smartCompoundFeatures:(id)a4 locale:(id)a5
{
  id v9;
  id v10;
  id v11;
  FHSmartCompoundFeature *v12;
  FHSmartCompoundFeature *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FHSmartCompoundFeature;
  v12 = -[FHSmartCompoundFeature init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_compoundFeatureKey, a3);
    objc_storeStrong((id *)&v13->_rankedValues, a4);
    objc_storeStrong((id *)&v13->_locale, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("compoundFeature"), self->_compoundFeatureKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("locale"), self->_locale);
  -[NSArray description](self->_rankedValues, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("rankedValues"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)compoundFeatureKey
{
  return self->_compoundFeatureKey;
}

- (NSArray)rankedValues
{
  return self->_rankedValues;
}

- (NSString)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_rankedValues, 0);
  objc_storeStrong((id *)&self->_compoundFeatureKey, 0);
}

@end
