@implementation MRUCAPackageView

- (void)mt_applyVisualStyling:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__MRUCAPackageView_MRUVisualStylingProviderAdditions__mt_applyVisualStyling___block_invoke;
  v3[3] = &unk_1E581A098;
  v3[4] = self;
  objc_msgSend(a3, "applyToView:withColorBlock:", self, v3);
}

uint64_t __77__MRUCAPackageView_MRUVisualStylingProviderAdditions__mt_applyVisualStyling___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTintColor:", a2);
}

- (void)mru_applyVisualStylingWithColor:(id)a3 alpha:(double)a4 blendMode:(int64_t)a5
{
  id v8;

  v8 = a3;
  -[MRUCAPackageView setAlpha:](self, "setAlpha:", a4);
  -[MRUCAPackageView _setDrawsAsBackdropOverlayWithBlendMode:](self, "_setDrawsAsBackdropOverlayWithBlendMode:", a5);
  -[MRUCAPackageView setTintColor:](self, "setTintColor:", v8);

}

- (MRUCAPackageView)initWithFrame:(CGRect)a3
{
  MRUCAPackageView *v3;
  MRUCAPackageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUCAPackageView;
  v3 = -[MRUCAPackageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scale = 1.0;
    -[MRUCAPackageView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double scale;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CALayer *packageLayer;
  CATransform3D v10;
  CATransform3D v11;
  CATransform3D v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MRUCAPackageView;
  -[MRUCAPackageView layoutSubviews](&v13, sel_layoutSubviews);
  -[MRUCAPackageView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  UIRectGetCenter();
  -[CALayer setPosition:](self->_packageLayer, "setPosition:");

  scale = self->_scale;
  v5 = *(_OWORD *)&self->_permanentTransform.m33;
  *(_OWORD *)&v11.m31 = *(_OWORD *)&self->_permanentTransform.m31;
  *(_OWORD *)&v11.m33 = v5;
  v6 = *(_OWORD *)&self->_permanentTransform.m43;
  *(_OWORD *)&v11.m41 = *(_OWORD *)&self->_permanentTransform.m41;
  *(_OWORD *)&v11.m43 = v6;
  v7 = *(_OWORD *)&self->_permanentTransform.m13;
  *(_OWORD *)&v11.m11 = *(_OWORD *)&self->_permanentTransform.m11;
  *(_OWORD *)&v11.m13 = v7;
  v8 = *(_OWORD *)&self->_permanentTransform.m23;
  *(_OWORD *)&v11.m21 = *(_OWORD *)&self->_permanentTransform.m21;
  *(_OWORD *)&v11.m23 = v8;
  CATransform3DScale(&v12, &v11, scale, scale, 1.0);
  packageLayer = self->_packageLayer;
  v10 = v12;
  -[CALayer setTransform:](packageLayer, "setTransform:", &v10);
  -[MRUCAPackageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)intrinsicContentSize
{
  CALayer *packageLayer;
  void *v4;
  float v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  packageLayer = self->_packageLayer;
  if (packageLayer)
  {
    -[CALayer valueForKeyPath:](packageLayer, "valueForKeyPath:", CFSTR("transform.scale.x"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    v6 = v5;

    -[CALayer valueForKeyPath:](self->_packageLayer, "valueForKeyPath:", CFSTR("transform.scale.y"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    -[CALayer size](self->_packageLayer, "size");
    v11 = v10 * v6;
    -[CALayer size](self->_packageLayer, "size");
    v13 = v12 * v9;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v14 = v11;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)setAsset:(id)a3
{
  MRUCAPackageAsset *v4;
  MRUCAPackageAsset *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  MRUCAPackageAsset *asset;
  MRUCAPackageAsset *v11;
  void *v12;
  _OWORD v13[8];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v4 = (MRUCAPackageAsset *)a3;
  v5 = v4;
  if (v4)
  {
    -[MRUCAPackageAsset permanentTransform](v4, "permanentTransform");
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
  }
  v13[4] = v18;
  v13[5] = v19;
  v13[6] = v20;
  v13[7] = v21;
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  v13[3] = v17;
  -[MRUCAPackageView setPermanentTransform:](self, "setPermanentTransform:", v13);
  -[MRUCAPackageAsset packageName](v5, "packageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUCAPackageAsset packageName](self->_asset, "packageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    -[MRUCAPackageAsset package](v5, "package");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUCAPackageView setPackage:](self, "setPackage:", v9);

  }
  asset = self->_asset;
  self->_asset = v5;
  v11 = v5;

  -[MRUCAPackageAsset glyphState](v11, "glyphState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUCAPackageView setGlyphState:](self, "setGlyphState:", v12);
  -[MRUCAPackageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setGlyphState:(id)a3
{
  NSString *v4;
  float v5;
  NSString *glyphState;
  NSString *v7;
  double v8;
  id v9;

  v4 = (NSString *)a3;
  v5 = 0.0;
  if (!-[NSString isEqualToString:](self->_glyphState, "isEqualToString:", v4))
  {
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"))
      v5 = 1.0;
    else
      v5 = 0.0;
  }
  glyphState = self->_glyphState;
  self->_glyphState = v4;
  v7 = v4;

  -[CALayer stateWithName:](self->_packageLayer, "stateWithName:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = v5;
  -[CAStateController setState:ofLayer:transitionSpeed:](self->_stateController, "setState:ofLayer:transitionSpeed:", v9, self->_packageLayer, v8);

}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[MRUCAPackageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPermanentTransform:(CATransform3D *)a3
{
  CATransform3D *p_permanentTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CATransform3D v20;
  CATransform3D a;

  p_permanentTransform = &self->_permanentTransform;
  v6 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&a.m31 = *(_OWORD *)&a3->m31;
  *(_OWORD *)&a.m33 = v6;
  v7 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&a.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&a.m43 = v7;
  v8 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&a3->m11;
  *(_OWORD *)&a.m13 = v8;
  v9 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&a.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&a.m23 = v9;
  v10 = *(_OWORD *)&self->_permanentTransform.m33;
  *(_OWORD *)&v20.m31 = *(_OWORD *)&self->_permanentTransform.m31;
  *(_OWORD *)&v20.m33 = v10;
  v11 = *(_OWORD *)&self->_permanentTransform.m43;
  *(_OWORD *)&v20.m41 = *(_OWORD *)&self->_permanentTransform.m41;
  *(_OWORD *)&v20.m43 = v11;
  v12 = *(_OWORD *)&self->_permanentTransform.m13;
  *(_OWORD *)&v20.m11 = *(_OWORD *)&self->_permanentTransform.m11;
  *(_OWORD *)&v20.m13 = v12;
  v13 = *(_OWORD *)&self->_permanentTransform.m23;
  *(_OWORD *)&v20.m21 = *(_OWORD *)&self->_permanentTransform.m21;
  *(_OWORD *)&v20.m23 = v13;
  if (!CATransform3DEqualToTransform(&a, &v20))
  {
    v14 = *(_OWORD *)&a3->m11;
    v15 = *(_OWORD *)&a3->m13;
    v16 = *(_OWORD *)&a3->m23;
    *(_OWORD *)&p_permanentTransform->m21 = *(_OWORD *)&a3->m21;
    *(_OWORD *)&p_permanentTransform->m23 = v16;
    *(_OWORD *)&p_permanentTransform->m11 = v14;
    *(_OWORD *)&p_permanentTransform->m13 = v15;
    v17 = *(_OWORD *)&a3->m31;
    v18 = *(_OWORD *)&a3->m33;
    v19 = *(_OWORD *)&a3->m43;
    *(_OWORD *)&p_permanentTransform->m41 = *(_OWORD *)&a3->m41;
    *(_OWORD *)&p_permanentTransform->m43 = v19;
    *(_OWORD *)&p_permanentTransform->m31 = v17;
    *(_OWORD *)&p_permanentTransform->m33 = v18;
    -[MRUCAPackageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTintColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUCAPackageView;
  -[MRUCAPackageView setTintColor:](&v4, sel_setTintColor_, a3);
  -[MRUCAPackageView updateFilter](self, "updateFilter");
}

- (void)clear
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];

  -[MRUCAPackageView setAsset:](self, "setAsset:", 0);
  -[MRUCAPackageView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v7[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v7[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v7[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v7[7] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v7[0] = *MEMORY[0x1E0CD2610];
  v7[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v7[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v7[3] = v6;
  -[MRUCAPackageView setPermanentTransform:](self, "setPermanentTransform:", v7);
  -[MRUCAPackageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setPackage:(id)a3
{
  id v5;
  CALayer *v6;
  void *v7;
  CALayer *packageLayer;
  CALayer *v9;
  CAStateController *v10;
  CAStateController *stateController;

  objc_storeStrong((id *)&self->_package, a3);
  v5 = a3;
  -[CALayer removeFromSuperlayer](self->_packageLayer, "removeFromSuperlayer");
  objc_msgSend(v5, "rootLayer");
  v6 = (CALayer *)objc_claimAutoreleasedReturnValue();
  -[CALayer setGeometryFlipped:](v6, "setGeometryFlipped:", objc_msgSend(v5, "isGeometryFlipped"));
  -[MRUCAPackageView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", v6);

  -[CALayer bounds](v6, "bounds");
  -[MRUCAPackageView setBounds:](self, "setBounds:");
  packageLayer = self->_packageLayer;
  self->_packageLayer = v6;
  v9 = v6;

  v10 = (CAStateController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2868]), "initWithLayer:", v9);
  stateController = self->_stateController;
  self->_stateController = v10;

  -[MRUCAPackageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateFilter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[MRUCAPackageView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("filters.colorFilter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", CFSTR("colorFilter"));
    objc_msgSend(v5, "setValue:forKey:", &unk_1E5878250, *MEMORY[0x1E0CD2CE8]);
    objc_msgSend(v5, "setValue:forKey:", &unk_1E5878268, *MEMORY[0x1E0CD2CB8]);
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUCAPackageView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v6);

  }
  -[MRUCAPackageView tintColor](self, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUCAPackageView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolvedColorWithTraitCollection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUCAPackageView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v12 = objc_msgSend(objc_retainAutorelease(v10), "CGColor");
  else
    v12 = 0;
  objc_msgSend(v11, "setValue:forKeyPath:", v12, CFSTR("filters.colorFilter.inputColor"));

}

- (NSString)packageName
{
  void *v2;
  void *v3;

  -[MRUCAPackageView asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "packageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (MRUCAPackageAsset)asset
{
  return self->_asset;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (double)scale
{
  return self->_scale;
}

- (CAStateController)stateController
{
  return self->_stateController;
}

- (void)setStateController:(id)a3
{
  objc_storeStrong((id *)&self->_stateController, a3);
}

- (CAPackage)package
{
  return self->_package;
}

- (CALayer)packageLayer
{
  return self->_packageLayer;
}

- (void)setPackageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_packageLayer, a3);
}

- (CATransform3D)permanentTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[4].m21;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[4].m13;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[4].m31;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[4].m23;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[3].m41;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[3].m33;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[4].m11;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[3].m43;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageLayer, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
