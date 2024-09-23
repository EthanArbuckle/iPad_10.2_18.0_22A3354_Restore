@implementation HKInfographicLinkedTextViewCell

- (HKInfographicLinkedTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKInfographicLinkedTextViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKInfographicLinkedTextViewCell;
  v4 = -[HKInfographicTextViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel_didTapDescriptionLabel);
    -[HKInfographicTextViewCell descriptionLabel](v4, "descriptionLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v5);

    -[HKInfographicTextViewCell descriptionLabel](v4, "descriptionLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 1);

  }
  return v4;
}

- (id)_descriptionTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

- (void)didTapDescriptionLabel
{
  void (**v2)(void);

  -[HKInfographicLinkedTextViewCell didTapLinkedText](self, "didTapLinkedText");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (void)updateAutomationIdentifiersWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    v13[1] = CFSTR("InfographicLinkedTextItem");
    v13[2] = CFSTR("Cell");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicLinkedTextViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7);

    v12[0] = v5;
    v12[1] = CFSTR("InfographicLinkedTextItem");
    v12[2] = CFSTR("Description");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTextViewCell descriptionLabel](self, "descriptionLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

  }
  else
  {
    -[HKInfographicLinkedTextViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
    -[HKInfographicTextViewCell descriptionLabel](self, "descriptionLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityIdentifier:", 0);

  }
}

- (id)didTapLinkedText
{
  return self->_didTapLinkedText;
}

- (void)setDidTapLinkedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didTapLinkedText, 0);
}

@end
