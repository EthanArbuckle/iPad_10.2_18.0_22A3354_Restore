@implementation CRBoxLayer

+ (id)layer
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (CRBoxLayer)init
{
  void *v3;
  int v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.RedeemerDemoMode"));
  v5 = 1.0;
  if (v4)
    v5 = 0.25;
  -[CRBoxLayer setDemoSpeed:](self, "setDemoSpeed:", v5);

  return -[CRBoxLayer initWithCodeFrameRatio:](self, "initWithCodeFrameRatio:", 3.79710145);
}

- (CRBoxLayer)initWithCodeFrameRatio:(double)a3
{
  CRBoxLayer *v4;
  CRBoxLayer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRBoxLayer;
  v4 = -[CAReplicatorLayer init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[CRBoxLayer setFrameRatio:](v4, "setFrameRatio:", a3);
    v5->_customInit = 1;
    -[CRBoxLayer addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v5, CFSTR("hidden"), 3, 0);
  }
  return v5;
}

- (void)setFrameRatio:(double)a3
{
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  CGPath *Mutable;
  void *v32;
  CGFloat MinX;
  void *v34;
  CGFloat MinY;
  void *v36;
  void *v37;
  CGFloat v38;
  void *v39;
  void *v40;
  CGFloat v41;
  void *v42;
  CGFloat v43;
  void *v44;
  void *v45;
  CGFloat v46;
  void *v47;
  void *v48;
  CGFloat v49;
  void *v50;
  CGFloat v51;
  void *v52;
  void *v53;
  CGFloat v54;
  void *v55;
  void *v56;
  CGFloat v57;
  void *v58;
  CGFloat v59;
  void *v60;
  void *v61;
  CGFloat v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double Width;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;

  if (self->_frameRatio != a3)
  {
    self->_frameRatio = a3;
    -[CRBoxLayer frameRatio](self, "frameRatio");
    v5 = 971.487179 / v4 + 52.5128205;
    +[CRColor colorWithWhite:alpha:](CRColor, "colorWithWhite:alpha:", 1.0, 0.5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");

    -[CRBoxLayer setBounds:](self, "setBounds:", 0.0, 0.0, 1024.0, ceil(v5));
    -[CRBoxLayer setShadowColor:](self, "setShadowColor:", v7);
    -[CRBoxLayer setHidden:](self, "setHidden:", 1);
    -[CAReplicatorLayer setInstanceCount:](self, "setInstanceCount:", 3);
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDE5758], "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRBoxLayer setReticleLayer:](self, "setReticleLayer:", v9);

      -[CRBoxLayer reticleLayer](self, "reticleLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRBoxLayer addSublayer:](self, "addSublayer:", v10);

    }
    -[CRBoxLayer bounds](self, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBounds:", v12, v14, v16, v18);

    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setShouldRasterize:", 1);

    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setShadowColor:", v7);

    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 1.0;
    objc_msgSend(v22, "setShadowOpacity:", v23);

    v24 = *MEMORY[0x24BDBF148];
    v25 = *(double *)(MEMORY[0x24BDBF148] + 8);
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setShadowOffset:", v24, v25);

    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setShadowRadius:", 26.2564103);

    +[CRColor whiteColor](CRColor, "whiteColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend(v28, "CGColor");
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFillColor:", v29);

    Mutable = CGPathCreateMutable();
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    MinX = CGRectGetMinX(v80);
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bounds");
    MinY = CGRectGetMinY(v81);
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    v83.size.width = CGRectGetWidth(v82);
    v83.origin.x = MinX;
    v83.origin.y = MinY;
    v83.size.height = 5.25128205;
    CGPathAddRect(Mutable, 0, v83);

    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bounds");
    v38 = CGRectGetMidX(v84) + -2.62564103;
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bounds");
    v86.origin.y = CGRectGetMinY(v85) + 5.25128205;
    v86.origin.x = v38;
    v86.size.width = 5.25128205;
    v86.size.height = 21.0051282;
    CGPathAddRect(Mutable, 0, v86);

    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bounds");
    v41 = CGRectGetMinX(v87);
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bounds");
    v43 = CGRectGetMaxY(v88) + -5.25128205;
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bounds");
    v90.size.width = CGRectGetWidth(v89);
    v90.origin.x = v41;
    v90.origin.y = v43;
    v90.size.height = 5.25128205;
    CGPathAddRect(Mutable, 0, v90);

    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bounds");
    v46 = CGRectGetMidX(v91) + -2.62564103;
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bounds");
    v93.origin.y = CGRectGetMaxY(v92) + -26.2564103;
    v93.origin.x = v46;
    v93.size.width = 5.25128205;
    v93.size.height = 21.0051282;
    CGPathAddRect(Mutable, 0, v93);

    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bounds");
    v49 = CGRectGetMinX(v94);
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bounds");
    v51 = CGRectGetMinY(v95);
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "bounds");
    v97.size.height = CGRectGetHeight(v96);
    v97.origin.x = v49;
    v97.origin.y = v51;
    v97.size.width = 5.25128205;
    CGPathAddRect(Mutable, 0, v97);

    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bounds");
    v54 = CGRectGetMinX(v98) + 5.25128205;
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bounds");
    v100.origin.y = CGRectGetMidY(v99) + -2.62564103;
    v100.origin.x = v54;
    v100.size.width = 21.0051282;
    v100.size.height = 5.25128205;
    CGPathAddRect(Mutable, 0, v100);

    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bounds");
    v57 = CGRectGetMaxX(v101) + -5.25128205;
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "bounds");
    v59 = CGRectGetMinY(v102);
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "bounds");
    v104.size.height = CGRectGetHeight(v103);
    v104.origin.x = v57;
    v104.origin.y = v59;
    v104.size.width = 5.25128205;
    CGPathAddRect(Mutable, 0, v104);

    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "bounds");
    v62 = CGRectGetMaxX(v105) + -26.2564103;
    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bounds");
    v107.origin.y = CGRectGetMidY(v106) + -2.62564103;
    v107.origin.x = v62;
    v107.size.width = 21.0051282;
    v107.size.height = 5.25128205;
    CGPathAddRect(Mutable, 0, v107);

    -[CRBoxLayer reticleLayer](self, "reticleLayer");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setPath:", Mutable);

    CGPathRelease(Mutable);
    -[CRBoxLayer codeLayer](self, "codeLayer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v65)
    {
      objc_msgSend(MEMORY[0x24BDE57C0], "layer");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRBoxLayer setCodeLayer:](self, "setCodeLayer:", v66);

      -[CRBoxLayer codeLayer](self, "codeLayer");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRBoxLayer addSublayer:](self, "addSublayer:", v67);

    }
    -[CRBoxLayer bounds](self, "bounds");
    Width = CGRectGetWidth(v108);
    -[CRBoxLayer codeLayer](self, "codeLayer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setBounds:", 0.0, 0.0, Width, 127.0);

    -[CRBoxLayer codeLayer](self, "codeLayer");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setAnchorPoint:", 0.5, 0.41);

    -[CRBoxLayer codeLayer](self, "codeLayer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setShouldRasterize:", 1);

    -[CRBoxLayer codeLayer](self, "codeLayer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setShadowColor:", v7);

    -[CRBoxLayer codeLayer](self, "codeLayer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v74) = 1.0;
    objc_msgSend(v73, "setShadowOpacity:", v74);

    -[CRBoxLayer codeLayer](self, "codeLayer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setShadowOffset:", v24, v25);

    -[CRBoxLayer codeLayer](self, "codeLayer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setShadowRadius:", 26.2564103);

    -[CRBoxLayer codeLayer](self, "codeLayer");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setFont:", CFSTR("Scancardium"));

    -[CRBoxLayer codeLayer](self, "codeLayer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setFontSize:", 126.030769);

    -[CRBoxLayer codeLayer](self, "codeLayer");
    v79 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setAlignmentMode:", CFSTR("center"));

  }
}

- (void)dealloc
{
  objc_super v3;

  if (-[CRBoxLayer customInit](self, "customInit"))
    -[CRBoxLayer removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("hidden"));
  v3.receiver = self;
  v3.super_class = (Class)CRBoxLayer;
  -[CRBoxLayer dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = *MEMORY[0x24BDD0E70];
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDD0E80]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v10, "isEqual:", v11);
  if ((v9 & 1) == 0 && objc_msgSend(v12, "isEqualToString:", CFSTR("hidden")))
  {
    if ((-[CRBoxLayer isHidden](self, "isHidden") & 1) != 0)
      -[CRBoxLayer animateConceal](self, "animateConceal");
    else
      -[CRBoxLayer animateReveal](self, "animateReveal");
  }

}

- (void)layoutSublayers
{
  double MidX;
  double MidY;
  void *v5;
  double v6;
  double v7;
  id v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  -[CRBoxLayer bounds](self, "bounds");
  MidX = CGRectGetMidX(v9);
  -[CRBoxLayer bounds](self, "bounds");
  MidY = CGRectGetMidY(v10);
  -[CRBoxLayer reticleLayer](self, "reticleLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPosition:", MidX, MidY);

  -[CRBoxLayer bounds](self, "bounds");
  v6 = CGRectGetMidX(v11);
  -[CRBoxLayer bounds](self, "bounds");
  v7 = CGRectGetMidY(v12);
  -[CRBoxLayer codeLayer](self, "codeLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPosition:", v6, v7);

}

- (void)positionForCodeBoxPoints:(id)a3
{
  uint64_t v5;
  double *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
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
  double v21;
  double v22;
  CGFloat Width;
  float v24;
  double v25;
  CGFloat angle;
  CATransform3D v27;
  CATransform3D v28;
  CATransform3D v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  CGRect v39;

  v5 = 0;
  v38 = *MEMORY[0x24BDAC8D0];
  v6 = &v31;
  do
  {
    objc_msgSend(a3, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGPointValue");
    *((_QWORD *)v6 - 1) = v8;
    *(_QWORD *)v6 = v9;

    ++v5;
    v6 += 2;
  }
  while (v5 != 4);
  v11 = v30;
  v10 = v31;
  v12 = v32;
  v13 = v33;
  v14 = v34;
  v15 = v35;
  v17 = v36;
  v16 = v37;
  v18 = (v30 + v36) * 0.5;
  v19 = (v31 + v37) * 0.5;
  v20 = (v32 + v34) * 0.5;
  v21 = (v33 + v35) * 0.5;
  if (v20 == v18)
    v22 = dbl_20CDD3A30[v21 > v19];
  else
    v22 = atan((v21 - v19) / (v20 - v18));
  angle = v22;
  -[CRBoxLayer bounds](self, "bounds", (sqrt((v11 - v12) * (v11 - v12) + (v10 - v13) * (v10 - v13))+ sqrt((v14 - v17) * (v14 - v17) + (v15 - v16) * (v15 - v16)))* 0.5);
  Width = CGRectGetWidth(v39);
  memset(&v29, 0, sizeof(v29));
  CATransform3DMakeScale(&v29, v25 / Width * 195.0 / 185.0, v25 / Width * 195.0 / 185.0, 1.0);
  v27 = v29;
  CATransform3DRotate(&v28, &v27, angle, 0.0, 0.0, 1.0);
  v29 = v28;
  -[CRBoxLayer opacity](self, "opacity");
  v28 = v29;
  -[CRBoxLayer animateToPosition:transform:opacity:type:](self, "animateToPosition:transform:opacity:type:", &v28, 1, (v11 + v12 + v14 + v17) * 0.25, (v10 + v13 + v15 + v16) * 0.25, v24);
}

- (void)animateReveal
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;

  -[CRBoxLayer position](self, "position");
  v4 = v3;
  v6 = v5;
  -[CRBoxLayer transform](self, "transform");
  -[CRBoxLayer animateToPosition:transform:opacity:type:](self, "animateToPosition:transform:opacity:type:", &v7, 0, v4, v6, 1.0);
}

- (void)animateConceal
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;

  -[CRBoxLayer position](self, "position");
  v4 = v3;
  v6 = v5;
  -[CRBoxLayer transform](self, "transform");
  -[CRBoxLayer animateToPosition:transform:opacity:type:](self, "animateToPosition:transform:opacity:type:", &v7, 2, v4, v6, 0.0);
}

- (void)animateToPosition:(CGPoint)a3 transform:(CATransform3D *)a4 opacity:(double)a5 type:(int64_t)a6
{
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  float v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  int64_t v35;
  BOOL v36;
  int64_t v37;
  __CFString *v38;
  double v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  const __CFString *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  double v75;
  char v76;
  double v77;
  double v78;
  _OWORD v79[8];
  _QWORD v80[5];
  __CFString *v81;
  CATransform3D v82;
  CATransform3D v83;
  CATransform3D v84;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  -[CRBoxLayer position](self, "position");
  v14 = v13;
  v16 = v15;
  memset(&v84, 0, sizeof(v84));
  -[CRBoxLayer transform](self, "transform");
  -[CRBoxLayer opacity](self, "opacity");
  v18 = v17;
  -[CRBoxLayer animationKeys](self, "animationKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    -[CRBoxLayer presentationLayer](self, "presentationLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "valueForKeyPath:", CFSTR("position"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "CGPointValue");
    v14 = v23;
    v16 = v24;

    -[CRBoxLayer presentationLayer](self, "presentationLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "valueForKeyPath:", CFSTR("transform"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
      objc_msgSend(v26, "CATransform3DValue");
    else
      memset(&v83, 0, sizeof(v83));
    v84 = v83;

    -[CRBoxLayer presentationLayer](self, "presentationLayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "valueForKeyPath:", CFSTR("opacity"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    v28 = v31;

  }
  else
  {
    v28 = v18;
  }
  -[CRBoxLayer animationForKey:](self, "animationForKey:", CFSTR("CRBoxLayerAnimationReveal"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRBoxLayer animationForKey:](self, "animationForKey:", CFSTR("CRBoxLayerAnimationConceal"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33 != 0;

  if (a6)
    v35 = a6;
  else
    v35 = v34;
  if (v32)
    v36 = a6 == 1;
  else
    v36 = 0;
  if (v36)
    v37 = 0;
  else
    v37 = v35;
  v83 = v84;
  NSStringFromSelector(a2);
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v37 == 2)
  {
    -[CRBoxLayer demoSpeed](self, "demoSpeed");
    v50 = CFSTR("CRBoxLayerAnimationConceal");
    v39 = 0.7 / v51;
    goto LABEL_23;
  }
  if (v37 != 1)
  {
    v39 = 0.25;
    if (v37)
    {
LABEL_24:
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      goto LABEL_25;
    }
    if (!v32)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)animateToPosition_transform_opacity_type__sRevealStart;
      animateToPosition_transform_opacity_type__sRevealStart = v40;

      v42 = *(_OWORD *)&a4->m33;
      *(_OWORD *)&v82.m31 = *(_OWORD *)&a4->m31;
      *(_OWORD *)&v82.m33 = v42;
      v43 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v82.m41 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v82.m43 = v43;
      v44 = *(_OWORD *)&a4->m13;
      *(_OWORD *)&v82.m11 = *(_OWORD *)&a4->m11;
      *(_OWORD *)&v82.m13 = v44;
      v45 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v82.m21 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v82.m23 = v45;
      CATransform3DScale(&v83, &v82, 2.0, 2.0, 1.0);
      v16 = y;
      v14 = x;
    }
    -[CRBoxLayer demoSpeed](self, "demoSpeed");
    v47 = 0.5 / v46;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "timeIntervalSinceDate:", animateToPosition_transform_opacity_type__sRevealStart);
    v39 = v47 - v49;

    v50 = CFSTR("CRBoxLayerAnimationReveal");
LABEL_23:

    v38 = (__CFString *)v50;
    goto LABEL_24;
  }
  v76 = -[CRBoxLayer isHidden](self, "isHidden");
  -[CRBoxLayer demoSpeed](self, "demoSpeed");
  v78 = v77;

  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v38 = CFSTR("CRBoxLayerAnimationMove");
  if ((v76 & 1) != 0)
    goto LABEL_28;
  v39 = 0.25 / v78;
LABEL_25:
  -[CRBoxLayer removeAllAnimations](self, "removeAllAnimations");
  v52 = (void *)MEMORY[0x24BDE57D8];
  v80[0] = MEMORY[0x24BDAC760];
  v80[1] = 3221225472;
  v80[2] = __55__CRBoxLayer_animateToPosition_transform_opacity_type___block_invoke;
  v80[3] = &unk_24C58BDE0;
  v80[4] = self;
  v38 = v38;
  v81 = v38;
  objc_msgSend(v52, "setCompletionBlock:", v80);
  v53 = (void *)MEMORY[0x24BDE57D8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v39);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setValue:forKey:", v54, *MEMORY[0x24BDE5DE8]);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v14, v16);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setFromValue:", v57);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setToValue:", v58);

  objc_msgSend(v55, "addObject:", v56);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v83;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v82);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setFromValue:", v60);

  v61 = *(_OWORD *)&a4->m33;
  *(_OWORD *)&v82.m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&v82.m33 = v61;
  v62 = *(_OWORD *)&a4->m43;
  *(_OWORD *)&v82.m41 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&v82.m43 = v62;
  v63 = *(_OWORD *)&a4->m13;
  *(_OWORD *)&v82.m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&v82.m13 = v63;
  v64 = *(_OWORD *)&a4->m23;
  *(_OWORD *)&v82.m21 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&v82.m23 = v64;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v82);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setToValue:", v65);

  objc_msgSend(v55, "addObject:", v59);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setFromValue:", v67);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setToValue:", v68);

  objc_msgSend(v55, "addObject:", v66);
  if (v37 == 2)
  {
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("hidden"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setValues:", &unk_24C5A5238);
    objc_msgSend(v69, "setKeyTimes:", &unk_24C5A5250);
    objc_msgSend(v69, "setCalculationMode:", CFSTR("discrete"));
    objc_msgSend(v55, "addObject:", v69);

  }
  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setAnimations:", v55);
  objc_msgSend(v70, "setDuration:", v39);
  objc_msgSend(v70, "setTimingFunction:", 0);
  -[CRBoxLayer addAnimation:forKey:](self, "addAnimation:forKey:", v70, v38);

LABEL_28:
  -[CRBoxLayer setPosition:](self, "setPosition:", x, y);
  v71 = *(_OWORD *)&a4->m33;
  v79[4] = *(_OWORD *)&a4->m31;
  v79[5] = v71;
  v72 = *(_OWORD *)&a4->m43;
  v79[6] = *(_OWORD *)&a4->m41;
  v79[7] = v72;
  v73 = *(_OWORD *)&a4->m13;
  v79[0] = *(_OWORD *)&a4->m11;
  v79[1] = v73;
  v74 = *(_OWORD *)&a4->m23;
  v79[2] = *(_OWORD *)&a4->m21;
  v79[3] = v74;
  -[CRBoxLayer setTransform:](self, "setTransform:", v79);
  *(float *)&v75 = a5;
  -[CRBoxLayer setOpacity:](self, "setOpacity:", v75);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

void __55__CRBoxLayer_animateToPosition_transform_opacity_type___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "animationKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "completionBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      v8 = MEMORY[0x24BDAC760];
      v9 = MEMORY[0x24BDAC9B8];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          v12[0] = v8;
          v12[1] = 3221225472;
          v12[2] = __55__CRBoxLayer_animateToPosition_transform_opacity_type___block_invoke_2;
          v12[3] = &unk_24C58BDB8;
          v14 = v11;
          v13 = *(id *)(a1 + 40);
          dispatch_async(v9, v12);

          ++v10;
        }
        while (v6 != v10);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCompletionBlocks:", 0);
  }
}

uint64_t __55__CRBoxLayer_animateToPosition_transform_opacity_type___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setString:(id)a3 mirrored:(BOOL)a4 inverted:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  CATransform3D v21;
  CATransform3D v22;
  CATransform3D v23;
  CATransform3D v24;
  CATransform3D v25;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  *(_OWORD *)&v25.m31 = v9;
  *(_OWORD *)&v25.m33 = v10;
  v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v12 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  *(_OWORD *)&v25.m41 = v11;
  *(_OWORD *)&v25.m43 = v12;
  v13 = *MEMORY[0x24BDE5598];
  v14 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  *(_OWORD *)&v25.m11 = *MEMORY[0x24BDE5598];
  *(_OWORD *)&v25.m13 = v14;
  v15 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v16 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  *(_OWORD *)&v25.m21 = v15;
  *(_OWORD *)&v25.m23 = v16;
  if (v5)
  {
    *(_OWORD *)&v24.m31 = v9;
    *(_OWORD *)&v24.m33 = v10;
    *(_OWORD *)&v24.m41 = v11;
    *(_OWORD *)&v24.m43 = v12;
    *(_OWORD *)&v24.m11 = v13;
    *(_OWORD *)&v24.m13 = v14;
    *(_OWORD *)&v24.m21 = v15;
    *(_OWORD *)&v24.m23 = v16;
    CATransform3DRotate(&v25, &v24, 3.14159265, 0.0, 0.0, 1.0);
  }
  if (v6)
  {
    v23 = v25;
    CATransform3DRotate(&v24, &v23, 3.14159265, 0.0, 1.0, 0.0);
    v25 = v24;
  }
  if (objc_msgSend(v8, "length") == 12)
    v17 = 110.276923;
  else
    v17 = dbl_20CDD3E40[objc_msgSend(v8, "length") == 10];
  -[CRBoxLayer codeLayer](self, "codeLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFontSize:", v17);

  v22 = v25;
  -[CRBoxLayer codeLayer](self, "codeLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v22;
  objc_msgSend(v19, "setTransform:", &v21);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  -[CRBoxLayer codeLayer](self, "codeLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setString:", v8);

}

- (void)animatePulseColor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  __CFString *v22;

  v4 = (void *)MEMORY[0x24BDE57D8];
  v5 = a3;
  objc_msgSend(v4, "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("shadowColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRBoxLayer shadowColor](self, "shadowColor");
  v8 = objc_retainAutorelease(v5);
  v9 = objc_msgSend(v8, "CGColor");
  -[CRBoxLayer demoSpeed](self, "demoSpeed");
  objc_msgSend(v6, "setDuration:", 0.5 / v10);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v9, v7, v9, v7, v9, v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValues:", v11);

  objc_msgSend(v6, "setKeyTimes:", &unk_24C5A5268);
  objc_msgSend(v6, "setCalculationMode:", *MEMORY[0x24BDE5840]);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __32__CRBoxLayer_animatePulseColor___block_invoke;
  v21[3] = &unk_24C58BDE0;
  v21[4] = self;
  v22 = CFSTR("CRBoxLayerAnimationPulseColor");
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v21);
  -[CRBoxLayer addAnimation:forKey:](self, "addAnimation:forKey:", v6, CFSTR("key"));
  -[CRBoxLayer reticleLayer](self, "reticleLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAnimation:forKey:", v6, CFSTR("key"));

  -[CRBoxLayer codeLayer](self, "codeLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAnimation:forKey:", v6, CFSTR("key"));

  v14 = objc_retainAutorelease(v8);
  -[CRBoxLayer setShadowColor:](self, "setShadowColor:", objc_msgSend(v14, "CGColor"));
  v15 = objc_retainAutorelease(v14);
  v16 = objc_msgSend(v15, "CGColor");
  -[CRBoxLayer reticleLayer](self, "reticleLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShadowColor:", v16);

  v18 = objc_retainAutorelease(v15);
  v19 = objc_msgSend(v18, "CGColor");

  -[CRBoxLayer codeLayer](self, "codeLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShadowColor:", v19);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

uint64_t __32__CRBoxLayer_animatePulseColor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "completionBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x24BDAC760];
    v7 = MEMORY[0x24BDAC9B8];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = __32__CRBoxLayer_animatePulseColor___block_invoke_2;
        v11[3] = &unk_24C58BDB8;
        v13 = v9;
        v12 = *(id *)(a1 + 40);
        dispatch_async(v7, v11);

        ++v8;
      }
      while (v4 != v8);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setCompletionBlocks:", 0);
}

uint64_t __32__CRBoxLayer_animatePulseColor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[4];
  id v11;

  v4 = a3;
  -[CRBoxLayer animationKeys](self, "animationKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CRBoxLayer completionBlocks](self, "completionBlocks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRBoxLayer setCompletionBlocks:](self, "setCompletionBlocks:", v7);

    }
    -[CRBoxLayer completionBlocks](self, "completionBlocks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x212B95B6C](v4);
    objc_msgSend(v8, "addObject:", v9);

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__CRBoxLayer_addCompletionBlock___block_invoke;
    block[3] = &unk_24C58BE08;
    v11 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __33__CRBoxLayer_addCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)frameRatio
{
  return self->_frameRatio;
}

- (CAShapeLayer)reticleLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReticleLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CATextLayer)codeLayer
{
  return (CATextLayer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCodeLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableArray)completionBlocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCompletionBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (double)demoSpeed
{
  return self->_demoSpeed;
}

- (void)setDemoSpeed:(double)a3
{
  self->_demoSpeed = a3;
}

- (BOOL)customInit
{
  return self->_customInit;
}

- (void)setCustomInit:(BOOL)a3
{
  self->_customInit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_codeLayer, 0);
  objc_storeStrong((id *)&self->_reticleLayer, 0);
}

@end
