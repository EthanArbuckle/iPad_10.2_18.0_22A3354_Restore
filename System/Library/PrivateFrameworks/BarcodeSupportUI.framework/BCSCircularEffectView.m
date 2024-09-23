@implementation BCSCircularEffectView

- (BCSCircularEffectView)initWithFrame:(CGRect)a3
{
  BCSCircularEffectView *v3;
  BCSCircularEffectView *v4;
  BCSCircularEffectView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCSCircularEffectView;
  v3 = -[BCSCircularEffectView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BCSCircularEffectView _buildRings](v3, "_buildRings");
    v5 = v4;
  }

  return v4;
}

- (void)_buildRings
{
  NSMutableArray *v3;
  NSMutableArray *circles;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double MidX;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CGImage *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  CALayer *v27;
  CALayer *centerRing;
  id v29;
  CGImage *v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  CALayer *v35;
  CALayer *glyphLayer;
  CALayer *v37;
  CALayer *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CATransform3D v55;
  CATransform3D v56;
  CATransform3D v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  circles = self->_circles;
  self->_circles = v3;

  -[BCSCircularEffectView bounds](self, "bounds");
  v5 = CGRectGetWidth(v58) / 200.0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  v9 = 0.0;
  v10 = 5;
  v48 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v49 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v46 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v47 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v44 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v45 = *MEMORY[0x24BDE5598];
  v42 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v43 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v40 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v41 = *MEMORY[0x24BDBD8B8];
  v39 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v11 = *MEMORY[0x24BDE5A48];
  do
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSCircularEffectView bounds](self, "bounds");
    objc_msgSend(v12, "setBounds:");
    -[BCSCircularEffectView bounds](self, "bounds");
    MidX = CGRectGetMidX(v59);
    -[BCSCircularEffectView bounds](self, "bounds");
    objc_msgSend(v12, "setPosition:", MidX, CGRectGetMidY(v60));
    -[BCSCircularEffectView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", v12);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_circles, "addObject:", v15);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Ring-%1lu"), v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", v16, v50);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (CGImage *)objc_msgSend(v17, "CGImage");

    v19 = (double)CGImageGetWidth(v18) / v8;
    objc_msgSend(v15, "setContents:", v18);
    objc_msgSend(v15, "setContentsScale:", v8);
    objc_msgSend(v15, "setBounds:", 0.0, 0.0, v19, v19);
    *(_OWORD *)&v56.m31 = v49;
    *(_OWORD *)&v56.m33 = v48;
    *(_OWORD *)&v56.m41 = v47;
    *(_OWORD *)&v56.m43 = v46;
    *(_OWORD *)&v56.m11 = v45;
    *(_OWORD *)&v56.m13 = v44;
    *(_OWORD *)&v56.m21 = v43;
    *(_OWORD *)&v56.m23 = v42;
    CATransform3DScale(&v57, &v56, 0.35, 0.35, 1.0);
    v55 = v57;
    objc_msgSend(v15, "setTransform:", &v55);
    -[BCSCircularEffectView bounds](self, "bounds");
    v20 = CGRectGetMidX(v61);
    -[BCSCircularEffectView bounds](self, "bounds");
    objc_msgSend(v15, "setPosition:", v20, CGRectGetMidY(v62));
    objc_msgSend(v12, "addSublayer:", v15);
    *(_OWORD *)&v56.m11 = v41;
    *(_OWORD *)&v56.m13 = v40;
    *(_OWORD *)&v56.m21 = v39;
    CGAffineTransformScale(&v54, (CGAffineTransform *)&v56, v5, v5);
    v53 = v54;
    objc_msgSend(v12, "setAffineTransform:", &v53);
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v10 == 5)
      v23 = v19 * 0.85;
    else
      v23 = v9;
    objc_msgSend(v21, "setBounds:", 0.0, 0.0, v23, v23);
    -[BCSCircularEffectView bounds](self, "bounds");
    v24 = CGRectGetMidX(v63);
    -[BCSCircularEffectView bounds](self, "bounds");
    objc_msgSend(v22, "setPosition:", v24, CGRectGetMidY(v64));
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v22, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));

    v65.origin.x = 0.0;
    v65.origin.y = 0.0;
    v65.size.width = v23;
    v65.size.height = v23;
    objc_msgSend(v22, "setCornerRadius:", CGRectGetWidth(v65) * 0.5);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCompositingFilter:", v26);

    objc_msgSend(v12, "addSublayer:", v22);
    v9 = v19;
    --v10;
  }
  while (v10);
  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v27 = (CALayer *)objc_claimAutoreleasedReturnValue();
  centerRing = self->_centerRing;
  self->_centerRing = v27;

  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("Center-Glyph"), v50);
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v30 = (CGImage *)objc_msgSend(v29, "CGImage");

  v31 = v5 * (double)CGImageGetWidth(v30) / v8;
  -[CALayer setBounds:](self->_centerRing, "setBounds:", 0.0, 0.0, v31, v31);
  -[CALayer setCornerRadius:](self->_centerRing, "setCornerRadius:", v31 * 0.5);
  -[BCSCircularEffectView bounds](self, "bounds");
  v32 = CGRectGetMidX(v66);
  -[BCSCircularEffectView bounds](self, "bounds");
  -[CALayer setPosition:](self->_centerRing, "setPosition:", v32, CGRectGetMidY(v67));
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](self->_centerRing, "setBackgroundColor:", objc_msgSend(v33, "CGColor"));

  -[BCSCircularEffectView layer](self, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSublayer:", self->_centerRing);

  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v35 = (CALayer *)objc_claimAutoreleasedReturnValue();
  -[CALayer setContents:](v35, "setContents:", v30);
  -[CALayer setContentsScale:](v35, "setContentsScale:", v8);
  -[CALayer setBounds:](v35, "setBounds:", 0.0, 0.0, v31, v31);
  -[CALayer setPosition:](v35, "setPosition:", v31 * 0.5, v31 * 0.5);
  -[CALayer addSublayer:](self->_centerRing, "addSublayer:", v35);
  glyphLayer = self->_glyphLayer;
  self->_glyphLayer = v35;
  v37 = v35;

  CGAffineTransformMakeScale(&v52, 0.0, 0.0);
  v38 = self->_centerRing;
  v51 = v52;
  -[CALayer setAffineTransform:](v38, "setAffineTransform:", &v51);

}

- (void)prepareCenterGlyphWithImage:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_centerRingScaleAnimationStarted)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_centerGlyphImage, a3);
    v5 = v6;
  }

}

- (void)animateCenterGlyphAndRings
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[NSMutableArray count](self->_circles, "count");
  v4 = *MEMORY[0x24BDE5978];
  if (v3)
  {
    v5 = 0;
    v6 = *MEMORY[0x24BDE5D28];
    do
    {
      objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("transform.scale"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMass:", 1.0);
      objc_msgSend(v7, "setDamping:", 39.0);
      objc_msgSend(v7, "setStiffness:", 700.0);
      objc_msgSend(v7, "setFromValue:", &unk_250869A18);
      objc_msgSend(v7, "setToValue:", &unk_250869978);
      objc_msgSend(v7, "setDuration:", 0.39);
      objc_msgSend(v7, "setFillMode:", v4);
      objc_msgSend(v7, "setRemovedOnCompletion:", 0);
      objc_msgSend(v7, "setBeginTime:", CACurrentMediaTime() + 0.3675 + (double)v5 * 0.133);
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTimingFunction:", v8);

      -[NSMutableArray objectAtIndexedSubscript:](self->_circles, "objectAtIndexedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAnimation:forKey:", v7, CFSTR("tranform.scale"));

      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->_circles, "count"));
  }
  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("transform.scale"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMass:", 1.0);
  objc_msgSend(v11, "setDamping:", 39.0);
  objc_msgSend(v11, "setStiffness:", 700.0);
  objc_msgSend(v11, "setFromValue:", &unk_250869990);
  objc_msgSend(v11, "setToValue:", &unk_250869978);
  objc_msgSend(v11, "setDuration:", 0.39);
  objc_msgSend(v11, "setBeginTime:", CACurrentMediaTime() + 0.235);
  objc_msgSend(v11, "setFillMode:", v4);
  objc_msgSend(v11, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunction:", v10);

  objc_msgSend(v11, "setDelegate:", self);
  -[CALayer addAnimation:forKey:](self->_centerRing, "addAnimation:forKey:", v11, CFSTR("tranform.scale"));

}

- (void)animateRingsRotationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _OWORD v16[2];
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16[0] = xmmword_236DFDE10;
  v16[1] = xmmword_236DFDE10;
  v17 = 0xC03E000000000000;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v5 = (void *)MEMORY[0x24BDE57D8];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__BCSCircularEffectView_animateRingsRotationWithCompletion___block_invoke;
  v14[3] = &unk_2508640C8;
  v13 = v4;
  v15 = v13;
  objc_msgSend(v5, "setCompletionBlock:", v14);
  if (-[NSMutableArray count](self->_circles, "count"))
  {
    v6 = 0;
    v7 = *MEMORY[0x24BDE5970];
    v8 = *MEMORY[0x24BDE5D20];
    do
    {
      objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setMass:", 2.0);
      objc_msgSend(v9, "setDamping:", 50.0);
      objc_msgSend(v9, "setStiffness:", 300.0);
      objc_msgSend(v9, "setFromValue:", &unk_250869990);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)v16 + v6) / 180.0 * 3.14159265);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setToValue:", v10);

      objc_msgSend(v9, "setDuration:", 0.6);
      objc_msgSend(v9, "setFillMode:", v7);
      objc_msgSend(v9, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTimingFunction:", v11);

      -[NSMutableArray objectAtIndexedSubscript:](self->_circles, "objectAtIndexedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAnimation:forKey:", v9, CFSTR("transform.rotation.z"));

      ++v6;
    }
    while (v6 < -[NSMutableArray count](self->_circles, "count"));
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

uint64_t __60__BCSCircularEffectView_animateRingsRotationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)revealCenterGlyphAndRings
{
  unint64_t v3;
  void *v4;
  CALayer *centerRing;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CATransform3D v16;
  CATransform3D v17;
  CATransform3D v18;

  if (-[NSMutableArray count](self->_circles, "count"))
  {
    v3 = 0;
    v12 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v13 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v9 = *MEMORY[0x24BDE5598];
    v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    do
    {
      *(_OWORD *)&v17.m31 = v13;
      *(_OWORD *)&v17.m33 = v12;
      *(_OWORD *)&v17.m41 = v11;
      *(_OWORD *)&v17.m43 = v10;
      *(_OWORD *)&v17.m11 = v9;
      *(_OWORD *)&v17.m13 = v8;
      *(_OWORD *)&v17.m21 = v7;
      *(_OWORD *)&v17.m23 = v6;
      CATransform3DScale(&v18, &v17, 1.0, 1.0, 1.0);
      -[NSMutableArray objectAtIndexedSubscript:](self->_circles, "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v18;
      objc_msgSend(v4, "setTransform:", &v16);

      ++v3;
    }
    while (v3 < -[NSMutableArray count](self->_circles, "count"));
  }
  CGAffineTransformMakeScale(&v15, 1.0, 1.0);
  centerRing = self->_centerRing;
  v14 = v15;
  -[CALayer setAffineTransform:](centerRing, "setAffineTransform:", &v14);
}

- (void)animationDidStart:(id)a3
{
  CALayer *centerRing;
  id v5;
  id v6;

  centerRing = self->_centerRing;
  v5 = a3;
  -[CALayer animationForKey:](centerRing, "animationForKey:", CFSTR("tranform.scale"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    self->_centerRingScaleAnimationStarted = 1;
    if (self->_centerGlyphImage)
    {
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      -[CALayer setContents:](self->_glyphLayer, "setContents:", -[UIImage CGImage](self->_centerGlyphImage, "CGImage"));
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerGlyphImage, 0);
  objc_storeStrong((id *)&self->_glyphLayer, 0);
  objc_storeStrong((id *)&self->_centerRing, 0);
  objc_storeStrong((id *)&self->_circles, 0);
}

@end
