@implementation PDFThumbnailView

- (PDFThumbnailView)init
{
  PDFThumbnailView *v2;
  PDFThumbnailView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDFThumbnailView;
  v2 = -[PDFThumbnailView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PDFThumbnailView _commonInitWithStyle:](v2, "_commonInitWithStyle:", 0);
  return v3;
}

- (PDFThumbnailView)initWithFrame:(CGRect)a3
{
  PDFThumbnailView *v3;
  PDFThumbnailView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDFThumbnailView;
  v3 = -[PDFThumbnailView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PDFThumbnailView _commonInitWithStyle:](v3, "_commonInitWithStyle:", 0);
  return v4;
}

- (PDFThumbnailView)initWithCoder:(id)a3
{
  id v4;
  PDFThumbnailView *v5;
  float v6;
  float v7;
  uint64_t v8;
  void *v9;
  float v11[3];
  int v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDFThumbnailView;
  v5 = -[PDFThumbnailView initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "allowsKeyedCoding"))
    {
      -[PDFThumbnailView _commonInitWithStyle:](v5, "_commonInitWithStyle:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("Style")));
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ThumbSizeWidth"));
      v5->_thumbnailSize.width = v6;
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ThumbSizeHeight"));
      v5->_thumbnailSize.height = v7;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PDFView"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 1;
      objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "i", &v12, 4);
      *(_QWORD *)v11 = 0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "q", v11, 8);
      -[PDFThumbnailView _commonInitWithStyle:](v5, "_commonInitWithStyle:", *(_QWORD *)v11);
      v11[0] = 0.0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "f", v11, 4);
      v5->_thumbnailSize.width = v11[0];
      objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "f", v11, 4);
      v5->_thumbnailSize.height = v11[0];
      objc_msgSend(v4, "decodeObject");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v8;
    if (v8)
      -[PDFThumbnailView setPDFView:](v5, "setPDFView:", v8);

    if (v5->_thumbnailSize.width <= 0.0 || v5->_thumbnailSize.height <= 0.0)
      v5->_thumbnailSize = (CGSize)kDefaultThumbnailSize;
    -[PDFThumbnailView setBackgroundColor:](v5, "setBackgroundColor:", v5->_backgroundColor);
    -[PDFThumbnailView _updateLayout](v5, "_updateLayout");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CGFloat width;
  CGFloat height;
  id WeakRetained;
  float v8;
  float v9;
  float v10;
  int v11;
  objc_super v12;

  v4 = a3;
  -[PDFThumbnailCollectionViewInterface removeFromSuperview](self->_iconsView, "removeFromSuperview");
  v12.receiver = self;
  v12.super_class = (Class)PDFThumbnailView;
  -[PDFThumbnailView encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  -[PDFThumbnailView addSubview:](self, "addSubview:", self->_iconsView);
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_style), CFSTR("Style"));
    width = self->_thumbnailSize.width;
    *(float *)&width = width;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("ThumbSizeWidth"), width);
    height = self->_thumbnailSize.height;
    *(float *)&height = height;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("ThumbSizeHeight"), height);
    WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
    objc_msgSend(v4, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("PDFView"));

  }
  else
  {
    v11 = 1;
    objc_msgSend(v4, "encodeValueOfObjCType:at:", "i", &v11);
    objc_msgSend(v4, "encodeValueOfObjCType:at:", "q", &self->_style);
    v8 = self->_thumbnailSize.width;
    v10 = v8;
    objc_msgSend(v4, "encodeValueOfObjCType:at:", "f", &v10);
    v9 = self->_thumbnailSize.height;
    v10 = v9;
    objc_msgSend(v4, "encodeValueOfObjCType:at:", "f", &v10);
  }

}

- (PDFThumbnailView)initWithStyle:(int64_t)a3
{
  PDFThumbnailView *v4;
  PDFThumbnailView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDFThumbnailView;
  v4 = -[PDFThumbnailView init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[PDFThumbnailView _commonInitWithStyle:](v4, "_commonInitWithStyle:", a3);
  return v5;
}

- (PDFThumbnailView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  PDFThumbnailView *v5;
  PDFThumbnailView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDFThumbnailView;
  v5 = -[PDFThumbnailView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    -[PDFThumbnailView _commonInitWithStyle:](v5, "_commonInitWithStyle:", a4);
  return v6;
}

- (void)_commonInitWithStyle:(int64_t)a3
{
  __int128 v4;
  PDFThumbnailCollectionViewInterface *v5;
  PDFThumbnailCollectionViewInterface *iconsView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PDFThumbnailCollectionViewInterface *v16;
  PDFThumbnailCollectionViewInterface *v17;
  PDFThumbnailCollectionViewInterface *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  if (!self->_iconsView)
  {
    self->_style = a3;
    self->_thumbnailSize = (CGSize)kDefaultThumbnailSize;
    v4 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    *(_OWORD *)&self->_contentInset.top = *MEMORY[0x24BDF7718];
    *(_OWORD *)&self->_contentInset.bottom = v4;
    if (a3 == 1)
    {
      v5 = -[PDFThumbnailsCollectionView initFromThumbnailView:]([PDFThumbnailsCollectionView alloc], "initFromThumbnailView:", self);
      iconsView = self->_iconsView;
      self->_iconsView = v5;

      -[PDFThumbnailView addSubview:](self, "addSubview:", self->_iconsView);
      -[PDFThumbnailCollectionViewInterface setTranslatesAutoresizingMaskIntoConstraints:](self->_iconsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v19 = (void *)MEMORY[0x24BDD1628];
      -[PDFThumbnailCollectionViewInterface bottomAnchor](self->_iconsView, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFThumbnailView bottomAnchor](self, "bottomAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v21;
      -[PDFThumbnailCollectionViewInterface topAnchor](self->_iconsView, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFThumbnailView topAnchor](self, "topAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v8;
      -[PDFThumbnailCollectionViewInterface leadingAnchor](self->_iconsView, "leadingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFThumbnailView leadingAnchor](self, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v11;
      -[PDFThumbnailCollectionViewInterface trailingAnchor](self->_iconsView, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFThumbnailView trailingAnchor](self, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "activateConstraints:", v15);

    }
    else
    {
      v16 = -[PDFIconsView initFromThumbnailView:]([PDFIconsView alloc], "initFromThumbnailView:", self);
      v17 = self->_iconsView;
      self->_iconsView = v16;

      v18 = self->_iconsView;
      -[PDFThumbnailView bounds](self, "bounds");
      -[PDFThumbnailCollectionViewInterface setFrame:](v18, "setFrame:");
      -[PDFThumbnailCollectionViewInterface setAutoresizingMask:](self->_iconsView, "setAutoresizingMask:", 18);
      -[PDFThumbnailView addSubview:](self, "addSubview:", self->_iconsView);
    }
    -[PDFThumbnailView setupNotifications](self, "setupNotifications");
  }
}

- (void)setupNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_documentChanged_, CFSTR("PDFViewChangedDocument"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_currentPageChanged_, CFSTR("PDFViewChangedPage"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_pageChanged_, CFSTR("PDFViewAnnotationsDidChange"), 0);
  -[PDFThumbnailView updateNotificationsForDocument](self, "updateNotificationsForDocument");

}

- (void)updateNotificationsForDocument
{
  id WeakRetained;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(WeakRetained, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("PDFDocumentDidUnlock"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("PDFDocumentDidMutate"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("PDFPageDidChangeBounds"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("PDFPageDidRotate"), 0);
  if (v4)
  {
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_documentUnlocked_, CFSTR("PDFDocumentDidUnlock"), v4);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_documentMutated_, CFSTR("PDFDocumentDidMutate"), v4);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_pageChanged_, CFSTR("PDFPageDidChangeBounds"), v4);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_pageChanged_, CFSTR("PDFPageDidRotate"), v4);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PDFThumbnailView;
  -[PDFThumbnailView dealloc](&v4, sel_dealloc);
}

- (void)setPDFView:(PDFView *)PDFView
{
  objc_storeWeak((id *)&self->_pdfView, PDFView);
  -[PDFThumbnailCollectionViewInterface updateIconsImages](self->_iconsView, "updateIconsImages");
  -[PDFThumbnailView _updateLayout](self, "_updateLayout");
  -[PDFThumbnailView updateNotificationsForDocument](self, "updateNotificationsForDocument");
}

- (PDFView)PDFView
{
  return (PDFView *)objc_loadWeakRetained((id *)&self->_pdfView);
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  UIColor *v4;
  UIColor *v5;

  v4 = (UIColor *)-[UIColor copy](backgroundColor, "copy");
  v5 = self->_backgroundColor;
  self->_backgroundColor = v4;

  -[PDFThumbnailCollectionViewInterface setBackgroundColor:](self->_iconsView, "setBackgroundColor:", self->_backgroundColor);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSArray)selectedPages
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[PDFThumbnailCollectionViewInterface currentPage](self->_iconsView, "currentPage");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setThumbnailSize:(CGSize)thumbnailSize
{
  self->_thumbnailSize = thumbnailSize;
  -[PDFThumbnailView _updateLayout](self, "_updateLayout");
  -[PDFThumbnailCollectionViewInterface updateIconsImages](self->_iconsView, "updateIconsImages");
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAllowsPageReordering:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PDFThumbnailCollectionViewInterface setAllowsPageReordering:](self->_iconsView, "setAllowsPageReordering:", v3);
}

- (BOOL)allowsPageReordering
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[PDFThumbnailCollectionViewInterface allowsPageReordering](self->_iconsView, "allowsPageReordering");
  else
    return 0;
}

- (void)setLayoutMode:(PDFThumbnailLayoutMode)layoutMode
{
  self->_layoutMode = layoutMode;
  -[PDFThumbnailView _updateLayout](self, "_updateLayout");
}

- (PDFThumbnailLayoutMode)layoutMode
{
  return self->_layoutMode;
}

- (void)setContentInset:(UIEdgeInsets)contentInset
{
  self->_contentInset = contentInset;
  -[PDFThumbnailView _updateLayout](self, "_updateLayout");
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_updateLayout
{
  -[PDFThumbnailCollectionViewInterface setNeedsLayout](self->_iconsView, "setNeedsLayout");
}

- (void)documentChanged:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(v6, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (WeakRetained == v5)
  {
    -[PDFThumbnailCollectionViewInterface documentChanged:](self->_iconsView, "documentChanged:", v6);
    -[PDFThumbnailView updateNotificationsForDocument](self, "updateNotificationsForDocument");
  }

}

- (void)documentUnlocked:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(WeakRetained, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    -[PDFThumbnailCollectionViewInterface documentChanged:](self->_iconsView, "documentChanged:", v7);

}

- (void)documentMutated:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(WeakRetained, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    -[PDFThumbnailCollectionViewInterface documentMutated:](self->_iconsView, "documentMutated:", v7);

}

- (void)currentPageChanged:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(v6, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (WeakRetained == v5)
    -[PDFThumbnailCollectionViewInterface currentPageChanged:](self->_iconsView, "currentPageChanged:", v6);

}

- (void)pageChanged:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  objc_msgSend(WeakRetained, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_10;
  objc_msgSend(v14, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("PDFPageDidChangeBounds")))
  {

    goto LABEL_5;
  }
  objc_msgSend(v14, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PDFPageDidRotate"));

  if (v8)
  {
LABEL_5:
    objc_msgSend(v14, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v5)
      goto LABEL_10;
  }
  objc_msgSend(v14, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("page"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "document");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v5)
      -[PDFThumbnailCollectionViewInterface pageChanged:](self->_iconsView, "pageChanged:", v14);
  }

LABEL_10:
}

- (PDFThumbnailContextMenuDelegate)thumbnailContextMenuDelegate
{
  return (PDFThumbnailContextMenuDelegate *)objc_loadWeakRetained((id *)&self->thumbnailContextMenuDelegate);
}

- (void)setThumbnailContextMenuDelegate:(id)a3
{
  objc_storeWeak((id *)&self->thumbnailContextMenuDelegate, a3);
}

- (PDFThumbnailDataSourceDelegate)thumbnailDataSourceDelegate
{
  return (PDFThumbnailDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_thumbnailDataSourceDelegate);
}

- (void)setThumbnailDataSourceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailDataSourceDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailDataSourceDelegate);
  objc_destroyWeak((id *)&self->thumbnailContextMenuDelegate);
  objc_storeStrong((id *)&self->_iconsView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_destroyWeak((id *)&self->_pdfView);
}

@end
