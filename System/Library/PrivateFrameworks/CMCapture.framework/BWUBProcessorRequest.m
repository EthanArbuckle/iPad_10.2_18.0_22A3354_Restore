@implementation BWUBProcessorRequest

- (_QWORD)initWithInput:(void *)a3 output:(void *)a4 deepFusionOutput:(char)a5 processErrorRecoveryFrame:(char)a6 processOriginalImage:(char)a7 processSemanticRendering:(char)a8 provideInferenceInputImageForProcessing:(char)a9 inferencesAvailable:(void *)a10 delegate:
{
  _QWORD *v17;
  objc_super v19;

  if (!a1)
    return 0;
  v19.receiver = a1;
  v19.super_class = (Class)BWUBProcessorRequest;
  v17 = objc_msgSendSuper2(&v19, sel_init);
  if (v17)
  {
    v17[1] = a2;
    v17[2] = a3;
    v17[3] = a4;
    *((_BYTE *)v17 + 32) = a5;
    *((_BYTE *)v17 + 33) = a6;
    *((_BYTE *)v17 + 34) = a7;
    *((_BYTE *)v17 + 35) = a8;
    *((_BYTE *)v17 + 36) = a9;
    v17[5] = a10;
    *(_QWORD *)((char *)v17 + 60) = 0x8000007F7FFFFFLL;
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[BWUBProcessorInput setDelegate:](self->_input, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)BWUBProcessorRequest;
  -[BWUBProcessorRequest dealloc](&v3, sel_dealloc);
}

- (BWUBProcessorInput)input
{
  return self->_input;
}

- (UBFusionOutput)output
{
  return self->_output;
}

- (UBDeepFusionOutput)deepFusionOutput
{
  return self->_deepFusionOutput;
}

- (BOOL)provideInferenceInputImageForProcessing
{
  return self->_provideInferenceInputImageForProcessing;
}

- (BOOL)inferencesAvailable
{
  return self->_inferencesAvailable;
}

- (uint64_t)imageType
{
  uint64_t v1;
  int v2;
  BOOL v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "captureStreamSettings"), "captureType");
    if (*(_BYTE *)(v1 + 33))
      return 4;
    if (v2 == 12)
    {
      if (*(_BYTE *)(v1 + 32))
      {
        return 14;
      }
      else if (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "captureSettings"), "deliverDeferredPhotoProxyImage"))
      {
        return 7;
      }
      else
      {
        return 13;
      }
    }
    else
    {
      if (v2 == 11)
      {
        v3 = *(_BYTE *)(v1 + 32) == 0;
        v4 = 5;
      }
      else
      {
        if (v2 != 10)
          return 1;
        v3 = *(_BYTE *)(v1 + 32) == 0;
        v4 = 2;
      }
      if (v3)
        return v4;
      else
        return v4 + 1;
    }
  }
  return result;
}

- (uint64_t)processingType
{
  uint64_t v1;
  int v2;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "captureStreamSettings"), "captureType");
    if (*(_BYTE *)(v1 + 32) || *(_BYTE *)(v1 + 33))
    {
      return 0;
    }
    else if ((v2 - 10) >= 3)
    {
      return 0;
    }
    else
    {
      return (v2 - 9);
    }
  }
  return result;
}

- (uint64_t)expectedFrameCount
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (-[BWUBProcessorRequest processingType](result))
      return objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "captureStreamSettings"), "expectedFrameCount");
    else
      return 1;
  }
  return result;
}

- (uint64_t)receivedAllFrames
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 32))
    {
      v2 = objc_msgSend(*(id *)(result + 8), "errorRecoveryFrame");
      return v2 != 0;
    }
    v3 = *(void **)(result + 8);
    if (*(_BYTE *)(v1 + 33))
    {
      v2 = objc_msgSend(v3, "originalImage");
      return v2 != 0;
    }
    v4 = objc_msgSend((id)objc_msgSend(v3, "captureStreamSettings"), "adaptiveBracketingParameters");
    v5 = *(_QWORD **)(v1 + 8);
    if (v4)
    {
      return objc_msgSend(v5, "receivedAllFrames");
    }
    else
    {
      if (v5)
        v5 = (_QWORD *)v5[7];
      v6 = objc_msgSend(v5, "count");
      if (-[BWUBProcessorRequest processingType](v1))
        v7 = (int)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "captureStreamSettings"), "expectedFrameCount");
      else
        v7 = 1;
      return v6 == v7;
    }
  }
  return result;
}

- (uint64_t)useFrameForMultiFrameProcessing:(uint64_t)result
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;

  if (result)
  {
    v3 = result;
    v4 = -[BWUBProcessorRequest processingType](result);
    switch(v4)
    {
      case 3:
        goto LABEL_5;
      case 2:
        return objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue") ^ 1;
      case 1:
LABEL_5:
        v5 = *(_QWORD *)(v3 + 8);
        if (v5)
          v6 = *(void **)(v5 + 56);
        else
          v6 = 0;
        v7 = objc_msgSend(v6, "count");
        v8 = v7 - 1;
        do
        {
          v9 = __OFSUB__(v7--, 1);
          if (v7 < 0 != v9)
            return 1;
          v10 = *(_QWORD *)(v3 + 8);
          if (v10)
            v11 = *(void **)(v10 + 56);
          else
            v11 = 0;
          v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", v8--);
        }
        while ((const void *)v12 != a2);
        v13 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 8), "captureStreamSettings"), "referenceFrameIndex");
        v14 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 8), "captureStreamSettings"), "isUnifiedBracketingErrorRecoveryFrame:isReferenceFrame:", a2, v13 == v7);
        if (v13 == v7)
          return 1;
        else
          return v14 ^ 1u;
      default:
        return 0;
    }
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@, %@, errorRecovery=%d, original=%d semanticRendering=%d inferenceInput=%d inferences=%d"), v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self->_input, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "portType"), self->_processErrorRecoveryFrame, self->_processOriginalImage, self->_processSemanticRendering, self->_provideInferenceInputImageForProcessing,
               self->_inferencesAvailable);
}

- (int)err
{
  return self->_err;
}

- (void)setErr:(int)a3
{
  self->_err = a3;
}

- (int)numberOfFramesAddedForMultiFrameProcessing
{
  return self->_numberOfFramesAddedForMultiFrameProcessing;
}

- (void)setNumberOfFramesAddedForMultiFrameProcessing:(int)a3
{
  self->_numberOfFramesAddedForMultiFrameProcessing = a3;
}

- (float)totalExposureTimesOfFramesAddedForMultiFrameProcessing
{
  return self->_totalExposureTimesOfFramesAddedForMultiFrameProcessing;
}

- (void)setTotalExposureTimesOfFramesAddedForMultiFrameProcessing:(float)a3
{
  self->_totalExposureTimesOfFramesAddedForMultiFrameProcessing = a3;
}

- (float)minExposureTimesOfFramesAddedForMultiFrameProcessing
{
  return self->_minExposureTimesOfFramesAddedForMultiFrameProcessing;
}

- (void)setMinExposureTimesOfFramesAddedForMultiFrameProcessing:(float)a3
{
  self->_minExposureTimesOfFramesAddedForMultiFrameProcessing = a3;
}

- (float)maxExposureTimesOfFramesAddedForMultiFrameProcessing
{
  return self->_maxExposureTimesOfFramesAddedForMultiFrameProcessing;
}

- (void)setMaxExposureTimesOfFramesAddedForMultiFrameProcessing:(float)a3
{
  self->_maxExposureTimesOfFramesAddedForMultiFrameProcessing = a3;
}

- (BOOL)deliveredDeferredProxyImage
{
  return self->_deliveredDeferredProxyImage;
}

- (void)setDeliveredDeferredProxyImage:(BOOL)a3
{
  self->_deliveredDeferredProxyImage = a3;
}

@end
