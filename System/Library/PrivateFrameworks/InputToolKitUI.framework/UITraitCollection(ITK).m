@implementation UITraitCollection(ITK)

- (uint64_t)itk_hasCompactSize
{
  if ((objc_msgSend(a1, "itk_hasCompactWidth") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "itk_hasCompactHeight");
}

- (BOOL)itk_hasCompactHeight
{
  return objc_msgSend(a1, "verticalSizeClass") == 1;
}

- (BOOL)itk_hasCompactWidth
{
  return objc_msgSend(a1, "horizontalSizeClass") == 1;
}

- (BOOL)itk_isiPhone
{
  return objc_msgSend(a1, "userInterfaceIdiom") == 0;
}

- (BOOL)itk_isiPad
{
  return objc_msgSend(a1, "userInterfaceIdiom") == 1;
}

- (BOOL)itk_isOptimizedForMac
{
  return objc_msgSend(a1, "userInterfaceIdiom") == 5;
}

- (BOOL)itk_isVision
{
  return objc_msgSend(a1, "userInterfaceIdiom") == 6;
}

- (BOOL)itk_isTV
{
  return objc_msgSend(a1, "userInterfaceIdiom") == 2;
}

- (BOOL)itk_isCarPlay
{
  return objc_msgSend(a1, "userInterfaceIdiom") == 3;
}

- (BOOL)itk_isDark
{
  return objc_msgSend(a1, "userInterfaceStyle") == 2;
}

- (BOOL)itk_isRTL
{
  return objc_msgSend(a1, "layoutDirection") == 1;
}

- (BOOL)itk_hasEqualSizeToTraitCollection:()ITK
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "horizontalSizeClass");
  if (v5 == objc_msgSend(v4, "horizontalSizeClass"))
  {
    v6 = objc_msgSend(a1, "verticalSizeClass");
    v7 = v6 == objc_msgSend(v4, "verticalSizeClass");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)itk_traitCollectionClampedToNonaccessibilityContentSize
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  objc_msgSend(v1, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BEBE070]) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BEBE068]) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BEBE060]) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BEBE058]))
  {
    objc_msgSend(v1, "traitCollectionByModifyingTraits:", &__block_literal_global_2);
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v3;
  }

  return v1;
}

- (id)itk_traitCollectionWithContentSize:()ITK
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__UITraitCollection_ITK__itk_traitCollectionWithContentSize___block_invoke;
  v8[3] = &unk_250FA11F0;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "traitCollectionByModifyingTraits:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)itk_contentSizeScaleFactor
{
  void *v1;
  double v2;

  objc_msgSend(a1, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 == (void *)*MEMORY[0x24BEBE0A8])
  {
    v2 = 0.8;
  }
  else if (v1 == (void *)*MEMORY[0x24BEBE0D0])
  {
    v2 = 0.85;
  }
  else if (v1 == (void *)*MEMORY[0x24BEBE0C0])
  {
    v2 = 0.9;
  }
  else
  {
    v2 = 1.0;
    if (v1 != (void *)*MEMORY[0x24BEBE0B8] && v1 != (void *)*MEMORY[0x24BEBE0D8])
    {
      if (v1 == (void *)*MEMORY[0x24BEBE0A0])
      {
        v2 = 1.1;
      }
      else if (v1 == (void *)*MEMORY[0x24BEBE098])
      {
        v2 = 1.2;
      }
      else if (v1 == (void *)*MEMORY[0x24BEBE090])
      {
        v2 = 1.35;
      }
      else if (v1 == (void *)*MEMORY[0x24BEBE078])
      {
        v2 = 1.6;
      }
      else if (v1 == (void *)*MEMORY[0x24BEBE070])
      {
        v2 = 1.9;
      }
      else if (v1 == (void *)*MEMORY[0x24BEBE068])
      {
        v2 = 2.35;
      }
      else if (v1 == (void *)*MEMORY[0x24BEBE060])
      {
        v2 = 2.75;
      }
      else if (v1 == (void *)*MEMORY[0x24BEBE058])
      {
        v2 = 3.1;
      }
      else
      {
        v2 = 1.0;
      }
    }
  }

  return v2;
}

@end
