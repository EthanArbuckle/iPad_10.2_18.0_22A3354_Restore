@implementation CKLinkSearchResultCell

+ (id)reuseIdentifier
{
  return CFSTR("LinkSearchCell");
}

- (CKLinkSearchResultCell)initWithFrame:(CGRect)a3
{
  CKLinkSearchResultCell *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKLinkSearchResultCell;
  v3 = -[CKLinkSearchResultCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__metadataGenerated_, CFSTR("CKSearchLPLinkMetadataDidChange"), 0);

  }
  return v3;
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLinkSearchResultCell setResultIdentifier:](self, "setResultIdentifier:", v6);

  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasCachedLinkMetadataForQueryResult:", v12);

  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "cachedLinkMetadataForQueryResult:", v12);
    v11 = objc_claimAutoreleasedReturnValue();

    -[CKLinkSearchResultCell setLinkMetadata:forSearchResult:](self, "setLinkMetadata:forSearchResult:", v11, v12);
    v10 = (void *)v11;
  }
  else
  {
    objc_msgSend(v9, "beginFetchingLinkMetadataForQueryResult:", v12);
  }

}

- (void)setLinkMetadata:(id)a3 forSearchResult:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  v20 = a3;
  v6 = a4;
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v20;
  if (!v20 && v9)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
    objc_msgSend(v21, "setOriginalURL:", v9);
    objc_msgSend(v21, "setURL:", v9);
    v10 = v21;
  }
  v22 = v10;
  if (v10)
  {
    -[CKLinkSearchResultCell linkMetadata](self, "linkMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v22);

    if ((v12 & 1) == 0)
    {
      -[CKLinkSearchResultCell setLinkMetadata:](self, "setLinkMetadata:", v22);
      -[CKLinkSearchResultCell linkView](self, "linkView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[CKLinkSearchResultCell linkView](self, "linkView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeFromSuperview");

        -[CKLinkSearchResultCell setLinkView:](self, "setLinkView:", 0);
      }
      objc_msgSend(v6, "item");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "attributeSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC11C8]), "initWithURL:", v17);
      objc_msgSend(v18, "setMetadata:", v22);
      objc_msgSend(v18, "_setApplyCornerRadius:", 1);
      objc_msgSend(v18, "_setPreferredSizeClass:", 5);
      objc_msgSend(v18, "_setDisableTapGesture:", 1);
      -[CKLinkSearchResultCell setLinkView:](self, "setLinkView:", v18);
      -[CKLinkSearchResultCell contentView](self, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", v18);

      -[CKLinkSearchResultCell setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)_metadataGenerated:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLinkSearchResultCell resultIdentifier](self, "resultIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedLinkMetadataForQueryResult:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKLinkSearchResultCell setLinkMetadata:forSearchResult:](self, "setLinkMetadata:forSearchResult:", v8, v9);
  }

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKLinkSearchResultCell;
  -[CKLinkSearchResultCell didMoveToWindow](&v3, sel_didMoveToWindow);
  -[CKLinkSearchResultCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double Width;
  double Height;
  double v29;
  void *v30;
  CGRect rect;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = CKLinkSearchResultCell;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, sel_layoutSubviews);
  -[CKLinkSearchResultCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKLinkSearchResultCell linkView](self, "linkView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = -[CKLinkSearchResultCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[CKLinkSearchResultCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bringSubviewToFront:", v16);

    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sizeToFit");

    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    rect.origin.x = v19;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v26 = 4.0;
    if ((v14 & 1) == 0)
    {
      v32.origin.x = v5;
      v32.origin.y = v7;
      v32.size.width = v9;
      v32.size.height = v11;
      Width = CGRectGetWidth(v32);
      v33.origin.x = rect.origin.x;
      v33.origin.y = v21;
      v33.size.width = v23;
      v33.size.height = v25;
      v26 = Width - CGRectGetWidth(v33) + -4.0;
    }
    v34.origin.x = v5;
    v34.origin.y = v7;
    v34.size.width = v9;
    v34.size.height = v11;
    Height = CGRectGetHeight(v34);
    v35.origin.x = v26;
    v35.origin.y = v21;
    v35.size.width = v23;
    v35.size.height = v25;
    v29 = Height - CGRectGetHeight(v35) + -4.0;
    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v26, v29, v23, v25);

  }
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKLinkSearchResultCell;
  -[CKEditableSearchResultCell prepareForReuse](&v5, sel_prepareForReuse);
  -[CKLinkSearchResultCell setResultIdentifier:](self, "setResultIdentifier:", 0);
  -[CKLinkSearchResultCell setLinkMetadata:](self, "setLinkMetadata:", 0);
  -[CKLinkSearchResultCell linkView](self, "linkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKLinkSearchResultCell linkView](self, "linkView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[CKLinkSearchResultCell setLinkView:](self, "setLinkView:", 0);
  }
}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->marginInsets.top;
  left = self->marginInsets.left;
  bottom = self->marginInsets.bottom;
  right = self->marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setResultIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
  objc_storeStrong((id *)&self->_linkView, a3);
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
}

@end
