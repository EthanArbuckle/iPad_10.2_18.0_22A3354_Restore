@implementation _FEFocusItemDummy

- (BOOL)_canBecomeFocused
{
  return 0;
}

- (NSArray)_preferredFocusEnvironments
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (_FEFocusItemContainer)_focusItemContainer
{
  return 0;
}

- (CGRect)_focusFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__focusFrame.origin.x;
  y = self->__focusFrame.origin.y;
  width = self->__focusFrame.size.width;
  height = self->__focusFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)set_focusFrame:(CGRect)a3
{
  self->__focusFrame = a3;
}

- (_FEFocusEnvironment)_parentFocusEnvironment
{
  return (_FEFocusEnvironment *)objc_loadWeakRetained((id *)&self->__parentFocusEnvironment);
}

- (void)set_parentFocusEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->__parentFocusEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__parentFocusEnvironment);
}

@end
