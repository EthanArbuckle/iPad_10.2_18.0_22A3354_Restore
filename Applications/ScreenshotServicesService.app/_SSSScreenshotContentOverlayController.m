@implementation _SSSScreenshotContentOverlayController

- (CGRect)rectToCenterAboveKeyboard
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return 0;
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return 0;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return 0;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return 0;
}

- (UIRotationGestureRecognizer)rotationGestureRecognizer
{
  return 0;
}

- (UIView)overlayView
{
  return 0;
}

- (NSArray)gestureRecognizers
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)setGesturesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  self->_gesturesEnabled = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController gestureRecognizers](self, "gestureRecognizers", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setEnabled:", v3);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)rulerHostingView
{
  return -[_SSSScreenshotContentOverlayController rulerHostView](self, "rulerHostView");
}

- (BOOL)rulerHostWantsSharedRuler
{
  return 1;
}

- (SSSScreenshot)screenshot
{
  return (SSSScreenshot *)objc_loadWeakRetained((id *)&self->_screenshot);
}

- (void)setScreenshot:(id)a3
{
  objc_storeWeak((id *)&self->_screenshot, a3);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)viewState
{
  int64_t page;
  int64_t state;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  page = self->_viewState.page;
  state = self->_viewState.state;
  result.var1 = page;
  result.var0 = state;
  return result;
}

- (void)setViewState:(id)a3
{
  self->_viewState = ($AB3BE9747824767834AFB82FA4A604F6)a3;
}

- (BOOL)gesturesEnabled
{
  return self->_gesturesEnabled;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (_SSSScreenshotContentOverlayControllerDelegate)delegate
{
  return (_SSSScreenshotContentOverlayControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKController)annotationKitController
{
  return self->_annotationKitController;
}

- (void)setAnnotationKitController:(id)a3
{
  objc_storeStrong((id *)&self->_annotationKitController, a3);
}

- (UIView)rulerHostView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_rulerHostView);
}

- (void)setRulerHostView:(id)a3
{
  objc_storeWeak((id *)&self->_rulerHostView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rulerHostView);
  objc_storeStrong((id *)&self->_annotationKitController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_screenshot);
}

@end
