@implementation MLArrayDictionaryFeatureProvider

- (MLArrayDictionaryFeatureProvider)initWithDictionaryFeatureProviderArray:(id)a3
{
  id v5;
  MLArrayDictionaryFeatureProvider *v6;
  MLArrayDictionaryFeatureProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLArrayDictionaryFeatureProvider;
  v6 = -[MLArrayDictionaryFeatureProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_array, a3);

  return v7;
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[MLArrayDictionaryFeatureProvider array](self, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)featuresAtIndex:(int64_t)a3
{
  int64_t v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (a3 < 0)
  {
    -[MLArrayDictionaryFeatureProvider array](self, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 += objc_msgSend(v5, "count");

  }
  -[MLArrayDictionaryFeatureProvider array](self, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MLArrayDictionaryFeatureProvider array](self, "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("array"));

}

- (MLArrayDictionaryFeatureProvider)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MLArrayDictionaryFeatureProvider *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v12[5] = objc_opt_class();
  v12[6] = objc_opt_class();
  v12[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(v5, "allowedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v8);

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MLArrayDictionaryFeatureProvider initWithDictionaryFeatureProviderArray:](self, "initWithDictionaryFeatureProviderArray:", v9);
  return v10;
}

- (NSArray)array
{
  return self->_array;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
