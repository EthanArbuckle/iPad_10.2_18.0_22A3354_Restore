@implementation AVTColorSlider

- (AVTColorSlider)initWithUserInterfaceLayoutDirection:(int64_t)a3
{
  AVTColorSlider *v4;
  double v5;
  AVTColorSlider *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _UIEdgeFeedbackGenerator *edgeFeedbackGenerator;
  UISelectionFeedbackGenerator *v12;
  UISelectionFeedbackGenerator *selectionFeedbackGenerator;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVTColorSlider;
  v4 = -[AVTColorSlider initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v4;
  if (v4)
  {
    v4->_layoutDirection = a3;
    LODWORD(v5) = -1.0;
    -[AVTColorSlider setMinimumValue:](v4, "setMinimumValue:", v5);
    LODWORD(v7) = 1.0;
    -[AVTColorSlider setMaximumValue:](v6, "setMaximumValue:", v7);
    v6->_shouldTriggerFeedback = 0;
    objc_msgSend(MEMORY[0x1E0CEAD18], "sliderConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("sliderEdge"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAD10]), "initWithConfiguration:view:", v9, v6);
    edgeFeedbackGenerator = v6->_edgeFeedbackGenerator;
    v6->_edgeFeedbackGenerator = (_UIEdgeFeedbackGenerator *)v10;

    -[_UIEdgeFeedbackGenerator setAxis:](v6->_edgeFeedbackGenerator, "setAxis:", 1);
    v12 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0CEA998]);
    selectionFeedbackGenerator = v6->_selectionFeedbackGenerator;
    v6->_selectionFeedbackGenerator = v12;

    -[UISelectionFeedbackGenerator _setOutputMode:](v6->_selectionFeedbackGenerator, "_setOutputMode:", 5);
    -[AVTColorSlider addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", v6, sel_valueDidChange_forEvent_, 4096);

    -[AVTColorSlider setClipsToBounds:](v6, "setClipsToBounds:", 0);
  }
  return v6;
}

- (void)relayoutSublayers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AVTColorSlider thumbContentLayer](self, "thumbContentLayer", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[AVTColorSlider thumbContentLayer](self, "thumbContentLayer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bounds");
        objc_msgSend(v9, "setFrame:");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  void *v57;
  double v58;
  CGFloat v59;
  void *v60;
  double v61;
  CGFloat v62;
  double x;
  double y;
  double width;
  double height;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  CGColor *v100;
  void *v101;
  objc_super v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;

  v102.receiver = self;
  v102.super_class = (Class)AVTColorSlider;
  -[AVTColorSlider layoutSubviews](&v102, sel_layoutSubviews);
  -[AVTColorSlider edgeFeedbackGenerator](self, "edgeFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTColorSlider bounds](self, "bounds");
  objc_msgSend(v3, "setDistance:", v4);

  -[AVTColorSlider thumbView](self, "thumbView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[AVTColorSlider thumbContentLayer](self, "thumbContentLayer");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v15, "setFrame:", v8, v10, v12, v14);

  -[AVTColorSlider relayoutSublayers](self, "relayoutSublayers");
  -[AVTColorSlider thumbClippingLayer](self, "thumbClippingLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[AVTColorSlider thumbView](self, "thumbView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v108.origin.x = v26;
  v108.origin.y = v27;
  v108.size.width = v28;
  v108.size.height = v29;
  v103.origin.x = v18;
  v103.origin.y = v20;
  v103.size.width = v22;
  v103.size.height = v24;
  LOBYTE(v15) = CGRectEqualToRect(v103, v108);

  if ((v15 & 1) == 0)
  {
    -[AVTColorSlider thumbView](self, "thumbView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bounds");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    -[AVTColorSlider thumbClippingLayer](self, "thumbClippingLayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

    v41 = (void *)MEMORY[0x1E0CEA390];
    -[AVTColorSlider thumbView](self, "thumbView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    v105 = CGRectInset(v104, 1.0, 1.0);
    objc_msgSend(v41, "bezierPathWithOvalInRect:", v105.origin.x, v105.origin.y, v105.size.width, v105.size.height);
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v45 = objc_msgSend(v44, "CGPath");
    -[AVTColorSlider thumbClippingLayer](self, "thumbClippingLayer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setPath:", v45);

    -[AVTColorSlider thumbView](self, "thumbView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bounds");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    -[AVTColorSlider thumbBorderLayer](self, "thumbBorderLayer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "lineWidth");
    v59 = v58 * 0.5;
    -[AVTColorSlider thumbBorderLayer](self, "thumbBorderLayer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "lineWidth");
    v62 = v61 * 0.5;
    v106.origin.x = v50;
    v106.origin.y = v52;
    v106.size.width = v54;
    v106.size.height = v56;
    v107 = CGRectInset(v106, v59, v62);
    x = v107.origin.x;
    y = v107.origin.y;
    width = v107.size.width;
    height = v107.size.height;

    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", x, y, width, height);
    v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v68 = objc_msgSend(v67, "CGPath");
    -[AVTColorSlider thumbBorderLayer](self, "thumbBorderLayer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setPath:", v68);

    -[AVTColorSlider thumbView](self, "thumbView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "layer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "bounds");
    v73 = v72;
    v75 = v74;
    v77 = v76;
    v79 = v78;
    -[AVTColorSlider thumbBorderLayer](self, "thumbBorderLayer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setFrame:", v73, v75, v77, v79);

    -[AVTColorSlider thumbBorderLayer](self, "thumbBorderLayer");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "path");
    -[AVTColorSlider thumbView](self, "thumbView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "layer");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setShadowPath:", v82);

    -[AVTColorSlider thumbBorderLayer](self, "thumbBorderLayer");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "path");
    -[AVTColorSlider thumbSoftShadowLayer](self, "thumbSoftShadowLayer");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setShadowPath:", v86);

  }
  -[AVTColorSlider trackLayer](self, "trackLayer");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    -[AVTColorSlider bounds](self, "bounds");
    v90 = v89;
    v92 = v91;
    v94 = v93 + -18.0;
    v96 = v95 + 9.0;
    -[AVTColorSlider trackLayer](self, "trackLayer");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setFrame:", v90, v96, v92, v94);

    -[AVTColorSlider trackLayer](self, "trackLayer");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setCornerRadius:", v94 * 0.5);

    -[AVTColorSlider trackLayer](self, "trackLayer");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setBorderWidth:", 2.0);

    v100 = -[AVTColorSlider trackBorderColor](self, "trackBorderColor");
    -[AVTColorSlider trackLayer](self, "trackLayer");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setBorderColor:", v100);

  }
}

- (void)setTrackLayer:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CALayer *v6;
  void *v7;
  void *v8;
  CALayer *trackLayer;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  CATransform3D v19;
  CATransform3D v20;

  v4 = a4;
  v6 = (CALayer *)a3;
  -[AVTColorSlider trackLayer](self, "trackLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVTColorSlider trackLayer](self, "trackLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTColorSlider removeTrackLayer:animated:](self, "removeTrackLayer:animated:", v8, v4);

  }
  trackLayer = self->_trackLayer;
  self->_trackLayer = v6;

  v10 = *MEMORY[0x1E0CD2A68];
  -[AVTColorSlider trackLayer](self, "trackLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerCurve:", v10);

  -[AVTColorSlider layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTColorSlider trackLayer](self, "trackLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertSublayer:atIndex:", v13, 0);

  if (-[AVTColorSlider layoutDirection](self, "layoutDirection") == 1)
  {
    CATransform3DMakeRotation(&v20, 3.14159265, 0.0, 1.0, 0.0);
  }
  else
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v20.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v20.m33 = v14;
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v20.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v20.m43 = v15;
    v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v20.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v20.m13 = v16;
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v20.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v20.m23 = v17;
  }
  -[AVTColorSlider trackLayer](self, "trackLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v20;
  objc_msgSend(v18, "setTransform:", &v19);

  -[AVTColorSlider setNeedsLayout](self, "setNeedsLayout");
}

- (void)removeTrackLayer:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDuration:", 0.2);
    objc_msgSend(v7, "setFromValue:", &unk_1EA571668);
    objc_msgSend(v7, "setToValue:", &unk_1EA571850);
    LODWORD(v8) = 0;
    objc_msgSend(v6, "setOpacity:", v8);
    v9 = (void *)MEMORY[0x1E0CD28B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__AVTColorSlider_removeTrackLayer_animated___block_invoke;
    v11[3] = &unk_1EA51D188;
    v10 = v6;
    v12 = v10;
    objc_msgSend(v9, "setCompletionBlock:", v11);
    objc_msgSend(v10, "addAnimation:forKey:", v7, CFSTR("opacity"));
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
  else
  {
    objc_msgSend(v5, "removeFromSuperlayer");
  }

}

uint64_t __44__AVTColorSlider_removeTrackLayer_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
}

- (CGColor)trackBorderColor
{
  void *v2;
  uint64_t v3;
  id v4;
  CGColor *v5;

  -[AVTColorSlider traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == 2)
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.05);
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (CGColor *)objc_msgSend(v4, "CGColor");

  return v5;
}

- (id)createThumbView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
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
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;

  -[AVTColorSlider thumbView](self, "thumbView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEA658]);
    -[AVTColorSlider setThumbView:](self, "setThumbView:", v4);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTColorSlider thumbView](self, "thumbView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    -[AVTColorSlider thumbView](self, "thumbView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentMode:", 2);

    -[AVTColorSlider thumbView](self, "thumbView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClipsToBounds:", 0);

    -[AVTColorSlider thumbView](self, "thumbView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1042536202;
    objc_msgSend(v10, "setShadowOpacity:", v11);

    -[AVTColorSlider thumbView](self, "thumbView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowOffset:", 1.0, 5.5);

    -[AVTColorSlider thumbView](self, "thumbView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowRadius:", 3.5);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTColorSlider setThumbSoftShadowLayer:](self, "setThumbSoftShadowLayer:", v16);

    -[AVTColorSlider thumbSoftShadowLayer](self, "thumbSoftShadowLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 1042536202;
    objc_msgSend(v17, "setShadowOpacity:", v18);

    -[AVTColorSlider thumbSoftShadowLayer](self, "thumbSoftShadowLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShadowOffset:", 0.0, 0.0);

    -[AVTColorSlider thumbSoftShadowLayer](self, "thumbSoftShadowLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setShadowRadius:", 6.5);

    -[AVTColorSlider thumbView](self, "thumbView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTColorSlider thumbSoftShadowLayer](self, "thumbSoftShadowLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSublayer:", v23);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTColorSlider setThumbContentLayer:](self, "setThumbContentLayer:", v24);

    -[AVTColorSlider thumbView](self, "thumbView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTColorSlider thumbContentLayer](self, "thumbContentLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSublayer:", v27);

    v28 = objc_alloc_init(MEMORY[0x1E0CD2840]);
    -[AVTColorSlider setThumbBorderLayer:](self, "setThumbBorderLayer:", v28);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = objc_msgSend(v29, "CGColor");
    -[AVTColorSlider thumbBorderLayer](self, "thumbBorderLayer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFillColor:", v30);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.972549, 0.972549, 0.972549, 1.0);
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = objc_msgSend(v32, "CGColor");
    -[AVTColorSlider thumbBorderLayer](self, "thumbBorderLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setStrokeColor:", v33);

    -[AVTColorSlider thumbBorderLayer](self, "thumbBorderLayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setLineWidth:", 6.0);

    -[AVTColorSlider thumbView](self, "thumbView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTColorSlider thumbBorderLayer](self, "thumbBorderLayer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSublayer:", v38);

    v39 = objc_alloc_init(MEMORY[0x1E0CD2840]);
    -[AVTColorSlider setThumbClippingLayer:](self, "setThumbClippingLayer:", v39);

    v40 = *MEMORY[0x1E0CD2B70];
    -[AVTColorSlider thumbClippingLayer](self, "thumbClippingLayer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFillRule:", v40);

    -[AVTColorSlider thumbClippingLayer](self, "thumbClippingLayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTColorSlider thumbContentLayer](self, "thumbContentLayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setMask:", v42);

  }
  -[AVTColorSlider thumbView](self, "thumbView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)AVTColorSlider;
  -[AVTColorSlider trackRectForBounds:](&v9, sel_trackRectForBounds_, a3.origin.x, a3.origin.y);
  v8 = width + height * -0.5;
  result.size.height = v7;
  result.size.width = v8;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double height;
  double width;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  -[AVTColorSlider minimumValue](self, "minimumValue", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v9 = a5 - v8;
  -[AVTColorSlider maximumValue](self, "maximumValue");
  v11 = v10;
  -[AVTColorSlider minimumValue](self, "minimumValue");
  v13 = (float)(v9 / (float)(v11 - v12));
  v14 = -[AVTColorSlider layoutDirection](self, "layoutDirection");
  v15 = 1.0 - v13;
  if (v14 != 1)
    v15 = v13;
  v16 = (width - height) * v15;
  v17 = 0.0;
  v18 = height;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)currentMinimumTrackImage
{
  return 0;
}

- (id)currentMaximumTrackImage
{
  return 0;
}

- (void)valueDidChange:(id)a3 forEvent:(id)a4
{
  float v5;
  float v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  id v21;

  v21 = a4;
  -[AVTColorSlider value](self, "value");
  v6 = v5;
  v7 = v5;
  -[AVTColorSlider edgeFeedbackGenerator](self, "edgeFeedbackGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTColorSlider edgeFeedbackGenerator](self, "edgeFeedbackGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "distance");
  objc_msgSend(v8, "positionUpdated:", v10 * v7);

  v11 = -v7;
  if (v6 >= 0.0)
    v11 = v7;
  v12 = v11 + -0.03;
  if (v11 + -0.03 < 0.0)
  {
    v7 = 0.0;
    if (!-[AVTColorSlider shouldTriggerFeedback](self, "shouldTriggerFeedback"))
      goto LABEL_7;
    -[AVTColorSlider selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectionChanged");

  }
  -[AVTColorSlider setShouldTriggerFeedback:](self, "setShouldTriggerFeedback:", v12 >= 0.0);
LABEL_7:
  objc_msgSend(v21, "allTouches");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "phase");
  switch(v16)
  {
    case 3:
      -[AVTColorSlider delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "colorSlider:didFinishSelectingValue:", self, v7);

      *(float *)&v20 = v7;
      -[AVTColorSlider setValue:animated:](self, "setValue:animated:", 0, v20);
      break;
    case 1:
      goto LABEL_11;
    case 0:
      -[AVTColorSlider selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "prepare");

LABEL_11:
      -[AVTColorSlider delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "colorSlider:valueChanged:", self, v7);

      break;
  }

}

- (AVTColorSliderDelegate)delegate
{
  return (AVTColorSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CALayer)trackLayer
{
  return self->_trackLayer;
}

- (void)setTrackLayer:(id)a3
{
  objc_storeStrong((id *)&self->_trackLayer, a3);
}

- (CAShapeLayer)thumbClippingLayer
{
  return self->_thumbClippingLayer;
}

- (void)setThumbClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbClippingLayer, a3);
}

- (CALayer)thumbContentLayer
{
  return self->_thumbContentLayer;
}

- (void)setThumbContentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbContentLayer, a3);
}

- (CALayer)thumbSoftShadowLayer
{
  return self->_thumbSoftShadowLayer;
}

- (void)setThumbSoftShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, a3);
}

- (CAShapeLayer)thumbBorderLayer
{
  return self->_thumbBorderLayer;
}

- (void)setThumbBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbBorderLayer, a3);
}

- (UIImageView)thumbView
{
  return self->_thumbView;
}

- (void)setThumbView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbView, a3);
}

- (_UIEdgeFeedbackGenerator)edgeFeedbackGenerator
{
  return self->_edgeFeedbackGenerator;
}

- (void)setEdgeFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_edgeFeedbackGenerator, a3);
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, a3);
}

- (BOOL)shouldTriggerFeedback
{
  return self->_shouldTriggerFeedback;
}

- (void)setShouldTriggerFeedback:(BOOL)a3
{
  self->_shouldTriggerFeedback = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_edgeFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
  objc_storeStrong((id *)&self->_thumbBorderLayer, 0);
  objc_storeStrong((id *)&self->_thumbSoftShadowLayer, 0);
  objc_storeStrong((id *)&self->_thumbContentLayer, 0);
  objc_storeStrong((id *)&self->_thumbClippingLayer, 0);
  objc_storeStrong((id *)&self->_trackLayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
