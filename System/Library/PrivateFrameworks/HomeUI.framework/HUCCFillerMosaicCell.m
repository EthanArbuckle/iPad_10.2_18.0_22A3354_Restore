@implementation HUCCFillerMosaicCell

- (void)layoutSublayersOfLayer:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;

  -[HUCCFillerMosaicCell fakeCellLayer](self, "fakeCellLayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCFillerMosaicCell setFakeCellLayer:](self, "setFakeCellLayer:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    -[HUCCFillerMosaicCell fakeCellLayer](self, "fakeCellLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[HUCCFillerMosaicCell fakeCellLayer](self, "fakeCellLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 1025758986;
    objc_msgSend(v9, "setOpacity:", v10);

    CCUICompactModuleContinuousCornerRadius();
    v12 = v11;
    -[HUCCFillerMosaicCell fakeCellLayer](self, "fakeCellLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", v12);

    -[HUCCFillerMosaicCell layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCFillerMosaicCell fakeCellLayer](self, "fakeCellLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", v15);

  }
  -[HUCCFillerMosaicCell layer](self, "layer");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[HUCCFillerMosaicCell fakeCellLayer](self, "fakeCellLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

}

- (CALayer)fakeCellLayer
{
  return self->_fakeCellLayer;
}

- (void)setFakeCellLayer:(id)a3
{
  objc_storeStrong((id *)&self->_fakeCellLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeCellLayer, 0);
}

@end
