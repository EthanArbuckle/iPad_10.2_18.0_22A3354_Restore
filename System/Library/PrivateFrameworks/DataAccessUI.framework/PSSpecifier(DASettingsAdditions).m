@implementation PSSpecifier(DASettingsAdditions)

+ (id)switchSpecifierWithTitle:()DASettingsAdditions target:setter:getter:key:
{
  id v11;
  void *v12;
  void *v13;

  v11 = a7;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a3, a4, a5, a6, 0, 6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "setProperty:forKey:", v11, *MEMORY[0x24BE75B50]);

  return v13;
}

+ (id)buttonSpecifierWithTitle:()DASettingsAdditions target:action:confirmationInfo:
{
  id v9;
  id v10;
  id v11;
  char *v12;
  void *v13;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend((id)objc_opt_class(), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, v10, 0, 0, 0, 13, 0);
  v12 = (char *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  *(_QWORD *)&v12[*MEMORY[0x24BE75720]] = a5;
  if (v11)
    objc_msgSend(v12, "setupWithDictionary:", v11);

  return v13;
}

@end
