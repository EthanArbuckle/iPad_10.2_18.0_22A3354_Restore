@implementation AKAuthorizationPaneContext

- (AKAuthorizationPaneContext)initWithPaneViewController:(id)a3 stackView:(id)a4
{
  id v7;
  id v8;
  AKAuthorizationPaneContext *v9;
  AKAuthorizationPaneContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationPaneContext;
  v9 = -[AKAuthorizationPaneContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paneViewController, a3);
    objc_storeStrong((id *)&v10->_stackView, a4);
  }

  return v10;
}

- (AKAuthorizationPaneContext)initWithPaneViewController:(id)a3 stackView:(id)a4 mutableConstraints:(id)a5
{
  id v9;
  AKAuthorizationPaneContext *v10;
  AKAuthorizationPaneContext *v11;

  v9 = a5;
  v10 = -[AKAuthorizationPaneContext initWithPaneViewController:stackView:](self, "initWithPaneViewController:stackView:", a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_internalMutableConstraints, a5);

  return v11;
}

- (NSMutableArray)mutableConstraints
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[AKAuthorizationPaneContext internalMutableConstraints](self, "internalMutableConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[AKAuthorizationPaneContext paneViewController](self, "paneViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mutableConstraints");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSMutableArray *)v5;
}

- (void)addSubPane:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AKAuthorizationPaneContext stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addToStackView:context:", v5, self);

  -[AKAuthorizationPaneContext mutableConstraints](self, "mutableConstraints");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addToConstraints:context:", v6, self);

}

- (void)addEmptyViewWithSpacing:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[AKAuthorizationPaneContext stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addArrangedSubview:", v7);

  -[AKAuthorizationPaneContext stackView](self, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCustomSpacing:afterView:", v7, a3);

}

- (AKAuthorizationPaneViewController)paneViewController
{
  return self->_paneViewController;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (NSMutableArray)internalMutableConstraints
{
  return self->_internalMutableConstraints;
}

- (void)setInternalMutableConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_internalMutableConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalMutableConstraints, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_paneViewController, 0);
}

@end
