@implementation _DDWirelessSettingsController

- (_TtC17DeviceDiscoveryUI29_DDWirelessSettingsController)init
{
  return (_TtC17DeviceDiscoveryUI29_DDWirelessSettingsController *)sub_23A4216B4();
}

- (void)wirelessSettingsDidChange:(id)a3
{
  id v5;
  _TtC17DeviceDiscoveryUI29_DDWirelessSettingsController *v6;

  v5 = a3;
  v6 = self;
  sub_23A4217F0(a3);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUI29_DDWirelessSettingsController_controller));
  v3 = (char *)self + OBJC_IVAR____TtC17DeviceDiscoveryUI29_DDWirelessSettingsController__viewType;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25697C0C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
