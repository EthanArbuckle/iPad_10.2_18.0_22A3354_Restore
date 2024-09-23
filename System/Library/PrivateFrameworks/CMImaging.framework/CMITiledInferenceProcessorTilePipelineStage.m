@implementation CMITiledInferenceProcessorTilePipelineStage

- (CMITiledInferenceProcessorTilePipelineStage)init
{
  CMITiledInferenceProcessorTilePipelineStage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMITiledInferenceProcessorTilePipelineStage;
  result = -[CMITiledInferenceProcessorTilePipelineStage init](&v3, sel_init);
  if (result)
    result->_hasConnectingPostToPreMetalStage = 0;
  return result;
}

- (BOOL)hasConnectingPostToPreMetalStage
{
  return self->_hasConnectingPostToPreMetalStage;
}

- (void)setHasConnectingPostToPreMetalStage:(BOOL)a3
{
  self->_hasConnectingPostToPreMetalStage = a3;
}

- (CMITiledInferenceProcessorMetalStage)preInferenceStage
{
  return self->_preInferenceStage;
}

- (void)setPreInferenceStage:(id)a3
{
  objc_storeStrong((id *)&self->_preInferenceStage, a3);
}

- (CMITiledInferenceProcessorNetworkConfig)networkConfig
{
  return self->_networkConfig;
}

- (void)setNetworkConfig:(id)a3
{
  objc_storeStrong((id *)&self->_networkConfig, a3);
}

- (CMITiledInferenceProcessorMetalStage)postInferenceStage
{
  return self->_postInferenceStage;
}

- (void)setPostInferenceStage:(id)a3
{
  objc_storeStrong((id *)&self->_postInferenceStage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postInferenceStage, 0);
  objc_storeStrong((id *)&self->_networkConfig, 0);
  objc_storeStrong((id *)&self->_preInferenceStage, 0);
}

@end
