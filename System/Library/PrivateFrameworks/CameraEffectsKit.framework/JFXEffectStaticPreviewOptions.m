@implementation JFXEffectStaticPreviewOptions

- (id)initStaticPreviewOptions
{
  id result;
  __int128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JFXEffectStaticPreviewOptions;
  result = -[JFXEffectPreviewOptions initPreviewOptions](&v4, sel_initPreviewOptions);
  if (result)
  {
    *(_OWORD *)((char *)result + 56) = kDefaultEffectPreviewRenderTime;
    *((_QWORD *)result + 9) = 0;
    *((_OWORD *)result + 7) = kDefaultEffectPreviewAnimationRange;
    *((_OWORD *)result + 8) = xmmword_226AB8860;
    *((_OWORD *)result + 9) = xmmword_226AB8870;
    v3 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    *((_OWORD *)result + 5) = *MEMORY[0x24BDBF090];
    *((_OWORD *)result + 6) = v3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  CGSize size;
  int64_t epoch;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)JFXEffectStaticPreviewOptions;
  v4 = -[JFXEffectPreviewOptions copyWithZone:](&v12, sel_copyWithZone_, a3);
  objc_storeStrong((id *)v4 + 5, self->_renderBackgroundImage);
  v4[33] = self->_dontCache;
  v4[32] = self->_dontCacheToDisk;
  v4[34] = self->_dontUseThumbnailAssetWhenAvailable;
  size = self->_renderedImageCropRect.size;
  *((_OWORD *)v4 + 5) = self->_renderedImageCropRect.origin;
  *((CGSize *)v4 + 6) = size;
  epoch = self->_renderTime.epoch;
  *(_OWORD *)(v4 + 56) = *(_OWORD *)&self->_renderTime.value;
  *((_QWORD *)v4 + 9) = epoch;
  v8 = *(_OWORD *)&self->_renderRange.start.epoch;
  v7 = *(_OWORD *)&self->_renderRange.duration.timescale;
  *((_OWORD *)v4 + 7) = *(_OWORD *)&self->_renderRange.start.value;
  *((_OWORD *)v4 + 8) = v8;
  *((_OWORD *)v4 + 9) = v7;
  v9 = MEMORY[0x2276A1F6C](self->_renderPropertiesConfigurationBlock);
  v10 = (void *)*((_QWORD *)v4 + 6);
  *((_QWORD *)v4 + 6) = v9;

  return v4;
}

- (JTImage)renderBackgroundImage
{
  return self->_renderBackgroundImage;
}

- (void)setRenderBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_renderBackgroundImage, a3);
}

- (BOOL)dontCacheToDisk
{
  return self->_dontCacheToDisk;
}

- (void)setDontCacheToDisk:(BOOL)a3
{
  self->_dontCacheToDisk = a3;
}

- (BOOL)dontCache
{
  return self->_dontCache;
}

- (void)setDontCache:(BOOL)a3
{
  self->_dontCache = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setRenderTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_renderTime.value = *(_OWORD *)&a3->var0;
  self->_renderTime.epoch = var3;
}

- ($70930193D4F448A53BB9343C0237EB5F)renderRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var0;
  return self;
}

- (void)setRenderRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.var3;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_renderRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_renderRange.start.epoch = v4;
  *(_OWORD *)&self->_renderRange.duration.timescale = v3;
}

- (BOOL)dontUseThumbnailAssetWhenAvailable
{
  return self->_dontUseThumbnailAssetWhenAvailable;
}

- (void)setDontUseThumbnailAssetWhenAvailable:(BOOL)a3
{
  self->_dontUseThumbnailAssetWhenAvailable = a3;
}

- (CGRect)renderedImageCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_renderedImageCropRect.origin.x;
  y = self->_renderedImageCropRect.origin.y;
  width = self->_renderedImageCropRect.size.width;
  height = self->_renderedImageCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRenderedImageCropRect:(CGRect)a3
{
  self->_renderedImageCropRect = a3;
}

- (id)renderPropertiesConfigurationBlock
{
  return self->_renderPropertiesConfigurationBlock;
}

- (void)setRenderPropertiesConfigurationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_renderPropertiesConfigurationBlock, 0);
  objc_storeStrong((id *)&self->_renderBackgroundImage, 0);
}

@end
