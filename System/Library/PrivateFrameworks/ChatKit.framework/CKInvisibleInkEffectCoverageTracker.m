@implementation CKInvisibleInkEffectCoverageTracker

- (CKInvisibleInkEffectCoverageTracker)initWithSize:(CGSize)a3 touchLifetime:(double)a4
{
  double height;
  double width;
  CKInvisibleInkEffectCoverageTracker *v7;
  CKInvisibleInkEffectCoverageTracker *v8;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CKInvisibleInkEffectCoverageTracker;
  v7 = -[CKInvisibleInkEffectCoverageTracker init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CKInvisibleInkEffectCoverageTracker setSize:](v7, "setSize:", width, height);
    v8->_touchLifetime = a4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_recoverTimer, "invalidate");
  free(self->_expiryTimes);
  v3.receiver = self;
  v3.super_class = (Class)CKInvisibleInkEffectCoverageTracker;
  -[CKInvisibleInkEffectCoverageTracker dealloc](&v3, sel_dealloc);
}

- (void)setSize:(CGSize)a3
{
  CGFloat height;
  uint64x2_t v10;

  if (a3.width != self->_size.width || a3.height != self->_size.height)
  {
    self->_size = a3;
    height = a3.height;
    __asm { FMOV            V2.2D, #1.0 }
    v10 = vcvtq_u64_f64(vmaxnmq_f64(vrndmq_f64(vdivq_f64((float64x2_t)a3, (float64x2_t)vdupq_n_s64(0x4044000000000000uLL))), _Q2));
    *(uint64x2_t *)&self->_width = v10;
    *(float64x2_t *)&self->_cellWidth = vdivq_f64((float64x2_t)a3, vcvtq_f64_u64(v10));
    free(self->_expiryTimes);
    self->_expiryTimes = (double *)malloc_type_malloc(8 * self->_width * self->_height, 0x100004000313F17uLL);
    -[CKInvisibleInkEffectCoverageTracker reset](self, "reset");
  }
}

- (void)reset
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  double *expiryTimes;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  v6 = self->_height * self->_width;
  if (v6)
  {
    expiryTimes = self->_expiryTimes;
    do
    {
      *(_QWORD *)expiryTimes++ = v5;
      --v6;
    }
    while (v6);
  }
  -[CKInvisibleInkEffectCoverageTracker setUncovered:](self, "setUncovered:", 0);
  -[NSTimer invalidate](self->_recoverTimer, "invalidate");
}

- (void)recordTouchAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double cellWidth;
  double cellHeight;
  double Current;
  double v9;
  double v10;
  double v11;
  unint64_t height;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t width;
  double v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  NSTimer *recoverTimer;
  void *v22;
  NSTimer *v23;
  void *v24;
  char v25;
  _QWORD block[5];

  y = a3.y;
  x = a3.x;
  cellWidth = self->_cellWidth;
  cellHeight = self->_cellHeight;
  Current = CFAbsoluteTimeGetCurrent();
  height = self->_height;
  if (height)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v9 = 0.5;
    v10 = cellHeight * 0.5;
    width = self->_width;
    v17 = self->_cellWidth;
    v11 = 2.0;
    do
    {
      if (width)
      {
        v18 = cellWidth * 0.5;
        v19 = width;
        v20 = v13;
        do
        {
          if ((x - v18) * (x - v18) / (v17 * v17) + (y - v10) * (y - v10) / (self->_cellHeight * self->_cellHeight) >= 2.0)
          {
            if (*(double *)((char *)self->_expiryTimes + v20) > Current)
              ++v15;
          }
          else
          {
            *(double *)((char *)self->_expiryTimes + v20) = Current + self->_touchLifetime;
            ++v15;
            v17 = self->_cellWidth;
          }
          v18 = v18 + v17;
          v20 += 8;
          --v19;
        }
        while (v19);
      }
      v10 = v10 + self->_cellHeight;
      ++v14;
      v13 += 8 * width;
      cellWidth = v17;
    }
    while (v14 != height);
  }
  else
  {
    v15 = 0;
  }
  if (!-[CKInvisibleInkEffectCoverageTracker isUncovered](self, "isUncovered", Current, v9, v10, v11)
    && (double)(self->_height * self->_width) * 0.75 < (double)v15)
  {
    -[CKInvisibleInkEffectCoverageTracker setUncovered:](self, "setUncovered:", 1);
    if (-[NSTimer isValid](self->_recoverTimer, "isValid"))
    {
      recoverTimer = self->_recoverTimer;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", self->_touchLifetime);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSTimer setFireDate:](recoverTimer, "setFireDate:", v22);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__checkForCover_, 0, 0, self->_touchLifetime);
      v23 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v22 = self->_recoverTimer;
      self->_recoverTimer = v23;
    }

    -[CKInvisibleInkEffectCoverageTracker delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__CKInvisibleInkEffectCoverageTracker_recordTouchAtPoint___block_invoke;
      block[3] = &unk_1E274A208;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

void __58__CKInvisibleInkEffectCoverageTracker_recordTouchAtPoint___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invisibleInkEffectCoverageTrackerDidUncover:", *(_QWORD *)(a1 + 32));

}

- (void)_checkForCover:(id)a3
{
  double Current;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double *expiryTimes;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSTimer *v16;
  NSTimer *recoverTimer;
  void *v18;
  char v19;
  void *v20;

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  v8 = self->_height * self->_width;
  if (v8)
  {
    v9 = 0;
    expiryTimes = self->_expiryTimes;
    v11 = self->_height * self->_width;
    do
    {
      v12 = *expiryTimes++;
      v13 = v12;
      if (v7 >= v12)
        v14 = v13;
      else
        v14 = v7;
      if (v13 > Current)
      {
        ++v9;
        v7 = v14;
      }
      --v11;
    }
    while (v11);
    v15 = (double)v9;
  }
  else
  {
    v15 = 0.0;
  }
  if ((double)v8 * 0.75 >= v15)
  {
    -[CKInvisibleInkEffectCoverageTracker setUncovered:](self, "setUncovered:", 0);
    -[CKInvisibleInkEffectCoverageTracker delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[CKInvisibleInkEffectCoverageTracker delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "invisibleInkEffectCoverageTrackerDidRecover:", self);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__checkForCover_, 0, 0, v7 - Current);
    v16 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    recoverTimer = self->_recoverTimer;
    self->_recoverTimer = v16;

  }
}

- (CKInvisibleInkEffectCoverageTrackerDelegate)delegate
{
  return (CKInvisibleInkEffectCoverageTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)touchLifetime
{
  return self->_touchLifetime;
}

- (BOOL)isUncovered
{
  return self->_uncovered;
}

- (void)setUncovered:(BOOL)a3
{
  self->_uncovered = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recoverTimer, 0);
}

@end
