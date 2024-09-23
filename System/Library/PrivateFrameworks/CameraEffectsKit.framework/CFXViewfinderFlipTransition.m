@implementation CFXViewfinderFlipTransition

- (CFXViewfinderFlipTransition)initWithViewfinderView:(id)a3
{
  id v4;
  CFXViewfinderFlipTransition *v5;
  CFXViewfinderFlipTransition *v6;
  CFXViewfinderFlipTransition *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CFXViewfinderFlipTransition;
  v5 = -[CFXViewfinderFlipTransition init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewfinderView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)_cleanupFromFlipTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[8];

  -[CFXViewfinderFlipTransition _frontSnapshotView](self, "_frontSnapshotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXViewfinderFlipTransition _backSnapshotView](self, "_backSnapshotView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXViewfinderFlipTransition _targetSnapshotView](self, "_targetSnapshotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");
  objc_msgSend(v6, "setZPosition:", 0.0);
  objc_msgSend(v3, "removeFromSuperview");
  -[CFXViewfinderFlipTransition _setFrontSnapshotView:](self, "_setFrontSnapshotView:", 0);
  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");
  objc_msgSend(v7, "setZPosition:", 0.0);
  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllAnimations");
  objc_msgSend(v8, "setZPosition:", 0.0);
  -[CFXViewfinderFlipTransition viewfinderView](self, "viewfinderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXViewfinderFlipTransition viewfinderView](self, "viewfinderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 0);

  -[CFXViewfinderFlipTransition viewfinderView](self, "viewfinderView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

  -[CFXViewfinderFlipTransition viewfinderView](self, "viewfinderView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

  -[CFXViewfinderFlipTransition viewfinderView](self, "viewfinderView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setZPosition:", 0.0);
  LODWORD(v16) = 1.0;
  objc_msgSend(v15, "setOpacity:", v16);
  objc_msgSend(v10, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v22[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v22[5] = v18;
  v19 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v22[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v22[7] = v19;
  v20 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v22[0] = *MEMORY[0x24BDE5598];
  v22[1] = v20;
  v21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v22[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v22[3] = v21;
  objc_msgSend(v17, "setSublayerTransform:", v22);

}

- (void)performFlipTransitionWithDirection:(int64_t)a3 completionHandler:(id)a4
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CFXAnimationDelegate *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44[2];
  id location;
  double v46;
  _OWORD v47[5];
  uint64_t v48;
  unint64_t v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];

  v52[2] = *MEMORY[0x24BDAC8D0];
  v39 = a4;
  v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v47[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v47[3] = v6;
  v47[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v48 = *(_QWORD *)(MEMORY[0x24BDE5598] + 80);
  v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v47[0] = *MEMORY[0x24BDE5598];
  v47[1] = v7;
  v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v50 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v51 = v8;
  -[CFXViewfinderFlipTransition viewfinderView](self, "viewfinderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0xBF435EAF72D7949ELL;
  objc_msgSend(v41, "setSublayerTransform:", v47);
  objc_msgSend(v41, "setSortsSublayers:", 0);
  -[CFXViewfinderFlipTransition _frontSnapshotView](self, "_frontSnapshotView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXViewfinderFlipTransition _backSnapshotView](self, "_backSnapshotView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "setBlurred:", 1);
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x24BE14A78]);
    -[CFXViewfinderFlipTransition viewfinderView](self, "viewfinderView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v12, "initWithView:desiredAspectRatio:", v13, 4);

    objc_msgSend(v10, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDoubleSided:", 0);

    objc_msgSend(v40, "addSubview:", v10);
  }
  if (!v11)
  {
    v15 = objc_alloc(MEMORY[0x24BE14A78]);
    -[CFXViewfinderFlipTransition viewfinderView](self, "viewfinderView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v15, "initWithView:desiredAspectRatio:", v16, 4);

    objc_msgSend(v11, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDoubleSided:", 0);

    objc_msgSend(v11, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMasksToBounds:", 1);

    objc_msgSend(v11, "setBlurred:", 1);
    objc_msgSend(v11, "setDimmed:", 1);
    objc_msgSend(v40, "insertSubview:aboveSubview:", v11, v10);
  }
  v46 = 0.0;
  *(_QWORD *)&v47[0] = 0;
  if (v10 && v11)
  {
    objc_msgSend(v10, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "animationForKey:", CFSTR("rotationAnimation"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXViewfinderFlipTransition _getCurrentRadians:targetRadians:forDirection:withAnimation:onFrontSnapshotLayer:](self, "_getCurrentRadians:targetRadians:forDirection:withAnimation:onFrontSnapshotLayer:", v47, &v46, a3, v20, v19);

    v21 = v46;
    v22 = *(double *)v47;
  }
  else
  {
    v22 = 0.0;
    -[CFXViewfinderFlipTransition _frontSnapshotTargetRadiansForDirection:fromRadians:](self, "_frontSnapshotTargetRadiansForDirection:fromRadians:", a3, 0.0);
    v21 = v23;
    v46 = v23;
  }
  -[CFXViewfinderFlipTransition _snapshotFlipAnimationFromValue:toValue:](self, "_snapshotFlipAnimationFromValue:toValue:", v22, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRemovedOnCompletion:", 0);
  -[CFXViewfinderFlipTransition _backSnapshotTargetRadiansForDirection:frontSnapshotRadians:](self, "_backSnapshotTargetRadiansForDirection:frontSnapshotRadians:", a3, *(double *)v47);
  v26 = v25;
  -[CFXViewfinderFlipTransition _backSnapshotTargetRadiansForDirection:frontSnapshotRadians:](self, "_backSnapshotTargetRadiansForDirection:frontSnapshotRadians:", a3, v46);
  -[CFXViewfinderFlipTransition _snapshotFlipAnimationFromValue:toValue:](self, "_snapshotFlipAnimationFromValue:toValue:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setRemovedOnCompletion:", 0);
  objc_msgSend(v24, "duration");
  v30 = v29;
  objc_msgSend(v24, "timingFunction");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setValues:", &unk_24EE9C3E0);
  objc_msgSend(v32, "setKeyTimes:", &unk_24EE9C3F8);
  objc_msgSend(v32, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(v32, "setRemovedOnCompletion:", 0);
  v52[0] = v31;
  v52[1] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTimingFunctions:", v33);

  objc_msgSend(v32, "setDuration:", v30);
  -[CFXViewfinderFlipTransition viewfinderView](self, "viewfinderView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setHidden:", 1);

  v35 = (void *)(-[CFXViewfinderFlipTransition _currentAnimationID](self, "_currentAnimationID") + 1);
  -[CFXViewfinderFlipTransition _setCurrentAnimationID:](self, "_setCurrentAnimationID:", v35);
  if (v39)
  {
    objc_initWeak(&location, self);
    v36 = objc_alloc_init(CFXAnimationDelegate);
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __84__CFXViewfinderFlipTransition_performFlipTransitionWithDirection_completionHandler___block_invoke;
    v42[3] = &unk_24EE57BB0;
    objc_copyWeak(v44, &location);
    v44[1] = v35;
    v43 = v39;
    -[CFXAnimationDelegate setCompletion:](v36, "setCompletion:", v42);
    objc_msgSend(v24, "setDelegate:", v36);

    objc_destroyWeak(v44);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v10, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAnimation:forKey:", v24, CFSTR("rotationAnimation"));
  objc_msgSend(v38, "addAnimation:forKey:", v28, CFSTR("rotationAnimation"));
  objc_msgSend(v41, "addAnimation:forKey:", v32, CFSTR("flipContainerAnimation"));
  -[CFXViewfinderFlipTransition _setFrontSnapshotView:](self, "_setFrontSnapshotView:", v10);
  -[CFXViewfinderFlipTransition _setBackSnapshotView:](self, "_setBackSnapshotView:", v11);

}

void __84__CFXViewfinderFlipTransition_performFlipTransitionWithDirection_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 40));
  v2 = objc_loadWeakRetained(&to);
  v3 = objc_msgSend(v2, "_currentAnimationID");

  v4 = objc_loadWeakRetained(&to);
  if (!v4 || (v5 = *(_QWORD *)(a1 + 48), v4, v3 == v5))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_destroyWeak(&to);
}

- (void)_getCurrentRadians:(double *)a3 targetRadians:(double *)a4 forDirection:(int64_t)a5 withAnimation:(id)a6 onFrontSnapshotLayer:(id)a7
{
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;
  double v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  double v26;
  void *v27;
  float v28;
  double v29;
  uint64_t v30;
  id v31;

  if (a3 && a4)
  {
    v12 = a7;
    v13 = a6;
    objc_msgSend(v12, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    v15 = v14;

    objc_msgSend(v13, "beginTime");
    v17 = v15 - v16;
    objc_msgSend(v13, "duration");
    v19 = v17 / v18;
    if (v19 > 1.0)
      v19 = 1.0;
    v20 = fmaxf(v19, 0.0);
    objc_msgSend(v13, "timingFunction");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v21 = v20;
    objc_msgSend(v31, "_solveForInput:", v21);
    v23 = v22;
    objc_msgSend(v13, "toValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    v26 = v25;

    objc_msgSend(v13, "fromValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "floatValue");
    v29 = v28;

    *a3 = v29 + (v26 - v29) * v23;
    -[CFXViewfinderFlipTransition _frontSnapshotTargetRadiansForDirection:fromRadians:](self, "_frontSnapshotTargetRadiansForDirection:fromRadians:", a5, v26);
    *(_QWORD *)a4 = v30;

  }
}

- (double)_frontSnapshotTargetRadiansForDirection:(int64_t)a3 fromRadians:(double)a4
{
  double v4;
  double v5;

  if (a3 == 1)
  {
    v5 = -3.14159265;
    return a4 + v5;
  }
  v4 = 0.0;
  if (!a3)
  {
    v5 = 3.14159265;
    return a4 + v5;
  }
  return v4;
}

- (double)_backSnapshotTargetRadiansForDirection:(int64_t)a3 frontSnapshotRadians:(double)a4
{
  double v4;
  double v5;

  if (a3 == 1)
  {
    v5 = -3.14159265;
    return a4 + v5;
  }
  v4 = 0.0;
  if (!a3)
  {
    v5 = 3.14159265;
    return a4 + v5;
  }
  return v4;
}

- (id)_snapshotFlipAnimationFromValue:(double)a3 toValue:(double)a4
{
  void *v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAnimationDragCoefficient();
  objc_msgSend(v6, "setDuration:", v7 * 0.32);
  LODWORD(v8) = 1054280253;
  LODWORD(v9) = 1058306785;
  LODWORD(v10) = 0;
  LODWORD(v11) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v8, v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimingFunction:", v12);

  objc_msgSend(v6, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromValue:", v13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToValue:", v14);

  return v6;
}

- (void)completeTransitionToLivePreviewWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  float v18;
  id v19;
  double v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id from;
  id location;

  v4 = a3;
  -[CFXViewfinderFlipTransition _cleanupFromFlipTransition](self, "_cleanupFromFlipTransition");
  -[CFXViewfinderFlipTransition viewfinderView](self, "viewfinderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXViewfinderFlipTransition _backSnapshotView](self, "_backSnapshotView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BE14A78]);
  -[CFXViewfinderFlipTransition viewfinderView](self, "viewfinderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithView:desiredAspectRatio:", v9, 4);

  objc_msgSend(v6, "insertSubview:belowSubview:", v10, v7);
  objc_msgSend(v10, "setBlurred:", 1);
  objc_msgSend(v7, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1036831949;
  LODWORD(v13) = 0.25;
  LODWORD(v14) = 0.25;
  LODWORD(v15) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v13, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", &unk_24EE9C0E0);
  objc_msgSend(v17, "setToValue:", &unk_24EE9C100);
  UIAnimationDragCoefficient();
  objc_msgSend(v17, "setDuration:", v18 * 0.3268);
  objc_msgSend(v17, "setTimingFunction:", v16);
  objc_initWeak(&location, v7);
  objc_initWeak(&from, v10);
  -[CFXViewfinderFlipTransition _setBackSnapshotView:](self, "_setBackSnapshotView:", 0);
  -[CFXViewfinderFlipTransition _setTargetSnapshotView:](self, "_setTargetSnapshotView:", 0);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __84__CFXViewfinderFlipTransition_completeTransitionToLivePreviewWithCompletionHandler___block_invoke;
  v21[3] = &unk_24EE57BD8;
  objc_copyWeak(&v23, &location);
  objc_copyWeak(&v24, &from);
  v19 = v4;
  v22 = v19;
  objc_msgSend(v10, "setBlurred:animated:style:withCompletionBlock:", 0, 1, 1, v21);
  objc_msgSend(v11, "addAnimation:forKey:", v17, CFSTR("opacityAnimation"));
  LODWORD(v20) = 0;
  objc_msgSend(v11, "setOpacity:", v20);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

uint64_t __84__CFXViewfinderFlipTransition_completeTransitionToLivePreviewWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeFromSuperview");

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "removeFromSuperview");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (UIView)viewfinderView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_viewfinderView);
}

- (void)setViewfinderView:(id)a3
{
  objc_storeWeak((id *)&self->_viewfinderView, a3);
}

- (CAMSnapshotView)_frontSnapshotView
{
  return self->__frontSnapshotView;
}

- (void)_setFrontSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->__frontSnapshotView, a3);
}

- (CAMSnapshotView)_backSnapshotView
{
  return self->__backSnapshotView;
}

- (void)_setBackSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->__backSnapshotView, a3);
}

- (CAMSnapshotView)_targetSnapshotView
{
  return self->__targetSnapshotView;
}

- (void)_setTargetSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->__targetSnapshotView, a3);
}

- (unint64_t)_currentAnimationID
{
  return self->__currentAnimationID;
}

- (void)_setCurrentAnimationID:(unint64_t)a3
{
  self->__currentAnimationID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__targetSnapshotView, 0);
  objc_storeStrong((id *)&self->__backSnapshotView, 0);
  objc_storeStrong((id *)&self->__frontSnapshotView, 0);
  objc_destroyWeak((id *)&self->_viewfinderView);
}

@end
