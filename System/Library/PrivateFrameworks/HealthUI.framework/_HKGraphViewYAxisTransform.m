@implementation _HKGraphViewYAxisTransform

- (_HKGraphViewYAxisTransform)initWithYAxis:(id)a3 seriesForTransform:(id)a4 startingTransform:(HKLinearTransform)a5 endingTransform:(HKLinearTransform)a6 endingRange:(id)a7
{
  double scale;
  double offset;
  double v10;
  double v11;
  id v15;
  id v16;
  id v17;
  _HKGraphViewYAxisTransform *v18;
  _HKGraphViewYAxisTransform *v19;
  objc_super v21;

  scale = a6.scale;
  offset = a6.offset;
  v10 = a5.scale;
  v11 = a5.offset;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_HKGraphViewYAxisTransform;
  v18 = -[_HKGraphViewYAxisTransform init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_yAxisForTransform, a3);
    objc_storeStrong((id *)&v19->_seriesForTransform, a4);
    v19->_startingTransform.offset = v11;
    v19->_startingTransform.scale = v10;
    v19->_endingTransform.offset = offset;
    v19->_endingTransform.scale = scale;
    objc_storeStrong((id *)&v19->_endingRange, a7);
  }

  return v19;
}

- (HKAxis)yAxisForTransform
{
  return self->_yAxisForTransform;
}

- (NSArray)seriesForTransform
{
  return self->_seriesForTransform;
}

- (HKLinearTransform)startingTransform
{
  double offset;
  double scale;
  HKLinearTransform result;

  offset = self->_startingTransform.offset;
  scale = self->_startingTransform.scale;
  result.scale = scale;
  result.offset = offset;
  return result;
}

- (HKLinearTransform)endingTransform
{
  double offset;
  double scale;
  HKLinearTransform result;

  offset = self->_endingTransform.offset;
  scale = self->_endingTransform.scale;
  result.scale = scale;
  result.offset = offset;
  return result;
}

- (HKValueRange)endingRange
{
  return self->_endingRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingRange, 0);
  objc_storeStrong((id *)&self->_seriesForTransform, 0);
  objc_storeStrong((id *)&self->_yAxisForTransform, 0);
}

@end
