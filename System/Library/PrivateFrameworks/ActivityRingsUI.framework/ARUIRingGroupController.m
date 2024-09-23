@implementation ARUIRingGroupController

+ (id)animationTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1051361018;
  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  LODWORD(v5) = 1.0;
  return (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

+ (double)defaultAnimationDuration
{
  return 1.1;
}

- (ARUIRingGroupController)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("-init is unavailable on %@."), v6);

  return 0;
}

- (ARUIRingGroupController)initWithNumberOfRings:(int64_t)a3
{
  ARUIRingGroupController *v4;
  ARUIRingGroup *v5;
  ARUIRingGroup *ringGroup;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ARUIRingGroupController;
  v4 = -[ARUIRingGroupController init](&v8, sel_init);
  if (v4)
  {
    v5 = -[ARUIRingGroup initWithNumberOfRings:]([ARUIRingGroup alloc], "initWithNumberOfRings:", a3);
    ringGroup = v4->_ringGroup;
    v4->_ringGroup = v5;

  }
  return v4;
}

- (ARUIRingGroupController)initWithRingGroup:(id)a3
{
  id v5;
  ARUIRingGroupController *v6;
  ARUIRingGroupController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARUIRingGroupController;
  v6 = -[ARUIRingGroupController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ringGroup, a3);

  return v7;
}

- (int64_t)numberOfRings
{
  void *v2;
  int64_t v3;

  -[ARUIRingGroup rings](self->_ringGroup, "rings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)setSpriteSheet:(id)a3
{
  -[ARUIRingGroup setSpriteSheet:](self->_ringGroup, "setSpriteSheet:", a3);
  -[ARUIRingGroup playSpriteAnimation](self->_ringGroup, "playSpriteAnimation");
}

- (ARUISpriteSheet)spriteSheet
{
  return -[ARUIRingGroup spriteSheet](self->_ringGroup, "spriteSheet");
}

- (CGPoint)center
{
  float v3;
  double v4;
  float v5;
  double v6;
  double v7;
  CGPoint result;

  -[ARUIRingGroup translation](self->_ringGroup, "translation");
  v4 = v3;
  -[ARUIRingGroup translation](self->_ringGroup, "translation");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  CGFloat y;

  y = a3.y;
  -[ARUIRingGroup setTranslation:](self->_ringGroup, "setTranslation:", COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)a3)));
}

- (float)opacity
{
  float result;

  -[ARUIRingGroup opacity](self->_ringGroup, "opacity");
  return result;
}

- (void)setOpacity:(float)a3
{
  -[ARUIRingGroup setOpacity:](self->_ringGroup, "setOpacity:");
}

- (float)emptyOpacity
{
  float result;

  -[ARUIRingGroup emptyOpacity](self->_ringGroup, "emptyOpacity");
  return result;
}

- (void)setEmptyOpacity:(float)a3
{
  -[ARUIRingGroup setEmptyOpacity:](self->_ringGroup, "setEmptyOpacity:");
}

- (float)ringDiameter
{
  float result;

  -[ARUIRingGroup groupDiameter](self->_ringGroup, "groupDiameter");
  return result;
}

- (void)setRingDiameter:(float)a3
{
  -[ARUIRingGroup setGroupDiameter:](self->_ringGroup, "setGroupDiameter:");
}

- (float)ringInterspacing
{
  float result;

  -[ARUIRingGroup interspacing](self->_ringGroup, "interspacing");
  return result;
}

- (void)setRingInterspacing:(float)a3
{
  -[ARUIRingGroup setInterspacing:](self->_ringGroup, "setInterspacing:");
}

- (float)ringThickness
{
  float result;

  -[ARUIRingGroup thickness](self->_ringGroup, "thickness");
  return result;
}

- (void)setRingThickness:(float)a3
{
  -[ARUIRingGroup setThickness:](self->_ringGroup, "setThickness:");
}

- (float)ringScale
{
  float result;

  -[ARUIRingGroup scale](self->_ringGroup, "scale");
  return result;
}

- (void)setRingScale:(float)a3
{
  -[ARUIRingGroup setScale:](self->_ringGroup, "setScale:");
}

- (float)trackOpacity
{
  float result;

  -[ARUIRingGroup trackOpacity](self->_ringGroup, "trackOpacity");
  return result;
}

- (void)setTrackOpacity:(float)a3
{
  -[ARUIRingGroup setTrackOpacity:](self->_ringGroup, "setTrackOpacity:");
}

- (float)zRotation
{
  float result;

  -[ARUIRingGroup zRotation](self->_ringGroup, "zRotation");
  return result;
}

- (void)setZRotation:(float)a3
{
  -[ARUIRingGroup setZRotation:](self->_ringGroup, "setZRotation:");
}

- (void)addAnimation:(id)a3 forRingGroupPropertyType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  float64x2_t v11;
  float32x2_t v12;
  double v13;
  double v14;
  void *v15;
  _QWORD *v16;
  double v17;
  void *v18;
  int v19;
  int v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  int v25;
  double v26;
  void *v27;
  int v28;
  int v29;
  double v30;
  void *v31;
  int v32;
  int v33;
  double v34;
  void *v35;
  int v36;
  int v37;
  double v38;
  void *v39;
  int v40;
  int v41;
  double v42;
  void *v43;
  int v44;
  int v45;
  double v46;
  void *v47;
  int v48;
  int v49;
  double v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  int v54;
  _QWORD v55[5];
  int v56;
  _QWORD v57[5];
  int v58;
  _QWORD v59[5];
  int v60;
  _QWORD v61[5];
  int v62;
  _QWORD v63[5];
  int v64;
  _QWORD v65[5];
  int v66;
  _QWORD v67[5];
  int v68;
  _QWORD v69[6];

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0uLL:
      objc_msgSend(v6, "_endValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "CGPointValue");
      v51 = v10;
      v52 = v9;

      *(_QWORD *)&v11.f64[0] = v52;
      *(_QWORD *)&v11.f64[1] = v51;
      v12 = vcvt_f32_f64(v11);
      objc_msgSend(v7, "duration");
      v14 = v13;
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke;
      v69[3] = &unk_24CEC6040;
      v69[4] = self;
      v69[5] = v12;
      objc_msgSend(v7, "completionHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v69;
      v17 = v14;
      goto LABEL_12;
    case 1uLL:
      objc_msgSend(v6, "_endValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");
      v20 = v19;

      objc_msgSend(v7, "duration");
      v22 = v21;
      v67[0] = MEMORY[0x24BDAC760];
      v67[1] = 3221225472;
      v67[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_2;
      v67[3] = &unk_24CEC6068;
      v67[4] = self;
      v68 = v20;
      objc_msgSend(v7, "completionHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v67;
      goto LABEL_11;
    case 2uLL:
      objc_msgSend(v6, "_endValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      v25 = v24;

      objc_msgSend(v7, "duration");
      v22 = v26;
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 3221225472;
      v65[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_3;
      v65[3] = &unk_24CEC6068;
      v65[4] = self;
      v66 = v25;
      objc_msgSend(v7, "completionHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v65;
      goto LABEL_11;
    case 3uLL:
      objc_msgSend(v6, "_endValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v29 = v28;

      objc_msgSend(v7, "duration");
      v22 = v30;
      v63[0] = MEMORY[0x24BDAC760];
      v63[1] = 3221225472;
      v63[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_4;
      v63[3] = &unk_24CEC6068;
      v63[4] = self;
      v64 = v29;
      objc_msgSend(v7, "completionHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v63;
      goto LABEL_11;
    case 5uLL:
      objc_msgSend(v6, "_endValue");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "floatValue");
      v33 = v32;

      objc_msgSend(v7, "duration");
      v22 = v34;
      v61[0] = MEMORY[0x24BDAC760];
      v61[1] = 3221225472;
      v61[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_5;
      v61[3] = &unk_24CEC6068;
      v61[4] = self;
      v62 = v33;
      objc_msgSend(v7, "completionHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v61;
      goto LABEL_11;
    case 6uLL:
      objc_msgSend(v6, "_endValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "floatValue");
      v37 = v36;

      objc_msgSend(v7, "duration");
      v22 = v38;
      v59[0] = MEMORY[0x24BDAC760];
      v59[1] = 3221225472;
      v59[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_6;
      v59[3] = &unk_24CEC6068;
      v59[4] = self;
      v60 = v37;
      objc_msgSend(v7, "completionHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v59;
      goto LABEL_11;
    case 7uLL:
      objc_msgSend(v6, "_endValue");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "floatValue");
      v41 = v40;

      objc_msgSend(v7, "duration");
      v22 = v42;
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_7;
      v57[3] = &unk_24CEC6068;
      v57[4] = self;
      v58 = v41;
      objc_msgSend(v7, "completionHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v57;
      goto LABEL_11;
    case 8uLL:
      objc_msgSend(v6, "_endValue");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "floatValue");
      v45 = v44;

      objc_msgSend(v7, "duration");
      v22 = v46;
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_8;
      v55[3] = &unk_24CEC6068;
      v55[4] = self;
      v56 = v45;
      objc_msgSend(v7, "completionHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v55;
      goto LABEL_11;
    case 9uLL:
      objc_msgSend(v6, "_endValue");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "floatValue");
      v49 = v48;

      objc_msgSend(v7, "duration");
      v22 = v50;
      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_9;
      v53[3] = &unk_24CEC6068;
      v53[4] = self;
      v54 = v49;
      objc_msgSend(v7, "completionHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v53;
LABEL_11:
      v17 = v22;
LABEL_12:
      +[ARUIRingGroup animateWithDuration:animations:curve:completion:](ARUIRingGroup, "animateWithDuration:animations:curve:completion:", v16, 0, v15, v17, v51, v52);

      break;
    default:
      break;
  }

}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTranslation:", *(double *)(a1 + 40));

}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_2(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "setGroupDiameter:", v2);

}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_3(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "setEmptyOpacity:", v2);

}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_4(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "setOpacity:", v2);

}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_5(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "setInterspacing:", v2);

}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_6(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "setThickness:", v2);

}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_7(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "setScale:", v2);

}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_8(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "setTrackOpacity:", v2);

}

void __65__ARUIRingGroupController_addAnimation_forRingGroupPropertyType___block_invoke_9(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "setZRotation:", v2);

}

- (void)setTopColor:(id)a3 bottomColor:(id)a4
{
  -[ARUIRingGroupController setTopColor:bottomColor:ofRingAtIndex:](self, "setTopColor:bottomColor:ofRingAtIndex:", a3, a4, 0);
}

- (void)setTopColor:(id)a3 bottomColor:(id)a4 ofRingAtIndex:(int64_t)a5
{
  -[ARUIRingGroup setTopColor:bottomColor:ofRingAtIndex:](self->_ringGroup, "setTopColor:bottomColor:ofRingAtIndex:", a3, a4, a5);
}

- (void)setTopColor:(id)a3 bottomColor:(id)a4 contrastColor:(id)a5 ofRingAtIndex:(int64_t)a6
{
  -[ARUIRingGroupController setTopColor:bottomColor:ofRingAtIndex:](self, "setTopColor:bottomColor:ofRingAtIndex:", a3, a4, a6);
}

- (void)setOpacity:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5
{
  _QWORD v5[6];

  if (a5)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __61__ARUIRingGroupController_setOpacity_ofRingAtIndex_animated___block_invoke;
    v5[3] = &unk_24CEC6040;
    v5[4] = self;
    *(double *)&v5[5] = a3;
    +[ARUIRingGroup animateWithDuration:animations:](ARUIRingGroup, "animateWithDuration:animations:", v5, 0.25);
  }
  else
  {
    *(float *)&a3 = a3;
    -[ARUIRingGroup setOpacity:](self->_ringGroup, "setOpacity:", a4, a3);
  }
}

uint64_t __61__ARUIRingGroupController_setOpacity_ofRingAtIndex_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = *(double *)(a1 + 40);
  *(float *)&v1 = v1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setOpacity:", v1);
}

- (void)setRingThickness:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__ARUIRingGroupController_setRingThickness_ofRingAtIndex_animated___block_invoke;
  v5[3] = &unk_24CEC6040;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  +[ARUIRingGroup animateWithDuration:animations:](ARUIRingGroup, "animateWithDuration:animations:", v5, a5, 0.2);
}

void __67__ARUIRingGroupController_setRingThickness_ofRingAtIndex_animated___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(double *)(a1 + 40);
  *(float *)&v2 = v2;
  objc_msgSend(v3, "setThickness:", v2);

}

- (float)diameterForRingAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  float v6;
  float v7;

  -[ARUIRingGroup rings](self->_ringGroup, "rings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "diameter");
  v7 = v6;

  return v7;
}

- (void)setPercentage:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5
{
  *(float *)&a3 = a3;
  -[ARUIRingGroup setPercentage:ofRingAtIndex:animated:](self->_ringGroup, "setPercentage:ofRingAtIndex:animated:", a4, a5, a3);
}

- (void)setPercentage:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  *(float *)&a3 = a3;
  -[ARUIRingGroup setPercentage:ofRingAtIndex:animated:completion:](self->_ringGroup, "setPercentage:ofRingAtIndex:animated:completion:", a4, a5, a6, a3);
}

- (void)setPercentage:(double)a3 ofRingAtIndex:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7 completion:(id)a8
{
  _QWORD v8[7];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __99__ARUIRingGroupController_setPercentage_ofRingAtIndex_animated_duration_timingFunction_completion___block_invoke;
  v8[3] = &unk_24CEC6090;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  v8[6] = a4;
  +[ARUIRingGroup animateWithDuration:animations:curve:completion:](ARUIRingGroup, "animateWithDuration:animations:curve:completion:", v8, 0, a8, a6);
}

void __99__ARUIRingGroupController_setPercentage_ofRingAtIndex_animated_duration_timingFunction_completion___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(double *)(a1 + 40);
  *(float *)&v2 = v2;
  objc_msgSend(v3, "setPercentage:ofRingAtIndex:", *(_QWORD *)(a1 + 48), v2);

}

- (ARUIRingGroup)ringGroup
{
  return self->_ringGroup;
}

- (float)ringIconSize
{
  return self->_ringIconSize;
}

- (void)setRingIconSize:(float)a3
{
  self->_ringIconSize = a3;
}

- (double)backingOrigin
{
  return self->_backingOrigin;
}

- (void)setBackingOrigin:(double)a3
{
  self->_backingOrigin = a3;
}

- (double)additionalSpacingAtIndex
{
  return self->_additionalSpacingAtIndex;
}

- (void)setAdditionalSpacingAtIndex:(double)a3
{
  self->_additionalSpacingAtIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringGroup, 0);
}

- (void)addCelebration:(id)a3 toRingAtIndex:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[ARUIRingGroupController ringGroup](self, "ringGroup");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playCelebration:onRingAtIndex:", v6, a4);

}

+ (id)ringGroupControllerConfiguredForWatchWithRingType:(int64_t)a3 withIcon:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  ARUIRingGroupController *v8;

  v4 = a4;
  +[ARUIRingGroup activityRingGroupForRingType:](ARUIRingGroup, "activityRingGroupForRingType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forWatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "withSpriteSheet");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = -[ARUIRingGroupController initWithRingGroup:]([ARUIRingGroupController alloc], "initWithRingGroup:", v6);

  return v8;
}

+ (id)ringGroupControllerConfiguredForCompanionWithRingType:(int64_t)a3 withIcon:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  ARUIRingGroupController *v8;

  v4 = a4;
  +[ARUIRingGroup activityRingGroupForRingType:](ARUIRingGroup, "activityRingGroupForRingType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forCompanion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "withSpriteSheet");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = -[ARUIRingGroupController initWithRingGroup:]([ARUIRingGroupController alloc], "initWithRingGroup:", v6);

  return v8;
}

- (void)setActiveEnergyPercentage:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  id v7;

  v4 = a4;
  -[ARUIRingGroupController ringGroup](self, "ringGroup");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v7, "setActiveEnergyPercentage:animated:", v4, v6);

}

- (void)setMovingHoursPercentage:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  id v7;

  v4 = a4;
  -[ARUIRingGroupController ringGroup](self, "ringGroup");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v7, "setStandHoursPercentage:animated:", v4, v6);

}

- (void)setBriskPercentage:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  id v7;

  v4 = a4;
  -[ARUIRingGroupController ringGroup](self, "ringGroup");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v7, "setExerciseMinutesPercentage:animated:", v4, v6);

}

- (void)setActiveEnergyPercentage:(double)a3 briskPercentage:(double)a4 movingHoursPercentage:(double)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v7 = a6;
  v12 = a7;
  -[ARUIRingGroupController ringGroup](self, "ringGroup");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = a3;
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  objc_msgSend(v16, "setActiveEnergyPercentage:exerciseMinutesPercentage:standHoursPercentage:animated:completion:", v7, v12, v13, v14, v15);

}

@end
