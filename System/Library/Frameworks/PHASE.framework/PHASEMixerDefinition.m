@implementation PHASEMixerDefinition

- (PHASEMixerDefinition)init
{
  -[PHASEMixerDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEMixerDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)initInternal
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHASEMixerDefinition;
  v2 = -[PHASEDefinition initInternal](&v7, sel_initInternal);
  v3 = v2;
  if (v2)
  {
    v2[2] = 0x3FF0000000000000;
    v4 = (void *)v2[3];
    v2[3] = 0;

    v5 = v3;
  }

  return v3;
}

- (void)setGain:(double)gain
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_gain = PHASEGetPropertyBounded<double>(v8, v7, gain, 0.0, 1.0);

}

- (double)gain
{
  return self->_gain;
}

- (PHASENumberMetaParameterDefinition)gainMetaParameterDefinition
{
  return self->_gainMetaParameterDefinition;
}

- (void)setGainMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)gainMetaParameterDefinition
{
  objc_storeStrong((id *)&self->_gainMetaParameterDefinition, gainMetaParameterDefinition);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gainMetaParameterDefinition, 0);
}

@end
