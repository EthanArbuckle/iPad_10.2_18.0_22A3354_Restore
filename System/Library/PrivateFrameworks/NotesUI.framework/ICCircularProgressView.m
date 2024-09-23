@implementation ICCircularProgressView

- (void)dealloc
{
  objc_super v3;

  -[NSProgress removeObserver:forKeyPath:context:](self->_observedProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), &compoundliteral_1);
  v3.receiver = self;
  v3.super_class = (Class)ICCircularProgressView;
  -[ICCircularProgressView dealloc](&v3, sel_dealloc);
}

- (void)awakeFromNib
{
  CAShapeLayer *v3;
  CAShapeLayer *circleLayer;
  id v5;
  CGPath *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICCircularProgressView;
  -[ICCircularProgressView awakeFromNib](&v8, sel_awakeFromNib);
  v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
  circleLayer = self->_circleLayer;
  self->_circleLayer = v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_circleLayer, "setFillColor:", objc_msgSend(v5, "CGColor"));

  -[CAShapeLayer setFillRule:](self->_circleLayer, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  v6 = -[ICCircularProgressView newPathForProgress:](self, "newPathForProgress:", 0.1);
  -[CAShapeLayer setPath:](self->_circleLayer, "setPath:", v6);
  CGPathRelease(v6);
  -[ICCircularProgressView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", self->_circleLayer);

}

- (CGPath)newPathForProgress:(double)a3
{
  double v5;
  CGFloat v6;
  CGPath *Mutable;
  CGRect v9;
  CGRect v10;

  -[ICCircularProgressView frame](self, "frame");
  v6 = v5 * 0.5;
  Mutable = CGPathCreateMutable();
  -[ICCircularProgressView bounds](self, "bounds");
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
  v17 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v17, "setKeyPath:", CFSTR("path"));
  v6 = v5 - v4;
  v7 = (uint64_t)fmax(v6 / 0.1, 1.0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= 1)
  {
    for (i = 1; i <= v7; ++i)
    {
      v11 = -[ICCircularProgressView newPathForProgress:](self, "newPathForProgress:", v4 + (float)((float)(int)i / (float)v7) * v6);
      objc_msgSend(v8, "addObject:", v11);

      *(float *)&v12 = (float)(int)i / (float)v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v13);

    }
  }
  objc_msgSend(v17, "setValues:", v8);
  objc_msgSend(v17, "setKeyTimes:", v9);
  v14 = objc_msgSend(v8, "lastObject");
  -[ICCircularProgressView circleLayer](self, "circleLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPath:", v14);

  -[ICCircularProgressView circleLayer](self, "circleLayer");
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
    -[NSProgress ic_removeObserver:forKeyPath:context:](*p_observedProgress, "ic_removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), &compoundliteral_1);
    objc_storeStrong((id *)&self->_observedProgress, a3);
    -[NSProgress ic_addObserver:forKeyPath:context:](*p_observedProgress, "ic_addObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), &compoundliteral_1);
    if (*p_observedProgress)
    {
      -[NSProgress fractionCompleted](*p_observedProgress, "fractionCompleted");
      -[ICCircularProgressView setProgress:](self, "setProgress:");
    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  objc_super v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  if ((-[ICCircularProgressView ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/SharedUI/iOS/ICCircularProgressView.m") & 1) != 0)
  {
    v13 = -[ICCircularProgressView ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v10, v11, v12);

    if (a6 == &compoundliteral_1 && (v13 & 1) == 0)
      dispatchMainAfterDelay();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICCircularProgressView;
    -[ICCircularProgressView observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v12, v11, v10, a6);

  }
}

void __73__ICCircularProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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
