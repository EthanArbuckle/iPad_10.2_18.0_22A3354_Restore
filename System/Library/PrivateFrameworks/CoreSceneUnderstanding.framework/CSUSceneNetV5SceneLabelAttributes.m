@implementation CSUSceneNetV5SceneLabelAttributes

- (CSUSceneNetV5SceneLabelAttributes)initWithTaxonomyAttributes:(id)a3 forLabel:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CSUSceneNetV5SceneLabelAttributes *v13;
  uint64_t v14;
  NSString *label;
  CSUSceneNetV5SceneLabelAttributes *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSUSceneNetV5SceneLabelAttributes;
  v13 = -[CSUSceneNetV5SceneLabelAttributes init](&v18, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v9, v10, v11, v12);
    label = v13->_label;
    v13->_label = (NSString *)v14;

    objc_storeStrong((id *)&v13->_attributeManager, a3);
    v16 = v13;
  }

  return v13;
}

- (NSArray)detectorClasses
{
  return (NSArray *)objc_msgSend_attributeForKey_label_defaultValue_(self->_attributeManager, a2, (uint64_t)CFSTR("detectorClasses"), (uint64_t)self->_label, MEMORY[0x24BDBD1A8]);
}

- (NSString)humanReadableLabel
{
  return (NSString *)objc_msgSend_attributeForKey_label_defaultValue_(self->_attributeManager, a2, (uint64_t)CFSTR("humanReadableLabel"), (uint64_t)self->_label, (uint64_t)self->_label);
}

- (NSArray)humanReadableSynonyms
{
  return (NSArray *)objc_msgSend_attributeForKey_label_defaultValue_(self->_attributeManager, a2, (uint64_t)CFSTR("humanReadableSynonyms"), (uint64_t)self->_label, MEMORY[0x24BDBD1A8]);
}

- (BOOL)isSearchable
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;

  objc_msgSend_attributeForKey_label_defaultValue_(self->_attributeManager, a2, (uint64_t)CFSTR("isSearchable"), (uint64_t)self->_label, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  if (v2)
  {
    v8 = objc_msgSend_BOOLValue(v2, v3, v4, v5, v6);

    return v8;
  }
  else
  {

    return 0;
  }
}

- (float)photosSearchThreshold
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  float v8;
  float v9;

  objc_msgSend_attributeForKey_label_defaultValue_(self->_attributeManager, a2, (uint64_t)CFSTR("searchThreshold"), (uint64_t)self->_label, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  if (v2)
  {
    objc_msgSend_floatValue(v2, v3, v4, v5, v6);
    v9 = v8;

    return v9;
  }
  else
  {

    return NAN;
  }
}

- (id)_metricOperatingPointCurveForAttribute:(id)a3 metricPattern:(int)a4
{
  uint64_t v4;
  void *v5;
  CSUMetricOperatingPointCurve *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v15;

  v4 = *(_QWORD *)&a4;
  objc_msgSend_attributeForKey_label_defaultValue_(self->_attributeManager, a2, (uint64_t)a3, (uint64_t)self->_label, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [CSUMetricOperatingPointCurve alloc];
    v15 = 0;
    v8 = (void *)objc_msgSend_initWithOperatingPointsData_metricPattern_error_(v6, v7, (uint64_t)v5, v4, (uint64_t)&v15);
    v12 = v15;
    if (v12)
    {
      objc_msgSend_logInternalError_(CSUError, v9, (uint64_t)v12, v10, v11);
      v13 = 0;
    }
    else
    {
      v13 = v8;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (CSUMetricOperatingPointCurve)precisionOperatingPointCurve
{
  return (CSUMetricOperatingPointCurve *)((uint64_t (*)(CSUSceneNetV5SceneLabelAttributes *, char *, const __CFString *, _QWORD))MEMORY[0x24BEDD108])(self, sel__metricOperatingPointCurveForAttribute_metricPattern_, CFSTR("thresholdsByPrecision"), 0);
}

- (CSUMetricOperatingPointCurve)recallOperatingPointCurve
{
  return (CSUMetricOperatingPointCurve *)((uint64_t (*)(CSUSceneNetV5SceneLabelAttributes *, char *, const __CFString *, _QWORD))MEMORY[0x24BEDD108])(self, sel__metricOperatingPointCurveForAttribute_metricPattern_, CFSTR("thresholdsByRecall"), 0);
}

- (CSUMetricOperatingPointCurve)betaFScoreMaximizingOperatingPointCurve
{
  return (CSUMetricOperatingPointCurve *)((uint64_t (*)(CSUSceneNetV5SceneLabelAttributes *, char *, const __CFString *, uint64_t))MEMORY[0x24BEDD108])(self, sel__metricOperatingPointCurveForAttribute_metricPattern_, CFSTR("thresholdsByMaxFScore"), 1);
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_attributeManager, 0);
}

@end
