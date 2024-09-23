@implementation CAMPreviewAlignmentGuide

- (CAMPreviewAlignmentGuide)initWithFrame:(CGRect)a3
{
  CAMPreviewAlignmentGuide *v3;
  CAMPreviewAlignmentGuide *v4;
  CAMPreviewAlignmentModel *v5;
  CAMPreviewAlignmentModel *alignmentModel;
  CAMLevelCrosshair *v7;
  CAMLevelCrosshair *guidanceCrosshair;
  CAMLevelCrosshair *v9;
  CAMLevelCrosshair *targetCrosshair;
  void *v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  _OWORD v17[5];
  uint64_t v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CAMPreviewAlignmentGuide;
  v3 = -[CAMPreviewAlignmentGuide initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMPreviewAlignmentGuide setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = objc_alloc_init(CAMPreviewAlignmentModel);
    alignmentModel = v4->_alignmentModel;
    v4->_alignmentModel = v5;

    -[CAMPreviewAlignmentModel setObserver:](v4->_alignmentModel, "setObserver:", v4);
    v7 = objc_alloc_init(CAMLevelCrosshair);
    guidanceCrosshair = v4->__guidanceCrosshair;
    v4->__guidanceCrosshair = v7;

    -[CAMLevelCrosshair setHighlighted:](v4->__guidanceCrosshair, "setHighlighted:", 1);
    -[CAMPreviewAlignmentGuide addSubview:](v4, "addSubview:", v4->__guidanceCrosshair);
    v9 = objc_alloc_init(CAMLevelCrosshair);
    targetCrosshair = v4->__targetCrosshair;
    v4->__targetCrosshair = v9;

    -[CAMPreviewAlignmentGuide addSubview:](v4, "addSubview:", v4->__targetCrosshair);
    -[CAMLevelCrosshair layer](v4->__targetCrosshair, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v17[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v17[3] = v12;
    v17[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v13 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
    v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v17[0] = *MEMORY[0x1E0CD2610];
    v17[1] = v14;
    v18 = v13;
    v19 = 0xBF7B4E81B4E81B4FLL;
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v21 = v15;
    objc_msgSend(v11, "setSublayerTransform:", v17);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v13[8];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  -[CAMPreviewAlignmentGuide bounds](self, "bounds");
  -[CAMPreviewAlignmentGuide alignmentModel](self, "alignmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  if (v3)
    objc_msgSend(v3, "alignmentTransform");
  v5 = objc_msgSend(v4, "isAligned");
  UIRectCenteredIntegralRectScale();
  UIRectGetCenter();
  v7 = v6;
  v9 = v8;
  -[CAMPreviewAlignmentGuide _guidanceCrosshair](self, "_guidanceCrosshair", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setBounds:", 0.0, 0.0, 60.0, 60.0);
  objc_msgSend(v11, "setPosition:", v7, v9);
  v13[4] = v18;
  v13[5] = v19;
  v13[6] = v20;
  v13[7] = v21;
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  v13[3] = v17;
  objc_msgSend(v11, "setTransform:", v13);
  -[CAMPreviewAlignmentGuide _targetCrosshair](self, "_targetCrosshair");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, 60.0, 60.0);
  objc_msgSend(v12, "setCenter:", v7, v9);
  objc_msgSend(v12, "setHighlighted:", v5);

}

- (void)previewAlignmentModelDidChangeOpacity:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "opacity");
  v6 = v5;
  -[CAMPreviewAlignmentGuide _guidanceCrosshair](self, "_guidanceCrosshair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  objc_msgSend(v4, "opacity");
  v9 = v8;

  -[CAMPreviewAlignmentGuide _targetCrosshair](self, "_targetCrosshair");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v9);

}

- (CAMPreviewAlignmentModel)alignmentModel
{
  return self->_alignmentModel;
}

- (CAMLevelCrosshair)_targetCrosshair
{
  return self->__targetCrosshair;
}

- (CAMLevelCrosshair)_guidanceCrosshair
{
  return self->__guidanceCrosshair;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__guidanceCrosshair, 0);
  objc_storeStrong((id *)&self->__targetCrosshair, 0);
  objc_storeStrong((id *)&self->_alignmentModel, 0);
}

@end
