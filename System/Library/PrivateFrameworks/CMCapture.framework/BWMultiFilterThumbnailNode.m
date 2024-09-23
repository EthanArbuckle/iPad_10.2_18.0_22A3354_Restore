@implementation BWMultiFilterThumbnailNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  BWNodeOutput *output;
  BWVideoFormatRequirements *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self)
    output = self->super._output;
  else
    output = 0;
  v7 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setSupportedCacheModes:](v7, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
  if (objc_msgSend(a3, "colorSpaceProperties"))
  {
    v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  }
  else
  {
    v8 = 0;
  }
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v7, "setSupportedColorSpaceProperties:", v8);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v7, "setSupportedPixelFormats:", -[BWMultiFilterThumbnailNode _supportedPixelFormats]((uint64_t)self));
  -[BWVideoFormatRequirements setWidth:](v7, "setWidth:", (unint64_t)self->_thumbnailSize.width);
  -[BWVideoFormatRequirements setHeight:](v7, "setHeight:", (unint64_t)(self->_thumbnailSize.height * (double)(-[NSArray count](self->_filters, "count") + 1)));
  -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](output, "primaryMediaConfiguration"), "setFormatRequirements:", v7);

}

- (BWMultiFilterThumbnailNode)initWithFilters:(id)a3 thumbnailSize:(CGSize)a4 maxLossyCompressionLevel:(int)a5
{
  CGFloat height;
  CGFloat width;
  BWMultiFilterThumbnailNode *v9;
  BWMultiFilterThumbnailNode *v10;
  BWNodeInput *v11;
  void *v12;
  BWVideoFormatRequirements *v13;
  BWNodeOutput *v14;
  BWVideoFormatRequirements *v15;
  objc_super v17;

  height = a4.height;
  width = a4.width;
  v17.receiver = self;
  v17.super_class = (Class)BWMultiFilterThumbnailNode;
  v9 = -[BWNode init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_thumbnailSize.width = width;
    v9->_thumbnailSize.height = height;
    v9->_filters = (NSArray *)objc_msgSend(a3, "copy");
    v10->_maxLossyCompressionLevel = a5;
    v11 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v10, 0);
    v12 = -[BWMultiFilterThumbnailNode _supportedPixelFormats]((uint64_t)v10);
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", v12);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](-[BWNodeInput primaryMediaConfiguration](v11, "primaryMediaConfiguration"), "setFormatRequirements:", v13);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v11, "primaryMediaConfiguration"), "setPassthroughMode:", 0);
    -[BWNode addInput:](v10, "addInput:", v11);

    v14 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v10);
    v15 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v15, "setSupportedPixelFormats:", v12);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v14, "primaryMediaConfiguration"), "setFormatRequirements:", v15);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](-[BWNodeOutput primaryMediaConfiguration](v14, "primaryMediaConfiguration"), "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setIndexOfInputWhichDrivesThisOutput:](-[BWNodeOutput primaryMediaConfiguration](v14, "primaryMediaConfiguration"), "setIndexOfInputWhichDrivesThisOutput:", 0);
    -[BWNode addOutput:](v10, "addOutput:", v14);

    v10->_colorLookupCache = objc_alloc_init(BWColorLookupCache);
  }
  return v10;
}

- (void)_supportedPixelFormats
{
  void *v2;
  void *v3;
  void *v4;
  char IsFullRange;
  int v6;
  char v7;
  int v8;
  int v9;

  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 8), "format");
  if (!v3)
  {
    objc_msgSend(v2, "addObject:", &unk_1E49F9450);
    v8 = 1;
    goto LABEL_8;
  }
  v4 = v3;
  IsFullRange = FigCapturePixelFormatIsFullRange(objc_msgSend(v3, "pixelFormat"));
  v6 = FigCapturePixelFormatIsFullRange(objc_msgSend(v4, "pixelFormat"));
  v7 = v6;
  if ((IsFullRange & 1) == 0)
  {
    objc_msgSend(v2, "addObject:", &unk_1E49F9450);
    v8 = 1;
    if ((v7 & 1) == 0)
    {
      v9 = 0;
      goto LABEL_9;
    }
LABEL_8:
    objc_msgSend(v2, "addObject:", &unk_1E49F9468);
    v9 = 1;
    goto LABEL_9;
  }
  v8 = 0;
  v9 = 0;
  if (v6)
    goto LABEL_8;
LABEL_9:
  if (FigCapturePlatformSupportsUniversalCompression())
    objc_msgSend(v2, "addObjectsFromArray:", FigCaptureSupportedCompressedPixelFormatsForSettings(4, *(_DWORD *)(a1 + 120), v8, v9, 0, 1, 0, 0));
  return v2;
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  void *v3;
  NSArray *filters;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  int v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[BWMultiFilterThumbnailNode _loadAndConfigureFilterBundle]((uint64_t)self);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", -[BWColorLookupCache identityColorLookupTable](self->_colorLookupCache, "identityColorLookupTable"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  filters = self->_filters;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](filters, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(filters);
      v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
      v10 = -[BWColorLookupCache colorLookupTablesForFilter:](self->_colorLookupCache, "colorLookupTablesForFilter:", v9);
      if (!v10)
      {
        v10 = -[BWColorLookupCache fetchColorLookupTablesForFilter:](self->_colorLookupCache, "fetchColorLookupTablesForFilter:", v9);
        if (!v10)
          break;
      }
      objc_msgSend(v3, "addObject:", objc_msgSend(v10, "foregroundColorLookupTable"));
      if (v6 == ++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](filters, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    *(_BYTE *)(-[FigColorCubeMetalFilter filterDescriptor](self->_filter, "filterDescriptor") + 8) = 0;
    v11 = -[NSArray count](self->_filters, "count") + 1;
    *(_DWORD *)(-[FigColorCubeMetalFilter filterDescriptor](self->_filter, "filterDescriptor") + 4) = v11;
    *(_DWORD *)-[FigColorCubeMetalFilter filterDescriptor](self->_filter, "filterDescriptor") = 32;
    if (!-[FigColorCubeMetalFilter prepareToProcess:](self->_filter, "prepareToProcess:", 0))
      -[FigColorCubeMetalFilter setForegroundCubesWithNames:data:](self->_filter, "setForegroundCubesWithNames:data:", 0, v3);
  }
  v12.receiver = self;
  v12.super_class = (Class)BWMultiFilterThumbnailNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v12, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (uint64_t)_loadAndConfigureFilterBundle
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    v5 = 0;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/VideoProcessors/MetalFilter.bundle"));
    if (!v2)
    {
      fig_log_get_emitter();
LABEL_10:
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
    v3 = v2;
    if (objc_msgSend(v2, "loadAndReturnError:", &v5))
    {
      v4 = objc_alloc_init((Class)objc_msgSend(v3, "classNamed:", CFSTR("FigColorCubeMetalFilter")));
      *(_QWORD *)(v1 + 136) = v4;
      if (v4)
        return 0;
      fig_log_get_emitter();
      goto LABEL_10;
    }
    return 4294954510;
  }
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  opaqueCMFormatDescription *mostRecentFormatDescription;
  objc_super v4;

  mostRecentFormatDescription = self->_mostRecentFormatDescription;
  if (mostRecentFormatDescription)
    CFRelease(mostRecentFormatDescription);
  -[BWMultiFilterThumbnailNode _releaseResources]((id *)&self->super.super.isa);
  v4.receiver = self;
  v4.super_class = (Class)BWMultiFilterThumbnailNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (void)_releaseResources
{
  if (a1)
  {

    a1[16] = 0;
    a1[17] = 0;

    a1[14] = 0;
  }
}

- (id)nodeSubType
{
  return CFSTR("MultiFilterThumbnail");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v7;
  __CVBuffer *v8;
  __CVBuffer *v9;
  CFTypeRef cf;

  cf = 0;
  BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("Depth"));
  if (a3
    && (ImageBuffer = CMSampleBufferGetImageBuffer(a3)) != 0
    && (v7 = ImageBuffer,
        (v8 = -[BWPixelBufferPool newPixelBuffer](-[BWNodeOutput livePixelBufferPool](-[BWNode output](self, "output"), "livePixelBufferPool"), "newPixelBuffer")) != 0))
  {
    v9 = v8;
    -[FigColorCubeMetalFilter setInputPixelBuffer:](self->_filter, "setInputPixelBuffer:", v7);
    -[FigColorCubeMetalFilter setMattePixelbuffer:](self->_filter, "setMattePixelbuffer:", 0);
    -[FigColorCubeMetalFilter setOutputPixelBuffer:](self->_filter, "setOutputPixelBuffer:", v9);
    if (!-[FigColorCubeMetalFilter process](self->_filter, "process")
      && !-[FigColorCubeMetalFilter finishProcessing](self->_filter, "finishProcessing")
      && !BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v9, (CFTypeRef *)&self->_mostRecentFormatDescription, (CMSampleBufferRef *)&cf))
    {
      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", cf);
    }
    CFRelease(v9);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  -[BWMultiFilterThumbnailNode _releaseResources]((id *)&self->super.super.isa);
  v5.receiver = self;
  v5.super_class = (Class)BWMultiFilterThumbnailNode;
  -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
}

@end
