@implementation TransparentBlackBackgroundDecorationView

- (_TtC6HomeUI40TransparentBlackBackgroundDecorationView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC6HomeUI40TransparentBlackBackgroundDecorationView *v7;
  id v8;
  _TtC6HomeUI40TransparentBlackBackgroundDecorationView *v9;
  id v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TransparentBlackBackgroundDecorationView();
  v7 = -[SolidColorSectionBackgroundDecorationView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = objc_allocWithZone(MEMORY[0x1E0CEA478]);
  v9 = v7;
  v10 = objc_msgSend(v8, sel_initWithWhite_alpha_, 0.0, 0.5);
  -[TransparentBlackBackgroundDecorationView setBackgroundColor:](v9, sel_setBackgroundColor_, v10);

  return v9;
}

- (_TtC6HomeUI40TransparentBlackBackgroundDecorationView)initWithCoder:(id)a3
{
  _TtC6HomeUI40TransparentBlackBackgroundDecorationView *result;

  result = (_TtC6HomeUI40TransparentBlackBackgroundDecorationView *)sub_1B93EE9CC();
  __break(1u);
  return result;
}

@end
