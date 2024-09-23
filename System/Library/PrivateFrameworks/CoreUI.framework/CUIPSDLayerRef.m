@implementation CUIPSDLayerRef

- (CUIPSDLayerRef)initWithImageRef:(id)a3 layerIndex:(unsigned int)a4
{
  uint64_t v4;
  CUIPSDLayerRef *v6;
  CUIPSDLayerRef *v7;
  objc_super v9;

  v4 = *(_QWORD *)&a4;
  v9.receiver = self;
  v9.super_class = (Class)CUIPSDLayerRef;
  v6 = -[CUIPSDLayerRef init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CUIPSDLayerBaseRef setImageRef:](v6, "setImageRef:", a3);
    -[CUIPSDLayerBaseRef setLayerIndex:](v7, "setLayerIndex:", v4);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CUIPSDLayerBaseRef setImageRef:](self, "setImageRef:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerRef;
  -[CUIPSDLayerBaseRef dealloc](&v3, sel_dealloc);
}

- (CGImage)createCGImage
{
  return -[CUIPSDImageRef _copyCGImageAtAbsoluteIndex:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_copyCGImageAtAbsoluteIndex:", -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"));
}

- (id)image
{
  return -[CUIPSDImageRef _imageAtAbsoluteIndex:isZeroSizeImage:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_imageAtAbsoluteIndex:isZeroSizeImage:", -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"), 0);
}

- (id)imageIsZeroSizeImage:(BOOL *)a3
{
  return -[CUIPSDImageRef _imageAtAbsoluteIndex:isZeroSizeImage:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_imageAtAbsoluteIndex:isZeroSizeImage:", -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"), a3);
}

- (id)imageFromSlice:(unsigned int)a3
{
  return -[CUIPSDImageRef _imageFromSlice:atAbsoluteIndex:isEmptyImage:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_imageFromSlice:atAbsoluteIndex:isEmptyImage:", *(_QWORD *)&a3, -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"), 0);
}

- (id)imageFromSlice:(unsigned int)a3 isEmptyImage:(BOOL *)a4
{
  return -[CUIPSDImageRef _imageFromSlice:atAbsoluteIndex:isEmptyImage:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_imageFromSlice:atAbsoluteIndex:isEmptyImage:", *(_QWORD *)&a3, -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"), a4);
}

- (id)patternFromSlice:(unsigned int)a3
{
  return -[CUIPSDImageRef _patternFromSlice:atAbsoluteIndex:isZeroSizeImage:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_patternFromSlice:atAbsoluteIndex:isZeroSizeImage:", *(_QWORD *)&a3, -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"), 0);
}

- (id)patternFromSlice:(unsigned int)a3 isZeroSizeImage:(BOOL *)a4
{
  return -[CUIPSDImageRef _patternFromSlice:atAbsoluteIndex:isZeroSizeImage:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_patternFromSlice:atAbsoluteIndex:isZeroSizeImage:", *(_QWORD *)&a3, -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"), a4);
}

- (id)maskFromSlice:(unsigned int)a3
{
  return -[CUIPSDImageRef _createMaskFromSlice:atAbsoluteIndex:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_createMaskFromSlice:atAbsoluteIndex:", *(_QWORD *)&a3, -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"));
}

- (id)fillSample
{
  return -[CUIPSDImageRef _fillSampleAtAbsoluteIndex:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_fillSampleAtAbsoluteIndex:", -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"));
}

- (id)gradient
{
  return -[CUIPSDImageRef _gradientAtAbsoluteIndex:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_gradientAtAbsoluteIndex:", -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"));
}

- (id)layerEffects
{
  return -[CUIPSDImageRef _layerEffectsAtAbsoluteIndex:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_layerEffectsAtAbsoluteIndex:", -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"));
}

- (id)colorFill
{
  id result;
  double v4[4];

  result = -[CUIPSDImageRef psdFile](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "psdFile");
  if (result)
  {
    result = CPSDFile::GetColorFillInfo((CPSDFile *)result, -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"));
    if (result)
      return -[CUIPSDImageRef colorFromDocumentColor:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef", CPSDDropShadowDescriptor::GetColor((CPSDDropShadowDescriptor *)result, v4)), "colorFromDocumentColor:", v4);
  }
  return result;
}

@end
