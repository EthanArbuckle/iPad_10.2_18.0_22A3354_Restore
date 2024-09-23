@implementation FigCaptureCameraCalibrationDataSinkPipeline

+ (void)initialize
{
  objc_opt_class();
}

- (_QWORD)initWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t)a5 name:(uint64_t)a6 cameraInfoByPortType:(_OWORD *)a7 clientAuditToken:(uint64_t)a8 delegate:
{
  _QWORD *v14;
  __int128 v15;
  _OWORD v17[2];
  objc_super v18;

  if (!a1)
    return 0;
  v18.receiver = a1;
  v18.super_class = (Class)FigCaptureCameraCalibrationDataSinkPipeline;
  v14 = objc_msgSendSuper2(&v18, sel_initWithGraph_name_sinkID_, a4, a5, objc_msgSend((id)objc_msgSend(a2, "sinkConfiguration"), "sinkID"));
  if (v14)
  {
    v14[7] = (id)objc_msgSend((id)objc_msgSend(a2, "sourceConfiguration"), "sourceID");
    v15 = a7[1];
    v17[0] = *a7;
    v17[1] = v15;
    if (-[FigCaptureCameraCalibrationDataSinkPipeline _buildCameraCalibrationDataSinkPipelineWithConfiguration:sourceOutput:graph:cameraInfoByPortType:clientAuditToken:delegate:](v14, a2, a3, a4, a6, v17, a8))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v14;
}

- (id)_buildCameraCalibrationDataSinkPipelineWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t)a5 cameraInfoByPortType:(_OWORD *)a6 clientAuditToken:(uint64_t)a7 delegate:
{
  void *v12;
  BWStreamingCameraCalibrationDataNode *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 IsExtensionDeviceType;
  int v17;
  uint64_t v18;
  BWRemoteQueueSinkNode *v19;
  uint64_t v20;
  __int128 v21;
  BWRemoteQueueSinkNode *v22;
  objc_super v24;
  objc_super v25;
  _OWORD v26[2];
  objc_super v27;
  objc_super v28;
  id v29;

  if (result)
  {
    v12 = result;
    v28.receiver = result;
    v28.super_class = (Class)FigCaptureCameraCalibrationDataSinkPipeline;
    v29 = 0;
    objc_msgSendSuper2(&v28, sel_setUpstreamOutput_);
    v13 = -[BWStreamingCameraCalibrationDataNode initWithCameraInfoByPortType:]([BWStreamingCameraCalibrationDataNode alloc], "initWithCameraInfoByPortType:", a5);
    -[BWNode setName:](v13, "setName:", CFSTR("Streaming Camera Calibration Data Node"));
    v14 = (void *)objc_msgSend(a2, "sourceConfiguration");
    v15 = objc_msgSend(v14, "sourcePosition") == 2;
    IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend(v14, "sourceDeviceType"));
    -[BWStreamingCameraCalibrationDataNode setHorizontalSensorBinningFactor:](v13, "setHorizontalSensorBinningFactor:", objc_msgSend((id)objc_msgSend(v14, "requiredFormat"), "horizontalSensorBinningFactor"));
    -[BWStreamingCameraCalibrationDataNode setVerticalSensorBinningFactor:](v13, "setVerticalSensorBinningFactor:", objc_msgSend((id)objc_msgSend(v14, "requiredFormat"), "verticalSensorBinningFactor"));
    LODWORD(v14) = objc_msgSend(a2, "orientation");
    v17 = objc_msgSend(a2, "mirroringEnabled");
    objc_msgSend(a4, "clientExpectsCameraMountedInLandscapeOrientation");
    -[BWStreamingCameraCalibrationDataNode setRotationDegrees:](v13, "setRotationDegrees:", FigCaptureRotationDegreesFromOrientation((int)v14, v15, IsExtensionDeviceType, v17));
    -[BWStreamingCameraCalibrationDataNode setMirroringEnabled:](v13, "setMirroringEnabled:", objc_msgSend(a2, "mirroringEnabled"));
    v27.receiver = v12;
    v27.super_class = (Class)FigCaptureCameraCalibrationDataSinkPipeline;
    if ((objc_msgSendSuper2(&v27, sel_addNode_error_, v13, &v29) & 1) != 0
      && (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v13, "input"), 0) & 1) != 0)
    {
      v18 = -[BWNode output](v13, "output");
      v19 = [BWRemoteQueueSinkNode alloc];
      v20 = objc_msgSend(v12, "sinkID");
      v21 = a6[1];
      v26[0] = *a6;
      v26[1] = v21;
      v22 = -[BWRemoteQueueSinkNode initWithMediaType:clientAuditToken:sinkID:](v19, "initWithMediaType:clientAuditToken:sinkID:", 1667326820, v26, v20);
      -[BWNode setName:](v22, "setName:", CFSTR("Camera Calibration Data Remote Queue Sink"));
      -[BWRemoteQueueSinkNode setDelegate:](v22, "setDelegate:", a7);
      -[BWRemoteQueueSinkNode setDiscardsLateSampleBuffers:](v22, "setDiscardsLateSampleBuffers:", objc_msgSend((id)objc_msgSend(a2, "cameraCalibrationDataSinkConfiguration"), "discardsLateCameraCalibrationData"));
      v25.receiver = v12;
      v25.super_class = (Class)FigCaptureCameraCalibrationDataSinkPipeline;
      if ((objc_msgSendSuper2(&v25, sel_addNode_error_, v22, &v29) & 1) != 0)
      {
        v24.receiver = v12;
        v24.super_class = (Class)FigCaptureCameraCalibrationDataSinkPipeline;
        objc_msgSendSuper2(&v24, sel_setSinkNode_, v22);
        if ((objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v18, -[BWNode input](v22, "input"), 0) & 1) != 0)
          goto LABEL_6;
        fig_log_get_emitter();
      }
      else
      {
        fig_log_get_emitter();
      }
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
LABEL_6:
    result = v29;
    if (v29)
      return (id)objc_msgSend(v29, "code");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureCameraCalibrationDataSinkPipeline;
  -[FigCaptureRemoteQueueSinkPipeline dealloc](&v3, sel_dealloc);
}

@end
