@implementation CKEmojiBalloonView

- (CKEmojiBalloonView)initWithFrame:(CGRect)a3
{
  CKEmojiBalloonView *v3;
  CKEmojiBalloonView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKEmojiBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKEmojiBalloonView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[CKEmojiBalloonView setContentMode:](v4, "setContentMode:", 5);
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  int v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKEmojiBalloonView;
  -[CKImageBalloonView layoutSubviews](&v18, sel_layoutSubviews);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balloonMaskTailSizeForTailShape:", 1);
  v5 = v4;
  if (CKMainScreenScale_once_28 != -1)
    dispatch_once(&CKMainScreenScale_once_28, &__block_literal_global_60);
  v6 = *(double *)&CKMainScreenScale_sMainScreenScale_28;

  v7 = -[CKBalloonView orientation](self, "orientation");
  if (CKMainScreenScale_once_28 != -1)
    dispatch_once(&CKMainScreenScale_once_28, &__block_literal_global_60);
  v8 = *(double *)&CKMainScreenScale_sMainScreenScale_28;
  -[CKEmojiBalloonView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  memset(&v17, 0, sizeof(v17));
  if (v9)
    objc_msgSend(v9, "contentsTransform");
  v11 = 1.0;
  if (v8 == 0.0)
    v12 = 1.0;
  else
    v12 = v8;
  if (v6 != 0.0)
    v11 = v6;
  v13 = floor(v5 * 0.5 * v11) / v11;
  v14 = -floor(v13 * 1.5 * v12) / v12;
  if (v7)
    v13 = -v13;
  v15 = v17;
  CGAffineTransformTranslate(&v16, &v15, v13, v14);
  objc_msgSend(v10, "setContentsTransform:", &v16);

}

- (void)setOrientation:(char)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = a3;
  if (-[CKBalloonView orientation](self, "orientation") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKEmojiBalloonView;
    -[CKBalloonView setOrientation:](&v5, sel_setOrientation_, v3);
    -[CKEmojiBalloonView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  -[CKImageBalloonView animatedImage](self, "animatedImage", a4, a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = self;
  objc_msgSend(v5, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "balloonMaskTailSizeForTailShape:", 1);
  v14 = v13;
  if (CKMainScreenScale_once_28 != -1)
    dispatch_once(&CKMainScreenScale_once_28, &__block_literal_global_60);
  v15 = *(double *)&CKMainScreenScale_sMainScreenScale_28;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_28 == 0.0)
    v15 = 1.0;
  v16 = floor(v14 * 0.5 * v15) / v15;

  v17 = v9 - v16;
  v18 = v11 + v16 * -3.0;
  result.height = v18;
  result.width = v17;
  return result;
}

@end
