@implementation MFGrabber

- (_TtC16MagnifierSupport9MFGrabber)init
{
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  _TtC16MagnifierSupport9MFGrabber *v6;
  _TtC16MagnifierSupport9MFGrabber *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC16MagnifierSupport9MFGrabber_backgroundView;
  type metadata accessor for MFChevronView();
  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v6 = self;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)objc_msgSend(v5, sel_init);

  v9.receiver = v6;
  v9.super_class = ObjectType;
  v7 = -[MFGrabber initWithFrame:](&v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_2273917A0();
  sub_227391904();

  return v7;
}

- (_TtC16MagnifierSupport9MFGrabber)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MagnifierSupport9MFGrabber *result;

  v5 = OBJC_IVAR____TtC16MagnifierSupport9MFGrabber_backgroundView;
  type metadata accessor for MFChevronView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC16MagnifierSupport9MFGrabber *)sub_22758ECC4();
  __break(1u);
  return result;
}

- (CGRect)accessibilityFrame
{
  _TtC16MagnifierSupport9MFGrabber *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  sub_227391D14();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  uint64_t v2;
  _TtC16MagnifierSupport9MFGrabber *v3;

  v2 = qword_2540B87B8;
  v3 = self;
  if (v2 != -1)
    swift_once();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22758D1A0();

  return 1;
}

- (_TtC16MagnifierSupport9MFGrabber)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport9MFGrabber *result;

  result = (_TtC16MagnifierSupport9MFGrabber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
