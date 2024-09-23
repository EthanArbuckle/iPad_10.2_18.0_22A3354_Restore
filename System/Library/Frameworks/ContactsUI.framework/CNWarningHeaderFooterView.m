@implementation CNWarningHeaderFooterView

+ (id)exclamationMark
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  v3 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", CFSTR("exclamationmark.circle"), 1, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v5);

  return v2;
}

- (id)warningAttributedText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0DC1140];
  +[CNUIColorRepository contactStyleDefaultDisabledTextColor](CNUIColorRepository, "contactStyleDefaultDisabledTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v16[1] = *MEMORY[0x1E0DC1138];
  +[CNUIFontRepository contactCardWarningHeaderLabelFont](CNUIFontRepository, "contactCardWarningHeaderLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CNWarningHeaderFooterView shouldDisplayWarningIcon](self, "shouldDisplayWarningIcon"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v7 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend((id)objc_opt_class(), "exclamationMark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributedStringWithAttachment:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendAttributedString:", v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v5);
    objc_msgSend(v6, "appendAttributedString:", v10);

    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CNWarningHeaderFooterView warningText](self, "warningText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v12, v5);
    objc_msgSend(v6, "appendAttributedString:", v13);

  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CNWarningHeaderFooterView warningText](self, "warningText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v14, "initWithString:attributes:", v12, v5);
  }

  return v6;
}

- (void)setWarningText:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_warningText) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_warningText, a3);
    -[CNWarningHeaderFooterView warningAttributedText](self, "warningAttributedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactTableViewHeaderFooterView setAttributedString:](self, "setAttributedString:", v5);

  }
}

- (BOOL)shouldDisplayWarningIcon
{
  return self->_shouldDisplayWarningIcon;
}

- (void)setShouldDisplayWarningIcon:(BOOL)a3
{
  self->_shouldDisplayWarningIcon = a3;
}

- (NSString)warningText
{
  return self->_warningText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningText, 0);
}

@end
