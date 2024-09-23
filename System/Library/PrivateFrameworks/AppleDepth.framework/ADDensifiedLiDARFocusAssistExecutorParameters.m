@implementation ADDensifiedLiDARFocusAssistExecutorParameters

- (id)initForPipeline:(id)a3
{
  id v4;
  ADDensifiedLiDARFocusAssistExecutorParameters *v5;
  uint64_t v6;
  ADDensifiedLiDARFocusAssistPipelineParameters *pipelineParameters;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADDensifiedLiDARFocusAssistExecutorParameters;
  v5 = -[ADExecutorParameters init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pipelineParameters");
    v6 = objc_claimAutoreleasedReturnValue();
    pipelineParameters = v5->_pipelineParameters;
    v5->_pipelineParameters = (ADDensifiedLiDARFocusAssistPipelineParameters *)v6;

  }
  return v5;
}

- (ADDensifiedLiDARFocusAssistPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
}

@end
