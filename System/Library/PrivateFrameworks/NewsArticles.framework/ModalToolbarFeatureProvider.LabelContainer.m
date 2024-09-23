@implementation ModalToolbarFeatureProvider.LabelContainer

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  BOOL v12;
  objc_super v14;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for ModalToolbarFeatureProvider.LabelContainer();
  v7 = v14.receiver;
  v8 = a4;
  v9 = -[ModalToolbarFeatureProvider.LabelContainer hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v8, x, y);
  if (v9)
  {
    v10 = v9;

LABEL_5:
    v7 = v10;
    return v7;
  }
  objc_msgSend(v7, sel_bounds, v14.receiver, v14.super_class);
  v16.origin.x = UIEdgeInsetsInsetRect(v11);
  v15.x = x;
  v15.y = y;
  v12 = CGRectContainsPoint(v16, v15);

  if (!v12)
  {
    v10 = 0;
    goto LABEL_5;
  }
  return v7;
}

- (_TtCC12NewsArticles27ModalToolbarFeatureProviderP33_1AF7F0043EBE645F99824835FC96155114LabelContainer)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for ModalToolbarFeatureProvider.LabelContainer();
  return -[ModalToolbarFeatureProvider.LabelContainer initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC12NewsArticles27ModalToolbarFeatureProviderP33_1AF7F0043EBE645F99824835FC96155114LabelContainer)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ModalToolbarFeatureProvider.LabelContainer();
  return -[ModalToolbarFeatureProvider.LabelContainer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
