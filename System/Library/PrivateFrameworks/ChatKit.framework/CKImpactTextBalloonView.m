@implementation CKImpactTextBalloonView

- (CKImpactTextBalloonView)initWithFrame:(CGRect)a3
{
  CKImpactTextBalloonView *v3;
  CKImpactTextBalloonView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKImpactTextBalloonView;
  v3 = -[CKTextBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKImpactTextBalloonView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMinificationFilter:", *MEMORY[0x1E0CD2EF8]);

  }
  return v4;
}

@end
