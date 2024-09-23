@implementation CAMSemanticStyleStatusIndicator

- (CAMSemanticStyleStatusIndicator)init
{
  CAMSemanticStyleStatusIndicator *v2;
  CAMSemanticStyle *v3;
  CAMSemanticStyle *semanticStyle;
  void *v5;
  void *v6;
  uint64_t v7;
  UIImageView *stackSymbolView;
  void *v9;
  UIView *v10;
  UIView *platterView;
  CALayer *v12;
  CALayer *neutralPlatterLayer;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CALayer *v22;
  CALayer *coolPlatterLayer;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CALayer *v31;
  CALayer *warmPlatterLayer;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CALayer *v40;
  CALayer *platterMaskLayer;
  void *v42;
  void *v43;
  void *v44;
  CALayer *v45;
  void *v46;
  CALayer *v47;
  CALayer *maskBackgroundLayer;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  CAShapeLayer *v54;
  CAShapeLayer *maskStrokeLayer;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  CAReplicatorLayer *v63;
  CAReplicatorLayer *maskTickReplicatorLayer;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  CALayer *v71;
  CALayer *maskSmallTickLayer;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  CALayer *v78;
  CALayer *maskLargeTickLayer;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v87;
  objc_super v88;
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[5];
  _QWORD v96[5];
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[4];
  _QWORD v102[4];
  _QWORD v103[4];
  _QWORD v104[4];
  _QWORD v105[4];
  _QWORD v106[6];

  v106[4] = *MEMORY[0x1E0C80C00];
  v88.receiver = self;
  v88.super_class = (Class)CAMSemanticStyleStatusIndicator;
  v2 = -[CAMControlStatusIndicator initWithFrame:](&v88, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = -[CAMSemanticStyle initWithPresetType:]([CAMSemanticStyle alloc], "initWithPresetType:", 0);
    semanticStyle = v2->_semanticStyle;
    v2->_semanticStyle = v3;

    v5 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("CAMSemanticStyleIndicator"), v6);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v87);
    stackSymbolView = v2->__stackSymbolView;
    v2->__stackSymbolView = (UIImageView *)v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v2->__stackSymbolView, "setTintColor:", v9);

    -[CAMSemanticStyleStatusIndicator addSubview:](v2, "addSubview:", v2->__stackSymbolView);
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    platterView = v2->__platterView;
    v2->__platterView = v10;

    -[UIView setUserInteractionEnabled:](v2->__platterView, "setUserInteractionEnabled:", 0);
    -[CAMSemanticStyleStatusIndicator insertSubview:below:](v2, "insertSubview:below:", v2->__platterView, v2->__stackSymbolView);
    v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    neutralPlatterLayer = v2->__neutralPlatterLayer;
    v2->__neutralPlatterLayer = v12;

    v14 = *MEMORY[0x1E0CD2F78];
    -[CALayer setContentsGravity:](v2->__neutralPlatterLayer, "setContentsGravity:", *MEMORY[0x1E0CD2F78]);
    -[CAMSemanticStyleStatusIndicator traitCollection](v2, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayScale");
    -[CALayer setContentsScale:](v2->__neutralPlatterLayer, "setContentsScale:");

    v105[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = v16;
    v105[1] = CFSTR("position");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v106[1] = v17;
    v105[2] = CFSTR("opacity");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v106[2] = v18;
    v105[3] = CFSTR("contents");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v106[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v2->__neutralPlatterLayer, "setActions:", v20);

    -[UIView layer](v2->__platterView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSublayer:", v2->__neutralPlatterLayer);

    v22 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    coolPlatterLayer = v2->__coolPlatterLayer;
    v2->__coolPlatterLayer = v22;

    -[CALayer setContentsGravity:](v2->__coolPlatterLayer, "setContentsGravity:", v14);
    -[CAMSemanticStyleStatusIndicator traitCollection](v2, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "displayScale");
    -[CALayer setContentsScale:](v2->__coolPlatterLayer, "setContentsScale:");

    v103[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = v25;
    v103[1] = CFSTR("position");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v104[1] = v26;
    v103[2] = CFSTR("opacity");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v104[2] = v27;
    v103[3] = CFSTR("contents");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v104[3] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v2->__coolPlatterLayer, "setActions:", v29);

    -[UIView layer](v2->__platterView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSublayer:", v2->__coolPlatterLayer);

    v31 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    warmPlatterLayer = v2->__warmPlatterLayer;
    v2->__warmPlatterLayer = v31;

    -[CALayer setContentsGravity:](v2->__warmPlatterLayer, "setContentsGravity:", v14);
    -[CAMSemanticStyleStatusIndicator traitCollection](v2, "traitCollection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "displayScale");
    -[CALayer setContentsScale:](v2->__warmPlatterLayer, "setContentsScale:");

    v101[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v34;
    v101[1] = CFSTR("position");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v35;
    v101[2] = CFSTR("opacity");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v102[2] = v36;
    v101[3] = CFSTR("contents");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v102[3] = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v2->__warmPlatterLayer, "setActions:", v38);

    -[UIView layer](v2->__platterView, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSublayer:", v2->__warmPlatterLayer);

    v40 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    platterMaskLayer = v2->__platterMaskLayer;
    v2->__platterMaskLayer = v40;

    v99[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = CFSTR("position");
    v100[0] = v42;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v100[1] = v43;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v2->__platterMaskLayer, "setActions:", v44);

    v45 = v2->__platterMaskLayer;
    -[UIView layer](v2->__platterView, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setMask:", v45);

    v47 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    maskBackgroundLayer = v2->__maskBackgroundLayer;
    v2->__maskBackgroundLayer = v47;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v2->__maskBackgroundLayer, "setBackgroundColor:", objc_msgSend(v49, "CGColor"));

    v97[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v50;
    v97[1] = CFSTR("position");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v51;
    v97[2] = CFSTR("opacity");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2] = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v2->__maskBackgroundLayer, "setActions:", v53);

    -[CALayer addSublayer:](v2->__platterMaskLayer, "addSublayer:", v2->__maskBackgroundLayer);
    v54 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    maskStrokeLayer = v2->__maskStrokeLayer;
    v2->__maskStrokeLayer = v54;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v2->__maskStrokeLayer, "setStrokeColor:", objc_msgSend(v56, "CGColor"));

    -[CAShapeLayer setFillColor:](v2->__maskStrokeLayer, "setFillColor:", 0);
    -[CAShapeLayer setLineWidth:](v2->__maskStrokeLayer, "setLineWidth:", 1.0);
    v95[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = v57;
    v95[1] = CFSTR("position");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v96[1] = v58;
    v95[2] = CFSTR("path");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v96[2] = v59;
    v95[3] = CFSTR("strokeStart");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v96[3] = v60;
    v95[4] = CFSTR("strokeEnd");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v96[4] = v61;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 5);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setActions:](v2->__maskStrokeLayer, "setActions:", v62);

    -[CALayer addSublayer:](v2->__platterMaskLayer, "addSublayer:", v2->__maskStrokeLayer);
    v63 = (CAReplicatorLayer *)objc_alloc_init(MEMORY[0x1E0CD2828]);
    maskTickReplicatorLayer = v2->__maskTickReplicatorLayer;
    v2->__maskTickReplicatorLayer = v63;

    v93[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = v65;
    v93[1] = CFSTR("position");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v94[1] = v66;
    v93[2] = CFSTR("instanceCount");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v94[2] = v67;
    v93[3] = CFSTR("instanceTransform");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v94[3] = v68;
    v93[4] = CFSTR("hidden");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v94[4] = v69;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 5);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAReplicatorLayer setActions:](v2->__maskTickReplicatorLayer, "setActions:", v70);

    -[CALayer addSublayer:](v2->__platterMaskLayer, "addSublayer:", v2->__maskTickReplicatorLayer);
    v71 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    maskSmallTickLayer = v2->__maskSmallTickLayer;
    v2->__maskSmallTickLayer = v71;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v2->__maskSmallTickLayer, "setBackgroundColor:", objc_msgSend(v73, "CGColor"));

    -[CAMSemanticStyleStatusIndicator traitCollection](v2, "traitCollection");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "displayScale");
    -[CALayer setRasterizationScale:](v2->__maskSmallTickLayer, "setRasterizationScale:");

    -[CALayer setAllowsEdgeAntialiasing:](v2->__maskSmallTickLayer, "setAllowsEdgeAntialiasing:", 1);
    v91[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = CFSTR("position");
    v92[0] = v75;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v76;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v2->__maskSmallTickLayer, "setActions:", v77);

    -[CAReplicatorLayer addSublayer:](v2->__maskTickReplicatorLayer, "addSublayer:", v2->__maskSmallTickLayer);
    v78 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    maskLargeTickLayer = v2->__maskLargeTickLayer;
    v2->__maskLargeTickLayer = v78;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v2->__maskLargeTickLayer, "setBackgroundColor:", objc_msgSend(v80, "CGColor"));

    -[CAMSemanticStyleStatusIndicator traitCollection](v2, "traitCollection");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "displayScale");
    -[CALayer setRasterizationScale:](v2->__maskLargeTickLayer, "setRasterizationScale:");

    -[CALayer setAllowsEdgeAntialiasing:](v2->__maskLargeTickLayer, "setAllowsEdgeAntialiasing:", 1);
    v89[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v82;
    v89[1] = CFSTR("position");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v83;
    v89[2] = CFSTR("hidden");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v90[2] = v84;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v2->__maskLargeTickLayer, "setActions:", v85);

    -[CALayer addSublayer:](v2->__platterMaskLayer, "addSublayer:", v2->__maskLargeTickLayer);
    -[CAMSemanticStyleStatusIndicator _updateStrokePath](v2, "_updateStrokePath");
    -[CAMSemanticStyleStatusIndicator _updateGradientImages](v2, "_updateGradientImages");
    -[CAMSemanticStyleStatusIndicator _updateTicksAnimated:](v2, "_updateTicksAnimated:", 0);
    -[CAMSemanticStyleStatusIndicator _updateGradientAlphasAnimated:](v2, "_updateGradientAlphasAnimated:", 0);
    -[CAMSemanticStyleStatusIndicator _updatePlatterStrokeProgressAnimated:](v2, "_updatePlatterStrokeProgressAnimated:", 0);

  }
  return v2;
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (id)imageNameForCurrentState
{
  return 0;
}

- (BOOL)supportsOrientations
{
  return 1;
}

- (void)_updateImageOrientationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CAMSemanticStyleStatusIndicator _stackSymbolView](self, "_stackSymbolView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v5, -[CAMControlStatusIndicator orientation](self, "orientation"), v3);

  -[CAMSemanticStyleStatusIndicator _platterView](self, "_platterView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v6, -[CAMControlStatusIndicator orientation](self, "orientation"), v3);

}

- (void)setSemanticStyle:(id)a3
{
  -[CAMSemanticStyleStatusIndicator setSemanticStyle:animated:](self, "setSemanticStyle:animated:", a3, 0);
}

- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  v7 = a3;
  if (!-[CAMSemanticStyle isEqualToSemanticStyle:](self->_semanticStyle, "isEqualToSemanticStyle:"))
  {
    objc_storeStrong((id *)&self->_semanticStyle, a3);
    -[CAMSemanticStyleStatusIndicator _updateTicksAnimated:](self, "_updateTicksAnimated:", v4);
    -[CAMSemanticStyleStatusIndicator _updatePlatterStrokeProgressAnimated:](self, "_updatePlatterStrokeProgressAnimated:", v4);
    -[CAMSemanticStyleStatusIndicator _updateGradientAlphasAnimated:](self, "_updateGradientAlphasAnimated:", v4);
  }

}

- (int64_t)_visibleTickCount
{
  void *v3;
  double v4;
  double v5;
  void *v7;
  double v8;
  int64_t v9;

  -[CAMSemanticStyleStatusIndicator semanticStyle](self, "semanticStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneBias");
  v5 = fabs(v4);

  if (v5 < 0.005)
    return 36;
  -[CAMSemanticStyleStatusIndicator semanticStyle](self, "semanticStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneBias");
  v9 = vcvtpd_s64_f64((1.0 - fabs(v8)) * 36.0);

  if (v9 <= 1)
    return 1;
  else
    return v9;
}

- (id)_generatePlatterImageWithRenderer:(id)a3 colors:(id)a4 size:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  CGFloat v14;
  CGFloat v15;

  height = a5.height;
  width = a5.width;
  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__CAMSemanticStyleStatusIndicator__generatePlatterImageWithRenderer_colors_size___block_invoke;
  v12[3] = &unk_1EA32B468;
  v13 = v8;
  v14 = width;
  v15 = height;
  v9 = v8;
  objc_msgSend(a3, "imageWithActions:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __81__CAMSemanticStyleStatusIndicator__generatePlatterImageWithRenderer_colors_size___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  CGColorSpace *ColorSpace;
  CGGradient *v16;
  CGContext *v17;
  const CGPath *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGPoint v25;
  CGPoint v26;
  CGRect v27;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2, (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "resolvedColorWithTraitCollection:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_retainAutorelease(v12);
        objc_msgSend(v4, "addObject:", objc_msgSend(v13, "CGColor"));

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v14, "CGColor"));

  v16 = CGGradientCreateWithColors(ColorSpace, (CFArrayRef)v4, 0);
  v17 = (CGContext *)objc_msgSend(v3, "CGContext");
  CGContextSaveGState(v17);
  v27.size.width = *(CGFloat *)(a1 + 40);
  v27.size.height = *(CGFloat *)(a1 + 48);
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v18 = CGPathCreateWithEllipseInRect(v27, 0);
  CGContextAddPath(v17, v18);
  CGContextClip(v17);
  v26.y = *(CGFloat *)(a1 + 48);
  v25.x = 0.0;
  v25.y = 0.0;
  v26.x = 0.0;
  CGContextDrawLinearGradient(v17, v16, v25, v26, 0);
  CGPathRelease(v18);
  CGGradientRelease(v16);
  CGContextRestoreGState(v17);

}

- (void)_updateGradientImages
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  -[CAMSemanticStyleStatusIndicator _platterFrame](self, "_platterFrame");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredRange:", 2);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v7, v4, v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v9;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleStatusIndicator _generatePlatterImageWithRenderer:colors:size:](self, "_generatePlatterImageWithRenderer:colors:size:", v8, v11, v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v13;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemCyanColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleStatusIndicator _generatePlatterImageWithRenderer:colors:size:](self, "_generatePlatterImageWithRenderer:colors:size:", v8, v15, v4, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleStatusIndicator _generatePlatterImageWithRenderer:colors:size:](self, "_generatePlatterImageWithRenderer:colors:size:", v8, v19, v4, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_retainAutorelease(v12);
  v22 = objc_msgSend(v21, "CGImage");
  -[CAMSemanticStyleStatusIndicator _neutralPlatterLayer](self, "_neutralPlatterLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setContents:", v22);

  v24 = objc_retainAutorelease(v16);
  v25 = objc_msgSend(v24, "CGImage");
  -[CAMSemanticStyleStatusIndicator _coolPlatterLayer](self, "_coolPlatterLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setContents:", v25);

  v27 = objc_retainAutorelease(v20);
  v28 = objc_msgSend(v27, "CGImage");
  -[CAMSemanticStyleStatusIndicator _warmPlatterLayer](self, "_warmPlatterLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setContents:", v28);

}

- (void)_updateGradientAlphasAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  float v44;
  void *v45;
  double v46;
  float v47;
  void *v48;
  double v49;
  float v50;
  double v51;
  id v52;
  id v53;

  v3 = a3;
  -[CAMSemanticStyleStatusIndicator semanticStyle](self, "semanticStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "warmthBias");

  CEKProgressClamped();
  v7 = v6;
  CEKProgressClamped();
  v8 = -(v7 * (v7 + -2.0));
  v10 = -(v9 * (v9 + -2.0));
  CEKInterpolateClamped();
  v12 = v11;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleStatusIndicator _coolPlatterLayer](self, "_coolPlatterLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentationLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      -[CAMSemanticStyleStatusIndicator _coolPlatterLayer](self, "_coolPlatterLayer");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;

    v20 = (void *)MEMORY[0x1E0CB37E8];
    v52 = v19;
    objc_msgSend(v19, "opacity");
    objc_msgSend(v20, "numberWithFloat:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFromValue:", v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setToValue:", v22);

    objc_msgSend(v14, "setDuration:", 0.5);
    objc_msgSend(v14, "setTimingFunction:", v13);
    -[CAMSemanticStyleStatusIndicator _coolPlatterLayer](self, "_coolPlatterLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAnimation:forKey:", v14, CFSTR("opacityAnimation"));

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleStatusIndicator _warmPlatterLayer](self, "_warmPlatterLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "presentationLayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = v26;
    }
    else
    {
      -[CAMSemanticStyleStatusIndicator _warmPlatterLayer](self, "_warmPlatterLayer");
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = v28;

    v30 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v29, "opacity");
    objc_msgSend(v30, "numberWithFloat:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFromValue:", v31);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setToValue:", v32);

    objc_msgSend(v24, "setDuration:", 0.5);
    objc_msgSend(v24, "setTimingFunction:", v13);
    -[CAMSemanticStyleStatusIndicator _warmPlatterLayer](self, "_warmPlatterLayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addAnimation:forKey:", v24, CFSTR("opacityAnimation"));

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleStatusIndicator _maskBackgroundLayer](self, "_maskBackgroundLayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "presentationLayer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      v38 = v36;
    }
    else
    {
      -[CAMSemanticStyleStatusIndicator _maskBackgroundLayer](self, "_maskBackgroundLayer");
      v38 = (id)objc_claimAutoreleasedReturnValue();
    }
    v39 = v38;

    v40 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v39, "opacity");
    objc_msgSend(v40, "numberWithFloat:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFromValue:", v41);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setToValue:", v42);

    objc_msgSend(v34, "setDuration:", 0.5);
    objc_msgSend(v34, "setTimingFunction:", v13);
    -[CAMSemanticStyleStatusIndicator _maskBackgroundLayer](self, "_maskBackgroundLayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addAnimation:forKey:", v34, CFSTR("opacityAnimation"));

  }
  -[CAMSemanticStyleStatusIndicator _coolPlatterLayer](self, "_coolPlatterLayer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v8;
  *(float *)&v46 = v44;
  objc_msgSend(v45, "setOpacity:", v46);

  -[CAMSemanticStyleStatusIndicator _warmPlatterLayer](self, "_warmPlatterLayer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v10;
  *(float *)&v49 = v47;
  objc_msgSend(v48, "setOpacity:", v49);

  -[CAMSemanticStyleStatusIndicator _maskBackgroundLayer](self, "_maskBackgroundLayer");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v50 = v12;
  *(float *)&v51 = v50;
  objc_msgSend(v53, "setOpacity:", v51);

}

- (void)_updateTicksAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CATransform3D v39;
  CATransform3D v40;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v43;
  CATransform3D v44;
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[4];

  v3 = a3;
  v47[2] = *MEMORY[0x1E0C80C00];
  v5 = -[CAMSemanticStyleStatusIndicator _visibleTickCount](self, "_visibleTickCount");
  -[CAMSemanticStyleStatusIndicator semanticStyle](self, "semanticStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneBias");
  v8 = dbl_1DB9A5620[v7 > 0.0];

  memset(&v44, 0, sizeof(v44));
  CATransform3DMakeRotation(&v44, v8, 0.0, 0.0, 1.0);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleStatusIndicator _maskTickReplicatorLayer](self, "_maskTickReplicatorLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentationLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[CAMSemanticStyleStatusIndicator _maskTickReplicatorLayer](self, "_maskTickReplicatorLayer");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    memset(&v43, 0, sizeof(v43));
    if (v14)
      objc_msgSend(v14, "instanceTransform");
    v15 = objc_msgSend(v14, "instanceCount");
    a = v43;
    b = v44;
    v16 = CATransform3DEqualToTransform(&a, &b);
    -[CAMSemanticStyleStatusIndicator semanticStyle](self, "semanticStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sceneBias");
    v19 = v18;

    if (!v16 || v19 == 0.0)
    {
      v24 = (double)(36 - v15) / (double)(36 - v15 - v5 + 36);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("instanceCount"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15 + 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFromValue:", v25);

      objc_msgSend(v20, "setToValue:", &unk_1EA3B0760);
      objc_msgSend(v20, "setDuration:", v24 * 0.5);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("instanceCount"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFromValue:", &unk_1EA3B0760);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5 + 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setToValue:", v26);

      objc_msgSend(v23, "setDuration:", (1.0 - v24) * 0.5);
      objc_msgSend(v23, "setBeginTime:", v24 * 0.5);
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("instanceTransform"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      a = v43;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &a);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v28;
      a = v44;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &a);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
      v30 = v9;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setValues:", v31);

      v9 = v30;
      v46[0] = &unk_1EA3B0778;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v32;
      v46[2] = &unk_1EA3B0790;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setKeyTimes:", v33);

      objc_msgSend(v27, "setDuration:", 0.5);
      objc_msgSend(v27, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setDuration:", 0.5);
      v45[0] = v20;
      v45[1] = v23;
      v45[2] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAnimations:", v35);

      objc_msgSend(v34, "setTimingFunction:", v30);
      -[CAMSemanticStyleStatusIndicator _maskTickReplicatorLayer](self, "_maskTickReplicatorLayer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addAnimation:forKey:", v34, CFSTR("instanceCountAnimation"));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("instanceCount"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15 + 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFromValue:", v21);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5 + 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setToValue:", v22);

      objc_msgSend(v20, "setDuration:", 0.5);
      objc_msgSend(v20, "setTimingFunction:", v9);
      -[CAMSemanticStyleStatusIndicator _maskTickReplicatorLayer](self, "_maskTickReplicatorLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addAnimation:forKey:", v20, CFSTR("instanceCountAnimation"));
    }

  }
  -[CAMSemanticStyleStatusIndicator _maskTickReplicatorLayer](self, "_maskTickReplicatorLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setInstanceCount:", v5);

  v40 = v44;
  -[CAMSemanticStyleStatusIndicator _maskTickReplicatorLayer](self, "_maskTickReplicatorLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v40;
  objc_msgSend(v38, "setInstanceTransform:", &v39);

}

- (void)_updatePlatterStrokeProgressAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  BOOL v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  _QWORD v65[2];
  _QWORD v66[5];

  v3 = a3;
  v66[4] = *MEMORY[0x1E0C80C00];
  -[CAMSemanticStyleStatusIndicator semanticStyle](self, "semanticStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneBias");
  v7 = v6;

  v8 = 0.0;
  v9 = 0.0;
  if (v7 != 0.0)
  {
    v10 = -[CAMSemanticStyleStatusIndicator _visibleTickCount](self, "_visibleTickCount", 0.0);
    -[CAMSemanticStyleStatusIndicator _platterFrame](self, "_platterFrame");
    v9 = 1.0
       - ((v11 * 3.14159265 + -36.0) / 36.0
        + fmax((double)v10 + -0.5, 0.0)
        + fmax((double)v10 + -1.0, 0.0) * ((v11 * 3.14159265 + -36.0) / 36.0))
       / (v11
        * 3.14159265);
  }
  v12 = v7 < 0.0;
  if (v7 >= 0.0)
    v13 = v9;
  else
    v13 = -v9;
  if (v7 >= 0.0)
    v14 = v9;
  else
    v14 = 1.0;
  if (v12)
    v8 = 1.0 - v9;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleStatusIndicator _maskStrokeLayer](self, "_maskStrokeLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentationLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      -[CAMSemanticStyleStatusIndicator _maskStrokeLayer](self, "_maskStrokeLayer");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;

    objc_msgSend(v20, "strokeEnd");
    v22 = v21;
    objc_msgSend(v20, "strokeStart");
    v24 = v22 - v23;
    objc_msgSend(v20, "strokeEnd");
    if (v25 == 1.0)
      v26 = -v24;
    else
      v26 = v24;
    if (v13 >= 0.0 == v26 >= 0.0)
    {
      objc_msgSend(v20, "strokeStart");
      v48 = v47;
      objc_msgSend(v20, "strokeEnd");
      if (v13 < 0.0)
        v50 = 1.0;
      else
        v50 = 0.0;
      v51 = v26 < 0.0;
      if (v26 == 0.0)
        v52 = v50;
      else
        v52 = v48;
      if (v26 == 0.0)
        v53 = v50;
      else
        v53 = v49;
      if (v51)
        v54 = 1.0;
      else
        v54 = 0.0;
      if (v13 == 0.0)
        v55 = v54;
      else
        v55 = v8;
      if (v13 == 0.0)
        v56 = v54;
      else
        v56 = v14;
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeStart"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFromValue:", v57);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setToValue:", v58);

      objc_msgSend(v30, "setDuration:", 0.5);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFromValue:", v59);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setToValue:", v60);

      objc_msgSend(v34, "setDuration:", 0.5);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setDuration:", 0.5);
      v65[0] = v30;
      v65[1] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setAnimations:", v61);

      objc_msgSend(v38, "setTimingFunction:", v15);
      -[CAMSemanticStyleStatusIndicator _maskStrokeLayer](self, "_maskStrokeLayer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addAnimation:forKey:", v38, CFSTR("strokeProgressAnimation"));
    }
    else
    {
      v27 = fabs(v24 / (v13 - v26));
      if (v26 < 0.0)
        v28 = 1.0;
      else
        v28 = 0.0;
      if (v13 < 0.0)
        v29 = 1.0;
      else
        v29 = 0.0;
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeStart"), 1.0 - v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v20, "strokeStart");
      objc_msgSend(v31, "numberWithDouble:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFromValue:", v32);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setToValue:", v33);

      objc_msgSend(v30, "setDuration:", v27 * 0.5);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v20, "strokeEnd");
      objc_msgSend(v35, "numberWithDouble:");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFromValue:", v36);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setToValue:", v37);

      objc_msgSend(v34, "setDuration:", v27 * 0.5);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeStart"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setFromValue:", v39);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setToValue:", v40);

      objc_msgSend(v38, "setDuration:", v64 * 0.5);
      objc_msgSend(v38, "setBeginTime:", v27 * 0.5);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setFromValue:", v42);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setToValue:", v43);

      objc_msgSend(v41, "setDuration:", v64 * 0.5);
      objc_msgSend(v41, "setBeginTime:", v27 * 0.5);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setDuration:", 0.5);
      v66[0] = v30;
      v66[1] = v34;
      v66[2] = v38;
      v66[3] = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 4);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setAnimations:", v45);

      objc_msgSend(v44, "setTimingFunction:", v15);
      -[CAMSemanticStyleStatusIndicator _maskStrokeLayer](self, "_maskStrokeLayer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addAnimation:forKey:", v44, CFSTR("strokeProgressAnimation"));

    }
  }
  -[CAMSemanticStyleStatusIndicator _maskStrokeLayer](self, "_maskStrokeLayer");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setStrokeStart:", v8);

  -[CAMSemanticStyleStatusIndicator _maskStrokeLayer](self, "_maskStrokeLayer");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setStrokeEnd:", v14);

}

- (void)_updateStrokePath
{
  CGFloat v3;
  CGFloat v4;
  double width;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  id v10;
  CGRect v11;
  CGRect v12;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[CAMSemanticStyleStatusIndicator _platterFrame](self, "_platterFrame");
  v11.origin.x = v3;
  v11.origin.y = v4;
  v12 = CGRectInset(v11, 0.5, 0.5);
  width = v12.size.width;
  UIRectGetCenter();
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6, v7, CAMPixelWidthForView(self) + width * 0.5 + -0.5, -1.57079633, 4.71238898);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGPath");

  -[CAMSemanticStyleStatusIndicator _maskStrokeLayer](self, "_maskStrokeLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPath:", v9);

}

- (CGRect)_platterFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CAMSemanticStyleStatusIndicator bounds](self, "bounds");
  -[CAMSemanticStyleStatusIndicator alignmentRectForFrame:](self, "alignmentRectForFrame:");
  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)CAMSemanticStyleStatusIndicator;
  -[CAMControlStatusIndicator layoutSubviews](&v54, sel_layoutSubviews);
  -[CAMSemanticStyleStatusIndicator bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMSemanticStyleStatusIndicator _stackSymbolView](self, "_stackSymbolView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleStatusIndicator alignmentRectForFrame:](self, "alignmentRectForFrame:", v4, v6, v8, v10);
  UIRectGetCenter();
  v13 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v11, "intrinsicContentSize");
  objc_msgSend(v11, "frameForAlignmentRect:", v13, v12, v14, v15);
  v17 = v16;
  v19 = v18;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v11, "setCenter:");
  objc_msgSend(v11, "setBounds:", v13, v12, v17, v19);
  -[CAMSemanticStyleStatusIndicator _platterFrame](self, "_platterFrame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[CAMSemanticStyleStatusIndicator _platterView](self, "_platterView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  CAMViewSetBoundsAndCenterForFrame(v28, v21, v23, v25, v27);

  UIRectGetCenter();
  v30 = v29;
  v32 = v31;
  -[CAMSemanticStyleStatusIndicator _neutralPlatterLayer](self, "_neutralPlatterLayer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPosition:", v30, v32);

  -[CAMSemanticStyleStatusIndicator _neutralPlatterLayer](self, "_neutralPlatterLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBounds:", v13, v12, v25, v27);

  -[CAMSemanticStyleStatusIndicator _coolPlatterLayer](self, "_coolPlatterLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPosition:", v30, v32);

  -[CAMSemanticStyleStatusIndicator _coolPlatterLayer](self, "_coolPlatterLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v13, v12, v25, v27);

  -[CAMSemanticStyleStatusIndicator _warmPlatterLayer](self, "_warmPlatterLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setPosition:", v30, v32);

  -[CAMSemanticStyleStatusIndicator _warmPlatterLayer](self, "_warmPlatterLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBounds:", v13, v12, v25, v27);

  -[CAMSemanticStyleStatusIndicator _platterMaskLayer](self, "_platterMaskLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setPosition:", v30, v32);

  -[CAMSemanticStyleStatusIndicator _platterMaskLayer](self, "_platterMaskLayer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setBounds:", v13, v12, v25, v27);

  -[CAMSemanticStyleStatusIndicator _maskBackgroundLayer](self, "_maskBackgroundLayer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setPosition:", v30, v32);

  -[CAMSemanticStyleStatusIndicator _maskBackgroundLayer](self, "_maskBackgroundLayer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setBounds:", v13, v12, v25, v27);

  -[CAMSemanticStyleStatusIndicator _maskStrokeLayer](self, "_maskStrokeLayer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setPosition:", v30, v32);

  -[CAMSemanticStyleStatusIndicator _maskStrokeLayer](self, "_maskStrokeLayer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setBounds:", v13, v12, v25, v27);

  -[CAMSemanticStyleStatusIndicator _maskTickReplicatorLayer](self, "_maskTickReplicatorLayer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setPosition:", v30, v32);

  -[CAMSemanticStyleStatusIndicator _maskTickReplicatorLayer](self, "_maskTickReplicatorLayer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setBounds:", v13, v12, v25, v27);

  v47 = CAMPixelWidthForView(self) + 1.0;
  UIPointRoundToViewScale();
  v49 = v48;
  v51 = v50;
  -[CAMSemanticStyleStatusIndicator _maskSmallTickLayer](self, "_maskSmallTickLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", v49, v51, 1.0, v47);

  -[CAMSemanticStyleStatusIndicator _maskLargeTickLayer](self, "_maskLargeTickLayer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFrame:", v49, v51, 1.0, 2.0);

  -[CAMSemanticStyleStatusIndicator _updateStrokePath](self, "_updateStrokePath");
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[CAMSemanticStyleStatusIndicator _stackSymbolView](self, "_stackSymbolView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)accessibilityIdentifier
{
  return CFSTR("StatusBarPhotographicStylesButton");
}

- (CAMSemanticStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (UIImageView)_stackSymbolView
{
  return self->__stackSymbolView;
}

- (UIView)_platterView
{
  return self->__platterView;
}

- (CALayer)_warmPlatterLayer
{
  return self->__warmPlatterLayer;
}

- (CALayer)_neutralPlatterLayer
{
  return self->__neutralPlatterLayer;
}

- (CALayer)_coolPlatterLayer
{
  return self->__coolPlatterLayer;
}

- (CALayer)_platterMaskLayer
{
  return self->__platterMaskLayer;
}

- (CAShapeLayer)_maskStrokeLayer
{
  return self->__maskStrokeLayer;
}

- (CALayer)_maskBackgroundLayer
{
  return self->__maskBackgroundLayer;
}

- (CALayer)_maskSmallTickLayer
{
  return self->__maskSmallTickLayer;
}

- (CALayer)_maskLargeTickLayer
{
  return self->__maskLargeTickLayer;
}

- (CAReplicatorLayer)_maskTickReplicatorLayer
{
  return self->__maskTickReplicatorLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__maskTickReplicatorLayer, 0);
  objc_storeStrong((id *)&self->__maskLargeTickLayer, 0);
  objc_storeStrong((id *)&self->__maskSmallTickLayer, 0);
  objc_storeStrong((id *)&self->__maskBackgroundLayer, 0);
  objc_storeStrong((id *)&self->__maskStrokeLayer, 0);
  objc_storeStrong((id *)&self->__platterMaskLayer, 0);
  objc_storeStrong((id *)&self->__coolPlatterLayer, 0);
  objc_storeStrong((id *)&self->__neutralPlatterLayer, 0);
  objc_storeStrong((id *)&self->__warmPlatterLayer, 0);
  objc_storeStrong((id *)&self->__platterView, 0);
  objc_storeStrong((id *)&self->__stackSymbolView, 0);
  objc_storeStrong((id *)&self->_semanticStyle, 0);
}

@end
