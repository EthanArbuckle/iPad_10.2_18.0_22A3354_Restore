@implementation SKUIImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[SKUIImageViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_CC")))
  {
    v4 = CFSTR("video.cc");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_HD")))
  {
    v4 = CFSTR("video.hd");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_MPAA_G")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_MPAA_PG")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_MPAA_PG13")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_MPAA_R")) & 1) != 0
         || objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_MPAA_NR")))
  {
    v4 = CFSTR("mpaa.rating");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_Y")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_Y7")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_Y7FV")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_G")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_PG")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_14")) & 1) != 0
         || objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_MA")))
  {
    v4 = CFSTR("tv.rating");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("parental.advisory")))
  {
    v4 = CFSTR("parental.advisory");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("itunes-mastered")))
    {
      v8.receiver = self;
      v8.super_class = (Class)SKUIImageViewAccessibility;
      -[SKUIImageViewAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v4 = CFSTR("itunes-mastered");
  }
  accessibilitySKUILocalizedString(v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[SKUIImageViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_MPAA_G")))
  {
    v4 = CFSTR("movie.rating.g");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_MPAA_PG")))
  {
    v4 = CFSTR("movie.rating.pg");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_MPAA_PG13")))
  {
    v4 = CFSTR("movie.rating.pg13");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_MPAA_R")))
  {
    v4 = CFSTR("movie.rating.r");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_MPAA_NR")))
  {
    v4 = CFSTR("movie.rating.nr");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_Y")))
  {
    v4 = CFSTR("tv.y");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_Y7")))
  {
    v4 = CFSTR("tv.y7");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_Y7FV")))
  {
    v4 = CFSTR("tv.y7fv");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_G")))
  {
    v4 = CFSTR("tv.g");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_PG")))
  {
    v4 = CFSTR("tv.pg");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_14")))
  {
    v4 = CFSTR("tv.14");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Badge_TV_MA")))
    {
      v8.receiver = self;
      v8.super_class = (Class)SKUIImageViewAccessibility;
      -[SKUIImageViewAccessibility accessibilityValue](&v8, sel_accessibilityValue);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    v4 = CFSTR("tv.ma");
  }
  accessibilitySKUILocalizedString(v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_26:
  v6 = (void *)v5;

  return v6;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  void *v6;
  objc_super v7;

  -[SKUIImageViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("Badge_offers"));

  if ((v4 & 1) != 0)
    return 0;
  -[SKUIImageViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)SKUIImageViewAccessibility;
  return -[SKUIImageViewAccessibility isAccessibilityElement](&v7, sel_isAccessibilityElement);
}

@end
