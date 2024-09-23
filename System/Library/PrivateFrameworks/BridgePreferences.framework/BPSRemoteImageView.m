@implementation BPSRemoteImageView

- (void)updateImagesWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD v11[5];

  v3 = a3;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__BPSRemoteImageView_updateImagesWithAnimation___block_invoke;
  v11[3] = &unk_24CBE4838;
  v11[4] = self;
  v6 = (void (**)(_QWORD))MEMORY[0x212BDABD0](v11, a2);
  v7 = v6;
  if (v3)
  {
    v8 = (void *)MEMORY[0x24BDF6F90];
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __48__BPSRemoteImageView_updateImagesWithAnimation___block_invoke_2;
    v9[3] = &unk_24CBE4EA8;
    v10 = v6;
    objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", self, 5242880, v9, &__block_literal_global_2, 0.45);

  }
  else
  {
    v6[2](v6);
  }

}

void __48__BPSRemoteImageView_updateImagesWithAnimation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  id v11;
  id v12;
  CGSize v13;
  CGRect v14;

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = (void *)MEMORY[0x24BDF6AC8];
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:", v4, v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (PBIsInternalInstall()
      && CFPreferencesGetAppBooleanValue(CFSTR("DebugMobileAssetLoading"), CFSTR("com.apple.Bridge"), 0))
    {
      objc_msgSend(v11, "size");
      UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
      objc_msgSend(v11, "drawAtPoint:", 0.0, 0.0);
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 0.5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFill");

      objc_msgSend(v11, "size");
      v8 = v7;
      objc_msgSend(v11, "size");
      v14.size.height = v9;
      v14.origin.x = 0.0;
      v14.origin.y = 0.0;
      v14.size.width = v8;
      UIRectFillUsingBlendMode(v14, kCGBlendModePlusLighter);
      UIGraphicsGetImageFromCurrentImageContext();
      v10 = objc_claimAutoreleasedReturnValue();

      UIGraphicsEndImageContext();
      v2 = v10;
    }
    else
    {
      v2 = (uint64_t)v11;
    }
  }
  v12 = (id)v2;
  objc_msgSend(*(id *)(a1 + 32), "setImage:", v2);

}

- (void)setFallbackImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (void)setDesiredImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (BPSRemoteImageView)init
{
  BPSRemoteImageView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BPSRemoteImageView;
  v2 = -[BPSRemoteImageView init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_updateImagesWithAnimation, *MEMORY[0x24BE6E4C8], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BPSRemoteImageView;
  -[BPSRemoteImageView dealloc](&v4, sel_dealloc);
}

- (void)updateImagesWithAnimation
{
  -[BPSRemoteImageView updateImagesWithAnimation:](self, "updateImagesWithAnimation:", 1);
}

uint64_t __48__BPSRemoteImageView_updateImagesWithAnimation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)desiredImageName
{
  return self->_desiredImageName;
}

- (NSString)fallbackImageName
{
  return self->_fallbackImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackImageName, 0);
  objc_storeStrong((id *)&self->_desiredImageName, 0);
}

@end
