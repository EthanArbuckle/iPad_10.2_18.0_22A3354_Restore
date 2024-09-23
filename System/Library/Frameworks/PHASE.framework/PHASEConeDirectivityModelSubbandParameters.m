@implementation PHASEConeDirectivityModelSubbandParameters

- (PHASEConeDirectivityModelSubbandParameters)init
{
  PHASEConeDirectivityModelSubbandParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASEConeDirectivityModelSubbandParameters;
  result = -[PHASEConeDirectivityModelSubbandParameters init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_frequency = xmmword_216739CC0;
    *(_OWORD *)&result->_outerAngle = xmmword_216739CD0;
  }
  return result;
}

- (void)setFrequency:(double)frequency
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_frequency = PHASEGetPropertyBounded<double>(v8, v7, frequency, 20.0, 20000.0);

}

- (void)setInnerAngle:(double)innerAngle outerAngle:(double)outerAngle
{
  NSObject *v8;
  double v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (innerAngle <= outerAngle)
  {
    v9 = innerAngle;
  }
  else
  {
    v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    v9 = outerAngle;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315906;
      v17 = "PHASEDirectivityModel.mm";
      v18 = 1024;
      v19 = 91;
      v20 = 2048;
      v21 = innerAngle;
      v22 = 2048;
      v23 = outerAngle;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Warning: innerAngle %f is greater than outerAngle %f. Clamping innerAngle to outerAngle.", (uint8_t *)&v16, 0x26u);
      v9 = outerAngle;
    }
  }
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_innerAngle = PHASEGetPropertyBounded<double>(v11, v12, v9, 0.0, 360.0);

  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_outerAngle = PHASEGetPropertyBounded<double>(v14, v15, outerAngle, 0.0, 360.0);

}

- (void)setOuterGain:(double)outerGain
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_outerGain = PHASEGetPropertyBounded<double>(v8, v7, outerGain, 0.0, 1.0);

}

- (double)frequency
{
  return self->_frequency;
}

- (double)innerAngle
{
  return self->_innerAngle;
}

- (double)outerAngle
{
  return self->_outerAngle;
}

- (double)outerGain
{
  return self->_outerGain;
}

@end
