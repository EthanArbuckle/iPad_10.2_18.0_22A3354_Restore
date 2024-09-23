@implementation CKWalletItemLinkSearchResultCell

+ (id)reuseIdentifier
{
  return CFSTR("WalletItemLinkSearchCell");
}

- (CKWalletItemLinkSearchResultCell)initWithFrame:(CGRect)a3
{
  CKWalletItemLinkSearchResultCell *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKWalletItemLinkSearchResultCell;
  v3 = -[CKWalletItemLinkSearchResultCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__metadataGenerated_, CFSTR("CKSearchLPWalletItemMetadataDidChange"), 0);

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
  -[CKWalletItemLinkSearchResultCell setResultIdentifier:](self, "setResultIdentifier:", v6);

  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasCachedWalletItemLinkPropertiesForQueryResult:", v12);

  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "cachedWalletItemLinkPropertiesForQueryResult:", v12);
    v11 = objc_claimAutoreleasedReturnValue();

    -[CKWalletItemLinkSearchResultCell setLinkPresentationProperties:forSearchResult:](self, "setLinkPresentationProperties:forSearchResult:", v11, v12);
    v10 = (void *)v11;
  }
  else
  {
    objc_msgSend(v9, "beginGeneratingWebLinkPresentationPropertiesForQueryResult:", v12);
  }

}

- (void)setLinkPresentationProperties:(id)a3 forSearchResult:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (v13)
  {
    -[CKWalletItemLinkSearchResultCell linkMetadata](self, "linkMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v13);

    if ((v8 & 1) == 0)
    {
      -[CKWalletItemLinkSearchResultCell setLinkMetadata:](self, "setLinkMetadata:", v13);
      -[CKWalletItemLinkSearchResultCell linkView](self, "linkView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[CKWalletItemLinkSearchResultCell linkView](self, "linkView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeFromSuperview");

        -[CKWalletItemLinkSearchResultCell setLinkView:](self, "setLinkView:", 0);
      }
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC11C8]), "initWithPresentationProperties:URL:", v13, 0);
      objc_msgSend(v11, "_setApplyCornerRadius:", 1);
      objc_msgSend(v11, "_setPreferredSizeClass:", 5);
      objc_msgSend(v11, "_setDisableTapGesture:", 1);
      objc_msgSend(v11, "_setAction:withText:buttonType:", 0, &stru_1E276D870, 1);
      -[CKWalletItemLinkSearchResultCell setLinkView:](self, "setLinkView:", v11);
      -[CKWalletItemLinkSearchResultCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v11);

      -[CKWalletItemLinkSearchResultCell setNeedsLayout](self, "setNeedsLayout");
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
  -[CKWalletItemLinkSearchResultCell resultIdentifier](self, "resultIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedWalletItemLinkPropertiesForQueryResult:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKWalletItemLinkSearchResultCell setLinkPresentationProperties:forSearchResult:](self, "setLinkPresentationProperties:forSearchResult:", v8, v9);

  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKWalletItemLinkSearchResultCell;
  -[CKWalletItemLinkSearchResultCell didMoveToWindow](&v3, sel_didMoveToWindow);
  -[CKWalletItemLinkSearchResultCell layoutIfNeeded](self, "layoutIfNeeded");
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
  *(_QWORD *)&rect.size.width = CKWalletItemLinkSearchResultCell;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, sel_layoutSubviews);
  -[CKWalletItemLinkSearchResultCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKWalletItemLinkSearchResultCell linkView](self, "linkView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = -[CKWalletItemLinkSearchResultCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[CKWalletItemLinkSearchResultCell contentView](self, "contentView");
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
  v5.super_class = (Class)CKWalletItemLinkSearchResultCell;
  -[CKEditableSearchResultCell prepareForReuse](&v5, sel_prepareForReuse);
  -[CKWalletItemLinkSearchResultCell setResultIdentifier:](self, "setResultIdentifier:", 0);
  -[CKWalletItemLinkSearchResultCell setLinkMetadata:](self, "setLinkMetadata:", 0);
  -[CKWalletItemLinkSearchResultCell linkView](self, "linkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKWalletItemLinkSearchResultCell linkView](self, "linkView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[CKWalletItemLinkSearchResultCell setLinkView:](self, "setLinkView:", 0);
  }
}

- (id)previewSnapshot
{
  void *v2;
  void *v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  void *v7;
  CGSize v9;

  -[CKWalletItemLinkSearchResultCell linkView](self, "linkView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "bounds");
    v9.width = v4;
    v9.height = v5;
    UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
    objc_msgSend(v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "renderInContext:", UIGraphicsGetCurrentContext());

    UIGraphicsGetImageFromCurrentImageContext();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    v7 = 0;
  }

  return v7;
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

- (LPWebLinkPresentationProperties)linkMetadata
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
