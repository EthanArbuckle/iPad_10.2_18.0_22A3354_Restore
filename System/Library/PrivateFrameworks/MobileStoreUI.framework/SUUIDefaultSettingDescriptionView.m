@implementation SUUIDefaultSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  __objc2_class **v10;
  char v11;

  v7 = a5;
  objc_msgSend(a3, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "lockupViewType");
  v10 = off_2511F3160;
  if (v9 != 8)
    v10 = off_2511F2D08;
  v11 = -[__objc2_class prefetchResourcesForViewElement:reason:context:](*v10, "prefetchResourcesForViewElement:reason:context:", v8, a4, v7);

  return v11;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
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

+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  uint64_t v8;
  __objc2_class **v9;
  id v10;

  v7 = a5;
  objc_msgSend(a3, "viewElement");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "lockupViewType");
  v9 = off_2511F3160;
  if (v8 != 8)
    v9 = off_2511F2D08;
  -[__objc2_class requestLayoutForViewElement:width:context:](*v9, "requestLayoutForViewElement:width:context:", v10, v7, a4);

}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  __objc2_class **v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v8 = a5;
  objc_msgSend(a4, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lockupViewType");
  v11 = off_2511F3160;
  if (v10 != 8)
    v11 = off_2511F2D08;
  -[__objc2_class sizeThatFitsWidth:viewElement:context:](*v11, "sizeThatFitsWidth:viewElement:context:", v9, v8, a3);
  v13 = v12;
  v15 = v14;

  objc_msgSend(v9, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_paddingForStyle:", v16);
  v19 = v15 + v17 + v18;

  v20 = v13;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (BOOL)hasDisclosureChevron
{
  return self->_hasDisclosureChevron;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  void *v9;
  SUUIViewReuseView *viewReuseView;
  SUUIViewReuseView *v11;
  SUUIViewReuseView *v12;
  id v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  SUUIDefaultSettingDescriptionView *v24;
  id v25;
  double v26;

  v8 = a5;
  objc_msgSend(a3, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  viewReuseView = self->_viewReuseView;
  if (!viewReuseView)
  {
    v11 = objc_alloc_init(SUUIViewReuseView);
    v12 = self->_viewReuseView;
    self->_viewReuseView = v11;

    -[SUUIDefaultSettingDescriptionView addSubview:](self, "addSubview:", self->_viewReuseView);
    viewReuseView = self->_viewReuseView;
  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __80__SUUIDefaultSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v22[3] = &unk_2511F4AC8;
  v23 = v9;
  v24 = self;
  v26 = a4;
  v25 = v8;
  v13 = v8;
  v21 = v9;
  -[SUUIViewReuseView modifyUsingBlock:](viewReuseView, "modifyUsingBlock:", v22);
  objc_msgSend(v21, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_paddingForStyle:", v14);
  self->_padding.top = v15;
  self->_padding.left = v16;
  self->_padding.bottom = v17;
  self->_padding.right = v18;
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDefaultSettingDescriptionView setBackgroundColor:](self, "setBackgroundColor:", v19);

  objc_msgSend(v21, "firstChildForElementType:", 29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasDisclosureChevron = v20 != 0;

}

void __80__SUUIDefaultSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(double *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)*((_QWORD *)a1 + 4);
  v4 = a2;
  v5 = objc_msgSend(v3, "lockupViewType");
  v6 = *((_QWORD *)a1 + 4);
  v7 = a1[7];
  v8 = *((_QWORD *)a1 + 6);
  if (v5 == 8)
    objc_msgSend(v4, "addTabularLockupWithElement:width:context:", v6, v8, v7);
  else
    objc_msgSend(v4, "addHorizontalLockupWithElement:width:context:", v6, v8, v7);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *((_QWORD *)a1 + 5);
  v11 = *(void **)(v10 + 488);
  *(_QWORD *)(v10 + 488) = v9;

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[UIView conformsToProtocol:](self->_viewElementView, "conformsToProtocol:", &unk_2571AB4A8))
    v11 = -[UIView setImage:forArtworkRequest:context:](self->_viewElementView, "setImage:forArtworkRequest:context:", v8, v9, v10);
  else
    v11 = 0;

  return v11;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  UIView *viewElementView;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)SUUIDefaultSettingDescriptionView;
  -[SUUIDefaultSettingDescriptionView layoutSubviews](&v19, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceLayoutDirection");

  -[SUUIDefaultSettingDescriptionView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SUUISettingDescriptionView layoutMargins](self, "layoutMargins");
  if (v4)
    v15 = v14;
  else
    v15 = v13;
  if (v4)
    v16 = v13;
  else
    v16 = v14;
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  v17 = CGRectGetWidth(v20) - v15 - v16;
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  -[SUUIViewReuseView setFrame:](self->_viewReuseView, "setFrame:", v15, 0.0, v17, CGRectGetHeight(v21));
  viewElementView = self->_viewElementView;
  -[SUUIViewReuseView bounds](self->_viewReuseView, "bounds");
  -[UIView setFrame:](viewElementView, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIDefaultSettingDescriptionView;
  v4 = a3;
  -[SUUIDefaultSettingDescriptionView setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[UIView setBackgroundColor:](self->_viewElementView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);

}

+ (UIEdgeInsets)_paddingForStyle:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  char v7;
  UIEdgeInsets result;

  v7 = 0;
  v3 = SUUIViewElementPaddingForStyle(a3, &v7);
  if (!v7)
  {
    v3 = *MEMORY[0x24BEBE158];
    v4 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v5 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v6 = *(double *)(MEMORY[0x24BEBE158] + 24);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewReuseView, 0);
  objc_storeStrong((id *)&self->_viewElementView, 0);
}

@end
