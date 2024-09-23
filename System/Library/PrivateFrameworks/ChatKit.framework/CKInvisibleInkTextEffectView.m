@implementation CKInvisibleInkTextEffectView

- (CKInvisibleInkTextEffectView)initWithFrame:(CGRect)a3
{
  CKInvisibleInkTextEffectView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKInvisibleInkTextEffectView;
  v3 = -[CKInvisibleInkEffectView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[CKInvisibleInkTextEffectView setDustEmitterContainerLayer:](v3, "setDustEmitterContainerLayer:", v4);

    -[CKInvisibleInkTextEffectView dustEmitterContainerLayer](v3, "dustEmitterContainerLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksToBounds:", 1);

    -[CKInvisibleInkTextEffectView createDrawEmitter](v3, "createDrawEmitter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkTextEffectView setTextDrawEmitterLayer:](v3, "setTextDrawEmitterLayer:", v6);

    -[CKInvisibleInkTextEffectView createDrawEmitter](v3, "createDrawEmitter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkTextEffectView setDustDrawEmitterLayer:](v3, "setDustDrawEmitterLayer:", v7);

    -[CKInvisibleInkTextEffectView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkTextEffectView dustEmitterContainerLayer](v3, "dustEmitterContainerLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSublayer:", v9);

    -[CKInvisibleInkTextEffectView dustEmitterContainerLayer](v3, "dustEmitterContainerLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](v3, "dustDrawEmitterLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", v11);

  }
  return v3;
}

- (UIColor)currentDustColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkTextEffectView balloonView](self, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonTextColorForColorType:", objc_msgSend(v5, "color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v7;
}

- (id)createDrawEmitter
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2768], "emitterCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("blurSmall"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setContents:", objc_msgSend(v3, "CGImage"));

  LODWORD(v4) = 1114636288;
  objc_msgSend(v2, "setBirthRate:", v4);
  objc_msgSend(v2, "setDuration:", INFINITY);
  LODWORD(v5) = 4.0;
  objc_msgSend(v2, "setLifetime:", v5);
  LODWORD(v6) = 1.0;
  objc_msgSend(v2, "setLifetimeRange:", v6);
  objc_msgSend(v2, "setParticleType:", *MEMORY[0x1E0CD2AF8]);
  objc_msgSend(v2, "setOrientationLongitude:", 3.14159265);
  objc_msgSend(v2, "setOrientationLatitude:", 0.0);
  objc_msgSend(v2, "setEmissionRange:", 0.0);
  objc_msgSend(v2, "setScale:", 1.0);
  objc_msgSend(v2, "setVelocityRange:", 20.0);
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AD0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19[0] = objc_msgSend(v8, "CGColor");
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19[1] = objc_msgSend(v9, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v10, CFSTR("colors"));

  objc_msgSend(v7, "setValue:forKey:", &unk_1E286F298, CFSTR("locations"));
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AE0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setName:", CFSTR("scaleBehavior"));
  objc_msgSend(v11, "setValue:forKey:", CFSTR("scale"), CFSTR("keyPath"));
  objc_msgSend(v11, "setValue:forKey:", &unk_1E286F2B0, CFSTR("values"));
  objc_msgSend(v11, "setValue:forKey:", &unk_1E286F2C8, CFSTR("locations"));
  objc_msgSend(MEMORY[0x1E0CD2770], "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 0;
  objc_msgSend(v12, "setLifetime:", v13);
  objc_msgSend(v12, "setMasksToBounds:", 1);
  objc_msgSend(v12, "setEmitterMode:", *MEMORY[0x1E0CD2B28]);
  v18 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEmitterCells:", v14);

  v17[0] = v7;
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEmitterBehaviors:", v15);

  objc_msgSend(v12, "setRenderMode:", CFSTR("cheapAdditive"));
  objc_msgSend((id)objc_opt_class(), "updateInterval");
  objc_msgSend(v12, "setUpdateInterval:");
  objc_msgSend(v12, "setRasterizationScale:", 0.25);

  return v12;
}

- (id)makeDustEmitter
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2768], "emitterCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("textSpeckle"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setContents:", objc_msgSend(v4, "CGImage"));

  LODWORD(v5) = 1150681088;
  objc_msgSend(v3, "setBirthRate:", v5);
  objc_msgSend(v3, "setContentsScale:", 1.79999995);
  objc_msgSend(v3, "setEmissionRange:", 6.28318531);
  LODWORD(v6) = 3.0;
  objc_msgSend(v3, "setMass:", v6);
  LODWORD(v7) = 2.0;
  objc_msgSend(v3, "setMassRange:", v7);
  LODWORD(v8) = 1.0;
  objc_msgSend(v3, "setLifetime:", v8);
  objc_msgSend(v3, "setScale:", 0.5);
  objc_msgSend(v3, "setVelocityRange:", 20.0);
  objc_msgSend(v3, "setName:", CFSTR("dustCell"));
  objc_msgSend(v3, "setParticleType:", *MEMORY[0x1E0CD2AF8]);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0.0;
  objc_msgSend(v9, "colorWithAlphaComponent:", 0.0);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setColor:", objc_msgSend(v11, "CGColor"));

  LODWORD(v12) = 1.0;
  objc_msgSend(v3, "setAlphaRange:", v12);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AD8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setName:", CFSTR("fingerAttractor"));
  objc_msgSend(v13, "addObject:", v14);
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AE0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setName:", CFSTR("alphaBehavior"));
  objc_msgSend(v15, "setValue:forKey:", CFSTR("color.alpha"), CFSTR("keyPath"));
  objc_msgSend(v15, "setValue:forKey:", &unk_1E286F2E0, CFSTR("values"));
  objc_msgSend(v15, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("additive"));
  objc_msgSend(v13, "addObject:", v15);
  objc_msgSend(MEMORY[0x1E0CD2770], "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEmitterCells:", v17);

  objc_msgSend(v16, "setEmitterShape:", *MEMORY[0x1E0CD2B38]);
  objc_msgSend(v16, "setEmitterBehaviors:", v13);
  if (!-[CKInvisibleInkTextEffectView blendingEnabled](self, "blendingEnabled"))
  {
    objc_msgSend((id)objc_opt_class(), "updateInterval");
    v10 = v18;
  }
  objc_msgSend(v16, "setUpdateInterval:", v10);
  objc_msgSend(v16, "setSeed:", arc4random());
  -[CKInvisibleInkTextEffectView endDustEmitterLayerFingerEffects:](self, "endDustEmitterLayerFingerEffects:", v16);

  return v16;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double x;
  double y;
  double width;
  double height;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v53 = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)CKInvisibleInkTextEffectView;
  -[CKInvisibleInkEffectView layoutSubviews](&v51, sel_layoutSubviews);
  -[CKInvisibleInkTextEffectView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[CKInvisibleInkTextEffectView dustEmitterLayers](self, "dustEmitterLayers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v48 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "removeFromSuperlayer");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v6);
    }

    -[CKInvisibleInkTextEffectView bounds](self, "bounds");
    v10 = v9;
    -[CKInvisibleInkTextEffectView bounds](self, "bounds");
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[CKInvisibleInkTextEffectView dustEmitterContainerLayer](self, "dustEmitterContainerLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", 0.0, 0.0, v10, v12);

    -[CKInvisibleInkTextEffectView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v54.origin.x = 0.0;
    v54.origin.y = 0.0;
    v54.size.width = v10;
    v54.size.height = v12;
    v55 = CGRectInset(v54, -4.0, -4.0);
    x = v55.origin.x;
    y = v55.origin.y;
    width = v55.size.width;
    height = v55.size.height;
    -[CKInvisibleInkTextEffectView textView](self, "textView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertRect:toLayer:", v20, x, y, width, height);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

    -[CKInvisibleInkTextEffectView layer](self, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v56.origin.x = 0.0;
    v56.origin.y = 0.0;
    v56.size.width = v10;
    v56.size.height = v12;
    v57 = CGRectInset(v56, -4.0, -4.0);
    v31 = v57.origin.x;
    v32 = v57.origin.y;
    v33 = v57.size.width;
    v34 = v57.size.height;
    -[CKInvisibleInkTextEffectView textView](self, "textView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "convertRect:fromLayer:", v36, v31, v32, v33, v34);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](self, "dustDrawEmitterLayer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = objc_msgSend(v46, "isTextKit2Enabled");

    if ((_DWORD)v35)
      -[CKInvisibleInkTextEffectView _configureInvisibleInkEmitterUsingTextKit2](self, "_configureInvisibleInkEmitterUsingTextKit2");
    else
      -[CKInvisibleInkTextEffectView _configureInvisibleInkEmitterUsingTextKit1](self, "_configureInvisibleInkEmitterUsingTextKit1");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (id)_newEmitterForCharacterRects:(id)a3 lineBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t i;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  id v42;
  id v44;
  CGRect v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (objc_msgSend(v9, "count"))
  {
    -[CKInvisibleInkTextEffectView textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textContainerInset");
    v12 = x + v11;

    -[CKInvisibleInkTextEffectView textView](self, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textContainerInset");
    v15 = y + v14;

    -[CKInvisibleInkTextEffectView textView](self, "textView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkTextEffectView dustEmitterContainerLayer](self, "dustEmitterContainerLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertPoint:toLayer:", v18, v12, v15);
    v20 = v19;
    v22 = v21;

    -[CKInvisibleInkTextEffectView makeDustEmitter](self, "makeDustEmitter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setEmitterPosition:", 21.5, 23.0);
    objc_msgSend(v23, "setEmitterSize:", 1.0, 1.0);
    v52.origin.x = v20;
    v52.origin.y = v22;
    v52.size.width = width;
    v52.size.height = height;
    v53 = CGRectInset(v52, -22.0, -22.0);
    objc_msgSend(v23, "setFrame:", v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);
    objc_msgSend(v23, "setMasksToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v25 = v9;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v26)
    {
      v27 = v26;
      v44 = v9;
      v28 = *(_QWORD *)v47;
      v29 = 0.0;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v47 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "CGRectValue");
          v54.origin.x = v31 + -3.0;
          v54.origin.y = 0.0;
          v55 = CGRectInset(v54, 2.0, 5.0);
          v32 = v55.origin.x;
          v33 = v55.origin.y;
          v34 = v55.size.width;
          v35 = v55.size.height;
          v45 = v55;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v45, "{CGRect={CGPoint=dd}{CGSize=dd}}");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v36);

          v56.origin.x = v32;
          v56.origin.y = v33;
          v56.size.width = v34;
          v56.size.height = v35;
          v37 = CGRectGetWidth(v56);
          v57.origin.x = v32;
          v57.origin.y = v33;
          v57.size.width = v34;
          v57.size.height = v35;
          v29 = v29 + v37 * CGRectGetHeight(v57);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v27);
      v38 = v29 * 0.8;
      v9 = v44;
    }
    else
    {
      v38 = 0.0;
    }

    v39 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v23, "setEmitterRects:", v39);

    *(float *)&v40 = (float)(-[CKInvisibleInkEffectView isSuspended](self, "isSuspended") ^ 1);
    objc_msgSend(v23, "setBirthRate:", v40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setValue:forKeyPath:", v41, CFSTR("emitterCells.dustCell.birthRate"));

    -[CKInvisibleInkTextEffectView currentDustColor](self, "currentDustColor");
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v23, "setValue:forKeyPath:", objc_msgSend(v42, "CGColor"), CFSTR("emitterCells.dustCell.color"));

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)_configureInvisibleInkEmitterUsingTextKit2
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  double x;
  double y;
  double width;
  double height;
  uint64_t v39;
  uint64_t v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  id v49;
  void *v50;
  id v51;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  id v72;
  uint8_t buf[16];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v77 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Configuring invisble ink emitter using TK2.", buf, 2u);
    }

  }
  -[CKInvisibleInkTextEffectView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLayoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "documentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ensureLayoutForRange:", v5);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit2__block_invoke;
  v70[3] = &unk_1E274AF20;
  v71 = v4;
  v9 = v6;
  v72 = v9;
  v51 = v71;
  objc_msgSend(v71, "enumerateSubstringsFromLocation:options:usingBlock:", v8, 2, v70);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v67;
    v14 = -1;
    v15 = -1.0;
    do
    {
      v16 = 0;
      v17 = v15;
      do
      {
        if (*(_QWORD *)v67 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v16), "CGRectValue");
        v19 = v18;
        v15 = v20;
        v22 = v21;
        v24 = v23;
        v14 += !CKFloatApproximatelyEqualToFloatWithTolerance(v20, v17, 0.00000999999975);
        if (objc_msgSend(v10, "count") <= v14)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v25);
        }
        else
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v65[0] = v19;
        *(double *)&v65[1] = v15;
        v65[2] = v22;
        v65[3] = v24;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v65, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v26);

        ++v16;
        v17 = v15;
      }
      while (v12 != v16);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v28 = v10;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v62;
    v55 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v56 = *MEMORY[0x1E0C9D648];
    v53 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v54 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v62 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v31);
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v33 = v32;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
        y = v55;
        x = v56;
        height = v53;
        width = v54;
        if (v34)
        {
          v39 = *(_QWORD *)v58;
          y = v55;
          x = v56;
          height = v53;
          width = v54;
          do
          {
            v40 = 0;
            do
            {
              if (*(_QWORD *)v58 != v39)
                objc_enumerationMutation(v33);
              objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v40), "CGRectValue");
              v42 = v41;
              v44 = v43;
              v46 = v45;
              v48 = v47;
              v78.origin.x = x;
              v78.origin.y = y;
              v78.size.width = width;
              v78.size.height = height;
              v81.origin.y = v55;
              v81.origin.x = v56;
              v81.size.height = v53;
              v81.size.width = v54;
              if (CGRectEqualToRect(v78, v81))
              {
                x = v42;
                y = v44;
                width = v46;
                height = v48;
              }
              else
              {
                v79.origin.x = x;
                v79.origin.y = y;
                v79.size.width = width;
                v79.size.height = height;
                v82.origin.x = v42;
                v82.origin.y = v44;
                v82.size.width = v46;
                v82.size.height = v48;
                v80 = CGRectUnion(v79, v82);
                x = v80.origin.x;
                y = v80.origin.y;
                width = v80.size.width;
                height = v80.size.height;
              }
              ++v40;
            }
            while (v34 != v40);
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
          }
          while (v34);
        }

        v49 = -[CKInvisibleInkTextEffectView _newEmitterForCharacterRects:lineBounds:](self, "_newEmitterForCharacterRects:lineBounds:", v33, x, y, width, height);
        if (v49)
        {
          objc_msgSend(v27, "addObject:", v49);
          -[CKInvisibleInkTextEffectView dustEmitterContainerLayer](self, "dustEmitterContainerLayer");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "insertSublayer:atIndex:", v49, 0);

        }
        ++v31;
      }
      while (v31 != v29);
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    }
    while (v29);
  }

  -[CKInvisibleInkTextEffectView setDustEmitterLayers:](self, "setDustEmitterLayers:", v27);
}

void __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit2__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit2__block_invoke_2;
  v5[3] = &unk_1E274AEF8;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateTextSegmentsInRange:type:options:usingBlock:", a3, 0, 0, v5);

}

uint64_t __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit2__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  void *v6;
  _QWORD v8[4];

  v5 = *(void **)(a1 + 32);
  *(double *)v8 = a2;
  *(double *)&v8[1] = a3;
  *(double *)&v8[2] = a4;
  *(double *)&v8[3] = a5;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v8, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  return 1;
}

- (void)_configureInvisibleInkEmitterUsingTextKit1
{
  const __CFLocale *v3;
  const __CFAllocator *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFStringTokenizer *v9;
  void *v10;
  __int128 v11;
  void (**v12)(_QWORD);
  CFRange CurrentTokenRange;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFLocale *cf;
  id v24;
  _QWORD v25[4];
  void (**v26)(_QWORD);
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD aBlock[5];
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD v37[4];
  int64x2_t v38;
  _QWORD v39[4];
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  _QWORD v43[5];
  id v44;
  CFRange v45;

  v3 = CFLocaleCopyCurrent();
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  -[CKInvisibleInkTextEffectView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkTextEffectView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45.length = objc_msgSend(v8, "length");
  v45.location = 0;
  cf = v3;
  v9 = CFStringTokenizerCreate(v4, v6, v45, 4uLL, v3);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__2;
  v43[4] = __Block_byref_object_dispose__2;
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x4010000000;
  v39[3] = &unk_18E8EEE6F;
  v11 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v40 = *MEMORY[0x1E0C9D648];
  v41 = v11;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3010000000;
  v37[3] = &unk_18E8EEE6F;
  v38 = vdupq_n_s64(0xFFF0000000000000);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit1__block_invoke;
  aBlock[3] = &unk_1E274AF48;
  v33 = v43;
  v34 = v37;
  aBlock[4] = self;
  v35 = v39;
  v36 = v42;
  v24 = v10;
  v32 = v24;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  while (CFStringTokenizerAdvanceToNextToken(v9))
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v9);
    -[CKInvisibleInkTextEffectView textView](self, "textView", cf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "glyphRangeForCharacterRange:actualCharacterRange:", CurrentTokenRange.location, CurrentTokenRange.length, 0);
    v18 = v17;

    -[CKInvisibleInkTextEffectView textView](self, "textView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layoutManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInvisibleInkTextEffectView textView](self, "textView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "textContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit1__block_invoke_2;
    v25[3] = &unk_1E274AF70;
    v27 = v37;
    v26 = v12;
    v28 = v43;
    v29 = v42;
    v30 = v39;
    objc_msgSend(v20, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v16, v18, 0x7FFFFFFFFFFFFFFFLL, 0, v22, v25);

  }
  CFRelease(v9);
  CFRelease(cf);
  v12[2](v12);
  -[CKInvisibleInkTextEffectView setDustEmitterLayers:](self, "setDustEmitterLayers:", v24);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v43, 8);

}

void __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit1__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  CGRect v26;
  CGRect v27;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = *(double *)(v2 + 32);
    v4 = *(double *)(v2 + 40);
    objc_msgSend(*(id *)(a1 + 32), "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textContainerInset");
    v7 = v3 + v6;

    objc_msgSend(*(id *)(a1 + 32), "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textContainerInset");
    v10 = v4 + v9;

    objc_msgSend(*(id *)(a1 + 32), "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dustEmitterContainerLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertPoint:toLayer:", v13, v7, v10);
    v15 = v14;
    v17 = v16;

    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(double *)(v18 + 48);
    v20 = *(double *)(v18 + 56);
    objc_msgSend(*(id *)(a1 + 32), "makeDustEmitter");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setEmitterPosition:", 21.5, 23.0);
    objc_msgSend(v25, "setEmitterSize:", 1.0, 1.0);
    v26.origin.x = v15;
    v26.origin.y = v17;
    v26.size.width = v19;
    v26.size.height = v20;
    v27 = CGRectInset(v26, -22.0, -22.0);
    objc_msgSend(v25, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
    objc_msgSend(v25, "setMasksToBounds:", 1);
    objc_msgSend(v25, "setEmitterRects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    *(float *)&v21 = (float)(objc_msgSend(*(id *)(a1 + 32), "isSuspended") ^ 1);
    objc_msgSend(v25, "setBirthRate:", v21);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) * 0.8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValue:forKeyPath:", v22, CFSTR("emitterCells.dustCell.birthRate"));

    objc_msgSend(*(id *)(a1 + 32), "currentDustColor");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v25, "setValue:forKeyPath:", objc_msgSend(v23, "CGColor"), CFSTR("emitterCells.dustCell.color"));

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v25);
    objc_msgSend(*(id *)(a1 + 32), "dustEmitterContainerLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "insertSublayer:atIndex:", v25, 0);

  }
}

void __74__CKInvisibleInkTextEffectView__configureInvisibleInkEmitterUsingTextKit1__block_invoke_2(_QWORD *a1, double a2, double a3, CGFloat a4, CGFloat a5)
{
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  double height;
  CGFloat x;
  CGFloat y;
  double width;
  void *v21;
  void *v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(double *)(v10 + 40);
  if (a3 > v11)
  {
    (*(void (**)(void))(a1[4] + 16))();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    v15 = *(_QWORD *)(a1[8] + 8);
    v16 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v15 + 32) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(v15 + 48) = v16;
    *(double *)(*(_QWORD *)(a1[5] + 8) + 32) = a2;
    *(double *)(*(_QWORD *)(a1[5] + 8) + 40) = a3;
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(double *)(v10 + 40);
  }
  v23.origin.x = a2 - *(double *)(v10 + 32);
  v23.origin.y = a3 - v11;
  height = 2.0;
  v23.size.width = a4;
  v23.size.height = a5;
  v24 = CGRectInset(v23, 2.0, 5.0);
  x = v24.origin.x;
  y = v24.origin.y;
  if (v24.size.width >= 2.0)
    width = v24.size.width;
  else
    width = 2.0;
  if (v24.size.height >= 2.0)
    height = v24.size.height;
  v21 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v22);

  *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = *(double *)(*(_QWORD *)(a1[7] + 8) + 24) + height * width;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  *(CGRect *)(*(_QWORD *)(a1[8] + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(a1[8] + 8) + 32), v25);
}

- (void)didMoveToWindow
{
  void *v3;

  -[CKInvisibleInkTextEffectView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CKInvisibleInkTextEffectView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBlendingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (self->_blendingEnabled != a3)
  {
    v3 = a3;
    self->_blendingEnabled = a3;
    -[CKInvisibleInkTextEffectView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      objc_msgSend(v6, "setHidden:", 0);

      v8 = *MEMORY[0x1E0CD2E50];
      -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCompositingFilter:", v8);

      -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShouldRasterize:", 1);

      v11 = *MEMORY[0x1E0CD2C50];
      -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](self, "dustDrawEmitterLayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCompositingFilter:", v11);

      -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](self, "dustDrawEmitterLayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShouldRasterize:", 1);

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      -[CKInvisibleInkTextEffectView dustEmitterLayers](self, "dustEmitterLayers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v40 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "setUpdateInterval:", 0.0);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v16);
      }

      -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](self, "dustDrawEmitterLayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setUpdateInterval:", 0.0);

      -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = 0.0;
    }
    else
    {
      objc_msgSend(v6, "setHidden:", 1);

      -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setCompositingFilter:", 0);

      -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setShouldRasterize:", 0);

      -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](self, "dustDrawEmitterLayer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setCompositingFilter:", 0);

      -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](self, "dustDrawEmitterLayer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setShouldRasterize:", 0);

      objc_msgSend((id)objc_opt_class(), "updateInterval");
      v28 = v27;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      -[CKInvisibleInkTextEffectView dustEmitterLayers](self, "dustEmitterLayers", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v36 != v32)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "setUpdateInterval:", v28);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        }
        while (v31);
      }

      -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](self, "dustDrawEmitterLayer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setUpdateInterval:", v28);

      -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = v28;
    }
    objc_msgSend(v20, "setUpdateInterval:", v22);

  }
}

- (void)endDrawEmitterEffects
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setLifetime:", v4);

  -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](self, "dustDrawEmitterLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setLifetime:", v6);

  if (!-[CKInvisibleInkEffectView isSuspended](self, "isSuspended"))
  {
    objc_msgSend(MEMORY[0x1E0CD26F8], "animation");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDuration:", 5.0);
    objc_msgSend(v8, "setDelegate:", self);
    -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("disableBlending"));

  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
    -[CKInvisibleInkTextEffectView setBlendingEnabled:](self, "setBlendingEnabled:", 0);
}

- (void)endDustEmitterLayerFingerEffects:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2870120, CFSTR("emitterBehaviors.fingerAttractor.stiffness"));
  objc_msgSend(v3, "setValue:forKeyPath:", MEMORY[0x1E0C9AAA0], CFSTR("emitterBehaviors.fingerAttractor.enabled"));

}

- (void)endTouches
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CKInvisibleInkTextEffectView endDrawEmitterEffects](self, "endDrawEmitterEffects");
  -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("scale"));

  -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](self, "dustDrawEmitterLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("scale"));

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CKInvisibleInkTextEffectView dustEmitterLayers](self, "dustEmitterLayers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CKInvisibleInkTextEffectView endDustEmitterLayerFingerEffects:](self, "endDustEmitterLayerFingerEffects:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
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
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  v29 = v4;
  objc_msgSend(v4, "force");
  v10 = fmin(fmax(v9 / 3.8, 0.0), 1.0);
  -[CKInvisibleInkTextEffectView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "forceTouchCapability");

  if (v12 == 2)
    v13 = v10;
  else
    v13 = 0.5;
  -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEmitterPosition:", v6, v8);

  -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](self, "dustDrawEmitterLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEmitterPosition:", v6, v8);

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CKInvisibleInkTextEffectView dustEmitterLayers](self, "dustEmitterLayers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = v13 * 130.0 + 190.0;
    v19 = v13 * -65.0 + -95.0;
    v20 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setValue:forKeyPath:", v23, CFSTR("emitterBehaviors.fingerAttractor.radius"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setValue:forKeyPath:", v24, CFSTR("emitterBehaviors.fingerAttractor.falloff"));

        v25 = (void *)MEMORY[0x1E0CB3B18];
        -[CKInvisibleInkTextEffectView layer](self, "layer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "convertPoint:toLayer:", v22, v6, v8);
        objc_msgSend(v25, "valueWithCGPoint:");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setValue:forKeyPath:", v27, CFSTR("emitterBehaviors.fingerAttractor.position"));

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v17);
  }

  -[CKInvisibleInkEffectView coverageTracker](self, "coverageTracker");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "recordTouchAtPoint:", v6, v8);

}

- (void)moveEmittersForTouchesBegan:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1.0;
  objc_msgSend(v4, "setLifetime:", v5);

  -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](self, "dustDrawEmitterLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1.0;
  objc_msgSend(v6, "setLifetime:", v7);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CKInvisibleInkTextEffectView dustEmitterLayers](self, "dustEmitterLayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    v12 = MEMORY[0x1E0C9AAB0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "setValue:forKeyPath:", &unk_1E2870168, CFSTR("emitterBehaviors.fingerAttractor.stiffness"));
        objc_msgSend(v14, "setValue:forKeyPath:", v12, CFSTR("emitterBehaviors.fingerAttractor.enabled"));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAnimationForKey:", CFSTR("disableBlending"));

  -[CKInvisibleInkTextEffectView setBlendingEnabled:](self, "setBlendingEnabled:", 1);
  objc_msgSend(MEMORY[0x1E0CD2710], "animation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFromValue:", &unk_1E2870138);
  objc_msgSend(v16, "setToValue:", &unk_1E2870180);
  objc_msgSend(v16, "setDuration:", 4.0);
  objc_msgSend(v16, "setRemovedOnCompletion:", 0);
  objc_msgSend(v16, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v16, "setKeyPath:", CFSTR("scale"));
  -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keyPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnimation:forKey:", v16, v18);

  -[CKInvisibleInkTextEffectView dustDrawEmitterLayer](self, "dustDrawEmitterLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keyPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v16, v20);

  -[CKInvisibleInkTextEffectView moveEmittersWithTouches:](self, "moveEmittersWithTouches:", v21);
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
  -[CKInvisibleInkTextEffectView moveEmittersWithTouches:](self, "moveEmittersWithTouches:", v5);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)updateDustCellColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkTextEffectView balloonView](self, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonTextColorForColorType:", objc_msgSend(v5, "color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CKInvisibleInkTextEffectView dustEmitterLayers](self, "dustEmitterLayers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setValue:forKeyPath:", objc_msgSend(objc_retainAutorelease(v7), "CGColor"), CFSTR("emitterCells.dustCell.color"));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)attachToBalloonView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CKInvisibleInkTextEffectView setBalloonView:](self, "setBalloonView:", v4);
  objc_msgSend(v4, "textView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CKInvisibleInkTextEffectView setTextView:](self, "setTextView:", v9);
  objc_msgSend(v9, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSublayer:", v6);

  v7 = !self->_blendingEnabled;
  objc_msgSend(v9, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7);

  -[CKInvisibleInkTextEffectView updateDustCellColor](self, "updateDustCellColor");
}

- (void)detachFromBalloonView
{
  void *v3;
  void *v4;
  void *v5;

  -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  -[CKInvisibleInkTextEffectView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  -[CKInvisibleInkTextEffectView setTextView:](self, "setTextView:", 0);
  -[CKInvisibleInkTextEffectView setBalloonView:](self, "setBalloonView:", 0);
}

- (void)reset
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKInvisibleInkTextEffectView;
  -[CKInvisibleInkEffectView reset](&v5, sel_reset);
  -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("disableBlending"));

  -[CKInvisibleInkTextEffectView setBlendingEnabled:](self, "setBlendingEnabled:", 0);
  -[CKInvisibleInkTextEffectView balloonView](self, "balloonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[CKInvisibleInkTextEffectView updateDustCellColor](self, "updateDustCellColor");
}

- (void)cullSubviewsWithVisibleBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v67 = *MEMORY[0x1E0C80C00];
  -[CKInvisibleInkTextEffectView dustEmitterLayers](self, "dustEmitterLayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  -[CKInvisibleInkTextEffectView dustEmitterLayers](self, "dustEmitterLayers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v61;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v61 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v16);
        -[CKInvisibleInkTextEffectView dustEmitterContainerLayer](self, "dustEmitterContainerLayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "frame");
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;
        -[CKInvisibleInkTextEffectView layer](self, "layer");
        v27 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "convertRect:toLayer:", v27, v20, v22, v24, v26);
        v29 = v28;
        v31 = v30;
        v33 = v32;
        v35 = v34;

        v68.origin.x = x;
        v68.origin.y = y;
        v68.size.width = width;
        v68.size.height = height;
        v70.origin.x = v29;
        v70.origin.y = v31;
        v70.size.width = v33;
        v70.size.height = v35;
        v69 = CGRectIntersection(v68, v70);
        LOBYTE(v27) = CGRectIsEmpty(v69);
        objc_msgSend(v17, "superlayer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if ((v27 & 1) != 0)
        {

          v38 = v11;
          if (!v37)
            goto LABEL_9;
LABEL_8:
          objc_msgSend(v38, "addObject:", v17);
          goto LABEL_9;
        }

        v38 = v10;
        if (!v37)
          goto LABEL_8;
LABEL_9:
        ++v16;
      }
      while (v14 != v16);
      v39 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      v14 = v39;
    }
    while (v39);
  }

  if (objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v40 = v11;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v57;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v57 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v44++), "removeFromSuperlayer");
        }
        while (v42 != v44);
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v42);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v45 = v10;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v53;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v53 != v48)
            objc_enumerationMutation(v45);
          v50 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v49);
          -[CKInvisibleInkTextEffectView dustEmitterContainerLayer](self, "dustEmitterContainerLayer", (_QWORD)v52);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "insertSublayer:atIndex:", v50, 0);

          ++v49;
        }
        while (v47 != v49);
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      }
      while (v47);
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
  v35.super_class = (Class)CKInvisibleInkTextEffectView;
  -[CKInvisibleInkEffectView setPaused:](&v35, sel_setPaused_, v3);
  if (v5 != v3)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    -[CKInvisibleInkTextEffectView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    if (v3)
    {
      LODWORD(v7) = 0;
      objc_msgSend(v6, "setSpeed:", v7);

      -[CKInvisibleInkTextEffectView layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInvisibleInkTextEffectView layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "superlayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v13 = v12;
      objc_msgSend(v9, "timeOffset");
      objc_msgSend(v9, "setTimeOffset:", v13 + v14);

      -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = 0;
      objc_msgSend(v15, "setSpeed:", v16);

      -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
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

      -[CKInvisibleInkTextEffectView layer](self, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInvisibleInkTextEffectView layer](self, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "superlayer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v28 = v27;
      objc_msgSend(v24, "timeOffset");
      objc_msgSend(v24, "setTimeOffset:", v29 - v28);

      -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = 1.0;
      objc_msgSend(v30, "setSpeed:", v31);

      -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
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
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  void *v20;
  double v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  v5 = -[CKInvisibleInkEffectView isSuspended](self, "isSuspended");
  v36.receiver = self;
  v36.super_class = (Class)CKInvisibleInkTextEffectView;
  -[CKInvisibleInkEffectView setSuspended:](&v36, sel_setSuspended_, v3);
  if (v5 != v3)
  {
    -[CKInvisibleInkTextEffectView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3 ^ 1);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("birthRate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFromValue:", &unk_1E2870120);
      objc_msgSend(v6, "setToValue:", &unk_1E2870138);
      objc_msgSend(v6, "setDuration:", 1.0);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      -[CKInvisibleInkTextEffectView dustEmitterLayers](self, "dustEmitterLayers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v33 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "addAnimation:forKey:", v6, CFSTR("birthRate"));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v9);
      }

      -[CKInvisibleInkTextEffectView endDrawEmitterEffects](self, "endDrawEmitterEffects");
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[CKInvisibleInkTextEffectView dustEmitterLayers](self, "dustEmitterLayers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v12);
          *(float *)&v14 = (float)(v3 ^ 1);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "setBirthRate:", v14);
        }
        v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("backgroundColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v18, "setFromValue:", objc_msgSend(v19, "CGColor"));

      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0.5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v18, "setFromValue:", objc_msgSend(v22, "CGColor"));

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 3.0;
    }
    v23 = objc_retainAutorelease(v20);
    objc_msgSend(v18, "setToValue:", objc_msgSend(v23, "CGColor"));

    objc_msgSend(v18, "setDuration:", v21);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTimingFunction:", v24);

    -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAnimation:forKey:", v18, CFSTR("backgroundColor"));

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = objc_msgSend(v25, "CGColor");
    }
    else
    {
      v26 = 0;
    }
    -[CKInvisibleInkTextEffectView textDrawEmitterLayer](self, "textDrawEmitterLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", v26);

    if (v3)
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
}

- (CKTextBalloonView)balloonView
{
  return (CKTextBalloonView *)objc_loadWeakRetained((id *)&self->_balloonView);
}

- (void)setBalloonView:(id)a3
{
  objc_storeWeak((id *)&self->_balloonView, a3);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (CAEmitterLayer)textDrawEmitterLayer
{
  return self->_textDrawEmitterLayer;
}

- (void)setTextDrawEmitterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_textDrawEmitterLayer, a3);
}

- (CALayer)dustEmitterContainerLayer
{
  return self->_dustEmitterContainerLayer;
}

- (void)setDustEmitterContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dustEmitterContainerLayer, a3);
}

- (NSArray)dustEmitterLayers
{
  return self->_dustEmitterLayers;
}

- (void)setDustEmitterLayers:(id)a3
{
  objc_storeStrong((id *)&self->_dustEmitterLayers, a3);
}

- (CAEmitterLayer)dustDrawEmitterLayer
{
  return self->_dustDrawEmitterLayer;
}

- (void)setDustDrawEmitterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dustDrawEmitterLayer, a3);
}

- (BOOL)blendingEnabled
{
  return self->_blendingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dustDrawEmitterLayer, 0);
  objc_storeStrong((id *)&self->_dustEmitterLayers, 0);
  objc_storeStrong((id *)&self->_dustEmitterContainerLayer, 0);
  objc_storeStrong((id *)&self->_textDrawEmitterLayer, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_destroyWeak((id *)&self->_balloonView);
}

@end
