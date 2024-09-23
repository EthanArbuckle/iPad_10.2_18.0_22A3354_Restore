@implementation SUUIProductPageTableTextBoxSection

- (SUUIProductPageTableTextBoxSection)initWithClientContext:(id)a3
{
  id v5;
  SUUIProductPageTableTextBoxSection *v6;
  SUUIProductPageTableTextBoxSection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIProductPageTableTextBoxSection;
  v6 = -[SUUIProductPageTableTextBoxSection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientContext, a3);

  return v7;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  void *v5;
  double v6;
  double v7;

  -[SUUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_stringIndex, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageTableSection heightForTextLayout:isExpanded:](self, "heightForTextLayout:isExpanded:", v5, self->_isExpanded);
  v7 = v6;

  return v7;
}

- (int64_t)numberOfRowsInSection
{
  return 1;
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[SUUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_stringIndex, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_isExpanded || !objc_msgSend(v5, "requiresTruncation"))
  {
    v7 = 0;
  }
  else
  {
    self->_isExpanded = 1;
    +[SUUIProductPageAction actionWithType:](SUUIProductPageAction, "actionWithType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SUUIClientContext *clientContext;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  -[SUUIProductPageTableSection textBoxTableViewCellForTableView:indexPath:](self, "textBoxTableViewCellForTableView:indexPath:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBottomBorderColor:", v7);

  }
  -[SUUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_stringIndex);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textBoxView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setFixedWidthTextFrame:", objc_msgSend(v8, "textFrame"));
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("MORE_BUTTON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("MORE_BUTTON"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMoreButtonTitle:", v12);

    if (self->_isExpanded)
      v13 = 0;
    else
      v13 = 5;
    objc_msgSend(v10, "setNumberOfVisibleLines:", v13);
    -[SUUIProductPageTableTextBoxSection subtitle](self, "subtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSubtitle:", v14);

    -[SUUIProductPageTableTextBoxSection title](self, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v15);

    objc_msgSend(v10, "setColorScheme:", self->_colorScheme);
  }
  else
  {
    objc_msgSend(v9, "reset");
  }

  return v5;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
}

- (int64_t)stringIndex
{
  return self->_stringIndex;
}

- (void)setStringIndex:(int64_t)a3
{
  self->_stringIndex = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SUUILayoutCache)textLayoutCache
{
  return self->_textLayoutCache;
}

- (void)setTextLayoutCache:(id)a3
{
  objc_storeStrong((id *)&self->_textLayoutCache, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
