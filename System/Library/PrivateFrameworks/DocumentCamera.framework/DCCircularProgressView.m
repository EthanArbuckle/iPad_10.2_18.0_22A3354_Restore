@implementation DCCircularProgressView

- (void)dealloc
{
  objc_super v3;

  -[NSProgress removeObserver:forKeyPath:context:](self->_observedProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), DCCircularProgressViewContext);
  v3.receiver = self;
  v3.super_class = (Class)DCCircularProgressView;
  -[DCCircularProgressView dealloc](&v3, sel_dealloc);
}

- (void)awakeFromNib
{
  void *v3;
  CAShapeLayer *v4;
  CAShapeLayer *circleLayer;
  id v6;
  CGPath *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DCCircularProgressView;
  -[DCCircularProgressView awakeFromNib](&v9, sel_awakeFromNib);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
  circleLayer = self->_circleLayer;
  self->_circleLayer = v4;

  v6 = objc_retainAutorelease(v3);
  -[CAShapeLayer setFillColor:](self->_circleLayer, "setFillColor:", objc_msgSend(v6, "CGColor"));
  -[CAShapeLayer setFillRule:](self->_circleLayer, "setFillRule:", *MEMORY[0x24BDE5988]);
  v7 = -[DCCircularProgressView newPathForProgress:](self, "newPathForProgress:", 0.1);
  -[CAShapeLayer setPath:](self->_circleLayer, "setPath:", v7);
  CGPathRelease(v7);
  -[DCCircularProgressView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSublayer:", self->_circleLayer);

}

- (CGPath)newPathForProgress:(double)a3
{
  double v5;
  CGFloat v6;
  CGPath *Mutable;
  CGRect v9;
  CGRect v10;

  -[DCCircularProgressView frame](self, "frame");
  v6 = v5 * 0.5;
  Mutable = CGPathCreateMutable();
  -[DCCircularProgressView bounds](self, "bounds");
  v10 = CGRectInset(v9, 4.0, 4.0);
  CGPathAddEllipseInRect(Mutable, 0, v10);
  CGPathMoveToPoint(Mutable, 0, v6, v6);
  CGPathAddLineToPoint(Mutable, 0, v6, 8.0);
  CGPathAddArc(Mutable, 0, v6, v6, v6 + -8.0, -1.57079633, a3 * 6.28318531 + -1.57079633, 1);
  return Mutable;
}

- (void)setProgress:(double)a3
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;
  CGPath *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v4 = fmax(self->_progress, 0.1);
  v5 = fmax(a3, 0.1);
  self->_progress = a3;
  v17 = objc_alloc_init(MEMORY[0x24BDE56C0]);
  objc_msgSend(v17, "setKeyPath:", CFSTR("path"));
  v6 = v5 - v4;
  v7 = (uint64_t)fmax(v6 / 0.1, 1.0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= 1)
  {
    for (i = 1; i <= v7; ++i)
    {
      v11 = -[DCCircularProgressView newPathForProgress:](self, "newPathForProgress:", v4 + (float)((float)(int)i / (float)v7) * v6);
      objc_msgSend(v8, "addObject:", v11);

      *(float *)&v12 = (float)(int)i / (float)v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v13);

    }
  }
  objc_msgSend(v17, "setValues:", v8);
  objc_msgSend(v17, "setKeyTimes:", v9);
  v14 = objc_msgSend(v8, "lastObject");
  -[DCCircularProgressView circleLayer](self, "circleLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPath:", v14);

  -[DCCircularProgressView circleLayer](self, "circleLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v17, CFSTR("path"));

}

- (void)setObservedProgress:(id)a3
{
  NSProgress **p_observedProgress;
  id v6;

  p_observedProgress = &self->_observedProgress;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", *p_observedProgress) & 1) == 0)
  {
    -[NSProgress removeObserver:forKeyPath:context:](*p_observedProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), DCCircularProgressViewContext);
    objc_storeStrong((id *)&self->_observedProgress, a3);
    -[NSProgress addObserver:forKeyPath:options:context:](*p_observedProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, DCCircularProgressViewContext);
    if (*p_observedProgress)
    {
      -[NSProgress fractionCompleted](*p_observedProgress, "fractionCompleted");
      -[DCCircularProgressView setProgress:](self, "setProgress:");
    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD v7[5];

  if ((void *)DCCircularProgressViewContext == a6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __73__DCCircularProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v7[3] = &unk_24C5B7AE0;
    v7[4] = self;
    dc_dispatchMainAfterDelay(v7, 0.0);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DCCircularProgressView;
    -[DCCircularProgressView observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __73__DCCircularProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observedProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "observedProgress");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fractionCompleted");
    objc_msgSend(*(id *)(a1 + 32), "setProgress:");

  }
}

- (double)progress
{
  return self->_progress;
}

- (NSProgress)observedProgress
{
  return self->_observedProgress;
}

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_observedProgress, 0);
}

@end
