@implementation BCSScanningAnimator

- (id)_perspectiveCorrectedImage
{
  return 0;
}

- (id)_meshTransform:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  __int128 v36;
  double v37;
  double v38;
  uint64_t v39;
  __int128 v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[5];

  objc_msgSend(MEMORY[0x24BDE5710], "meshTransform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[BCSImageQuad copy](self->_imageQuad, "copy");
  objc_msgSend(v6, "adjustOrientationInImageSpace:", 0);
  if (a3)
  {
    v7 = 0;
    v8 = 1.0;
    v9 = 1.0;
    v10 = 1.0;
    v11 = 0;
    v12 = 1.0;
    v13 = 0;
    v14 = 0;
  }
  else
  {
    objc_msgSend(v6, "topLeft");
    v14 = v15;
    objc_msgSend(v6, "topLeft");
    v13 = v16;
    objc_msgSend(v6, "topRight");
    v12 = v17;
    objc_msgSend(v6, "topRight");
    v11 = v18;
    objc_msgSend(v6, "bottomRight");
    v10 = v19;
    objc_msgSend(v6, "bottomRight");
    v9 = v20;
    objc_msgSend(v6, "bottomLeft");
    v7 = v21;
    objc_msgSend(v6, "bottomLeft");
    v8 = v22;
  }
  v44[0] = 0;
  v44[1] = 0;
  v44[2] = v14;
  v44[3] = v13;
  v44[4] = 0;
  objc_msgSend(v5, "addVertex:", v44);
  v40 = xmmword_236DFDD40;
  v41 = v12;
  v42 = v11;
  v43 = 0;
  objc_msgSend(v5, "addVertex:", &v40);
  __asm { FMOV            V0.2D, #1.0 }
  v36 = _Q0;
  v37 = v10;
  v38 = v9;
  v39 = 0;
  objc_msgSend(v5, "addVertex:", &v36);
  v32 = xmmword_236DFDD50;
  v33 = v7;
  v34 = v8;
  v35 = 0;
  objc_msgSend(v5, "addVertex:", &v32);
  v29 = xmmword_236DFDD60;
  v30 = 0;
  v31 = 0;
  objc_msgSend(v5, "addFace:", &v29);
  objc_msgSend(v5, "setSubdivisionSteps:", 0);

  return v5;
}

- (CGPoint)_restPosition
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v6;
  double v7;
  CGPoint result;
  CGRect v9;
  CGRect v10;

  -[UIView frame](self->_focusIndicator, "frame");
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  CGRectGetMidX(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGRectGetMidY(v10);
  _bcs_roundPointToPixels();
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGRect)_restRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  -[BCSImageQuad perspectiveCorrectedSize](self->_imageQuad, "perspectiveCorrectedSize");
  v4 = v3;
  v6 = v5;
  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  v7 = v4 * CGRectGetWidth(v16);
  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  v8 = v6 * CGRectGetHeight(v17);
  if (v7 < 160.0)
    v7 = 160.0;
  if (v8 >= 160.0)
    v9 = v8;
  else
    v9 = 160.0;
  -[BCSScanningAnimator _restPosition](self, "_restPosition");
  v11 = v10 - v7 * 0.5;
  v13 = v12 - v9 * 0.5;
  v14 = v7;
  v15 = v9;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v11;
  return result;
}

- (CGRect)_platterInitialFrameWithDefaultSize:(double)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
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
  CGRect v25;
  CGRect v26;
  CGRect result;

  _bcs_deviceIsPad();
  -[UIImageView frame](self->_targetQRImage, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)-[BCSImageQuad copy](self->_imageQuad, "copy");
  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  objc_msgSend(v12, "setBounds:");
  objc_msgSend(v12, "denormalize");
  objc_msgSend(v12, "perspectiveCorrectedSize");
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  CGRectGetMidX(v25);
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  CGRectGetMidY(v26);
  _bcs_roundRectToPixels();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGPoint)_qrImagePopScaleFactor
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[BCSDissolveEffectView frame](self->_platterView, "frame");
  v4 = v3;
  v6 = v5;
  -[UIImageView frame](self->_targetQRImage, "frame");
  v8 = (v4 + -20.0) / v7;
  v10 = (v6 + -20.0) / v9;
  result.y = v10;
  result.x = v8;
  return result;
}

- (CGPoint)_appclipCodeScaleFactor
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[UIView frame](self->_circularContainerView, "frame");
  v4 = v3;
  v6 = v5;
  -[UIImageView bounds](self->_targetQRImage, "bounds");
  v8 = v4 / v7;
  v10 = v6 / v9;
  result.y = v10;
  result.x = v8;
  return result;
}

- (void)_animateFocusIndicator:(BOOL)a3 duration:(double)a4 position:(CGPoint)a5
{
  double y;
  double x;
  _BOOL8 v8;
  UIView *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double Width;
  double v22;
  double Height;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[3];
  _QWORD v52[4];
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  y = a5.y;
  x = a5.x;
  v8 = a3;
  v52[3] = *MEMORY[0x24BDAC8D0];
  v10 = self->_focusIndicator;
  _bcs_mainScreenScale();
  v12 = v11;
  -[UIView layer](v10, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRasterizationScale:", v12);

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("meshTransform"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", v8 ^ 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFromValue:", v15);

  -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setToValue:", v16);

  objc_msgSend(v14, "setDuration:", a4);
  v17 = *MEMORY[0x24BDE5970];
  objc_msgSend(v14, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(v14, "setRemovedOnCompletion:", 0);
  v18 = *MEMORY[0x24BDE5D28];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimingFunction:", v19);

  -[UIView layer](v10, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAnimation:forKey:", v14, CFSTR("meshTransform"));

  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  Width = CGRectGetWidth(v53);
  -[UIView bounds](v10, "bounds");
  v22 = CGRectGetWidth(v54);
  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  Height = CGRectGetHeight(v55);
  -[UIView bounds](v10, "bounds");
  v24 = CGRectGetHeight(v56);
  if (!v8)
  {
    v25 = v24;
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform.scale.x"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = Width / v22;
    v52[0] = &unk_250869930;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27 * 1.05);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v28;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27 * 1.25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setValues:", v30);

    objc_msgSend(v26, "setKeyTimes:", &unk_250869BB8);
    objc_msgSend(v26, "setDuration:", a4);
    objc_msgSend(v26, "setFillMode:", v17);
    objc_msgSend(v26, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v18);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTimingFunction:", v31);

    -[UIView layer](v10, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addAnimation:forKey:", v26, CFSTR("transform.scale.x"));

    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform.scale.y"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = Height / v25;
    v51[0] = &unk_250869930;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v34 * 1.05);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v35;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v34 * 1.25);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setValues:", v37);

    objc_msgSend(v33, "setKeyTimes:", &unk_250869BD0);
    objc_msgSend(v33, "setDuration:", a4);
    objc_msgSend(v33, "setFillMode:", v17);
    objc_msgSend(v33, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v18);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTimingFunction:", v38);

    -[UIView layer](v10, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addAnimation:forKey:", v33, CFSTR("transform.scale.y"));

  }
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"), v24);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x24BDD1968];
  v42 = y;
  v43 = x;
  if (!v8)
    -[UIView position](v10, "position", x, y);
  objc_msgSend(v41, "valueWithCGPoint:", v43, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFromValue:", v44);

  v45 = (void *)MEMORY[0x24BDD1968];
  if (v8)
  {
    -[UIView position](v10, "position");
    x = v46;
    y = v47;
  }
  objc_msgSend(v45, "valueWithCGPoint:", x, y);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setToValue:", v48);

  objc_msgSend(v40, "setDuration:", a4);
  objc_msgSend(v40, "setFillMode:", v17);
  objc_msgSend(v40, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v18);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTimingFunction:", v49);

  -[UIView layer](v10, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addAnimation:forKey:", v40, CFSTR("position"));

}

- (void)_performSquareMeshTransformWithoutAnimating
{
  UIView *v3;
  double v4;
  double v5;
  void *v6;
  double Width;
  double v8;
  double Height;
  CGFloat v10;
  double MidX;
  double v12;
  double v13;
  double MidY;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _OWORD v28[8];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGAffineTransform v37;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v3 = self->_focusIndicator;
  _bcs_mainScreenScale();
  v5 = v4;
  -[UIImageView layer](self->_targetQRImage, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRasterizationScale:", v5);

  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  Width = CGRectGetWidth(v43);
  -[UIView bounds](v3, "bounds");
  v8 = CGRectGetWidth(v44);
  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  Height = CGRectGetHeight(v45);
  -[UIView bounds](v3, "bounds");
  v10 = CGRectGetHeight(v46);
  memset(&v42, 0, sizeof(v42));
  CGAffineTransformMakeScale(&v42, Width / v8 * 1.25, Height / v10 * 1.25);
  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  MidX = CGRectGetMidX(v47);
  -[UIView center](v3, "center");
  v13 = v12;
  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  MidY = CGRectGetMidY(v48);
  -[UIView center](v3, "center");
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeTranslation(&v41, MidX - v13, MidY - v15);
  t1 = v42;
  t2 = v41;
  CGAffineTransformConcat(&v40, &t1, &t2);
  v37 = v40;
  -[UIView setTransform:](v3, "setTransform:", &v37);
  -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](v3, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMeshTransform:", v16);

  -[BCSScanningAnimator _restPosition](self, "_restPosition");
  v19 = v18;
  v21 = v20;
  -[BCSDissolveEffectView layer](self->_platterView, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPosition:", v19, v21);

  v23 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v33 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v34 = v23;
  v24 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v35 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v36 = v24;
  v25 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v29 = *MEMORY[0x24BDE5598];
  v30 = v25;
  v26 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v32 = v26;
  -[BCSDissolveEffectView layer](self->_platterView, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v33;
  v28[5] = v34;
  v28[6] = v35;
  v28[7] = v36;
  v28[0] = v29;
  v28[1] = v30;
  v28[2] = v31;
  v28[3] = v32;
  objc_msgSend(v27, "setTransform:", v28);

}

- (void)_performSquareMeshTransform:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  double v6;
  UIView *v7;
  __int128 v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double MidX;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  UIView *v70;
  _OWORD v71[8];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  id v81;
  _OWORD v82[3];
  void *v83;
  _QWORD v84[3];
  _QWORD v85[5];
  CGRect v86;
  CGRect v87;

  v4 = a3;
  v85[3] = *MEMORY[0x24BDAC8D0];
  v69 = a4;
  if (v4)
    v6 = 0.6;
  else
    v6 = 0.4;
  v7 = self->_focusIndicator;
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v82[0] = *MEMORY[0x24BDBD8B8];
  v82[1] = v8;
  v82[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v70 = v7;
  -[UIView setTransform:](v7, "setTransform:", v82);
  _bcs_mainScreenScale();
  v10 = v9;
  -[UIImageView layer](self->_targetQRImage, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRasterizationScale:", v10);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v12 = (void *)MEMORY[0x24BDE57D8];
  v80[0] = MEMORY[0x24BDAC760];
  v80[1] = 3221225472;
  v80[2] = __62__BCSScanningAnimator__performSquareMeshTransform_completion___block_invoke;
  v80[3] = &unk_250863C90;
  v68 = v69;
  v81 = v68;
  objc_msgSend(v12, "setCompletionBlock:", v80);
  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  MidX = CGRectGetMidX(v86);
  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  -[BCSScanningAnimator _animateFocusIndicator:duration:position:](self, "_animateFocusIndicator:duration:position:", v4, v6, MidX, CGRectGetMidY(v87));
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform.scale"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.05);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v15;
    v85[1] = &unk_250869930;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v85[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v85, 3);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v84[0] = &unk_250869930;
    v84[1] = &unk_2508699B8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.05);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v84[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 3);
    v17 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v17;
  }
  v18 = (void *)v17;
  objc_msgSend(v14, "setValues:", v17);
  if (v4)
  {

    v19 = &unk_250869BE8;
  }
  else
  {
    v19 = &unk_250869C00;
  }

  objc_msgSend(v14, "setKeyTimes:", v19);
  objc_msgSend(v14, "setDuration:", v6);
  v20 = *MEMORY[0x24BDE5970];
  objc_msgSend(v14, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(v14, "setRemovedOnCompletion:", 0);
  v21 = *MEMORY[0x24BDE5D20];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v83, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimingFunctions:", v23);

  -[UIImageView layer](self->_targetQRImage, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAnimation:forKey:", v14, CFSTR("transform"));

  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v25, "setValues:", &unk_250869C78);
    objc_msgSend(v25, "setKeyTimes:", &unk_250869C90);
    objc_msgSend(v25, "setDuration:", 0.6);
    objc_msgSend(v25, "setRemovedOnCompletion:", 0);
    objc_msgSend(v25, "setFillMode:", v20);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTimingFunction:", v26);

    -[UIView layer](v70, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAnimation:forKey:", v25, CFSTR("opacity"));

    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("meshTransform"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFromValue:", v29);

    -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setToValue:", v30);

    objc_msgSend(v28, "setDuration:", 0.6);
    objc_msgSend(v28, "setFillMode:", v20);
    objc_msgSend(v28, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTimingFunction:", v31);

    -[UIImageView layer](self->_targetQRImage, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addAnimation:forKey:", v28, CFSTR("meshTransform"));

    -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView layer](self->_targetQRImage, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setMeshTransform:", v33);

    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x24BDD1968];
    -[BCSDissolveEffectView layer](self->_platterView, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "position");
    objc_msgSend(v36, "valueWithCGPoint:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFromValue:", v38);

    v39 = (void *)MEMORY[0x24BDD1968];
    -[BCSScanningAnimator _restPosition](self, "_restPosition");
    objc_msgSend(v39, "valueWithCGPoint:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setToValue:", v40);

    objc_msgSend(v35, "setDuration:", 0.6);
    objc_msgSend(v35, "setFillMode:", v20);
    objc_msgSend(v35, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTimingFunction:", v41);

    -[BCSDissolveEffectView layer](self->_platterView, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addAnimation:forKey:", v35, CFSTR("position"));

    -[BCSScanningAnimator _qrImagePopScaleFactor](self, "_qrImagePopScaleFactor");
    v44 = v43;
    v46 = v45;
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.x"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFromValue:", &unk_250869930);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v44);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setToValue:", v48);

    objc_msgSend(v47, "setDuration:", 0.6);
    objc_msgSend(v47, "setFillMode:", v20);
    objc_msgSend(v47, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setTimingFunction:", v49);

    -[UIImageView layer](self->_targetQRImage, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addAnimation:forKey:", v47, CFSTR("transform.scale.x"));

    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.y"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setFromValue:", &unk_250869930);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v46);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setToValue:", v52);

    objc_msgSend(v51, "setDuration:", 0.6);
    objc_msgSend(v51, "setFillMode:", v20);
    objc_msgSend(v51, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setTimingFunction:", v53);

    -[UIImageView layer](self->_targetQRImage, "layer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addAnimation:forKey:", v51, CFSTR("transform.scale.y"));

    -[BCSScanningAnimator _restPosition](self, "_restPosition");
    v56 = v55;
    v58 = v57;
    -[BCSDissolveEffectView layer](self->_platterView, "layer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setPosition:", v56, v58);

    v60 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v76 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v77 = v60;
    v61 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v78 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v79 = v61;
    v62 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v72 = *MEMORY[0x24BDE5598];
    v73 = v62;
    v63 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v74 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v75 = v63;
    -[BCSDissolveEffectView layer](self->_platterView, "layer");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v71[4] = v76;
    v71[5] = v77;
    v71[6] = v78;
    v71[7] = v79;
    v71[0] = v72;
    v71[1] = v73;
    v71[2] = v74;
    v71[3] = v75;
    objc_msgSend(v64, "setTransform:", v71);

  }
  else
  {
    objc_msgSend(v25, "setValues:", &unk_250869C18);
    objc_msgSend(v25, "setKeyTimes:", &unk_250869C30);
    objc_msgSend(v25, "setDuration:", 0.4);
    objc_msgSend(v25, "setRemovedOnCompletion:", 0);
    objc_msgSend(v25, "setFillMode:", v20);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTimingFunction:", v65);

    -[BCSDissolveEffectView layer](self->_platterView, "layer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addAnimation:forKey:", v25, CFSTR("opacity"));

    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setValues:", &unk_250869C48);
    objc_msgSend(v28, "setKeyTimes:", &unk_250869C60);
    objc_msgSend(v28, "setDuration:", 0.4);
    objc_msgSend(v28, "setRemovedOnCompletion:", 0);
    objc_msgSend(v28, "setFillMode:", v20);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTimingFunction:", v67);

    -[UIVisualEffectView layer](self->_blurView, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addAnimation:forKey:", v28, CFSTR("opacity"));
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

uint64_t __62__BCSScanningAnimator__performSquareMeshTransform_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performCircularMeshTransform:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  UIView *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  double MidX;
  double MidY;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  CGRect v37;
  CGRect v38;

  v4 = a3;
  v6 = a4;
  v7 = self->_focusIndicator;
  _bcs_mainScreenScale();
  v9 = v8;
  -[UIView layer](v7, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRasterizationScale:", v9);

  _bcs_mainScreenScale();
  v12 = v11;
  -[UIImageView layer](self->_targetQRImage, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRasterizationScale:", v12);

  _bcs_mainScreenScale();
  v15 = v14;
  -[UIView layer](self->_backgroundView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRasterizationScale:", v15);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v17 = (void *)MEMORY[0x24BDE57D8];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __64__BCSScanningAnimator__performCircularMeshTransform_completion___block_invoke;
  v35[3] = &unk_250863C90;
  v18 = v6;
  v36 = v18;
  objc_msgSend(v17, "setCompletionBlock:", v35);
  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  MidX = CGRectGetMidX(v37);
  -[BCSImageQuad bounds](self->_imageQuad, "bounds");
  MidY = CGRectGetMidY(v38);
  if (!v4)
  {
    -[UIView position](v7, "position");
    v22 = v21;
    -[UIView position](v7, "position");
    MidX = (MidX + v22) * 0.5;
    MidY = (MidY + v23) * 0.5;
  }
  -[BCSScanningAnimator _animateFocusIndicator:duration:position:](self, "_animateFocusIndicator:duration:position:", v4, 0.4, MidX, MidY);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setValues:", &unk_250869CA8);
    objc_msgSend(v24, "setKeyTimes:", &unk_250869CC0);
    objc_msgSend(v24, "setDuration:", 0.4);
    objc_msgSend(v24, "setRemovedOnCompletion:", 0);
    v25 = *MEMORY[0x24BDE5970];
    objc_msgSend(v24, "setFillMode:", *MEMORY[0x24BDE5970]);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTimingFunction:", v26);

    -[UIView layer](self->_circularContainerView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAnimation:forKey:", v24, CFSTR("opacity"));

    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setValues:", &unk_250869CD8);
    objc_msgSend(v28, "setKeyTimes:", &unk_250869CF0);
    objc_msgSend(v28, "setDuration:", 0.4);
    objc_msgSend(v28, "setRemovedOnCompletion:", 0);
    objc_msgSend(v28, "setFillMode:", v25);
    v29 = *MEMORY[0x24BDE5D20];
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTimingFunction:", v30);

    -[UIVisualEffectView layer](self->_blurView, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addAnimation:forKey:", v28, CFSTR("opacity"));

    objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("opacity"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFromValue:", &unk_250869930);
    objc_msgSend(v32, "setToValue:", &unk_250869948);
    objc_msgSend(v32, "setDuration:", 0.4);
    objc_msgSend(v32, "setRemovedOnCompletion:", 0);
    objc_msgSend(v32, "setFillMode:", v25);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTimingFunction:", v33);

    -[UIView layer](v7, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addAnimation:forKey:", v32, CFSTR("opacity"));

    -[BCSScanningAnimator _animateCircularReveal](self, "_animateCircularReveal");
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

uint64_t __64__BCSScanningAnimator__performCircularMeshTransform_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_revealCircularView
{
  UIView **p_backgroundView;
  double Width;
  void *v5;
  double MidX;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  BCSCircularEffectView *circularEffectView;
  CGAffineTransform v22;
  CGAffineTransform v23;
  _OWORD v24[8];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  p_backgroundView = &self->_backgroundView;
  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  -[UIView bounds](*(p_backgroundView - 2), "bounds");
  Width = CGRectGetWidth(v33);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, Width, Width);
  -[UIView bounds](*(p_backgroundView - 2), "bounds");
  MidX = CGRectGetMidX(v34);
  -[UIView bounds](self->_circularContainerView, "bounds");
  objc_msgSend(v5, "setPosition:", MidX, CGRectGetMidY(v35));
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v7);

  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", Width * 0.5);

  objc_storeStrong((id *)p_backgroundView, v5);
  -[UIView insertSubview:below:](self->_circularContainerView, "insertSubview:below:", v5, self->_circularEffectView);
  -[BCSScanningAnimator _restPosition](self, "_restPosition");
  v10 = v9;
  v12 = v11;
  -[UIView layer](self->_circularContainerView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPosition:", v10, v12);

  v14 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v29 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v30 = v14;
  v15 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v32 = v15;
  v16 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v25 = *MEMORY[0x24BDE5598];
  v26 = v16;
  v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v27 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v28 = v17;
  -[UIView layer](self->_circularContainerView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v29;
  v24[5] = v30;
  v24[6] = v31;
  v24[7] = v32;
  v24[0] = v25;
  v24[1] = v26;
  v24[2] = v27;
  v24[3] = v28;
  objc_msgSend(v18, "setTransform:", v24);

  -[BCSScanningAnimator _appclipCodeScaleFactor](self, "_appclipCodeScaleFactor");
  CGAffineTransformMakeScale(&v23, v19, v20);
  circularEffectView = self->_circularEffectView;
  v22 = v23;
  -[BCSCircularEffectView setTransform:](circularEffectView, "setTransform:", &v22);
  -[BCSCircularEffectView revealCenterGlyphAndRings](self->_circularEffectView, "revealCenterGlyphAndRings");

}

- (void)_animateCircularReveal
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (**v19)(void *, BCSCircularEffectView *);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  _OWORD v40[8];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD aBlock[6];
  _QWORD v50[6];

  v3 = CACurrentMediaTime();
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v4 = MEMORY[0x24BDAC760];
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __45__BCSScanningAnimator__animateCircularReveal__block_invoke;
  v50[3] = &unk_2508639E8;
  v50[4] = self;
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v50);
  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("meshTransform"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDamping:", 27.0);
  objc_msgSend(v5, "setStiffness:", 225.0);
  -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", v6);

  -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", v7);

  objc_msgSend(v5, "setDuration:", 0.6);
  v8 = *MEMORY[0x24BDE5970];
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  v9 = *MEMORY[0x24BDE5D20];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v10);

  -[UIImageView layer](self->_targetQRImage, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:forKey:", v5, CFSTR("meshTransform"));

  -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView layer](self->_targetQRImage, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMeshTransform:", v12);

  -[UIView layer](self->_backgroundView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v5, CFSTR("meshTransform"));

  -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_backgroundView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMeshTransform:", v15);

  -[BCSScanningAnimator _appclipCodeScaleFactor](self, "_appclipCodeScaleFactor");
  aBlock[0] = v4;
  aBlock[1] = 3221225472;
  aBlock[2] = __45__BCSScanningAnimator__animateCircularReveal__block_invoke_2;
  aBlock[3] = &__block_descriptor_48_e16_v16__0__UIView_8l;
  aBlock[4] = v17;
  aBlock[5] = v18;
  v19 = (void (**)(void *, BCSCircularEffectView *))_Block_copy(aBlock);
  v19[2](v19, self->_circularEffectView);
  v19[2](v19, (BCSCircularEffectView *)self->_backgroundView);
  v19[2](v19, (BCSCircularEffectView *)self->_targetQRImage);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFromValue:", &unk_250869930);
  objc_msgSend(v20, "setToValue:", &unk_250869948);
  objc_msgSend(v20, "setDuration:", 0.4);
  objc_msgSend(v20, "setBeginTime:", v3 + 0.2);
  objc_msgSend(v20, "setFillMode:", v8);
  objc_msgSend(v20, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTimingFunction:", v21);

  -[CALayer addAnimation:forKey:](self->_ringLayer, "addAnimation:forKey:", v20, CFSTR("transform.scale"));
  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("position"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDamping:", 27.0);
  objc_msgSend(v22, "setStiffness:", 225.0);
  v23 = (void *)MEMORY[0x24BDD1968];
  -[UIView layer](self->_circularContainerView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "position");
  objc_msgSend(v23, "valueWithCGPoint:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFromValue:", v25);

  v26 = (void *)MEMORY[0x24BDD1968];
  -[BCSScanningAnimator _restPosition](self, "_restPosition");
  objc_msgSend(v26, "valueWithCGPoint:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setToValue:", v27);

  objc_msgSend(v22, "setDuration:", 0.6);
  objc_msgSend(v22, "setFillMode:", v8);
  objc_msgSend(v22, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTimingFunction:", v28);

  -[UIView layer](self->_circularContainerView, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addAnimation:forKey:", v22, CFSTR("position"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  -[BCSCircularEffectView animateCenterGlyphAndRings](self->_circularEffectView, "animateCenterGlyphAndRings");
  -[BCSScanningAnimator _restPosition](self, "_restPosition");
  v31 = v30;
  v33 = v32;
  -[UIView layer](self->_circularContainerView, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setPosition:", v31, v33);

  v35 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v45 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v46 = v35;
  v36 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v47 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v48 = v36;
  v37 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v41 = *MEMORY[0x24BDE5598];
  v42 = v37;
  v38 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v43 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v44 = v38;
  -[UIView layer](self->_circularContainerView, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v45;
  v40[5] = v46;
  v40[6] = v47;
  v40[7] = v48;
  v40[0] = v41;
  v40[1] = v42;
  v40[2] = v43;
  v40[3] = v44;
  objc_msgSend(v39, "setTransform:", v40);

}

void __45__BCSScanningAnimator__animateCircularReveal__block_invoke(uint64_t a1)
{
  double Width;
  void *v3;
  double MidX;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "bounds");
  Width = CGRectGetWidth(v9);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, Width, Width);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "bounds");
  MidX = CGRectGetMidX(v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "bounds");
  objc_msgSend(v3, "setPosition:", MidX, CGRectGetMidY(v11));
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", Width * 0.5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "insertSubview:below:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = v3;

}

void __45__BCSScanningAnimator__animateCircularReveal__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("transform.scale.x"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDamping:", 27.0);
  objc_msgSend(v4, "setStiffness:", 225.0);
  v5 = (void *)MEMORY[0x24BDD16E0];
  if (v3)
  {
    objc_msgSend(v3, "transform");
    v6 = *(double *)&v20;
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v6 = 0.0;
  }
  objc_msgSend(v5, "numberWithDouble:", v6, v20, (_QWORD)v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToValue:", v8);

  objc_msgSend(v4, "setDuration:", 0.6);
  v9 = *MEMORY[0x24BDE5970];
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  v10 = *MEMORY[0x24BDE5D20];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v11);

  objc_msgSend(v3, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAnimation:forKey:", v4, CFSTR("transform.scale.x"));

  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("transform.scale.y"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDamping:", 27.0);
  objc_msgSend(v13, "setStiffness:", 225.0);
  v14 = (void *)MEMORY[0x24BDD16E0];
  if (v3)
  {
    objc_msgSend(v3, "transform");
    v15 = *((double *)&v22 + 1);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
    v15 = 0.0;
  }
  objc_msgSend(v14, "numberWithDouble:", v15, v21, v22, v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFromValue:", v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setToValue:", v17);

  objc_msgSend(v13, "setDuration:", 0.6);
  objc_msgSend(v13, "setFillMode:", v9);
  objc_msgSend(v13, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimingFunction:", v18);

  objc_msgSend(v3, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v13, CFSTR("transform.scale.y"));

}

- (void)_setUpBlurViewIfNeeded
{
  void *v3;
  BCSDissolveEffectView *platterView;
  UIVisualEffectView *v5;
  UIVisualEffectView *blurView;
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
  void *v21;
  BCSDissolveEffectView *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  if (!self->_blurView)
  {
    -[UIView superview](self->_focusIndicator, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    platterView = self->_platterView;
    if (!platterView)
      platterView = (BCSDissolveEffectView *)self->_circularContainerView;
    v22 = platterView;
    objc_msgSend(MEMORY[0x24BEBD428], "_effectWithBlurRadius:scale:", 10.0, 0.25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v23);
    blurView = self->_blurView;
    self->_blurView = v5;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundColor:](self->_blurView, "setBackgroundColor:", v7);

    objc_msgSend(v3, "insertSubview:below:", self->_blurView, v22);
    v8 = (void *)MEMORY[0x24BDD1628];
    -[UIVisualEffectView topAnchor](self->_blurView, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    -[UIVisualEffectView bottomAnchor](self->_blurView, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v16;
    -[UIVisualEffectView leftAnchor](self->_blurView, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v11;
    -[UIVisualEffectView rightAnchor](self->_blurView, "rightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateConstraints:", v15);

    -[UIVisualEffectView setAlpha:](self->_blurView, "setAlpha:", 0.0);
  }
}

- (void)animatePushWithCompletion:(id)a3 shouldAnimate:(BOOL)a4
{
  id v6;
  void *v7;
  BCSDissolveEffectView *v8;
  BCSDissolveEffectView *v9;
  BCSDissolveEffectView *platterView;
  double MidX;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  CGRect v16;
  CGRect v17;

  v6 = a3;
  -[UIView superview](self->_focusIndicator, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_platterView)
  {
    v8 = [BCSDissolveEffectView alloc];
    -[BCSScanningAnimator _platterInitialFrameWithDefaultSize:](self, "_platterInitialFrameWithDefaultSize:", 144.0);
    v9 = -[BCSDissolveEffectView initWithFrame:](v8, "initWithFrame:");
    platterView = self->_platterView;
    self->_platterView = v9;

    -[BCSDissolveEffectView setContentView:](self->_platterView, "setContentView:", self->_targetQRImage);
    -[BCSDissolveEffectView setAutoresizingMask:](self->_platterView, "setAutoresizingMask:", 45);
    -[BCSDissolveEffectView bounds](self->_platterView, "bounds");
    MidX = CGRectGetMidX(v16);
    -[BCSDissolveEffectView bounds](self->_platterView, "bounds");
    -[UIImageView setPosition:](self->_targetQRImage, "setPosition:", MidX, CGRectGetMidY(v17));
    -[BCSDissolveEffectView addSubview:](self->_platterView, "addSubview:", self->_targetQRImage);
    objc_msgSend(v7, "insertSubview:below:", self->_platterView, self->_focusIndicator);
  }
  -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView layer](self->_targetQRImage, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMeshTransform:", v12);

  -[BCSScanningAnimator _setUpBlurViewIfNeeded](self, "_setUpBlurViewIfNeeded");
  if (a4)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __63__BCSScanningAnimator_animatePushWithCompletion_shouldAnimate___block_invoke;
    v14[3] = &unk_250863CD8;
    v15 = v6;
    -[BCSScanningAnimator _performSquareMeshTransform:completion:](self, "_performSquareMeshTransform:completion:", 0, v14);

  }
  else
  {
    -[BCSScanningAnimator _performSquareMeshTransformWithoutAnimating](self, "_performSquareMeshTransformWithoutAnimating");
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

uint64_t __63__BCSScanningAnimator_animatePushWithCompletion_shouldAnimate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)animatePopWithAppImageBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__BCSScanningAnimator_animatePopWithAppImageBlock_completion___block_invoke;
  v10[3] = &unk_250863D28;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[BCSScanningAnimator _performSquareMeshTransform:completion:](self, "_performSquareMeshTransform:completion:", 1, v10);

}

void __62__BCSScanningAnimator_animatePopWithAppImageBlock_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__BCSScanningAnimator_animatePopWithAppImageBlock_completion___block_invoke_2;
  v5[3] = &unk_250863D00;
  v6 = *(id *)(a1 + 48);
  v7 = a2;
  objc_msgSend(v4, "startAnimationWithDuration:appImageBlock:completion:", v3, v5, 0.4);

}

uint64_t __62__BCSScanningAnimator_animatePopWithAppImageBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)animateAppClipCodeBounceWithCompletion:(id)a3 shouldAnimate:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  UIView *v9;
  UIView *circularContainerView;
  double MidX;
  void *v12;
  void *v13;
  double Width;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  UIImageView *targetQRImage;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CALayer *v26;
  CALayer *ringLayer;
  void *v28;
  void *v29;
  BCSCircularEffectView *v30;
  BCSCircularEffectView *v31;
  BCSCircularEffectView *circularEffectView;
  UIView *focusIndicator;
  _QWORD v34[5];
  id v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  _OWORD v38[3];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v6 = a3;
  -[UIView superview](self->_focusIndicator, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_circularContainerView)
  {
    v8 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[BCSScanningAnimator _platterInitialFrameWithDefaultSize:](self, "_platterInitialFrameWithDefaultSize:", 200.0);
    v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
    circularContainerView = self->_circularContainerView;
    self->_circularContainerView = v9;

    -[UIView setAutoresizingMask:](self->_circularContainerView, "setAutoresizingMask:", 45);
    -[UIView setAccessibilityIgnoresInvertColors:](self->_circularContainerView, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIView bounds](self->_circularContainerView, "bounds");
    MidX = CGRectGetMidX(v42);
    -[UIView bounds](self->_circularContainerView, "bounds");
    -[UIImageView setPosition:](self->_targetQRImage, "setPosition:", MidX, CGRectGetMidY(v43));
    -[UIView addSubview:](self->_circularContainerView, "addSubview:", self->_targetQRImage);
    objc_msgSend(v7, "insertSubview:below:", self->_circularContainerView, self->_focusIndicator);
  }
  -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView layer](self->_targetQRImage, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMeshTransform:", v12);

  -[UIImageView bounds](self->_targetQRImage, "bounds");
  Width = CGRectGetWidth(v44);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, Width, Width);
  -[UIImageView position](self->_targetQRImage, "position");
  objc_msgSend(v15, "setPosition:");
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v16);

  objc_msgSend(v15, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = Width * 0.5;
  objc_msgSend(v17, "setCornerRadius:", v18);

  targetQRImage = self->_targetQRImage;
  if (targetQRImage)
  {
    -[UIImageView transform](targetQRImage, "transform");
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
  }
  v38[0] = v39;
  v38[1] = v40;
  v38[2] = v41;
  objc_msgSend(v15, "setTransform:", v38);
  -[UIView addSubview:](self->_circularContainerView, "addSubview:", v15);
  objc_storeStrong((id *)&self->_backgroundView, v15);
  v20 = objc_alloc(MEMORY[0x24BEBDB00]);
  objc_msgSend(v15, "bounds");
  v21 = (void *)objc_msgSend(v20, "initWithFrame:");
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", v18);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBackgroundColor:", v23);

  objc_msgSend(v15, "addSubview:", v21);
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A48]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCompositingFilter:", v24);

  objc_msgSend(v21, "layer");
  v26 = (CALayer *)objc_claimAutoreleasedReturnValue();
  ringLayer = self->_ringLayer;
  self->_ringLayer = v26;

  -[BCSScanningAnimator _meshTransform:](self, "_meshTransform:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setMeshTransform:", v28);

  v30 = [BCSCircularEffectView alloc];
  -[UIImageView bounds](self->_targetQRImage, "bounds");
  v31 = -[BCSCircularEffectView initWithFrame:](v30, "initWithFrame:");
  circularEffectView = self->_circularEffectView;
  self->_circularEffectView = v31;

  -[UIView addSubview:](self->_circularContainerView, "addSubview:", self->_circularEffectView);
  -[UIImageView position](self->_targetQRImage, "position");
  -[BCSCircularEffectView setPosition:](self->_circularEffectView, "setPosition:");
  -[BCSScanningAnimator _setUpBlurViewIfNeeded](self, "_setUpBlurViewIfNeeded");
  if (a4)
  {
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __76__BCSScanningAnimator_animateAppClipCodeBounceWithCompletion_shouldAnimate___block_invoke;
    v34[3] = &unk_250863D50;
    v34[4] = self;
    v35 = v6;
    -[BCSScanningAnimator _performCircularMeshTransform:completion:](self, "_performCircularMeshTransform:completion:", 0, v34);

  }
  else
  {
    CGAffineTransformMakeScale(&v37, 0.0, 0.0);
    focusIndicator = self->_focusIndicator;
    v36 = v37;
    -[UIView setTransform:](focusIndicator, "setTransform:", &v36);
    -[BCSScanningAnimator _revealCircularView](self, "_revealCircularView");
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

void __76__BCSScanningAnimator_animateAppClipCodeBounceWithCompletion_shouldAnimate___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __76__BCSScanningAnimator_animateAppClipCodeBounceWithCompletion_shouldAnimate___block_invoke_2;
    v4[3] = &unk_250863CD8;
    v5 = v2;
    objc_msgSend(v3, "animateRingsRotationWithCompletion:", v4);

  }
}

uint64_t __76__BCSScanningAnimator_animateAppClipCodeBounceWithCompletion_shouldAnimate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)prepareCenterGlyphWithImage:(id)a3
{
  -[BCSCircularEffectView prepareCenterGlyphWithImage:](self->_circularEffectView, "prepareCenterGlyphWithImage:", a3);
}

- (void)showCoverView
{
  void *v3;
  void *v4;
  id v5;
  UIVisualEffectView *v6;
  UIVisualEffectView *coverView;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  if (!self->_coverView && !self->_suppressCoverView)
  {
    -[UIView superview](self->_focusIndicator, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD428], "_effectWithBlurRadius:scale:", 10.0, 0.35);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BEBDB38]);
    v6 = (UIVisualEffectView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    coverView = self->_coverView;
    self->_coverView = v6;

    -[UIVisualEffectView setAutoresizingMask:](self->_coverView, "setAutoresizingMask:", 18);
    -[UIVisualEffectView frame](self->_blurView, "frame");
    -[UIVisualEffectView setFrame:](self->_coverView, "setFrame:");
    objc_msgSend(v3, "addSubview:", self->_coverView);
    v8 = (void *)MEMORY[0x24BEBDB00];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __36__BCSScanningAnimator_showCoverView__block_invoke;
    v10[3] = &unk_250863D78;
    v10[4] = self;
    v9 = v4;
    v11 = v9;
    objc_msgSend(v8, "animateWithDuration:animations:", v10, 0.35);

  }
}

uint64_t __36__BCSScanningAnimator_showCoverView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setEffect:", *(_QWORD *)(a1 + 40));
}

- (void)reset
{
  UIVisualEffectView *blurView;
  BCSDissolveEffectView *platterView;
  UIVisualEffectView *coverView;
  UIView *circularContainerView;

  -[UIVisualEffectView removeFromSuperview](self->_blurView, "removeFromSuperview");
  blurView = self->_blurView;
  self->_blurView = 0;

  -[BCSDissolveEffectView removeFromSuperview](self->_platterView, "removeFromSuperview");
  platterView = self->_platterView;
  self->_platterView = 0;

  -[UIVisualEffectView removeFromSuperview](self->_coverView, "removeFromSuperview");
  coverView = self->_coverView;
  self->_coverView = 0;

  -[UIView removeFromSuperview](self->_circularContainerView, "removeFromSuperview");
  circularContainerView = self->_circularContainerView;
  self->_circularContainerView = 0;

}

- (UIView)focusIndicator
{
  return self->_focusIndicator;
}

- (void)setFocusIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_focusIndicator, a3);
}

- (BCSImageQuad)imageQuad
{
  return self->_imageQuad;
}

- (void)setImageQuad:(id)a3
{
  objc_storeStrong((id *)&self->_imageQuad, a3);
}

- (UIImageView)targetQRImage
{
  return self->_targetQRImage;
}

- (void)setTargetQRImage:(id)a3
{
  objc_storeStrong((id *)&self->_targetQRImage, a3);
}

- (BCSVisualCode)targetCode
{
  return self->_targetCode;
}

- (void)setTargetCode:(id)a3
{
  objc_storeStrong((id *)&self->_targetCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetCode, 0);
  objc_storeStrong((id *)&self->_targetQRImage, 0);
  objc_storeStrong((id *)&self->_imageQuad, 0);
  objc_storeStrong((id *)&self->_focusIndicator, 0);
  objc_storeStrong((id *)&self->_circularEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_ringLayer, 0);
  objc_storeStrong((id *)&self->_circularContainerView, 0);
  objc_storeStrong((id *)&self->_coverView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
