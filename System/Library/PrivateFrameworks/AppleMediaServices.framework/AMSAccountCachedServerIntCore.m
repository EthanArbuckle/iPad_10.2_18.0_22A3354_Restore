@implementation AMSAccountCachedServerIntCore

- (NSDate)expiration
{
  return (NSDate *)sub_18C91DFC4((uint64_t)self, (uint64_t)a2, (void (*)(void))AccountCachedServerData.AccountIntObject.expiration.getter);
}

- (BOOL)isStale
{
  AMSAccountCachedServerIntCore *v2;
  char v3;

  v2 = self;
  v3 = AccountCachedServerData.AccountIntObject.isStale.getter();

  return v3 & 1;
}

- (NSNumber)value
{
  AMSAccountCachedServerIntCore *v2;
  void *v3;
  void *v4;

  v2 = self;
  AccountCachedServerData.AccountIntObject.value.getter();
  v4 = v3;

  return (NSNumber *)v4;
}

- (id)token
{
  return (id)AccountCachedServerData.AccountIntObject.token.getter();
}

- (void)setToken:(id)a3
{
  AMSAccountCachedServerIntCore *v5;

  swift_unknownObjectRetain();
  v5 = self;
  AccountCachedServerData.AccountIntObject.token.setter((uint64_t)a3);

}

- (NSString)description
{
  return (NSString *)sub_18C91DE5C(self, (uint64_t)a2, (void (*)(void))AccountCachedServerData.AccountIntObject.description.getter);
}

- (AMSAccountCachedServerIntCore)init
{
  AccountCachedServerData.AccountIntObject.init()();
}

- (void).cxx_destruct
{
  sub_18C906290((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___AMSAccountCachedServerIntCore_cachedValue, &qword_1EE054DE8);
}

@end
