@implementation AMSAccountCachedServerStringCore

- (void).cxx_destruct
{
  sub_18C906290((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___AMSAccountCachedServerStringCore_cachedValue, &qword_1ECEA9908);
}

- (id)token
{
  return (id)AccountCachedServerData.AccountStringObject.token.getter();
}

- (NSDate)expiration
{
  return (NSDate *)sub_18C91DFC4((uint64_t)self, (uint64_t)a2, (void (*)(void))AccountCachedServerData.AccountStringObject.expiration.getter);
}

- (BOOL)isStale
{
  AMSAccountCachedServerStringCore *v2;
  char v3;

  v2 = self;
  v3 = AccountCachedServerData.AccountStringObject.isStale.getter();

  return v3 & 1;
}

- (NSString)value
{
  uint64_t v2;
  void *v3;

  AccountCachedServerData.AccountStringObject.value.getter();
  if (v2)
  {
    v3 = (void *)sub_18CEC17F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setToken:(id)a3
{
  AMSAccountCachedServerStringCore *v5;

  swift_unknownObjectRetain();
  v5 = self;
  AccountCachedServerData.AccountStringObject.token.setter((uint64_t)a3);

}

- (NSString)description
{
  return (NSString *)sub_18C91DE5C(self, (uint64_t)a2, (void (*)(void))AccountCachedServerData.AccountStringObject.description.getter);
}

- (AMSAccountCachedServerStringCore)init
{
  AccountCachedServerData.AccountStringObject.init()();
}

@end
