@implementation _DKCategory

+ (id)categoryWithInteger:(int64_t)a3 type:(id)a4
{
  id v5;
  _DKCategory *v6;
  void *v7;
  _DKCategory *v8;

  v5 = a4;
  v6 = [_DKCategory alloc];
  +[_DKCategoryCache sharedCached](_DKCategoryCache, "sharedCached");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_DKCategory initWithInteger:type:cache:](v6, "initWithInteger:type:cache:", a3, v5, v7);

  return v8;
}

- (_DKCategory)initWithInteger:(int64_t)a3 type:(id)a4 cache:(id)a5
{
  id v9;
  id v10;
  void *v11;
  _DKCategory *v12;
  _DKCategory *v13;
  _DKCategory *v14;
  _DKCategory *v15;
  objc_super v17;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10
    || (objc_msgSend(v10, "categoryWithInteger:type:", a3, v9),
        (v12 = (_DKCategory *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)_DKCategory;
    v13 = -[_DKObject init](&v17, sel_init);
    v14 = v13;
    if (v13)
    {
      v13->_integerValue = a3;
      objc_storeStrong((id *)&v13->_categoryType, a4);
    }
    v12 = v14;
    self = v12;
  }
  v15 = v12;

  return v15;
}

- (int64_t)compareValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  int64_t v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "categoryType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKCategory categoryType](self, "categoryType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      v9 = objc_msgSend(v5, "integerValue");
      if (v9 == -[_DKCategory integerValue](self, "integerValue"))
        v10 = 0;
      else
        v10 = -1;
    }
    else
    {
      v10 = -1;
    }

  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (_DKCategoryType)categoryType
{
  return (_DKCategoryType *)objc_getProperty(self, a2, 48, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKCategory;
  v4 = a3;
  -[_DKObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_integerValue, CFSTR("integerValue"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_categoryType, CFSTR("categoryType"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryType, 0);
}

- (id)toPBCodable
{
  _DKPRValue *v3;
  _DKPRValueType *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = objc_alloc_init(_DKPRValue);
  v4 = objc_alloc_init(_DKPRValueType);
  -[_DKPRValue setType:]((uint64_t)v3, v4);
  -[_DKPRValue type]((uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRValueType setType:]((uint64_t)v5, 0);

  -[_DKCategory categoryType](self, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "typeCode");
  -[_DKPRValue type]((uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRValueType setTypeCode:]((uint64_t)v8, v7);

  -[_DKPRValue setIntegerValue:]((uint64_t)v3, -[_DKCategory integerValue](self, "integerValue"));
  return v3;
}

- (_DKCategory)initWithCoder:(id)a3
{
  id v4;
  _DKCategory *v5;
  uint64_t v6;
  _DKCategoryType *categoryType;
  void *v8;
  _DKCategory *v9;
  _DKCategory *v10;
  _DKCategory *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DKCategory;
  v5 = -[_DKObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_integerValue = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("integerValue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryType"));
    v6 = objc_claimAutoreleasedReturnValue();
    categoryType = v5->_categoryType;
    v5->_categoryType = (_DKCategoryType *)v6;

    +[_DKCategoryCache sharedCached](_DKCategoryCache, "sharedCached");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "categoryWithInteger:type:", v5->_integerValue, v5->_categoryType);
    v9 = (_DKCategory *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = v9;
    else
      v10 = v5;
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t integerValue;
  _DKCategoryType *categoryType;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  integerValue = self->_integerValue;
  categoryType = self->_categoryType;
  v11.receiver = self;
  v11.super_class = (Class)_DKCategory;
  -[_DKObject description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { integerValue=%d; categoryType=%@; %@}"),
    v5,
    integerValue,
    categoryType,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)objectType
{
  return self->_categoryType;
}

- (id)primaryValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_integerValue);
}

- (double)doubleValue
{
  return (double)self->_integerValue;
}

- (id)stringValue
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_integerValue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _DKCategory *v4;
  _DKCategory *v5;
  _DKCategory *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (_DKCategory *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v14.receiver = self,
             v14.super_class = (Class)_DKCategory,
             -[_DKObject isEqual:](&v14, sel_isEqual_, v5)))
  {
    v6 = v5;
    v7 = -[_DKCategory integerValue](self, "integerValue");
    if (v7 == -[_DKCategory integerValue](v6, "integerValue"))
    {
      -[_DKCategory categoryType](self, "categoryType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKCategory categoryType](v6, "categoryType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
      {
        v12 = 1;
      }
      else
      {
        -[_DKCategory categoryType](self, "categoryType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKCategory categoryType](v6, "categoryType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

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

- (void)setIntegerValue:(int64_t)a3
{
  self->_integerValue = a3;
}

- (void)setCategoryType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

+ (id)fromPBCodable:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = -[_DKPRValue integerValue]((uint64_t)v4);
    -[_DKPRValue type]((uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DKObjectType objectTypeWithTypeCode:](_DKCategoryType, "objectTypeWithTypeCode:", -[_DKPRValueType typeCode]((uint64_t)v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)entityName
{
  return CFSTR("Category");
}

- (int64_t)typeCode
{
  void *v2;
  int64_t v3;

  -[_DKCategory categoryType](self, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "typeCode");

  return v3;
}

+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id *v22;
  id v23;
  BOOL v24;

  v7 = a4;
  v9 = a3;
  v10 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v9;
    v12 = v11;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "integerValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "categoryType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("category-%@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __93___DKCategory_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke;
      v20[3] = &unk_1E26E6538;
      v23 = a1;
      v21 = v12;
      v24 = v7;
      v22 = (id *)v10;
      -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](v22, v14, v17, v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "_categoryFromManagedObject:readMetadata:cache:", v11, v7, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_categoryFromManagedObject:(id)a3 readMetadata:(BOOL)a4 cache:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v6 = a5;
  v7 = a3;
  +[_DKObjectType objectTypeWithTypeCode:](_DKCategoryType, "objectTypeWithTypeCode:", objc_msgSend(v7, "categoryType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", objc_msgSend(v7, "integerValue"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyBaseObjectInfoFromManagedObject:cache:", v7, v6);

  if (v10)
    v11 = v9;
  else
    v11 = 0;

  return v11;
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)_DKCategory,
        -[_DKObject copyToManagedObject:](&v9, sel_copyToManagedObject_, v4)))
  {
    v5 = v4;
    objc_msgSend(v5, "setIntegerValue:", -[_DKCategory integerValue](self, "integerValue"));
    -[_DKCategory categoryType](self, "categoryType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCategoryType:", objc_msgSend(v6, "typeCode"));

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
