@implementation DMCMDMDetailsSpecifierProvider

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)DMCMDMDetailsSpecifierProvider;
  -[DMCSpecifierProvider specifiers](&v12, sel_specifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v11.receiver = self;
    v11.super_class = (Class)DMCMDMDetailsSpecifierProvider;
    -[DMCSpecifierProvider specifiers](&v11, sel_specifiers);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  -[DMCSpecifierProvider rmAccount](self, "rmAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[DMCSpecifierProvider cachedSpecifiers:](self, "cachedSpecifiers:", MEMORY[0x24BDBD1A8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", *MEMORY[0x24BE61410]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  -[DMCMDMDetailsSpecifierProvider _specifierForMDMProfile](self, "_specifierForMDMProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCSpecifierProvider cachedSpecifiers:](self, "cachedSpecifiers:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_specifierForMDMProfile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  DMCLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, objc_opt_class(), 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[DMCIconFactory gearIcon](DMCIconFactory, "gearIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v6, *MEMORY[0x24BE75AC8]);

  objc_msgSend(v5, "setIdentifier:", *MEMORY[0x24BE61408]);
  objc_msgSend(v5, "setControllerLoadAction:", sel__specifierForMDMProfileWasTapped_);
  objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  return v5;
}

- (void)_specifierForMDMProfileWasTapped:(id)a3
{
  void *v4;
  void *v5;
  DMCProfileViewController *v6;

  v6 = -[DMCProfileViewController initWithMDMProfileForRMAccount]([DMCProfileViewController alloc], "initWithMDMProfileForRMAccount");
  DMCLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileViewController setTitle:](v6, "setTitle:", v4);

  -[DMCSpecifierProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierProvider:showViewController:", self, v6);

}

@end
