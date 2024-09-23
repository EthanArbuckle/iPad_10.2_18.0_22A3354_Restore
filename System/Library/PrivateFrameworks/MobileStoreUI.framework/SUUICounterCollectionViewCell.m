@implementation SUUICounterCollectionViewCell

- (SUUICounterCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUICounterCollectionViewCell *v3;
  SUUICounterView *v4;
  uint64_t v5;
  SUUICounterView *counterView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUICounterCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUICounterView alloc];
    -[SUUICounterCollectionViewCell bounds](v3, "bounds");
    v5 = -[SUUIViewReuseView initWithFrame:](v4, "initWithFrame:");
    counterView = v3->_counterView;
    v3->_counterView = (SUUICounterView *)v5;

    -[SUUICounterCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_counterView);

  }
  return v3;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  -[SUUICounterView setContentInset:](self->_counterView, "setContentInset:");
}

- (void)applyLayoutAttributes:(id)a3
{
  SUUICounterView *counterView;
  id v5;
  void *v6;
  objc_super v7;

  counterView = self->_counterView;
  v5 = a3;
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView setBackgroundColor:](counterView, "setBackgroundColor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SUUICounterCollectionViewCell;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v5);

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUICounterView prefetchResourcesForViewElement:reason:context:](SUUICounterView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SUUICounterView requestLayoutForViewElement:width:context:](SUUICounterView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SUUICounterView reloadWithViewElement:width:context:](self->_counterView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SUUICounterView sizeThatFitsWidth:viewElement:context:](SUUICounterView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SUUICounterView setImage:forArtworkRequest:context:](self->_counterView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SUUICounterView updateWithItemState:context:animated:](self->_counterView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SUUICounterView viewForElementIdentifier:](self->_counterView, "viewForElementIdentifier:", a3);
}

- (void)layoutSubviews
{
  SUUICounterView *counterView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUICounterCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  counterView = self->_counterView;
  -[SUUICounterCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SUUICounterView setFrame:](counterView, "setFrame:");

}

- (void)setBackgroundColor:(id)a3
{
  SUUICounterView *counterView;
  id v5;
  objc_super v6;

  counterView = self->_counterView;
  v5 = a3;
  -[SUUIViewReuseView setBackgroundColor:](counterView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUICounterCollectionViewCell;
  -[SUUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUICounterCollectionViewCell;
  -[SUUICollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SUUICounterCollectionViewCell _reloadHighlightImageView](self, "_reloadHighlightImageView");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUICounterCollectionViewCell;
  -[SUUICollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[SUUICounterCollectionViewCell _reloadHighlightImageView](self, "_reloadHighlightImageView");
}

- (void)_reloadHighlightImageView
{
  SUUICounterView *counterView;
  uint64_t v4;
  void *v5;
  SUUICounterView *v6;
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

  if ((-[SUUICounterCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[SUUICounterCollectionViewCell isSelected](self, "isSelected"))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__52;
    v33 = __Block_byref_object_dispose__52;
    v34 = 0;
    counterView = self->_counterView;
    v4 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __58__SUUICounterCollectionViewCell__reloadHighlightImageView__block_invoke;
    v28[3] = &unk_2511FA7A8;
    v28[4] = &v29;
    -[SUUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](counterView, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x25120BBE8, v28);
    v5 = (void *)v30[5];
    if (v5)
      goto LABEL_5;
    v6 = self->_counterView;
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __58__SUUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_2;
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
      -[SUUICounterView insertSubview:aboveSubview:](self->_counterView, "insertSubview:aboveSubview:", self->_highlightImageView, v30[5]);
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
      v24[2] = __58__SUUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_3;
      v24[3] = &unk_2511F47C0;
      v25 = v20;
      v23 = v20;
      objc_msgSend(v22, "setCompletionBlock:", v24);
      -[SUUIImageView setAlpha:](v23, "setAlpha:", 0.0);
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");

    }
  }
}

void __58__SUUICounterCollectionViewCell__reloadHighlightImageView__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

void __58__SUUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

uint64_t __58__SUUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightImageView, 0);
  objc_storeStrong((id *)&self->_counterView, 0);
}

@end
