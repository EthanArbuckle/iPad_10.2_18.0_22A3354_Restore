@implementation AMLArrayBatchProvider

- (AMLArrayBatchProvider)initWithMLArrayBatchProvider:(id)a3
{
  id v5;
  AMLArrayBatchProvider *v6;
  AMLArrayBatchProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMLArrayBatchProvider;
  v6 = -[AMLArrayBatchProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_batchProvider, a3);

  return v7;
}

- (AMLArrayBatchProvider)initWithArray:(id)a3
{
  id v4;
  AMLArrayBatchProvider *v5;
  uint64_t v6;
  MLArrayBatchProvider *batchProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMLArrayBatchProvider;
  v5 = -[AMLArrayBatchProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFF60]), "initWithFeatureProviderArray:", v4);
    batchProvider = v5->_batchProvider;
    v5->_batchProvider = (MLArrayBatchProvider *)v6;

  }
  return v5;
}

- (int64_t)count
{
  return -[MLArrayBatchProvider count](self->_batchProvider, "count");
}

- (id)featuresAtIndex:(int64_t)a3
{
  int64_t v3;

  v3 = a3;
  if (a3 < 0)
    v3 = -[MLArrayBatchProvider count](self->_batchProvider, "count") + a3;
  return (id)-[MLArrayBatchProvider featuresAtIndex:](self->_batchProvider, "featuresAtIndex:", v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMLArrayBatchProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AMLArrayBatchProvider *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x23B7E7AF4]();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF60]), "initWithFeatureProviderArray:", v13);
  v15 = -[AMLArrayBatchProvider initWithMLArrayBatchProvider:](self, "initWithMLArrayBatchProvider:", v14);

  objc_autoreleasePoolPop(v5);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x23B7E7AF4]();
  -[MLArrayBatchProvider array](self->_batchProvider, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("array"));

  objc_autoreleasePoolPop(v4);
}

- (MLArrayBatchProvider)batchProvider
{
  return self->_batchProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchProvider, 0);
}

@end
