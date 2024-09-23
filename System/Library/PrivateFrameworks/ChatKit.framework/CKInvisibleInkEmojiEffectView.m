@implementation CKInvisibleInkEmojiEffectView

- (CKInvisibleInkEmojiEffectView)initWithFrame:(CGRect)a3
{
  CKInvisibleInkEmojiEffectView *v3;
  CKInvisibleInkEmojiEffectView *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
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
  objc_super v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)CKInvisibleInkEmojiEffectView;
  v3 = -[CKInvisibleInkEffectView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKInvisibleInkEmojiEffectView createDrawEmitter](v3, "createDrawEmitter");
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView setEmojiContainerLayer:](v4, "setEmojiContainerLayer:", v5);

    -[CKInvisibleInkEmojiEffectView emojiContainerLayer](v4, "emojiContainerLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMasksToBounds:", 1);

    -[CKInvisibleInkEmojiEffectView emojiContainerLayer](v4, "emojiContainerLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView setEmojiLayer:](v4, "setEmojiLayer:", v8);

    -[CKInvisibleInkEmojiEffectView emojiContainerLayer](v4, "emojiContainerLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView emojiLayer](v4, "emojiLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", v10);

    -[CKInvisibleInkEmojiEffectView emojiContainerLayer](v4, "emojiContainerLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView drawEmitterLayer](v4, "drawEmitterLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v12);

    -[CKInvisibleInkEmojiEffectView layer](v4, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView emojiContainerLayer](v4, "emojiContainerLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v14);

    -[CKInvisibleInkEmojiEffectView createDustEmitter](v4, "createDustEmitter");
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView setDustContainerLayer:](v4, "setDustContainerLayer:", v15);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forKey:", &unk_1E28700A8, CFSTR("inputRadius"));
    objc_msgSend(v16, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView setBlurredEmojiLayer:](v4, "setBlurredEmojiLayer:", v17);

    -[CKInvisibleInkEmojiEffectView blurredEmojiLayer](v4, "blurredEmojiLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShouldRasterize:", 1);

    -[CKInvisibleInkEmojiEffectView blurredEmojiLayer](v4, "blurredEmojiLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRasterizationScale:", 0.5);

    v44[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView blurredEmojiLayer](v4, "blurredEmojiLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFilters:", v20);

    -[CKInvisibleInkEmojiEffectView blurredEmojiLayer](v4, "blurredEmojiLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMasksToBounds:", 1);

    v23 = *MEMORY[0x1E0CD2EC0];
    -[CKInvisibleInkEmojiEffectView blurredEmojiLayer](v4, "blurredEmojiLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCompositingFilter:", v23);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView setMaskLayer:](v4, "setMaskLayer:", v25);

    -[CKInvisibleInkEmojiEffectView maskLayer](v4, "maskLayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setShouldRasterize:", 1);

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scale");
    v29 = v28;
    -[CKInvisibleInkEmojiEffectView maskLayer](v4, "maskLayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setRasterizationScale:", v29);

    v31 = *MEMORY[0x1E0CD2C48];
    -[CKInvisibleInkEmojiEffectView maskLayer](v4, "maskLayer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCompositingFilter:", v31);

    -[CKInvisibleInkEmojiEffectView maskLayer](v4, "maskLayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMasksToBounds:", 1);

    -[CKInvisibleInkEmojiEffectView dustEmitterLayer](v4, "dustEmitterLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView blurredEmojiLayer](v4, "blurredEmojiLayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSublayer:", v35);

    -[CKInvisibleInkEmojiEffectView dustContainerLayer](v4, "dustContainerLayer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView dustEmitterLayer](v4, "dustEmitterLayer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSublayer:", v37);

    -[CKInvisibleInkEmojiEffectView dustContainerLayer](v4, "dustContainerLayer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView maskLayer](v4, "maskLayer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSublayer:", v39);

    -[CKInvisibleInkEmojiEffectView layer](v4, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkEmojiEffectView dustContainerLayer](v4, "dustContainerLayer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSublayer:", v41);

  }
  return v4;
}

- (void)createDustEmitter
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0CD2768], "emitterCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("speckle"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setContents:", objc_msgSend(v5, "CGImage"));

  objc_msgSend(v4, "setContentsScale:", 1.79999995);
  objc_msgSend(v4, "setEmissionRange:", 6.28318531);
  LODWORD(v6) = 1008981770;
  objc_msgSend(v4, "setMassRange:", v6);
  LODWORD(v7) = 8.0;
  objc_msgSend(v4, "setLifetime:", v7);
  objc_msgSend(v4, "setScale:", 0.5);
  objc_msgSend(v4, "setVelocityRange:", 20.0);
  objc_msgSend(v4, "setName:", CFSTR("dustCell"));
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.0);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setColor:", objc_msgSend(v9, "CGColor"));

  LODWORD(v10) = 1.0;
  objc_msgSend(v4, "setAlphaRange:", v10);
  objc_msgSend(v4, "setParticleType:", *MEMORY[0x1E0CD2AF8]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AE0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", CFSTR("alphaBehavior"));
  objc_msgSend(v12, "setValue:forKey:", CFSTR("color.alpha"), CFSTR("keyPath"));
  objc_msgSend(v12, "setValue:forKey:", &unk_1E286F238, CFSTR("values"));
  objc_msgSend(v12, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("additive"));
  objc_msgSend(v11, "addObject:", v12);
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AC8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", &unk_1E28710E0, CFSTR("orientationLongitude"));
  objc_msgSend(v13, "setValue:forKey:", &unk_1E28710F0, CFSTR("orientationLatitude"));
  objc_msgSend(v13, "setName:", CFSTR("fingerAttractor"));
  objc_msgSend(v11, "addObject:", v13);
  objc_msgSend(MEMORY[0x1E0CD2770], "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkEmojiEffectView setDustEmitterLayer:](self, "setDustEmitterLayer:", v14);

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMasksToBounds:", 1);

  v24[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEmitterCells:", v16);

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEmitterBehaviors:", v11);

  v19 = *MEMORY[0x1E0CD2B30];
  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEmitterShape:", v19);

  objc_msgSend((id)objc_opt_class(), "updateInterval");
  v22 = v21;
  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setUpdateInterval:", v22);

  -[CKInvisibleInkEmojiEffectView endDustEmitterLayerFingerEffects](self, "endDustEmitterLayerFingerEffects");
}

- (void)createDrawEmitter
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
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
  _QWORD v28[2];
  void *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2768], "emitterCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("blurLarge"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setContents:", objc_msgSend(v4, "CGImage"));

  LODWORD(v5) = 1114636288;
  objc_msgSend(v3, "setBirthRate:", v5);
  objc_msgSend(v3, "setDuration:", INFINITY);
  LODWORD(v6) = 6.0;
  objc_msgSend(v3, "setLifetime:", v6);
  LODWORD(v7) = 1.0;
  objc_msgSend(v3, "setLifetimeRange:", v7);
  objc_msgSend(v3, "setParticleType:", *MEMORY[0x1E0CD2AF8]);
  objc_msgSend(v3, "setOrientationLongitude:", 3.14159265);
  objc_msgSend(v3, "setOrientationLatitude:", 0.0);
  objc_msgSend(v3, "setEmissionRange:", 0.0);
  objc_msgSend(v3, "setScale:", 1.0);
  objc_msgSend(v3, "setVelocityRange:", 10.0);
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AD0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v30[0] = objc_msgSend(v9, "CGColor");
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v30[1] = objc_msgSend(v10, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("colors"));

  objc_msgSend(v8, "setValue:forKey:", &unk_1E286F250, CFSTR("locations"));
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AE0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", CFSTR("scaleBehavior"));
  objc_msgSend(v12, "setValue:forKey:", CFSTR("scale"), CFSTR("keyPath"));
  objc_msgSend(v12, "setValue:forKey:", &unk_1E286F268, CFSTR("values"));
  objc_msgSend(v12, "setValue:forKey:", &unk_1E286F280, CFSTR("locations"));
  objc_msgSend(MEMORY[0x1E0CD2770], "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkEmojiEffectView setDrawEmitterLayer:](self, "setDrawEmitterLayer:", v13);

  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 0;
  objc_msgSend(v14, "setLifetime:", v15);

  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMasksToBounds:", 1);

  v17 = *MEMORY[0x1E0CD2B28];
  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEmitterMode:", v17);

  v29 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEmitterCells:", v19);

  v28[0] = v8;
  v28[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEmitterBehaviors:", v21);

  objc_msgSend((id)objc_opt_class(), "updateInterval");
  v24 = v23;
  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setUpdateInterval:", v24);

  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setShouldRasterize:", 1);

  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setRasterizationScale:", 0.25);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
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
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double x;
  double y;
  double width;
  double height;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;
  CGRect v43;
  CGRect v44;

  v42.receiver = self;
  v42.super_class = (Class)CKInvisibleInkEmojiEffectView;
  -[CKInvisibleInkEffectView layoutSubviews](&v42, sel_layoutSubviews);
  -[CKInvisibleInkEmojiEffectView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkEmojiEffectView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CKInvisibleInkEmojiEffectView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertRect:toLayer:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[CKInvisibleInkEmojiEffectView emojiContainerLayer](self, "emojiContainerLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  -[CKInvisibleInkEmojiEffectView dustContainerLayer](self, "dustContainerLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);

  v26 = *MEMORY[0x1E0C9D538];
  v27 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[CKInvisibleInkEmojiEffectView emojiLayer](self, "emojiLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v26, v27, v21, v23);

  v43.origin.x = v26;
  v43.origin.y = v27;
  v43.size.width = v21;
  v43.size.height = v23;
  v44 = CGRectInset(v43, -4.0, -4.0);
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;
  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", x, y, width, height);

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v26, v27, v21, v23);

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setEmitterPosition:", v21 * 0.5, v23 * 0.5);

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setEmitterSize:", v21, v23);

  -[CKInvisibleInkEmojiEffectView blurredEmojiLayer](self, "blurredEmojiLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v26, v27, v21, v23);

  -[CKInvisibleInkEmojiEffectView maskLayer](self, "maskLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v26, v27, v21, v23);

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23 * (v21 * 0.09));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setValue:forKeyPath:", v40, CFSTR("emitterCells.dustCell.birthRate"));

  -[CKInvisibleInkEmojiEffectView layer](self, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setNeedsDisplay");

}

- (void)displayLayer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  _QWORD v39[3];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[CKInvisibleInkEmojiEffectView textView](self, "textView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsDisplay");

  -[CKInvisibleInkEmojiEffectView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceDisplayIfNeeded");

  -[CKInvisibleInkEmojiEffectView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v8;
  v33 = v7;
  switch(objc_msgSend(v7, "__ck_bigEmojiStyle"))
  {
    case 0:
      objc_msgSend(v8, "balloonTextFont");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(v8, "singleBigEmojiFont");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(v8, "multipleBigEmojiFont");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend(v8, "singleBigAssetFont");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = (void *)v9;
      break;
    default:
      v10 = 0;
      break;
  }
  -[CKInvisibleInkEmojiEffectView textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v10;
  objc_msgSend(v11, "setFont:", v10);

  objc_msgSend(MEMORY[0x1E0CEA618], "preferredFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setScale:", 0.0);
  objc_msgSend(v12, "setPreferredRange:", 0);
  objc_msgSend(v12, "setOpaque:", 0);
  v13 = objc_alloc(MEMORY[0x1E0CEA610]);
  -[CKInvisibleInkEmojiEffectView textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v17 = (void *)objc_msgSend(v13, "initWithSize:format:", v12, v15, v16);

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __46__CKInvisibleInkEmojiEffectView_displayLayer___block_invoke;
  v38[3] = &unk_1E274A3D0;
  v38[4] = self;
  v30 = v17;
  objc_msgSend(v17, "imageWithActions:", v38);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[CKInvisibleInkEmojiEffectView emojiLayer](self, "emojiLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v19;
  -[CKInvisibleInkEmojiEffectView blurredEmojiLayer](self, "blurredEmojiLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v20;
  -[CKInvisibleInkEmojiEffectView maskLayer](self, "maskLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    v26 = *MEMORY[0x1E0CD2FB0];
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v27);
        objc_msgSend(v28, "setContents:", objc_msgSend(objc_retainAutorelease(v18), "CGImage"));
        objc_msgSend(v28, "setContentsGravity:", v26);
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "scale");
        objc_msgSend(v28, "setContentsScale:");

        ++v27;
      }
      while (v24 != v27);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v24);
  }

}

void __46__CKInvisibleInkEmojiEffectView_displayLayer___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  CGRect v19;
  CGRect v20;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "textView", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "frame");
        v20.origin.x = v6;
        v20.origin.y = v7;
        v20.size.width = v8;
        v20.size.height = v9;
        if (!CGRectEqualToRect(v19, v20))
        {
          objc_msgSend(v11, "layer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "renderInContext:", UIGraphicsGetCurrentContext());

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (void)attachToBalloonView:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(a3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkEmojiEffectView setTextView:](self, "setTextView:", v4);

  -[CKInvisibleInkEmojiEffectView textView](self, "textView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setOpacity:", v6);

}

- (void)detachFromBalloonView
{
  void *v3;
  void *v4;
  double v5;

  -[CKInvisibleInkEmojiEffectView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1.0;
  objc_msgSend(v4, "setOpacity:", v5);

  -[CKInvisibleInkEmojiEffectView setTextView:](self, "setTextView:", 0);
}

- (void)enableBlending
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("disableBlending"));

  v4 = *MEMORY[0x1E0CD2E50];
  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompositingFilter:", v4);

  -[CKInvisibleInkEmojiEffectView emojiContainerLayer](self, "emojiContainerLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUpdateInterval:", 0.0);

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUpdateInterval:", 0.0);

}

- (void)disableBlending
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompositingFilter:", 0);

  -[CKInvisibleInkEmojiEffectView emojiContainerLayer](self, "emojiContainerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  objc_msgSend((id)objc_opt_class(), "updateInterval");
  v6 = v5;
  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUpdateInterval:", v6);

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUpdateInterval:", v6);

}

- (void)endDrawEmitterEffects
{
  void *v3;
  double v4;
  void *v5;
  id v6;

  if (!-[CKInvisibleInkEffectView isSuspended](self, "isSuspended"))
  {
    -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = 0;
    objc_msgSend(v3, "setLifetime:", v4);

    if (!-[CKInvisibleInkEffectView isSuspended](self, "isSuspended"))
    {
      objc_msgSend(MEMORY[0x1E0CD26F8], "animation");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDuration:", 7.0);
      objc_msgSend(v6, "setDelegate:", self);
      -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAnimation:forKey:", v6, CFSTR("disableBlending"));

    }
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
    -[CKInvisibleInkEmojiEffectView disableBlending](self, "disableBlending", a3);
}

- (void)reset
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKInvisibleInkEmojiEffectView;
  -[CKInvisibleInkEffectView reset](&v4, sel_reset);
  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("disableBlending"));

  -[CKInvisibleInkEmojiEffectView disableBlending](self, "disableBlending");
  -[CKInvisibleInkEmojiEffectView setNeedsLayout](self, "setNeedsLayout");
}

- (void)moveEmittersWithTouches:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  objc_msgSend(a3, "anyObject");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEmitterPosition:", v5, v7);

  objc_msgSend(v25, "force");
  v10 = fmin(fmax(v9 / 3.8, 0.0), 1.0);
  -[CKInvisibleInkEmojiEffectView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "forceTouchCapability");

  v13 = 0.5;
  if (v12 == 2)
    v13 = v10;
  v14 = v13 * 130.0 + 190.0;
  v15 = v13 * -65.0 + -95.0;
  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKeyPath:", v17, CFSTR("emitterBehaviors.fingerAttractor.radius"));

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKeyPath:", v19, CFSTR("emitterBehaviors.fingerAttractor.falloff"));

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB3B18];
  -[CKInvisibleInkEmojiEffectView layer](self, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "convertPoint:toLayer:", v23, v5, v7);
  objc_msgSend(v21, "valueWithCGPoint:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setValue:forKeyPath:", v24, CFSTR("emitterBehaviors.fingerAttractor.position"));

}

- (void)endDustEmitterLayerFingerEffects
{
  void *v3;
  id v4;

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E28700C0, CFSTR("emitterBehaviors.fingerAttractor.stiffness"));

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", MEMORY[0x1E0C9AAA0], CFSTR("emitterBehaviors.fingerAttractor.enabled"));

}

- (void)endTouches
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CKInvisibleInkEmojiEffectView endDrawEmitterEffects](self, "endDrawEmitterEffects");
  -[CKInvisibleInkEmojiEffectView endDustEmitterLayerFingerEffects](self, "endDustEmitterLayerFingerEffects");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
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
  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAnimationForKey:", CFSTR("disableBlending"));

  -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1.0;
  objc_msgSend(v7, "setLifetime:", v8);

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKeyPath:", &unk_1E2870108, CFSTR("emitterBehaviors.fingerAttractor.stiffness"));

  -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("emitterBehaviors.fingerAttractor.enabled"));

  -[CKInvisibleInkEmojiEffectView enableBlending](self, "enableBlending");
  -[CKInvisibleInkEmojiEffectView moveEmittersWithTouches:](self, "moveEmittersWithTouches:", v5);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)moveEmittersForTouchesMoved:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0CD28B0];
  v5 = a3;
  objc_msgSend(v4, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CKInvisibleInkEmojiEffectView moveEmittersWithTouches:](self, "moveEmittersWithTouches:", v5);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
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
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;

  v3 = a3;
  v5 = -[CKInvisibleInkEffectView isPaused](self, "isPaused");
  v35.receiver = self;
  v35.super_class = (Class)CKInvisibleInkEmojiEffectView;
  -[CKInvisibleInkEffectView setPaused:](&v35, sel_setPaused_, v3);
  if (v5 != v3)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    -[CKInvisibleInkEmojiEffectView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    if (v3)
    {
      LODWORD(v7) = 0;
      objc_msgSend(v6, "setSpeed:", v7);

      -[CKInvisibleInkEmojiEffectView layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInvisibleInkEmojiEffectView layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "superlayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v13 = v12;
      objc_msgSend(v9, "timeOffset");
      objc_msgSend(v9, "setTimeOffset:", v13 + v14);

      -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = 0;
      objc_msgSend(v15, "setSpeed:", v16);

      -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "superlayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v21 = v20;
      objc_msgSend(v17, "timeOffset");
      v23 = v21 + v22;
    }
    else
    {
      LODWORD(v7) = 1.0;
      objc_msgSend(v6, "setSpeed:", v7);

      -[CKInvisibleInkEmojiEffectView layer](self, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInvisibleInkEmojiEffectView layer](self, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "superlayer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v28 = v27;
      objc_msgSend(v24, "timeOffset");
      objc_msgSend(v24, "setTimeOffset:", v29 - v28);

      -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = 1.0;
      objc_msgSend(v30, "setSpeed:", v31);

      -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInvisibleInkEmojiEffectView drawEmitterLayer](self, "drawEmitterLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "superlayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v33 = v32;
      objc_msgSend(v17, "timeOffset");
      v23 = v34 - v33;
    }
    objc_msgSend(v17, "setTimeOffset:", v23);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  double v8;
  objc_super v9;

  v3 = a3;
  v5 = -[CKInvisibleInkEffectView isSuspended](self, "isSuspended");
  v9.receiver = self;
  v9.super_class = (Class)CKInvisibleInkEmojiEffectView;
  -[CKInvisibleInkEffectView setSuspended:](&v9, sel_setSuspended_, v3);
  if (v5 != v3)
  {
    v6 = v3 ^ 1;
    -[CKInvisibleInkEmojiEffectView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v6);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[CKInvisibleInkEmojiEffectView dustEmitterLayer](self, "dustEmitterLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v8 = (float)v6;
    objc_msgSend(v7, "setBirthRate:", v8);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (CALayer)emojiContainerLayer
{
  return self->_emojiContainerLayer;
}

- (void)setEmojiContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_emojiContainerLayer, a3);
}

- (CALayer)emojiLayer
{
  return self->_emojiLayer;
}

- (void)setEmojiLayer:(id)a3
{
  objc_storeStrong((id *)&self->_emojiLayer, a3);
}

- (CAEmitterLayer)drawEmitterLayer
{
  return self->_drawEmitterLayer;
}

- (void)setDrawEmitterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_drawEmitterLayer, a3);
}

- (CALayer)dustContainerLayer
{
  return self->_dustContainerLayer;
}

- (void)setDustContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dustContainerLayer, a3);
}

- (CAEmitterLayer)dustEmitterLayer
{
  return self->_dustEmitterLayer;
}

- (void)setDustEmitterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dustEmitterLayer, a3);
}

- (CALayer)blurredEmojiLayer
{
  return self->_blurredEmojiLayer;
}

- (void)setBlurredEmojiLayer:(id)a3
{
  objc_storeStrong((id *)&self->_blurredEmojiLayer, a3);
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_maskLayer, a3);
}

- (BOOL)blendingEnabled
{
  return self->_blendingEnabled;
}

- (void)setBlendingEnabled:(BOOL)a3
{
  self->_blendingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_blurredEmojiLayer, 0);
  objc_storeStrong((id *)&self->_dustEmitterLayer, 0);
  objc_storeStrong((id *)&self->_dustContainerLayer, 0);
  objc_storeStrong((id *)&self->_drawEmitterLayer, 0);
  objc_storeStrong((id *)&self->_emojiLayer, 0);
  objc_storeStrong((id *)&self->_emojiContainerLayer, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
