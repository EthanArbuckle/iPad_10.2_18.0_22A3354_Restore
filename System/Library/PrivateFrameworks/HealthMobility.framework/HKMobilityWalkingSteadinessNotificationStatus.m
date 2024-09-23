@implementation HKMobilityWalkingSteadinessNotificationStatus

- (HKMobilityWalkingSteadinessNotificationStatus)initWithState:(int64_t)a3 unavailableReasons:(int64_t)a4 fitnessTrackingEnabled:(BOOL)a5 healthNotificationsDisabled:(BOOL)a6
{
  HKMobilityWalkingSteadinessNotificationStatus *v10;
  HKMobilityWalkingSteadinessNotificationStatus *v11;
  HKMobilityWalkingSteadinessNotificationStatus *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HKMobilityWalkingSteadinessNotificationStatus;
  v10 = -[HKMobilityWalkingSteadinessNotificationStatus init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_state = a3;
    v10->_notificationUnavailableReasons = a4;
    v10->_fitnessTrackingEnabled = a5;
    v10->_healthNotificationsDisabled = a6;
    v12 = v10;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HKMobilityWalkingSteadinessNotificationStatus *v4;
  HKMobilityWalkingSteadinessNotificationStatus *v5;
  BOOL v6;

  v4 = (HKMobilityWalkingSteadinessNotificationStatus *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_state == v5->_state
        && self->_notificationUnavailableReasons == v5->_notificationUnavailableReasons
        && self->_fitnessTrackingEnabled == v5->_fitnessTrackingEnabled
        && self->_healthNotificationsDisabled == v5->_healthNotificationsDisabled;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = self->_notificationUnavailableReasons ^ self->_state;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fitnessTrackingEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ objc_msgSend(v4, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_healthNotificationsDisabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", state, CFSTR("State"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_notificationUnavailableReasons, CFSTR("NotificationUnavailableReasons"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fitnessTrackingEnabled, CFSTR("FitnessTrackingEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_healthNotificationsDisabled, CFSTR("HealthNotificationsDisabled"));

}

- (HKMobilityWalkingSteadinessNotificationStatus)initWithCoder:(id)a3
{
  id v4;
  HKMobilityWalkingSteadinessNotificationStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKMobilityWalkingSteadinessNotificationStatus;
  v5 = -[HKMobilityWalkingSteadinessNotificationStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("State"));
    v5->_notificationUnavailableReasons = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NotificationUnavailableReasons"));
    v5->_fitnessTrackingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FitnessTrackingEnabled"));
    v5->_healthNotificationsDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HealthNotificationsDisabled"));
  }

  return v5;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)notificationUnavailableReasons
{
  return self->_notificationUnavailableReasons;
}

- (BOOL)fitnessTrackingEnabled
{
  return self->_fitnessTrackingEnabled;
}

- (BOOL)healthNotificationsDisabled
{
  return self->_healthNotificationsDisabled;
}

@end
