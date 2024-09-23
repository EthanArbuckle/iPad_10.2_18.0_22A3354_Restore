@implementation UIColor(ChatKitAdditions)

+ (id)ckColorNamed:()ChatKitAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CEA478];
  v4 = a3;
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorNamed:inBundle:compatibleWithTraitCollection:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_ckSystemBackgroundColor
{
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_opt_class(), "performSelector:", sel_systemBackgroundColor);
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dynamicColorWithLightColor:()ChatKitAdditions darkColor:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CEA478];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__UIColor_ChatKitAdditions__dynamicColorWithLightColor_darkColor___block_invoke;
  v12[3] = &unk_1E274E340;
  v13 = v5;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "colorWithDynamicProvider:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)resolvedColorForTraitCollection:()ChatKitAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CEAB40];
  v5 = a3;
  objc_msgSend(v4, "_currentTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "_setCurrentTraitCollection:", v5);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", objc_msgSend(objc_retainAutorelease(a1), "CGColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "_setCurrentTraitCollection:", v6);

  return v7;
}

+ (id)_ckSecondarySystemBackgroundColor
{
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_opt_class(), "performSelector:", sel_secondarySystemBackgroundColor);
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_ckTertiarySystemBackgroundColor
{
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_opt_class(), "performSelector:", sel_tertiarySystemBackgroundColor);
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_ckSystemGroupedBackgroundColor
{
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_opt_class(), "performSelector:", sel_systemGroupedBackgroundColor);
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_ckSecondarySystemGroupedBackgroundColor
{
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_opt_class(), "performSelector:", sel_secondarySystemGroupedBackgroundColor);
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_ckColor:()ChatKitAdditions forUserInterfaceStyle:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CEAB40];
  v6 = a3;
  objc_msgSend(v5, "_currentTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CEAB40];
  v14[0] = v7;
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollectionWithTraitsFromCollections:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "resolvedColorWithTraitCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
