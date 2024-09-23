@implementation ARQuickLookOverlayView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ARQuickLookOverlayView();
  v7 = v13.receiver;
  v8 = a4;
  v9 = -[ARQuickLookOverlayView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v8, x, y);
  if (v9)
  {
    v10 = v9;
    sub_1D9410A9C();
    v11 = v7;
    v7 = v10;
    LOBYTE(v10) = sub_1D94D3430();

    if ((v10 & 1) == 0)
      return v7;
  }
  else
  {

  }
  v7 = 0;
  return v7;
}

- (_TtC11AssetViewer22ARQuickLookOverlayView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for ARQuickLookOverlayView();
  return -[ARQuickLookOverlayView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11AssetViewer22ARQuickLookOverlayView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ARQuickLookOverlayView();
  return -[ARQuickLookOverlayView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
