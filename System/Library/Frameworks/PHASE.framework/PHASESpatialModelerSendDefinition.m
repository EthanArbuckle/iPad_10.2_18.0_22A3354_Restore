@implementation PHASESpatialModelerSendDefinition

- (PHASESpatialModelerSendDefinition)init
{
  -[PHASESpatialModelerSendDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASESpatialModelerSendDefinition)initWithSpatialModelerType:(int64_t)a3 uid:(id)a4
{
  id v6;
  PHASESpatialModelerSendDefinition *v7;
  PHASESpatialModelerSendDefinition *v8;
  PHASESpatialModelerSendDefinition *v9;

  v6 = a4;
  v7 = -[PHASESpatialModelerSendDefinition initWithSpatialModelerType:](self, "initWithSpatialModelerType:", a3);
  v8 = v7;
  if (v7)
  {
    -[PHASEDefinition setIdentifier:](v7, "setIdentifier:", v6);
    v9 = v8;
  }

  return v8;
}

- (PHASESpatialModelerSendDefinition)initWithSpatialModelerType:(int64_t)a3
{
  PHASESpatialModelerSendDefinition *v4;
  PHASESpatialModelerSendDefinition *v5;
  PHASENumberMetaParameterDefinition *sendMetaParameterDefinition;
  NSMutableDictionary *v7;
  NSMutableDictionary *tweakParams;
  PHASESpatialModelerSendDefinition *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHASESpatialModelerSendDefinition;
  v4 = -[PHASEDefinition initInternal](&v11, sel_initInternal);
  v5 = v4;
  if (v4)
  {
    v4->_spatialModelerType = a3;
    v4->_sendLevel = 1.0;
    sendMetaParameterDefinition = v4->_sendMetaParameterDefinition;
    v4->_sendMetaParameterDefinition = 0;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    tweakParams = v5->_tweakParams;
    v5->_tweakParams = v7;

    v9 = v5;
  }

  return v5;
}

- (void)setSendLevel:(double)a3
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sendLevel = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 1.0);

}

- (void)setTweakParameterWithValue:(double)a3 uid:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tweakParams, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setTweakParameterWithMetaParameterDefinition:(id)a3 uid:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tweakParams, "setObject:forKeyedSubscript:", a3, a4);
}

- (int64_t)spatialModelerType
{
  return self->_spatialModelerType;
}

- (double)sendLevel
{
  return self->_sendLevel;
}

- (PHASENumberMetaParameterDefinition)sendMetaParameterDefinition
{
  return self->_sendMetaParameterDefinition;
}

- (void)setSendMetaParameterDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_sendMetaParameterDefinition, a3);
}

- (NSMutableDictionary)tweakParams
{
  return self->_tweakParams;
}

- (void)setTweakParams:(id)a3
{
  objc_storeStrong((id *)&self->_tweakParams, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tweakParams, 0);
  objc_storeStrong((id *)&self->_sendMetaParameterDefinition, 0);
}

@end
