@implementation ProtectedAppsObserver

- (_TtC14CopresenceCore21ProtectedAppsObserver)init
{
  _TtC14CopresenceCore21ProtectedAppsObserver *v3;
  void *v4;
  _TtC14CopresenceCore21ProtectedAppsObserver *v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC14CopresenceCore21ProtectedAppsObserver_delegate] = 0;
  swift_unknownObjectWeakInit();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ProtectedAppsObserver();
  v3 = -[ProtectedAppsObserver init](&v8, sel_init);
  v4 = (void *)objc_opt_self();
  v5 = v3;
  v6 = objc_msgSend(objc_msgSend(v4, sel_subjectMonitorRegistry), sel_addMonitor_, v5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v5;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  unint64_t v5;
  _TtC14CopresenceCore21ProtectedAppsObserver *v6;

  type metadata accessor for APSubject();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  v6 = self;
  specialized ProtectedAppsObserver.appProtectionSubjectsChanged(_:for:)(v5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  outlined destroy of weak ActivitySessionManagerProtocol?((uint64_t)self + OBJC_IVAR____TtC14CopresenceCore21ProtectedAppsObserver_delegate);
}

@end
