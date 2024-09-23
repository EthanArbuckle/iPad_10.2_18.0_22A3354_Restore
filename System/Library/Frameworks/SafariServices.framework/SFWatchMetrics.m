@implementation SFWatchMetrics

+ (SFWatchMetrics)currentMetrics
{
  void *v2;
  SFWatchMetrics *v4;
  void *v5;

  v2 = (void *)currentMetrics_currentMetrics;
  if (!currentMetrics_currentMetrics)
  {
    v4 = objc_alloc_init(SFWatchMetrics);
    v5 = (void *)currentMetrics_currentMetrics;
    currentMetrics_currentMetrics = (uint64_t)v4;

    v2 = (void *)currentMetrics_currentMetrics;
  }
  return (SFWatchMetrics *)v2;
}

- (SFWatchMetrics)init
{
  SFWatchMetrics *v2;
  SFWatchMetrics *v3;
  SFWatchMetrics *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFWatchMetrics;
  v2 = -[SFWatchMetrics init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (double)minimumFontScaleFactor
{
  return 0.7;
}

- (double)closeButtonTopToBaselineSpacing
{
  return self->_closeButtonTopToBaselineSpacing;
}

- (double)headerButtonFontPointSize
{
  return self->_headerButtonFontPointSize;
}

- (double)headerButtonPadding
{
  return self->_headerButtonPadding;
}

@end
