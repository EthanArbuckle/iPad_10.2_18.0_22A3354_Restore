@implementation ABFloatSpringProperty

- (ABFloatSpringProperty)init
{
  ABFloatSpringProperty *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABFloatSpringProperty;
  result = -[UIViewFloatAnimatableProperty init](&v3, sel_init);
  if (result)
  {
    result->_bounce = 0.15;
    result->_duration = 0.55;
    result->_trackingBounce = 0.15;
    result->_trackingDuration = 0.15;
  }
  return result;
}

- (void)setInput:(double)a3
{
  void *v5;
  _BOOL8 tracking;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BDF6F90];
  tracking = self->_tracking;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__ABFloatSpringProperty_setInput___block_invoke;
  v7[3] = &unk_25073EF38;
  objc_copyWeak(v8, &location);
  v8[1] = *(id *)&a3;
  objc_msgSend(v5, "_animateUsingSpringBehavior:tracking:animations:completion:", self, tracking, v7, 0);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __34__ABFloatSpringProperty_setInput___block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  double v9;
  double v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v2 = (void *)MEMORY[0x24BDF6F90];
  v3 = ABFrameRateRange();
  v5 = v4;
  v7 = v6;
  v8 = ABHighFrameRateUpdateReasonMake(100);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __34__ABFloatSpringProperty_setInput___block_invoke_2;
  v11[3] = &unk_25073EF38;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v13 = *(_QWORD *)(a1 + 40);
  LODWORD(v9) = v5;
  LODWORD(v10) = v7;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v8, v11, COERCE_DOUBLE(__PAIR64__(HIDWORD(v13), LODWORD(v3))), v9, v10);
  objc_destroyWeak(&v12);
}

void __34__ABFloatSpringProperty_setInput___block_invoke_2(uint64_t a1)
{
  double v1;
  id WeakRetained;

  v1 = *(double *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setValue:", v1);

}

- (void)setOutput:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__ABFloatSpringProperty_setOutput___block_invoke;
  v3[3] = &unk_25073EF60;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v3);
}

uint64_t __35__ABFloatSpringProperty_setOutput___block_invoke(uint64_t a1)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __35__ABFloatSpringProperty_setOutput___block_invoke_2;
  v2[3] = &unk_25073EF60;
  v2[4] = *(_QWORD *)(a1 + 32);
  v2[5] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(MEMORY[0x24BDF6F90], "_performWithoutRetargetingAnimations:", v2);
}

uint64_t __35__ABFloatSpringProperty_setOutput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInput:", *(double *)(a1 + 40));
}

- (void)setBounce:(double)a3 duration:(double)a4
{
  self->_bounce = a3;
  self->_duration = a4;
}

- (void)setTrackingBounce:(double)a3 duration:(double)a4
{
  self->_trackingBounce = a3;
  self->_trackingDuration = a4;
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  double v5;

  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (a5 <= 2)
  {
    v5 = *(double *)((char *)&self->var0 + *off_25073EF98[a5]);
    retstr->var0 = 1.0 - *(double *)((char *)&self->var0 + *off_25073EF80[a5]);
    retstr->var1 = v5;
  }
  return self;
}

- (double)projectForDeceleration:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[ABFloatSpringProperty output](self, "output");
  v6 = v5;
  -[UIViewFloatAnimatableProperty velocity](self, "velocity");
  return v6 + v7 / 1000.0 * a3 / (1.0 - a3);
}

- (double)projectForTime:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[ABFloatSpringProperty output](self, "output");
  v6 = v5;
  -[UIViewFloatAnimatableProperty velocity](self, "velocity");
  return v6 + v7 * a3;
}

- (BOOL)tracking
{
  return self->_tracking;
}

- (void)setTracking:(BOOL)a3
{
  self->_tracking = a3;
}

@end
