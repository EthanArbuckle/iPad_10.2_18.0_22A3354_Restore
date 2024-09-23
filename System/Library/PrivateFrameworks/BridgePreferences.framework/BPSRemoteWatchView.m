@implementation BPSRemoteWatchView

- (BPSRemoteWatchView)initWithFrame:(CGRect)a3
{
  BPSRemoteWatchView *v3;
  PBBridgeAssetsManager *v4;
  PBBridgeAssetsManager *assetManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BPSRemoteWatchView;
  v3 = -[BPSRemoteWatchView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (PBBridgeAssetsManager *)objc_alloc_init(MEMORY[0x24BE6E490]);
    assetManager = v3->_assetManager;
    v3->_assetManager = v4;

  }
  return v3;
}

- (void)setAdvertisingName:(id)a3
{
  -[BPSRemoteWatchView setAdvertisingName:andStyle:](self, "setAdvertisingName:andStyle:", a3, 5);
}

- (void)setAdvertisingName:(id)a3 andStyle:(unint64_t)a4
{
  NSString *v6;
  NSString *advertisingName;
  BPSWatchView *watch;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BPSWatchView *v15;
  BPSWatchView *v16;
  void *v17;
  UIImageView *v18;
  UIImageView *watchScreen;
  PBBridgeAssetsManager *assetManager;
  PBBridgeAssetsManager *v21;
  PBBridgeAssetsManager *v22;
  NSString *v23;
  _QWORD v24[5];

  v6 = (NSString *)objc_msgSend(a3, "copy");
  advertisingName = self->_advertisingName;
  self->_advertisingName = v6;

  watch = self->_watch;
  if (watch)
    -[BPSWatchView removeFromSuperview](watch, "removeFromSuperview");
  PBAdvertisingInfoFromPayload();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE6E4B8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE6E4C0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_size = objc_msgSend(v12, "integerValue");

  objc_msgSend(MEMORY[0x24BE6E4A0], "sharedDeviceController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMaterial:", v11);

  objc_msgSend(MEMORY[0x24BE6E4A0], "sharedDeviceController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInternalSize:", self->_size);

  self->_style = a4;
  v15 = -[BPSWatchView initWithStyle:]([BPSWatchView alloc], "initWithStyle:", self->_style);
  v16 = self->_watch;
  self->_watch = v15;

  -[BPSRemoteWatchView addSubview:](self, "addSubview:", self->_watch);
  -[BPSRemoteWatchView _imageForSize:](self, "_imageForSize:", self->_size);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v17);
  watchScreen = self->_watchScreen;
  self->_watchScreen = v18;

  -[BPSWatchView addSubview:](self->_watch, "addSubview:", self->_watchScreen);
  assetManager = self->_assetManager;
  if (!assetManager)
  {
    v21 = (PBBridgeAssetsManager *)objc_alloc_init(MEMORY[0x24BE6E490]);
    v22 = self->_assetManager;
    self->_assetManager = v21;

    assetManager = self->_assetManager;
  }
  v23 = self->_advertisingName;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __50__BPSRemoteWatchView_setAdvertisingName_andStyle___block_invoke;
  v24[3] = &unk_24CBE4B78;
  v24[4] = self;
  -[PBBridgeAssetsManager beginPullingAssetsForAdvertisingName:completion:](assetManager, "beginPullingAssetsForAdvertisingName:completion:", v23, v24);
  -[BPSRemoteWatchView layoutIfNeeded](self, "layoutIfNeeded");

}

void __50__BPSRemoteWatchView_setAdvertisingName_andStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Pulled Assets for %@? (%@)"), v2, v3);

}

- (id)_imageForSize:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  unint64_t size;
  void *v7;

  if (a3 == 19)
  {
    v3 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("Prox-foghorn-502h");
  }
  else
  {
    size = self->_size;
    if (size - 20 < 2)
    {
      v3 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("Prox-Reflections-496h");
    }
    else
    {
      v3 = (void *)MEMORY[0x24BDF6AC8];
      if (size - 1 > 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = CFSTR("Prox_Simple-Edition");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = CFSTR("Prox_Simple");
      }
    }
  }
  objc_msgSend(v3, "imageNamed:inBundle:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  CGFloat sx;
  CATransform3D v33;
  CATransform3D v34;
  CGRect v35;
  CGRect v36;

  -[BPSRemoteWatchView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v30 = *MEMORY[0x24BDBF148];
  v31 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[BPSWatchView sizeThatFits:](self->_watch, "sizeThatFits:");
  v12 = v11;
  v14 = v13;
  v15 = 0.79;
  if (self->_style != 2)
    v15 = 1.0;
  sx = v15;
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  v16 = floor((CGRectGetWidth(v35) - v12) * 0.5);
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  -[BPSWatchView setFrame:](self->_watch, "setFrame:", v16, floor((CGRectGetHeight(v36) - v14) * 0.5), v12, v14);
  -[BPSWatchView layer](self->_watch, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSWatchView layer](self->_watch, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    objc_msgSend(v18, "transform");
  else
    memset(&v33, 0, sizeof(v33));
  CATransform3DScale(&v34, &v33, sx, sx, sx);
  objc_msgSend(v17, "setTransform:", &v34);

  -[UIImageView image](self->_watchScreen, "image");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  v22 = v21;

  switch(self->_size)
  {
    case 7uLL:
      if (v22 <= 2.0)
      {
        v27 = 18.0;
        v26 = 76.0;
        v24 = 64.0;
        *(double *)&v29 = 48.0;
      }
      else
      {
        v26 = 90.0;
        v24 = 76.0;
        v27 = 21.5;
        *(double *)&v29 = 56.0;
      }
      goto LABEL_26;
    case 8uLL:
      if (v22 > 2.0)
      {
        v26 = 94.0;
        v24 = 76.0;
        v27 = 21.5;
        *(double *)&v29 = 54.0;
        goto LABEL_26;
      }
      v27 = 16.0;
      v26 = 81.0;
      v24 = 68.0;
      goto LABEL_28;
    case 0xDuLL:
    case 0xEuLL:
      if (v22 <= 2.0)
      {
        v27 = 16.0;
        v26 = 82.0;
        v24 = 69.0;
LABEL_28:
        v28 = 47.0;
      }
      else
      {
        v26 = 100.0;
        v24 = 82.0;
        v27 = 18.5;
        v28 = 51.0;
      }
LABEL_29:
      -[UIImageView setFrame:](self->_watchScreen, "setFrame:", v27, v28, v24, v26);
      return;
    case 0x13uLL:
      if (v22 <= 2.0)
        goto LABEL_21;
      v27 = 19.0;
      v26 = 100.0;
      v24 = 81.0;
      goto LABEL_20;
    case 0x14uLL:
    case 0x15uLL:
      if (v22 <= 2.0)
      {
LABEL_21:
        v27 = 14.0;
        v26 = 88.0;
        v24 = 70.5;
        *(double *)&v29 = 44.0;
LABEL_26:
        v28 = *(double *)&v29;
      }
      else
      {
        v26 = 100.0;
        v24 = 81.0;
        v27 = 17.5;
LABEL_20:
        v28 = 50.5;
      }
      goto LABEL_29;
    default:
      -[UIImageView sizeThatFits:](self->_watchScreen, "sizeThatFits:", v30, v31);
      v24 = v23;
      v26 = v25;
      v27 = 24.5;
      if (v22 <= 2.0)
        v27 = 21.0;
      v28 = 50.0;
      if (v22 > 2.0)
        v28 = 59.0;
      goto LABEL_29;
  }
}

- (NSString)advertisingName
{
  return self->_advertisingName;
}

- (PBBridgeAssetsManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (BPSWatchView)watch
{
  return self->_watch;
}

- (void)setWatch:(id)a3
{
  objc_storeStrong((id *)&self->_watch, a3);
}

- (UIImageView)watchScreen
{
  return self->_watchScreen;
}

- (void)setWatchScreen:(id)a3
{
  objc_storeStrong((id *)&self->_watchScreen, a3);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchScreen, 0);
  objc_storeStrong((id *)&self->_watch, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_advertisingName, 0);
}

@end
