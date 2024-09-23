@implementation NTKCompanionMonogramEntryViewController

+ (NSString)localizedTitle
{
  return (NSString *)NTKCBundleLocalizedString(CFSTR("MONOGRAM"), CFSTR("Monogram"));
}

+ (NSString)localizedDescription
{
  void *v2;
  __CFString *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "deviceCategory") == 1)
  {
    v3 = CFSTR("MONOGRAM_DESCRIPTION");
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D5DDA3E7-8863-48E3-95C7-3C65C5E31718"));
    v5 = objc_msgSend(v2, "supportsCapability:", v4);

    if ((v5 & 1) != 0)
    {
      v3 = CFSTR("MONOGRAM_DESCRIPTION_TYPOGRAPH");
    }
    else if (objc_msgSend(v2, "isRunningGraceOrLater"))
    {
      v3 = CFSTR("MONOGRAM_DESCRIPTION_MERIDIAN_CALIFORNIA");
    }
    else
    {
      v3 = CFSTR("MONOGRAM_DESCRIPTION_INFOGRAPH");
    }
  }
  NTKCBundleLocalizedString(v3, CFSTR("description"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NTKCompanionMonogramEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  NTKCompanionMonogramEntryViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKCompanionMonogramEntryViewController;
  v4 = -[NTKCompanionMonogramEntryViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    +[NTKCompanionMonogramEntryViewController localizedTitle](NTKCompanionMonogramEntryViewController, "localizedTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCompanionMonogramEntryViewController setTitle:](v4, "setTitle:", v5);

  }
  return v4;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKCompanionMonogramEntryViewController;
  -[NTKCompanionMonogramEntryViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[NTKCompanionMonogramEntryViewController presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UITextField resignFirstResponder](self->_monogramEntry, "resignFirstResponder");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80520], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel_setCustomMonogram_specifier_, sel_customMonogram_, 0, 8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKCompanionMonogramEntryViewController localizedDescription](NTKCompanionMonogramEntryViewController, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v7, *MEMORY[0x1E0D80848]);

    v11[0] = v5;
    v11[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v8;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKCompanionMonogramEntryViewController;
  -[NTKCompanionMonogramEntryViewController tableView:cellForRowAtIndexPath:](&v10, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "tag") == 8)
  {
    objc_msgSend(v5, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCompanionMonogramEntryViewController setMonogramEntry:](self, "setMonogramEntry:", v6);

    -[UITextField setAcceptsEmoji:](self->_monogramEntry, "setAcceptsEmoji:", 0);
    -[UITextField setAutocorrectionType:](self->_monogramEntry, "setAutocorrectionType:", 1);
    -[UITextField setSpellCheckingType:](self->_monogramEntry, "setSpellCheckingType:", 1);
    -[UITextField becomeFirstResponder](self->_monogramEntry, "becomeFirstResponder");
    objc_msgSend(v5, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClearButtonMode:", 3);

    objc_msgSend(v5, "editableTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

  }
  return v5;
}

- (void)returnPressedAtEnd
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return objc_msgSend(a5, "ntk_containsOnlyValidMonogramCharacters", a3, a4.location, a4.length);
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  -[UITextField text](self->_monogramEntry, "text", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[UITextField text](self->_monogramEntry, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7 >= 5)
      v8 = 5;
    else
      v8 = v7;
    -[UITextField text](self->_monogramEntry, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "rangeOfComposedCharacterSequencesForRange:", 0, v8);
    v12 = v11;

    -[UITextField text](self->_monogramEntry, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "substringWithRange:", v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uppercaseStringWithLocale:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextField setText:](self->_monogramEntry, "setText:", v16);
  }
  -[UITextField text](self->_monogramEntry, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    -[UITextField text](self->_monogramEntry, "text");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKCompanionMonogramEntryViewController setCustomMonogram:specifier:](self, "setCustomMonogram:specifier:", v19, *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]));

  }
}

- (void)setCustomMonogram:(id)a3 specifier:(id)a4
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "ntk_isValidMonogram"))
  {
    +[NTKCustomMonogramStore sharedInstance](NTKCustomMonogramStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCustomMonogram:", v5);

  }
}

- (id)customMonogram:(id)a3
{
  return +[NTKMonogram monogram](NTKMonogram, "monogram", a3);
}

- (void)setShowsDoneButton:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;

  if (self->_showsDoneButton != a3)
  {
    self->_showsDoneButton = a3;
    if (a3)
    {
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneTapped);
      -[NTKCompanionMonogramEntryViewController navigationItem](self, "navigationItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRightBarButtonItem:", v5);

    }
    else
    {
      -[NTKCompanionMonogramEntryViewController navigationItem](self, "navigationItem");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRightBarButtonItem:", 0);

    }
  }
}

- (void)_resetEntryField
{
  id v3;

  -[NTKCompanionMonogramEntryViewController customMonogram:](self, "customMonogram:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_monogramEntry, "setText:", v3);

}

- (void)_doneTapped
{
  id v2;

  -[NTKCompanionMonogramEntryViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UITextField)monogramEntry
{
  return self->_monogramEntry;
}

- (void)setMonogramEntry:(id)a3
{
  objc_storeStrong((id *)&self->_monogramEntry, a3);
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramEntry, 0);
}

@end
