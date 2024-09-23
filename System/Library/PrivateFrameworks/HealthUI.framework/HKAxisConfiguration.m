@implementation HKAxisConfiguration

- (void)setPreferredStyle:(id)a3
{
  objc_storeStrong((id *)&self->_preferredStyle, a3);
}

- (HKAxisConfiguration)init
{
  HKAxisConfiguration *v2;
  HKAxisConfiguration *v3;
  HKAxisStyle *preferredStyle;
  NSNumber *maxLabelWidth;
  uint64_t v6;
  HKCoordinateTransform *transform;
  HKZoomScale *zoomScaleEngine;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKAxisConfiguration;
  v2 = -[HKAxisConfiguration init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    preferredStyle = v2->_preferredStyle;
    v2->_preferredStyle = 0;

    *(_OWORD *)&v3->_maxLabels = xmmword_1D7B82B30;
    maxLabelWidth = v3->_maxLabelWidth;
    v3->_maxLabelWidth = 0;

    v3->_horizontalAxisLabelSpacePadding = (NSNumber *)&unk_1E9CED698;
    v6 = objc_opt_new();
    transform = v3->_transform;
    v3->_transform = (HKCoordinateTransform *)v6;

    zoomScaleEngine = v3->_zoomScaleEngine;
    v3->_zoomScaleEngine = 0;

    objc_storeWeak((id *)&v3->_labelDataSource, 0);
    *(_WORD *)&v3->_overrideNoTopBaseline = 0;
  }
  return v3;
}

- (HKZoomScale)zoomScaleEngine
{
  return self->_zoomScaleEngine;
}

- (HKCoordinateTransform)transform
{
  return self->_transform;
}

- (void)setZoomScaleEngine:(id)a3
{
  objc_storeStrong((id *)&self->_zoomScaleEngine, a3);
}

- (HKAxisStyle)preferredStyle
{
  return self->_preferredStyle;
}

- (BOOL)overrideNoTopBaseline
{
  return self->_overrideNoTopBaseline;
}

- (int64_t)minLabels
{
  return self->_minLabels;
}

- (int64_t)maxLabels
{
  return self->_maxLabels;
}

- (NSNumber)maxLabelWidth
{
  return self->_maxLabelWidth;
}

- (HKAxisLabelDataSource)labelDataSource
{
  return (HKAxisLabelDataSource *)objc_loadWeakRetained((id *)&self->_labelDataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_labelDataSource);
  objc_storeStrong((id *)&self->_zoomScaleEngine, 0);
  objc_storeStrong((id *)&self->_transform, 0);
  objc_storeStrong((id *)&self->_maxLabelWidth, 0);
  objc_storeStrong((id *)&self->_preferredStyle, 0);
}

- (void)applyOverridesFromAxisConfiguration:(id)a3
{
  HKAxisConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  id v33;

  v33 = a3;
  v4 = objc_alloc_init(HKAxisConfiguration);
  objc_msgSend(v33, "preferredStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisConfiguration preferredStyle](v4, "preferredStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_msgSend(v33, "preferredStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisConfiguration setPreferredStyle:](self, "setPreferredStyle:", v7);

  }
  v8 = objc_msgSend(v33, "maxLabels");
  if (v8 != -[HKAxisConfiguration maxLabels](v4, "maxLabels"))
    -[HKAxisConfiguration setMaxLabels:](self, "setMaxLabels:", objc_msgSend(v33, "maxLabels"));
  v9 = objc_msgSend(v33, "minLabels");
  if (v9 != -[HKAxisConfiguration minLabels](v4, "minLabels"))
    -[HKAxisConfiguration setMinLabels:](self, "setMinLabels:", objc_msgSend(v33, "minLabels"));
  objc_msgSend(v33, "maxLabelWidth");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisConfiguration maxLabelWidth](v4, "maxLabelWidth");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10 == (void *)v11)
  {

LABEL_14:
    goto LABEL_15;
  }
  v12 = (void *)v11;
  -[HKAxisConfiguration maxLabelWidth](v4, "maxLabelWidth");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

    goto LABEL_13;
  }
  v14 = (void *)v13;
  objc_msgSend(v33, "maxLabelWidth");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisConfiguration maxLabelWidth](v4, "maxLabelWidth");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if ((v17 & 1) == 0)
  {
LABEL_13:
    objc_msgSend(v33, "maxLabelWidth");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisConfiguration setMaxLabelWidth:](self, "setMaxLabelWidth:", v10);
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(v33, "horizontalAxisLabelSpacePadding");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisConfiguration horizontalAxisLabelSpacePadding](v4, "horizontalAxisLabelSpacePadding");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 != v19)
  {
    objc_msgSend(v33, "horizontalAxisLabelSpacePadding");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisConfiguration setHorizontalAxisLabelSpacePadding:](self, "setHorizontalAxisLabelSpacePadding:", v20);

  }
  objc_msgSend(v33, "transform");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisConfiguration transform](v4, "transform");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "isEqual:", v22);

  if ((v23 & 1) == 0)
  {
    objc_msgSend(v33, "transform");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisConfiguration setTransform:](self, "setTransform:", v24);

  }
  objc_msgSend(v33, "zoomScaleEngine");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisConfiguration zoomScaleEngine](v4, "zoomScaleEngine");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 != v26)
  {
    objc_msgSend(v33, "zoomScaleEngine");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisConfiguration setZoomScaleEngine:](self, "setZoomScaleEngine:", v27);

  }
  objc_msgSend(v33, "labelDataSource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisConfiguration labelDataSource](v4, "labelDataSource");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28 != v29)
  {
    objc_msgSend(v33, "labelDataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisConfiguration setLabelDataSource:](self, "setLabelDataSource:", v30);

  }
  v31 = objc_msgSend(v33, "overrideNoTopBaseline");
  if (v31 != -[HKAxisConfiguration overrideNoTopBaseline](v4, "overrideNoTopBaseline"))
    -[HKAxisConfiguration setOverrideNoTopBaseline:](self, "setOverrideNoTopBaseline:", objc_msgSend(v33, "overrideNoTopBaseline"));
  v32 = objc_msgSend(v33, "axisAnnotationsExcludeInterstitialAxisLabels");
  if (v32 != -[HKAxisConfiguration axisAnnotationsExcludeInterstitialAxisLabels](v4, "axisAnnotationsExcludeInterstitialAxisLabels"))-[HKAxisConfiguration setAxisAnnotationsExcludeInterstitialAxisLabels:](self, "setAxisAnnotationsExcludeInterstitialAxisLabels:", objc_msgSend(v33, "axisAnnotationsExcludeInterstitialAxisLabels"));

}

- (void)setMaxLabels:(int64_t)a3
{
  self->_maxLabels = a3;
}

- (void)setMinLabels:(int64_t)a3
{
  self->_minLabels = a3;
}

- (NSNumber)horizontalAxisLabelSpacePadding
{
  return self->_horizontalAxisLabelSpacePadding;
}

- (void)setHorizontalAxisLabelSpacePadding:(id)a3
{
  self->_horizontalAxisLabelSpacePadding = (NSNumber *)a3;
}

- (void)setMaxLabelWidth:(id)a3
{
  objc_storeStrong((id *)&self->_maxLabelWidth, a3);
}

- (void)setTransform:(id)a3
{
  objc_storeStrong((id *)&self->_transform, a3);
}

- (void)setLabelDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_labelDataSource, a3);
}

- (void)setOverrideNoTopBaseline:(BOOL)a3
{
  self->_overrideNoTopBaseline = a3;
}

- (BOOL)axisAnnotationsExcludeInterstitialAxisLabels
{
  return self->_axisAnnotationsExcludeInterstitialAxisLabels;
}

- (void)setAxisAnnotationsExcludeInterstitialAxisLabels:(BOOL)a3
{
  self->_axisAnnotationsExcludeInterstitialAxisLabels = a3;
}

@end
