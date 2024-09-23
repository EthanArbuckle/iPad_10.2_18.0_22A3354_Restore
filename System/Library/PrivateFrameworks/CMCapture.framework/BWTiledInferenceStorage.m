@implementation BWTiledInferenceStorage

- (BWTiledInferenceStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4 espressoStorages:(id)a5
{
  BWTiledInferenceStorage *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWTiledInferenceStorage;
  v6 = -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](&v8, sel_initWithRequirementsNeedingPixelBuffers_requirementsNeedingPixelBufferPools_, a3, a4);
  v6->_espressoStorages = (NSArray *)a5;
  v6->_textureStorage = objc_alloc_init(BWInferenceSimpleTextureStorage);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWTiledInferenceStorage;
  -[BWInferenceProviderStorage dealloc](&v3, sel_dealloc);
}

- (id)textureStorage
{
  return self->_textureStorage;
}

- (void)clear
{
  objc_super v3;

  -[BWInferenceSimpleTextureStorage clear](self->_textureStorage, "clear");
  v3.receiver = self;
  v3.super_class = (Class)BWTiledInferenceStorage;
  -[BWInferenceProviderStorage clear](&v3, sel_clear);
}

- (NSArray)espressoStorages
{
  return self->_espressoStorages;
}

@end
