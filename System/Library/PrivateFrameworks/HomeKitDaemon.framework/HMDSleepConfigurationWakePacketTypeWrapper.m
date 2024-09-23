@implementation HMDSleepConfigurationWakePacketTypeWrapper

- (HMDSleepConfigurationWakePacketTypeWrapper)init
{
  HMDSleepConfigurationWakePacketTypeWrapper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDSleepConfigurationWakePacketTypeWrapper;
  result = -[HMDSleepConfigurationWakePacketTypeWrapper init](&v3, sel_init);
  if (result)
    result->_value = 0;
  return result;
}

- (HMDSleepConfigurationWakePacketTypeWrapper)initWithValue:(int64_t)a3
{
  HMDSleepConfigurationWakePacketTypeWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDSleepConfigurationWakePacketTypeWrapper;
  result = -[HMDSleepConfigurationWakePacketTypeWrapper init](&v5, sel_init);
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
    -[HMDSleepConfigurationWakePacketTypeWrapper setValue:](self, "setValue:", HAPTLVParseUInt64());
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
  -[HMDSleepConfigurationWakePacketTypeWrapper value](self, "value", a3);
  return (id)HAPTLVWriteUInt64();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HMDSleepConfigurationWakePacketTypeWrapper initWithValue:](+[HMDSleepConfigurationWakePacketTypeWrapper allocWithZone:](HMDSleepConfigurationWakePacketTypeWrapper, "allocWithZone:", a3), "initWithValue:", -[HMDSleepConfigurationWakePacketTypeWrapper value](self, "value"));
}

- (BOOL)isEqual:(id)a3
{
  HMDSleepConfigurationWakePacketTypeWrapper *v4;
  HMDSleepConfigurationWakePacketTypeWrapper *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (HMDSleepConfigurationWakePacketTypeWrapper *)a3;
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
      v6 = -[HMDSleepConfigurationWakePacketTypeWrapper value](self, "value");
      v7 = -[HMDSleepConfigurationWakePacketTypeWrapper value](v5, "value");

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
  v3 = -[HMDSleepConfigurationWakePacketTypeWrapper value](self, "value");
  if (v3 == 1)
  {
    v4 = CFSTR("HMDSleepConfigurationWakePacketTypeAccessoryConfiguredPacket");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown HMDSleepConfigurationWakePacketType %ld"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMDSleepConfigurationWakePacketTypeWrapper value=%@>"), v4);
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
  HMDSleepConfigurationWakePacketTypeWrapper *v6;
  HMDSleepConfigurationWakePacketTypeWrapper *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDSleepConfigurationWakePacketTypeWrapper);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDSleepConfigurationWakePacketTypeWrapper parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
