@implementation HMDSleepConfigurationWakeUpTypeWrapper

- (HMDSleepConfigurationWakeUpTypeWrapper)init
{
  HMDSleepConfigurationWakeUpTypeWrapper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDSleepConfigurationWakeUpTypeWrapper;
  result = -[HMDSleepConfigurationWakeUpTypeWrapper init](&v3, sel_init);
  if (result)
    result->_value = 0;
  return result;
}

- (HMDSleepConfigurationWakeUpTypeWrapper)initWithValue:(int64_t)a3
{
  HMDSleepConfigurationWakeUpTypeWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDSleepConfigurationWakeUpTypeWrapper;
  result = -[HMDSleepConfigurationWakeUpTypeWrapper init](&v5, sel_init);
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
    -[HMDSleepConfigurationWakeUpTypeWrapper setValue:](self, "setValue:", HAPTLVParseUInt64());
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
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
  -[HMDSleepConfigurationWakeUpTypeWrapper value](self, "value", a3);
  return (id)HAPTLVWriteUInt64();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HMDSleepConfigurationWakeUpTypeWrapper initWithValue:](+[HMDSleepConfigurationWakeUpTypeWrapper allocWithZone:](HMDSleepConfigurationWakeUpTypeWrapper, "allocWithZone:", a3), "initWithValue:", -[HMDSleepConfigurationWakeUpTypeWrapper value](self, "value"));
}

- (BOOL)isEqual:(id)a3
{
  HMDSleepConfigurationWakeUpTypeWrapper *v4;
  HMDSleepConfigurationWakeUpTypeWrapper *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (HMDSleepConfigurationWakeUpTypeWrapper *)a3;
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
      v6 = -[HMDSleepConfigurationWakeUpTypeWrapper value](self, "value");
      v7 = -[HMDSleepConfigurationWakeUpTypeWrapper value](v5, "value");

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

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[HMDSleepConfigurationWakeUpTypeWrapper value](self, "value");
  if (v3 == 1)
  {
    v4 = CFSTR("HMDSleepConfigurationWakeUpTypeWakeWithSystemOn");
  }
  else if (v3 == 2)
  {
    v4 = CFSTR("HMDSleepConfigurationWakeUpTypeDarkWake");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMDSleepConfigurationWakeUpType %ld"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMDSleepConfigurationWakeUpTypeWrapper value=%@>"), v4);
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
  HMDSleepConfigurationWakeUpTypeWrapper *v6;
  HMDSleepConfigurationWakeUpTypeWrapper *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDSleepConfigurationWakeUpTypeWrapper);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDSleepConfigurationWakeUpTypeWrapper parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
