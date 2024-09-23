@implementation CKPhotoStackReplyPreviewBalloonView

- (double)stackCornerRadius
{
  return 5.0;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKPhotoStackReplyPreviewBalloonView;
  -[CKStaticPhotoStackBalloonView layoutSubviews](&v4, sel_layoutSubviews);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replyPreviewBalloonAlpha");
  -[CKPhotoStackReplyPreviewBalloonView setAlpha:](self, "setAlpha:");

}

@end
