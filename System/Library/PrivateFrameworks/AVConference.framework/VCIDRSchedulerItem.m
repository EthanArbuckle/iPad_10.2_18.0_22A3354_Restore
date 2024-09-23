@implementation VCIDRSchedulerItem

- (VCIDRSchedulerItem)init
{
  VCIDRSchedulerItem *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCIDRSchedulerItem;
  v2 = -[VCIDRSchedulerItem init](&v4, sel_init);
  if (v2)
  {
    v2->_streams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_framePosition = -1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCIDRSchedulerItem;
  -[VCIDRSchedulerItem dealloc](&v3, sel_dealloc);
}

- (void)addStream:(id)a3
{
  unsigned int weightFactor;
  unsigned int v6;

  -[NSMutableArray addObject:](self->_streams, "addObject:");
  weightFactor = self->_weightFactor;
  if (weightFactor <= objc_msgSend(a3, "weightFactor"))
    v6 = objc_msgSend(a3, "weightFactor");
  else
    v6 = self->_weightFactor;
  self->_weightFactor = v6;
}

- (int64_t)compareBudget:(id)a3
{
  unsigned int budgetInCaptureFrames;
  unsigned int v7;

  budgetInCaptureFrames = self->_budgetInCaptureFrames;
  if (budgetInCaptureFrames > objc_msgSend(a3, "budgetInCaptureFrames"))
    return -1;
  v7 = self->_budgetInCaptureFrames;
  return v7 != objc_msgSend(a3, "budgetInCaptureFrames");
}

- (id)description
{
  void *v3;
  uint64_t budgetInCaptureFrames;
  uint64_t weightFactor;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  budgetInCaptureFrames = self->_budgetInCaptureFrames;
  weightFactor = self->_weightFactor;
  if (self->_framePosition == -1)
    v6 = CFSTR("N/A");
  else
    v6 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_framePosition);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("IDR Scheduler Item: Budget=%d (frames) weightFactor:%d framePosition:%@ streams:%@"), budgetInCaptureFrames, weightFactor, v6, self->_streams);
}

- (unsigned)budgetInCaptureFrames
{
  return self->_budgetInCaptureFrames;
}

- (void)setBudgetInCaptureFrames:(unsigned int)a3
{
  self->_budgetInCaptureFrames = a3;
}

- (NSArray)streams
{
  return &self->_streams->super;
}

- (unsigned)weightFactor
{
  return self->_weightFactor;
}

- (void)setWeightFactor:(unsigned int)a3
{
  self->_weightFactor = a3;
}

- (unsigned)framePosition
{
  return self->_framePosition;
}

- (void)setFramePosition:(unsigned int)a3
{
  self->_framePosition = a3;
}

@end
