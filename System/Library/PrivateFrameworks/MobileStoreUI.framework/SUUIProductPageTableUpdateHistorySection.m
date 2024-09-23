@implementation SUUIProductPageTableUpdateHistorySection

- (SUUIProductPageTableUpdateHistorySection)initWithClientContext:(id)a3
{
  id v5;
  SUUIProductPageTableUpdateHistorySection *v6;
  SUUIProductPageTableUpdateHistorySection *v7;
  NSDateFormatter *v8;
  NSDateFormatter *dateFormatter;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIProductPageTableUpdateHistorySection;
  v6 = -[SUUIProductPageTableUpdateHistorySection init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v8;

    -[NSDateFormatter setDateStyle:](v7->_dateFormatter, "setDateStyle:", 2);
    -[NSDateFormatter setTimeStyle:](v7->_dateFormatter, "setTimeStyle:", 0);
  }

  return v7;
}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v5;
  SUUIColorScheme **p_colorScheme;
  SUUIProductPageTableExpandableHeaderView *headerView;
  void *v8;
  void *v9;
  SUUIColorScheme *v10;

  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    headerView = self->_headerView;
    -[SUUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[SUUIProductPageTableExpandableHeaderView setBottomBorderColor:](headerView, "setBottomBorderColor:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableExpandableHeaderView setBottomBorderColor:](headerView, "setBottomBorderColor:", v9);

    }
    -[SUUIProductPageTableExpandableHeaderView setColorScheme:](self->_headerView, "setColorScheme:", *p_colorScheme);
    v5 = v10;
  }

}

- (id)headerViewForTableView:(id)a3
{
  SUUIProductPageTableExpandableHeaderView *v4;
  SUUIProductPageTableExpandableHeaderView *headerView;
  SUUIProductPageTableExpandableHeaderView *v6;
  SUUIClientContext *clientContext;
  void *v8;
  SUUIProductPageTableExpandableHeaderView *v9;
  void *v10;
  void *v11;

  if (!self->_headerView && !-[SUUITableViewSection hidesHeaderView](self, "hidesHeaderView", a3))
  {
    v4 = objc_alloc_init(SUUIProductPageTableExpandableHeaderView);
    headerView = self->_headerView;
    self->_headerView = v4;

    -[SUUIProductPageTableExpandableHeaderView setColorScheme:](self->_headerView, "setColorScheme:", self->_colorScheme);
    v6 = self->_headerView;
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_UPDATE_HISTORY_TITLE"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_UPDATE_HISTORY_TITLE"), 0, CFSTR("ProductPage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageTableExpandableHeaderView setTitle:](v6, "setTitle:", v8);

    v9 = self->_headerView;
    -[SUUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SUUIProductPageTableExpandableHeaderView setBottomBorderColor:](v9, "setBottomBorderColor:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableExpandableHeaderView setBottomBorderColor:](v9, "setBottomBorderColor:", v11);

    }
    -[SUUIProductPageTableExpandableHeaderView sizeToFit](self->_headerView, "sizeToFit");
    -[SUUIProductPageTableUpdateHistorySection _reloadHeaderView](self, "_reloadHeaderView");
  }
  return self->_headerView;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;

  v5 = objc_msgSend(a4, "row", a3);
  -[SUUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_firstStringIndex + v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageTableSection heightForTextLayout:isExpanded:](self, "heightForTextLayout:isExpanded:", v6, -[NSMutableIndexSet containsIndex:](self->_expandedIndexSet, "containsIndex:", v5));
  v8 = v7;

  return v8;
}

- (int64_t)numberOfRowsInSection
{
  if (-[SUUIProductPageTableSection isExpanded](self, "isExpanded"))
    return -[NSArray count](self->_releaseNotes, "count");
  else
    return 0;
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  NSMutableIndexSet *expandedIndexSet;
  NSMutableIndexSet *v8;
  NSMutableIndexSet *v9;
  void *v10;

  v5 = objc_msgSend(a4, "row", a3);
  -[SUUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_firstStringIndex + v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableIndexSet containsIndex:](self->_expandedIndexSet, "containsIndex:", v5) & 1) != 0
    || !objc_msgSend(v6, "requiresTruncation"))
  {
    v10 = 0;
  }
  else
  {
    expandedIndexSet = self->_expandedIndexSet;
    if (!expandedIndexSet)
    {
      v8 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
      v9 = self->_expandedIndexSet;
      self->_expandedIndexSet = v8;

      expandedIndexSet = self->_expandedIndexSet;
    }
    -[NSMutableIndexSet addIndex:](expandedIndexSet, "addIndex:", v5);
    +[SUUIProductPageAction actionWithType:](SUUIProductPageAction, "actionWithType:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)setExpanded:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIProductPageTableUpdateHistorySection;
  -[SUUIProductPageTableSection setExpanded:](&v4, sel_setExpanded_, a3);
  -[SUUIProductPageTableUpdateHistorySection _reloadHeaderView](self, "_reloadHeaderView");
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  SUUIClientContext *clientContext;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SUUIClientContext *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  SUUIClientContext *v25;
  void *v26;
  void *v27;
  id v29;

  v6 = a4;
  -[SUUIProductPageTableSection textBoxTableViewCellForTableView:indexPath:](self, "textBoxTableViewCellForTableView:indexPath:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "setBottomBorderColor:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBottomBorderColor:", v9);

  }
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    objc_msgSend(v7, "setBorderPaddingLeft:", 30.0);
    objc_msgSend(v7, "setTextBoxInsets:", 0.0, 15.0, 0.0, 0.0);
  }
  v10 = objc_msgSend(v6, "row");
  -[SUUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_firstStringIndex + v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textBoxView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "setFixedWidthTextFrame:", objc_msgSend(v11, "textFrame"));
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("MORE_BUTTON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("MORE_BUTTON"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMoreButtonTitle:", v15);

    if (-[NSMutableIndexSet containsIndex:](self->_expandedIndexSet, "containsIndex:", v10))
      v16 = 0;
    else
      v16 = 5;
    objc_msgSend(v13, "setNumberOfVisibleLines:", v16);
    -[NSArray objectAtIndex:](self->_releaseNotes, "objectAtIndex:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v6;
    if (v18)
    {
      v19 = self->_clientContext;
      if (v19)
        -[SUUIClientContext localizedStringForKey:inTable:](v19, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_UPDATED_DATE"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_UPDATED_DATE"), 0, CFSTR("ProductPage"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), 0, v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v13, "setSubtitle:", v20);
    objc_msgSend(v17, "versionString");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      v25 = self->_clientContext;
      if (v25)
        -[SUUIClientContext localizedStringForKey:inTable:](v25, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_UPDATED_VERSION"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_UPDATED_VERSION"), 0, CFSTR("ProductPage"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v27, CFSTR("%@"), 0, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = 0;
    }
    v6 = v29;
    objc_msgSend(v13, "setTitle:", v26);

  }
  else
  {
    objc_msgSend(v12, "reset");
  }

  return v7;
}

- (void)_reloadHeaderView
{
  _BOOL4 v3;
  SUUIProductPageTableExpandableHeaderView *headerView;
  SUUIClientContext *clientContext;
  id v6;

  v3 = -[SUUIProductPageTableSection isExpanded](self, "isExpanded");
  headerView = self->_headerView;
  if (v3)
  {
    -[SUUIProductPageTableExpandableHeaderView setActionString:](self->_headerView, "setActionString:", 0);
  }
  else
  {
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_SHOW_UPDATE_HISTORY_BUTTON"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_SHOW_UPDATE_HISTORY_BUTTON"), 0, CFSTR("ProductPage"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageTableExpandableHeaderView setActionString:](headerView, "setActionString:", v6);

  }
}

- (int64_t)firstStringIndex
{
  return self->_firstStringIndex;
}

- (void)setFirstStringIndex:(int64_t)a3
{
  self->_firstStringIndex = a3;
}

- (NSArray)releaseNotes
{
  return self->_releaseNotes;
}

- (void)setReleaseNotes:(id)a3
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

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_expandedIndexSet, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
