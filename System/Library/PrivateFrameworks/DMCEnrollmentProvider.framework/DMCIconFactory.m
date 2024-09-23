@implementation DMCIconFactory

+ (id)_imageNamed:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    PSBlankIconImage();
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

+ (id)accountIcon
{
  return (id)objc_msgSend(a1, "_imageNamed:", CFSTR("account-icon"));
}

+ (id)appIcon
{
  return (id)objc_msgSend(a1, "_imageNamed:", CFSTR("app-icon"));
}

+ (id)gearIcon
{
  return (id)objc_msgSend(a1, "_imageNamed:", CFSTR("gear-icon"));
}

+ (id)largeGearIcon
{
  return (id)objc_msgSend(a1, "_imageNamed:", CFSTR("gear-icon-large"));
}

+ (id)graduationCapIcon
{
  return (id)objc_msgSend(a1, "_imageNamed:", CFSTR("graduationcap-icon"));
}

+ (id)keyIcon
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageForKey:", *MEMORY[0x24BE757F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)lanyardIcon
{
  return (id)objc_msgSend(a1, "_imageNamed:", CFSTR("lanyard-icon"));
}

+ (id)lanyardCardIcon
{
  return (id)objc_msgSend(a1, "_imageNamed:", CFSTR("lanyardcard-icon"));
}

+ (id)iCloudIcon
{
  return (id)objc_msgSend(a1, "_imageNamed:", CFSTR("icloud-icon"));
}

+ (id)iCloudCollaborationIcon
{
  return (id)objc_msgSend(a1, "_imageNamed:", CFSTR("icloudcollab-icon"));
}

+ (id)notesIcon
{
  return (id)objc_msgSend(a1, "_imageNamed:", CFSTR("notes-icon"));
}

+ (id)workBadgeIcon
{
  return (id)objc_msgSend(a1, "_imageNamed:", CFSTR("workbadge-icon"));
}

@end
