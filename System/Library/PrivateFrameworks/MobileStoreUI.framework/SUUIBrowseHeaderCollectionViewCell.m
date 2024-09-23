@implementation SUUIBrowseHeaderCollectionViewCell

- (SUUIBrowseHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIBrowseHeaderCollectionViewCell *v3;
  SUUIBrowseHeaderCollectionViewCell *v4;
  void *v5;
  void *v6;
  SUUIGroupedHeaderView *v7;
  SUUIGroupedHeaderView *headerView;
  SUUIGroupedHeaderView *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUUIBrowseHeaderCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUIBrowseHeaderCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.94, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    -[SUUIBrowseHeaderCollectionViewCell setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v7 = objc_alloc_init(SUUIGroupedHeaderView);
    headerView = v4->_headerView;
    v4->_headerView = v7;

    -[SUUIGroupedHeaderView setAutoresizingMask:](v4->_headerView, "setAutoresizingMask:", 18);
    v9 = v4->_headerView;
    -[SUUIBrowseHeaderCollectionViewCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    -[SUUIGroupedHeaderView setFrame:](v9, "setFrame:");

    -[SUUIBrowseHeaderCollectionViewCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_headerView);

  }
  return v4;
}

- (NSString)title
{
  return -[SUUIGroupedHeaderView title](self->_headerView, "title");
}

- (void)setTitle:(id)a3
{
  -[SUUIGroupedHeaderView setTitle:](self->_headerView, "setTitle:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
