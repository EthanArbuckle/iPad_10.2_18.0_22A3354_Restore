@implementation MTLLegacySVDynamicLibrary

- (MTLLegacySVDynamicLibrary)initWithDynamicLibrary:(id)a3 device:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVDynamicLibrary;
  return -[MTLToolsObject initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
}

- (void)prepareForUsage
{
  unint64_t *p_imageData;
  MTLLegacySVImageData *v4;

  p_imageData = (unint64_t *)&self->_imageData;
  if (!self->_imageData && (HIBYTE(self->super.super._device[2].dynamicLibraryObjectCache) & 0x40) != 0)
  {
    v4 = -[MTLLegacySVImageData initWithDynamicLibrary:]([MTLLegacySVImageData alloc], "initWithDynamicLibrary:", self);
    while (!__ldaxr(p_imageData))
    {
      if (!__stlxr((unint64_t)v4, p_imageData))
        goto LABEL_9;
    }
    __clrex();

LABEL_9:
    objc_msgSend((id)*p_imageData, "setConstantData:", -[MTLDebugInstrumentationData globalConstantsData](-[MTLToolsDynamicLibrary debugInstrumentationData](self, "debugInstrumentationData"), "globalConstantsData"));
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVDynamicLibrary;
  -[MTLToolsDynamicLibrary dealloc](&v3, sel_dealloc);
}

- (MTLLegacySVImageData)imageData
{
  return self->_imageData;
}

@end
