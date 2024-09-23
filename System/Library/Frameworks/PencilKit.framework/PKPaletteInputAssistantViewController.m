@implementation PKPaletteInputAssistantViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaletteInputAssistantViewController;
  -[PKPaletteInputAssistantViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PKPaletteInputAssistantViewController _updateUI](self, "_updateUI");
}

- (void)setInputAssistantView:(id)a3
{
  PKDrawingPaletteInputAssistantView *v5;
  PKDrawingPaletteInputAssistantView *inputAssistantView;
  PKDrawingPaletteInputAssistantView *v7;

  v5 = (PKDrawingPaletteInputAssistantView *)a3;
  inputAssistantView = self->_inputAssistantView;
  if (inputAssistantView != v5)
  {
    v7 = v5;
    -[PKDrawingPaletteInputAssistantView removeViewStateObserver:](inputAssistantView, "removeViewStateObserver:", self);
    objc_storeStrong((id *)&self->_inputAssistantView, a3);
    -[PKDrawingPaletteInputAssistantView addViewStateObserver:](self->_inputAssistantView, "addViewStateObserver:", self);
    -[PKPaletteInputAssistantViewController _updateUI](self, "_updateUI");
    v5 = v7;
  }

}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  -[PKPaletteInputAssistantViewController inputAssistantView](self, "inputAssistantView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteInputAssistantViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[PKPaletteInputAssistantViewController inputAssistantView](self, "inputAssistantView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[PKPaletteInputAssistantViewController inputAssistantView](self, "inputAssistantView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PKPaletteInputAssistantViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteInputAssistantViewController inputAssistantView](self, "inputAssistantView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[PKPaletteInputAssistantViewController view](self, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteInputAssistantViewController inputAssistantView](self, "inputAssistantView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteInputAssistantViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "safeAreaLayoutGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 12.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v29;
    -[PKPaletteInputAssistantViewController inputAssistantView](self, "inputAssistantView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteInputAssistantViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "safeAreaLayoutGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, -12.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v23;
    -[PKPaletteInputAssistantViewController inputAssistantView](self, "inputAssistantView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteInputAssistantViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "safeAreaLayoutGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v10, 12.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v11;
    -[PKPaletteInputAssistantViewController inputAssistantView](self, "inputAssistantView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteInputAssistantViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeAreaLayoutGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v16, -12.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addConstraints:", v18);

  }
  -[PKPaletteInputAssistantViewController _preferredContentSize](self, "_preferredContentSize");
  -[PKPaletteInputAssistantViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (CGSize)_preferredContentSize
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[PKPaletteInputAssistantViewController inputAssistantView](self, "inputAssistantView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasInputAssistantItems");

  if (v4)
  {
    -[PKPaletteInputAssistantViewController inputAssistantView](self, "inputAssistantView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
    v7 = v6;
    v9 = v8;

    v10 = fmin(v7 + 24.0, 320.0);
    v11 = fmin(v9 + 24.0, 60.0);
  }
  else
  {
    v10 = 60.0;
    v11 = 60.0;
  }
  result.height = v11;
  result.width = v10;
  return result;
}

- (PKDrawingPaletteInputAssistantView)inputAssistantView
{
  return self->_inputAssistantView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAssistantView, 0);
}

@end
