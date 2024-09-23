@implementation AMSEngagementMessageCache

- (AMSEngagementMessageCache)init
{
  return (AMSEngagementMessageCache *)EngagementMessageCache.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (id)filterWithMessage:(id)a3
{
  id v4;
  AMSEngagementMessageCache *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_18C8B084C(v4);

  v6 = (void *)sub_18CEC199C();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)addWithCachePolicy:(int64_t)a3 placement:(id)a4 serviceType:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  AMSEngagementMessageCache *v13;

  v7 = sub_18CEC181C();
  v9 = v8;
  v10 = sub_18CEC181C();
  v12 = v11;
  v13 = self;
  sub_18C95677C(a3, v7, v9, v10, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)isBlockedWithMessageRequest:(id)a3 placement:(id)a4 serviceType:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  AMSEngagementMessageCache *v14;

  v7 = sub_18CEC181C();
  v9 = v8;
  v10 = sub_18CEC181C();
  v12 = v11;
  v13 = a3;
  v14 = self;
  LOBYTE(v10) = sub_18C95689C(v13, v7, v9, v10, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

@end
