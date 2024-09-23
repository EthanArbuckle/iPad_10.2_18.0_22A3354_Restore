@implementation CircularUIView

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v7;
  CGFloat v8;
  CGContext *CurrentContext;
  void *v10;
  id v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CircularUIView;
  -[CircularUIView drawRect:](&v12, "drawRect:");
  v7 = x + width * 0.5 + -11.0;
  v8 = y + height * 0.5 + -11.0;
  CurrentContext = UIGraphicsGetCurrentContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.31372549, 0.31372549, 0.31372549, 1.0));
  v13.size.width = 23.0;
  v13.size.height = 23.0;
  v13.origin.x = v7;
  v13.origin.y = v8;
  CGContextAddEllipseInRect(CurrentContext, v13);
  v11 = objc_retainAutorelease(v10);
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v11, "CGColor"));
  v14.size.width = 23.0;
  v14.size.height = 23.0;
  v14.origin.x = v7;
  v14.origin.y = v8;
  CGContextStrokeEllipseInRect(CurrentContext, v14);

}

@end
