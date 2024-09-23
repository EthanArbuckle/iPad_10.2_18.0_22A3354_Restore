@implementation CellularDataListItemProvider

- (void)dealloc
{
  _TtC11SettingsApp28CellularDataListItemProvider *v2;

  v2 = self;
  sub_10006C088();
}

- (void).cxx_destruct
{
  sub_1000076B4((uint64_t)self + OBJC_IVAR____TtC11SettingsApp28CellularDataListItemProvider_id, type metadata accessor for PrimarySettingsListItemIdentifier);
  sub_100005474((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC11SettingsApp28CellularDataListItemProvider_invalidator));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11SettingsApp28CellularDataListItemProvider_airplaneModeListItemProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11SettingsApp28CellularDataListItemProvider_cellularDataSettingObserver));
  sub_10000BA50((uint64_t)self + OBJC_IVAR____TtC11SettingsApp28CellularDataListItemProvider_cancellable, &qword_1001587E0);
}

- (_TtC11SettingsApp28CellularDataListItemProvider)init
{
  _TtC11SettingsApp28CellularDataListItemProvider *result;

  result = (_TtC11SettingsApp28CellularDataListItemProvider *)_swift_stdlib_reportUnimplementedInitializer("SettingsApp.CellularDataListItemProvider", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _TtC11SettingsApp28CellularDataListItemProvider *v10;
  id v11;
  id v12;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_opt_self(NSNotificationCenter);
  v9 = a3;
  v10 = self;
  v11 = objc_msgSend(v8, "defaultCenter");
  v12 = v11;
  if (qword_100156D88 != -1)
  {
    swift_once(&qword_100156D88, sub_100108E68);
    v11 = v12;
  }
  objc_msgSend(v11, "postNotificationName:object:", qword_10015D458, 0);

  swift_bridgeObjectRelease(v7);
}

@end
