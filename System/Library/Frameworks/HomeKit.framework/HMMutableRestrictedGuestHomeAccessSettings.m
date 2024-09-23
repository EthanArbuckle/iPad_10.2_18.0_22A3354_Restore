@implementation HMMutableRestrictedGuestHomeAccessSettings

- (id)copyWithZone:(_NSZone *)a3
{
  HMRestrictedGuestHomeAccessSettings *v4;
  void *v5;
  void *v6;

  v4 = -[HMRestrictedGuestHomeAccessSettings init](+[HMRestrictedGuestHomeAccessSettings allocWithZone:](HMRestrictedGuestHomeAccessSettings, "allocWithZone:", a3), "init");
  -[HMRestrictedGuestHomeAccessSettings accessAllowedToAccessories](self, "accessAllowedToAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRestrictedGuestHomeAccessSettings setAccessAllowedToAccessories:](v4, "setAccessAllowedToAccessories:", v5);

  -[HMRestrictedGuestHomeAccessSettings guestAccessSchedule](self, "guestAccessSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRestrictedGuestHomeAccessSettings setGuestAccessSchedule:](v4, "setGuestAccessSchedule:", v6);

  return v4;
}

@end
