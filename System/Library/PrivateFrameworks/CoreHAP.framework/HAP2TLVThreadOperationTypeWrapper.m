@implementation HAP2TLVThreadOperationTypeWrapper

- (HAP2TLVThreadOperationTypeWrapper)init
{
  HAP2TLVThreadOperationTypeWrapper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVThreadOperationTypeWrapper;
  result = -[HAP2TLVThreadOperationTypeWrapper init](&v3, sel_init);
  if (result)
    result->_value = 0;
  return result;
}

- (HAP2TLVThreadOperationTypeWrapper)initWithValue:(int64_t)a3
{
  HAP2TLVThreadOperationTypeWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HAP2TLVThreadOperationTypeWrapper;
  result = -[HAP2TLVThreadOperationTypeWrapper init](&v5, sel_init);
  if (result)
    result->_value = a3;
  return result;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  unsigned __int8 *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_retainAutorelease(v6);
    v8 = (unsigned __int8 *)objc_msgSend(v7, "bytes");
    switch(objc_msgSend(v7, "length"))
    {
      case 1:
        v9 = *v8;
        break;
      case 2:
        v9 = *(unsigned __int16 *)v8;
        break;
      case 4:
        v9 = *(unsigned int *)v8;
        break;
      case 8:
        v9 = *(_QWORD *)v8;
        break;
      default:
        if (!a4)
          goto LABEL_10;
        HMErrorFromOSStatus(4294960553);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
    }
    -[HAP2TLVThreadOperationTypeWrapper setValue:](self, "setValue:", v9);
    v11 = 1;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v11 = 0;
    *a4 = v10;
  }
  else
  {
LABEL_10:
    v11 = 0;
  }

  return v11;
}

- (id)serializeWithError:(id *)a3
{
  return HAPTLVWriteUInt64(-[HAP2TLVThreadOperationTypeWrapper value](self, "value", a3));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HAP2TLVThreadOperationTypeWrapper initWithValue:](+[HAP2TLVThreadOperationTypeWrapper allocWithZone:](HAP2TLVThreadOperationTypeWrapper, "allocWithZone:", a3), "initWithValue:", -[HAP2TLVThreadOperationTypeWrapper value](self, "value"));
}

- (BOOL)isEqual:(id)a3
{
  HAP2TLVThreadOperationTypeWrapper *v4;
  HAP2TLVThreadOperationTypeWrapper *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (HAP2TLVThreadOperationTypeWrapper *)a3;
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
      v6 = -[HAP2TLVThreadOperationTypeWrapper value](self, "value");
      v7 = -[HAP2TLVThreadOperationTypeWrapper value](v5, "value");

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
  HAP2TLVThreadOperationTypeAsString(-[HAP2TLVThreadOperationTypeWrapper value](self, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HAP2TLVThreadOperationTypeWrapper value=%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAP2TLVThreadOperationTypeWrapper *v6;
  HAP2TLVThreadOperationTypeWrapper *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAP2TLVThreadOperationTypeWrapper);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAP2TLVThreadOperationTypeWrapper parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
