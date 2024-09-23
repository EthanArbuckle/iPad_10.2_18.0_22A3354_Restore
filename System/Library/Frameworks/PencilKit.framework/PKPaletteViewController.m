@implementation PKPaletteViewController

- (void)viewDidLoad
{
  PKDrawingPaletteView *v3;
  PKDrawingPaletteView *paletteView;
  PKPaletteHostView *v5;
  PKPaletteHostView *hostView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PKPaletteViewController;
  -[PKPaletteViewController viewDidLoad](&v26, sel_viewDidLoad);
  v3 = objc_alloc_init(PKDrawingPaletteView);
  paletteView = self->_paletteView;
  self->_paletteView = v3;

  -[PKPaletteView setDraggingEnabled:](self->_paletteView, "setDraggingEnabled:", 0);
  -[PKPaletteView setPalettePopoverPresentingController:](self->_paletteView, "setPalettePopoverPresentingController:", self);
  v5 = -[PKPaletteHostView initWithPaletteView:]([PKPaletteHostView alloc], "initWithPaletteView:", self->_paletteView);
  hostView = self->_hostView;
  self->_hostView = v5;

  -[PKPaletteHostView setPaletteViewBottomEdgeSpacing:](self->_hostView, "setPaletteViewBottomEdgeSpacing:", 0.0);
  -[PKPaletteHostView setTranslatesAutoresizingMaskIntoConstraints:](self->_hostView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKPaletteViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_hostView);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteHostView centerXAnchor](self->_hostView, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  -[PKPaletteHostView centerYAnchor](self->_hostView, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerYAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v17;
  -[PKPaletteHostView widthAnchor](self->_hostView, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v10;
  -[PKPaletteHostView heightAnchor](self->_hostView, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v15);

  -[PKPaletteHostView setPaletteVisible:animated:completion:](self->_hostView, "setPaletteVisible:animated:completion:", 1, 0, 0);
}

- (PKPaletteHostView)paletteHostView
{
  return self->_hostView;
}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaletteViewController;
  -[PKPaletteViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "paletteViewControllerViewDidAppear:", self);

}

- (PKPaletteViewControllerDelegate)delegate
{
  return (PKPaletteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKDrawingPaletteView)paletteView
{
  return self->_paletteView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostView, 0);
}

@end
