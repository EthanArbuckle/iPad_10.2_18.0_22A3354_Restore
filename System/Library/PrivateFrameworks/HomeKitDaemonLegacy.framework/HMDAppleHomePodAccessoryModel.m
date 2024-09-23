@implementation HMDAppleHomePodAccessoryModel

- (id)_initWithObjectChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDAppleHomePodAccessoryModel;
  return -[HMDAppleMediaAccessoryModel _initWithObjectChangeType:uuid:parentUUID:](&v6, sel__initWithObjectChangeType_uuid_parentUUID_, a3, a4, a5);
}

@end
