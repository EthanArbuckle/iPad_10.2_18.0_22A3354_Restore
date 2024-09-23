@implementation BKUIStyle

+ (id)sharedStyle
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___BKUIStyle;
  objc_msgSendSuper2(&v3, sel_sharedStyle);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (UIEdgeInsets)_layoutMarginsForPearEnrollView
{
  void *v2;
  char v3;
  double v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIdiomPad");

  if ((v3 & 1) != 0)
  {
    v4 = 88.0;
  }
  else
  {
    +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isD32Sized"))
    {

      v4 = 24.0;
    }
    else
    {
      +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isN84");

      v4 = 24.0;
      if (!v7)
        v4 = 44.0;
    }
  }
  v8 = 0.0;
  v9 = 0.0;
  v10 = v4;
  result.right = v10;
  result.bottom = v9;
  result.left = v4;
  result.top = v8;
  return result;
}

+ (UIEdgeInsets)_obkStyleButtonMarginsForParentBounds:(CGRect)a3
{
  void *v4;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isIdiomPad");

  if ((v5 & 1) != 0)
  {
    v6 = 0.0;
    v7 = 132.0;
    v8 = 132.0;
    v9 = 0.0;
  }
  else
  {
    objc_msgSend(a1, "_layoutMarginsForPearEnrollView");
  }
  result.right = v8;
  result.bottom = v9;
  result.left = v7;
  result.top = v6;
  return result;
}

+ (double)_buttonSizeForPads
{
  return 360.0;
}

@end
