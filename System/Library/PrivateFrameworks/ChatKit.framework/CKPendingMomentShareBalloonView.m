@implementation CKPendingMomentShareBalloonView

- (char)color
{
  return -1;
}

- (char)balloonStyle
{
  return 0;
}

- (id)attachmentView
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a4, a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentBalloonSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)canUseOpaqueMask
{
  return 0;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  CKBalloonDescriptor_t *result;
  objc_super v5;

  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v5.receiver = self;
  v5.super_class = (Class)CKPendingMomentShareBalloonView;
  result = (CKBalloonDescriptor_t *)-[CKBalloonDescriptor_t balloonDescriptor](&v5, sel_balloonDescriptor);
  retstr->var4 = -1;
  retstr->var1 = 0;
  return result;
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKPendingMomentShareBalloonView;
  -[CKAttachmentBalloonView prepareForDisplay](&v7, sel_prepareForDisplay);
  -[CKPendingMomentShareBalloonView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShadowOffset:", 0.0, 7.0);

  -[CKPendingMomentShareBalloonView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1045220557;
  objc_msgSend(v4, "setShadowOpacity:", v5);

  -[CKPendingMomentShareBalloonView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowRadius:", 27.0);

}

@end
