@implementation CAMViewfinderFlipTransition

- (CAMViewfinderFlipTransition)initWithTransitionableViewfinder:(id)a3
{
  id v4;
  CAMViewfinderFlipTransition *v5;
  CAMViewfinderFlipTransition *v6;
  CAMViewfinderFlipTransition *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMViewfinderFlipTransition;
  v5 = -[CAMViewfinderFlipTransition init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__transitionableViewfinder, v4);
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
  double v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  _OWORD v19[8];

  -[CAMViewfinderFlipTransition _frontSnapshotView](self, "_frontSnapshotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderFlipTransition _backSnapshotView](self, "_backSnapshotView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderFlipTransition _targetSnapshotView](self, "_targetSnapshotView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");
  objc_msgSend(v5, "setZPosition:", 0.0);
  objc_msgSend(v3, "removeFromSuperview");
  -[CAMViewfinderFlipTransition _setFrontSnapshotView:](self, "_setFrontSnapshotView:", 0);
  objc_msgSend(v18, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");
  objc_msgSend(v6, "setZPosition:", 0.0);
  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");
  objc_msgSend(v7, "setZPosition:", 0.0);
  -[CAMViewfinderFlipTransition _transitionableViewfinder](self, "_transitionableViewfinder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);
  objc_msgSend(v9, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setZPosition:", 0.0);
  LODWORD(v12) = 1.0;
  objc_msgSend(v11, "setOpacity:", v12);
  objc_msgSend(v10, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v19[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v19[5] = v14;
  v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v19[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v19[7] = v15;
  v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v19[0] = *MEMORY[0x1E0CD2610];
  v19[1] = v16;
  v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v19[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v19[3] = v17;
  objc_msgSend(v13, "setSublayerTransform:", v19);

}

- (void)performFlipTransitionWithDirection:(unint64_t)a3 completionHandler:(id)a4
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  CAMSnapshotView *v10;
  CAMSnapshotView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CAMAnimationDelegate *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41[2];
  id location;
  double v43;
  _OWORD v44[5];
  uint64_t v45;
  unint64_t v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];

  v49[2] = *MEMORY[0x1E0C80C00];
  v34 = a4;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v44[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v44[3] = v6;
  v44[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v45 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v44[0] = *MEMORY[0x1E0CD2610];
  v44[1] = v7;
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v47 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v48 = v8;
  -[CAMViewfinderFlipTransition _transitionableViewfinder](self, "_transitionableViewfinder");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "previewView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v36, "desiredAspectRatio");
  objc_msgSend(v37, "superview");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0xBF435EAF72D7949ELL;
  objc_msgSend(v38, "setSublayerTransform:", v44);
  objc_msgSend(v38, "setSortsSublayers:", 0);
  -[CAMViewfinderFlipTransition _frontSnapshotView](self, "_frontSnapshotView");
  v10 = (CAMSnapshotView *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderFlipTransition _backSnapshotView](self, "_backSnapshotView");
  v11 = (CAMSnapshotView *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[CAMSnapshotView setBlurred:](v10, "setBlurred:", 1);
  }
  else
  {
    v10 = -[CAMSnapshotView initWithView:desiredAspectRatio:]([CAMSnapshotView alloc], "initWithView:desiredAspectRatio:", v37, v9);
    -[CAMSnapshotView layer](v10, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDoubleSided:", 0);

    objc_msgSend(v35, "addSubview:", v10);
  }
  if (!v11)
  {
    v11 = -[CAMSnapshotView initWithView:desiredAspectRatio:]([CAMSnapshotView alloc], "initWithView:desiredAspectRatio:", v37, v9);
    -[CAMSnapshotView layer](v11, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDoubleSided:", 0);

    -[CAMSnapshotView layer](v11, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMasksToBounds:", 1);

    -[CAMSnapshotView setBlurred:](v11, "setBlurred:", 1);
    -[CAMSnapshotView setDimmed:](v11, "setDimmed:", 1);
    objc_msgSend(v35, "insertSubview:aboveSubview:", v11, v10);
  }
  v43 = 0.0;
  *(_QWORD *)&v44[0] = 0;
  if (v10 && v11)
  {
    -[CAMSnapshotView layer](v10, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "animationForKey:", CFSTR("rotationAnimation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMViewfinderFlipTransition _getCurrentRadians:targetRadians:forDirection:withAnimation:onFrontSnapshotLayer:](self, "_getCurrentRadians:targetRadians:forDirection:withAnimation:onFrontSnapshotLayer:", v44, &v43, a3, v16, v15);

    v17 = v43;
    v18 = *(double *)v44;
  }
  else
  {
    v18 = 0.0;
    -[CAMViewfinderFlipTransition _frontSnapshotTargetRadiansForDirection:fromRadians:](self, "_frontSnapshotTargetRadiansForDirection:fromRadians:", a3, 0.0);
    v17 = v19;
    v43 = v19;
  }
  -[CAMViewfinderFlipTransition _snapshotFlipAnimationFromValue:toValue:](self, "_snapshotFlipAnimationFromValue:toValue:", v18, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRemovedOnCompletion:", 0);
  -[CAMViewfinderFlipTransition _backSnapshotTargetRadiansForDirection:frontSnapshotRadians:](self, "_backSnapshotTargetRadiansForDirection:frontSnapshotRadians:", a3, *(double *)v44);
  v22 = v21;
  -[CAMViewfinderFlipTransition _backSnapshotTargetRadiansForDirection:frontSnapshotRadians:](self, "_backSnapshotTargetRadiansForDirection:frontSnapshotRadians:", a3, v43);
  -[CAMViewfinderFlipTransition _snapshotFlipAnimationFromValue:toValue:](self, "_snapshotFlipAnimationFromValue:toValue:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRemovedOnCompletion:", 0);
  objc_msgSend(v20, "duration");
  v26 = v25;
  objc_msgSend(v20, "timingFunction");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setValues:", &unk_1EA3B2E58);
  objc_msgSend(v28, "setKeyTimes:", &unk_1EA3B2E70);
  objc_msgSend(v28, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v28, "setRemovedOnCompletion:", 0);
  v49[0] = v27;
  v49[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTimingFunctions:", v29);

  objc_msgSend(v28, "setDuration:", v26);
  objc_msgSend(v37, "setHidden:", 1);
  v30 = (void *)(-[CAMViewfinderFlipTransition _currentAnimationID](self, "_currentAnimationID") + 1);
  -[CAMViewfinderFlipTransition _setCurrentAnimationID:](self, "_setCurrentAnimationID:", v30);
  if (v34)
  {
    objc_initWeak(&location, self);
    v31 = objc_alloc_init(CAMAnimationDelegate);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __84__CAMViewfinderFlipTransition_performFlipTransitionWithDirection_completionHandler___block_invoke;
    v39[3] = &unk_1EA328B48;
    objc_copyWeak(v41, &location);
    v41[1] = v30;
    v40 = v34;
    -[CAMAnimationDelegate setCompletion:](v31, "setCompletion:", v39);
    objc_msgSend(v20, "setDelegate:", v31);

    objc_destroyWeak(v41);
    objc_destroyWeak(&location);
  }
  -[CAMSnapshotView layer](v10, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSnapshotView layer](v11, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addAnimation:forKey:", v20, CFSTR("rotationAnimation"));
  objc_msgSend(v33, "addAnimation:forKey:", v24, CFSTR("rotationAnimation"));
  objc_msgSend(v38, "addAnimation:forKey:", v28, CFSTR("flipContainerAnimation"));
  -[CAMViewfinderFlipTransition _setFrontSnapshotView:](self, "_setFrontSnapshotView:", v10);
  -[CAMViewfinderFlipTransition _setBackSnapshotView:](self, "_setBackSnapshotView:", v11);

}

void __84__CAMViewfinderFlipTransition_performFlipTransitionWithDirection_completionHandler___block_invoke(uint64_t a1)
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

- (void)_getCurrentRadians:(double *)a3 targetRadians:(double *)a4 forDirection:(unint64_t)a5 withAnimation:(id)a6 onFrontSnapshotLayer:(id)a7
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
    -[CAMViewfinderFlipTransition _frontSnapshotTargetRadiansForDirection:fromRadians:](self, "_frontSnapshotTargetRadiansForDirection:fromRadians:", a5, v26);
    *(_QWORD *)a4 = v30;

  }
}

- (double)_frontSnapshotTargetRadiansForDirection:(unint64_t)a3 fromRadians:(double)a4
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

- (double)_backSnapshotTargetRadiansForDirection:(unint64_t)a3 frontSnapshotRadians:(double)a4
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

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAnimationDragCoefficient();
  objc_msgSend(v6, "setDuration:", v7 * 0.32);
  LODWORD(v8) = 1054280253;
  LODWORD(v9) = 1058306785;
  LODWORD(v10) = 0;
  LODWORD(v11) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v8, v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimingFunction:", v12);

  objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromValue:", v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToValue:", v14);

  return v6;
}

- (void)completeTransitionToLivePreviewWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CAMSnapshotView *v10;
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
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id from;
  id location;

  v4 = a3;
  -[CAMViewfinderFlipTransition _cleanupFromFlipTransition](self, "_cleanupFromFlipTransition");
  -[CAMViewfinderFlipTransition _transitionableViewfinder](self, "_transitionableViewfinder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "desiredAspectRatio");
  objc_msgSend(v6, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderFlipTransition _backSnapshotView](self, "_backSnapshotView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CAMSnapshotView initWithView:desiredAspectRatio:]([CAMSnapshotView alloc], "initWithView:desiredAspectRatio:", v6, v7);
  v21 = v8;
  objc_msgSend(v8, "insertSubview:belowSubview:", v10, v9);
  -[CAMSnapshotView setBlurred:](v10, "setBlurred:", 1);
  objc_msgSend(v9, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1036831949;
  LODWORD(v13) = 0.25;
  LODWORD(v14) = 0.25;
  LODWORD(v15) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v13, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", &unk_1EA3B1730);
  objc_msgSend(v17, "setToValue:", &unk_1EA3B1750);
  UIAnimationDragCoefficient();
  objc_msgSend(v17, "setDuration:", v18 * 0.3268);
  objc_msgSend(v17, "setTimingFunction:", v16);
  objc_initWeak(&location, v9);
  objc_initWeak(&from, v10);
  -[CAMViewfinderFlipTransition _setBackSnapshotView:](self, "_setBackSnapshotView:", 0);
  -[CAMViewfinderFlipTransition _setTargetSnapshotView:](self, "_setTargetSnapshotView:", 0);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __84__CAMViewfinderFlipTransition_completeTransitionToLivePreviewWithCompletionHandler___block_invoke;
  v22[3] = &unk_1EA328B70;
  objc_copyWeak(&v24, &location);
  objc_copyWeak(&v25, &from);
  v19 = v4;
  v23 = v19;
  -[CAMSnapshotView setBlurred:animated:style:withCompletionBlock:](v10, "setBlurred:animated:style:withCompletionBlock:", 0, 1, 1, v22);
  objc_msgSend(v11, "addAnimation:forKey:", v17, CFSTR("opacityAnimation"));
  LODWORD(v20) = 0;
  objc_msgSend(v11, "setOpacity:", v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

uint64_t __84__CAMViewfinderFlipTransition_completeTransitionToLivePreviewWithCompletionHandler___block_invoke(uint64_t a1)
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

- (CAMViewfinderTransitionable)_transitionableViewfinder
{
  return (CAMViewfinderTransitionable *)objc_loadWeakRetained((id *)&self->__transitionableViewfinder);
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
  objc_destroyWeak((id *)&self->__transitionableViewfinder);
}

@end
