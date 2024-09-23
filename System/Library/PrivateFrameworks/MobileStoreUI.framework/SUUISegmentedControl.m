@implementation SUUISegmentedControl

- (CGRect)frameForSegmentAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[SUUISegmentedControl frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v7 / (double)(unint64_t)-[SUUISegmentedControl numberOfSegments](self, "numberOfSegments") * (double)a3;
  v12 = v8 / (double)(unint64_t)-[SUUISegmentedControl numberOfSegments](self, "numberOfSegments");
  v13 = v11;
  v14 = v6;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v12;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUISegmentedControl;
  -[SUUISegmentedControl touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[SUUISegmentedControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

@end
