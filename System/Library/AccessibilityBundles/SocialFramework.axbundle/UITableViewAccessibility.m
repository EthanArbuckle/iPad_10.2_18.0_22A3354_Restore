@implementation UITableViewAccessibility

void __81__UITableViewAccessibility__Social__UIKit__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("SLFacebookLoginInfoTableViewFooter"));

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v10, "safeValueForKey:", CFSTR("subviews"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

    *a4 = 1;
  }

}

@end
