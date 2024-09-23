@implementation UILabel(MPUAdditions)

- (void)MPU_configureWithTextAttributes:()MPUAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = *MEMORY[0x24BDF65F8];
  v14 = v4;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDF65F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v14, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setFont:", v7);

  }
  v8 = *MEMORY[0x24BDF6600];
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDF6600]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v14, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setTextColor:", v10);

  }
  v11 = *MEMORY[0x24BDF65C8];
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDF65C8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v14, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setBackgroundColor:", v13);

  }
}

- (id)MPU_contentSizeUpdater
{
  return objc_getAssociatedObject(a1, &_MPULabelContentSizeUpdaterKey);
}

- (BOOL)MPU_automaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "MPU_contentSizeUpdater");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (void)MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:()MPUAdditions
{
  MPUTextContainerContentSizeUpdater *value;

  if (objc_msgSend(a1, "MPU_automaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts") != a3)
  {
    if (a3)
    {
      value = objc_alloc_init(MPUTextContainerContentSizeUpdater);
      -[MPUTextContainerContentSizeUpdater setTextContainer:](value, "setTextContainer:", a1);
    }
    else
    {
      value = 0;
    }
    objc_setAssociatedObject(a1, &_MPULabelContentSizeUpdaterKey, value, (void *)1);

  }
}

@end
