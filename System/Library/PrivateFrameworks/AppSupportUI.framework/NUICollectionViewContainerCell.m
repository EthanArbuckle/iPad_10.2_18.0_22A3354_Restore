@implementation NUICollectionViewContainerCell

+ (Class)containerViewClass
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("-[%@ %@] not implemented."), v6, v7);

  return 0;
}

- (NUICollectionViewContainerCell)initWithFrame:(CGRect)a3
{
  NUICollectionViewContainerCell *v3;
  NUICollectionViewContainerCell *v4;
  uint64_t v5;
  NUIContainerView *containerView;
  NUIContainerView *v7;
  _QWORD v9[4];
  NUICollectionViewContainerCell *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NUICollectionViewContainerCell;
  v3 = -[NUICollectionViewContainerCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NUICollectionViewContainerCell contentView](v3, "contentView");
    v5 = objc_claimAutoreleasedReturnValue();
    containerView = v4->_containerView;
    v4->_containerView = (NUIContainerView *)v5;

    -[UIView setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:](v4->_containerView, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);
    -[NUIContainerView setLayoutMarginsRelativeArrangement:](v4->_containerView, "setLayoutMarginsRelativeArrangement:", 1);
    v7 = v4->_containerView;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__NUICollectionViewContainerCell_initWithFrame___block_invoke;
    v9[3] = &unk_1E57C68F0;
    v10 = v4;
    -[NUIContainerView performBatchUpdates:](v7, "performBatchUpdates:", v9);

  }
  return v4;
}

uint64_t __48__NUICollectionViewContainerCell_initWithFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containerViewDidLoad");
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width;
  double height;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  if (a4 > 50.0)
    width = a3.width;
  else
    width = 0.0;
  if (a5 > 50.0)
    height = a3.height;
  else
    height = 0.0;
  -[NUICollectionViewContainerCell containerView](self, "containerView", a3.width, a3.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NUICollectionViewContainerCell containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (NUIContainerView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
