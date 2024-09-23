@implementation CKAutoloopMovieReplyPreviewBalloonView

- (CKAutoloopMovieReplyPreviewBalloonView)initWithFrame:(CGRect)a3
{
  CKAutoloopMovieReplyPreviewBalloonView *v3;
  CKAutoloopMovieReplyPreviewBalloonView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKAutoloopMovieReplyPreviewBalloonView;
  v3 = -[CKAutoloopMovieBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
  v5.super_class = (Class)CKAutoloopMovieReplyPreviewBalloonView;
  -[CKAutoloopMovieBalloonView layoutSubviews](&v5, sel_layoutSubviews);
  -[CKAutoloopMovieBalloonView muteButton](self, "muteButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replyPreviewBalloonAlpha");
  -[CKAutoloopMovieReplyPreviewBalloonView setAlpha:](self, "setAlpha:");

}

- (void)prepareForDisplay
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKAutoloopMovieReplyPreviewBalloonView;
  -[CKAutoloopMovieBalloonView prepareForDisplay](&v4, sel_prepareForDisplay);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replyPreviewBalloonAlpha");
  -[CKAutoloopMovieReplyPreviewBalloonView setAlpha:](self, "setAlpha:");

}

@end
