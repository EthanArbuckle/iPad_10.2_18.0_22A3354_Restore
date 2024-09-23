@implementation ICDocCamRenamePrompt

- (ICDocCamRenamePrompt)initWithExistingTitle:(id)a3
{
  id v5;
  ICDocCamRenamePrompt *v6;
  ICDocCamRenamePrompt *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamRenamePrompt;
  v6 = -[ICDocCamRenamePrompt init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_existingTitle, a3);

  return v7;
}

- (void)showFromViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id location[2];

  v6 = a3;
  v7 = a4;
  -[ICDocCamRenamePrompt setStrongSelf:](self, "setStrongSelf:", self);
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Rename"), CFSTR("Rename"), CFSTR("Localizable"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v8, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("character.cursor.ibeam"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v10);

  objc_initWeak(location, self);
  v11 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke;
  v36[3] = &unk_24C5B91A0;
  objc_copyWeak(&v38, location);
  v12 = v6;
  v37 = v12;
  objc_msgSend(v9, "addTextFieldWithConfigurationHandler:", v36);
  v25 = (void *)v8;
  v13 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v11;
  v33[1] = 3221225472;
  v33[2] = __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke_2;
  v33[3] = &unk_24C5B91C8;
  v15 = v7;
  v34 = v15;
  objc_copyWeak(&v35, location);
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, v33);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v16);

  v17 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Save"), CFSTR("Save"), CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke_3;
  v28[3] = &unk_24C5B91F0;
  v19 = v9;
  v29 = v19;
  objc_copyWeak(&v32, location);
  v20 = v12;
  v30 = v20;
  v21 = v15;
  v31 = v21;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamRenamePrompt setSaveAction:](self, "setSaveAction:", v22);
  -[ICDocCamRenamePrompt existingTitle](self, "existingTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamRenamePrompt enableAction:withString:](self, "enableAction:withString:", v22, v23);

  objc_msgSend(v19, "addAction:", v22);
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke_4;
  v26[3] = &unk_24C5B7AE0;
  v24 = v19;
  v27 = v24;
  objc_msgSend(v20, "presentViewController:animated:completion:", v24, 1, v26);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v38);
  objc_destroyWeak(location);

}

void __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "existingTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Name"), CFSTR("Name"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v7);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutocapitalizationType:", DCLocalizedCapitalizationStyleForView(v8));

  v9 = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", v9, sel_textFieldChanged_, 0x20000);

  objc_msgSend(v4, "setClearButtonMode:", 1);
  v10 = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "setDelegate:", v10);

}

void __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setStrongSelf:", 0);

}

void __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v17 = 0;
  v7 = objc_msgSend(WeakRetained, "isTitleValid:error:", v5, &v17);
  v8 = v17;

  if ((v7 & 1) == 0)
  {
    v9 = objc_loadWeakRetained((id *)(a1 + 56));
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "userInfo");
    v16 = v3;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FF0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showSingleButtonAlertFromViewController:withTitle:message:", v10, v12, v14);

    v3 = v16;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v15 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v15, "setStrongSelf:", 0);

}

void __58__ICDocCamRenamePrompt_showFromViewController_completion___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
    objc_msgSend(v4, "selectAll:", 0);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
    v12 = -[ICDocCamRenamePrompt isTitleValid:error:](self, "isTitleValid:error:", v11, 0);
  else
    v12 = 1;

  return v12;
}

- (BOOL)isTitleValid:(id)a3 error:(id *)a4
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v5 = (__CFString *)a3;
  if (v5)
    v6 = v5;
  else
    v6 = &stru_24C5B9710;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByTrimmingCharactersInSet:](v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    if ((unint64_t)objc_msgSend(v8, "length") < 0x81)
    {
      LOBYTE(a4) = 1;
      goto LABEL_12;
    }
    if (a4)
    {
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Please choose a different name."), CFSTR("Please choose a different name."), CFSTR("Localizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("Collection names can’t be longer than 128 characters.");
LABEL_10:
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", v10, v10, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x24BDD0FF0];
      v17[0] = *MEMORY[0x24BDD0FC8];
      v17[1] = v14;
      v18[0] = v9;
      v18[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 1024, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else if (a4)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Please choose a different name."), CFSTR("Please choose a different name."), CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = CFSTR("Scanned document collection names can’t be blank.");
    goto LABEL_10;
  }
LABEL_12:

  return (char)a4;
}

- (void)showSingleButtonAlertFromViewController:(id)a3 withTitle:(id)a4 message:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v18 = a4;
  v7 = a5;
  v8 = a3;
  if ((unint64_t)objc_msgSend(v18, "length") < 0xC9)
  {
    v12 = v18;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v18, "substringToIndex:", 200);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@…"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v11;
  }
  v19 = v12;
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v12, v7, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v14);

  v15 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v17);

  objc_msgSend(v8, "presentViewController:animated:completion:", v13, 1, 0);
}

- (id)stringByScrubbingStringForCollectionName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v4);

  v6 = v3;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((unint64_t)objc_msgSend(v6, "length") >= 0x81)
  {
    objc_msgSend(v6, "dc_substringToIndex:", 128);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }

  return v6;
}

- (void)textFieldChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  v5 = objc_opt_class();
  DCDynamicCast(v5, (uint64_t)v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICDocCamRenamePrompt saveAction](self, "saveAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamRenamePrompt enableAction:withString:](self, "enableAction:withString:", v7, v6);

  }
  -[ICDocCamRenamePrompt stringByScrubbingStringForCollectionName:](self, "stringByScrubbingStringForCollectionName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0)
  {
    v9 = objc_msgSend(v12, "selectionRange");
    v11 = v10;
    objc_msgSend(v12, "setText:", v8);
    if (v9 + v11 < (unint64_t)objc_msgSend(v8, "length"))
      objc_msgSend(v12, "setSelectionRange:", v9, v11);
  }

}

- (void)enableAction:(id)a3 withString:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v8);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setEnabled:", objc_msgSend(v15, "length") != 0);
  v9 = objc_opt_class();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("_representer"));
  v10 = objc_claimAutoreleasedReturnValue();
  DCDynamicCast(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = objc_msgSend(v7, "isEnabled");
  if ((v10 & 1) != 0)
  {
    v12 = *MEMORY[0x24BDF73E8];
    v13 = objc_msgSend(v11, "accessibilityTraits") & ~v12;
  }
  else
  {
    v14 = objc_msgSend(v11, "accessibilityTraits");
    v13 = *MEMORY[0x24BDF73E8] | v14;
  }
  objc_msgSend(v11, "setAccessibilityTraits:", v13);

}

- (NSString)existingTitle
{
  return self->_existingTitle;
}

- (void)setExistingTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIAlertAction)saveAction
{
  return self->_saveAction;
}

- (void)setSaveAction:(id)a3
{
  objc_storeStrong((id *)&self->_saveAction, a3);
}

- (ICDocCamRenamePrompt)strongSelf
{
  return self->_strongSelf;
}

- (void)setStrongSelf:(id)a3
{
  objc_storeStrong((id *)&self->_strongSelf, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_saveAction, 0);
  objc_storeStrong((id *)&self->_existingTitle, 0);
}

@end
