@implementation BCSDissolveEffectView

- (id)_averageColorAtCornerForImage:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGImage *v11;
  void *v12;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;

  v3 = a3;
  objc_msgSend(v3, "extent", *MEMORY[0x24BDBD8B8], *(_QWORD *)(MEMORY[0x24BDBD8B8] + 8), *(_QWORD *)(MEMORY[0x24BDBD8B8] + 16), *(_QWORD *)(MEMORY[0x24BDBD8B8] + 24), *(_QWORD *)(MEMORY[0x24BDBD8B8] + 32), *(_QWORD *)(MEMORY[0x24BDBD8B8] + 40));
  v5 = v4;
  objc_msgSend(v3, "extent");
  CGAffineTransformScale(&v15, &v14, v5, v6);
  v16.origin.y = 0.98;
  v16.origin.x = 0.01;
  v16.size.width = 0.01;
  v16.size.height = 0.01;
  v17 = CGRectApplyAffineTransform(v16, &v15);
  objc_msgSend(v3, "imageByCroppingToRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF648]), "initWithOptions:", 0);
  objc_msgSend(v7, "extent");
  v10 = v9;
  objc_msgSend(v7, "extent");
  v11 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v3, 0.0, 0.0, v10);
  objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v11, 0, 2.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v11);

  return v12;
}

- (id)_imageForCellWithColor:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v6;
  void *v7;
  CGSize v9;
  CGRect v10;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v9.width = width;
  v9.height = height;
  UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
  objc_msgSend(v6, "set");
  v10.origin.x = *(CGFloat *)MEMORY[0x24BDBEFB0];
  v10.origin.y = *(CGFloat *)(MEMORY[0x24BDBEFB0] + 8);
  v10.size.width = width;
  v10.size.height = height;
  UIRectFill(v10);
  UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsPopContext();

  return v7;
}

- (void)startAnimation
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[2];
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v42[1] = *MEMORY[0x24BDAC8D0];
  -[BCSDissolveEffectView bounds](self, "bounds");
  v44 = CGRectInset(v43, 10.0, 10.0);
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSDissolveEffectView _imageForCellWithColor:size:](self, "_imageForCellWithColor:size:", v7, 2.0, 2.0);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGImage");

  -[BCSDissolveEffectView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CIImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSDissolveEffectView _averageColorAtCornerForImage:](self, "_averageColorAtCornerForImage:", v12);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v38 = objc_msgSend(v13, "CGImage");

  v14 = *MEMORY[0x24BDE5940];
  objc_msgSend(MEMORY[0x24BDE5690], "behaviorWithType:", *MEMORY[0x24BDE5940]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forKey:", CFSTR("scale"), CFSTR("keyPath"));
  objc_msgSend(v15, "setValue:forKey:", &unk_250869D08, CFSTR("values"));
  objc_msgSend(v15, "setValue:forKey:", &unk_250869D20, CFSTR("locations"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5698], "emitterCell");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setName:", CFSTR("white"));
  v42[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEmitterBehaviors:", v17);

  LODWORD(v18) = 30.0;
  objc_msgSend(v16, "setBirthRate:", v18);
  LODWORD(v19) = 1.0;
  objc_msgSend(v16, "setLifetime:", v19);
  objc_msgSend(v16, "setContents:", v9);
  objc_msgSend(v16, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v16, "setColor:", objc_msgSend(v20, "CGColor"));

  objc_msgSend(v39, "addObject:", v16);
  objc_msgSend(MEMORY[0x24BDE56A0], "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setEmitterCells:", v39);
  objc_msgSend(v21, "setEmitterMode:", CFSTR("sequential"));
  objc_msgSend(v21, "setEmitterPosition:", x + width * 0.5, y + height * 0.5);
  objc_msgSend(v21, "setEmitterShape:", CFSTR("cuboid"));
  objc_msgSend(v21, "setEmitterSize:", width, height);
  objc_msgSend(v21, "setFrame:", 0.0, 0.0, width, height);
  objc_msgSend(v21, "setRenderMode:", CFSTR("unordered"));
  objc_msgSend(v21, "setSeed:", arc4random());
  objc_msgSend(MEMORY[0x24BDE5690], "behaviorWithType:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValue:forKey:", CFSTR("scale"), CFSTR("keyPath"));
  objc_msgSend(v22, "setValue:forKey:", &unk_250869D38, CFSTR("values"));
  objc_msgSend(v22, "setValue:forKey:", &unk_250869D50, CFSTR("locations"));
  objc_msgSend(MEMORY[0x24BDE5698], "emitterCell");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setName:", CFSTR("black"));
  v41 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setEmitterBehaviors:", v24);

  LODWORD(v25) = 12.0;
  objc_msgSend(v23, "setBirthRate:", v25);
  LODWORD(v26) = 3.0;
  objc_msgSend(v23, "setLifetime:", v26);
  objc_msgSend(v23, "setContents:", v38);
  objc_msgSend(v23, "setBeginTime:", CACurrentMediaTime());
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  v46 = CGRectInset(v45, 2.0, 2.0);
  v27 = v46.origin.x;
  v28 = v46.origin.y;
  v29 = v46.size.width;
  v30 = v46.size.height;
  objc_msgSend(MEMORY[0x24BDE56A0], "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setEmitterCells:", v32);

  objc_msgSend(v31, "setEmitterMode:", CFSTR("sequential"));
  objc_msgSend(v31, "setEmitterPosition:", v27 + v29 * 0.5, v28 + v30 * 0.5);
  objc_msgSend(v31, "setEmitterShape:", CFSTR("rectangle"));
  objc_msgSend(v31, "setEmitterSize:", v29, v30);
  objc_msgSend(v31, "setFrame:", 0.0, 0.0, v29, v30);
  objc_msgSend(v31, "setRenderMode:", CFSTR("unordered"));
  objc_msgSend(v31, "setSeed:", arc4random());
  objc_storeStrong((id *)&self->_expandingLayer, v31);
  objc_storeStrong((id *)&self->_dissolveLayer, v21);
  LODWORD(v33) = 2.0;
  -[CAEmitterLayer setBirthRate:](self->_dissolveLayer, "setBirthRate:", v33);
  LODWORD(v34) = 1053609165;
  -[CAEmitterLayer setLifetime:](self->_expandingLayer, "setLifetime:", v34);
  LODWORD(v35) = 1053609165;
  -[CAEmitterLayer setLifetime:](self->_dissolveLayer, "setLifetime:", v35);
  -[BCSDissolveEffectView layer](self, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "insertSublayer:atIndex:", v31, 0);

  -[BCSDissolveEffectView layer](self, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addSublayer:", v21);

}

- (void)stopAnimation
{
  CAEmitterLayer *expandingLayer;
  CAEmitterLayer *dissolveLayer;
  id v5;

  -[CAEmitterLayer removeFromSuperlayer](self->_expandingLayer, "removeFromSuperlayer");
  expandingLayer = self->_expandingLayer;
  self->_expandingLayer = 0;

  -[CAEmitterLayer removeFromSuperlayer](self->_dissolveLayer, "removeFromSuperlayer");
  dissolveLayer = self->_dissolveLayer;
  self->_dissolveLayer = 0;

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BCSDissolveEffectView setBackgroundColor:](self, "setBackgroundColor:");

}

- (void)startAnimationWithDuration:(double)a3 appImageBlock:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  dispatch_time_t v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v8 = a4;
  v9 = a5;
  -[BCSDissolveEffectView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[BCSDissolveEffectView startAnimation](self, "startAnimation");
  -[BCSDissolveEffectView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", 0);

  v11 = MEMORY[0x24BDAC760];
  v18[4] = self;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke;
  v19[3] = &unk_2508639E8;
  v19[4] = self;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_2;
  v18[3] = &unk_250864118;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v19, v18, a3);
  v12 = dispatch_time(0, (uint64_t)(a3 * 0.75 * 1000000000.0));
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_3;
  block[3] = &unk_250864190;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_after(v12, MEMORY[0x24BDAC9B8], block);

}

uint64_t __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setContinuousCornerRadius:", 32.0);
}

uint64_t __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 440));
  objc_msgSend(WeakRetained, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "stopAnimation");
}

void __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double Width;
  CGFloat v9;
  double Height;
  CGFloat v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v2 = objc_alloc(MEMORY[0x24BEBD668]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithImage:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 432);
  *(_QWORD *)(v5 + 432) = v4;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  CGRectGetMidX(v23);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  CGRectGetMidY(v24);
  _bcs_roundPointToPixels();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setPosition:");
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
  CGAffineTransformMakeScale(&v22, 0.0, 0.0);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  v21 = v22;
  objc_msgSend(v7, "setTransform:", &v21);
  memset(&v20, 0, sizeof(v20));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  Width = CGRectGetWidth(v25);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "bounds");
  v9 = Width / CGRectGetWidth(v26);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  Height = CGRectGetHeight(v27);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "bounds");
  v11 = CGRectGetHeight(v28);
  CGAffineTransformMakeScale(&v20, v9, Height / v11);
  v18 = v20;
  CGAffineTransformScale(&v19, &v18, 0.5, 0.5);
  v20 = v19;
  v12 = (void *)MEMORY[0x24BEBDB00];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_4;
  v16[3] = &unk_250864140;
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v19;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_5;
  v14[3] = &unk_250864168;
  v13 = *(id *)(a1 + 48);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v13;
  objc_msgSend(v12, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v16, v14, 0.3, 0.0, 0.73, 0.0);

}

uint64_t __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_4(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

void __77__BCSDissolveEffectView_startAnimationWithDuration_appImageBlock_completion___block_invoke_5(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "window");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

}

- (UIImageView)contentView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)setContentView:(id)a3
{
  objc_storeWeak((id *)&self->_contentView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_targetAppIcon, 0);
  objc_storeStrong((id *)&self->_expandingLayer, 0);
  objc_storeStrong((id *)&self->_dissolveLayer, 0);
}

@end
