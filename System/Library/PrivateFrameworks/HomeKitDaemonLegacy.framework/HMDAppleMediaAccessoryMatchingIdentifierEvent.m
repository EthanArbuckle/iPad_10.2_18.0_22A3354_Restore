@implementation HMDAppleMediaAccessoryMatchingIdentifierEvent

- (HMDAppleMediaAccessoryMatchingIdentifierEvent)initWithMatchingIdentifiersCount:(int64_t)a3
{
  HMDAppleMediaAccessoryMatchingIdentifierEvent *v4;
  uint64_t v5;
  NSNumber *matchingIdentifiersCount;
  uint64_t v7;
  NSNumber *expectedRemovalCount;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMDAppleMediaAccessoryMatchingIdentifierEvent;
  v4 = -[HMMLogEvent init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    matchingIdentifiersCount = v4->_matchingIdentifiersCount;
    v4->_matchingIdentifiersCount = (NSNumber *)v5;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3 - 1);
    v7 = objc_claimAutoreleasedReturnValue();
    expectedRemovalCount = v4->_expectedRemovalCount;
    v4->_expectedRemovalCount = (NSNumber *)v7;

  }
  return v4;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.HMDAppleMediaAccessoryMatchingIdentifierEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("matchingIdentifiersCount");
  -[HMDAppleMediaAccessoryMatchingIdentifierEvent matchingIdentifiersCount](self, "matchingIdentifiersCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("expectedRemovalCount");
  v8[0] = v3;
  -[HMDAppleMediaAccessoryMatchingIdentifierEvent expectedRemovalCount](self, "expectedRemovalCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAppleMediaAccessoryMatchingIdentifierEvent matchingIdentifiersCount](self, "matchingIdentifiersCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("matchingIdentifiersCount"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAppleMediaAccessoryMatchingIdentifierEvent expectedRemovalCount](self, "expectedRemovalCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("expectedRemovalCount"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSNumber)matchingIdentifiersCount
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)expectedRemovalCount
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedRemovalCount, 0);
  objc_storeStrong((id *)&self->_matchingIdentifiersCount, 0);
}

@end
