@implementation PDFCoachMark

- (PDFCoachMark)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PDFCoachMark *v7;
  uint64_t v8;
  NSDate *creationTime;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)PDFCoachMark;
  v7 = -[PDFCoachMark init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    creationTime = v7->creationTime;
    v7->creationTime = (NSDate *)v8;

    v7->frame.origin.x = x;
    v7->frame.origin.y = y;
    v7->frame.size.width = width;
    v7->frame.size.height = height;
  }
  return v7;
}

- (void)playEffect:(id)a3
{
  id v4;
  PDFPageLayerEffect *v5;
  PDFPageLayerEffect *layerEffect;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CATransform3D v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id location;
  _QWORD v44[4];

  v44[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[PDFPageLayerEffect createPDFCoachmarkLayerEffectsWithFrame:withLayer:](PDFPageLayerEffect, "createPDFCoachmarkLayerEffectsWithFrame:withLayer:", v4, self->frame.origin.x, self->frame.origin.y, self->frame.size.width, self->frame.size.height);
  v5 = (PDFPageLayerEffect *)objc_claimAutoreleasedReturnValue();
  layerEffect = self->layerEffect;
  self->layerEffect = v5;

  if (self->layerEffect)
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBeginTime:", CACurrentMediaTime() + 0.8);
    LODWORD(v8) = 1.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", v9);

    LODWORD(v10) = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setToValue:", v11);

    objc_msgSend(v7, "setDuration:", 0.4);
    LODWORD(v12) = 1.0;
    objc_msgSend(v7, "setRepeatCount:", v12);
    objc_msgSend(v7, "setRemovedOnCompletion:", 0);
    objc_msgSend(v7, "setFillMode:", *MEMORY[0x24BDE5978]);
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x24BDE57D8];
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __27__PDFCoachMark_playEffect___block_invoke;
    v40[3] = &unk_24C25CD18;
    objc_copyWeak(&v42, &location);
    v41 = v4;
    objc_msgSend(v13, "setCompletionBlock:", v40);
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v36 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v30 = v36;
    v37 = v29;
    v27 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v38 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v28 = v38;
    v39 = v27;
    v25 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v32 = *MEMORY[0x24BDE5598];
    v26 = v32;
    v33 = v25;
    v23 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v34 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v24 = v34;
    v35 = v23;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v15;
    v16 = (void *)MEMORY[0x24BDD1968];
    CATransform3DMakeScale(&v31, 2.0, 2.0, 1.0);
    objc_msgSend(v16, "valueWithCATransform3D:", &v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v17;
    v36 = v30;
    v37 = v29;
    v38 = v28;
    v39 = v27;
    v32 = v26;
    v33 = v25;
    v34 = v24;
    v35 = v23;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValues:", v19);

    objc_msgSend(v14, "setDuration:", 0.2);
    LODWORD(v20) = 1.0;
    objc_msgSend(v14, "setRepeatCount:", v20);
    -[PDFPageLayerEffect sublayers](self->layerEffect, "sublayers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addAnimation:forKey:", v7, CFSTR("fadeAnimation"));
    objc_msgSend(v22, "addAnimation:forKey:", v14, CFSTR("scaleAnimation"));

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

  }
}

void __27__PDFCoachMark_playEffect___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[6], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removePageLayerEffectForID:", v4);

    WeakRetained = v5;
  }

}

- (double)effectTimeLeft
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->creationTime);
  v5 = 1.2 - v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->layerEffect, 0);
  objc_storeStrong((id *)&self->creationTime, 0);
}

@end
