@implementation GEORouteHypothesizerAnalyticsStore

- (GEORouteHypothesizerAnalyticsStore)init
{
  GEORouteHypothesizerAnalyticsStore *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  GEORouteHypothesizerAnalyticsStore *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEORouteHypothesizerAnalyticsStore;
  v2 = -[GEORouteHypothesizerAnalyticsStore init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    v2->_observedEarlyDeltaFromRequiredTimeToLeave = v4;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v2->_observedLateDeltaFromRequiredTimeToLeave = v6;

    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  NSDate *lastGenerationDate;
  objc_super v4;

  lastGenerationDate = self->_lastGenerationDate;
  self->_lastGenerationDate = 0;

  v4.receiver = self;
  v4.super_class = (Class)GEORouteHypothesizerAnalyticsStore;
  -[GEORouteHypothesizerAnalyticsStore dealloc](&v4, sel_dealloc);
}

- (void)didReroute
{
  if (!self->_stopped)
    ++self->_hypothesizerRerouteCount;
}

- (void)didStartMovingWithExpectedDepartureTime:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  if (!self->_stopped)
  {
    v9 = v4;
    if (self->_lastGenerationDate)
    {
      objc_msgSend(v4, "timeIntervalSinceDate:");
      self->_observedEarlyDeltaFromRequiredTimeToLeave = -v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      self->_observedEarlyDeltaFromRequiredTimeToLeave = v7;

    }
    objc_msgSend(v9, "timeIntervalSinceNow");
    self->_observedLateDeltaFromRequiredTimeToLeave = -v8;
    v4 = v9;
  }

}

- (void)didStopMoving
{
  void *v3;
  double v4;
  double v5;
  id v6;

  if (!self->_stopped)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    self->_observedEarlyDeltaFromRequiredTimeToLeave = v4;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    self->_observedLateDeltaFromRequiredTimeToLeave = v5;

  }
}

- (void)didArriveWithExpectedArrivalTime:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double observedLateDeltaFromRequiredTimeToLeave;
  void *v12;
  double v13;
  double v14;
  BOOL v15;
  double observedEarlyDeltaFromRequiredTimeToLeave;
  double v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  if (!self->_stopped)
  {
    v20 = v4;
    if (self->_lastGenerationDate)
    {
      objc_msgSend(v4, "timeIntervalSinceDate:");
      v6 = -v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v6 = v8;

    }
    objc_msgSend(v20, "timeIntervalSinceNow");
    v10 = -v9;
    observedLateDeltaFromRequiredTimeToLeave = self->_observedLateDeltaFromRequiredTimeToLeave;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = v13;

    v15 = observedLateDeltaFromRequiredTimeToLeave == v14;
    observedEarlyDeltaFromRequiredTimeToLeave = v6;
    v17 = v10;
    if (!v15)
    {
      observedEarlyDeltaFromRequiredTimeToLeave = self->_observedEarlyDeltaFromRequiredTimeToLeave;
      v17 = self->_observedLateDeltaFromRequiredTimeToLeave;
    }
    +[GEONavdAnalyticsManager sharedManager](GEONavdAnalyticsManager, "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "analyticsReporter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recordEarlyDepartureDelta:lateDepartureDelta:earlyArrivalDelta:lateArrivalDelta:rerouteCount:uiNotification:", self->_hypothesizerRerouteCount, self->_uiNotificationType, observedEarlyDeltaFromRequiredTimeToLeave, v17, v6, v10);

    v4 = v20;
  }

}

- (void)didGenerateHypothesis
{
  NSDate *v3;
  NSDate *lastGenerationDate;
  void *v5;
  void *v6;

  if (!self->_stopped)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastGenerationDate = self->_lastGenerationDate;
    self->_lastGenerationDate = v3;

    +[GEONavdAnalyticsManager sharedManager](GEONavdAnalyticsManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "analyticsReporter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordUniqueHypothesis");

    ++self->_hypothesisCount;
  }
}

- (void)didStopHypothesizing
{
  void *v3;
  id v4;

  if (!self->_stopped)
  {
    +[GEONavdAnalyticsManager sharedManager](GEONavdAnalyticsManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "analyticsReporter");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "recordHypothesisReroutes:", self->_hypothesizerRerouteCount);
    objc_msgSend(v4, "recordHypothesisCountPerHypothesizer:", self->_hypothesisCount);
    self->_stopped = 1;

  }
}

- (void)didShowUI:(unint64_t)a3
{
  self->_uiNotificationType = a3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double observedEarlyDeltaFromRequiredTimeToLeave;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  observedEarlyDeltaFromRequiredTimeToLeave = self->_observedEarlyDeltaFromRequiredTimeToLeave;
  v13 = a3;
  objc_msgSend(v4, "numberWithDouble:", observedEarlyDeltaFromRequiredTimeToLeave);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("observedEarlyDeltaFromRequiredTimeToLeave"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_observedLateDeltaFromRequiredTimeToLeave);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("observedDeltaFromRequiredTimeToLeave"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_hypothesizerRerouteCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("hypothesizerRerouteCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_etaUpdatesAfterEventStart);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("etaUpdatesAfterEventStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_etaUpdatesWereReported);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("etaUpdatesWereReported"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_hypothesisCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("hypothesisCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_uiNotificationType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("uiNotificationType"));

  objc_msgSend(v13, "encodeObject:forKey:", self->_lastGenerationDate, CFSTR("lastGenerationDate"));
}

- (GEORouteHypothesizerAnalyticsStore)initWithCoder:(id)a3
{
  id v4;
  GEORouteHypothesizerAnalyticsStore *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDate *lastGenerationDate;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GEORouteHypothesizerAnalyticsStore;
  v5 = -[GEORouteHypothesizerAnalyticsStore init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("observedEarlyDeltaFromRequiredTimeToLeave"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      v5->_observedEarlyDeltaFromRequiredTimeToLeave = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      v5->_observedEarlyDeltaFromRequiredTimeToLeave = v10;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("observedDeltaFromRequiredTimeToLeave"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "doubleValue");
      v5->_observedLateDeltaFromRequiredTimeToLeave = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      v5->_observedLateDeltaFromRequiredTimeToLeave = v14;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hypothesizerRerouteCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hypothesizerRerouteCount = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("etaUpdatesAfterEventStart"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_etaUpdatesAfterEventStart = objc_msgSend(v16, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("etaUpdatesWereReported"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_etaUpdatesWereReported = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hypothesisCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hypothesisCount = objc_msgSend(v18, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uiNotificationType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_uiNotificationType = objc_msgSend(v19, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastGenerationDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    lastGenerationDate = v5->_lastGenerationDate;
    v5->_lastGenerationDate = (NSDate *)v20;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)etaUpdatesAfterEventStart
{
  return self->_etaUpdatesAfterEventStart;
}

- (void)setEtaUpdatesAfterEventStart:(unint64_t)a3
{
  self->_etaUpdatesAfterEventStart = a3;
}

- (BOOL)etaUpdatesWereReported
{
  return self->_etaUpdatesWereReported;
}

- (void)setEtaUpdatesWereReported:(BOOL)a3
{
  self->_etaUpdatesWereReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGenerationDate, 0);
}

@end
