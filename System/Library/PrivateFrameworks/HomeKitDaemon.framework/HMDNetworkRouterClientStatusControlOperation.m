@implementation HMDNetworkRouterClientStatusControlOperation

- (HMDNetworkRouterClientStatusControlOperation)init
{
  HMDNetworkRouterClientStatusControlOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterClientStatusControlOperation;
  result = -[HMDNetworkRouterClientStatusControlOperation init](&v3, sel_init);
  if (result)
    result->_operation = 0;
  return result;
}

- (HMDNetworkRouterClientStatusControlOperation)initWithOperation:(int64_t)a3
{
  HMDNetworkRouterClientStatusControlOperation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDNetworkRouterClientStatusControlOperation;
  result = -[HMDNetworkRouterClientStatusControlOperation init](&v5, sel_init);
  if (result)
    result->_operation = a3;
  return result;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;

  v6 = a3;
  v7 = v6;
  if (!a4)
  {
    if (!objc_msgSend(v6, "length"))
    {
      v8 = 0;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  *a4 = 0;
  if (objc_msgSend(v6, "length"))
  {
LABEL_5:
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v8 = 1;
    -[HMDNetworkRouterClientStatusControlOperation setOperation:](self, "setOperation:", HAPTLVParseUInt64());
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
  v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  -[HMDNetworkRouterClientStatusControlOperation operation](self, "operation", a3);
  return (id)HAPTLVWriteUInt64();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HMDNetworkRouterClientStatusControlOperation initWithOperation:](+[HMDNetworkRouterClientStatusControlOperation allocWithZone:](HMDNetworkRouterClientStatusControlOperation, "allocWithZone:", a3), "initWithOperation:", -[HMDNetworkRouterClientStatusControlOperation operation](self, "operation"));
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterClientStatusControlOperation *v4;
  HMDNetworkRouterClientStatusControlOperation *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (HMDNetworkRouterClientStatusControlOperation *)a3;
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
      v6 = -[HMDNetworkRouterClientStatusControlOperation operation](self, "operation");
      v7 = -[HMDNetworkRouterClientStatusControlOperation operation](v5, "operation");

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
  int64_t v3;
  __CFString *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = -[HMDNetworkRouterClientStatusControlOperation operation](self, "operation");
  if (v3 == 1)
  {
    v4 = CFSTR("HMDNetworkRouterClientStatusControlOperationTypeRead");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown HMDNetworkRouterClientStatusControlOperationType %ld"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMDNetworkRouterClientStatusControlOperation operation=%@>"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterClientStatusControlOperation *v6;
  HMDNetworkRouterClientStatusControlOperation *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterClientStatusControlOperation);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterClientStatusControlOperation parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
