@implementation CKAnimatedImageView

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationTimerObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKAnimatedImageView;
  -[CKAnimatedImageView dealloc](&v4, sel_dealloc);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAnimatedImageView;
  -[CKAnimatedImageView didMoveToWindow](&v3, sel_didMoveToWindow);
  if (-[CKAnimatedImageView automaticallyObserveWindowForAnimationTimer](self, "automaticallyObserveWindowForAnimationTimer"))
  {
    -[CKAnimatedImageView updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
  }
}

- (void)setAnimatedImage:(id)a3
{
  CKAnimatedImage *v5;
  void *v6;
  void *v7;
  CKAnimatedImage *v8;

  v5 = (CKAnimatedImage *)a3;
  if (self->_animatedImage != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_animatedImage, a3);
    -[CKAnimatedImage frames](self->_animatedImage, "frames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAnimatedImageView setFrames:](self, "setFrames:", v6);
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v6, "objectAtIndex:", 0);
    else
      -[CKAnimatedImage image](v8, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAnimatedImageView setImage:](self, "setImage:", v7);

    -[CKAnimatedImageView updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
    v5 = v8;
  }

}

- (void)updateAnimationTimerObserving
{
  void *v3;
  void *v4;
  id v5;

  -[CKAnimatedImageView frames](self, "frames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {

    goto LABEL_5;
  }
  -[CKAnimatedImageView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_5:
    +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAnimationTimerObserver:", self);
    goto LABEL_6;
  }
  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAnimationTimerObserver:", self);
LABEL_6:

}

- (void)animationTimerFired:(double)a3
{
  id v4;

  -[CKAnimatedImage frameForAnimationTime:](self->_animatedImage, "frameForAnimationTime:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKAnimatedImageView setImage:](self, "setImage:", v4);

}

- (CKAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (BOOL)automaticallyObserveWindowForAnimationTimer
{
  return self->_automaticallyObserveWindowForAnimationTimer;
}

- (void)setAutomaticallyObserveWindowForAnimationTimer:(BOOL)a3
{
  self->_automaticallyObserveWindowForAnimationTimer = a3;
}

- (BOOL)userExplicitlyUnpausedAnimation
{
  return self->_userExplicitlyUnpausedAnimation;
}

- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3
{
  self->_userExplicitlyUnpausedAnimation = a3;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);
}

@end
