@implementation HMDNetworkRouterControlOperationStatus

- (HMDNetworkRouterControlOperationStatus)init
{
  HMDNetworkRouterControlOperationStatus *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterControlOperationStatus;
  result = -[HMDNetworkRouterControlOperationStatus init](&v3, sel_init);
  if (result)
    result->_status = 0;
  return result;
}

- (HMDNetworkRouterControlOperationStatus)initWithStatus:(int64_t)a3
{
  HMDNetworkRouterControlOperationStatus *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDNetworkRouterControlOperationStatus;
  result = -[HMDNetworkRouterControlOperationStatus init](&v5, sel_init);
  if (result)
    result->_status = a3;
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
    -[HMDNetworkRouterControlOperationStatus setStatus:](self, "setStatus:", HAPTLVParseUInt64());
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
  v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  -[HMDNetworkRouterControlOperationStatus status](self, "status", a3);
  return (id)HAPTLVWriteUInt64();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HMDNetworkRouterControlOperationStatus initWithStatus:](+[HMDNetworkRouterControlOperationStatus allocWithZone:](HMDNetworkRouterControlOperationStatus, "allocWithZone:", a3), "initWithStatus:", -[HMDNetworkRouterControlOperationStatus status](self, "status"));
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterControlOperationStatus *v4;
  HMDNetworkRouterControlOperationStatus *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (HMDNetworkRouterControlOperationStatus *)a3;
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
      v6 = -[HMDNetworkRouterControlOperationStatus status](self, "status");
      v7 = -[HMDNetworkRouterControlOperationStatus status](v5, "status");

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
  HMDNetworkRouterControlOperationStatusTypeAsString(-[HMDNetworkRouterControlOperationStatus status](self, "status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMDNetworkRouterControlOperationStatus status=%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterControlOperationStatus *v6;
  HMDNetworkRouterControlOperationStatus *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterControlOperationStatus);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterControlOperationStatus parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
