@implementation ICAssetGeneration

- (ICAssetGeneration)initWithNumber:(int64_t)a3 identifier:(id)a4
{
  id v7;
  void *v8;
  ICAssetGeneration *v9;
  ICAssetGeneration *v10;
  ICAssetGeneration *v11;
  objc_super v13;

  v7 = a4;
  v8 = v7;
  if (a3 >= 1 && objc_msgSend(v7, "length"))
  {
    v13.receiver = self;
    v13.super_class = (Class)ICAssetGeneration;
    v9 = -[ICAssetGeneration init](&v13, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_number = a3;
      objc_storeStrong((id *)&v9->_identifier, a4);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (ICAssetGeneration)init
{
  ICAssetGeneration *v2;
  ICAssetGeneration *v3;
  void *v4;
  uint64_t v5;
  NSString *identifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICAssetGeneration;
  v2 = -[ICAssetGeneration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_number = 1;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v5;

  }
  return v3;
}

- (ICAssetGeneration)initWithRawValue:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ICAssetGeneration *v8;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    objc_msgSend(v4, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ICAssetGeneration initWithNumber:identifier:](self, "initWithNumber:identifier:", v6, v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)nextGeneration
{
  ICAssetGeneration *v3;
  int64_t v4;
  void *v5;
  void *v6;
  ICAssetGeneration *v7;

  v3 = [ICAssetGeneration alloc];
  v4 = -[ICAssetGeneration number](self, "number") + 1;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICAssetGeneration initWithNumber:identifier:](v3, "initWithNumber:identifier:", v4, v6);

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ICAssetGeneration number](self, "number"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAssetGeneration identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, number: %@, identifier: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  char v15;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAssetGeneration rawValue](self, "rawValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rawValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((void *)*MEMORY[0x1E0C9B0D0] == v6)
    v9 = 0;
  else
    v9 = v6;
  v10 = v9;
  if (v8 == v7)
    v11 = 0;
  else
    v11 = v7;
  v12 = v11;
  v13 = (void *)v12;
  if (v10 | v12)
  {
    if (v10)
      v14 = v12 == 0;
    else
      v14 = 1;
    if (v14)
      v15 = 0;
    else
      v15 = objc_msgSend((id)v10, "isEqual:", v12);
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = self->_hash;
  if (!result)
  {
    -[ICAssetGeneration rawValue](self, "rawValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
    self->_hash = ICHashWithHashKeys(v5, v6, v7, v8, v9, v10, v11, v12, 0);

    return self->_hash;
  }
  return result;
}

- (NSString)rawValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ICAssetGeneration number](self, "number"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAssetGeneration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@%@"), v4, CFSTR("_"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int64_t)number
{
  return self->_number;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
