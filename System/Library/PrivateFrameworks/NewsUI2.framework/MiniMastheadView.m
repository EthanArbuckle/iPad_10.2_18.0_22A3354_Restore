@implementation MiniMastheadView

- (_TtC7NewsUI216MiniMastheadView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC7NewsUI216MiniMastheadView *v11;
  _TtC7NewsUI216MiniMastheadView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC7NewsUI216MiniMastheadView_titleView;
  v10 = objc_allocWithZone(MEMORY[0x1E0D62950]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[MiniMastheadView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  -[MiniMastheadView addSubview:](v12, sel_addSubview_, *(Class *)((char *)&v12->super.super.super.isa + OBJC_IVAR____TtC7NewsUI216MiniMastheadView_titleView));
  return v12;
}

- (_TtC7NewsUI216MiniMastheadView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7NewsUI216MiniMastheadView *result;

  v5 = OBJC_IVAR____TtC7NewsUI216MiniMastheadView_titleView;
  v6 = objc_allocWithZone(MEMORY[0x1E0D62950]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI216MiniMastheadView *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (BOOL)accessibilityElementsHidden
{
  _TtC7NewsUI216MiniMastheadView *v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v2 = self;
  v3 = -[MiniMastheadView window](v2, sel_window);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_traitCollection);
    v6 = objc_msgSend(v5, sel_horizontalSizeClass);

    return v6 == (id)1;
  }
  else
  {

    return 0;
  }
}

- (double)contentAlpha
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI216MiniMastheadView_titleView), sel_alpha);
  return result;
}

- (void)setContentAlpha:(double)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI216MiniMastheadView_titleView), sel_setAlpha_, a3);
}

- (double)verticalOffset
{
  double v3;

  -[MiniMastheadView transform](self, sel_transform);
  return v3;
}

- (void)setVerticalOffset:(double)a3
{
  _TtC7NewsUI216MiniMastheadView *v4;
  __int128 v5;
  double v6;

  v4 = self;
  -[MiniMastheadView transform](v4, sel_transform);
  v6 = a3;
  -[MiniMastheadView setTransform:](v4, sel_setTransform_, &v5);

}

- (void).cxx_destruct
{

}

@end
