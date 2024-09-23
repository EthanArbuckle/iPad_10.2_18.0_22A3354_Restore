@implementation MLSequence

- (MLSequence)initWithArray:(id)a3 type:(int64_t)a4
{
  id v7;
  MLSequence *v8;
  MLSequence *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLSequence;
  v8 = -[MLSequence init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a4;
    objc_storeStrong((id *)&v8->_values, a3);
  }

  return v9;
}

- (NSArray)stringValues
{
  if (self->_type == 3)
    return self->_values;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)int64Values
{
  if (self->_type == 1)
    return self->_values;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[MLSequence type](self, "type"), CFSTR("type"));
  -[MLSequence values](self, "values");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("values"));

}

- (MLSequence)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MLSequence *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("type"));
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v12[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(v4, "allowedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v8);

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("values"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MLSequence initWithArray:type:](self, "initWithArray:type:", v9, v5);
  return v10;
}

- (MLFeatureType)type
{
  return self->_type;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

+ (MLSequence)emptySequenceWithType:(MLFeatureType)type
{
  id v4;

  v4 = objc_alloc((Class)a1);
  return (MLSequence *)(id)objc_msgSend(v4, "initWithArray:type:", MEMORY[0x1E0C9AA60], type);
}

+ (id)sequenceFromArray:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v12 = 0;
    v7 = +[MLFeatureTypeUtils featureTypeForValuesInArray:error:](MLFeatureTypeUtils, "featureTypeForValuesInArray:error:", v6, &v12);
    v8 = v12;
    v9 = v8;
    if (v8)
    {
      v10 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArray:type:", v6, v7);
    }

  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArray:type:", v6, 0);
  }

  return v10;
}

+ (MLSequence)sequenceWithStringArray:(NSArray *)stringValues
{
  NSArray *v4;
  void *v5;

  v4 = stringValues;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArray:type:", v4, 3);

  return (MLSequence *)v5;
}

+ (MLSequence)sequenceWithInt64Array:(NSArray *)int64Values
{
  NSArray *v4;
  void *v5;

  v4 = int64Values;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArray:type:", v4, 1);

  return (MLSequence *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)featureValues
{
  return (NSArray *)-[MLSequnceAsFeatureValueArray initWrappingSequence:]([MLSequnceAsFeatureValueArray alloc], "initWrappingSequence:", self);
}

@end
