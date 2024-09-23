@implementation HAPMetricsPairVerifyEvent

- (HAPMetricsPairVerifyEvent)initWithAccessory:(id)a3 forLinkType:(id)a4 durationInMS:(unint64_t)a5 reason:(id)a6 connectionEstablishedUsing:(id)a7 pvError:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HAPMetricsPairVerifyEvent *v19;
  uint64_t v20;
  NSString *accessoryIdentifier;
  uint64_t v22;
  NSString *reason;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HAPMetricsPairVerifyEvent;
  v19 = -[HMMLogEvent init](&v25, sel_init);
  if (v19)
  {
    objc_msgSend(v14, "identifier");
    v20 = objc_claimAutoreleasedReturnValue();
    accessoryIdentifier = v19->_accessoryIdentifier;
    v19->_accessoryIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_linkType, a4);
    v19->_durationInMS = a5;
    v22 = objc_msgSend(v16, "copy");
    reason = v19->_reason;
    v19->_reason = (NSString *)v22;

    objc_storeStrong((id *)&v19->_connectionEstablishedUsing, a7);
    -[HMMLogEvent setError:](v19, "setError:", v18);
  }

  return v19;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPMetricsPairVerifyEvent accessoryIdentifier](self, "accessoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetricsPairVerifyEvent linkType](self, "linkType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPMetricsPairVerifyEvent durationInMS](self, "durationInMS");
  -[HAPMetricsPairVerifyEvent reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetricsPairVerifyEvent connectionEstablishedUsing](self, "connectionEstablishedUsing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMLogEvent error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HAPMetricsPairVerifyEvent - Accessory Identifier: %@, linkType: %@, duration: %lu ms, reason: %@, connection Established: %@ error: %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.pairverify");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HAPMetricsPairVerifyEvent durationInMS](self, "durationInMS") / 0x3E8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HAPMetricsPairVerifyEvent durationInMS](self, "durationInMS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("durationInMS"));

  -[HAPMetricsPairVerifyEvent linkType](self, "linkType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("linkType"));

  -[HAPMetricsPairVerifyEvent reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("reason"));

  -[HAPMetricsPairVerifyEvent connectionEstablishedUsing](self, "connectionEstablishedUsing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("connection"));

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v9;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 4;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (NSNumber)linkType
{
  return self->_linkType;
}

- (unint64_t)durationInMS
{
  return self->_durationInMS;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)connectionEstablishedUsing
{
  return self->_connectionEstablishedUsing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionEstablishedUsing, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_linkType, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end
