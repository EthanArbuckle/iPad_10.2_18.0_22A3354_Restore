@implementation BSMonotonicReferenceTime

+ (id)now
{
  id v2;
  double v3;
  double v4;
  _QWORD *v5;
  objc_super v7;

  v2 = objc_alloc((Class)a1);
  v3 = +[BSMonotonicReferenceTime _timeIntervalSinceInternalClockReference]();
  if (v2)
  {
    v4 = v3;
    v7.receiver = v2;
    v7.super_class = (Class)BSMonotonicReferenceTime;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    if (v5)
      *((double *)v5 + 1) = v4;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (double)_timeIntervalSinceInternalClockReference
{
  timespec v1;

  objc_opt_self();
  v1.tv_sec = 0;
  v1.tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC, &v1);
  return (double)v1.tv_sec + (double)v1.tv_nsec * 0.000000001;
}

+ (id)distantPast
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BSMonotonicReferenceTime_distantPast__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_29 != -1)
    dispatch_once(&_MergedGlobals_29, block);
  return (id)qword_1ECD39A30;
}

void __39__BSMonotonicReferenceTime_distantPast__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "referenceTimeWithTimeIntervalSinceNow:", -6.31152e10);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECD39A30;
  qword_1ECD39A30 = v1;

}

+ (id)distantFuture
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__BSMonotonicReferenceTime_distantFuture__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD39A38 != -1)
    dispatch_once(&qword_1ECD39A38, block);
  return (id)qword_1ECD39A40;
}

void __41__BSMonotonicReferenceTime_distantFuture__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "referenceTimeWithTimeIntervalSinceNow:", 6.31152e10);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECD39A40;
  qword_1ECD39A40 = v1;

}

+ (id)referenceTimeWithTimeIntervalSinceNow:(double)a3
{
  double v5;
  double *v6;
  objc_super v8;

  v5 = +[BSMonotonicReferenceTime _timeIntervalSinceInternalClockReference]();
  v6 = (double *)objc_alloc((Class)a1);
  if (v6)
  {
    v8.receiver = v6;
    v8.super_class = (Class)BSMonotonicReferenceTime;
    v6 = objc_msgSendSuper2(&v8, sel_init);
    if (v6)
      v6[1] = v5 + a3;
  }
  return v6;
}

+ (id)referenceTimeForDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "timeIntervalSinceNow");
  objc_msgSend(a1, "referenceTimeWithTimeIntervalSinceNow:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)timeIntervalToNow
{
  return +[BSMonotonicReferenceTime _timeIntervalSinceInternalClockReference]() - self->_startTimeStamp;
}

- (double)timeIntervalSinceNow
{
  double v2;

  -[BSMonotonicReferenceTime timeIntervalToNow](self, "timeIntervalToNow");
  return -v2;
}

- (double)timeIntervalSinceReferenceTime:(id)a3
{
  return self->_startTimeStamp - *((double *)a3 + 1);
}

- (id)date
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[BSMonotonicReferenceTime timeIntervalSinceNow](self, "timeIntervalSinceNow");
  return (id)objc_msgSend(v2, "dateWithTimeIntervalSinceNow:");
}

@end
