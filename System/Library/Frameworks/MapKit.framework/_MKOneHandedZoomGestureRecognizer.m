@implementation _MKOneHandedZoomGestureRecognizer

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
  -[_MKOneHandedZoomGestureRecognizer setEnabled:](&v5, sel_setEnabled_);
  -[UITapGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:", v3);
}

- (_MKOneHandedZoomGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _MKOneHandedZoomGestureRecognizer *v4;
  _MKOneHandedZoomGestureRecognizer *v5;
  uint64_t v6;
  UITapGestureRecognizer *tapGestureRecognizer;
  _MKZoomingPanGestureRecognizer *v8;
  _MKZoomingPanGestureRecognizer *panGestureRecognizer;
  uint64_t v10;
  MKZoomingGestureControlConfiguration *configuration;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
  v4 = -[_MKOneHandedZoomGestureRecognizer initWithTarget:action:](&v13, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_MKOneHandedZoomGestureRecognizer setDelaysTouchesEnded:](v4, "setDelaysTouchesEnded:", 0);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v5, sel__tapGestureRecognizerStateDidChange_);
    tapGestureRecognizer = v5->_tapGestureRecognizer;
    v5->_tapGestureRecognizer = (UITapGestureRecognizer *)v6;

    -[UITapGestureRecognizer setDelegate:](v5->_tapGestureRecognizer, "setDelegate:", v5);
    -[UITapGestureRecognizer setCancelsTouchesInView:](v5->_tapGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer addObserver:forKeyPath:options:context:](v5->_tapGestureRecognizer, "addObserver:forKeyPath:options:context:", v5, CFSTR("state"), 0, _MergedGlobals_1);
    v8 = -[_MKZoomingPanGestureRecognizer initWithTarget:action:]([_MKZoomingPanGestureRecognizer alloc], "initWithTarget:action:", v5, sel__panGestureRecognizerStateDidChange_);
    panGestureRecognizer = v5->_panGestureRecognizer;
    v5->_panGestureRecognizer = v8;

    -[_MKZoomingPanGestureRecognizer setMaximumNumberOfTouches:](v5->_panGestureRecognizer, "setMaximumNumberOfTouches:", -[_MKZoomingPanGestureRecognizer minimumNumberOfTouches](v5->_panGestureRecognizer, "minimumNumberOfTouches"));
    -[_MKZoomingPanGestureRecognizer setDelegate:](v5->_panGestureRecognizer, "setDelegate:", v5);
    -[_MKZoomingPanGestureRecognizer addObserver:forKeyPath:options:context:](v5->_panGestureRecognizer, "addObserver:forKeyPath:options:context:", v5, CFSTR("state"), 0, off_1EDFB2768);
    +[_MKZoomingGestureControlConfiguration defaultConfiguration](_MKZoomingGestureControlConfiguration, "defaultConfiguration");
    v10 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (MKZoomingGestureControlConfiguration *)v10;

    -[MKZoomingGestureControlConfiguration zoomDraggingResistance](v5->_configuration, "zoomDraggingResistance");
    -[_MKZoomingPanGestureRecognizer setZoomDraggingResistance:](v5->_panGestureRecognizer, "setZoomDraggingResistance:");
    -[_MKOneHandedZoomGestureRecognizer reset](v5, "reset");
  }
  return v5;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
  -[_MKOneHandedZoomGestureRecognizer reset](&v3, sel_reset);
  -[_MKOneHandedZoomGestureRecognizer _clearTapTimer](self, "_clearTapTimer");
  self->_locationOfTapGesture = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_didReceive1stTap = 0;
  -[_MKZoomingPanGestureRecognizer setEnabled:](self->_panGestureRecognizer, "setEnabled:", 0);
  -[UITapGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:", -[_MKOneHandedZoomGestureRecognizer isEnabled](self, "isEnabled"));
}

- (void)_clearTapTimer
{
  if (self->_timerOn)
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__tooSlow_, 0);
  self->_timerOn = 0;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (_MKZoomingPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)dealloc
{
  objc_super v3;

  -[UITapGestureRecognizer removeObserver:forKeyPath:context:](self->_tapGestureRecognizer, "removeObserver:forKeyPath:context:", self, CFSTR("state"), _MergedGlobals_1);
  -[_MKZoomingPanGestureRecognizer removeObserver:forKeyPath:context:](self->_panGestureRecognizer, "removeObserver:forKeyPath:context:", self, CFSTR("state"), off_1EDFB2768);
  v3.receiver = self;
  v3.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
  -[_MKOneHandedZoomGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void)setAllowedPressTypes:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
  v4 = a3;
  -[_MKOneHandedZoomGestureRecognizer setAllowedPressTypes:](&v5, sel_setAllowedPressTypes_, v4);
  -[_MKZoomingPanGestureRecognizer setAllowedPressTypes:](self->_panGestureRecognizer, "setAllowedPressTypes:", v4, v5.receiver, v5.super_class);

}

- (void)setConfiguration:(id)a3
{
  MKZoomingGestureControlConfiguration *v5;

  v5 = (MKZoomingGestureControlConfiguration *)a3;
  if (self->_configuration != v5)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    -[MKZoomingGestureControlConfiguration zoomDraggingResistance](v5, "zoomDraggingResistance");
    -[_MKZoomingPanGestureRecognizer setZoomDraggingResistance:](self->_panGestureRecognizer, "setZoomDraggingResistance:");
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (_MergedGlobals_1 == a6)
  {
    if (-[UITapGestureRecognizer state](self->_tapGestureRecognizer, "state") == 5)
      -[_MKOneHandedZoomGestureRecognizer _tapGestureRecognizerStateDidChange:](self, "_tapGestureRecognizerStateDidChange:", self->_tapGestureRecognizer);
  }
  else if (off_1EDFB2768 == a6)
  {
    if (-[_MKZoomingPanGestureRecognizer state](self->_panGestureRecognizer, "state") == 5)
      -[_MKOneHandedZoomGestureRecognizer _panGestureRecognizerStateDidChange:](self, "_panGestureRecognizerStateDidChange:", self->_panGestureRecognizer);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
    -[_MKOneHandedZoomGestureRecognizer observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_tapGestureRecognizerStateDidChange:(id)a3
{
  id v4;
  _BOOL4 didReceive1stTap;
  uint64_t v6;
  _MKOneHandedZoomGestureRecognizer *v7;
  uint64_t v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  id v12;

  v4 = a3;
  didReceive1stTap = self->_didReceive1stTap;
  v12 = v4;
  v6 = objc_msgSend(v4, "state");
  if (didReceive1stTap)
  {
    if (v6 == 3)
    {
      v7 = self;
      v8 = 5;
LABEL_6:
      -[_MKOneHandedZoomGestureRecognizer setState:](v7, "setState:", v8);
    }
  }
  else
  {
    if ((unint64_t)(v6 - 4) < 2)
    {
      v8 = objc_msgSend(v12, "state");
      v7 = self;
      goto LABEL_6;
    }
    if (v6 == 3)
    {
      self->_didReceive1stTap = 1;
      objc_msgSend(v12, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locationInView:", v9);
      self->_locationOfTapGesture.x = v10;
      self->_locationOfTapGesture.y = v11;

      -[_MKOneHandedZoomGestureRecognizer _startTapTimer:](self, "_startTapTimer:", 0.5);
    }
  }

}

- (void)_panGestureRecognizerStateDidChange:(id)a3
{
  if (self->_didReceive1stTap)
    -[_MKOneHandedZoomGestureRecognizer setState:](self, "setState:", objc_msgSend(a3, "state"));
}

- (double)scale
{
  double result;

  -[_MKZoomingPanGestureRecognizer scale](self->_panGestureRecognizer, "scale");
  return result;
}

- (double)velocity
{
  double result;

  -[_MKZoomingPanGestureRecognizer velocity](self->_panGestureRecognizer, "velocity");
  return result;
}

- (CGPoint)locationOfTapGesture
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationOfTapGesture.x;
  y = self->_locationOfTapGesture.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
  -[_MKOneHandedZoomGestureRecognizer touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  if (self->_didReceive1stTap && !-[_MKZoomingPanGestureRecognizer state](self->_panGestureRecognizer, "state"))
  {
    if (-[_MKZoomingPanGestureRecognizer isEnabled](self->_panGestureRecognizer, "isEnabled"))
      -[_MKOneHandedZoomGestureRecognizer _clearTapTimer](self, "_clearTapTimer");
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a4;
  -[_MKOneHandedZoomGestureRecognizer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = !v6
    || (objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(v6, "gestureRecognizer:shouldReceiveTouch:", self, v5);

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  BOOL v8;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  v8 = 0;
  if (self->_tapGestureRecognizer == v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = 1;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v5;

  if (self->_tapGestureRecognizer == a3 && objc_msgSend(a3, "state") == 5)
  {
    v5 = -[_MKOneHandedZoomGestureRecognizer isEnabled](self, "isEnabled");
    -[_MKOneHandedZoomGestureRecognizer setEnabled:](self, "setEnabled:", 0);
    -[_MKOneHandedZoomGestureRecognizer setEnabled:](self, "setEnabled:", v5);
  }
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  BOOL v5;

  if (self->_panGestureRecognizer == a3 && !self->_didReceive1stTap)
  {
    -[_MKOneHandedZoomGestureRecognizer setState:](self, "setState:", 5);
    return 0;
  }
  else
  {
    -[_MKOneHandedZoomGestureRecognizer delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = !v4
      || (objc_opt_respondsToSelector() & 1) == 0
      || objc_msgSend(v4, "gestureRecognizerShouldBegin:", self);

  }
  return v5;
}

- (void)_startTapTimer:(double)a3
{
  -[_MKOneHandedZoomGestureRecognizer _clearTapTimer](self, "_clearTapTimer");
  self->_timerOn = 1;
  -[_MKZoomingPanGestureRecognizer setEnabled:](self->_panGestureRecognizer, "setEnabled:", 1);
  -[_MKOneHandedZoomGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__tooSlow_, 0, a3);
}

- (void)_tooSlow:(id)a3
{
  -[_MKOneHandedZoomGestureRecognizer _clearTapTimer](self, "_clearTapTimer", a3);
  -[_MKZoomingPanGestureRecognizer setEnabled:](self->_panGestureRecognizer, "setEnabled:", 0);
  -[_MKOneHandedZoomGestureRecognizer setState:](self, "setState:", 5);
}

- (MKZoomingGestureControlConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

@end
