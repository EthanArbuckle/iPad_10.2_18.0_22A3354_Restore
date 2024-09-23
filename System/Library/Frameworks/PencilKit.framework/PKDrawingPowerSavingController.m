@implementation PKDrawingPowerSavingController

- (PKDrawingPowerSavingController)init
{
  PKDrawingPowerSavingController *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKDrawingPowerSavingController;
  v2 = -[PKDrawingPowerSavingController init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleForKey:", CFSTR("internalSettings.drawing.apt.minimumMovementDistanceFinger"));
    v2->_minimumMovementDistanceFinger = v4;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleForKey:", CFSTR("internalSettings.drawing.apt.minimumMovementDistancePencil"));
    v2->_minimumMovementDistancePencil = v6;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleForKey:", CFSTR("internalSettings.drawing.apt.minimumMovementDistanceTimeout"));
    v2->_minimumMovementDistanceTimeout = v8;

  }
  return v2;
}

- (BOOL)shouldSkipFrameWithFrameStartTimestamp:(double)a3 framesAfterStart:
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double *v8;
  double *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;

  if (!result)
    return result;
  v5 = result;
  if (PKIsVisionDevice())
  {
    v6 = 80;
  }
  else
  {
    v6 = 80;
    if (!*(_BYTE *)(v5 + 104))
      v6 = 88;
  }
  v7 = *(double *)(v5 + v6);
  if (*(double *)(v5 + 56) >= v7)
    return 0;
  v8 = *(double **)(v5 + 8);
  v9 = *(double **)(v5 + 16);
  if (v8 == v9)
  {
    v13 = 0.0;
  }
  else
  {
    v10 = 0;
    v11 = 0.0;
    do
    {
      v12 = *v8++;
      v11 = v11 + v12;
      ++v10;
    }
    while (v8 != v9);
    v13 = v11 / (double)v10;
  }
  if (v13 >= v7)
  {
    kdebug_trace();
    return 0;
  }
  return a3 - *(double *)(v5 + 64) < *(double *)(v5 + 96) && a2 > 4;
}

- (double)accumulateMovementForCurrentFrame
{
  double **v3;
  double *v4;
  double *v5;
  double *v6;
  double v7;
  unint64_t v8;
  double v9;
  double v10;

  if (a1)
  {
    v3 = (double **)(a1 + 8);
    v4 = (double *)(a1 + 48);
    std::vector<double>::insert((char **)(a1 + 8), *(char **)(a1 + 8), (char *)(a1 + 48));
    v6 = *v3;
    v5 = v3[1];
    if ((unint64_t)((char *)v5 - (char *)*v3) >= 0x29)
      *(_QWORD *)(a1 + 16) = --v5;
    v7 = *v4;
    if (*v4 == 0.0)
    {
      if (v6 == v5)
      {
        v7 = 0.0;
      }
      else
      {
        v8 = 0;
        v9 = 0.0;
        do
        {
          v10 = *v6++;
          v9 = v9 + v10;
          ++v8;
        }
        while (v6 != v5);
        v7 = v9 / (double)v8;
      }
    }
    result = v7 + *(double *)(a1 + 56);
    *(double *)(a1 + 56) = result;
    *(_QWORD *)(a1 + 48) = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  double *begin;

  begin = self->_movementDistanceHistoryBuffer.__begin_;
  if (begin)
  {
    self->_movementDistanceHistoryBuffer.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
