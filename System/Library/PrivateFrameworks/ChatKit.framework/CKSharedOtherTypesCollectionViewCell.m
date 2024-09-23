@implementation CKSharedOtherTypesCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKSharedOtherTypesCollectionViewCell_reuseIdentifier");
}

- (void)configureWithThumbnail:(id)a3 fileURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = a3;
  -[CKSharedOtherTypesCollectionViewCell thumbnailImageView](self, "thumbnailImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  -[CKSharedOtherTypesCollectionViewCell thumbnailImageView](self, "thumbnailImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v5, "size");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v7, "setBounds:", v8, v9, v11, v13);
  -[CKSharedOtherTypesCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  -[CKSharedOtherTypesCollectionViewCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)configureWithAttachmentItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[CKSharedOtherTypesCollectionViewCell thumbnailImageView](self, "thumbnailImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

  -[CKSharedOtherTypesCollectionViewCell thumbnailImageView](self, "thumbnailImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v4, "fileIcon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  objc_msgSend(v7, "setBounds:", v8, v9, v11, v12);

  objc_msgSend(v4, "previewItemURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByRemovingPercentEncoding");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[CKSharedAssetCollectionViewCell previewTitleLabel](self, "previewTitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSharedAssetCollectionViewCell formattedTitleFromPreviewTitle:](self, "formattedTitleFromPreviewTitle:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAttributedText:", v17);

  -[CKSharedOtherTypesCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  -[CKSharedOtherTypesCollectionViewCell layoutIfNeeded](self, "layoutIfNeeded");

}

- (UIImageView)thumbnailImageView
{
  UIImageView *thumbnailImageView;
  UIImageView *v4;
  UIImageView *v5;
  void *v6;

  thumbnailImageView = self->_thumbnailImageView;
  if (!thumbnailImageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    v5 = self->_thumbnailImageView;
    self->_thumbnailImageView = v4;

    -[CKSharedAssetCollectionViewCell previewView](self, "previewView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_thumbnailImageView);

    thumbnailImageView = self->_thumbnailImageView;
  }
  return thumbnailImageView;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v26.receiver = self;
  v26.super_class = (Class)CKSharedOtherTypesCollectionViewCell;
  -[CKSharedContentsCollectionViewCell layoutSubviews](&v26, sel_layoutSubviews);
  -[CKSharedAssetCollectionViewCell previewView](self, "previewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v24 = v6;
  v25 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKSharedOtherTypesCollectionViewCell thumbnailImageView](self, "thumbnailImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  v21 = CGRectGetWidth(v27) * 0.5;
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v18;
  v28.size.height = v20;
  v22 = v21 - CGRectGetWidth(v28) * 0.5;
  v29.origin.y = v24;
  v29.origin.x = v25;
  v29.size.width = v9;
  v29.size.height = v11;
  v23 = CGRectGetHeight(v29) * 0.5;
  v30.origin.x = v22;
  v30.origin.y = v16;
  v30.size.width = v18;
  v30.size.height = v20;
  objc_msgSend(v12, "setFrame:", v22, v23 - CGRectGetHeight(v30) * 0.5, v18, v20);

}

- (void)setThumbnailImageView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
}

@end
