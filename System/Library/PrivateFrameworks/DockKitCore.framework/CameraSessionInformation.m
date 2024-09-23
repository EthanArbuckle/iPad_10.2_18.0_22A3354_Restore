@implementation CameraSessionInformation

- (id)copyWithZone:(void *)a3
{
  return (id)sub_23A5C01B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))CameraSessionInformation.copy(with:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore24CameraSessionInformation)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore24CameraSessionInformation_appId);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore24CameraSessionInformation_startTime) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore24CameraSessionInformation_endTime) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore24CameraSessionInformation_cameraType) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore24CameraSessionInformation_azimuth) = (Class)0x400921FB54442D18;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[CameraSessionInformation init](&v6, sel_init);
}

- (_TtC11DockKitCore24CameraSessionInformation)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore24CameraSessionInformation *)CameraSessionInformation.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore24CameraSessionInformation *v5;

  v4 = a3;
  v5 = self;
  CameraSessionInformation.encode(with:)((NSCoder)v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
