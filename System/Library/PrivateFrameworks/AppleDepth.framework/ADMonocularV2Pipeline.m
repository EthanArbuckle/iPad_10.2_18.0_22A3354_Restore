@implementation ADMonocularV2Pipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

- (ADMonocularV2Pipeline)initWithInputPrioritization:(int64_t)a3 andParameters:(id)a4
{
  id v6;
  ADMonocularV2Pipeline *v7;
  const __CFString *v8;
  void **v9;
  const __CFString **v10;
  const __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  ADNetworkProvider *networkProvider;
  uint64_t v18;
  ADMonocularV2Pipeline *v19;
  objc_super v21;
  int v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  __int128 buf;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v22 = 335686160;
  v23 = a3;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  kdebug_trace();
  v21.receiver = self;
  v21.super_class = (Class)ADMonocularV2Pipeline;
  v7 = -[ADMonocularV2Pipeline init](&v21, sel_init);
  if (v7)
  {
    if (!v6)
      v6 = (id)objc_opt_new();
    objc_storeStrong((id *)&v7->_pipelineParameters, v6);
    if (-[ADMonocularV2PipelineParameters networkVariantOverride](v7->_pipelineParameters, "networkVariantOverride") != 1)
    {
      if (-[ADMonocularV2PipelineParameters networkVariantOverride](v7->_pipelineParameters, "networkVariantOverride") == 255
        || !objc_msgSend(MEMORY[0x24BE086D8], "hasANE"))
      {
        goto LABEL_21;
      }
      ADCommonUtils::runtimePlatformANEVersionString(&buf);
      if (v32 < 0)
      {
        v14 = (void *)buf;
        v12 = *((_QWORD *)&buf + 1) ? atoi((const char *)(buf + 1)) : -1;
        operator delete(v14);
      }
      else
      {
        if (!v32)
          goto LABEL_5;
        v12 = atoi((const char *)&buf + 1);
      }
      if (v12 > 12)
      {
LABEL_21:
        v8 = CFSTR("CVM");
        if (a3 != 3)
          goto LABEL_6;
        goto LABEL_22;
      }
    }
LABEL_5:
    v8 = CFSTR("CVM4");
    if (a3 != 3)
    {
LABEL_6:
      if (a3 != 2)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          +[ADUtils prioritizationAsString:](ADUtils, "prioritizationAsString:", a3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v15;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "MonocularV2 does not support prioritization %{public}@", (uint8_t *)&buf, 0xCu);

        }
        v13 = 0;
        goto LABEL_29;
      }
      v29 = &unk_24C434E30;
      v30 = CFSTR("height_216_width_288");
      v9 = &v29;
      v10 = &v30;
      v11 = CFSTR("height_176_width_320");
LABEL_23:
      v9[1] = &unk_24C434E48;
      v10[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[ADNetworkProvider providerForNetwork:requestedLayouts:](ADNetworkProvider, "providerForNetwork:requestedLayouts:", v8, v13);
      v16 = objc_claimAutoreleasedReturnValue();
      networkProvider = v7->_networkProvider;
      v7->_networkProvider = (ADNetworkProvider *)v16;

      if (v7->_networkProvider)
      {
        if (objc_msgSend(MEMORY[0x24BE086D8], "hasANE"))
          v18 = 4;
        else
          v18 = 2;
        -[ADMonocularV2Pipeline adjustForEngine:](v7, "adjustForEngine:", v18);

        goto LABEL_28;
      }
LABEL_29:

      v19 = 0;
      goto LABEL_30;
    }
LABEL_22:
    v27 = &unk_24C434E30;
    v28 = CFSTR("height_360_width_480");
    v9 = &v27;
    v10 = &v28;
    v11 = CFSTR("height_280_width_496");
    goto LABEL_23;
  }
LABEL_28:
  v19 = v7;
LABEL_30:
  kdebug_trace();

  return v19;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (int64_t)adjustForEngine:(unint64_t)a3
{
  unint64_t v4;
  ADEspressoMonocularV2InferenceDescriptor *v5;
  uint64_t v6;
  ADEspressoMonocularV2InferenceDescriptor *v7;
  ADEspressoMonocularV2InferenceDescriptor *inferenceDesc;

  v4 = a3 - 3;
  v5 = [ADEspressoMonocularV2InferenceDescriptor alloc];
  if (v4 >= 2)
    v6 = 1717856627;
  else
    v6 = 1751411059;
  v7 = -[ADEspressoMonocularV2InferenceDescriptor initWithNetworkProvider:inputColorFormat:disparityFormat:](v5, "initWithNetworkProvider:inputColorFormat:disparityFormat:", self->_networkProvider, 1111970369, v6);
  inferenceDesc = self->_inferenceDesc;
  self->_inferenceDesc = v7;

  return 0;
}

- (ADMonocularV2Pipeline)initWithInputPrioritization:(int64_t)a3
{
  return -[ADMonocularV2Pipeline initWithInputPrioritization:andParameters:](self, "initWithInputPrioritization:andParameters:", a3, 0);
}

- (int64_t)postProcessDisparity:(__CVBuffer *)a3 output:(__CVBuffer *)a4
{
  int64_t v6;

  kdebug_trace();
  v6 = +[ADUtils postProcessDepth:depthOutput:](ADUtils, "postProcessDepth:depthOutput:", a3, a4);
  kdebug_trace();
  return v6;
}

- (ADMonocularV2PipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void)setPipelineParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
