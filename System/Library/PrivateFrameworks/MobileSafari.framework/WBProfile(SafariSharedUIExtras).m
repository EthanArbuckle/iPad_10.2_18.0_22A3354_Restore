@implementation WBProfile(SafariSharedUIExtras)

- (id)symbolImage
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "symbolImageName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v1, "length")
    || (objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v1),
        (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.fill"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

@end
