@implementation AVVideoComposition

+ (AVVideoComposition)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset
{
  return (AVVideoComposition *)(id)-[AVMutableVideoComposition copy](+[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:](AVMutableVideoComposition, "videoCompositionWithPropertiesOfAsset:", asset), "copy");
}

+ (void)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset completionHandler:(void *)completionHandler
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__AVVideoComposition_videoCompositionWithPropertiesOfAsset_completionHandler___block_invoke;
  v4[3] = &unk_1E3030E88;
  v4[4] = a1;
  v4[5] = asset;
  v4[6] = completionHandler;
  AVLoadValuesAsynchronously(asset, (uint64_t)&unk_1E3093B38, (uint64_t)v4);
}

uint64_t __78__AVVideoComposition_videoCompositionWithPropertiesOfAsset_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
    objc_msgSend(*(id *)(a1 + 32), "videoCompositionWithPropertiesOfAsset:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (AVVideoComposition)videoCompositionWithPropertiesOfAsset:(id)a3 videoGravity:(id)a4
{
  return (AVVideoComposition *)(id)-[AVMutableVideoComposition copy](+[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:videoGravity:](AVMutableVideoComposition, "videoCompositionWithPropertiesOfAsset:videoGravity:", a3, a4), "copy");
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    sPreferredBuiltInVideoCompositor = (uint64_t)CFSTR("VideoCompositor_DeviceSpecific");
}

- (AVVideoComposition)init
{
  AVVideoComposition *v3;
  AVVideoCompositionInternal *v4;
  AVVideoCompositionInternal *videoComposition;
  uint64_t v6;
  AVVideoCompositionInternal *v7;
  objc_super v9;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  v9.receiver = self;
  v9.super_class = (Class)AVVideoComposition;
  v3 = -[AVVideoComposition init](&v9, sel_init);
  if (v3)
  {
    v4 = objc_alloc_init(AVVideoCompositionInternal);
    v3->_videoComposition = v4;
    if (v4)
    {
      CFRetain(v4);
      -[AVVideoComposition setBuiltInCompositorName:](v3, "setBuiltInCompositorName:", sPreferredBuiltInVideoCompositor);
      videoComposition = v3->_videoComposition;
      v6 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)&videoComposition->frameDuration.value = *MEMORY[0x1E0CA2E18];
      videoComposition->frameDuration.epoch = *(_QWORD *)(v6 + 16);
      v3->_videoComposition->sourceTrackIDForFrameTiming = 0;
      v7 = v3->_videoComposition;
      v7->renderSize.width = 0.0;
      v7->renderSize.height = 0.0;
      v3->_videoComposition->renderScale = 1.0;
      if (getPerFrameHDRDisplayMetadataDefault_onceToken != -1)
        dispatch_once(&getPerFrameHDRDisplayMetadataDefault_onceToken, &__block_literal_global_594);
      v3->_videoComposition->perFrameHDRDisplayMetadataPolicy = (NSString *)getPerFrameHDRDisplayMetadataDefault_sDefaultPerFrameHDRDisplayMetadataPolicy;
    }
    else
    {

      return 0;
    }
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVVideoComposition *v5;
  id v7;
  _QWORD v8[3];

  if (-[AVVideoComposition isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    return self;
  v5 = -[AVVideoComposition init](+[AVVideoComposition allocWithZone:](AVVideoComposition, "allocWithZone:", a3), "init");
  if (v5)
  {
    -[AVVideoComposition setBuiltInCompositorName:](v5, "setBuiltInCompositorName:", -[AVVideoComposition builtInCompositorName](self, "builtInCompositorName"));
    -[AVVideoComposition setCustomVideoCompositorClass:](v5, "setCustomVideoCompositorClass:", -[AVVideoComposition customVideoCompositorClass](self, "customVideoCompositorClass"));
    if (self)
      -[AVVideoComposition frameDuration](self, "frameDuration");
    else
      memset(v8, 0, sizeof(v8));
    -[AVVideoComposition setFrameDuration:](v5, "setFrameDuration:", v8, self);
    -[AVVideoComposition setSourceTrackIDForFrameTiming:](v5, "setSourceTrackIDForFrameTiming:", objc_msgSend(v7, "sourceTrackIDForFrameTiming"));
    objc_msgSend(v7, "renderSize");
    -[AVVideoComposition setRenderSize:](v5, "setRenderSize:");
    objc_msgSend(v7, "renderScale");
    -[AVVideoComposition setRenderScale:](v5, "setRenderScale:");
    -[AVVideoComposition setColorPrimaries:](v5, "setColorPrimaries:", objc_msgSend(v7, "colorPrimaries"));
    -[AVVideoComposition setColorYCbCrMatrix:](v5, "setColorYCbCrMatrix:", objc_msgSend(v7, "colorYCbCrMatrix"));
    -[AVVideoComposition setColorTransferFunction:](v5, "setColorTransferFunction:", objc_msgSend(v7, "colorTransferFunction"));
    -[AVVideoComposition setPerFrameHDRDisplayMetadataPolicy:](v5, "setPerFrameHDRDisplayMetadataPolicy:", objc_msgSend(v7, "perFrameHDRDisplayMetadataPolicy"));
    -[AVVideoComposition setInstructions:](v5, "setInstructions:", objc_msgSend(v7, "instructions"));
    -[AVVideoComposition setAnimationTool:](v5, "setAnimationTool:", objc_msgSend(v7, "animationTool"));
    -[AVVideoComposition setSourceSampleDataTrackIDs:](v5, "setSourceSampleDataTrackIDs:", objc_msgSend(v7, "sourceSampleDataTrackIDs"));
    -[AVVideoComposition setSourceVideoTrackWindowsForTrackIDs:](v5, "setSourceVideoTrackWindowsForTrackIDs:", objc_msgSend(v7, "sourceVideoTrackWindowsForTrackIDs"));
    -[AVVideoComposition setSourceSampleDataTrackWindowsForTrackIDs:](v5, "setSourceSampleDataTrackWindowsForTrackIDs:", objc_msgSend(v7, "sourceSampleDataTrackWindowsForTrackIDs"));
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AVMutableVideoComposition *v4;
  _QWORD v6[3];

  v4 = -[AVVideoComposition init](+[AVMutableVideoComposition allocWithZone:](AVMutableVideoComposition, "allocWithZone:", a3), "init");
  if (v4)
  {
    -[AVMutableVideoComposition setBuiltInCompositorName:](v4, "setBuiltInCompositorName:", -[AVVideoComposition builtInCompositorName](self, "builtInCompositorName"));
    -[AVMutableVideoComposition setCustomVideoCompositorClass:](v4, "setCustomVideoCompositorClass:", -[AVVideoComposition customVideoCompositorClass](self, "customVideoCompositorClass"));
    if (self)
      -[AVVideoComposition frameDuration](self, "frameDuration");
    else
      memset(v6, 0, sizeof(v6));
    -[AVMutableVideoComposition setFrameDuration:](v4, "setFrameDuration:", v6);
    -[AVMutableVideoComposition setSourceTrackIDForFrameTiming:](v4, "setSourceTrackIDForFrameTiming:", -[AVVideoComposition sourceTrackIDForFrameTiming](self, "sourceTrackIDForFrameTiming"));
    -[AVVideoComposition renderSize](self, "renderSize");
    -[AVMutableVideoComposition setRenderSize:](v4, "setRenderSize:");
    -[AVVideoComposition renderScale](self, "renderScale");
    -[AVMutableVideoComposition setRenderScale:](v4, "setRenderScale:");
    -[AVMutableVideoComposition setColorPrimaries:](v4, "setColorPrimaries:", -[AVVideoComposition colorPrimaries](self, "colorPrimaries"));
    -[AVMutableVideoComposition setColorYCbCrMatrix:](v4, "setColorYCbCrMatrix:", -[AVVideoComposition colorYCbCrMatrix](self, "colorYCbCrMatrix"));
    -[AVMutableVideoComposition setColorTransferFunction:](v4, "setColorTransferFunction:", -[AVVideoComposition colorTransferFunction](self, "colorTransferFunction"));
    -[AVMutableVideoComposition setPerFrameHDRDisplayMetadataPolicy:](v4, "setPerFrameHDRDisplayMetadataPolicy:", -[AVVideoComposition perFrameHDRDisplayMetadataPolicy](self, "perFrameHDRDisplayMetadataPolicy"));
    -[AVMutableVideoComposition setInstructions:](v4, "setInstructions:", -[AVVideoComposition instructions](self, "instructions"));
    -[AVMutableVideoComposition setAnimationTool:](v4, "setAnimationTool:", -[AVVideoComposition animationTool](self, "animationTool"));
    -[AVMutableVideoComposition setSourceSampleDataTrackIDs:](v4, "setSourceSampleDataTrackIDs:", -[AVVideoComposition sourceSampleDataTrackIDs](self, "sourceSampleDataTrackIDs"));
    -[AVMutableVideoComposition setSourceVideoTrackWindowsForTrackIDs:](v4, "setSourceVideoTrackWindowsForTrackIDs:", -[AVVideoComposition sourceVideoTrackWindowsForTrackIDs](self, "sourceVideoTrackWindowsForTrackIDs"));
    -[AVMutableVideoComposition setSourceSampleDataTrackWindowsForTrackIDs:](v4, "setSourceSampleDataTrackWindowsForTrackIDs:", -[AVVideoComposition sourceSampleDataTrackWindowsForTrackIDs](self, "sourceSampleDataTrackWindowsForTrackIDs"));
  }
  return v4;
}

- (id)_deepCopy
{
  id v3;
  NSArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (id)-[AVVideoComposition mutableCopy](self, "mutableCopy");
  v4 = -[AVVideoComposition instructions](self, "instructions");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v4, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = (id)objc_msgSend(v10, "_deepCopy");
        objc_msgSend(v5, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  objc_msgSend(v3, "setInstructions:", v5);
  return (id)objc_msgSend(v3, "copy");
}

- (void)dealloc
{
  AVVideoCompositionInternal *videoComposition;
  objc_super v4;

  videoComposition = self->_videoComposition;
  if (videoComposition)
  {

    CFRelease(self->_videoComposition);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVVideoComposition;
  -[AVVideoComposition dealloc](&v4, sel_dealloc);
}

- (unint64_t)_changeSeed
{
  return self->_videoComposition->changeSeed;
}

- (void)_bumpChangeSeed
{
  ++self->_videoComposition->changeSeed;
}

- (id)builtInCompositorName
{
  return self->_videoComposition->builtInCompositorName;
}

- (void)setBuiltInCompositorName:(id)a3
{
  NSString *builtInCompositorName;

  builtInCompositorName = self->_videoComposition->builtInCompositorName;
  if (builtInCompositorName != a3)
  {

    self->_videoComposition->builtInCompositorName = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (id)customVideoCompositorClass
{
  return self->_videoComposition->customCompositorClass;
}

- (void)setCustomVideoCompositorClass:(Class)a3
{
  self->_videoComposition->customCompositorClass = a3;
}

- (BOOL)_copyFigVideoCompositor:(const void *)a3 andSession:(id *)a4 recyclingSession:(id)a5 forFigRemaker:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  AVCustomVideoCompositorSession *v13;
  OpaqueFigVideoCompositor *v14;
  OpaqueFigVideoCompositor *v15;
  id *v16;
  CFTypeRef v17;

  v8 = a6;
  if (-[AVVideoComposition customVideoCompositorClass](self, "customVideoCompositorClass"))
  {
    v13 = +[AVCustomVideoCompositorSession sessionWithVideoComposition:recyclingSession:](AVCustomVideoCompositorSession, "sessionWithVideoComposition:recyclingSession:", self, a5);
    v14 = -[AVCustomVideoCompositorSession _copyFigVideoCompositor](v13, "_copyFigVideoCompositor");
    if (!a7)
      goto LABEL_18;
    goto LABEL_16;
  }
  v15 = -[AVVideoComposition builtInCompositorName](self, "builtInCompositorName");
  v14 = v15;
  if (!v8)
  {
    if (!v15)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (-[OpaqueFigVideoCompositor isEqualToString:](v15, "isEqualToString:", CFSTR("VideoCompositor_DeviceSpecific")))
  {
    v16 = (id *)MEMORY[0x1E0CC5C88];
LABEL_13:
    v15 = (OpaqueFigVideoCompositor *)*v16;
LABEL_14:
    v14 = (OpaqueFigVideoCompositor *)CFRetain(v15);
    goto LABEL_15;
  }
  if (-[OpaqueFigVideoCompositor isEqualToString:](v14, "isEqualToString:", CFSTR("VideoCompositor_Basic")))
  {
    v16 = (id *)MEMORY[0x1E0CC5C80];
    goto LABEL_13;
  }
  if (-[OpaqueFigVideoCompositor isEqualToString:](v14, "isEqualToString:", CFSTR("VideoCompositor_OpenGL")))
  {
    v16 = (id *)MEMORY[0x1E0CC5C90];
    goto LABEL_13;
  }
  v14 = 0;
LABEL_15:
  v13 = 0;
  if (!a7)
    goto LABEL_18;
LABEL_16:
  if (!v14)
    *a7 = (id)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11841, 0);
LABEL_18:
  if (a4)
    *a4 = v13;
  if (a3)
  {
    if (v14)
      v17 = CFRetain(v14);
    else
      v17 = 0;
    *a3 = v17;
  }

  if (v14)
    CFRelease(v14);
  return v14 != 0;
}

- (CMTime)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->timescale
                                                                                      + 32);
  return self;
}

- (void)setFrameDuration:(id *)a3
{
  AVVideoCompositionInternal *videoComposition;
  __int128 v4;

  videoComposition = self->_videoComposition;
  v4 = *(_OWORD *)&a3->var0;
  videoComposition->frameDuration.epoch = a3->var3;
  *(_OWORD *)&videoComposition->frameDuration.value = v4;
}

- (CMPersistentTrackID)sourceTrackIDForFrameTiming
{
  return self->_videoComposition->sourceTrackIDForFrameTiming;
}

- (void)setSourceTrackIDForFrameTiming:(int)a3
{
  self->_videoComposition->sourceTrackIDForFrameTiming = a3;
}

- (CGSize)renderSize
{
  AVVideoCompositionInternal *videoComposition;
  double width;
  double height;
  CGSize result;

  videoComposition = self->_videoComposition;
  width = videoComposition->renderSize.width;
  height = videoComposition->renderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRenderSize:(CGSize)a3
{
  self->_videoComposition->renderSize = a3;
}

- (float)renderScale
{
  return self->_videoComposition->renderScale;
}

- (void)setRenderScale:(float)a3
{
  self->_videoComposition->renderScale = a3;
}

- (NSArray)instructions
{
  return self->_videoComposition->instructions;
}

- (void)setInstructions:(id)a3
{
  NSArray *instructions;

  instructions = self->_videoComposition->instructions;
  if (instructions != a3)
  {

    self->_videoComposition->instructions = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (BOOL)_hasLayerAsAuxiliaryTrack
{
  return -[AVVideoCompositionCoreAnimationTool _hasLayerAsAuxiliaryTrack](self->_videoComposition->animationTool, "_hasLayerAsAuxiliaryTrack");
}

- (id)_auxiliaryTrackLayer
{
  return -[AVVideoCompositionCoreAnimationTool _auxiliaryTrackLayer](self->_videoComposition->animationTool, "_auxiliaryTrackLayer");
}

- (int)_auxiliaryTrackID
{
  return -[AVVideoCompositionCoreAnimationTool _auxiliaryTrackID](self->_videoComposition->animationTool, "_auxiliaryTrackID");
}

- (BOOL)_hasPostProcessingLayers
{
  return -[AVVideoCompositionCoreAnimationTool _hasPostProcessingLayers](self->_videoComposition->animationTool, "_hasPostProcessingLayers");
}

- (id)_postProcessingVideoLayer
{
  return (id)objc_msgSend(-[AVVideoComposition _postProcessingVideoLayers](self, "_postProcessingVideoLayers"), "firstObject");
}

- (id)_postProcessingVideoLayers
{
  return -[AVVideoCompositionCoreAnimationTool _postProcessingVideoLayers](self->_videoComposition->animationTool, "_postProcessingVideoLayers");
}

- (id)_postProcessingRootLayer
{
  return -[AVVideoCompositionCoreAnimationTool _postProcessingRootLayer](self->_videoComposition->animationTool, "_postProcessingRootLayer");
}

- (AVVideoCompositionCoreAnimationTool)animationTool
{
  return self->_videoComposition->animationTool;
}

- (void)setAnimationTool:(id)a3
{
  id v5;

  v5 = a3;

  self->_videoComposition->animationTool = (AVVideoCompositionCoreAnimationTool *)a3;
}

- (NSArray)sourceSampleDataTrackIDs
{
  return self->_videoComposition->sourceSampleDataTracks;
}

- (void)setSourceSampleDataTrackIDs:(id)a3
{

  self->_videoComposition->sourceSampleDataTracks = (NSArray *)objc_msgSend(a3, "copy");
}

- (id)sourceVideoTrackWindowsForTrackIDs
{
  return self->_videoComposition->sourceVideoTrackWindowsForTrackIDs;
}

- (void)setSourceVideoTrackWindowsForTrackIDs:(id)a3
{
  NSDictionary *sourceVideoTrackWindowsForTrackIDs;

  sourceVideoTrackWindowsForTrackIDs = self->_videoComposition->sourceVideoTrackWindowsForTrackIDs;
  if (sourceVideoTrackWindowsForTrackIDs != a3)
  {

    self->_videoComposition->sourceVideoTrackWindowsForTrackIDs = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (id)sourceSampleDataTrackWindowsForTrackIDs
{
  return self->_videoComposition->sourceSampleDataTrackWindowsForTrackIDs;
}

- (void)setSourceSampleDataTrackWindowsForTrackIDs:(id)a3
{
  NSDictionary *sourceSampleDataTrackWindowsForTrackIDs;

  sourceSampleDataTrackWindowsForTrackIDs = self->_videoComposition->sourceSampleDataTrackWindowsForTrackIDs;
  if (sourceSampleDataTrackWindowsForTrackIDs != a3)
  {

    self->_videoComposition->sourceSampleDataTrackWindowsForTrackIDs = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (id)_serializableInstructions
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CFDictionaryRef v10;
  CFDictionaryRef v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *obj;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  CMTimeRange range;
  CMTime v24;
  CMTimeRange v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = -[NSArray count](self->_videoComposition->instructions, "count");
  v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_videoComposition->instructions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 1;
    v21 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      v20 = v6;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        if (-[AVVideoComposition customVideoCompositorClass](self, "customVideoCompositorClass"))
        {
          memset(&v25, 0, sizeof(v25));
          if (v8)
            objc_msgSend(v8, "timeRange");
          v9 = (void *)MEMORY[0x1E0C99E08];
          *(_OWORD *)&range.start.value = *(_OWORD *)&v25.start.value;
          range.start.epoch = v25.start.epoch;
          v10 = NSDictionaryFromCMTime(&range.start);
          range = v25;
          CMTimeRangeGetEnd(&v24, &range);
          v11 = NSDictionaryFromCMTime(&v24);
          v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "enablePostProcessing"));
          v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "containsTweening"));
          v14 = (void *)objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("StartTime"), v11, CFSTR("EndTime"), v12, CFSTR("EnablePostProcessing"), v13, CFSTR("ContainsTweening"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20 + v7), CFSTR("InstructionIdentifier"), 0);
          v15 = objc_msgSend(v8, "requiredSourceTrackIDs");
          if (v15)
            objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("RequiredVideoTrackIDArray"));
          v16 = objc_msgSend(v8, "passthroughTrackID");
          if ((_DWORD)v16)
            objc_msgSend(v14, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16), CFSTR("PassthroughSourceVideoTrackID"));
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v17 = objc_msgSend(v8, "requiredSourceSampleDataTrackIDs");
            if (v17)
              objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("RequiredSampleDataTrackIDArray"));
          }
        }
        else
        {
          v14 = (void *)objc_msgSend(v8, "dictionaryRepresentation");
        }
        objc_msgSend(v22, "addObject:", v14);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v6 = v20 + v7;
    }
    while (v5);
  }
  return v22;
}

- (id)instructionForFigInstruction:(void *)a3
{
  int v5;

  if (-[NSArray count](self->_videoComposition->instructions, "count")
    && (v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("InstructionIdentifier")), "intValue") - 1,
        -[NSArray count](self->_videoComposition->instructions, "count") > v5))
  {
    return -[NSArray objectAtIndex:](self->_videoComposition->instructions, "objectAtIndex:", v5);
  }
  else
  {
    return 0;
  }
}

- (BOOL)_isValidReturningExceptionReason:(id *)a3
{
  AVVideoCompositionInternal *videoComposition;
  int sourceTrackIDForFrameTiming;
  BOOL result;
  __CFString *v8;
  CMTime v9;
  CMTime time1;

  videoComposition = self->_videoComposition;
  if (videoComposition->renderSize.width <= 0.0 || videoComposition->renderSize.height <= 0.0)
  {
    result = 0;
    v8 = CFSTR("video composition must have a positive renderSize");
  }
  else if (videoComposition->renderScale <= 0.0)
  {
    result = 0;
    v8 = CFSTR("video composition must have a positive renderScale");
  }
  else if ((videoComposition->frameDuration.flags & 1) != 0
         && (time1 = (CMTime)videoComposition->frameDuration,
             v9 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
             CMTimeCompare(&time1, &v9) >= 1))
  {
    sourceTrackIDForFrameTiming = self->_videoComposition->sourceTrackIDForFrameTiming;
    result = sourceTrackIDForFrameTiming >= 0;
    if (sourceTrackIDForFrameTiming < 0)
      v8 = CFSTR("video composition must have a positive sourceTrackIDForFrameTiming");
    else
      v8 = 0;
  }
  else
  {
    result = 0;
    v8 = CFSTR("video composition must have a positive frameDuration");
  }
  if (a3)
    *a3 = v8;
  return result;
}

- (BOOL)isValidForAsset:(AVAsset *)asset timeRange:(CMTimeRange *)timeRange validationDelegate:(id)validationDelegate
{
  NSArray *v9;
  __int128 v10;
  _OWORD v12[3];
  _QWORD v13[3];

  v9 = -[AVAsset tracks](asset, "tracks");
  if (asset)
    -[AVAsset duration](asset, "duration");
  else
    memset(v13, 0, sizeof(v13));
  v10 = *(_OWORD *)&timeRange->start.epoch;
  v12[0] = *(_OWORD *)&timeRange->start.value;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&timeRange->duration.timescale;
  return -[AVVideoComposition isValidForTracks:assetDuration:timeRange:validationDelegate:](self, "isValidForTracks:assetDuration:timeRange:validationDelegate:", v9, v13, v12, validationDelegate);
}

- (id)_trackWithTrackID:(int)a3 inTracks:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(a4);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if (objc_msgSend(v10, "trackID") == a3)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)isValidForTracks:(id)a3 assetDuration:(id *)a4 timeRange:(id *)a5 validationDelegate:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  id v23;
  BOOL v24;
  AVVideoCompositionInternal *videoComposition;
  uint64_t sourceTrackIDForFrameTiming;
  __int128 v27;
  __int128 v28;
  char v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  void *v33;
  uint64_t j;
  uint64_t v35;
  AVVideoCompositionCoreAnimationTool *animationTool;
  int v37;
  BOOL v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  char flags;
  void *v51;
  uint64_t v52;
  CMTime *p_duration;
  char v54;
  char v55;
  unsigned __int8 v56;
  uint64_t v57;
  NSArray *obj;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  id v64;
  id v65;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v66;
  uint64_t v67;
  uint64_t v68;
  CMTime v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CMTimeRange v79;
  CMTime rhs;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange time2;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  CMTime start;
  CMTimeRange time1;
  CMTime v91;
  CMTime var0;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v94 != v14)
          objc_enumerationMutation(a3);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "asset");
        if (v13)
        {
          if (v16 != v13)
          {
            v51 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Tracks must be from the same asset"), v17, v18, v19, v20, v21, v52), 0);
            objc_exception_throw(v51);
          }
        }
        else
        {
          v13 = v16;
        }
      }
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }
  v22 = objc_opt_respondsToSelector();
  v23 = -[AVVideoComposition customVideoCompositorClass](self, "customVideoCompositorClass");
  if (v23 && (objc_msgSend(v23, "conformsToProtocol:", &unk_1EE2E7348) & 1) == 0)
  {
    if (!a6)
      return 0;
    if ((v22 & 1) != 0)
    {
      v24 = 0;
      if (!objc_msgSend(a6, "videoComposition:shouldContinueValidatingAfterFindingInvalidValueForKey:", self, CFSTR("customVideoCompositorClass")))return v24;
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v24 = 1;
  }
  videoComposition = self->_videoComposition;
  if (videoComposition->renderSize.width <= 0.0 || videoComposition->renderSize.height <= 0.0)
  {
    if (!a6)
      return 0;
    if ((v22 & 1) != 0)
    {
      if (!objc_msgSend(a6, "videoComposition:shouldContinueValidatingAfterFindingInvalidValueForKey:", self, CFSTR("renderSize")))return 0;
      v24 = 0;
      videoComposition = self->_videoComposition;
    }
    else
    {
      v24 = 0;
    }
  }
  if (videoComposition->renderScale <= 0.0)
  {
    if (!a6)
      return 0;
    if ((v22 & 1) != 0)
    {
      if (!objc_msgSend(a6, "videoComposition:shouldContinueValidatingAfterFindingInvalidValueForKey:", self, CFSTR("renderScale")))return 0;
      v24 = 0;
      videoComposition = self->_videoComposition;
    }
    else
    {
      v24 = 0;
    }
  }
  if ((videoComposition->frameDuration.flags & 1) == 0
    || (*(_OWORD *)&time1.start.value = *(_OWORD *)&videoComposition->frameDuration.value,
        time1.start.epoch = videoComposition->frameDuration.epoch,
        *(_OWORD *)&time2.start.value = *MEMORY[0x1E0CA2E68],
        time2.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16),
        CMTimeCompare(&time1.start, &time2.start) <= 0))
  {
    if (!a6)
      return 0;
    if ((v22 & 1) != 0)
    {
      v24 = 0;
      if (!objc_msgSend(a6, "videoComposition:shouldContinueValidatingAfterFindingInvalidValueForKey:", self, CFSTR("frameDuration")))return v24;
    }
    else
    {
      v24 = 0;
    }
  }
  sourceTrackIDForFrameTiming = self->_videoComposition->sourceTrackIDForFrameTiming;
  if ((_DWORD)sourceTrackIDForFrameTiming
    && !-[AVVideoComposition _trackWithTrackID:inTracks:](self, "_trackWithTrackID:inTracks:", sourceTrackIDForFrameTiming, a3))
  {
    if (!a6)
      return 0;
    if ((v22 & 1) != 0)
    {
      v24 = 0;
      if (!objc_msgSend(a6, "videoComposition:shouldContinueValidatingAfterFindingInvalidValueForKey:", self, CFSTR("sourceTrackIDForFrameTiming")))return v24;
    }
    else
    {
      v24 = 0;
    }
  }
  if (!-[NSArray count](self->_videoComposition->instructions, "count"))
  {
    if (!a6)
      return 0;
    if ((v22 & 1) != 0)
    {
      v24 = 0;
      if (!objc_msgSend(a6, "videoComposition:shouldContinueValidatingAfterFindingInvalidValueForKey:", self, CFSTR("instructions")))return v24;
    }
    else
    {
      v24 = 0;
    }
  }
  if ((a5->var0.var2 & 1) != 0
    && (a5->var1.var2 & 1) != 0
    && !a5->var1.var3
    && (a5->var1.var0 & 0x8000000000000000) == 0)
  {
    v27 = *(_OWORD *)&a5->var0.var3;
    var0 = (CMTime)a5->var0;
    memset(&v91, 0, sizeof(v91));
    v28 = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)&time1.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1.start.epoch = v27;
    *(_OWORD *)&time1.duration.timescale = v28;
    CMTimeRangeGetEnd(&v91, &time1);
    v56 = objc_opt_respondsToSelector();
    v29 = objc_opt_respondsToSelector();
    v62 = objc_opt_respondsToSelector();
    start = var0;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = self->_videoComposition->instructions;
    v60 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
    if (!v60)
      goto LABEL_121;
    v57 = 0;
    v61 = *(_QWORD *)v86;
    p_duration = &time2.duration;
    v54 = v29;
    v55 = v22;
    while (1)
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v86 != v61)
          objc_enumerationMutation(obj);
        v63 = v30;
        v31 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v30);
        memset(&time1, 0, sizeof(time1));
        if (v31)
        {
          objc_msgSend(v31, "timeRange");
          if ((time1.start.flags & 1) != 0
            && (time1.duration.flags & 1) != 0
            && !time1.duration.epoch
            && (time1.duration.value & 0x8000000000000000) == 0)
          {
            range = time1;
            memset(&time2, 0, sizeof(time2));
            v32 = *(_OWORD *)&a5->var0.var3;
            *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a5->var0.var0;
            *(_OWORD *)&otherRange.start.epoch = v32;
            *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
            CMTimeRangeGetIntersection(&time2, &range, &otherRange);
            if ((time2.start.flags & 1) == 0
              || (time2.duration.flags & 1) == 0
              || time2.duration.epoch
              || time2.duration.value < 0
              || (*(_OWORD *)&range.start.value = *(_OWORD *)&p_duration->value,
                  range.start.epoch = p_duration->epoch,
                  *(_OWORD *)&otherRange.start.value = *MEMORY[0x1E0CA2E68],
                  otherRange.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16),
                  CMTimeCompare(&range.start, &otherRange.start) <= 0))
            {
              range = time1;
              otherRange.start = var0;
              if (!CMTimeRangeContainsTime(&range, &otherRange.start))
              {
                *(_OWORD *)&range.start.value = *(_OWORD *)&time1.start.value;
                range.start.epoch = time1.start.epoch;
                otherRange.start = v91;
                if (CMTimeCompare(&range.start, &otherRange.start))
                  goto LABEL_109;
              }
            }
            *(_OWORD *)&range.start.value = *(_OWORD *)&time1.start.value;
            range.start.epoch = time1.start.epoch;
            otherRange.start = start;
            if (CMTimeCompare(&range.start, &otherRange.start) >= 1)
            {
              memset(&range, 0, sizeof(range));
              *(_OWORD *)&otherRange.start.value = *(_OWORD *)&time1.start.value;
              otherRange.start.epoch = time1.start.epoch;
              rhs = start;
              CMTimeSubtract(&duration, &otherRange.start, &rhs);
              otherRange.start = start;
              CMTimeRangeMake(&range, &otherRange.start, &duration);
              if (!a6)
                return 0;
              if ((v56 & 1) != 0)
              {
                otherRange = range;
                if ((objc_msgSend(a6, "videoComposition:shouldContinueValidatingAfterFindingEmptyTimeRange:", self, &otherRange) & 1) == 0)return 0;
              }
              goto LABEL_69;
            }
            if (v57 >= 1)
            {
              *(_OWORD *)&range.start.value = *(_OWORD *)&time1.start.value;
              range.start.epoch = time1.start.epoch;
              otherRange.start = start;
              if (CMTimeCompare(&range.start, &otherRange.start) < 0)
              {
                if (!a6
                  || (v29 & 1) != 0
                  && !objc_msgSend(a6, "videoComposition:shouldContinueValidatingAfterFindingInvalidTimeRangeInInstruction:", self, v31))
                {
                  return 0;
                }
LABEL_69:
                v24 = 0;
              }
            }
            memset(&range, 0, 24);
            objc_msgSend(v31, "timeRange", p_duration);
            CMTimeRangeGetEnd(&range.start, &v79);
            *(_OWORD *)&otherRange.start.value = *(_OWORD *)&range.start.value;
            otherRange.start.epoch = range.start.epoch;
            rhs = start;
            if (CMTimeCompare(&otherRange.start, &rhs) >= 1)
              start = range.start;
            if (v13)
            {
              v33 = (void *)objc_msgSend(v31, "requiredSourceTrackIDs");
              v75 = 0u;
              v76 = 0u;
              v77 = 0u;
              v78 = 0u;
              v64 = v33;
              v68 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v75, v98, 16);
              if (v68)
              {
                v59 = v31;
                v66 = a4;
                v67 = *(_QWORD *)v76;
                do
                {
                  for (j = 0; j != v68; ++j)
                  {
                    if (*(_QWORD *)v76 != v67)
                      objc_enumerationMutation(v64);
                    v35 = objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * j), "intValue");
                    animationTool = self->_videoComposition->animationTool;
                    if (!animationTool
                      || ((v37 = -[AVVideoCompositionCoreAnimationTool _auxiliaryTrackID](animationTool, "_auxiliaryTrackID")) != 0? (v38 = (_DWORD)v35 == v37): (v38 = 0), !v38))
                    {
                      v39 = -[AVVideoComposition _trackWithTrackID:inTracks:](self, "_trackWithTrackID:inTracks:", v35, a3);
                      v40 = (void *)objc_msgSend(v39, "mediaType");
                      if (!v39
                        || (v41 = v40, (objc_msgSend(v40, "isEqualToString:", CFSTR("vide")) & 1) == 0)
                        && (objc_msgSend(v41, "isEqualToString:", CFSTR("auxv")) & 1) == 0
                        && (objc_msgSend(v41, "isEqualToString:", CFSTR("scen")) & 1) == 0)
                      {
                        if (!a6)
                          return 0;
                        if ((v62 & 1) != 0)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v42 = (void *)objc_msgSend(v59, "layerInstructions");
                            v71 = 0u;
                            v72 = 0u;
                            v73 = 0u;
                            v74 = 0u;
                            v65 = v42;
                            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v71, v97, 16);
                            if (v43)
                            {
                              v44 = v43;
                              v45 = *(_QWORD *)v72;
LABEL_92:
                              v46 = 0;
                              while (1)
                              {
                                if (*(_QWORD *)v72 != v45)
                                  objc_enumerationMutation(v65);
                                v47 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v46);
                                if ((_DWORD)v35 == objc_msgSend(v47, "trackID"))
                                  break;
                                if (v44 == ++v46)
                                {
                                  v44 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v71, v97, 16);
                                  v24 = 0;
                                  if (v44)
                                    goto LABEL_92;
                                  goto LABEL_102;
                                }
                              }
                              if (v47
                                && !objc_msgSend(a6, "videoComposition:shouldContinueValidatingAfterFindingInvalidTrackIDInInstruction:layerInstruction:asset:", self, v59, v47, v13))
                              {
                                return 0;
                              }
                            }
                          }
                        }
                        v24 = 0;
                      }
                    }
LABEL_102:
                    a4 = v66;
                  }
                  v68 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v75, v98, 16);
                }
                while (v68);
              }
            }
            ++v57;
            v29 = v54;
            v22 = v55;
            goto LABEL_109;
          }
        }
        if (!a6
          || (v29 & 1) != 0
          && (objc_msgSend(a6, "videoComposition:shouldContinueValidatingAfterFindingInvalidTimeRangeInInstruction:", self, v31) & 1) == 0)
        {
          return 0;
        }
        v24 = 0;
LABEL_109:
        v30 = v63 + 1;
      }
      while (v63 + 1 != v60);
      v48 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
      v60 = v48;
      if (!v48)
      {
        if (v57)
          goto LABEL_136;
LABEL_121:
        if (!a6)
          return 0;
        if ((v22 & 1) != 0)
        {
          v24 = 0;
          if (!objc_msgSend(a6, "videoComposition:shouldContinueValidatingAfterFindingInvalidValueForKey:", self, CFSTR("instructions")))return v24;
        }
        else
        {
          v24 = 0;
        }
LABEL_136:
        flags = v91.flags;
        if ((v91.flags & 0x1D) != 1)
        {
          v91 = (CMTime)*a4;
          flags = v91.flags;
        }
        if ((flags & 0x1D) == 1)
        {
          time1.start = start;
          time2.start = v91;
          if (CMTimeCompare(&time1.start, &time2.start) < 0)
          {
            memset(&time1, 0, sizeof(time1));
            time2.start = v91;
            range.start = start;
            CMTimeSubtract(&v70, &time2.start, &range.start);
            time2.start = start;
            CMTimeRangeMake(&time1, &time2.start, &v70);
            if (((a6 != 0) & v56) == 1)
            {
              time2 = time1;
              objc_msgSend(a6, "videoComposition:shouldContinueValidatingAfterFindingEmptyTimeRange:", self, &time2);
            }
            return 0;
          }
        }
        return v24;
      }
    }
  }
  return v24;
}

- (void)determineValidityForAsset:(AVAsset *)asset timeRange:(CMTimeRange *)timeRange validationDelegate:(id)validationDelegate completionHandler:(void *)completionHandler
{
  __int128 v6;
  _QWORD v7[8];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__AVVideoComposition_determineValidityForAsset_timeRange_validationDelegate_completionHandler___block_invoke;
  v7[3] = &unk_1E30326E0;
  v7[4] = self;
  v7[5] = asset;
  v6 = *(_OWORD *)&timeRange->start.epoch;
  v8 = *(_OWORD *)&timeRange->start.value;
  v9 = v6;
  v10 = *(_OWORD *)&timeRange->duration.timescale;
  v7[6] = validationDelegate;
  v7[7] = completionHandler;
  AVLoadValuesAsynchronously(asset, (uint64_t)&unk_1E3093B50, (uint64_t)v7);
}

uint64_t __95__AVVideoComposition_determineValidityForAsset_timeRange_validationDelegate_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v8[3];

  if (!a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_OWORD *)(a1 + 80);
    v8[0] = *(_OWORD *)(a1 + 64);
    v8[1] = v6;
    v8[2] = *(_OWORD *)(a1 + 96);
    objc_msgSend(v3, "isValidForAsset:timeRange:validationDelegate:", v4, v8, v5);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_setFrameDurationForFrameRate:(float)a3 sourceTrackIDForFrameTiming:(int)a4
{
  uint64_t v4;
  CMTime *v6;
  CMTime v7;
  CMTime v8;
  CMTime v9;
  CMTime v10;

  v4 = *(_QWORD *)&a4;
  if (a3 == 0.0)
  {
    CMTimeMake(&v10, 1, 30);
    v9 = v10;
    v6 = &v9;
  }
  else
  {
    CMTimeMakeWithSeconds(&v8, 1.0 / a3, 90000);
    v7 = v8;
    v6 = &v7;
  }
  -[AVVideoComposition setFrameDuration:](self, "setFrameDuration:", v6, *(_OWORD *)&v7.value, v7.epoch);
  if (dyld_program_sdk_at_least())
    -[AVVideoComposition setSourceTrackIDForFrameTiming:](self, "setSourceTrackIDForFrameTiming:", v4);
}

- (void)setColorPrimaries:(id)a3
{
  NSString *colorPrimaries;

  colorPrimaries = self->_videoComposition->colorPrimaries;
  if (colorPrimaries != a3)
  {

    self->_videoComposition->colorPrimaries = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setColorYCbCrMatrix:(id)a3
{
  NSString *colorYCbCrMatrix;

  colorYCbCrMatrix = self->_videoComposition->colorYCbCrMatrix;
  if (colorYCbCrMatrix != a3)
  {

    self->_videoComposition->colorYCbCrMatrix = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setColorTransferFunction:(id)a3
{
  NSString *colorTransferFunction;

  colorTransferFunction = self->_videoComposition->colorTransferFunction;
  if (colorTransferFunction != a3)
  {

    self->_videoComposition->colorTransferFunction = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setPerFrameHDRDisplayMetadataPolicy:(id)a3
{
  NSString *perFrameHDRDisplayMetadataPolicy;

  perFrameHDRDisplayMetadataPolicy = self->_videoComposition->perFrameHDRDisplayMetadataPolicy;
  if (perFrameHDRDisplayMetadataPolicy != a3)
  {

    self->_videoComposition->perFrameHDRDisplayMetadataPolicy = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (NSString)colorPrimaries
{
  return self->_videoComposition->colorPrimaries;
}

- (NSString)colorYCbCrMatrix
{
  return self->_videoComposition->colorYCbCrMatrix;
}

- (NSString)colorTransferFunction
{
  return self->_videoComposition->colorTransferFunction;
}

- (AVVideoCompositionPerFrameHDRDisplayMetadataPolicy)perFrameHDRDisplayMetadataPolicy
{
  return self->_videoComposition->perFrameHDRDisplayMetadataPolicy;
}

- (void)videoCompositionOutputColorPropertiesWithCustomCompositor:(id)a3 formatDescriptions:(id)a4 colorPrimaries:(id *)a5 transferFunction:(id *)a6 yCbCrMatrix:(id *)a7 perFrameHDRDisplayMetadataPolicy:(id *)a8
{
  NSString *v13;
  NSString *v14;
  NSString *v15;
  const __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  id *v19;
  NSString *v20;

  v13 = -[AVVideoComposition colorPrimaries](self, "colorPrimaries");
  v14 = -[AVVideoComposition colorTransferFunction](self, "colorTransferFunction");
  v15 = -[AVVideoComposition colorYCbCrMatrix](self, "colorYCbCrMatrix");
  v20 = -[AVVideoComposition perFrameHDRDisplayMetadataPolicy](self, "perFrameHDRDisplayMetadataPolicy");
  if (a3)
  {
    objc_msgSend(a3, "supportsWideColorSourceFrames");
    objc_msgSend(a3, "supportsHDRSourceFrames");
  }
  CMFormatDescriptionGetWidestGamutAndLargestDynamicRangeColorPropertiesFromFormatDescriptions();
  if (v13)
    v16 = (const __CFString *)v13;
  else
    v16 = 0;
  if (v14)
    v17 = (__CFString *)v14;
  else
    v17 = 0;
  if (v15)
    v18 = (__CFString *)v15;
  else
    v18 = 0;
  if (-[AVVideoComposition animationTool](self, "animationTool")
    && !-[AVVideoCompositionCoreAnimationTool _auxiliaryTrackID](-[AVVideoComposition animationTool](self, "animationTool"), "_auxiliaryTrackID"))
  {
    v19 = a5;
    if ((-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("ITU_R_2100_HLG")) & 1) != 0
      || (-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("SMPTE_ST_2084_PQ")) & 1) != 0
      || -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("Linear")))
    {
      v16 = CFSTR("ITU_R_709_2");
      v17 = CFSTR("ITU_R_709_2");
      v18 = CFSTR("ITU_R_709_2");
    }
  }
  else
  {
    v19 = a5;
  }
  if (v19)
    *v19 = (id)v16;
  if (a6)
    *a6 = v17;
  if (a7)
    *a7 = v18;
  if (a8)
    *a8 = v20;
}

+ (id)_mutableVideoCompositionWithAsset:(id)a3 applyingCIFiltersWithHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  AVMutableVideoComposition *v12;
  AVCoreImageFilterVideoCompositionInstruction *v13;
  AVCoreImageFilterVideoCompositionInstruction *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double width;
  double height;
  int v21;
  int v22;
  uint64_t v23;
  double v24;
  CGAffineTransform v26;
  _QWORD v27[13];
  CMTime duration;
  CMTimeRange v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  AVCoreImageFilterVideoCompositionInstruction *v34;
  uint64_t v35;
  CMTime start;
  uint64_t v37;
  CGRect v38;
  CGRect v39;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "tracksWithMediaType:", CFSTR("vide"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, &start, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v31;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v31 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
    if ((objc_msgSend(v11, "isEnabled") & 1) != 0)
      break;
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, &start, 16);
      if (v8)
        goto LABEL_3;
      return 0;
    }
  }
  if (!v11)
    return 0;
  v13 = [AVCoreImageFilterVideoCompositionInstruction alloc];
  if (a3)
    objc_msgSend(a3, "duration");
  else
    memset(&duration, 0, sizeof(duration));
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  CMTimeRangeMake(&v29, &start, &duration);
  v35 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "trackID"));
  v14 = -[AVCoreImageFilterVideoCompositionInstruction initWithTimeRange:sourceTrackIDs:handler:](v13, "initWithTimeRange:sourceTrackIDs:handler:", &v29, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1), a4);
  objc_msgSend(v11, "preferredTransform");
  *(_OWORD *)v27 = *(_OWORD *)&v27[7];
  *(_OWORD *)&v27[2] = *(_OWORD *)&v27[9];
  *(_OWORD *)&v27[4] = *(_OWORD *)&v27[11];
  -[AVCoreImageFilterVideoCompositionInstruction setSourceTrackPreferredTransform:](v14, "setSourceTrackPreferredTransform:", v27);
  v12 = +[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:](AVMutableVideoComposition, "videoCompositionWithPropertiesOfAsset:", a3);
  -[AVMutableVideoComposition setCustomVideoCompositorClass:](v12, "setCustomVideoCompositorClass:", objc_opt_class());
  v34 = v14;
  -[AVMutableVideoComposition setInstructions:](v12, "setInstructions:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1));
  objc_msgSend(v11, "naturalSize");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v11, "preferredTransform");
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = v16;
  v38.size.height = v18;
  v39 = CGRectApplyAffineTransform(v38, &v26);
  width = v39.size.width;
  height = v39.size.height;
  objc_msgSend(v11, "nominalFrameRate", v39.origin.x, v39.origin.y);
  v22 = v21;
  v23 = objc_msgSend(v11, "trackID");
  LODWORD(v24) = v22;
  -[AVVideoComposition _setFrameDurationForFrameRate:sourceTrackIDForFrameTiming:](v12, "_setFrameDurationForFrameRate:sourceTrackIDForFrameTiming:", v23, v24);
  -[AVMutableVideoComposition setRenderSize:](v12, "setRenderSize:", width, height);
  return v12;
}

+ (AVVideoComposition)videoCompositionWithAsset:(AVAsset *)asset applyingCIFiltersWithHandler:(void *)applier
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;

  if (!asset)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = "asset";
    goto LABEL_6;
  }
  if (!applier)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = "handler";
LABEL_6:
    v12 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)applier, v4, v5, v6, v7, (uint64_t)v11), 0);
    objc_exception_throw(v12);
  }
  return (AVVideoComposition *)(id)objc_msgSend((id)objc_msgSend(a1, "_mutableVideoCompositionWithAsset:applyingCIFiltersWithHandler:"), "copy");
}

+ (void)videoCompositionWithAsset:(AVAsset *)asset applyingCIFiltersWithHandler:(void *)applier completionHandler:(void *)completionHandler
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  _QWORD v12[8];

  if (!asset)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = "asset != nil";
    goto LABEL_8;
  }
  if (!applier)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = "applier != nil";
    goto LABEL_8;
  }
  if (!completionHandler)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = "completionHandler != nil";
LABEL_8:
    v11 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)applier, (uint64_t)completionHandler, v5, v6, v7, (uint64_t)v10), 0);
    objc_exception_throw(v11);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __124__AVVideoComposition_AVVideoCompositionFiltering__videoCompositionWithAsset_applyingCIFiltersWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E3032708;
  v12[4] = a1;
  v12[5] = asset;
  v12[6] = applier;
  v12[7] = completionHandler;
  AVLoadValuesAsynchronously(asset, (uint64_t)&unk_1E3093B68, (uint64_t)v12);
}

uint64_t __124__AVVideoComposition_AVVideoCompositionFiltering__videoCompositionWithAsset_applyingCIFiltersWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
    objc_msgSend(*(id *)(a1 + 32), "videoCompositionWithAsset:applyingCIFiltersWithHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

@end
