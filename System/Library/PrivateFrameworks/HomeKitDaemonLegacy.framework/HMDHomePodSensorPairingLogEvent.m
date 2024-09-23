@implementation HMDHomePodSensorPairingLogEvent

- (HMDHomePodSensorPairingLogEvent)initWithStartTime:(double)a3 pairingSuccess:(BOOL)a4 failureReason:(unint64_t)a5
{
  HMDHomePodSensorPairingLogEvent *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDHomePodSensorPairingLogEvent;
  result = -[HMMLogEvent initWithStartTime:](&v8, sel_initWithStartTime_, a3);
  if (result)
  {
    result->_pairingSuccess = a4;
    result->_failureReason = a5;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homekit.homepod.sensor.pairing");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMLogEvent startTime](self, "startTime");
  if (v4 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("duration"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomePodSensorPairingLogEvent pairingSuccess](self, "pairingSuccess"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("success"));

  -[HMMLogEvent error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("errorDomain"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HMMLogEvent error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "code"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("errorNumber"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHomePodSensorPairingLogEvent failureReason](self, "failureReason"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("failureReason"));

  v13 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v13;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (BOOL)pairingSuccess
{
  return self->_pairingSuccess;
}

- (unint64_t)failureReason
{
  return self->_failureReason;
}

@end
