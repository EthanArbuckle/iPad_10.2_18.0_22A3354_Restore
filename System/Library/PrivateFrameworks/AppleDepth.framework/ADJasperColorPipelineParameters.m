@implementation ADJasperColorPipelineParameters

- (id)initForDevice:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ADJasperColorPipelineParameters;
  v5 = -[ADPipelineParameters initForDevice:](&v21, sel_initForDevice_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    v7 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v6;

    LODWORD(v8) = 1063675494;
    objc_msgSend(*((id *)v5 + 5), "setConfidenceThreshold:", v8);
    objc_msgSend(*((id *)v5 + 5), "setEchoMode:", 2);
    *((_QWORD *)v5 + 7) = 0;
    *((_DWORD *)v5 + 6) = 2143289344;
    *((_DWORD *)v5 + 7) = 2143289344;
    v9 = objc_opt_new();
    v10 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v9;

    objc_msgSend(*((id *)v5 + 6), "setAggregationSize:", 4);
    objc_msgSend(*((id *)v5 + 6), "setMaxPointCloudAge:", 0.5);
    *((_DWORD *)v5 + 8) = 1045220557;
    v11 = +[ADDeviceConfiguration getLidarType:](ADDeviceConfiguration, "getLidarType:", v4);
    v13 = (void *)*((_QWORD *)v5 + 5);
    if (v11 == 2)
    {
      LODWORD(v12) = 1176256512;
      objc_msgSend(v13, "setMaxDistance:", v12);
      LODWORD(v14) = 1120403456;
      objc_msgSend(*((id *)v5 + 5), "setMinDistance:", v14);
      LODWORD(v15) = 1120403456;
      objc_msgSend(*((id *)v5 + 5), "setShortRangeDepthThreshold:", v15);
      v17 = 0.9;
    }
    else
    {
      LODWORD(v12) = 1167867904;
      objc_msgSend(v13, "setMaxDistance:", v12);
      LODWORD(v18) = 1120403456;
      objc_msgSend(*((id *)v5 + 5), "setMinDistance:", v18);
      v17 = 0.75;
      LODWORD(v19) = 1133903872;
      objc_msgSend(*((id *)v5 + 5), "setShortRangeDepthThreshold:", v19);
    }
    *(float *)&v16 = v17;
    objc_msgSend(*((id *)v5 + 5), "setShortRangeConfidenceThreshold:", v16);
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

- (ADAggregationParameters)aggregationParameters
{
  return self->_aggregationParameters;
}

- (void)setAggregationParameters:(id)a3
{
  objc_storeStrong((id *)&self->_aggregationParameters, a3);
}

- (unint64_t)confidenceUnits
{
  return self->_confidenceUnits;
}

- (void)setConfidenceUnits:(unint64_t)a3
{
  self->_confidenceUnits = a3;
}

- (float)confidenceBucketingLowThreshold
{
  return self->_confidenceBucketingLowThreshold;
}

- (void)setConfidenceBucketingLowThreshold:(float)a3
{
  self->_confidenceBucketingLowThreshold = a3;
}

- (float)confidenceBucketingHighThreshold
{
  return self->_confidenceBucketingHighThreshold;
}

- (void)setConfidenceBucketingHighThreshold:(float)a3
{
  self->_confidenceBucketingHighThreshold = a3;
}

- (ADConfidenceLevelRanges)confidenceLevelRanges
{
  return self->_confidenceLevelRanges;
}

- (void)setConfidenceLevelRanges:(id)a3
{
  objc_storeStrong((id *)&self->_confidenceLevelRanges, a3);
}

- (float)defaultAlphaForDepthWarping
{
  return self->_defaultAlphaForDepthWarping;
}

- (void)setDefaultAlphaForDepthWarping:(float)a3
{
  self->_defaultAlphaForDepthWarping = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceLevelRanges, 0);
  objc_storeStrong((id *)&self->_aggregationParameters, 0);
  objc_storeStrong((id *)&self->_pointCloudFilter, 0);
}

@end
