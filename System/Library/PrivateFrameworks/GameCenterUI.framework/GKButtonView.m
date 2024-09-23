@implementation GKButtonView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (void)registerSupplementaryViewClassesForKind:(id)a3 withCollectionView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "_gkRegisterClass:forSupplementaryViewOfKind:", objc_opt_class(), v6);

}

- (GKButtonView)initWithFrame:(CGRect)a3
{
  GKButtonView *v3;
  GKButton *v4;
  uint64_t v5;
  UIButton *button;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKButtonView;
  v3 = -[GKButtonView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [GKButton alloc];
    v5 = -[GKButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    button = v3->_button;
    v3->_button = (UIButton *)v5;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v3->_button, "addTarget:action:forControlEvents:", v3, sel_buttonPressed_, 64);
    -[GKButtonView addSubview:](v3, "addSubview:", v3->_button);
  }
  return v3;
}

- (void)updateConstraints
{
  void *v3;
  NSMutableArray *buttonConstraints;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKButtonView;
  -[GKButtonView updateConstraints](&v8, sel_updateConstraints);
  if (self->_buttonConstraints)
    -[GKButtonView removeConstraints:](self, "removeConstraints:");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKButtonView setButtonConstraints:](self, "setButtonConstraints:", v3);

  buttonConstraints = self->_buttonConstraints;
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredXInView:", self->_button, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](buttonConstraints, "addObject:", v5);

  v6 = self->_buttonConstraints;
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredYInView:", self->_button, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v6, "addObject:", v7);

  -[GKButtonView addConstraints:](self, "addConstraints:", self->_buttonConstraints);
}

- (void)applyLayoutAttributes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKButtonView setDataSource:](self, "setDataSource:", v4);

  }
}

- (void)buttonPressed:(id)a3
{
  id v4;

  if (self->_action)
  {
    -[GKCollectionViewDataSource targetForAction:](self->_dataSource, "targetForAction:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(id, SEL))objc_msgSend(v4, "methodForSelector:", self->_action))(v4, self->_action);

  }
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (NSMutableArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_buttonConstraints, a3);
}

- (GKCollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
