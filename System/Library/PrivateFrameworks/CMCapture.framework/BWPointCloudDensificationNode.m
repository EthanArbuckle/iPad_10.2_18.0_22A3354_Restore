@implementation BWPointCloudDensificationNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWPointCloudDensificationNode)initWithConfiguration:(id)a3
{
  BWPointCloudDensificationNode *v4;
  BWNodeInput *v5;
  BWNodeOutput *v6;
  BWNodeOutputMediaConfiguration *v7;
  BWVideoFormatRequirements *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)BWPointCloudDensificationNode;
  v4 = -[BWNode init](&v10, sel_init);
  if (v4)
  {
    v4->_configuration = (BWPointCloudDensificationNodeConfiguration *)a3;
    v5 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v4);
    -[BWNodeInput setFormatRequirements:](v5, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v5, "setPassthroughMode:", 1);
    -[BWPointCloudDensificationNode _setupPointCloudMediaConfigurationForInput:inputAttachedMediaKey:](v4, "_setupPointCloudMediaConfigurationForInput:inputAttachedMediaKey:", v5, 0x1E494FB58);
    if (-[BWPointCloudDensificationNodeConfiguration timeOfFlightCameraType](v4->_configuration, "timeOfFlightCameraType") == 2)-[BWPointCloudDensificationNode _setupPointCloudMediaConfigurationForInput:inputAttachedMediaKey:](v4, "_setupPointCloudMediaConfigurationForInput:inputAttachedMediaKey:", v5, 0x1E495B138);
    -[BWNode addInput:](v4, "addInput:", v5);
    v6 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v4);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v6, "primaryMediaConfiguration"), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutput setPassthroughMode:](v6, "setPassthroughMode:", 1);
    -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v6, "setIndexOfInputWhichDrivesThisOutput:", 0);
    v7 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v8 = objc_alloc_init(BWVideoFormatRequirements);
    v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWPointCloudDensificationNodeConfiguration depthPixelFormat](v4->_configuration, "depthPixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v8, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1));
    -[BWVideoFormatRequirements setWidth:](v8, "setWidth:", (int)-[BWPointCloudDensificationNodeConfiguration depthOutputDimensions](v4->_configuration, "depthOutputDimensions"));
    -[BWVideoFormatRequirements setHeight:](v8, "setHeight:", -[BWPointCloudDensificationNodeConfiguration depthOutputDimensions](v4->_configuration, "depthOutputDimensions") >> 32);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v7, "setFormatRequirements:", v8);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v7, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v7, "setProvidesPixelBufferPool:", 1);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v6, "setMediaConfiguration:forAttachedMediaKey:", v7, CFSTR("Depth"));
    -[BWNode addOutput:](v4, "addOutput:", v6);
    v4->_executor = (ADJasperColorV2Executor *)objc_msgSend(objc_alloc((Class)getADJasperColorV2ExecutorClass()), "initWithInputPrioritization:engineType:", 2, 4);
    objc_msgSend((id)objc_msgSend((id)-[ADJasperColorV2Executor executorParameters](v4->_executor, "executorParameters"), "pipelineParameters"), "setOutputHighConfidencePixelsOnly:", -[BWPointCloudDensificationNodeConfiguration filteringEnabled](v4->_configuration, "filteringEnabled") ^ 1);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPointCloudDensificationNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_setupPointCloudMediaConfigurationForInput:(id)a3 inputAttachedMediaKey:(id)a4
{
  BWNodeInputMediaConfiguration *v6;

  v6 = objc_alloc_init(BWNodeInputMediaConfiguration);
  -[BWNodeInputMediaConfiguration setFormatRequirements:](v6, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
  -[BWNodeInputMediaConfiguration setPassthroughMode:](v6, "setPassthroughMode:", 0);
  objc_msgSend(a3, "setMediaConfiguration:forAttachedMediaKey:", v6, a4);
}

- (id)_newPointCloudFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  opaqueCMSampleBuffer *AttachedMedia;
  CFTypeRef CVDataBuffer;
  void *v7;
  opaqueCMSampleBuffer *v8;
  CFTypeRef v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E494FB58);
  if (!AttachedMedia)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v7 = 0;
LABEL_10:

    return 0;
  }
  CVDataBuffer = BWSampleBufferGetCVDataBuffer(AttachedMedia);
  v7 = (void *)objc_msgSend(objc_alloc((Class)getADJasperPointCloudClass()), "initWithDataBuffer:", CVDataBuffer);
  if (!v7)
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_10;
  }
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E494FB58);
  if (-[BWPointCloudDensificationNodeConfiguration timeOfFlightCameraType](self->_configuration, "timeOfFlightCameraType") == 2)
  {
    v8 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B138);
    if (v8)
    {
      v9 = BWSampleBufferGetCVDataBuffer(v8);
      v10 = (void *)objc_msgSend(objc_alloc((Class)getADJasperPointCloudClass()), "initWithDataBuffer:", v9);
      BWSampleBufferRemoveAttachedMedia(a3, 0x1E495B138);
      if (v10)
      {
        v13[0] = v7;
        v13[1] = v10;
        v11 = (void *)objc_msgSend(objc_alloc((Class)getADJasperPointCloudClass()), "initByMergingPointClouds:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2));

        return v11;
      }
    }
    goto LABEL_9;
  }
  return v7;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  id v6;
  CVImageBufferRef ImageBuffer;
  const __CFAllocator *v8;
  OSStatus v9;
  CMSampleTimingInfo sampleTiming;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __CVBuffer *v16;
  CMSampleBufferRef sampleBufferOut;
  CFTypeRef v18;
  void *v19;

  v18 = 0;
  v19 = 0;
  v16 = 0;
  sampleBufferOut = 0;
  if (FigCaptureCreateColorCameraCalibrationForColorSampleBuffer(a3, -[BWPointCloudDensificationNodeConfiguration rgbSensorConfiguration](self->_configuration, "rgbSensorConfiguration", a3, a4), -[BWPointCloudDensificationNodeConfiguration rgbCameraHorizontalSensorBinningFactor](self->_configuration, "rgbCameraHorizontalSensorBinningFactor"), -[BWPointCloudDensificationNodeConfiguration rgbCameraVerticalSensorBinningFactor](self->_configuration, "rgbCameraVerticalSensorBinningFactor"), &v19)|| (v14 = 0u, v15 = 0u, v12 = 0u, v13 = 0u, FigCaptureCreateJasperToColorCameraTransformForJasperSensorConfiguration(-[BWPointCloudDensificationNodeConfiguration timeOfFlightSensorConfiguration](
                          self->_configuration,
                          "timeOfFlightSensorConfiguration"),
                        (uint64_t)&v12)))
  {
    v6 = 0;
    goto LABEL_13;
  }
  v6 = -[BWPointCloudDensificationNode _newPointCloudFromSampleBuffer:](self, "_newPointCloudFromSampleBuffer:", a3);
  if (!v6)
  {
    fig_log_get_emitter();
LABEL_27:
    FigDebugAssert3();
    goto LABEL_13;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v16 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "livePixelBufferPool"), "newPixelBuffer");
  if (v16
    && !FigCaptureCreateDepthMetadataForColorCameraCalibration(v19, -[BWPointCloudDensificationNodeConfiguration filteringEnabled](self->_configuration, "filteringEnabled"), &v18))
  {
    if (-[ADJasperColorV2Executor executeWithColor:pointCloud:jasperToColorTransform:colorCamera:outputDepthMap:outputConfidenceMap:](self->_executor, "executeWithColor:pointCloud:jasperToColorTransform:colorCamera:outputDepthMap:outputConfidenceMap:", ImageBuffer, v6, v19, &v16, 0, *(double *)&v12, *(double *)&v13, *(double *)&v14, *(double *)&v15)|| !v16)
    {
      goto LABEL_12;
    }
    formatDescriptionOut = 0;
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v16, &formatDescriptionOut);
    memset(&sampleTiming.presentationTimeStamp, 0, 48);
    *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x1E0CA2E18];
    sampleTiming.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    CMSampleBufferGetPresentationTimeStamp(&sampleTiming.presentationTimeStamp, a3);
    sampleTiming.decodeTimeStamp = sampleTiming.duration;
    v9 = CMSampleBufferCreateForImageBuffer(v8, v16, 1u, 0, 0, formatDescriptionOut, &sampleTiming, &sampleBufferOut);
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    if (!v9)
    {
      CMSetAttachment(sampleBufferOut, (CFStringRef)*MEMORY[0x1E0D086F0], v18, 1u);
      BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("Depth"), (uint64_t)sampleBufferOut);
LABEL_12:
      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
      goto LABEL_13;
    }
    fig_log_get_emitter();
    goto LABEL_27;
  }
LABEL_13:
  if (v19)
    CFRelease(v19);
  if (v6)
    CFRelease(v6);
  if (v18)
    CFRelease(v18);
  if (sampleBufferOut)
    CFRelease(sampleBufferOut);
  if (v16)
    CFRelease(v16);
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  BWNodeOutputMediaProperties *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = -[BWNode outputs](self, "outputs");
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
        if (v13)
        {
          v14 = (void *)v13;
          if ((objc_msgSend(a5, "isEqualToString:", 0x1E494FB58) & 1) == 0
            && (objc_msgSend(a5, "isEqualToString:", 0x1E495B138) & 1) == 0
            && objc_msgSend(v12, "passthroughMode"))
          {
            -[ADJasperColorV2Executor prepareForColorROI:](self->_executor, "prepareForColorROI:", 0.0, 0.0, (double)(unint64_t)objc_msgSend((id)objc_msgSend(a4, "videoFormat"), "width"), (double)(unint64_t)objc_msgSend((id)objc_msgSend(a4, "videoFormat"), "height"));
            v15 = (BWNodeOutputMediaProperties *)objc_msgSend(v12, "mediaPropertiesForAttachedMediaKey:", v14);
            v16 = objc_msgSend(v14, "isEqualToString:", CFSTR("PrimaryFormat"));
            if (v15)
            {
              if ((v16 & 1) == 0)
              {
                v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)"), self, v12, v14, a5);
                goto LABEL_20;
              }
            }
            else
            {
              if (v16)
              {
                v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ has no media properties for the primary format (provided media key is %@)"), self, v12, a5, v18);
LABEL_20:
                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0));
              }
              v15 = objc_alloc_init(BWNodeOutputMediaProperties);
              objc_msgSend(v12, "_setMediaProperties:forAttachedMediaKey:", v15, v14);
            }
            -[BWNodeOutputMediaProperties setResolvedFormat:](v15, "setResolvedFormat:", a3);
          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  -[BWNodeOutput makeConfiguredFormatLive](self->super._output, "makeConfiguredFormatLive", a3, a4, a5);
}

@end
