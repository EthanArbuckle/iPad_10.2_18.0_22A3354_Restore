@implementation HMDBLEBroadcastEventKeyGeneration

- (id)initBroadcastKeyGenerationEventForAccessory:(id)a3 reason:(int)a4
{
  id v7;
  HMDBLEBroadcastEventKeyGeneration *v8;
  HMDBLEBroadcastEventKeyGeneration *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDBLEBroadcastEventKeyGeneration;
  v8 = -[HMMLogEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accessory, a3);
    v9->_reason = a4;
  }

  return v9;
}

- (HMDAccessory)accessory
{
  return self->_accessory;
}

- (int)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
}

+ (id)broadcastKeyGenerationEventForAccessory:(id)a3 reason:(int)a4
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[HMDBLEBroadcastEventKeyGeneration initBroadcastKeyGenerationEventForAccessory:reason:]([HMDBLEBroadcastEventKeyGeneration alloc], "initBroadcastKeyGenerationEventForAccessory:reason:", v5, v4);

  return v6;
}

@end
