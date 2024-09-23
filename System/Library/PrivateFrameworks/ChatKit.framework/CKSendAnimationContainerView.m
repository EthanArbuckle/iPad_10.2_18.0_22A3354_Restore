@implementation CKSendAnimationContainerView

- (CKSendAnimationContainerView)initWithFrame:(CGRect)a3
{
  CKSendAnimationContainerView *v3;
  CKGradientReferenceView *v4;
  CKGradientReferenceView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKSendAnimationContainerView;
  v3 = -[CKSendAnimationContainerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKGradientReferenceView alloc];
    -[CKSendAnimationContainerView bounds](v3, "bounds");
    v5 = -[CKGradientReferenceView initWithFrame:](v4, "initWithFrame:");
    -[CKGradientReferenceView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    -[CKSendAnimationContainerView setGradientReferenceView:](v3, "setGradientReferenceView:", v5);
    -[CKSendAnimationContainerView addSubview:](v3, "addSubview:", v5);

  }
  return v3;
}

- (CKGradientReferenceView)gradientReferenceView
{
  return self->_gradientReferenceView;
}

- (void)setGradientReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientReferenceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientReferenceView, 0);
}

@end
