@implementation AMSAccountCachedServerBoolCore

- (NSDate)expiration
{
  return (NSDate *)sub_18C91DFC4((uint64_t)self, (uint64_t)a2, (void (*)(void))AccountCachedServerData.AccountBoolObject.expiration.getter);
}

- (BOOL)isStale
{
  AMSAccountCachedServerBoolCore *v2;
  char v3;

  v2 = self;
  v3 = AccountCachedServerData.AccountBoolObject.isStale.getter();

  return v3 & 1;
}

- (NSNumber)value
{
  AMSAccountCachedServerBoolCore *v2;
  void *v3;
  void *v4;

  v2 = self;
  AccountCachedServerData.AccountBoolObject.value.getter();
  v4 = v3;

  return (NSNumber *)v4;
}

- (id)token
{
  return (id)AccountCachedServerData.AccountBoolObject.token.getter();
}

- (void)setToken:(id)a3
{
  AMSAccountCachedServerBoolCore *v5;

  swift_unknownObjectRetain();
  v5 = self;
  AccountCachedServerData.AccountBoolObject.token.setter((uint64_t)a3);

}

- (NSString)description
{
  return (NSString *)sub_18C91DE5C(self, (uint64_t)a2, (void (*)(void))AccountCachedServerData.AccountBoolObject.description.getter);
}

- (AMSAccountCachedServerBoolCore)init
{
  AccountCachedServerData.AccountBoolObject.init()();
}

- (void).cxx_destruct
{
  sub_18C906290((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___AMSAccountCachedServerBoolCore_cachedValue, &qword_1EE053608);
}

@end
