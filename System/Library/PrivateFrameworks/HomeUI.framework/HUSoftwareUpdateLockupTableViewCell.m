@implementation HUSoftwareUpdateLockupTableViewCell

- (Class)lockupViewClass
{
  return (Class)objc_opt_class();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HULockupTableViewCell lockupView](self, "lockupView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutIfNeeded");

  v15.receiver = self;
  v15.super_class = (Class)HUSoftwareUpdateLockupTableViewCell;
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  -[HUSoftwareUpdateLockupTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v15, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  result.height = v14;
  result.width = v13;
  return result;
}

@end
