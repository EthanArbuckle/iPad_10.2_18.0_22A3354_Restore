@implementation MTPillView

- (MTPillView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  MTPillView *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  BSDispatchQueueAssertMain();
  v19.receiver = self;
  v19.super_class = (Class)MTPillView;
  v10 = -[MTPillView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "cornerMask");
    v13 = CFSTR("lumaDodgePillCorners-thin");
    if (v12 != 1)
      v13 = 0;
    if (v12)
      v14 = v13;
    else
      v14 = CFSTR("lumaDodgePillCorners");
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPillView layer](v10, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_retainAutorelease(v15);
    objc_msgSend(v16, "setCornerContents:", objc_msgSend(v17, "CGImage"));
    objc_msgSend(v16, "setCornerContentsCenter:", 0.5, 0.5, 0.0, 0.0);
    objc_msgSend(v9, "cornerRadius");
    objc_msgSend(v16, "setCornerRadius:");
    objc_msgSend(v16, "setMasksToBounds:", 1);

  }
  return v10;
}

- (MTPillView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  MTPillView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[MTLumaDodgePillDomain rootSettings](MTLumaDodgePillDomain, "rootSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MTPillView initWithFrame:settings:](self, "initWithFrame:settings:", v8, x, y, width, height);

  return v9;
}

- (MTPillView)init
{
  void *v3;
  double v4;
  double v5;
  double v6;
  MTPillView *v7;

  +[MTLumaDodgePillDomain rootSettings](MTLumaDodgePillDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minWidth");
  v5 = v4;
  objc_msgSend(v3, "height");
  v7 = -[MTPillView initWithFrame:settings:](self, "initWithFrame:settings:", v3, 0.0, 0.0, v5, v6);

  return v7;
}

@end
