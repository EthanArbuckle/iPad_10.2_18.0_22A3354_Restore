@implementation UIAction(FocusUI)

- (uint64_t)fcui_isEqualToAction:()FocusUI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  if (a1 == v4)
  {
    v10 = 1;
  }
  else if (v4 && objc_msgSend(a1, "isEqual:", v4))
  {
    objc_msgSend(a1, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSEqualStrings())
    {
      objc_msgSend(a1, "discoverabilityTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "discoverabilityTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualStrings();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
