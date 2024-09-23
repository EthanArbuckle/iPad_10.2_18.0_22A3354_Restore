@implementation _DefaultMessageListCellLayoutValues

- (double)defaultRowHeight
{
  double result;

  result = self->super._defaultRowHeight;
  if (result == 2.22507386e-308)
  {
    -[MessageListCellLayoutValues heightWithNumberOfSummaryLines:](self, "heightWithNumberOfSummaryLines:", -[_DefaultMessageListCellLayoutValues linesOfSummaryForCompactHeight:](self, "linesOfSummaryForCompactHeight:", 0));
    self->super._defaultRowHeight = result;
  }
  return result;
}

- (id)subjectFont
{
  UIFont *subjectFont;
  id v4;
  int64_t v5;
  void *v6;
  id v7;
  UIFont *v8;
  UIFont *v9;

  subjectFont = self->super._subjectFont;
  if (!subjectFont)
  {
    v4 = (id)*MEMORY[0x1E0DC4B18];
    v5 = -[_DefaultMessageListCellLayoutValues linesOfSummaryForCompactHeight:](self, "linesOfSummaryForCompactHeight:", 0);
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5
      && ((objc_msgSend((id)*MEMORY[0x1E0DC4930], "isEqualToString:", v6) & 1) != 0
       || objc_msgSend((id)*MEMORY[0x1E0DC4908], "isEqualToString:", v6)))
    {
      v7 = (id)*MEMORY[0x1E0DC4B20];

      v4 = v7;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v4);
    v8 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v9 = self->super._subjectFont;
    self->super._subjectFont = v8;

    subjectFont = self->super._subjectFont;
  }
  return subjectFont;
}

- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3
{
  if (a3)
    return 0;
  else
    return objc_msgSend(MEMORY[0x1E0C99EA0], "em_linesOfPreview");
}

- (double)topPadding
{
  double result;
  void *v4;
  double v5;

  result = self->super._topPadding;
  if (result == 2.22507386e-308)
  {
    -[MessageListCellLayoutValues summaryFont](self, "summaryFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_bodyLeading");
    UIRoundToViewScale();
    self->super._topPadding = v5;

    return self->super._topPadding;
  }
  return result;
}

- (BOOL)isSubjectVisible
{
  return 1;
}

- (id)addressFont
{
  UIFont *addressFont;
  void *v4;
  UIFont *v5;
  UIFont *v6;

  addressFont = self->super._addressFont;
  if (!addressFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
    v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v6 = self->super._addressFont;
    self->super._addressFont = v5;

    addressFont = self->super._addressFont;
  }
  return addressFont;
}

- (id)backgroundColorForSelectedState:(unint64_t)a3 disclosureEnabled:(BOOL)a4
{
  void *v4;
  const char *v5;

  if (a4)
  {
    v4 = (void *)MEMORY[0x1E0DC3658];
    if (a3 != 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
      v5 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      a2 = v5;
      return (id)(id)a2;
    }
LABEL_11:
    objc_msgSend(v4, "mailCellSelectionStateColorForInterfaceLevel:", -[UITraitCollection userInterfaceLevel](self->super._traitCollection, "userInterfaceLevel"));
    v5 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  switch(a3)
  {
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
      v5 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 1uLL:
      v4 = (void *)MEMORY[0x1E0DC3658];
      goto LABEL_11;
    case 0uLL:
      if (!-[MessageListCellLayoutValues supportsPopover](self, "supportsPopover"))
      {
        a2 = 0;
        return (id)(id)a2;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "mailPopoverBackgroundCellColor");
      v5 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
  }
  return (id)(id)a2;
}

- (double)avatarSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[_DefaultMessageListCellLayoutValues addressFont](self, "addressFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  v5 = v4;
  -[_DefaultMessageListCellLayoutValues subjectFont](self, "subjectFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineHeight");
  v8 = v5 + v7;

  return v8;
}

- (double)additionalLeadingInsetForGroupedSenderAvatars
{
  return 58.0;
}

- (double)compactRowHeight
{
  double result;

  result = self->super._compactRowHeight;
  if (result == 2.22507386e-308)
  {
    -[MessageListCellLayoutValues heightWithNumberOfSummaryLines:](self, "heightWithNumberOfSummaryLines:", 0);
    self->super._compactRowHeight = result;
  }
  return result;
}

@end
