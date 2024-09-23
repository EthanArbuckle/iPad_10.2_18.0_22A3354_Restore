@implementation UIView(MTVisualStylingProviderAdditions)

- (id)visualStylingProviderForCategory:()MTVisualStylingProviderAdditions
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(a1, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "indexOfObject:", a1);
  if (v7)
  {
    objc_msgSend(v6, "objectAtIndex:", v7 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      objc_msgSend(v8, "subviews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
  }
  else
  {
    objc_msgSend(a1, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "visualStylingProviderForCategory:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
