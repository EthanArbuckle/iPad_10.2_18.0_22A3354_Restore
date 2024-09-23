@implementation GEOSearchAutoRedoThreshold

- (GEOSearchAutoRedoThreshold)init
{
  GEOSearchAutoRedoThreshold *result;

  result = (GEOSearchAutoRedoThreshold *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOSearchAutoRedoThreshold)initWithSearchAutoRedoThreshold:(id)a3
{
  double *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;

  v4 = (double *)a3;
  if (v4)
  {
    v5 = *((unsigned int *)v4 + 10);
    v6 = v4[3];
    v7 = v4[4];
    v8 = v4[2];
  }
  else
  {
    v5 = 0;
    v7 = 0.0;
    v6 = 0.0;
    v8 = 0.0;
  }

  return -[GEOSearchAutoRedoThreshold initWithNumberOfVisiblePOIsThreshold:zoomInPercentThreshold:zoomOutPercentThreshold:panDeltaThresholdInMeters:](self, "initWithNumberOfVisiblePOIsThreshold:zoomInPercentThreshold:zoomOutPercentThreshold:panDeltaThresholdInMeters:", v5, v6, v7, v8);
}

- (GEOSearchAutoRedoThreshold)initWithNumberOfVisiblePOIsThreshold:(unint64_t)a3 zoomInPercentThreshold:(double)a4 zoomOutPercentThreshold:(double)a5 panDeltaThresholdInMeters:(double)a6
{
  GEOSearchAutoRedoThreshold *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GEOSearchAutoRedoThreshold;
  result = -[GEOSearchAutoRedoThreshold init](&v11, sel_init);
  if (result)
  {
    result->_numberOfVisiblePoisThreshold = a3;
    result->_zoomInPercentThreshold = a4;
    result->_zoomOutPercentThreshold = a5;
    result->_panDeltaThresholdInMeters = a6;
  }
  return result;
}

- (unint64_t)numberOfVisiblePoisThreshold
{
  return self->_numberOfVisiblePoisThreshold;
}

- (double)zoomInPercentThreshold
{
  return self->_zoomInPercentThreshold;
}

- (double)zoomOutPercentThreshold
{
  return self->_zoomOutPercentThreshold;
}

- (double)panDeltaThresholdInMeters
{
  return self->_panDeltaThresholdInMeters;
}

@end
