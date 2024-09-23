@implementation HKInteractiveChartAudioData

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[HKInteractiveChartAudioData duration](self, "duration");
  -[HKInteractiveChartAudioData _durationString:](self, "_durationString:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAudioData overviewData](self, "overviewData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HKInteractiveChartAudioData overviewData](self, "overviewData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("nil");
  }

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[HKInteractiveChartAudioData averageLEQ](self, "averageLEQ");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("HKInteractiveChartAudioData(%p, average %.2f, duration %@, overview %@)"), self, v8, v3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)_durationString:(double)a3
{
  double v3;
  double v4;
  double v5;

  v3 = floor(a3 / 3600.0);
  v4 = a3 - v3 * 3600.0;
  v5 = floor(v4 / 60.0);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02.0f:%02.0f:%02.2f"), *(_QWORD *)&v3, *(_QWORD *)&v5, v4 - v5 * 60.0);
}

- (double)averageLEQ
{
  return self->_averageLEQ;
}

- (void)setAverageLEQ:(double)a3
{
  self->_averageLEQ = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (HKInteractiveChartAudioData)overviewData
{
  return self->_overviewData;
}

- (void)setOverviewData:(id)a3
{
  objc_storeStrong((id *)&self->_overviewData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overviewData, 0);
}

@end
