@implementation BWBoundingBoxInferenceConfiguration

- (void)setLogger:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setInferenceInputUsesPortraitOrientation:(BOOL)a3
{
  self->_inferenceInputUsesPortraitOrientation = a3;
}

- (BOOL)inferenceInputUsesPortraitOrientation
{
  return self->_inferenceInputUsesPortraitOrientation;
}

- (float)trackingThreshold
{
  return self->_trackingThreshold;
}

- (float)maxMatchCost
{
  return self->_maxMatchCost;
}

- (FigCaptureLogSmartCameraGating)logger
{
  return self->_logger;
}

- (BOOL)interiorSuppression
{
  return self->_interiorSuppression;
}

- (float)interiorSuppressionPadding
{
  return self->_interiorSuppressionPadding;
}

- (float)fontSizeStopReportingThreshold
{
  return self->_fontSizeStopReportingThreshold;
}

- (float)fontSizeStartReportingThreshold
{
  return self->_fontSizeStartReportingThreshold;
}

- (BWSmartCameraScene)confidenceFilterSettings
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].filteredConfidence;
  *(_OWORD *)&retstr->enabled = *(_OWORD *)&self[1].name;
  *(_OWORD *)&retstr->confidenceHysteresisValueLag = v3;
  retstr->name = *(char **)&self[2].currentTemporalHysteresis;
  return self;
}

- (float)angularOffsetExponentialSmoothing
{
  return self->_angularOffsetExponentialSmoothing;
}

- (void)setTrackingThreshold:(float)a3
{
  self->_trackingThreshold = a3;
}

- (void)setMaxMatchCost:(float)a3
{
  self->_maxMatchCost = a3;
}

- (void)setInteriorSuppressionPadding:(float)a3
{
  self->_interiorSuppressionPadding = a3;
}

- (void)setInteriorSuppression:(BOOL)a3
{
  self->_interiorSuppression = a3;
}

- (void)setFontSizeStopReportingThreshold:(float)a3
{
  self->_fontSizeStopReportingThreshold = a3;
}

- (void)setFontSizeStartReportingThreshold:(float)a3
{
  self->_fontSizeStartReportingThreshold = a3;
}

- (void)setConfidenceFilterSettings:(BWSmartCameraScene *)a3
{
  char *name;
  __int128 v4;

  name = a3->name;
  v4 = *(_OWORD *)&a3->confidenceHysteresisValueLag;
  *(_OWORD *)&self->_confidenceFilterSettings.enabled = *(_OWORD *)&a3->enabled;
  *(_OWORD *)&self->_confidenceFilterSettings.confidenceHysteresisValueLag = v4;
  self->_confidenceFilterSettings.name = name;
}

- (void)setAngularOffsetExponentialSmoothing:(float)a3
{
  self->_angularOffsetExponentialSmoothing = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWBoundingBoxInferenceConfiguration;
  -[BWInferenceConfiguration dealloc](&v3, sel_dealloc);
}

@end
