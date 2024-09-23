@implementation EKUIFullWidthDividerTableViewCell

- (CGRect)_separatorFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect result;

  v11.receiver = self;
  v11.super_class = (Class)EKUIFullWidthDividerTableViewCell;
  -[EKUIFullWidthDividerTableViewCell _separatorFrame](&v11, sel__separatorFrame);
  v4 = v3;
  v6 = v5;
  -[EKUIFullWidthDividerTableViewCell bounds](self, "bounds");
  v8 = 0.0;
  v9 = v4;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v7;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

@end
