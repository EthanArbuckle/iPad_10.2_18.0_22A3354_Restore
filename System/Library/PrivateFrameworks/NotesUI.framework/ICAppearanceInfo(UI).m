@implementation ICAppearanceInfo(UI)

- (double)navigationBarAlpha
{
  return 0.98;
}

+ (id)currentInfo
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_appearanceInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)defaultTraitCollection
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v1 = objc_msgSend(a1, "type");
  if (!v1)
  {
    v2 = 1;
    goto LABEL_5;
  }
  if (v1 == 1)
  {
    v2 = 2;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v3 = 0;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  v7 = 2.0;
  if (v6 >= 2.0)
    v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithDisplayScale:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_traitCollectionByAppendingNonNilTraitCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)performAsDefaultAppearance:()UI
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "defaultTraitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_performAsCurrent:", v4);

}

@end
