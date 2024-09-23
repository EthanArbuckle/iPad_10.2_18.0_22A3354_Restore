@implementation AXDeviceRemoteScreenService

+ (_TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService)sharedInstance
{
  if (qword_2553A5990 != -1)
    swift_once();
  return (_TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService *)(id)qword_2553A5AE0;
}

- (_TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_class *v5;
  id v6;
  _TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService *v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl);
  v5 = (objc_class *)type metadata accessor for AXWatchRemoteScreenServiceAXUIService();
  v6 = objc_allocWithZone(v5);
  v7 = self;
  v8 = objc_msgSend(v6, sel_init);
  v4[3] = v5;
  v4[4] = &off_24E1A2688;
  *v4 = v8;
  v9 = (Class *)((char *)&v7->super.isa
               + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_twiceEnabledEvent);
  *v9 = 0xD000000000000036;
  v9[1] = 0x800000021DC01B50;
  v10 = (Class *)((char *)&v7->super.isa
                + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_twiceEnabledKey);
  *v10 = 0x64656C62616E65;
  v10[1] = 0xE700000000000000;

  v12.receiver = v7;
  v12.super_class = ObjectType;
  return -[AXDeviceRemoteScreenService init](&v12, sel_init);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)npsSetTwiceEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(_BOOL8, uint64_t, uint64_t);
  _TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService *v8;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  sub_21DBF6858((uint64_t)self + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl, (uint64_t)v10);
  v5 = v11;
  v6 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v7 = *(void (**)(_BOOL8, uint64_t, uint64_t))(v6 + 24);
  v8 = self;
  v7(v3, v5, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);

  return 1;
}

- (BOOL)startTwiceRemoteScreen
{
  _TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = AXDeviceRemoteScreenService.startTwiceRemoteScreen()();

  return v3;
}

- (BOOL)stopTwiceRemoteScreen
{
  _TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = AXDeviceRemoteScreenService.stopTwiceRemoteScreen()();

  return v3;
}

@end
