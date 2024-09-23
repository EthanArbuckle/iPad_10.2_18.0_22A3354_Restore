@implementation IPInflectionSettingsViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IPInflectionSettingsViewController;
  -[IPInflectionSettingsViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[IPInflectionSettingsViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardDismissMode:", 1);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[IPInflectionSettingsViewController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("InflectionSettings"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("INFLECTION_GROUP"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPInflectionSettingsViewController inflection](self, "inflection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "gender");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GENDER_%ld_ID"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v10, *MEMORY[0x24BE75C20]);
    v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IPInflectionSettingsViewController;
  -[IPInflectionSettingsViewController tableView:didSelectRowAtIndexPath:](&v19, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  -[IPInflectionSettingsViewController inflection](self, "inflection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD19A8]);
    -[IPInflectionSettingsViewController setInflection:](self, "setInflection:", v8);

  }
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  -[IPInflectionSettingsViewController getGroup:row:ofSpecifierID:](self, "getGroup:row:ofSpecifierID:", &v18, 0, CFSTR("INFLECTION_GROUP"));
  v9 = objc_msgSend(v6, "section");
  if (v9 == v18)
  {
    -[IPInflectionSettingsViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyForKey:", *MEMORY[0x24BE75DA0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");
    -[IPInflectionSettingsViewController inflection](self, "inflection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGender:", v12);

    -[IPInflectionSettingsViewController inflection](self, "inflection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEnglishCustomPronoun:", 0);

    -[IPInflectionSettingsViewController reloadSpecifiers](self, "reloadSpecifiers");
    -[IPInflectionSettingsViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[IPInflectionSettingsViewController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPInflectionSettingsViewController inflection](self, "inflection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "inflectionSettingsViewController:inflectionDidChange:", self, v17);

    }
  }

}

- (id)thirdPartyCanAccessUserInflection
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IPInflectionSettingsViewController canShareInflection](self, "canShareInflection"));
}

- (void)setThirdPartyCanAccessUserInflection:(id)a3 specifier:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[IPInflectionSettingsViewController setCanShareInflection:](self, "setCanShareInflection:", objc_msgSend(v7, "BOOLValue"));
  -[IPInflectionSettingsViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IPInflectionSettingsViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inflectionSettingViewController:shareSettingDidChange:", self, objc_msgSend(v7, "BOOLValue"));

  }
}

+ (id)pronounDisplayStringForInflection:(id)a3
{
  return (id)objc_msgSend(a3, "localizedShortDescription");
}

- (_NSAttributedStringGrammarInflection)inflection
{
  return self->_inflection;
}

- (void)setInflection:(id)a3
{
  objc_storeStrong((id *)&self->_inflection, a3);
}

- (BOOL)canShareInflection
{
  return self->_canShareInflection;
}

- (void)setCanShareInflection:(BOOL)a3
{
  self->_canShareInflection = a3;
}

- (IPInflectionSettingsViewControllerDelegate)delegate
{
  return (IPInflectionSettingsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inflection, 0);
}

@end
