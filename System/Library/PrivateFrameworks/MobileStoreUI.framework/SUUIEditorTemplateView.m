@implementation SUUIEditorTemplateView

- (SUUIEditorTemplateView)initWithFrame:(CGRect)a3
{
  SUUIEditorTemplateView *v3;
  SUUIEditorTemplateView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorTemplateView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SUUIEditorTemplateView _reloadSubviews](v3, "_reloadSubviews");
  return v4;
}

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
  double v5;
  double v6;
  CGSize result;

  v5 = *MEMORY[0x24BDBF148];
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v6;
  UITextView *textView;
  void *v8;
  void *v9;
  void *v10;
  UITextView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  char v28;

  v6 = a3;
  textView = self->_textView;
  -[SUUIEditorTemplateView _textFromViewElement:](self, "_textFromViewElement:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setText:](textView, "setText:", v8);

  objc_msgSend(v6, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_textView;
  if (v10)
  {
    -[UITextView setFont:](self->_textView, "setFont:", v10);
  }
  else
  {
    SUUIFontPreferredFontForTextStyle(1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v11, "setFont:", v12);

  }
  objc_msgSend(v9, "ikColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_textColor, v15);
  if (!v14)

  -[UITextView setTextColor:](self->_textView, "setTextColor:", self->_textColor);
  v28 = 0;
  objc_msgSend(v6, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = SUUIViewElementPaddingForStyle(v16, &v28);
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = 15.0;
  v25 = 18.0;
  if (v28)
    v26 = v17;
  else
    v26 = 18.0;
  if (v28)
    v27 = v19;
  else
    v27 = 15.0;
  if (v28)
  {
    v25 = v21;
    v24 = v23;
  }
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", v26, v27, v25, v24);
  -[UITextView setContentOffset:](self->_textView, "setContentOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

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

- (void)textViewDidChange:(id)a3
{
  SUUIEditorTemplateViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "didChangeTextInEditorTemplateView:", self);

  }
}

- (void)layoutSubviews
{
  UITextView *textView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIEditorTemplateView;
  -[SUUIEditorTemplateView layoutSubviews](&v5, sel_layoutSubviews);
  textView = self->_textView;
  -[SUUIEditorTemplateView bounds](self, "bounds");
  -[UITextView setFrame:](textView, "setFrame:");
  if (self->_disabled)
  {
    -[UIColor colorWithAlphaComponent:](self->_textColor, "colorWithAlphaComponent:", 0.2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](self->_textView, "setTextColor:", v4);
    -[UITextView setEditable:](self->_textView, "setEditable:", 0);

  }
  else
  {
    -[UITextView setTextColor:](self->_textView, "setTextColor:", self->_textColor);
    -[UITextView setEditable:](self->_textView, "setEditable:", 1);
  }
}

- (void)setBottomInset:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[UITextView contentInset](self->_textView, "contentInset");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UITextView setContentInset:](self->_textView, "setContentInset:");
  -[UITextView setScrollIndicatorInsets:](self->_textView, "setScrollIndicatorInsets:", v6, v8, a3, v10);
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[SUUIEditorTemplateView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)text
{
  return -[UITextView text](self->_textView, "text");
}

- (void)_reloadSubviews
{
  id v3;
  UITextView *v4;
  UITextView *textView;
  void *v6;

  if (!self->_textView)
  {
    v3 = objc_alloc(MEMORY[0x24BEBDA88]);
    v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    textView = self->_textView;
    self->_textView = v4;

    -[UITextView setDelegate:](self->_textView, "setDelegate:", self);
    -[UITextView setKeyboardDismissMode:](self->_textView, "setKeyboardDismissMode:", 2);
    -[UITextView setAlwaysBounceVertical:](self->_textView, "setAlwaysBounceVertical:", 1);
    -[UITextView layoutManager](self->_textView, "layoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsNonContiguousLayout:", 0);

    -[SUUIEditorTemplateView addSubview:](self, "addSubview:", self->_textView);
  }
}

- (id)_textFromViewElement:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__SUUIEditorTemplateView__textFromViewElement___block_invoke;
  v9[3] = &unk_2511F46F8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateChildrenUsingBlock:", v9);

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __47__SUUIEditorTemplateView__textFromViewElement___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v6, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (SUUIEditorTemplateViewDelegate)delegate
{
  return (SUUIEditorTemplateViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end
