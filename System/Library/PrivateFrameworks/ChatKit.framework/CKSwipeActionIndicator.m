@implementation CKSwipeActionIndicator

- (CKSwipeActionIndicator)initWithFrame:(CGRect)a3
{
  CKSwipeActionIndicator *v3;
  CKSwipeActionIndicator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKSwipeActionIndicator;
  v3 = -[CKSwipeActionIndicator initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CKSwipeActionIndicator _swipeActionIndicatorInit](v3, "_swipeActionIndicatorInit");
  return v4;
}

- (CKSwipeActionIndicator)initWithImage:(id)a3
{
  CKSwipeActionIndicator *v3;
  CKSwipeActionIndicator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKSwipeActionIndicator;
  v3 = -[CKSwipeActionIndicator initWithImage:](&v6, sel_initWithImage_, a3);
  v4 = v3;
  if (v3)
    -[CKSwipeActionIndicator _swipeActionIndicatorInit](v3, "_swipeActionIndicatorInit");
  return v4;
}

- (void)_swipeActionIndicatorInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[CKSwipeActionIndicator setContentMode:](self, "setContentMode:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGray2Color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSwipeActionIndicator setTintColor:](self, "setTintColor:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSwipeActionIndicator setBackgroundColor:](self, "setBackgroundColor:", v4);

  -[CKSwipeActionIndicator setClipsToBounds:](self, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", &unk_1E2870F90, *MEMORY[0x1E0CD2D90]);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSwipeActionIndicator layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilters:", v6);

  self->_currentHorizontalTranslation = 0.0;
  self->_currentScale = 1.0;

}

- (void)setBlurRadius:(double)a3
{
  void *v4;
  id v5;

  self->_blurRadius = a3;
  -[CKSwipeActionIndicator layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (void)setTransformForScale:(double)a3 horizontalTranslation:(double)a4
{
  __int128 v6;
  double currentScale;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  self->_currentScale = a3;
  self->_currentHorizontalTranslation = a4;
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v11.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v11.c = v6;
  *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  currentScale = self->_currentScale;
  *(_OWORD *)&v10.a = *(_OWORD *)&v11.a;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tx = *(_OWORD *)&v11.tx;
  CGAffineTransformScale(&v11, &v10, currentScale, currentScale);
  v9 = v11;
  CGAffineTransformTranslate(&v10, &v9, a4, 0.0);
  v11 = v10;
  v8 = v10;
  -[CKSwipeActionIndicator setTransform:](self, "setTransform:", &v8);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKSwipeActionIndicator;
    v5 = -[CKSwipeActionIndicator _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)currentScale
{
  return self->_currentScale;
}

- (void)setCurrentScale:(double)a3
{
  self->_currentScale = a3;
}

- (double)currentHorizontalTranslation
{
  return self->_currentHorizontalTranslation;
}

- (void)setCurrentHorizontalTranslation:(double)a3
{
  self->_currentHorizontalTranslation = a3;
}

@end
