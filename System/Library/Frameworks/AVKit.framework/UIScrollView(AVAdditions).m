@implementation UIScrollView(AVAdditions)

- (uint64_t)avkit_isDescendantOfNonPagingScrollView
{
  void *v2;
  uint64_t v3;

  if (!objc_msgSend(a1, "isPagingEnabled"))
    return 1;
  objc_msgSend(a1, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "avkit_isDescendantOfNonPagingScrollView");

  return v3;
}

- (uint64_t)avkit_isBeingScrolled
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "isDecelerating") & 1) != 0
    || (objc_msgSend(a1, "isDragging") & 1) != 0
    || (objc_msgSend(a1, "isScrollAnimating") & 1) != 0
    || (objc_msgSend(a1, "_isAnimatingScrollTest") & 1) != 0)
  {
    return 1;
  }
  objc_msgSend(a1, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "avkit_isBeingScrolled");

  return v4;
}

- (uint64_t)avkit_isBeingScrolledQuickly
{
  double v2;
  double v3;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "_horizontalVelocity");
  if (v2 < 0.0)
    v2 = -v2;
  if (v2 > 1.5)
    return 1;
  objc_msgSend(a1, "_verticalVelocity");
  if (v3 < 0.0)
    v3 = -v3;
  if (v3 > 1.5)
    return 1;
  objc_msgSend(a1, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "avkit_isBeingScrolledQuickly");

  return v6;
}

- (uint64_t)avkit_isBeingScrollTested
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "_isAnimatingScrollTest") & 1) != 0)
    return 1;
  objc_msgSend(a1, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "avkit_isBeingScrollTested");

  return v4;
}

- (uint64_t)avkit_isInAScrollView
{
  return 1;
}

@end
