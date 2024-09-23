@implementation UGCRatingCategoryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UGCRatingCategoryCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UGCRatingCategoryCell"), CFSTR("likeDislikeViewDidSelectDislike:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UGCRatingCategoryCell"), CFSTR("likeDislikeViewDidSelectLike:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UGCRatingCategoryCell"), CFSTR("_updateState:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UGCRatingCategoryCell"), CFSTR("currentState"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UGCRatingCategoryCell"), CFSTR("_categoryView"), "MUAppleRatingRowView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUAppleRatingRowView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUAppleRatingRowView"), CFSTR("_subtitleLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UGCRatingCategoryCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_categoryView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "safeValueForKey:", CFSTR("_subtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __AXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityValue
{
  unsigned int v2;
  __CFString *v3;

  v2 = -[UGCRatingCategoryCellAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("currentState"));
  if (v2 > 2)
  {
    v3 = &stru_25025B660;
  }
  else
  {
    AXMapsLocString(off_250259058[v2]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void **v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  AXMapsLocString(CFSTR("LIKE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v4, self, sel_likeDislikeViewDidSelectLike_);

  v6 = objc_alloc(MEMORY[0x24BDF6788]);
  AXMapsLocString(CFSTR("DISLIKE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:target:selector:", v7, self, sel_likeDislikeViewDidSelectDislike_);

  v9 = objc_alloc(MEMORY[0x24BDF6788]);
  AXMapsLocString(CFSTR("CLEAR_RATING"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:target:selector:", v10, self, sel__axClearRating);

  v12 = -[UGCRatingCategoryCellAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("currentState"));
  if (v12 == 2)
  {
    v17 = v8;
    v13 = &v17;
LABEL_7:
    v14 = v11;
    goto LABEL_8;
  }
  if (v12 == 1)
  {
    v18 = v5;
    v13 = &v18;
    goto LABEL_7;
  }
  if (v12)
  {
    v15 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_10;
  }
  v19[0] = v5;
  v13 = (void **)v19;
  v14 = v8;
LABEL_8:
  v13[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v15;
}

- (void)_axClearRating
{
  -[UGCRatingCategoryCellAccessibility _updateState:](self, "_updateState:", 0);
}

@end
