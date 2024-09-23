@implementation BWDeepFusionProcessorInput

- (BWDeepFusionProcessorInput)initWithSettings:(id)a3 portType:(id)a4 processInferenceInputImage:(BOOL)a5 processQuadraForEnhancedResolutionInferenceInputImage:(BOOL)a6 processSmartStyleRenderingInput:(BOOL)a7
{
  BWDeepFusionProcessorInput *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BWDeepFusionProcessorInput;
  v10 = -[BWStillImageProcessorControllerInput initWithSettings:portType:](&v12, sel_initWithSettings_portType_, a3, a4);
  if (v10)
  {
    v10->_inputBuffers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10->_processInferenceInputImage = a5;
    v10->_processQuadraForEnhancedResolutionInferenceInputImage = a6;
    v10->_processSmartStyleRenderingInput = a7;
  }
  return v10;
}

+ (id)inputForOnlyApplyingSemanticStyleWithSettings:(id)a3 portType:(id)a4
{
  BWDeepFusionProcessorInput *v4;

  v4 = -[BWDeepFusionProcessorInput initWithSettings:portType:processInferenceInputImage:processQuadraForEnhancedResolutionInferenceInputImage:processSmartStyleRenderingInput:]([BWDeepFusionProcessorInput alloc], "initWithSettings:portType:processInferenceInputImage:processQuadraForEnhancedResolutionInferenceInputImage:processSmartStyleRenderingInput:", a3, a4, 0, 0, 0);
  if (v4)
    v4->_onlyApplyingSemanticStyle = 1;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeepFusionProcessorInput;
  -[BWStillImageProcessorControllerInput dealloc](&v3, sel_dealloc);
}

- (void)addBuffer:(__CVBuffer *)a3 metadata:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6
{
  -[BWDeepFusionProcessorInput addBuffer:metadata:bufferType:captureFrameFlags:lscGainMap:lscGainMapParameters:](self, "addBuffer:metadata:bufferType:captureFrameFlags:lscGainMap:lscGainMapParameters:", a3, a4, a5, a6, 0, 0);
}

- (void)addBuffer:(__CVBuffer *)a3 metadata:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 lscGainMap:(__CVBuffer *)a7 lscGainMapParameters:(id)a8
{
  NSMutableArray *inputBuffers;
  void *v16;
  BWDeepFusionInputBuffer *v17;
  _QWORD v18[5];

  if (a3)
  {
    if (a5 != 24)
    {
      inputBuffers = self->_inputBuffers;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __110__BWDeepFusionProcessorInput_addBuffer_metadata_bufferType_captureFrameFlags_lscGainMap_lscGainMapParameters___block_invoke;
      v18[3] = &__block_descriptor_40_e40_B32__0__BWDeepFusionInputBuffer_8Q16_B24l;
      v18[4] = a5;
      v16 = (void *)-[NSMutableArray indexesOfObjectsPassingTest:](inputBuffers, "indexesOfObjectsPassingTest:", v18);
      -[NSMutableArray removeObjectsAtIndexes:](self->_inputBuffers, "removeObjectsAtIndexes:", v16);
      objc_msgSend(v16, "count");
    }
    v17 = -[BWDeepFusionInputBuffer initWithBuffer:type:captureFrameFlags:metadata:lscGainMap:lscGainMapParameters:]([BWDeepFusionInputBuffer alloc], "initWithBuffer:type:captureFrameFlags:metadata:lscGainMap:lscGainMapParameters:", a3, a5, a6, a4, a7, a8);
    -[NSMutableArray addObject:](self->_inputBuffers, "addObject:", v17);

    -[BWDeepFusionProcessorInputDelegate input:addInputBuffer:](self->_delegate, "input:addInputBuffer:", self, v17);
  }
  else
  {
    FigDebugAssert3();
  }
}

BOOL __110__BWDeepFusionProcessorInput_addBuffer_metadata_bufferType_captureFrameFlags_lscGainMap_lscGainMapParameters___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (void)allInferencesDelivered
{
  self->_allInferencesDelivered = 1;
  -[BWDeepFusionProcessorInputDelegate addInferencesForInput:](self->_delegate, "addInferencesForInput:", self);
}

- (void)beginProcessingCachedBuffersIfWaiting
{
  -[BWDeepFusionProcessorInputDelegate beginProcessingCachedBuffersForInput:](self->_delegate, "beginProcessingCachedBuffersForInput:", self);
}

- (void)releaseInputPixelBuffers
{
  NSMutableArray *inputBuffers;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  inputBuffers = self->_inputBuffers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputBuffers, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(inputBuffers);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "releasePixelBuffers");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputBuffers, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (id)description
{
  void *v3;
  NSMutableArray *inputBuffers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  BWDeepFusionProcessorInput *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = self;
  inputBuffers = self->_inputBuffers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputBuffers, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(inputBuffers);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 24 || objc_msgSend(v10, "type") == 23 || objc_msgSend(v10, "type") == 25)
          v7 = (v7 + 1);
        switch(objc_msgSend(v10, "type"))
        {
          case 8:
            v11 = v3;
            v12 = CFSTR("SynthRef");
            break;
          case 9:
            v11 = v3;
            v12 = CFSTR("SynthRefFusMap");
            break;
          case 10:
            v11 = v3;
            v12 = CFSTR("SynthLong");
            break;
          case 11:
            v11 = v3;
            v12 = CFSTR("SynthLongFusMap");
            break;
          case 12:
            v11 = v3;
            v12 = CFSTR("LongFusMap");
            break;
          case 13:
            v11 = v3;
            v12 = CFSTR("DeepFusion");
            break;
          case 19:
            v11 = v3;
            v12 = CFSTR("GainMap");
            break;
          case 22:
            v11 = v3;
            v12 = CFSTR("Long");
            break;
          case 23:
            v11 = v3;
            v12 = CFSTR("RefEV0");
            break;
          case 24:
            v11 = v3;
            v12 = CFSTR("EV0");
            break;
          case 25:
            v11 = v3;
            v12 = CFSTR("QuadraEV0");
            break;
          case 27:
            v11 = v3;
            v12 = CFSTR("EV-");
            break;
          default:
            v12 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%llu)"), objc_msgSend(v10, "type"));
            v11 = v3;
            break;
        }
        objc_msgSend(v11, "addObject:", v12);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputBuffers, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v3, "sortUsingSelector:", sel_compare_);
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_opt_class();
  return (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@ %@ : Buffer types: %@, evZeroCount:%d processInferenceInputImage:%d, onlyApplyingSemanticStyle:%d"), v14, v16, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](v16, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureSettings captureType](-[BWStillImageProcessorControllerInput captureSettings](v16, "captureSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](v16, "captureStreamSettings"), "portType"), objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")), v7, -[BWDeepFusionProcessorInput processInferenceInputImage](v16, "processInferenceInputImage"), -[BWDeepFusionProcessorInput onlyApplyingSemanticStyle](v16, "onlyApplyingSemanticStyle"));
}

- (NSArray)inputBuffers
{
  return &self->_inputBuffers->super;
}

- (BWDeepFusionProcessorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int)fusionMode
{
  return self->_fusionMode;
}

- (void)setFusionMode:(int)a3
{
  self->_fusionMode = a3;
}

- (NSDictionary)evZeroReferenceFrameAttachments
{
  return self->_evZeroReferenceFrameAttachments;
}

- (void)setEvZeroReferenceFrameAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)evZeroReferenceFramePTS
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setEvZeroReferenceFramePTS:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_evZeroReferenceFramePTS.value = *(_OWORD *)&a3->var0;
  self->_evZeroReferenceFramePTS.epoch = var3;
}

- (NSArray)providedInferenceAttachedMedia
{
  return self->_providedInferenceAttachedMedia;
}

- (void)setProvidedInferenceAttachedMedia:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)processInferenceInputImage
{
  return self->_processInferenceInputImage;
}

- (BOOL)processQuadraForEnhancedResolutionInferenceInputImage
{
  return self->_processQuadraForEnhancedResolutionInferenceInputImage;
}

- (BOOL)onlyApplyingSemanticStyle
{
  return self->_onlyApplyingSemanticStyle;
}

- (BOOL)processSmartStyleRenderingInput
{
  return self->_processSmartStyleRenderingInput;
}

@end
