@implementation FIUIAnimatingSpriteImageView

- (FIUIAnimatingSpriteImageView)initWithFrame:(CGRect)a3
{
  FIUIAnimatingSpriteImageView *v3;
  FIUIAnimatingSpriteImageView *v4;
  CALayer *v5;
  CALayer *imageLayer;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FIUIAnimatingSpriteImageView;
  v3 = -[FIUIAnimatingSpriteImageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[FIUIAnimatingSpriteImageView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v4->_framesPerSecond = 60;
    v5 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    imageLayer = v4->_imageLayer;
    v4->_imageLayer = v5;

    -[FIUIAnimatingSpriteImageView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v4->_imageLayer);

    v4->_shouldResumeAnimating = 0;
  }
  return v4;
}

- (void)setSpriteImage:(id)a3
{
  UIImage *v4;
  UIImage *spriteImage;
  UIImage *v6;
  UIImage *v7;

  v4 = (UIImage *)a3;
  -[FIUIAnimatingSpriteImageView stopAnimatingFinishingCycle:](self, "stopAnimatingFinishingCycle:", 0);
  spriteImage = self->_spriteImage;
  self->_spriteImage = v4;
  v6 = v4;

  v7 = objc_retainAutorelease(v6);
  -[CALayer setContents:](self->_imageLayer, "setContents:", -[UIImage CGImage](v7, "CGImage"));

  -[FIUIAnimatingSpriteImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSpriteFrameCount:(int64_t)a3
{
  self->_spriteFrameCount = a3;
}

- (void)setSpriteColumnCount:(int64_t)a3
{
  self->_spriteColumnCount = a3;
}

- (void)setFramesPerSecond:(unint64_t)a3
{
  self->_framesPerSecond = a3;
}

- (UIImage)spriteImage
{
  return self->_spriteImage;
}

- (void)startAnimating
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGPoint v13;

  v5 = a1;
  v13.x = a2;
  v13.y = a3;
  NSStringFromCGPoint(v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_21307C000, v7, v8, "In startAnimating, centerPointValues does not contain CGPoint %@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteImage, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[UIImage size](self->_spriteImage, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[CALayer setFrame:](self->_imageLayer, "setFrame:", v3, v4, v6, v8);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (BOOL)isAnimating
{
  void *v2;
  BOOL v3;

  -[CALayer animationForKey:](self->_imageLayer, "animationForKey:", CFSTR("PositionKeyframeAnimation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CGSize)_spriteFrameSize
{
  UIImage *spriteImage;
  int64_t spriteFrameCount;
  int64_t spriteColumnCount;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  spriteImage = self->_spriteImage;
  if (spriteImage)
  {
    spriteFrameCount = self->_spriteFrameCount;
    spriteColumnCount = self->_spriteColumnCount;
    if (spriteFrameCount % spriteColumnCount)
      v6 = spriteFrameCount / spriteColumnCount + 1;
    else
      v6 = spriteFrameCount / spriteColumnCount;
    -[UIImage size](spriteImage, "size");
    v8 = v7 / (double)self->_spriteColumnCount;
    -[UIImage size](self->_spriteImage, "size");
    v10 = v9 / (double)v6;
  }
  else
  {
    v8 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  if (a3 && self->_shouldResumeAnimating)
    -[FIUIAnimatingSpriteImageView resumeAnimating](self, "resumeAnimating");
  else
    -[FIUIAnimatingSpriteImageView pauseAnimating](self, "pauseAnimating");
}

- (id)_centerPointValues
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[FIUIAnimatingSpriteImageView _spriteFrameSize](self, "_spriteFrameSize");
  -[UIImage size](self->_spriteImage, "size");
  if (self->_spriteFrameCount >= 1)
  {
    v4 = 0;
    do
    {
      v5 = (void *)MEMORY[0x24BDD1968];
      UIRectGetCenter();
      objc_msgSend(v5, "valueWithCGPoint:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v4;
    }
    while (v4 < self->_spriteFrameCount);
  }
  return v3;
}

+ (unint64_t)_findSpriteIndex:(CGPoint)a3 centerPoints:(id)a4
{
  double y;
  double x;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;

  y = a3.y;
  x = a3.x;
  v6 = (void *)MEMORY[0x24BDD1968];
  v7 = a4;
  objc_msgSend(v6, "valueWithCGPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  return v9;
}

+ (id)_createNewSpriteArray:(id)a3 currentFrame:(unint64_t)a4 arraySize:(unint64_t)a5 interrupted:(BOOL)a6
{
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = v9;
  if (a5 - 1 == a4)
  {
    v11 = v9;
  }
  else
  {
    v12 = ~a4 + a5;
    v13 = a4 + 1;
    objc_msgSend(v9, "subarrayWithRange:", a4 + 1, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a6)
    {
      objc_msgSend(v10, "subarrayWithRange:", 0, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = v14;
    }

  }
  return v11;
}

- (void)stopAnimatingFinishingCycle:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  self->_shouldResumeAnimating = 0;
  if (a3
    && (-[CALayer presentationLayer](self->_imageLayer, "presentationLayer"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[CALayer presentationLayer](self->_imageLayer, "presentationLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "position");
    v7 = v6;
    v9 = v8;

    -[FIUIAnimatingSpriteImageView _centerPointValues](self, "_centerPointValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[FIUIAnimatingSpriteImageView _findSpriteIndex:centerPoints:](FIUIAnimatingSpriteImageView, "_findSpriteIndex:centerPoints:", v10, v7, v9);

    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x24BDD3078];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
        -[FIUIAnimatingSpriteImageView stopAnimatingFinishingCycle:].cold.1(v12, v7, v9);
    }
    else
    {
      -[FIUIAnimatingSpriteImageView _centerPointValues](self, "_centerPointValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      -[CALayer removeAnimationForKey:](self->_imageLayer, "removeAnimationForKey:", CFSTR("PositionKeyframeAnimation"));
      if (v11 != v14 - 1)
      {
        -[FIUIAnimatingSpriteImageView _centerPointValues](self, "_centerPointValues");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[FIUIAnimatingSpriteImageView _createNewSpriteArray:currentFrame:arraySize:interrupted:](FIUIAnimatingSpriteImageView, "_createNewSpriteArray:currentFrame:arraySize:interrupted:", v15, v11, v14, 0);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        _PositionAnimation(v17, (double)(unint64_t)objc_msgSend(v17, "count") / (double)self->_framesPerSecond, 0.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[FIUIAnimatingSpriteImageView _addAnimation:forKey:](self, "_addAnimation:forKey:", v16, CFSTR("PositionKeyframeAnimation"));

      }
    }
  }
  else
  {
    -[CALayer removeAnimationForKey:](self->_imageLayer, "removeAnimationForKey:", CFSTR("PositionKeyframeAnimation"));
  }
}

- (void)animateOnce
{
  void *v3;
  void *v4;
  id v5;

  if (-[FIUIAnimatingSpriteImageView isAnimating](self, "isAnimating"))
    -[CALayer removeAnimationForKey:](self->_imageLayer, "removeAnimationForKey:", CFSTR("PositionKeyframeAnimation"));
  -[FIUIAnimatingSpriteImageView _centerPointValues](self, "_centerPointValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _PositionAnimation(v5, (double)self->_spriteFrameCount / (double)self->_framesPerSecond, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIAnimatingSpriteImageView _addAnimation:forKey:](self, "_addAnimation:forKey:", v3, CFSTR("PositionKeyframeAnimation"));

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  objc_msgSend(v5, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGPointValue");
  -[CALayer setPosition:](self->_imageLayer, "setPosition:");

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)pauseAnimating
{
  if (-[FIUIAnimatingSpriteImageView isAnimating](self, "isAnimating"))
    +[FIUIAnimatingSpriteImageView _pauseLayer:](FIUIAnimatingSpriteImageView, "_pauseLayer:", self->_imageLayer);
}

- (void)resumeAnimating
{
  if (-[FIUIAnimatingSpriteImageView isAnimating](self, "isAnimating"))
    +[FIUIAnimatingSpriteImageView _resumeLayer:](FIUIAnimatingSpriteImageView, "_resumeLayer:", self->_imageLayer);
  else
    -[FIUIAnimatingSpriteImageView startAnimating](self, "startAnimating");
}

- (void)_addAnimation:(id)a3 forKey:(id)a4
{
  CALayer *imageLayer;
  id v7;
  id v8;

  imageLayer = self->_imageLayer;
  v7 = a4;
  v8 = a3;
  +[FIUIAnimatingSpriteImageView _resetLayer:](FIUIAnimatingSpriteImageView, "_resetLayer:", imageLayer);
  -[CALayer addAnimation:forKey:](self->_imageLayer, "addAnimation:forKey:", v8, v7);

}

+ (void)_pauseLayer:(id)a3
{
  double v3;
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v4 = v3;
  LODWORD(v3) = 0;
  objc_msgSend(v5, "setSpeed:", v3);
  objc_msgSend(v5, "setTimeOffset:", v4);

}

+ (void)_resumeLayer:(id)a3
{
  double v3;
  double v4;
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "timeOffset");
  v4 = v3;
  LODWORD(v3) = 1.0;
  objc_msgSend(v6, "setSpeed:", v3);
  objc_msgSend(v6, "setTimeOffset:", 0.0);
  objc_msgSend(v6, "setBeginTime:", 0.0);
  objc_msgSend(v6, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  objc_msgSend(v6, "setBeginTime:", v5 - v4);

}

+ (void)_resetLayer:(id)a3
{
  double v3;
  id v4;

  v4 = a3;
  LODWORD(v3) = 1.0;
  objc_msgSend(v4, "setSpeed:", v3);
  objc_msgSend(v4, "setTimeOffset:", 0.0);
  objc_msgSend(v4, "setBeginTime:", 0.0);

}

- (int64_t)spriteFrameCount
{
  return self->_spriteFrameCount;
}

- (int64_t)spriteColumnCount
{
  return self->_spriteColumnCount;
}

- (unint64_t)framesPerSecond
{
  return self->_framesPerSecond;
}

- (void)stopAnimatingFinishingCycle:(CGFloat)a3 .cold.1(void *a1, CGFloat a2, CGFloat a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGPoint v13;

  v5 = a1;
  v13.x = a2;
  v13.y = a3;
  NSStringFromCGPoint(v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_21307C000, v7, v8, "In stopAnimatingFinishingCycle, centerPointValues does not contain CGPoint %@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
