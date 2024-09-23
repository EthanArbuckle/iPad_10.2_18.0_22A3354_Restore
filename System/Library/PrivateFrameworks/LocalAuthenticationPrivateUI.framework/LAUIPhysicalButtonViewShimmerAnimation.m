@implementation LAUIPhysicalButtonViewShimmerAnimation

- (double)duration
{
  _BOOL4 v2;
  double result;

  v2 = -[LAUIPhysicalButtonViewShimmerAnimation _isReducedMotionEnabled](self, "_isReducedMotionEnabled");
  result = 2.5;
  if (v2)
    return 3.5;
  return result;
}

- (void)beginWithDelay:(double)a3
{
  if (!-[LAUIPhysicalButtonViewAnimation isRunning](self, "isRunning"))
  {
    if (-[LAUIPhysicalButtonViewShimmerAnimation _isReducedMotionEnabled](self, "_isReducedMotionEnabled"))
      -[LAUIPhysicalButtonViewShimmerAnimation _beginReducedMotionAnimationWithDelay:](self, "_beginReducedMotionAnimationWithDelay:", a3);
    else
      -[LAUIPhysicalButtonViewShimmerAnimation _beginRegularMotionAnimationWithDelay:](self, "_beginRegularMotionAnimationWithDelay:", a3);
  }
}

- (void)endImmediately
{
  objc_super v3;

  if (!-[LAUIPhysicalButtonViewShimmerAnimation _isReducedMotionEnabled](self, "_isReducedMotionEnabled"))
    -[LAUIPhysicalButtonViewShimmerAnimation _endShimmerAnimation](self, "_endShimmerAnimation");
  v3.receiver = self;
  v3.super_class = (Class)LAUIPhysicalButtonViewShimmerAnimation;
  -[LAUIPhysicalButtonViewAnimation endImmediately](&v3, sel_endImmediately);
}

- (void)_beginReducedMotionAnimationWithDelay:(double)a3
{
  CALayer **p_layer;
  id WeakRetained;
  double v7;
  double v8;
  id v9;
  id v10;

  p_layer = &self->super._layer;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._layer);
  LODWORD(v7) = 1059481190;
  objc_msgSend(WeakRetained, "setOpacity:", v7);

  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValues:", &unk_24C285440);
  objc_msgSend(v10, "setBeginTime:", a3);
  objc_msgSend(v10, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
  objc_msgSend(v10, "setKeyTimes:", &unk_24C285458);
  -[LAUIPhysicalButtonViewShimmerAnimation duration](self, "duration");
  objc_msgSend(v10, "setDuration:");
  LODWORD(v8) = 2139095040;
  objc_msgSend(v10, "setRepeatCount:", v8);
  v9 = objc_loadWeakRetained((id *)p_layer);
  -[LAUIPhysicalButtonViewAnimation addAdditiveAnimation:to:keyPath:](self, "addAdditiveAnimation:to:keyPath:", v10, v9, 0);

}

- (void)_beginRegularMotionAnimationWithDelay:(double)a3
{
  uint64_t v5;
  CAGradientLayer *v6;
  CAGradientLayer *shimmerGradient;
  id WeakRetained;
  void *v9;
  _QWORD v10[6];
  _QWORD v11[5];

  -[LAUIPhysicalButtonViewShimmerAnimation _endShimmerAnimation](self, "_endShimmerAnimation");
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__LAUIPhysicalButtonViewShimmerAnimation__beginRegularMotionAnimationWithDelay___block_invoke;
  v11[3] = &unk_24C27EC68;
  v11[4] = self;
  __80__LAUIPhysicalButtonViewShimmerAnimation__beginRegularMotionAnimationWithDelay___block_invoke((uint64_t)v11);
  v6 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
  shimmerGradient = self->_shimmerGradient;
  self->_shimmerGradient = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._layer);
  objc_msgSend(WeakRetained, "setMask:", self->_shimmerGradient);

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __80__LAUIPhysicalButtonViewShimmerAnimation__beginRegularMotionAnimationWithDelay___block_invoke_17;
  v10[3] = &unk_24C27EC90;
  *(double *)&v10[5] = a3;
  v10[4] = self;
  __80__LAUIPhysicalButtonViewShimmerAnimation__beginRegularMotionAnimationWithDelay___block_invoke_17((uint64_t)v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAUIPhysicalButtonViewAnimation addAdditiveAnimation:to:keyPath:](self, "addAdditiveAnimation:to:keyPath:", v9, self->_shimmerGradient, 0);

}

id __80__LAUIPhysicalButtonViewShimmerAnimation__beginRegularMotionAnimationWithDelay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  id v14;
  double v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE56B8], "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.65);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17[0] = objc_msgSend(v4, "CGColor");
  v5 = objc_retainAutorelease(v3);
  v17[1] = objc_msgSend(v5, "CGColor", v17[0]);
  v6 = objc_retainAutorelease(v4);
  v17[2] = objc_msgSend(v6, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setColors:", v7);

  objc_msgSend(v2, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v2, "setEndPoint:", 1.0, 0.5);
  objc_msgSend(v2, "setLocations:", &unk_24C285470);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "bounds");
  v10 = v9 * -2.0;
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v11, "bounds");
  v13 = v12 * 5.0;
  v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v14, "bounds");
  objc_msgSend(v2, "setFrame:", v10, 0.0, v13, v15 + v15);

  return v2;
}

id __80__LAUIPhysicalButtonViewShimmerAnimation__beginRegularMotionAnimationWithDelay___block_invoke_17(uint64_t a1)
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("locations"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValues:", &unk_24C2854D0);
  objc_msgSend(v2, "setBeginTime:", *(double *)(a1 + 40));
  objc_msgSend(v2, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
  objc_msgSend(v2, "setKeyTimes:", &unk_24C2854E8);
  objc_msgSend(*(id *)(a1 + 32), "duration");
  objc_msgSend(v2, "setDuration:");
  LODWORD(v3) = 2139095040;
  objc_msgSend(v2, "setRepeatCount:", v3);
  return v2;
}

- (void)_endShimmerAnimation
{
  CAGradientLayer *shimmerGradient;
  CAGradientLayer *v4;

  shimmerGradient = self->_shimmerGradient;
  if (shimmerGradient)
  {
    -[CAGradientLayer removeFromSuperlayer](shimmerGradient, "removeFromSuperlayer");
    v4 = self->_shimmerGradient;
    self->_shimmerGradient = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shimmerGradient, 0);
}

@end
