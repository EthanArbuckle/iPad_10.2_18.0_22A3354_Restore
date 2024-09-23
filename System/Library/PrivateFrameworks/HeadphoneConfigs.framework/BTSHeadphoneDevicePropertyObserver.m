@implementation BTSHeadphoneDevicePropertyObserver

- (HPMHeadphoneDevice)headphoneDevice
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice);
  swift_beginAccess();
  return (HPMHeadphoneDevice *)*v2;
}

- (void)setHeadphoneDevice:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *v8;

  v5 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_1DB381BC8();
}

- (BOOL)reloadTriggered
{
  _TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *v3;
  BOOL v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_1DB3BC214();
  swift_release();
  swift_release();

  return v5;
}

- (void)setReloadTriggered:(BOOL)a3
{
  _TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_1DB3BC220();
}

- (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver)initWithDevice:(id)a3 onChangeAction:(id)a4 onChangeReloadAllAction:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  v11 = a3;
  return (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *)sub_1DB382D48(a3, (uint64_t)sub_1DB3837D0, v9, (uint64_t)sub_1DB383A8C, v10);
}

- (void)reloadAll
{
  void (*v2)(uint64_t);
  _TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *v3;

  v2 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0xB8);
  v3 = self;
  v2(1);

}

- (void)dealloc
{
  _QWORD *v3;
  _TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *v4;
  objc_super v5;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_listeners);
  swift_beginAccess();
  *v3 = MEMORY[0x1E0DEE9E8];
  v4 = self;
  swift_bridgeObjectRelease();
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for BTSHeadphoneDevicePropertyObserver();
  -[BTSHeadphoneDevicePropertyObserver dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver__reloadTriggered;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

- (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver)init
{
  _TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *result;

  result = (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
