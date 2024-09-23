@implementation SUUIBadgeTextAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIBadgeTextAttachment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSTextAttachment"), CFSTR("image"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SUUIBadgeTextAttachment"), CFSTR("NSTextAttachment"));

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  char v11;

  v11 = 0;
  objc_opt_class();
  -[SUUIBadgeTextAttachmentAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("image"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_CC")))
  {
    v6 = CFSTR("video.cc");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_HD")))
  {
    v6 = CFSTR("video.hd");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_MPAA_G")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_MPAA_PG")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_MPAA_PG13")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_MPAA_R")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_MPAA_NR")))
  {
    v6 = CFSTR("mpaa.rating");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_TV_Y")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_TV_Y7")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_TV_Y7FV")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_TV_G")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_TV_PG")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_TV_14")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("Badge_TV_MA")))
  {
    v6 = CFSTR("tv.rating");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("BadgeExplicit")))
  {
    v6 = CFSTR("explicit");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("BadgeClean")))
  {
    v6 = CFSTR("clean");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("rottenTomatoesCertified")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("rottenTomatoesCertifiedGiant")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("rottenTomatoesCertifiedLarge")))
  {
    v6 = CFSTR("rotten.tomatoes.certified");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("rottenTomatoesFresh")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("rottenTomatoesFreshGiant")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("rottenTomatoesFreshLarge")))
  {
    v6 = CFSTR("rotten.tomatoes.fresh");
  }
  else
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("rottenTomatoesRotten")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("rottenTomatoesRottenGiant")) & 1) == 0
      && !objc_msgSend(v5, "isEqualToString:", CFSTR("rottenTomatoesRottenLarge")))
    {
      v10.receiver = self;
      v10.super_class = (Class)SUUIBadgeTextAttachmentAccessibility;
      -[SUUIBadgeTextAttachmentAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v6 = CFSTR("rotten.tomatoes.rotten");
  }
  accessibilityLocalizedString(v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v8 = (void *)v7;

  return v8;
}

@end
