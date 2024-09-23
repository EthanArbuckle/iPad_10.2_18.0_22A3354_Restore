@implementation QLListCell

+ (id)listCell
{
  void *v3;
  void *v4;
  void *v5;

  QLFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadNibNamed:owner:options:", CFSTR("QLListCell"), a1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)awakeFromNib
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)QLListCell;
  -[QLListCell awakeFromNib](&v13, sel_awakeFromNib);
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "setContentMode:", 4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)&self->_title);
  objc_msgSend(v5, "setTextColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)&self->_subtitle);
  objc_msgSend(v7, "setTextColor:", v6);

  v8 = objc_loadWeakRetained((id *)&self->_title);
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);

  v9 = objc_loadWeakRetained((id *)&self->_title);
  objc_msgSend(v9, "setMinimumScaleFactor:", 0.7);

  v10 = objc_loadWeakRetained((id *)&self->_subtitle);
  objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

  v11 = objc_loadWeakRetained((id *)&self->_subtitle);
  objc_msgSend(v11, "setMinimumScaleFactor:", 0.7);

  v12 = objc_loadWeakRetained((id *)&self->_leftConstraint);
  objc_msgSend(v12, "setConstant:", 15.0);

  -[QLListCell setIndentationWidth:](self, "setIndentationWidth:", 15.0);
}

- (void)prepareForReuse
{
  id WeakRetained;
  id v4;
  id v5;
  QLItem *item;
  NSString *folderName;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)QLListCell;
  -[QLListCell prepareForReuse](&v9, sel_prepareForReuse);
  WeakRetained = objc_loadWeakRetained((id *)&self->_subtitle);
  objc_msgSend(WeakRetained, "setText:", &stru_24C72A1F8);

  v4 = objc_loadWeakRetained((id *)&self->_title);
  objc_msgSend(v4, "setText:", &stru_24C72A1F8);

  v5 = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(v5, "setImage:", 0);

  item = self->_item;
  self->_item = 0;

  folderName = self->_folderName;
  self->_folderName = 0;

  self->_fileDepthLevel = 0;
  v8 = objc_loadWeakRetained((id *)&self->_leftConstraint);
  objc_msgSend(v8, "setConstant:", 15.0);

}

- (id)_folderImage
{
  if (_folderImage_onceToken != -1)
    dispatch_once(&_folderImage_onceToken, &__block_literal_global_11);
  return (id)_folderImage__folderImage;
}

void __26__QLListCell__folderImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BEBD640];
  QLFrameworkBundle();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("folder"), v3, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_folderImage__folderImage;
  _folderImage__folderImage = v1;

}

- (void)setItem:(id)a3
{
  id v5;
  id WeakRetained;
  id v7;

  objc_storeStrong((id *)&self->_item, a3);
  v5 = a3;
  objc_msgSend(v5, "previewItemTitle");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_title);
  objc_msgSend(WeakRetained, "setText:", v7);

}

- (void)setSubtitleString:(id)a3
{
  id v4;
  NSString *v5;
  NSString *subtitleString;
  id WeakRetained;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  subtitleString = self->_subtitleString;
  self->_subtitleString = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_subtitle);
  objc_msgSend(WeakRetained, "setText:", v4);

}

- (void)setThumbnail:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_thumbnail, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "setImage:", v5);

}

- (void)setFileDepthLevel:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  id WeakRetained;

  self->_fileDepthLevel = a3;
  v4 = (double)a3;
  -[QLListCell indentationWidth](self, "indentationWidth");
  v6 = v4 * v5 + 15.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_leftConstraint);
  objc_msgSend(WeakRetained, "setConstant:", v6);

  -[QLListCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFolderName:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;

  objc_storeStrong((id *)&self->_folderName, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_title);
  objc_msgSend(WeakRetained, "setText:", v5);

  -[QLListCell _folderImage](self, "_folderImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(v8, "setImage:", v7);

  v9 = objc_loadWeakRetained((id *)&self->_subtitle);
  objc_msgSend(v9, "setHidden:", 1);

}

- (QLItem)item
{
  return self->_item;
}

- (NSString)folderName
{
  return self->_folderName;
}

- (int64_t)fileDepthLevel
{
  return self->_fileDepthLevel;
}

- (NSString)subtitleString
{
  return self->_subtitleString;
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (unint64_t)row
{
  return self->_row;
}

- (void)setRow:(unint64_t)a3
{
  self->_row = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_thumbnailView);
  objc_destroyWeak((id *)&self->_subtitle);
  objc_destroyWeak((id *)&self->_title);
  objc_destroyWeak((id *)&self->_leftConstraint);
}

@end
