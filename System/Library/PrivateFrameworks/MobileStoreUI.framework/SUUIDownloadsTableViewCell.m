@implementation SUUIDownloadsTableViewCell

- (SUUIDownloadsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUIDownloadsTableViewCell *v4;
  SUUIDownloadsCellView *v5;
  SUUIDownloadsCellView *cellView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIDownloadsTableViewCell;
  v4 = -[SUUIDownloadsTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(SUUIDownloadsCellView);
    cellView = v4->_cellView;
    v4->_cellView = v5;

    -[SUUIDownloadsTableViewCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_cellView);

  }
  return v4;
}

- (void)layoutSubviews
{
  SUUIDownloadsCellView *cellView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIDownloadsTableViewCell;
  -[SUUIDownloadsTableViewCell layoutSubviews](&v5, sel_layoutSubviews);
  cellView = self->_cellView;
  -[SUUIDownloadsTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SUUIDownloadsCellView setFrame:](cellView, "setFrame:");

}

- (SUUIDownloadsCellView)cellView
{
  return self->_cellView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellView, 0);
}

@end
