@implementation HUCCFakeMosaicGridView

- (HUCCFakeMosaicGridView)initWithFrame:(CGRect)a3
{
  HUCCFakeMosaicGridView *v3;
  uint64_t v4;
  NSMutableArray *fakeCellLayers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCCFakeMosaicGridView;
  v3 = -[HUCCFakeMosaicGridView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    fakeCellLayers = v3->_fakeCellLayers;
    v3->_fakeCellLayers = (NSMutableArray *)v4;

    -[HUCCFakeMosaicGridView setNeedsDisplayOnBoundsChange:](v3, "setNeedsDisplayOnBoundsChange:", 1);
  }
  return v3;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  double v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;
  CGRect v57;
  CGRect v58;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[HUCCFakeMosaicGridView contentBounds](self, "contentBounds");
  v58.origin.x = v13;
  v58.origin.y = v14;
  v58.size.width = v15;
  v58.size.height = v16;
  v57.origin.x = v6;
  v57.origin.y = v8;
  v57.size.width = v10;
  v57.size.height = v12;
  if (CGRectEqualToRect(v57, v58))
    goto LABEL_23;
  objc_msgSend(v4, "bounds");
  -[HUCCFakeMosaicGridView setContentBounds:](self, "setContentBounds:");
  -[HUCCFakeMosaicGridView frameDelegate](self, "frameDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HUCCFakeMosaicGridView frameDelegate](self, "frameDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentMosaicFrames");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = v19;
      if ((unint64_t)objc_msgSend(v19, "count") > 1)
        goto LABEL_8;
    }
  }
  else
  {
    v19 = 0;
  }
  -[HUCCFakeMosaicGridView mosaicLayoutGeometry](self, "mosaicLayoutGeometry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCCFakeMosaicGridView contentBounds](self, "contentBounds");
  +[HUMosaicLayoutHelper fakeFramesForGeometry:inBounds:](HUMosaicLayoutHelper, "fakeFramesForGeometry:inBounds:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[HUCCFakeMosaicGridView fakeCellLayers](self, "fakeCellLayers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v51;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v51 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v26++), "removeFromSuperlayer");
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v24);
  }

  -[HUCCFakeMosaicGridView fakeCellLayers](self, "fakeCellLayers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeAllObjects");

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v28 = v20;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v47;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v47 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v32), "CGRectValue", (_QWORD)v46);
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
        v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v41, "setBackgroundColor:", objc_msgSend(v42, "CGColor"));

        CCUICompactModuleContinuousCornerRadius();
        objc_msgSend(v41, "setCornerRadius:");
        LODWORD(v43) = 1025758986;
        objc_msgSend(v41, "setOpacity:", v43);
        objc_msgSend(v41, "setFrame:", v34, v36, v38, v40);
        -[HUCCFakeMosaicGridView layer](self, "layer");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addSublayer:", v41);

        -[HUCCFakeMosaicGridView fakeCellLayers](self, "fakeCellLayers");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addObject:", v41);

        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v30);
  }

LABEL_23:
}

- (HUProvidesMosaicFrames)frameDelegate
{
  return (HUProvidesMosaicFrames *)objc_loadWeakRetained((id *)&self->_frameDelegate);
}

- (void)setFrameDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_frameDelegate, a3);
}

- (HUMosaicLayoutGeometry)mosaicLayoutGeometry
{
  return self->_mosaicLayoutGeometry;
}

- (void)setMosaicLayoutGeometry:(id)a3
{
  objc_storeStrong((id *)&self->_mosaicLayoutGeometry, a3);
}

- (NSMutableArray)fakeCellLayers
{
  return self->_fakeCellLayers;
}

- (void)setFakeCellLayers:(id)a3
{
  objc_storeStrong((id *)&self->_fakeCellLayers, a3);
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeCellLayers, 0);
  objc_storeStrong((id *)&self->_mosaicLayoutGeometry, 0);
  objc_destroyWeak((id *)&self->_frameDelegate);
}

@end
