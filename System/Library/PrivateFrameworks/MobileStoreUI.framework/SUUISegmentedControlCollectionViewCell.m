@implementation SUUISegmentedControlCollectionViewCell

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
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
  id v7;
  id v8;
  id v9;
  SUUIDividerView *bottomDividerView;
  SUUISegmentedControlViewElementController *elementController;
  _QWORD v12[4];
  id v13;
  id v14;
  SUUISegmentedControlCollectionViewCell *v15;

  v7 = a3;
  v8 = a5;
  -[SUUISegmentedControlViewElementController viewElement](self->_elementController, "viewElement");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    -[SUUISegmentedControlViewElementController reloadAfterDocumentUpdate](self->_elementController, "reloadAfterDocumentUpdate");
  }
  else
  {
    bottomDividerView = self->_bottomDividerView;
    self->_bottomDividerView = 0;

    elementController = self->_elementController;
    self->_elementController = 0;

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __78__SUUISegmentedControlCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
    v12[3] = &unk_2511F6630;
    v13 = v7;
    v14 = v8;
    v15 = self;
    -[SUUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v12);

  }
}

void __78__SUUISegmentedControlCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SUUISegmentedControlViewElementController *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "addReusableViewWithReuseIdentifier:", 0x25120BCA8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.588235294, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setTintColor:", v6);
  v7 = -[SUUISegmentedControlViewElementController initWithViewElement:segmentedControl:]([SUUISegmentedControlViewElementController alloc], "initWithViewElement:segmentedControl:", *(_QWORD *)(a1 + 32), v3);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(v8 + 832);
  *(_QWORD *)(v8 + 832) = v7;

  v10 = *(void **)(*(_QWORD *)(a1 + 48) + 832);
  objc_msgSend(*(id *)(a1 + 40), "clientContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClientContext:", v11);

  v12 = *(void **)(*(_QWORD *)(a1 + 48) + 832);
  objc_msgSend(*(id *)(a1 + 40), "parentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setParentViewController:", v13);

  objc_msgSend(*(id *)(a1 + 32), "bottomDivider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v18, "addDividerWithElement:context:", v14, *(_QWORD *)(a1 + 40));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(v16 + 824);
    *(_QWORD *)(v16 + 824) = v15;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 824), "setDividerOrientation:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 824), "setDividerSize:", 0.0);
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  double v26;
  CGFloat v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SUUISegmentedControlCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v28, sel_layoutSubviews);
  -[SUUISegmentedControlCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SUUIViewReuseCollectionViewCell contentInset](self, "contentInset");
  v13 = v5 + v12;
  v15 = v7 + v14;
  v17 = v9 - (v12 + v16);
  v19 = v11 - (v14 + v18);
  -[SUUISegmentedControlViewElementController segmentedControlView](self->_elementController, "segmentedControlView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFits:", v17, v19);
  v22 = v21;
  v24 = v23;
  *(float *)&v21 = v13 + (v17 - v21) * 0.5;
  *(float *)&v23 = v15 + (v19 - v23) * 0.5;
  objc_msgSend(v20, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(floorf(*(float *)&v21), floorf(*(float *)&v23), v22, v24, v5, v7, v9, v11));
  if (self->_bottomDividerView)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    v27 = 1.0 / v26;

    -[SUUIDividerView setFrame:](self->_bottomDividerView, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(0.0, v11 - v27, v9, v27, v5, v7, v9, v11));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementController, 0);
  objc_storeStrong((id *)&self->_bottomDividerView, 0);
}

@end
