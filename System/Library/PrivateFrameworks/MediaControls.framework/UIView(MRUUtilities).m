@implementation UIView(MRUUtilities)

- (uint64_t)mr_tightBoundingRectOfFirstLine
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "_tightBoundingRectOfFirstLine");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "_deviceRectOfFirstLine");
  return objc_msgSend(a1, "frame");
}

@end
