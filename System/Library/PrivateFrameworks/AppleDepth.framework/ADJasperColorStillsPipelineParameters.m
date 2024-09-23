@implementation ADJasperColorStillsPipelineParameters

- (ADJasperColorStillsPipelineParameters)init
{
  return (ADJasperColorStillsPipelineParameters *)-[ADJasperColorStillsPipelineParameters initForDevice:](self, "initForDevice:", 0);
}

- (id)initForDevice:(id)a3
{
  id v4;
  id *v5;
  id *v6;
  id *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  id *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  id v29;
  double v30;
  double v31;
  double v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ADJasperColorStillsPipelineParameters;
  v5 = -[ADPipelineParameters initForDevice:](&v34, sel_initForDevice_, v4);
  v6 = v5;
  v7 = v5;
  if (v5)
  {
    objc_msgSend(v5, "deviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[ADDeviceConfiguration getLidarType:](ADDeviceConfiguration, "getLidarType:", v8);

    v10 = objc_opt_new();
    v11 = v7[3];
    v7[3] = (id)v10;

    LODWORD(v12) = 1063675494;
    objc_msgSend(v7[3], "setConfidenceThreshold:", v12);
    if (v9 == 2)
    {
      objc_msgSend(v7[3], "setEchoMode:", 4);
      LODWORD(v13) = 1176256512;
      objc_msgSend(v7[3], "setMaxDistance:", v13);
      LODWORD(v14) = 1114636288;
      objc_msgSend(v7[3], "setMinDistance:", v14);
      LODWORD(v15) = 0;
      objc_msgSend(v7[3], "setShortRangeDepthThreshold:", v15);
      LODWORD(v16) = 0;
      objc_msgSend(v7[3], "setShortRangeConfidenceThreshold:", v16);
      v17 = objc_opt_new();
      v18 = v6 + 4;
      v19 = *v18;
      *v18 = (id)v17;

      LODWORD(v20) = 1061997773;
      objc_msgSend(*v18, "setConfidenceThreshold:", v20);
      objc_msgSend(*v18, "setEchoMode:", 2);
      LODWORD(v21) = 1181376512;
      objc_msgSend(*v18, "setMaxDistance:", v21);
      LODWORD(v22) = 1137180672;
    }
    else
    {
      objc_msgSend(v7[3], "setEchoMode:", 2);
      LODWORD(v24) = 1167867904;
      objc_msgSend(v7[3], "setMaxDistance:", v24);
      LODWORD(v25) = 1120403456;
      objc_msgSend(v7[3], "setMinDistance:", v25);
      LODWORD(v26) = 1133903872;
      objc_msgSend(v7[3], "setShortRangeDepthThreshold:", v26);
      LODWORD(v27) = 0.75;
      objc_msgSend(v7[3], "setShortRangeConfidenceThreshold:", v27);
      v28 = objc_opt_new();
      v18 = v6 + 4;
      v29 = *v18;
      *v18 = (id)v28;

      LODWORD(v30) = 1062836634;
      objc_msgSend(*v18, "setConfidenceThreshold:", v30);
      objc_msgSend(*v18, "setEchoMode:", 4);
      LODWORD(v31) = 1167867904;
      objc_msgSend(*v18, "setMaxDistance:", v31);
      LODWORD(v22) = 1128792064;
    }
    objc_msgSend(*v18, "setMinDistance:", v22);
    LODWORD(v23) = 0;
    objc_msgSend(*v18, "setShortRangeDepthThreshold:", v23);
    LODWORD(v32) = 0;
    objc_msgSend(*v18, "setShortRangeConfidenceThreshold:", v32);
  }

  return v7;
}

- (ADJasperPointCloudFilterParameters)pointCloudFilter
{
  return self->_pointCloudFilter;
}

- (void)setPointCloudFilter:(id)a3
{
  objc_storeStrong((id *)&self->_pointCloudFilter, a3);
}

- (ADJasperPointCloudFilterParameters)pointCloudFilterForTransformCorrection
{
  return self->_pointCloudFilterForTransformCorrection;
}

- (void)setPointCloudFilterForTransformCorrection:(id)a3
{
  objc_storeStrong((id *)&self->_pointCloudFilterForTransformCorrection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointCloudFilterForTransformCorrection, 0);
  objc_storeStrong((id *)&self->_pointCloudFilter, 0);
}

@end
