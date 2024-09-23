@implementation BlurrableToolbar

- (_TtC12MobileSafari16BlurrableToolbar)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12MobileSafari16BlurrableToolbar____lazy_storage___blurRadius) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BlurrableToolbar();
  return -[BlurrableToolbar initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12MobileSafari16BlurrableToolbar)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12MobileSafari16BlurrableToolbar____lazy_storage___blurRadius) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BlurrableToolbar();
  return -[BlurrableToolbar initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari16BlurrableToolbar____lazy_storage___blurRadius));
}

@end
