@implementation TagViewBadgeView

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC7NewsUI216TagViewBadgeView *v6;

  v5 = a3;
  v6 = self;
  sub_1D68FBB68(a3);

}

- (_TtC7NewsUI216TagViewBadgeView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI216TagViewBadgeView_color) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TagViewBadgeView();
  return -[TagViewBadgeView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7NewsUI216TagViewBadgeView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI216TagViewBadgeView_color) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TagViewBadgeView();
  return -[TagViewBadgeView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{

}

@end
