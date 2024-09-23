@implementation SolidColorSectionBackgroundDecorationView

- (_TtC6HomeUI41SolidColorSectionBackgroundDecorationView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC6HomeUI41SolidColorSectionBackgroundDecorationView *v7;
  void *v8;
  _TtC6HomeUI41SolidColorSectionBackgroundDecorationView *v9;
  id v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SolidColorSectionBackgroundDecorationView();
  v7 = -[SolidColorSectionBackgroundDecorationView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = (void *)objc_opt_self();
  v9 = v7;
  v10 = objc_msgSend(v8, sel_blackColor);
  -[SolidColorSectionBackgroundDecorationView setBackgroundColor:](v9, sel_setBackgroundColor_, v10);

  return v9;
}

- (_TtC6HomeUI41SolidColorSectionBackgroundDecorationView)initWithCoder:(id)a3
{
  _TtC6HomeUI41SolidColorSectionBackgroundDecorationView *result;

  result = (_TtC6HomeUI41SolidColorSectionBackgroundDecorationView *)sub_1B93EE9CC();
  __break(1u);
  return result;
}

@end
