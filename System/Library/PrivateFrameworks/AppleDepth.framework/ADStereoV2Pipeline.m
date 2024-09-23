@implementation ADStereoV2Pipeline

- (int64_t)adjustForEngine:(unint64_t)a3
{
  ADEspressoStereoV2InferenceDescriptor *v4;
  ADNetworkProvider *networkProvider;
  uint64_t v6;
  uint64_t v7;
  ADEspressoStereoV2InferenceDescriptor *v8;
  ADEspressoStereoV2InferenceDescriptor *inferenceDesc;

  if (a3 - 3 > 1)
  {
    self->_shouldPreProcessColorInputs = 1;
    v4 = [ADEspressoStereoV2InferenceDescriptor alloc];
    networkProvider = self->_networkProvider;
    v6 = 1380410945;
    v7 = 1717856627;
  }
  else
  {
    self->_shouldPreProcessColorInputs = 0;
    v4 = [ADEspressoStereoV2InferenceDescriptor alloc];
    networkProvider = self->_networkProvider;
    v6 = 1380411457;
    v7 = 1751411059;
  }
  v8 = -[ADEspressoStereoV2InferenceDescriptor initWithNetworkProvider:inputColorFormat:outputDisparityFormat:](v4, "initWithNetworkProvider:inputColorFormat:outputDisparityFormat:", networkProvider, v6, v7);
  inferenceDesc = self->_inferenceDesc;
  self->_inferenceDesc = v8;

  return 0;
}

- (int64_t)preProcessColorInput:(__CVBuffer *)a3 toBuffer:(__CVBuffer *)a4
{
  int64_t v7;

  kdebug_trace();
  if (self->_shouldPreProcessColorInputs)
  {
    +[ADUtils convertRGBAFloat:toPlanar:](ADUtils, "convertRGBAFloat:toPlanar:", a3, a4);
    v7 = 0;
  }
  else
  {
    v7 = -22951;
  }
  kdebug_trace();
  return v7;
}

- (ADStereoV2Pipeline)initWithParameters:(id)a3
{
  id v4;
  ADStereoV2Pipeline *v5;
  id *p_pipelineParameters;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  ADNetworkProvider *networkProvider;
  ADStereoV2Pipeline *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  objc_super v29;
  int v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30 = 335687204;
  v31 = 0u;
  v32 = 0u;
  kdebug_trace();
  v29.receiver = self;
  v29.super_class = (Class)ADStereoV2Pipeline;
  v5 = -[ADStereoV2Pipeline init](&v29, sel_init);
  if (!v5)
    goto LABEL_20;
  if (!v4)
    v4 = (id)objc_opt_new();
  p_pipelineParameters = (id *)&v5->_pipelineParameters;
  objc_storeStrong((id *)&v5->_pipelineParameters, v4);
  -[ADPipelineParameters deviceName](v5->_pipelineParameters, "deviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "hasPrefix:", CFSTR("D83")) & 1) != 0)
  {
    v9 = CFSTR("RTFSD_0deg");
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(*p_pipelineParameters, "deviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hasPrefix:", CFSTR("D84")) & 1) != 0)
  {
    v9 = CFSTR("RTFSD_0deg");
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(*p_pipelineParameters, "deviceName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "uppercaseString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "hasPrefix:", CFSTR("D93")) & 1) != 0)
    goto LABEL_13;
  objc_msgSend(*p_pipelineParameters, "deviceName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "uppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "hasPrefix:", CFSTR("D94")) & 1) != 0)
  {
LABEL_12:

LABEL_13:
    v9 = CFSTR("RTFSD_0deg");
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(*p_pipelineParameters, "deviceName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "uppercaseString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "hasPrefix:", CFSTR("D47")) & 1) != 0)
  {

    goto LABEL_12;
  }
  objc_msgSend(*p_pipelineParameters, "deviceName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uppercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v17, "hasPrefix:", CFSTR("D48"));

  if ((v21 & 1) != 0)
  {
    v9 = CFSTR("RTFSD_0deg");
    goto LABEL_17;
  }
  objc_msgSend(*p_pipelineParameters, "deviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "hasPrefix:", CFSTR("D27")) & 1) != 0)
  {
    v9 = CFSTR("RTFSD_45deg");
    goto LABEL_16;
  }
  objc_msgSend(*p_pipelineParameters, "deviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hasPrefix:", CFSTR("D28")) & 1) != 0)
  {
    v9 = CFSTR("RTFSD_45deg");
    goto LABEL_15;
  }
  objc_msgSend(*p_pipelineParameters, "deviceName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "uppercaseString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "hasPrefix:", CFSTR("D37")) & 1) != 0)
  {
    v9 = CFSTR("RTFSD_45deg");
    goto LABEL_14;
  }
  objc_msgSend(*p_pipelineParameters, "deviceName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "uppercaseString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v19, "hasPrefix:", CFSTR("D38"));

  if ((v26 & 1) != 0)
  {
    v9 = CFSTR("RTFSD_45deg");
LABEL_17:
    +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    networkProvider = v5->_networkProvider;
    v5->_networkProvider = (ADNetworkProvider *)v13;

    if (!v5->_networkProvider)
    {
      v15 = 0;
      goto LABEL_22;
    }
    if (-[ADStereoV2Pipeline adjustForEngine:](v5, "adjustForEngine:", 3))
      goto LABEL_19;
LABEL_20:
    v15 = v5;
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*p_pipelineParameters, "deviceName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v20;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unsupported device \"%{public}@\", buf, 0xCu);

  }
LABEL_19:
  v15 = 0;
LABEL_22:
  kdebug_trace();

  return v15;
}

- (ADStereoV2Pipeline)init
{
  return -[ADStereoV2Pipeline initWithParameters:](self, "initWithParameters:", 0);
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (ADStereoV2PipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void)setPipelineParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)shouldPreProcessColorInputs
{
  return self->_shouldPreProcessColorInputs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

@end
