@implementation CKImageReplyPreviewBalloonView

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8[5];
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKImageReplyPreviewBalloonView;
  -[CKImageBalloonView configureForMessagePart:](&v9, sel_configureForMessagePart_, v4);
  if (v4)
    objc_msgSend(v4, "balloonDescriptor");
  else
    memset(v8, 0, sizeof(v8));
  -[CKBalloonView setBalloonDescriptor:](self, "setBalloonDescriptor:", v8);
  objc_msgSend(v4, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewMaxWidth");
  -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v5, objc_msgSend(v4, "balloonOrientation"), v7);

}

- (CKImageReplyPreviewBalloonView)initWithFrame:(CGRect)a3
{
  CKImageReplyPreviewBalloonView *v3;
  CKImageReplyPreviewBalloonView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKImageReplyPreviewBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKBalloonView doubleTapGestureRecognizer](v3, "doubleTapGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKImageReplyPreviewBalloonView;
  -[CKImageBalloonView layoutSubviews](&v5, sel_layoutSubviews);
  -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replyPreviewBalloonAlpha");
  -[CKImageReplyPreviewBalloonView setAlpha:](self, "setAlpha:");

}

- (void)prepareForDisplay
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKImageReplyPreviewBalloonView;
  -[CKImageBalloonView prepareForDisplay](&v4, sel_prepareForDisplay);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replyPreviewBalloonAlpha");
  -[CKImageReplyPreviewBalloonView setAlpha:](self, "setAlpha:");

}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGSize result;

  v20.receiver = self;
  v20.super_class = (Class)CKImageReplyPreviewBalloonView;
  -[CKImageBalloonView sizeThatFits:textAlignmentInsets:](&v20, sel_sizeThatFits_textAlignmentInsets_, a4, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textBalloonMinHeight");
  v10 = v9;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "replyPreviewBalloonMinWidth");
  v13 = v12;

  if (v13 < v5 || v10 < v7)
  {
    v15 = v13 / v5;
    v16 = 0.0;
    if (v5 == 0.0)
      v15 = 0.0;
    if (v7 != 0.0)
      v16 = v10 / v7;
    v17 = fmax(v15, v16);
    v13 = ceil(v5 * v17);
    v10 = ceil(v7 * v17);
  }
  v18 = v13;
  v19 = v10;
  result.height = v19;
  result.width = v18;
  return result;
}

@end
