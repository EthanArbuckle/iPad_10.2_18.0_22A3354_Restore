@implementation BWVideoProcessingInferenceStorage

- (BWVideoProcessingInferenceStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4
{
  BWVideoProcessingInferenceStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWVideoProcessingInferenceStorage;
  v4 = -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](&v6, sel_initWithRequirementsNeedingPixelBuffers_requirementsNeedingPixelBufferPools_, a3, a4);
  if (v4)
    v4->_metadataDictionaryForRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVideoProcessingInferenceStorage;
  -[BWInferenceProviderStorage dealloc](&v3, sel_dealloc);
}

- (void)setDictionary:(id)a3 forMetadataRequirement:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadataDictionaryForRequirement, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)newMetadataDictionarySatisfyingRequirement:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadataDictionaryForRequirement, "objectForKeyedSubscript:", a3);
}

@end
