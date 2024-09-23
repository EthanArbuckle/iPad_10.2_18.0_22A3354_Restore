@implementation CAMScreenLuminanceObserverLayer

- (CAMScreenLuminanceObserverLayer)init
{
  CAMScreenLuminanceObserverLayer *v2;
  CAMScreenLuminanceObserverLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMScreenLuminanceObserverLayer;
  v2 = -[CAMScreenLuminanceObserverLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->__interpolatedGainModulation = 0.0;
    -[CAMScreenLuminanceObserverLayer setDelegate:](v2, "setDelegate:", v2);
    -[CAMScreenLuminanceObserverLayer setCaptureOnly:](v3, "setCaptureOnly:", 1);
    -[CAMScreenLuminanceObserverLayer setTracksLuma:](v3, "setTracksLuma:", 1);
  }
  return v3;
}

- (void)backdropLayer:(id)a3 didChangeLuma:(double)a4
{
  void *v6;
  void (**v7)(double);

  -[CAMScreenLuminanceObserverLayer gainModulationCallback](self, "gainModulationCallback", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self->__interpolatedGainModulation = ((a4 + -0.25) * 4.0 / 0.75 + 0.0) * 0.25
                                       + self->__interpolatedGainModulation * 0.75;
    -[CAMScreenLuminanceObserverLayer gainModulationCallback](self, "gainModulationCallback");
    v7 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v7[2](self->__interpolatedGainModulation);

  }
}

- (id)gainModulationCallback
{
  return self->_gainModulationCallback;
}

- (void)setGainModulationCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)_interpolatedGainModulation
{
  return self->__interpolatedGainModulation;
}

- (void)set_interpolatedGainModulation:(double)a3
{
  self->__interpolatedGainModulation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_gainModulationCallback, 0);
}

@end
