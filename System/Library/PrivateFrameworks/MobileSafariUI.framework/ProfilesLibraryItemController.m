@implementation ProfilesLibraryItemController

- (void)updateListContentConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0DC3870];
  v12 = a3;
  objc_msgSend(v4, "_systemImageNamed:", CFSTR("person.crop.rectangle.stack"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v5);

  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v6);

  -[ProfilesLibraryItemController tabGroupProvider](self, "tabGroupProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSecondaryText:", v9);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "secondaryTextProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  objc_msgSend(v12, "setPrefersSideBySideTextAndSecondaryText:", 1);
}

- (id)accessories
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[ProfilesLibraryItemController tabGroupProvider](self, "tabGroupProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0DC3590]);
  objc_msgSend(v2, "menuForSwitchingProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithMenu:", v4);

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)tabGroupProvider
{
  void *v2;
  void *v3;

  -[LibraryItemController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabGroupProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
