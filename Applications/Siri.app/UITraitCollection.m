@implementation UITraitCollection

- (id)aceDisplayColorScheme
{
  UIUserInterfaceStyle v2;
  id v3;

  v2 = -[UITraitCollection userInterfaceStyle](self, "userInterfaceStyle");
  if ((unint64_t)v2 <= UIUserInterfaceStyleDark)
    v3 = *(id *)*(&off_100123080 + v2);
  return v3;
}

- (id)aceDisplayColorGamut
{
  id v2;

  v2 = -[UITraitCollection displayGamut](self, "displayGamut");
  if ((unint64_t)v2 + 1 <= 2)
    v2 = *(id *)*(&off_100123098 + (_QWORD)v2 + 1);
  return v2;
}

- (id)aceTextLegibilityWeight
{
  id v2;

  v2 = -[UITraitCollection legibilityWeight](self, "legibilityWeight");
  if ((unint64_t)v2 + 1 <= 2)
    v2 = *(id *)*(&off_1001230B0 + (_QWORD)v2 + 1);
  return v2;
}

- (id)aceDynamicTypeSize
{
  UIContentSizeCategory v3;
  id *v4;
  UIContentSizeCategory v5;
  UIContentSizeCategory v6;
  UIContentSizeCategory v7;
  UIContentSizeCategory v8;
  UIContentSizeCategory v9;
  UIContentSizeCategory v10;
  UIContentSizeCategory v11;
  UIContentSizeCategory v12;
  UIContentSizeCategory v13;
  UIContentSizeCategory v14;
  UIContentSizeCategory v15;
  UIContentSizeCategory v16;

  v3 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

  v4 = (id *)&SAUIDynamicTypeSizeUnspecifiedValue;
  if (v3 != UIContentSizeCategoryUnspecified)
  {
    v5 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

    if (v5 == UIContentSizeCategorySmall)
    {
      v4 = (id *)&SAUIDynamicTypeSizeSmallValue;
    }
    else
    {
      v6 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

      if (v6 == UIContentSizeCategoryMedium)
      {
        v4 = (id *)&SAUIDynamicTypeSizeMediumValue;
      }
      else
      {
        v7 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

        if (v7 == UIContentSizeCategoryExtraSmall)
        {
          v4 = (id *)&SAUIDynamicTypeSizeExtraSmallValue;
        }
        else
        {
          v8 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

          if (v8 == UIContentSizeCategoryLarge)
          {
            v4 = (id *)&SAUIDynamicTypeSizeLargeValue;
          }
          else
          {
            v9 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

            if (v9 == UIContentSizeCategoryExtraLarge)
            {
              v4 = (id *)&SAUIDynamicTypeSizeExtraLargeValue;
            }
            else
            {
              v10 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

              if (v10 == UIContentSizeCategoryExtraExtraLarge)
              {
                v4 = (id *)&SAUIDynamicTypeSizeExtraExtraLargeValue;
              }
              else
              {
                v11 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

                if (v11 == UIContentSizeCategoryExtraExtraExtraLarge)
                {
                  v4 = (id *)&SAUIDynamicTypeSizeExtraExtraExtraLargeValue;
                }
                else
                {
                  v12 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

                  if (v12 == UIContentSizeCategoryAccessibilityMedium)
                  {
                    v4 = (id *)&SAUIDynamicTypeSizeAccessibilityMediumValue;
                  }
                  else
                  {
                    v13 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

                    if (v13 == UIContentSizeCategoryAccessibilityLarge)
                    {
                      v4 = (id *)&SAUIDynamicTypeSizeAccessibilityLargeValue;
                    }
                    else
                    {
                      v14 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

                      if (v14 == UIContentSizeCategoryAccessibilityExtraLarge)
                      {
                        v4 = (id *)&SAUIDynamicTypeSizeAccessibilityExtraLargeValue;
                      }
                      else
                      {
                        v15 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

                        if (v15 == UIContentSizeCategoryAccessibilityExtraExtraLarge)
                        {
                          v4 = (id *)&SAUIDynamicTypeSizeAccessibilityExtraExtraLargeValue;
                        }
                        else
                        {
                          v16 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

                          if (v16 == UIContentSizeCategoryAccessibilityExtraExtraExtraLarge)
                            v4 = (id *)&SAUIDynamicTypeSizeAccessibilityExtraExtraExtraLargeValue;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return *v4;
}

- (id)aceDisplayContrast
{
  id v2;

  v2 = -[UITraitCollection accessibilityContrast](self, "accessibilityContrast");
  if ((unint64_t)v2 + 1 <= 2)
    v2 = *(id *)*(&off_1001230C8 + (_QWORD)v2 + 1);
  return v2;
}

@end
