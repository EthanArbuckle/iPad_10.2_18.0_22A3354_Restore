@implementation HMDBLEBroadcastEventReceived

- (id)initBroadcastEventFromAccessory:(id)a3 withExpectedGSN:(BOOL)a4
{
  id v7;
  HMDBLEBroadcastEventReceived *v8;
  HMDBLEBroadcastEventReceived *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDBLEBroadcastEventReceived;
  v8 = -[HMMLogEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accessory, a3);
    v9->_hasExpectedGSN = a4;
  }

  return v9;
}

- (HMDAccessory)accessory
{
  return self->_accessory;
}

- (BOOL)hasExpectedGSN
{
  return self->_hasExpectedGSN;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
}

+ (id)broadcastEventFromAccessory:(id)a3 withExpectedGSN:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = -[HMDBLEBroadcastEventReceived initBroadcastEventFromAccessory:withExpectedGSN:]([HMDBLEBroadcastEventReceived alloc], "initBroadcastEventFromAccessory:withExpectedGSN:", v5, v4);

  return v6;
}

@end
