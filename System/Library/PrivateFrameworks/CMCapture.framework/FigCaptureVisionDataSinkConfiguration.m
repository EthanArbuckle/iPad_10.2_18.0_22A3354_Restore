@implementation FigCaptureVisionDataSinkConfiguration

- (FigCaptureVisionDataSinkConfiguration)initWithXPCEncoding:(id)a3
{
  FigCaptureVisionDataSinkConfiguration *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  const void *data;
  size_t length;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FigCaptureVisionDataSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v15, sel_initWithXPCEncoding_);
  if (v4)
  {
    v5 = xpc_dictionary_get_double(a3, "maxFrameRate");
    v4->_maxFrameRate = v5;
    v6 = xpc_dictionary_get_double(a3, "maxBurstFrameRate");
    v4->_maxBurstFrameRate = v6;
    FigXPCMessageGetCMTime();
    v4->_gaussianPyramidOctavesCount = xpc_dictionary_get_uint64(a3, "gaussianPyramidOctavesCount");
    v7 = xpc_dictionary_get_double(a3, "gaussianPyramidBaseOctaveDownscalingFactor");
    v4->_gaussianPyramidBaseOctaveDownscalingFactor = v7;
    v4->_maxKeypointsCount = xpc_dictionary_get_uint64(a3, "maxKeypointsCount");
    v8 = xpc_dictionary_get_double(a3, "keypointDetectionThreshold");
    v4->_keypointDetectionThreshold = v8;
    v4->_featureBinningEnabled = xpc_dictionary_get_BOOL(a3, "featureBinningEnabled");
    v4->_featureOrientationAssignmentEnabled = xpc_dictionary_get_BOOL(a3, "featureOrientationAssignmentEnabled");
    v4->_dynamicThresholdingEnabled = xpc_dictionary_get_BOOL(a3, "dynamicThresholdingEnabled");
    v4->_keypointDetectionFlowType = xpc_dictionary_get_uint64(a3, "keypointDetectionFlowType");
    v4->_subPixelThreshold = xpc_dictionary_get_uint64(a3, "subPixelThreshold");
    v4->_featureMatchingEnabled = xpc_dictionary_get_BOOL(a3, "featureMatchingEnabled");
    v4->_featureMatchingDescriptorSize = xpc_dictionary_get_uint64(a3, "featureMatchingDescriptorSize");
    v9 = xpc_dictionary_get_double(a3, "orientationDistanceThreshold");
    v4->_orientationDistanceThreshold = v9;
    v10 = xpc_dictionary_get_double(a3, "sigmaDistanceThreshold");
    v4->_sigmaDistanceThreshold = v10;
    v11 = xpc_dictionary_get_double(a3, "squareDistanceDisparityFraction");
    v4->_squareDistanceDisparityFraction = v11;
    v4->_hammingDistanceThreshold = xpc_dictionary_get_uint64(a3, "hammingDistanceThreshold");
    length = 0;
    data = xpc_dictionary_get_data(a3, "laccConfigAndMetadata", &length);
    if (data)
      v4->_laccConfigAndMetadata = (NSData *)(id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
  }
  return v4;
}

- (id)copyXPCEncoding
{
  id v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  NSData *laccConfigAndMetadata;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FigCaptureVisionDataSinkConfiguration;
  v3 = -[FigCaptureSinkConfiguration copyXPCEncoding](&v13, sel_copyXPCEncoding);
  -[FigCaptureVisionDataSinkConfiguration maxFrameRate](self, "maxFrameRate");
  xpc_dictionary_set_double(v3, "maxFrameRate", v4);
  -[FigCaptureVisionDataSinkConfiguration maxBurstFrameRate](self, "maxBurstFrameRate");
  xpc_dictionary_set_double(v3, "maxBurstFrameRate", v5);
  if (self)
    -[FigCaptureVisionDataSinkConfiguration maxBurstDuration](self, "maxBurstDuration");
  FigXPCMessageSetCMTime();
  xpc_dictionary_set_uint64(v3, "gaussianPyramidOctavesCount", -[FigCaptureVisionDataSinkConfiguration gaussianPyramidOctavesCount](self, "gaussianPyramidOctavesCount"));
  -[FigCaptureVisionDataSinkConfiguration gaussianPyramidBaseOctaveDownscalingFactor](self, "gaussianPyramidBaseOctaveDownscalingFactor");
  xpc_dictionary_set_double(v3, "gaussianPyramidBaseOctaveDownscalingFactor", v6);
  xpc_dictionary_set_uint64(v3, "maxKeypointsCount", -[FigCaptureVisionDataSinkConfiguration maxKeypointsCount](self, "maxKeypointsCount"));
  -[FigCaptureVisionDataSinkConfiguration keypointDetectionThreshold](self, "keypointDetectionThreshold");
  xpc_dictionary_set_double(v3, "keypointDetectionThreshold", v7);
  xpc_dictionary_set_BOOL(v3, "featureBinningEnabled", -[FigCaptureVisionDataSinkConfiguration featureBinningEnabled](self, "featureBinningEnabled"));
  xpc_dictionary_set_BOOL(v3, "featureOrientationAssignmentEnabled", -[FigCaptureVisionDataSinkConfiguration featureOrientationAssignmentEnabled](self, "featureOrientationAssignmentEnabled"));
  xpc_dictionary_set_BOOL(v3, "dynamicThresholdingEnabled", -[FigCaptureVisionDataSinkConfiguration isDynamicThresholdingEnabled](self, "isDynamicThresholdingEnabled"));
  xpc_dictionary_set_uint64(v3, "keypointDetectionFlowType", -[FigCaptureVisionDataSinkConfiguration keypointDetectionFlowType](self, "keypointDetectionFlowType"));
  xpc_dictionary_set_uint64(v3, "subPixelThreshold", -[FigCaptureVisionDataSinkConfiguration subPixelThreshold](self, "subPixelThreshold"));
  xpc_dictionary_set_BOOL(v3, "featureMatchingEnabled", -[FigCaptureVisionDataSinkConfiguration isFeatureMatchingEnabled](self, "isFeatureMatchingEnabled"));
  xpc_dictionary_set_uint64(v3, "featureMatchingDescriptorSize", -[FigCaptureVisionDataSinkConfiguration featureMatchingDescriptorSize](self, "featureMatchingDescriptorSize"));
  -[FigCaptureVisionDataSinkConfiguration orientationDistanceThreshold](self, "orientationDistanceThreshold");
  xpc_dictionary_set_double(v3, "orientationDistanceThreshold", v8);
  -[FigCaptureVisionDataSinkConfiguration sigmaDistanceThreshold](self, "sigmaDistanceThreshold");
  xpc_dictionary_set_double(v3, "sigmaDistanceThreshold", v9);
  -[FigCaptureVisionDataSinkConfiguration squareDistanceDisparityFraction](self, "squareDistanceDisparityFraction");
  xpc_dictionary_set_double(v3, "squareDistanceDisparityFraction", v10);
  xpc_dictionary_set_uint64(v3, "hammingDistanceThreshold", -[FigCaptureVisionDataSinkConfiguration hammingDistanceThreshold](self, "hammingDistanceThreshold"));
  laccConfigAndMetadata = self->_laccConfigAndMetadata;
  if (laccConfigAndMetadata)
    xpc_dictionary_set_data(v3, "laccConfigAndMetadata", -[NSData bytes](laccConfigAndMetadata, "bytes"), -[NSData length](self->_laccConfigAndMetadata, "length"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVisionDataSinkConfiguration;
  -[FigCaptureSinkConfiguration dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  float v4;
  double v5;
  float v6;
  double v7;
  Float64 Seconds;
  float v9;
  double v10;
  uint64_t v11;
  float v12;
  double v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  uint64_t v17;
  unint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  float v21;
  double v22;
  float v23;
  double v24;
  float v25;
  uint64_t v27;
  NSString *v28;
  CMTime time;
  objc_super v30;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v30.receiver = self;
  v30.super_class = (Class)FigCaptureVisionDataSinkConfiguration;
  v28 = -[FigCaptureSinkConfiguration description](&v30, sel_description);
  -[FigCaptureVisionDataSinkConfiguration maxFrameRate](self, "maxFrameRate");
  v5 = v4;
  -[FigCaptureVisionDataSinkConfiguration maxBurstFrameRate](self, "maxBurstFrameRate");
  v7 = v6;
  if (self)
    -[FigCaptureVisionDataSinkConfiguration maxBurstDuration](self, "maxBurstDuration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  v27 = -[FigCaptureVisionDataSinkConfiguration gaussianPyramidOctavesCount](self, "gaussianPyramidOctavesCount");
  -[FigCaptureVisionDataSinkConfiguration gaussianPyramidBaseOctaveDownscalingFactor](self, "gaussianPyramidBaseOctaveDownscalingFactor");
  v10 = v9;
  v11 = -[FigCaptureVisionDataSinkConfiguration maxKeypointsCount](self, "maxKeypointsCount");
  -[FigCaptureVisionDataSinkConfiguration keypointDetectionThreshold](self, "keypointDetectionThreshold");
  v13 = v12;
  v14 = -[FigCaptureVisionDataSinkConfiguration featureBinningEnabled](self, "featureBinningEnabled");
  v15 = -[FigCaptureVisionDataSinkConfiguration featureOrientationAssignmentEnabled](self, "featureOrientationAssignmentEnabled");
  v16 = -[FigCaptureVisionDataSinkConfiguration isDynamicThresholdingEnabled](self, "isDynamicThresholdingEnabled");
  v17 = -[FigCaptureVisionDataSinkConfiguration keypointDetectionFlowType](self, "keypointDetectionFlowType");
  v18 = -[FigCaptureVisionDataSinkConfiguration subPixelThreshold](self, "subPixelThreshold");
  v19 = -[FigCaptureVisionDataSinkConfiguration isFeatureMatchingEnabled](self, "isFeatureMatchingEnabled");
  v20 = -[FigCaptureVisionDataSinkConfiguration featureMatchingDescriptorSize](self, "featureMatchingDescriptorSize");
  -[FigCaptureVisionDataSinkConfiguration orientationDistanceThreshold](self, "orientationDistanceThreshold");
  v22 = v21;
  -[FigCaptureVisionDataSinkConfiguration sigmaDistanceThreshold](self, "sigmaDistanceThreshold");
  v24 = v23;
  -[FigCaptureVisionDataSinkConfiguration squareDistanceDisparityFraction](self, "squareDistanceDisparityFraction");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ maxFPS:%.0f maxBurstFPS:%.0f maxBurstDur:%.3f octaves:%d downscaleBy:%.3f maxKeypoints:%d keypointDetectionThreshold:%.3f featureBinning:%d orientationAware:%d dynamicThresholding:%d keypointDetectionFlow:%d subPixelThreshold:%lu featureMatching:%d featureMatchingDescriptorSize:%d orientationDistanceThreshold:%f sigmaDistanceThreshold:%f squareDistanceDisparityThreshold:%f hammingDistanceThreshold:%lu"), v28, *(_QWORD *)&v5, *(_QWORD *)&v7, *(_QWORD *)&Seconds, v27, *(_QWORD *)&v10, v11, *(_QWORD *)&v13, v14, v15, v16, v17, v18, v19, v20, *(_QWORD *)&v22,
    *(_QWORD *)&v24,
    v25,
    -[FigCaptureVisionDataSinkConfiguration hammingDistanceThreshold](self, "hammingDistanceThreshold"));
  if (-[FigCaptureVisionDataSinkConfiguration laccConfigAndMetadata](self, "laccConfigAndMetadata"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" LACCConfigAndMetadata:%@"), -[FigCaptureVisionDataSinkConfiguration laccConfigAndMetadata](self, "laccConfigAndMetadata"));
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  $95D729B680665BEAEFA1D6FCA8238556 maxBurstDuration;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)FigCaptureVisionDataSinkConfiguration;
  v5 = -[FigCaptureSinkConfiguration copyWithZone:](&v16, sel_copyWithZone_);
  *(float *)&v6 = self->_maxFrameRate;
  objc_msgSend(v5, "setMaxFrameRate:", v6);
  *(float *)&v7 = self->_maxBurstFrameRate;
  objc_msgSend(v5, "setMaxBurstFrameRate:", v7);
  maxBurstDuration = self->_maxBurstDuration;
  objc_msgSend(v5, "setMaxBurstDuration:", &maxBurstDuration);
  objc_msgSend(v5, "setGaussianPyramidOctavesCount:", self->_gaussianPyramidOctavesCount);
  *(float *)&v8 = self->_gaussianPyramidBaseOctaveDownscalingFactor;
  objc_msgSend(v5, "setGaussianPyramidBaseOctaveDownscalingFactor:", v8);
  objc_msgSend(v5, "setMaxKeypointsCount:", self->_maxKeypointsCount);
  *(float *)&v9 = self->_keypointDetectionThreshold;
  objc_msgSend(v5, "setKeypointDetectionThreshold:", v9);
  objc_msgSend(v5, "setFeatureBinningEnabled:", self->_featureBinningEnabled);
  objc_msgSend(v5, "setFeatureOrientationAssignmentEnabled:", self->_featureOrientationAssignmentEnabled);
  objc_msgSend(v5, "setDynamicThresholdingEnabled:", self->_dynamicThresholdingEnabled);
  objc_msgSend(v5, "setKeypointDetectionFlowType:", self->_keypointDetectionFlowType);
  objc_msgSend(v5, "setSubPixelThreshold:", self->_subPixelThreshold);
  objc_msgSend(v5, "setFeatureMatchingEnabled:", self->_featureMatchingEnabled);
  objc_msgSend(v5, "setFeatureMatchingDescriptorSize:", self->_featureMatchingDescriptorSize);
  *(float *)&v10 = self->_orientationDistanceThreshold;
  objc_msgSend(v5, "setOrientationDistanceThreshold:", v10);
  *(float *)&v11 = self->_sigmaDistanceThreshold;
  objc_msgSend(v5, "setSigmaDistanceThreshold:", v11);
  *(float *)&v12 = self->_squareDistanceDisparityFraction;
  objc_msgSend(v5, "setSquareDistanceDisparityFraction:", v12);
  objc_msgSend(v5, "setHammingDistanceThreshold:", self->_hammingDistanceThreshold);
  v13 = (void *)-[NSData copyWithZone:](self->_laccConfigAndMetadata, "copyWithZone:", a3);
  objc_msgSend(v5, "setLaccConfigAndMetadata:", v13);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigCaptureVisionDataSinkConfiguration;
  v5 = -[FigCaptureSinkConfiguration isEqual:](&v7, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      LOBYTE(v5) = -[NSDictionary isEqual:](-[FigCaptureVisionDataSinkConfiguration embeddedCaptureDeviceConfiguration](self, "embeddedCaptureDeviceConfiguration"), "isEqual:", objc_msgSend(a3, "embeddedCaptureDeviceConfiguration"));
    else
      LOBYTE(v5) = 0;
  }
  return v5;
}

- (int)sinkType
{
  return 13;
}

- (NSDictionary)embeddedCaptureDeviceConfiguration
{
  const __CFAllocator *v3;
  const __CFDictionary *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSData *laccConfigAndMetadata;
  $95D729B680665BEAEFA1D6FCA8238556 maxBurstDuration;
  _QWORD v19[18];
  _QWORD v20[19];

  v20[18] = *MEMORY[0x1E0C80C00];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  maxBurstDuration = self->_maxBurstDuration;
  v4 = CMTimeCopyAsDictionary((CMTime *)&maxBurstDuration, v3);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19[0] = *MEMORY[0x1E0D080F8];
  *(float *)&v6 = self->_maxFrameRate;
  v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v19[1] = *MEMORY[0x1E0D080F0];
  *(float *)&v7 = self->_maxBurstFrameRate;
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v9 = *MEMORY[0x1E0D080E8];
  v20[1] = v8;
  v20[2] = v4;
  v10 = *MEMORY[0x1E0D080C0];
  v19[2] = v9;
  v19[3] = v10;
  v20[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_gaussianPyramidOctavesCount);
  v19[4] = *MEMORY[0x1E0D080B8];
  *(float *)&v11 = self->_gaussianPyramidBaseOctaveDownscalingFactor;
  v20[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v19[5] = *MEMORY[0x1E0D08100];
  v20[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxKeypointsCount);
  v19[6] = *MEMORY[0x1E0D080D8];
  *(float *)&v12 = self->_keypointDetectionThreshold;
  v20[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v19[7] = *MEMORY[0x1E0D08098];
  v20[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_featureBinningEnabled);
  v19[8] = *MEMORY[0x1E0D080B0];
  v20[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_featureOrientationAssignmentEnabled);
  v19[9] = *MEMORY[0x1E0D08090];
  v20[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dynamicThresholdingEnabled);
  v19[10] = *MEMORY[0x1E0D080D0];
  v20[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_keypointDetectionFlowType);
  v19[11] = *MEMORY[0x1E0D08128];
  v20[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_subPixelThreshold);
  v19[12] = *MEMORY[0x1E0D080A8];
  v20[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_featureMatchingEnabled);
  v19[13] = *MEMORY[0x1E0D080A0];
  v20[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_featureMatchingDescriptorSize);
  v19[14] = *MEMORY[0x1E0D08108];
  *(float *)&v13 = self->_orientationDistanceThreshold;
  v20[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v19[15] = *MEMORY[0x1E0D08118];
  *(float *)&v14 = self->_sigmaDistanceThreshold;
  v20[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v19[16] = *MEMORY[0x1E0D08120];
  *(float *)&v15 = self->_squareDistanceDisparityFraction;
  v20[16] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v19[17] = *MEMORY[0x1E0D080C8];
  v20[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_hammingDistanceThreshold);
  objc_msgSend(v5, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 18));
  laccConfigAndMetadata = self->_laccConfigAndMetadata;
  if (laccConfigAndMetadata)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", laccConfigAndMetadata, *MEMORY[0x1E0D080E0]);
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v5);
}

- (float)maxFrameRate
{
  return self->_maxFrameRate;
}

- (void)setMaxFrameRate:(float)a3
{
  self->_maxFrameRate = a3;
}

- (float)maxBurstFrameRate
{
  return self->_maxBurstFrameRate;
}

- (void)setMaxBurstFrameRate:(float)a3
{
  self->_maxBurstFrameRate = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxBurstDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void)setMaxBurstDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_maxBurstDuration.value = *(_OWORD *)&a3->var0;
  self->_maxBurstDuration.epoch = var3;
}

- (unsigned)gaussianPyramidOctavesCount
{
  return self->_gaussianPyramidOctavesCount;
}

- (void)setGaussianPyramidOctavesCount:(unsigned int)a3
{
  self->_gaussianPyramidOctavesCount = a3;
}

- (float)gaussianPyramidBaseOctaveDownscalingFactor
{
  return self->_gaussianPyramidBaseOctaveDownscalingFactor;
}

- (void)setGaussianPyramidBaseOctaveDownscalingFactor:(float)a3
{
  self->_gaussianPyramidBaseOctaveDownscalingFactor = a3;
}

- (unsigned)maxKeypointsCount
{
  return self->_maxKeypointsCount;
}

- (void)setMaxKeypointsCount:(unsigned int)a3
{
  self->_maxKeypointsCount = a3;
}

- (float)keypointDetectionThreshold
{
  return self->_keypointDetectionThreshold;
}

- (void)setKeypointDetectionThreshold:(float)a3
{
  self->_keypointDetectionThreshold = a3;
}

- (BOOL)featureBinningEnabled
{
  return self->_featureBinningEnabled;
}

- (void)setFeatureBinningEnabled:(BOOL)a3
{
  self->_featureBinningEnabled = a3;
}

- (BOOL)featureOrientationAssignmentEnabled
{
  return self->_featureOrientationAssignmentEnabled;
}

- (void)setFeatureOrientationAssignmentEnabled:(BOOL)a3
{
  self->_featureOrientationAssignmentEnabled = a3;
}

- (BOOL)isDynamicThresholdingEnabled
{
  return self->_dynamicThresholdingEnabled;
}

- (void)setDynamicThresholdingEnabled:(BOOL)a3
{
  self->_dynamicThresholdingEnabled = a3;
}

- (unsigned)keypointDetectionFlowType
{
  return self->_keypointDetectionFlowType;
}

- (void)setKeypointDetectionFlowType:(unsigned int)a3
{
  self->_keypointDetectionFlowType = a3;
}

- (unint64_t)subPixelThreshold
{
  return self->_subPixelThreshold;
}

- (void)setSubPixelThreshold:(unint64_t)a3
{
  self->_subPixelThreshold = a3;
}

- (BOOL)isFeatureMatchingEnabled
{
  return self->_featureMatchingEnabled;
}

- (void)setFeatureMatchingEnabled:(BOOL)a3
{
  self->_featureMatchingEnabled = a3;
}

- (int)featureMatchingDescriptorSize
{
  return self->_featureMatchingDescriptorSize;
}

- (void)setFeatureMatchingDescriptorSize:(int)a3
{
  self->_featureMatchingDescriptorSize = a3;
}

- (float)orientationDistanceThreshold
{
  return self->_orientationDistanceThreshold;
}

- (void)setOrientationDistanceThreshold:(float)a3
{
  self->_orientationDistanceThreshold = a3;
}

- (float)sigmaDistanceThreshold
{
  return self->_sigmaDistanceThreshold;
}

- (void)setSigmaDistanceThreshold:(float)a3
{
  self->_sigmaDistanceThreshold = a3;
}

- (float)squareDistanceDisparityFraction
{
  return self->_squareDistanceDisparityFraction;
}

- (void)setSquareDistanceDisparityFraction:(float)a3
{
  self->_squareDistanceDisparityFraction = a3;
}

- (unint64_t)hammingDistanceThreshold
{
  return self->_hammingDistanceThreshold;
}

- (void)setHammingDistanceThreshold:(unint64_t)a3
{
  self->_hammingDistanceThreshold = a3;
}

- (NSData)laccConfigAndMetadata
{
  return self->_laccConfigAndMetadata;
}

- (void)setLaccConfigAndMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
