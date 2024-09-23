@implementation ARUIRingsImageFactory

+ (id)renderRingGroup:(id)a3 withRenderer:(id)a4
{
  id v5;
  ARUIRenderer *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  double v11;
  float v12;
  double v13;
  float v14;
  ARUIRenderContext *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = (ARUIRenderer *)a4;
  if (!v6)
    v6 = objc_alloc_init(ARUIRenderer);
  v7 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v7, "groupDiameter");
  v9 = v8;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;

  v13 = v9 + v12 * -0.5;
  *(float *)&v13 = v13;
  objc_msgSend(v7, "setGroupDiameter:", v13);
  objc_msgSend(v7, "setTranslation:", 0.0);
  objc_msgSend(v5, "groupDiameter");
  v15 = -[ARUIRenderContext initWithSize:]([ARUIRenderContext alloc], "initWithSize:", v14, v14);
  objc_msgSend(v7, "rings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "spriteSheet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRenderer snapshotRings:spriteSheet:withContext:](v6, "snapshotRings:spriteSheet:withContext:", v16, v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)renderRingGroupController:(id)a3 withRenderer:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "ringGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARUIRingsImageFactory renderRingGroup:withRenderer:](ARUIRingsImageFactory, "renderRingGroup:withRenderer:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)renderRingGroupController:(id)a3 withBackgroundColor:(id)a4 andRenderer:(id)a5
{
  id v7;
  id v8;
  void *v9;
  float v10;
  float v11;
  CGFloat v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  double v18;
  CGFloat v19;
  void *v20;
  CGSize v22;

  v7 = a4;
  v8 = a3;
  +[ARUIRingsImageFactory renderRingGroupController:withRenderer:](ARUIRingsImageFactory, "renderRingGroupController:withRenderer:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ringDiameter");
  v11 = v10;

  v12 = v11;
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithOvalInRect:", 0.0, 0.0, v12, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBorderWidth:", 1.0);
  v15 = objc_retainAutorelease(v7);
  v16 = objc_msgSend(v15, "CGColor");

  objc_msgSend(v14, "setFillColor:", v16);
  v17 = objc_retainAutorelease(v13);
  objc_msgSend(v14, "setPath:", objc_msgSend(v17, "CGPath"));
  objc_msgSend(v9, "scale");
  v19 = v18;
  v22.width = v12;
  v22.height = v12;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v19);
  objc_msgSend(v14, "renderInContext:", UIGraphicsGetCurrentContext());
  objc_msgSend(v9, "drawAtPoint:", 0.0, 0.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v20;
}

+ (id)renderSingleRingUsingRingsView:(id)a3 forPercentage:(double)a4 withDiameter:(double)a5 thickness:(double)a6 topColor:(id)a7 bottomColor:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a3;
  objc_msgSend(v16, "ringGroupController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = a5;
  objc_msgSend(v17, "setRingDiameter:", v18);
  LODWORD(v19) = 0;
  objc_msgSend(v17, "setRingIconSize:", v19);
  objc_msgSend(v17, "setPercentage:ofRingAtIndex:animated:", 0, 0, a4);
  objc_msgSend(v17, "setTopColor:bottomColor:ofRingAtIndex:", v15, v14, 0);

  objc_msgSend(a1, "_renderRingsUsingRingsView:withDiameter:thickness:interspacing:", v16, a5, a6, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)renderRingsUsingRingsView:(id)a3 forMovePercentage:(double)a4 exercisePercentage:(double)a5 standPercentage:(double)a6 withDiameter:(double)a7 thickness:(double)a8 interspacing:(double)a9
{
  id v16;
  void *v17;
  double v18;
  double v19;
  void *v20;

  v16 = a3;
  objc_msgSend(v16, "ringGroupController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = a7;
  objc_msgSend(v17, "setRingDiameter:", v18);
  LODWORD(v19) = 0;
  objc_msgSend(v17, "setRingIconSize:", v19);
  objc_msgSend(v16, "setActiveEnergyPercentage:animated:", 0, a4);
  objc_msgSend(v16, "setBriskPercentage:animated:", 0, a5);
  objc_msgSend(v16, "setMovingHoursPercentage:animated:", 0, a6);
  objc_msgSend(a1, "_renderRingsUsingRingsView:withDiameter:thickness:interspacing:", v16, a7, a8, a9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_renderRingsUsingRingsView:(id)a3 withDiameter:(double)a4 thickness:(double)a5 interspacing:(double)a6
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  void *v24;
  CGSize v26;

  v9 = a3;
  objc_msgSend(v9, "ringGroupController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;

  objc_msgSend(v9, "setFrame:", 0.0, 0.0, a4, a4);
  v14 = a4 + v13 * -0.5;
  *(float *)&v14 = v14;
  objc_msgSend(v10, "setRingDiameter:", v14);
  v15 = a5 + -0.5;
  *(float *)&v15 = a5 + -0.5;
  objc_msgSend(v10, "setRingThickness:", v15);
  *(float *)&v16 = a6;
  objc_msgSend(v10, "setRingInterspacing:", v16);
  objc_msgSend(v10, "setCenter:", 0.0, 0.0);
  objc_msgSend(v9, "snapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "size");
  v19 = v18;
  objc_msgSend(v17, "size");
  v21 = v20 * 0.5 - a4 * 0.5;
  objc_msgSend(v17, "scale");
  v23 = v22;
  v26.width = a4;
  v26.height = a4;
  UIGraphicsBeginImageContextWithOptions(v26, 0, v23);
  objc_msgSend(v17, "drawAtPoint:", -(v19 * 0.5 - a4 * 0.5), -v21);
  UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v24;
}

+ (id)renderRingsWithBackgroundColor:(id)a3 usingRingsView:(id)a4 forMovePercentage:(double)a5 exercisePercentage:(double)a6 standPercentage:(double)a7 withDiameter:(double)a8 thickness:(double)a9 interspacing:(double)a10
{
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  double v24;
  CGFloat v25;
  void *v26;
  CGSize v28;

  v17 = a3;
  +[ARUIRingsImageFactory renderRingsUsingRingsView:forMovePercentage:exercisePercentage:standPercentage:withDiameter:thickness:interspacing:](ARUIRingsImageFactory, "renderRingsUsingRingsView:forMovePercentage:exercisePercentage:standPercentage:withDiameter:thickness:interspacing:", a4, a5, a6, a7, a8, a9, a10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithOvalInRect:", 0.0, 0.0, a8, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBorderWidth:", 1.0);
  v21 = objc_retainAutorelease(v17);
  v22 = objc_msgSend(v21, "CGColor");

  objc_msgSend(v20, "setFillColor:", v22);
  v23 = objc_retainAutorelease(v19);
  objc_msgSend(v20, "setPath:", objc_msgSend(v23, "CGPath"));
  objc_msgSend(v18, "scale");
  v25 = v24;
  v28.width = a8;
  v28.height = a8;
  UIGraphicsBeginImageContextWithOptions(v28, 0, v25);
  objc_msgSend(v20, "renderInContext:", UIGraphicsGetCurrentContext());
  objc_msgSend(v18, "drawAtPoint:", 0.0, 0.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v26;
}

+ (void)renderRingsUsingRingsView:(id)a3 forMovePercentage:(double)a4 exercisePercentage:(double)a5 standPercentage:(double)a6 withDiameter:(double)a7 thickness:(double)a8 interspacing:(double)a9 inRect:(CGRect)a10
{
  id v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  v16 = a3;
  objc_msgSend(v16, "setActiveEnergyPercentage:animated:", 0, a4);
  objc_msgSend(v16, "setBriskPercentage:animated:", 0, a5);
  objc_msgSend(v16, "setMovingHoursPercentage:animated:", 0, a6);
  objc_msgSend(v16, "ringGroupController");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, a7, a7);
  v17 = a7 + -1.0;
  *(float *)&v17 = a7 + -1.0;
  objc_msgSend(v21, "setRingDiameter:", v17);
  v18 = a8 + -0.5;
  *(float *)&v18 = a8 + -0.5;
  objc_msgSend(v21, "setRingThickness:", v18);
  *(float *)&v19 = a9;
  objc_msgSend(v21, "setRingInterspacing:", v19);
  objc_msgSend(v21, "setCenter:", 0.0, 0.0);
  objc_msgSend(v16, "snapshot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "drawInRect:", a10.origin.x, a10.origin.y, a10.size.width, a10.size.height);
}

@end
