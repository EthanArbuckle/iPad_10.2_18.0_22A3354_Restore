@implementation PKDrawingPaletteInputAssistantContainerView

- (PKDrawingPaletteInputAssistantContainerView)initWithFrame:(CGRect)a3
{
  PKDrawingPaletteInputAssistantContainerView *v3;
  uint64_t v4;
  PKPaletteButton *UCBbutton;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PKDrawingPaletteInputAssistantContainerView;
  v3 = -[PKDrawingPaletteInputAssistantContainerView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[PKPaletteButton UCBButton](PKPaletteButton, "UCBButton");
    v4 = objc_claimAutoreleasedReturnValue();
    UCBbutton = v3->_UCBbutton;
    v3->_UCBbutton = (PKPaletteButton *)v4;

    -[PKPaletteButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_UCBbutton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKDrawingPaletteInputAssistantContainerView addSubview:](v3, "addSubview:", v3->_UCBbutton);
    v16 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteButton topAnchor](v3->_UCBbutton, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantContainerView topAnchor](v3, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v18;
    -[PKPaletteButton bottomAnchor](v3->_UCBbutton, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantContainerView bottomAnchor](v3, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v7;
    -[PKPaletteButton leadingAnchor](v3->_UCBbutton, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantContainerView leadingAnchor](v3, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v10;
    -[PKPaletteButton trailingAnchor](v3->_UCBbutton, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantContainerView trailingAnchor](v3, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v14);

  }
  return v3;
}

- (PKPaletteButton)UCBbutton
{
  return self->_UCBbutton;
}

- (void)setUCBbutton:(id)a3
{
  objc_storeStrong((id *)&self->_UCBbutton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UCBbutton, 0);
}

@end
