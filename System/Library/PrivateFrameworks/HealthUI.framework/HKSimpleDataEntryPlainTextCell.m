@implementation HKSimpleDataEntryPlainTextCell

- (HKSimpleDataEntryPlainTextCell)initWithIntention:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKSimpleDataEntryPlainTextCell *v5;
  UILabel *v6;
  UILabel *titleLabel;
  UILabel *v8;
  void *v9;
  HKCaretOptionalTextField *v10;
  HKCaretOptionalTextField *inputTextField;
  HKCaretOptionalTextField *v12;
  void *v13;
  UIView *v14;
  UIView *horizontalSeparator;
  void *v16;
  void *v17;
  void *v18;
  UIView *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HKSimpleDataEntryPlainTextCell;
  v5 = -[HKSimpleDataEntryPlainTextCell initWithStyle:reuseIdentifier:](&v22, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v6;

    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v5->_titleLabel, "setMinimumScaleFactor:", 0.7);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v5->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    v8 = v5->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    v10 = objc_alloc_init(HKCaretOptionalTextField);
    inputTextField = v5->_inputTextField;
    v5->_inputTextField = v10;

    -[HKSimpleDataEntryPlainTextCell _setupInputTextFieldWithIntention:](v5, "_setupInputTextFieldWithIntention:", a3);
    v12 = v5->_inputTextField;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCaretOptionalTextField setTextColor:](v12, "setTextColor:", v13);

    v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    horizontalSeparator = v5->_horizontalSeparator;
    v5->_horizontalSeparator = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HKCaretOptionalTextField setTranslatesAutoresizingMaskIntoConstraints:](v5->_inputTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_horizontalSeparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HKSimpleDataEntryPlainTextCell contentView](v5, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v5->_titleLabel);

    -[HKSimpleDataEntryPlainTextCell contentView](v5, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v5->_inputTextField);

    -[HKSimpleDataEntryPlainTextCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v5->_horizontalSeparator);

    -[HKCaretOptionalTextField setDelegate:](v5->_inputTextField, "setDelegate:", v5);
    -[HKCaretOptionalTextField addTarget:action:forControlEvents:](v5->_inputTextField, "addTarget:action:forControlEvents:", v5, sel_textFieldDidChangeValue_, 0x20000);
    v19 = v5->_horizontalSeparator;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[HKSimpleDataEntryPlainTextCell _setupLabels](v5, "_setupLabels");
    -[HKSimpleDataEntryPlainTextCell _setupLayoutConstraints](v5, "_setupLayoutConstraints");
    -[HKSimpleDataEntryPlainTextCell _updateForCurrentSizeCategory](v5, "_updateForCurrentSizeCategory");
    -[HKSimpleDataEntryPlainTextCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
  }
  return v5;
}

- (void)_setupInputTextFieldWithIntention:(int64_t)a3
{
  HKCaretOptionalTextField *inputTextField;
  _QWORD *v5;
  HKCaretOptionalTextField *v6;
  _QWORD *v7;
  NSNumber *characterCountLimit;
  NSNumber *v9;
  NSNumber *v10;
  HKCaretOptionalTextField *v11;
  NSNumber *v12;
  _BOOL8 v13;

  switch(a3)
  {
    case 0:
      inputTextField = self->_inputTextField;
      v5 = (_QWORD *)MEMORY[0x1E0DC5438];
      goto LABEL_5;
    case 1:
      inputTextField = self->_inputTextField;
      v5 = (_QWORD *)MEMORY[0x1E0DC5440];
      goto LABEL_5;
    case 2:
      inputTextField = self->_inputTextField;
      v5 = (_QWORD *)MEMORY[0x1E0DC5428];
LABEL_5:
      -[HKCaretOptionalTextField setTextContentType:](inputTextField, "setTextContentType:", *v5);
      goto LABEL_11;
    case 3:
      -[HKCaretOptionalTextField setTextContentType:](self->_inputTextField, "setTextContentType:", *MEMORY[0x1E0DC5418]);
      -[HKCaretOptionalTextField setKeyboardType:](self->_inputTextField, "setKeyboardType:", 7);
      -[HKCaretOptionalTextField setAutocapitalizationType:](self->_inputTextField, "setAutocapitalizationType:", 0);
      -[HKCaretOptionalTextField setAutocorrectionType:](self->_inputTextField, "setAutocorrectionType:", 1);
      goto LABEL_11;
    case 4:
      v6 = self->_inputTextField;
      v7 = (_QWORD *)MEMORY[0x1E0DC5478];
      goto LABEL_10;
    case 5:
      v6 = self->_inputTextField;
      v7 = (_QWORD *)MEMORY[0x1E0DC5480];
      goto LABEL_10;
    case 6:
      v6 = self->_inputTextField;
      v7 = (_QWORD *)MEMORY[0x1E0DC5400];
LABEL_10:
      -[HKCaretOptionalTextField setTextContentType:](v6, "setTextContentType:", *v7);
      -[HKCaretOptionalTextField setAutocapitalizationType:](self->_inputTextField, "setAutocapitalizationType:", 1);
LABEL_11:
      -[HKCaretOptionalTextField setReturnKeyType:](self->_inputTextField, "setReturnKeyType:", 4);
      break;
    case 7:
      characterCountLimit = self->_characterCountLimit;
      self->_characterCountLimit = (NSNumber *)&unk_1E9CEB228;

      -[HKCaretOptionalTextField setDisableActions:](self->_inputTextField, "setDisableActions:", 1);
      -[HKCaretOptionalTextField setTextContentType:](self->_inputTextField, "setTextContentType:", *MEMORY[0x1E0DC5470]);
      goto LABEL_15;
    case 8:
      v10 = self->_characterCountLimit;
      self->_characterCountLimit = (NSNumber *)&unk_1E9CEB240;

      -[HKCaretOptionalTextField setDisableActions:](self->_inputTextField, "setDisableActions:", 1);
      -[HKCaretOptionalTextField setSecureTextEntry:](self->_inputTextField, "setSecureTextEntry:", 1);
LABEL_15:
      -[HKCaretOptionalTextField setKeyboardType:](self->_inputTextField, "setKeyboardType:", 4);
      break;
    case 9:
      v9 = self->_characterCountLimit;
      self->_characterCountLimit = (NSNumber *)&unk_1E9CEB258;

      break;
    default:
      break;
  }
  v11 = self->_inputTextField;
  v12 = self->_characterCountLimit;
  if (v12)
    v13 = -[NSNumber integerValue](v12, "integerValue") != 0;
  else
    v13 = 1;
  -[HKCaretOptionalTextField setAllowsSelection:](v11, "setAllowsSelection:", v13);
}

- (void)_setupLabels
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
    v3 = 0;
  else
    v3 = 2;
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v3);
  v4 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", v4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKCaretOptionalTextField setFont:](self->_inputTextField, "setFont:", v6);

}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKSimpleDataEntryPlainTextCell;
  -[HKSimpleDataEntryPlainTextCell layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_regularConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_largeTextConstraints);
  -[HKSimpleDataEntryPlainTextCell _setupLayoutConstraints](self, "_setupLayoutConstraints");
  -[HKSimpleDataEntryPlainTextCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (void)_setupLayoutConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *regularConstraints;
  NSArray *v28;
  NSArray *v29;
  void *v30;
  void *v31;
  void *v32;
  NSArray *largeTextConstraints;
  void *v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[6];
  _QWORD v38[8];

  v38[6] = *MEMORY[0x1E0C80C00];
  _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _inputTextField, _horizontalSeparator"), self->_titleLabel, self->_inputTextField, self->_horizontalSeparator, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSimpleDataEntryPlainTextCell directionalLayoutMargins](self, "directionalLayoutMargins");
  v4 = v3;
  -[HKSimpleDataEntryPlainTextCell directionalLayoutMargins](self, "directionalLayoutMargins");
  v6 = v5;
  v37[0] = CFSTR("onePixel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", HKUIOnePixel());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v7;
  v37[1] = CFSTR("left");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v8;
  v37[2] = CFSTR("right");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v9;
  v37[3] = CFSTR("edge");
  if (v4 >= v6)
    v10 = v4;
  else
    v10 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v11;
  v38[4] = &unk_1E9CED4A8;
  v37[4] = CFSTR("inputLeft");
  v37[5] = CFSTR("titleInputMin");
  v38[5] = &unk_1E9CED4B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99DE8];
  -[UILabel centerYAnchor](self->_titleLabel, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSimpleDataEntryPlainTextCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v16;
  -[UILabel centerYAnchor](self->_titleLabel, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCaretOptionalTextField centerYAnchor](self->_inputTextField, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithArray:", v20);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(edge)-[_titleLabel]"), 0, v12, v35);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v21, "addObjectsFromArray:", v22);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(inputLeft)-[_inputTextField]-(edge)-|"), 0, v12, v35);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v21, "addObjectsFromArray:", v23);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_titleLabel]-(>=titleInputMin)-[_inputTextField]"), 0, v12, v35);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v21, "addObjectsFromArray:", v24);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(left)-[_horizontalSeparator]-(right)-|"), 0, v12, v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v21, "addObjectsFromArray:", v25);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_horizontalSeparator(onePixel)]-(0)-|"), 0, v12, v35);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v21, "addObjectsFromArray:", v26);

  regularConstraints = self->_regularConstraints;
  self->_regularConstraints = v21;
  v28 = v21;

  v29 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(edge)-[_titleLabel]-(edge)-|"), 0, v12, v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v29, "addObjectsFromArray:", v30);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(edge)-[_inputTextField]-(edge)-|"), 0, v12, v35);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v29, "addObjectsFromArray:", v31);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(edge)-[_titleLabel]-(5)-[_inputTextField]-(edge)-|"), 0, v12, v35);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v29, "addObjectsFromArray:", v32);

  largeTextConstraints = self->_largeTextConstraints;
  self->_largeTextConstraints = v29;

}

- (void)_updateForCurrentSizeCategory
{
  _BOOL4 IsUsingAccessibilityContentSizeCategory;
  int *v4;
  int *v5;

  -[HKSimpleDataEntryPlainTextCell _setupLabels](self, "_setupLabels");
  IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  if (IsUsingAccessibilityContentSizeCategory)
    v4 = &OBJC_IVAR___HKSimpleDataEntryPlainTextCell__regularConstraints;
  else
    v4 = &OBJC_IVAR___HKSimpleDataEntryPlainTextCell__largeTextConstraints;
  if (IsUsingAccessibilityContentSizeCategory)
    v5 = &OBJC_IVAR___HKSimpleDataEntryPlainTextCell__largeTextConstraints;
  else
    v5 = &OBJC_IVAR___HKSimpleDataEntryPlainTextCell__regularConstraints;
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.super.isa + *v4));
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.super.isa + *v5));
}

- (void)beginEditing
{
  -[HKCaretOptionalTextField becomeFirstResponder](self->_inputTextField, "becomeFirstResponder");
}

- (BOOL)editDisabled
{
  return self->_editDisabled;
}

- (void)setEditDisabled:(BOOL)a3
{
  self->_editDisabled = a3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSimpleDataEntryPlainTextCell;
  -[HKSimpleDataEntryPlainTextCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKSimpleDataEntryPlainTextCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKSimpleDataEntryPlainTextCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return !self->_editDisabled;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", self->_lastChangedText);

  if ((v5 & 1) == 0)
    -[HKSimpleDataEntryPlainTextCell _informDelegateForContentChange](self, "_informDelegateForContentChange");
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSNumber *characterCountLimit;
  void *v12;
  void *v13;
  unint64_t v14;
  BOOL v15;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  characterCountLimit = self->_characterCountLimit;
  if (characterCountLimit)
  {
    if (-[NSNumber integerValue](characterCountLimit, "integerValue"))
    {
      objc_msgSend(v9, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "length");
      v15 = v14 <= -[NSNumber integerValue](self->_characterCountLimit, "integerValue");

    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v3;

  objc_msgSend(a3, "_nextKeyResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

  return 1;
}

- (void)_informDelegateForContentChange
{
  void *v3;
  NSString *v4;
  NSString *lastChangedText;

  -[HKSimpleDataEntryPlainTextCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textFieldDidChangeValue:forCell:", self->_inputTextField, self);

  -[HKCaretOptionalTextField text](self->_inputTextField, "text");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastChangedText = self->_lastChangedText;
  self->_lastChangedText = v4;

}

- (HKSimpleDataEntryCellDelegate)delegate
{
  return (HKSimpleDataEntryCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (HKCaretOptionalTextField)inputTextField
{
  return self->_inputTextField;
}

- (void)setInputTextField:(id)a3
{
  objc_storeStrong((id *)&self->_inputTextField, a3);
}

- (NSString)lastChangedText
{
  return self->_lastChangedText;
}

- (void)setLastChangedText:(id)a3
{
  objc_storeStrong((id *)&self->_lastChangedText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChangedText, 0);
  objc_storeStrong((id *)&self->_inputTextField, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_characterCountLimit, 0);
  objc_storeStrong((id *)&self->_horizontalSeparator, 0);
}

@end
