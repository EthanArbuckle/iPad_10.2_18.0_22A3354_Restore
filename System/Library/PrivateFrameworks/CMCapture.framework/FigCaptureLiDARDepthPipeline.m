@implementation FigCaptureLiDARDepthPipeline

+ (void)initialize
{
  objc_opt_class();
}

- (FigCaptureLiDARDepthPipeline)initWithCaptureDevice:(id)a3 cameraInfoByPortType:(id)a4 sensorIDStringsByPortType:(id)a5 timeOfFlightCameraType:(int)a6 depthDataCaptureConnectionConfiguration:(id)a7 videoSourceCaptureOutput:(id)a8 pointCloudOutput:(id)a9 graph:(id)a10 name:(id)a11 rgbCameraSourceID:(id)a12 errorOut:(int *)a13
{
  uint64_t v15;
  FigCaptureLiDARDepthPipeline *v19;
  int v20;
  int v22;
  objc_super v23;

  v15 = *(_QWORD *)&a6;
  v23.receiver = self;
  v23.super_class = (Class)FigCaptureLiDARDepthPipeline;
  v19 = -[FigCapturePipeline initWithGraph:name:](&v23, sel_initWithGraph_name_, a10, a11);
  if (!v19)
    goto LABEL_3;
  v19->_captureDevice = (BWFigVideoCaptureDevice *)a3;
  v19->_cameraInfoByPortType = (NSDictionary *)a4;
  v19->_sensorIDStringsByPortType = (NSDictionary *)a5;
  v19->_rgbCameraHorizontalSensorBinningFactor = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a7, "sourceConfiguration"), "requiredFormat"), "horizontalSensorBinningFactor");
  v19->_rgbCameraVerticalSensorBinningFactor = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a7, "sourceConfiguration"), "requiredFormat"), "verticalSensorBinningFactor");
  v19->_depthPixelFormat = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a7, "sourceConfiguration"), "depthDataFormat"), "format");
  v19->_depthDataFilteringEnabled = objc_msgSend((id)objc_msgSend(a7, "depthDataSinkConfiguration"), "filteringEnabled");
  v19->_depthOutputDimensions = ($470D365275581EF16070F5A11344F73E)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a7, "sourceConfiguration"), "depthDataFormat"), "dimensions");
  v19->_depthDataCaptureConnectionConfiguration = (FigDepthDataCaptureConnectionConfiguration *)a7;
  v19->_rgbCameraSourceID = (NSString *)a12;
  v20 = -[FigCaptureLiDARDepthPipeline _buildLiDARDepthPipelineWithVideoSourceCaptureOutput:pointCloudOutput:graph:timeOfFlightCameraType:](v19, "_buildLiDARDepthPipelineWithVideoSourceCaptureOutput:pointCloudOutput:graph:timeOfFlightCameraType:", a8, a9, a10, v15);
  if (v20)
  {
    v22 = v20;
    fig_log_get_emitter();
    FigDebugAssert3();
    *a13 = v22;

    return 0;
  }
  else
  {
LABEL_3:
    *a13 = 0;
  }
  return v19;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureLiDARDepthPipeline;
  -[FigCapturePipeline dealloc](&v3, sel_dealloc);
}

- (BWNodeOutput)depthDataSinkOutput
{
  void *depthRotatorNode;

  if (self->_depthRotatorNode)
    depthRotatorNode = self->_depthRotatorNode;
  else
    depthRotatorNode = self->_pointCloudDensificationNode;
  return (BWNodeOutput *)objc_msgSend(depthRotatorNode, "output");
}

- (int)_buildLiDARDepthPipelineWithVideoSourceCaptureOutput:(id)a3 pointCloudOutput:(id)a4 graph:(id)a5 timeOfFlightCameraType:(int)a6
{
  BWVideoPointCloudSynchronizerNode *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  FigCaptureCameraParameters *v21;
  BWPipelineStage *v22;
  FigCaptureSourceConfiguration *v23;
  _BOOL4 v24;
  int v25;
  int v26;
  uint64_t v27;
  BWDepthRotatorNode *v28;
  int result;
  uint64_t v30;
  id v31;
  int v32;
  id v33;

  v33 = 0;
  v11 = -[BWVideoPointCloudSynchronizerNode initWithCaptureDevice:timeOfFlightCameraType:]([BWVideoPointCloudSynchronizerNode alloc], "initWithCaptureDevice:timeOfFlightCameraType:", self->_captureDevice, *(_QWORD *)&a6);
  self->_synchronizerNode = v11;
  if (!-[FigCapturePipeline addNode:error:](self, "addNode:error:", v11, &v33)
    || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", a3, -[BWVideoPointCloudSynchronizerNode imageInput](self->_synchronizerNode, "imageInput"), 0) & 1) == 0|| (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", a4, -[BWVideoPointCloudSynchronizerNode pointCloudInput](self->_synchronizerNode, "pointCloudInput"), 0) & 1) == 0)
  {
    goto LABEL_18;
  }
  v12 = *MEMORY[0x1E0D05A18];
  v13 = -[NSDictionary objectForKeyedSubscript:](self->_sensorIDStringsByPortType, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]);
  if (!v13
    || (v14 = v13,
        (v15 = -[NSDictionary objectForKeyedSubscript:](self->_cameraInfoByPortType, "objectForKeyedSubscript:", v12)) == 0)
    || (v16 = v15,
        v32 = a6,
        v17 = *MEMORY[0x1E0D05A20],
        (v18 = -[NSDictionary objectForKeyedSubscript:](self->_sensorIDStringsByPortType, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A20])) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  v19 = v18;
  v31 = a5;
  v20 = -[NSDictionary objectForKeyedSubscript:](self->_cameraInfoByPortType, "objectForKeyedSubscript:", v17);
  v21 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  LODWORD(v30) = v32;
  self->_pointCloudDensificationNode = -[BWPointCloudDensificationNode initWithConfiguration:]([BWPointCloudDensificationNode alloc], "initWithConfiguration:", objc_autorelease(-[BWPointCloudDensificationNodeConfiguration initWithRGBSensorConfiguration:timeOfFlightSensorConfiguration:rgbCameraHorizontalSensorBinningFactor:rgbCameraVerticalSensorBinningFactor:filteringEnabled:depthPixelFormat:depthOutputDimensions:timeOfFlightCameraType:]([BWPointCloudDensificationNodeConfiguration alloc], "initWithRGBSensorConfiguration:timeOfFlightSensorConfiguration:rgbCameraHorizontalSensorBinningFactor:rgbCameraVerticalSensorBinningFactor:filteringEnabled:depthPixelFormat:depthOutputDimensions:timeOfFlightCameraType:", objc_autorelease(-[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v12, v14, -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](v21, "sensorIDDictionaryForPortType:sensorIDString:", v12, v14),
                                                 v16)),
                                             -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v17, v19, -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](v21, "sensorIDDictionaryForPortType:sensorIDString:", v17, v19), v20), self->_rgbCameraHorizontalSensorBinningFactor, self->_rgbCameraVerticalSensorBinningFactor, self->_depthDataFilteringEnabled, self->_depthPixelFormat, *(_QWORD *)&self->_depthOutputDimensions, v30)));
  v22 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.pointcloud.densification"), 13);
  if (!-[FigCapturePipeline addNode:error:](self, "addNode:error:", self->_pointCloudDensificationNode, &v33))
    goto LABEL_18;
  if (!objc_msgSend(v31, "connectOutput:toInput:pipelineStage:", -[BWNode output](self->_synchronizerNode, "output"), -[BWNode input](self->_pointCloudDensificationNode, "input"), v22))goto LABEL_12;
  v23 = -[FigCaptureConnectionConfiguration sourceConfiguration](self->_depthDataCaptureConnectionConfiguration, "sourceConfiguration");
  v24 = -[FigCaptureSourceConfiguration sourcePosition](v23, "sourcePosition") == 2;
  LODWORD(v23) = BWDeviceTypeIsExtensionDeviceType(-[FigCaptureSourceConfiguration sourceDeviceType](v23, "sourceDeviceType"));
  v25 = -[FigVideoCaptureConnectionConfiguration orientation](self->_depthDataCaptureConnectionConfiguration, "orientation");
  v26 = -[FigVideoCaptureConnectionConfiguration mirroringEnabled](self->_depthDataCaptureConnectionConfiguration, "mirroringEnabled");
  objc_msgSend(v31, "clientExpectsCameraMountedInLandscapeOrientation");
  v27 = FigCaptureRotationDegreesFromOrientation(v25, v24, (int)v23, v26);
  if (!(_DWORD)v27)
    goto LABEL_12;
  v28 = -[BWDepthRotatorNode initWithRotationDegrees:separateDepthComponentsEnabled:depthProvidedAsAttachedMedia:]([BWDepthRotatorNode alloc], "initWithRotationDegrees:separateDepthComponentsEnabled:depthProvidedAsAttachedMedia:", v27, 0, 1);
  self->_depthRotatorNode = v28;
  if (-[FigCapturePipeline addNode:error:](self, "addNode:error:", v28, &v33))
  {
    objc_msgSend(v31, "connectOutput:toInput:pipelineStage:", -[BWNode output](self->_pointCloudDensificationNode, "output"), -[BWNode input](self->_depthRotatorNode, "input"), v22);
  }
  else
  {
LABEL_18:
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_12:
  result = (int)v33;
  if (v33)
    return objc_msgSend(v33, "code");
  return result;
}

- (NSString)rgbCameraSourceID
{
  return self->_rgbCameraSourceID;
}

@end
