@implementation _SFNavigationBarLabelsContainer

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  unsigned __int8 shouldAnimateBoundsChanges;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("anchorPoint")) & 1) != 0)
  {
    shouldAnimateBoundsChanges = 1;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("bounds")))
  {
    shouldAnimateBoundsChanges = self->_shouldAnimateBoundsChanges;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SFNavigationBarLabelsContainer;
    shouldAnimateBoundsChanges = -[_SFNavigationBarLabelsContainer _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return shouldAnimateBoundsChanges;
}

@end
