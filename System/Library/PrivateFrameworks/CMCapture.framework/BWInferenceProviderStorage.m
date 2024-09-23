@implementation BWInferenceProviderStorage

- (NSArray)requirementsNeedingPixelBufferPools
{
  return self->_requirementsNeedingPixelBufferPools;
}

- (void)setPixelBufferPool:(id)a3 forRequirement:(id)a4
{
  if (a3)
  {
    if (a4)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pixelBufferPoolByRequirement, "setObject:forKeyedSubscript:");
  }
}

- (BWInferenceProviderStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4
{
  BWInferenceProviderStorage *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWInferenceProviderStorage;
  v6 = -[BWInferenceProviderStorage init](&v10, sel_init);
  if (v6)
  {
    v6->_requirementsNeedingPixelBuffers = (NSArray *)objc_msgSend(a3, "copy");
    v7 = objc_msgSend(a3, "count");
    if (v7)
      v6->_pixelBufferByRequirement = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v7);
    v6->_requirementsNeedingPixelBufferPools = (NSArray *)objc_msgSend(a4, "copy");
    v8 = objc_msgSend(a4, "count");
    if (v8)
      v6->_pixelBufferPoolByRequirement = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v8);
  }
  return v6;
}

- (void)clear
{
  -[NSMutableDictionary removeAllObjects](self->_pixelBufferByRequirement, "removeAllObjects");

  self->_inputSampleBufferAttachments = 0;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceProviderStorage;
  -[BWInferenceProviderStorage dealloc](&v3, sel_dealloc);
}

- (BWInferenceTextureStorage)textureStorage
{
  return 0;
}

- (__CVBuffer)pixelBufferForRequirement:(id)a3
{
  return (__CVBuffer *)-[NSMutableDictionary objectForKeyedSubscript:](self->_pixelBufferByRequirement, "objectForKeyedSubscript:", a3);
}

- (id)pixelBufferPoolForRequirement:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pixelBufferPoolByRequirement, "objectForKeyedSubscript:", a3);
}

- (void)setPixelBuffer:(__CVBuffer *)a3 forRequirement:(id)a4
{
  CFTypeID TypeID;
  CFTypeID v8;

  if (a3)
  {
    TypeID = CVPixelBufferGetTypeID();
    v8 = CFGetTypeID(a3);
    if (a4)
    {
      if (TypeID == v8)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pixelBufferByRequirement, "setObject:forKeyedSubscript:", a3, a4);
    }
  }
}

- (opaqueCMSampleBuffer)newSampleBufferSatisfyingRequirement:(id)a3 withPropagationSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  __CVBuffer *v5;
  CMSampleBufferRef v7;
  CFTypeRef cf;

  v7 = 0;
  cf = 0;
  v5 = -[BWInferenceProviderStorage pixelBufferForRequirement:](self, "pixelBufferForRequirement:", a3);
  if (v5)
  {
    BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer(a4, v5, 0, &cf, &v7);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v7;
}

- (opaqueCMSampleBuffer)newSampleBufferSatisfyingCloneRequirement:(id)a3
{
  __CVBuffer *v3;
  __int128 v5;
  uint64_t v6;
  CMSampleBufferRef v7;
  CFTypeRef v8;

  v8 = 0;
  v7 = 0;
  v3 = -[BWInferenceProviderStorage pixelBufferForRequirement:](self, "pixelBufferForRequirement:", objc_msgSend(a3, "sourceVideoRequirement"));
  v5 = *MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  BWSampleBufferCreateFromPixelBuffer(v3, (uint64_t)&v5, &v8, &v7);
  if (v8)
    CFRelease(v8);
  return v7;
}

- (id)newMetadataDictionarySatisfyingRequirement:(id)a3
{
  return 0;
}

- (NSArray)requirementsNeedingPixelBuffers
{
  return self->_requirementsNeedingPixelBuffers;
}

- (NSDictionary)inferenceResults
{
  return self->_inferenceResults;
}

- (void)setInferenceResults:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSDictionary)inputSampleBufferAttachments
{
  return self->_inputSampleBufferAttachments;
}

- (void)setInputSampleBufferAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
