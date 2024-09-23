@implementation SSSCropController

- (SSSCropController)init
{
  char *v2;
  SSSCropControllerRootView *v3;
  void *v4;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSSCropController;
  v2 = -[SSSCropController init](&v11, "init");
  v3 = objc_alloc_init(SSSCropControllerRootView);
  v4 = (void *)*((_QWORD *)v2 + 13);
  *((_QWORD *)v2 + 13) = v3;

  objc_msgSend(*((id *)v2 + 13), "setDelegate:", v2);
  *((_QWORD *)v2 + 1) = 0;
  *((_QWORD *)v2 + 2) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v2 + 24) = _Q0;
  *(_OWORD *)(v2 + 72) = *(_OWORD *)(v2 + 8);
  *(_OWORD *)(v2 + 88) = *(_OWORD *)(v2 + 24);
  objc_msgSend(v2, "setNumberOfTouchesRequiredForPanningCrop:", 1);
  objc_msgSend(v2, "setSnapRects:", &__NSArray0__struct);
  return (SSSCropController *)v2;
}

- (UIView)cropView
{
  return (UIView *)self->_rootView;
}

- (void)setViewToCrop:(id)a3
{
  -[SSSCropControllerRootView setViewToCrop:](self->_rootView, "setViewToCrop:", a3);
}

- (SSSScreenshotContainerView)viewToCrop
{
  return -[SSSCropControllerRootView viewToCrop](self->_rootView, "viewToCrop");
}

- (void)setEditMode:(int64_t)a3
{
  -[SSSCropControllerRootView setEditMode:](self->_rootView, "setEditMode:", a3);
}

- (int64_t)editMode
{
  return -[SSSCropControllerRootView editMode](self->_rootView, "editMode");
}

- (double)cornerGrabberAlpha
{
  double result;

  -[SSSCropControllerRootView cornerGrabberAlpha](self->_rootView, "cornerGrabberAlpha");
  return result;
}

- (double)lineAlpha
{
  double result;

  -[SSSCropControllerRootView lineAlpha](self->_rootView, "lineAlpha");
  return result;
}

- (double)lineGrabberAlpha
{
  double result;

  -[SSSCropControllerRootView lineGrabberAlpha](self->_rootView, "lineGrabberAlpha");
  return result;
}

- (void)setCornerGrabberAlpha:(double)a3
{
  -[SSSCropControllerRootView setCornerGrabberAlpha:](self->_rootView, "setCornerGrabberAlpha:", a3);
}

- (void)setLineAlpha:(double)a3
{
  -[SSSCropControllerRootView setLineAlpha:](self->_rootView, "setLineAlpha:", a3);
}

- (void)setLineGrabberAlpha:(double)a3
{
  -[SSSCropControllerRootView setLineGrabberAlpha:](self->_rootView, "setLineGrabberAlpha:", a3);
}

- (void)setCropRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_lastNotifiedCropRect = a3;
  -[SSSCropController _setCropRect:notify:](self, "_setCropRect:notify:", 0);
  -[SSSCropControllerRootView setUndoCropRect:](self->_rootView, "setUndoCropRect:", x, y, width, height);
}

- (void)_setCropRect:(CGRect)a3 notify:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;

  self->_cropRect = a3;
  if (a4)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    if ((SSRectEqualToRect(self, self->_lastNotifiedCropRect.origin.x, self->_lastNotifiedCropRect.origin.y, self->_lastNotifiedCropRect.size.width, self->_lastNotifiedCropRect.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height) & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropController delegate](self, "delegate"));
      objc_msgSend(v9, "cropController:changedToCropRect:", self, x, y, width, height);

      self->_lastNotifiedCropRect.origin.x = x;
      self->_lastNotifiedCropRect.origin.y = y;
      self->_lastNotifiedCropRect.size.width = width;
      self->_lastNotifiedCropRect.size.height = height;
    }
  }
}

- (void)commitInflightEdits
{
  -[SSSCropControllerRootView commitInflightEdits](self->_rootView, "commitInflightEdits");
}

- (void)setPageCropRect:(CGRect)a3
{
  -[SSSCropControllerRootView setPageCropRect:](self->_rootView, "setPageCropRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForFullscreenExperience:(BOOL)a3
{
  -[SSSCropControllerRootView prepareForFullscreenExperience:](self->_rootView, "prepareForFullscreenExperience:", a3);
}

- (void)enterCrop
{
  self->_saveCropRect = self->_cropRect;
}

- (void)resetCrop
{
  -[SSSCropControllerRootView setCropRect:](self->_rootView, "setCropRect:", 0.0, 0.0, 1.0, 1.0);
  -[SSSCropController _setCropRect:notify:](self, "_setCropRect:notify:", 0, 0.0, 0.0, 1.0, 1.0);
}

- (void)doneCrop
{
  -[SSSCropController _setCropRect:notify:](self, "_setCropRect:notify:", 1, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
}

- (void)cancelCrop
{
  -[SSSCropControllerRootView setCropRect:](self->_rootView, "setCropRect:", self->_saveCropRect.origin.x, self->_saveCropRect.origin.y, self->_saveCropRect.size.width, self->_saveCropRect.size.height);
  -[SSSCropController _setCropRect:notify:](self, "_setCropRect:notify:", 0, self->_saveCropRect.origin.x, self->_saveCropRect.origin.y, self->_saveCropRect.size.width, self->_saveCropRect.size.height);
}

- (BOOL)isCropped
{
  CGRect v3;

  v3.origin.x = 0.0;
  v3.origin.y = 0.0;
  v3.size.width = 1.0;
  v3.size.height = 1.0;
  return !CGRectEqualToRect(self->_cropRect, v3);
}

- (NSArray)gestureRecognizers
{
  return -[SSSCropControllerRootView gestureRecognizers](self->_rootView, "gestureRecognizers");
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return -[SSSCropControllerRootView panGestureRecognizer](self->_rootView, "panGestureRecognizer");
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return -[SSSCropControllerRootView pinchGestureRecognizer](self->_rootView, "pinchGestureRecognizer");
}

- (void)setNumberOfTouchesRequiredForPanningCrop:(int64_t)a3
{
  -[SSSCropControllerRootView setNumberOfTouchesRequiredForPanningCrop:](self->_rootView, "setNumberOfTouchesRequiredForPanningCrop:", a3);
}

- (int64_t)numberOfTouchesRequiredForPanningCrop
{
  return -[SSSCropControllerRootView numberOfTouchesRequiredForPanningCrop](self->_rootView, "numberOfTouchesRequiredForPanningCrop");
}

- (void)setCropEnabled:(BOOL)a3
{
  -[SSSCropControllerRootView setCropEnabled:](self->_rootView, "setCropEnabled:", a3);
}

- (BOOL)cropEnabled
{
  return -[SSSCropControllerRootView cropEnabled](self->_rootView, "cropEnabled");
}

- (void)setSnapRects:(id)a3
{
  -[SSSCropControllerRootView setSnapRects:](self->_rootView, "setSnapRects:", a3);
}

- (NSArray)snapRects
{
  return -[SSSCropControllerRootView snapRects](self->_rootView, "snapRects");
}

- (void)setCornerRadius:(double)a3
{
  -[SSSCropControllerRootView setCornerRadius:](self->_rootView, "setCornerRadius:", a3);
}

- (double)cornerRadius
{
  double result;

  -[SSSCropControllerRootView cornerRadius](self->_rootView, "cornerRadius");
  return result;
}

- (void)cropControllerRootViewWillBeginChangingCropRect:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSCropController delegate](self, "delegate", a3));
  objc_msgSend(v4, "cropControllerDidBeginCropping:", self);

}

- (void)cropControllerRootView:(id)a3 changedToCropRect:(CGRect)a4
{
  id v5;

  -[SSSCropController _setCropRect:notify:](self, "_setCropRect:notify:", objc_msgSend(a3, "editMode") != (id)2, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSCropController delegate](self, "delegate"));
  objc_msgSend(v5, "cropControllerCropRectDidChange:", self);

}

- (UIScrollView)scrollView
{
  return -[SSSCropControllerRootView scrollView](self->_rootView, "scrollView");
}

- (CGRect)cropOverlayViewRectInWindow
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SSSCropControllerRootView cropOverlayViewRectInWindow](self->_rootView, "cropOverlayViewRectInWindow");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (SSSCropControllerDelegate)delegate
{
  return (SSSCropControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootView, 0);
}

@end
