@implementation UIBarButtonItem(AMSUIWebAppViewModel)

+ (id)barButtonItemWithWebAppViewModel:()AMSUIWebAppViewModel
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BEBD410];
    v4 = a3;
    v5 = [v3 alloc];
    objc_msgSend(v4, "_makeBarButtonItemView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithCustomView:", v6);

    objc_msgSend(v4, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setAccessibilityLabel:", v8);
    objc_msgSend(v7, "setIsAccessibilityElement:", 1);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
