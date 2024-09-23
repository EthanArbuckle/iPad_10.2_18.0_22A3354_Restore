@implementation HAP2TLVServicePropertiesWrapper

- (HAP2TLVServicePropertiesWrapper)init
{
  HAP2TLVServicePropertiesWrapper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVServicePropertiesWrapper;
  result = -[HAP2TLVServicePropertiesWrapper init](&v3, sel_init);
  if (result)
    result->_value = 0;
  return result;
}

- (HAP2TLVServicePropertiesWrapper)initWithValue:(unint64_t)a3
{
  HAP2TLVServicePropertiesWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HAP2TLVServicePropertiesWrapper;
  result = -[HAP2TLVServicePropertiesWrapper init](&v5, sel_init);
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
  -[HAP2TLVServicePropertiesWrapper setValue:](self, "setValue:", v11);
  v12 = 1;
LABEL_15:

  return v12;
}

- (id)serializeWithError:(id *)a3
{
  return HAPTLVWriteUInt64(-[HAP2TLVServicePropertiesWrapper value](self, "value", a3));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HAP2TLVServicePropertiesWrapper initWithValue:](+[HAP2TLVServicePropertiesWrapper allocWithZone:](HAP2TLVServicePropertiesWrapper, "allocWithZone:", a3), "initWithValue:", -[HAP2TLVServicePropertiesWrapper value](self, "value"));
}

- (BOOL)isEqual:(id)a3
{
  HAP2TLVServicePropertiesWrapper *v4;
  HAP2TLVServicePropertiesWrapper *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (HAP2TLVServicePropertiesWrapper *)a3;
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
      v6 = -[HAP2TLVServicePropertiesWrapper value](self, "value");
      v7 = -[HAP2TLVServicePropertiesWrapper value](v5, "value");

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
  unint64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[HAP2TLVServicePropertiesWrapper value](self, "value");
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v3)
    goto LABEL_14;
  v5 = 1;
  v6 = v3;
  do
  {
    if ((v5 & v3) == 0)
      goto LABEL_11;
    switch(v5)
    {
      case 1:
        v7 = CFSTR("HAP2TLVServicePropertyPrimaryService");
        break;
      case 4:
        v7 = CFSTR("HAP2TLVServicePropertyServiceSupportsConfiguration");
        break;
      case 2:
        v7 = CFSTR("HAP2TLVServicePropertyHiddenService");
        break;
      default:
        goto LABEL_11;
    }
    v6 &= ~v5;
    objc_msgSend(v4, "addObject:", v7);
LABEL_11:
    v5 *= 2;
  }
  while (v5 - 1 < v3);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown options %lu"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
LABEL_14:
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("None");
  }

  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HAP2TLVServicePropertiesWrapper value=%@>"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
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
  HAP2TLVServicePropertiesWrapper *v6;
  HAP2TLVServicePropertiesWrapper *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAP2TLVServicePropertiesWrapper);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAP2TLVServicePropertiesWrapper parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
