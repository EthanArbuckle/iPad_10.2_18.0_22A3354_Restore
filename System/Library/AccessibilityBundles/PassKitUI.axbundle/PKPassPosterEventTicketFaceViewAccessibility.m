@implementation PKPassPosterEventTicketFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassPosterEventTicketFaceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassPosterEventTicketFaceView"), CFSTR("_logoLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassPosterEventTicketFaceView"), CFSTR("_primaryFieldLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassPosterEventTicketFaceView"), CFSTR("_dateLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassPosterEventTicketFaceView"), CFSTR("_timeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassPosterEventTicketFaceView"), CFSTR("_secnamLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassPosterEventTicketFaceView"), CFSTR("_venueLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[PKPassPosterEventTicketFaceViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassPosterEventTicketFaceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_logoLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassPosterEventTicketFaceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_primaryFieldLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassPosterEventTicketFaceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_dateLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassPosterEventTicketFaceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_timeLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassPosterEventTicketFaceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_secnamLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassPosterEventTicketFaceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_venueLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessibilityLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 7, v4, v6, v8, v10, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

BOOL __66__PKPassPosterEventTicketFaceViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "accessibilityIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("LogoImage")) == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
