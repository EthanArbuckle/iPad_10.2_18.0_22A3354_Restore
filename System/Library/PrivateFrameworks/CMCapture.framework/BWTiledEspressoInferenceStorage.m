@implementation BWTiledEspressoInferenceStorage

- (BWTiledEspressoInferenceStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4 espressoStorages:(id)a5
{
  BWTiledEspressoInferenceStorage *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWTiledEspressoInferenceStorage;
  v6 = -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](&v8, sel_initWithRequirementsNeedingPixelBuffers_requirementsNeedingPixelBufferPools_, a3, a4);
  v6->_espressoStorages = (NSArray *)a5;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWTiledEspressoInferenceStorage;
  -[BWInferenceProviderStorage dealloc](&v3, sel_dealloc);
}

- (NSArray)espressoStorages
{
  return self->_espressoStorages;
}

@end
