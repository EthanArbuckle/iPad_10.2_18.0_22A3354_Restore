@implementation MAListSnippetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MAListSnippetView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MAListSnippetViewAccessibility;
  -[MAListSnippetViewAccessibility tableView:cellForRowAtIndexPath:](&v11, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("YelpAttribution"));

  if (v6)
  {
    AXMapsAssistantUILocString(CFSTR("YELP_REVIEWS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v7);
  }
  else
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("resultView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      objc_msgSend(v8, "accessibilityLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAccessibilityLabel:", v9);

    }
  }

  return v4;
}

@end
