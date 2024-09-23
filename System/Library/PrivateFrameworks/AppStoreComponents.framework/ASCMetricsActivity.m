@implementation ASCMetricsActivity

+ (NSDictionary)defaultFields
{
  if (defaultFields_onceToken != -1)
    dispatch_once(&defaultFields_onceToken, &__block_literal_global_16);
  return (NSDictionary *)(id)defaultFields_defaultFields;
}

void __35__ASCMetricsActivity_defaultFields__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "asc_realMainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x1E0CFDBD0]);
  objc_msgSend(v0, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithBundleIdentifier:", v2);

  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("hostApp"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("pageContext"));
  }
  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)defaultFields_defaultFields;
  defaultFields_defaultFields = v5;

}

- (ASCMetricsActivity)initWithFields:(id)a3
{
  id v4;
  ASCMetricsActivity *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *fields;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCMetricsActivity;
  v5 = -[ASCMetricsActivity init](&v10, sel_init);
  if (v5)
  {
    +[ASCMetricsActivity defaultFields](ASCMetricsActivity, "defaultFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asc_dictionaryByMergingDictionary:uniquingKeysWithBlock:", v4, &__block_literal_global_16);
    v7 = objc_claimAutoreleasedReturnValue();
    fields = v5->_fields;
    v5->_fields = (NSDictionary *)v7;

  }
  return v5;
}

id __37__ASCMetricsActivity_initWithFields___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return a4;
}

- (ASCMetricsActivity)init
{
  return -[ASCMetricsActivity initWithFields:](self, "initWithFields:", MEMORY[0x1E0C9AA70]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCMetricsActivity)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ASCMetricsActivity *v10;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("fields"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    self = -[ASCMetricsActivity initWithFields:](self, "initWithFields:", v9);
    v10 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ASCMetricsActivity initWithCoder:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCMetricsActivity fields](self, "fields");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fields"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCMetricsActivity fields](self, "fields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[ASCMetricsActivity fields](self, "fields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fields");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
      v11 = objc_msgSend(v8, "isEqual:", v9);
    else
      v11 = v8 == (void *)v9;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCMetricsActivity fields](self, "fields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v4, CFSTR("fields"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (ASCMetricsActivity)metricsActivityWithValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[ASCMetricsActivity fields](self, "fields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFields:", v9);

  return (ASCMetricsActivity *)v10;
}

- (id)metricsActivityByMergingFields:(id)a3 uniquingFieldsWithBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[ASCMetricsActivity fields](self, "fields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asc_dictionaryByMergingDictionary:uniquingKeysWithBlock:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFields:", v9);
  return v10;
}

- (id)metricsActivityByRemovingValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ASCMetricsActivity fields](self, "fields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObjectForKey:", v4);
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFields:", v6);

  return v7;
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
}

- (void)initWithCoder:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not decode ASCMetricsActivity because fields was missing", v0, 2u);
}

@end
