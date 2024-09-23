@implementation GeneralSettingsListItemProvider

- (void)dealloc
{
  _TtC11SettingsApp31GeneralSettingsListItemProvider *v2;

  v2 = self;
  sub_1000809A0();
}

- (void).cxx_destruct
{
  sub_1000076B4((uint64_t)self + OBJC_IVAR____TtC11SettingsApp31GeneralSettingsListItemProvider_id, type metadata accessor for PrimarySettingsListItemIdentifier);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp31GeneralSettingsListItemProvider_softwareUpdateClient));
  sub_100005474((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC11SettingsApp31GeneralSettingsListItemProvider_invalidator));
}

- (_TtC11SettingsApp31GeneralSettingsListItemProvider)init
{
  _TtC11SettingsApp31GeneralSettingsListItemProvider *result;

  result = (_TtC11SettingsApp31GeneralSettingsListItemProvider *)_swift_stdlib_reportUnimplementedInitializer("SettingsApp.GeneralSettingsListItemProvider", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)client:(id)a3 scanDidCompleteForOptions:(id)a4 results:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC11SettingsApp31GeneralSettingsListItemProvider *v13;
  id v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  v14 = a6;
  sub_100080F28();

}

@end
