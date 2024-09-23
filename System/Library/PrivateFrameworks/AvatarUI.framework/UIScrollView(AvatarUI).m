@implementation UIScrollView(AvatarUI)

- (uint64_t)avtui_isMoving
{
  if ((objc_msgSend(a1, "isDragging") & 1) != 0
    || (objc_msgSend(a1, "isTracking") & 1) != 0
    || (objc_msgSend(a1, "isDecelerating") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isScrollAnimating");
  }
}

@end
