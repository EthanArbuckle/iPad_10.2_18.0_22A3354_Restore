@implementation AppStoreComponent.AppStoreCoordinator

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (id)productDetailsPresentationContextForLockupView:(id)a3
{
  return objc_msgSend(objc_allocWithZone((Class)ASCLockupProductDetailsPresentationContext), "initWithPresentationStyle:", 1);
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6;
  id v7;
  _TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000FB614(v6, (uint64_t)v7);

}

- (id)metricsActivityForLockupView:(id)a3 toPerformActionOfOffer:(id)a4
{
  id v6;
  _TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_1000FBDF8();

  swift_unknownObjectRelease(a4);
  return v8;
}

- (_TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator)init
{
  _TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator *result;

  result = (_TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator *)_swift_stdlib_reportUnimplementedInitializer("ShazamEventsApp.AppStoreCoordinator", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100020BA0(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator_onOpen), *(_QWORD *)&self->metricsQuery[OBJC_IVAR____TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator_onOpen]);
  sub_100020BA0(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator_onStateChange), *(_QWORD *)&self->metricsQuery[OBJC_IVAR____TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator_onStateChange]);
}

@end
