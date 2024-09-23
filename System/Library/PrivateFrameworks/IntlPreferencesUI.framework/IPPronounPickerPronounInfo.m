@implementation IPPronounPickerPronounInfo

- (IPPronounPickerPronounInfo)initWithExampleText:(id)a3 examplePlaceholder:(id)a4 morphology:(id)a5 language:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IPPronounPickerPronounInfo *v14;
  IPPronounPickerPronounInfo *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IPPronounPickerPronounInfo;
  v14 = -[IPPronounPickerPronounInfo init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[IPPronounPickerPronounInfo setExampleText:](v14, "setExampleText:", v10);
    -[IPPronounPickerPronounInfo setExamplePlaceholder:](v15, "setExamplePlaceholder:", v11);
    -[IPPronounPickerPronounInfo setMorphology:](v15, "setMorphology:", v12);
    -[IPPronounPickerPronounInfo setLanguage:](v15, "setLanguage:", v13);
  }

  return v15;
}

- (UITextField)entryField
{
  UITextField *entryField;
  IPLanguageSelectingEntryField *v4;
  UITextField *v5;
  UITextField *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  entryField = self->_entryField;
  if (!entryField)
  {
    v4 = [IPLanguageSelectingEntryField alloc];
    v5 = -[IPLanguageSelectingEntryField initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_entryField;
    self->_entryField = v5;

    -[IPPronounPickerPronounInfo language](self, "language");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setLanguage:](self->_entryField, "setLanguage:", v7);

    v8 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPPronounPickerPronounInfo language](self, "language");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredLocalizationsFromArray:forPreferences:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:localization:", CFSTR("Pronoun"), 0, CFSTR("PronounPicker"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setPlaceholder:](self->_entryField, "setPlaceholder:", v16);

    v17 = (void *)MEMORY[0x24BDBCEA0];
    -[IPPronounPickerPronounInfo language](self, "language");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextAlignment:](self->_entryField, "setTextAlignment:", 2 * (objc_msgSend(v17, "characterDirectionForLanguage:", v18) == 2));

    -[UITextField setClearButtonMode:](self->_entryField, "setClearButtonMode:", 0);
    -[UITextField setAutocapitalizationType:](self->_entryField, "setAutocapitalizationType:", 0);
    -[UITextField setAutocorrectionType:](self->_entryField, "setAutocorrectionType:", 1);
    -[UITextField setSpellCheckingType:](self->_entryField, "setSpellCheckingType:", 1);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](self->_entryField, "setFont:", v19);

    -[UITextField setAdjustsFontForContentSizeCategory:](self->_entryField, "setAdjustsFontForContentSizeCategory:", 1);
    entryField = self->_entryField;
  }
  return entryField;
}

- (UILabel)exampleLabel
{
  UILabel *exampleLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  exampleLabel = self->_exampleLabel;
  if (!exampleLabel)
  {
    v4 = (UILabel *)objc_opt_new();
    v5 = self->_exampleLabel;
    self->_exampleLabel = v4;

    -[UILabel setNumberOfLines:](self->_exampleLabel, "setNumberOfLines:", 0);
    v6 = (void *)MEMORY[0x24BDBCEA0];
    -[IPPronounPickerPronounInfo language](self, "language");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextAlignment:](self->_exampleLabel, "setTextAlignment:", 2 * (objc_msgSend(v6, "characterDirectionForLanguage:", v7) == 2));

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_exampleLabel, "setFont:", v8);

    -[UILabel setAdjustsFontForContentSizeCategory:](self->_exampleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_exampleLabel, "setTextColor:", v9);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_exampleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    exampleLabel = self->_exampleLabel;
  }
  return exampleLabel;
}

- (BOOL)hasValue
{
  void *v3;
  void *v4;
  BOOL v5;

  -[IPPronounPickerPronounInfo value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IPPronounPickerPronounInfo value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasErrorMessage
{
  void *v3;
  void *v4;
  BOOL v5;

  -[IPPronounPickerPronounInfo validationErrorMessage](self, "validationErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IPPronounPickerPronounInfo validationErrorMessage](self, "validationErrorMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasValidValue
{
  _BOOL4 v3;

  v3 = -[IPPronounPickerPronounInfo hasValue](self, "hasValue");
  if (v3)
    LOBYTE(v3) = !-[IPPronounPickerPronounInfo hasErrorMessage](self, "hasErrorMessage");
  return v3;
}

- (void)entryFieldContentDidChange:(id)a3 validator:(id)a4 userEntered:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a5;
  v17 = a3;
  v8 = a4;
  -[IPPronounPickerPronounInfo setValue:](self, "setValue:", 0);
  -[IPPronounPickerPronounInfo setValidationErrorMessage:](self, "setValidationErrorMessage:", 0);
  -[IPPronounPickerPronounInfo setTextWasEnteredByUser:](self, "setTextWasEnteredByUser:", v5);
  if (v17 && objc_msgSend(v17, "length"))
  {
    if ((objc_msgSend(v8, "pronounIsValidLength:", v17) & 1) != 0)
    {
      if ((objc_msgSend(v8, "pronounHasValidChars:", v17) & 1) != 0)
      {
        -[IPPronounPickerPronounInfo setValue:](self, "setValue:", v17);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Pronouns cannot include special characters."), &stru_24F9E0D40, CFSTR("PronounPicker"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IPPronounPickerPronounInfo setValidationErrorMessage:](self, "setValidationErrorMessage:", v14);

      }
    }
    else
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Pronouns cannot exceed %ld characters."), &stru_24F9E0D40, CFSTR("PronounPicker"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v11, objc_msgSend(v8, "maxPronounLength"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPPronounPickerPronounInfo setValidationErrorMessage:](self, "setValidationErrorMessage:", v12);

    }
  }
  -[IPPronounPickerPronounInfo generateExampleLabelText](self, "generateExampleLabelText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPPronounPickerPronounInfo exampleLabel](self, "exampleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAttributedText:", v15);

}

- (void)autofillValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[IPPronounPickerPronounInfo setTextWasEnteredByUser:](self, "setTextWasEnteredByUser:", 0);
  -[IPPronounPickerPronounInfo setValue:](self, "setValue:", v4);
  -[IPPronounPickerPronounInfo setValidationErrorMessage:](self, "setValidationErrorMessage:", 0);
  -[IPPronounPickerPronounInfo entryField](self, "entryField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[IPPronounPickerPronounInfo generateExampleLabelText](self, "generateExampleLabelText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[IPPronounPickerPronounInfo exampleLabel](self, "exampleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v7);

}

- (id)generateExampleLabelText
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  -[IPPronounPickerPronounInfo validationErrorMessage](self, "validationErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDD1458]);
    -[IPPronounPickerPronounInfo validationErrorMessage](self, "validationErrorMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", v5, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x24BDD1458]);
    -[IPPronounPickerPronounInfo exampleText](self, "exampleText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v9, "initWithString:", v10);

    v11 = *MEMORY[0x24BEBB440];
    v22[0] = &unk_24F9E2AE0;
    v12 = *MEMORY[0x24BEBB360];
    v21[0] = v11;
    v21[1] = v12;
    v13 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v5, "pointSize");
    objc_msgSend(v13, "systemFontOfSize:weight:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[IPPronounPickerPronounInfo hasValue](self, "hasValue"))
      -[IPPronounPickerPronounInfo value](self, "value");
    else
      -[IPPronounPickerPronounInfo examplePlaceholder](self, "examplePlaceholder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPPronounPickerPronounInfo exampleText](self, "exampleText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("%@"));

    if (v17)
    {
      objc_msgSend(v15, "localizedCapitalizedString");
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v15, v7);
    objc_msgSend(MEMORY[0x24BDD1458], "localizedAttributedStringWithFormat:", v6, v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSString)validationErrorMessage
{
  return self->_validationErrorMessage;
}

- (void)setValidationErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_validationErrorMessage, a3);
}

- (void)setEntryField:(id)a3
{
  objc_storeStrong((id *)&self->_entryField, a3);
}

- (void)setExampleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_exampleLabel, a3);
}

- (NSString)exampleText
{
  return self->_exampleText;
}

- (void)setExampleText:(id)a3
{
  objc_storeStrong((id *)&self->_exampleText, a3);
}

- (NSString)examplePlaceholder
{
  return self->_examplePlaceholder;
}

- (void)setExamplePlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_examplePlaceholder, a3);
}

- (NSMorphology)morphology
{
  return self->_morphology;
}

- (void)setMorphology:(id)a3
{
  objc_storeStrong((id *)&self->_morphology, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (BOOL)textWasEnteredByUser
{
  return self->_textWasEnteredByUser;
}

- (void)setTextWasEnteredByUser:(BOOL)a3
{
  self->_textWasEnteredByUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_morphology, 0);
  objc_storeStrong((id *)&self->_examplePlaceholder, 0);
  objc_storeStrong((id *)&self->_exampleText, 0);
  objc_storeStrong((id *)&self->_exampleLabel, 0);
  objc_storeStrong((id *)&self->_entryField, 0);
  objc_storeStrong((id *)&self->_validationErrorMessage, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
