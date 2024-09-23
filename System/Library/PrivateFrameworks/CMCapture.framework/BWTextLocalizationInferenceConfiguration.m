@implementation BWTextLocalizationInferenceConfiguration

- ($2ACC23B9A21F50F5CC728381CA870116)version
{
  return ($2ACC23B9A21F50F5CC728381CA870116)(*(unsigned int *)&self->_version.major | ((unint64_t)self->_version.patch << 32));
}

+ (id)configuration
{
  if (BWInferenceTextLocalizationCurrentVersion_onceToken != -1)
    dispatch_once(&BWInferenceTextLocalizationCurrentVersion_onceToken, &__block_literal_global_85);
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInferenceType:version:", 116, BWInferenceTextLocalizationCurrentVersion_version | ((unint64_t)(unsigned __int16)word_1EE6BF56C << 32));
}

- (BWTextLocalizationInferenceConfiguration)initWithInferenceType:(int)a3 version:(id)a4
{
  uint64_t v4;
  BWTextLocalizationInferenceConfiguration *v5;
  BWTextLocalizationInferenceConfiguration *v6;
  float v7;
  uint64_t v8;
  int v9;
  _BOOL8 v10;
  double v11;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _OWORD v21[2];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  objc_super v26;

  v4 = *(_QWORD *)&a4.var0;
  v26.receiver = self;
  v26.super_class = (Class)BWTextLocalizationInferenceConfiguration;
  v5 = -[BWInferenceConfiguration initWithInferenceType:](&v26, sel_initWithInferenceType_, *(_QWORD *)&a3);
  v6 = v5;
  if (v5)
  {
    *(_DWORD *)&v5->_version.major = v4;
    v5->_version.patch = WORD2(v4);
    v25 = 0;
    v23 = 0u;
    v24 = 0u;
    v7 = (float)(int)((unint64_t)FigCaptureMainScreenDimensions(1) >> 32) * 1.2;
    v8 = (unsigned __int16)v4;
    v9 = WORD1(v4);
    if (WORD1(v4))
      v10 = 0;
    else
      v10 = (unsigned __int16)v4 == 1;
    if (v10)
    {
      BWSmartCameraSceneInitialize((uint64_t)&v23, 1, 2, 0, (uint64_t)"Text Localizer", 0.3, 0.09, 0.75);
      v12 = 17.0;
      v13 = 22.0;
      v14 = *(float *)"ff&?";
    }
    else if (v8 == 1 && v9 == 2)
    {
      BWSmartCameraSceneInitialize((uint64_t)&v23, 1, 2, 0, (uint64_t)"Text Localizer", 0.36, 0.16, 0.75);
      v12 = 17.0;
      v13 = 22.0;
      v14 = *(float *)"333?cnpm";
    }
    else if (v8 == 1 && v9 == 5)
    {
      v14 = 0.75;
      BWSmartCameraSceneInitialize((uint64_t)&v23, 1, 2, 0, (uint64_t)"Text Localizer", 0.3, 0.09, 0.75);
      v12 = 17.0;
      v13 = 22.0;
    }
    else
    {
      BWSmartCameraSceneInitialize((uint64_t)&v23, 1, 2, 0, (uint64_t)"Text Localizer", 0.29, 0.09, 0.75);
      v12 = 10.0;
      v13 = 12.0;
      v14 = 0.6;
    }
    LODWORD(v11) = 1045220557;
    -[BWBoundingBoxInferenceConfiguration setTrackingThreshold:](v6, "setTrackingThreshold:", v11);
    *(float *)&v15 = v14;
    -[BWBoundingBoxInferenceConfiguration setMaxMatchCost:](v6, "setMaxMatchCost:", v15);
    v21[0] = v23;
    v21[1] = v24;
    v22 = v25;
    -[BWBoundingBoxInferenceConfiguration setConfidenceFilterSettings:](v6, "setConfidenceFilterSettings:", v21);
    -[BWBoundingBoxInferenceConfiguration setInteriorSuppression:](v6, "setInteriorSuppression:", v10);
    LODWORD(v16) = 1022739087;
    -[BWBoundingBoxInferenceConfiguration setInteriorSuppressionPadding:](v6, "setInteriorSuppressionPadding:", v16);
    LODWORD(v17) = 1.0;
    -[BWBoundingBoxInferenceConfiguration setAngularOffsetExponentialSmoothing:](v6, "setAngularOffsetExponentialSmoothing:", v17);
    *(float *)&v18 = (float)(v13 / v7) * 100.0;
    -[BWBoundingBoxInferenceConfiguration setFontSizeStartReportingThreshold:](v6, "setFontSizeStartReportingThreshold:", v18);
    *(float *)&v19 = (float)(v12 / v7) * 100.0;
    -[BWBoundingBoxInferenceConfiguration setFontSizeStopReportingThreshold:](v6, "setFontSizeStopReportingThreshold:", v19);
  }
  return v6;
}

- (void)setVersion:(id)a3
{
  self->_version = ($1D54FF943ED39CD641379A9C294BD6F7)a3;
}

@end
