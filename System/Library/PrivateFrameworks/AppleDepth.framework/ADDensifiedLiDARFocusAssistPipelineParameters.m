@implementation ADDensifiedLiDARFocusAssistPipelineParameters

- (ADDensifiedLiDARFocusAssistPipelineParameters)init
{
  ADDensifiedLiDARFocusAssistPipelineParameters *v2;
  uint64_t v3;
  ADJasperPointCloudFilterParameters *pointCloudFilter;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ADDensifiedLiDARFocusAssistPipelineParameters;
  v2 = -[ADPipelineParameters init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    pointCloudFilter = v2->_pointCloudFilter;
    v2->_pointCloudFilter = (ADJasperPointCloudFilterParameters *)v3;

    LODWORD(v5) = 1061997773;
    -[ADJasperPointCloudFilterParameters setConfidenceThreshold:](v2->_pointCloudFilter, "setConfidenceThreshold:", v5);
    LODWORD(v6) = 0;
    -[ADJasperPointCloudFilterParameters setMinDistance:](v2->_pointCloudFilter, "setMinDistance:", v6);
    LODWORD(v7) = 1203982336;
    -[ADJasperPointCloudFilterParameters setMaxDistance:](v2->_pointCloudFilter, "setMaxDistance:", v7);
    LODWORD(v8) = 0;
    -[ADJasperPointCloudFilterParameters setShortRangeDepthThreshold:](v2->_pointCloudFilter, "setShortRangeDepthThreshold:", v8);
    -[ADJasperPointCloudFilterParameters setEchoMode:](v2->_pointCloudFilter, "setEchoMode:", 2);
    v2->_confidenceUnits = 3;
  }
  return v2;
}

- (ADJasperPointCloudFilterParameters)pointCloudFilter
{
  return self->_pointCloudFilter;
}

- (void)setPointCloudFilter:(id)a3
{
  objc_storeStrong((id *)&self->_pointCloudFilter, a3);
}

- (unint64_t)confidenceUnits
{
  return self->_confidenceUnits;
}

- (void)setConfidenceUnits:(unint64_t)a3
{
  self->_confidenceUnits = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointCloudFilter, 0);
}

@end
