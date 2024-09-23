@implementation PHASEGroupPresetSetting

- (PHASEGroupPresetSetting)init
{
  -[PHASEGroupPresetSetting doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEGroupPresetSetting)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEGroupPresetSetting)initWithGain:(double)a3 rate:(double)a4 gainHighFrequency:(double)a5 gainLowFrequency:(double)a6 gainCurveType:(int64_t)a7 rateCurveType:(int64_t)a8
{
  PHASEGroupPresetSetting *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PHASEGroupPresetSetting;
  v15 = -[PHASEGroupPresetSetting init](&v29, sel_init);
  if (v15)
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_gain = PHASEGetPropertyBounded<double>(v17, v18, a3, 0.0, 1.0);

    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_gainHighFrequency = PHASEGetPropertyBounded<double>(v20, v21, a5, 0.0, 1.0);

    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_gainLowFrequency = PHASEGetPropertyBounded<double>(v23, v24, a6, 0.0, 1.0);

    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_rate = PHASEGetPropertyBounded<double>(v26, v27, a4, 0.25, 4.0);

    v15->_gainCurveType = a7;
    v15->_rateCurveType = a8;
  }
  return v15;
}

- (PHASEGroupPresetSetting)initWithGain:(double)gain rate:(double)rate gainCurveType:(PHASECurveType)gainCurveType rateCurveType:(PHASECurveType)rateCurveType
{
  return -[PHASEGroupPresetSetting initWithGain:rate:gainHighFrequency:gainLowFrequency:gainCurveType:rateCurveType:](self, "initWithGain:rate:gainHighFrequency:gainLowFrequency:gainCurveType:rateCurveType:", gainCurveType, rateCurveType, gain, rate, 1.0, 1.0);
}

- (double)gain
{
  return self->_gain;
}

- (double)rate
{
  return self->_rate;
}

- (PHASECurveType)gainCurveType
{
  return self->_gainCurveType;
}

- (PHASECurveType)rateCurveType
{
  return self->_rateCurveType;
}

- (double)gainHighFrequency
{
  return self->_gainHighFrequency;
}

- (double)gainLowFrequency
{
  return self->_gainLowFrequency;
}

@end
