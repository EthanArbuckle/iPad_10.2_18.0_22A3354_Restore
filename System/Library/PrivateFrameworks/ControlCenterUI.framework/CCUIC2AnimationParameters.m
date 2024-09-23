@implementation CCUIC2AnimationParameters

- (CCUIC2AnimationParameters)init
{
  return (CCUIC2AnimationParameters *)-[CCUIC2AnimationParameters _initWithAnimationParameters:](self, "_initWithAnimationParameters:", 0);
}

- (id)_initWithAnimationParameters:(id)a3
{
  id v4;
  CCUIC2AnimationParameters *v5;
  double v6;
  double v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCUIC2AnimationParameters;
  v5 = -[CCUIC2AnimationParameters init](&v13, sel_init);
  if (v5)
  {
    v5->_interactive = objc_msgSend(v4, "isInteractive");
    objc_msgSend(v4, "tension");
    v5->_tension = v6;
    objc_msgSend(v4, "friction");
    v5->_friction = v7;
    if (v4)
    {
      objc_msgSend(v4, "frameRateRange");
      v5->_frameRateRange.minimum = v8;
      v5->_frameRateRange.maximum = v9;
      v5->_frameRateRange.preferred = v10;
      v5->_highFrameRateReason = objc_msgSend(v4, "highFrameRateReason");
    }
    else
    {
      v11 = MEMORY[0x1E0CD23C0];
      *(_QWORD *)&v5->_frameRateRange.minimum = *MEMORY[0x1E0CD23C0];
      v5->_frameRateRange.preferred = *(float *)(v11 + 8);
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
  float v7;
  float v8;
  float v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[CCUIC2AnimationParameters isInteractive](self, "isInteractive"), CFSTR("Interactive"));
  -[CCUIC2AnimationParameters tension](self, "tension");
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("Tension"));
  -[CCUIC2AnimationParameters friction](self, "friction");
  v6 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("Friction"));
  -[CCUIC2AnimationParameters frameRateRange](self, "frameRateRange");
  CCUIStringFromCAFrameRateRange(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("FrameRateRange"));

  v11 = (id)objc_msgSend(v3, "appendInteger:withName:", -[CCUIC2AnimationParameters highFrameRateReason](self, "highFrameRateReason"), CFSTR("highFrameRateReason"));
  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  int v7;
  int v8;
  int v9;
  int v10;
  id v11;
  double v12;
  id v13;
  double v14;
  id v15;
  id v16;
  unint64_t v17;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[CCUIC2AnimationParameters isInteractive](self, "isInteractive"));
  -[CCUIC2AnimationParameters tension](self, "tension");
  v5 = (id)objc_msgSend(v3, "appendCGFloat:");
  -[CCUIC2AnimationParameters friction](self, "friction");
  v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  -[CCUIC2AnimationParameters frameRateRange](self, "frameRateRange");
  v8 = v7;
  v10 = v9;
  v11 = (id)objc_msgSend(v3, "appendFloat:");
  LODWORD(v12) = v8;
  v13 = (id)objc_msgSend(v3, "appendFloat:", v12);
  LODWORD(v14) = v10;
  v15 = (id)objc_msgSend(v3, "appendFloat:", v14);
  v16 = (id)objc_msgSend(v3, "appendInteger:", -[CCUIC2AnimationParameters highFrameRateReason](self, "highFrameRateReason"));
  v17 = objc_msgSend(v3, "hash");

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  CCUIC2AnimationParameters *v4;
  CCUIC2AnimationParameters *v5;
  _BOOL4 v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  unsigned int v16;
  BOOL v17;
  CAFrameRateRange v19;
  CAFrameRateRange v20;

  v4 = (CCUIC2AnimationParameters *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = -[CCUIC2AnimationParameters isInteractive](self, "isInteractive");
      if (v6 != -[CCUIC2AnimationParameters isInteractive](v5, "isInteractive"))
        goto LABEL_11;
      -[CCUIC2AnimationParameters tension](self, "tension");
      -[CCUIC2AnimationParameters tension](v5, "tension");
      if (BSCompareFloats())
        goto LABEL_11;
      -[CCUIC2AnimationParameters friction](self, "friction");
      -[CCUIC2AnimationParameters friction](v5, "friction");
      if (BSCompareFloats())
        goto LABEL_11;
      -[CCUIC2AnimationParameters frameRateRange](self, "frameRateRange");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      -[CCUIC2AnimationParameters frameRateRange](v5, "frameRateRange");
      v20.minimum = v13;
      v20.maximum = v14;
      v20.preferred = v15;
      v19.minimum = v8;
      v19.maximum = v10;
      v19.preferred = v12;
      if (!CAFrameRateRangeIsEqualToRange(v19, v20))
      {
LABEL_11:
        v17 = 0;
      }
      else
      {
        v16 = -[CCUIC2AnimationParameters highFrameRateReason](self, "highFrameRateReason");
        v17 = v16 == -[CCUIC2AnimationParameters highFrameRateReason](v5, "highFrameRateReason");
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CCUIC2AnimationParameters _initWithAnimationParameters:]([CCUIMutableC2AnimationParameters alloc], "_initWithAnimationParameters:", self);
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (double)tension
{
  return self->_tension;
}

- (double)friction
{
  return self->_friction;
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

@end
