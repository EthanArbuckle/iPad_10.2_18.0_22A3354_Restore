@implementation _MFTapPreventingRecognizer

- (BOOL)_isMatchingTapGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "numberOfTapsRequired");
    v6 = v5 == -[_MFTapPreventingRecognizer numberOfTapsRequired](self, "numberOfTapsRequired");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return !-[_MFTapPreventingRecognizer _isMatchingTapGestureRecognizer:](self, "_isMatchingTapGestureRecognizer:", a3);
}

@end
