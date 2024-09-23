@implementation UIView(GKDetachedContentViewSupport)

- (void)_gkSetNeedsRender
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v4 = a1;
  objc_opt_class();
  v1 = v4;
  if (v4)
  {
    while (1)
    {
      v5 = v1;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v5, "superview");
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v2;
      if (!v2)
        return;
    }
    objc_msgSend(v5, "renderView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsDisplay");

  }
}

@end
