@implementation SUUIScalingFlipView

- (SUUIScalingFlipView)initWithFrontView:(id)a3 backView:(id)a4
{
  id v7;
  id v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  SUUIScalingFlipView *v13;
  SUUIScalingFlipView *v14;
  id *p_backView;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  UIView *frontView;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "frame");
  self->_fromFrame.origin.x = v9;
  self->_fromFrame.origin.y = v10;
  self->_fromFrame.size.width = v11;
  self->_fromFrame.size.height = v12;
  v13 = -[SUUIScalingFlipView initWithFrame:](self, "initWithFrame:");
  v14 = v13;
  if (v13)
  {
    p_backView = (id *)&v13->_backView;
    objc_storeStrong((id *)&v13->_backView, a4);
    objc_storeStrong((id *)&v14->_frontView, a3);
    objc_msgSend(*p_backView, "frame");
    v14->_toFrame.origin.x = v16;
    v14->_toFrame.origin.y = v17;
    v14->_toFrame.size.width = v18;
    v14->_toFrame.size.height = v19;
    objc_msgSend(*p_backView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDoubleSided:", 0);

    -[UIView layer](v14->_frontView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDoubleSided:", 0);

    -[SUUIScalingFlipView addSubview:](v14, "addSubview:", *p_backView);
    -[SUUIScalingFlipView addSubview:](v14, "addSubview:", v14->_frontView);
    frontView = v14->_frontView;
    -[SUUIScalingFlipView center](v14, "center");
    -[UIView convertPoint:fromView:](frontView, "convertPoint:fromView:", v14);
    v24 = v23;
    v26 = v25;
    objc_msgSend(*p_backView, "setCenter:");
    -[UIView setCenter:](v14->_frontView, "setCenter:", v24, v26);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BA8]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setName:", CFSTR("multiply"));
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v27, "setValue:forKeyPath:", objc_msgSend(v28, "CGColor"), CFSTR("inputColor"));

    -[SUUIScalingFlipView layer](v14, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFilters:", v30);

  }
  return v14;
}

- (void)performFlipWithCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  id completionBlock;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double duration;
  float v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginIgnoringInteractionEvents");

  if (self->_completionBlock != v20)
  {
    v5 = (void *)objc_msgSend(v20, "copy");
    completionBlock = self->_completionBlock;
    self->_completionBlock = v5;

  }
  -[UIView layer](self->_frontView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIScalingFlipView _frontLayerAnimation](self, "_frontLayerAnimation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("flipAnimation"));

  -[UIView layer](self->_backView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIScalingFlipView _backLayerAnimation](self, "_backLayerAnimation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v10, CFSTR("flipAnimation"));

  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDBCE30];
  -[SUUIScalingFlipView _inputColorAnimation](self, "_inputColorAnimation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIScalingFlipView _positionAnimation](self, "_positionAnimation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithObjects:", v13, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAnimations:", v15);

  objc_msgSend(v11, "setDelegate:", self);
  duration = self->_duration;
  UIAnimationDragCoefficient();
  objc_msgSend(v11, "setDuration:", duration * v17);
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(v11, "setRemovedOnCompletion:", 0);
  -[SUUIScalingFlipView _timingFunction](self, "_timingFunction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunction:", v18);

  -[SUUIScalingFlipView layer](self, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v11, CFSTR("multiplyAndPositionAnimation"));

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void (**completionBlock)(id, SUUIScalingFlipView *);
  void *v23;
  CATransform3D v24;
  _OWORD v25[8];

  -[SUUIScalingFlipView layer](self, "layer", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  -[UIView layer](self->_backView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  -[UIView layer](self->_frontView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  -[UIView layer](self->_backView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v25[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v25[5] = v9;
  v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v25[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v25[7] = v10;
  v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v25[0] = *MEMORY[0x24BDE5598];
  v25[1] = v11;
  v12 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v25[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v25[3] = v12;
  objc_msgSend(v8, "setTransform:", v25);

  -[UIView layer](self->_frontView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeRotation(&v24, 3.14159265, 0.0, 1.0, 0.0);
  objc_msgSend(v13, "setTransform:", &v24);

  -[SUUIScalingFlipView setFrame:](self, "setFrame:", self->_toFrame.origin.x, self->_toFrame.origin.y, self->_toFrame.size.width, self->_toFrame.size.height);
  -[SUUIScalingFlipView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[UIView setFrame:](self->_backView, "setFrame:");
  -[UIView setFrame:](self->_frontView, "setFrame:", v15, v17, v19, v21);
  -[UIView setNeedsDisplay](self->_backView, "setNeedsDisplay");
  completionBlock = (void (**)(id, SUUIScalingFlipView *))self->_completionBlock;
  if (completionBlock)
    completionBlock[2](completionBlock, self);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "endIgnoringInteractionEvents");

}

- (id)_backLayerAnimation
{
  double width;
  double height;
  int64_t direction;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat m33;
  double v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double duration;
  float v30;
  void *v31;
  CGFloat m34;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CATransform3D v41;
  CATransform3D v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CGFloat v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  CGFloat v60;
  _QWORD v61[4];

  v61[3] = *MEMORY[0x24BDAC8D0];
  width = self->_toFrame.size.width;
  height = self->_toFrame.size.height;
  direction = self->_direction;
  if ((direction & 0xFFFFFFFFFFFFFFFELL) == 2)
    v6 = 0.0;
  else
    v6 = 1.0;
  if ((direction & 0xFFFFFFFFFFFFFFFELL) == 2)
    v7 = 1.0;
  else
    v7 = 0.0;
  v8 = dbl_241EFBFC0[(direction & 0xFFFFFFFFFFFFFFFDLL) == 0];
  v9 = 1.0 / ((width + height) * 0.5 * 3.0);
  v10 = self->_fromFrame.size.height;
  v11 = self->_fromFrame.size.width / width;
  v40 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  *(_OWORD *)&v41.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v39 = *(_OWORD *)&v41.m21;
  *(_OWORD *)&v41.m23 = v40;
  *(_OWORD *)&v41.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v38 = *(_OWORD *)&v41.m31;
  v13 = v10 / height;
  v41.m33 = *(CGFloat *)(MEMORY[0x24BDE5598] + 80);
  m33 = v41.m33;
  v37 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  *(_OWORD *)&v41.m11 = *MEMORY[0x24BDE5598];
  v36 = *(_OWORD *)&v41.m11;
  *(_OWORD *)&v41.m13 = v37;
  v41.m34 = v9;
  v35 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  *(_OWORD *)&v41.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v34 = *(_OWORD *)&v41.m41;
  *(_OWORD *)&v41.m43 = v35;
  CATransform3DScale(&v42, &v41, v11, 1.0, 1.0);
  v57 = *(_OWORD *)&v42.m21;
  v58 = *(_OWORD *)&v42.m23;
  v59 = *(_OWORD *)&v42.m31;
  v60 = v42.m33;
  v55 = *(_OWORD *)&v42.m11;
  v56 = *(_OWORD *)&v42.m13;
  v53 = *(_OWORD *)&v42.m41;
  v54 = *(_OWORD *)&v42.m43;
  *(_OWORD *)&v41.m21 = *(_OWORD *)&v42.m21;
  *(_OWORD *)&v41.m23 = *(_OWORD *)&v42.m23;
  *(_OWORD *)&v41.m31 = *(_OWORD *)&v42.m31;
  v41.m33 = v42.m33;
  *(_OWORD *)&v41.m11 = *(_OWORD *)&v42.m11;
  *(_OWORD *)&v41.m13 = *(_OWORD *)&v42.m13;
  v41.m34 = v42.m34;
  *(_OWORD *)&v41.m41 = *(_OWORD *)&v42.m41;
  *(_OWORD *)&v41.m43 = *(_OWORD *)&v42.m43;
  CATransform3DRotate(&v42, &v41, v8, v7, v6, 0.0);
  v57 = *(_OWORD *)&v42.m21;
  v58 = *(_OWORD *)&v42.m23;
  v59 = *(_OWORD *)&v42.m31;
  v60 = v42.m33;
  v55 = *(_OWORD *)&v42.m11;
  v56 = *(_OWORD *)&v42.m13;
  m34 = v42.m34;
  v53 = *(_OWORD *)&v42.m41;
  v54 = *(_OWORD *)&v42.m43;
  *(_OWORD *)&v41.m21 = v39;
  *(_OWORD *)&v41.m23 = v40;
  *(_OWORD *)&v41.m31 = v38;
  v41.m33 = m33;
  *(_OWORD *)&v41.m11 = v36;
  *(_OWORD *)&v41.m13 = v37;
  v41.m34 = v9;
  *(_OWORD *)&v41.m41 = v34;
  *(_OWORD *)&v41.m43 = v35;
  CATransform3DScale(&v42, &v41, v11 + (1.0 - v11) * 0.330000013, v13 + (1.0 - v13) * 0.330000013, 1.0);
  v49 = *(_OWORD *)&v42.m21;
  v50 = *(_OWORD *)&v42.m23;
  v51 = *(_OWORD *)&v42.m31;
  v52 = v42.m33;
  v47 = *(_OWORD *)&v42.m11;
  v48 = *(_OWORD *)&v42.m13;
  v45 = *(_OWORD *)&v42.m41;
  v46 = *(_OWORD *)&v42.m43;
  *(_OWORD *)&v41.m21 = *(_OWORD *)&v42.m21;
  *(_OWORD *)&v41.m23 = *(_OWORD *)&v42.m23;
  *(_OWORD *)&v41.m31 = *(_OWORD *)&v42.m31;
  v41.m33 = v42.m33;
  *(_OWORD *)&v41.m11 = *(_OWORD *)&v42.m11;
  *(_OWORD *)&v41.m13 = *(_OWORD *)&v42.m13;
  v41.m34 = v42.m34;
  *(_OWORD *)&v41.m41 = *(_OWORD *)&v42.m41;
  *(_OWORD *)&v41.m43 = *(_OWORD *)&v42.m43;
  CATransform3DRotate(&v42, &v41, v8 * 0.5, v7, v6, 0.0);
  v49 = *(_OWORD *)&v42.m21;
  v50 = *(_OWORD *)&v42.m23;
  v51 = *(_OWORD *)&v42.m31;
  v52 = v42.m33;
  v47 = *(_OWORD *)&v42.m11;
  v48 = *(_OWORD *)&v42.m13;
  v14 = v42.m34;
  v45 = *(_OWORD *)&v42.m41;
  v46 = *(_OWORD *)&v42.m43;
  *(_OWORD *)&v41.m21 = v39;
  *(_OWORD *)&v41.m23 = v40;
  *(_OWORD *)&v41.m31 = v38;
  v41.m33 = m33;
  *(_OWORD *)&v41.m11 = v36;
  *(_OWORD *)&v41.m13 = v37;
  v41.m34 = v9;
  *(_OWORD *)&v41.m41 = v34;
  *(_OWORD *)&v41.m43 = v35;
  CATransform3DScale(&v42, &v41, 1.0, 1.0, 1.0);
  *(_OWORD *)&v41.m21 = *(_OWORD *)&v42.m21;
  *(_OWORD *)&v41.m23 = *(_OWORD *)&v42.m23;
  *(_OWORD *)&v41.m31 = *(_OWORD *)&v42.m31;
  v41.m33 = v42.m33;
  *(_OWORD *)&v41.m11 = *(_OWORD *)&v42.m11;
  *(_OWORD *)&v41.m13 = *(_OWORD *)&v42.m13;
  v15 = v42.m34;
  v43 = *(_OWORD *)&v42.m41;
  v44 = *(_OWORD *)&v42.m43;
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDBCE30];
  LODWORD(v18) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 0.5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayWithObjects:", v19, v21, v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setKeyTimes:", v24);

  *(_OWORD *)&v42.m21 = v57;
  *(_OWORD *)&v42.m23 = v58;
  *(_OWORD *)&v42.m31 = v59;
  v42.m33 = v60;
  *(_OWORD *)&v42.m11 = v55;
  *(_OWORD *)&v42.m13 = v56;
  v42.m34 = m34;
  *(_OWORD *)&v42.m41 = v53;
  *(_OWORD *)&v42.m43 = v54;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v42);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v25;
  *(_OWORD *)&v42.m21 = v49;
  *(_OWORD *)&v42.m23 = v50;
  *(_OWORD *)&v42.m31 = v51;
  v42.m33 = v52;
  *(_OWORD *)&v42.m11 = v47;
  *(_OWORD *)&v42.m13 = v48;
  v42.m34 = v14;
  *(_OWORD *)&v42.m41 = v45;
  *(_OWORD *)&v42.m43 = v46;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v42);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v26;
  *(_OWORD *)&v42.m21 = *(_OWORD *)&v41.m21;
  *(_OWORD *)&v42.m23 = *(_OWORD *)&v41.m23;
  *(_OWORD *)&v42.m31 = *(_OWORD *)&v41.m31;
  v42.m33 = v41.m33;
  *(_OWORD *)&v42.m11 = *(_OWORD *)&v41.m11;
  *(_OWORD *)&v42.m13 = *(_OWORD *)&v41.m13;
  v42.m34 = v15;
  *(_OWORD *)&v42.m41 = v43;
  *(_OWORD *)&v42.m43 = v44;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v42);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValues:", v28);

  duration = self->_duration;
  UIAnimationDragCoefficient();
  objc_msgSend(v16, "setDuration:", duration * v30);
  objc_msgSend(v16, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(v16, "setRemovedOnCompletion:", 0);
  -[SUUIScalingFlipView _timingFunction](self, "_timingFunction");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimingFunction:", v31);

  return v16;
}

- (id)_frontLayerAnimation
{
  double width;
  double height;
  int64_t direction;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat m33;
  CGFloat m34;
  CGFloat v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double duration;
  float v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CATransform3D v39;
  CATransform3D v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CGFloat v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CGFloat v56;
  _QWORD v57[4];

  v57[3] = *MEMORY[0x24BDAC8D0];
  width = self->_fromFrame.size.width;
  height = self->_fromFrame.size.height;
  direction = self->_direction;
  if ((direction & 0xFFFFFFFFFFFFFFFELL) == 2)
    v6 = 0.0;
  else
    v6 = 1.0;
  if ((direction & 0xFFFFFFFFFFFFFFFELL) == 2)
    v7 = 1.0;
  else
    v7 = 0.0;
  v8 = dbl_241EFBFD0[(direction & 0xFFFFFFFFFFFFFFFDLL) == 0];
  v9 = 1.0 / ((width + height) * 0.5 * 3.0);
  v10 = self->_toFrame.size.width / width;
  v11 = self->_toFrame.size.height / height;
  v38 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  *(_OWORD *)&v39.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v37 = *(_OWORD *)&v39.m21;
  *(_OWORD *)&v39.m23 = v38;
  *(_OWORD *)&v39.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v36 = *(_OWORD *)&v39.m31;
  v39.m33 = *(CGFloat *)(MEMORY[0x24BDE5598] + 80);
  m33 = v39.m33;
  v35 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  *(_OWORD *)&v39.m11 = *MEMORY[0x24BDE5598];
  v34 = *(_OWORD *)&v39.m11;
  *(_OWORD *)&v39.m13 = v35;
  v39.m34 = v9;
  v33 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  *(_OWORD *)&v39.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v32 = *(_OWORD *)&v39.m41;
  *(_OWORD *)&v39.m43 = v33;
  CATransform3DScale(&v40, &v39, (v10 + -1.0) * 0.5 + 1.0, (v11 + -1.0) * 0.5 + 1.0, 1.0);
  v53 = *(_OWORD *)&v40.m21;
  v54 = *(_OWORD *)&v40.m23;
  v55 = *(_OWORD *)&v40.m31;
  v56 = v40.m33;
  v51 = *(_OWORD *)&v40.m11;
  v52 = *(_OWORD *)&v40.m13;
  v49 = *(_OWORD *)&v40.m41;
  v50 = *(_OWORD *)&v40.m43;
  v39 = v40;
  CATransform3DRotate(&v40, &v39, v8 * 0.5, v7, v6, 0.0);
  v53 = *(_OWORD *)&v40.m21;
  v54 = *(_OWORD *)&v40.m23;
  v55 = *(_OWORD *)&v40.m31;
  v56 = v40.m33;
  v51 = *(_OWORD *)&v40.m11;
  v52 = *(_OWORD *)&v40.m13;
  m34 = v40.m34;
  v49 = *(_OWORD *)&v40.m41;
  v50 = *(_OWORD *)&v40.m43;
  *(_OWORD *)&v39.m21 = v37;
  *(_OWORD *)&v39.m23 = v38;
  *(_OWORD *)&v39.m31 = v36;
  v39.m33 = m33;
  *(_OWORD *)&v39.m11 = v34;
  *(_OWORD *)&v39.m13 = v35;
  v39.m34 = v9;
  *(_OWORD *)&v39.m41 = v32;
  *(_OWORD *)&v39.m43 = v33;
  CATransform3DScale(&v40, &v39, v10, v11, 1.0);
  v45 = *(_OWORD *)&v40.m21;
  v46 = *(_OWORD *)&v40.m23;
  v47 = *(_OWORD *)&v40.m31;
  v48 = v40.m33;
  v43 = *(_OWORD *)&v40.m11;
  v44 = *(_OWORD *)&v40.m13;
  v41 = *(_OWORD *)&v40.m41;
  v42 = *(_OWORD *)&v40.m43;
  v39 = v40;
  CATransform3DRotate(&v40, &v39, v8, v7, v6, 0.0);
  v45 = *(_OWORD *)&v40.m21;
  v46 = *(_OWORD *)&v40.m23;
  v47 = *(_OWORD *)&v40.m31;
  v48 = v40.m33;
  v43 = *(_OWORD *)&v40.m11;
  v44 = *(_OWORD *)&v40.m13;
  v14 = v40.m34;
  v41 = *(_OWORD *)&v40.m41;
  v42 = *(_OWORD *)&v40.m43;
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDBCE30];
  LODWORD(v17) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 0.5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = 1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithObjects:", v18, v20, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setKeyTimes:", v23);

  *(_OWORD *)&v40.m21 = v37;
  *(_OWORD *)&v40.m23 = v38;
  *(_OWORD *)&v40.m31 = v36;
  v40.m33 = m33;
  *(_OWORD *)&v40.m11 = v34;
  *(_OWORD *)&v40.m13 = v35;
  v40.m34 = v9;
  *(_OWORD *)&v40.m41 = v32;
  *(_OWORD *)&v40.m43 = v33;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v40);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v24;
  *(_OWORD *)&v40.m21 = v53;
  *(_OWORD *)&v40.m23 = v54;
  *(_OWORD *)&v40.m31 = v55;
  v40.m33 = v56;
  *(_OWORD *)&v40.m11 = v51;
  *(_OWORD *)&v40.m13 = v52;
  v40.m34 = m34;
  *(_OWORD *)&v40.m41 = v49;
  *(_OWORD *)&v40.m43 = v50;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v40);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v25;
  *(_OWORD *)&v40.m21 = v45;
  *(_OWORD *)&v40.m23 = v46;
  *(_OWORD *)&v40.m31 = v47;
  v40.m33 = v48;
  *(_OWORD *)&v40.m11 = v43;
  *(_OWORD *)&v40.m13 = v44;
  v40.m34 = v14;
  *(_OWORD *)&v40.m41 = v41;
  *(_OWORD *)&v40.m43 = v42;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v40);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValues:", v27);

  duration = self->_duration;
  UIAnimationDragCoefficient();
  objc_msgSend(v15, "setDuration:", duration * v29);
  objc_msgSend(v15, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(v15, "setRemovedOnCompletion:", 0);
  -[SUUIScalingFlipView _timingFunction](self, "_timingFunction");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v30);

  return v15;
}

- (id)_inputColorAnimation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("filters.multiply.inputColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.330000013, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCE30];
  LODWORD(v6) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0.5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObjects:", v7, v9, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyTimes:", v12);

  v13 = (void *)MEMORY[0x24BDBCE30];
  v14 = objc_retainAutorelease(v3);
  v15 = objc_msgSend(v14, "CGColor");
  v16 = objc_retainAutorelease(v4);
  v17 = objc_msgSend(v16, "CGColor");
  v18 = objc_retainAutorelease(v14);
  objc_msgSend(v13, "arrayWithObjects:", v15, v17, objc_msgSend(v18, "CGColor"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValues:", v19);

  return v2;
}

- (id)_positionAnimation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  -[SUUIScalingFlipView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "position");
  v4 = v3;
  v6 = v5;

  UIRectGetCenter();
  *(float *)&v7 = v4 + v7 - v4;
  v8 = floorf(*(float *)&v7);
  *(float *)&v7 = v6 + v9 - v6;
  v10 = floorf(*(float *)&v7);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToValue:", v12);

  return v11;
}

- (id)_timingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v3) = 1036831949;
  LODWORD(v2) = 0.25;
  LODWORD(v4) = 0.25;
  LODWORD(v5) = 1.0;
  return (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontView, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_backView, 0);
}

@end
