@implementation HKSignedClinicalDataRegistryIssuerEntry

- (HKSignedClinicalDataRegistryIssuerEntry)initWithIdentifier:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  HKSignedClinicalDataRegistryIssuerEntry *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *title;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKSignedClinicalDataRegistryIssuerEntry;
  v8 = -[HKSignedClinicalDataRegistryIssuerEntry init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKSignedClinicalDataRegistryIssuerEntry *v6;
  HKSignedClinicalDataRegistryIssuerEntry *v7;
  HKSignedClinicalDataRegistryIssuerEntry *v8;
  NSString *identifier;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  char v13;
  NSString *title;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  void *v20;

  v6 = (HKSignedClinicalDataRegistryIssuerEntry *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    identifier = self->_identifier;
    -[HKSignedClinicalDataRegistryIssuerEntry identifier](v8, "identifier");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (identifier == v10)
      goto LABEL_9;
    -[HKSignedClinicalDataRegistryIssuerEntry identifier](v8, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v3 = (void *)v11;
    v12 = self->_identifier;
    -[HKSignedClinicalDataRegistryIssuerEntry identifier](v8, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](v12, "isEqualToString:", v4))
    {
LABEL_9:
      title = self->_title;
      -[HKSignedClinicalDataRegistryIssuerEntry title](v8, "title");
      v15 = objc_claimAutoreleasedReturnValue();
      if (title == (NSString *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HKSignedClinicalDataRegistryIssuerEntry title](v8, "title");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          v19 = self->_title;
          -[HKSignedClinicalDataRegistryIssuerEntry title](v8, "title");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NSString isEqualToString:](v19, "isEqualToString:", v20);

        }
        else
        {

          v13 = 0;
        }
      }
      if (identifier == v10)
        goto LABEL_17;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_17;
  }
  v13 = 1;
LABEL_19:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));

}

- (HKSignedClinicalDataRegistryIssuerEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKSignedClinicalDataRegistryIssuerEntry *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      self = -[HKSignedClinicalDataRegistryIssuerEntry initWithIdentifier:title:](self, "initWithIdentifier:title:", v5, v6);
      v7 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v7 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
