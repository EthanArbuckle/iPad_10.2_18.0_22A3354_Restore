@implementation HMDDiscoveryController

- (HMDDiscoveryController)initWithDiscoveryNeedsAssertion:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  HMDDiscoveryController *v5;

  v3 = a3;
  v4 = objc_allocWithZone((Class)type metadata accessor for DiscoveryController(0));
  v5 = (HMDDiscoveryController *)sub_1CD0C92F4(v3, (uint64_t (*)(void))sub_1CD0C408C, 0, (uint64_t (*)(void))sub_1CD0C40BC, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)start
{
  HMDDiscoveryController *v2;

  v2 = self;
  DiscoveryController.start()();

}

- (id)obtainNetworkVisibleDevicesProto
{
  return sub_1CD0C523C(self, (uint64_t)a2, (void (*)(void))DiscoveryController.obtainNetworkVisibleDevicesProto());
}

- (id)obtainSFVisibleDevicesProto
{
  return sub_1CD0C523C(self, (uint64_t)a2, (void (*)(void))DiscoveryController.obtainSFVisibleDevicesProto());
}

- (HMDDiscoveryController)init
{
  HMDDiscoveryController *result;

  result = (HMDDiscoveryController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___HMDDiscoveryController_logger;
  v4 = sub_1CDAB840C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end
