@implementation HKSleepChartPointUserInfo

- (HKSleepChartPointUserInfo)initWithSeriesType:(int64_t)a3 sleepDaySummary:(id)a4
{
  id v7;
  HKSleepChartPointUserInfo *v8;
  HKSleepChartPointUserInfo *v9;
  NSNumber *currentValueViewOverridePrefixColorsActive;
  NSNumber *annotationOverrideDuration;
  HKValueRange *annotationOverrideDateRange;
  NSNumber *annotationOverridePrefixColorsActive;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSleepChartPointUserInfo;
  v8 = -[HKSleepChartPointUserInfo init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_seriesType = a3;
    objc_storeStrong((id *)&v8->_sleepDaySummary, a4);
    *(_OWORD *)&v9->_currentValueViewOptions = xmmword_1D7B81D20;
    currentValueViewOverridePrefixColorsActive = v9->_currentValueViewOverridePrefixColorsActive;
    v9->_currentValueViewOverridePrefixColorsActive = 0;

    annotationOverrideDuration = v9->_annotationOverrideDuration;
    v9->_annotationOptions = 3;
    v9->_annotationOverrideDuration = 0;

    annotationOverrideDateRange = v9->_annotationOverrideDateRange;
    v9->_annotationOverrideDateRange = 0;

    annotationOverridePrefixColorsActive = v9->_annotationOverridePrefixColorsActive;
    v9->_annotationOverridePrefixColorsActive = 0;

  }
  return v9;
}

- (id)copyWithAnnotationOptions:(unint64_t)a3
{
  id v5;
  int64_t v6;
  void *v7;
  void *v8;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = -[HKSleepChartPointUserInfo seriesType](self, "seriesType");
  -[HKSleepChartPointUserInfo sleepDaySummary](self, "sleepDaySummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithSeriesType:sleepDaySummary:", v6, v7);

  objc_msgSend(v8, "setAnnotationOptions:", a3);
  objc_msgSend(v8, "setAnnotationOverrideDuration:", self->_annotationOverrideDuration);
  objc_msgSend(v8, "setAnnotationOverrideDateRange:", self->_annotationOverrideDateRange);
  objc_msgSend(v8, "setAnnotationOverridePrefixColorsActive:", self->_annotationOverridePrefixColorsActive);
  objc_msgSend(v8, "setCurrentValueViewOptions:", self->_currentValueViewOptions);
  objc_msgSend(v8, "setCurrentValueViewOptionsPriority:", self->_currentValueViewOptionsPriority);
  objc_msgSend(v8, "setCurrentValueViewOverridePrefixColorsActive:", self->_currentValueViewOverridePrefixColorsActive);
  return v8;
}

- (int64_t)seriesType
{
  return self->_seriesType;
}

- (HKSleepDaySummary)sleepDaySummary
{
  return self->_sleepDaySummary;
}

- (unint64_t)currentValueViewOptions
{
  return self->_currentValueViewOptions;
}

- (void)setCurrentValueViewOptions:(unint64_t)a3
{
  self->_currentValueViewOptions = a3;
}

- (int64_t)currentValueViewOptionsPriority
{
  return self->_currentValueViewOptionsPriority;
}

- (void)setCurrentValueViewOptionsPriority:(int64_t)a3
{
  self->_currentValueViewOptionsPriority = a3;
}

- (NSNumber)currentValueViewOverridePrefixColorsActive
{
  return self->_currentValueViewOverridePrefixColorsActive;
}

- (void)setCurrentValueViewOverridePrefixColorsActive:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueViewOverridePrefixColorsActive, a3);
}

- (unint64_t)annotationOptions
{
  return self->_annotationOptions;
}

- (void)setAnnotationOptions:(unint64_t)a3
{
  self->_annotationOptions = a3;
}

- (NSNumber)annotationOverrideDuration
{
  return self->_annotationOverrideDuration;
}

- (void)setAnnotationOverrideDuration:(id)a3
{
  objc_storeStrong((id *)&self->_annotationOverrideDuration, a3);
}

- (HKValueRange)annotationOverrideDateRange
{
  return self->_annotationOverrideDateRange;
}

- (void)setAnnotationOverrideDateRange:(id)a3
{
  objc_storeStrong((id *)&self->_annotationOverrideDateRange, a3);
}

- (NSNumber)annotationOverridePrefixColorsActive
{
  return self->_annotationOverridePrefixColorsActive;
}

- (void)setAnnotationOverridePrefixColorsActive:(id)a3
{
  objc_storeStrong((id *)&self->_annotationOverridePrefixColorsActive, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationOverridePrefixColorsActive, 0);
  objc_storeStrong((id *)&self->_annotationOverrideDateRange, 0);
  objc_storeStrong((id *)&self->_annotationOverrideDuration, 0);
  objc_storeStrong((id *)&self->_currentValueViewOverridePrefixColorsActive, 0);
  objc_storeStrong((id *)&self->_sleepDaySummary, 0);
}

@end
