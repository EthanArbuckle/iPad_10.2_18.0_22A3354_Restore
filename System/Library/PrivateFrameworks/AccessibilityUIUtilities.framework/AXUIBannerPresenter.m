@implementation AXUIBannerPresenter

- (AXUIBannerPresenter)initWithContainingView:(id)a3
{
  AXUIBannerPresenter *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXUIBannerPresenter;
  v3 = -[AXUIFloatingViewPresenter initWithContainingView:alignedToEdge:withinSafeArea:](&v6, sel_initWithContainingView_alignedToEdge_withinSafeArea_, a3, 1, 0);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)presentBannerViewWithText:(id)a3 duration:(double)a4
{
  -[AXUIBannerPresenter presentBannerViewWithText:secondaryText:duration:fromUserAction:](self, "presentBannerViewWithText:secondaryText:duration:fromUserAction:", a3, 0, 1, a4);
}

- (void)presentBannerViewWithText:(id)a3 secondaryText:(id)a4 duration:(double)a5 fromUserAction:(BOOL)a6
{
  id v9;
  objc_class *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v9 = a4;
  v10 = (objc_class *)objc_opt_class();
  -[AXUIBannerPresenter bannerView](self, "bannerView");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11
    || (v12 = (void *)v11,
        -[AXUIBannerPresenter bannerView](self, "bannerView"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isMemberOfClass:", v10),
        v13,
        v12,
        (v14 & 1) == 0))
  {
    v15 = objc_alloc_init(v10);
    -[AXUIBannerPresenter setBannerView:](self, "setBannerView:", v15);

  }
  -[AXUIBannerPresenter bannerView](self, "bannerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v19);

  -[AXUIBannerPresenter bannerView](self, "bannerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSecondaryText:", v9);

  -[AXUIBannerPresenter bannerView](self, "bannerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIFloatingViewPresenter presentFloatingView:withDuration:](self, "presentFloatingView:withDuration:", v18, a5);

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  -[AXUIBannerPresenter setBannerView:](self, "setBannerView:", 0);
}

- (AXUIBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end
