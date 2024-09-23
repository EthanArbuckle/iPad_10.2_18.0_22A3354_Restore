@implementation MPUTextContainerContentSizeUpdater

- (MPUTextContainerContentSizeUpdater)init
{
  MPUTextContainerContentSizeUpdater *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPUTextContainerContentSizeUpdater;
  v2 = -[MPUTextContainerContentSizeUpdater init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUTextContainerContentSizeUpdater setLastSeenPreferredContentSizeCategory:](v2, "setLastSeenPreferredContentSizeCategory:", v4);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__preferredContentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7670], 0);

  v4.receiver = self;
  v4.super_class = (Class)MPUTextContainerContentSizeUpdater;
  -[MPUTextContainerContentSizeUpdater dealloc](&v4, sel_dealloc);
}

- (void)ensureTextStyleFontsMatchPreferredTextStyleFonts
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MPUTextContainerContentSizeUpdater lastSeenPreferredContentSizeCategory](self, "lastSeenPreferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
    -[MPUTextContainerContentSizeUpdater _updateTextStyleFonts](self, "_updateTextStyleFonts");
}

- (void)_updateTextStyleFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[MPUTextContainerContentSizeUpdater textContainer](self, "textContainer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "attributedText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDF7768]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDF6A70];
      objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v6, "symbolicTraits"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fontWithDescriptor:size:", v10, 0.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFont:", v11);

    }
  }
  if (v4)
  {
    objc_msgSend(v4, "MPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAttributedText:", v12);

  }
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredContentSizeCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPUTextContainerContentSizeUpdater setLastSeenPreferredContentSizeCategory:](self, "setLastSeenPreferredContentSizeCategory:", v14);

}

- (MPUTextContainer)textContainer
{
  return (MPUTextContainer *)objc_loadWeakRetained((id *)&self->_textContainer);
}

- (void)setTextContainer:(id)a3
{
  objc_storeWeak((id *)&self->_textContainer, a3);
}

- (NSString)lastSeenPreferredContentSizeCategory
{
  return self->_lastSeenPreferredContentSizeCategory;
}

- (void)setLastSeenPreferredContentSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_lastSeenPreferredContentSizeCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenPreferredContentSizeCategory, 0);
  objc_destroyWeak((id *)&self->_textContainer);
}

@end
