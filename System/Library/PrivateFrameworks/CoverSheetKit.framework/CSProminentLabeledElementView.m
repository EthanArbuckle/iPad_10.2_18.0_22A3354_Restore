@implementation CSProminentLabeledElementView

- (CSProminentLabeledElementView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5 glyph:(id)a6
{
  id v11;
  CSProminentLabeledElementView *v12;
  CSProminentLabeledElementView *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CSProminentLabeledElementView;
  v12 = -[CSProminentTextElementView initWithDate:font:textColor:](&v15, sel_initWithDate_font_textColor_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_glyph, a6);

  return v13;
}

- (void)setOverrideString:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  v18 = a3;
  -[CSProminentTextElementView overrideString](self, "overrideString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0DC12B0];
    -[CSProminentLabeledElementView glyph](self, "glyph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textAttachmentWithImage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v18);
    v11 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v12 = -[CSProminentLabeledElementView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    if (v12 == 1)
      v13 = v10;
    else
      v13 = v9;
    if (v12 == 1)
      v14 = v9;
    else
      v14 = v10;
    objc_msgSend(v11, "appendAttributedString:", v13);
    objc_msgSend(v11, "appendAttributedString:", v14);
    -[CSProminentTextElementView textLabel](self, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[CSProminentTextElementView textLabel](self, "textLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAttributedText:", v11);

    }
    -[CSProminentLabeledElementView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (UIImage)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_glyph, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyph, 0);
}

@end
