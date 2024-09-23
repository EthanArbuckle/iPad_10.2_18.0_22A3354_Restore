@implementation PHASESpatialPipelineEntry

- (PHASESpatialPipelineEntry)init
{
  PHASESpatialPipelineEntry *v2;
  PHASESpatialPipelineEntry *v3;
  PHASENumberMetaParameterDefinition *sendLevelMetaParameterDefinition;
  NSMutableDictionary *v5;
  NSMutableDictionary *tweakParams;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHASESpatialPipelineEntry;
  v2 = -[PHASESpatialPipelineEntry init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    sendLevelMetaParameterDefinition = v2->_sendLevelMetaParameterDefinition;
    v2->_sendLevel = 1.0;
    v2->_sendLevelMetaParameterDefinition = 0;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    tweakParams = v3->_tweakParams;
    v3->_tweakParams = v5;

  }
  return v3;
}

- (void)setSendLevel:(double)sendLevel
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sendLevel = PHASEGetPropertyBounded<double>(v8, v7, sendLevel, 0.0, 1.0);

}

- (void)setTweakParameterWithValue:(double)a3 identifier:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tweakParams, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setTweakParameterWithMetaParameterDefinition:(id)a3 identifier:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tweakParams, "setObject:forKeyedSubscript:", a3, a4);
}

- (double)sendLevel
{
  return self->_sendLevel;
}

- (PHASENumberMetaParameterDefinition)sendLevelMetaParameterDefinition
{
  return self->_sendLevelMetaParameterDefinition;
}

- (void)setSendLevelMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)sendLevelMetaParameterDefinition
{
  objc_storeStrong((id *)&self->_sendLevelMetaParameterDefinition, sendLevelMetaParameterDefinition);
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
  objc_storeStrong((id *)&self->_sendLevelMetaParameterDefinition, 0);
}

@end
