@implementation UIStackView(ClipServicesUIExtras)

- (void)cps_addArrangedSpacerWithHeight:()ClipServicesUIExtras
{
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToConstant:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  objc_msgSend(a1, "addArrangedSubview:", v6);
}

@end
