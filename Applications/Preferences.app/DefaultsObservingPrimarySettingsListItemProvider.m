@implementation DefaultsObservingPrimarySettingsListItemProvider

- (void)dealloc
{
  _TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider *v2;

  v2 = self;
  sub_1000D0528();
}

- (void).cxx_destruct
{
  sub_100013014((uint64_t)self + OBJC_IVAR____TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider_id);
  sub_100005474((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider_invalidator));
  swift_bridgeObjectRelease(*(_QWORD *)&self->invalidator[OBJC_IVAR____TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider_defaultsKey]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider_userDefaults));
  sub_10000BFF4((uint64_t)self + OBJC_IVAR____TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider_defaultsObserver);
}

- (_TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider)init
{
  _TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider *result;

  result = (_TtC11SettingsApp48DefaultsObservingPrimarySettingsListItemProvider *)_swift_stdlib_reportUnimplementedInitializer("SettingsApp.DefaultsObservingPrimarySettingsListItemProvider", 60, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
