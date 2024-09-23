@implementation SFPinnedOverflowItemView

- (SFPinnedOverflowItemView)initWithFrame:(CGRect)a3
{
  SFPinnedOverflowItemView *v3;
  SFPinnedOverflowItemView *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFPinnedOverflowItemView *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFPinnedOverflowItemView;
  v3 = -[SFUnifiedBarItemView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFUnifiedBarItemView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward.2"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithImage:", v7);

    objc_msgSend(v8, "setAutoresizingMask:", 18);
    objc_msgSend(v8, "setContentMode:", 4);
    objc_msgSend(v5, "bounds");
    objc_msgSend(v8, "setFrame:");
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredSymbolConfiguration:", v9);

    objc_msgSend(v5, "addSubview:", v8);
    -[SFPinnedOverflowItemView setShowsMenuAsPrimaryAction:](v4, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPinnedOverflowItemView setTintColor:](v4, "setTintColor:", v10);

    -[UIView sf_applyContentSizeCategoryLimitsForToolbarButton](v4, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    v11 = v4;

  }
  return v4;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFPinnedOverflowItemView;
  -[SFPinnedOverflowItemView contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v7, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, a3, a4, a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "pinnedOverflowItemViewWillShowMenu:", self);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id WeakRetained;
  id v10;
  _QWORD v11[4];
  id v12;
  SFPinnedOverflowItemView *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFPinnedOverflowItemView;
  v8 = a5;
  -[SFPinnedOverflowItemView contextMenuInteraction:willEndForConfiguration:animator:](&v14, sel_contextMenuInteraction_willEndForConfiguration_animator_, a3, a4, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__SFPinnedOverflowItemView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v11[3] = &unk_1E21E2258;
  v12 = WeakRetained;
  v13 = self;
  v10 = WeakRetained;
  objc_msgSend(v8, "addCompletion:", v11);

}

uint64_t __84__SFPinnedOverflowItemView_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "pinnedOverflowItemViewDidHideMenu:", *(_QWORD *)(a1 + 40));
  return result;
}

- (SFPinnedOverflowMenuVisibilityDelegate)delegate
{
  return (SFPinnedOverflowMenuVisibilityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
