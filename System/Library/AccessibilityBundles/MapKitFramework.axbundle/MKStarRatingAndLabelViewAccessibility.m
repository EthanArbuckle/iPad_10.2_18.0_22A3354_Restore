@implementation MKStarRatingAndLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKStarRatingAndLabelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MKStarRatingAndLabelView"), CFSTR("starRatingAndProviderAsAttributedStringForMapItem: textColor: font: showReviewsOrTips: showNumberOfReviews: ratingStyle: theme:"), "@", "@", "@", "@", "B", "B", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MKStarRatingAndLabelView"), CFSTR("ratingAndReviewsAsAttributedString: style: font: numberOfReviews: textColor:theme:"), "@", "d", "q", "@", "Q", "@", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MKStarRatingView"));

}

+ (id)ratingAndReviewsAsAttributedString:(double)a3 style:(int64_t)a4 font:(id)a5 numberOfReviews:(unint64_t)a6 textColor:(id)a7 theme:(id)a8
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  objc_super v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___MKStarRatingAndLabelViewAccessibility;
  objc_msgSendSuper2(&v18, sel_ratingAndReviewsAsAttributedString_style_font_numberOfReviews_textColor_theme_, a4, a5, a6, a7, a8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  UIAXStarRatingStringForRating();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  AXMapsLocString(CFSTR("REVIEWS_COUNT_FORMAT"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v13, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *MEMORY[0x24BDFECD0];
  v20[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1, v17, CFSTR("__AXStringForVariablesSentinel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAttributes:range:", v15, 0, objc_msgSend(v10, "length"));

  return v10;
}

+ (id)starRatingAndProviderAsAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 showReviewsOrTips:(BOOL)a6 showNumberOfReviews:(BOOL)a7 ratingStyle:(int64_t)a8 theme:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v26;
  const __CFString *v27;
  objc_super v28;

  v10 = a7;
  v11 = a6;
  v15 = a3;
  v28.receiver = a1;
  v28.super_class = (Class)&OBJC_METACLASS___MKStarRatingAndLabelViewAccessibility;
  objc_msgSendSuper2(&v28, sel_starRatingAndProviderAsAttributedStringForMapItem_textColor_font_showReviewsOrTips_showNumberOfReviews_ratingStyle_theme_, v15, a4, a5, v11, v10, a8, a9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "_sampleSizeForUserRatingScore"))
  {
    objc_msgSend(v15, "_reviewsDisplayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "_sampleSizeForUserRatingScore");
    objc_msgSend(v15, "_normalizedUserRatingScore");
    UIAXStarRatingStringForRating();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v20 = objc_msgSend(v17, "length");
      v21 = (void *)MEMORY[0x24BDD17C8];
      if (v20)
      {
        AXMapsLocString(CFSTR("REVIEWS_COUNT_WITH_PROVIDER_FORMAT"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringWithFormat:", v22, v18, v17);
      }
      else
      {
        AXMapsLocString(CFSTR("REVIEWS_COUNT_FORMAT"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringWithFormat:", v22, v18, v27);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v23;
      v27 = CFSTR("__AXStringForVariablesSentinel");
      __AXStringForVariables();
      v24 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v24;
    }
    objc_msgSend(v16, "setAccessibilityLabel:", v19, v26, v27);

  }
  return v16;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
