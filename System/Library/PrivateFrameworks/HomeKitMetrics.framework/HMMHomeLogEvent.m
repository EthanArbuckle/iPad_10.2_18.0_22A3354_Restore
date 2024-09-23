@implementation HMMHomeLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

- (HMMHomeLogEvent)initWithHomeUUID:(id)a3
{
  id v5;
  HMMHomeLogEvent *v6;
  HMMHomeLogEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMHomeLogEvent;
  v6 = -[HMMLogEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_homeUUID, a3);

  return v7;
}

- (HMMHomeLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4
{
  id v7;
  HMMHomeLogEvent *v8;
  HMMHomeLogEvent *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMMHomeLogEvent;
  v8 = -[HMMLogEvent initWithStartTime:](&v11, sel_initWithStartTime_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_homeUUID, a4);

  return v9;
}

- (NSString)homeUUIDString
{
  void *v2;
  void *v3;

  -[HMMHomeLogEvent homeUUID](self, "homeUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

@end
