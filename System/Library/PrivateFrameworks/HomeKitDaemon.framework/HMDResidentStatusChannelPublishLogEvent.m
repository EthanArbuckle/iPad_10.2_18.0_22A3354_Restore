@implementation HMDResidentStatusChannelPublishLogEvent

- (HMDResidentStatusChannelPublishLogEvent)initWithHomeUUID:(id)a3 publishReason:(int64_t)a4
{
  return -[HMDResidentStatusChannelPublishLogEvent initWithHomeUUID:publishReason:count:](self, "initWithHomeUUID:publishReason:count:", a3, a4, 1);
}

- (HMDResidentStatusChannelPublishLogEvent)initWithHomeUUID:(id)a3 publishReason:(int64_t)a4 count:(int64_t)a5
{
  HMDResidentStatusChannelPublishLogEvent *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDResidentStatusChannelPublishLogEvent;
  result = -[HMMHomeLogEvent initWithHomeUUID:](&v8, sel_initWithHomeUUID_, a3);
  if (result)
  {
    result->_publishReason = a4;
    result->_count = a5;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.statuskit.channel.residentStatus.publish");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDResidentStatusChannelPublishLogEvent count](self, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("publishReasonCountAny"));

  if (-[HMDResidentStatusChannelPublishLogEvent count](self, "count"))
  {
    if (-[HMDResidentStatusChannelPublishLogEvent publishReason](self, "publishReason"))
      v5 = &unk_24E96D3D0;
    else
      v5 = &unk_24E96D3B8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("publishReasonCountUnknown"));
    if (-[HMDResidentStatusChannelPublishLogEvent publishReason](self, "publishReason") == 1)
      v6 = &unk_24E96D3B8;
    else
      v6 = &unk_24E96D3D0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("publishReasonCountResident"));
    if (-[HMDResidentStatusChannelPublishLogEvent publishReason](self, "publishReason") == 2)
      v7 = &unk_24E96D3B8;
    else
      v7 = &unk_24E96D3D0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("publishReasonCountBecamePrimary"));
    if (-[HMDResidentStatusChannelPublishLogEvent publishReason](self, "publishReason") == 3)
      v8 = &unk_24E96D3B8;
    else
      v8 = &unk_24E96D3D0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("publishReasonCountLostPrimary"));
    if (-[HMDResidentStatusChannelPublishLogEvent publishReason](self, "publishReason") == 4)
      v9 = &unk_24E96D3B8;
    else
      v9 = &unk_24E96D3D0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("publishReasonCountPreferredResidentsListUpdate"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDResidentStatusChannelPublishLogEvent publishReason](self, "publishReason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("publishReason"));

  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v11;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (int64_t)publishReason
{
  return self->_publishReason;
}

- (int64_t)count
{
  return self->_count;
}

+ (id)denominatorEvent:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHomeUUID:publishReason:count:", v3, 0, 0);

  return v4;
}

@end
