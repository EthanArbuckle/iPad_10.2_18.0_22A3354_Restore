@implementation CallRecordingButton

- (_TtC16CommunicationsUI19CallRecordingButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC16CommunicationsUI19CallRecordingButton *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16CommunicationsUI19CallRecordingButton____lazy_storage___icon) = (Class)1;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[CallRecordingButton initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  sub_2383C8D98();

  return v9;
}

- (_TtC16CommunicationsUI19CallRecordingButton)initWithCoder:(id)a3
{
  id v4;
  _TtC16CommunicationsUI19CallRecordingButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16CommunicationsUI19CallRecordingButton____lazy_storage___icon) = (Class)1;
  v4 = a3;

  result = (_TtC16CommunicationsUI19CallRecordingButton *)sub_2383D045C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2383C9144(*(id *)((char *)&self->super.super.super.super.super.isa
                      + OBJC_IVAR____TtC16CommunicationsUI19CallRecordingButton____lazy_storage___icon));
}

@end
