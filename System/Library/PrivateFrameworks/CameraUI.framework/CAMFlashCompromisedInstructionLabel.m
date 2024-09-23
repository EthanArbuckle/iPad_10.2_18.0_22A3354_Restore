@implementation CAMFlashCompromisedInstructionLabel

- (void)setCompromise:(unint64_t)a3
{
  unint64_t compromise;

  compromise = self->_compromise;
  if (compromise != a3)
  {
    self->_compromise = a3;
    -[CAMFlashCompromisedInstructionLabel _updateTextWithPriorCompromise:](self, "_updateTextWithPriorCompromise:", compromise);
  }
}

+ (BOOL)shouldDisplayInstructionForCompromise:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "_textForCompromise:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)_updateTextWithPriorCompromise:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend((id)objc_opt_class(), "_textForCompromise:", -[CAMFlashCompromisedInstructionLabel compromise](self, "compromise"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_textForCompromise:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    -[CAMInstructionLabel setText:](self, "setText:", v7);
  if ((objc_msgSend(v7, "isEqualToString:", v5) & 1) == 0)
  {
    -[CAMInstructionLabel delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "instructionLabelDidChangeIntrinsicContentSize:", self);

  }
}

+ (id)_textForCompromise:(unint64_t)a3
{
  __CFString *v4;
  __CFString *v5;
  BOOL v6;

  if (a3 == 2)
  {
    v4 = CFSTR("FLASH_COMPROMISED_WALLET");
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = CFSTR("FLASH_COMPROMISED_BATTERY_PACK");
LABEL_5:
    CAMLocalizedFrameworkString(v4, 0);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  if (v5)
    v6 = 1;
  else
    v6 = a3 == 0;
  if (!v6)
    v5 = CFSTR("Mitigation suppressed. (Placeholder copy. Do not file radars.)");
  return v5;
}

- (id)_symbolPrefixName
{
  return CFSTR("exclamationmark.triangle");
}

- (unint64_t)compromise
{
  return self->_compromise;
}

@end
