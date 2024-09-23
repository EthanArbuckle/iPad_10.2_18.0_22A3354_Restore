@implementation CAMOverlaySliderState

- (CAMOverlaySliderState)init
{
  CAMOverlaySliderState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMOverlaySliderState;
  result = -[CAMOverlaySliderState init](&v3, sel_init);
  if (result)
    result->__sliderMode = 0;
  return result;
}

+ (id)hiddenState
{
  return objc_alloc_init((Class)a1);
}

+ (id)presentedState
{
  _QWORD *v2;

  v2 = objc_alloc_init((Class)a1);
  v2[1] = 2;
  v2[2] = 0x3FE0000000000000;
  return v2;
}

+ (id)hintWithNormalizedButtonOffset:(double)a3
{
  double *v4;

  v4 = (double *)objc_alloc_init((Class)a1);
  *((_QWORD *)v4 + 1) = 1;
  v4[2] = a3;
  return v4;
}

- (BOOL)_presented
{
  return -[CAMOverlaySliderState _sliderMode](self, "_sliderMode") == 2;
}

- (double)_effectiveNormalizedButtonOffsetFromState:(id)a3
{
  double v3;
  CAMOverlaySliderState *v5;
  int64_t v6;
  double v7;

  v5 = (CAMOverlaySliderState *)a3;
  v6 = -[CAMOverlaySliderState _sliderMode](self, "_sliderMode");
  if ((unint64_t)(v6 - 1) < 2 || (self = v5, !v6))
  {
    -[CAMOverlaySliderState _normalizedButtonOffset](self, "_normalizedButtonOffset");
    v3 = v7;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CAMOverlaySliderState isEqualToState:](self, "isEqualToState:", v4);

  return v5;
}

- (BOOL)isEqualToState:(id)a3
{
  CAMOverlaySliderState *v4;
  CAMOverlaySliderState *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = (CAMOverlaySliderState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4
         && (v6 = -[CAMOverlaySliderState _sliderMode](v4, "_sliderMode"),
             v6 == -[CAMOverlaySliderState _sliderMode](self, "_sliderMode")))
  {
    -[CAMOverlaySliderState _normalizedButtonOffset](v5, "_normalizedButtonOffset");
    v8 = v7;
    -[CAMOverlaySliderState _normalizedButtonOffset](self, "_normalizedButtonOffset");
    v10 = v8 == v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_modeDescription
{
  int64_t v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;

  v3 = -[CAMOverlaySliderState _sliderMode](self, "_sliderMode");
  if (v3 == 2)
  {
    v4 = CFSTR("Presented");
  }
  else if (v3 == 1)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[CAMOverlaySliderState _normalizedButtonOffset](self, "_normalizedButtonOffset");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Hinting (pos %.3f)"), v6);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = CFSTR("Hidden");
  }
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMOverlaySliderState _modeDescription](self, "_modeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)_sliderMode
{
  return self->__sliderMode;
}

- (double)_normalizedButtonOffset
{
  return self->__normalizedButtonOffset;
}

@end
