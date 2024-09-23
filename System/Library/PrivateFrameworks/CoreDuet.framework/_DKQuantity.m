@implementation _DKQuantity

- (id)toPBCodable
{
  _DKPRValue *v3;
  _DKPRValueType *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;

  v3 = objc_alloc_init(_DKPRValue);
  v4 = objc_alloc_init(_DKPRValueType);
  -[_DKPRValue setType:]((uint64_t)v3, v4);
  -[_DKPRValue type]((uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRValueType setType:]((uint64_t)v5, 1);

  -[_DKQuantity quantityType](self, "quantityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "typeCode");
  -[_DKPRValue type]((uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRValueType setTypeCode:]((uint64_t)v8, v7);

  -[_DKQuantity doubleValue](self, "doubleValue");
  -[_DKPRValue setDoubleValue:]((uint64_t)v3, v9);

  return v3;
}

+ (id)fromPBCodable:(id)a3
{
  id v3;
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = -[_DKPRValue doubleValue]((uint64_t)v4);
    -[_DKPRValue type]((uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DKObjectType objectTypeWithTypeCode:](_DKQuantityType, "objectTypeWithTypeCode:", -[_DKPRValueType typeCode]((uint64_t)v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuantity quantityWithDouble:type:](_DKQuantity, "quantityWithDouble:type:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)quantityWithDouble:(double)a3 type:(id)a4
{
  id v5;
  _DKQuantity *v6;

  v5 = a4;
  v6 = -[_DKQuantity initWithDouble:type:]([_DKQuantity alloc], "initWithDouble:type:", v5, a3);

  return v6;
}

- (_DKQuantity)initWithDouble:(double)a3 type:(id)a4
{
  id v7;
  _DKQuantity *v8;
  _DKQuantity *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_DKQuantity;
  v8 = -[_DKObject init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_doubleValue = a3;
    objc_storeStrong((id *)&v8->_quantityType, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DKQuantity)initWithCoder:(id)a3
{
  id v4;
  _DKQuantity *v5;
  double v6;
  uint64_t v7;
  _DKQuantityType *quantityType;
  _DKQuantity *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DKQuantity;
  v5 = -[_DKObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("doubleValue"));
    v5->_doubleValue = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quantityType"));
    v7 = objc_claimAutoreleasedReturnValue();
    quantityType = v5->_quantityType;
    v5->_quantityType = (_DKQuantityType *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKQuantity;
  v4 = a3;
  -[_DKObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("doubleValue"), self->_doubleValue, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantityType, CFSTR("quantityType"));

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  double doubleValue;
  _DKQuantityType *quantityType;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  doubleValue = self->_doubleValue;
  quantityType = self->_quantityType;
  v11.receiver = self;
  v11.super_class = (Class)_DKQuantity;
  -[_DKObject description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { doubleValue=%f; quantityType=%@; %@ }"),
    v5,
    *(_QWORD *)&doubleValue,
    quantityType,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)objectType
{
  return self->_quantityType;
}

- (int64_t)compareValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "quantityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKQuantity quantityType](self, "quantityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      objc_msgSend(v5, "doubleValue");
      v10 = v9;
      -[_DKQuantity doubleValue](self, "doubleValue");
      if (v10 == v11)
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(v5, "doubleValue");
        v14 = v13;
        -[_DKQuantity doubleValue](self, "doubleValue");
        if (v14 <= v15)
          v12 = 1;
        else
          v12 = -1;
      }
    }
    else
    {
      v12 = -1;
    }

  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (id)primaryValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doubleValue);
}

- (id)stringValue
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doubleValue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _DKQuantity *v4;
  _DKQuantity *v5;
  _DKQuantity *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  objc_super v16;

  v4 = (_DKQuantity *)a3;
  v5 = v4;
  if (self == v4)
  {
    v14 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v16.receiver = self,
             v16.super_class = (Class)_DKQuantity,
             -[_DKObject isEqual:](&v16, sel_isEqual_, v5)))
  {
    v6 = v5;
    -[_DKQuantity doubleValue](self, "doubleValue");
    v8 = v7;
    -[_DKQuantity doubleValue](v6, "doubleValue");
    if (v8 == v9)
    {
      -[_DKQuantity quantityType](self, "quantityType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKQuantity quantityType](v6, "quantityType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {
        v14 = 1;
      }
      else
      {
        -[_DKQuantity quantityType](self, "quantityType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKQuantity quantityType](v6, "quantityType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

      }
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
}

- (_DKQuantityType)quantityType
{
  return (_DKQuantityType *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQuantityType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);
}

+ (id)entityName
{
  return CFSTR("Quantity");
}

- (int64_t)typeCode
{
  void *v2;
  int64_t v3;

  -[_DKQuantity quantityType](self, "quantityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "typeCode");

  return v3;
}

+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a3;
  v8 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    +[_DKObjectType objectTypeWithTypeCode:](_DKQuantityType, "objectTypeWithTypeCode:", objc_msgSend(v9, "quantityType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    +[_DKQuantity quantityWithDouble:type:](_DKQuantity, "quantityWithDouble:type:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "copyBaseObjectInfoFromManagedObject:cache:", v9, v8))
      v12 = v11;
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
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
        v9.super_class = (Class)_DKQuantity,
        -[_DKObject copyToManagedObject:](&v9, sel_copyToManagedObject_, v4)))
  {
    v5 = v4;
    -[_DKQuantity doubleValue](self, "doubleValue");
    objc_msgSend(v5, "setDoubleValue:");
    -[_DKQuantity quantityType](self, "quantityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setQuantityType:", objc_msgSend(v6, "typeCode"));

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
