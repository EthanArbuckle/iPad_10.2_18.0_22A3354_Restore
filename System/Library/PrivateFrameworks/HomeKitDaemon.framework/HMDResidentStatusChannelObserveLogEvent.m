@implementation HMDResidentStatusChannelObserveLogEvent

- (HMDResidentStatusChannelObserveLogEvent)initWithHomeUUID:(id)a3 didLoseStatuses:(BOOL)a4 didAddStatuses:(BOOL)a5 didUpdateStatuses:(BOOL)a6 didFindPrimary:(BOOL)a7 didPrimaryChange:(BOOL)a8 isStatusesEmpty:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  return -[HMDResidentStatusChannelObserveLogEvent initWithHomeUUID:didLoseStatuses:didAddStatuses:didUpdateStatuses:didFindPrimary:didPrimaryChange:isStatusesEmpty:count:](self, "initWithHomeUUID:didLoseStatuses:didAddStatuses:didUpdateStatuses:didFindPrimary:didPrimaryChange:isStatusesEmpty:count:", a3, a4, a5, a6, a7, a8, v10, 1);
}

- (HMDResidentStatusChannelObserveLogEvent)initWithHomeUUID:(id)a3 didLoseStatuses:(BOOL)a4 didAddStatuses:(BOOL)a5 didUpdateStatuses:(BOOL)a6 didFindPrimary:(BOOL)a7 didPrimaryChange:(BOOL)a8 isStatusesEmpty:(BOOL)a9 count:(int64_t)a10
{
  HMDResidentStatusChannelObserveLogEvent *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HMDResidentStatusChannelObserveLogEvent;
  result = -[HMMHomeLogEvent initWithHomeUUID:](&v16, sel_initWithHomeUUID_, a3);
  if (result)
  {
    result->_didLoseStatuses = a4;
    result->_didAddStatuses = a5;
    result->_didUpdateStatuses = a6;
    result->_didFindPrimary = a7;
    result->_didPrimaryChange = a8;
    result->_isStatusesEmpty = a9;
    result->_count = a10;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.statuskit.channel.residentStatus.observe");
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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDResidentStatusChannelObserveLogEvent count](self, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("countObserveAny"));

  if (-[HMDResidentStatusChannelObserveLogEvent count](self, "count"))
  {
    if (-[HMDResidentStatusChannelObserveLogEvent didLoseStatuses](self, "didLoseStatuses"))
      v5 = &unk_24E96D3B8;
    else
      v5 = &unk_24E96D3D0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("countLostStatuses"));
    if (-[HMDResidentStatusChannelObserveLogEvent didAddStatuses](self, "didAddStatuses"))
      v6 = &unk_24E96D3B8;
    else
      v6 = &unk_24E96D3D0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("countAddedStatuses"));
    if (-[HMDResidentStatusChannelObserveLogEvent didUpdateStatuses](self, "didUpdateStatuses"))
      v7 = &unk_24E96D3B8;
    else
      v7 = &unk_24E96D3D0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("countUpdatedStatuses"));
    if (-[HMDResidentStatusChannelObserveLogEvent didFindPrimary](self, "didFindPrimary"))
      v8 = &unk_24E96D3D0;
    else
      v8 = &unk_24E96D3B8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("countPrimaryNotFound"));
    if (-[HMDResidentStatusChannelObserveLogEvent didPrimaryChange](self, "didPrimaryChange"))
      v9 = &unk_24E96D3B8;
    else
      v9 = &unk_24E96D3D0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("countPrimaryChanged"));
    if (-[HMDResidentStatusChannelObserveLogEvent isStatusesEmpty](self, "isStatusesEmpty"))
      v10 = &unk_24E96D3B8;
    else
      v10 = &unk_24E96D3D0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("countEmptyStatuses"));
  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v11;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (BOOL)didLoseStatuses
{
  return self->_didLoseStatuses;
}

- (BOOL)didAddStatuses
{
  return self->_didAddStatuses;
}

- (BOOL)didUpdateStatuses
{
  return self->_didUpdateStatuses;
}

- (BOOL)didFindPrimary
{
  return self->_didFindPrimary;
}

- (BOOL)didPrimaryChange
{
  return self->_didPrimaryChange;
}

- (BOOL)isStatusesEmpty
{
  return self->_isStatusesEmpty;
}

- (int64_t)count
{
  return self->_count;
}

+ (id)denominatorEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v6;

  v3 = a3;
  LOBYTE(v6) = 0;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHomeUUID:didLoseStatuses:didAddStatuses:didUpdateStatuses:didFindPrimary:didPrimaryChange:isStatusesEmpty:count:", v3, 0, 0, 0, 0, 0, v6, 0);

  return v4;
}

@end
