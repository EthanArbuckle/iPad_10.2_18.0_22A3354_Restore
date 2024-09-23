@implementation ADJasperColorV2PipelineParameters

- (id)initForDevice:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  objc_super v24;

  v4 = a3;
  if (!v4)
  {
    +[ADDeviceConfiguration getDeviceName](ADDeviceConfiguration, "getDeviceName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24.receiver = self;
  v24.super_class = (Class)ADJasperColorV2PipelineParameters;
  v5 = -[ADPipelineParameters initForDevice:](&v24, sel_initForDevice_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    v7 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v6;

    objc_msgSend(v5, "deviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[ADDeviceConfiguration getLidarType:](ADDeviceConfiguration, "getLidarType:", v8);

    v11 = (void *)*((_QWORD *)v5 + 6);
    if (v9 == 2)
    {
      LODWORD(v10) = 1061997773;
      objc_msgSend(v11, "setConfidenceThreshold:", v10);
      objc_msgSend(*((id *)v5 + 6), "setEchoMode:", 2);
      LODWORD(v12) = 1184645120;
      objc_msgSend(*((id *)v5 + 6), "setMaxDistance:", v12);
      LODWORD(v13) = 1114636288;
      objc_msgSend(*((id *)v5 + 6), "setMinDistance:", v13);
      LODWORD(v14) = 0;
      objc_msgSend(*((id *)v5 + 6), "setShortRangeDepthThreshold:", v14);
      LODWORD(v15) = 0;
      objc_msgSend(*((id *)v5 + 6), "setShortRangeConfidenceThreshold:", v15);
      v16 = 20.0;
      v17 = 1031127695;
    }
    else
    {
      LODWORD(v10) = 1063675494;
      objc_msgSend(v11, "setConfidenceThreshold:", v10);
      objc_msgSend(*((id *)v5 + 6), "setEchoMode:", 2);
      LODWORD(v18) = 1167867904;
      objc_msgSend(*((id *)v5 + 6), "setMaxDistance:", v18);
      LODWORD(v19) = 1143930880;
      objc_msgSend(*((id *)v5 + 6), "setMinDistance:", v19);
      LODWORD(v20) = 1133903872;
      objc_msgSend(*((id *)v5 + 6), "setShortRangeDepthThreshold:", v20);
      LODWORD(v21) = 0.75;
      objc_msgSend(*((id *)v5 + 6), "setShortRangeConfidenceThreshold:", v21);
      v16 = 10.0;
      v17 = 1060320051;
    }
    *((_DWORD *)v5 + 8) = 1;
    *((float *)v5 + 9) = v16;
    *((_DWORD *)v5 + 10) = v17;
    *((_BYTE *)v5 + 24) = 0;
    *((_DWORD *)v5 + 7) = 2143289344;
    v22 = v5;
  }

  return v5;
}

- (ADJasperPointCloudFilterParameters)pointCloudFilter
{
  return self->_pointCloudFilter;
}

- (void)setPointCloudFilter:(id)a3
{
  objc_storeStrong((id *)&self->_pointCloudFilter, a3);
}

- (float)uncertaintyThreshold
{
  return self->_uncertaintyThreshold;
}

- (void)setUncertaintyThreshold:(float)a3
{
  self->_uncertaintyThreshold = a3;
}

- (unsigned)minRequiredJasperPoints
{
  return self->_minRequiredJasperPoints;
}

- (void)setMinRequiredJasperPoints:(unsigned int)a3
{
  self->_minRequiredJasperPoints = a3;
}

- (float)maxDepthThresholdForInvalidUncertainty
{
  return self->_maxDepthThresholdForInvalidUncertainty;
}

- (void)setMaxDepthThresholdForInvalidUncertainty:(float)a3
{
  self->_maxDepthThresholdForInvalidUncertainty = a3;
}

- (float)minDepthThresholdForInvalidUncertainty
{
  return self->_minDepthThresholdForInvalidUncertainty;
}

- (void)setMinDepthThresholdForInvalidUncertainty:(float)a3
{
  self->_minDepthThresholdForInvalidUncertainty = a3;
}

- (BOOL)outputHighConfidencePixelsOnly
{
  return self->_outputHighConfidencePixelsOnly;
}

- (void)setOutputHighConfidencePixelsOnly:(BOOL)a3
{
  self->_outputHighConfidencePixelsOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointCloudFilter, 0);
}

@end
