@implementation UIView(AMP_UITraitCollectionOverrides)

- (uint64_t)layoutDirection
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_layoutDirectionValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_layoutDirectionFromLayoutDirectionValue:", v2);

  return v3;
}

- (void)setLayoutDirection:()AMP_UITraitCollectionOverrides
{
  uint64_t v5;
  void *v6;
  id v7;

  if (objc_msgSend(a1, "layoutDirection") != a3)
  {
    if (sOriginal_UIView_traitCollection)
    {
      objc_msgSend(a1, "traitCollection");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v7 = (id)v5;
    if (a3 > 1)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_setAssociatedObject(a1, sel_layoutDirection, v6, (void *)0x303);
    if (sOriginal_UIView_traitCollection)
    {
      objc_msgSend(a1, "setNeedsLayout");
      objc_msgSend(a1, "traitCollectionDidChange:", v7);
    }

  }
}

@end
