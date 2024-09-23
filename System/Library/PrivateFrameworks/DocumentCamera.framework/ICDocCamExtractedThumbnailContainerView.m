@implementation ICDocCamExtractedThumbnailContainerView

- (BOOL)isAccessibilityElement
{
  ICDocCamExtractedThumbnailContainerView *v2;
  void *v3;

  v2 = self;
  -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "thumbnailContainerViewIsVisible:", v2);

  return (char)v2;
}

- (id)accessibilityLabel
{
  return +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Scan thumbnails"), CFSTR("Scan thumbnails"), CFSTR("Localizable"));
}

- (id)accessibilityHint
{
  ICDocCamExtractedThumbnailContainerView *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v3, "thumbnailContainerViewSupportsReordering:", v2);

  if ((_DWORD)v2)
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Double-tap and drag to reorder current scan"), CFSTR("Double-tap and drag to reorder current scan"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "thumbnailContainerViewCurrentIndex:", self);

  -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "thumbnailContainerViewNumberOfItems:", self);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Scan %lu of %lu"), CFSTR("Scan %lu of %lu"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v7, v4 + 1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityElements
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICDocCamExtractedThumbnailContainerView;
  return *MEMORY[0x24BDF73A0] | -[ICDocCamExtractedThumbnailContainerView accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)accessibilityIncrement
{
  id v3;

  -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailContainerViewIncrementCurrentIndex:", self);

}

- (void)accessibilityDecrement
{
  id v3;

  -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailContainerViewDecrementCurrentIndex:", self);

}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "thumbnailContainerViewSupportsReordering:", self);

  if (v5)
  {
    -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "thumbnailContainerViewCurrentIndex:", self);

    -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "thumbnailContainerViewNumberOfItems:", self);

    if (v7 < v9 - 1)
    {
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Order Next"), CFSTR("Order Next"), CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v10, self, sel_orderNextForAccessibility_);
      objc_msgSend(v3, "addObject:", v11);

    }
    if (v7)
    {
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Order Previous"), CFSTR("Order Previous"), CFSTR("Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v12, self, sel_orderPreviousForAccessibility_);
      objc_msgSend(v3, "addObject:", v13);

    }
  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (BOOL)orderPreviousForAccessibility:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "thumbnailContainerViewCurrentIndex:", self);

  if (v5)
  {
    -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumbnailContainerView:moveItemFromIndex:toIndex:", self, v5, v5 - 1);

  }
  return v5 != 0;
}

- (BOOL)orderNextForAccessibility:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;

  -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "thumbnailContainerViewCurrentIndex:", self);

  -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "thumbnailContainerViewNumberOfItems:", self);

  v8 = v7 - 1;
  if (v5 < v8)
  {
    -[ICDocCamExtractedThumbnailContainerView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "thumbnailContainerView:moveItemFromIndex:toIndex:", self, v5, v5 + 1);

  }
  return v5 < v8;
}

- (ICDocCamExtractedThumbnailContainerViewDelegate)delegate
{
  return (ICDocCamExtractedThumbnailContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
