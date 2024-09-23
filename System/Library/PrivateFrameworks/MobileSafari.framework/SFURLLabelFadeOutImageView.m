@implementation SFURLLabelFadeOutImageView

- (BOOL)_shouldAnimatePropertyAdditivelyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFURLLabelFadeOutImageView;
  if (-[SFURLLabelFadeOutImageView _shouldAnimatePropertyAdditivelyWithKey:](&v7, sel__shouldAnimatePropertyAdditivelyWithKey_, v4))
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("contentsTransform"));
  }

  return v5;
}

@end
