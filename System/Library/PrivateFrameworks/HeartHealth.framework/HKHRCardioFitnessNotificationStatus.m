@implementation HKHRCardioFitnessNotificationStatus

- (HKHRCardioFitnessNotificationStatus)initWithState:(int64_t)a3 unavailableReasons:(int64_t)a4 wristDetectEnabled:(BOOL)a5
{
  HKHRCardioFitnessNotificationStatus *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKHRCardioFitnessNotificationStatus;
  result = -[HKHRCardioFitnessNotificationStatus init](&v9, sel_init);
  if (result)
  {
    result->_state = a3;
    result->_notificationUnavailableReasons = a4;
    result->_wristDetectEnabled = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  HKHRCardioFitnessNotificationStatus *v4;
  HKHRCardioFitnessNotificationStatus *v5;
  BOOL v6;

  v4 = (HKHRCardioFitnessNotificationStatus *)a3;
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
        && self->_wristDetectEnabled == v5->_wristDetectEnabled;

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
  int64_t v2;
  void *v3;
  unint64_t v4;

  v2 = self->_notificationUnavailableReasons ^ self->_state;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wristDetectEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 ^ objc_msgSend(v3, "hash");

  return v4;
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
  objc_msgSend(v5, "encodeBool:forKey:", self->_wristDetectEnabled, CFSTR("WristDetectEnabled"));

}

- (HKHRCardioFitnessNotificationStatus)initWithCoder:(id)a3
{
  id v4;
  HKHRCardioFitnessNotificationStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKHRCardioFitnessNotificationStatus;
  v5 = -[HKHRCardioFitnessNotificationStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("State"));
    v5->_notificationUnavailableReasons = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NotificationUnavailableReasons"));
    v5->_wristDetectEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WristDetectEnabled"));
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

- (BOOL)wristDetectEnabled
{
  return self->_wristDetectEnabled;
}

@end
