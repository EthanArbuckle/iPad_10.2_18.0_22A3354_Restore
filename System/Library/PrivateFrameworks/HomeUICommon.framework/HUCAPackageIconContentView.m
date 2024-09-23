@implementation HUCAPackageIconContentView

HUCAPackageLayer *__58__HUCAPackageIconContentView__updateWithPackage_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  HUCAPackageLayer *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "package");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publishedObjectWithName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
    v9 = -[HUCAPackageLayer initWithName:layer:]([HUCAPackageLayer alloc], "initWithName:layer:", v3, v8);
  else
    v9 = 0;

  return v9;
}

void __45__HUCAPackageIconContentView__applyModifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "iconModifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyModifiers:", v4);

}

- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5
{
  id v5;

  -[HUCAPackageIconContentView rootLayer](self, "rootLayer", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldRasterize:", 0);

}

- (void)_updateWithPackage:(id)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[5];

  v36 = a3;
  -[HUIconContentView iconDescriptor](self, "iconDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HUCAPackageIconManager sharedInstance](HUCAPackageIconManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconContentView iconDescriptor](self, "iconDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tryReclaimPackage:forIconDescriptor:", v36, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUCAPackageIconContentView setRenouncedPackageDescriptor:](self, "setRenouncedPackageDescriptor:", 0);
    objc_opt_class();
    objc_msgSend(v9, "publishedObjectWithName:", CFSTR("Icon"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (!v12)
      NSLog(CFSTR("Failed to identify Icon layer for package: %@!"), v9);
    objc_opt_class();
    objc_msgSend(v9, "publishedObjectWithName:", CFSTR("IconNoMargin"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      objc_msgSend(v15, "size");
      -[HUCAPackageIconContentView setAssetNoMarginSize:](self, "setAssetNoMarginSize:");
    }
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    if (!a4)
    {
      objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.0);
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    }
    -[HUCAPackageIconContentView rootLayer](self, "rootLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "superlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCAPackageIconContentView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 == v18)
    {
      -[HUCAPackageIconContentView rootLayer](self, "rootLayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeFromSuperlayer");

    }
    -[HUCAPackageIconContentView setPackage:](self, "setPackage:", v9);
    -[HUCAPackageIconContentView stateController](self, "stateController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", 0);

    -[HUCAPackageIconContentView package](self, "package");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rootLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCAPackageIconContentView setRootLayer:](self, "setRootLayer:", v22);

    -[HUCAPackageIconContentView traitCollection](self, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "displayScale");
    v25 = v24;
    -[HUCAPackageIconContentView rootLayer](self, "rootLayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setRasterizationScale:", v25);

    v27 = objc_alloc(MEMORY[0x24BDE5788]);
    -[HUCAPackageIconContentView rootLayer](self, "rootLayer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initWithLayer:", v28);
    -[HUCAPackageIconContentView setStateController:](self, "setStateController:", v29);

    -[HUCAPackageIconContentView stateController](self, "stateController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDelegate:", self);

    if (!v12)
    {
      -[HUCAPackageIconContentView rootLayer](self, "rootLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "size");
    -[HUCAPackageIconContentView setAssetSize:](self, "setAssetSize:");
    if (!v12)

    -[HUCAPackageIconContentView package](self, "package");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "publishedObjectNames");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __58__HUCAPackageIconContentView__updateWithPackage_animated___block_invoke;
    v37[3] = &unk_250F49F40;
    v37[4] = self;
    objc_msgSend(v32, "na_map:", v37);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCAPackageIconContentView setPackageLayers:](self, "setPackageLayers:", v33);

    -[HUCAPackageIconContentView layer](self, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCAPackageIconContentView rootLayer](self, "rootLayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSublayer:", v35);

    -[HUCAPackageIconContentView layoutRootLayer](self, "layoutRootLayer");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  }
}

- (void)setState:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HUCAPackageIconContentView stateController](self, "stateController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCAPackageIconContentView rootLayer](self, "rootLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stateOfLayer:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCAPackageIconContentView stateController](self, "stateController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stateWithName:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE4CE08]) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE4CE28]))
    {
      -[HUCAPackageIconContentView stateController](self, "stateController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stateWithName:", *MEMORY[0x24BE4CE10]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_12;
      -[HUCAPackageIconContentView stateController](self, "stateController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = (_QWORD *)MEMORY[0x24BE4CE20];
      goto LABEL_8;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE4CE00]))
    {
      -[HUCAPackageIconContentView stateController](self, "stateController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = (_QWORD *)MEMORY[0x24BE4CDF8];
LABEL_8:
      objc_msgSend(v16, "stateWithName:", *v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[HUIconContentView iconDescriptor](self, "iconDescriptor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v6;
      v27 = 2112;
      v28 = v24;
      _os_log_error_impl(&dword_23EB80000, v19, OS_LOG_TYPE_ERROR, "Failed to identify state named: %@ for iconDescriptor: %@", (uint8_t *)&v25, 0x16u);

    }
    v12 = 0;
  }
LABEL_12:
  if ((objc_msgSend(v12, "isEqual:", v9) & 1) == 0)
  {
    if (v4 && objc_msgSend((id)objc_opt_class(), "_isAnimationEnabled"))
    {
      -[HUCAPackageIconContentView stateController](self, "stateController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCAPackageIconContentView rootLayer](self, "rootLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = 1.0;
      objc_msgSend(v20, "setState:ofLayer:transitionSpeed:", v12, v21, v22);
    }
    else
    {
      -[HUCAPackageIconContentView stateController](self, "stateController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCAPackageIconContentView rootLayer](self, "rootLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setState:ofLayer:", v12, v21);
    }

  }
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (CAStateController)stateController
{
  return self->_stateController;
}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  objc_super v29;

  v5 = a5;
  v8 = a3;
  -[HUIconContentView iconDescriptor](self, "iconDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  v29.receiver = self;
  v29.super_class = (Class)HUCAPackageIconContentView;
  -[HUIconContentView updateWithIconDescriptor:displayStyle:animated:](&v29, sel_updateWithIconDescriptor_displayStyle_animated_, v8, a4, v5);
  objc_opt_class();
  v13 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    v16 = v9;
    v26 = a4;
    v17 = v5;
    objc_msgSend(v13, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCAPackageIconContentView renouncedPackageDescriptor](self, "renouncedPackageDescriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "isEqualToString:", v20);

    if (!v12 || v21)
    {
      v9 = v16;
      -[HUCAPackageIconContentView _tryRenouncePackageForIconDescriptor:](self, "_tryRenouncePackageForIconDescriptor:", v16);
      v22 = v26;
      if (v21)
      {
        -[HUCAPackageIconContentView package](self, "package");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
      -[HUCAPackageIconContentView _updateWithPackage:animated:](self, "_updateWithPackage:animated:", v23, objc_msgSend(MEMORY[0x24BE4D040], "iconDescriptorShouldAlwaysAnimate:", v15));
      if (v21)

      if (v9)
        v17 = objc_msgSend(MEMORY[0x24BE4D040], "iconDescriptorShouldAlwaysAnimate:", v15);
    }
    else
    {
      v22 = v26;
      v9 = v16;
    }
    objc_msgSend(v15, "state");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 == 2)
    {
      HFVibrantStateForHFCAPackageState();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCAPackageIconContentView setStateName:](self, "setStateName:", v25);

    }
    else
    {
      -[HUCAPackageIconContentView setStateName:](self, "setStateName:", v24);
    }

    -[HUCAPackageIconContentView _updateStateAnimated:](self, "_updateStateAnimated:", v17);
    CGAffineTransformMakeScale(&v28, 1.0, 1.0);
    v27 = v28;
    -[HUCAPackageIconContentView setTransform:](self, "setTransform:", &v27);
    -[HUCAPackageIconContentView _applyModifiers](self, "_applyModifiers");
  }
  else
  {
    NSLog(CFSTR("No CA Package descriptor"));
  }

}

- (void)setUseAssetMarginSize:(BOOL)a3
{
  self->_useAssetMarginSize = a3;
}

- (void)setStateName:(id)a3
{
  objc_storeStrong((id *)&self->_stateName, a3);
}

- (HFIconDescriptor)renouncedPackageDescriptor
{
  return self->_renouncedPackageDescriptor;
}

- (void)_updateStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[HUCAPackageIconContentView stateName](self, "stateName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCAPackageIconContentView setState:animated:](self, "setState:animated:", v5, v3);

}

- (NSString)stateName
{
  return self->_stateName;
}

- (void)_applyModifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_opt_class();
  -[HUIconContentView iconDescriptor](self, "iconDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v6 = v4;

  if (v6)
  {
    -[HUCAPackageIconContentView packageLayers](self, "packageLayers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __45__HUCAPackageIconContentView__applyModifiers__block_invoke;
    v7[3] = &unk_250F49FB8;
    v8 = v6;
    objc_msgSend(v5, "na_each:", v7);

  }
}

- (NSArray)packageLayers
{
  return self->_packageLayers;
}

- (CAPackage)package
{
  return self->_package;
}

- (void)layoutRootLayer
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  void *v20;
  void *v21;
  CATransform3D v22;
  CATransform3D v23;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.0);
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[HUCAPackageIconContentView assetSize](self, "assetSize");
  v4 = v3;
  v6 = v5;
  if (-[HUCAPackageIconContentView useAssetMarginSize](self, "useAssetMarginSize"))
  {
    -[HUCAPackageIconContentView assetNoMarginSize](self, "assetNoMarginSize");
    if (v8 != *MEMORY[0x24BDBF148] || v7 != *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      -[HUCAPackageIconContentView assetNoMarginSize](self, "assetNoMarginSize");
      v4 = v10;
      v6 = v11;
    }
  }
  -[HUCAPackageIconContentView frame](self, "frame");
  v13 = v12 / v4;
  -[HUCAPackageIconContentView frame](self, "frame");
  if (v13 >= v14 / v6)
    v15 = v14 / v6;
  else
    v15 = v13;
  -[HUCAPackageIconContentView center](self, "center");
  v17 = v16;
  v19 = v18;
  -[HUCAPackageIconContentView rootLayer](self, "rootLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPosition:", v17, v19);

  CATransform3DMakeScale(&v23, v15, v15, 1.0);
  -[HUCAPackageIconContentView rootLayer](self, "rootLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v23;
  objc_msgSend(v21, "setTransform:", &v22);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (CGSize)assetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_assetSize.width;
  height = self->_assetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)iconContentIntrinsicContentSize
{
  double v3;
  double v4;
  BOOL v5;
  double v6;
  double v7;
  CGSize result;

  if (!-[HUCAPackageIconContentView useAssetMarginSize](self, "useAssetMarginSize")
    || ((-[HUCAPackageIconContentView assetNoMarginSize](self, "assetNoMarginSize"), v4 == *MEMORY[0x24BDBF148])
      ? (v5 = v3 == *(double *)(MEMORY[0x24BDBF148] + 8))
      : (v5 = 0),
        v5))
  {
    -[HUCAPackageIconContentView assetSize](self, "assetSize");
  }
  else
  {
    -[HUCAPackageIconContentView assetNoMarginSize](self, "assetNoMarginSize");
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)useAssetMarginSize
{
  return self->_useAssetMarginSize;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUCAPackageIconContentView;
  -[HUCAPackageIconContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[HUCAPackageIconContentView layoutRootLayer](self, "layoutRootLayer");
}

+ (BOOL)_isAnimationEnabled
{
  return !UIAccessibilityIsReduceMotionEnabled();
}

- (void)setStateController:(id)a3
{
  objc_storeStrong((id *)&self->_stateController, a3);
}

- (void)setRootLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rootLayer, a3);
}

- (void)setRenouncedPackageDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_renouncedPackageDescriptor, a3);
}

- (void)setPackageLayers:(id)a3
{
  objc_storeStrong((id *)&self->_packageLayers, a3);
}

- (void)setPackage:(id)a3
{
  objc_storeStrong((id *)&self->_package, a3);
}

- (void)setAssetSize:(CGSize)a3
{
  self->_assetSize = a3;
}

- (void)setAssetNoMarginSize:(CGSize)a3
{
  self->_assetNoMarginSize = a3;
}

- (HUCAPackageIconContentView)initWithFrame:(CGRect)a3
{
  HUCAPackageIconContentView *v3;
  HUCAPackageIconContentView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUCAPackageIconContentView;
  v3 = -[HUIconContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUCAPackageIconContentView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    -[HUCAPackageIconContentView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

  }
  return v4;
}

- (void)_tryRenouncePackageForIconDescriptor:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[HUCAPackageIconContentView stateController](self, "stateController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUCAPackageIconContentView stateController](self, "stateController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "removeAllStateChanges");

    -[HUCAPackageIconContentView stateController](self, "stateController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelTimers");

    -[HUCAPackageIconContentView setStateController:](self, "setStateController:", 0);
  }
  -[HUCAPackageIconContentView package](self, "package");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18 || !v8)
    goto LABEL_7;
  -[HUCAPackageIconContentView renouncedPackageDescriptor](self, "renouncedPackageDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

LABEL_7:
    goto LABEL_8;
  }
  -[HUCAPackageIconContentView package](self, "package");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rootLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCAPackageIconContentView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v13)
  {
    -[HUCAPackageIconContentView package](self, "package");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rootLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeFromSuperlayer");

    +[HUCAPackageIconManager sharedInstance](HUCAPackageIconManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCAPackageIconContentView package](self, "package");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "returnPackageToCache:forIconDescriptor:", v17, v18);

    -[HUCAPackageIconContentView setRenouncedPackageDescriptor:](self, "setRenouncedPackageDescriptor:", v18);
  }
LABEL_8:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HUIconContentView iconDescriptor](self, "iconDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCAPackageIconContentView _tryRenouncePackageForIconDescriptor:](self, "_tryRenouncePackageForIconDescriptor:", v3);

  v4.receiver = self;
  v4.super_class = (Class)HUCAPackageIconContentView;
  -[HUCAPackageIconContentView dealloc](&v4, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;
  CGSize result;

  if (!-[HUCAPackageIconContentView useAssetMarginSize](self, "useAssetMarginSize", a3.width, a3.height)
    || ((-[HUCAPackageIconContentView assetNoMarginSize](self, "assetNoMarginSize"), v5 == *MEMORY[0x24BDBF148])
      ? (v6 = v4 == *(double *)(MEMORY[0x24BDBF148] + 8))
      : (v6 = 0),
        v6))
  {
    -[HUCAPackageIconContentView assetSize](self, "assetSize");
  }
  else
  {
    -[HUCAPackageIconContentView assetNoMarginSize](self, "assetNoMarginSize");
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setState:(id)a3
{
  -[HUCAPackageIconContentView setState:animated:](self, "setState:animated:", a3, 1);
}

- (void)reclaimIconIfPossible
{
  id v3;

  -[HUIconContentView iconDescriptor](self, "iconDescriptor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCAPackageIconContentView updateWithIconDescriptor:displayStyle:animated:](self, "updateWithIconDescriptor:displayStyle:animated:", v3, -[HUIconContentView displayStyle](self, "displayStyle"), 0);

}

- (void)renounceIconIfPossible
{
  id v3;

  -[HUIconContentView iconDescriptor](self, "iconDescriptor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCAPackageIconContentView _tryRenouncePackageForIconDescriptor:](self, "_tryRenouncePackageForIconDescriptor:", v3);

}

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  id v5;

  -[HUCAPackageIconContentView rootLayer](self, "rootLayer", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldRasterize:", 1);

}

- (CGSize)assetNoMarginSize
{
  double width;
  double height;
  CGSize result;

  width = self->_assetNoMarginSize.width;
  height = self->_assetNoMarginSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renouncedPackageDescriptor, 0);
  objc_storeStrong((id *)&self->_stateName, 0);
  objc_storeStrong((id *)&self->_packageLayers, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end
