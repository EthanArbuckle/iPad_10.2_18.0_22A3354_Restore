@implementation _DDAskToAirDropManager

- (_TtC17DeviceDiscoveryUI22_DDAskToAirDropManager)init
{
  return (_TtC17DeviceDiscoveryUI22_DDAskToAirDropManager *)sub_23A41F868();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v3 = (char *)self + OBJC_IVAR____TtC17DeviceDiscoveryUI22_DDAskToAirDropManager__isSearching;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25697BFA0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC17DeviceDiscoveryUI22_DDAskToAirDropManager__isNFCEnabled, v4);
  v6 = (char *)self + OBJC_IVAR____TtC17DeviceDiscoveryUI22_DDAskToAirDropManager__nearbyDeviceCount;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25697B880);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC17DeviceDiscoveryUI22_DDAskToAirDropManager__sharingName;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25697BF90);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUI22_DDAskToAirDropManager_airDropController));
}

- (void)didChangeRadioState:(BOOL)a3
{
  _TtC17DeviceDiscoveryUI22_DDAskToAirDropManager *v3;

  v3 = self;
  sub_23A41FE78();

}

@end
