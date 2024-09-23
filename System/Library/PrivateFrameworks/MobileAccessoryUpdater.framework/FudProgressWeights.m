@implementation FudProgressWeights

- (FudProgressWeights)initWithPrepareWeight:(float)a3 applyWeight:(float)a4 finishWeight:(float)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  FudProgressWeights *v14;
  FudProgressWeights *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FudProgressWeights;
  v14 = -[FudProgressWeights init](&v17, sel_init);
  v14->prepareWeight = a3;
  v14->applyWeight = a4;
  v14->finishWeight = a5;
  if ((float)((float)(a3 + a4) + a5) != 1.0)
  {
    FudLog(3, (uint64_t)CFSTR("Can't create progress weights if total doesn't equal 1"), v8, v9, v10, v11, v12, v13, (uint64_t)v17.receiver);
    v15 = v14;
    return 0;
  }
  return v14;
}

- (double)calculateOverallProgressWithStepProgress:(double)a3 step:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  double v11;
  double finishWeight;
  uint64_t vars0;

  if (a3 >= 0.0)
  {
    switch(a4)
    {
      case 10:
        v11 = (float)((float)(self->applyWeight * 100.0) + (float)(self->prepareWeight * 100.0));
        finishWeight = self->finishWeight;
        break;
      case 9:
        v11 = (float)(self->prepareWeight * 100.0);
        finishWeight = self->applyWeight;
        break;
      case 8:
        return self->prepareWeight * a3;
      default:
        v9 = CFSTR("This is not an operation that supports weighted progress.");
        goto LABEL_11;
    }
    return v11 + finishWeight * a3;
  }
  v9 = CFSTR("Can't calculate overall progress with negative step progress");
LABEL_11:
  FudLog(3, (uint64_t)v9, *(uint64_t *)&a4, v4, v5, v6, v7, v8, vars0);
  return -1.0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("prepare:%f apply:%f finish:%f"), self->prepareWeight, self->applyWeight, self->finishWeight);
}

- (float)prepareWeight
{
  return self->prepareWeight;
}

- (void)setPrepareWeight:(float)a3
{
  self->prepareWeight = a3;
}

- (float)applyWeight
{
  return self->applyWeight;
}

- (void)setApplyWeight:(float)a3
{
  self->applyWeight = a3;
}

- (float)finishWeight
{
  return self->finishWeight;
}

- (void)setFinishWeight:(float)a3
{
  self->finishWeight = a3;
}

@end
