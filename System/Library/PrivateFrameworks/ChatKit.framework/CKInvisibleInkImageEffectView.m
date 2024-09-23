@implementation CKInvisibleInkImageEffectView

- (CKInvisibleInkImageEffectView)initWithFrame:(CGRect)a3
{
  CKInvisibleInkImageEffectView *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)CKInvisibleInkImageEffectView;
  v3 = -[CKInvisibleInkEffectView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkImageEffectView setBlurredImageContainerLayer:](v3, "setBlurredImageContainerLayer:", v4);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", &unk_1E2870E70, CFSTR("inputRadius"));
    objc_msgSend(v5, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkImageEffectView setBlurredImageLayer:](v3, "setBlurredImageLayer:", v6);

    v7 = *MEMORY[0x1E0CD2F98];
    -[CKInvisibleInkImageEffectView blurredImageLayer](v3, "blurredImageLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentsGravity:", v7);

    -[CKInvisibleInkImageEffectView blurredImageLayer](v3, "blurredImageLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldRasterize:", 1);

    -[CKInvisibleInkImageEffectView blurredImageLayer](v3, "blurredImageLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRasterizationScale:", 0.5);

    v28[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkImageEffectView blurredImageLayer](v3, "blurredImageLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilters:", v11);

    -[CKInvisibleInkImageEffectView blurredImageLayer](v3, "blurredImageLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMasksToBounds:", 1);

    -[CKInvisibleInkImageEffectView setupDrawEmitter](v3, "setupDrawEmitter");
    -[CKInvisibleInkImageEffectView setupDustEmitter](v3, "setupDustEmitter");
    -[CKInvisibleInkImageEffectView layer](v3, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkImageEffectView blurredImageContainerLayer](v3, "blurredImageContainerLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", v15);

    -[CKInvisibleInkImageEffectView blurredImageContainerLayer](v3, "blurredImageContainerLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkImageEffectView blurredImageLayer](v3, "blurredImageLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v17);

    -[CKInvisibleInkImageEffectView blurredImageContainerLayer](v3, "blurredImageContainerLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkImageEffectView drawEmitterContainerLayer](v3, "drawEmitterContainerLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSublayer:", v19);

    -[CKInvisibleInkImageEffectView drawEmitterContainerLayer](v3, "drawEmitterContainerLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkImageEffectView drawEmitterLayer](v3, "drawEmitterLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSublayer:", v21);

    -[CKInvisibleInkImageEffectView layer](v3, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkImageEffectView dustEmitterContainerLayer](v3, "dustEmitterContainerLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSublayer:", v23);

    -[CKInvisibleInkImageEffectView dustEmitterContainerLayer](v3, "dustEmitterContainerLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkImageEffectView dustEmitterLayer](v3, "dustEmitterLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSublayer:", v25);

  }
  return v3;
}

- (void)setupDrawEmitter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  _QWORD v32[2];
  void *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkImageEffectView setDrawEmitterContainerLayer:](self, "setDrawEmitterContainerLayer:", v3);

  -[CKInvisibleInkImageEffectView drawEmitterContainerLayer](self, "drawEmitterContainerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMasksToBounds:", 1);

  -[CKInvisibleInkImageEffectView drawEmitterContainerLayer](self, "drawEmitterContainerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRasterizationScale:", 0.25);

  objc_msgSend(MEMORY[0x1E0CD2768], "emitterCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("blurLarge"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setContents:", objc_msgSend(v7, "CGImage"));

  LODWORD(v8) = 1114636288;
  objc_msgSend(v6, "setBirthRate:", v8);
  objc_msgSend(v6, "setDuration:", INFINITY);
  objc_msgSend(v6, "setEmissionRange:", 0.785398163);
  LODWORD(v9) = 2.0;
  objc_msgSend(v6, "setLifetime:", v9);
  LODWORD(v10) = 2.0;
  objc_msgSend(v6, "setLifetimeRange:", v10);
  objc_msgSend(v6, "setScale:", 4.4);
  objc_msgSend(v6, "setVelocityRange:", 45.0);
  objc_msgSend(v6, "setEmissionRange:", 0.785398163);
  objc_msgSend(v6, "setParticleType:", *MEMORY[0x1E0CD2AF8]);
  objc_msgSend(v6, "setName:", CFSTR("drawCell"));
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AD0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v34[0] = objc_msgSend(v12, "CGColor");
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v34[1] = objc_msgSend(v13, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v14, CFSTR("colors"));

  objc_msgSend(v11, "setValue:forKey:", &unk_1E286FEE0, CFSTR("locations"));
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AE0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setName:", CFSTR("scaleBehavior"));
  objc_msgSend(v15, "setValue:forKey:", CFSTR("scale"), CFSTR("keyPath"));
  objc_msgSend(v15, "setValue:forKey:", &unk_1E286FEF8, CFSTR("values"));
  objc_msgSend(v15, "setValue:forKey:", &unk_1E286FF10, CFSTR("locations"));
  objc_msgSend(MEMORY[0x1E0CD2770], "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkImageEffectView setDrawEmitterLayer:](self, "setDrawEmitterLayer:", v16);

  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setInheritsTiming:", 0);

  v18 = CACurrentMediaTime();
  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBeginTime:", v18);

  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = 0;
  objc_msgSend(v20, "setLifetime:", v21);

  v22 = *MEMORY[0x1E0CD2B28];
  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setEmitterMode:", v22);

  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRenderMode:", CFSTR("cheapAdditive"));

  v33 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEmitterCells:", v25);

  v32[0] = v11;
  v32[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setEmitterBehaviors:", v27);

  objc_msgSend((id)objc_opt_class(), "updateInterval");
  v30 = v29;
  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setUpdateInterval:", v30);

}

- (void)setupDustEmitter
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  CKInvisibleInkImageEffectView *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkImageEffectView setDustEmitterContainerLayer:](self, "setDustEmitterContainerLayer:", v3);

  -[CKInvisibleInkImageEffectView dustEmitterContainerLayer](self, "dustEmitterContainerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  objc_msgSend(v4, "setMasksToBounds:", 1);

  v47 = self;
  -[CKInvisibleInkImageEffectView dustEmitterContainerLayer](self, "dustEmitterContainerLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupBlending:", 0);

  objc_msgSend(MEMORY[0x1E0CD2768], "emitterCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("speckle"));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setContents:", objc_msgSend(v8, "CGImage"));

  LODWORD(v9) = 1150681088;
  objc_msgSend(v7, "setBirthRate:", v9);
  objc_msgSend(v7, "setContentsScale:", 1.79999995);
  objc_msgSend(v7, "setEmissionRange:", 6.28318531);
  LODWORD(v10) = 1008981770;
  objc_msgSend(v7, "setMassRange:", v10);
  LODWORD(v11) = 8.0;
  objc_msgSend(v7, "setLifetime:", v11);
  objc_msgSend(v7, "setScale:", 0.5);
  objc_msgSend(v7, "setVelocityRange:", 0.0);
  objc_msgSend(v7, "setName:", CFSTR("dustCell"));
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.0);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setColor:", objc_msgSend(v13, "CGColor"));

  LODWORD(v14) = 1.0;
  objc_msgSend(v7, "setAlphaRange:", v14);
  v46 = v7;
  objc_msgSend(v7, "setParticleType:", *MEMORY[0x1E0CD2AF8]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0CD2AD8];
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AD8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setName:", CFSTR("fingerAttractor"));
  v45 = v17;
  objc_msgSend(v15, "addObject:", v17);
  v18 = *MEMORY[0x1E0CD2AE0];
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AE0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setName:", CFSTR("alphaBehavior"));
  objc_msgSend(v19, "setValue:forKey:", CFSTR("color.alpha"), CFSTR("keyPath"));
  objc_msgSend(v19, "setValue:forKey:", &unk_1E286FF28, CFSTR("values"));
  objc_msgSend(v19, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("additive"));
  v44 = v19;
  objc_msgSend(v15, "addObject:", v19);
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setName:", CFSTR("scaleBehavior"));
  objc_msgSend(v20, "setValue:forKey:", CFSTR("scale"), CFSTR("keyPath"));
  objc_msgSend(v20, "setValue:forKey:", &unk_1E286FF40, CFSTR("values"));
  objc_msgSend(v20, "setValue:forKey:", &unk_1E286FF58, CFSTR("locations"));
  v43 = v20;
  objc_msgSend(v15, "addObject:", v20);
  v21 = 0;
  v22 = *MEMORY[0x1E0C9D538];
  v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  do
  {
    v24 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("randomAttractor%d"), v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setName:", v25);
    objc_msgSend(v26, "setValue:forKey:", &unk_1E2870ED0, CFSTR("radius"));
    objc_msgSend(v26, "setValue:forKey:", &unk_1E2870EE8, CFSTR("stiffness"));
    objc_msgSend(v26, "setValue:forKey:", &unk_1E2870F00, CFSTR("falloff"));
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v22, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setValue:forKey:", v27, CFSTR("position"));

    objc_msgSend(v15, "addObject:", v26);
    v5 = 0;
    v21 = 1;
  }
  while ((v24 & 1) != 0);
  objc_msgSend(MEMORY[0x1E0CD2770], "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkImageEffectView setDustEmitterLayer:](v47, "setDustEmitterLayer:", v28);

  -[CKInvisibleInkImageEffectView dustEmitterLayer](v47, "dustEmitterLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setInheritsTiming:", 0);

  v30 = CACurrentMediaTime();
  -[CKInvisibleInkImageEffectView dustEmitterLayer](v47, "dustEmitterLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBeginTime:", v30);

  -[CKInvisibleInkImageEffectView dustEmitterLayer](v47, "dustEmitterLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setMasksToBounds:", 1);

  v48[0] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkImageEffectView dustEmitterLayer](v47, "dustEmitterLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setEmitterCells:", v33);

  -[CKInvisibleInkImageEffectView dustEmitterLayer](v47, "dustEmitterLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setEmitterBehaviors:", v15);

  v36 = *MEMORY[0x1E0CD2B30];
  -[CKInvisibleInkImageEffectView dustEmitterLayer](v47, "dustEmitterLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setEmitterShape:", v36);

  v38 = *MEMORY[0x1E0CD2B10];
  -[CKInvisibleInkImageEffectView dustEmitterLayer](v47, "dustEmitterLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setRenderMode:", v38);

  objc_msgSend((id)objc_opt_class(), "updateInterval");
  v41 = v40;
  -[CKInvisibleInkImageEffectView dustEmitterLayer](v47, "dustEmitterLayer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setUpdateInterval:", v41);

  -[CKInvisibleInkImageEffectView endDustEmitterFingerEffects](v47, "endDustEmitterFingerEffects");
}

- (void)addDustRandomEmitterAnimationsWithSize:(CGSize)a3
{
  double height;
  void *v5;
  double v6;
  char v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  double v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  long double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double width;
  id v33;
  double v34;
  double v35;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CD2710], "animation");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTimingFunction:", v5);

  objc_msgSend(v33, "setFromValue:", &unk_1E2870F18);
  objc_msgSend(v33, "setToValue:", &unk_1E2870F30);
  objc_msgSend(v33, "setDuration:", 2.0);
  LODWORD(v6) = 2139095040;
  objc_msgSend(v33, "setRepeatCount:", v6);
  v7 = 1;
  objc_msgSend(v33, "setAutoreverses:", 1);
  objc_msgSend(v33, "setRemovedOnCompletion:", 0);
  v8 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v33, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(MEMORY[0x1E0CD2798], "animation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
  objc_msgSend(v9, "setDuration:", 3.0);
  LODWORD(v10) = 2139095040;
  objc_msgSend(v9, "setRepeatCount:", v10);
  objc_msgSend(v9, "setAutoreverses:", 1);
  objc_msgSend(v9, "setRemovedOnCompletion:", 0);
  objc_msgSend(v9, "setFillMode:", v8);
  v11 = 0;
  v12 = 0.5;
  v31 = 0x400921FB54442D18;
  do
  {
    v13 = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("emitterBehaviors.randomAttractor%d.falloff"), v11, v31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setKeyPath:", v14);

    -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "keyPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:forKey:", v33, v16);

    v34 = dbl_18E7CC138[v11];
    v35 = dbl_18E7CC118[v11];
    v17 = 36;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 36);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (double)(int)v11;
    v20 = (double)(int)v11 * 0.1 + 0.3;
    v21 = 0.0;
    do
    {
      v22 = v21 * v12;
      v23 = height;
      v24 = v22 + v19;
      v25 = width * (v20 * cos(v35 * (v22 + v19) * 3.14159265) + 0.5);
      v26 = v34 * v24;
      height = v23;
      v12 = 0.5;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", (double)v25, (double)(height * (v20 * sin(v26 * 3.14159265) + 0.5)));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v27);

      v21 = v21 + 1.0;
      --v17;
    }
    while (v17);
    objc_msgSend(v9, "setValues:", v18);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("emitterBehaviors.randomAttractor%d.position"), v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setKeyPath:", v28);

    -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyPath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addAnimation:forKey:", v9, v30);

    v7 = 0;
    v11 = 1;
  }
  while ((v13 & 1) != 0);

}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKInvisibleInkImageEffectView;
  v4 = a3;
  -[CKInvisibleInkEffectView setImage:](&v8, sel_setImage_, v4);
  v5 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "CGImage", v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CKInvisibleInkImageEffectView blurredImageLayer](self, "blurredImageLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContents:", v6);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double x;
  double y;
  double width;
  double height;
  void *v13;
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
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v30.receiver = self;
  v30.super_class = (Class)CKInvisibleInkImageEffectView;
  -[CKInvisibleInkEffectView layoutSubviews](&v30, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CKInvisibleInkImageEffectView bounds](self, "bounds");
  v4 = v3;
  -[CKInvisibleInkImageEffectView bounds](self, "bounds");
  v6 = v5;
  -[CKInvisibleInkImageEffectView blurredImageLayer](self, "blurredImageLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  -[CKInvisibleInkImageEffectView blurredImageContainerLayer](self, "blurredImageContainerLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v4, v6);

  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = v4;
  v31.size.height = v6;
  v32 = CGRectInset(v31, -4.0, -4.0);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  -[CKInvisibleInkImageEffectView drawEmitterContainerLayer](self, "drawEmitterContainerLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", x, y, width, height);

  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.width = v4;
  v33.size.height = v6;
  v34 = CGRectOffset(v33, 4.0, 4.0);
  v14 = v34.origin.x;
  v15 = v34.origin.y;
  v16 = v34.size.width;
  v17 = v34.size.height;
  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v14, v15, v16, v17);

  -[CKInvisibleInkImageEffectView dustEmitterContainerLayer](self, "dustEmitterContainerLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", 0.0, 0.0, v4, v6);

  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", 0.0, 0.0, v4, v6);

  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setEmitterPosition:", v4 * 0.5, v6 * 0.5);

  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEmitterSize:", v4, v6);

  v35.origin.x = 0.0;
  v35.origin.y = 0.0;
  v35.size.width = v4;
  v35.size.height = v6;
  v36 = CGRectInset(v35, -5.0, -5.0);
  v23 = v36.origin.x;
  v24 = v36.origin.y;
  v25 = v36.size.width;
  v26 = v36.size.height;
  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCullRect:", v23, v24, v25, v26);

  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4 * 1200.0 * v6 / 50000.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setValue:forKeyPath:", v29, CFSTR("emitterCells.dustCell.birthRate"));

  -[CKInvisibleInkImageEffectView addDustRandomEmitterAnimationsWithSize:](self, "addDustRandomEmitterAnimationsWithSize:", v4, v6);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)enableBlending
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKInvisibleInkImageEffectView drawEmitterContainerLayer](self, "drawEmitterContainerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("disableBlending"));

  v4 = *MEMORY[0x1E0CD2C50];
  -[CKInvisibleInkImageEffectView drawEmitterContainerLayer](self, "drawEmitterContainerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompositingFilter:", v4);

  -[CKInvisibleInkImageEffectView drawEmitterContainerLayer](self, "drawEmitterContainerLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldRasterize:", 1);

  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUpdateInterval:", 0.0);

  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUpdateInterval:", 0.0);

}

- (void)disableBlending
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  -[CKInvisibleInkImageEffectView drawEmitterContainerLayer](self, "drawEmitterContainerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompositingFilter:", 0);

  -[CKInvisibleInkImageEffectView drawEmitterContainerLayer](self, "drawEmitterContainerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldRasterize:", 0);

  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompositingFilter:", 0);

  objc_msgSend((id)objc_opt_class(), "updateInterval");
  v7 = v6;
  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUpdateInterval:", v7);

  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUpdateInterval:", v7);

}

- (void)endDrawEmitterEffects
{
  void *v3;
  double v4;
  void *v5;
  id v6;

  if (!-[CKInvisibleInkEffectView isSuspended](self, "isSuspended"))
  {
    -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = 0;
    objc_msgSend(v3, "setLifetime:", v4);

    objc_msgSend(MEMORY[0x1E0CD26F8], "animation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDuration:", 4.0);
    objc_msgSend(v6, "setDelegate:", self);
    -[CKInvisibleInkImageEffectView drawEmitterContainerLayer](self, "drawEmitterContainerLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAnimation:forKey:", v6, CFSTR("disableBlending"));

  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
    -[CKInvisibleInkImageEffectView disableBlending](self, "disableBlending", a3);
}

- (void)setRandomAttractorsEnabled:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
    v4 = 5;
  else
    v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("emitterBehaviors.randomAttractor%d.stiffness"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKeyPath:", v9, v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("emitterBehaviors.randomAttractor%d.stiffness"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKeyPath:", v9, v7);

}

- (void)endDustEmitterFingerEffects
{
  void *v3;
  void *v4;

  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2870E88, CFSTR("emitterBehaviors.fingerAttractor.stiffness"));

  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", MEMORY[0x1E0C9AAA0], CFSTR("emitterBehaviors.fingerAttractor.enabled"));

  -[CKInvisibleInkImageEffectView setRandomAttractorsEnabled:](self, "setRandomAttractorsEnabled:", 1);
}

- (void)moveEmittersWithTouches:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  if (!-[CKInvisibleInkEffectView isSuspended](self, "isSuspended"))
  {
    objc_msgSend(v22, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", self);
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "force");
    v10 = fmin(fmax(v9 / 3.8, 0.0), 1.0);
    -[CKInvisibleInkImageEffectView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "forceTouchCapability");

    if (v12 == 2)
      v13 = v10;
    else
      v13 = 0.5;
    -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEmitterPosition:", v6, v8);

    -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13 * 130.0 + 190.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKeyPath:", v16, CFSTR("emitterBehaviors.fingerAttractor.radius"));

    -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13 * -65.0 + -95.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forKeyPath:", v18, CFSTR("emitterBehaviors.fingerAttractor.falloff"));

    -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v6, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setValue:forKeyPath:", v20, CFSTR("emitterBehaviors.fingerAttractor.position"));

    -[CKInvisibleInkEffectView coverageTracker](self, "coverageTracker");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "recordTouchAtPoint:", v6, v8);

  }
}

- (void)moveEmittersForTouchesBegan:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CD28B0];
  v5 = a3;
  objc_msgSend(v4, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  LODWORD(v4) = CKIsRunningInMacCatalyst();
  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  LODWORD(v8) = 3.0;
  if (!(_DWORD)v4)
    *(float *)&v8 = 1.0;
  objc_msgSend(v6, "setLifetime:", v8);

  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKeyPath:", &unk_1E2870F48, CFSTR("emitterBehaviors.fingerAttractor.stiffness"));

  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("emitterBehaviors.fingerAttractor.enabled"));

  -[CKInvisibleInkImageEffectView setRandomAttractorsEnabled:](self, "setRandomAttractorsEnabled:", 0);
  -[CKInvisibleInkImageEffectView enableBlending](self, "enableBlending");
  -[CKInvisibleInkImageEffectView moveEmittersWithTouches:](self, "moveEmittersWithTouches:", v5);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKInvisibleInkImageEffectView;
  v6 = a3;
  -[CKInvisibleInkImageEffectView touchesMoved:withEvent:](&v7, sel_touchesMoved_withEvent_, v6, a4);
  -[CKInvisibleInkImageEffectView moveEmittersForTouchesMoved:](self, "moveEmittersForTouchesMoved:", v6, v7.receiver, v7.super_class);

}

- (void)moveEmittersForTouchesMoved:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0CD28B0];
  v5 = a3;
  objc_msgSend(v4, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CKInvisibleInkImageEffectView moveEmittersWithTouches:](self, "moveEmittersWithTouches:", v5);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)endEmittersForTouchesEnded:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin", a3);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CKInvisibleInkImageEffectView endDrawEmitterEffects](self, "endDrawEmitterEffects");
  -[CKInvisibleInkImageEffectView endDustEmitterFingerEffects](self, "endDustEmitterFingerEffects");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)endEmittersForTouchesCancelled:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin", a3);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CKInvisibleInkImageEffectView endDrawEmitterEffects](self, "endDrawEmitterEffects");
  -[CKInvisibleInkImageEffectView endDustEmitterFingerEffects](self, "endDustEmitterFingerEffects");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)reset
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKInvisibleInkImageEffectView;
  -[CKInvisibleInkEffectView reset](&v14, sel_reset);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setLifetime:", v4);

  -[CKInvisibleInkImageEffectView drawEmitterContainerLayer](self, "drawEmitterContainerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("disableBlending"));

  -[CKInvisibleInkImageEffectView disableBlending](self, "disableBlending");
  -[CKInvisibleInkImageEffectView endDustEmitterFingerEffects](self, "endDustEmitterFingerEffects");
  -[CKInvisibleInkImageEffectView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v8 = v7;
  -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBeginTime:", v8);

  -[CKInvisibleInkImageEffectView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v12 = v11;
  -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBeginTime:", v12);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[CKInvisibleInkImageEffectView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v3 = a3;
  v5 = -[CKInvisibleInkEffectView isSuspended](self, "isSuspended");
  v38.receiver = self;
  v38.super_class = (Class)CKInvisibleInkImageEffectView;
  -[CKInvisibleInkEffectView setSuspended:](&v38, sel_setSuspended_, v3);
  if (v5 != v3)
  {
    v6 = !v3;
    -[CKInvisibleInkImageEffectView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3 ^ 1);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v7, "setValue:forKeyPath:", MEMORY[0x1E0C9AAA0], CFSTR("emitterBehaviors.fingerAttractor.enabled"));

      -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v29) = 1.0;
      objc_msgSend(v28, "setBirthRate:", v29);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("birthRate"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setDuration:", 1.0);
      v30 = *MEMORY[0x1E0CD3048];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTimingFunction:", v31);

      objc_msgSend(v24, "setFromValue:", &unk_1E2870E88);
      objc_msgSend(v24, "setToValue:", &unk_1E2870EA0);
      -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "keyPath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addAnimation:forKey:", v24, v33);

      -[CKInvisibleInkImageEffectView setRandomAttractorsEnabled:](self, "setRandomAttractorsEnabled:", 1);
      -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setValue:forKeyPath:", &unk_1E286FF88, CFSTR("emitterBehaviors.scaleBehavior.values"));

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("emitterBehaviors.scaleBehavior.values.@index(1)"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDuration:", 2.0);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v30);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTimingFunction:", v35);

      objc_msgSend(v26, "setFromValue:", &unk_1E28719A0);
      objc_msgSend(v26, "setToValue:", &unk_1E2871990);
      -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "keyPath");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addAnimation:forKey:", v26, v37);

      -[CKInvisibleInkImageEffectView endDrawEmitterEffects](self, "endDrawEmitterEffects");
    }
    else
    {
      objc_msgSend(v7, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("emitterBehaviors.fingerAttractor.enabled"));

      -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKeyPath:", &unk_1E2870EE8, CFSTR("emitterBehaviors.fingerAttractor.stiffness"));

      -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKeyPath:", &unk_1E2870F60, CFSTR("emitterBehaviors.fingerAttractor.radius"));

      -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forKeyPath:", &unk_1E2870F78, CFSTR("emitterBehaviors.fingerAttractor.falloff"));

      -[CKInvisibleInkImageEffectView bounds](self, "bounds");
      v13 = v12 * 0.5;
      -[CKInvisibleInkImageEffectView bounds](self, "bounds");
      v15 = v14 * 0.5;
      -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v13, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setValue:forKeyPath:", v17, CFSTR("emitterBehaviors.fingerAttractor.position"));

      -[CKInvisibleInkImageEffectView dustEmitterLayer](self, "dustEmitterLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = 0;
      objc_msgSend(v18, "setBirthRate:", v19);

      -[CKInvisibleInkImageEffectView setRandomAttractorsEnabled:](self, "setRandomAttractorsEnabled:", 0);
      -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setEmitterPosition:", v13, v15);

      -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = 1.0;
      objc_msgSend(v21, "setLifetime:", v22);

      -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setValue:forKeyPath:", &unk_1E286FF70, CFSTR("emitterBehaviors.scaleBehavior.values"));

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("emitterBehaviors.scaleBehavior.values.@index(1)"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setDuration:", 1.0);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTimingFunction:", v25);

      objc_msgSend(v24, "setFromValue:", &unk_1E2871990);
      objc_msgSend(v24, "setToValue:", &unk_1E28719A0);
      -[CKInvisibleInkImageEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "keyPath");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addAnimation:forKey:", v24, v27);

    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v3 = a3;
  v5 = -[CKInvisibleInkEffectView isPaused](self, "isPaused");
  v19.receiver = self;
  v19.super_class = (Class)CKInvisibleInkImageEffectView;
  -[CKInvisibleInkEffectView setPaused:](&v19, sel_setPaused_, v3);
  if (v5 != v3)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    -[CKInvisibleInkImageEffectView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    if (v3)
    {
      LODWORD(v7) = 0;
      objc_msgSend(v6, "setSpeed:", v7);

      -[CKInvisibleInkImageEffectView layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInvisibleInkImageEffectView layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "superlayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v13 = v12;
      objc_msgSend(v9, "timeOffset");
      v15 = v13 + v14;
    }
    else
    {
      LODWORD(v7) = 1.0;
      objc_msgSend(v6, "setSpeed:", v7);

      -[CKInvisibleInkImageEffectView layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInvisibleInkImageEffectView layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "superlayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v17 = v16;
      objc_msgSend(v9, "timeOffset");
      v15 = v18 - v17;
    }
    objc_msgSend(v9, "setTimeOffset:", v15);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (CALayer)blurredImageLayer
{
  return self->_blurredImageLayer;
}

- (void)setBlurredImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_blurredImageLayer, a3);
}

- (CALayer)blurredImageContainerLayer
{
  return self->_blurredImageContainerLayer;
}

- (void)setBlurredImageContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_blurredImageContainerLayer, a3);
}

- (CALayer)drawEmitterContainerLayer
{
  return self->_drawEmitterContainerLayer;
}

- (void)setDrawEmitterContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_drawEmitterContainerLayer, a3);
}

- (CAEmitterLayer)drawEmitterLayer
{
  return self->_drawEmitterLayer;
}

- (void)setDrawEmitterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_drawEmitterLayer, a3);
}

- (CALayer)dustEmitterContainerLayer
{
  return self->_dustEmitterContainerLayer;
}

- (void)setDustEmitterContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dustEmitterContainerLayer, a3);
}

- (CAEmitterLayer)dustEmitterLayer
{
  return self->_dustEmitterLayer;
}

- (void)setDustEmitterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dustEmitterLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dustEmitterLayer, 0);
  objc_storeStrong((id *)&self->_dustEmitterContainerLayer, 0);
  objc_storeStrong((id *)&self->_drawEmitterLayer, 0);
  objc_storeStrong((id *)&self->_drawEmitterContainerLayer, 0);
  objc_storeStrong((id *)&self->_blurredImageContainerLayer, 0);
  objc_storeStrong((id *)&self->_blurredImageLayer, 0);
}

@end
