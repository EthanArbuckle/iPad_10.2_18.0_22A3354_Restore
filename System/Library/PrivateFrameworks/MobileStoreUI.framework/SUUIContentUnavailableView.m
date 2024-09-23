@implementation SUUIContentUnavailableView

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v7 = a3;
  v8 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__SUUIContentUnavailableView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_2511F4A28;
  v9 = v8;
  v13 = &v15;
  v14 = a4;
  v12 = v9;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v11);
  LOBYTE(a4) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

uint64_t __77__SUUIContentUnavailableView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "prefetchResourcesForViewElement:reason:", a2, *(_QWORD *)(a1 + 48));
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a5;
  objc_msgSend(v8, "labelLayoutCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "_attributedStringWithTitleLabel:context:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestLayoutForLabel:attributedString:width:", v10, v11, (uint64_t)a4);

  }
  objc_msgSend(v16, "messageLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "_attributedStringWithMessageLabel:context:", v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestLayoutForLabel:attributedString:width:", v12, v13, (uint64_t)a4);

  }
  objc_msgSend(v16, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(a1, "_attributedStringWithButton:context:", v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestLayoutForButton:attributedString:width:", v14, v15, (uint64_t)a4);

  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  double *v11;
  BOOL v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  double v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  const char *v30;
  double v31;
  uint64_t v32;
  CGSize result;

  v7 = a4;
  v8 = a5;
  v27 = 0;
  v28 = (double *)&v27;
  v29 = 0x3010000000;
  v30 = "";
  v31 = a3;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__SUUIContentUnavailableView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v18[3] = &unk_2511F7DB0;
  v9 = v8;
  v22 = a3;
  v19 = v9;
  v20 = &v23;
  v21 = &v27;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v18);
  v10 = v24[3];
  v11 = v28;
  v12 = v10 <= 1;
  v13 = v10 - 1;
  if (v12)
  {
    v14 = v28[5];
  }
  else
  {
    v14 = v28[5] + (float)((float)v13 * 35.0);
    v28[5] = v14;
  }
  v15 = v11[4];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  v16 = v15;
  v17 = v14;
  result.height = v17;
  result.width = v16;
  return result;
}

double __68__SUUIContentUnavailableView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", a2, *(double *)(a1 + 56));
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = v4 + *(double *)(v3 + 40);
  *(double *)(v3 + 40) = result;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  UIControl *button;
  SUUIButtonViewElement *buttonElement;
  SUUIImageViewElement *imageElement;
  SUUIImageView *imageView;
  SUUIAttributedStringView *messageView;
  SUUIAttributedStringView *titleView;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  double v21;

  v8 = a3;
  v9 = a5;
  button = self->_button;
  self->_button = 0;

  buttonElement = self->_buttonElement;
  self->_buttonElement = 0;

  imageElement = self->_imageElement;
  self->_imageElement = 0;

  imageView = self->_imageView;
  self->_imageView = 0;

  messageView = self->_messageView;
  self->_messageView = 0;

  titleView = self->_titleView;
  self->_titleView = 0;

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __66__SUUIContentUnavailableView_reloadWithViewElement_width_context___block_invoke;
  v18[3] = &unk_2511F4AC8;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v21 = a4;
  v16 = v9;
  v17 = v8;
  -[SUUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v18);

}

void __66__SUUIContentUnavailableView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a2;
  objc_msgSend(*(id *)(a1 + 40), "image");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 488);
  *(_QWORD *)(v4 + 488) = v3;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 488);
  if (v6)
  {
    objc_msgSend(v25, "addImageViewWithElement:context:", v6, *(_QWORD *)(a1 + 48));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 480);
    *(_QWORD *)(v8 + 480) = v7;

  }
  objc_msgSend(*(id *)(a1 + 40), "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v25, "addLabelViewWithElement:width:context:", v10, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 504);
    *(_QWORD *)(v12 + 504) = v11;

  }
  objc_msgSend(*(id *)(a1 + 40), "messageLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v25, "addLabelViewWithElement:width:context:", v14, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 496);
    *(_QWORD *)(v16 + 496) = v15;

  }
  objc_msgSend(*(id *)(a1 + 40), "button");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 440);
  *(_QWORD *)(v19 + 440) = v18;

  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440);
  if (v21)
  {
    objc_msgSend(v25, "addButtonWithElement:width:context:", v21, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 432);
    *(_QWORD *)(v23 + 432) = v22;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__buttonAction_, 64);
  }

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIContentUnavailableView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (self->_imageElement
    && (objc_msgSend(v10, "requestIdentifierForViewElement:"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "unsignedIntegerValue"),
        v14 = objc_msgSend(v9, "requestIdentifier"),
        v12,
        v13 == v14))
  {
    -[SUUIImageView setImage:](self->_imageView, "setImage:", v8);
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[10];
  __int128 v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v30 = *MEMORY[0x24BDAC8D0];
  -[SUUIContentUnavailableView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUIViewReuseView allExistingViews](self, "allExistingViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v12 = v8 - self->_contentInset.left - self->_contentInset.right;
    v26 = (char *)&v25 + 8;
    v27 = 0x2020000000;
    v28 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __44__SUUIContentUnavailableView_layoutSubviews__block_invoke;
    v24[3] = &unk_2511F7DD8;
    *(double *)&v24[6] = floorf(v12);
    v24[7] = v4;
    v24[8] = v6;
    *(double *)&v24[9] = v8;
    v25 = v10;
    v24[4] = self;
    v24[5] = (char *)&v25 + 8;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v24);
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    CGRectGetHeight(v31);
    -[SUUIContentUnavailableView _baselineOffsetForView:](self, "_baselineOffsetForView:", v13);
    if (v14)
    {
      objc_msgSend(v14, "frame");
      CGRectGetHeight(v32);
      -[SUUIContentUnavailableView _baselineOffsetForView:](self, "_baselineOffsetForView:", v14);
    }
    objc_msgSend(v14, "frame");
    CGRectGetMaxY(v33);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v19, "frame", (_QWORD)v20);
          objc_msgSend(v19, "setFrame:");
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      }
      while (v16);
    }

    _Block_object_dispose((char *)&v25 + 8, 8);
  }

}

void __44__SUUIContentUnavailableView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double MaxY;
  id v15;
  CGRect v16;

  v15 = a2;
  objc_msgSend(v15, "frame");
  objc_msgSend(v15, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
  v6 = v5;
  v8 = v7;
  *(float *)&v5 = (*(double *)(a1 + 72) - v5) * 0.5;
  v9 = floorf(*(float *)&v5);
  v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_firstBaselineOffsetForView:", v15);
    *(float *)&v11 = v10 + 35.0 - v11;
    v10 = floorf(*(float *)&v11);
  }
  objc_msgSend(v15, "setFrame:", v9, v10, v6, v8);
  objc_msgSend(*(id *)(a1 + 32), "_baselineOffsetForView:", v15);
  if (v12 <= 0.00000011920929)
  {
    v16.origin.x = v9;
    v16.origin.y = v10;
    v16.size.width = v6;
    v16.size.height = v8;
    MaxY = CGRectGetMaxY(v16);
  }
  else
  {
    v13 = v10 + v12;
    MaxY = floorf(v13);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = MaxY;

}

- (void)_buttonAction:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  SUUIButtonViewElement *buttonElement;
  void *v8;
  id v9;

  SUUICollectionViewCellForView(self);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  SUUICollectionViewForView(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  buttonElement = self->_buttonElement;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "indexPathForCell:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v4, buttonElement, 0, v8);

  }
  else
  {
    -[SUUIButtonViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](buttonElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
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
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = SUUIViewElementAlignmentForStyle(v10);
  if (v14)
    v15 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v14);
  else
    v15 = 1;
  objc_msgSend(v5, "buttonText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v11, v13, v15, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_attributedStringWithMessageLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = SUUIViewElementAlignmentForStyle(v7);
  if (v11)
    v12 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v11);
  else
    v12 = 1;
  objc_msgSend(v5, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v8, v10, v12, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_attributedStringWithTitleLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 27.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = SUUIViewElementAlignmentForStyle(v7);
  if (v11)
    v12 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v11);
  else
    v12 = 1;
  objc_msgSend(v5, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v8, v10, v12, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)_baselineOffsetForView:(id)a3
{
  UIControl *button;
  UIControl *v5;
  double v6;
  double v7;

  button = (UIControl *)a3;
  v5 = button;
  if ((UIControl *)self->_messageView == button || (UIControl *)self->_titleView == button)
    goto LABEL_6;
  v6 = 0.0;
  if (self->_button == button)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      button = self->_button;
LABEL_6:
      -[UIControl baselineOffset](button, "baselineOffset");
      v6 = v7;
    }
  }

  return v6;
}

- (double)_firstBaselineOffsetForView:(id)a3
{
  UIControl *button;
  UIControl *v5;
  double v6;
  double v7;

  button = (UIControl *)a3;
  v5 = button;
  if ((UIControl *)self->_messageView == button || (UIControl *)self->_titleView == button)
    goto LABEL_6;
  v6 = 0.0;
  if (self->_button == button)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      button = self->_button;
LABEL_6:
      -[UIControl firstBaselineOffset](button, "firstBaselineOffset");
      v6 = v7;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_imageElement, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_buttonElement, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
