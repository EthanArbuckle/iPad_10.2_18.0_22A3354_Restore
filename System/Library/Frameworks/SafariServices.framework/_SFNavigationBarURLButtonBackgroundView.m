@implementation _SFNavigationBarURLButtonBackgroundView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("contents")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SFNavigationBarURLButtonBackgroundView;
    v5 = -[_SFNavigationBarURLButtonBackgroundView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

@end
