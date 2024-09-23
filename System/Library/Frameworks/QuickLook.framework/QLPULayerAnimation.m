@implementation QLPULayerAnimation

- (QLPULayerAnimation)init
{
  return -[QLPULayerAnimation initWithLayer:key:](self, "initWithLayer:key:", 0, 0);
}

- (QLPULayerAnimation)initWithLayer:(id)a3 key:(id)a4
{
  id v7;
  id v8;
  QLPULayerAnimation *v9;
  QLPULayerAnimation *v10;
  uint64_t v11;
  NSString *key;
  uint64_t v13;
  CAAnimation *animation;
  float v15;
  double v16;
  double v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)QLPULayerAnimation;
  v9 = -[QLPULayerAnimation init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layer, a3);
    v11 = objc_msgSend(v8, "copy");
    key = v10->_key;
    v10->_key = (NSString *)v11;

    objc_msgSend(v7, "animationForKey:", v10->_key);
    v13 = objc_claimAutoreleasedReturnValue();
    animation = v10->__animation;
    v10->__animation = (CAAnimation *)v13;

    -[CAAnimation speed](v10->__animation, "speed");
    v10->_speed = v15;
    -[CAAnimation timeOffset](v10->__animation, "timeOffset");
    v10->_timeOffset = v16;
    -[CAAnimation beginTime](v10->__animation, "beginTime");
    v10->_beginTime = v17;
    v10->_isAnimationRunning = v10->_speed > 0.0;
  }

  return v10;
}

- (BOOL)isReadyToComplete
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)QLPULayerAnimation;
  if (-[QLPUAnimationGroup isReadyToComplete](&v10, sel_isReadyToComplete))
  {
    -[QLPULayerAnimation _animation](self, "_animation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && self->_isAnimationRunning)
    {
      -[QLPULayerAnimation layer](self, "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPULayerAnimation key](self, "key");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "animationForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v3 == v6;

      v8 = !v7;
    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

- (void)setSpeed:(float)a3 timeOffset:(double)a4 beginTime:(double)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  id v15;

  -[QLPULayerAnimation _animation](self, "_animation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v15 = v9;
    -[QLPULayerAnimation layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPULayerAnimation key](self, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "animationForKey:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v12)
    {
      if (a3 == 0.0)
      {
        if (a4 < 0.0)
          a4 = 0.0;
        objc_msgSend(v15, "duration");
        v14 = v13 + -0.01;
        if (a4 >= v14)
          a4 = v14;
      }
      if (self->_speed != a3 || a4 != self->_timeOffset || self->_beginTime != a5)
      {
        self->_speed = a3;
        self->_timeOffset = a4;
        self->_beginTime = a5;
        -[QLPULayerAnimation _updateLayerAnimation](self, "_updateLayerAnimation");
      }
    }
    else
    {
      self->_isAnimationRunning = 0;
      -[QLPULayerAnimation _setAnimation:](self, "_setAnimation:", 0);
    }

    v9 = v15;
  }

}

- (void)finishImmediately
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLPULayerAnimation;
  -[QLPUAnimationGroup finishImmediately](&v7, sel_finishImmediately);
  -[QLPULayerAnimation _animation](self, "_animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPULayerAnimation layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPULayerAnimation key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v6)
    objc_msgSend(v4, "removeAnimationForKey:", v5);

}

- (void)_updateLayerAnimation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  -[QLPULayerAnimation _animation](self, "_animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  *(float *)&v5 = self->_speed;
  objc_msgSend(v4, "setSpeed:", v5);
  objc_msgSend(v4, "setTimeOffset:", self->_timeOffset);
  objc_msgSend(v4, "setBeginTime:", self->_beginTime);
  objc_msgSend(v4, "setDelegate:", self);
  -[QLPULayerAnimation layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPULayerAnimation key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAnimationForKey:", v7);
  objc_msgSend(v6, "addAnimation:forKey:", v4, v7);
  objc_msgSend(v6, "animationForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[QLPULayerAnimation _setAnimation:](self, "_setAnimation:", v8);
}

- (void)animationDidStart:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPULayerAnimation _animation](self, "_animation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    self->_isAnimationRunning = 1;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[QLPULayerAnimation _animation](self, "_animation");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    self->_isAnimationRunning = 0;
    -[QLPUAnimationGroup completeIfNeeded](self, "completeIfNeeded");
    -[QLPULayerAnimation _setAnimation:](self, "_setAnimation:", 0);
  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPULayerAnimation layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPULayerAnimation key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; layer: %@; key: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (CALayer)layer
{
  return self->_layer;
}

- (NSString)key
{
  return self->_key;
}

- (CAAnimation)_animation
{
  return self->__animation;
}

- (void)_setAnimation:(id)a3
{
  objc_storeStrong((id *)&self->__animation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animation, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
