@implementation CAMFocusResult

- (BOOL)deviceSupportsFocus
{
  return self->_deviceSupportsFocus;
}

- (int64_t)focusMode
{
  return self->_focusMode;
}

- (BOOL)contrastBasedFocusDidStart
{
  return self->_contrastBasedFocusDidStart;
}

- (BOOL)contrastBasedFocusDidEnd
{
  return self->_contrastBasedFocusDidEnd;
}

- (CGPoint)pointOfInterest
{
  double x;
  double y;
  CGPoint result;

  x = self->_pointOfInterest.x;
  y = self->_pointOfInterest.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CAMFocusResult)initWithMode:(int64_t)a3 pointOfInterest:(CGPoint)a4 performingContrastDetection:(BOOL)a5 contrastBasedFocusDidStart:(BOOL)a6 contrastBasedFocusDidEnd:(BOOL)a7 deviceSupportsFocus:(BOOL)a8
{
  CGFloat y;
  CGFloat x;
  CAMFocusResult *v15;
  CAMFocusResult *v16;
  CAMFocusResult *v17;
  objc_super v19;

  y = a4.y;
  x = a4.x;
  v19.receiver = self;
  v19.super_class = (Class)CAMFocusResult;
  v15 = -[CAMFocusResult init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_focusMode = a3;
    v15->_pointOfInterest.x = x;
    v15->_pointOfInterest.y = y;
    v15->_performingContrastDetection = a5;
    v15->_contrastBasedFocusDidStart = a6;
    v15->_contrastBasedFocusDidEnd = a7;
    v15->_deviceSupportsFocus = a8;
    v17 = v15;
  }

  return v16;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  CGPoint v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMFocusResult focusMode](self, "focusMode");
  -[CAMFocusResult pointOfInterest](self, "pointOfInterest");
  NSStringFromCGPoint(v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p mode: %ld pointOfInterest: %@ contrast: %d>"), v5, self, v6, v7, -[CAMFocusResult isPerformingContrastDetection](self, "isPerformingContrastDetection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CAMFocusResult contrastBasedFocusDidStart](self, "contrastBasedFocusDidStart"))
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR(" contrastDidStart"));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  if (-[CAMFocusResult contrastBasedFocusDidEnd](self, "contrastBasedFocusDidEnd"))
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR(" contrastDidEnd"));
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  return v8;
}

- (BOOL)isPerformingContrastDetection
{
  return self->_performingContrastDetection;
}

@end
