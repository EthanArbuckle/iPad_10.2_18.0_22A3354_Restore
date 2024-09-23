@implementation CKUnavailableMomentShareBalloonView

- (CKUnavailableMomentShareBalloonView)initWithFrame:(CGRect)a3
{
  CKUnavailableMomentShareBalloonView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKUnavailableMomentShareBalloonView;
  v3 = -[CKMomentShareStatusBalloonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel_handleTap_);
    -[CKUnavailableMomentShareBalloonView addGestureRecognizer:](v3, "addGestureRecognizer:", v4);

  }
  return v3;
}

+ (id)_secondaryLabelString
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CKUnavailableMomentShareBalloonViewMessage_IOS"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)handleTap:(id)a3
{
  id v4;

  -[CKBalloonView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didTapUnavailableMomentShareBalloonView:", self);

}

@end
