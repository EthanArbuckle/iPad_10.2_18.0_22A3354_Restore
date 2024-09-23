@implementation ASTBiggerProgressView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)ASTBiggerProgressView;
  -[ASTBiggerProgressView sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  v4 = 7.0;
  result.height = v4;
  result.width = v3;
  return result;
}

@end
