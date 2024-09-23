@implementation HMDAccessoryCategoryLogEvent

- (HMDAccessoryCategoryLogEvent)initWithAccessoryDetailsType:(unint64_t)a3 accessoryCategoryIdentifier:(id)a4 homeUUID:(id)a5
{
  id v9;
  HMDAccessoryCategoryLogEvent *v10;
  HMDAccessoryCategoryLogEvent *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryCategoryLogEvent;
  v10 = -[HMMHomeLogEvent initWithHomeUUID:](&v13, sel_initWithHomeUUID_, a5);
  v11 = v10;
  if (v10)
  {
    v10->_accessoryDetailsType = a3;
    objc_storeStrong((id *)&v10->_accessoryCategoryIdentifier, a4);
    v11->_isDenominatorSpecifying = a3 == 0;
  }

  return v11;
}

- (BOOL)enableEventFilterSpecifying
{
  return !-[HMDAccessoryCategoryLogEvent isDenominatorSpecifying](self, "isDenominatorSpecifying");
}

- (NSString)sampledCategory
{
  return (NSString *)CFSTR("HMDAccessoryCategoryLogEvent");
}

- (NSData)sampledData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v9;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  -[HMDAccessoryCategoryLogEvent accessoryCategoryIdentifier](self, "accessoryCategoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDAccessoryCategoryLogEvent accessoryDetailsType](self, "accessoryDetailsType");
  objc_msgSend(v6, "appendBytes:length:", &v9, 8);
  v7 = (void *)objc_msgSend(v6, "copy");

  return (NSData *)v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.homeConfiguration.accessoryCategories");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessoryCategoryLogEvent accessoryDetailsType](self, "accessoryDetailsType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("accessoryDetailsType"));

  -[HMDAccessoryCategoryLogEvent accessoryCategoryIdentifier](self, "accessoryCategoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessoryCategoryUUID"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E8B326B8, CFSTR("accessoryCategoryCount"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v6;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (unint64_t)accessoryDetailsType
{
  return self->_accessoryDetailsType;
}

- (NSString)accessoryCategoryIdentifier
{
  return self->_accessoryCategoryIdentifier;
}

- (BOOL)isDenominatorSpecifying
{
  return self->_isDenominatorSpecifying;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryCategoryIdentifier, 0);
}

+ (id)denominatorSpecifyingEvent
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithAccessoryDetailsType:accessoryCategoryIdentifier:homeUUID:", 0, 0, v3);

  return v4;
}

@end
