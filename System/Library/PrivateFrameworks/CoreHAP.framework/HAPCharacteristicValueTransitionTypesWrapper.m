@implementation HAPCharacteristicValueTransitionTypesWrapper

- (HAPCharacteristicValueTransitionTypesWrapper)init
{
  HAPCharacteristicValueTransitionTypesWrapper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransitionTypesWrapper;
  result = -[HAPCharacteristicValueTransitionTypesWrapper init](&v3, sel_init);
  if (result)
    result->_value = 0;
  return result;
}

- (HAPCharacteristicValueTransitionTypesWrapper)initWithValue:(unint64_t)a3
{
  HAPCharacteristicValueTransitionTypesWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HAPCharacteristicValueTransitionTypesWrapper;
  result = -[HAPCharacteristicValueTransitionTypesWrapper init](&v5, sel_init);
  if (result)
    result->_value = a3;
  return result;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  unsigned __int8 *v10;
  uint64_t v11;
  BOOL v12;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    *a4 = 0;
    if (!objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v12 = 0;
      *a4 = v8;
      goto LABEL_15;
    }
  }
  else if (!objc_msgSend(v6, "length"))
  {
LABEL_11:
    v12 = 0;
    goto LABEL_15;
  }
  v9 = objc_retainAutorelease(v7);
  v10 = (unsigned __int8 *)objc_msgSend(v9, "bytes");
  switch(objc_msgSend(v9, "length"))
  {
    case 1:
      v11 = *v10;
      break;
    case 2:
      v11 = *(unsigned __int16 *)v10;
      break;
    case 4:
      v11 = *(unsigned int *)v10;
      break;
    case 8:
      v11 = *(_QWORD *)v10;
      break;
    default:
      if (!a4)
        goto LABEL_11;
      HMErrorFromOSStatus(4294960553);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
  }
  -[HAPCharacteristicValueTransitionTypesWrapper setValue:](self, "setValue:", v11);
  v12 = 1;
LABEL_15:

  return v12;
}

- (id)serializeWithError:(id *)a3
{
  return HAPTLVWriteUInt64(-[HAPCharacteristicValueTransitionTypesWrapper value](self, "value", a3));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HAPCharacteristicValueTransitionTypesWrapper initWithValue:](+[HAPCharacteristicValueTransitionTypesWrapper allocWithZone:](HAPCharacteristicValueTransitionTypesWrapper, "allocWithZone:", a3), "initWithValue:", -[HAPCharacteristicValueTransitionTypesWrapper value](self, "value"));
}

- (BOOL)isEqual:(id)a3
{
  HAPCharacteristicValueTransitionTypesWrapper *v4;
  HAPCharacteristicValueTransitionTypesWrapper *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (HAPCharacteristicValueTransitionTypesWrapper *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HAPCharacteristicValueTransitionTypesWrapper value](self, "value");
      v7 = -[HAPCharacteristicValueTransitionTypesWrapper value](v5, "value");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  HAPCharacteristicValueTransitionTypesAsString(-[HAPCharacteristicValueTransitionTypesWrapper value](self, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HAPCharacteristicValueTransitionTypesWrapper value=%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueTransitionTypesWrapper *v6;
  HAPCharacteristicValueTransitionTypesWrapper *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueTransitionTypesWrapper);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueTransitionTypesWrapper parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
    v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  return v7;
}

@end
