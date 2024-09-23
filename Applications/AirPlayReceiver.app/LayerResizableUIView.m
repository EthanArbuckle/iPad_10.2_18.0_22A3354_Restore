@implementation LayerResizableUIView

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LayerResizableUIView();
  -[LayerResizableUIView frame](&v6, "frame");
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
  id v7;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LayerResizableUIView();
  v7 = v8.receiver;
  -[LayerResizableUIView setFrame:](&v8, "setFrame:", x, y, width, height);
  sub_100007DEC();

}

- (_TtC15AirPlayReceiver20LayerResizableUIView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for LayerResizableUIView();
  return -[LayerResizableUIView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC15AirPlayReceiver20LayerResizableUIView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LayerResizableUIView();
  return -[LayerResizableUIView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
