@implementation UILabel(NewsFeed)

- (uint64_t)ne_verticallyCenterCapInRect:()NewsFeed
{
  objc_msgSend(a1, "_capOffsetFromBoundsTop");
  objc_msgSend(a1, "_firstLineBaseline");
  objc_msgSend(a1, "frame");
  return objc_msgSend(a1, "setFrame:");
}

@end
