@implementation PHASEGeneratorNodeDefinition

- (PHASEGeneratorNodeDefinition)init
{
  -[PHASEGeneratorNodeDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEGeneratorNodeDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)initInternal:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  id v8;
  id v9;
  PHASEGeneratorNodeDefinition *v10;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)PHASEGeneratorNodeDefinition;
    v6 = -[PHASEDefinition initInternal](&v12, sel_initInternal);
    v7 = v6;
    if (v6)
    {
      v6[9] = (id)0x3FF0000000000000;
      v6[2] = 0;
      v6[3] = (id)0x3FF0000000000000;
      v6[4] = (id)0x3FF0000000000000;
      objc_storeWeak(v6 + 5, 0);
      v8 = v7[6];
      v7[6] = 0;

      v9 = v7[7];
      v7[7] = 0;

      objc_storeStrong(v7 + 8, a3);
    }
    self = v7;
    v10 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Cannot create a generator with a nil mixerDefinition"));
    v10 = 0;
  }

  return v10;
}

- (void)setCalibrationMode:(PHASECalibrationMode)calibrationMode level:(double)level
{
  objc_class *v7;
  void *v8;
  double v9;
  objc_class *v10;
  objc_class *v11;
  id v12;

  self->_calibrationMode = calibrationMode;
  if (calibrationMode == PHASECalibrationModeAbsoluteSpl)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = PHASEGetPropertyBounded<double>(v12, v8, level, 0.0, 120.0);
  }
  else if (calibrationMode == PHASECalibrationModeRelativeSpl)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = PHASEGetPropertyBounded<double>(v12, v8, level, -200.0, 12.0);
  }
  else
  {
    if (calibrationMode)
      return;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = PHASEGetPropertyBounded<double>(v12, v8, level, 0.0, 1.0);
  }
  self->_level = v9;

}

- (void)setRate:(double)rate
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_rate = PHASEGetPropertyBounded<double>(v8, v7, rate, 0.25, 4.0);

}

- (PHASECalibrationMode)calibrationMode
{
  return self->_calibrationMode;
}

- (double)level
{
  return self->_level;
}

- (double)rate
{
  return self->_rate;
}

- (PHASEGroup)group
{
  return (PHASEGroup *)objc_loadWeakRetained((id *)&self->_group);
}

- (void)setGroup:(PHASEGroup *)group
{
  objc_storeWeak((id *)&self->_group, group);
}

- (PHASENumberMetaParameterDefinition)gainMetaParameterDefinition
{
  return self->_gainMetaParameterDefinition;
}

- (void)setGainMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)gainMetaParameterDefinition
{
  objc_storeStrong((id *)&self->_gainMetaParameterDefinition, gainMetaParameterDefinition);
}

- (PHASENumberMetaParameterDefinition)rateMetaParameterDefinition
{
  return self->_rateMetaParameterDefinition;
}

- (void)setRateMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)rateMetaParameterDefinition
{
  objc_storeStrong((id *)&self->_rateMetaParameterDefinition, rateMetaParameterDefinition);
}

- (PHASEMixerDefinition)mixerDefinition
{
  return self->_mixerDefinition;
}

- (double)gain
{
  return self->_gain;
}

- (void)setGain:(double)a3
{
  self->_gain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixerDefinition, 0);
  objc_storeStrong((id *)&self->_rateMetaParameterDefinition, 0);
  objc_storeStrong((id *)&self->_gainMetaParameterDefinition, 0);
  objc_destroyWeak((id *)&self->_group);
}

@end
