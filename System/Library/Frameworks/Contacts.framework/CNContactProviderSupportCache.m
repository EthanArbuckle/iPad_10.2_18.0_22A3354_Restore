@implementation CNContactProviderSupportCache

+ (_TtC8Contacts29CNContactProviderSupportCache)sharedCache
{
  if (qword_1EE17E7E8 != -1)
    swift_once();
  return (_TtC8Contacts29CNContactProviderSupportCache *)(id)qword_1EE17E7E0;
}

- (NSArray)cachedBundleIdentifiers
{
  _TtC8Contacts29CNContactProviderSupportCache *v3;
  uint64_t v4;
  void *v5;

  swift_beginAccess();
  v3 = self;
  v4 = swift_bridgeObjectRetain();
  sub_18F9E880C(v4);

  swift_bridgeObjectRelease();
  v5 = (void *)sub_18FA28438();
  swift_release();
  return (NSArray *)v5;
}

- (_TtC8Contacts29CNContactProviderSupportCache)init
{
  return (_TtC8Contacts29CNContactProviderSupportCache *)sub_18FA07718();
}

- (void)invalidateCache
{
  _TtC8Contacts29CNContactProviderSupportCache *v2;

  v2 = self;
  sub_18FA07920((uint64_t)v2);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
