@implementation ADJasperColorInFieldCalibrationPipelineParameters

- (id)initForDevice:(id)a3
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ADJasperColorInFieldCalibrationPipelineParameters;
  v5 = -[ADPipelineParameters initForDevice:](&v18, sel_initForDevice_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "hasPrefix:", CFSTR("N301"));
    v7 = objc_opt_new();
    v8 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v7;

    objc_msgSend(*((id *)v5 + 7), "setEchoMode:", 4);
    LODWORD(v9) = 1140457472;
    objc_msgSend(*((id *)v5 + 7), "setMinDistance:", v9);
    v10 = objc_opt_new();
    v11 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v10;

    objc_msgSend(*((id *)v5 + 8), "setMaxPointCloudAge:", 1.0);
    *((_DWORD *)v5 + 10) = 1065353216;
    *((_DWORD *)v5 + 11) = 1065353216;
    *((_BYTE *)v5 + 25) = 0;
    if (v6)
    {
      *((_BYTE *)v5 + 24) = 0;
      *((_DWORD *)v5 + 12) = 0;
      *((_DWORD *)v5 + 7) = 5;
      *((_DWORD *)v5 + 8) = 1135371878;
      *((_DWORD *)v5 + 9) = 1082130432;
      objc_msgSend(*((id *)v5 + 8), "setAggregationSize:", 4);
      LODWORD(v12) = 1062836634;
      objc_msgSend(*((id *)v5 + 7), "setConfidenceThreshold:", v12);
      LODWORD(v13) = 1167867904;
      objc_msgSend(*((id *)v5 + 7), "setMaxDistance:", v13);
      v14 = 4;
    }
    else
    {
      *((_BYTE *)v5 + 24) = +[ADDeviceConfiguration BOOLForKey:](ADDeviceConfiguration, "BOOLForKey:", kADDeviceConfigurationKeyJasperColorInFieldForceRun);
      *((_BYTE *)v5 + 25) = +[ADDeviceConfiguration BOOLForKey:](ADDeviceConfiguration, "BOOLForKey:", kADDeviceConfigurationKeyJasperColorInFieldDisableSDF);
      *((_DWORD *)v5 + 12) = 1056964608;
      *((_DWORD *)v5 + 7) = 10;
      *((_DWORD *)v5 + 8) = 1141490975;
      *((_DWORD *)v5 + 9) = 1092616192;
      objc_msgSend(*((id *)v5 + 8), "setAggregationSize:", 2);
      LODWORD(v15) = 1061997773;
      objc_msgSend(*((id *)v5 + 7), "setConfidenceThreshold:", v15);
      LODWORD(v16) = 1181376512;
      objc_msgSend(*((id *)v5 + 7), "setMaxDistance:", v16);
      v14 = 2;
    }
    objc_msgSend(*((id *)v5 + 7), "setEchoMode:", v14);
  }

  return v5;
}

- (ADJasperPointCloudFilterParameters)pointCloudFilterParameters
{
  return self->_pointCloudFilterParameters;
}

- (void)setPointCloudFilterParameters:(id)a3
{
  objc_storeStrong((id *)&self->_pointCloudFilterParameters, a3);
}

- (ADAggregationParameters)pcAggregationParameters
{
  return self->_pcAggregationParameters;
}

- (void)setPcAggregationParameters:(id)a3
{
  objc_storeStrong((id *)&self->_pcAggregationParameters, a3);
}

- (unsigned)featuresVectorAggregationSize
{
  return self->_featuresVectorAggregationSize;
}

- (void)setFeaturesVectorAggregationSize:(unsigned int)a3
{
  self->_featuresVectorAggregationSize = a3;
}

- (float)colorCameraNominalEfl
{
  return self->_colorCameraNominalEfl;
}

- (float)maxStdForValidResult
{
  return self->_maxStdForValidResult;
}

- (float)coeffX
{
  return self->_coeffX;
}

- (float)coeffY
{
  return self->_coeffY;
}

- (float)coeffZ
{
  return self->_coeffZ;
}

- (BOOL)forceRun
{
  return self->_forceRun;
}

- (void)setForceRun:(BOOL)a3
{
  self->_forceRun = a3;
}

- (BOOL)disableSDF
{
  return self->_disableSDF;
}

- (void)setDisableSDF:(BOOL)a3
{
  self->_disableSDF = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcAggregationParameters, 0);
  objc_storeStrong((id *)&self->_pointCloudFilterParameters, 0);
}

@end
