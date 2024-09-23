@implementation _SSSScreenshotAnnotationView

- (_SSSScreenshotAnnotationView)initWithFrame:(CGRect)a3
{
  _SSSScreenshotAnnotationView *v3;
  _SSSScreenshotAnnotationController *v4;
  _SSSScreenshotContentOverlayController *overlayController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SSSScreenshotAnnotationView;
  v3 = -[_SSSScreenshotAnnotationView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(_SSSScreenshotAnnotationController);
  overlayController = v3->_overlayController;
  v3->_overlayController = &v4->super;

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_SSSScreenshotAnnotationView endedEditing](self, "endedEditing");
  v3.receiver = self;
  v3.super_class = (Class)_SSSScreenshotAnnotationView;
  -[_SSSScreenshotAnnotationView dealloc](&v3, "dealloc");
}

- (void)updateUndoState
{
  -[_SSSScreenshotContentOverlayController updateUndoState](self->_overlayController, "updateUndoState");
}

- (void)setGesturesEnabled:(BOOL)a3
{
  -[_SSSScreenshotContentOverlayController setGesturesEnabled:](self->_overlayController, "setGesturesEnabled:", a3);
}

- (void)setRulerHostView:(id)a3
{
  -[_SSSScreenshotContentOverlayController setRulerHostView:](self->_overlayController, "setRulerHostView:", a3);
}

- (void)setScreenshot:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_screenshot, a3);
  v5 = a3;
  -[_SSSScreenshotContentOverlayController setScreenshot:](self->_overlayController, "setScreenshot:", v5);

}

- (void)enterEditing
{
  -[_SSSScreenshotAnnotationView _hideAndShowViewsForScreenshotEditsSnapshotted:](self, "_hideAndShowViewsForScreenshotEditsSnapshotted:", -[_SSSScreenshotAnnotationView screenshotEditsSnapshotted](self, "screenshotEditsSnapshotted"));
  -[_SSSScreenshotAnnotationView _updateOverlayControllerForBeingActiveForScreenshotEditsSnapshotted:](self, "_updateOverlayControllerForBeingActiveForScreenshotEditsSnapshotted:", -[_SSSScreenshotAnnotationView screenshotEditsSnapshotted](self, "screenshotEditsSnapshotted"));
  -[_SSSScreenshotContentOverlayController logDidEnterEditingWithOverlay](self->_overlayController, "logDidEnterEditingWithOverlay");
  -[_SSSScreenshotAnnotationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)endedEditing
{
  -[_SSSScreenshotContentOverlayController setActive:](self->_overlayController, "setActive:", 0);
  -[_SSSScreenshotContentOverlayController logDidEndEditingWithOverlay](self->_overlayController, "logDidEndEditingWithOverlay");
}

- (BOOL)didDrawPenStroke
{
  return -[_SSSScreenshotContentOverlayController didDrawPenStroke](self->_overlayController, "didDrawPenStroke");
}

- (void)setOverlayControllerActive:(BOOL)a3
{
  self->_overlayControllerActive = a3;
  if (a3)
    -[_SSSScreenshotAnnotationView enterEditing](self, "enterEditing");
  else
    -[_SSSScreenshotAnnotationView endedEditing](self, "endedEditing");
}

- (void)setVellumOpacity:(double)a3
{
  if (self->_vellumOpacity != a3)
  {
    self->_vellumOpacity = a3;
    -[_SSSScreenshotAnnotationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[_SSSScreenshotAnnotationView setClipsToBounds:](self, "setClipsToBounds:", a3 > 0.0);
  -[_SSSScreenshotAnnotationView _setCornerRadius:](self, "_setCornerRadius:", a3);
}

- (void)setScreenshotEditsSnapshotted:(BOOL)a3
{
  _BOOL8 v3;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  if (self->_screenshotEditsSnapshotted != a3)
  {
    v3 = a3;
    self->_screenshotEditsSnapshotted = a3;
    objc_initWeak(&location, self);
    v5 = _NSConcreteStackBlock;
    v6 = 3221225472;
    v7 = sub_100034C80;
    v8 = &unk_100091AD0;
    objc_copyWeak(&v9, &location);
    -[_SSSScreenshotAnnotationView generateSnapshotImageIfNecessary:withCompletion:](self, "generateSnapshotImageIfNecessary:withCompletion:", v3, &v5);
    -[_SSSScreenshotAnnotationView setNeedsLayout](self, "setNeedsLayout", v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_asyncHideCachedOverlayView
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100034D60;
  v2[3] = &unk_100091AD0;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_scheduleHideCachedOverlayViewWithDelay:(double)a3
{
  -[_SSSScreenshotAnnotationView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_asyncHideCachedOverlayView", 0, a3);
}

- (void)_cancelScheduledHideCachedOverlayView
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_asyncHideCachedOverlayView", 0);
}

- (void)_updateOverlayControllerForBeingActiveForScreenshotEditsSnapshotted:(BOOL)a3
{
  void *v5;
  void *v6;
  _BOOL8 v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView overlayController](self, "overlayController"));
  v6 = v5;
  v7 = !a3 && self->_overlayControllerActive;
  objc_msgSend(v5, "setActive:", v7);

  -[_SSSScreenshotAnnotationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_hideAndShowViewsForScreenshotEditsSnapshotted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a3;
  -[_SSSScreenshotAnnotationView _cancelScheduledHideCachedOverlayView](self, "_cancelScheduledHideCachedOverlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView annotationOverlayView](self, "annotationOverlayView"));
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setHidden:", 1);

    -[UIView setHidden:](self->_vellumView, "setHidden:", 1);
    if ((_SSIsViewSnapshotDebuggingEnabled(-[_SSSScreenshotAnnotationView setCachedViewsHidden:](self, "setCachedViewsHidden:", 0)) & 1) != 0)
    {
      v7 = objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor"));
LABEL_6:
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView layer](self, "layer"));
      v10 = objc_retainAutorelease(v8);
      objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationView layer](self, "layer"));
      objc_msgSend(v11, "setBorderWidth:", 20.0);

    }
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 0);

    if (_SSIsViewSnapshotDebuggingEnabled(-[_SSSScreenshotAnnotationView _scheduleHideCachedOverlayViewWithDelay:](self, "_scheduleHideCachedOverlayViewWithDelay:", 0.0833333333)))
    {
      v7 = objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      goto LABEL_6;
    }
  }
  -[_SSSScreenshotAnnotationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)generateSnapshotImageIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (_SSSScreenshotContentOverlayController)overlayController
{
  return self->_overlayController;
}

- (SSSScreenshot)screenshot
{
  return self->_screenshot;
}

- (UIView)annotationOverlayView
{
  return self->_annotationOverlayView;
}

- (void)setAnnotationOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_annotationOverlayView, a3);
}

- (BOOL)screenshotEditsSnapshotted
{
  return self->_screenshotEditsSnapshotted;
}

- (UIView)vellumView
{
  return self->_vellumView;
}

- (void)setVellumView:(id)a3
{
  objc_storeStrong((id *)&self->_vellumView, a3);
}

- (double)vellumOpacity
{
  return self->_vellumOpacity;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vellumView, 0);
  objc_storeStrong((id *)&self->_annotationOverlayView, 0);
  objc_storeStrong((id *)&self->_screenshot, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
}

@end
