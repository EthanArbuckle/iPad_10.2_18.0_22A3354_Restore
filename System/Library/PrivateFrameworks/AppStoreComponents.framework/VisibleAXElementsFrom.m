@implementation VisibleAXElementsFrom

BOOL __VisibleAXElementsFrom_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  _BOOL8 v4;

  v2 = a2;
  v4 = 0;
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v2, "isHidden") & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v2, "alpha"), v3 > 0.05))
      v4 = 1;
  }

  return v4;
}

@end
