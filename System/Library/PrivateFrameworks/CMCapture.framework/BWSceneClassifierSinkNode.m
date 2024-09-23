@implementation BWSceneClassifierSinkNode

- (BWSceneClassifierSinkNode)initWithCaptureDevice:(id)a3 version:(id)a4 semanticStyleSceneDetectionEnabled:(BOOL)a5 sinkID:(id)a6
{
  _BOOL4 v6;
  uint64_t v7;
  BWSceneClassifierSinkNode *v9;
  BWNodeInput *v10;
  BWVideoFormatRequirements *v11;
  objc_super v13;

  v6 = a5;
  v7 = *(_QWORD *)&a4.var0;
  v13.receiver = self;
  v13.super_class = (Class)BWSceneClassifierSinkNode;
  v9 = -[BWSinkNode initWithSinkID:](&v13, sel_initWithSinkID_, a6);
  if (v9)
  {
    v10 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v9);
    v11 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v10, "setFormatRequirements:", v11);

    -[BWNode addInput:](v9, "addInput:", v10);
    v9->_expectedVersion.patch = WORD2(v7);
    *(_DWORD *)&v9->_expectedVersion.major = v7;
    objc_msgSend(a3, "setSmartCameraVersion:", v7 & 0xFFFFFFFFFFFFLL);
    v9->_semanticStyleSceneDetectionEnabled = v6;
    if (v6)
    {
      BWSmartCameraSceneInitialize((uint64_t)&v9->_foodScene, 0.77 > 0.0, 2, 4, (uint64_t)"Food", 0.77, 0.05, 0.75);
      BWSmartCameraSceneInitialize((uint64_t)&v9->_indoorScene, 0.4 > 0.0, 2, 4, (uint64_t)"Indoor", 0.4, 0.05, 0.75);
      BWSmartCameraSceneInitialize((uint64_t)&v9->_outdoorScene, 0.58 > 0.0, 2, 4, (uint64_t)"Outdoor", 0.58, 0.05, 0.75);
      BWSmartCameraSceneInitialize((uint64_t)&v9->_sunsetScene, 0.88 > 0.0, 2, 4, (uint64_t)"Sunset", 0.88, 0.05, 0.75);
    }
    v9->_resultLock._os_unfair_lock_opaque = 0;
    v9->_device = (BWFigVideoCaptureDevice *)a3;
    v9->_deviceQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v9->_maxDebugOverlaySceneCount = 6;
  }
  return v9;
}

- (void)setSemanticStyleSceneObserver:(id)a3
{
  if (!self->_semanticStyleSceneDetectionEnabled)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not configured for semantic style scene detection"), self), 0));
  self->_semanticStyleSceneObserver = (BWSemanticStyleSceneObserver *)a3;
}

- (void)setMRCSceneObserver:(id)a3
{
  self->_mrcSceneObserver = (BWMRCSceneObserver *)a3;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSceneClassifierSinkNode;
  -[BWSinkNode dealloc](&v3, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("InferenceConsumer");
}

- (BWMRCSceneObserver)mrcSceneObserver
{
  return self->_mrcSceneObserver;
}

- (BWSemanticStyleSceneObserver)semanticStyleSceneObserver
{
  return self->_semanticStyleSceneObserver;
}

- (NSArray)sceneConfidences
{
  os_unfair_lock_s *p_resultLock;
  BWInferenceResult *v4;
  NSDictionary *v5;
  NSArray *v6;
  unint64_t maxDebugOverlaySceneCount;
  unint64_t v8;
  unint64_t v9;
  NSArray *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  float v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_resultLock = &self->_resultLock;
  os_unfair_lock_lock(&self->_resultLock);
  v4 = self->_mostRecentSmartCameraResult;
  os_unfair_lock_unlock(p_resultLock);
  if (!-[BWInferenceResult isValid](v4, "isValid"))
    return 0;
  v5 = -[BWInferenceResult inferences](v4, "inferences");
  v6 = -[NSDictionary keysSortedByValueUsingComparator:](v5, "keysSortedByValueUsingComparator:", &__block_literal_global_35);
  maxDebugOverlaySceneCount = self->_maxDebugOverlaySceneCount;
  v8 = -[NSArray count](v6, "count");
  if (v8 >= maxDebugOverlaySceneCount)
    v9 = maxDebugOverlaySceneCount;
  else
    v9 = v8;
  v10 = -[NSArray subarrayWithRange:](v6, "subarrayWithRange:", 0, v9);
  v11 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v16), "floatValue");
        -[NSArray addObject:](v11, "addObject:", objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: %.2f"), v16, v18));
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }
  return v11;
}

uint64_t __45__BWSceneClassifierSinkNode_sceneConfidences__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)confidenceStringForScene:(id)a3
{
  os_unfair_lock_s *p_resultLock;
  BWInferenceResult *v6;
  id v7;
  void *v8;
  uint64_t v9;

  p_resultLock = &self->_resultLock;
  os_unfair_lock_lock(&self->_resultLock);
  v6 = self->_mostRecentSmartCameraResult;
  os_unfair_lock_unlock(p_resultLock);
  if (!-[BWInferenceResult isValid](v6, "isValid"))
    return CFSTR("invalid");
  v7 = -[NSDictionary objectForKeyedSubscript:](-[BWInferenceResult inferences](v6, "inferences"), "objectForKeyedSubscript:", a3);
  if (!v7)
    return CFSTR("unknown");
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "doubleValue");
  return (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%.2f"), v9);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSObject *deviceQueue;
  objc_super v6;
  _QWORD block[5];

  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__BWSceneClassifierSinkNode_didReachEndOfDataForInput___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
  v6.receiver = self;
  v6.super_class = (Class)BWSceneClassifierSinkNode;
  -[BWSinkNode didReachEndOfDataForInput:](&v6, sel_didReachEndOfDataForInput_, a3);
}

void __55__BWSceneClassifierSinkNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = 0;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  BWInferenceResult *AttachedInferenceResult;
  BWInferenceResult *v6;
  BWInferenceResult *v7;
  NSObject *deviceQueue;
  NSDictionary *v9;
  NSDictionary *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  uint64_t v30;
  _QWORD v31[6];

  AttachedInferenceResult = (BWInferenceResult *)BWInferenceGetAttachedInferenceResult(a3, 101);
  if (AttachedInferenceResult)
  {
    v6 = AttachedInferenceResult;
    if (!-[NSString isEqualToString:](-[BWInferenceResult preventionReason](AttachedInferenceResult, "preventionReason"), "isEqualToString:", CFSTR("BlurryInputBuffer")))
    {
      if (-[NSString isEqualToString:](-[BWInferenceResult preventionReason](v6, "preventionReason"), "isEqualToString:", CFSTR("FilteredInputBuffer")))
      {
        v7 = [BWInferenceResult alloc];
        v6 = -[BWInferenceResult initWithResult:replacementInferences:replacementPreventionReason:](v7, "initWithResult:replacementInferences:replacementPreventionReason:", v6, MEMORY[0x1E0C9AA70], 0);
      }
      os_unfair_lock_lock(&self->_resultLock);

      self->_mostRecentSmartCameraResult = v6;
      os_unfair_lock_unlock(&self->_resultLock);
      if (-[BWInferenceResult isValid](v6, "isValid"))
      {
        deviceQueue = self->_deviceQueue;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __57__BWSceneClassifierSinkNode_renderSampleBuffer_forInput___block_invoke;
        v31[3] = &unk_1E491E748;
        v31[4] = self;
        v31[5] = v6;
        dispatch_async(deviceQueue, v31);
        v9 = -[BWInferenceResult inferences](v6, "inferences");
        v10 = v9;
        if (self->_mrcSceneObserver)
        {
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D07948]), "floatValue");
          v12 = v11;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D07908]), "floatValue");
          v14 = v13;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D07918]), "floatValue");
          v16 = v15;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D07960]), "floatValue");
          LODWORD(v18) = v17;
          LODWORD(v19) = v12;
          LODWORD(v20) = v14;
          LODWORD(v21) = v16;
          -[BWMRCSceneObserver sceneDidChangeQRConfidence:appClipCodeConfidence:documentConfidence:textConfidence:](self->_mrcSceneObserver, "sceneDidChangeQRConfidence:appClipCodeConfidence:documentConfidence:textConfidence:", v19, v20, v21, v18);
        }
        if (self->_semanticStyleSceneObserver)
        {
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D07920]), "floatValue");
          v23 = v22;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D07928]), "floatValue");
          v25 = v24;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D07940]), "floatValue");
          v27 = v26;
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D07958]), "floatValue");
          v29 = v28;
          BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_foodScene, v23);
          BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_indoorScene, v25);
          BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_outdoorScene, v27);
          BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_sunsetScene, v29);
          if (self->_foodScene.confident)
          {
            v30 = 1;
          }
          else if (self->_sunsetScene.confident)
          {
            v30 = 3;
          }
          else if (self->_indoorScene.confident)
          {
            v30 = 0;
          }
          else
          {
            v30 = 2 * self->_outdoorScene.confident;
          }
          if (self->_semanticStyleSceneType != (_DWORD)v30)
          {
            self->_semanticStyleSceneType = v30;
            -[BWSemanticStyleSceneObserver semanticStyleSceneTypeDidChange:](self->_semanticStyleSceneObserver, "semanticStyleSceneTypeDidChange:", v30);
            -[BWFigVideoCaptureDevice semanticStyleSceneTypeDidChange:](self->_device, "semanticStyleSceneTypeDidChange:", v30);
          }
        }
      }
    }
  }
}

uint64_t __57__BWSceneClassifierSinkNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "updateSmartCameraStreamPropertiesWithInferenceResult:", *(_QWORD *)(a1 + 40));
}

@end
