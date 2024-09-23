@implementation ARImageSensorSettings

- (ARImageSensorSettings)initWithVideoFormat:(id)a3
{
  id v5;
  ARImageSensorSettings *v6;
  ARImageSensorSettings *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARImageSensorSettings;
  v6 = -[ARImageSensorSettings init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_videoFormat, a3);
    *(_WORD *)&v7->_autoFocusEnabled = 0;
    v7->_visionDataOutputEnabled = 0;
    objc_msgSend(v5, "deviceFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_calibrationDataOutputEnabled = objc_msgSend(v8, "isCameraCalibrationDataDeliverySupported");

    v7->_maxGainOverride = 0.0;
    *(_WORD *)&v7->_videoHDRAllowed = 0;
    v7->_enabled = 1;
    v7->_backFacingCameraGeometricDistortionCorrectionEnabled = 0;
    v7->_maximumNumberOfTrackedFaces = 0;
    objc_msgSend(v5, "captureDeviceType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0C89F98];

    if (v9 == v10)
      v7->_backFacingCameraGeometricDistortionCorrectionEnabled = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imagesensor.back.ultrawide.geometricDistortionCorrection"));
    +[ARKitUserDefaults doubleForKey:](ARKitUserDefaults, "doubleForKey:", CFSTR("com.apple.arkit.imagesensor.initialFrameDrop.negativeExposureTargetOffsetThreshold"));
    *(float *)&v11 = v11;
    v7->_negativeExposureTargetOffsetThreshold = *(float *)&v11;
    +[ARKitUserDefaults doubleForKey:](ARKitUserDefaults, "doubleForKey:", CFSTR("com.apple.arkit.imagesensor.initialFrameDrop.positiveExposureTargetOffsetThreshold"));
    *(float *)&v12 = v12;
    v7->_positiveExposureTargetOffsetThreshold = *(float *)&v12;
    v7->_maximumNumberOfInitialFramesDropped = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.imagesensor.initialFrameDrop.maxDroppedFramesCount"));
  }

  return v7;
}

- (void)setVisionDataOutputEnabled:(BOOL)a3
{
  id v5;

  -[ARVideoFormat deviceFormat](self->_videoFormat, "deviceFormat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_visionDataOutputEnabled = objc_msgSend(v5, "isVisionDataDeliverySupported") & a3;

}

- (void)setCalibrationDataOutputEnabled:(BOOL)a3
{
  id v5;

  -[ARVideoFormat deviceFormat](self->_videoFormat, "deviceFormat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_calibrationDataOutputEnabled = objc_msgSend(v5, "isCameraCalibrationDataDeliverySupported") & a3;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v12.receiver = self;
  v12.super_class = (Class)ARImageSensorSettings;
  -[ARImageSensorSettings description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_enabled)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("Enabled: %@\n"), v6);
  objc_msgSend(v5, "appendFormat:", CFSTR("Video Format: %@\n"), self->_videoFormat);
  if (self->_visionDataOutputEnabled)
    v7 = CFSTR("Enabled");
  else
    v7 = CFSTR("Disabled");
  objc_msgSend(v5, "appendFormat:", CFSTR("VisionData: %@\n"), v7);
  if (self->_calibrationDataOutputEnabled)
    v8 = CFSTR("Enabled");
  else
    v8 = CFSTR("Disabled");
  objc_msgSend(v5, "appendFormat:", CFSTR("CalibrationData: %@\n"), v8);
  if (self->_backFacingCameraGeometricDistortionCorrectionEnabled)
    v9 = CFSTR("Enabled");
  else
    v9 = CFSTR("Disabled");
  objc_msgSend(v5, "appendFormat:", CFSTR("GeometricDistortionCorrection: %@\n"), v9);
  objc_msgSend(v5, "appendFormat:", CFSTR("Metadata: %@\n"), self->_metaData);
  if (self->_supportsCapturingHighResolutionFrames)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("Supports Capturing High Resolution Frames: %@\n"), v10);
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ARVideoFormat description](self->_videoFormat, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%li|%i"), v4, self->_autoFocusEnabled, self->_mirrorVideoOutput);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "hash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  int v13;
  int v14;
  float v15;
  float v16;
  float v17;
  int v18;
  int v19;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  int v27;
  int v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  unint64_t v35;
  _BOOL4 v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;

  v6 = a3;
  if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    v7 = v6;
    -[ARImageSensorSettings videoFormat](self, "videoFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "videoFormat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[ARImageSensorSettings videoFormat](self, "videoFormat");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "videoFormat");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v4))
      {
        LOBYTE(v10) = 0;
        goto LABEL_14;
      }
    }
    v12 = -[ARImageSensorSettings autoFocusEnabled](self, "autoFocusEnabled");
    if (v12 != objc_msgSend(v7, "autoFocusEnabled")
      || (v13 = -[ARImageSensorSettings mirrorVideoOutput](self, "mirrorVideoOutput"),
          v13 != objc_msgSend(v7, "mirrorVideoOutput"))
      || (v14 = -[ARImageSensorSettings visionDataOutputEnabled](self, "visionDataOutputEnabled"),
          v14 != objc_msgSend(v7, "visionDataOutputEnabled"))
      || (-[ARImageSensorSettings maxGainOverride](self, "maxGainOverride"),
          v16 = v15,
          objc_msgSend(v7, "maxGainOverride"),
          v16 != v17)
      || (v18 = -[ARImageSensorSettings videoHDRAllowed](self, "videoHDRAllowed"),
          v18 != objc_msgSend(v7, "videoHDRAllowed"))
      || (v19 = -[ARImageSensorSettings focusPixelBlurScoreDeliveryEnabled](self, "focusPixelBlurScoreDeliveryEnabled"),
          v19 != objc_msgSend(v7, "focusPixelBlurScoreDeliveryEnabled")))
    {
      LOBYTE(v10) = 0;
      v11 = 0;
      goto LABEL_13;
    }
    -[ARImageSensorSettings visionDataOutputParameters](self, "visionDataOutputParameters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visionDataOutputParameters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 != v22)
    {
      -[ARImageSensorSettings visionDataOutputParameters](self, "visionDataOutputParameters");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "visionDataOutputParameters");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v23;
      if (!objc_msgSend(v23, "isEqual:"))
      {
        LOBYTE(v10) = 0;
        goto LABEL_40;
      }
    }
    v24 = -[ARImageSensorSettings calibrationDataOutputEnabled](self, "calibrationDataOutputEnabled");
    if (v24 != objc_msgSend(v7, "calibrationDataOutputEnabled"))
    {
      LOBYTE(v10) = 0;
      goto LABEL_39;
    }
    -[ARImageSensorSettings metaData](self, "metaData");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metaData");
    v44 = v21;
    v45 = objc_claimAutoreleasedReturnValue();
    if (v10 == v45)
    {
      v43 = (void *)v10;
    }
    else
    {
      v40 = v22;
      -[ARImageSensorSettings metaData](self, "metaData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "metaData");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v25;
      if (!objc_msgSend(v25, "isEqualToString:"))
      {
        v38 = (void *)v10;
        LOBYTE(v10) = 0;
        v39 = (void *)v45;
        v22 = v40;
        goto LABEL_37;
      }
      v43 = (void *)v10;
      v22 = v40;
    }
    v26 = -[ARImageSensorSettings isEnabled](self, "isEnabled");
    if (v26 != objc_msgSend(v7, "isEnabled"))
      goto LABEL_33;
    v27 = -[ARImageSensorSettings backFacingCameraGeometricDistortionCorrectionEnabled](self, "backFacingCameraGeometricDistortionCorrectionEnabled");
    if (v27 != objc_msgSend(v7, "backFacingCameraGeometricDistortionCorrectionEnabled"))
      goto LABEL_33;
    v28 = -[ARImageSensorSettings dropsInitialFramesOutsideExposureTargetOffsetThreshold](self, "dropsInitialFramesOutsideExposureTargetOffsetThreshold");
    if (v28 != objc_msgSend(v7, "dropsInitialFramesOutsideExposureTargetOffsetThreshold"))
      goto LABEL_33;
    -[ARImageSensorSettings positiveExposureTargetOffsetThreshold](self, "positiveExposureTargetOffsetThreshold");
    v30 = v29;
    objc_msgSend(v7, "positiveExposureTargetOffsetThreshold");
    if (v30 == v31
      && (-[ARImageSensorSettings negativeExposureTargetOffsetThreshold](self, "negativeExposureTargetOffsetThreshold"),
          v33 = v32,
          objc_msgSend(v7, "negativeExposureTargetOffsetThreshold"),
          v33 == v34)
      && (v35 = -[ARImageSensorSettings maximumNumberOfInitialFramesDropped](self, "maximumNumberOfInitialFramesDropped"), v35 == objc_msgSend(v7, "maximumNumberOfInitialFramesDropped")))
    {
      v36 = -[ARImageSensorSettings supportsCapturingHighResolutionFrames](self, "supportsCapturingHighResolutionFrames");
      LODWORD(v10) = v36 ^ objc_msgSend(v7, "supportsCapturingHighResolutionFrames") ^ 1;
      v37 = v10;
    }
    else
    {
LABEL_33:
      LOBYTE(v10) = 0;
      v37 = 0;
    }
    v38 = v43;
    v39 = (void *)v45;
    if (v43 == (void *)v45)
    {
      LOBYTE(v10) = v37;
LABEL_38:

      v21 = v44;
LABEL_39:
      if (v21 == v22)
      {
LABEL_41:

        v11 = v10;
LABEL_13:
        if (v8 == v9)
        {
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:

        v11 = v10;
        goto LABEL_15;
      }
LABEL_40:

      goto LABEL_41;
    }
LABEL_37:

    goto LABEL_38;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[ARVideoFormat copyWithZone:](self->_videoFormat, "copyWithZone:", a3);
  v7 = objc_msgSend(v5, "initWithVideoFormat:", v6);

  *(_BYTE *)(v7 + 8) = self->_autoFocusEnabled;
  *(_BYTE *)(v7 + 9) = self->_mirrorVideoOutput;
  *(_BYTE *)(v7 + 10) = self->_visionDataOutputEnabled;
  *(_BYTE *)(v7 + 11) = self->_calibrationDataOutputEnabled;
  *(float *)(v7 + 20) = self->_maxGainOverride;
  *(_BYTE *)(v7 + 12) = self->_videoHDRAllowed;
  *(_BYTE *)(v7 + 13) = self->_focusPixelBlurScoreDeliveryEnabled;
  v8 = -[NSDictionary copyWithZone:](self->_visionDataOutputParameters, "copyWithZone:", a3);
  v9 = *(void **)(v7 + 56);
  *(_QWORD *)(v7 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_metaData, "copyWithZone:", a3);
  v11 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = v10;

  *(_BYTE *)(v7 + 17) = self->_enabled;
  *(_BYTE *)(v7 + 15) = self->_backFacingCameraGeometricDistortionCorrectionEnabled;
  *(_QWORD *)(v7 + 64) = self->_maximumNumberOfTrackedFaces;
  *(_BYTE *)(v7 + 14) = self->_dropsInitialFramesOutsideExposureTargetOffsetThreshold;
  *(float *)(v7 + 28) = self->_positiveExposureTargetOffsetThreshold;
  *(float *)(v7 + 24) = self->_negativeExposureTargetOffsetThreshold;
  *(_QWORD *)(v7 + 40) = self->_maximumNumberOfInitialFramesDropped;
  *(_BYTE *)(v7 + 16) = self->_supportsCapturingHighResolutionFrames;
  return (id)v7;
}

- (ARVideoFormat)videoFormat
{
  return self->_videoFormat;
}

- (void)setVideoFormat:(id)a3
{
  objc_storeStrong((id *)&self->_videoFormat, a3);
}

- (BOOL)autoFocusEnabled
{
  return self->_autoFocusEnabled;
}

- (void)setAutoFocusEnabled:(BOOL)a3
{
  self->_autoFocusEnabled = a3;
}

- (BOOL)mirrorVideoOutput
{
  return self->_mirrorVideoOutput;
}

- (void)setMirrorVideoOutput:(BOOL)a3
{
  self->_mirrorVideoOutput = a3;
}

- (BOOL)visionDataOutputEnabled
{
  return self->_visionDataOutputEnabled;
}

- (BOOL)calibrationDataOutputEnabled
{
  return self->_calibrationDataOutputEnabled;
}

- (float)maxGainOverride
{
  return self->_maxGainOverride;
}

- (void)setMaxGainOverride:(float)a3
{
  self->_maxGainOverride = a3;
}

- (BOOL)videoHDRAllowed
{
  return self->_videoHDRAllowed;
}

- (void)setVideoHDRAllowed:(BOOL)a3
{
  self->_videoHDRAllowed = a3;
}

- (BOOL)focusPixelBlurScoreDeliveryEnabled
{
  return self->_focusPixelBlurScoreDeliveryEnabled;
}

- (void)setFocusPixelBlurScoreDeliveryEnabled:(BOOL)a3
{
  self->_focusPixelBlurScoreDeliveryEnabled = a3;
}

- (BOOL)dropsInitialFramesOutsideExposureTargetOffsetThreshold
{
  return self->_dropsInitialFramesOutsideExposureTargetOffsetThreshold;
}

- (void)setDropsInitialFramesOutsideExposureTargetOffsetThreshold:(BOOL)a3
{
  self->_dropsInitialFramesOutsideExposureTargetOffsetThreshold = a3;
}

- (float)negativeExposureTargetOffsetThreshold
{
  return self->_negativeExposureTargetOffsetThreshold;
}

- (void)setNegativeExposureTargetOffsetThreshold:(float)a3
{
  self->_negativeExposureTargetOffsetThreshold = a3;
}

- (float)positiveExposureTargetOffsetThreshold
{
  return self->_positiveExposureTargetOffsetThreshold;
}

- (void)setPositiveExposureTargetOffsetThreshold:(float)a3
{
  self->_positiveExposureTargetOffsetThreshold = a3;
}

- (unint64_t)maximumNumberOfInitialFramesDropped
{
  return self->_maximumNumberOfInitialFramesDropped;
}

- (void)setMaximumNumberOfInitialFramesDropped:(unint64_t)a3
{
  self->_maximumNumberOfInitialFramesDropped = a3;
}

- (BOOL)backFacingCameraGeometricDistortionCorrectionEnabled
{
  return self->_backFacingCameraGeometricDistortionCorrectionEnabled;
}

- (void)setBackFacingCameraGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  self->_backFacingCameraGeometricDistortionCorrectionEnabled = a3;
}

- (NSString)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)visionDataOutputParameters
{
  return self->_visionDataOutputParameters;
}

- (void)setVisionDataOutputParameters:(id)a3
{
  objc_storeStrong((id *)&self->_visionDataOutputParameters, a3);
}

- (unint64_t)maximumNumberOfTrackedFaces
{
  return self->_maximumNumberOfTrackedFaces;
}

- (void)setMaximumNumberOfTrackedFaces:(unint64_t)a3
{
  self->_maximumNumberOfTrackedFaces = a3;
}

- (BOOL)supportsCapturingHighResolutionFrames
{
  return self->_supportsCapturingHighResolutionFrames;
}

- (void)setSupportsCapturingHighResolutionFrames:(BOOL)a3
{
  self->_supportsCapturingHighResolutionFrames = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionDataOutputParameters, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_videoFormat, 0);
}

@end
