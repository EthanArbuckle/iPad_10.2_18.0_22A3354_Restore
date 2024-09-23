@implementation UIInterfaceAction(SUUIContextActions)

+ (id)actionWithTitle:()SUUIContextActions resource:handler:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BEBD678];
  v8 = a4;
  objc_msgSend(v7, "actionWithTitle:type:handler:", a3, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitleAlignment:", 4);
  objc_msgSend(v8, "_imageThatSuppressesAccessibilityHairlineThickening");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "size");
  objc_msgSend(v10, "imageWithAlignmentRectInsets:", (56.0 - v11) * -0.5, 0.0, (56.0 - v11) * -0.5, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTrailingImage:", v12);

  return v9;
}

@end
