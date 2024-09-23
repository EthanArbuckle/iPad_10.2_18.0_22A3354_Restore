@implementation HKHealthStoreIdentifier

- (HKHealthStoreIdentifier)initWithIdentifier:(id)a3
{
  id v4;
  HKHealthStoreIdentifier *v5;
  uint64_t v6;
  NSUUID *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHealthStoreIdentifier;
  v5 = -[HKHealthStoreIdentifier init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

  }
  return v5;
}

- (id)initPrimaryStoreIdentifier
{
  HKHealthStoreIdentifier *v2;
  HKHealthStoreIdentifier *v3;
  NSUUID *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKHealthStoreIdentifier;
  v2 = -[HKHealthStoreIdentifier init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = 0;

  }
  return v3;
}

+ (id)primaryStoreIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HKHealthStoreIdentifier_primaryStoreIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (primaryStoreIdentifier_onceToken != -1)
    dispatch_once(&primaryStoreIdentifier_onceToken, block);
  return (id)primaryStoreIdentifier__primaryIdentifier;
}

void __49__HKHealthStoreIdentifier_primaryStoreIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initPrimaryStoreIdentifier");
  v2 = (void *)primaryStoreIdentifier__primaryIdentifier;
  primaryStoreIdentifier__primaryIdentifier = v1;

}

- (BOOL)isPrimaryStoreIdentifier
{
  return self->_identifier == 0;
}

- (BOOL)isEqual:(id)a3
{
  HKHealthStoreIdentifier *v4;
  HKHealthStoreIdentifier *v5;
  HKHealthStoreIdentifier *v6;
  BOOL v7;
  BOOL v8;
  char v9;
  NSUUID *identifier;
  void *v11;

  v4 = (HKHealthStoreIdentifier *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[HKHealthStoreIdentifier isPrimaryStoreIdentifier](self, "isPrimaryStoreIdentifier");
    v8 = -[HKHealthStoreIdentifier isPrimaryStoreIdentifier](v6, "isPrimaryStoreIdentifier");
    v9 = v7 && v8;
    if (!v7 && !v8)
    {
      identifier = self->_identifier;
      -[HKHealthStoreIdentifier identifier](v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSUUID isEqual:](identifier, "isEqual:", v11);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUUID *identifier;

  identifier = self->_identifier;
  if (identifier)
    return -[NSUUID hash](identifier, "hash");
  else
    return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5;
  objc_class *v6;

  v5 = -[HKHealthStoreIdentifier isPrimaryStoreIdentifier](self, "isPrimaryStoreIdentifier");
  v6 = (objc_class *)objc_opt_class();
  if (v5)
    return (id)objc_msgSend([v6 alloc], "initPrimaryStoreIdentifier");
  else
    return -[objc_class initWithIdentifier:](-[objc_class allocWithZone:](v6, "allocWithZone:", a3), "initWithIdentifier:", self->_identifier);
}

- (HKProfileIdentifier)profileIdentifier
{
  if (-[HKHealthStoreIdentifier isPrimaryStoreIdentifier](self, "isPrimaryStoreIdentifier"))
    +[HKProfileIdentifier primaryProfile](HKProfileIdentifier, "primaryProfile");
  else
    +[HKProfileIdentifier _profileWithUUID:type:](HKProfileIdentifier, "_profileWithUUID:type:", self->_identifier, 2);
  return (HKProfileIdentifier *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)identifierFromProfileIdentifier:(id)a3
{
  id v3;
  HKHealthStoreIdentifier *v4;
  HKHealthStoreIdentifier *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 1)
  {
    +[HKHealthStoreIdentifier primaryStoreIdentifier](HKHealthStoreIdentifier, "primaryStoreIdentifier");
    v4 = (HKHealthStoreIdentifier *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = [HKHealthStoreIdentifier alloc];
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[HKHealthStoreIdentifier initWithIdentifier:](v5, "initWithIdentifier:", v6);

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKHealthStoreIdentifier)initWithCoder:(id)a3
{
  id v4;
  int v5;
  void *v6;
  HKHealthStoreIdentifier *v7;
  HKHealthStoreIdentifier *v8;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_primary_store_identifier"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[HKHealthStoreIdentifier primaryStoreIdentifier](HKHealthStoreIdentifier, "primaryStoreIdentifier");
    v7 = (HKHealthStoreIdentifier *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v7;
    goto LABEL_6;
  }
  if (v6)
  {
    v7 = -[HKHealthStoreIdentifier initWithIdentifier:](self, "initWithIdentifier:", v6);
    self = v7;
    goto LABEL_5;
  }
  _HKInitializeLogging();
  v10 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
    -[HKHealthStoreIdentifier initWithCoder:].cold.1(v10);
  v8 = 0;
LABEL_6:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[HKHealthStoreIdentifier isPrimaryStoreIdentifier](self, "isPrimaryStoreIdentifier"), CFSTR("is_primary_store_identifier"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));

}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v3 = 138412290;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_error_impl(&dword_19A0E6000, v1, OS_LOG_TYPE_ERROR, "Asked to decode an %@ with no UUID; returning nil",
    (uint8_t *)&v3,
    0xCu);

}

@end
