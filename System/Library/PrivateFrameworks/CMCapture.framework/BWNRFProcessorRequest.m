@implementation BWNRFProcessorRequest

- (_QWORD)initWithInput:(void *)a3 output:(void *)a4 rawNightModeOutputFrame:(void *)a5 deepFusionOutput:(char)a6 processErrorRecoveryFrame:(char)a7 processOriginalImage:(char)a8 processToneMapping:(char)a9 processInferenceInputImage:(int)a10 clientBracketSequenceNumber:(char)a11 processSemanticRendering:(char)a12 provideInferenceInputImageForProcessing:(char)a13 inferencesAvailable:(char)a14 processSmartStyleRenderingInput:(void *)a15 delegate:
{
  _QWORD *v22;
  objc_super v24;

  if (!a1)
    return 0;
  v24.receiver = a1;
  v24.super_class = (Class)BWNRFProcessorRequest;
  v22 = objc_msgSendSuper2(&v24, sel_init);
  if (v22)
  {
    v22[1] = a2;
    v22[2] = a3;
    v22[3] = a4;
    v22[4] = a5;
    *((_BYTE *)v22 + 40) = a6;
    *((_BYTE *)v22 + 41) = a7;
    *((_BYTE *)v22 + 42) = a8;
    *((_BYTE *)v22 + 43) = a9;
    *((_DWORD *)v22 + 11) = a10;
    *((_BYTE *)v22 + 48) = a11;
    *((_BYTE *)v22 + 49) = a12;
    *((_BYTE *)v22 + 50) = a13;
    v22[7] = a15;
    *((_BYTE *)v22 + 64) = a14;
    *(_QWORD *)((char *)v22 + 84) = 0x8000007F7FFFFFLL;
  }
  return v22;
}

- (void)dealloc
{
  unint64_t v3;
  const __CFString *v4;
  BWNRFProcessorInput *input;
  NSMutableArray *v6;
  unint64_t v7;
  BWNRFProcessorInput *v8;
  __CVBuffer *ImageBuffer;
  void *v10;
  objc_super v11;

  v3 = 0;
  v4 = (const __CFString *)*MEMORY[0x1E0D05A10];
  while (1)
  {
    input = self->_input;
    v6 = input ? input->_frames : 0;
    v7 = -[NSMutableArray count](v6, "count");
    v8 = self->_input;
    if (v7 <= v3)
      break;
    if (v8)
      v8 = (BWNRFProcessorInput *)v8->_frames;
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)-[BWNRFProcessorInput objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v3));
    v10 = (void *)CVBufferCopyAttachment(ImageBuffer, v4, 0);
    objc_msgSend(v10, "releaseAll");

    CVBufferRemoveAttachment(ImageBuffer, v4);
    ++v3;
  }
  -[BWNRFProcessorInput setDelegate:](v8, "setDelegate:", 0);

  v11.receiver = self;
  v11.super_class = (Class)BWNRFProcessorRequest;
  -[BWNRFProcessorRequest dealloc](&v11, sel_dealloc);
}

- (BOOL)processSemanticRendering
{
  return self->_processSemanticRendering;
}

- (BOOL)provideInferenceInputImageForProcessing
{
  return self->_provideInferenceInputImageForProcessing;
}

- (BOOL)inferencesAvailable
{
  return self->_inferencesAvailable;
}

- (const)clientBracketFrame
{
  uint64_t v2;
  void *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  const void *v10;

  if (a1 && *(int *)(a1 + 44) >= 1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
      v3 = *(void **)(v2 + 56);
    else
      v3 = 0;
    v4 = objc_msgSend(v3, "count");
    v5 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v6 = *MEMORY[0x1E0D06910];
    v7 = v4;
    while (v7 >= 1)
    {
      v8 = *(_QWORD *)(a1 + 8);
      if (v8)
        v9 = *(void **)(v8 + 56);
      else
        v9 = 0;
      v10 = (const void *)objc_msgSend(v9, "objectAtIndexedSubscript:", --v7);
      if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v10, v5, 0), "objectForKeyedSubscript:", v6), "intValue") == *(_DWORD *)(a1 + 44))return v10;
    }
  }
  return 0;
}

- (uint64_t)imageType
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "captureStreamSettings"), "captureType");
    v3 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "captureSettings"), "captureFlags");
    if (*(_BYTE *)(v1 + 41))
    {
      return 4;
    }
    else
    {
      v4 = v3;
      result = 1;
      if (v2 > 10)
      {
        if (v2 == 11)
        {
          v5 = 5;
          if (*(_BYTE *)(v1 + 40))
            v5 = 6;
          v6 = 35;
          if (!*(_BYTE *)(v1 + 40))
            v6 = 33;
          if ((v4 & 0x800000000) != 0)
            return v6;
          else
            return v5;
        }
        else if (v2 == 12)
        {
          if (*(_BYTE *)(v1 + 40))
          {
            return 14;
          }
          else if ((v4 & 0x4000000000) != 0 && -[BWNRFProcessorRequest processingType](v1) == 7)
          {
            return 38;
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
      }
      else if (v2 == 1)
      {
        if ((v4 & 0x80) != 0)
        {
          if (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "captureSettings"), "deliverDeferredPhotoProxyImage"))return 29;
          else
            return 1;
        }
        else
        {
          return 1;
        }
      }
      else if (v2 == 10)
      {
        if (*(_BYTE *)(v1 + 40))
          return 3;
        else
          return 2;
      }
    }
  }
  return result;
}

- (uint64_t)processingType
{
  uint64_t v1;
  int v2;
  BOOL v3;
  unsigned int v4;
  unsigned int v5;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "captureStreamSettings"), "captureType");
    if (*(_BYTE *)(v1 + 40) || *(_BYTE *)(v1 + 41))
      return 0;
    switch(v2)
    {
      case 10:
        return 1;
      case 12:
        v3 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "captureSettings"), "learnedNRStereoPhotoFrameFlag") == 0;
        v4 = 7;
        v5 = 3;
        break;
      case 11:
        v3 = (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "captureStreamSettings"), "captureFlags") & 0x800000000) == 0;
        v4 = 4;
        v5 = 2;
        break;
      default:
        if (!*(_BYTE *)(v1 + 43)
          && v2 == 2
          && (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "captureSettings"), "captureFlags") & 8) != 0)
        {
          return 6;
        }
        return 0;
    }
    if (v3)
      return v5;
    else
      return v4;
  }
  return result;
}

- (uint64_t)fusionErrorRecoveryImageType
{
  uint64_t v1;

  if (result)
  {
    v1 = (int)-[BWNRFProcessorRequest processingType](result) - 1;
    if (v1 > 3)
      return 0;
    else
      return qword_1A32B0F48[v1];
  }
  return result;
}

- (uint64_t)inferenceInputType
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if ((objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "captureSettings"), "captureFlags") & 0x4000000000) != 0
      && (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "portType"), "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "captureSettings"), "masterPortType")) & 1) == 0&& -[BWNRFProcessorRequest processingType](v1) == 7)
    {
      return 39;
    }
    else
    {
      return 15;
    }
  }
  return result;
}

- (uint64_t)receivedAllFrames
{
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 40))
    {
      v2 = (const void *)objc_msgSend(*(id *)(result + 8), "errorRecoveryFrame");
      return v2 != 0;
    }
    if (*(_BYTE *)(result + 41))
    {
      v2 = (const void *)objc_msgSend(*(id *)(result + 8), "originalImage");
      return v2 != 0;
    }
    if (*(_BYTE *)(result + 43)
      || *(_BYTE *)(result + 42)
      || -[BWNRFProcessorRequest processingType](result) == 7)
    {
      v3 = *(_QWORD *)(v1 + 8);
      if (v3)
        v4 = *(void **)(v3 + 56);
      else
        v4 = 0;
      v2 = (const void *)objc_msgSend(v4, "count");
      return v2 != 0;
    }
    if (*(int *)(v1 + 44) >= 1)
    {
      v2 = -[BWNRFProcessorRequest clientBracketFrame](v1);
      return v2 != 0;
    }
    v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "captureStreamSettings"), "adaptiveUnifiedBracketedCaptureParams"), "count");
    v6 = *(_QWORD **)(v1 + 8);
    if (v5)
    {
      return objc_msgSend(v6, "receivedAllFrames");
    }
    else
    {
      if (v6)
        v6 = (_QWORD *)v6[7];
      v7 = objc_msgSend(v6, "count");
      if (-[BWNRFProcessorRequest processingType](v1))
        v8 = (int)objc_msgSend(*(id *)(v1 + 8), "expectedFrameCount");
      else
        v8 = 1;
      return v7 == v8;
    }
  }
  return result;
}

- (uint64_t)useFrameForMultiFrameProcessing:(uint64_t)result
{
  if (result)
  {
    switch(-[BWNRFProcessorRequest processingType](result))
    {
      case 1u:
      case 3u:
        result = ((unint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(a2) & 0x30) != 32;
        break;
      case 2u:
      case 4u:
        result = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue") ^ 1;
        break;
      default:
        result = 0;
        break;
    }
  }
  return result;
}

- (id)description
{
  uint64_t v3;
  int64_t v5;
  uint64_t v6;
  void *v7;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  v5 = -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self->_input, "captureSettings"), "settingsID");
  v3 = BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "captureType"));
  return (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@, %@, errorRecovery=%d original=%d tonemap=%d inferenceInput=%d semanticRendering=%d inferenceInputForProcessing=%d inferences=%d input:<%@ %p>"), v6, self, v5, v3, -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "portType"), self->_processErrorRecoveryFrame, self->_processOriginalImage, self->_processToneMapping, self->_processInferenceInputImage, self->_processSemanticRendering, self->_provideInferenceInputImageForProcessing, self->_inferencesAvailable, objc_opt_class(), self->_input);
}

- (BWNRFProcessorInput)input
{
  return self->_input;
}

- (NRFUBFusionOutput)output
{
  return self->_output;
}

- (NRFRawNightModeOutputFrame)rawNightModeOutputFrame
{
  return self->_rawNightModeOutputFrame;
}

- (NRFDeepFusionOutput)deepFusionOutput
{
  return self->_deepFusionOutput;
}

- (int)err
{
  return self->_err;
}

- (void)setErr:(int)a3
{
  self->_err = a3;
}

- (int)demosaicedRawErr
{
  return self->_demosaicedRawErr;
}

- (void)setDemosaicedRawErr:(int)a3
{
  self->_demosaicedRawErr = a3;
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

- (BOOL)deliveredAdaptiveBracketingErrorRecoveryFrame
{
  return self->_deliveredAdaptiveBracketingErrorRecoveryFrame;
}

- (void)setDeliveredAdaptiveBracketingErrorRecoveryFrame:(BOOL)a3
{
  self->_deliveredAdaptiveBracketingErrorRecoveryFrame = a3;
}

- (BOOL)gainMapEnabled
{
  return self->_gainMapEnabled;
}

- (void)setGainMapEnabled:(BOOL)a3
{
  self->_gainMapEnabled = a3;
}

- (BOOL)processSmartStyleRenderingInput
{
  return self->_processSmartStyleRenderingInput;
}

@end
