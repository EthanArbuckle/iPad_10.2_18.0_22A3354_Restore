@implementation DSAppPermissionsDescriptor(DigitalSeparationUI)

+ (id)iconAppBundleForPermission:()DigitalSeparationUI
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = iconAppBundleForPermission__token;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&iconAppBundleForPermission__token, &__block_literal_global_8);
  objc_msgSend((id)iconAppBundleForPermission__icons, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)iconAssetNameForPermission:()DigitalSeparationUI
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = iconAssetNameForPermission__token;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&iconAssetNameForPermission__token, &__block_literal_global_210);
  objc_msgSend((id)iconAssetNameForPermission__icons, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)iconForPermission:()DigitalSeparationUI tableFormat:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BE2CC48], "iconAppBundleForPermission:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && !+[DSUIUtilities isPlaceholderForApp:](DSUIUtilities, "isPlaceholderForApp:", v6))
  {
    if (a4)
      v15 = 0;
    else
      v15 = 12;
    +[DSUIUtilities appIconForAppID:format:](DSUIUtilities, "appIconForAppID:format:", v6, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2CC48], "iconAssetNameForPermission:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      +[DSUIUtilities appIconForAppID:format:](DSUIUtilities, "appIconForAppID:format:", &stru_24EFF4790, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "size");
      v13 = v12;
      objc_msgSend(v11, "size");
      objc_msgSend(v10, "imageByPreparingThumbnailOfSize:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }

  }
  return v10;
}

+ (id)stringKeyForPermission:()DigitalSeparationUI
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = stringKeyForPermission__token;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&stringKeyForPermission__token, &__block_literal_global_251);
  objc_msgSend((id)stringKeyForPermission__icons, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
