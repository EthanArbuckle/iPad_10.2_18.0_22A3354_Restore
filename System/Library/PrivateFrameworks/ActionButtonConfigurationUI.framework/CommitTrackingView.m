@implementation CommitTrackingView

- (void)layoutSubviews
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC27ActionButtonConfigurationUI18CommitTrackingView *v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC27ActionButtonConfigurationUI18CommitTrackingView_commitHandler);
  if (v2)
  {
    v4 = self;
    v3 = sub_235E34C94((uint64_t)v2);
    v2(v3);
    sub_235E34DD0((uint64_t)v2);

  }
}

- (_TtC27ActionButtonConfigurationUI18CommitTrackingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC27ActionButtonConfigurationUI18CommitTrackingView_commitHandler);
  *v9 = 0;
  v9[1] = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[CommitTrackingView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC27ActionButtonConfigurationUI18CommitTrackingView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC27ActionButtonConfigurationUI18CommitTrackingView_commitHandler);
  *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[CommitTrackingView initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_235E34DD0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC27ActionButtonConfigurationUI18CommitTrackingView_commitHandler));
}

@end
