@implementation CALNTriggeredEventNotificationResponseData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CALNTriggeredEventNotificationResponseData)initWithHypothesis:(id)a3 lastFireTimeOfAlertOffsetFromTravelTime:(id)a4
{
  id v7;
  id v8;
  CALNTriggeredEventNotificationResponseData *v9;
  CALNTriggeredEventNotificationResponseData *v10;
  uint64_t v11;
  NSDate *lastFireTimeOfAlertOffsetFromTravelTime;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CALNTriggeredEventNotificationResponseData;
  v9 = -[CALNTriggeredEventNotificationResponseData init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hypothesis, a3);
    v11 = objc_msgSend(v8, "copy");
    lastFireTimeOfAlertOffsetFromTravelTime = v10->_lastFireTimeOfAlertOffsetFromTravelTime;
    v10->_lastFireTimeOfAlertOffsetFromTravelTime = (NSDate *)v11;

  }
  return v10;
}

- (CALNTriggeredEventNotificationResponseData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CALNTriggeredEventNotificationResponseData *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hypothesis"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastFireTimeOfAlertOffsetFromTravelTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CALNTriggeredEventNotificationResponseData initWithHypothesis:lastFireTimeOfAlertOffsetFromTravelTime:](self, "initWithHypothesis:lastFireTimeOfAlertOffsetFromTravelTime:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CALNTriggeredEventNotificationResponseData hypothesis](self, "hypothesis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("hypothesis"));

  -[CALNTriggeredEventNotificationResponseData lastFireTimeOfAlertOffsetFromTravelTime](self, "lastFireTimeOfAlertOffsetFromTravelTime");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("lastFireTimeOfAlertOffsetFromTravelTime"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CALNTriggeredEventNotificationResponseData lastFireTimeOfAlertOffsetFromTravelTime](self, "lastFireTimeOfAlertOffsetFromTravelTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationResponseData hypothesis](self, "hypothesis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(lastFireTimeOfAlertOffsetFromTravelTime = %@, hypothesis = %@)"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (EKTravelEngineHypothesis)hypothesis
{
  return self->_hypothesis;
}

- (NSDate)lastFireTimeOfAlertOffsetFromTravelTime
{
  return self->_lastFireTimeOfAlertOffsetFromTravelTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFireTimeOfAlertOffsetFromTravelTime, 0);
  objc_storeStrong((id *)&self->_hypothesis, 0);
}

@end
