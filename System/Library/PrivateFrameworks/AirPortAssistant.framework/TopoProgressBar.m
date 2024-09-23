@implementation TopoProgressBar

+ (int)initImageCache
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  if (qword_2550F4DC0)
    return 0;
  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = objc_opt_class();
  v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
  v8 = (void *)objc_msgSend_imageNamed_inBundle_(ImageStore, v7, (uint64_t)CFSTR("TopoProgressFill"), v6);
  if (!v8)
    return -6729;
  qword_2550F4DC0 = (uint64_t)(id)objc_msgSend_resizableImageWithCapInsets_(v8, v9, v10, 0.0, 5.0, 0.0, 5.0);
  if (qword_2550F4DC0
    && (v11 = (void *)MEMORY[0x24BDD1488],
        v12 = objc_opt_class(),
        v14 = objc_msgSend_bundleForClass_(v11, v13, v12),
        (v16 = (void *)objc_msgSend_imageNamed_inBundle_(ImageStore, v15, (uint64_t)CFSTR("TopoProgressTrack"), v14)) != 0)&& (qword_2550F4DC8 = (uint64_t)(id)objc_msgSend_resizableImageWithCapInsets_(v16, v17, v18, 0.0, 5.0, 0.0, 5.0)) != 0)
  {
    return 0;
  }
  else
  {
    return -6729;
  }
}

+ (void)deallocImageCache
{

  qword_2550F4DC0 = 0;
  qword_2550F4DC8 = 0;
}

- (TopoProgressBar)initWithOwningView:(id)a3
{
  TopoProgressBar *v4;
  const char *v5;
  TopoProgressBar *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TopoProgressBar;
  v4 = -[TopoProgressBar init](&v11, sel_init);
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setOwningView_(v4, v5, (uint64_t)a3);
    objc_msgSend_setNeedsDisplayOnBoundsChange_(v6, v7, 1);
    objc_msgSend_initImageCache(TopoProgressBar, v8, v9);
  }
  return v6;
}

- (void)setOwningView:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  self->_owningView = a3;
  v4 = (void *)objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], a2, (uint64_t)a3);
  objc_msgSend_scale(v4, v5, v6);
  MEMORY[0x24BEDD108](self, sel_setContentsScale_, v7);
}

- (id)owningView
{
  return self->_owningView;
}

- (CGSize)preferredFrameSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (self->_progressValue != 0.0)
    v2 = 12.0;
  v3 = 100.0;
  if (self->_progressValue == 0.0)
    v3 = *MEMORY[0x24BDBF148];
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TopoProgressBar;
  -[TopoProgressBar dealloc](&v2, sel_dealloc);
}

- (void)setProgressValue:(float)a3
{
  uint64_t v3;
  double v4;
  float v5;

  if (self->_progressValue != a3)
  {
    v4 = a3;
    if (v4 < 0.0)
      v4 = 0.0;
    v5 = fmin(v4, 1.0);
    self->_progressValue = v5;
    objc_msgSend_setNeedsLayout(self, a2, v3);
  }
}

- (void)layoutSublayers
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;

  v4 = objc_msgSend_composeProgressBar(self, a2, v2);
  objc_msgSend_setContents_(self, v5, v4);
}

- (CGImage)composeProgressBar
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  UIImage *ImageFromCurrentImageContext;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  const char *v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  float v23;
  const char *v24;
  uint64_t v25;
  CGSize v27;
  CGRect v28;

  objc_msgSend_bounds(self, a2, v2);
  if (CGRectIsEmpty(v28))
  {
    ImageFromCurrentImageContext = 0;
  }
  else
  {
    objc_msgSend_bounds(self, v4, v5);
    v8 = v7;
    v10 = v9;
    objc_msgSend_scale((void *)qword_2550F4DC8, v11, v12);
    v14 = v13;
    v27.width = v8;
    v27.height = v10;
    UIGraphicsBeginImageContextWithOptions(v27, 0, v14);
    v15 = (void *)qword_2550F4DC8;
    objc_msgSend_bounds(self, v16, v17);
    objc_msgSend_drawInRect_(v15, v18, v19);
    objc_msgSend_bounds(self, v20, v21);
    v23 = (v22 + -2.0) * self->_progressValue;
    objc_msgSend_drawInRect_((void *)qword_2550F4DC0, v24, v25, 1.0, 1.0, roundf(v23), 9.0);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  return (CGImage *)objc_msgSend_CGImage(ImageFromCurrentImageContext, v4, v5);
}

- (float)progressValue
{
  return self->_progressValue;
}

@end
