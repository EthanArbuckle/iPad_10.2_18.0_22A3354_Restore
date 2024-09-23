@implementation BWPreviewStitcherFencedAnimationInfo

- (int)primaryCaptureRectCenterXPixelOffset
{
  return self->_primaryCaptureRectCenterXPixelOffset;
}

- (double)primaryCaptureAspectRatio
{
  return self->_primaryCaptureAspectRatio;
}

+ (id)fencedAnimationInfoWithAspectRatio:(double)a3 centerX:(double)a4 centerXPixelOffset:(int)a5 fencePortSendRight:(id)a6
{
  BWPreviewStitcherFencedAnimationInfo *v10;
  objc_super v12;

  v10 = [BWPreviewStitcherFencedAnimationInfo alloc];
  if (v10)
  {
    v12.receiver = v10;
    v12.super_class = (Class)BWPreviewStitcherFencedAnimationInfo;
    v10 = objc_msgSendSuper2(&v12, sel_initWithFencePortSendRight_, a6);
    if (v10)
    {
      v10->_primaryCaptureAspectRatio = a3;
      v10->_primaryCaptureRectCenterX = a4;
      v10->_primaryCaptureRectCenterXPixelOffset = a5;
    }
  }
  return v10;
}

- (id)description
{
  double primaryCaptureAspectRatio;
  double primaryCaptureRectCenterX;
  objc_super v5;

  primaryCaptureAspectRatio = self->_primaryCaptureAspectRatio;
  primaryCaptureRectCenterX = self->_primaryCaptureRectCenterX;
  v5.receiver = self;
  v5.super_class = (Class)BWPreviewStitcherFencedAnimationInfo;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BWPreviewStitcherFencedAnimationInfo: { aspectRatio=%f, centerX=%f, centerXPixelOffset=%d, %@ }"), *(_QWORD *)&primaryCaptureAspectRatio, *(_QWORD *)&primaryCaptureRectCenterX, self->_primaryCaptureRectCenterXPixelOffset, -[BWFencedAnimationInfo description](&v5, sel_description));
}

- (void)setPrimaryCaptureAspectRatio:(double)a3
{
  self->_primaryCaptureAspectRatio = a3;
}

- (double)primaryCaptureRectCenterX
{
  return self->_primaryCaptureRectCenterX;
}

- (void)setPrimaryCaptureRectCenterX:(double)a3
{
  self->_primaryCaptureRectCenterX = a3;
}

- (void)setPrimaryCaptureRectCenterXPixelOffset:(int)a3
{
  self->_primaryCaptureRectCenterXPixelOffset = a3;
}

@end
