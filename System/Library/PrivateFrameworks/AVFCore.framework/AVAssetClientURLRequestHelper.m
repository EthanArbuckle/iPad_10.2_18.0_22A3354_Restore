@implementation AVAssetClientURLRequestHelper

- (void)setFigAssetProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AVAssetClientURLRequestHelper)initWithAsset:(id)a3
{
  AVAssetClientURLRequestHelper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAssetClientURLRequestHelper;
  v4 = -[AVAssetClientURLRequestHelper init](&v6, sel_init);
  if (v4)
  {
    v4->_weakReferenceToSelf = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v4);
    v4->_weakReferenceToAsset = (AVWeakReference *)(id)objc_msgSend(a3, "_weakReference");
  }
  return v4;
}

- (void)setResourceLoader:(id)a3
{

  self->_weakReferenceToResourceLoader = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
}

- (OpaqueFigAsset)figAsset
{
  OpaqueFigAsset *result;

  result = (OpaqueFigAsset *)self->_figAssetProvider;
  if (result)
    return (OpaqueFigAsset *)(*((uint64_t (**)(void))result + 2))();
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetClientURLRequestHelper;
  -[AVAssetClientURLRequestHelper dealloc](&v3, sel_dealloc);
}

- (id)URLAsset
{
  return -[AVWeakReference referencedObject](self->_weakReferenceToAsset, "referencedObject");
}

- (AVAssetResourceLoader)resourceLoader
{
  return (AVAssetResourceLoader *)-[AVWeakReference referencedObject](self->_weakReferenceToResourceLoader, "referencedObject");
}

- (id)figAssetProvider
{
  return self->_figAssetProvider;
}

@end
