@implementation SatelliteListItemProvider

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC11SettingsApp25SatelliteListItemProvider *v5;
  void *v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_stewieStateMonitor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_stewieStateMonitor) = 0;
  v5 = self;

  v6 = *(Class *)((char *)&v5->super.isa
                + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_idsOffGridStateManager);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_idsOffGridStateManager) = 0;

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[SatelliteListItemProvider dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  sub_1000076B4((uint64_t)self + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_id, type metadata accessor for PrimarySettingsListItemIdentifier);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_satelliteStateLock));
  sub_10009AF50(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_satelliteState), *(_QWORD *)&self->satelliteStateLock[OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_satelliteState]);
  sub_100005474((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_invalidator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_stewieStateMonitor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp25SatelliteListItemProvider_idsOffGridStateManager));
}

- (_TtC11SettingsApp25SatelliteListItemProvider)init
{
  _TtC11SettingsApp25SatelliteListItemProvider *result;

  result = (_TtC11SettingsApp25SatelliteListItemProvider *)_swift_stdlib_reportUnimplementedInitializer("SettingsApp.SatelliteListItemProvider", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)stateChanged:(id)a3
{
  id v4;
  _TtC11SettingsApp25SatelliteListItemProvider *v5;

  v4 = a3;
  v5 = self;
  sub_10009A964(v4);

}

- (void)manager:(id)a3 offGridModeUpdated:(int64_t)a4 publishStatus:(int64_t)a5 context:(id)a6
{
  id v9;
  id v10;
  _TtC11SettingsApp25SatelliteListItemProvider *v11;

  v9 = a3;
  v10 = a6;
  v11 = self;
  sub_10009B01C(a4);

}

@end
