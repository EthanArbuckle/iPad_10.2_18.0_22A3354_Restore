@implementation SKUIProductPageReviewsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIProductPageReviewsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIProductPageReviewsViewController"), CFSTR("setFacebookLikeStatus:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIProductPageReviewsViewController"), CFSTR("_headerViewController"), "SKUIProductPageHeaderViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIReviewsFacebookViewController"), CFSTR("_facebookLikeStatus"), "SKUIFacebookLikeStatus");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIProductPageReviewsViewController"), CFSTR("_facebookViewController"), "SKUIReviewsFacebookViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIFacebookLikeStatus"), CFSTR("friendNames"), "@", 0);

}

- (void)setFacebookLikeStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductPageReviewsViewControllerAccessibility;
  -[SKUIProductPageReviewsViewControllerAccessibility setFacebookLikeStatus:](&v13, sel_setFacebookLikeStatus_, v4);
  -[SKUIProductPageReviewsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_facebookViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_facebookLikeStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("friendNames"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[SKUIProductPageReviewsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_headerViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_accessibilitySetRetainedValue:forKey:", v12, CFSTR("facebookCount"));

}

@end
