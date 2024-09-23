@implementation BWInferenceSimpleStorage

- (NSArray)requirementsNeedingPixelBufferPools
{
  return self->_requirementsNeedingPixelBufferPools;
}

- (BWInferenceSimpleStorage)initWithRequirementsNeedingPools:(id)a3
{
  BWInferenceSimpleStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWInferenceSimpleStorage;
  v4 = -[BWInferenceSimpleStorage init](&v6, sel_init);
  if (v4)
  {
    v4->_pixelBufferByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_pixelBufferPoolByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_requirementsNeedingPixelBufferPools = (NSArray *)a3;
  }
  return v4;
}

- (void)clear
{
  -[NSMutableDictionary removeAllObjects](self->_pixelBufferByRequirement, "removeAllObjects");

  self->_inputSampleBufferAttachments = 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSimpleStorage;
  -[BWInferenceSimpleStorage dealloc](&v3, sel_dealloc);
}

- (NSArray)requirementsNeedingPixelBuffers
{
  return 0;
}

- (BWInferenceProviderStorage)inferenceStorage
{
  return 0;
}

- (BWInferenceTextureStorage)textureStorage
{
  return 0;
}

- (__CVBuffer)pixelBufferForRequirement:(id)a3
{
  return (__CVBuffer *)-[NSMutableDictionary objectForKeyedSubscript:](self->_pixelBufferByRequirement, "objectForKeyedSubscript:", a3);
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

- (void)setPixelBufferPool:(id)a3 forRequirement:(id)a4
{
  if (a3)
  {
    if (a4)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pixelBufferPoolByRequirement, "setObject:forKeyedSubscript:");
  }
}

- (NSDictionary)inferenceResults
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (id)pixelBufferPoolForRequirement:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pixelBufferPoolByRequirement, "objectForKeyedSubscript:", a3);
}

- (NSDictionary)inputSampleBufferAttachments
{
  return self->_inputSampleBufferAttachments;
}

- (void)setInputSampleBufferAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
