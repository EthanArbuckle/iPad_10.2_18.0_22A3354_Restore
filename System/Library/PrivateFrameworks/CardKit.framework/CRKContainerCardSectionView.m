@implementation CRKContainerCardSectionView

+ (CGSize)sizeThatFitsCardSection:(id)a3 boundingSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CRKContainerCardSectionView)initWithFrame:(CGRect)a3
{
  CRKContainerCardSectionView *v3;
  void *v4;
  uint64_t v5;
  NSString *cardSectionViewIdentifier;
  id v7;
  uint64_t v8;
  UIView *userInputEventInterceptView;
  UIView *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CRKContainerCardSectionView;
  v3 = -[CRKContainerCardSectionView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    cardSectionViewIdentifier = v3->_cardSectionViewIdentifier;
    v3->_cardSectionViewIdentifier = (NSString *)v5;

    v7 = objc_alloc(MEMORY[0x24BDF6F90]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    userInputEventInterceptView = v3->_userInputEventInterceptView;
    v3->_userInputEventInterceptView = (UIView *)v8;

    -[UIView setUserInteractionEnabled:](v3->_userInputEventInterceptView, "setUserInteractionEnabled:", 1);
    v10 = v3->_userInputEventInterceptView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[UIView layer](v3->_userInputEventInterceptView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsHitTesting:", 1);

    -[UIView layer](v3->_userInputEventInterceptView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHitTestsAsOpaque:", 1);

    -[CRKContainerCardSectionView addSubview:](v3, "addSubview:", v3->_userInputEventInterceptView);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double height;

  if (self->_contentView)
    -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", result.width, result.height);
  else
    height = self->_contentSize.height;
  result.height = height;
  return result;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  UIView *v7;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[CRKContainerCardSectionView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_contentView, 0);
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  UIView *contentView;
  UIView *userInputEventInterceptView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRKContainerCardSectionView;
  -[CRKContainerCardSectionView layoutSubviews](&v5, sel_layoutSubviews);
  contentView = self->_contentView;
  -[CRKContainerCardSectionView bounds](self, "bounds");
  -[UIView setFrame:](contentView, "setFrame:");
  userInputEventInterceptView = self->_userInputEventInterceptView;
  -[CRKContainerCardSectionView bounds](self, "bounds");
  -[UIView setFrame:](userInputEventInterceptView, "setFrame:");
}

- (void)removeFromComposedSuperview
{
  id v3;

  -[CRKContainerCardSectionView composedSuperview](self, "composedSuperview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSectionSubviewWantsToBeRemovedFromHierarchy:", self);

}

- (void)setInterceptsTouches:(BOOL)a3
{
  -[UIView setHidden:](self->_userInputEventInterceptView, "setHidden:", !a3);
}

- (BOOL)interceptsTouches
{
  return !-[UIView isHidden](self->_userInputEventInterceptView, "isHidden");
}

- (CRKComposableView)composedSuperview
{
  return (CRKComposableView *)objc_loadWeakRetained((id *)&self->_composedSuperview);
}

- (void)setComposedSuperview:(id)a3
{
  objc_storeWeak((id *)&self->_composedSuperview, a3);
}

- (NSString)cardSectionViewIdentifier
{
  return self->_cardSectionViewIdentifier;
}

- (void)setCardSectionViewIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_cardSectionViewIdentifier, 0);
  objc_destroyWeak((id *)&self->_composedSuperview);
  objc_storeStrong((id *)&self->_userInputEventInterceptView, 0);
}

@end
