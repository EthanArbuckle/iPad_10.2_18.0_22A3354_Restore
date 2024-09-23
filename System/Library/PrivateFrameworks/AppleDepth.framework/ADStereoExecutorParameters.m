@implementation ADStereoExecutorParameters

- (ADStereoExecutorParameters)init
{
  ADStereoExecutorParameters *v2;
  uint64_t v3;
  ADStereoPipelineParameters *pipelineParameters;
  ADStereoExecutorParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ADStereoExecutorParameters;
  v2 = -[ADExecutorParameters init](&v7, sel_init);
  if (v2
    && (v3 = objc_opt_new(),
        pipelineParameters = v2->_pipelineParameters,
        v2->_pipelineParameters = (ADStereoPipelineParameters *)v3,
        pipelineParameters,
        !v2->_pipelineParameters))
  {
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (id)initForPipeline:(id)a3
{
  id v4;
  ADStereoExecutorParameters *v5;
  uint64_t v6;
  ADStereoPipelineParameters *pipelineParameters;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADStereoExecutorParameters;
  v5 = -[ADExecutorParameters init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pipelineParameters");
    v6 = objc_claimAutoreleasedReturnValue();
    pipelineParameters = v5->_pipelineParameters;
    v5->_pipelineParameters = (ADStereoPipelineParameters *)v6;

  }
  return v5;
}

- (ADStereoPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
}

@end
