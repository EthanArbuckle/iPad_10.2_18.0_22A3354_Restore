@implementation PHActionSliderTrackComponentView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("path")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PHActionSliderTrackComponentView;
    v5 = -[PHActionSliderTrackComponentView _shouldAnimatePropertyWithKey:](&v7, "_shouldAnimatePropertyWithKey:", v4);
  }

  return v5;
}

@end
