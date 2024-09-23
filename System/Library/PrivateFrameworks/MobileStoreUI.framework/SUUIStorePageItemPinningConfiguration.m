@implementation SUUIStorePageItemPinningConfiguration

- (void)setPinningContentInset:(UIEdgeInsets)a3
{
  self->_pinningContentInset = a3;
  self->_hasValidPinningContentInset = 1;
}

- (void)setPinningStyle:(int64_t)a3
{
  self->_pinningStyle = a3;
  self->_hasValidPinningStyle = 1;
}

- (void)setPinningGroup:(int64_t)a3
{
  self->_pinningGroup = a3;
  self->_hasValidPinningGroup = 1;
}

- (void)setPinningTransitionStyle:(int64_t)a3
{
  self->_pinningTransitionStyle = a3;
  self->_hasValidPinningTransitionStyle = 1;
}

- (void)invalidatePinningContentInset
{
  __int128 v2;

  v2 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
  *(_OWORD *)&self->_pinningContentInset.top = *MEMORY[0x24BEBE158];
  *(_OWORD *)&self->_pinningContentInset.bottom = v2;
  self->_hasValidPinningContentInset = 0;
}

- (void)invalidatePinningStyle
{
  self->_pinningStyle = 0;
  self->_hasValidPinningStyle = 0;
}

- (void)invalidatePinningGroup
{
  self->_pinningGroup = 0;
  self->_hasValidPinningGroup = 0;
}

- (void)invalidatePinningTransitionStyle
{
  self->_pinningTransitionStyle = 0;
  self->_hasValidPinningTransitionStyle = 0;
}

- (UIEdgeInsets)pinningContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_pinningContentInset.top;
  left = self->_pinningContentInset.left;
  bottom = self->_pinningContentInset.bottom;
  right = self->_pinningContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)hasValidPinningContentInset
{
  return self->_hasValidPinningContentInset;
}

- (int64_t)pinningStyle
{
  return self->_pinningStyle;
}

- (int64_t)pinningGroup
{
  return self->_pinningGroup;
}

- (BOOL)hasValidPinningStyle
{
  return self->_hasValidPinningStyle;
}

- (BOOL)hasValidPinningGroup
{
  return self->_hasValidPinningGroup;
}

- (int64_t)pinningTransitionStyle
{
  return self->_pinningTransitionStyle;
}

- (BOOL)hasValidPinningTransitionStyle
{
  return self->_hasValidPinningTransitionStyle;
}

@end
