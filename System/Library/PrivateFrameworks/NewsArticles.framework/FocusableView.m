@implementation FocusableView

- (BOOL)canBecomeFocused
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles13FocusableView_focusable);
}

- (_TtC12NewsArticles13FocusableView)initWithFrame:(CGRect)a3
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
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles13FocusableView_focusable) = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FocusableView();
  return -[FocusableView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12NewsArticles13FocusableView)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles13FocusableView_focusable) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FocusableView();
  return -[FocusableView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
