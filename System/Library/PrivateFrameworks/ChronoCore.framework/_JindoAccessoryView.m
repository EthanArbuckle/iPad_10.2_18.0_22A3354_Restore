@implementation _JindoAccessoryView

- (_TtC10ChronoCore19_JindoAccessoryView)initWithCoder:(id)a3
{
  _TtC10ChronoCore19_JindoAccessoryView *result;

  result = (_TtC10ChronoCore19_JindoAccessoryView *)sub_1D29C6474();
  __break(1u);
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _JindoAccessoryView();
  -[_JindoAccessoryView frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  id v8;
  void *v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for _JindoAccessoryView();
  v7 = (char *)v10.receiver;
  -[_JindoAccessoryView setFrame:](&v10, sel_setFrame_, x, y, width, height);
  v8 = objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC10ChronoCore19_JindoAccessoryView__hostController], sel_view, v10.receiver, v10.super_class);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v7, sel_bounds);
    objc_msgSend(v9, sel_setFrame_);

  }
  else
  {
    __break(1u);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC10ChronoCore19_JindoAccessoryView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1D28AE924();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC10ChronoCore19_JindoAccessoryView)initWithFrame:(CGRect)a3
{
  _TtC10ChronoCore19_JindoAccessoryView *result;

  result = (_TtC10ChronoCore19_JindoAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore19_JindoAccessoryView__hostController));
}

@end
