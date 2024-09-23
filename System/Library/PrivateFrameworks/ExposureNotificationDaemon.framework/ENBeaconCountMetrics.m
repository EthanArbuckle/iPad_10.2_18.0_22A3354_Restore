@implementation ENBeaconCountMetrics

- (ENBeaconCountMetrics)initWithStartDate:(id)a3 endDate:(id)a4 windowDuration:(double)a5
{
  id v9;
  id v10;
  ENBeaconCountMetrics *v11;
  ENBeaconCountMetrics *v12;
  double v13;
  NSMutableSet *v14;
  NSMutableSet *currentInsertionWindowObservedRPI;
  double v16;
  size_t v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ENBeaconCountMetrics;
  v11 = -[ENBeaconCountMetrics init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    -[NSDate timeIntervalSince1970](v12->_startDate, "timeIntervalSince1970");
    v12->_previousTimestamp = v13;
    objc_storeStrong((id *)&v12->_endDate, a4);
    v12->_windowDuration = a5;
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E28]);
    currentInsertionWindowObservedRPI = v12->_currentInsertionWindowObservedRPI;
    v12->_currentInsertionWindowObservedRPI = v14;

    -[NSDate timeIntervalSinceDate:](v12->_endDate, "timeIntervalSinceDate:", v12->_startDate);
    v17 = vcvtpd_u64_f64(v16 / v12->_windowDuration);
    v12->_beaconCountWindowCount = v17;
    v12->_beaconCountWindows = (unint64_t *)malloc_type_calloc(v17, 8uLL, 0x100004000313F17uLL);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_beaconCountWindows);
  v3.receiver = self;
  v3.super_class = (Class)ENBeaconCountMetrics;
  -[ENBeaconCountMetrics dealloc](&v3, sel_dealloc);
}

- (void)addAdvertisement:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  NSMutableSet *currentInsertionWindowObservedRPI;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "timestamp");
  v5 = v4;
  if (v4 >= self->_previousTimestamp)
  {
    -[NSDate timeIntervalSince1970](self->_startDate, "timeIntervalSince1970");
    if (v5 >= v6)
    {
      -[NSDate timeIntervalSince1970](self->_endDate, "timeIntervalSince1970");
      if (v5 < v7)
      {
        -[NSDate timeIntervalSince1970](self->_startDate, "timeIntervalSince1970");
        v9 = (unint64_t)((v5 - v8) / self->_windowDuration);
        if (self->_currentInsertionWindowIndex != v9)
        {
          -[NSMutableSet removeAllObjects](self->_currentInsertionWindowObservedRPI, "removeAllObjects");
          self->_currentInsertionWindowIndex = v9;
        }
        currentInsertionWindowObservedRPI = self->_currentInsertionWindowObservedRPI;
        objc_msgSend(v12, "rpi");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](currentInsertionWindowObservedRPI, "addObject:", v11);

        self->_beaconCountWindows[self->_currentInsertionWindowIndex] = -[NSMutableSet count](self->_currentInsertionWindowObservedRPI, "count");
        self->_previousTimestamp = v5;
      }
    }
  }

}

- (unint64_t)beaconCountAtDate:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;
  -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
  if (v6 < v7
    || (objc_msgSend(v4, "timeIntervalSinceReferenceDate"),
        v9 = v8,
        -[NSDate timeIntervalSinceReferenceDate](self->_endDate, "timeIntervalSinceReferenceDate"),
        v9 >= v10))
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v4, "timeIntervalSince1970");
    v12 = v11;
    -[NSDate timeIntervalSince1970](self->_startDate, "timeIntervalSince1970");
    v14 = self->_beaconCountWindows[(unint64_t)((v12 - v13) / self->_windowDuration)];
  }

  return v14;
}

- (void)enumerateBeaconCountWindows:(id)a3
{
  unint64_t v4;
  void *v5;
  void (**v6)(id, void *, unint64_t, double);

  v6 = (void (**)(id, void *, unint64_t, double))a3;
  if (self->_beaconCountWindowCount)
  {
    v4 = 0;
    do
    {
      -[NSDate dateByAddingTimeInterval:](self->_startDate, "dateByAddingTimeInterval:", self->_windowDuration * (double)v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v5, self->_beaconCountWindows[v4], self->_windowDuration);

      ++v4;
    }
    while (v4 < self->_beaconCountWindowCount);
  }

}

- (id)differentialPrivacyRepresentationWithCountThresholds:(id)a3
{
  id v4;
  unint64_t v5;
  size_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  void *v17;

  v4 = a3;
  v5 = vcvtpd_u64_f64(86400.0 / self->_windowDuration);
  v6 = objc_msgSend(v4, "count") * v5;
  v7 = malloc_type_calloc(v6, 1uLL, 0x100004077774924uLL);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0C99D40], "calendarWithIdentifier:", *MEMORY[0x1E0C996C0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E78], "timeZoneForSecondsFromGMT:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v10);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__ENBeaconCountMetrics_differentialPrivacyRepresentationWithCountThresholds___block_invoke;
    v14[3] = &unk_1E87D9BC0;
    v15 = v9;
    v16 = v4;
    v17 = v8;
    v11 = v9;
    -[ENBeaconCountMetrics enumerateBeaconCountWindows:](self, "enumerateBeaconCountWindows:", v14);
    objc_msgSend(MEMORY[0x1E0C99D58], "dataWithBytesNoCopy:length:", v8, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __77__ENBeaconCountMetrics_differentialPrivacyRepresentationWithCountThresholds___block_invoke(uint64_t a1, void *a2, unint64_t a3, double a4)
{
  id v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;

  v7 = a2;
  if (a3)
  {
    v16 = v7;
    objc_msgSend(*(id *)(a1 + 32), "startOfDayForDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v8);
    v10 = v9;
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v11 = 0;
      v12 = v10 / a4;
      while (1)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "unsignedIntegerValue");

        if (v14 >= a3)
          break;
        if (++v11 >= (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count"))
          goto LABEL_8;
      }
      v15 = *(_QWORD *)(a1 + 48);
      *(_BYTE *)(v15 + objc_msgSend(*(id *)(a1 + 40), "count") * (unint64_t)(v10 / a4) + v11) = 1;
    }
LABEL_8:

    v7 = v16;
  }

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)windowDuration
{
  return self->_windowDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_currentInsertionWindowObservedRPI, 0);
}

@end
