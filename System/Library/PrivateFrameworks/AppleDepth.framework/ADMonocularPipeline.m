@implementation ADMonocularPipeline

- (ADMonocularPipeline)initWithInputPrioritization:(int64_t)a3
{
  void *v5;
  ADMonocularPipeline *v6;

  v5 = (void *)objc_opt_new();
  v6 = -[ADMonocularPipeline initWithInputPrioritization:andParameters:](self, "initWithInputPrioritization:andParameters:", a3, v5);

  return v6;
}

- (ADMonocularPipeline)initWithInputPrioritization:(int64_t)a3 andParameters:(id)a4
{
  id v7;
  ADMonocularPipeline *v8;
  ADMonocularPipeline *v9;
  uint64_t v10;
  ADNetworkProvider *networkProvider;
  ADEspressoMonocularInferenceDescriptor *v12;
  ADEspressoMonocularInferenceDescriptor *inferenceDesc;
  void *v14;
  void *v15;
  uint64_t v16;
  ADImageDescriptor *processedDepthDesc;
  ADMonocularPipeline *v18;
  void *v20;
  objc_super v21;
  int v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v22 = 335687604;
  v23 = a3;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  kdebug_trace();
  v21.receiver = self;
  v21.super_class = (Class)ADMonocularPipeline;
  v8 = -[ADMonocularPipeline init](&v21, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  v8->_prioritization = a3;
  if ((unint64_t)(a3 - 1) >= 4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      +[ADUtils prioritizationAsString:](ADUtils, "prioritizationAsString:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v20;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "no monocular models for prioritization %@", buf, 0xCu);

    }
    goto LABEL_8;
  }
  +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", *((_QWORD *)&off_24C421668 + a3 - 1));
  v10 = objc_claimAutoreleasedReturnValue();
  networkProvider = v9->_networkProvider;
  v9->_networkProvider = (ADNetworkProvider *)v10;

  if (!v9->_networkProvider)
  {
LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v9->_pipelineParameters, a4);
  v12 = -[ADEspressoMonocularInferenceDescriptor initWithNetworkProvider:]([ADEspressoMonocularInferenceDescriptor alloc], "initWithNetworkProvider:", v9->_networkProvider);
  inferenceDesc = v9->_inferenceDesc;
  v9->_inferenceDesc = v12;

  -[ADEspressoMonocularInferenceDescriptor depthOutput](v9->_inferenceDesc, "depthOutput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cloneWithDifferentFormat:", 1717855600);
  v16 = objc_claimAutoreleasedReturnValue();
  processedDepthDesc = v9->_processedDepthDesc;
  v9->_processedDepthDesc = (ADImageDescriptor *)v16;

LABEL_5:
  v18 = v9;
LABEL_9:
  kdebug_trace();

  return v18;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (id)processedDepthOutputDescriptor
{
  return self->_processedDepthDesc;
}

- (int64_t)postProcessWithDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4
{
  int64_t v6;

  kdebug_trace();
  v6 = +[ADUtils postProcessDepth:depthOutput:](ADUtils, "postProcessDepth:depthOutput:", a3, a4);
  kdebug_trace();
  return v6;
}

- (ADMonocularPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void)setPipelineParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_processedDepthDesc, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

@end
