@implementation BWInferenceEngineControllerInput

- (BWInferenceEngineControllerInput)initWithSettings:(id)a3 portType:(id)a4 inferenceInputBufferType:(unint64_t)a5
{
  BWInferenceEngineControllerInput *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWInferenceEngineControllerInput;
  result = -[BWStillImageProcessorControllerInput initWithSettings:portType:](&v7, sel_initWithSettings_portType_, a3, a4);
  if (result)
  {
    result->_expectsMoreData = 1;
    result->_inferenceInputBufferType = a5;
  }
  return result;
}

- (BWInferenceEngineControllerInput)initWithSettings:(id)a3 portType:(id)a4
{
  return -[BWInferenceEngineControllerInput initWithSettings:portType:inferenceInputBufferType:](self, "initWithSettings:portType:inferenceInputBufferType:", a3, a4, 15);
}

- (void)dealloc
{
  opaqueCMSampleBuffer *inferenceImage;
  opaqueCMSampleBuffer *propagationImage;
  objc_super v5;

  inferenceImage = self->_inferenceImage;
  if (inferenceImage)
    CFRelease(inferenceImage);
  propagationImage = self->_propagationImage;
  if (propagationImage)
    CFRelease(propagationImage);

  v5.receiver = self;
  v5.super_class = (Class)BWInferenceEngineControllerInput;
  -[BWStillImageProcessorControllerInput dealloc](&v5, sel_dealloc);
}

- (void)addInferenceImage:(opaqueCMSampleBuffer *)a3
{
  -[BWInferenceEngineControllerInput addInferenceImage:propagationImage:](self, "addInferenceImage:propagationImage:", a3, a3);
}

- (void)addInferenceImage:(opaqueCMSampleBuffer *)a3 propagationImage:(opaqueCMSampleBuffer *)a4
{
  opaqueCMSampleBuffer *inferenceImage;
  opaqueCMSampleBuffer *propagationImage;

  if (a3 && a4)
  {
    inferenceImage = self->_inferenceImage;
    if (inferenceImage != a3)
    {
      self->_inferenceImage = a3;
      CFRetain(a3);
      if (inferenceImage)
        CFRelease(inferenceImage);
    }
    propagationImage = self->_propagationImage;
    if (propagationImage != a4)
    {
      self->_propagationImage = a4;
      CFRetain(a4);
      if (propagationImage)
        CFRelease(propagationImage);
    }
  }
  self->_expectsMoreData = 0;
  -[BWStillImageProcessorControllerInputUpdatesDelegate inputReceivedNewData:](-[BWStillImageProcessorControllerInput delegate](self, "delegate"), "inputReceivedNewData:", self);
}

- (id)description
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  NSString *v6;
  opaqueCMSampleBuffer *inferenceImage;
  opaqueCMSampleBuffer *propagationImage;
  NSString *v9;
  void *v11;

  v11 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  v4 = -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "settingsID");
  v5 = BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType"));
  v6 = -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType");
  inferenceImage = self->_inferenceImage;
  propagationImage = self->_propagationImage;
  v9 = -[NSArray componentsJoinedByString:](self->_enabledInferenceMasks, "componentsJoinedByString:", CFSTR(", "));
  return (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@, %@ : infImg:%p propImg:%p masks:%@ smartCam:%d vision:%@ delegate:%p"), v3, self, v4, v5, v6, inferenceImage, propagationImage, v9, self->_smartCameraClassificationsEnabled, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), self->_enabledVisionInferences), -[BWStillImageProcessorControllerInput delegate](self, "delegate"));
}

- (unint64_t)inferenceInputBufferType
{
  return self->_inferenceInputBufferType;
}

- (opaqueCMSampleBuffer)inferenceImage
{
  return self->_inferenceImage;
}

- (opaqueCMSampleBuffer)propagationImage
{
  return self->_propagationImage;
}

- (NSArray)enabledInferenceMasks
{
  return self->_enabledInferenceMasks;
}

- (void)setEnabledInferenceMasks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)smartCameraClassificationsEnabled
{
  return self->_smartCameraClassificationsEnabled;
}

- (void)setSmartCameraClassificationsEnabled:(BOOL)a3
{
  self->_smartCameraClassificationsEnabled = a3;
}

- (unint64_t)enabledVisionInferences
{
  return self->_enabledVisionInferences;
}

- (void)setEnabledVisionInferences:(unint64_t)a3
{
  self->_enabledVisionInferences = a3;
}

- (BOOL)expectsMoreData
{
  return self->_expectsMoreData;
}

@end
