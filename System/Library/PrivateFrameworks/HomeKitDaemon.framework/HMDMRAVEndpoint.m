@implementation HMDMRAVEndpoint

- (HMDMRAVEndpoint)initWithMRAVEndpoint:(void *)a3
{
  HMDMRAVEndpoint *v4;
  HMDMRAVEndpoint *result;
  HMDMRAVEndpoint *v6;
  SEL v7;
  objc_super v8;

  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)HMDMRAVEndpoint;
    v4 = -[HMDMRAVEndpoint init](&v8, sel_init);
    if (v4)
      v4->_mravEndpoint = (void *)CFRetain(a3);
    return v4;
  }
  else
  {
    v6 = (HMDMRAVEndpoint *)_HMFPreconditionFailure();
    -[HMDMRAVEndpoint dealloc](v6, v7);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_mravEndpoint);
  v3.receiver = self;
  v3.super_class = (Class)HMDMRAVEndpoint;
  -[HMDMRAVEndpoint dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  HMDMRAVEndpoint *v4;
  HMDMRAVEndpoint *v5;
  HMDMRAVEndpoint *v6;
  HMDMRAVEndpoint *v7;
  void *v8;
  BOOL v9;

  v4 = (HMDMRAVEndpoint *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      v8 = -[HMDMRAVEndpoint mravEndpoint](objc_retainAutorelease(v6), "mravEndpoint");
      v9 = v8 == -[HMDMRAVEndpoint mravEndpoint](objc_retainAutorelease(self), "mravEndpoint");
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)-[HMDMRAVEndpoint mravEndpoint](objc_retainAutorelease(self), "mravEndpoint");
}

- (id)attributeDescriptions
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F140]), "initWithName:value:", CFSTR("MRAVEndPointRef"), -[HMDMRAVEndpoint mravEndpoint](objc_retainAutorelease(self), "mravEndpoint"));
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)mravEndpoint
{
  return self->_mravEndpoint;
}

@end
