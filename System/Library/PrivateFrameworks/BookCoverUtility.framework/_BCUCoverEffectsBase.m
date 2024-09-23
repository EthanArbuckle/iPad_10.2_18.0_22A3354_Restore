@implementation _BCUCoverEffectsBase

- (_BCUCoverEffectsBase)initWithIdentifier:(id)a3 renderer:(id)a4 assets:(id)a5 shadow:(id)a6 seriesShadow:(id)a7 shadowOnly:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](self, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", a3, a4, a5, a6, a7, a8, v9);
}

- (_BCUCoverEffectsBase)initWithIdentifier:(id)a3 renderer:(id)a4 assets:(id)a5 shadow:(id)a6 seriesShadow:(id)a7 shadowOnly:(BOOL)a8 restricted:(BOOL)a9
{
  _BOOL4 v9;
  id v16;
  id v17;
  id v18;
  _BCUCoverEffectsBase *v19;
  _BCUCoverEffectsBase *v20;
  id v22;
  id v23;
  objc_super v24;

  v9 = a8;
  v16 = a3;
  v17 = a4;
  v23 = a5;
  v18 = a6;
  v22 = a7;
  if (!v18 && v9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    sub_2285843EC();
  v24.receiver = self;
  v24.super_class = (Class)_BCUCoverEffectsBase;
  v19 = -[_BCUCoverEffectsBase init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_renderer, a4);
    objc_storeStrong((id *)&v20->_assets, a5);
    objc_storeStrong((id *)&v20->_shadow, a6);
    objc_storeStrong((id *)&v20->_seriesShadow, a7);
    v20->_shadowOnly = v9;
    v20->_restricted = a9;
  }

  return v20;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)includeBinding
{
  return 0;
}

- (double)cornerRadius
{
  return 0.0;
}

- (double)tintBlurRadius
{
  return 0.0;
}

- (double)_assetsScale
{
  return 3.0;
}

- (id)shadowLayerWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5 kind:(unint64_t)a6
{
  _BCUCoverEffectsShadow *shadow;

  shadow = self->_shadow;
  if (!shadow)
    return 0;
  if (a6 == 2)
  {
    a6 = 0;
    goto LABEL_9;
  }
  if (a6 == 1)
  {
    shadow = self->_seriesShadow;
    goto LABEL_9;
  }
  if (a6)
    return 0;
  a6 = 1;
LABEL_9:
  -[_BCUCoverEffectsBase _shadowLayerWithImage:size:tint:shadow:](self, "_shadowLayerWithImage:size:tint:shadow:", a3, a6, shadow, a4.width, a4.height, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)coverLayerWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5
{
  if (self->_shadowOnly)
    return 0;
  -[_BCUCoverEffectsBase _coverLayerWithImage:size:scale:](self, "_coverLayerWithImage:size:scale:", a3, a4.width, a4.height, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_shadowLayerWithImage:(CGImage *)a3 size:(CGSize)a4 tint:(BOOL)a5 shadow:(id)a6
{
  _BOOL4 v6;
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double MidX;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  void *v56;
  void *v57;
  _QWORD v58[3];
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v6 = a5;
  height = a4.height;
  width = a4.width;
  v58[1] = *MEMORY[0x24BDAC8D0];
  v11 = a6;
  objc_msgSend(v11, "roundedInsetsWithSize:", width, height);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setContents:", objc_msgSend(v11, "image"));
  objc_msgSend(v11, "contentsCenter");
  objc_msgSend(v12, "setContentsCenter:");
  objc_msgSend(v12, "setContentsGravity:", *MEMORY[0x24BDE5C88]);
  objc_msgSend(v11, "blendMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDE56B0];
    objc_msgSend(v11, "blendMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filterWithType:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCompositingFilter:", v16);

  }
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setHidden:", 1);
  v58[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSublayers:", v18);

  -[_BCUCoverEffectsBase tintBlurRadius](self, "tintBlurRadius");
  if (v6)
  {
    v20 = v19;
    if (v19 > 0.0)
    {
      objc_msgSend(v17, "setHidden:", 0);
      objc_msgSend(v17, "setContents:", a3);
      objc_msgSend(v17, "setShouldRasterize:", 1);
      objc_msgSend(v17, "setRasterizationScale:", 1.0);
      v21 = objc_alloc(MEMORY[0x24BDE56B0]);
      v22 = (void *)objc_msgSend(v21, "initWithType:", *MEMORY[0x24BDE5A78]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20 / (width / 15.0));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setValue:forKey:", v23, *MEMORY[0x24BDBF978]);

      v57 = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFilters:", v24);

      objc_msgSend(v17, "setCompositingFilter:", *MEMORY[0x24BDE5BF8]);
    }
  }
  objc_msgSend(v11, "insets");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  objc_msgSend(v11, "size");
  v34 = v33 - v28 - v32;
  v35 = 1.0;
  v36 = 1.0;
  if (width > 0.0)
    v36 = v30 + v26 + height * v34 / width;
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v33, v36);
  memset(&v55, 0, sizeof(v55));
  CGAffineTransformMakeScale(&v55, width / v34, width / v34);
  v54 = v55;
  objc_msgSend(v12, "setAffineTransform:", &v54);
  LODWORD(v37) = *(_DWORD *)"333?";
  objc_msgSend(v12, "setOpacity:", v37);
  if (height > 0.0)
    v35 = (v36 - v26 - v30) / height;
  v38 = 1.0;
  v39 = 15.0;
  if (width > 0.0)
  {
    v38 = v34 / width;
    v39 = height / width * 15.0;
  }
  objc_msgSend(v17, "setBounds:", 0.0, 0.0, 15.0, v39);
  CGAffineTransformMakeScale(&v53, width / 15.0 * v38, width / 15.0 * v35);
  v52 = v53;
  objc_msgSend(v17, "setAffineTransform:", &v52);
  objc_msgSend(v17, "setPosition:", v28 + width * v38 * 0.5, v26 + height * v35 * 0.5);
  objc_msgSend(v17, "bounds");
  MidX = CGRectGetMidX(v59);
  objc_msgSend(v17, "bounds");
  objc_msgSend(v17, "convertPoint:toLayer:", v12, MidX, CGRectGetMidY(v60));
  v42 = v41;
  v44 = v43;
  objc_msgSend(v12, "bounds");
  v46 = v42 / v45;
  objc_msgSend(v12, "bounds");
  objc_msgSend(v12, "setAnchorPoint:", v46, v44 / v47);
  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setSublayers:", v49);

  objc_msgSend(v48, "setBounds:", 0.0, 0.0, width, height);
  v61.origin.x = 0.0;
  v61.origin.y = 0.0;
  v61.size.width = width;
  v61.size.height = height;
  v50 = CGRectGetMidX(v61);
  v62.origin.x = 0.0;
  v62.origin.y = 0.0;
  v62.size.width = width;
  v62.size.height = height;
  objc_msgSend(v12, "setPosition:", v50, CGRectGetMidY(v62));

  return v48;
}

- (id)_layerWithImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5 shadow:(id)a6
{
  double height;
  double width;
  id v11;
  double v12;
  double v13;
  _BCUCoverEffectsShadow *shadow;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double MidX;
  void *v26;
  CGRect v28;
  CGRect v29;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  objc_msgSend(v11, "roundedInsetsWithSize:", width, height);
  shadow = self->_shadow;
  v16 = width + v13 + v15;
  v18 = height + v12 + v17;
  if (shadow)
    v19 = v18;
  else
    v19 = height;
  if (shadow)
    v20 = v16;
  else
    v20 = width;
  if (shadow)
    v21 = v12;
  else
    v21 = 0.0;
  if (shadow)
    v22 = v13;
  else
    v22 = 0.0;
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setRasterizationScale:", a5);
  objc_msgSend(v23, "setFrame:", 0.0, 0.0, v20, v19);
  if (self->_shadow)
  {
    -[_BCUCoverEffectsBase _shadowLayerWithImage:size:tint:shadow:](self, "_shadowLayerWithImage:size:tint:shadow:", a3, !self->_shadowOnly, v11, width, height);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28.origin.x = v22;
    v28.origin.y = v21;
    v28.size.width = width;
    v28.size.height = height;
    MidX = CGRectGetMidX(v28);
    v29.origin.x = v22;
    v29.origin.y = v21;
    v29.size.width = width;
    v29.size.height = height;
    objc_msgSend(v24, "setPosition:", MidX, CGRectGetMidY(v29));
    objc_msgSend(v23, "addSublayer:", v24);

  }
  if (!self->_shadowOnly)
  {
    -[_BCUCoverEffectsBase _coverLayerWithImage:size:scale:](self, "_coverLayerWithImage:size:scale:", a3, width, height, a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v22, v21, width, height);
    objc_msgSend(v23, "addSublayer:", v26);

  }
  return v23;
}

- (id)_coverLayerWithImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  void *v9;
  void *v10;
  CGImage *v11;
  CGImage *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  height = a4.height;
  width = a4.width;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  if (self->_restricted)
  {
    v11 = +[BCUCoverEffects restrictedImageFrom:size:](BCUCoverEffects, "restrictedImageFrom:size:", a3, width, height);
    if (!v11)
      goto LABEL_6;
    v12 = v11;
    v13 = v9;
  }
  else
  {
    v13 = v9;
    v12 = a3;
  }
  objc_msgSend(v13, "setContents:", v12);
LABEL_6:
  -[_BCUCoverEffectsBase cornerRadius](self, "cornerRadius");
  objc_msgSend(v9, "setCornerRadius:");
  objc_msgSend(v9, "setMasksToBounds:", 1);
  v14 = *MEMORY[0x24BDE5C20];
  objc_msgSend(v9, "setMinificationFilter:", *MEMORY[0x24BDE5C20]);
  objc_msgSend(v9, "setMagnificationFilter:", v14);
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, width, height);
  objc_msgSend(v10, "setContents:", -[_BCUCoverEffectsAssets edges](self->_assets, "edges"));
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, width, height);
  objc_msgSend(v10, "setContentsCenter:", 0.25, 0.25, 0.5, 0.5);
  -[_BCUCoverEffectsBase _assetsScale](self, "_assetsScale");
  objc_msgSend(v10, "setContentsScale:");
  if (-[_BCUCoverEffectsAssets overlayColor](self->_assets, "overlayColor"))
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", -[_BCUCoverEffectsAssets overlayColor](self->_assets, "overlayColor"));
    objc_msgSend(v15, "setFrame:", 0.0, 0.0, width, height);
    -[_BCUCoverEffectsBase cornerRadius](self, "cornerRadius");
    objc_msgSend(v15, "setCornerRadius:");
  }
  else
  {
    v15 = 0;
  }
  if (!-[_BCUCoverEffectsBase includeBinding](self, "includeBinding"))
  {
    v19 = 0;
    v17 = 0;
    v16 = 0;
    if (!v15)
      goto LABEL_14;
    goto LABEL_13;
  }
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setContents:", -[_BCUCoverEffectsAssets spineNormalBlend](self->_assets, "spineNormalBlend"));
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, width, height);
  -[_BCUCoverEffectsBase _assetsScale](self, "_assetsScale");
  objc_msgSend(v16, "setContentsScale:");
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setContents:", -[_BCUCoverEffectsAssets spineSoftLightBlend](self->_assets, "spineSoftLightBlend"));
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BF0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCompositingFilter:", v18);

  objc_msgSend(v17, "setFrame:", 0.0, 0.0, width, height);
  -[_BCUCoverEffectsBase _assetsScale](self, "_assetsScale");
  objc_msgSend(v17, "setContentsScale:");
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setContents:", -[_BCUCoverEffectsAssets spineLinearBurnBlend](self->_assets, "spineLinearBurnBlend"));
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5B60]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCompositingFilter:", v20);

  objc_msgSend(v19, "setFrame:", 0.0, 0.0, width, height);
  -[_BCUCoverEffectsBase _assetsScale](self, "_assetsScale");
  objc_msgSend(v19, "setContentsScale:");
  if (v15)
LABEL_13:
    objc_msgSend(v9, "addSublayer:", v15);
LABEL_14:
  if (v16)
    objc_msgSend(v9, "addSublayer:", v16);
  if (v17)
    objc_msgSend(v9, "addSublayer:", v17);
  if (v19)
    objc_msgSend(v9, "addSublayer:", v19);
  if (v10)
    objc_msgSend(v9, "addSublayer:", v10);

  return v9;
}

- (BOOL)supportsOptions
{
  return 0;
}

- (UIEdgeInsets)insetsForSize:(CGSize)a3 contentsScale:(double)a4 options:(id)a5
{
  _BCUCoverEffectsShadow *shadow;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  shadow = self->_shadow;
  if (shadow)
  {
    -[_BCUCoverEffectsShadow roundedInsetsWithSize:](shadow, "roundedInsetsWithSize:", a5, a3.width, a3.height, a4);
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
  }
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (id)newOperationWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5 priority:(float)a6 options:(id)a7 waitForCPUSynchronization:(BOOL)a8 logKey:(id)a9 completion:(id)a10
{
  _BOOL8 v11;
  double height;
  double width;
  id v18;
  id v19;
  void *v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  BCULayerRenderer *renderer;
  double v25;
  id v26;
  _QWORD v28[5];
  id v29;
  double v30;
  uint64_t v31;
  CGImage *v32;
  _QWORD v33[9];

  v11 = a8;
  height = a4.height;
  width = a4.width;
  v18 = a9;
  v19 = a10;
  v20 = v19;
  if (a3)
  {
    v21 = sub_228580F84(a3, width, height, a5);
    v23 = v22;
    CGImageRetain(a3);
    renderer = self->_renderer;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = sub_228581028;
    v33[3] = &unk_24F113F08;
    v33[4] = self;
    v33[5] = a3;
    *(double *)&v33[6] = v21;
    v33[7] = v23;
    *(double *)&v33[8] = a5;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = sub_228581040;
    v28[3] = &unk_24F113F30;
    v28[4] = self;
    v30 = v21;
    v31 = v23;
    v29 = v20;
    v32 = a3;
    *(float *)&v25 = a6;
    v26 = -[BCULayerRenderer newOperationWithPriority:waitForCPUSynchronization:logKey:renderLayer:completion:](renderer, "newOperationWithPriority:waitForCPUSynchronization:logKey:renderLayer:completion:", v11, v18, v33, v28, v25);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, double, double, double, double))v19 + 2))(v19, 0, 0, 0, 0.0, 0.0, 0.0, 0.0);
    v26 = 0;
  }

  return v26;
}

- (BCULayerRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_seriesShadow, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

@end
