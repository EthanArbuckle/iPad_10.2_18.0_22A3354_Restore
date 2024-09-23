@implementation PSSpecifier(AccountsUI)

+ (uint64_t)_bundle
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

+ (id)acui_iconForDataclass:()AccountsUI
{
  id v4;
  uint64_t obja;
  int v6;
  int v7;
  void (*v8)(id *);
  void *v9;
  uint64_t v10;
  id location[2];
  uint64_t v12;
  id v13;
  dispatch_once_t *v14;

  v12 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  obja = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __49__PSSpecifier_AccountsUI__acui_iconForDataclass___block_invoke;
  v9 = &__block_descriptor_40_e5_v8__0l;
  v10 = v12;
  v14 = (dispatch_once_t *)&acui_iconForDataclass__onceToken;
  v13 = 0;
  objc_storeStrong(&v13, &obja);
  if (*v14 != -1)
    dispatch_once(v14, v13);
  objc_storeStrong(&v13, 0);
  v4 = (id)objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "objectForKeyedSubscript:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)imageForApplicationBundleIdentifier:()AccountsUI
{
  id v3;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location[3];

  location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v10 = (id)objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A890]);
  v3 = objc_alloc(MEMORY[0x1E0D3A820]);
  v9 = (id)objc_msgSend(v3, "initWithBundleIdentifier:", location[0]);
  v8 = (id)objc_msgSend(v9, "prepareImageForDescriptor:", v10);
  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = objc_msgSend(v8, "CGImage");
  objc_msgSend(v8, "scale");
  v7 = (id)objc_msgSend(v5, "imageWithCGImage:scale:orientation:", v6, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)circularImageFromCGImage:()AccountsUI size:scale:
{
  id v6;
  id v8;
  id v9;
  os_log_t oslog;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  __int128 v17;
  id v18;
  id v19;
  id v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint8_t v26[40];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  *(double *)&v25 = a4;
  *((double *)&v25 + 1) = a5;
  v24 = a1;
  v23 = a2;
  v22 = a3;
  v21 = a6;
  v6 = objc_alloc(MEMORY[0x1E0CEA610]);
  v20 = (id)objc_msgSend(v6, "initWithSize:", v25);
  v19 = (id)objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v22, 0, v21);
  v9 = v20;
  v11 = MEMORY[0x1E0C809B0];
  v12 = -1073741824;
  v13 = 0;
  v14 = __63__PSSpecifier_AccountsUI__circularImageFromCGImage_size_scale___block_invoke;
  v15 = &unk_1E9A157C8;
  v17 = v25;
  v16 = v19;
  v18 = (id)objc_msgSend(v9, "imageWithActions:", &v11);
  if (!v18)
  {
    oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_32((uint64_t)v26, (uint64_t)"+[PSSpecifier(AccountsUI) circularImageFromCGImage:size:scale:]", 119, (uint64_t)"+[PSSpecifier(AccountsUI) circularImageFromCGImage:size:scale:]");
      _os_log_error_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"%s Couldn't create circular image\", v26, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v8 = v18;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  return v8;
}

+ (id)acui_specifierIconForAccountTypeIdentifier:()AccountsUI
{
  id v4;
  id location[3];
  id v6;
  dispatch_once_t *v7;

  location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v7 = (dispatch_once_t *)&acui_specifierIconForAccountTypeIdentifier__onceToken;
  v6 = 0;
  objc_storeStrong(&v6, &__block_literal_global_5);
  if (*v7 != -1)
    dispatch_once(v7, v6);
  objc_storeStrong(&v6, 0);
  v4 = (id)objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "objectForKeyedSubscript:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)acui_specifierForDataclass:()AccountsUI target:set:get:
{
  id v10;
  id v11;
  id location[2];
  id v13;

  v13 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = (id)objc_msgSend(v13, "acui_specifierForDataclass:account:target:set:get:", location[0], 0, v11, a5, a6);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)acui_specifierForDataclass:()AccountsUI account:target:set:get:
{
  id v8;
  id v13;
  id v14;
  id v15[3];
  id v16;
  id v17;
  id location[2];
  id v19;

  v19 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v15[2] = a6;
  v15[1] = a7;
  v15[0] = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", location[0], CFSTR("LABEL"), v17);
  v14 = (id)objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15[0], v16, a6, a7, 0, 6, 0);
  v13 = (id)objc_msgSend(v19, "acui_iconForDataclass:", location[0]);
  if (v13)
    objc_msgSend(v14, "setProperty:forKey:", v13, *MEMORY[0x1E0D80870]);
  objc_msgSend(v14, "setProperty:forKey:", location[0], *MEMORY[0x1E0D80868]);
  objc_msgSend(v14, "setProperty:forKey:", location[0], CFSTR("com.apple.accountsui.dataclass"));
  v8 = v14;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v8;
}

+ (id)acui_linkListCellSpecifierForDataclass:()AccountsUI target:set:get:detail:
{
  id v12;
  id v13;
  id location[2];
  id v15;

  v15 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = (id)objc_msgSend(v15, "acui_linkListCellSpecifierForDataclass:account:target:set:get:detail:", location[0], 0, v13, a5, a6, a7);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v12;
}

+ (id)acui_linkListCellSpecifierForDataclass:()AccountsUI account:target:set:get:detail:
{
  id v9;
  id v15;
  id v16;
  id v17[4];
  id v18;
  id v19;
  id location[2];
  id v21;

  v21 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v17[3] = a6;
  v17[2] = a7;
  v17[1] = a8;
  v17[0] = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", location[0], CFSTR("LABEL"), 0);
  v16 = (id)objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17[0], v18, a6, a7, a8, 2, 0);
  v15 = (id)objc_msgSend(v21, "acui_iconForDataclass:", location[0]);
  if (v15)
    objc_msgSend(v16, "setProperty:forKey:", v15, *MEMORY[0x1E0D80870]);
  objc_msgSend(v16, "setProperty:forKey:", location[0], *MEMORY[0x1E0D80868]);
  objc_msgSend(v16, "setProperty:forKey:", location[0], CFSTR("com.apple.accountsui.dataclass"));
  v9 = v16;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (uint64_t)acui_dataclass
{
  return objc_msgSend(a1, "propertyForKey:", CFSTR("com.apple.accountsui.dataclass"), a2, a1);
}

+ (id)acui_specifierForAppWithBundleID:()AccountsUI target:set:get:
{
  id v6;
  id v7;
  double v8;
  id v9;
  id v10;
  id v12;
  id v13;
  double v14;
  os_log_t oslog;
  id v19;
  double v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id location[2];
  id v27;
  uint8_t v28[40];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = a5;
  v23 = a6;
  v22 = 0;
  v21 = (id)SBSCopyLocalizedApplicationNameForDisplayIdentifier();
  if (objc_msgSend(v21, "length"))
  {
    v6 = (id)objc_msgSend(v27, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, v25, v24, v23, 0, 6, 0);
    v7 = v22;
    v22 = v6;

    objc_msgSend(v22, "setProperty:forKey:", location[0], *MEMORY[0x1E0D80868]);
    objc_msgSend(v22, "setProperty:forKey:", location[0], CFSTR("com.apple.accountsui.bundleID"));
    v13 = (id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    objc_msgSend(v13, "scale");
    v14 = v8;

    v20 = v14;
    v19 = 0;
    if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("com.apple.siri")) & 1) != 0)
      v9 = (id)PSSiriImage();
    else
      v9 = (id)objc_msgSend(MEMORY[0x1E0CEA638], "_applicationIconImageForBundleIdentifier:format:scale:", location[0], 0, v20);
    v10 = v19;
    v19 = v9;

    if (v19)
      objc_msgSend(v22, "setProperty:forKey:", v19, *MEMORY[0x1E0D80870]);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v28, (uint64_t)"+[PSSpecifier(AccountsUI) acui_specifierForAppWithBundleID:target:set:get:]", 242, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"SBS did not give us a name for the app with identifier %@!\", v28, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v12 = v22;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (uint64_t)acui_appBundleID
{
  return objc_msgSend(a1, "propertyForKey:", CFSTR("com.apple.accountsui.bundleID"), a2, a1);
}

- (NSObject)_switchSpinnerTimer
{
  dispatch_time_t v2;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(id *);
  void *v21;
  id v22;
  NSObject *v23;
  id v24[2];
  id v25;

  v25 = a1;
  v24[1] = a2;
  v24[0] = (id)objc_msgSend(a1, "propertyForKey:", *MEMORY[0x1E0D80940]);
  v9 = MEMORY[0x1E0C80D38];
  v23 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v9);

  if (v24[0])
  {
    v2 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v23, v2, 0xFFFFFFFFFFFFFFFFLL, 0);
    v5 = v23;
    v6 = MEMORY[0x1E0C809B0];
    v17 = MEMORY[0x1E0C809B0];
    v18 = -1073741824;
    v19 = 0;
    v20 = __46__PSSpecifier_AccountsUI___switchSpinnerTimer__block_invoke;
    v21 = &unk_1E9A155C8;
    v22 = v24[0];
    dispatch_source_set_event_handler(v5, &v17);
    v7 = v23;
    v10 = v6;
    v11 = -1073741824;
    v12 = 0;
    v13 = __46__PSSpecifier_AccountsUI___switchSpinnerTimer__block_invoke_2;
    v14 = &unk_1E9A15508;
    v15 = v24[0];
    v16 = v25;
    dispatch_source_set_cancel_handler(v7, &v10);
    v8 = (id)objc_msgSend(v24[0], "accessoryView");
    objc_msgSend(v8, "setEnabled:", 0);

    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v22, 0);
  }
  v4 = v23;
  objc_storeStrong((id *)&v23, 0);
  objc_storeStrong(v24, 0);
  return v4;
}

@end
