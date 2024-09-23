@implementation BWInferenceSchedulerScaler

- (BWInferenceSubmittable)submittable
{
  if (-[BWInferenceProvider submittable](self->_provider, "submittable"))
    return (BWInferenceSubmittable *)self;
  else
    return 0;
}

- (int)prepareForExecution
{
  return objc_msgSend((id)-[BWInferenceProvider executable](self->_provider, "executable"), "prepareForExecution");
}

- (BWInferenceExecutable)executable
{
  if (-[BWInferenceProvider executable](self->_provider, "executable"))
    return (BWInferenceExecutable *)self;
  else
    return 0;
}

- (id)newStorage
{
  return (id)-[BWInferenceProvider newStorage](self->_provider, "newStorage");
}

- (NSString)description
{
  BWInferenceVideoFormat *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v16;
  NSString *v17;
  NSString *v18;
  objc_super v19;

  v3 = -[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat");
  v4 = (void *)objc_msgSend(-[NSArray firstObject](self->_outputRequirements, "firstObject"), "videoFormat");
  v19.receiver = self;
  v19.super_class = (Class)BWInferenceSchedulerScaler;
  v18 = -[BWInferenceSchedulerScaler description](&v19, sel_description);
  v17 = -[BWInferenceMediaRequirement attachedMediaKey](self->_inputRequirement, "attachedMediaKey");
  v16 = objc_msgSend(v4, "width");
  v5 = objc_msgSend(v4, "height");
  v6 = objc_msgSend(v4, "pixelFormat") >> 24;
  v7 = (objc_msgSend(v4, "pixelFormat") >> 16);
  v8 = ((unsigned __int16)objc_msgSend(v4, "pixelFormat") >> 8);
  v9 = objc_msgSend(v4, "pixelFormat");
  v10 = -[BWInferenceVideoFormat includesInvalidContent](v3, "includesInvalidContent");
  if (v10 != objc_msgSend(v4, "includesInvalidContent"))
    v11 = CFSTR(", removing invalid region");
  else
    v11 = &stru_1E4928818;
  v12 = -[BWInferenceVideoFormat cropDescriptor](v3, "cropDescriptor");
  v13 = objc_msgSend(v4, "cropDescriptor");
  v14 = CFSTR(", applying custom crop");
  if (v12 == v13)
    v14 = &stru_1E4928818;
  return -[NSString stringByAppendingFormat:](v18, "stringByAppendingFormat:", CFSTR(" mediaKey: %@ output:%zux%zu (%c%c%c%c%@%@) provider:%p"), v17, v16, v5, v6, v7, v8, v9, v11, v14, self->_provider);
}

- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4
{
  BWInferenceProvider *provider;
  __int128 v9;
  int64_t var3;

  if (!-[BWInferenceProvider conformsToProtocol:](self->_provider, "conformsToProtocol:", &unk_1EE6C9DE8))
    return 0;
  provider = self->_provider;
  v9 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  return (id)-[BWInferenceProvider preventionReasonWithSampleBuffer:executionTime:](provider, "preventionReasonWithSampleBuffer:executionTime:", a3, &v9);
}

- (BOOL)mustExecuteWhenAllowed
{
  return 0;
}

- (int)type
{
  return -[BWInferenceProvider type](self->_provider, "type");
}

- (BWInferencePropagatable)propagatable
{
  if (-[BWInferenceProvider propagatable](self->_provider, "propagatable"))
    return (BWInferencePropagatable *)self;
  else
    return 0;
}

- (NSArray)outputRequirements
{
  return self->_outputRequirements;
}

- (NSArray)inputVideoRequirements
{
  return (NSArray *)-[BWInferenceProvider inputVideoRequirements](self->_provider, "inputVideoRequirements");
}

- (BWInferenceSchedulerScaler)initWithInputRequirement:(id)a3 derivedFromRequirement:(id)a4 outputRequirements:(id)a5 options:(unint64_t)a6
{
  char v6;
  BWInferenceSchedulerScaler *v10;
  objc_super v12;

  v6 = a6;
  v12.receiver = self;
  v12.super_class = (Class)BWInferenceSchedulerScaler;
  v10 = -[BWInferenceSchedulerScaler init](&v12, sel_init);
  if (v10)
  {
    v10->_inputRequirement = (BWInferenceVideoRequirement *)a3;
    v10->_outputRequirements = (NSArray *)a5;
    v10->_provider = (BWInferenceProvider *)-[BWInferenceSchedulerScaler _newProviderForWithOptions:inputDerivedFromRequirement:]((uint64_t)v10, v6, (uint64_t)a4);
  }
  return v10;
}

- (BWInferenceVideoScalingProvider)_newProviderForWithOptions:(uint64_t)a3 inputDerivedFromRequirement:
{
  BWInferenceDepthScalingProvider *v6;

  if (!a1)
    return 0;
  if (FigDepthBytesPerPixelForDepthFormat(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelFormat")))
  {
    v6 = -[BWInferenceDepthScalingProvider initWithOutputRequirements:configuration:]([BWInferenceDepthScalingProvider alloc], "initWithOutputRequirements:configuration:", *(_QWORD *)(a1 + 16), 0);
    -[BWInferenceDepthScalingProvider setInputRequirement:](v6, "setInputRequirement:", *(_QWORD *)(a1 + 8));
    return (BWInferenceVideoScalingProvider *)v6;
  }
  return -[BWInferenceVideoScalingProvider initWithInputRequirement:derivedFromRequirement:outputRequirements:enableFencing:]([BWInferenceVideoScalingProvider alloc], "initWithInputRequirement:derivedFromRequirement:outputRequirements:enableFencing:", *(_QWORD *)(a1 + 8), a3, *(_QWORD *)(a1 + 16), a2 & 1);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerScaler;
  -[BWInferenceSchedulerScaler dealloc](&v3, sel_dealloc);
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  BWInferenceProvider *provider;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  provider = self->_provider;
  if (!provider)
    return -31701;
  v9 = *a5;
  return -[BWInferenceProvider submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:](provider, "submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:", a3, a4, &v9, a6, a7);
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  return objc_msgSend((id)-[BWInferenceProvider submittable](self->_provider, "submittable"), "prepareForSubmissionWithWorkQueue:", a3);
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  BWInferenceProvider *provider;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  provider = self->_provider;
  v8 = *a5;
  return -[BWInferenceProvider executeOnSampleBuffer:usingStorage:withExecutionTime:completionHandler:](provider, "executeOnSampleBuffer:usingStorage:withExecutionTime:completionHandler:", a3, a4, &v8, a6);
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  -[BWInferenceProvider propagateInferenceResultsToInferenceDictionary:usingStorage:inputSampleBuffer:propagationSampleBuffer:](self->_provider, "propagateInferenceResultsToInferenceDictionary:usingStorage:inputSampleBuffer:propagationSampleBuffer:", a3, a4, a5, a6);
}

- (BOOL)allowsAsyncPropagation
{
  return self->_allowsAsyncPropagation;
}

@end
