@implementation BPSRemoveMigrationWatchView

- (BPSRemoveMigrationWatchView)initWithFrame:(CGRect)a3
{
  BPSRemoveMigrationWatchView *v3;
  PBBridgeAssetsManager *v4;
  PBBridgeAssetsManager *assetManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BPSRemoveMigrationWatchView;
  v3 = -[BPSRemoveMigrationWatchView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
  NSString *v4;
  NSString *advertisingName;
  BPSWatchView *watch;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BPSWatchView *v14;
  BPSWatchView *v15;
  PBBridgeAssetsManager *assetManager;
  NSString *v17;
  _QWORD v18[5];

  v4 = (NSString *)objc_msgSend(a3, "copy");
  advertisingName = self->_advertisingName;
  self->_advertisingName = v4;

  watch = self->_watch;
  if (watch)
    -[BPSWatchView removeFromSuperview](watch, "removeFromSuperview");
  PBAdvertisingInfoFromPayload();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE6E4B8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE6E4C0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(MEMORY[0x24BE6E4A0], "sharedDeviceController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMaterial:", v9);

  objc_msgSend(MEMORY[0x24BE6E4A0], "sharedDeviceController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInternalSize:", v11);

  v14 = -[BPSWatchView initWithStyle:]([BPSWatchView alloc], "initWithStyle:", 6);
  v15 = self->_watch;
  self->_watch = v14;

  -[BPSRemoveMigrationWatchView addSubview:](self, "addSubview:", self->_watch);
  assetManager = self->_assetManager;
  v17 = self->_advertisingName;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __50__BPSRemoveMigrationWatchView_setAdvertisingName___block_invoke;
  v18[3] = &unk_24CBE4B78;
  v18[4] = self;
  -[PBBridgeAssetsManager beginPullingAssetsForAdvertisingName:completion:](assetManager, "beginPullingAssetsForAdvertisingName:completion:", v17, v18);

}

void __50__BPSRemoveMigrationWatchView_setAdvertisingName___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Pulled Assets for %@? (%@)"), v2, v3);

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
  float v15;
  double v16;
  float v17;
  CGRect v18;
  CGRect v19;

  -[BPSRemoveMigrationWatchView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BPSWatchView sizeThatFits:](self->_watch, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v12 = v11;
  v14 = v13;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v15 = (CGRectGetWidth(v18) - v12) * 0.5;
  v16 = floorf(v15);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  v17 = (CGRectGetHeight(v19) - v14) * 0.5;
  -[BPSWatchView setFrame:](self->_watch, "setFrame:", v16, floorf(v17), v12, v14);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[BPSWatchView sizeThatFits:](self->_watch, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watch, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_advertisingName, 0);
}

@end
