@implementation HMAccessoryLastSeenStatus

- (HMAccessoryLastSeenStatus)initWithLastSeenDate:(id)a3 batteryStatus:(unint64_t)a4
{
  id v7;
  HMAccessoryLastSeenStatus *v8;
  HMAccessoryLastSeenStatus *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMAccessoryLastSeenStatus;
  v8 = -[HMAccessoryLastSeenStatus init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lastSeenDate, a3);
    v9->_lowBatteryStatus = a4;
  }

  return v9;
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (unint64_t)lowBatteryStatus
{
  return self->_lowBatteryStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
}

@end
