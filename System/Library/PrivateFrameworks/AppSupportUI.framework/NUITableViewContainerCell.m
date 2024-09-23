@implementation NUITableViewContainerCell

- (NUIContainerView)containerView
{
  return self->_containerView;
}

uint64_t __59__NUITableViewContainerCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containerViewDidLoad");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NUITableViewContainerCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  if (width >= v8)
    v9 = v8;
  else
    v9 = width;
  -[NUIContainerView effectiveLayoutSizeFittingSize:](self->_containerView, "effectiveLayoutSizeFittingSize:", v9, height);
  result.height = v11;
  result.width = v10;
  return result;
}

- (NUITableViewContainerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NUITableViewContainerCell *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NUIContainerView *containerView;
  void *v9;
  NUIContainerView *v10;
  _QWORD v12[4];
  NUITableViewContainerCell *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NUITableViewContainerCell;
  v4 = -[NUITableViewContainerCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "containerViewClass"));
    -[NUITableViewContainerCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = objc_msgSend(v5, "initWithFrame:");
    containerView = v4->_containerView;
    v4->_containerView = (NUIContainerView *)v7;

    -[NUIContainerView setPreservesSuperviewLayoutMargins:](v4->_containerView, "setPreservesSuperviewLayoutMargins:", 1);
    -[NUIContainerView setLayoutMarginsRelativeArrangement:](v4->_containerView, "setLayoutMarginsRelativeArrangement:", 1);
    -[NUIContainerView setAutoresizingMask:](v4->_containerView, "setAutoresizingMask:", 18);
    -[NUITableViewContainerCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_containerView);

    -[UIView setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:](v4->_containerView, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);
    v10 = v4->_containerView;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__NUITableViewContainerCell_initWithStyle_reuseIdentifier___block_invoke;
    v12[3] = &unk_1E57C68F0;
    v13 = v4;
    -[NUIContainerView performBatchUpdates:](v10, "performBatchUpdates:", v12);

  }
  return v4;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  if (a4 <= 50.0)
    a3.width = 0.0;
  if (a5 <= 50.0)
    a3.height = 0.0;
  v7.receiver = self;
  v7.super_class = (Class)NUITableViewContainerCell;
  -[NUITableViewContainerCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v7, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
}

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

@end
