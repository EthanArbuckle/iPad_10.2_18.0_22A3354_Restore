@implementation BWDeferredCaptureController

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (BWDeferredCaptureController)initWithConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWDeferredCaptureController;
  return -[BWStillImageProcessorController initWithName:type:configuration:](&v4, sel_initWithName_type_configuration_, CFSTR("DeferredCapture"), 14, a3);
}

- (void)input:(id)a3 encounteredProcessingError:(int)a4
{
  -[BWStillImageProcessorControllerRequest setErr:](-[BWStillImageProcessorController currentRequest](self, "currentRequest", a3), "setErr:", *(_QWORD *)&a4);
  -[BWDeferredCaptureController cancelProcessing](self, "cancelProcessing");
}

- (void)cancelProcessing
{
  BWStillImageProcessorControllerRequest *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  v4 = -[BWStillImageProcessorControllerRequest err](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "err");
  v5 = -[FigCaptureStillImageSettings captureRequestIdentifier](-[BWStillImageProcessorControllerInput settings](-[BWStillImageProcessorControllerRequest input](v3, "input"), "settings"), "captureRequestIdentifier");
  if (v5)
  {
    v6 = v5;
    if (-[BWDeferredCaptureContainerManager lookupCaptureContainer:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "lookupCaptureContainer:", v5))
    {
      -[BWDeferredCaptureContainerManager abortContainer:error:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "abortContainer:error:", v6, v4);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)BWDeferredCaptureController;
  -[BWStillImageProcessorController cancelProcessing](&v7, sel_cancelProcessing);
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  BWDeferredCaptureControllerRequest *v6;
  int v7;

  v6 = -[BWStillImageProcessorControllerRequest initWithInput:delegate:]([BWDeferredCaptureControllerRequest alloc], "initWithInput:delegate:", a3, a4);
  if (v6)
    v7 = 0;
  else
    v7 = -12786;
  if (a5)
    *a5 = v7;
  return v6;
}

- (int)prepare
{
  return 0;
}

- (int)process
{
  BWStillImageProcessorControllerInput *v3;

  v3 = -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input");
  -[BWDeferredCaptureController _addInferences](self, "_addInferences");
  return -[BWDeferredCaptureContainerManager commitContainer:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "commitContainer:", -[FigCaptureStillImageSettings captureRequestIdentifier](-[BWStillImageProcessorControllerInput settings](v3, "settings"), "captureRequestIdentifier"));
}

- (void)_addInferences
{
  BWStillImageProcessorControllerInput *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[5];
  _BYTE v31[128];
  _QWORD v32[7];

  v32[5] = *MEMORY[0x1E0C80C00];
  v3 = -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input");
  if ((-[BWStillImageProcessorControllerInput skipInferences](v3, "skipInferences") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)-[BWStillImageProcessorControllerDelegate processorController:newInferencesForProcessorInput:](-[BWStillImageProcessorControllerRequest delegate](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "delegate"), "processorController:newInferencesForProcessorInput:", self, v3);
    if (v4)
    {
      v5 = -[BWStillImageProcessorControllerInput portType](v3, "portType");
      v32[0] = CFSTR("PersonSemanticsSkin");
      v32[1] = CFSTR("PersonSemanticsHair");
      v32[2] = 0x1E495B0B8;
      v32[3] = 0x1E49511B8;
      v32[4] = 0x1E495AF38;
      v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5), "arrayByAddingObjectsFromArray:", BWInferenceLowResPersonInstanceMaskKeys());
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v26 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            v12 = objc_msgSend(v4, "inferenceBufferForAttachedMediaKey:", v11);
            if (v12)
              -[BWStillImageProcessorControllerInput _addInferenceBuffer:metadata:inferenceAttachedMediaKey:portType:](v3, "_addInferenceBuffer:metadata:inferenceAttachedMediaKey:portType:", v12, objc_msgSend(v4, "metadataForAttachedMediaKey:", v11), v11, v5);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v8);
      }
      v30[0] = 0x1E4951338;
      v30[1] = 0x1E4951358;
      v30[2] = 0x1E4951158;
      v30[3] = 0x1E4951058;
      v30[4] = 0x1E4951178;
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v22 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
            v19 = objc_msgSend(v4, "inferenceForAttachmentKey:", v18);
            if (v19)
              -[BWStillImageProcessorControllerInput _addInference:inferenceAttachmentKey:portType:](v3, "_addInference:inferenceAttachmentKey:portType:", v19, v18, v5);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v15);
      }
      if (objc_msgSend(v4, "inferenceAttachedMediaMetadata"))
      {
        v20 = objc_msgSend(v4, "inferenceAttachedMediaMetadata");
        -[BWStillImageProcessorControllerInput _addDictionary:tag:](v3, "_addDictionary:tag:", v20, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InferenceAttachedMediaMeta-%@"), v5));
      }
    }
  }

}

@end
