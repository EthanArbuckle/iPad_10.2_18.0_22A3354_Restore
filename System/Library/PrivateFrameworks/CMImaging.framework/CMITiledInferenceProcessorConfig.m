@implementation CMITiledInferenceProcessorConfig

- (CMITiledInferenceProcessorConfig)init
{
  CMITiledInferenceProcessorConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMITiledInferenceProcessorConfig;
  result = -[CMITiledInferenceProcessorConfig init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_shouldAutoCommit = 257;
    result->_isAllocated = 0;
  }
  return result;
}

- (unint64_t)bufferCount
{
  if (self->_bufferCount <= 1)
    return 1;
  else
    return self->_bufferCount;
}

- (NSArray)pipeline
{
  return self->_pipeline;
}

- (void)setPipeline:(id)a3
{
  objc_storeStrong((id *)&self->_pipeline, a3);
}

- (void)setBufferCount:(unint64_t)a3
{
  self->_bufferCount = a3;
}

- (BOOL)useTextureArrays
{
  return self->_useTextureArrays;
}

- (void)setUseTextureArrays:(BOOL)a3
{
  self->_useTextureArrays = a3;
}

- (BOOL)shouldAutoCommit
{
  return self->_shouldAutoCommit;
}

- (void)setShouldAutoCommit:(BOOL)a3
{
  self->_shouldAutoCommit = a3;
}

- (BOOL)allocateIOBuffersAtLoad
{
  return self->_allocateIOBuffersAtLoad;
}

- (void)setAllocateIOBuffersAtLoad:(BOOL)a3
{
  self->_allocateIOBuffersAtLoad = a3;
}

- (BOOL)isAllocated
{
  return self->_isAllocated;
}

- (void)setIsAllocated:(BOOL)a3
{
  self->_isAllocated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
