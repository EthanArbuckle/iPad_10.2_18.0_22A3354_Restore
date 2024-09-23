@implementation HKLineSeriesPresentationStyle

- (void)setSineWaveSmoothingFactor:(double)a3
{
  void *v6;
  void *v7;

  if (a3 >= 0.5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKLineSeries.m"), 1157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sineWaveSmoothingFactor < 0.5"));

  }
  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKLineSeries.m"), 1158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sineWaveSmoothingFactor >= 0"));

  }
  self->_sineWaveSmoothingFactor = a3;
}

- (HKStrokeStyle)strokeStyle
{
  return self->_strokeStyle;
}

- (void)setStrokeStyle:(id)a3
{
  objc_storeStrong((id *)&self->_strokeStyle, a3);
}

- (HKFillStyle)fillStyle
{
  return self->_fillStyle;
}

- (void)setFillStyle:(id)a3
{
  objc_storeStrong((id *)&self->_fillStyle, a3);
}

- (HKLineSeriesPointMarkerStyle)pointMarkerStyle
{
  return self->_pointMarkerStyle;
}

- (void)setPointMarkerStyle:(id)a3
{
  objc_storeStrong((id *)&self->_pointMarkerStyle, a3);
}

- (HKLineSeriesPointMarkerStyle)endCapStyle
{
  return self->_endCapStyle;
}

- (void)setEndCapStyle:(id)a3
{
  objc_storeStrong((id *)&self->_endCapStyle, a3);
}

- (unint64_t)waveForm
{
  return self->_waveForm;
}

- (void)setWaveForm:(unint64_t)a3
{
  self->_waveForm = a3;
}

- (HKAxisLabelStyle)annotationStyle
{
  return self->_annotationStyle;
}

- (void)setAnnotationStyle:(id)a3
{
  objc_storeStrong((id *)&self->_annotationStyle, a3);
}

- (HKLegendPointAnnotationStyle)legendAnnotationStyle
{
  return self->_legendAnnotationStyle;
}

- (void)setLegendAnnotationStyle:(id)a3
{
  objc_storeStrong((id *)&self->_legendAnnotationStyle, a3);
}

- (HKAxisLabelStyle)axisAnnotationStyle
{
  return self->_axisAnnotationStyle;
}

- (void)setAxisAnnotationStyle:(id)a3
{
  objc_storeStrong((id *)&self->_axisAnnotationStyle, a3);
}

- (BOOL)shouldNegateAnnotationValue
{
  return self->_shouldNegateAnnotationValue;
}

- (void)setShouldNegateAnnotationValue:(BOOL)a3
{
  self->_shouldNegateAnnotationValue = a3;
}

- (double)sineWaveSmoothingFactor
{
  return self->_sineWaveSmoothingFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisAnnotationStyle, 0);
  objc_storeStrong((id *)&self->_legendAnnotationStyle, 0);
  objc_storeStrong((id *)&self->_annotationStyle, 0);
  objc_storeStrong((id *)&self->_endCapStyle, 0);
  objc_storeStrong((id *)&self->_pointMarkerStyle, 0);
  objc_storeStrong((id *)&self->_fillStyle, 0);
  objc_storeStrong((id *)&self->_strokeStyle, 0);
}

@end
