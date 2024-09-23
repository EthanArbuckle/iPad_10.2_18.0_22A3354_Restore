@implementation ICDocCamViewControllerMeshTransform

- (ICDocCamViewControllerMeshTransform)initWithImage:(id)a3 backgroundImage:(id)a4 imageViewFrame:(CGRect)a5 view:(id)a6 imageQuad:(id)a7 previewView:(id)a8 previewBounds:(CGRect)a9 scrimView:(id)a10
{
  double height;
  double width;
  double y;
  double x;
  double v17;
  double v18;
  double v19;
  double v20;
  id v22;
  id v23;
  id v24;
  id v25;
  ICDocCamViewControllerMeshTransform *v26;
  ICDocCamViewControllerMeshTransform *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v45;

  height = a9.size.height;
  width = a9.size.width;
  y = a9.origin.y;
  x = a9.origin.x;
  v17 = a5.size.height;
  v18 = a5.size.width;
  v19 = a5.origin.y;
  v20 = a5.origin.x;
  v22 = a3;
  v23 = a6;
  v24 = a7;
  v25 = a10;
  v45.receiver = self;
  v45.super_class = (Class)ICDocCamViewControllerMeshTransform;
  v26 = -[ICDocCamViewControllerMeshTransform init](&v45, sel_init);
  v27 = v26;
  if (v26)
  {
    -[ICDocCamViewControllerMeshTransform setImageViewFrame:](v26, "setImageViewFrame:", v20, v19, v18, v17);
    -[ICDocCamViewControllerMeshTransform setImageQuad:](v27, "setImageQuad:", v24);
    -[ICDocCamViewControllerMeshTransform setPreviewViewFrame:](v27, "setPreviewViewFrame:", x, y, width, height);
    v28 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend(v23, "bounds");
    v29 = (void *)objc_msgSend(v28, "initWithFrame:");
    -[ICDocCamViewControllerMeshTransform setAnimationImageView:](v27, "setAnimationImageView:", v29);

    -[ICDocCamViewControllerMeshTransform animationImageView](v27, "animationImageView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setContentMode:", 0);

    -[ICDocCamViewControllerMeshTransform animationImageView](v27, "animationImageView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = 1.0;
    objc_msgSend(v32, "setOpacity:", v33);

    -[ICDocCamViewControllerMeshTransform animationImageView](v27, "animationImageView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setImage:", v22);

    -[ICDocCamViewControllerMeshTransform animationImageView](v27, "animationImageView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setHidden:", 0);

    -[ICDocCamViewControllerMeshTransform setScrimView:](v27, "setScrimView:", v25);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewControllerMeshTransform scrimView](v27, "scrimView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setBackgroundColor:", v36);

    -[ICDocCamViewControllerMeshTransform scrimView](v27, "scrimView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = 0;
    objc_msgSend(v39, "setOpacity:", v40);

    -[ICDocCamViewControllerMeshTransform scrimView](v27, "scrimView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setHidden:", 0);

    -[ICDocCamViewControllerMeshTransform animationImageView](v27, "animationImageView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamViewControllerMeshTransform scrimView](v27, "scrimView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "insertSubview:aboveSubview:", v42, v43);

  }
  return v27;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void (**v22)(void);
  id v23;

  -[ICDocCamViewControllerMeshTransform scrimView](self, "scrimView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDuration:", 0.32);
  LODWORD(v7) = 1051361018;
  LODWORD(v8) = 0;
  LODWORD(v9) = 1.0;
  LODWORD(v10) = 1045220557;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v7, v8, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTimingFunction:", v11);

  LODWORD(v12) = 1045220557;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFromValue:", v13);

  LODWORD(v14) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setToValue:", v15);

  objc_msgSend(v23, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(v23, "setRemovedOnCompletion:", 0);
  -[ICDocCamViewControllerMeshTransform scrimView](self, "scrimView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnimation:forKey:", v23, CFSTR("three"));

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[ICDocCamViewControllerMeshTransform scrimView](self, "scrimView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 0;
  objc_msgSend(v19, "setOpacity:", v20);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  -[ICDocCamViewControllerMeshTransform imageMeshAnimationCompletionBlock](self, "imageMeshAnimationCompletionBlock");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[ICDocCamViewControllerMeshTransform imageMeshAnimationCompletionBlock](self, "imageMeshAnimationCompletionBlock");
    v22 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v22[2]();

    -[ICDocCamViewControllerMeshTransform setImageMeshAnimationCompletionBlock:](self, "setImageMeshAnimationCompletionBlock:", 0);
  }

}

- (void)hide
{
  void *v3;
  void *v4;
  void *v5;

  -[ICDocCamViewControllerMeshTransform animationImageView](self, "animationImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[ICDocCamViewControllerMeshTransform animationImageView](self, "animationImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[ICDocCamViewControllerMeshTransform animationImageView](self, "animationImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);

  -[ICDocCamViewControllerMeshTransform setAnimationImageView:](self, "setAnimationImageView:", 0);
}

- (CGRect)frameForImageInImageViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)MEMORY[0x24BDF6AC8];
  -[ICDocCamViewControllerMeshTransform animationImageView](self, "animationImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  objc_msgSend(v7, "dc_aspectFitImageFrameForViewWithFrame:imageSize:", x, y, width, height, v10, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  -[ICDocCamViewControllerMeshTransform setImageMeshAnimationCompletionBlock:](self, "setImageMeshAnimationCompletionBlock:", a3);
  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDuration:", 0.8);
  objc_msgSend(v4, "setAnimations:", MEMORY[0x24BDBD1A8]);
  v5 = *MEMORY[0x24BDE5970];
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("meshTransform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewControllerMeshTransform previewViewFrame](self, "previewViewFrame");
  -[ICDocCamViewControllerMeshTransform imageQuad](self, "imageQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewControllerMeshTransform imageViewFrame](self, "imageViewFrame");
  -[ICDocCamViewControllerMeshTransform imageMeshTransformWithImageQuad:imageViewFrame:previewBounds:finalTransform:](self, "imageMeshTransformWithImageQuad:imageViewFrame:previewBounds:finalTransform:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromValue:", v8);

  -[ICDocCamViewControllerMeshTransform imageViewFrame](self, "imageViewFrame");
  -[ICDocCamViewControllerMeshTransform imageMeshTransformWithImageQuad:imageViewFrame:previewBounds:finalTransform:](self, "imageMeshTransformWithImageQuad:imageViewFrame:previewBounds:finalTransform:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToValue:", v9);

  objc_msgSend(v6, "setDuration:", 0.45);
  objc_msgSend(v6, "setFillMode:", v5);
  LODWORD(v10) = 0;
  LODWORD(v11) = 1.0;
  LODWORD(v12) = 1051361018;
  LODWORD(v13) = 1045220557;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v12, v10, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimingFunction:", v14);

  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFillMode:", v5);
  objc_msgSend(v15, "setKeyTimes:", &unk_24C5D8548);
  objc_msgSend(v15, "setValues:", &unk_24C5D8560);
  objc_msgSend(v15, "setDuration:", 0.55);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v16);

  v38[0] = v6;
  v38[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimations:", v17);

  -[ICDocCamViewControllerMeshTransform animationImageView](self, "animationImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v4, CFSTR("one"));

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDuration:", 0.32);
  LODWORD(v21) = 0;
  LODWORD(v22) = 1.0;
  LODWORD(v23) = 1051361018;
  LODWORD(v24) = 1045220557;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v23, v21, v24, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTimingFunction:", v25);

  LODWORD(v26) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFromValue:", v27);

  LODWORD(v28) = 1045220557;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setToValue:", v29);

  objc_msgSend(v20, "setFillMode:", v5);
  objc_msgSend(v20, "setRemovedOnCompletion:", 0);
  -[ICDocCamViewControllerMeshTransform scrimView](self, "scrimView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addAnimation:forKey:", v20, CFSTR("two"));

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  objc_msgSend(v6, "toValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewControllerMeshTransform animationImageView](self, "animationImageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setMeshTransform:", v32);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  -[ICDocCamViewControllerMeshTransform scrimView](self, "scrimView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = 1045220557;
  objc_msgSend(v36, "setOpacity:", v37);

}

- (id)imageMeshTransformWithImageQuad:(id)a3 imageViewFrame:(CGRect)a4 previewBounds:(CGRect)a5 finalTransform:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double MinX;
  double MaxX;
  CGFloat v37;
  double MinY;
  double MaxY;
  double v40;
  __int128 *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  float64x2_t v67;
  float64x2_t v68;
  double *v69;
  float64x2_t v70;
  float64x2_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  double rect;
  double v85;
  uint64_t v86;
  double v87;
  uint64_t v88;
  double v89;
  double v90;
  __int128 v91;
  double v92;
  double v93;
  uint64_t v94;
  __int128 v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  uint64_t v102;
  float64x2x2_t v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.size.height;
  v12 = a4.size.width;
  v13 = a4.origin.y;
  v14 = a4.origin.x;
  v102 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  objc_msgSend(MEMORY[0x24BDE5710], "meshTransform");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICDocCamViewControllerMeshTransform frameForImageInImageViewFrame:](self, "frameForImageInImageViewFrame:", v14, v13, v12, v11);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v80 = v24;
    -[ICDocCamViewControllerMeshTransform animationImageView](self, "animationImageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    v28 = v27;
    v30 = v29;
    v82 = v29;
    v32 = v31;
    v34 = v33;

    v104.origin.x = v19;
    v104.origin.y = v21;
    v104.size.width = v23;
    v104.size.height = v25;
    MinX = CGRectGetMinX(v104);
    v105.origin.x = v28;
    v105.origin.y = v30;
    v105.size.width = v32;
    v105.size.height = v34;
    v89 = MinX / CGRectGetWidth(v105);
    v106.origin.x = v19;
    v106.origin.y = v21;
    v106.size.width = v23;
    v106.size.height = v80;
    MaxX = CGRectGetMaxX(v106);
    v107.origin.x = v28;
    v107.origin.y = v82;
    v107.size.width = v32;
    v107.size.height = v34;
    v87 = MaxX / CGRectGetWidth(v107);
    v108.origin.x = v19;
    v37 = v19;
    v108.origin.y = v21;
    v108.size.width = v23;
    v108.size.height = v80;
    MinY = CGRectGetMinY(v108);
    v109.origin.x = v28;
    v109.origin.y = v82;
    v109.size.width = v32;
    v109.size.height = v34;
    v85 = MinY / CGRectGetHeight(v109);
    v110.origin.x = v37;
    v110.origin.y = v21;
    v110.size.width = v23;
    v110.size.height = v80;
    MaxY = CGRectGetMaxY(v110);
    v111.origin.x = v28;
    v111.origin.y = v82;
    v111.size.width = v32;
    v111.size.height = v34;
    v95 = xmmword_20CF1B180;
    v40 = MaxY / CGRectGetHeight(v111);
    v96 = v89;
    v97 = v40;
    v98 = 0.0;
    objc_msgSend(v17, "addVertex:", &v95);
    __asm { FMOV            V0.2D, #1.0 }
    v95 = _Q0;
    v96 = v87;
    v97 = v40;
    v98 = 0.0;
    objc_msgSend(v17, "addVertex:", &v95);
    v95 = xmmword_20CF1B190;
    v96 = v87;
    v97 = v85;
    v98 = 0.0;
    objc_msgSend(v17, "addVertex:", &v95);
    v95 = 0uLL;
    v96 = v89;
    v97 = v85;
    v98 = 0.0;
    v46 = &v95;
  }
  else
  {
    objc_msgSend(v16, "bottomLeft");
    v86 = v48;
    v88 = v47;
    objc_msgSend(v16, "bottomRight");
    v81 = v50;
    v83 = v49;
    objc_msgSend(v16, "topRight");
    v90 = width;
    v52 = v51;
    rect = height;
    v54 = v53;
    objc_msgSend(v16, "topLeft");
    v55 = x;
    v57 = v56;
    v58 = y;
    v60 = v59;
    -[ICDocCamViewControllerMeshTransform animationImageView](self, "animationImageView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "bounds");
    v63 = v62;
    v65 = v64;

    v66 = 0;
    *(_QWORD *)&v95 = v88;
    *((_QWORD *)&v95 + 1) = v86;
    v96 = v83;
    v97 = v81;
    v98 = v52;
    v99 = v54;
    v100 = v57;
    v101 = v60;
    v67 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v55 / v63), 0);
    v68 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v58 / v65), 0);
    do
    {
      v69 = (double *)((char *)&v95 + v66);
      v103 = vld2q_f64(v69);
      v70 = vmulq_n_f64(v103.val[0], v90 / v63);
      v103.val[0] = vmulq_n_f64(v103.val[1], rect / v65);
      v103.val[1] = vaddq_f64(v67, v70);
      v71 = vaddq_f64(v68, v103.val[0]);
      vst2q_f64(v69, *(float64x2x2_t *)((char *)&v103 + 16));
      v66 += 32;
    }
    while (v66 != 64);
    v72 = v96;
    v73 = v98;
    v74 = v100;
    v75 = 1.0 - v97;
    v76 = 1.0 - v99;
    v77 = 1.0 - v101;
    v91 = xmmword_20CF1B180;
    v92 = *(double *)&v95;
    v93 = 1.0 - *((double *)&v95 + 1);
    v94 = 0;
    objc_msgSend(v17, "addVertex:", &v91);
    __asm { FMOV            V0.2D, #1.0 }
    v91 = _Q0;
    v92 = v72;
    v93 = v75;
    v94 = 0;
    objc_msgSend(v17, "addVertex:", &v91);
    v91 = xmmword_20CF1B190;
    v92 = v73;
    v93 = v76;
    v94 = 0;
    objc_msgSend(v17, "addVertex:", &v91);
    v91 = 0uLL;
    v92 = v74;
    v93 = v77;
    v94 = 0;
    v46 = &v91;
  }
  objc_msgSend(v17, "addVertex:", v46);
  v96 = 0.0;
  v97 = 0.0;
  v95 = xmmword_20CF1B1A0;
  objc_msgSend(v17, "addFace:", &v95);
  objc_msgSend(v17, "setSubdivisionSteps:", 0);

  return v17;
}

- (UIImageView)animationImageView
{
  return self->_animationImageView;
}

- (void)setAnimationImageView:(id)a3
{
  objc_storeStrong((id *)&self->_animationImageView, a3);
}

- (UIView)scrimView
{
  return self->_scrimView;
}

- (void)setScrimView:(id)a3
{
  objc_storeStrong((id *)&self->_scrimView, a3);
}

- (CGRect)imageViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_imageViewFrame.origin.x;
  y = self->_imageViewFrame.origin.y;
  width = self->_imageViewFrame.size.width;
  height = self->_imageViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setImageViewFrame:(CGRect)a3
{
  self->_imageViewFrame = a3;
}

- (CGRect)previewViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previewViewFrame.origin.x;
  y = self->_previewViewFrame.origin.y;
  width = self->_previewViewFrame.size.width;
  height = self->_previewViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviewViewFrame:(CGRect)a3
{
  self->_previewViewFrame = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (ICDocCamImageQuad)imageQuad
{
  return self->_imageQuad;
}

- (void)setImageQuad:(id)a3
{
  objc_storeStrong((id *)&self->_imageQuad, a3);
}

- (id)imageMeshAnimationCompletionBlock
{
  return self->_imageMeshAnimationCompletionBlock;
}

- (void)setImageMeshAnimationCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageMeshAnimationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_imageQuad, 0);
  objc_storeStrong((id *)&self->_scrimView, 0);
  objc_storeStrong((id *)&self->_animationImageView, 0);
}

@end
