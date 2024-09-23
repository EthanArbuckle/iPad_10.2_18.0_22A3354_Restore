@implementation ICAttributionHighlightView

- (ICAttributionHighlightView)initWithConfiguration:(id)a3
{
  id v5;
  ICAttributionHighlightView *v6;
  ICAttributionHighlightView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  objc_msgSend(v5, "adjustedFrame");
  v11.receiver = self;
  v11.super_class = (Class)ICAttributionHighlightView;
  v6 = -[ICAttributionHighlightView initWithFrame:](&v11, sel_initWithFrame_);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(v5, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttributionHighlightView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[ICAttributionHighlightView layer](v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 2.75);

    objc_msgSend(v5, "alpha");
    -[ICAttributionHighlightView setAlpha:](v7, "setAlpha:");
  }

  return v7;
}

- (ICAttributionViewHighlightConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
