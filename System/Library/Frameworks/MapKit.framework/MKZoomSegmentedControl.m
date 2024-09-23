@implementation MKZoomSegmentedControl

- (MKZoomSegmentedControl)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  MKZoomSegmentedControl *v5;
  MKZoomSegmentedControl *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CABackdropLayer *blurLayer;
  void *v13;
  uint64_t v14;
  CALayer *maskLayer;
  uint64_t v16;
  CALayer *displayLayer;
  void *v18;
  id v19;
  objc_super v21;
  _QWORD v22[2];

  height = a3.size.height;
  width = a3.size.width;
  v22[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)MKZoomSegmentedControl;
  v5 = -[MKZoomSegmentedControl initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    -[MKZoomSegmentedControl setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 1);
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[MKZoomSegmentedControl layer](v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", &unk_1E2158580, CFSTR("inputRadius"));
    objc_msgSend(v10, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
    objc_msgSend(MEMORY[0x1E0CD2708], "layer");
    v11 = objc_claimAutoreleasedReturnValue();
    blurLayer = v6->_blurLayer;
    v6->_blurLayer = (CABackdropLayer *)v11;

    v22[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABackdropLayer setFilters:](v6->_blurLayer, "setFilters:", v13);

    -[CABackdropLayer setFrame:](v6->_blurLayer, "setFrame:", v7, v8, width, height);
    objc_msgSend(v9, "addSublayer:", v6->_blurLayer);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v14 = objc_claimAutoreleasedReturnValue();
    maskLayer = v6->_maskLayer;
    v6->_maskLayer = (CALayer *)v14;

    -[CALayer setFrame:](v6->_maskLayer, "setFrame:", v7, v8, width, height);
    -[CABackdropLayer setMask:](v6->_blurLayer, "setMask:", v6->_maskLayer);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v16 = objc_claimAutoreleasedReturnValue();
    displayLayer = v6->_displayLayer;
    v6->_displayLayer = (CALayer *)v16;

    -[CALayer setFrame:](v6->_displayLayer, "setFrame:", v7, v8, width, height);
    objc_msgSend(v9, "addSublayer:", v6->_displayLayer);
    objc_msgSend(MEMORY[0x1E0CEAB40], "systemTraitsAffectingImageLookup");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)-[MKZoomSegmentedControl registerForTraitChanges:withAction:](v6, "registerForTraitChanges:withAction:", v18, sel_traitEnvironment_didChangeTraitCollection_);

    -[MKZoomSegmentedControl updateAppearance](v6, "updateAppearance");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[MKZoomSegmentedControl _unloadResources](self, "_unloadResources");
  v3.receiver = self;
  v3.super_class = (Class)MKZoomSegmentedControl;
  -[MKZoomSegmentedControl dealloc](&v3, sel_dealloc);
}

- (void)_unloadResources
{
  -[CALayer setContents:](self->_displayLayer, "setContents:", 0);
  -[CALayer setContents:](self->_maskLayer, "setContents:", 0);
  CGImageRelease(self->_backgroundUnselectedImage);
  CGImageRelease(self->_backgroundMinusSelectedImage);
  CGImageRelease(self->_backgroundPlusSelectedImage);
  CGImageRelease(self->_maskImage);
}

- (void)updateAppearance
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  -[MKZoomSegmentedControl traitCollection](self, "traitCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKZoomSegmentedControl _unloadResources](self, "_unloadResources");
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("zoomControl"), v3, v8);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  self->_backgroundUnselectedImage = CGImageRetain((CGImageRef)objc_msgSend(v4, "CGImage"));

  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("zoomControlMinus"), v3, v8);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  self->_backgroundMinusSelectedImage = CGImageRetain((CGImageRef)objc_msgSend(v5, "CGImage"));

  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("zoomControlPlus"), v3, v8);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  self->_backgroundPlusSelectedImage = CGImageRetain((CGImageRef)objc_msgSend(v6, "CGImage"));

  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("zoomControlDarkMask"), v3, v8);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  self->_maskImage = CGImageRetain((CGImageRef)objc_msgSend(v7, "CGImage"));

  -[CABackdropLayer setHidden:](self->_blurLayer, "setHidden:", objc_msgSend(v8, "userInterfaceStyle") != 2);
  -[CALayer setContents:](self->_maskLayer, "setContents:", self->_maskImage);
  -[CALayer setContents:](self->_displayLayer, "setContents:", self->_backgroundUnselectedImage);

}

- (void)minusPressed:(id)a3
{
  -[CALayer setContents:](self->_displayLayer, "setContents:", self->_backgroundMinusSelectedImage);
}

- (void)plusPressed:(id)a3
{
  -[CALayer setContents:](self->_displayLayer, "setContents:", self->_backgroundPlusSelectedImage);
}

- (void)touchEnded:(id)a3
{
  -[CALayer setContents:](self->_displayLayer, "setContents:", self->_backgroundUnselectedImage);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_blurLayer, 0);
  objc_storeStrong((id *)&self->_displayLayer, 0);
}

@end
