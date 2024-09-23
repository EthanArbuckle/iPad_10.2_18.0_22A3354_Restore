@implementation CCUICABasicAnimationParameters

- (CCUICABasicAnimationParameters)init
{
  return (CCUICABasicAnimationParameters *)-[CCUICABasicAnimationParameters _initWithAnimationParameters:](self, "_initWithAnimationParameters:", 0);
}

- (id)_initWithAnimationParameters:(id)a3
{
  id v4;
  CCUICABasicAnimationParameters *v5;
  double v6;
  void *v7;
  uint64_t v8;
  CCUIAnimationTimingFunctionDescription *timingFunction;
  float v10;
  float v11;
  float v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CCUICABasicAnimationParameters;
  v5 = -[CCUICABasicAnimationParameters init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "duration");
    v5->_duration = v6;
    objc_msgSend(v4, "timingFunction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copyWithZone:", 0);
    timingFunction = v5->_timingFunction;
    v5->_timingFunction = (CCUIAnimationTimingFunctionDescription *)v8;

    if (v4)
    {
      objc_msgSend(v4, "frameRateRange");
      v5->_frameRateRange.minimum = v10;
      v5->_frameRateRange.maximum = v11;
      v5->_frameRateRange.preferred = v12;
      v5->_highFrameRateReason = objc_msgSend(v4, "highFrameRateReason");
    }
    else
    {
      v13 = MEMORY[0x1E0CD23C0];
      *(_QWORD *)&v5->_frameRateRange.minimum = *MEMORY[0x1E0CD23C0];
      v5->_frameRateRange.preferred = *(float *)(v13 + 8);
    }
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  float v7;
  float v8;
  float v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUICABasicAnimationParameters duration](self, "duration");
  v4 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("Duration"), 1);
  -[CCUICABasicAnimationParameters timingFunction](self, "timingFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("Timing Function"));

  -[CCUICABasicAnimationParameters frameRateRange](self, "frameRateRange");
  CCUIStringFromCAFrameRateRange(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("FrameRateRange"));

  v11 = (id)objc_msgSend(v3, "appendInteger:withName:", -[CCUICABasicAnimationParameters highFrameRateReason](self, "highFrameRateReason"), CFSTR("highFrameRateReason"));
  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
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
  -[CCUICABasicAnimationParameters duration](self, "duration");
  v4 = (id)objc_msgSend(v3, "appendDouble:");
  -[CCUICABasicAnimationParameters timingFunction](self, "timingFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:", v5);

  -[CCUICABasicAnimationParameters frameRateRange](self, "frameRateRange");
  v8 = v7;
  v10 = v9;
  v11 = (id)objc_msgSend(v3, "appendFloat:");
  LODWORD(v12) = v8;
  v13 = (id)objc_msgSend(v3, "appendFloat:", v12);
  LODWORD(v14) = v10;
  v15 = (id)objc_msgSend(v3, "appendFloat:", v14);
  v16 = (id)objc_msgSend(v3, "appendInteger:", -[CCUICABasicAnimationParameters highFrameRateReason](self, "highFrameRateReason"));
  v17 = objc_msgSend(v3, "hash");

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  CCUICABasicAnimationParameters *v4;
  CCUICABasicAnimationParameters *v5;
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

  v4 = (CCUICABasicAnimationParameters *)a3;
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
      -[CCUICABasicAnimationParameters duration](self, "duration");
      -[CCUICABasicAnimationParameters duration](v5, "duration");
      if (BSCompareFloats())
        goto LABEL_10;
      -[CCUICABasicAnimationParameters timingFunction](self, "timingFunction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUICABasicAnimationParameters timingFunction](v5, "timingFunction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = BSEqualObjects();

      if (!v8)
        goto LABEL_10;
      -[CCUICABasicAnimationParameters frameRateRange](self, "frameRateRange");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[CCUICABasicAnimationParameters frameRateRange](v5, "frameRateRange");
      v22.minimum = v15;
      v22.maximum = v16;
      v22.preferred = v17;
      v21.minimum = v10;
      v21.maximum = v12;
      v21.preferred = v14;
      if (CAFrameRateRangeIsEqualToRange(v21, v22))
      {
        v18 = -[CCUICABasicAnimationParameters highFrameRateReason](self, "highFrameRateReason");
        v19 = v18 == -[CCUICABasicAnimationParameters highFrameRateReason](v5, "highFrameRateReason");
      }
      else
      {
LABEL_10:
        v19 = 0;
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
  return -[CCUICABasicAnimationParameters _initWithAnimationParameters:]([CCUIMutableCABasicAnimationParameters alloc], "_initWithAnimationParameters:", self);
}

- (double)duration
{
  return self->_duration;
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
