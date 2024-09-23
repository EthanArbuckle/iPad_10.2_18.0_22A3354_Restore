@implementation _ExpandedMessageListCellLayoutValues

- (double)topPadding
{
  double result;
  void *v4;
  double v5;
  double v6;
  double v7;

  result = self->super._topPadding;
  if (result == 2.22507386e-308)
  {
    -[_ExpandedMessageListCellLayoutValues addressFont](self, "addressFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_bodyLeading");
    v6 = v5;
    -[MessageListCellLayoutValues addressCapHeight](self, "addressCapHeight");
    self->super._topPadding = round(v6 - v7);

    return self->super._topPadding;
  }
  return result;
}

- (id)subjectFont
{
  UIFont *subjectFont;
  UIFont *v4;
  UIFont *v5;

  subjectFont = self->super._subjectFont;
  if (!subjectFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._subjectFont;
    self->super._subjectFont = v4;

    subjectFont = self->super._subjectFont;
  }
  return subjectFont;
}

- (id)addressFont
{
  UIFont *addressFont;
  UIFont *v4;
  UIFont *v5;

  addressFont = self->super._addressFont;
  if (!addressFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._addressFont;
    self->super._addressFont = v4;

    addressFont = self->super._addressFont;
  }
  return addressFont;
}

- (id)backgroundColorForSelectedState:(unint64_t)a3 disclosureEnabled:(BOOL)a4
{
  if (a3 == 1)
    objc_msgSend(MEMORY[0x1E0DC3658], "mailCellSelectionStateColorForInterfaceLevel:", -[UITraitCollection userInterfaceLevel](self->super._traitCollection, "userInterfaceLevel", 1, a4));
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)_heightWithNumberOfSummaryLines:(int64_t)a3
{
  void *v4;
  void *v5;
  double result;

  -[_ExpandedMessageListCellLayoutValues addressFont](self, "addressFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bodyLeading");

  -[MessageListCellLayoutValues summaryFont](self, "summaryFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bodyLeading");

  UIRoundToViewScale();
  return result;
}

- (double)defaultRowHeight
{
  double result;

  result = self->super._defaultRowHeight;
  if (result == 2.22507386e-308)
  {
    -[_ExpandedMessageListCellLayoutValues _heightWithNumberOfSummaryLines:](self, "_heightWithNumberOfSummaryLines:", -[_ExpandedMessageListCellLayoutValues linesOfSummaryForCompactHeight:](self, "linesOfSummaryForCompactHeight:", 0));
    self->super._defaultRowHeight = result;
  }
  return result;
}

- (BOOL)isSubjectVisible
{
  return 0;
}

- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if (a3)
    return 1;
  v6 = objc_msgSend(MEMORY[0x1E0C99EA0], "em_linesOfPreview", v3, v4);
  v7 = 2;
  if (v6 > 2)
    v7 = v6;
  return v7 - 1;
}

@end
