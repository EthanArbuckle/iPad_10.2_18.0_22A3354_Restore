@implementation UIColor

id __46__UIColor_MailUI__mailSecondaryLabelDarkColor__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC3E88];
  v10[0] = a2;
  v3 = a2;
  objc_msgSend(v2, "traitCollectionWithUserInterfaceStyle:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollectionWithTraitsFromCollections:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resolvedColorWithTraitCollection:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
