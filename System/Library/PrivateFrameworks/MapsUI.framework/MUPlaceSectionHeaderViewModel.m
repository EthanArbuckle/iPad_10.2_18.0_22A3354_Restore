@implementation MUPlaceSectionHeaderViewModel

- (MUPlaceSectionHeaderViewModel)initWithTitleString:(id)a3
{
  return -[MUPlaceSectionHeaderViewModel initWithTitleString:showSeeMore:](self, "initWithTitleString:showSeeMore:", a3, 1);
}

- (MUPlaceSectionHeaderViewModel)initWithTitleString:(id)a3 showSeeMore:(BOOL)a4
{
  return -[MUPlaceSectionHeaderViewModel initWithTitleString:subtitleString:showSeeMore:](self, "initWithTitleString:subtitleString:showSeeMore:", a3, &stru_1E2E05448, a4);
}

- (MUPlaceSectionHeaderViewModel)initWithTitleString:(id)a3 subtitleString:(id)a4 showSeeMore:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  MUPlaceSectionHeaderViewModel *v11;
  MUPlaceSectionHeaderViewModel *v12;
  uint64_t v13;
  NSString *seeMoreButtonText;
  objc_super v16;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MUPlaceSectionHeaderViewModel;
  v11 = -[MUPlaceSectionHeaderViewModel init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_titleString, a3);
    objc_storeStrong((id *)&v12->_subtitleString, a4);
    if (v5)
    {
      _MULocalizedStringFromThisBundle(CFSTR("More [Placecard Section Header]"));
      v13 = objc_claimAutoreleasedReturnValue();
      seeMoreButtonText = v12->_seeMoreButtonText;
      v12->_seeMoreButtonText = (NSString *)v13;

    }
  }

  return v12;
}

- (void)setTarget:(id)a3 selector:(SEL)a4
{
  objc_storeWeak(&self->_target, a3);
  self->_selector = a4;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)subtitleString
{
  return self->_subtitleString;
}

- (NSString)seeMoreButtonText
{
  return self->_seeMoreButtonText;
}

- (void)setSeeMoreButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_seeMoreButtonText, a3);
}

- (UIMenu)seeMoreButtonMenu
{
  return self->_seeMoreButtonMenu;
}

- (void)setSeeMoreButtonMenu:(id)a3
{
  objc_storeStrong((id *)&self->_seeMoreButtonMenu, a3);
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)selector
{
  return self->_selector;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_seeMoreButtonMenu, 0);
  objc_storeStrong((id *)&self->_seeMoreButtonText, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

+ (id)viewModelForTitle:(id)a3 attribution:(id)a4 target:(id)a5 action:(SEL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  MUPlaceSectionHeaderViewModel *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "attributionURLs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "count"))
  {

    goto LABEL_5;
  }
  objc_msgSend(v10, "providerName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (!v14)
  {
LABEL_5:
    v15 = -[MUPlaceSectionHeaderViewModel initWithTitleString:showSeeMore:]([MUPlaceSectionHeaderViewModel alloc], "initWithTitleString:showSeeMore:", v9, 0);
    goto LABEL_6;
  }
  v15 = -[MUPlaceSectionHeaderViewModel initWithTitleString:]([MUPlaceSectionHeaderViewModel alloc], "initWithTitleString:", v9);
  v16 = (void *)MEMORY[0x1E0CB3940];
  _MULocalizedStringFromThisBundle(CFSTR("Open <provider> [Placecard]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "providerName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionHeaderViewModel setSeeMoreButtonText:](v15, "setSeeMoreButtonText:", v19);

  -[MUPlaceSectionHeaderViewModel setTarget:selector:](v15, "setTarget:selector:", v11, a6);
LABEL_6:

  return v15;
}

@end
