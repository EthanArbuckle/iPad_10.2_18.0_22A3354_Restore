@implementation CAMTorchPattern

- (CAMTorchPattern)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("CAMTorchPattern must be initialized with -initWithType:"));

  return 0;
}

- (CAMTorchPattern)initWithType:(int64_t)a3
{
  CAMTorchPattern *v4;
  CAMTorchPattern *v5;
  CAMTorchPattern *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMTorchPattern;
  v4 = -[CAMTorchPattern init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__type = a3;
    -[CAMTorchPattern _updateAnimationGroup](v4, "_updateAnimationGroup");
    v6 = v5;
  }

  return v5;
}

- (void)setStartTime:(double)a3
{
  if (self->_startTime != a3)
  {
    self->__lastUpdateTime = a3;
    self->_startTime = a3;
  }
}

- (id)_patternAnimationWithBeginTime:(double)a3 duration:(double)a4 repeatCount:(int64_t)a5
{
  void *v8;
  double v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("torchLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValues:", &unk_1EA3B2EA0);
  objc_msgSend(v8, "setKeyTimes:", &unk_1EA3B2EB8);
  objc_msgSend(v8, "setBeginTime:", a3);
  objc_msgSend(v8, "setDuration:", a4);
  *(float *)&v9 = (float)a5;
  objc_msgSend(v8, "setRepeatCount:", v9);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunction:", v10);

  objc_msgSend(v8, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
  return v8;
}

- (id)_shortPatternAnimationGroup
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTorchPattern _patternAnimationWithBeginTime:duration:repeatCount:](self, "_patternAnimationWithBeginTime:duration:repeatCount:", 8, 0.0, 0.25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimations:", v5);

  objc_msgSend(v3, "setDuration:", 3.0);
  return v3;
}

- (id)_longPatternAnimationGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTorchPattern _patternAnimationWithBeginTime:duration:repeatCount:](self, "_patternAnimationWithBeginTime:duration:repeatCount:", 2, 0.0, 2.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTorchPattern _patternAnimationWithBeginTime:duration:repeatCount:](self, "_patternAnimationWithBeginTime:duration:repeatCount:", 4, 4.0, 0.75);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTorchPattern _patternAnimationWithBeginTime:duration:repeatCount:](self, "_patternAnimationWithBeginTime:duration:repeatCount:", 8, 7.0, 0.25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = v5;
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimations:", v7);

  objc_msgSend(v3, "setDuration:", 10.0);
  return v3;
}

- (id)_blinkAnimationWithBeginTime:(double)a3 duration:(double)a4 repeatCount:(int64_t)a5
{
  void *v8;
  double v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("torchLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValues:", &unk_1EA3B2ED0);
  objc_msgSend(v8, "setKeyTimes:", &unk_1EA3B2EE8);
  objc_msgSend(v8, "setBeginTime:", a3);
  objc_msgSend(v8, "setDuration:", a4);
  *(float *)&v9 = (float)a5;
  objc_msgSend(v8, "setRepeatCount:", v9);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunction:", v10);

  objc_msgSend(v8, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
  return v8;
}

- (id)_blinkAnimationGroup
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTorchPattern _blinkAnimationWithBeginTime:duration:repeatCount:](self, "_blinkAnimationWithBeginTime:duration:repeatCount:", 1, 0.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimations:", v5);

  objc_msgSend(v3, "setDuration:", 1.0);
  return v3;
}

- (id)_doubleBlinkAnimationGroup
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTorchPattern _blinkAnimationWithBeginTime:duration:repeatCount:](self, "_blinkAnimationWithBeginTime:duration:repeatCount:", 2, 0.0, 0.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimations:", v5);

  objc_msgSend(v3, "setDuration:", 1.0);
  return v3;
}

- (void)_updateAnimationGroup
{
  CAAnimationGroup *v3;
  CAAnimationGroup *animationGroup;

  switch(self->__type)
  {
    case 0:
      -[CAMTorchPattern _shortPatternAnimationGroup](self, "_shortPatternAnimationGroup");
      v3 = (CAAnimationGroup *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      -[CAMTorchPattern _longPatternAnimationGroup](self, "_longPatternAnimationGroup");
      v3 = (CAAnimationGroup *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      -[CAMTorchPattern _blinkAnimationGroup](self, "_blinkAnimationGroup");
      v3 = (CAAnimationGroup *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      -[CAMTorchPattern _doubleBlinkAnimationGroup](self, "_doubleBlinkAnimationGroup");
      v3 = (CAAnimationGroup *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      animationGroup = self->__animationGroup;
      self->__animationGroup = v3;

      break;
    default:
      return;
  }
}

- (void)updateAtTime:(double)a3
{
  -[CAAnimationGroup applyForTime:presentationObject:modelObject:](self->__animationGroup, "applyForTime:presentationObject:modelObject:", self, self, a3);
}

- (float)torchLevel
{
  return self->_torchLevel;
}

- (int64_t)_type
{
  return self->__type;
}

- (CAAnimationGroup)_animationGroup
{
  return self->__animationGroup;
}

- (double)_lastUpdateTime
{
  return self->__lastUpdateTime;
}

- (double)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animationGroup, 0);
}

@end
