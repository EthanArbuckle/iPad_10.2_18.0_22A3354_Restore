@implementation UIFont(Helper)

+ (id)ck_italicBalloonFont
{
  void *v0;
  void *v1;
  void *v2;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "balloonTextFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ck_fontByAddingSymbolicTrait:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)ck_boldBalloonFont
{
  void *v0;
  void *v1;
  void *v2;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "balloonTextFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ck_fontByAddingSymbolicTrait:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ck_fontByAddingSymbolicTrait:()Helper
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ck_fontDescriptorByAddingSymbolicTrait:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ck_fontByRemovingSymbolicTrait:()Helper
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ck_fontDescriptorByRemovingSymbolicTrait:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ck_fontBySettingBoldEnabled:()Helper
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ck_fontDescriptorBySettingBoldEnabled:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ck_fontBySettingItalicEnabled:()Helper
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ck_fontDescriptorBySettingItalicEnabled:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)ck_hasItalicTrait
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ck_hasItalicTrait");

  return v4;
}

- (uint64_t)ck_hasBoldTrait
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ck_hasBoldTrait");

  return v4;
}

- (uint64_t)ck_lastResortFont
{
  objc_msgSend(a1, "pointSize");
  return objc_msgSend(MEMORY[0x1E0DC1350], "ck_lastResortFontOfSize:");
}

+ (CTFontRef)ck_lastResortFontOfSize:()Helper
{
  return CTFontCreateWithNameAndOptions(CFSTR(".LastResort"), a1, 0, 0x20000uLL);
}

@end
