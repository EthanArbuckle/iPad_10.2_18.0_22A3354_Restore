@implementation ADStereoPipeline

- (int64_t)adjustForEngine:(unint64_t)a3
{
  int64_t prioritization;
  ADEspressoStereoInferenceDescriptor *v6;
  ADNetworkProvider *networkProvider;
  uint64_t v8;
  uint64_t v9;
  ADEspressoStereoInferenceDescriptor *v10;
  ADEspressoStereoInferenceDescriptor *inferenceDesc;

  self->_shouldPreProcessColorInputs = 0;
  prioritization = self->_prioritization;
  if (prioritization == 4 || prioritization == 1)
  {
    v6 = [ADEspressoStereoInferenceDescriptor alloc];
    networkProvider = self->_networkProvider;
    v8 = 1919365990;
LABEL_10:
    v9 = 1717856627;
    goto LABEL_11;
  }
  if (a3 - 3 > 1)
  {
    self->_shouldPreProcessColorInputs = 1;
    v6 = [ADEspressoStereoInferenceDescriptor alloc];
    networkProvider = self->_networkProvider;
    v8 = 1380410945;
    goto LABEL_10;
  }
  v6 = [ADEspressoStereoInferenceDescriptor alloc];
  networkProvider = self->_networkProvider;
  v8 = 1380411457;
  v9 = 1751411059;
LABEL_11:
  v10 = -[ADEspressoStereoInferenceDescriptor initWithNetworkProvider:inputColorFormat:outputDisparityFormat:](v6, "initWithNetworkProvider:inputColorFormat:outputDisparityFormat:", networkProvider, v8, v9);
  inferenceDesc = self->_inferenceDesc;
  self->_inferenceDesc = v10;

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

- (ADStereoPipeline)initWithInputAlignment:(unint64_t)a3 prioritization:(int64_t)a4 andParameters:(id)a5
{
  id v8;
  ADStereoPipeline *v9;
  id *p_pipelineParameters;
  int v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t stereoImagesAlignment;
  void *v17;
  uint64_t v18;
  ADNetworkProvider *networkProvider;
  ADStereoPipeline *v20;
  objc_super v22;
  int v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[8];
  uint64_t v29;
  char v30;

  v8 = a5;
  v23 = 335687464;
  v24 = a4;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  kdebug_trace();
  v22.receiver = self;
  v22.super_class = (Class)ADStereoPipeline;
  v9 = -[ADStereoPipeline init](&v22, sel_init);
  if (!v9)
    goto LABEL_27;
  if (!v8)
    v8 = (id)objc_opt_new();
  p_pipelineParameters = (id *)&v9->_pipelineParameters;
  objc_storeStrong((id *)&v9->_pipelineParameters, v8);
  v9->_stereoImagesAlignment = a3;
  v9->_prioritization = a4;
  if (objc_msgSend(MEMORY[0x24BE086D8], "hasANE"))
  {
    ADCommonUtils::runtimePlatformANEVersionString(buf);
    if (v30 < 0)
    {
      v13 = *(void **)buf;
      if (v29)
        v11 = atoi((const char *)(*(_QWORD *)buf + 1));
      else
        v11 = -1;
      operator delete(v13);
    }
    else if (v30)
    {
      v11 = atoi((const char *)&buf[1]);
    }
    else
    {
      v11 = -1;
    }
    v12 = v11 > 13;
  }
  else
  {
    v12 = 0;
  }
  v14 = &unk_24C435200;
  if (objc_msgSend(*p_pipelineParameters, "networkVariantOverride") != 1)
  {
    if (objc_msgSend(*p_pipelineParameters, "networkVariantOverride") == 255)
    {
      if (!v12)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADStereoPipeline requested V3 networks, but runtime does not support them", buf, 2u);
          v20 = 0;
          goto LABEL_30;
        }
        goto LABEL_29;
      }
      v14 = &unk_24C435218;
    }
    else
    {
      v15 = &unk_24C435218;
      if (!v12)
        v15 = &unk_24C435200;
      if (a4 == 1)
        v14 = &unk_24C435230;
      else
        v14 = v15;
    }
  }
  stereoImagesAlignment = v9->_stereoImagesAlignment;
  if (stereoImagesAlignment > objc_msgSend(v14, "count"))
    goto LABEL_29;
  objc_msgSend(v14, "objectAtIndexedSubscript:", v9->_stereoImagesAlignment);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  networkProvider = v9->_networkProvider;
  v9->_networkProvider = (ADNetworkProvider *)v18;

  if (!v9->_networkProvider || -[ADStereoPipeline adjustForEngine:](v9, "adjustForEngine:", 3))
  {
LABEL_29:
    v20 = 0;
    goto LABEL_30;
  }
LABEL_27:
  v20 = v9;
LABEL_30:
  kdebug_trace();

  return v20;
}

- (ADStereoPipeline)initWithInputAlignment:(unint64_t)a3 andPrioritization:(int64_t)a4
{
  return -[ADStereoPipeline initWithInputAlignment:prioritization:andParameters:](self, "initWithInputAlignment:prioritization:andParameters:", a3, a4, 0);
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (ADStereoPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void)setPipelineParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)stereoImagesAlignment
{
  return self->_stereoImagesAlignment;
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
