@implementation PassthroughView

- (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC15PassthroughView)initWithFrame:(CGRect)a3
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
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PassthroughView();
  return -[PassthroughView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC15PassthroughView)initWithCoder:(id)a3
{
  _TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC15PassthroughView *result;

  result = (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC15PassthroughView *)sub_2414B5674();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC15PassthroughView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_241494234((uint64_t)a4, x, y);

  return v10;
}

@end
