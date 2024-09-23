@implementation CKBackgroundDecorationView

- (CKBackgroundDecorationView)initWithFrame:(CGRect)a3
{
  CKBackgroundDecorationView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKBackgroundDecorationView;
  v3 = -[CKBackgroundDecorationView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detailsAttachmentsDecorationViewBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBackgroundDecorationView setBackgroundColor:](v3, "setBackgroundColor:", v6);

    -[CKBackgroundDecorationView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 10.0);

  }
  return v3;
}

@end
