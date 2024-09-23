@implementation MPUStackItemView

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[MPUStackItemView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPosition:", x, y);

}

@end
