@implementation HKHeartbeatSequenceSampleType

+ (id)heartbeatSequenceType
{
  return +[HKObjectType dataTypeWithCode:](HKSampleType, "dataTypeWithCode:", 119);
}

- (Class)dataObjectClass
{
  return (Class)objc_opt_class();
}

@end
