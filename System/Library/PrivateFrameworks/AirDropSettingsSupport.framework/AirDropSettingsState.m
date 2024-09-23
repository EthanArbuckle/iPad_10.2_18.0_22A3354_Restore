@implementation AirDropSettingsState

- (_TtC22AirDropSettingsSupport20AirDropSettingsState)init
{
  return (_TtC22AirDropSettingsSupport20AirDropSettingsState *)AirDropSettingsState.init()();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC22AirDropSettingsSupport20AirDropSettingsState *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[AirDropSettingsState dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController));
  v3 = (char *)self + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState___observationRegistrar;
  v4 = sub_235FCB48C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)discoveryControllerSettingsDidChange:(void *)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v5 = a1;
    v4 = a3;
    sub_235FCAF64(v4);

  }
  else
  {
    __break(1u);
  }
}

@end
