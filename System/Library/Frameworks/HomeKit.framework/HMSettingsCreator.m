@implementation HMSettingsCreator

- (id)createSettingsWithOwner:(id)a3
{
  id v3;
  HMSettings *v4;

  v3 = a3;
  v4 = -[HMSettings initWithSettingsOwner:]([HMSettings alloc], "initWithSettingsOwner:", v3);

  return v4;
}

@end
