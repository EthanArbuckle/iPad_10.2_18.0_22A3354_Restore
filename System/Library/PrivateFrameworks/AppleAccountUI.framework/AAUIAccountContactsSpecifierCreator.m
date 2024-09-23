@implementation AAUIAccountContactsSpecifierCreator

- (id)createSubtitleTableCellWithName:(id)a3 title:(id)a4 subtitle:(id)a5 image:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = (void *)MEMORY[0x1E0D804E8];
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a3, self, 0, 0, 0, 3, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v14, "setProperty:forKey:", v13, *MEMORY[0x1E0D80978]);

  objc_msgSend(v14, "setProperty:forKey:", v12, *MEMORY[0x1E0D80950]);
  if (v10)
    objc_msgSend(v14, "setProperty:forKey:", v10, *MEMORY[0x1E0D80870]);

  return v14;
}

- (id)createTableCellWithName:(id)a3 title:(id)a4 longSubtitle:(id)a5 image:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = (void *)MEMORY[0x1E0D804E8];
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a3, self, 0, 0, 0, 3, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v14, "setProperty:forKey:", v13, *MEMORY[0x1E0D80978]);

  objc_msgSend(v14, "setProperty:forKey:", v12, *MEMORY[0x1E0D80950]);
  if (v10)
    objc_msgSend(v14, "setProperty:forKey:", v10, *MEMORY[0x1E0D80870]);

  return v14;
}

- (id)createTableCellForContact:(id)a3 loadAction:(SEL)a4 target:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (void *)MEMORY[0x1E0D804E8];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, v8, 0, 0, 0, 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v12, *MEMORY[0x1E0D80978]);

  objc_msgSend(v9, "detailsText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v13, *MEMORY[0x1E0D80950]);

  +[AAUITrustedContactsImageProvider imageForLocalContact:](AAUITrustedContactsImageProvider, "imageForLocalContact:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v14, *MEMORY[0x1E0D80870]);

  objc_msgSend(v11, "setControllerLoadAction:", a4);
  objc_msgSend(v11, "setUserInfo:", v9);

  return v11;
}

- (id)createAddTableCellWithTitle:(id)a3 loadAction:(SEL)a4 target:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a3, a5, 0, 0, 0, 13, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AAUITrustedContactsImageProvider addContactImage](AAUITrustedContactsImageProvider, "addContactImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x1E0D80870]);

  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
  objc_msgSend(v6, "setIdentifier:", CFSTR("AddTableCell"));
  objc_msgSend(v6, "setButtonAction:", a4);
  return v6;
}

- (id)createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  void *v26;
  void *v27;
  NSRange v29;

  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ %@"), a5, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:name:", v18, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setProperty:forKey:", v19, *MEMORY[0x1E0D80848]);
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setProperty:forKey:", v22, *MEMORY[0x1E0D80818]);

  objc_msgSend(v20, "setProperty:forKey:", v19, *MEMORY[0x1E0D80838]);
  v23 = objc_msgSend(v19, "rangeOfString:", v16);
  v25 = v24;

  v29.location = v23;
  v29.length = v25;
  NSStringFromRange(v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setProperty:forKey:", v26, *MEMORY[0x1E0D80828]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setProperty:forKey:", v27, *MEMORY[0x1E0D80830]);
  objc_msgSend(v20, "setProperty:forKey:", v15, *MEMORY[0x1E0D80820]);

  return v20;
}

@end
