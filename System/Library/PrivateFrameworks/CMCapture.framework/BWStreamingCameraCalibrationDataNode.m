@implementation BWStreamingCameraCalibrationDataNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStreamingCameraCalibrationDataNode)initWithCameraInfoByPortType:(id)a3
{
  BWStreamingCameraCalibrationDataNode *v4;
  BWNodeInput *v5;
  BWNodeOutput *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWStreamingCameraCalibrationDataNode;
  v4 = -[BWNode init](&v8, sel_init);
  if (v4)
  {
    v4->_cameraInfoByPortType = (NSDictionary *)a3;
    v5 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v4);
    -[BWNodeInput setFormatRequirements:](v5, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNode addInput:](v4, "addInput:", v5);
    v6 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1667326820, v4);
    -[BWNodeOutput setFormat:](v6, "setFormat:", +[BWCameraCalibrationDataFormat format](BWCameraCalibrationDataFormat, "format"));
    -[BWNode addOutput:](v4, "addOutput:", v6);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStreamingCameraCalibrationDataNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("StreamingCameraCalibrationDataNode");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;
  CFTypeRef v7;
  void *v8;
  const __CFDictionary *v9;
  NSDictionary *cameraInfoByPortType;
  int horizontalSensorBinningFactor;
  int verticalSensorBinningFactor;
  int rotationDegrees;
  unsigned __int8 mirroringEnabled;
  id v15;
  const void *v16;
  OSStatus v17;
  CMSampleBufferRef v18;
  CMSampleTimingInfo sampleTimingArray;
  CMTime v20;
  CMTime v21;
  CMSampleBufferRef v22;

  v22 = 0;
  v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  memset(&v21, 0, sizeof(v21));
  CMSampleBufferGetPresentationTimeStamp(&v21, a3);
  v7 = CMGetAttachment(a3, CFSTR("OriginalCameraIntrinsicMatrix"), 0);
  if (v7
    && (v8 = (void *)v7,
        (v9 = (const __CFDictionary *)CMGetAttachment(a3, CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), 0)) != 0))
  {
    cameraInfoByPortType = self->_cameraInfoByPortType;
    horizontalSensorBinningFactor = self->_horizontalSensorBinningFactor;
    verticalSensorBinningFactor = self->_verticalSensorBinningFactor;
    rotationDegrees = self->_rotationDegrees;
    mirroringEnabled = self->_mirroringEnabled;
    v20 = v21;
    v15 = (id)FigCaptureCreateCalibrationDataDictionaryFromSampleBufferMetadata(v6, (uint64_t)&v20, cameraInfoByPortType, horizontalSensorBinningFactor, verticalSensorBinningFactor, v8, v9, rotationDegrees, mirroringEnabled, 1);
    if (v15)
    {
      v16 = v15;
      memset(&sampleTimingArray.presentationTimeStamp, 0, 48);
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E18];
      sampleTimingArray.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, a3);
      sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
      v17 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v22);
      v18 = v22;
      if (v22 && !v17)
      {
        CMSetAttachment(v22, CFSTR("CameraCalibrationDataMetadata"), v16, 1u);
        -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v22);
        v18 = v22;
      }
      if (v18)
        CFRelease(v18);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (int)rotationDegrees
{
  return self->_rotationDegrees;
}

- (void)setRotationDegrees:(int)a3
{
  self->_rotationDegrees = a3;
}

- (BOOL)mirroringEnabled
{
  return self->_mirroringEnabled;
}

- (void)setMirroringEnabled:(BOOL)a3
{
  self->_mirroringEnabled = a3;
}

- (int)horizontalSensorBinningFactor
{
  return self->_horizontalSensorBinningFactor;
}

- (void)setHorizontalSensorBinningFactor:(int)a3
{
  self->_horizontalSensorBinningFactor = a3;
}

- (int)verticalSensorBinningFactor
{
  return self->_verticalSensorBinningFactor;
}

- (void)setVerticalSensorBinningFactor:(int)a3
{
  self->_verticalSensorBinningFactor = a3;
}

@end
