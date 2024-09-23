@implementation BWInferenceDataDependency

- (BWInferenceDataRequirement)dataRequirement
{
  return self->_dataRequirement;
}

- (BWInferenceDataDependency)initWithInferenceRequirement:(id)a3 dependentOnDataRequirement:(id)a4
{
  BWInferenceDataDependency *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWInferenceDataDependency;
  v6 = -[BWInferenceDataDependency init](&v8, sel_init);
  if (v6)
  {
    v6->_dataRequirement = (BWInferenceDataRequirement *)a4;
    v6->_inferenceRequirement = (BWInferenceRequirement *)a3;
  }
  return v6;
}

- (BWInferenceRequirement)inferenceRequirement
{
  return self->_inferenceRequirement;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceDataDependency;
  -[BWInferenceDataDependency dealloc](&v3, sel_dealloc);
}

@end
