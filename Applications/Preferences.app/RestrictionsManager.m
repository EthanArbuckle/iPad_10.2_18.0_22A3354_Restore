@implementation RestrictionsManager

- (_TtC11SettingsApp19RestrictionsManager)init
{
  return (_TtC11SettingsApp19RestrictionsManager *)sub_1000C6EB8();
}

- (void)dealloc
{
  void *v3;
  _TtC11SettingsApp19RestrictionsManager *v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_opt_self(MCProfileConnection);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedConnection");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "unregisterObserver:", v4);

    v7.receiver = v4;
    v7.super_class = (Class)type metadata accessor for RestrictionsManager(0);
    -[RestrictionsManager dealloc](&v7, "dealloc");
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11SettingsApp19RestrictionsManager__restrictedFeatures));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11SettingsApp19RestrictionsManager__blockedAppBundleIDs));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11SettingsApp19RestrictionsManager__allowedAppBundleIDs));
  v3 = (char *)self + OBJC_IVAR____TtC11SettingsApp19RestrictionsManager___observationRegistrar;
  v4 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (uint64_t)profileConnectionDidReceiveRestrictionChangedNotification:(void *)a3 userInfo:(uint64_t)a4
{
  uint64_t v6;
  id v7;
  id v8;

  if (a4)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  v7 = a3;
  v8 = a1;
  _s11SettingsApp19RestrictionsManagerC027profileConnectionDidReceiveB28WhitelistChangedNotification_8userInfoySo09MCProfileF0CSg_SDys11AnyHashableVypGSgtF_0();

  return swift_bridgeObjectRelease(v6);
}

@end
