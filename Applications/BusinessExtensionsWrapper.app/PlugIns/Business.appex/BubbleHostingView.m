@implementation BubbleHostingView

- (_TtC8Business17BubbleHostingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business17BubbleHostingView_delegate);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business17BubbleHostingView_subview) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BubbleHostingView();
  return -[BubbleHostingView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC8Business17BubbleHostingView)initWithCoder:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business17BubbleHostingView_delegate);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business17BubbleHostingView_subview) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BubbleHostingView();
  return -[BubbleHostingView initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Business17BubbleHostingView_delegate));

}

@end
