@implementation CKDetonatedAttachmentBalloonView

- (CKDetonatedAttachmentBalloonView)initWithFrame:(CGRect)a3
{
  CKDetonatedAttachmentBalloonView *v3;
  CKDetonatedAttachmentView *v4;
  uint64_t v5;
  CKDetonatedAttachmentView *attachmentView;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKDetonatedAttachmentBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKDetonatedAttachmentView alloc];
    v5 = -[CKDetonatedAttachmentView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    attachmentView = v3->_attachmentView;
    v3->_attachmentView = (CKDetonatedAttachmentView *)v5;

    -[CKDetonatedAttachmentBalloonView addSubview:](v3, "addSubview:", v3->_attachmentView);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKColoredBalloonView setColor:](v3, "setColor:", objc_msgSend(v7, "attachmentBalloonFillColor"));

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "attachmentBalloonStrokeColor");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "theme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unfilledBalloonColorForColorType:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ckColor");
    -[CKBalloonView setStrokeColor:](v3, "setStrokeColor:");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "shouldFillAndStrokeAttachmentBalloon"))
      v14 = 2;
    else
      v14 = 1;
    -[CKBalloonView setBalloonStyle:](v3, "setBalloonStyle:", v14);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CKDetonatedAttachmentView *attachmentView;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKDetonatedAttachmentBalloonView;
  -[CKColoredBalloonView layoutSubviews](&v19, sel_layoutSubviews);
  -[CKDetonatedAttachmentBalloonView bounds](self, "bounds");
  -[CKDetonatedAttachmentBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKDetonatedAttachmentView sizeThatFits:](self->_attachmentView, "sizeThatFits:", v7, v9);
  -[CKDetonatedAttachmentView setFrame:](self->_attachmentView, "setFrame:", 0.0, 0.0, v11, v12);
  attachmentView = self->_attachmentView;
  -[CKDetonatedAttachmentView frame](attachmentView, "frame");
  v15 = v14;
  v17 = v16;
  if (CKMainScreenScale_once_93 != -1)
    dispatch_once(&CKMainScreenScale_once_93, &__block_literal_global_225);
  v18 = *(double *)&CKMainScreenScale_sMainScreenScale_93;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_93 == 0.0)
    v18 = 1.0;
  -[CKDetonatedAttachmentView setFrame:](attachmentView, "setFrame:", 1.0 / v18 * (v4 * v18 + floor((v8 * v18 - v15 * v18) * 0.5)), 1.0 / v18 * (v6 * v18 + floor((v10 * v18 - v17 * v18) * 0.5)), v15 * v18 * (1.0 / v18), v17 * v18 * (1.0 / v18));
}

- (UIEdgeInsets)alignmentRectInsets
{
  int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char v17;
  UIEdgeInsets result;

  v3 = -[CKBalloonView orientation](self, "orientation");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
  objc_msgSend(v4, "attachmentBalloonAlignmentRectInsetsWithTailShape:", v17);
  v8 = v7;
  v10 = v9;
  if (v3)
    v11 = v5;
  else
    v11 = v6;
  if (v3)
    v12 = v6;
  else
    v12 = v5;

  v13 = v8;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
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
  objc_msgSend(v4, "detonatedItemBalloonViewSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)overlayImage
{
  void *v2;
  void *v3;
  __int128 v5[5];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
  BYTE2(v6) = 0;
  v5[2] = v8;
  v5[3] = v9;
  v5[4] = v10;
  v5[0] = v6;
  v5[1] = v7;
  CKResizableBalloonMask(v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CKDetonatedAttachmentView)attachmentView
{
  return self->_attachmentView;
}

- (void)setAttachmentView:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentView, 0);
}

@end
