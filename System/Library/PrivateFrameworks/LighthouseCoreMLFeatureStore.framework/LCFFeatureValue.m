@implementation LCFFeatureValue

- (id)initEmpty
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LCFFeatureValue;
  result = -[LCFFeatureValue init](&v3, sel_init);
  if (result)
    *((_QWORD *)result + 1) = -1;
  return result;
}

- (LCFFeatureValue)initWithIntValue:(id)a3
{
  id v5;
  LCFFeatureValue *v6;
  LCFFeatureValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFFeatureValue;
  v6 = -[LCFFeatureValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_intValue, a3);
  }

  return v7;
}

- (LCFFeatureValue)initWithDoubleValue:(id)a3
{
  id v5;
  LCFFeatureValue *v6;
  LCFFeatureValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFFeatureValue;
  v6 = -[LCFFeatureValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_doubleValue, a3);
  }

  return v7;
}

- (LCFFeatureValue)initWithStringValue:(id)a3
{
  id v5;
  LCFFeatureValue *v6;
  LCFFeatureValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFFeatureValue;
  v6 = -[LCFFeatureValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong((id *)&v6->_stringValue, a3);
  }

  return v7;
}

- (LCFFeatureValue)initWithBoolValue:(id)a3
{
  id v5;
  LCFFeatureValue *v6;
  LCFFeatureValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFFeatureValue;
  v6 = -[LCFFeatureValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 4;
    objc_storeStrong((id *)&v6->_BOOLValue, a3);
  }

  return v7;
}

- (LCFFeatureValue)initWithTimeBucketValue:(id)a3
{
  id v5;
  LCFFeatureValue *v6;
  LCFFeatureValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFFeatureValue;
  v6 = -[LCFFeatureValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 5;
    objc_storeStrong((id *)&v6->_timeBucketValue, a3);
  }

  return v7;
}

- (LCFFeatureValue)initWithDoubleArray:(id)a3
{
  id v5;
  LCFFeatureValue *v6;
  LCFFeatureValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFFeatureValue;
  v6 = -[LCFFeatureValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 6;
    objc_storeStrong((id *)&v6->_doubleArray, a3);
  }

  return v7;
}

- (NSString)valueInString
{
  NSNumber *intValue;
  void *v3;
  NSString *result;
  NSArray *doubleArray;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  switch(self->_type)
  {
    case 1:
      intValue = self->_intValue;
      goto LABEL_7;
    case 2:
      intValue = self->_doubleValue;
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%@'"), self->_stringValue);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v3;
    case 4:
      intValue = self->_BOOLValue;
      goto LABEL_7;
    case 5:
      intValue = self->_timeBucketValue;
LABEL_7:
      -[NSNumber stringValue](intValue, "stringValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v3;
    case 6:
      doubleArray = self->_doubleArray;
      if (!doubleArray)
        goto LABEL_11;
      v9 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", doubleArray, 0, &v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%@'"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      result = v8;
      break;
    default:
LABEL_11:
      result = (NSString *)0;
      break;
  }
  return result;
}

- (id)getTypeDBString
{
  unint64_t v2;

  v2 = self->_type - 1;
  if (v2 > 5)
    return 0;
  else
    return off_25109F0C8[v2];
}

- (BOOL)isNullValue
{
  unint64_t v2;

  v2 = self->_type - 1;
  return v2 > 5 || (&self->_intValue)[v2] == 0;
}

- (int64_t)type
{
  return self->_type;
}

- (NSNumber)intValue
{
  return self->_intValue;
}

- (NSNumber)doubleValue
{
  return self->_doubleValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSNumber)BOOLValue
{
  return self->_BOOLValue;
}

- (NSNumber)timeBucketValue
{
  return self->_timeBucketValue;
}

- (NSArray)doubleArray
{
  return self->_doubleArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleArray, 0);
  objc_storeStrong((id *)&self->_timeBucketValue, 0);
  objc_storeStrong((id *)&self->_BOOLValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_doubleValue, 0);
  objc_storeStrong((id *)&self->_intValue, 0);
}

@end
