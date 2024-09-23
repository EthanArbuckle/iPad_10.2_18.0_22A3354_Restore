@implementation CCUICASpringAnimationParameters

- (CCUICASpringAnimationParameters)init
{
  return (CCUICASpringAnimationParameters *)-[CCUICASpringAnimationParameters _initWithAnimationParameters:](self, "_initWithAnimationParameters:", 0);
}

- (id)_initWithAnimationParameters:(id)a3
{
  id v4;
  CCUICASpringAnimationParameters *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  CCUIAnimationTimingFunctionDescription *timingFunction;
  float v12;
  float v13;
  float v14;
  uint64_t v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CCUICASpringAnimationParameters;
  v5 = -[CCUICASpringAnimationParameters init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mass");
    v5->_mass = v6;
    objc_msgSend(v4, "stiffness");
    v5->_stiffness = v7;
    objc_msgSend(v4, "damping");
    v5->_damping = v8;
    objc_msgSend(v4, "timingFunction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", 0);
    timingFunction = v5->_timingFunction;
    v5->_timingFunction = (CCUIAnimationTimingFunctionDescription *)v10;

    if (v4)
    {
      objc_msgSend(v4, "frameRateRange");
      v5->_frameRateRange.minimum = v12;
      v5->_frameRateRange.maximum = v13;
      v5->_frameRateRange.preferred = v14;
      v5->_highFrameRateReason = objc_msgSend(v4, "highFrameRateReason");
    }
    else
    {
      v15 = MEMORY[0x1E0CD23C0];
      *(_QWORD *)&v5->_frameRateRange.minimum = *MEMORY[0x1E0CD23C0];
      v5->_frameRateRange.preferred = *(float *)(v15 + 8);
    }
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUICASpringAnimationParameters mass](self, "mass");
  v4 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("Mass"));
  -[CCUICASpringAnimationParameters stiffness](self, "stiffness");
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("Stiffness"));
  -[CCUICASpringAnimationParameters damping](self, "damping");
  v6 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("Damping"));
  -[CCUICASpringAnimationParameters timingFunction](self, "timingFunction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("Timing Function"));

  -[CCUICASpringAnimationParameters frameRateRange](self, "frameRateRange");
  CCUIStringFromCAFrameRateRange(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v12, CFSTR("FrameRateRange"));

  v13 = (id)objc_msgSend(v3, "appendInteger:withName:", -[CCUICASpringAnimationParameters highFrameRateReason](self, "highFrameRateReason"), CFSTR("highFrameRateReason"));
  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  id v13;
  double v14;
  id v15;
  double v16;
  id v17;
  id v18;
  unint64_t v19;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUICASpringAnimationParameters mass](self, "mass");
  v4 = (id)objc_msgSend(v3, "appendCGFloat:");
  -[CCUICASpringAnimationParameters stiffness](self, "stiffness");
  v5 = (id)objc_msgSend(v3, "appendCGFloat:");
  -[CCUICASpringAnimationParameters damping](self, "damping");
  v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  -[CCUICASpringAnimationParameters timingFunction](self, "timingFunction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:", v7);

  -[CCUICASpringAnimationParameters frameRateRange](self, "frameRateRange");
  v10 = v9;
  v12 = v11;
  v13 = (id)objc_msgSend(v3, "appendFloat:");
  LODWORD(v14) = v10;
  v15 = (id)objc_msgSend(v3, "appendFloat:", v14);
  LODWORD(v16) = v12;
  v17 = (id)objc_msgSend(v3, "appendFloat:", v16);
  v18 = (id)objc_msgSend(v3, "appendInteger:", -[CCUICASpringAnimationParameters highFrameRateReason](self, "highFrameRateReason"));
  v19 = objc_msgSend(v3, "hash");

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  CCUICASpringAnimationParameters *v4;
  CCUICASpringAnimationParameters *v5;
  void *v6;
  void *v7;
  int v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  unsigned int v18;
  BOOL v19;
  CAFrameRateRange v21;
  CAFrameRateRange v22;

  v4 = (CCUICASpringAnimationParameters *)a3;
  if (v4 == self)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[CCUICASpringAnimationParameters mass](self, "mass");
      -[CCUICASpringAnimationParameters mass](v5, "mass");
      if (BSCompareFloats())
        goto LABEL_12;
      -[CCUICASpringAnimationParameters stiffness](self, "stiffness");
      -[CCUICASpringAnimationParameters stiffness](v5, "stiffness");
      if (BSCompareFloats())
        goto LABEL_12;
      -[CCUICASpringAnimationParameters damping](self, "damping");
      -[CCUICASpringAnimationParameters damping](v5, "damping");
      if (BSCompareFloats())
        goto LABEL_12;
      -[CCUICASpringAnimationParameters timingFunction](self, "timingFunction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUICASpringAnimationParameters timingFunction](v5, "timingFunction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = BSEqualObjects();

      if (!v8)
        goto LABEL_12;
      -[CCUICASpringAnimationParameters frameRateRange](self, "frameRateRange");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[CCUICASpringAnimationParameters frameRateRange](v5, "frameRateRange");
      v22.minimum = v15;
      v22.maximum = v16;
      v22.preferred = v17;
      v21.minimum = v10;
      v21.maximum = v12;
      v21.preferred = v14;
      if (!CAFrameRateRangeIsEqualToRange(v21, v22))
      {
LABEL_12:
        v19 = 0;
      }
      else
      {
        v18 = -[CCUICASpringAnimationParameters highFrameRateReason](self, "highFrameRateReason");
        v19 = v18 == -[CCUICASpringAnimationParameters highFrameRateReason](v5, "highFrameRateReason");
      }

    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CCUICASpringAnimationParameters _initWithAnimationParameters:]([CCUIMutableCASpringAnimationParameters alloc], "_initWithAnimationParameters:", self);
}

- (double)mass
{
  return self->_mass;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (double)damping
{
  return self->_damping;
}

- (CCUIAnimationTimingFunctionDescription)timingFunction
{
  return self->_timingFunction;
}

- (CAFrameRateRange)frameRateRange
{
  float minimum;
  float maximum;
  float preferred;
  CAFrameRateRange result;

  minimum = self->_frameRateRange.minimum;
  maximum = self->_frameRateRange.maximum;
  preferred = self->_frameRateRange.preferred;
  result.preferred = preferred;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
