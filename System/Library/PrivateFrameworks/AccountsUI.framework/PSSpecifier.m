@implementation PSSpecifier

void __49__PSSpecifier_AccountsUI__acui_iconForDataclass___block_invoke(id *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  BOOL v6;
  id v7;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  id location;
  id v31[3];

  v31[2] = a1;
  v31[1] = a1;
  v31[0] = (id)objc_msgSend(MEMORY[0x1E0D80458], "settingsIconCache");
  v1 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)acui_iconForDataclass__dataClassIcons;
  acui_iconForDataclass__dataClassIcons = (uint64_t)v1;

  v9 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D806D0]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v10 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D806B0]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v11 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D80630]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v12 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D80638]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v13 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D80668]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v14 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D80670]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v15 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D80678]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v16 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D80680]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v17 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D806A0]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v18 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D80688]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v19 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D80690]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v20 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D80698]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v21 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D806A8]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v22 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D806C8]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v23 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D806B8]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v24 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D80640]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v25 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D80648]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v26 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D80650]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v27 = (id)objc_msgSend(v31[0], "imageForKey:", *MEMORY[0x1E0D806C0]);
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  v28 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v29 = objc_msgSend(v28, "userInterfaceIdiom") != 0;

  if (v29)
  {
    v5 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = objc_msgSend(v5, "userInterfaceIdiom") != 4;

    if (v6)
    {
      v3 = (id)objc_msgSend(a1[4], "imageForApplicationBundleIdentifier:", CFSTR("com.apple.facetime"));
      objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

    }
    else
    {
      v4 = (id)objc_msgSend(a1[4], "imageForApplicationBundleIdentifier:", CFSTR("com.apple.NanoPhone"));
      objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

    }
  }
  else
  {
    v7 = (id)objc_msgSend(a1[4], "imageForApplicationBundleIdentifier:", CFSTR("com.apple.mobilephone"));
    objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  }
  location = (id)objc_msgSend(a1[4], "imageForApplicationBundleIdentifier:", CFSTR("com.apple.journal"));
  if (location)
    objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:", location, *MEMORY[0x1E0C8EEC8]);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v31, 0);
}

void __63__PSSpecifier_AccountsUI__circularImageFromCGImage_size_scale___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  __int128 v5;
  CGContextRef v6;
  uint64_t v7;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = a1;
  v6 = (CGContextRef)objc_msgSend(location[0], "CGContext");
  v4 = 0u;
  v5 = 0u;
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(_OWORD *)(a1 + 40);
  v3 = (id)objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", v4, v5);
  CGContextAddPath(v6, (CGPathRef)objc_msgSend(objc_retainAutorelease(v3), "CGPath"));
  CGContextClip(v6);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v4, v5);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(location, 0);
}

void __70__PSSpecifier_AccountsUI__acui_specifierIconForAccountTypeIdentifier___block_invoke(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  id v20;
  id v21;
  id v22[3];

  v22[2] = a1;
  v22[1] = a1;
  v22[0] = (id)objc_msgSend(MEMORY[0x1E0D80458], "settingsIconCache");
  v1 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache;
  acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache = (uint64_t)v1;

  v3 = (id)objc_msgSend(v22[0], "imageForKey:", *MEMORY[0x1E0D806D8]);
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  v4 = (void *)MEMORY[0x1E0CEA638];
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("Exchange_small"));
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  v7 = (void *)MEMORY[0x1E0CEA638];
  v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("Gmail_small"));
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  v10 = (void *)MEMORY[0x1E0CEA638];
  v12 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (id)objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("Yahoo_small"));
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  v13 = (id)objc_msgSend(v22[0], "imageForKey:", *MEMORY[0x1E0D80630]);
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  v15 = (_QWORD *)MEMORY[0x1E0D80638];
  v14 = (id)objc_msgSend(v22[0], "imageForKey:", *MEMORY[0x1E0D80638]);
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  v16 = (id)objc_msgSend(v22[0], "imageForKey:", *v15);
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  v19 = (_QWORD *)MEMORY[0x1E0D80680];
  v17 = (id)objc_msgSend(v22[0], "imageForKey:", *MEMORY[0x1E0D80680]);
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  v18 = (id)objc_msgSend(v22[0], "imageForKey:", *v19);
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  v20 = (id)objc_msgSend(v22[0], "imageForKey:", *v19);
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  v21 = (id)objc_msgSend(v22[0], "imageForKey:", *MEMORY[0x1E0D806E0]);
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  objc_storeStrong(v22, 0);
}

void __46__PSSpecifier_AccountsUI___switchSpinnerTimer__block_invoke(id *a1)
{
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  v2[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v2[0], "startAnimating");
  objc_msgSend(a1[4], "setAccessoryView:", v2[0]);
  objc_storeStrong(v2, 0);
}

void __46__PSSpecifier_AccountsUI___switchSpinnerTimer__block_invoke_2(uint64_t a1)
{
  id v1;
  id v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 40), "propertyForKey:", *MEMORY[0x1E0D807D0]);
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryView:");

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "accessoryView");
  objc_msgSend(v3, "setEnabled:", 1);

}

@end
