@implementation _EXDiscoveryController

+ (_EXDiscoveryController)sharedInstance
{
  if (qword_1ECD98BA8 != -1)
    swift_once();
  return (_EXDiscoveryController *)(id)qword_1ECD99310;
}

- (_EXDiscoveryController)init
{
  return (_EXDiscoveryController *)sub_190C6ACA8();
}

- (void)observerDidObserveDatabaseChange:(id)a3
{
  id v4;
  _EXDiscoveryController *v5;

  v4 = a3;
  v5 = self;
  sub_190C6D858();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_190C459C8((uint64_t)self + OBJC_IVAR____EXDiscoveryController_settingsStoreToken);
  swift_release();

}

@end
