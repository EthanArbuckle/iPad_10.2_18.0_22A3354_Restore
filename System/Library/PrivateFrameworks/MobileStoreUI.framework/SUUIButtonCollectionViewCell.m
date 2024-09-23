@implementation SUUIButtonCollectionViewCell

- (void)dealloc
{
  objc_super v3;

  -[UIControl removeTarget:action:forControlEvents:](self->_button, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUUIButtonCollectionViewCell;
  -[SUUIViewReuseCollectionViewCell dealloc](&v3, sel_dealloc);
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return objc_msgSend(a5, "prefetchResourcesForViewElement:reason:", a3, a4);
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
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  v9 = objc_msgSend(v12, "elementType");
  if (v9 == 141 || v9 == 12)
  {
    objc_msgSend(a1, "_attributedStringWithButton:context:", v12, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "labelLayoutCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestLayoutForButton:attributedString:width:", v12, v10, (uint64_t)a4);

  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a5, "sizeForViewElement:width:", a4);
  v7 = a3;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id buttonImageResourceCacheKey;
  IKViewElementStyle *v15;
  IKViewElementStyle *viewElementStyle;
  SUUIBuyButtonDescriptor *v17;
  SUUIBuyButtonDescriptor *buyButtonDescriptor;
  UIControl *button;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  SUUIButtonCollectionViewCell *v26;
  id v27;
  double v28;

  v9 = a3;
  v10 = a5;
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __68__SUUIButtonCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v24 = &unk_2511F4AC8;
  v11 = v9;
  v25 = v11;
  v26 = self;
  v28 = a4;
  v12 = v10;
  v27 = v12;
  -[SUUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", &v21);
  objc_msgSend(v12, "imageResourceCacheKeyForViewElement:", v11, v21, v22, v23, v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  buttonImageResourceCacheKey = self->_buttonImageResourceCacheKey;
  self->_buttonImageResourceCacheKey = v13;

  objc_msgSend(v11, "style");
  v15 = (IKViewElementStyle *)objc_claimAutoreleasedReturnValue();
  viewElementStyle = self->_viewElementStyle;
  self->_viewElementStyle = v15;

  objc_msgSend(v11, "buyButtonDescriptor");
  v17 = (SUUIBuyButtonDescriptor *)objc_claimAutoreleasedReturnValue();
  buyButtonDescriptor = self->_buyButtonDescriptor;
  self->_buyButtonDescriptor = v17;

  objc_storeStrong((id *)&self->_viewElement, a3);
  if (-[SUUIButtonCollectionViewCell _usesBackgroundWithAlpha](self, "_usesBackgroundWithAlpha"))
  {
    button = self->_button;
    if (button)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIControl setBackgroundColor:](button, "setBackgroundColor:", v20);

    }
  }

}

void __68__SUUIButtonCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "elementType");
  if (v3 == 12 || v3 == 141 || v3 == 50)
  {
    objc_msgSend(v7, "addButtonWithElement:width:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 824);
    *(_QWORD *)(v5 + 824) = v4;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 824), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel__buttonAction_, 64);
  }

}

- (void)setBackgroundColor:(id)a3
{
  UIControl *button;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIButtonCollectionViewCell;
  -[SUUIViewReuseCollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, a3);
  if (-[SUUIButtonCollectionViewCell _usesBackgroundWithAlpha](self, "_usesBackgroundWithAlpha"))
  {
    button = self->_button;
    if (button)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIControl setBackgroundColor:](button, "setBackgroundColor:", v5);

    }
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a5, "requestIdentifierForResourceCacheKey:", self->_buttonImageResourceCacheKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (v11 = objc_msgSend(v9, "requestIdentifier"), v11 == objc_msgSend(v10, "unsignedIntegerValue")))
  {
    -[UIControl imageView](self->_button, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v8);

    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _BOOL4 v10;
  UIControl *button;
  SUUIBuyButtonDescriptor *buyButtonDescriptor;
  void *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = -[SUUIBuyButtonDescriptor canPersonalizeUsingItemState:](self->_buyButtonDescriptor, "canPersonalizeUsingItemState:", v8);
  if (v10)
  {
    button = self->_button;
    buyButtonDescriptor = self->_buyButtonDescriptor;
    objc_msgSend(v9, "clientContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIControl setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:](button, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", buyButtonDescriptor, v8, v13, v5);

  }
  return v10;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
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
  double v12;
  IKViewElementStyle *v13;
  unint64_t v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  double v23;
  float v24;
  objc_super v25;
  CGRect v26;

  v25.receiver = self;
  v25.super_class = (Class)SUUIButtonCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v25, sel_layoutSubviews);
  if (self->_button)
  {
    -[SUUIButtonCollectionViewCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    -[SUUIViewReuseCollectionViewCell contentInset](self, "contentInset");
    v9 = v8;
    v11 = v10;
    v12 = v5 - v8 - v10;
    v13 = self->_viewElementStyle;
    v14 = -[IKViewElementStyle textAlignment](v13, "textAlignment");
    if (!v14)
      v14 = -[IKViewElementStyle elementAlignment](v13, "elementAlignment");
    v15 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
    -[UIControl sizeThatFits:](self->_button, "sizeThatFits:", v12, 1.79769313e308);
    v26.size.width = v17;
    v19 = v18;
    v26.origin.x = v15;
    v26.origin.y = v16;
    v26.size.height = v19;
    +[SUUIViewElementLayoutContext itemWidthForElement:withDefaultWidth:fitWidth:](SUUIViewElementLayoutContext, "itemWidthForElement:withDefaultWidth:fitWidth:", self->_viewElement, CGRectGetWidth(v26), v12);
    if (v20 >= v12)
      v21 = v12;
    else
      v21 = v20;
    v22 = (v7 - v19) * 0.5;
    v23 = floorf(v22);
    if (v14 <= 5)
    {
      if (((1 << v14) & 0x35) != 0)
      {
        v24 = (v5 - v21) * 0.5;
        v15 = floorf(v24);
      }
      else if (v14 == 1)
      {
        v15 = v9;
      }
      else
      {
        v15 = v5 - v11 - v21;
      }
    }
    -[UIControl setFrame:](self->_button, "setFrame:", v15, v23);

  }
}

- (void)_buttonAction:(id)a3
{
  void *v4;
  char v5;
  SUUIButtonViewElement *viewElement;
  void *v7;
  id v8;

  SUUICollectionViewForView(self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  viewElement = self->_viewElement;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v8, "indexPathForCell:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v8, viewElement, 0, v7);

  }
  else
  {
    -[SUUIButtonViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_viewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
  }

}

+ (id)_attributedStringWithButton:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "buttonTitleStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "style");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  SUUIViewElementFontWithStyle(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = SUUIViewElementAlignmentForStyle(v10);
  if (v14)
    v15 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v14);
  else
    v15 = 0;
  objc_msgSend(v5, "buttonText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v11, v13, v15, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)_usesBackgroundWithAlpha
{
  void *v2;
  int v3;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v5 = 0.0;
  v6 = 0;
  -[SUUIButtonCollectionViewCell backgroundColor](self, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getHue:saturation:brightness:alpha:", &v8, &v7, &v6, &v5);

  return v3 && v5 < 1.0 && v5 != 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElementStyle, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptor, 0);
  objc_storeStrong(&self->_buttonImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
