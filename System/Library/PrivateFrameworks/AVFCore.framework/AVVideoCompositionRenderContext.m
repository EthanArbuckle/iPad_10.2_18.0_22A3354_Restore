@implementation AVVideoCompositionRenderContext

- (void)_willDeallocOrFinalize
{
  AVVideoCompositionRenderContextInternal *internal;

  internal = self->_internal;
  if (internal)
    CFRelease(internal);
}

- (void)dealloc
{
  objc_super v3;

  -[AVVideoCompositionRenderContext _willDeallocOrFinalize](self, "_willDeallocOrFinalize");

  v3.receiver = self;
  v3.super_class = (Class)AVVideoCompositionRenderContext;
  -[AVVideoCompositionRenderContext dealloc](&v3, sel_dealloc);
}

- (CGSize)size
{
  AVVideoCompositionRenderContextInternal *internal;
  double width;
  double height;
  CGSize result;

  internal = self->_internal;
  width = internal->_size.width;
  height = internal->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGAffineTransform)renderTransform
{
  CGFloat b;
  __int128 v4;

  b = self->b;
  v4 = *(_OWORD *)(*(_QWORD *)&b + 48);
  *(_OWORD *)&retstr->a = *(_OWORD *)(*(_QWORD *)&b + 32);
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(*(_QWORD *)&b + 64);
  return self;
}

- (float)renderScale
{
  return self->_internal->_renderScale;
}

- (AVPixelAspectRatio)pixelAspectRatio
{
  AVVideoCompositionRenderContextInternal *internal;
  NSInteger horizontalSpacing;
  NSInteger verticalSpacing;
  AVPixelAspectRatio result;

  internal = self->_internal;
  horizontalSpacing = internal->_pixelAspectRatio.horizontalSpacing;
  verticalSpacing = internal->_pixelAspectRatio.verticalSpacing;
  result.verticalSpacing = verticalSpacing;
  result.horizontalSpacing = horizontalSpacing;
  return result;
}

- (AVEdgeWidths)edgeWidths
{
  AVVideoCompositionRenderContextInternal *internal;
  double left;
  double top;
  double right;
  double bottom;
  AVEdgeWidths result;

  internal = self->_internal;
  left = internal->_edgeWidths.left;
  top = internal->_edgeWidths.top;
  right = internal->_edgeWidths.right;
  bottom = internal->_edgeWidths.bottom;
  result.bottom = bottom;
  result.right = right;
  result.top = top;
  result.left = left;
  return result;
}

- (BOOL)highQualityRendering
{
  return self->_internal->_highQualityRendering;
}

- (AVVideoComposition)videoComposition
{
  return self->_internal->_videoComposition;
}

- (CVPixelBufferRef)newPixelBuffer
{
  NSObject *pixelBufferPoolQ;
  __CVBuffer *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  pixelBufferPoolQ = self->_internal->_pixelBufferPoolQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVVideoCompositionRenderContext_newPixelBuffer__block_invoke;
  v5[3] = &unk_1E302FDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(pixelBufferPoolQ, v5);
  v3 = (__CVBuffer *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __49__AVVideoCompositionRenderContext_newPixelBuffer__block_invoke(uint64_t a1)
{
  __CVPixelBufferPool *v2;
  _QWORD *v3;
  _QWORD *v4;
  const void *v5;
  const void *v6;
  int v7;
  uint64_t v8;
  const void *v9;
  const void *v10;

  v2 = (__CVPixelBufferPool *)objc_msgSend(*(id *)(a1 + 32), "pixelBufferPool");
  if (v2
    && !CVPixelBufferPoolCreatePixelBufferWithAuxAttributes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, 0, (CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)))
  {
    v3 = *(_QWORD **)(a1 + 32);
    v4 = (_QWORD *)v3[1];
    v5 = (const void *)v4[26];
    if (v5)
    {
      CVBufferSetAttachment(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (CFStringRef)*MEMORY[0x1E0CA8D50], v5, kCVAttachmentMode_ShouldPropagate);
      v3 = *(_QWORD **)(a1 + 32);
      v4 = (_QWORD *)v3[1];
    }
    v6 = (const void *)v4[25];
    if (v6)
    {
      CVBufferSetAttachment(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (CFStringRef)*MEMORY[0x1E0CA8E68], v6, kCVAttachmentMode_ShouldPropagate);
      v3 = *(_QWORD **)(a1 + 32);
      v4 = (_QWORD *)v3[1];
    }
    if (v4[20])
    {
      v7 = objc_msgSend(v3, "isBufferYCbCr:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      v3 = *(_QWORD **)(a1 + 32);
      if (v7)
      {
        CVBufferSetAttachment(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (CFStringRef)*MEMORY[0x1E0CA8EE8], *(CFTypeRef *)(v3[1] + 160), kCVAttachmentMode_ShouldPropagate);
        v3 = *(_QWORD **)(a1 + 32);
      }
    }
    v8 = v3[1];
    v9 = *(const void **)(v8 + 168);
    if (v9)
    {
      CVBufferSetAttachment(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (CFStringRef)*MEMORY[0x1E0CA8D68], v9, kCVAttachmentMode_ShouldPropagate);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    }
    v10 = *(const void **)(v8 + 176);
    if (v10)
      CVBufferSetAttachment(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (CFStringRef)*MEMORY[0x1E0CA8E98], v10, kCVAttachmentMode_ShouldPropagate);
  }
}

+ (id)renderContextPropertiesFromFigCompositor:(OpaqueFigVideoCompositor *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t FigBaseObject;
  void (*v12)(uint64_t, uint64_t, uint64_t, id *);
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (renderContextPropertiesFromFigCompositor__keysOnce != -1)
    dispatch_once(&renderContextPropertiesFromFigCompositor__keysOnce, &__block_literal_global_71);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)renderContextPropertiesFromFigCompositor__keys;
  v5 = objc_msgSend((id)renderContextPropertiesFromFigCompositor__keys, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = *MEMORY[0x1E0C9AE00];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v14 = 0;
        FigBaseObject = FigVideoCompositorGetFigBaseObject();
        v12 = *(void (**)(uint64_t, uint64_t, uint64_t, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
        if (v12)
          v12(FigBaseObject, v10, v8, &v14);
        if (v14)
          objc_msgSend(v3, "setObject:forKey:", v14, v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  return v3;
}

id __86__AVVideoCompositionRenderContext_Internal__renderContextPropertiesFromFigCompositor___block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6328], *MEMORY[0x1E0CC6340], *MEMORY[0x1E0CC6338], *MEMORY[0x1E0CC6330], *MEMORY[0x1E0CC6320], *MEMORY[0x1E0CC62F0], *MEMORY[0x1E0CC6300], *MEMORY[0x1E0CC6318], *MEMORY[0x1E0CC6308], *MEMORY[0x1E0CC6310], 0);
  renderContextPropertiesFromFigCompositor__keys = (uint64_t)result;
  return result;
}

- (AVVideoCompositionRenderContext)initWithFigVideoCompositor:(OpaqueFigVideoCompositor *)a3 clientRequiredPixelBufferAttributes:(id)a4 videoComposition:(id)a5 pixelBufferPool:(__CVPixelBufferPool *)a6
{
  AVVideoCompositionRenderContext *v10;
  AVVideoCompositionRenderContextInternal *v11;
  NSObject *v12;
  AVVideoCompositionRenderContextInternal *internal;
  const __CFDictionary *v14;
  id v15;
  float v16;
  AVVideoCompositionRenderContextInternal *v17;
  __CFDictionary *pixelAspectRatioDict;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  float v23;
  double v24;
  float v25;
  double v26;
  float v27;
  double v28;
  double *v29;
  float v30;
  id v31;
  AVVideoCompositionRenderContextInternal *v32;
  CGFloat renderScale;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  CGAffineTransform v42;
  CGAffineTransform v43;
  uint64_t v44;
  uint64_t v45;
  __CFDictionary *v46;
  CGAffineTransform v47;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)AVVideoCompositionRenderContext;
  v10 = -[AVVideoCompositionRenderContext init](&v48, sel_init);
  if (!v10)
    return v10;
  v11 = objc_alloc_init(AVVideoCompositionRenderContextInternal);
  v10->_internal = v11;
  CFRetain(v11);
  v10->_internal->_pixelBufferPool = a6;
  CVPixelBufferPoolRetain(v10->_internal->_pixelBufferPool);
  v10->_internal->_videoComposition = (AVVideoComposition *)objc_msgSend(a5, "copy");
  v10->_internal->_clientRequiredPixelBufferAttributes = (NSDictionary *)objc_msgSend(a4, "copy");
  v10->_internal->_basisProperties = (NSDictionary *)+[AVVideoCompositionRenderContext renderContextPropertiesFromFigCompositor:](AVVideoCompositionRenderContext, "renderContextPropertiesFromFigCompositor:", a3);
  v10->_internal->_bufferPoollInitMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10->_internal->_pixelBufferPoolQ = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avvideocompositionrendercontext.pixelbufferpoolq", v12);
  internal = v10->_internal;
  if (!internal->_pixelBufferPoolQ)
    goto LABEL_26;
  v14 = -[NSDictionary objectForKey:](internal->_basisProperties, "objectForKey:", *MEMORY[0x1E0CC6328]);
  if (!v14)
    goto LABEL_26;
  if (!CGSizeMakeWithDictionaryRepresentation(v14, &v10->_internal->_size))
    goto LABEL_26;
  v10->_internal->_renderScale = 1.0;
  v15 = -[NSDictionary objectForKey:](v10->_internal->_basisProperties, "objectForKey:", *MEMORY[0x1E0CC6340]);
  if (!v15)
    goto LABEL_26;
  objc_msgSend(v15, "floatValue");
  v10->_internal->_renderScale = v16;
  v10->_internal->_pixelAspectRatioDict = (__CFDictionary *)-[NSDictionary objectForKey:](v10->_internal->_basisProperties, "objectForKey:", *MEMORY[0x1E0CC6338]);
  v17 = v10->_internal;
  pixelAspectRatioDict = v17->_pixelAspectRatioDict;
  if (pixelAspectRatioDict)
  {
    v19 = objc_msgSend((id)-[__CFDictionary objectForKey:](pixelAspectRatioDict, "objectForKey:", *MEMORY[0x1E0CA8E60]), "integerValue");
    v20 = objc_msgSend((id)-[__CFDictionary objectForKey:](v10->_internal->_pixelAspectRatioDict, "objectForKey:", *MEMORY[0x1E0CA8E70]), "integerValue");
    v17 = v10->_internal;
  }
  else
  {
    v19 = 1;
    v20 = 1;
  }
  v17->_pixelAspectRatio.horizontalSpacing = v19;
  v17->_pixelAspectRatio.verticalSpacing = v20;
  v21 = -[NSDictionary objectForKey:](v10->_internal->_basisProperties, "objectForKey:", *MEMORY[0x1E0CC6330]);
  v22 = v21;
  if (v21)
  {
    if (objc_msgSend(v21, "count") == 4)
    {
      objc_msgSend((id)objc_msgSend(v22, "objectAtIndex:", 0), "floatValue");
      v24 = v23;
      objc_msgSend((id)objc_msgSend(v22, "objectAtIndex:", 1), "floatValue");
      v26 = v25;
      objc_msgSend((id)objc_msgSend(v22, "objectAtIndex:", 2), "floatValue");
      v28 = v27;
      objc_msgSend((id)objc_msgSend(v22, "objectAtIndex:", 3), "floatValue");
      v29 = (double *)v10->_internal;
      v29[13] = v24;
      v29[14] = v26;
      v29[15] = v28;
      v29[16] = v30;
      goto LABEL_12;
    }
LABEL_26:

    return 0;
  }
LABEL_12:
  v31 = -[NSDictionary objectForKey:](v10->_internal->_basisProperties, "objectForKey:", *MEMORY[0x1E0CC6320]);
  if (v31)
    v10->_internal->_highQualityRendering = objc_msgSend(v31, "BOOLValue");
  memset(&v47, 0, sizeof(v47));
  v45 = 0;
  v46 = 0;
  v44 = 0;
  if (FigVideoCompositorUtilityCopyRenderPixelBufferDimensionsAndCleanAperture())
    goto LABEL_26;
  v32 = v10->_internal;
  renderScale = v32->_renderScale;
  v42 = v47;
  CGAffineTransformScale(&v43, &v42, renderScale, renderScale);
  v34 = *(_OWORD *)&v43.tx;
  v35 = *(_OWORD *)&v43.c;
  *(_OWORD *)&v32->_renderTransform.a = *(_OWORD *)&v43.a;
  *(_OWORD *)&v32->_renderTransform.c = v35;
  *(_OWORD *)&v32->_renderTransform.tx = v34;
  v10->_internal->_cleanApertureDict = v46;
  v10->_internal->_destinationPixelBufferDimensions.width = v45;
  v10->_internal->_destinationPixelBufferDimensions.height = v44;
  v36 = -[NSDictionary objectForKey:](v10->_internal->_basisProperties, "objectForKey:", *MEMORY[0x1E0CC6300]);
  if (v36)
    v10->_internal->_destinationDesiredPixelBufferAttributes = (NSDictionary *)v36;
  v37 = -[NSDictionary objectForKey:](v10->_internal->_basisProperties, "objectForKey:", *MEMORY[0x1E0CC6318]);
  if (v37)
    v10->_internal->_destinationDesiredPixelBufferYCbCrMatrix = (NSString *)v37;
  v38 = -[NSDictionary objectForKey:](v10->_internal->_basisProperties, "objectForKey:", *MEMORY[0x1E0CC6308]);
  if (v38)
    v10->_internal->_destinationDesiredPixelBufferColorPrimaries = (NSString *)v38;
  v39 = -[NSDictionary objectForKey:](v10->_internal->_basisProperties, "objectForKey:", *MEMORY[0x1E0CC6310]);
  if (v39)
    v10->_internal->_destinationDesiredPixelBufferTransferFunction = (NSString *)v39;
  v40 = -[NSDictionary objectForKey:](v10->_internal->_basisProperties, "objectForKey:", *MEMORY[0x1E0CC62F0]);
  if (v40)
    v10->_internal->_blendingTransferFunction = (NSString *)v40;
  return v10;
}

- (BOOL)hasEqualPropertiesToFigVideoCompositor:(OpaqueFigVideoCompositor *)a3
{
  id v4;

  v4 = +[AVVideoCompositionRenderContext renderContextPropertiesFromFigCompositor:](AVVideoCompositionRenderContext, "renderContextPropertiesFromFigCompositor:", a3);
  if (v4)
    LOBYTE(v4) = -[NSDictionary isEqual:](self->_internal->_basisProperties, "isEqual:", v4);
  return (char)v4;
}

- (__CVPixelBufferPool)pixelBufferPool
{
  AVVideoCompositionRenderContextInternal *internal;
  BOOL v4;
  CFAllocatorRef *v5;
  NSDictionary *clientRequiredPixelBufferAttributes;
  const __CFArray *Value;
  const __CFArray *v8;
  CFTypeID v9;
  const __CFAllocator *v10;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v12;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v14;
  CFIndex v15;
  CFIndex v16;
  CFTypeRef v17;
  NSDictionary *v18;

  MEMORY[0x194033BF8](self->_internal->_bufferPoollInitMutex, a2);
  internal = self->_internal;
  if (internal->_pixelBufferPool)
    goto LABEL_26;
  v4 = -[NSString isEqualToString:](internal->_destinationDesiredPixelBufferTransferFunction, "isEqualToString:", CFSTR("ITU_R_2100_HLG"));
  v5 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (v4
    || -[NSString isEqualToString:](self->_internal->_destinationDesiredPixelBufferTransferFunction, "isEqualToString:", CFSTR("SMPTE_ST_2084_PQ"))|| -[NSString isEqualToString:](self->_internal->_destinationDesiredPixelBufferTransferFunction, "isEqualToString:", CFSTR("Linear")))
  {
    clientRequiredPixelBufferAttributes = self->_internal->_clientRequiredPixelBufferAttributes;
    if (clientRequiredPixelBufferAttributes)
    {
      Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)clientRequiredPixelBufferAttributes, (const void *)*MEMORY[0x1E0CA9040]);
      if (Value)
      {
        v8 = Value;
        v9 = CFGetTypeID(Value);
        if (v9 == CFArrayGetTypeID() && CFArrayGetCount(v8) >= 1)
        {
          v10 = *v5;
          MutableCopy = CFDictionaryCreateMutableCopy(*v5, 0, (CFDictionaryRef)clientRequiredPixelBufferAttributes);
          if (MutableCopy)
          {
            v12 = MutableCopy;
            Mutable = CFArrayCreateMutable(v10, 0, MEMORY[0x1E0C9B378]);
            if (Mutable)
            {
              v14 = Mutable;
              if (CFArrayGetCount(v8) >= 1)
              {
                v15 = 0;
                do
                {
                  FigCFArrayGetInt32AtIndex();
                  if ((int)GetBitDepthFromPixelFormatType(0) >= 10)
                    FigCFArrayAppendInt32();
                  ++v15;
                }
                while (v15 < CFArrayGetCount(v8));
              }
              if (CFArrayGetCount(v8) >= 1)
              {
                v16 = 0;
                do
                {
                  FigCFArrayGetInt32AtIndex();
                  if ((int)GetBitDepthFromPixelFormatType(0) <= 9)
                    FigCFArrayAppendInt32();
                  ++v16;
                }
                while (v16 < CFArrayGetCount(v8));
              }
              FigCFDictionarySetValue();
              v17 = CFRetain(v12);
              CFRelease(v12);
              CFRelease(v14);
              goto LABEL_24;
            }
            CFRelease(v12);
          }
          goto LABEL_28;
        }
      }
      v18 = clientRequiredPixelBufferAttributes;
LABEL_23:
      v17 = CFRetain(v18);
      goto LABEL_24;
    }
  }
  else
  {
    v18 = self->_internal->_clientRequiredPixelBufferAttributes;
    if (v18)
      goto LABEL_23;
  }
LABEL_28:
  v17 = 0;
LABEL_24:
  VTBuildPixelBufferPools();
  if (v17)
    CFRelease(v17);
LABEL_26:
  MEMORY[0x194033C04](self->_internal->_bufferPoollInitMutex);
  return self->_internal->_pixelBufferPool;
}

- (BOOL)isBufferYCbCr:(__CVBuffer *)a3
{
  const __CFDictionary *DescriptionWithPixelFormatType;
  int v5;

  if (!a3)
    return 0;
  if (!self->_internal->pixelFormatFamily)
  {
    CVPixelBufferGetPixelFormatType(a3);
    DescriptionWithPixelFormatType = (const __CFDictionary *)CVPixelFormatDescriptionGetDescriptionWithPixelFormatType();
    if (CFDictionaryGetValue(DescriptionWithPixelFormatType, (const void *)*MEMORY[0x1E0CA9188]) == (const void *)*MEMORY[0x1E0C9AE50])
      v5 = 1;
    else
      v5 = 2;
    self->_internal->pixelFormatFamily = v5;
  }
  return self->_internal->pixelFormatFamily == 1;
}

@end
