@implementation HMDSiriEndpointSessionStateTypeWrapper

- (HMDSiriEndpointSessionStateTypeWrapper)init
{
  HMDSiriEndpointSessionStateTypeWrapper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDSiriEndpointSessionStateTypeWrapper;
  result = -[HMDSiriEndpointSessionStateTypeWrapper init](&v3, sel_init);
  if (result)
    result->_value = 0;
  return result;
}

- (HMDSiriEndpointSessionStateTypeWrapper)initWithValue:(int64_t)a3
{
  HMDSiriEndpointSessionStateTypeWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDSiriEndpointSessionStateTypeWrapper;
  result = -[HMDSiriEndpointSessionStateTypeWrapper init](&v5, sel_init);
  if (result)
    result->_value = a3;
  return result;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_retainAutorelease(v6);
    objc_msgSend(v7, "bytes");
    objc_msgSend(v7, "length");
    v8 = 1;
    -[HMDSiriEndpointSessionStateTypeWrapper setValue:](self, "setValue:", HAPTLVParseUInt64());
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  -[HMDSiriEndpointSessionStateTypeWrapper value](self, "value", a3);
  return (id)HAPTLVWriteUInt64();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HMDSiriEndpointSessionStateTypeWrapper initWithValue:](+[HMDSiriEndpointSessionStateTypeWrapper allocWithZone:](HMDSiriEndpointSessionStateTypeWrapper, "allocWithZone:", a3), "initWithValue:", -[HMDSiriEndpointSessionStateTypeWrapper value](self, "value"));
}

- (BOOL)isEqual:(id)a3
{
  HMDSiriEndpointSessionStateTypeWrapper *v4;
  HMDSiriEndpointSessionStateTypeWrapper *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (HMDSiriEndpointSessionStateTypeWrapper *)a3;
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
      v6 = -[HMDSiriEndpointSessionStateTypeWrapper value](self, "value");
      v7 = -[HMDSiriEndpointSessionStateTypeWrapper value](v5, "value");

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
  __CFString *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = -[HMDSiriEndpointSessionStateTypeWrapper value](self, "value");
  if (v3 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown HMDSiriEndpointSessionStateType %ld"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_24E77E970[v3];
  }
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMDSiriEndpointSessionStateTypeWrapper value=%@>"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
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
  HMDSiriEndpointSessionStateTypeWrapper *v6;
  HMDSiriEndpointSessionStateTypeWrapper *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDSiriEndpointSessionStateTypeWrapper);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDSiriEndpointSessionStateTypeWrapper parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
