@implementation CAMLivePhotoBloomView

- (CAMLivePhotoBloomView)initWithFrame:(CGRect)a3
{
  CAMLivePhotoBloomView *v3;
  CAShapeLayer *v4;
  CAShapeLayer *outerRing;
  CAShapeLayer *v6;
  CAShapeLayer *middleRing;
  CALayer *v8;
  CALayer *innerRing;
  CALayer *v10;
  CALayer *centerRing;
  uint64_t v12;
  CALayer *ringContainer;
  void *v14;
  uint64_t v15;
  NSDictionary *layersByRing;
  CAShapeLayer *v17;
  uint64_t v18;
  NSDictionary *shapeLayersByRing;
  NSDictionary *v20;
  uint64_t v21;
  CAMLivePhotoBloomView *v22;
  NSDictionary *v23;
  CAMLivePhotoBloomView *v24;
  double v25;
  double v26;
  UIImageView *v27;
  UIImageView *defaultImageView;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, void *);
  void *v33;
  CAMLivePhotoBloomView *v34;
  _QWORD v35[4];
  CAMLivePhotoBloomView *v36;
  objc_super v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)CAMLivePhotoBloomView;
  v3 = -[CAMLivePhotoBloomView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    outerRing = v3->__outerRing;
    v3->__outerRing = v4;

    v6 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    middleRing = v3->__middleRing;
    v3->__middleRing = v6;

    v8 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    innerRing = v3->__innerRing;
    v3->__innerRing = v8;

    v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    centerRing = v3->__centerRing;
    v3->__centerRing = v10;

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v12 = objc_claimAutoreleasedReturnValue();
    ringContainer = v3->__ringContainer;
    v3->__ringContainer = (CALayer *)v12;

    -[CAMLivePhotoBloomView layer](v3, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", v3->__ringContainer);

    v40[0] = &unk_1EA3B0970;
    v41[0] = v3->__innerRing;
    v40[1] = &unk_1EA3B0988;
    v41[1] = v3->__centerRing;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v15 = objc_claimAutoreleasedReturnValue();
    layersByRing = v3->__layersByRing;
    v3->__layersByRing = (NSDictionary *)v15;

    v38[0] = &unk_1EA3B09A0;
    v17 = v3->__outerRing;
    v38[1] = &unk_1EA3B09B8;
    v39[0] = v17;
    v39[1] = v3->__middleRing;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v18 = objc_claimAutoreleasedReturnValue();
    shapeLayersByRing = v3->__shapeLayersByRing;
    v3->__shapeLayersByRing = (NSDictionary *)v18;

    v20 = v3->__layersByRing;
    v21 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __39__CAMLivePhotoBloomView_initWithFrame___block_invoke;
    v35[3] = &unk_1EA32C150;
    v22 = v3;
    v36 = v22;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v20, "enumerateKeysAndObjectsUsingBlock:", v35);
    v23 = v3->__shapeLayersByRing;
    v30 = v21;
    v31 = 3221225472;
    v32 = __39__CAMLivePhotoBloomView_initWithFrame___block_invoke_2;
    v33 = &unk_1EA32C178;
    v24 = v22;
    v34 = v24;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v23, "enumerateKeysAndObjectsUsingBlock:", &v30);
    -[CAMLivePhotoBloomView _updateRingColors](v24, "_updateRingColors", v30, v31, v32, v33);
    -[CAShapeLayer setLineDashPattern:](v3->__outerRing, "setLineDashPattern:", &unk_1EA3B3470);
    LODWORD(v25) = 0;
    -[CALayer setOpacity:](v3->__centerRing, "setOpacity:", v25);
    LODWORD(v26) = 0;
    -[CALayer setOpacity:](v3->__ringContainer, "setOpacity:", v26);
    v27 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    defaultImageView = v24->__defaultImageView;
    v24->__defaultImageView = v27;

    -[CAMLivePhotoBloomView addSubview:](v24, "addSubview:", v24->__defaultImageView);
    -[CAMLivePhotoBloomView _updateDefaultImage](v24, "_updateDefaultImage");
    -[CAMLivePhotoBloomView setUserInteractionEnabled:](v24, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
  return v3;
}

void __39__CAMLivePhotoBloomView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "_diameterForRing:", v5);
  v7 = v6;
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v7, v7);
  objc_msgSend(v8, "setCornerRadius:", v7 * 0.5);
  objc_msgSend(v8, "setBackgroundColor:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_strokeWidthForRing:", v5);
  objc_msgSend(v8, "setBorderWidth:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addSublayer:", v8);

}

void __39__CAMLivePhotoBloomView_initWithFrame___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_strokeWidthForRing:", objc_msgSend(a2, "integerValue"));
  objc_msgSend(v5, "setLineWidth:");
  objc_msgSend(v5, "setFillColor:", 0);
  objc_msgSend(v5, "setLineCap:", *MEMORY[0x1E0CD3010]);
  objc_msgSend(v5, "setLineDashPhase:", 0.166666667);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addSublayer:", v5);

}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD v27[6];
  _QWORD v28[13];

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CAMLivePhotoBloomView bounds](self, "bounds");
  v24 = v4;
  v25 = v3;
  v6 = v5;
  v8 = v7;
  UIRectGetCenter();
  v10 = v9;
  v12 = v11;
  -[CAMLivePhotoBloomView _defaultImageView](self, "_defaultImageView");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v26, "intrinsicContentSize");
  objc_msgSend(v26, "frameForAlignmentRect:", v13, v14, v15, v16);
  objc_msgSend(v26, "setBounds:", v13, v14);
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  v18 = v17;
  v20 = v19;
  objc_msgSend(v26, "setCenter:");
  -[CAMLivePhotoBloomView _shapeLayersByRing](self, "_shapeLayersByRing");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __39__CAMLivePhotoBloomView_layoutSubviews__block_invoke;
  v28[3] = &unk_1EA32C1A0;
  v28[4] = self;
  v28[5] = v10;
  v28[6] = v12;
  v28[7] = v25;
  v28[8] = v24;
  v28[9] = v6;
  v28[10] = v8;
  v28[11] = v18;
  v28[12] = v20;
  objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v28);

  -[CAMLivePhotoBloomView _layersByRing](self, "_layersByRing");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  v27[1] = 3221225472;
  v27[2] = __39__CAMLivePhotoBloomView_layoutSubviews__block_invoke_2;
  v27[3] = &__block_descriptor_48_e34_v32__0__NSNumber_8__CALayer_16_B24l;
  v27[4] = v18;
  v27[5] = v20;
  objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v27);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __39__CAMLivePhotoBloomView_layoutSubviews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setPath:", objc_msgSend(*(id *)(a1 + 32), "_pathForRing:center:", objc_msgSend(a2, "integerValue"), *(double *)(a1 + 40), *(double *)(a1 + 48)));
  objc_msgSend(v5, "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(v5, "setPosition:", *(double *)(a1 + 88), *(double *)(a1 + 96));

}

uint64_t __39__CAMLivePhotoBloomView_layoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setPosition:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)tintColorDidChange
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CAMLivePhotoBloomView _updateRingColors](self, "_updateRingColors");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CAMLivePhotoBloomView _diameterForRing:](self, "_diameterForRing:", 3);
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)animateBloom
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  CAMLivePhotoBloomView *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  _QWORD v131[3];
  _QWORD v132[2];
  _QWORD v133[3];
  _QWORD v134[3];
  _QWORD v135[4];
  _QWORD v136[3];
  _QWORD v137[3];
  _QWORD v138[2];
  _QWORD v139[3];
  _QWORD v140[3];
  _QWORD v141[3];
  _QWORD v142[3];
  _QWORD v143[2];
  _QWORD v144[3];
  _QWORD v145[3];
  _QWORD v146[5];

  v146[3] = *MEMORY[0x1E0C80C00];
  -[CAMLivePhotoBloomView layoutIfNeeded](self, "layoutIfNeeded");
  -[CAMLivePhotoBloomView _outerRing](self, "_outerRing");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLivePhotoBloomView _middleRing](self, "_middleRing");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLivePhotoBloomView _innerRing](self, "_innerRing");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLivePhotoBloomView _centerRing](self, "_centerRing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = self;
  -[CAMLivePhotoBloomView bounds](self, "bounds");
  UIRectGetCenter();
  v5 = v4;
  v7 = v6;
  LODWORD(v4) = 0;
  LODWORD(v6) = 0;
  LODWORD(v8) = 0.5;
  LODWORD(v9) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v4, v6, v8, v9);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setValues:", &unk_1EA3B3488);
  v146[0] = &unk_1EA3B09D0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.166666667);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v146[1] = v10;
  v146[2] = &unk_1EA3B09E8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setKeyTimes:", v11);

  v121 = *MEMORY[0x1E0CD2930];
  objc_msgSend(v127, "setCalculationMode:");
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 0;
  LODWORD(v14) = 0;
  LODWORD(v15) = 1.0;
  LODWORD(v16) = 1058642330;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v13, v14, v16, v15);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CAMPixelWidthForView(self) + 9.0;
  objc_msgSend(v12, "setBeginTime:", 0.233333333);
  objc_msgSend(v12, "setDuration:", 1.26666667);
  v145[0] = &unk_1EA3B09D0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.342105263);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v145[1] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.666666667);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v145[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setKeyTimes:", v20);

  v21 = (void *)MEMORY[0x1E0CB3B18];
  v22 = v3;
  v126 = v3;
  objc_msgSend(v3, "bounds");
  objc_msgSend(v21, "valueWithCGSize:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v144[0] = v25;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v17, v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v144[1] = v26;
  v27 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v125, "bounds");
  objc_msgSend(v27, "valueWithCGSize:", v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v144[2] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValues:", v31);

  v143[0] = v122;
  v143[1] = v129;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimingFunctions:", v32);

  v120 = v12;
  v33 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v33, "setKeyPath:", CFSTR("cornerRadius"));
  v34 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v22, "cornerRadius");
  objc_msgSend(v34, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v35;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17 * 0.5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v142[1] = v36;
  v37 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v125, "bounds");
  objc_msgSend(v37, "numberWithDouble:", v38 * 0.5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v142[2] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v33;
  objc_msgSend(v33, "setValues:", v40);

  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setDuration:", 1.5);
  v141[0] = v12;
  v141[1] = v127;
  v141[2] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setAnimations:", v41);

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v43) = 0.5;
  LODWORD(v44) = 0;
  LODWORD(v45) = 1.0;
  LODWORD(v46) = 1058642330;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v43, v44, v46, v45);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLivePhotoBloomView _diameterForRing:](v124, "_diameterForRing:", 2);
  v48 = v47;
  v140[0] = &unk_1EA3B09D0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.611111111);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v140[1] = v49;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.8);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v140[2] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v140, 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setKeyTimes:", v51);

  v52 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v125, "bounds");
  objc_msgSend(v52, "valueWithCGSize:", v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v139[0] = v55;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 18.0, 18.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v139[1] = v56;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v48, v48);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v139[2] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setValues:", v58);

  v138[0] = v117;
  v138[1] = v129;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTimingFunctions:", v59);

  v60 = v42;
  v116 = v42;
  v61 = (void *)objc_msgSend(v42, "copy");
  objc_msgSend(v61, "setKeyPath:", CFSTR("cornerRadius"));
  v62 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v125, "cornerRadius");
  objc_msgSend(v62, "numberWithDouble:");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = v63;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 9.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v64;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48 * 0.5);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v137[2] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setValues:", v66);

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("borderWidth"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMLivePhotoBloomView _strokeWidthForRing:](v124, "_strokeWidthForRing:", 2);
  objc_msgSend(v68, "numberWithDouble:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setToValue:", v69);

  objc_msgSend(v67, "setDuration:", 0.916666667);
  v115 = v67;
  objc_msgSend(v67, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setDuration:", 1.5);
  v136[0] = v67;
  v136[1] = v60;
  v136[2] = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 3);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setAnimations:", v70);

  LODWORD(v71) = 1059984507;
  LODWORD(v72) = 0;
  LODWORD(v73) = 1.0;
  LODWORD(v74) = 1058642330;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v71, v72, v74, v73);
  v75 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("path"));
  v76 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("lineWidth"));
  v77 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("lineDashPattern"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("lineDashPattern"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v135[0] = v76;
  v135[1] = v77;
  v79 = (void *)v76;
  v80 = (void *)v77;
  v111 = (void *)v77;
  v135[2] = v78;
  v135[3] = v123;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 4);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setAnimations:", v81);

  objc_msgSend(v113, "setDuration:", 1.5);
  v134[0] = &unk_1EA3B09D0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.722222222);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v82;
  v134[2] = &unk_1EA3B09E8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 3);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setKeyTimes:", v83);

  v133[0] = objc_msgSend(v128, "path");
  v133[1] = -[CAMLivePhotoBloomView _pathForDiameter:center:](v124, "_pathForDiameter:center:", 25.6666667, v5, v7);
  v133[2] = objc_msgSend(v130, "path");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 3);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v79;
  objc_msgSend(v79, "setValues:", v84);

  v110 = (void *)v75;
  v132[0] = v75;
  v132[1] = v129;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 2);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setTimingFunctions:", v85);

  v86 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMLivePhotoBloomView _strokeWidthForRing:](v124, "_strokeWidthForRing:", 3);
  objc_msgSend(v86, "numberWithDouble:");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setToValue:", v87);

  objc_msgSend(v78, "setDuration:", 1.08333333);
  objc_msgSend(v78, "setFromValue:", &unk_1EA3B34A0);
  objc_msgSend(v78, "setToValue:", &unk_1EA3B34B8);
  v109 = v78;
  objc_msgSend(v78, "setTimingFunction:", v75);
  objc_msgSend(v123, "setDuration:", 0.416666667);
  objc_msgSend(v123, "setBeginTime:", 1.08333333);
  objc_msgSend(v78, "toValue");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setFromValue:", v88);

  objc_msgSend(v130, "lineDashPattern");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setToValue:", v89);

  objc_msgSend(v123, "setTimingFunction:", v129);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("path"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("lineDashPattern"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("lineWidth"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = v91;
  v131[1] = v92;
  v131[2] = v93;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 3);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setAnimations:", v94);

  objc_msgSend(v90, "setDuration:", 1.32);
  objc_msgSend(v130, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  objc_msgSend(v90, "setBeginTime:", v95 + 0.2);
  objc_msgSend(v91, "setToValue:", -[CAMLivePhotoBloomView _pathForRing:center:](v124, "_pathForRing:center:", 4, v5, v7));
  LODWORD(v96) = 1061997773;
  LODWORD(v97) = 1059145646;
  LODWORD(v98) = *(_DWORD *)"=\nW>";
  LODWORD(v99) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v96, v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setTimingFunction:", v100);

  v108 = v92;
  objc_msgSend(v92, "setToValue:", &unk_1EA3B34D0);
  objc_msgSend(v91, "timingFunction");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setTimingFunction:", v101);

  objc_msgSend(v93, "setToValue:", &unk_1EA3B09D0);
  objc_msgSend(v93, "setBeginTime:", 1.0);
  objc_msgSend(v90, "duration");
  objc_msgSend(v93, "setDuration:", v102 + -1.0);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setCalculationMode:", v121);
  objc_msgSend(v103, "setKeyTimes:", &unk_1EA3B34E8);
  objc_msgSend(v103, "setValues:", &unk_1EA3B3500);
  objc_msgSend(v103, "setDuration:", 1.5);
  v104 = (void *)objc_msgSend(v103, "copy");
  objc_msgSend(v104, "setValues:", &unk_1EA3B3518);
  -[CAMLivePhotoBloomView _defaultImageView](v124, "_defaultImageView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "layer");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "addAnimation:forKey:", v104, CFSTR("bloom"));

  -[CAMLivePhotoBloomView _ringContainer](v124, "_ringContainer");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "addAnimation:forKey:", v103, CFSTR("bloom"));

  objc_msgSend(v126, "addAnimation:forKey:", v118, CFSTR("bloom"));
  objc_msgSend(v125, "addAnimation:forKey:", v114, CFSTR("bloom"));
  objc_msgSend(v128, "addAnimation:forKey:", v113, CFSTR("bloom"));
  objc_msgSend(v130, "addAnimation:forKey:", v90, CFSTR("bloom"));

}

- (void)stopAnimating
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CAMLivePhotoBloomView _defaultImageView](self, "_defaultImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  -[CAMLivePhotoBloomView _ringContainer](self, "_ringContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  -[CAMLivePhotoBloomView _centerRing](self, "_centerRing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  -[CAMLivePhotoBloomView _innerRing](self, "_innerRing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  -[CAMLivePhotoBloomView _middleRing](self, "_middleRing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllAnimations");

  -[CAMLivePhotoBloomView _outerRing](self, "_outerRing");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllAnimations");

}

- (void)setIsOff:(BOOL)a3
{
  if (self->_isOff != a3)
  {
    self->_isOff = a3;
    -[CAMLivePhotoBloomView _updateDefaultImage](self, "_updateDefaultImage");
  }
}

- (void)_updateRingColors
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[CAMLivePhotoBloomView _shapeLayersByRing](self, "_shapeLayersByRing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CAMLivePhotoBloomView__updateRingColors__block_invoke;
  v7[3] = &unk_1EA32C178;
  v7[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  -[CAMLivePhotoBloomView _layersByRing](self, "_layersByRing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __42__CAMLivePhotoBloomView__updateRingColors__block_invoke_2;
  v6[3] = &unk_1EA32C150;
  v6[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __42__CAMLivePhotoBloomView__updateRingColors__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "tintColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

}

void __42__CAMLivePhotoBloomView__updateRingColors__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "tintColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));

}

- (void)_updateDefaultImage
{
  _BOOL4 v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[CAMLivePhotoBloomView isOff](self, "isOff");
  v4 = CFSTR("CAMIrisButton-0-PhotoIris");
  if (v3)
    v4 = CFSTR("CAMIrisButtonInactive");
  v5 = (void *)MEMORY[0x1E0DC3870];
  v6 = v4;
  CAMCameraUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageWithRenderingMode:", 2);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMLivePhotoBloomView _defaultImageView](self, "_defaultImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v10);

}

- (double)_strokeWidthForRing:(int64_t)a3
{
  double result;

  result = 2.0;
  if ((unint64_t)(a3 - 2) <= 2)
    return dbl_1DB9A6CC0[a3 - 2];
  return result;
}

- (double)_diameterForRing:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)a3 <= 4)
    return dbl_1DB9A6CD8[a3];
  return result;
}

- (CGPath)_pathForRing:(int64_t)a3 center:(CGPoint)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;

  y = a4.y;
  x = a4.x;
  -[CAMLivePhotoBloomView _diameterForRing:](self, "_diameterForRing:");
  v9 = v8;
  -[CAMLivePhotoBloomView _strokeWidthForRing:](self, "_strokeWidthForRing:", a3);
  return -[CAMLivePhotoBloomView _pathForDiameter:center:](self, "_pathForDiameter:center:", v9 - v10, x, y);
}

- (CGPath)_pathForDiameter:(double)a3 center:(CGPoint)a4
{
  id v4;
  CGPath *v5;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a4.x, a4.y, a3 * 0.5, 0.0, 6.28318531);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (CGPath *)objc_msgSend(v4, "CGPath");

  return v5;
}

- (BOOL)isOff
{
  return self->_isOff;
}

- (UIImageView)_defaultImageView
{
  return self->__defaultImageView;
}

- (CALayer)_ringContainer
{
  return self->__ringContainer;
}

- (CAShapeLayer)_outerRing
{
  return self->__outerRing;
}

- (CAShapeLayer)_middleRing
{
  return self->__middleRing;
}

- (CALayer)_innerRing
{
  return self->__innerRing;
}

- (CALayer)_centerRing
{
  return self->__centerRing;
}

- (NSDictionary)_layersByRing
{
  return self->__layersByRing;
}

- (NSDictionary)_shapeLayersByRing
{
  return self->__shapeLayersByRing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shapeLayersByRing, 0);
  objc_storeStrong((id *)&self->__layersByRing, 0);
  objc_storeStrong((id *)&self->__centerRing, 0);
  objc_storeStrong((id *)&self->__innerRing, 0);
  objc_storeStrong((id *)&self->__middleRing, 0);
  objc_storeStrong((id *)&self->__outerRing, 0);
  objc_storeStrong((id *)&self->__ringContainer, 0);
  objc_storeStrong((id *)&self->__defaultImageView, 0);
}

@end
