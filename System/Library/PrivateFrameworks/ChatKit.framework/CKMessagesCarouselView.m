@implementation CKMessagesCarouselView

- (Class)viewClassForItemAtIndex:(int64_t)a3 inStackLayout:(id)a4
{
  return self->viewClass;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4
{
  return 0;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4
{
  return 0;
}

- (id)viewUserDataForAccessoryItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)viewUserDataForItemAtIndex:(int64_t)a3 inStackLayout:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  -[PXBaseMessagesStackView dataSourceManager](self, "dataSourceManager", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBaseMessagesStackView dataSourceManager](self, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = objc_msgSend(v9, "identifier");
  v12[1] = 0;
  v12[2] = a3;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v7, "objectAtIndexPath:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4
{
  return self->viewAspectRatio;
}

- (void)primaryItemDidChange:(BOOL)a3 didChangeIndex:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKMessagesCarouselView;
  -[PXBaseMessagesStackView primaryItemDidChange:didChangeIndex:](&v6, sel_primaryItemDidChange_didChangeIndex_, a3, a4);
  -[CKMessagesCarouselView carouselDelegate](self, "carouselDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "carousel:didScrollToIndex:", self, -[PXBaseMessagesStackView currentIndex](self, "currentIndex"));

}

- (BOOL)stackItemsLayout:(id)a3 itemHasTapback:(int64_t)a4
{
  return 0;
}

- (CKMessagesCarouselView)initWithItemAspectRatio:(double)a3
{
  CKMessagesCarouselView *v4;
  CKMessagesCarouselView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKMessagesCarouselView;
  v4 = -[PXBaseMessagesStackView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[PXBaseMessagesStackView setUseAspectTiles:](v4, "setUseAspectTiles:", 0);
    -[PXBaseMessagesStackView layout](v5, "layout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v5);
    objc_msgSend(v6, "setMediaKind:", 10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "setKeepItemAspectRatioConstant:", 1);
    v5->viewAspectRatio = a3;

  }
  return v5;
}

- (void)setViewClass:(Class)a3
{
  self->viewClass = a3;
}

+ (id)resolvedBackgroundColorFor:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_resolvedBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CKMessagesCarouselViewDelegate)carouselDelegate
{
  return (CKMessagesCarouselViewDelegate *)objc_loadWeakRetained((id *)&self->_carouselDelegate);
}

- (void)setCarouselDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_carouselDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_carouselDelegate);
}

@end
