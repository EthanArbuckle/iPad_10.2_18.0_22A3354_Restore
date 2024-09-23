@implementation SUUIVerticalLockupCollectionViewCell

- (SUUIVerticalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIVerticalLockupCollectionViewCell *v3;
  SUUIVerticalLockupCollectionViewCell *v4;
  void *v5;
  SUUIVerticalLockupView *v6;
  uint64_t v7;
  SUUIVerticalLockupView *lockupView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIVerticalLockupCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUIVerticalLockupCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [SUUIVerticalLockupView alloc];
    objc_msgSend(v5, "bounds");
    v7 = -[SUUIVerticalLockupView initWithFrame:](v6, "initWithFrame:");
    lockupView = v4->_lockupView;
    v4->_lockupView = (SUUIVerticalLockupView *)v7;

    objc_msgSend(v5, "addSubview:", v4->_lockupView);
  }
  return v4;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  SUUIVerticalLockupView *lockupView;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v4 = a3;
  lockupView = self->_lockupView;
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView setBackgroundColor:](lockupView, "setBackgroundColor:", v6);

  v13.receiver = self;
  v13.super_class = (Class)SUUIVerticalLockupCollectionViewCell;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v13, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "zoomingImageWidth");
  v8 = v7;
  v9 = 1.0;
  v10 = 1.0;
  if (v7 > 0.00000011920929)
  {
    objc_msgSend(v4, "zoomingImageImposedAlphaOfOtherViews");
    v9 = v11;
    objc_msgSend(v4, "zoomingImageAlpha");
    v10 = v12;
  }
  -[SUUIVerticalLockupView setOpacityOfViewsOtherThanProductImageView:](self->_lockupView, "setOpacityOfViewsOtherThanProductImageView:", v9);
  -[SUUIVerticalLockupView setZoomingImageAlpha:](self->_lockupView, "setZoomingImageAlpha:", v10);
  -[SUUIVerticalLockupView setZoomingImageWidth:](self->_lockupView, "setZoomingImageWidth:", v8);

}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double result;

  +[SUUIVerticalLockupView maximumPerspectiveHeightForSize:](SUUIVerticalLockupView, "maximumPerspectiveHeightForSize:", a3.width, a3.height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  SUUIVerticalLockupView *lockupView;
  id v4;

  lockupView = self->_lockupView;
  v4 = a3;
  -[SUUIVerticalLockupView setPerspectiveTargetView:](lockupView, "setPerspectiveTargetView:", v4);

}

- (void)setVanishingPoint:(CGPoint)a3
{
  -[SUUIVerticalLockupView setVanishingPoint:](self->_lockupView, "setVanishingPoint:", a3.x, a3.y);
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  -[SUUIVerticalLockupView updateForChangedDistanceFromVanishingPoint](self->_lockupView, "updateForChangedDistanceFromVanishingPoint");
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIVerticalLockupView prefetchResourcesForViewElement:reason:context:](SUUIVerticalLockupView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  +[SUUIVerticalLockupView preferredSizeForViewElement:context:](SUUIVerticalLockupView, "preferredSizeForViewElement:context:", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SUUIVerticalLockupView requestLayoutForViewElement:width:context:](SUUIVerticalLockupView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SUUIVerticalLockupView sizeThatFitsWidth:viewElement:context:](SUUIVerticalLockupView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SUUIVerticalLockupView reloadWithViewElement:width:context:](self->_lockupView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[SUUIVerticalLockupView setContentInset:](self->_lockupView, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SUUIVerticalLockupView setImage:forArtworkRequest:context:](self->_lockupView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SUUIVerticalLockupView updateWithItemState:context:animated:](self->_lockupView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SUUIVerticalLockupView viewForElementIdentifier:](self->_lockupView, "viewForElementIdentifier:", a3);
}

- (void)layoutSubviews
{
  SUUIVerticalLockupView *lockupView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIVerticalLockupCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  lockupView = self->_lockupView;
  -[SUUIVerticalLockupCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SUUIVerticalLockupView setFrame:](lockupView, "setFrame:");

}

- (void)setBackgroundColor:(id)a3
{
  SUUIVerticalLockupView *lockupView;
  id v5;
  objc_super v6;

  lockupView = self->_lockupView;
  v5 = a3;
  -[SUUIViewReuseView setBackgroundColor:](lockupView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIVerticalLockupCollectionViewCell;
  -[SUUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIVerticalLockupCollectionViewCell;
  -[SUUICollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SUUIVerticalLockupCollectionViewCell _reloadHighlightImageView](self, "_reloadHighlightImageView");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIVerticalLockupCollectionViewCell;
  -[SUUICollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[SUUIVerticalLockupCollectionViewCell _reloadHighlightImageView](self, "_reloadHighlightImageView");
}

- (void)_reloadHighlightImageView
{
  SUUIVerticalLockupView *lockupView;
  uint64_t v4;
  void *v5;
  SUUIVerticalLockupView *v6;
  SUUIImageView *highlightImageView;
  SUUIImageView *v8;
  SUUIImageView *v9;
  SUUIImageView *v10;
  void *v11;
  SUUIImageView *v12;
  SUUIImageView *v13;
  void *v14;
  void *v15;
  void *v16;
  SUUIImageView *v17;
  void *v18;
  SUUIImageView *v19;
  SUUIImageView *v20;
  SUUIImageView *v21;
  void *v22;
  SUUIImageView *v23;
  _QWORD v24[4];
  SUUIImageView *v25;
  _OWORD v26[3];
  _QWORD v27[5];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  if ((-[SUUIVerticalLockupCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[SUUIVerticalLockupCollectionViewCell isSelected](self, "isSelected"))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__54;
    v33 = __Block_byref_object_dispose__54;
    v34 = 0;
    lockupView = self->_lockupView;
    v4 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __65__SUUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke;
    v28[3] = &unk_2511FA7A8;
    v28[4] = &v29;
    -[SUUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](lockupView, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x25120BBE8, v28);
    v5 = (void *)v30[5];
    if (v5)
      goto LABEL_5;
    v6 = self->_lockupView;
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __65__SUUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_2;
    v27[3] = &unk_2511FA7A8;
    v27[4] = &v29;
    -[SUUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](v6, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x251200FC8, v27);
    v5 = (void *)v30[5];
    if (v5)
    {
LABEL_5:
      highlightImageView = self->_highlightImageView;
      if (!highlightImageView)
      {
        v8 = objc_alloc_init(SUUIImageView);
        v9 = self->_highlightImageView;
        self->_highlightImageView = v8;

        -[SUUIImageView setAlpha:](self->_highlightImageView, "setAlpha:", 0.300000012);
        v10 = self->_highlightImageView;
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIImageView setBackgroundColor:](v10, "setBackgroundColor:", v11);

        highlightImageView = self->_highlightImageView;
        v5 = (void *)v30[5];
      }
      objc_msgSend(v5, "bounds");
      -[SUUIImageView setBounds:](highlightImageView, "setBounds:");
      v12 = self->_highlightImageView;
      objc_msgSend((id)v30[5], "center");
      -[SUUIImageView setCenter:](v12, "setCenter:");
      v13 = self->_highlightImageView;
      objc_msgSend((id)v30[5], "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_flatImageWithColor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIImageView setImage:](v13, "setImage:", v16);

      v17 = self->_highlightImageView;
      v18 = (void *)v30[5];
      if (v18)
        objc_msgSend(v18, "transform");
      else
        memset(v26, 0, sizeof(v26));
      -[SUUIImageView setTransform:](v17, "setTransform:", v26);
      -[SUUIVerticalLockupView insertSubview:aboveSubview:](self->_lockupView, "insertSubview:aboveSubview:", self->_highlightImageView, v30[5]);
    }
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    v19 = self->_highlightImageView;
    if (v19)
    {
      v20 = v19;
      v21 = self->_highlightImageView;
      self->_highlightImageView = 0;

      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      v22 = (void *)MEMORY[0x24BDE57D8];
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __65__SUUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_3;
      v24[3] = &unk_2511F47C0;
      v25 = v20;
      v23 = v20;
      objc_msgSend(v22, "setCompletionBlock:", v24);
      -[SUUIImageView setAlpha:](v23, "setAlpha:", 0.0);
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");

    }
  }
}

void __65__SUUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

void __65__SUUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

uint64_t __65__SUUIVerticalLockupCollectionViewCell__reloadHighlightImageView__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_highlightImageView, 0);
}

@end
