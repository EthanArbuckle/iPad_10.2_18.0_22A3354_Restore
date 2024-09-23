@implementation AXAuditScreenshotManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__AXAuditScreenshotManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, block);
  return (id)sharedManager_instance_1;
}

void __41__AXAuditScreenshotManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance_1;
  sharedManager_instance_1 = v0;

}

- (AXAuditScreenshotManager)init
{
  AXAuditScreenshotManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXAuditScreenshotManager;
  v2 = -[AXAuditScreenshotManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[AXAuditScreenshotManager set_image:](v2, "set_image:", v3);

    v4 = (void *)objc_opt_new();
    -[AXAuditScreenshotManager set_rotation:](v2, "set_rotation:", v4);

    v5 = (void *)objc_opt_new();
    -[AXAuditScreenshotManager set_displayBounds:](v2, "set_displayBounds:", v5);

    v6 = (void *)objc_opt_new();
    -[AXAuditScreenshotManager set_borderFrame:](v2, "set_borderFrame:", v6);

    v7 = (void *)objc_opt_new();
    -[AXAuditScreenshotManager set_scaleFactor:](v2, "set_scaleFactor:", v7);

    v8 = (void *)objc_opt_new();
    -[AXAuditScreenshotManager set_shouldFlipOutline:](v2, "set_shouldFlipOutline:", v8);

  }
  return v2;
}

- (void)clear
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_opt_new();
  -[AXAuditScreenshotManager set_image:](self, "set_image:", v3);

  v4 = (void *)objc_opt_new();
  -[AXAuditScreenshotManager set_rotation:](self, "set_rotation:", v4);

  v5 = (void *)objc_opt_new();
  -[AXAuditScreenshotManager set_displayBounds:](self, "set_displayBounds:", v5);

  v6 = (void *)objc_opt_new();
  -[AXAuditScreenshotManager set_borderFrame:](self, "set_borderFrame:", v6);

  v7 = (void *)objc_opt_new();
  -[AXAuditScreenshotManager set_scaleFactor:](self, "set_scaleFactor:", v7);

  v8 = (id)objc_opt_new();
  -[AXAuditScreenshotManager set_shouldFlipOutline:](self, "set_shouldFlipOutline:", v8);

}

- (void)addScreenshot:(id)a3 forTimestamp:(id)a4
{
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v8 = a4;
      v6 = a3;
      -[AXAuditScreenshotManager _image](self, "_image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

      -[AXAuditScreenshotManager setLastTimestamp:](self, "setLastTimestamp:", v8);
    }
  }
}

- (void)setScreenshotRotation:(double)a3 forTimestamp:(id)a4
{
  void *v5;
  float v6;
  id v7;
  double v8;
  void *v9;
  id v10;

  if (a4)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = a3;
    v7 = a4;
    *(float *)&v8 = v6;
    objc_msgSend(v5, "numberWithFloat:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[AXAuditScreenshotManager _rotation](self, "_rotation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v7);

  }
}

- (void)setScreenshotDisplayBounds:(CGRect)a3 forTimestamp:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  id v10;
  void *v11;
  id v12;

  if (a4)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v9 = (void *)MEMORY[0x24BDD1968];
    v10 = a4;
    objc_msgSend(v9, "valueWithRect:", x, y, width, height);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[AXAuditScreenshotManager _displayBounds](self, "_displayBounds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v10);

  }
}

- (void)setScreenshotBorderFrame:(CGRect)a3 forTimestamp:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  id v10;
  void *v11;
  id v12;

  if (a4)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v9 = (void *)MEMORY[0x24BDD1968];
    v10 = a4;
    objc_msgSend(v9, "valueWithRect:", x, y, width, height);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[AXAuditScreenshotManager _borderFrame](self, "_borderFrame");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v10);

  }
}

- (void)setScreenshotScaleFactor:(double)a3 forTimestamp:(id)a4
{
  void *v5;
  float v6;
  id v7;
  double v8;
  void *v9;
  id v10;

  if (a4)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = a3;
    v7 = a4;
    *(float *)&v8 = v6;
    objc_msgSend(v5, "numberWithFloat:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[AXAuditScreenshotManager _scaleFactor](self, "_scaleFactor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v7);

  }
}

- (void)setScreenshotShouldFlipOutline:(BOOL)a3 forTimestamp:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if (a4)
  {
    v4 = a3;
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = a4;
    objc_msgSend(v6, "numberWithBool:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[AXAuditScreenshotManager _shouldFlipOutline](self, "_shouldFlipOutline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

  }
}

- (id)screenshotImageForTimestamp:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXAuditScreenshotManager _image](self, "_image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)screenshotRotationForTimestamp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  v4 = a3;
  -[AXAuditScreenshotManager _rotation](self, "_rotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    v8 = v7;
  }
  else
  {
    v8 = 1.0;
  }

  return v8;
}

- (CGRect)screenshotDisplayBoundsForTimestamp:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v4 = a3;
  -[AXAuditScreenshotManager _displayBounds](self, "_displayBounds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "rectValue");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v8 = *MEMORY[0x24BDD1408];
    v10 = *(double *)(MEMORY[0x24BDD1408] + 8);
    v12 = *(double *)(MEMORY[0x24BDD1408] + 16);
    v14 = *(double *)(MEMORY[0x24BDD1408] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)screenshotBorderFrameForTimestamp:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v4 = a3;
  -[AXAuditScreenshotManager _borderFrame](self, "_borderFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "rectValue");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v8 = *MEMORY[0x24BDD1408];
    v10 = *(double *)(MEMORY[0x24BDD1408] + 8);
    v12 = *(double *)(MEMORY[0x24BDD1408] + 16);
    v14 = *(double *)(MEMORY[0x24BDD1408] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (double)screenshotScaleFactorForTimestamp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  v4 = a3;
  -[AXAuditScreenshotManager _scaleFactor](self, "_scaleFactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    v8 = v7;
  }
  else
  {
    v8 = 1.0;
  }

  return v8;
}

- (BOOL)screenshotShouldFlipOutlineForTimestamp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[AXAuditScreenshotManager _shouldFlipOutline](self, "_shouldFlipOutline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 0;

  return v7;
}

- (CGRect)_elementBoundsForIssue:(id)a3 containerImageSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend(v7, "elementRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "timeStamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditScreenshotManager _boundsForRect:containerImageSize:timestamp:](self, "_boundsForRect:containerImageSize:timestamp:", v16, v9, v11, v13, v15, width, height);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)_boundsForRect:(CGRect)a3 containerImageSize:(CGSize)a4 timestamp:(id)a5
{
  double height;
  double width;
  double v7;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat y;
  CGFloat x;
  CGFloat v46;
  NSRect v47;
  NSRect v48;
  NSRect v49;
  NSRect v50;
  CGRect result;

  height = a4.height;
  width = a4.width;
  x = a3.origin.x;
  v46 = a3.size.height;
  v7 = a3.size.width;
  y = a3.origin.y;
  v9 = a5;
  -[AXAuditScreenshotManager screenshotBorderFrameForTimestamp:](self, "screenshotBorderFrameForTimestamp:", v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[AXAuditScreenshotManager screenshotRotationForTimestamp:](self, "screenshotRotationForTimestamp:", v9);
  v19 = v18 * 57.2957795;
  if (v19 > 360.0 || v19 < -360.0)
    v19 = v19 - (double)(360 * ((int)v19 / 360));
  if (v19 >= 0.0)
    v20 = v19;
  else
    v20 = v19 + 360.0;
  v47.origin.x = v11;
  v47.origin.y = v13;
  v47.size.width = v15;
  v47.size.height = v17;
  v21 = NSIsEmptyRect(v47);
  -[AXAuditScreenshotManager screenshotDisplayBoundsForTimestamp:](self, "screenshotDisplayBoundsForTimestamp:", v9);
  v22 = v48.size.width;
  v23 = v48.size.height;
  if (NSIsEmptyRect(v48))
  {
    -[AXAuditScreenshotManager screenshotScaleFactorForTimestamp:](self, "screenshotScaleFactorForTimestamp:", v9);
    v25 = v24;
    v26 = x;
    v27 = v46;
    v28 = y;
  }
  else
  {
    v26 = x;
    v27 = v46;
    v28 = y;
    if ((v20 < 45.0 || v20 >= 135.0) && (v20 < 225.0 || v20 >= 315.0))
    {
      v29 = v22;
      v22 = v23;
    }
    else
    {
      v29 = v23;
    }
    v24 = width / v29;
    v25 = height / v22;
  }
  v30 = 0.0;
  if (v21)
    v31 = 0.0;
  else
    v31 = v13;
  v32 = v28 - v31;
  if (!v21)
    v30 = v11;
  v33 = v26 - v30;
  if (width <= height)
    v34 = height;
  else
    v34 = width;
  v49.size.height = v27 * v25;
  v49.size.width = v7 * v24;
  v49.origin.y = v32 * v25;
  v49.origin.x = v33 * v24;
  v50 = NSInsetRect(v49, v34 / -330.0, v34 / -330.0);
  v35 = v50.origin.x;
  v36 = v50.origin.y;
  v37 = v50.size.width;
  v38 = v50.size.height;
  if (-[AXAuditScreenshotManager screenshotShouldFlipOutlineForTimestamp:](self, "screenshotShouldFlipOutlineForTimestamp:", v9))
  {
    v39 = height - v36 - v38;
  }
  else
  {
    v39 = v36;
  }

  v40 = v35;
  v41 = v39;
  v42 = v37;
  v43 = v38;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (void)addScreenshotWithInfo:(id)a3 timestamp:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  double v14;
  float v15;
  NSObject *v16;
  _QWORD block[4];
  id v18;
  AXAuditScreenshotManager *v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD);
  double v24;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = v10;
  if (v8 && v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("imageData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("rotationRadians"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v14 = 1.0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "floatValue");
        v14 = v15;
      }
      +[AXAuditScreenshotManager imageProcessingQueue](AXAuditScreenshotManager, "imageProcessingQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__AXAuditScreenshotManager_addScreenshotWithInfo_timestamp_completion___block_invoke;
      block[3] = &unk_25071B0A0;
      v24 = v14;
      v18 = v12;
      v19 = self;
      v20 = v9;
      v21 = v13;
      v22 = v8;
      v23 = v11;
      dispatch_async(v16, block);

    }
    else
    {
      v11[2](v11);
    }

  }
  else
  {
    v10[2](v10);
  }

}

void __71__AXAuditScreenshotManager_addScreenshotWithInfo_timestamp_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  +[AXAuditScreenshotManager imageFromRemoteImageData:rotation:](AXAuditScreenshotManager, "imageFromRemoteImageData:rotation:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__AXAuditScreenshotManager_addScreenshotWithInfo_timestamp_completion___block_invoke_2;
  block[3] = &unk_25071B0A0;
  v3 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v8 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 80);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __71__AXAuditScreenshotManager_addScreenshotWithInfo_timestamp_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "addScreenshot:forTimestamp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setScreenshotRotation:forTimestamp:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("shouldFlipOutline"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setScreenshotShouldFlipOutline:forTimestamp:", objc_msgSend(v9, "BOOLValue"), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("displayNativeScale"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v2, "floatValue");
    objc_msgSend(v3, "setScreenshotScaleFactor:forTimestamp:", *(_QWORD *)(a1 + 48), v4);
  }
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("borderFrame"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "rectValue");
    objc_msgSend(v6, "setScreenshotBorderFrame:forTimestamp:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("displayBounds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "rectValue");
    objc_msgSend(v8, "setScreenshotDisplayBounds:forTimestamp:", *(_QWORD *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

- (CGRect)elementBoundsInScreenShotForIssue:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "timeStamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditScreenshotManager screenshotImageForTimestamp:](self, "screenshotImageForTimestamp:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "size");
  }
  else
  {
    v7 = *MEMORY[0x24BDD1410];
    v8 = *(double *)(MEMORY[0x24BDD1410] + 8);
  }
  v9 = *MEMORY[0x24BDD1408];
  v10 = *(double *)(MEMORY[0x24BDD1408] + 8);
  v11 = *(double *)(MEMORY[0x24BDD1408] + 16);
  v12 = *(double *)(MEMORY[0x24BDD1408] + 24);
  if (v7 > 0.0 && v8 > 0.0)
  {
    -[AXAuditScreenshotManager _elementBoundsForIssue:containerImageSize:](self, "_elementBoundsForIssue:containerImageSize:", v4);
    v9 = v13;
    v10 = v14;
    v11 = v15;
    v12 = v16;
  }

  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)screenshotForIssue:(id)a3 elementRect:(CGRect *)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;

  v6 = a3;
  objc_msgSend(v6, "timeStamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditScreenshotManager screenshotImageForTimestamp:](self, "screenshotImageForTimestamp:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "size");
    if (!a4)
      goto LABEL_8;
  }
  else
  {
    v9 = *MEMORY[0x24BDD1410];
    v10 = *(double *)(MEMORY[0x24BDD1410] + 8);
    if (!a4)
      goto LABEL_8;
  }
  if (v9 > 0.0 && v10 > 0.0)
  {
    -[AXAuditScreenshotManager _elementBoundsForIssue:containerImageSize:](self, "_elementBoundsForIssue:containerImageSize:", v6);
    a4->origin.x = v11;
    a4->origin.y = v12;
    a4->size.width = v13;
    a4->size.height = v14;
  }
LABEL_8:

  return v8;
}

- (id)screenshotHighlightingIssue:(id)a3
{
  CGSize v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CGFloat v10;
  CGContext *CurrentContext;
  CGRect v13;
  CGSize v14;

  v3 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v13.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v13.size = v3;
  -[AXAuditScreenshotManager screenshotForIssue:elementRect:](self, "screenshotForIssue:elementRect:", a3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "size");
    v8 = v7;
  }
  else
  {
    v6 = *MEMORY[0x24BDBF148];
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v9 = 0;
  if (v6 > 0.0 && v8 > 0.0)
  {
    if (v6 <= v8)
      v6 = v8;
    v10 = v6 / 330.0;
    objc_msgSend(v5, "size");
    UIGraphicsBeginImageContext(v14);
    objc_msgSend(v5, "drawAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    CurrentContext = UIGraphicsGetCurrentContext();
    v13.origin.y = v8 - v13.size.height - v13.origin.y;
    CGContextSetRGBStrokeColor(CurrentContext, 0.0, 0.0, 1.0, 1.0);
    CGContextStrokeRectWithWidth(CurrentContext, v13, v10);
    CGContextSaveGState(CurrentContext);
    UIGraphicsGetImageFromCurrentImageContext();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)thumbnailImageOfIssue:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "timeStamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[AXAuditScreenshotManager screenshotImageForTimestamp:inRect:](self, "screenshotImageForTimestamp:inRect:", v5, v7, v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)screenshotImageForTimestamp:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
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
  CGImage *v26;
  CGImageRef v27;
  CGImageRef v28;
  CGRect v30;
  CGRect v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  if (v9)
  {
    -[AXAuditScreenshotManager screenshotImageForTimestamp:](self, "screenshotImageForTimestamp:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "size");
      v13 = v12;
      v15 = v14;
    }
    else
    {
      v13 = *MEMORY[0x24BDD1410];
      v15 = *(double *)(MEMORY[0x24BDD1410] + 8);
    }
    v17 = 0;
    if (v13 > 0.0 && v15 > 0.0)
    {
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      if (CGRectIsEmpty(v30))
        goto LABEL_11;
      -[AXAuditScreenshotManager _boundsForRect:containerImageSize:timestamp:](self, "_boundsForRect:containerImageSize:timestamp:", v9, x, y, width, height, v13, v15);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v15 - v22 - v24;
      v26 = (CGImage *)objc_msgSend(objc_retainAutorelease(v11), "CGImage");
      v31.origin.x = v19;
      v31.origin.y = v25;
      v31.size.width = v21;
      v31.size.height = v23;
      v27 = CGImageCreateWithImageInRect(v26, v31);
      if (!v27)
      {
LABEL_11:
        v17 = 0;
      }
      else
      {
        v28 = v27;
        objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v28);
      }
    }
    v16 = v17;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)imageProcessingQueue
{
  if (imageProcessingQueue_onceToken != -1)
    dispatch_once(&imageProcessingQueue_onceToken, &__block_literal_global_14);
  return (id)imageProcessingQueue_imageProcessingQueue;
}

void __48__AXAuditScreenshotManager_imageProcessingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.axAudit.images", 0);
  v1 = (void *)imageProcessingQueue_imageProcessingQueue;
  imageProcessingQueue_imageProcessingQueue = (uint64_t)v0;

}

+ (id)imageFromRemoteImageData:(id)a3 rotation:(double)a4
{
  CGFloat v4;
  objc_class *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGContext *CurrentContext;
  __int128 v18;
  void *v19;
  CGAffineTransform v21;
  CGAffineTransform transform;
  CGAffineTransform v23;
  CGSize v24;

  v4 = -a4;
  v5 = (objc_class *)MEMORY[0x24BDF6AC8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRect:", 0.0, 0.0, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeRotation(&v23, v4);
  transform = v23;
  objc_msgSend(v12, "applyTransform:", &transform);
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v24.width = v13;
  v24.height = v15;
  UIGraphicsBeginImageContext(v24);
  CurrentContext = UIGraphicsGetCurrentContext();
  v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v23.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v23.c = v18;
  *(_OWORD *)&v23.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v21.a = *(_OWORD *)&v23.a;
  *(_OWORD *)&v21.c = v18;
  *(_OWORD *)&v21.tx = *(_OWORD *)&v23.tx;
  CGAffineTransformTranslate(&transform, &v21, v14 * 0.5, v16 * 0.5);
  v23 = transform;
  v21 = transform;
  CGAffineTransformRotate(&transform, &v21, v4);
  v23 = transform;
  v21 = transform;
  CGAffineTransformTranslate(&transform, &v21, -(v14 * 0.5), -(v16 * 0.5));
  v23 = transform;
  CGContextConcatCTM(CurrentContext, &transform);
  objc_msgSend(v7, "drawInRect:", v14 * 0.5 + 0.0 - v9 * 0.5, v16 * 0.5 + 0.0 - v11 * 0.5, v9, v11);
  UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v19;
}

- (NSString)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastTimestamp, a3);
}

- (NSMutableDictionary)_image
{
  return self->__image;
}

- (void)set_image:(id)a3
{
  objc_storeStrong((id *)&self->__image, a3);
}

- (NSMutableDictionary)_rotation
{
  return self->__rotation;
}

- (void)set_rotation:(id)a3
{
  objc_storeStrong((id *)&self->__rotation, a3);
}

- (NSMutableDictionary)_displayBounds
{
  return self->__displayBounds;
}

- (void)set_displayBounds:(id)a3
{
  objc_storeStrong((id *)&self->__displayBounds, a3);
}

- (NSMutableDictionary)_borderFrame
{
  return self->__borderFrame;
}

- (void)set_borderFrame:(id)a3
{
  objc_storeStrong((id *)&self->__borderFrame, a3);
}

- (NSMutableDictionary)_scaleFactor
{
  return self->__scaleFactor;
}

- (void)set_scaleFactor:(id)a3
{
  objc_storeStrong((id *)&self->__scaleFactor, a3);
}

- (NSMutableDictionary)_shouldFlipOutline
{
  return self->__shouldFlipOutline;
}

- (void)set_shouldFlipOutline:(id)a3
{
  objc_storeStrong((id *)&self->__shouldFlipOutline, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shouldFlipOutline, 0);
  objc_storeStrong((id *)&self->__scaleFactor, 0);
  objc_storeStrong((id *)&self->__borderFrame, 0);
  objc_storeStrong((id *)&self->__displayBounds, 0);
  objc_storeStrong((id *)&self->__rotation, 0);
  objc_storeStrong((id *)&self->__image, 0);
  objc_storeStrong((id *)&self->_lastTimestamp, 0);
}

@end
