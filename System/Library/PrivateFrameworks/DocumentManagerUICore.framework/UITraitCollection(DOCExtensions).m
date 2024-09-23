@implementation UITraitCollection(DOCExtensions)

+ (id)doc_traitsAffectingFonts
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (double)doc_UIEdgeInsetsFromDirectionalInsets:()DOCExtensions
{
  objc_msgSend(a1, "layoutDirection");
  return a2;
}

- (double)doc_NSDirectionalEdgeInsetsFromInsets:()DOCExtensions
{
  objc_msgSend(a1, "layoutDirection");
  return a2;
}

@end
