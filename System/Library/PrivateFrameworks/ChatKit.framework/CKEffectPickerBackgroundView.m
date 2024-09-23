@implementation CKEffectPickerBackgroundView

- (CKEffectPickerBackgroundView)initWithFrame:(CGRect)a3
{
  CKEffectPickerBackgroundView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKEffectPickerBackgroundView;
  v3 = -[CKEffectPickerBackgroundView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    -[CKEffectPickerBackgroundView setEffectView:](v3, "setEffectView:", v4);

    -[CKEffectPickerBackgroundView effectView](v3, "effectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKEffectPickerBackgroundView effectView](v3, "effectView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectPickerBackgroundView insertSubview:atIndex:](v3, "insertSubview:atIndex:", v6, 0);

    -[CKEffectPickerBackgroundView effectView](v3, "effectView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__ck_makeEdgesEqualTo:", v3);

  }
  return v3;
}

- (void)setBackgroundColorForTranscriptType:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerBackgroundView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chromeEffectForInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerBackgroundView effectView](self, "effectView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEffect:", v5);

}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
