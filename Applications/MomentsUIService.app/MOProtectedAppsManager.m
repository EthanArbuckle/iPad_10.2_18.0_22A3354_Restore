@implementation MOProtectedAppsManager

- (_TtC16MomentsUIService22MOProtectedAppsManager)init
{
  char *v2;
  objc_super v4;

  v2 = (char *)self + OBJC_IVAR____TtC16MomentsUIService22MOProtectedAppsManager_delegate;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_QWORD *)v2 + 4) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16MomentsUIService22MOProtectedAppsManager_monitoring) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MomentsUIService22MOProtectedAppsManager_monitoringSubjects) = (Class)&_swiftEmptySetSingleton;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MOProtectedAppsManager();
  return -[MOProtectedAppsManager init](&v4, "init");
}

- (void).cxx_destruct
{
  outlined destroy of MOProtectedAppsManagerDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService22MOProtectedAppsManager_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService22MOProtectedAppsManager_monitoringSubjects));
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  _TtC16MomentsUIService22MOProtectedAppsManager *v9;

  v7 = type metadata accessor for APSubject(0, a2);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  swift_unknownObjectRetain();
  v9 = self;
  specialized MOProtectedAppsManager.appProtectionSubjectsChanged(_:for:)(v8);
  swift_unknownObjectRelease(a4);

  swift_bridgeObjectRelease(v8);
}

@end
