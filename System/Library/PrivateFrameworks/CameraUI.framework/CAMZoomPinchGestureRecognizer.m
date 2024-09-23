@implementation CAMZoomPinchGestureRecognizer

- (double)zoomScale
{
  void *v3;
  uint64_t v4;
  double result;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "zoomPinchScalingMethod");

  if (v4 == 2)
  {
    -[CAMZoomPinchGestureRecognizer _hybridZoomScale](self, "_hybridZoomScale");
  }
  else if (v4 == 1)
  {
    -[CAMZoomPinchGestureRecognizer _exponentialZoomScale](self, "_exponentialZoomScale");
  }
  else if (v4)
  {
    return 0.0;
  }
  else
  {
    -[UIPinchGestureRecognizer scale](self, "scale");
  }
  return result;
}

- (double)_zoomPinchDistance
{
  double v3;
  double v4;
  double v5;

  -[CAMZoomPinchGestureRecognizer _zoomPinchInitialDistance](self, "_zoomPinchInitialDistance");
  v4 = v3;
  -[UIPinchGestureRecognizer scale](self, "scale");
  return v4 * v5;
}

- (double)_exponentialZoomScale
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  long double v9;
  void *v10;
  double v11;
  long double v12;

  -[CAMZoomPinchGestureRecognizer _zoomPinchDistance](self, "_zoomPinchDistance");
  v4 = v3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoomPinchExponentialFactorDistance");
  v7 = v6;

  -[CAMZoomPinchGestureRecognizer _zoomPinchInitialDistance](self, "_zoomPinchInitialDistance");
  v9 = (v4 - v8) / v7;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "zoomPinchExponentialFactor");
  v12 = v11;

  return pow(v12, v9);
}

- (double)_hybridZoomScale
{
  void *v3;
  double result;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomPinchHybridLerpDistance");

  -[CAMZoomPinchGestureRecognizer _zoomPinchDistance](self, "_zoomPinchDistance");
  -[CAMZoomPinchGestureRecognizer _zoomPinchInitialDistance](self, "_zoomPinchInitialDistance");
  CEKProgressClamped();
  -[UIPinchGestureRecognizer scale](self, "scale");
  -[CAMZoomPinchGestureRecognizer _exponentialZoomScale](self, "_exponentialZoomScale");
  CEKInterpolate();
  return result;
}

- (void)setState:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  objc_super v8;

  v5 = -[CAMZoomPinchGestureRecognizer state](self, "state");
  v8.receiver = self;
  v8.super_class = (Class)CAMZoomPinchGestureRecognizer;
  -[CAMZoomPinchGestureRecognizer setState:](&v8, sel_setState_, a3);
  v6 = -[CAMZoomPinchGestureRecognizer state](self, "state");
  if (v6 != v5)
  {
    v7 = 0.0;
    if ((unint64_t)(v6 - 3) >= 3)
    {
      if (v6 != 1)
        return;
      -[CAMZoomPinchGestureRecognizer _distanceBetweenInitialTwoTouches](self, "_distanceBetweenInitialTwoTouches", 0.0);
    }
    -[CAMZoomPinchGestureRecognizer _setZoomPinchInitialDistance:](self, "_setZoomPinchInitialDistance:", v7);
  }
}

- (double)_distanceBetweenInitialTwoTouches
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  double v12;

  -[CAMZoomPinchGestureRecognizer _activeEventOfType:](self, "_activeEventOfType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomPinchGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 2)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", 0);

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", 0);

    UIDistanceBetweenPoints();
    v9 = v8;
  }
  else
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CAMZoomPinchGestureRecognizer _distanceBetweenInitialTwoTouches].cold.1(v5, v10);

    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zoomPinchExponentialFactorDistance");
    v9 = v12;

  }
  return v9;
}

- (double)_zoomPinchInitialDistance
{
  return self->__zoomPinchInitialDistance;
}

- (void)_setZoomPinchInitialDistance:(double)a3
{
  self->__zoomPinchInitialDistance = a3;
}

- (void)_distanceBetweenInitialTwoTouches
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Zoom pinch gesture recognizer received %lu touches instead of 2.", (uint8_t *)&v3, 0xCu);
}

@end
